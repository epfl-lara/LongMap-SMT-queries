; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39914 () Bool)

(assert start!39914)

(declare-fun b_free!10195 () Bool)

(declare-fun b_next!10195 () Bool)

(assert (=> start!39914 (= b_free!10195 (not b_next!10195))))

(declare-fun tp!36114 () Bool)

(declare-fun b_and!18063 () Bool)

(assert (=> start!39914 (= tp!36114 b_and!18063)))

(declare-fun b!433197 () Bool)

(declare-fun e!256155 () Bool)

(declare-fun e!256151 () Bool)

(assert (=> b!433197 (= e!256155 e!256151)))

(declare-fun res!254959 () Bool)

(assert (=> b!433197 (=> (not res!254959) (not e!256151))))

(declare-datatypes ((array!26530 0))(
  ( (array!26531 (arr!12714 (Array (_ BitVec 32) (_ BitVec 64))) (size!13066 (_ BitVec 32))) )
))
(declare-fun lt!198920 () array!26530)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26530 (_ BitVec 32)) Bool)

(assert (=> b!433197 (= res!254959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!198920 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!26530)

(assert (=> b!433197 (= lt!198920 (array!26531 (store (arr!12714 _keys!709) i!563 k0!794) (size!13066 _keys!709)))))

(declare-fun b!433198 () Bool)

(declare-fun res!254966 () Bool)

(assert (=> b!433198 (=> (not res!254966) (not e!256155))))

(assert (=> b!433198 (= res!254966 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13066 _keys!709))))))

(declare-fun b!433199 () Bool)

(declare-fun e!256154 () Bool)

(declare-fun e!256150 () Bool)

(assert (=> b!433199 (= e!256154 e!256150)))

(declare-fun res!254958 () Bool)

(assert (=> b!433199 (=> res!254958 e!256150)))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!433199 (= res!254958 (= k0!794 (select (arr!12714 _keys!709) from!863)))))

