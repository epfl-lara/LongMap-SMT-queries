; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39938 () Bool)

(assert start!39938)

(declare-fun b_free!10219 () Bool)

(declare-fun b_next!10219 () Bool)

(assert (=> start!39938 (= b_free!10219 (not b_next!10219))))

(declare-fun tp!36186 () Bool)

(declare-fun b_and!18111 () Bool)

(assert (=> start!39938 (= tp!36186 b_and!18111)))

(declare-fun b!433941 () Bool)

(declare-fun e!256519 () Bool)

(declare-fun e!256517 () Bool)

(assert (=> b!433941 (= e!256519 e!256517)))

(declare-fun res!255498 () Bool)

(assert (=> b!433941 (=> res!255498 e!256517)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((array!26578 0))(
  ( (array!26579 (arr!12738 (Array (_ BitVec 32) (_ BitVec 64))) (size!13090 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26578)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!433941 (= res!255498 (= k0!794 (select (arr!12738 _keys!709) from!863)))))

(assert (=> b!433941 (not (= (select (arr!12738 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12862 0))(
  ( (Unit!12863) )
))
(declare-fun lt!199450 () Unit!12862)

(declare-fun e!256518 () Unit!12862)

(assert (=> b!433941 (= lt!199450 e!256518)))

(declare-fun c!55641 () Bool)

(assert (=> b!433941 (= c!55641 (= (select (arr!12738 _keys!709) from!863) k0!794))))

(declare-datatypes ((V!16267 0))(
  ( (V!16268 (val!5730 Int)) )
))
(declare-datatypes ((tuple2!7484 0))(
  ( (tuple2!7485 (_1!3753 (_ BitVec 64)) (_2!3753 V!16267)) )
))
(declare-datatypes ((List!7475 0))(
  ( (Nil!7472) (Cons!7471 (h!8327 tuple2!7484) (t!13135 List!7475)) )
))
(declare-datatypes ((ListLongMap!6399 0))(
  ( (ListLongMap!6400 (toList!3215 List!7475)) )
))
(declare-fun lt!199456 () ListLongMap!6399)

(declare-fun lt!199464 () ListLongMap!6399)

(assert (=> b!433941 (= lt!199456 lt!199464)))

(declare-fun lt!199461 () ListLongMap!6399)

(declare-fun lt!199455 () tuple2!7484)

(declare-fun +!1422 (ListLongMap!6399 tuple2!7484) ListLongMap!6399)

(assert (=> b!433941 (= lt!199464 (+!1422 lt!199461 lt!199455))))

(declare-fun lt!199460 () V!16267)

(assert (=> b!433941 (= lt!199455 (tuple2!7485 (select (arr!12738 _keys!709) from!863) lt!199460))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5342 0))(
  ( (ValueCellFull!5342 (v!7978 V!16267)) (EmptyCell!5342) )
))
(declare-datatypes ((array!26580 0))(
  ( (array!26581 (arr!12739 (Array (_ BitVec 32) ValueCell!5342)) (size!13091 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26580)

(declare-fun get!6353 (ValueCell!5342 V!16267) V!16267)

(declare-fun dynLambda!826 (Int (_ BitVec 64)) V!16267)

(assert (=> b!433941 (= lt!199460 (get!6353 (select (arr!12739 _values!549) from!863) (dynLambda!826 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433942 () Bool)

(declare-fun res!255500 () Bool)

(declare-fun e!256512 () Bool)

(assert (=> b!433942 (=> (not res!255500) (not e!256512))))

(declare-fun lt!199451 () array!26578)

(declare-datatypes ((List!7476 0))(
  ( (Nil!7473) (Cons!7472 (h!8328 (_ BitVec 64)) (t!13136 List!7476)) )
))
(declare-fun arrayNoDuplicates!0 (array!26578 (_ BitVec 32) List!7476) Bool)

(assert (=> b!433942 (= res!255500 (arrayNoDuplicates!0 lt!199451 #b00000000000000000000000000000000 Nil!7473))))

(declare-fun b!433943 () Bool)

(declare-fun res!255505 () Bool)

(declare-fun e!256515 () Bool)

(assert (=> b!433943 (=> (not res!255505) (not e!256515))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!433943 (= res!255505 (or (= (select (arr!12738 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12738 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433944 () Bool)

(declare-fun res!255496 () Bool)

(assert (=> b!433944 (=> (not res!255496) (not e!256515))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26578 (_ BitVec 32)) Bool)

(assert (=> b!433944 (= res!255496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!433945 () Bool)

(declare-fun res!255493 () Bool)

(assert (=> b!433945 (=> (not res!255493) (not e!256515))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!433945 (= res!255493 (validKeyInArray!0 k0!794))))

(declare-fun b!433946 () Bool)

(declare-fun Unit!12864 () Unit!12862)

(assert (=> b!433946 (= e!256518 Unit!12864)))

(declare-fun res!255502 () Bool)

(assert (=> start!39938 (=> (not res!255502) (not e!256515))))

(assert (=> start!39938 (= res!255502 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13090 _keys!709))))))

(assert (=> start!39938 e!256515))

(declare-fun tp_is_empty!11371 () Bool)

(assert (=> start!39938 tp_is_empty!11371))

(assert (=> start!39938 tp!36186))

(assert (=> start!39938 true))

(declare-fun e!256516 () Bool)

(declare-fun array_inv!9320 (array!26580) Bool)

(assert (=> start!39938 (and (array_inv!9320 _values!549) e!256516)))

(declare-fun array_inv!9321 (array!26578) Bool)

(assert (=> start!39938 (array_inv!9321 _keys!709)))

(declare-fun b!433947 () Bool)

(declare-fun e!256511 () Bool)

(assert (=> b!433947 (= e!256511 tp_is_empty!11371)))

(declare-fun b!433948 () Bool)

(declare-fun e!256510 () Bool)

(assert (=> b!433948 (= e!256510 tp_is_empty!11371)))

(declare-fun b!433949 () Bool)

(declare-fun res!255504 () Bool)

(assert (=> b!433949 (=> (not res!255504) (not e!256515))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!433949 (= res!255504 (validMask!0 mask!1025))))

(declare-fun b!433950 () Bool)

(declare-fun mapRes!18678 () Bool)

(assert (=> b!433950 (= e!256516 (and e!256511 mapRes!18678))))

(declare-fun condMapEmpty!18678 () Bool)

(declare-fun mapDefault!18678 () ValueCell!5342)

(assert (=> b!433950 (= condMapEmpty!18678 (= (arr!12739 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5342)) mapDefault!18678)))))

(declare-fun b!433951 () Bool)

(declare-fun res!255499 () Bool)

(assert (=> b!433951 (=> (not res!255499) (not e!256515))))

(declare-fun arrayContainsKey!0 (array!26578 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!433951 (= res!255499 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!433952 () Bool)

(declare-fun e!256513 () Bool)

(assert (=> b!433952 (= e!256513 (not e!256519))))

(declare-fun res!255507 () Bool)

(assert (=> b!433952 (=> res!255507 e!256519)))

(assert (=> b!433952 (= res!255507 (not (validKeyInArray!0 (select (arr!12738 _keys!709) from!863))))))

(declare-fun lt!199454 () ListLongMap!6399)

(assert (=> b!433952 (= lt!199454 lt!199461)))

(declare-fun lt!199463 () ListLongMap!6399)

(declare-fun lt!199459 () tuple2!7484)

(assert (=> b!433952 (= lt!199461 (+!1422 lt!199463 lt!199459))))

(declare-fun minValue!515 () V!16267)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!199452 () array!26580)

(declare-fun zeroValue!515 () V!16267)

(declare-fun getCurrentListMapNoExtraKeys!1451 (array!26578 array!26580 (_ BitVec 32) (_ BitVec 32) V!16267 V!16267 (_ BitVec 32) Int) ListLongMap!6399)

(assert (=> b!433952 (= lt!199454 (getCurrentListMapNoExtraKeys!1451 lt!199451 lt!199452 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!16267)

(assert (=> b!433952 (= lt!199459 (tuple2!7485 k0!794 v!412))))

(assert (=> b!433952 (= lt!199463 (getCurrentListMapNoExtraKeys!1451 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!199458 () Unit!12862)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!588 (array!26578 array!26580 (_ BitVec 32) (_ BitVec 32) V!16267 V!16267 (_ BitVec 32) (_ BitVec 64) V!16267 (_ BitVec 32) Int) Unit!12862)

(assert (=> b!433952 (= lt!199458 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!588 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!433953 () Bool)

(declare-fun res!255495 () Bool)

(assert (=> b!433953 (=> (not res!255495) (not e!256515))))

(assert (=> b!433953 (= res!255495 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7473))))

(declare-fun b!433954 () Bool)

(declare-fun Unit!12865 () Unit!12862)

(assert (=> b!433954 (= e!256518 Unit!12865)))

(declare-fun lt!199462 () Unit!12862)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26578 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12862)

(assert (=> b!433954 (= lt!199462 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!433954 false))

(declare-fun mapIsEmpty!18678 () Bool)

(assert (=> mapIsEmpty!18678 mapRes!18678))

(declare-fun b!433955 () Bool)

(assert (=> b!433955 (= e!256517 true)))

(assert (=> b!433955 (= lt!199464 (+!1422 (+!1422 lt!199463 lt!199455) lt!199459))))

(declare-fun lt!199453 () Unit!12862)

(declare-fun addCommutativeForDiffKeys!394 (ListLongMap!6399 (_ BitVec 64) V!16267 (_ BitVec 64) V!16267) Unit!12862)

(assert (=> b!433955 (= lt!199453 (addCommutativeForDiffKeys!394 lt!199463 k0!794 v!412 (select (arr!12738 _keys!709) from!863) lt!199460))))

(declare-fun b!433956 () Bool)

(declare-fun res!255506 () Bool)

(assert (=> b!433956 (=> (not res!255506) (not e!256515))))

(assert (=> b!433956 (= res!255506 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13090 _keys!709))))))

(declare-fun b!433957 () Bool)

(declare-fun res!255501 () Bool)

(assert (=> b!433957 (=> (not res!255501) (not e!256512))))

(assert (=> b!433957 (= res!255501 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!18678 () Bool)

(declare-fun tp!36185 () Bool)

(assert (=> mapNonEmpty!18678 (= mapRes!18678 (and tp!36185 e!256510))))

(declare-fun mapRest!18678 () (Array (_ BitVec 32) ValueCell!5342))

(declare-fun mapKey!18678 () (_ BitVec 32))

(declare-fun mapValue!18678 () ValueCell!5342)

(assert (=> mapNonEmpty!18678 (= (arr!12739 _values!549) (store mapRest!18678 mapKey!18678 mapValue!18678))))

(declare-fun b!433958 () Bool)

(declare-fun res!255494 () Bool)

(assert (=> b!433958 (=> (not res!255494) (not e!256515))))

(assert (=> b!433958 (= res!255494 (and (= (size!13091 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13090 _keys!709) (size!13091 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!433959 () Bool)

(assert (=> b!433959 (= e!256515 e!256512)))

(declare-fun res!255497 () Bool)

(assert (=> b!433959 (=> (not res!255497) (not e!256512))))

(assert (=> b!433959 (= res!255497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!199451 mask!1025))))

(assert (=> b!433959 (= lt!199451 (array!26579 (store (arr!12738 _keys!709) i!563 k0!794) (size!13090 _keys!709)))))

(declare-fun b!433960 () Bool)

(assert (=> b!433960 (= e!256512 e!256513)))

(declare-fun res!255503 () Bool)

(assert (=> b!433960 (=> (not res!255503) (not e!256513))))

(assert (=> b!433960 (= res!255503 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!433960 (= lt!199456 (getCurrentListMapNoExtraKeys!1451 lt!199451 lt!199452 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!433960 (= lt!199452 (array!26581 (store (arr!12739 _values!549) i!563 (ValueCellFull!5342 v!412)) (size!13091 _values!549)))))

(declare-fun lt!199457 () ListLongMap!6399)

(assert (=> b!433960 (= lt!199457 (getCurrentListMapNoExtraKeys!1451 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!39938 res!255502) b!433949))

(assert (= (and b!433949 res!255504) b!433958))

(assert (= (and b!433958 res!255494) b!433944))

(assert (= (and b!433944 res!255496) b!433953))

(assert (= (and b!433953 res!255495) b!433956))

(assert (= (and b!433956 res!255506) b!433945))

(assert (= (and b!433945 res!255493) b!433943))

(assert (= (and b!433943 res!255505) b!433951))

(assert (= (and b!433951 res!255499) b!433959))

(assert (= (and b!433959 res!255497) b!433942))

(assert (= (and b!433942 res!255500) b!433957))

(assert (= (and b!433957 res!255501) b!433960))

(assert (= (and b!433960 res!255503) b!433952))

(assert (= (and b!433952 (not res!255507)) b!433941))

(assert (= (and b!433941 c!55641) b!433954))

(assert (= (and b!433941 (not c!55641)) b!433946))

(assert (= (and b!433941 (not res!255498)) b!433955))

(assert (= (and b!433950 condMapEmpty!18678) mapIsEmpty!18678))

(assert (= (and b!433950 (not condMapEmpty!18678)) mapNonEmpty!18678))

(get-info :version)

(assert (= (and mapNonEmpty!18678 ((_ is ValueCellFull!5342) mapValue!18678)) b!433948))

(assert (= (and b!433950 ((_ is ValueCellFull!5342) mapDefault!18678)) b!433947))

(assert (= start!39938 b!433950))

(declare-fun b_lambda!9329 () Bool)

(assert (=> (not b_lambda!9329) (not b!433941)))

(declare-fun t!13134 () Bool)

(declare-fun tb!3617 () Bool)

(assert (=> (and start!39938 (= defaultEntry!557 defaultEntry!557) t!13134) tb!3617))

(declare-fun result!6769 () Bool)

(assert (=> tb!3617 (= result!6769 tp_is_empty!11371)))

(assert (=> b!433941 t!13134))

(declare-fun b_and!18113 () Bool)

(assert (= b_and!18111 (and (=> t!13134 result!6769) b_and!18113)))

(declare-fun m!422189 () Bool)

(assert (=> b!433955 m!422189))

(assert (=> b!433955 m!422189))

(declare-fun m!422191 () Bool)

(assert (=> b!433955 m!422191))

(declare-fun m!422193 () Bool)

(assert (=> b!433955 m!422193))

(assert (=> b!433955 m!422193))

(declare-fun m!422195 () Bool)

(assert (=> b!433955 m!422195))

(declare-fun m!422197 () Bool)

(assert (=> b!433953 m!422197))

(assert (=> b!433952 m!422193))

(declare-fun m!422199 () Bool)

(assert (=> b!433952 m!422199))

(declare-fun m!422201 () Bool)

(assert (=> b!433952 m!422201))

(declare-fun m!422203 () Bool)

(assert (=> b!433952 m!422203))

(assert (=> b!433952 m!422193))

(declare-fun m!422205 () Bool)

(assert (=> b!433952 m!422205))

(declare-fun m!422207 () Bool)

(assert (=> b!433952 m!422207))

(assert (=> b!433941 m!422193))

(declare-fun m!422209 () Bool)

(assert (=> b!433941 m!422209))

(declare-fun m!422211 () Bool)

(assert (=> b!433941 m!422211))

(declare-fun m!422213 () Bool)

(assert (=> b!433941 m!422213))

(assert (=> b!433941 m!422213))

(assert (=> b!433941 m!422211))

(declare-fun m!422215 () Bool)

(assert (=> b!433941 m!422215))

(declare-fun m!422217 () Bool)

(assert (=> b!433945 m!422217))

(declare-fun m!422219 () Bool)

(assert (=> b!433951 m!422219))

(declare-fun m!422221 () Bool)

(assert (=> b!433960 m!422221))

(declare-fun m!422223 () Bool)

(assert (=> b!433960 m!422223))

(declare-fun m!422225 () Bool)

(assert (=> b!433960 m!422225))

(declare-fun m!422227 () Bool)

(assert (=> b!433954 m!422227))

(declare-fun m!422229 () Bool)

(assert (=> b!433942 m!422229))

(declare-fun m!422231 () Bool)

(assert (=> b!433944 m!422231))

(declare-fun m!422233 () Bool)

(assert (=> start!39938 m!422233))

(declare-fun m!422235 () Bool)

(assert (=> start!39938 m!422235))

(declare-fun m!422237 () Bool)

(assert (=> mapNonEmpty!18678 m!422237))

(declare-fun m!422239 () Bool)

(assert (=> b!433949 m!422239))

(declare-fun m!422241 () Bool)

(assert (=> b!433943 m!422241))

(declare-fun m!422243 () Bool)

(assert (=> b!433959 m!422243))

(declare-fun m!422245 () Bool)

(assert (=> b!433959 m!422245))

(check-sat (not b!433953) (not b!433949) (not start!39938) (not b!433952) (not b!433945) (not b_next!10219) (not b!433955) (not b!433954) (not b!433959) (not b!433941) (not mapNonEmpty!18678) (not b!433960) b_and!18113 tp_is_empty!11371 (not b!433944) (not b!433951) (not b_lambda!9329) (not b!433942))
(check-sat b_and!18113 (not b_next!10219))
