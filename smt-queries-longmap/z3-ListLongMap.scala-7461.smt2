; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94668 () Bool)

(assert start!94668)

(declare-fun b_free!21943 () Bool)

(declare-fun b_next!21943 () Bool)

(assert (=> start!94668 (= b_free!21943 (not b_next!21943))))

(declare-fun tp!77285 () Bool)

(declare-fun b_and!34737 () Bool)

(assert (=> start!94668 (= tp!77285 b_and!34737)))

(declare-fun b!1070268 () Bool)

(declare-fun e!610941 () Bool)

(declare-fun e!610938 () Bool)

(declare-fun mapRes!40333 () Bool)

(assert (=> b!1070268 (= e!610941 (and e!610938 mapRes!40333))))

(declare-fun condMapEmpty!40333 () Bool)

(declare-datatypes ((V!39473 0))(
  ( (V!39474 (val!12927 Int)) )
))
(declare-datatypes ((ValueCell!12173 0))(
  ( (ValueCellFull!12173 (v!15542 V!39473)) (EmptyCell!12173) )
))
(declare-datatypes ((array!68420 0))(
  ( (array!68421 (arr!32907 (Array (_ BitVec 32) ValueCell!12173)) (size!33445 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68420)

(declare-fun mapDefault!40333 () ValueCell!12173)

(assert (=> b!1070268 (= condMapEmpty!40333 (= (arr!32907 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12173)) mapDefault!40333)))))

(declare-fun b!1070269 () Bool)

(declare-fun res!714047 () Bool)

(declare-fun e!610939 () Bool)

(assert (=> b!1070269 (=> (not res!714047) (not e!610939))))

(declare-datatypes ((array!68422 0))(
  ( (array!68423 (arr!32908 (Array (_ BitVec 32) (_ BitVec 64))) (size!33446 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68422)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68422 (_ BitVec 32)) Bool)

(assert (=> b!1070269 (= res!714047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070270 () Bool)

(declare-fun res!714046 () Bool)

(assert (=> b!1070270 (=> (not res!714046) (not e!610939))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1070270 (= res!714046 (and (= (size!33445 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33446 _keys!1163) (size!33445 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1070271 () Bool)

(declare-fun res!714045 () Bool)

(assert (=> b!1070271 (=> (not res!714045) (not e!610939))))

(declare-datatypes ((List!23019 0))(
  ( (Nil!23016) (Cons!23015 (h!24224 (_ BitVec 64)) (t!32341 List!23019)) )
))
(declare-fun arrayNoDuplicates!0 (array!68422 (_ BitVec 32) List!23019) Bool)

(assert (=> b!1070271 (= res!714045 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23016))))

(declare-fun b!1070272 () Bool)

(declare-fun e!610937 () Bool)

(assert (=> b!1070272 (= e!610939 (not e!610937))))

(declare-fun res!714044 () Bool)

(assert (=> b!1070272 (=> res!714044 e!610937)))

(assert (=> b!1070272 (= res!714044 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16490 0))(
  ( (tuple2!16491 (_1!8256 (_ BitVec 64)) (_2!8256 V!39473)) )
))
(declare-datatypes ((List!23020 0))(
  ( (Nil!23017) (Cons!23016 (h!24225 tuple2!16490) (t!32342 List!23020)) )
))
(declare-datatypes ((ListLongMap!14459 0))(
  ( (ListLongMap!14460 (toList!7245 List!23020)) )
))
(declare-fun lt!472865 () ListLongMap!14459)

(declare-fun lt!472863 () ListLongMap!14459)

(assert (=> b!1070272 (= lt!472865 lt!472863)))

(declare-fun zeroValueBefore!47 () V!39473)

(declare-datatypes ((Unit!35074 0))(
  ( (Unit!35075) )
))
(declare-fun lt!472862 () Unit!35074)

(declare-fun minValue!907 () V!39473)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39473)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!826 (array!68422 array!68420 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39473 V!39473 V!39473 V!39473 (_ BitVec 32) Int) Unit!35074)

(assert (=> b!1070272 (= lt!472862 (lemmaNoChangeToArrayThenSameMapNoExtras!826 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3832 (array!68422 array!68420 (_ BitVec 32) (_ BitVec 32) V!39473 V!39473 (_ BitVec 32) Int) ListLongMap!14459)

(assert (=> b!1070272 (= lt!472863 (getCurrentListMapNoExtraKeys!3832 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070272 (= lt!472865 (getCurrentListMapNoExtraKeys!3832 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070273 () Bool)

(assert (=> b!1070273 (= e!610937 true)))

(declare-fun lt!472864 () ListLongMap!14459)

(declare-fun getCurrentListMap!4060 (array!68422 array!68420 (_ BitVec 32) (_ BitVec 32) V!39473 V!39473 (_ BitVec 32) Int) ListLongMap!14459)

(assert (=> b!1070273 (= lt!472864 (getCurrentListMap!4060 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070274 () Bool)

(declare-fun tp_is_empty!25753 () Bool)

(assert (=> b!1070274 (= e!610938 tp_is_empty!25753)))

(declare-fun mapNonEmpty!40333 () Bool)

(declare-fun tp!77284 () Bool)

(declare-fun e!610942 () Bool)

(assert (=> mapNonEmpty!40333 (= mapRes!40333 (and tp!77284 e!610942))))

(declare-fun mapRest!40333 () (Array (_ BitVec 32) ValueCell!12173))

(declare-fun mapValue!40333 () ValueCell!12173)

(declare-fun mapKey!40333 () (_ BitVec 32))

(assert (=> mapNonEmpty!40333 (= (arr!32907 _values!955) (store mapRest!40333 mapKey!40333 mapValue!40333))))

(declare-fun b!1070275 () Bool)

(assert (=> b!1070275 (= e!610942 tp_is_empty!25753)))

(declare-fun mapIsEmpty!40333 () Bool)

(assert (=> mapIsEmpty!40333 mapRes!40333))

(declare-fun res!714048 () Bool)

(assert (=> start!94668 (=> (not res!714048) (not e!610939))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94668 (= res!714048 (validMask!0 mask!1515))))

(assert (=> start!94668 e!610939))

(assert (=> start!94668 true))

(assert (=> start!94668 tp_is_empty!25753))

(declare-fun array_inv!25458 (array!68420) Bool)

(assert (=> start!94668 (and (array_inv!25458 _values!955) e!610941)))

(assert (=> start!94668 tp!77285))

(declare-fun array_inv!25459 (array!68422) Bool)

(assert (=> start!94668 (array_inv!25459 _keys!1163)))

(assert (= (and start!94668 res!714048) b!1070270))

(assert (= (and b!1070270 res!714046) b!1070269))

(assert (= (and b!1070269 res!714047) b!1070271))

(assert (= (and b!1070271 res!714045) b!1070272))

(assert (= (and b!1070272 (not res!714044)) b!1070273))

(assert (= (and b!1070268 condMapEmpty!40333) mapIsEmpty!40333))

(assert (= (and b!1070268 (not condMapEmpty!40333)) mapNonEmpty!40333))

(get-info :version)

(assert (= (and mapNonEmpty!40333 ((_ is ValueCellFull!12173) mapValue!40333)) b!1070275))

(assert (= (and b!1070268 ((_ is ValueCellFull!12173) mapDefault!40333)) b!1070274))

(assert (= start!94668 b!1070268))

(declare-fun m!988147 () Bool)

(assert (=> b!1070271 m!988147))

(declare-fun m!988149 () Bool)

(assert (=> start!94668 m!988149))

(declare-fun m!988151 () Bool)

(assert (=> start!94668 m!988151))

(declare-fun m!988153 () Bool)

(assert (=> start!94668 m!988153))

(declare-fun m!988155 () Bool)

(assert (=> mapNonEmpty!40333 m!988155))

(declare-fun m!988157 () Bool)

(assert (=> b!1070269 m!988157))

(declare-fun m!988159 () Bool)

(assert (=> b!1070272 m!988159))

(declare-fun m!988161 () Bool)

(assert (=> b!1070272 m!988161))

(declare-fun m!988163 () Bool)

(assert (=> b!1070272 m!988163))

(declare-fun m!988165 () Bool)

(assert (=> b!1070273 m!988165))

(check-sat b_and!34737 (not mapNonEmpty!40333) (not b_next!21943) (not b!1070271) (not b!1070273) (not b!1070272) (not b!1070269) (not start!94668) tp_is_empty!25753)
(check-sat b_and!34737 (not b_next!21943))
