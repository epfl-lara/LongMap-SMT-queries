; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41716 () Bool)

(assert start!41716)

(declare-fun b_free!11355 () Bool)

(declare-fun b_next!11355 () Bool)

(assert (=> start!41716 (= b_free!11355 (not b_next!11355))))

(declare-fun tp!40068 () Bool)

(declare-fun b_and!19711 () Bool)

(assert (=> start!41716 (= tp!40068 b_and!19711)))

(declare-fun res!278436 () Bool)

(declare-fun e!272272 () Bool)

(assert (=> start!41716 (=> (not res!278436) (not e!272272))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41716 (= res!278436 (validMask!0 mask!1365))))

(assert (=> start!41716 e!272272))

(declare-fun tp_is_empty!12783 () Bool)

(assert (=> start!41716 tp_is_empty!12783))

(assert (=> start!41716 tp!40068))

(assert (=> start!41716 true))

(declare-datatypes ((array!29347 0))(
  ( (array!29348 (arr!14103 (Array (_ BitVec 32) (_ BitVec 64))) (size!14455 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29347)

(declare-fun array_inv!10186 (array!29347) Bool)

(assert (=> start!41716 (array_inv!10186 _keys!1025)))

(declare-datatypes ((V!18149 0))(
  ( (V!18150 (val!6436 Int)) )
))
(declare-datatypes ((ValueCell!6048 0))(
  ( (ValueCellFull!6048 (v!8723 V!18149)) (EmptyCell!6048) )
))
(declare-datatypes ((array!29349 0))(
  ( (array!29350 (arr!14104 (Array (_ BitVec 32) ValueCell!6048)) (size!14456 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29349)

(declare-fun e!272270 () Bool)

(declare-fun array_inv!10187 (array!29349) Bool)

(assert (=> start!41716 (and (array_inv!10187 _values!833) e!272270)))

(declare-fun mapNonEmpty!20857 () Bool)

(declare-fun mapRes!20857 () Bool)

(declare-fun tp!40069 () Bool)

(declare-fun e!272273 () Bool)

(assert (=> mapNonEmpty!20857 (= mapRes!20857 (and tp!40069 e!272273))))

(declare-fun mapRest!20857 () (Array (_ BitVec 32) ValueCell!6048))

(declare-fun mapKey!20857 () (_ BitVec 32))

(declare-fun mapValue!20857 () ValueCell!6048)

(assert (=> mapNonEmpty!20857 (= (arr!14104 _values!833) (store mapRest!20857 mapKey!20857 mapValue!20857))))

(declare-fun b!465794 () Bool)

(assert (=> b!465794 (= e!272273 tp_is_empty!12783)))

(declare-fun b!465795 () Bool)

(declare-fun e!272271 () Bool)

(assert (=> b!465795 (= e!272270 (and e!272271 mapRes!20857))))

(declare-fun condMapEmpty!20857 () Bool)

(declare-fun mapDefault!20857 () ValueCell!6048)

(assert (=> b!465795 (= condMapEmpty!20857 (= (arr!14104 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6048)) mapDefault!20857)))))

(declare-fun b!465796 () Bool)

(declare-fun res!278433 () Bool)

(assert (=> b!465796 (=> (not res!278433) (not e!272272))))

(declare-datatypes ((List!8524 0))(
  ( (Nil!8521) (Cons!8520 (h!9376 (_ BitVec 64)) (t!14474 List!8524)) )
))
(declare-fun arrayNoDuplicates!0 (array!29347 (_ BitVec 32) List!8524) Bool)

(assert (=> b!465796 (= res!278433 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8521))))

(declare-fun b!465797 () Bool)

(assert (=> b!465797 (= e!272271 tp_is_empty!12783)))

(declare-fun b!465798 () Bool)

(declare-fun res!278435 () Bool)

(assert (=> b!465798 (=> (not res!278435) (not e!272272))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!465798 (= res!278435 (and (= (size!14456 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14455 _keys!1025) (size!14456 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!465799 () Bool)

(declare-fun e!272268 () Bool)

(assert (=> b!465799 (= e!272272 (not e!272268))))

(declare-fun res!278437 () Bool)

(assert (=> b!465799 (=> res!278437 e!272268)))

(assert (=> b!465799 (= res!278437 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!8432 0))(
  ( (tuple2!8433 (_1!4227 (_ BitVec 64)) (_2!4227 V!18149)) )
))
(declare-datatypes ((List!8525 0))(
  ( (Nil!8522) (Cons!8521 (h!9377 tuple2!8432) (t!14475 List!8525)) )
))
(declare-datatypes ((ListLongMap!7345 0))(
  ( (ListLongMap!7346 (toList!3688 List!8525)) )
))
(declare-fun lt!210383 () ListLongMap!7345)

(declare-fun lt!210382 () ListLongMap!7345)

(assert (=> b!465799 (= lt!210383 lt!210382)))

(declare-datatypes ((Unit!13544 0))(
  ( (Unit!13545) )
))
(declare-fun lt!210385 () Unit!13544)

(declare-fun minValueBefore!38 () V!18149)

(declare-fun zeroValue!794 () V!18149)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18149)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!48 (array!29347 array!29349 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18149 V!18149 V!18149 V!18149 (_ BitVec 32) Int) Unit!13544)

(assert (=> b!465799 (= lt!210385 (lemmaNoChangeToArrayThenSameMapNoExtras!48 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1868 (array!29347 array!29349 (_ BitVec 32) (_ BitVec 32) V!18149 V!18149 (_ BitVec 32) Int) ListLongMap!7345)

(assert (=> b!465799 (= lt!210382 (getCurrentListMapNoExtraKeys!1868 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465799 (= lt!210383 (getCurrentListMapNoExtraKeys!1868 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!20857 () Bool)

(assert (=> mapIsEmpty!20857 mapRes!20857))

(declare-fun b!465800 () Bool)

(declare-fun res!278434 () Bool)

(assert (=> b!465800 (=> (not res!278434) (not e!272272))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29347 (_ BitVec 32)) Bool)

(assert (=> b!465800 (= res!278434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465801 () Bool)

(assert (=> b!465801 (= e!272268 true)))

(declare-fun lt!210384 () ListLongMap!7345)

(declare-fun getCurrentListMap!2141 (array!29347 array!29349 (_ BitVec 32) (_ BitVec 32) V!18149 V!18149 (_ BitVec 32) Int) ListLongMap!7345)

(assert (=> b!465801 (= lt!210384 (getCurrentListMap!2141 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210381 () ListLongMap!7345)

(declare-fun +!1647 (ListLongMap!7345 tuple2!8432) ListLongMap!7345)

(assert (=> b!465801 (= lt!210381 (+!1647 (getCurrentListMap!2141 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8433 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(assert (= (and start!41716 res!278436) b!465798))

(assert (= (and b!465798 res!278435) b!465800))

(assert (= (and b!465800 res!278434) b!465796))

(assert (= (and b!465796 res!278433) b!465799))

(assert (= (and b!465799 (not res!278437)) b!465801))

(assert (= (and b!465795 condMapEmpty!20857) mapIsEmpty!20857))

(assert (= (and b!465795 (not condMapEmpty!20857)) mapNonEmpty!20857))

(get-info :version)

(assert (= (and mapNonEmpty!20857 ((_ is ValueCellFull!6048) mapValue!20857)) b!465794))

(assert (= (and b!465795 ((_ is ValueCellFull!6048) mapDefault!20857)) b!465797))

(assert (= start!41716 b!465795))

(declare-fun m!448025 () Bool)

(assert (=> b!465796 m!448025))

(declare-fun m!448027 () Bool)

(assert (=> b!465801 m!448027))

(declare-fun m!448029 () Bool)

(assert (=> b!465801 m!448029))

(assert (=> b!465801 m!448029))

(declare-fun m!448031 () Bool)

(assert (=> b!465801 m!448031))

(declare-fun m!448033 () Bool)

(assert (=> mapNonEmpty!20857 m!448033))

(declare-fun m!448035 () Bool)

(assert (=> start!41716 m!448035))

(declare-fun m!448037 () Bool)

(assert (=> start!41716 m!448037))

(declare-fun m!448039 () Bool)

(assert (=> start!41716 m!448039))

(declare-fun m!448041 () Bool)

(assert (=> b!465800 m!448041))

(declare-fun m!448043 () Bool)

(assert (=> b!465799 m!448043))

(declare-fun m!448045 () Bool)

(assert (=> b!465799 m!448045))

(declare-fun m!448047 () Bool)

(assert (=> b!465799 m!448047))

(check-sat (not b!465796) tp_is_empty!12783 (not b!465800) (not b!465799) (not b!465801) b_and!19711 (not mapNonEmpty!20857) (not start!41716) (not b_next!11355))
(check-sat b_and!19711 (not b_next!11355))
