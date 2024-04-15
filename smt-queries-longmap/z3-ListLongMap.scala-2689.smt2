; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39938 () Bool)

(assert start!39938)

(declare-fun b_free!10219 () Bool)

(declare-fun b_next!10219 () Bool)

(assert (=> start!39938 (= b_free!10219 (not b_next!10219))))

(declare-fun tp!36185 () Bool)

(declare-fun b_and!18071 () Bool)

(assert (=> start!39938 (= tp!36185 b_and!18071)))

(declare-fun mapIsEmpty!18678 () Bool)

(declare-fun mapRes!18678 () Bool)

(assert (=> mapIsEmpty!18678 mapRes!18678))

(declare-fun b!433719 () Bool)

(declare-fun e!256373 () Bool)

(declare-fun tp_is_empty!11371 () Bool)

(assert (=> b!433719 (= e!256373 tp_is_empty!11371)))

(declare-fun b!433720 () Bool)

(declare-fun e!256374 () Bool)

(declare-fun e!256377 () Bool)

(assert (=> b!433720 (= e!256374 e!256377)))

(declare-fun res!255367 () Bool)

(assert (=> b!433720 (=> (not res!255367) (not e!256377))))

(declare-datatypes ((array!26565 0))(
  ( (array!26566 (arr!12732 (Array (_ BitVec 32) (_ BitVec 64))) (size!13085 (_ BitVec 32))) )
))
(declare-fun lt!199204 () array!26565)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26565 (_ BitVec 32)) Bool)

(assert (=> b!433720 (= res!255367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!199204 mask!1025))))

(declare-fun _keys!709 () array!26565)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!433720 (= lt!199204 (array!26566 (store (arr!12732 _keys!709) i!563 k0!794) (size!13085 _keys!709)))))

(declare-fun b!433721 () Bool)

(declare-fun res!255376 () Bool)

(assert (=> b!433721 (=> (not res!255376) (not e!256377))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!433721 (= res!255376 (bvsle from!863 i!563))))

(declare-fun b!433722 () Bool)

(declare-fun res!255380 () Bool)

(assert (=> b!433722 (=> (not res!255380) (not e!256377))))

(declare-datatypes ((List!7573 0))(
  ( (Nil!7570) (Cons!7569 (h!8425 (_ BitVec 64)) (t!13232 List!7573)) )
))
(declare-fun arrayNoDuplicates!0 (array!26565 (_ BitVec 32) List!7573) Bool)

