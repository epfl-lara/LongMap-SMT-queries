; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93948 () Bool)

(assert start!93948)

(declare-fun b_free!21407 () Bool)

(declare-fun b_next!21407 () Bool)

(assert (=> start!93948 (= b_free!21407 (not b_next!21407))))

(declare-fun tp!75647 () Bool)

(declare-fun b_and!34129 () Bool)

(assert (=> start!93948 (= tp!75647 b_and!34129)))

(declare-fun b!1062571 () Bool)

(declare-fun res!709520 () Bool)

(declare-fun e!605292 () Bool)

(assert (=> b!1062571 (=> (not res!709520) (not e!605292))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38757 0))(
  ( (V!38758 (val!12659 Int)) )
))
(declare-datatypes ((ValueCell!11905 0))(
  ( (ValueCellFull!11905 (v!15269 V!38757)) (EmptyCell!11905) )
))
(declare-datatypes ((array!67437 0))(
  ( (array!67438 (arr!32425 (Array (_ BitVec 32) ValueCell!11905)) (size!32961 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67437)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67439 0))(
  ( (array!67440 (arr!32426 (Array (_ BitVec 32) (_ BitVec 64))) (size!32962 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67439)

(assert (=> b!1062571 (= res!709520 (and (= (size!32961 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32962 _keys!1163) (size!32961 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062572 () Bool)

(declare-fun e!605294 () Bool)

(declare-fun e!605296 () Bool)

(assert (=> b!1062572 (= e!605294 e!605296)))

(declare-fun res!709517 () Bool)

(assert (=> b!1062572 (=> res!709517 e!605296)))

(declare-datatypes ((tuple2!16018 0))(
  ( (tuple2!16019 (_1!8020 (_ BitVec 64)) (_2!8020 V!38757)) )
))
(declare-datatypes ((List!22599 0))(
  ( (Nil!22596) (Cons!22595 (h!23804 tuple2!16018) (t!31910 List!22599)) )
))
(declare-datatypes ((ListLongMap!13987 0))(
  ( (ListLongMap!13988 (toList!7009 List!22599)) )
))
(declare-fun lt!468172 () ListLongMap!13987)

(declare-fun contains!6240 (ListLongMap!13987 (_ BitVec 64)) Bool)

(assert (=> b!1062572 (= res!709517 (contains!6240 lt!468172 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!38757)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38757)

(declare-fun getCurrentListMap!3993 (array!67439 array!67437 (_ BitVec 32) (_ BitVec 32) V!38757 V!38757 (_ BitVec 32) Int) ListLongMap!13987)

(assert (=> b!1062572 (= lt!468172 (getCurrentListMap!3993 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062573 () Bool)

(assert (=> b!1062573 (= e!605296 true)))

(declare-fun -!573 (ListLongMap!13987 (_ BitVec 64)) ListLongMap!13987)

(assert (=> b!1062573 (= (-!573 lt!468172 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468172)))

(declare-datatypes ((Unit!34816 0))(
  ( (Unit!34817) )
))
(declare-fun lt!468176 () Unit!34816)

(declare-fun removeNotPresentStillSame!20 (ListLongMap!13987 (_ BitVec 64)) Unit!34816)

(assert (=> b!1062573 (= lt!468176 (removeNotPresentStillSame!20 lt!468172 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062574 () Bool)

(declare-fun res!709519 () Bool)

(assert (=> b!1062574 (=> (not res!709519) (not e!605292))))

(declare-datatypes ((List!22600 0))(
  ( (Nil!22597) (Cons!22596 (h!23805 (_ BitVec 64)) (t!31911 List!22600)) )
))
(declare-fun arrayNoDuplicates!0 (array!67439 (_ BitVec 32) List!22600) Bool)

(assert (=> b!1062574 (= res!709519 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22597))))

(declare-fun b!1062575 () Bool)

(declare-fun e!605290 () Bool)

(declare-fun e!605295 () Bool)

(declare-fun mapRes!39499 () Bool)

(assert (=> b!1062575 (= e!605290 (and e!605295 mapRes!39499))))

(declare-fun condMapEmpty!39499 () Bool)

(declare-fun mapDefault!39499 () ValueCell!11905)

