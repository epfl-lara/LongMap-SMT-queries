; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93918 () Bool)

(assert start!93918)

(declare-fun b_free!21377 () Bool)

(declare-fun b_next!21377 () Bool)

(assert (=> start!93918 (= b_free!21377 (not b_next!21377))))

(declare-fun tp!75556 () Bool)

(declare-fun b_and!34099 () Bool)

(assert (=> start!93918 (= tp!75556 b_and!34099)))

(declare-fun b!1062166 () Bool)

(declare-fun e!604979 () Bool)

(declare-fun e!604978 () Bool)

(assert (=> b!1062166 (= e!604979 e!604978)))

(declare-fun res!709245 () Bool)

(assert (=> b!1062166 (=> res!709245 e!604978)))

(declare-datatypes ((V!38717 0))(
  ( (V!38718 (val!12644 Int)) )
))
(declare-datatypes ((tuple2!15990 0))(
  ( (tuple2!15991 (_1!8006 (_ BitVec 64)) (_2!8006 V!38717)) )
))
(declare-datatypes ((List!22573 0))(
  ( (Nil!22570) (Cons!22569 (h!23778 tuple2!15990) (t!31884 List!22573)) )
))
(declare-datatypes ((ListLongMap!13959 0))(
  ( (ListLongMap!13960 (toList!6995 List!22573)) )
))
(declare-fun lt!467951 () ListLongMap!13959)

(declare-fun contains!6228 (ListLongMap!13959 (_ BitVec 64)) Bool)

(assert (=> b!1062166 (= res!709245 (contains!6228 lt!467951 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38717)

(declare-datatypes ((ValueCell!11890 0))(
  ( (ValueCellFull!11890 (v!15254 V!38717)) (EmptyCell!11890) )
))
(declare-datatypes ((array!67379 0))(
  ( (array!67380 (arr!32396 (Array (_ BitVec 32) ValueCell!11890)) (size!32932 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67379)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38717)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67381 0))(
  ( (array!67382 (arr!32397 (Array (_ BitVec 32) (_ BitVec 64))) (size!32933 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67381)

(declare-fun getCurrentListMap!3981 (array!67381 array!67379 (_ BitVec 32) (_ BitVec 32) V!38717 V!38717 (_ BitVec 32) Int) ListLongMap!13959)

(assert (=> b!1062166 (= lt!467951 (getCurrentListMap!3981 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062167 () Bool)

(declare-fun res!709247 () Bool)

(declare-fun e!604975 () Bool)

(assert (=> b!1062167 (=> (not res!709247) (not e!604975))))

(declare-datatypes ((List!22574 0))(
  ( (Nil!22571) (Cons!22570 (h!23779 (_ BitVec 64)) (t!31885 List!22574)) )
))
(declare-fun arrayNoDuplicates!0 (array!67381 (_ BitVec 32) List!22574) Bool)

(assert (=> b!1062167 (= res!709247 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22571))))

(declare-fun b!1062168 () Bool)

(declare-fun e!604980 () Bool)

(declare-fun e!604976 () Bool)

(declare-fun mapRes!39454 () Bool)

(assert (=> b!1062168 (= e!604980 (and e!604976 mapRes!39454))))

(declare-fun condMapEmpty!39454 () Bool)

(declare-fun mapDefault!39454 () ValueCell!11890)

