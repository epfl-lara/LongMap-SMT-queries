; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93938 () Bool)

(assert start!93938)

(declare-fun b_free!21397 () Bool)

(declare-fun b_next!21397 () Bool)

(assert (=> start!93938 (= b_free!21397 (not b_next!21397))))

(declare-fun tp!75616 () Bool)

(declare-fun b_and!34119 () Bool)

(assert (=> start!93938 (= tp!75616 b_and!34119)))

(declare-fun b!1062436 () Bool)

(declare-fun e!605190 () Bool)

(assert (=> b!1062436 (= e!605190 true)))

(declare-datatypes ((V!38745 0))(
  ( (V!38746 (val!12654 Int)) )
))
(declare-datatypes ((tuple2!16008 0))(
  ( (tuple2!16009 (_1!8015 (_ BitVec 64)) (_2!8015 V!38745)) )
))
(declare-datatypes ((List!22591 0))(
  ( (Nil!22588) (Cons!22587 (h!23796 tuple2!16008) (t!31902 List!22591)) )
))
(declare-datatypes ((ListLongMap!13977 0))(
  ( (ListLongMap!13978 (toList!7004 List!22591)) )
))
(declare-fun lt!468098 () ListLongMap!13977)

(declare-fun -!568 (ListLongMap!13977 (_ BitVec 64)) ListLongMap!13977)

(assert (=> b!1062436 (= (-!568 lt!468098 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468098)))

(declare-datatypes ((Unit!34806 0))(
  ( (Unit!34807) )
))
(declare-fun lt!468100 () Unit!34806)

(declare-fun removeNotPresentStillSame!15 (ListLongMap!13977 (_ BitVec 64)) Unit!34806)

(assert (=> b!1062436 (= lt!468100 (removeNotPresentStillSame!15 lt!468098 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062437 () Bool)

(declare-fun e!605185 () Bool)

(assert (=> b!1062437 (= e!605185 e!605190)))

(declare-fun res!709426 () Bool)

(assert (=> b!1062437 (=> res!709426 e!605190)))

(declare-fun contains!6236 (ListLongMap!13977 (_ BitVec 64)) Bool)

(assert (=> b!1062437 (= res!709426 (contains!6236 lt!468098 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38745)

(declare-datatypes ((ValueCell!11900 0))(
  ( (ValueCellFull!11900 (v!15264 V!38745)) (EmptyCell!11900) )
))
(declare-datatypes ((array!67417 0))(
  ( (array!67418 (arr!32415 (Array (_ BitVec 32) ValueCell!11900)) (size!32951 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67417)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38745)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67419 0))(
  ( (array!67420 (arr!32416 (Array (_ BitVec 32) (_ BitVec 64))) (size!32952 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67419)

(declare-fun getCurrentListMap!3989 (array!67419 array!67417 (_ BitVec 32) (_ BitVec 32) V!38745 V!38745 (_ BitVec 32) Int) ListLongMap!13977)

(assert (=> b!1062437 (= lt!468098 (getCurrentListMap!3989 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062438 () Bool)

(declare-fun res!709429 () Bool)

(declare-fun e!605186 () Bool)

(assert (=> b!1062438 (=> (not res!709429) (not e!605186))))

(declare-datatypes ((List!22592 0))(
  ( (Nil!22589) (Cons!22588 (h!23797 (_ BitVec 64)) (t!31903 List!22592)) )
))
(declare-fun arrayNoDuplicates!0 (array!67419 (_ BitVec 32) List!22592) Bool)

(assert (=> b!1062438 (= res!709429 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22589))))

(declare-fun b!1062439 () Bool)

(declare-fun e!605189 () Bool)

(declare-fun e!605187 () Bool)

(declare-fun mapRes!39484 () Bool)

(assert (=> b!1062439 (= e!605189 (and e!605187 mapRes!39484))))

(declare-fun condMapEmpty!39484 () Bool)

(declare-fun mapDefault!39484 () ValueCell!11900)

