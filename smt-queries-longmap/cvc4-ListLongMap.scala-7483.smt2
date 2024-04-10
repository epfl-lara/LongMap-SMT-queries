; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94850 () Bool)

(assert start!94850)

(declare-fun b_free!22079 () Bool)

(declare-fun b_next!22079 () Bool)

(assert (=> start!94850 (= b_free!22079 (not b_next!22079))))

(declare-fun tp!77698 () Bool)

(declare-fun b_and!34921 () Bool)

(assert (=> start!94850 (= tp!77698 b_and!34921)))

(declare-fun b!1072563 () Bool)

(declare-fun res!715453 () Bool)

(declare-fun e!612646 () Bool)

(assert (=> b!1072563 (=> (not res!715453) (not e!612646))))

(declare-datatypes ((array!68745 0))(
  ( (array!68746 (arr!33067 (Array (_ BitVec 32) (_ BitVec 64))) (size!33603 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68745)

(declare-datatypes ((List!23086 0))(
  ( (Nil!23083) (Cons!23082 (h!24291 (_ BitVec 64)) (t!32421 List!23086)) )
))
(declare-fun arrayNoDuplicates!0 (array!68745 (_ BitVec 32) List!23086) Bool)

(assert (=> b!1072563 (= res!715453 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23083))))

(declare-fun res!715451 () Bool)

(assert (=> start!94850 (=> (not res!715451) (not e!612646))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94850 (= res!715451 (validMask!0 mask!1515))))

(assert (=> start!94850 e!612646))

(assert (=> start!94850 true))

(declare-fun tp_is_empty!25889 () Bool)

(assert (=> start!94850 tp_is_empty!25889))

(declare-datatypes ((V!39653 0))(
  ( (V!39654 (val!12995 Int)) )
))
(declare-datatypes ((ValueCell!12241 0))(
  ( (ValueCellFull!12241 (v!15612 V!39653)) (EmptyCell!12241) )
))
(declare-datatypes ((array!68747 0))(
  ( (array!68748 (arr!33068 (Array (_ BitVec 32) ValueCell!12241)) (size!33604 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68747)

(declare-fun e!612644 () Bool)

(declare-fun array_inv!25562 (array!68747) Bool)

(assert (=> start!94850 (and (array_inv!25562 _values!955) e!612644)))

(assert (=> start!94850 tp!77698))

(declare-fun array_inv!25563 (array!68745) Bool)

(assert (=> start!94850 (array_inv!25563 _keys!1163)))

(declare-fun b!1072564 () Bool)

(declare-fun e!612642 () Bool)

(assert (=> b!1072564 (= e!612646 (not e!612642))))

(declare-fun res!715456 () Bool)

(assert (=> b!1072564 (=> res!715456 e!612642)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072564 (= res!715456 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16552 0))(
  ( (tuple2!16553 (_1!8287 (_ BitVec 64)) (_2!8287 V!39653)) )
))
(declare-datatypes ((List!23087 0))(
  ( (Nil!23084) (Cons!23083 (h!24292 tuple2!16552) (t!32422 List!23087)) )
))
(declare-datatypes ((ListLongMap!14521 0))(
  ( (ListLongMap!14522 (toList!7276 List!23087)) )
))
(declare-fun lt!475582 () ListLongMap!14521)

(declare-fun lt!475587 () ListLongMap!14521)

(assert (=> b!1072564 (= lt!475582 lt!475587)))

(declare-fun zeroValueBefore!47 () V!39653)

(declare-datatypes ((Unit!35346 0))(
  ( (Unit!35347) )
))
(declare-fun lt!475584 () Unit!35346)

(declare-fun minValue!907 () V!39653)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39653)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!877 (array!68745 array!68747 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39653 V!39653 V!39653 V!39653 (_ BitVec 32) Int) Unit!35346)

(assert (=> b!1072564 (= lt!475584 (lemmaNoChangeToArrayThenSameMapNoExtras!877 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3840 (array!68745 array!68747 (_ BitVec 32) (_ BitVec 32) V!39653 V!39653 (_ BitVec 32) Int) ListLongMap!14521)

(assert (=> b!1072564 (= lt!475587 (getCurrentListMapNoExtraKeys!3840 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072564 (= lt!475582 (getCurrentListMapNoExtraKeys!3840 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072565 () Bool)

(declare-fun res!715452 () Bool)

(assert (=> b!1072565 (=> (not res!715452) (not e!612646))))

(assert (=> b!1072565 (= res!715452 (and (= (size!33604 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33603 _keys!1163) (size!33604 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!612645 () Bool)

(declare-fun lt!475583 () tuple2!16552)

(declare-fun b!1072566 () Bool)

(declare-fun lt!475589 () ListLongMap!14521)

(declare-fun +!3210 (ListLongMap!14521 tuple2!16552) ListLongMap!14521)

(assert (=> b!1072566 (= e!612645 (= lt!475589 (+!3210 lt!475587 lt!475583)))))

(declare-fun b!1072567 () Bool)

(declare-fun e!612647 () Bool)

(assert (=> b!1072567 (= e!612647 tp_is_empty!25889)))

(declare-fun mapNonEmpty!40543 () Bool)

(declare-fun mapRes!40543 () Bool)

(declare-fun tp!77699 () Bool)

(assert (=> mapNonEmpty!40543 (= mapRes!40543 (and tp!77699 e!612647))))

(declare-fun mapRest!40543 () (Array (_ BitVec 32) ValueCell!12241))

(declare-fun mapValue!40543 () ValueCell!12241)

(declare-fun mapKey!40543 () (_ BitVec 32))

(assert (=> mapNonEmpty!40543 (= (arr!33068 _values!955) (store mapRest!40543 mapKey!40543 mapValue!40543))))

(declare-fun b!1072568 () Bool)

(declare-fun e!612641 () Bool)

(assert (=> b!1072568 (= e!612641 tp_is_empty!25889)))

(declare-fun b!1072569 () Bool)

(assert (=> b!1072569 (= e!612642 true)))

(declare-fun lt!475588 () ListLongMap!14521)

(declare-fun lt!475581 () ListLongMap!14521)

(declare-fun -!704 (ListLongMap!14521 (_ BitVec 64)) ListLongMap!14521)

(assert (=> b!1072569 (= lt!475588 (-!704 lt!475581 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!475590 () ListLongMap!14521)

(declare-fun lt!475586 () ListLongMap!14521)

(assert (=> b!1072569 (= lt!475590 lt!475586)))

(declare-fun lt!475585 () Unit!35346)

(declare-fun addCommutativeForDiffKeys!749 (ListLongMap!14521 (_ BitVec 64) V!39653 (_ BitVec 64) V!39653) Unit!35346)

(assert (=> b!1072569 (= lt!475585 (addCommutativeForDiffKeys!749 lt!475582 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!475593 () ListLongMap!14521)

(assert (=> b!1072569 (= (-!704 lt!475586 #b0000000000000000000000000000000000000000000000000000000000000000) lt!475593)))

(declare-fun lt!475591 () tuple2!16552)

(assert (=> b!1072569 (= lt!475586 (+!3210 lt!475593 lt!475591))))

(declare-fun lt!475592 () Unit!35346)

(declare-fun addThenRemoveForNewKeyIsSame!74 (ListLongMap!14521 (_ BitVec 64) V!39653) Unit!35346)

(assert (=> b!1072569 (= lt!475592 (addThenRemoveForNewKeyIsSame!74 lt!475593 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1072569 (= lt!475593 (+!3210 lt!475582 lt!475583))))

(assert (=> b!1072569 e!612645))

(declare-fun res!715454 () Bool)

(assert (=> b!1072569 (=> (not res!715454) (not e!612645))))

(assert (=> b!1072569 (= res!715454 (= lt!475581 lt!475590))))

(assert (=> b!1072569 (= lt!475590 (+!3210 (+!3210 lt!475582 lt!475591) lt!475583))))

(assert (=> b!1072569 (= lt!475583 (tuple2!16553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072569 (= lt!475591 (tuple2!16553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun getCurrentListMap!4170 (array!68745 array!68747 (_ BitVec 32) (_ BitVec 32) V!39653 V!39653 (_ BitVec 32) Int) ListLongMap!14521)

(assert (=> b!1072569 (= lt!475589 (getCurrentListMap!4170 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072569 (= lt!475581 (getCurrentListMap!4170 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40543 () Bool)

(assert (=> mapIsEmpty!40543 mapRes!40543))

(declare-fun b!1072570 () Bool)

(assert (=> b!1072570 (= e!612644 (and e!612641 mapRes!40543))))

(declare-fun condMapEmpty!40543 () Bool)

(declare-fun mapDefault!40543 () ValueCell!12241)

