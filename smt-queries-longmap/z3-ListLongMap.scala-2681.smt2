; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39890 () Bool)

(assert start!39890)

(declare-fun b_free!10171 () Bool)

(declare-fun b_next!10171 () Bool)

(assert (=> start!39890 (= b_free!10171 (not b_next!10171))))

(declare-fun tp!36042 () Bool)

(declare-fun b_and!17975 () Bool)

(assert (=> start!39890 (= tp!36042 b_and!17975)))

(declare-fun b!432231 () Bool)

(declare-fun e!255655 () Bool)

(declare-fun e!255654 () Bool)

(assert (=> b!432231 (= e!255655 (not e!255654))))

(declare-fun res!254291 () Bool)

(assert (=> b!432231 (=> res!254291 e!255654)))

(declare-datatypes ((array!26473 0))(
  ( (array!26474 (arr!12686 (Array (_ BitVec 32) (_ BitVec 64))) (size!13039 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26473)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!432231 (= res!254291 (not (validKeyInArray!0 (select (arr!12686 _keys!709) from!863))))))

(declare-datatypes ((V!16203 0))(
  ( (V!16204 (val!5706 Int)) )
))
(declare-datatypes ((tuple2!7542 0))(
  ( (tuple2!7543 (_1!3782 (_ BitVec 64)) (_2!3782 V!16203)) )
))
(declare-datatypes ((List!7536 0))(
  ( (Nil!7533) (Cons!7532 (h!8388 tuple2!7542) (t!13147 List!7536)) )
))
(declare-datatypes ((ListLongMap!6445 0))(
  ( (ListLongMap!6446 (toList!3238 List!7536)) )
))
(declare-fun lt!198128 () ListLongMap!6445)

(declare-fun lt!198118 () ListLongMap!6445)

(assert (=> b!432231 (= lt!198128 lt!198118)))

(declare-fun lt!198129 () ListLongMap!6445)

(declare-fun lt!198130 () tuple2!7542)

(declare-fun +!1413 (ListLongMap!6445 tuple2!7542) ListLongMap!6445)

(assert (=> b!432231 (= lt!198118 (+!1413 lt!198129 lt!198130))))

(declare-fun minValue!515 () V!16203)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!198131 () array!26473)

(declare-fun zeroValue!515 () V!16203)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5318 0))(
  ( (ValueCellFull!5318 (v!7947 V!16203)) (EmptyCell!5318) )
))
(declare-datatypes ((array!26475 0))(
  ( (array!26476 (arr!12687 (Array (_ BitVec 32) ValueCell!5318)) (size!13040 (_ BitVec 32))) )
))
(declare-fun lt!198122 () array!26475)

(declare-fun getCurrentListMapNoExtraKeys!1443 (array!26473 array!26475 (_ BitVec 32) (_ BitVec 32) V!16203 V!16203 (_ BitVec 32) Int) ListLongMap!6445)