(assert (=> b!433722 (= res!255380 (arrayNoDuplicates!0 lt!199204 #b00000000000000000000000000000000 Nil!7570))))

(declare-fun b!433723 () Bool)

(declare-fun res!255381 () Bool)

(assert (=> b!433723 (=> (not res!255381) (not e!256374))))

(assert (=> b!433723 (= res!255381 (or (= (select (arr!12732 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12732 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18678 () Bool)

(declare-fun tp!36186 () Bool)

(declare-fun e!256369 () Bool)

(assert (=> mapNonEmpty!18678 (= mapRes!18678 (and tp!36186 e!256369))))

(declare-fun mapKey!18678 () (_ BitVec 32))

(declare-datatypes ((V!16267 0))(
  ( (V!16268 (val!5730 Int)) )
))
(declare-datatypes ((ValueCell!5342 0))(
  ( (ValueCellFull!5342 (v!7971 V!16267)) (EmptyCell!5342) )
))
(declare-fun mapValue!18678 () ValueCell!5342)

(declare-datatypes ((array!26567 0))(
  ( (array!26568 (arr!12733 (Array (_ BitVec 32) ValueCell!5342)) (size!13086 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26567)

(declare-fun mapRest!18678 () (Array (_ BitVec 32) ValueCell!5342))

(assert (=> mapNonEmpty!18678 (= (arr!12733 _values!549) (store mapRest!18678 mapKey!18678 mapValue!18678))))

(declare-fun b!433725 () Bool)

(declare-fun res!255375 () Bool)

(assert (=> b!433725 (=> (not res!255375) (not e!256374))))

(assert (=> b!433725 (= res!255375 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7570))))

(declare-fun b!433726 () Bool)

(declare-datatypes ((Unit!12819 0))(
  ( (Unit!12820) )
))
(declare-fun e!256371 () Unit!12819)

(declare-fun Unit!12821 () Unit!12819)

(assert (=> b!433726 (= e!256371 Unit!12821)))

(declare-fun lt!199206 () Unit!12819)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26565 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12819)

(assert (=> b!433726 (= lt!199206 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!433726 false))

(declare-fun b!433727 () Bool)

(declare-fun e!256368 () Bool)

(assert (=> b!433727 (= e!256377 e!256368)))

(declare-fun res!255373 () Bool)

(assert (=> b!433727 (=> (not res!255373) (not e!256368))))

(assert (=> b!433727 (= res!255373 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16267)

(declare-datatypes ((tuple2!7582 0))(
  ( (tuple2!7583 (_1!3802 (_ BitVec 64)) (_2!3802 V!16267)) )
))
(declare-datatypes ((List!7574 0))(
  ( (Nil!7571) (Cons!7570 (h!8426 tuple2!7582) (t!13233 List!7574)) )
))
(declare-datatypes ((ListLongMap!6485 0))(
  ( (ListLongMap!6486 (toList!3258 List!7574)) )
))
(declare-fun lt!199207 () ListLongMap!6485)

(declare-fun lt!199200 () array!26567)

(declare-fun minValue!515 () V!16267)

(declare-fun getCurrentListMapNoExtraKeys!1461 (array!26565 array!26567 (_ BitVec 32) (_ BitVec 32) V!16267 V!16267 (_ BitVec 32) Int) ListLongMap!6485)

(assert (=> b!433727 (= lt!199207 (getCurrentListMapNoExtraKeys!1461 lt!199204 lt!199200 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16267)

(assert (=> b!433727 (= lt!199200 (array!26568 (store (arr!12733 _values!549) i!563 (ValueCellFull!5342 v!412)) (size!13086 _values!549)))))

(declare-fun lt!199208 () ListLongMap!6485)

(assert (=> b!433727 (= lt!199208 (getCurrentListMapNoExtraKeys!1461 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!433728 () Bool)

(declare-fun res!255371 () Bool)

(assert (=> b!433728 (=> (not res!255371) (not e!256374))))

(assert (=> b!433728 (= res!255371 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13085 _keys!709))))))

(declare-fun b!433729 () Bool)

(declare-fun res!255369 () Bool)

(assert (=> b!433729 (=> (not res!255369) (not e!256374))))

(assert (=> b!433729 (= res!255369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!433730 () Bool)

(declare-fun res!255370 () Bool)

(assert (=> b!433730 (=> (not res!255370) (not e!256374))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!433730 (= res!255370 (validKeyInArray!0 k0!794))))

(declare-fun b!433731 () Bool)

(declare-fun res!255368 () Bool)

(assert (=> b!433731 (=> (not res!255368) (not e!256374))))

(assert (=> b!433731 (= res!255368 (and (= (size!13086 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13085 _keys!709) (size!13086 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!433732 () Bool)

(assert (=> b!433732 (= e!256369 tp_is_empty!11371)))

(declare-fun b!433733 () Bool)

(declare-fun e!256370 () Bool)

(assert (=> b!433733 (= e!256370 (and e!256373 mapRes!18678))))

(declare-fun condMapEmpty!18678 () Bool)

(declare-fun mapDefault!18678 () ValueCell!5342)

(assert (=> b!433733 (= condMapEmpty!18678 (= (arr!12733 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5342)) mapDefault!18678)))))

(declare-fun b!433734 () Bool)

(declare-fun e!256372 () Bool)

(assert (=> b!433734 (= e!256368 (not e!256372))))

(declare-fun res!255378 () Bool)

(assert (=> b!433734 (=> res!255378 e!256372)))

(assert (=> b!433734 (= res!255378 (not (validKeyInArray!0 (select (arr!12732 _keys!709) from!863))))))

(declare-fun lt!199210 () ListLongMap!6485)

(declare-fun lt!199202 () ListLongMap!6485)

(assert (=> b!433734 (= lt!199210 lt!199202)))

(declare-fun lt!199203 () ListLongMap!6485)

(declare-fun lt!199197 () tuple2!7582)

(declare-fun +!1433 (ListLongMap!6485 tuple2!7582) ListLongMap!6485)

(assert (=> b!433734 (= lt!199202 (+!1433 lt!199203 lt!199197))))

(assert (=> b!433734 (= lt!199210 (getCurrentListMapNoExtraKeys!1461 lt!199204 lt!199200 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!433734 (= lt!199197 (tuple2!7583 k0!794 v!412))))

(assert (=> b!433734 (= lt!199203 (getCurrentListMapNoExtraKeys!1461 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!199199 () Unit!12819)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!582 (array!26565 array!26567 (_ BitVec 32) (_ BitVec 32) V!16267 V!16267 (_ BitVec 32) (_ BitVec 64) V!16267 (_ BitVec 32) Int) Unit!12819)

(assert (=> b!433734 (= lt!199199 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!582 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!255379 () Bool)

(assert (=> start!39938 (=> (not res!255379) (not e!256374))))

(assert (=> start!39938 (= res!255379 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13085 _keys!709))))))

(assert (=> start!39938 e!256374))

(assert (=> start!39938 tp_is_empty!11371))

(assert (=> start!39938 tp!36185))

(assert (=> start!39938 true))

(declare-fun array_inv!9294 (array!26567) Bool)

(assert (=> start!39938 (and (array_inv!9294 _values!549) e!256370)))

(declare-fun array_inv!9295 (array!26565) Bool)

(assert (=> start!39938 (array_inv!9295 _keys!709)))

(declare-fun b!433724 () Bool)

(declare-fun e!256376 () Bool)

(assert (=> b!433724 (= e!256372 e!256376)))

(declare-fun res!255372 () Bool)

(assert (=> b!433724 (=> res!255372 e!256376)))

(assert (=> b!433724 (= res!255372 (= k0!794 (select (arr!12732 _keys!709) from!863)))))

(assert (=> b!433724 (not (= (select (arr!12732 _keys!709) from!863) k0!794))))

(declare-fun lt!199198 () Unit!12819)

(assert (=> b!433724 (= lt!199198 e!256371)))

(declare-fun c!55593 () Bool)

(assert (=> b!433724 (= c!55593 (= (select (arr!12732 _keys!709) from!863) k0!794))))

(declare-fun lt!199211 () ListLongMap!6485)

(assert (=> b!433724 (= lt!199207 lt!199211)))

(declare-fun lt!199201 () tuple2!7582)

(assert (=> b!433724 (= lt!199211 (+!1433 lt!199202 lt!199201))))

(declare-fun lt!199205 () V!16267)

(assert (=> b!433724 (= lt!199201 (tuple2!7583 (select (arr!12732 _keys!709) from!863) lt!199205))))

(declare-fun get!6338 (ValueCell!5342 V!16267) V!16267)

(declare-fun dynLambda!814 (Int (_ BitVec 64)) V!16267)

(assert (=> b!433724 (= lt!199205 (get!6338 (select (arr!12733 _values!549) from!863) (dynLambda!814 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433735 () Bool)

(declare-fun Unit!12822 () Unit!12819)

(assert (=> b!433735 (= e!256371 Unit!12822)))

(declare-fun b!433736 () Bool)

(assert (=> b!433736 (= e!256376 true)))

(assert (=> b!433736 (= lt!199211 (+!1433 (+!1433 lt!199203 lt!199201) lt!199197))))

(declare-fun lt!199209 () Unit!12819)

(declare-fun addCommutativeForDiffKeys!389 (ListLongMap!6485 (_ BitVec 64) V!16267 (_ BitVec 64) V!16267) Unit!12819)

(assert (=> b!433736 (= lt!199209 (addCommutativeForDiffKeys!389 lt!199203 k0!794 v!412 (select (arr!12732 _keys!709) from!863) lt!199205))))

(declare-fun b!433737 () Bool)

(declare-fun res!255377 () Bool)

(assert (=> b!433737 (=> (not res!255377) (not e!256374))))

(declare-fun arrayContainsKey!0 (array!26565 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!433737 (= res!255377 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!433738 () Bool)

(declare-fun res!255374 () Bool)

(assert (=> b!433738 (=> (not res!255374) (not e!256374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!433738 (= res!255374 (validMask!0 mask!1025))))

(assert (= (and start!39938 res!255379) b!433738))

(assert (= (and b!433738 res!255374) b!433731))

(assert (= (and b!433731 res!255368) b!433729))

(assert (= (and b!433729 res!255369) b!433725))

(assert (= (and b!433725 res!255375) b!433728))

(assert (= (and b!433728 res!255371) b!433730))

(assert (= (and b!433730 res!255370) b!433723))

(assert (= (and b!433723 res!255381) b!433737))

(assert (= (and b!433737 res!255377) b!433720))

(assert (= (and b!433720 res!255367) b!433722))

(assert (= (and b!433722 res!255380) b!433721))

(assert (= (and b!433721 res!255376) b!433727))

(assert (= (and b!433727 res!255373) b!433734))

(assert (= (and b!433734 (not res!255378)) b!433724))

(assert (= (and b!433724 c!55593) b!433726))

(assert (= (and b!433724 (not c!55593)) b!433735))

(assert (= (and b!433724 (not res!255372)) b!433736))

(assert (= (and b!433733 condMapEmpty!18678) mapIsEmpty!18678))

(assert (= (and b!433733 (not condMapEmpty!18678)) mapNonEmpty!18678))

(get-info :version)

(assert (= (and mapNonEmpty!18678 ((_ is ValueCellFull!5342) mapValue!18678)) b!433732))

(assert (= (and b!433733 ((_ is ValueCellFull!5342) mapDefault!18678)) b!433719))

(assert (= start!39938 b!433733))

(declare-fun b_lambda!9289 () Bool)

(assert (=> (not b_lambda!9289) (not b!433724)))

(declare-fun t!13231 () Bool)

(declare-fun tb!3617 () Bool)

(assert (=> (and start!39938 (= defaultEntry!557 defaultEntry!557) t!13231) tb!3617))

(declare-fun result!6769 () Bool)

(assert (=> tb!3617 (= result!6769 tp_is_empty!11371)))

(assert (=> b!433724 t!13231))

(declare-fun b_and!18073 () Bool)

(assert (= b_and!18071 (and (=> t!13231 result!6769) b_and!18073)))

(declare-fun m!421239 () Bool)

(assert (=> b!433729 m!421239))

(declare-fun m!421241 () Bool)

(assert (=> mapNonEmpty!18678 m!421241))

(declare-fun m!421243 () Bool)

(assert (=> start!39938 m!421243))

(declare-fun m!421245 () Bool)

(assert (=> start!39938 m!421245))

(declare-fun m!421247 () Bool)

(assert (=> b!433725 m!421247))

(declare-fun m!421249 () Bool)

(assert (=> b!433724 m!421249))

(declare-fun m!421251 () Bool)

(assert (=> b!433724 m!421251))

(declare-fun m!421253 () Bool)

(assert (=> b!433724 m!421253))

(declare-fun m!421255 () Bool)

(assert (=> b!433724 m!421255))

(assert (=> b!433724 m!421255))

(assert (=> b!433724 m!421251))

(declare-fun m!421257 () Bool)

(assert (=> b!433724 m!421257))

(assert (=> b!433734 m!421249))

(declare-fun m!421259 () Bool)

(assert (=> b!433734 m!421259))

(declare-fun m!421261 () Bool)

(assert (=> b!433734 m!421261))

(declare-fun m!421263 () Bool)

(assert (=> b!433734 m!421263))

(assert (=> b!433734 m!421249))

(declare-fun m!421265 () Bool)

(assert (=> b!433734 m!421265))

(declare-fun m!421267 () Bool)

(assert (=> b!433734 m!421267))

(declare-fun m!421269 () Bool)

(assert (=> b!433723 m!421269))

(declare-fun m!421271 () Bool)

(assert (=> b!433730 m!421271))

(declare-fun m!421273 () Bool)

(assert (=> b!433720 m!421273))

(declare-fun m!421275 () Bool)

(assert (=> b!433720 m!421275))

(declare-fun m!421277 () Bool)

(assert (=> b!433722 m!421277))

(declare-fun m!421279 () Bool)

(assert (=> b!433736 m!421279))

(assert (=> b!433736 m!421279))

(declare-fun m!421281 () Bool)

(assert (=> b!433736 m!421281))

(assert (=> b!433736 m!421249))

(assert (=> b!433736 m!421249))

(declare-fun m!421283 () Bool)

(assert (=> b!433736 m!421283))

(declare-fun m!421285 () Bool)

(assert (=> b!433727 m!421285))

(declare-fun m!421287 () Bool)

(assert (=> b!433727 m!421287))

(declare-fun m!421289 () Bool)

(assert (=> b!433727 m!421289))

(declare-fun m!421291 () Bool)

(assert (=> b!433738 m!421291))

(declare-fun m!421293 () Bool)

(assert (=> b!433726 m!421293))

(declare-fun m!421295 () Bool)

(assert (=> b!433737 m!421295))

(check-sat b_and!18073 (not b!433727) (not b!433738) (not b!433720) (not b!433734) (not b!433722) (not b!433726) (not b!433725) (not b!433737) (not b!433724) (not start!39938) (not mapNonEmpty!18678) tp_is_empty!11371 (not b_next!10219) (not b!433730) (not b!433736) (not b!433729) (not b_lambda!9289))
(check-sat b_and!18073 (not b_next!10219))
