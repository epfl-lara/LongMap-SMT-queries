; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94914 () Bool)

(assert start!94914)

(declare-fun b_free!22119 () Bool)

(declare-fun b_next!22119 () Bool)

(assert (=> start!94914 (= b_free!22119 (not b_next!22119))))

(declare-fun tp!77822 () Bool)

(declare-fun b_and!34973 () Bool)

(assert (=> start!94914 (= tp!77822 b_and!34973)))

(declare-fun b!1073195 () Bool)

(declare-fun e!613088 () Bool)

(assert (=> b!1073195 (= e!613088 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39707 0))(
  ( (V!39708 (val!13015 Int)) )
))
(declare-datatypes ((ValueCell!12261 0))(
  ( (ValueCellFull!12261 (v!15633 V!39707)) (EmptyCell!12261) )
))
(declare-datatypes ((array!68821 0))(
  ( (array!68822 (arr!33104 (Array (_ BitVec 32) ValueCell!12261)) (size!33640 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68821)

(declare-fun minValue!907 () V!39707)

(declare-datatypes ((array!68823 0))(
  ( (array!68824 (arr!33105 (Array (_ BitVec 32) (_ BitVec 64))) (size!33641 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68823)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((tuple2!16574 0))(
  ( (tuple2!16575 (_1!8298 (_ BitVec 64)) (_2!8298 V!39707)) )
))
(declare-datatypes ((List!23109 0))(
  ( (Nil!23106) (Cons!23105 (h!24314 tuple2!16574) (t!32446 List!23109)) )
))
(declare-datatypes ((ListLongMap!14543 0))(
  ( (ListLongMap!14544 (toList!7287 List!23109)) )
))
(declare-fun lt!475977 () ListLongMap!14543)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39707)

(declare-fun getCurrentListMapNoExtraKeys!3851 (array!68823 array!68821 (_ BitVec 32) (_ BitVec 32) V!39707 V!39707 (_ BitVec 32) Int) ListLongMap!14543)

(assert (=> b!1073195 (= lt!475977 (getCurrentListMapNoExtraKeys!3851 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39707)

(declare-fun lt!475978 () ListLongMap!14543)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073195 (= lt!475978 (getCurrentListMapNoExtraKeys!3851 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073196 () Bool)

(declare-fun e!613085 () Bool)

(declare-fun tp_is_empty!25929 () Bool)

(assert (=> b!1073196 (= e!613085 tp_is_empty!25929)))

(declare-fun b!1073197 () Bool)

(declare-fun res!715801 () Bool)

(assert (=> b!1073197 (=> (not res!715801) (not e!613088))))

(declare-datatypes ((List!23110 0))(
  ( (Nil!23107) (Cons!23106 (h!24315 (_ BitVec 64)) (t!32447 List!23110)) )
))
(declare-fun arrayNoDuplicates!0 (array!68823 (_ BitVec 32) List!23110) Bool)

(assert (=> b!1073197 (= res!715801 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23107))))

(declare-fun b!1073198 () Bool)

(declare-fun e!613086 () Bool)

(assert (=> b!1073198 (= e!613086 tp_is_empty!25929)))

(declare-fun res!715803 () Bool)

(assert (=> start!94914 (=> (not res!715803) (not e!613088))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94914 (= res!715803 (validMask!0 mask!1515))))

(assert (=> start!94914 e!613088))

(assert (=> start!94914 true))

(assert (=> start!94914 tp_is_empty!25929))

(declare-fun e!613087 () Bool)

(declare-fun array_inv!25590 (array!68821) Bool)

(assert (=> start!94914 (and (array_inv!25590 _values!955) e!613087)))

(assert (=> start!94914 tp!77822))

(declare-fun array_inv!25591 (array!68823) Bool)

(assert (=> start!94914 (array_inv!25591 _keys!1163)))

(declare-fun b!1073199 () Bool)

(declare-fun res!715802 () Bool)

(assert (=> b!1073199 (=> (not res!715802) (not e!613088))))

(assert (=> b!1073199 (= res!715802 (and (= (size!33640 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33641 _keys!1163) (size!33640 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1073200 () Bool)

(declare-fun res!715804 () Bool)

(assert (=> b!1073200 (=> (not res!715804) (not e!613088))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68823 (_ BitVec 32)) Bool)

(assert (=> b!1073200 (= res!715804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!40606 () Bool)

(declare-fun mapRes!40606 () Bool)

(assert (=> mapIsEmpty!40606 mapRes!40606))

(declare-fun b!1073201 () Bool)

(assert (=> b!1073201 (= e!613087 (and e!613086 mapRes!40606))))

(declare-fun condMapEmpty!40606 () Bool)

(declare-fun mapDefault!40606 () ValueCell!12261)

(assert (=> b!1073201 (= condMapEmpty!40606 (= (arr!33104 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12261)) mapDefault!40606)))))

(declare-fun mapNonEmpty!40606 () Bool)

(declare-fun tp!77821 () Bool)

(assert (=> mapNonEmpty!40606 (= mapRes!40606 (and tp!77821 e!613085))))

(declare-fun mapKey!40606 () (_ BitVec 32))

(declare-fun mapRest!40606 () (Array (_ BitVec 32) ValueCell!12261))

(declare-fun mapValue!40606 () ValueCell!12261)

(assert (=> mapNonEmpty!40606 (= (arr!33104 _values!955) (store mapRest!40606 mapKey!40606 mapValue!40606))))

(assert (= (and start!94914 res!715803) b!1073199))

(assert (= (and b!1073199 res!715802) b!1073200))

(assert (= (and b!1073200 res!715804) b!1073197))

(assert (= (and b!1073197 res!715801) b!1073195))

(assert (= (and b!1073201 condMapEmpty!40606) mapIsEmpty!40606))

(assert (= (and b!1073201 (not condMapEmpty!40606)) mapNonEmpty!40606))

(get-info :version)

(assert (= (and mapNonEmpty!40606 ((_ is ValueCellFull!12261) mapValue!40606)) b!1073196))

(assert (= (and b!1073201 ((_ is ValueCellFull!12261) mapDefault!40606)) b!1073198))

(assert (= start!94914 b!1073201))

(declare-fun m!992239 () Bool)

(assert (=> mapNonEmpty!40606 m!992239))

(declare-fun m!992241 () Bool)

(assert (=> b!1073197 m!992241))

(declare-fun m!992243 () Bool)

(assert (=> b!1073195 m!992243))

(declare-fun m!992245 () Bool)

(assert (=> b!1073195 m!992245))

(declare-fun m!992247 () Bool)

(assert (=> b!1073200 m!992247))

(declare-fun m!992249 () Bool)

(assert (=> start!94914 m!992249))

(declare-fun m!992251 () Bool)

(assert (=> start!94914 m!992251))

(declare-fun m!992253 () Bool)

(assert (=> start!94914 m!992253))

(check-sat (not b!1073195) tp_is_empty!25929 (not start!94914) b_and!34973 (not b!1073197) (not mapNonEmpty!40606) (not b!1073200) (not b_next!22119))
(check-sat b_and!34973 (not b_next!22119))
