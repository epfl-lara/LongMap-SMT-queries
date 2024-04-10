; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71070 () Bool)

(assert start!71070)

(declare-fun b_free!13257 () Bool)

(declare-fun b_next!13257 () Bool)

(assert (=> start!71070 (= b_free!13257 (not b_next!13257))))

(declare-fun tp!46527 () Bool)

(declare-fun b_and!22171 () Bool)

(assert (=> start!71070 (= tp!46527 b_and!22171)))

(declare-fun b!825318 () Bool)

(declare-fun e!459344 () Bool)

(assert (=> b!825318 (= e!459344 true)))

(declare-datatypes ((V!24957 0))(
  ( (V!24958 (val!7531 Int)) )
))
(declare-datatypes ((tuple2!9966 0))(
  ( (tuple2!9967 (_1!4994 (_ BitVec 64)) (_2!4994 V!24957)) )
))
(declare-datatypes ((List!15772 0))(
  ( (Nil!15769) (Cons!15768 (h!16897 tuple2!9966) (t!22117 List!15772)) )
))
(declare-datatypes ((ListLongMap!8789 0))(
  ( (ListLongMap!8790 (toList!4410 List!15772)) )
))
(declare-fun lt!372515 () ListLongMap!8789)

(declare-fun lt!372516 () ListLongMap!8789)

(declare-fun lt!372511 () tuple2!9966)

(declare-fun lt!372506 () tuple2!9966)

(declare-fun +!1919 (ListLongMap!8789 tuple2!9966) ListLongMap!8789)

(assert (=> b!825318 (= lt!372516 (+!1919 (+!1919 lt!372515 lt!372506) lt!372511))))

(declare-fun lt!372504 () ListLongMap!8789)

(declare-fun lt!372509 () ListLongMap!8789)

(declare-fun lt!372503 () ListLongMap!8789)

(assert (=> b!825318 (and (= lt!372504 lt!372509) (= lt!372503 lt!372509) (= lt!372503 lt!372504))))

(declare-fun lt!372512 () ListLongMap!8789)

(assert (=> b!825318 (= lt!372509 (+!1919 lt!372512 lt!372506))))

(declare-fun lt!372505 () ListLongMap!8789)

(assert (=> b!825318 (= lt!372504 (+!1919 lt!372505 lt!372506))))

(declare-fun zeroValueBefore!34 () V!24957)

(declare-fun zeroValueAfter!34 () V!24957)

(declare-datatypes ((Unit!28285 0))(
  ( (Unit!28286) )
))
(declare-fun lt!372508 () Unit!28285)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!206 (ListLongMap!8789 (_ BitVec 64) V!24957 V!24957) Unit!28285)

