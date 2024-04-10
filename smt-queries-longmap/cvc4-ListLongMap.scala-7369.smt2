; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93936 () Bool)

(assert start!93936)

(declare-fun b_free!21395 () Bool)

(declare-fun b_next!21395 () Bool)

(assert (=> start!93936 (= b_free!21395 (not b_next!21395))))

(declare-fun tp!75610 () Bool)

(declare-fun b_and!34117 () Bool)

(assert (=> start!93936 (= tp!75610 b_and!34117)))

(declare-fun b!1062409 () Bool)

(declare-fun e!605167 () Bool)

(declare-fun tp_is_empty!25205 () Bool)

(assert (=> b!1062409 (= e!605167 tp_is_empty!25205)))

(declare-fun res!709410 () Bool)

(declare-fun e!605169 () Bool)

(assert (=> start!93936 (=> (not res!709410) (not e!605169))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93936 (= res!709410 (validMask!0 mask!1515))))

(assert (=> start!93936 e!605169))

(assert (=> start!93936 true))

(assert (=> start!93936 tp_is_empty!25205))

(declare-datatypes ((V!38741 0))(
  ( (V!38742 (val!12653 Int)) )
))
(declare-datatypes ((ValueCell!11899 0))(
  ( (ValueCellFull!11899 (v!15263 V!38741)) (EmptyCell!11899) )
))
(declare-datatypes ((array!67413 0))(
  ( (array!67414 (arr!32413 (Array (_ BitVec 32) ValueCell!11899)) (size!32949 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67413)

(declare-fun e!605165 () Bool)

(declare-fun array_inv!25110 (array!67413) Bool)

(assert (=> start!93936 (and (array_inv!25110 _values!955) e!605165)))

(assert (=> start!93936 tp!75610))

(declare-datatypes ((array!67415 0))(
  ( (array!67416 (arr!32414 (Array (_ BitVec 32) (_ BitVec 64))) (size!32950 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67415)

(declare-fun array_inv!25111 (array!67415) Bool)

(assert (=> start!93936 (array_inv!25111 _keys!1163)))

(declare-fun b!1062410 () Bool)

(declare-fun e!605170 () Bool)

(assert (=> b!1062410 (= e!605170 tp_is_empty!25205)))

(declare-fun mapIsEmpty!39481 () Bool)

(declare-fun mapRes!39481 () Bool)

(assert (=> mapIsEmpty!39481 mapRes!39481))

(declare-fun b!1062411 () Bool)

(declare-fun res!709408 () Bool)

(assert (=> b!1062411 (=> (not res!709408) (not e!605169))))

(declare-datatypes ((List!22589 0))(
  ( (Nil!22586) (Cons!22585 (h!23794 (_ BitVec 64)) (t!31900 List!22589)) )
))
(declare-fun arrayNoDuplicates!0 (array!67415 (_ BitVec 32) List!22589) Bool)

(assert (=> b!1062411 (= res!709408 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22586))))

(declare-fun b!1062412 () Bool)

(declare-fun res!709411 () Bool)

(assert (=> b!1062412 (=> (not res!709411) (not e!605169))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1062412 (= res!709411 (and (= (size!32949 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32950 _keys!1163) (size!32949 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062413 () Bool)

(declare-fun e!605164 () Bool)

(assert (=> b!1062413 (= e!605164 true)))

(declare-datatypes ((tuple2!16006 0))(
  ( (tuple2!16007 (_1!8014 (_ BitVec 64)) (_2!8014 V!38741)) )
))
(declare-datatypes ((List!22590 0))(
  ( (Nil!22587) (Cons!22586 (h!23795 tuple2!16006) (t!31901 List!22590)) )
))
(declare-datatypes ((ListLongMap!13975 0))(
  ( (ListLongMap!13976 (toList!7003 List!22590)) )
))
(declare-fun lt!468082 () ListLongMap!13975)

(declare-fun -!567 (ListLongMap!13975 (_ BitVec 64)) ListLongMap!13975)

(assert (=> b!1062413 (= (-!567 lt!468082 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468082)))

(declare-datatypes ((Unit!34804 0))(
  ( (Unit!34805) )
))
(declare-fun lt!468086 () Unit!34804)

(declare-fun removeNotPresentStillSame!14 (ListLongMap!13975 (_ BitVec 64)) Unit!34804)

(assert (=> b!1062413 (= lt!468086 (removeNotPresentStillSame!14 lt!468082 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062414 () Bool)

(declare-fun e!605168 () Bool)

(assert (=> b!1062414 (= e!605168 e!605164)))

(declare-fun res!709412 () Bool)

(assert (=> b!1062414 (=> res!709412 e!605164)))

(declare-fun contains!6235 (ListLongMap!13975 (_ BitVec 64)) Bool)

(assert (=> b!1062414 (= res!709412 (contains!6235 lt!468082 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!38741)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38741)

(declare-fun getCurrentListMap!3988 (array!67415 array!67413 (_ BitVec 32) (_ BitVec 32) V!38741 V!38741 (_ BitVec 32) Int) ListLongMap!13975)

(assert (=> b!1062414 (= lt!468082 (getCurrentListMap!3988 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062415 () Bool)

(assert (=> b!1062415 (= e!605165 (and e!605167 mapRes!39481))))

(declare-fun condMapEmpty!39481 () Bool)

(declare-fun mapDefault!39481 () ValueCell!11899)

