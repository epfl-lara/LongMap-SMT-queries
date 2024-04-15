; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42136 () Bool)

(assert start!42136)

(declare-fun b_free!11683 () Bool)

(declare-fun b_next!11683 () Bool)

(assert (=> start!42136 (= b_free!11683 (not b_next!11683))))

(declare-fun tp!41070 () Bool)

(declare-fun b_and!20079 () Bool)

(assert (=> start!42136 (= tp!41070 b_and!20079)))

(declare-fun b!470281 () Bool)

(declare-fun res!281034 () Bool)

(declare-fun e!275505 () Bool)

(assert (=> b!470281 (=> (not res!281034) (not e!275505))))

(declare-datatypes ((array!29971 0))(
  ( (array!29972 (arr!14409 (Array (_ BitVec 32) (_ BitVec 64))) (size!14762 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29971)

(declare-datatypes ((List!8796 0))(
  ( (Nil!8793) (Cons!8792 (h!9648 (_ BitVec 64)) (t!14749 List!8796)) )
))
(declare-fun arrayNoDuplicates!0 (array!29971 (_ BitVec 32) List!8796) Bool)

(assert (=> b!470281 (= res!281034 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8793))))

(declare-fun b!470282 () Bool)

(declare-fun res!281036 () Bool)

(assert (=> b!470282 (=> (not res!281036) (not e!275505))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29971 (_ BitVec 32)) Bool)

(assert (=> b!470282 (= res!281036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470283 () Bool)

(assert (=> b!470283 (= e!275505 (not true))))

(declare-datatypes ((V!18587 0))(
  ( (V!18588 (val!6600 Int)) )
))
(declare-datatypes ((tuple2!8726 0))(
  ( (tuple2!8727 (_1!4374 (_ BitVec 64)) (_2!4374 V!18587)) )
))
(declare-datatypes ((List!8797 0))(
  ( (Nil!8794) (Cons!8793 (h!9649 tuple2!8726) (t!14750 List!8797)) )
))
(declare-datatypes ((ListLongMap!7629 0))(
  ( (ListLongMap!7630 (toList!3830 List!8797)) )
))
(declare-fun lt!213269 () ListLongMap!7629)

(declare-fun lt!213268 () ListLongMap!7629)

(assert (=> b!470283 (= lt!213269 lt!213268)))

(declare-datatypes ((Unit!13761 0))(
  ( (Unit!13762) )
))
(declare-fun lt!213270 () Unit!13761)

(declare-fun minValueBefore!38 () V!18587)

(declare-fun zeroValue!794 () V!18587)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6212 0))(
  ( (ValueCellFull!6212 (v!8885 V!18587)) (EmptyCell!6212) )
))
(declare-datatypes ((array!29973 0))(
  ( (array!29974 (arr!14410 (Array (_ BitVec 32) ValueCell!6212)) (size!14763 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29973)

(declare-fun minValueAfter!38 () V!18587)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!162 (array!29971 array!29973 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18587 V!18587 V!18587 V!18587 (_ BitVec 32) Int) Unit!13761)

(assert (=> b!470283 (= lt!213270 (lemmaNoChangeToArrayThenSameMapNoExtras!162 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2005 (array!29971 array!29973 (_ BitVec 32) (_ BitVec 32) V!18587 V!18587 (_ BitVec 32) Int) ListLongMap!7629)

(assert (=> b!470283 (= lt!213268 (getCurrentListMapNoExtraKeys!2005 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470283 (= lt!213269 (getCurrentListMapNoExtraKeys!2005 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!281037 () Bool)

(assert (=> start!42136 (=> (not res!281037) (not e!275505))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42136 (= res!281037 (validMask!0 mask!1365))))

(assert (=> start!42136 e!275505))

(declare-fun tp_is_empty!13111 () Bool)

(assert (=> start!42136 tp_is_empty!13111))

(assert (=> start!42136 tp!41070))

(assert (=> start!42136 true))

(declare-fun array_inv!10478 (array!29971) Bool)

(assert (=> start!42136 (array_inv!10478 _keys!1025)))

(declare-fun e!275502 () Bool)

(declare-fun array_inv!10479 (array!29973) Bool)

(assert (=> start!42136 (and (array_inv!10479 _values!833) e!275502)))

(declare-fun mapNonEmpty!21367 () Bool)

(declare-fun mapRes!21367 () Bool)

(declare-fun tp!41071 () Bool)

(declare-fun e!275504 () Bool)

(assert (=> mapNonEmpty!21367 (= mapRes!21367 (and tp!41071 e!275504))))

(declare-fun mapRest!21367 () (Array (_ BitVec 32) ValueCell!6212))

(declare-fun mapKey!21367 () (_ BitVec 32))

(declare-fun mapValue!21367 () ValueCell!6212)

(assert (=> mapNonEmpty!21367 (= (arr!14410 _values!833) (store mapRest!21367 mapKey!21367 mapValue!21367))))

(declare-fun b!470284 () Bool)

(assert (=> b!470284 (= e!275504 tp_is_empty!13111)))

(declare-fun mapIsEmpty!21367 () Bool)

(assert (=> mapIsEmpty!21367 mapRes!21367))

(declare-fun b!470285 () Bool)

(declare-fun e!275503 () Bool)

(assert (=> b!470285 (= e!275502 (and e!275503 mapRes!21367))))

(declare-fun condMapEmpty!21367 () Bool)

(declare-fun mapDefault!21367 () ValueCell!6212)

(assert (=> b!470285 (= condMapEmpty!21367 (= (arr!14410 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6212)) mapDefault!21367)))))

(declare-fun b!470286 () Bool)

(declare-fun res!281035 () Bool)

(assert (=> b!470286 (=> (not res!281035) (not e!275505))))

(assert (=> b!470286 (= res!281035 (and (= (size!14763 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14762 _keys!1025) (size!14763 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470287 () Bool)

(assert (=> b!470287 (= e!275503 tp_is_empty!13111)))

(assert (= (and start!42136 res!281037) b!470286))

(assert (= (and b!470286 res!281035) b!470282))

(assert (= (and b!470282 res!281036) b!470281))

(assert (= (and b!470281 res!281034) b!470283))

(assert (= (and b!470285 condMapEmpty!21367) mapIsEmpty!21367))

(assert (= (and b!470285 (not condMapEmpty!21367)) mapNonEmpty!21367))

(get-info :version)

(assert (= (and mapNonEmpty!21367 ((_ is ValueCellFull!6212) mapValue!21367)) b!470284))

(assert (= (and b!470285 ((_ is ValueCellFull!6212) mapDefault!21367)) b!470287))

(assert (= start!42136 b!470285))

(declare-fun m!452091 () Bool)

(assert (=> mapNonEmpty!21367 m!452091))

(declare-fun m!452093 () Bool)

(assert (=> start!42136 m!452093))

(declare-fun m!452095 () Bool)

(assert (=> start!42136 m!452095))

(declare-fun m!452097 () Bool)

(assert (=> start!42136 m!452097))

(declare-fun m!452099 () Bool)

(assert (=> b!470282 m!452099))

(declare-fun m!452101 () Bool)

(assert (=> b!470281 m!452101))

(declare-fun m!452103 () Bool)

(assert (=> b!470283 m!452103))

(declare-fun m!452105 () Bool)

(assert (=> b!470283 m!452105))

(declare-fun m!452107 () Bool)

(assert (=> b!470283 m!452107))

(check-sat (not b!470281) (not b_next!11683) tp_is_empty!13111 (not mapNonEmpty!21367) b_and!20079 (not b!470283) (not start!42136) (not b!470282))
(check-sat b_and!20079 (not b_next!11683))