(assert (=> b!432231 (= lt!198128 (getCurrentListMapNoExtraKeys!1443 lt!198131 lt!198122 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16203)

(assert (=> b!432231 (= lt!198130 (tuple2!7543 k0!794 v!412))))

(declare-fun _values!549 () array!26475)

(assert (=> b!432231 (= lt!198129 (getCurrentListMapNoExtraKeys!1443 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12754 0))(
  ( (Unit!12755) )
))
(declare-fun lt!198123 () Unit!12754)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!569 (array!26473 array!26475 (_ BitVec 32) (_ BitVec 32) V!16203 V!16203 (_ BitVec 32) (_ BitVec 64) V!16203 (_ BitVec 32) Int) Unit!12754)

(assert (=> b!432231 (= lt!198123 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!569 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!432232 () Bool)

(declare-fun e!255657 () Bool)

(declare-fun e!255648 () Bool)

(assert (=> b!432232 (= e!255657 e!255648)))

(declare-fun res!254296 () Bool)

(assert (=> b!432232 (=> (not res!254296) (not e!255648))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26473 (_ BitVec 32)) Bool)

(assert (=> b!432232 (= res!254296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!198131 mask!1025))))

(assert (=> b!432232 (= lt!198131 (array!26474 (store (arr!12686 _keys!709) i!563 k0!794) (size!13039 _keys!709)))))

(declare-fun b!432233 () Bool)

(declare-fun e!255650 () Bool)

(declare-fun e!255649 () Bool)

(declare-fun mapRes!18606 () Bool)

(assert (=> b!432233 (= e!255650 (and e!255649 mapRes!18606))))

(declare-fun condMapEmpty!18606 () Bool)

(declare-fun mapDefault!18606 () ValueCell!5318)

(assert (=> b!432233 (= condMapEmpty!18606 (= (arr!12687 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5318)) mapDefault!18606)))))

(declare-fun b!432234 () Bool)

(declare-fun e!255656 () Bool)

(assert (=> b!432234 (= e!255656 true)))

(declare-fun lt!198121 () tuple2!7542)

(declare-fun lt!198126 () ListLongMap!6445)

(assert (=> b!432234 (= lt!198126 (+!1413 (+!1413 lt!198129 lt!198121) lt!198130))))

(declare-fun lt!198119 () V!16203)

(declare-fun lt!198117 () Unit!12754)

(declare-fun addCommutativeForDiffKeys!373 (ListLongMap!6445 (_ BitVec 64) V!16203 (_ BitVec 64) V!16203) Unit!12754)

(assert (=> b!432234 (= lt!198117 (addCommutativeForDiffKeys!373 lt!198129 k0!794 v!412 (select (arr!12686 _keys!709) from!863) lt!198119))))

(declare-fun b!432236 () Bool)

(declare-fun e!255651 () Bool)

(declare-fun tp_is_empty!11323 () Bool)

(assert (=> b!432236 (= e!255651 tp_is_empty!11323)))

(declare-fun b!432237 () Bool)

(declare-fun res!254294 () Bool)

(assert (=> b!432237 (=> (not res!254294) (not e!255657))))

(declare-fun arrayContainsKey!0 (array!26473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!432237 (= res!254294 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!432238 () Bool)

(declare-fun res!254301 () Bool)

(assert (=> b!432238 (=> (not res!254301) (not e!255657))))

(assert (=> b!432238 (= res!254301 (and (= (size!13040 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13039 _keys!709) (size!13040 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!432239 () Bool)

(declare-fun res!254300 () Bool)

(assert (=> b!432239 (=> (not res!254300) (not e!255657))))

(declare-datatypes ((List!7537 0))(
  ( (Nil!7534) (Cons!7533 (h!8389 (_ BitVec 64)) (t!13148 List!7537)) )
))
(declare-fun arrayNoDuplicates!0 (array!26473 (_ BitVec 32) List!7537) Bool)

(assert (=> b!432239 (= res!254300 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7534))))

(declare-fun b!432240 () Bool)

(declare-fun res!254297 () Bool)

(assert (=> b!432240 (=> (not res!254297) (not e!255657))))

(assert (=> b!432240 (= res!254297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!432241 () Bool)

(declare-fun res!254295 () Bool)

(assert (=> b!432241 (=> (not res!254295) (not e!255657))))

(assert (=> b!432241 (= res!254295 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13039 _keys!709))))))

(declare-fun mapIsEmpty!18606 () Bool)

(assert (=> mapIsEmpty!18606 mapRes!18606))

(declare-fun b!432242 () Bool)

(declare-fun res!254298 () Bool)

(assert (=> b!432242 (=> (not res!254298) (not e!255648))))

(assert (=> b!432242 (= res!254298 (bvsle from!863 i!563))))

(declare-fun b!432243 () Bool)

(declare-fun res!254289 () Bool)

(assert (=> b!432243 (=> (not res!254289) (not e!255657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!432243 (= res!254289 (validMask!0 mask!1025))))

(declare-fun b!432244 () Bool)

(declare-fun e!255652 () Unit!12754)

(declare-fun Unit!12756 () Unit!12754)

(assert (=> b!432244 (= e!255652 Unit!12756)))

(declare-fun lt!198120 () Unit!12754)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26473 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12754)

(assert (=> b!432244 (= lt!198120 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!432244 false))

(declare-fun b!432245 () Bool)

(declare-fun res!254290 () Bool)

(assert (=> b!432245 (=> (not res!254290) (not e!255648))))

(assert (=> b!432245 (= res!254290 (arrayNoDuplicates!0 lt!198131 #b00000000000000000000000000000000 Nil!7534))))

(declare-fun res!254293 () Bool)

(assert (=> start!39890 (=> (not res!254293) (not e!255657))))

(assert (=> start!39890 (= res!254293 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13039 _keys!709))))))

(assert (=> start!39890 e!255657))

(assert (=> start!39890 tp_is_empty!11323))

(assert (=> start!39890 tp!36042))

(assert (=> start!39890 true))

(declare-fun array_inv!9266 (array!26475) Bool)

(assert (=> start!39890 (and (array_inv!9266 _values!549) e!255650)))

(declare-fun array_inv!9267 (array!26473) Bool)

(assert (=> start!39890 (array_inv!9267 _keys!709)))

(declare-fun b!432235 () Bool)

(declare-fun res!254292 () Bool)

(assert (=> b!432235 (=> (not res!254292) (not e!255657))))

(assert (=> b!432235 (= res!254292 (validKeyInArray!0 k0!794))))

(declare-fun b!432246 () Bool)

(declare-fun Unit!12757 () Unit!12754)

(assert (=> b!432246 (= e!255652 Unit!12757)))

(declare-fun b!432247 () Bool)

(assert (=> b!432247 (= e!255648 e!255655)))

(declare-fun res!254287 () Bool)

(assert (=> b!432247 (=> (not res!254287) (not e!255655))))

(assert (=> b!432247 (= res!254287 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!198125 () ListLongMap!6445)

(assert (=> b!432247 (= lt!198125 (getCurrentListMapNoExtraKeys!1443 lt!198131 lt!198122 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!432247 (= lt!198122 (array!26476 (store (arr!12687 _values!549) i!563 (ValueCellFull!5318 v!412)) (size!13040 _values!549)))))

(declare-fun lt!198127 () ListLongMap!6445)

(assert (=> b!432247 (= lt!198127 (getCurrentListMapNoExtraKeys!1443 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!18606 () Bool)

(declare-fun tp!36041 () Bool)

(assert (=> mapNonEmpty!18606 (= mapRes!18606 (and tp!36041 e!255651))))

(declare-fun mapRest!18606 () (Array (_ BitVec 32) ValueCell!5318))

(declare-fun mapValue!18606 () ValueCell!5318)

(declare-fun mapKey!18606 () (_ BitVec 32))

(assert (=> mapNonEmpty!18606 (= (arr!12687 _values!549) (store mapRest!18606 mapKey!18606 mapValue!18606))))

(declare-fun b!432248 () Bool)

(assert (=> b!432248 (= e!255654 e!255656)))

(declare-fun res!254288 () Bool)

(assert (=> b!432248 (=> res!254288 e!255656)))

(assert (=> b!432248 (= res!254288 (= k0!794 (select (arr!12686 _keys!709) from!863)))))

(assert (=> b!432248 (not (= (select (arr!12686 _keys!709) from!863) k0!794))))

(declare-fun lt!198124 () Unit!12754)

(assert (=> b!432248 (= lt!198124 e!255652)))

(declare-fun c!55521 () Bool)

(assert (=> b!432248 (= c!55521 (= (select (arr!12686 _keys!709) from!863) k0!794))))

(assert (=> b!432248 (= lt!198125 lt!198126)))

(assert (=> b!432248 (= lt!198126 (+!1413 lt!198118 lt!198121))))

(assert (=> b!432248 (= lt!198121 (tuple2!7543 (select (arr!12686 _keys!709) from!863) lt!198119))))

(declare-fun get!6308 (ValueCell!5318 V!16203) V!16203)

(declare-fun dynLambda!800 (Int (_ BitVec 64)) V!16203)

(assert (=> b!432248 (= lt!198119 (get!6308 (select (arr!12687 _values!549) from!863) (dynLambda!800 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432249 () Bool)

(declare-fun res!254299 () Bool)

(assert (=> b!432249 (=> (not res!254299) (not e!255657))))

(assert (=> b!432249 (= res!254299 (or (= (select (arr!12686 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12686 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432250 () Bool)

(assert (=> b!432250 (= e!255649 tp_is_empty!11323)))

(assert (= (and start!39890 res!254293) b!432243))

(assert (= (and b!432243 res!254289) b!432238))

(assert (= (and b!432238 res!254301) b!432240))

(assert (= (and b!432240 res!254297) b!432239))

(assert (= (and b!432239 res!254300) b!432241))

(assert (= (and b!432241 res!254295) b!432235))

(assert (= (and b!432235 res!254292) b!432249))

(assert (= (and b!432249 res!254299) b!432237))

(assert (= (and b!432237 res!254294) b!432232))

(assert (= (and b!432232 res!254296) b!432245))

(assert (= (and b!432245 res!254290) b!432242))

(assert (= (and b!432242 res!254298) b!432247))

(assert (= (and b!432247 res!254287) b!432231))

(assert (= (and b!432231 (not res!254291)) b!432248))

(assert (= (and b!432248 c!55521) b!432244))

(assert (= (and b!432248 (not c!55521)) b!432246))

(assert (= (and b!432248 (not res!254288)) b!432234))

(assert (= (and b!432233 condMapEmpty!18606) mapIsEmpty!18606))

(assert (= (and b!432233 (not condMapEmpty!18606)) mapNonEmpty!18606))

(get-info :version)

(assert (= (and mapNonEmpty!18606 ((_ is ValueCellFull!5318) mapValue!18606)) b!432236))

(assert (= (and b!432233 ((_ is ValueCellFull!5318) mapDefault!18606)) b!432250))

(assert (= start!39890 b!432233))

(declare-fun b_lambda!9241 () Bool)

(assert (=> (not b_lambda!9241) (not b!432248)))

(declare-fun t!13146 () Bool)

(declare-fun tb!3569 () Bool)

(assert (=> (and start!39890 (= defaultEntry!557 defaultEntry!557) t!13146) tb!3569))

(declare-fun result!6673 () Bool)

(assert (=> tb!3569 (= result!6673 tp_is_empty!11323)))

(assert (=> b!432248 t!13146))

(declare-fun b_and!17977 () Bool)

(assert (= b_and!17975 (and (=> t!13146 result!6673) b_and!17977)))

(declare-fun m!419847 () Bool)

(assert (=> b!432237 m!419847))

(declare-fun m!419849 () Bool)

(assert (=> b!432235 m!419849))

(declare-fun m!419851 () Bool)

(assert (=> b!432232 m!419851))

(declare-fun m!419853 () Bool)

(assert (=> b!432232 m!419853))

(declare-fun m!419855 () Bool)

(assert (=> b!432239 m!419855))

(declare-fun m!419857 () Bool)

(assert (=> mapNonEmpty!18606 m!419857))

(declare-fun m!419859 () Bool)

(assert (=> b!432245 m!419859))

(declare-fun m!419861 () Bool)

(assert (=> b!432244 m!419861))

(declare-fun m!419863 () Bool)

(assert (=> b!432231 m!419863))

(declare-fun m!419865 () Bool)

(assert (=> b!432231 m!419865))

(declare-fun m!419867 () Bool)

(assert (=> b!432231 m!419867))

(declare-fun m!419869 () Bool)

(assert (=> b!432231 m!419869))

(assert (=> b!432231 m!419863))

(declare-fun m!419871 () Bool)

(assert (=> b!432231 m!419871))

(declare-fun m!419873 () Bool)

(assert (=> b!432231 m!419873))

(declare-fun m!419875 () Bool)

(assert (=> start!39890 m!419875))

(declare-fun m!419877 () Bool)

(assert (=> start!39890 m!419877))

(assert (=> b!432248 m!419863))

(declare-fun m!419879 () Bool)

(assert (=> b!432248 m!419879))

(declare-fun m!419881 () Bool)

(assert (=> b!432248 m!419881))

(declare-fun m!419883 () Bool)

(assert (=> b!432248 m!419883))

(assert (=> b!432248 m!419883))

(assert (=> b!432248 m!419881))

(declare-fun m!419885 () Bool)

(assert (=> b!432248 m!419885))

(declare-fun m!419887 () Bool)

(assert (=> b!432234 m!419887))

(assert (=> b!432234 m!419887))

(declare-fun m!419889 () Bool)

(assert (=> b!432234 m!419889))

(assert (=> b!432234 m!419863))

(assert (=> b!432234 m!419863))

(declare-fun m!419891 () Bool)

(assert (=> b!432234 m!419891))

(declare-fun m!419893 () Bool)

(assert (=> b!432249 m!419893))

(declare-fun m!419895 () Bool)

(assert (=> b!432247 m!419895))

(declare-fun m!419897 () Bool)

(assert (=> b!432247 m!419897))

(declare-fun m!419899 () Bool)

(assert (=> b!432247 m!419899))

(declare-fun m!419901 () Bool)

(assert (=> b!432243 m!419901))

(declare-fun m!419903 () Bool)

(assert (=> b!432240 m!419903))

(check-sat (not b!432237) b_and!17977 (not b!432244) (not b!432243) (not b!432235) (not start!39890) (not b_lambda!9241) (not b!432247) (not b!432232) (not b!432245) (not b!432231) (not b!432248) (not b!432234) (not mapNonEmpty!18606) (not b!432240) (not b!432239) tp_is_empty!11323 (not b_next!10171))
(check-sat b_and!17977 (not b_next!10171))
