; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94198 () Bool)

(assert start!94198)

(declare-fun b_free!21583 () Bool)

(declare-fun b_next!21583 () Bool)

(assert (=> start!94198 (= b_free!21583 (not b_next!21583))))

(declare-fun tp!76186 () Bool)

(declare-fun b_and!34343 () Bool)

(assert (=> start!94198 (= tp!76186 b_and!34343)))

(declare-fun b!1065249 () Bool)

(declare-fun res!711067 () Bool)

(declare-fun e!607246 () Bool)

(assert (=> b!1065249 (=> (not res!711067) (not e!607246))))

(declare-datatypes ((array!67773 0))(
  ( (array!67774 (arr!32589 (Array (_ BitVec 32) (_ BitVec 64))) (size!33125 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67773)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67773 (_ BitVec 32)) Bool)

(assert (=> b!1065249 (= res!711067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1065250 () Bool)

(declare-fun e!607243 () Bool)

(assert (=> b!1065250 (= e!607243 true)))

(declare-datatypes ((V!38993 0))(
  ( (V!38994 (val!12747 Int)) )
))
(declare-datatypes ((tuple2!16154 0))(
  ( (tuple2!16155 (_1!8088 (_ BitVec 64)) (_2!8088 V!38993)) )
))
(declare-datatypes ((List!22722 0))(
  ( (Nil!22719) (Cons!22718 (h!23927 tuple2!16154) (t!32041 List!22722)) )
))
(declare-datatypes ((ListLongMap!14123 0))(
  ( (ListLongMap!14124 (toList!7077 List!22722)) )
))
(declare-fun lt!469665 () ListLongMap!14123)

(declare-fun lt!469658 () ListLongMap!14123)

(declare-fun -!592 (ListLongMap!14123 (_ BitVec 64)) ListLongMap!14123)

(assert (=> b!1065250 (= lt!469665 (-!592 lt!469658 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!469663 () ListLongMap!14123)

(declare-fun lt!469662 () ListLongMap!14123)

(assert (=> b!1065250 (= (-!592 lt!469663 #b0000000000000000000000000000000000000000000000000000000000000000) lt!469662)))

(declare-datatypes ((Unit!34947 0))(
  ( (Unit!34948) )
))
(declare-fun lt!469659 () Unit!34947)

(declare-fun zeroValueBefore!47 () V!38993)

(declare-fun addThenRemoveForNewKeyIsSame!1 (ListLongMap!14123 (_ BitVec 64) V!38993) Unit!34947)

(assert (=> b!1065250 (= lt!469659 (addThenRemoveForNewKeyIsSame!1 lt!469662 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!469664 () ListLongMap!14123)

(declare-fun lt!469660 () ListLongMap!14123)

(assert (=> b!1065250 (and (= lt!469658 lt!469663) (= lt!469660 lt!469664))))

(declare-fun +!3123 (ListLongMap!14123 tuple2!16154) ListLongMap!14123)

(assert (=> b!1065250 (= lt!469663 (+!3123 lt!469662 (tuple2!16155 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-datatypes ((ValueCell!11993 0))(
  ( (ValueCellFull!11993 (v!15359 V!38993)) (EmptyCell!11993) )
))
(declare-datatypes ((array!67775 0))(
  ( (array!67776 (arr!32590 (Array (_ BitVec 32) ValueCell!11993)) (size!33126 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67775)

(declare-fun minValue!907 () V!38993)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38993)

(declare-fun getCurrentListMap!4036 (array!67773 array!67775 (_ BitVec 32) (_ BitVec 32) V!38993 V!38993 (_ BitVec 32) Int) ListLongMap!14123)

(assert (=> b!1065250 (= lt!469660 (getCurrentListMap!4036 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065250 (= lt!469658 (getCurrentListMap!4036 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39775 () Bool)

(declare-fun mapRes!39775 () Bool)

(declare-fun tp!76187 () Bool)

(declare-fun e!607242 () Bool)

(assert (=> mapNonEmpty!39775 (= mapRes!39775 (and tp!76187 e!607242))))

(declare-fun mapKey!39775 () (_ BitVec 32))

(declare-fun mapRest!39775 () (Array (_ BitVec 32) ValueCell!11993))

(declare-fun mapValue!39775 () ValueCell!11993)

(assert (=> mapNonEmpty!39775 (= (arr!32590 _values!955) (store mapRest!39775 mapKey!39775 mapValue!39775))))

(declare-fun b!1065251 () Bool)

(declare-fun res!711065 () Bool)

(assert (=> b!1065251 (=> (not res!711065) (not e!607246))))

(assert (=> b!1065251 (= res!711065 (and (= (size!33126 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33125 _keys!1163) (size!33126 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39775 () Bool)

(assert (=> mapIsEmpty!39775 mapRes!39775))

(declare-fun b!1065252 () Bool)

(assert (=> b!1065252 (= e!607246 (not e!607243))))

(declare-fun res!711068 () Bool)

(assert (=> b!1065252 (=> res!711068 e!607243)))

(assert (=> b!1065252 (= res!711068 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1065252 (= lt!469662 lt!469664)))

(declare-fun lt!469661 () Unit!34947)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!702 (array!67773 array!67775 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38993 V!38993 V!38993 V!38993 (_ BitVec 32) Int) Unit!34947)

(assert (=> b!1065252 (= lt!469661 (lemmaNoChangeToArrayThenSameMapNoExtras!702 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3665 (array!67773 array!67775 (_ BitVec 32) (_ BitVec 32) V!38993 V!38993 (_ BitVec 32) Int) ListLongMap!14123)

(assert (=> b!1065252 (= lt!469664 (getCurrentListMapNoExtraKeys!3665 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065252 (= lt!469662 (getCurrentListMapNoExtraKeys!3665 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!711069 () Bool)

(assert (=> start!94198 (=> (not res!711069) (not e!607246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94198 (= res!711069 (validMask!0 mask!1515))))

(assert (=> start!94198 e!607246))

(assert (=> start!94198 true))

(declare-fun tp_is_empty!25393 () Bool)

(assert (=> start!94198 tp_is_empty!25393))

(declare-fun e!607245 () Bool)

(declare-fun array_inv!25234 (array!67775) Bool)

(assert (=> start!94198 (and (array_inv!25234 _values!955) e!607245)))

(assert (=> start!94198 tp!76186))

(declare-fun array_inv!25235 (array!67773) Bool)

(assert (=> start!94198 (array_inv!25235 _keys!1163)))

(declare-fun b!1065253 () Bool)

(declare-fun e!607244 () Bool)

(assert (=> b!1065253 (= e!607244 tp_is_empty!25393)))

(declare-fun b!1065254 () Bool)

(assert (=> b!1065254 (= e!607242 tp_is_empty!25393)))

(declare-fun b!1065255 () Bool)

(assert (=> b!1065255 (= e!607245 (and e!607244 mapRes!39775))))

(declare-fun condMapEmpty!39775 () Bool)

(declare-fun mapDefault!39775 () ValueCell!11993)