(assert (=> b!825318 (= lt!372508 (addSameAsAddTwiceSameKeyDiffValues!206 lt!372505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!459345 () Bool)

(assert (=> b!825318 e!459345))

(declare-fun res!562617 () Bool)

(assert (=> b!825318 (=> (not res!562617) (not e!459345))))

(declare-fun lt!372514 () ListLongMap!8789)

(assert (=> b!825318 (= res!562617 (= lt!372514 lt!372512))))

(declare-fun lt!372510 () tuple2!9966)

(assert (=> b!825318 (= lt!372512 (+!1919 lt!372505 lt!372510))))

(assert (=> b!825318 (= lt!372505 (+!1919 lt!372515 lt!372511))))

(assert (=> b!825318 (= lt!372506 (tuple2!9967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!459338 () Bool)

(assert (=> b!825318 e!459338))

(declare-fun res!562615 () Bool)

(assert (=> b!825318 (=> (not res!562615) (not e!459338))))

(assert (=> b!825318 (= res!562615 (= lt!372514 (+!1919 (+!1919 lt!372515 lt!372510) lt!372511)))))

(declare-fun minValue!754 () V!24957)

(assert (=> b!825318 (= lt!372511 (tuple2!9967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!825318 (= lt!372510 (tuple2!9967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!46118 0))(
  ( (array!46119 (arr!22105 (Array (_ BitVec 32) (_ BitVec 64))) (size!22526 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46118)

(declare-datatypes ((ValueCell!7068 0))(
  ( (ValueCellFull!7068 (v!9964 V!24957)) (EmptyCell!7068) )
))
(declare-datatypes ((array!46120 0))(
  ( (array!46121 (arr!22106 (Array (_ BitVec 32) ValueCell!7068)) (size!22527 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46120)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2546 (array!46118 array!46120 (_ BitVec 32) (_ BitVec 32) V!24957 V!24957 (_ BitVec 32) Int) ListLongMap!8789)

(assert (=> b!825318 (= lt!372503 (getCurrentListMap!2546 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!825318 (= lt!372514 (getCurrentListMap!2546 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825319 () Bool)

(declare-fun res!562613 () Bool)

(declare-fun e!459340 () Bool)

(assert (=> b!825319 (=> (not res!562613) (not e!459340))))

(declare-datatypes ((List!15773 0))(
  ( (Nil!15770) (Cons!15769 (h!16898 (_ BitVec 64)) (t!22118 List!15773)) )
))
(declare-fun arrayNoDuplicates!0 (array!46118 (_ BitVec 32) List!15773) Bool)

(assert (=> b!825319 (= res!562613 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15770))))

(declare-fun b!825320 () Bool)

(declare-fun res!562612 () Bool)

(assert (=> b!825320 (=> (not res!562612) (not e!459340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46118 (_ BitVec 32)) Bool)

(assert (=> b!825320 (= res!562612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!825321 () Bool)

(declare-fun e!459341 () Bool)

(declare-fun e!459343 () Bool)

(declare-fun mapRes!24073 () Bool)

(assert (=> b!825321 (= e!459341 (and e!459343 mapRes!24073))))

(declare-fun condMapEmpty!24073 () Bool)

(declare-fun mapDefault!24073 () ValueCell!7068)

(assert (=> b!825321 (= condMapEmpty!24073 (= (arr!22106 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7068)) mapDefault!24073)))))

(declare-fun mapIsEmpty!24073 () Bool)

(assert (=> mapIsEmpty!24073 mapRes!24073))

(declare-fun b!825322 () Bool)

(declare-fun res!562614 () Bool)

(assert (=> b!825322 (=> (not res!562614) (not e!459340))))

(assert (=> b!825322 (= res!562614 (and (= (size!22527 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22526 _keys!976) (size!22527 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!372507 () ListLongMap!8789)

(declare-fun b!825323 () Bool)

(assert (=> b!825323 (= e!459345 (= lt!372503 (+!1919 (+!1919 lt!372507 lt!372511) lt!372506)))))

(declare-fun b!825324 () Bool)

(assert (=> b!825324 (= e!459338 (= lt!372503 (+!1919 (+!1919 lt!372507 (tuple2!9967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!372511)))))

(declare-fun b!825325 () Bool)

(declare-fun tp_is_empty!14967 () Bool)

(assert (=> b!825325 (= e!459343 tp_is_empty!14967)))

(declare-fun res!562616 () Bool)

(assert (=> start!71070 (=> (not res!562616) (not e!459340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71070 (= res!562616 (validMask!0 mask!1312))))

(assert (=> start!71070 e!459340))

(assert (=> start!71070 tp_is_empty!14967))

(declare-fun array_inv!17625 (array!46118) Bool)

(assert (=> start!71070 (array_inv!17625 _keys!976)))

(assert (=> start!71070 true))

(declare-fun array_inv!17626 (array!46120) Bool)

(assert (=> start!71070 (and (array_inv!17626 _values!788) e!459341)))

(assert (=> start!71070 tp!46527))

(declare-fun b!825326 () Bool)

(assert (=> b!825326 (= e!459340 (not e!459344))))

(declare-fun res!562618 () Bool)

(assert (=> b!825326 (=> res!562618 e!459344)))

(assert (=> b!825326 (= res!562618 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!825326 (= lt!372515 lt!372507)))

(declare-fun lt!372513 () Unit!28285)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!533 (array!46118 array!46120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24957 V!24957 V!24957 V!24957 (_ BitVec 32) Int) Unit!28285)

(assert (=> b!825326 (= lt!372513 (lemmaNoChangeToArrayThenSameMapNoExtras!533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2423 (array!46118 array!46120 (_ BitVec 32) (_ BitVec 32) V!24957 V!24957 (_ BitVec 32) Int) ListLongMap!8789)

(assert (=> b!825326 (= lt!372507 (getCurrentListMapNoExtraKeys!2423 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825326 (= lt!372515 (getCurrentListMapNoExtraKeys!2423 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825327 () Bool)

(declare-fun e!459342 () Bool)

(assert (=> b!825327 (= e!459342 tp_is_empty!14967)))

(declare-fun mapNonEmpty!24073 () Bool)

(declare-fun tp!46528 () Bool)

(assert (=> mapNonEmpty!24073 (= mapRes!24073 (and tp!46528 e!459342))))

(declare-fun mapRest!24073 () (Array (_ BitVec 32) ValueCell!7068))

(declare-fun mapValue!24073 () ValueCell!7068)

(declare-fun mapKey!24073 () (_ BitVec 32))

(assert (=> mapNonEmpty!24073 (= (arr!22106 _values!788) (store mapRest!24073 mapKey!24073 mapValue!24073))))

(assert (= (and start!71070 res!562616) b!825322))

(assert (= (and b!825322 res!562614) b!825320))

(assert (= (and b!825320 res!562612) b!825319))

(assert (= (and b!825319 res!562613) b!825326))

(assert (= (and b!825326 (not res!562618)) b!825318))

(assert (= (and b!825318 res!562615) b!825324))

(assert (= (and b!825318 res!562617) b!825323))

(assert (= (and b!825321 condMapEmpty!24073) mapIsEmpty!24073))

(assert (= (and b!825321 (not condMapEmpty!24073)) mapNonEmpty!24073))

(get-info :version)

(assert (= (and mapNonEmpty!24073 ((_ is ValueCellFull!7068) mapValue!24073)) b!825327))

(assert (= (and b!825321 ((_ is ValueCellFull!7068) mapDefault!24073)) b!825325))

(assert (= start!71070 b!825321))

(declare-fun m!767405 () Bool)

(assert (=> b!825324 m!767405))

(assert (=> b!825324 m!767405))

(declare-fun m!767407 () Bool)

(assert (=> b!825324 m!767407))

(declare-fun m!767409 () Bool)

(assert (=> mapNonEmpty!24073 m!767409))

(declare-fun m!767411 () Bool)

(assert (=> b!825323 m!767411))

(assert (=> b!825323 m!767411))

(declare-fun m!767413 () Bool)

(assert (=> b!825323 m!767413))

(declare-fun m!767415 () Bool)

(assert (=> b!825319 m!767415))

(declare-fun m!767417 () Bool)

(assert (=> start!71070 m!767417))

(declare-fun m!767419 () Bool)

(assert (=> start!71070 m!767419))

(declare-fun m!767421 () Bool)

(assert (=> start!71070 m!767421))

(declare-fun m!767423 () Bool)

(assert (=> b!825320 m!767423))

(declare-fun m!767425 () Bool)

(assert (=> b!825326 m!767425))

(declare-fun m!767427 () Bool)

(assert (=> b!825326 m!767427))

(declare-fun m!767429 () Bool)

(assert (=> b!825326 m!767429))

(declare-fun m!767431 () Bool)

(assert (=> b!825318 m!767431))

(declare-fun m!767433 () Bool)

(assert (=> b!825318 m!767433))

(declare-fun m!767435 () Bool)

(assert (=> b!825318 m!767435))

(declare-fun m!767437 () Bool)

(assert (=> b!825318 m!767437))

(declare-fun m!767439 () Bool)

(assert (=> b!825318 m!767439))

(declare-fun m!767441 () Bool)

(assert (=> b!825318 m!767441))

(declare-fun m!767443 () Bool)

(assert (=> b!825318 m!767443))

(declare-fun m!767445 () Bool)

(assert (=> b!825318 m!767445))

(assert (=> b!825318 m!767433))

(declare-fun m!767447 () Bool)

(assert (=> b!825318 m!767447))

(declare-fun m!767449 () Bool)

(assert (=> b!825318 m!767449))

(declare-fun m!767451 () Bool)

(assert (=> b!825318 m!767451))

(assert (=> b!825318 m!767441))

(check-sat (not b!825319) (not b!825324) (not b!825323) (not b!825318) (not b!825320) b_and!22171 (not mapNonEmpty!24073) tp_is_empty!14967 (not b!825326) (not start!71070) (not b_next!13257))
(check-sat b_and!22171 (not b_next!13257))
