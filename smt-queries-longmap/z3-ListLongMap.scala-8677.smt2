; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105434 () Bool)

(assert start!105434)

(declare-fun b_free!27097 () Bool)

(declare-fun b_next!27097 () Bool)

(assert (=> start!105434 (= b_free!27097 (not b_next!27097))))

(declare-fun tp!94805 () Bool)

(declare-fun b_and!44925 () Bool)

(assert (=> start!105434 (= tp!94805 b_and!44925)))

(declare-fun b!1256144 () Bool)

(declare-fun res!837434 () Bool)

(declare-fun e!714073 () Bool)

(assert (=> b!1256144 (=> (not res!837434) (not e!714073))))

(declare-datatypes ((array!81567 0))(
  ( (array!81568 (arr!39343 (Array (_ BitVec 32) (_ BitVec 64))) (size!39881 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81567)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81567 (_ BitVec 32)) Bool)

(assert (=> b!1256144 (= res!837434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256145 () Bool)

(declare-fun e!714068 () Bool)

(declare-fun tp_is_empty!31999 () Bool)

(assert (=> b!1256145 (= e!714068 tp_is_empty!31999)))

(declare-fun b!1256146 () Bool)

(declare-fun res!837437 () Bool)

(assert (=> b!1256146 (=> (not res!837437) (not e!714073))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!48031 0))(
  ( (V!48032 (val!16062 Int)) )
))
(declare-datatypes ((ValueCell!15236 0))(
  ( (ValueCellFull!15236 (v!18761 V!48031)) (EmptyCell!15236) )
))
(declare-datatypes ((array!81569 0))(
  ( (array!81570 (arr!39344 (Array (_ BitVec 32) ValueCell!15236)) (size!39882 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81569)

(assert (=> b!1256146 (= res!837437 (and (= (size!39882 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39881 _keys!1118) (size!39882 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49783 () Bool)

(declare-fun mapRes!49783 () Bool)

(declare-fun tp!94804 () Bool)

(assert (=> mapNonEmpty!49783 (= mapRes!49783 (and tp!94804 e!714068))))

(declare-fun mapKey!49783 () (_ BitVec 32))

(declare-fun mapRest!49783 () (Array (_ BitVec 32) ValueCell!15236))

(declare-fun mapValue!49783 () ValueCell!15236)

(assert (=> mapNonEmpty!49783 (= (arr!39344 _values!914) (store mapRest!49783 mapKey!49783 mapValue!49783))))

(declare-fun res!837438 () Bool)

(assert (=> start!105434 (=> (not res!837438) (not e!714073))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105434 (= res!837438 (validMask!0 mask!1466))))

(assert (=> start!105434 e!714073))

(assert (=> start!105434 true))

(assert (=> start!105434 tp!94805))

(assert (=> start!105434 tp_is_empty!31999))

(declare-fun array_inv!30107 (array!81567) Bool)

(assert (=> start!105434 (array_inv!30107 _keys!1118)))

(declare-fun e!714072 () Bool)

(declare-fun array_inv!30108 (array!81569) Bool)

(assert (=> start!105434 (and (array_inv!30108 _values!914) e!714072)))

(declare-fun b!1256147 () Bool)

(declare-fun e!714070 () Bool)

(assert (=> b!1256147 (= e!714070 true)))

(declare-datatypes ((tuple2!20830 0))(
  ( (tuple2!20831 (_1!10426 (_ BitVec 64)) (_2!10426 V!48031)) )
))
(declare-datatypes ((List!28039 0))(
  ( (Nil!28036) (Cons!28035 (h!29244 tuple2!20830) (t!41517 List!28039)) )
))
(declare-datatypes ((ListLongMap!18703 0))(
  ( (ListLongMap!18704 (toList!9367 List!28039)) )
))
(declare-fun lt!567823 () ListLongMap!18703)

(declare-fun -!2034 (ListLongMap!18703 (_ BitVec 64)) ListLongMap!18703)

(assert (=> b!1256147 (= (-!2034 lt!567823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567823)))

(declare-datatypes ((Unit!41691 0))(
  ( (Unit!41692) )
))
(declare-fun lt!567824 () Unit!41691)

(declare-fun removeNotPresentStillSame!129 (ListLongMap!18703 (_ BitVec 64)) Unit!41691)

(assert (=> b!1256147 (= lt!567824 (removeNotPresentStillSame!129 lt!567823 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1256148 () Bool)

(declare-fun res!837435 () Bool)

(assert (=> b!1256148 (=> (not res!837435) (not e!714073))))

(declare-datatypes ((List!28040 0))(
  ( (Nil!28037) (Cons!28036 (h!29245 (_ BitVec 64)) (t!41518 List!28040)) )
))
(declare-fun arrayNoDuplicates!0 (array!81567 (_ BitVec 32) List!28040) Bool)

(assert (=> b!1256148 (= res!837435 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28037))))

(declare-fun b!1256149 () Bool)

(declare-fun e!714071 () Bool)

(assert (=> b!1256149 (= e!714071 tp_is_empty!31999)))

(declare-fun mapIsEmpty!49783 () Bool)

(assert (=> mapIsEmpty!49783 mapRes!49783))

(declare-fun b!1256150 () Bool)

(declare-fun e!714074 () Bool)

(assert (=> b!1256150 (= e!714074 e!714070)))

(declare-fun res!837439 () Bool)

(assert (=> b!1256150 (=> res!837439 e!714070)))

(declare-fun contains!7518 (ListLongMap!18703 (_ BitVec 64)) Bool)

(assert (=> b!1256150 (= res!837439 (contains!7518 lt!567823 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!48031)

(declare-fun minValueBefore!43 () V!48031)

(declare-fun getCurrentListMap!4478 (array!81567 array!81569 (_ BitVec 32) (_ BitVec 32) V!48031 V!48031 (_ BitVec 32) Int) ListLongMap!18703)

(assert (=> b!1256150 (= lt!567823 (getCurrentListMap!4478 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256151 () Bool)

(assert (=> b!1256151 (= e!714073 (not e!714074))))

(declare-fun res!837436 () Bool)

(assert (=> b!1256151 (=> res!837436 e!714074)))

(assert (=> b!1256151 (= res!837436 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!567821 () ListLongMap!18703)

(declare-fun lt!567820 () ListLongMap!18703)

(assert (=> b!1256151 (= lt!567821 lt!567820)))

(declare-fun minValueAfter!43 () V!48031)

(declare-fun lt!567822 () Unit!41691)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1076 (array!81567 array!81569 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48031 V!48031 V!48031 V!48031 (_ BitVec 32) Int) Unit!41691)

(assert (=> b!1256151 (= lt!567822 (lemmaNoChangeToArrayThenSameMapNoExtras!1076 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5754 (array!81567 array!81569 (_ BitVec 32) (_ BitVec 32) V!48031 V!48031 (_ BitVec 32) Int) ListLongMap!18703)

(assert (=> b!1256151 (= lt!567820 (getCurrentListMapNoExtraKeys!5754 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256151 (= lt!567821 (getCurrentListMapNoExtraKeys!5754 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256152 () Bool)

(assert (=> b!1256152 (= e!714072 (and e!714071 mapRes!49783))))

(declare-fun condMapEmpty!49783 () Bool)

(declare-fun mapDefault!49783 () ValueCell!15236)

(assert (=> b!1256152 (= condMapEmpty!49783 (= (arr!39344 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15236)) mapDefault!49783)))))

(assert (= (and start!105434 res!837438) b!1256146))

(assert (= (and b!1256146 res!837437) b!1256144))

(assert (= (and b!1256144 res!837434) b!1256148))

(assert (= (and b!1256148 res!837435) b!1256151))

(assert (= (and b!1256151 (not res!837436)) b!1256150))

(assert (= (and b!1256150 (not res!837439)) b!1256147))

(assert (= (and b!1256152 condMapEmpty!49783) mapIsEmpty!49783))

(assert (= (and b!1256152 (not condMapEmpty!49783)) mapNonEmpty!49783))

(get-info :version)

(assert (= (and mapNonEmpty!49783 ((_ is ValueCellFull!15236) mapValue!49783)) b!1256145))

(assert (= (and b!1256152 ((_ is ValueCellFull!15236) mapDefault!49783)) b!1256149))

(assert (= start!105434 b!1256152))

(declare-fun m!1156387 () Bool)

(assert (=> b!1256144 m!1156387))

(declare-fun m!1156389 () Bool)

(assert (=> mapNonEmpty!49783 m!1156389))

(declare-fun m!1156391 () Bool)

(assert (=> b!1256147 m!1156391))

(declare-fun m!1156393 () Bool)

(assert (=> b!1256147 m!1156393))

(declare-fun m!1156395 () Bool)

(assert (=> b!1256150 m!1156395))

(declare-fun m!1156397 () Bool)

(assert (=> b!1256150 m!1156397))

(declare-fun m!1156399 () Bool)

(assert (=> start!105434 m!1156399))

(declare-fun m!1156401 () Bool)

(assert (=> start!105434 m!1156401))

(declare-fun m!1156403 () Bool)

(assert (=> start!105434 m!1156403))

(declare-fun m!1156405 () Bool)

(assert (=> b!1256148 m!1156405))

(declare-fun m!1156407 () Bool)

(assert (=> b!1256151 m!1156407))

(declare-fun m!1156409 () Bool)

(assert (=> b!1256151 m!1156409))

(declare-fun m!1156411 () Bool)

(assert (=> b!1256151 m!1156411))

(check-sat (not b!1256148) tp_is_empty!31999 (not b!1256147) (not b!1256144) (not mapNonEmpty!49783) b_and!44925 (not b!1256151) (not b!1256150) (not start!105434) (not b_next!27097))
(check-sat b_and!44925 (not b_next!27097))
