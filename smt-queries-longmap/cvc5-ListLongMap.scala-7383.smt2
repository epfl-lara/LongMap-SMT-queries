; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94060 () Bool)

(assert start!94060)

(declare-fun b_free!21475 () Bool)

(declare-fun b_next!21475 () Bool)

(assert (=> start!94060 (= b_free!21475 (not b_next!21475))))

(declare-fun tp!75857 () Bool)

(declare-fun b_and!34217 () Bool)

(assert (=> start!94060 (= tp!75857 b_and!34217)))

(declare-fun b!1063781 () Bool)

(declare-fun e!606184 () Bool)

(assert (=> b!1063781 (= e!606184 (not true))))

(declare-datatypes ((V!38849 0))(
  ( (V!38850 (val!12693 Int)) )
))
(declare-datatypes ((tuple2!16070 0))(
  ( (tuple2!16071 (_1!8046 (_ BitVec 64)) (_2!8046 V!38849)) )
))
(declare-datatypes ((List!22648 0))(
  ( (Nil!22645) (Cons!22644 (h!23853 tuple2!16070) (t!31963 List!22648)) )
))
(declare-datatypes ((ListLongMap!14039 0))(
  ( (ListLongMap!14040 (toList!7035 List!22648)) )
))
(declare-fun lt!468909 () ListLongMap!14039)

(declare-fun lt!468908 () ListLongMap!14039)

(assert (=> b!1063781 (= lt!468909 lt!468908)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38849)

(declare-datatypes ((Unit!34870 0))(
  ( (Unit!34871) )
))
(declare-fun lt!468910 () Unit!34870)

(declare-datatypes ((ValueCell!11939 0))(
  ( (ValueCellFull!11939 (v!15305 V!38849)) (EmptyCell!11939) )
))
(declare-datatypes ((array!67569 0))(
  ( (array!67570 (arr!32489 (Array (_ BitVec 32) ValueCell!11939)) (size!33025 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67569)

(declare-fun minValue!907 () V!38849)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38849)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67571 0))(
  ( (array!67572 (arr!32490 (Array (_ BitVec 32) (_ BitVec 64))) (size!33026 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67571)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!664 (array!67571 array!67569 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38849 V!38849 V!38849 V!38849 (_ BitVec 32) Int) Unit!34870)

(assert (=> b!1063781 (= lt!468910 (lemmaNoChangeToArrayThenSameMapNoExtras!664 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3627 (array!67571 array!67569 (_ BitVec 32) (_ BitVec 32) V!38849 V!38849 (_ BitVec 32) Int) ListLongMap!14039)

(assert (=> b!1063781 (= lt!468908 (getCurrentListMapNoExtraKeys!3627 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063781 (= lt!468909 (getCurrentListMapNoExtraKeys!3627 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!710228 () Bool)

(assert (=> start!94060 (=> (not res!710228) (not e!606184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94060 (= res!710228 (validMask!0 mask!1515))))

(assert (=> start!94060 e!606184))

(assert (=> start!94060 true))

(declare-fun tp_is_empty!25285 () Bool)

(assert (=> start!94060 tp_is_empty!25285))

(declare-fun e!606183 () Bool)

(declare-fun array_inv!25164 (array!67569) Bool)

(assert (=> start!94060 (and (array_inv!25164 _values!955) e!606183)))

(assert (=> start!94060 tp!75857))

(declare-fun array_inv!25165 (array!67571) Bool)

(assert (=> start!94060 (array_inv!25165 _keys!1163)))

(declare-fun b!1063782 () Bool)

(declare-fun e!606185 () Bool)

(declare-fun mapRes!39607 () Bool)

(assert (=> b!1063782 (= e!606183 (and e!606185 mapRes!39607))))

(declare-fun condMapEmpty!39607 () Bool)

(declare-fun mapDefault!39607 () ValueCell!11939)

