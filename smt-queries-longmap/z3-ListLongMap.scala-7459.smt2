; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94656 () Bool)

(assert start!94656)

(declare-fun b_free!21931 () Bool)

(declare-fun b_next!21931 () Bool)

(assert (=> start!94656 (= b_free!21931 (not b_next!21931))))

(declare-fun tp!77248 () Bool)

(declare-fun b_and!34725 () Bool)

(assert (=> start!94656 (= tp!77248 b_and!34725)))

(declare-fun mapNonEmpty!40315 () Bool)

(declare-fun mapRes!40315 () Bool)

(declare-fun tp!77249 () Bool)

(declare-fun e!610834 () Bool)

(assert (=> mapNonEmpty!40315 (= mapRes!40315 (and tp!77249 e!610834))))

(declare-datatypes ((V!39457 0))(
  ( (V!39458 (val!12921 Int)) )
))
(declare-datatypes ((ValueCell!12167 0))(
  ( (ValueCellFull!12167 (v!15536 V!39457)) (EmptyCell!12167) )
))
(declare-fun mapRest!40315 () (Array (_ BitVec 32) ValueCell!12167))

(declare-datatypes ((array!68396 0))(
  ( (array!68397 (arr!32895 (Array (_ BitVec 32) ValueCell!12167)) (size!33433 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68396)

(declare-fun mapValue!40315 () ValueCell!12167)

(declare-fun mapKey!40315 () (_ BitVec 32))

(assert (=> mapNonEmpty!40315 (= (arr!32895 _values!955) (store mapRest!40315 mapKey!40315 mapValue!40315))))

(declare-fun b!1070124 () Bool)

(declare-fun res!713956 () Bool)

(declare-fun e!610831 () Bool)

(assert (=> b!1070124 (=> (not res!713956) (not e!610831))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68398 0))(
  ( (array!68399 (arr!32896 (Array (_ BitVec 32) (_ BitVec 64))) (size!33434 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68398)

(assert (=> b!1070124 (= res!713956 (and (= (size!33433 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33434 _keys!1163) (size!33433 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1070125 () Bool)

(declare-fun tp_is_empty!25741 () Bool)

(assert (=> b!1070125 (= e!610834 tp_is_empty!25741)))

(declare-fun b!1070126 () Bool)

(declare-fun res!713954 () Bool)

(assert (=> b!1070126 (=> (not res!713954) (not e!610831))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68398 (_ BitVec 32)) Bool)

(assert (=> b!1070126 (= res!713954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070127 () Bool)

(declare-fun res!713957 () Bool)

(assert (=> b!1070127 (=> (not res!713957) (not e!610831))))

(declare-datatypes ((List!23012 0))(
  ( (Nil!23009) (Cons!23008 (h!24217 (_ BitVec 64)) (t!32334 List!23012)) )
))
(declare-fun arrayNoDuplicates!0 (array!68398 (_ BitVec 32) List!23012) Bool)

(assert (=> b!1070127 (= res!713957 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23009))))

(declare-fun b!1070128 () Bool)

(declare-fun e!610829 () Bool)

(assert (=> b!1070128 (= e!610829 tp_is_empty!25741)))

(declare-fun b!1070129 () Bool)

(declare-fun e!610832 () Bool)

(assert (=> b!1070129 (= e!610832 true)))

(declare-fun zeroValueBefore!47 () V!39457)

(declare-datatypes ((tuple2!16484 0))(
  ( (tuple2!16485 (_1!8253 (_ BitVec 64)) (_2!8253 V!39457)) )
))
(declare-datatypes ((List!23013 0))(
  ( (Nil!23010) (Cons!23009 (h!24218 tuple2!16484) (t!32335 List!23013)) )
))
(declare-datatypes ((ListLongMap!14453 0))(
  ( (ListLongMap!14454 (toList!7242 List!23013)) )
))
(declare-fun lt!472791 () ListLongMap!14453)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39457)

(declare-fun getCurrentListMap!4057 (array!68398 array!68396 (_ BitVec 32) (_ BitVec 32) V!39457 V!39457 (_ BitVec 32) Int) ListLongMap!14453)

(assert (=> b!1070129 (= lt!472791 (getCurrentListMap!4057 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!713955 () Bool)

(assert (=> start!94656 (=> (not res!713955) (not e!610831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94656 (= res!713955 (validMask!0 mask!1515))))

(assert (=> start!94656 e!610831))

(assert (=> start!94656 true))

(assert (=> start!94656 tp_is_empty!25741))

(declare-fun e!610833 () Bool)

(declare-fun array_inv!25450 (array!68396) Bool)

(assert (=> start!94656 (and (array_inv!25450 _values!955) e!610833)))

(assert (=> start!94656 tp!77248))

(declare-fun array_inv!25451 (array!68398) Bool)

(assert (=> start!94656 (array_inv!25451 _keys!1163)))

(declare-fun mapIsEmpty!40315 () Bool)

(assert (=> mapIsEmpty!40315 mapRes!40315))

(declare-fun b!1070130 () Bool)

(assert (=> b!1070130 (= e!610831 (not e!610832))))

(declare-fun res!713958 () Bool)

(assert (=> b!1070130 (=> res!713958 e!610832)))

(assert (=> b!1070130 (= res!713958 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!472793 () ListLongMap!14453)

(declare-fun lt!472792 () ListLongMap!14453)

(assert (=> b!1070130 (= lt!472793 lt!472792)))

(declare-datatypes ((Unit!35070 0))(
  ( (Unit!35071) )
))
(declare-fun lt!472790 () Unit!35070)

(declare-fun zeroValueAfter!47 () V!39457)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!824 (array!68398 array!68396 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39457 V!39457 V!39457 V!39457 (_ BitVec 32) Int) Unit!35070)

(assert (=> b!1070130 (= lt!472790 (lemmaNoChangeToArrayThenSameMapNoExtras!824 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3830 (array!68398 array!68396 (_ BitVec 32) (_ BitVec 32) V!39457 V!39457 (_ BitVec 32) Int) ListLongMap!14453)

(assert (=> b!1070130 (= lt!472792 (getCurrentListMapNoExtraKeys!3830 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070130 (= lt!472793 (getCurrentListMapNoExtraKeys!3830 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070131 () Bool)

(assert (=> b!1070131 (= e!610833 (and e!610829 mapRes!40315))))

(declare-fun condMapEmpty!40315 () Bool)

(declare-fun mapDefault!40315 () ValueCell!12167)

(assert (=> b!1070131 (= condMapEmpty!40315 (= (arr!32895 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12167)) mapDefault!40315)))))

(assert (= (and start!94656 res!713955) b!1070124))

(assert (= (and b!1070124 res!713956) b!1070126))

(assert (= (and b!1070126 res!713954) b!1070127))

(assert (= (and b!1070127 res!713957) b!1070130))

(assert (= (and b!1070130 (not res!713958)) b!1070129))

(assert (= (and b!1070131 condMapEmpty!40315) mapIsEmpty!40315))

(assert (= (and b!1070131 (not condMapEmpty!40315)) mapNonEmpty!40315))

(get-info :version)

(assert (= (and mapNonEmpty!40315 ((_ is ValueCellFull!12167) mapValue!40315)) b!1070125))

(assert (= (and b!1070131 ((_ is ValueCellFull!12167) mapDefault!40315)) b!1070128))

(assert (= start!94656 b!1070131))

(declare-fun m!988027 () Bool)

(assert (=> b!1070129 m!988027))

(declare-fun m!988029 () Bool)

(assert (=> b!1070130 m!988029))

(declare-fun m!988031 () Bool)

(assert (=> b!1070130 m!988031))

(declare-fun m!988033 () Bool)

(assert (=> b!1070130 m!988033))

(declare-fun m!988035 () Bool)

(assert (=> mapNonEmpty!40315 m!988035))

(declare-fun m!988037 () Bool)

(assert (=> start!94656 m!988037))

(declare-fun m!988039 () Bool)

(assert (=> start!94656 m!988039))

(declare-fun m!988041 () Bool)

(assert (=> start!94656 m!988041))

(declare-fun m!988043 () Bool)

(assert (=> b!1070127 m!988043))

(declare-fun m!988045 () Bool)

(assert (=> b!1070126 m!988045))

(check-sat b_and!34725 tp_is_empty!25741 (not b!1070130) (not b_next!21931) (not b!1070127) (not b!1070129) (not start!94656) (not mapNonEmpty!40315) (not b!1070126))
(check-sat b_and!34725 (not b_next!21931))