(assert (=> b!433199 (not (= (select (arr!12714 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12818 0))(
  ( (Unit!12819) )
))
(declare-fun lt!198922 () Unit!12818)

(declare-fun e!256158 () Unit!12818)

(assert (=> b!433199 (= lt!198922 e!256158)))

(declare-fun c!55605 () Bool)

(assert (=> b!433199 (= c!55605 (= (select (arr!12714 _keys!709) from!863) k0!794))))

(declare-datatypes ((V!16235 0))(
  ( (V!16236 (val!5718 Int)) )
))
(declare-datatypes ((tuple2!7462 0))(
  ( (tuple2!7463 (_1!3742 (_ BitVec 64)) (_2!3742 V!16235)) )
))
(declare-datatypes ((List!7453 0))(
  ( (Nil!7450) (Cons!7449 (h!8305 tuple2!7462) (t!13089 List!7453)) )
))
(declare-datatypes ((ListLongMap!6377 0))(
  ( (ListLongMap!6378 (toList!3204 List!7453)) )
))
(declare-fun lt!198913 () ListLongMap!6377)

(declare-fun lt!198919 () ListLongMap!6377)

(assert (=> b!433199 (= lt!198913 lt!198919)))

(declare-fun lt!198923 () ListLongMap!6377)

(declare-fun lt!198911 () tuple2!7462)

(declare-fun +!1411 (ListLongMap!6377 tuple2!7462) ListLongMap!6377)

(assert (=> b!433199 (= lt!198919 (+!1411 lt!198923 lt!198911))))

(declare-fun lt!198916 () V!16235)

(assert (=> b!433199 (= lt!198911 (tuple2!7463 (select (arr!12714 _keys!709) from!863) lt!198916))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5330 0))(
  ( (ValueCellFull!5330 (v!7966 V!16235)) (EmptyCell!5330) )
))
(declare-datatypes ((array!26532 0))(
  ( (array!26533 (arr!12715 (Array (_ BitVec 32) ValueCell!5330)) (size!13067 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26532)

(declare-fun get!6334 (ValueCell!5330 V!16235) V!16235)

(declare-fun dynLambda!815 (Int (_ BitVec 64)) V!16235)

(assert (=> b!433199 (= lt!198916 (get!6334 (select (arr!12715 _values!549) from!863) (dynLambda!815 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433200 () Bool)

(declare-fun res!254964 () Bool)

(assert (=> b!433200 (=> (not res!254964) (not e!256151))))

(assert (=> b!433200 (= res!254964 (bvsle from!863 i!563))))

(declare-fun b!433201 () Bool)

(declare-fun res!254961 () Bool)

(assert (=> b!433201 (=> (not res!254961) (not e!256155))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!433201 (= res!254961 (validMask!0 mask!1025))))

(declare-fun b!433202 () Bool)

(declare-fun e!256156 () Bool)

(assert (=> b!433202 (= e!256156 (not e!256154))))

(declare-fun res!254962 () Bool)

(assert (=> b!433202 (=> res!254962 e!256154)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!433202 (= res!254962 (not (validKeyInArray!0 (select (arr!12714 _keys!709) from!863))))))

(declare-fun lt!198921 () ListLongMap!6377)

(assert (=> b!433202 (= lt!198921 lt!198923)))

(declare-fun lt!198917 () ListLongMap!6377)

(declare-fun lt!198912 () tuple2!7462)

(assert (=> b!433202 (= lt!198923 (+!1411 lt!198917 lt!198912))))

(declare-fun minValue!515 () V!16235)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!198910 () array!26532)

(declare-fun zeroValue!515 () V!16235)

(declare-fun getCurrentListMapNoExtraKeys!1440 (array!26530 array!26532 (_ BitVec 32) (_ BitVec 32) V!16235 V!16235 (_ BitVec 32) Int) ListLongMap!6377)

(assert (=> b!433202 (= lt!198921 (getCurrentListMapNoExtraKeys!1440 lt!198920 lt!198910 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!16235)

(assert (=> b!433202 (= lt!198912 (tuple2!7463 k0!794 v!412))))

(assert (=> b!433202 (= lt!198917 (getCurrentListMapNoExtraKeys!1440 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!198918 () Unit!12818)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!579 (array!26530 array!26532 (_ BitVec 32) (_ BitVec 32) V!16235 V!16235 (_ BitVec 32) (_ BitVec 64) V!16235 (_ BitVec 32) Int) Unit!12818)

(assert (=> b!433202 (= lt!198918 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!579 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!254953 () Bool)

(assert (=> start!39914 (=> (not res!254953) (not e!256155))))

(assert (=> start!39914 (= res!254953 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13066 _keys!709))))))

(assert (=> start!39914 e!256155))

(declare-fun tp_is_empty!11347 () Bool)

(assert (=> start!39914 tp_is_empty!11347))

(assert (=> start!39914 tp!36114))

(assert (=> start!39914 true))

(declare-fun e!256157 () Bool)

(declare-fun array_inv!9302 (array!26532) Bool)

(assert (=> start!39914 (and (array_inv!9302 _values!549) e!256157)))

(declare-fun array_inv!9303 (array!26530) Bool)

(assert (=> start!39914 (array_inv!9303 _keys!709)))

(declare-fun b!433203 () Bool)

(declare-fun res!254963 () Bool)

(assert (=> b!433203 (=> (not res!254963) (not e!256155))))

(assert (=> b!433203 (= res!254963 (or (= (select (arr!12714 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12714 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433204 () Bool)

(declare-fun e!256159 () Bool)

(declare-fun mapRes!18642 () Bool)

(assert (=> b!433204 (= e!256157 (and e!256159 mapRes!18642))))

(declare-fun condMapEmpty!18642 () Bool)

(declare-fun mapDefault!18642 () ValueCell!5330)

(assert (=> b!433204 (= condMapEmpty!18642 (= (arr!12715 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5330)) mapDefault!18642)))))

(declare-fun b!433205 () Bool)

(declare-fun res!254954 () Bool)

(assert (=> b!433205 (=> (not res!254954) (not e!256155))))

(assert (=> b!433205 (= res!254954 (and (= (size!13067 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13066 _keys!709) (size!13067 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!433206 () Bool)

(assert (=> b!433206 (= e!256151 e!256156)))

(declare-fun res!254956 () Bool)

(assert (=> b!433206 (=> (not res!254956) (not e!256156))))

(assert (=> b!433206 (= res!254956 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!433206 (= lt!198913 (getCurrentListMapNoExtraKeys!1440 lt!198920 lt!198910 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!433206 (= lt!198910 (array!26533 (store (arr!12715 _values!549) i!563 (ValueCellFull!5330 v!412)) (size!13067 _values!549)))))

(declare-fun lt!198914 () ListLongMap!6377)

(assert (=> b!433206 (= lt!198914 (getCurrentListMapNoExtraKeys!1440 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!433207 () Bool)

(declare-fun res!254967 () Bool)

(assert (=> b!433207 (=> (not res!254967) (not e!256155))))

(declare-datatypes ((List!7454 0))(
  ( (Nil!7451) (Cons!7450 (h!8306 (_ BitVec 64)) (t!13090 List!7454)) )
))
(declare-fun arrayNoDuplicates!0 (array!26530 (_ BitVec 32) List!7454) Bool)

(assert (=> b!433207 (= res!254967 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7451))))

(declare-fun b!433208 () Bool)

(declare-fun res!254957 () Bool)

(assert (=> b!433208 (=> (not res!254957) (not e!256155))))

(assert (=> b!433208 (= res!254957 (validKeyInArray!0 k0!794))))

(declare-fun b!433209 () Bool)

(declare-fun Unit!12820 () Unit!12818)

(assert (=> b!433209 (= e!256158 Unit!12820)))

(declare-fun lt!198924 () Unit!12818)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26530 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12818)

(assert (=> b!433209 (= lt!198924 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!433209 false))

(declare-fun mapIsEmpty!18642 () Bool)

(assert (=> mapIsEmpty!18642 mapRes!18642))

(declare-fun b!433210 () Bool)

(declare-fun res!254955 () Bool)

(assert (=> b!433210 (=> (not res!254955) (not e!256151))))

(assert (=> b!433210 (= res!254955 (arrayNoDuplicates!0 lt!198920 #b00000000000000000000000000000000 Nil!7451))))

(declare-fun mapNonEmpty!18642 () Bool)

(declare-fun tp!36113 () Bool)

(declare-fun e!256153 () Bool)

(assert (=> mapNonEmpty!18642 (= mapRes!18642 (and tp!36113 e!256153))))

(declare-fun mapValue!18642 () ValueCell!5330)

(declare-fun mapKey!18642 () (_ BitVec 32))

(declare-fun mapRest!18642 () (Array (_ BitVec 32) ValueCell!5330))

(assert (=> mapNonEmpty!18642 (= (arr!12715 _values!549) (store mapRest!18642 mapKey!18642 mapValue!18642))))

(declare-fun b!433211 () Bool)

(declare-fun Unit!12821 () Unit!12818)

(assert (=> b!433211 (= e!256158 Unit!12821)))

(declare-fun b!433212 () Bool)

(assert (=> b!433212 (= e!256150 true)))

(assert (=> b!433212 (= lt!198919 (+!1411 (+!1411 lt!198917 lt!198911) lt!198912))))

(declare-fun lt!198915 () Unit!12818)

(declare-fun addCommutativeForDiffKeys!385 (ListLongMap!6377 (_ BitVec 64) V!16235 (_ BitVec 64) V!16235) Unit!12818)

(assert (=> b!433212 (= lt!198915 (addCommutativeForDiffKeys!385 lt!198917 k0!794 v!412 (select (arr!12714 _keys!709) from!863) lt!198916))))

(declare-fun b!433213 () Bool)

(assert (=> b!433213 (= e!256153 tp_is_empty!11347)))

(declare-fun b!433214 () Bool)

(declare-fun res!254965 () Bool)

(assert (=> b!433214 (=> (not res!254965) (not e!256155))))

(assert (=> b!433214 (= res!254965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!433215 () Bool)

(assert (=> b!433215 (= e!256159 tp_is_empty!11347)))

(declare-fun b!433216 () Bool)

(declare-fun res!254960 () Bool)

(assert (=> b!433216 (=> (not res!254960) (not e!256155))))

(declare-fun arrayContainsKey!0 (array!26530 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!433216 (= res!254960 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!39914 res!254953) b!433201))

(assert (= (and b!433201 res!254961) b!433205))

(assert (= (and b!433205 res!254954) b!433214))

(assert (= (and b!433214 res!254965) b!433207))

(assert (= (and b!433207 res!254967) b!433198))

(assert (= (and b!433198 res!254966) b!433208))

(assert (= (and b!433208 res!254957) b!433203))

(assert (= (and b!433203 res!254963) b!433216))

(assert (= (and b!433216 res!254960) b!433197))

(assert (= (and b!433197 res!254959) b!433210))

(assert (= (and b!433210 res!254955) b!433200))

(assert (= (and b!433200 res!254964) b!433206))

(assert (= (and b!433206 res!254956) b!433202))

(assert (= (and b!433202 (not res!254962)) b!433199))

(assert (= (and b!433199 c!55605) b!433209))

(assert (= (and b!433199 (not c!55605)) b!433211))

(assert (= (and b!433199 (not res!254958)) b!433212))

(assert (= (and b!433204 condMapEmpty!18642) mapIsEmpty!18642))

(assert (= (and b!433204 (not condMapEmpty!18642)) mapNonEmpty!18642))

(get-info :version)

(assert (= (and mapNonEmpty!18642 ((_ is ValueCellFull!5330) mapValue!18642)) b!433213))

(assert (= (and b!433204 ((_ is ValueCellFull!5330) mapDefault!18642)) b!433215))

(assert (= start!39914 b!433204))

(declare-fun b_lambda!9305 () Bool)

(assert (=> (not b_lambda!9305) (not b!433199)))

(declare-fun t!13088 () Bool)

(declare-fun tb!3593 () Bool)

(assert (=> (and start!39914 (= defaultEntry!557 defaultEntry!557) t!13088) tb!3593))

(declare-fun result!6721 () Bool)

(assert (=> tb!3593 (= result!6721 tp_is_empty!11347)))

(assert (=> b!433199 t!13088))

(declare-fun b_and!18065 () Bool)

(assert (= b_and!18063 (and (=> t!13088 result!6721) b_and!18065)))

(declare-fun m!421493 () Bool)

(assert (=> start!39914 m!421493))

(declare-fun m!421495 () Bool)

(assert (=> start!39914 m!421495))

(declare-fun m!421497 () Bool)

(assert (=> b!433199 m!421497))

(declare-fun m!421499 () Bool)

(assert (=> b!433199 m!421499))

(assert (=> b!433199 m!421499))

(declare-fun m!421501 () Bool)

(assert (=> b!433199 m!421501))

(declare-fun m!421503 () Bool)

(assert (=> b!433199 m!421503))

(assert (=> b!433199 m!421501))

(declare-fun m!421505 () Bool)

(assert (=> b!433199 m!421505))

(declare-fun m!421507 () Bool)

(assert (=> b!433201 m!421507))

(declare-fun m!421509 () Bool)

(assert (=> b!433207 m!421509))

(declare-fun m!421511 () Bool)

(assert (=> b!433210 m!421511))

(declare-fun m!421513 () Bool)

(assert (=> b!433209 m!421513))

(declare-fun m!421515 () Bool)

(assert (=> b!433208 m!421515))

(declare-fun m!421517 () Bool)

(assert (=> b!433206 m!421517))

(declare-fun m!421519 () Bool)

(assert (=> b!433206 m!421519))

(declare-fun m!421521 () Bool)

(assert (=> b!433206 m!421521))

(declare-fun m!421523 () Bool)

(assert (=> b!433216 m!421523))

(declare-fun m!421525 () Bool)

(assert (=> b!433197 m!421525))

(declare-fun m!421527 () Bool)

(assert (=> b!433197 m!421527))

(declare-fun m!421529 () Bool)

(assert (=> b!433203 m!421529))

(declare-fun m!421531 () Bool)

(assert (=> b!433212 m!421531))

(assert (=> b!433212 m!421531))

(declare-fun m!421533 () Bool)

(assert (=> b!433212 m!421533))

(assert (=> b!433212 m!421497))

(assert (=> b!433212 m!421497))

(declare-fun m!421535 () Bool)

(assert (=> b!433212 m!421535))

(declare-fun m!421537 () Bool)

(assert (=> mapNonEmpty!18642 m!421537))

(assert (=> b!433202 m!421497))

(declare-fun m!421539 () Bool)

(assert (=> b!433202 m!421539))

(declare-fun m!421541 () Bool)

(assert (=> b!433202 m!421541))

(declare-fun m!421543 () Bool)

(assert (=> b!433202 m!421543))

(assert (=> b!433202 m!421497))

(declare-fun m!421545 () Bool)

(assert (=> b!433202 m!421545))

(declare-fun m!421547 () Bool)

(assert (=> b!433202 m!421547))

(declare-fun m!421549 () Bool)

(assert (=> b!433214 m!421549))

(check-sat (not b!433214) (not b!433216) b_and!18065 (not b!433197) (not b!433212) (not start!39914) (not b!433208) (not b!433207) (not b!433209) (not mapNonEmpty!18642) (not b!433202) (not b!433210) (not b_lambda!9305) (not b!433199) tp_is_empty!11347 (not b_next!10195) (not b!433206) (not b!433201))
(check-sat b_and!18065 (not b_next!10195))
