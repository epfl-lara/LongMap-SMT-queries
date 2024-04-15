; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40756 () Bool)

(assert start!40756)

(declare-fun b_free!10759 () Bool)

(declare-fun b_next!10759 () Bool)

(assert (=> start!40756 (= b_free!10759 (not b_next!10759))))

(declare-fun tp!38100 () Bool)

(declare-fun b_and!18779 () Bool)

(assert (=> start!40756 (= tp!38100 b_and!18779)))

(declare-fun b!451492 () Bool)

(declare-fun res!268881 () Bool)

(declare-fun e!264429 () Bool)

(assert (=> b!451492 (=> (not res!268881) (not e!264429))))

(declare-datatypes ((array!27993 0))(
  ( (array!27994 (arr!13441 (Array (_ BitVec 32) (_ BitVec 64))) (size!13794 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27993)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27993 (_ BitVec 32)) Bool)

(assert (=> b!451492 (= res!268881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!451493 () Bool)

(declare-fun res!268874 () Bool)

(declare-fun e!264433 () Bool)

(assert (=> b!451493 (=> (not res!268874) (not e!264433))))

(declare-fun lt!204777 () array!27993)

(declare-datatypes ((List!8083 0))(
  ( (Nil!8080) (Cons!8079 (h!8935 (_ BitVec 64)) (t!13856 List!8083)) )
))
(declare-fun arrayNoDuplicates!0 (array!27993 (_ BitVec 32) List!8083) Bool)

(assert (=> b!451493 (= res!268874 (arrayNoDuplicates!0 lt!204777 #b00000000000000000000000000000000 Nil!8080))))

(declare-fun b!451494 () Bool)

(declare-fun e!264426 () Bool)

(assert (=> b!451494 (= e!264433 e!264426)))

(declare-fun res!268883 () Bool)

(assert (=> b!451494 (=> (not res!268883) (not e!264426))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!451494 (= res!268883 (= from!863 i!563))))

(declare-datatypes ((V!17235 0))(
  ( (V!17236 (val!6093 Int)) )
))
(declare-datatypes ((tuple2!8022 0))(
  ( (tuple2!8023 (_1!4022 (_ BitVec 64)) (_2!4022 V!17235)) )
))
(declare-datatypes ((List!8084 0))(
  ( (Nil!8081) (Cons!8080 (h!8936 tuple2!8022) (t!13857 List!8084)) )
))
(declare-datatypes ((ListLongMap!6925 0))(
  ( (ListLongMap!6926 (toList!3478 List!8084)) )
))
(declare-fun lt!204775 () ListLongMap!6925)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17235)

(declare-datatypes ((ValueCell!5705 0))(
  ( (ValueCellFull!5705 (v!8346 V!17235)) (EmptyCell!5705) )
))
(declare-datatypes ((array!27995 0))(
  ( (array!27996 (arr!13442 (Array (_ BitVec 32) ValueCell!5705)) (size!13795 (_ BitVec 32))) )
))
(declare-fun lt!204779 () array!27995)

(declare-fun minValue!515 () V!17235)

(declare-fun getCurrentListMapNoExtraKeys!1675 (array!27993 array!27995 (_ BitVec 32) (_ BitVec 32) V!17235 V!17235 (_ BitVec 32) Int) ListLongMap!6925)

(assert (=> b!451494 (= lt!204775 (getCurrentListMapNoExtraKeys!1675 lt!204777 lt!204779 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!27995)

(declare-fun v!412 () V!17235)

(assert (=> b!451494 (= lt!204779 (array!27996 (store (arr!13442 _values!549) i!563 (ValueCellFull!5705 v!412)) (size!13795 _values!549)))))

(declare-fun lt!204778 () ListLongMap!6925)

(assert (=> b!451494 (= lt!204778 (getCurrentListMapNoExtraKeys!1675 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!451496 () Bool)

(declare-fun e!264430 () Bool)

(declare-fun e!264428 () Bool)

(declare-fun mapRes!19782 () Bool)

(assert (=> b!451496 (= e!264430 (and e!264428 mapRes!19782))))

(declare-fun condMapEmpty!19782 () Bool)

(declare-fun mapDefault!19782 () ValueCell!5705)

(assert (=> b!451496 (= condMapEmpty!19782 (= (arr!13442 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5705)) mapDefault!19782)))))

(declare-fun mapNonEmpty!19782 () Bool)

(declare-fun tp!38099 () Bool)

(declare-fun e!264427 () Bool)

(assert (=> mapNonEmpty!19782 (= mapRes!19782 (and tp!38099 e!264427))))

(declare-fun mapRest!19782 () (Array (_ BitVec 32) ValueCell!5705))

(declare-fun mapValue!19782 () ValueCell!5705)

(declare-fun mapKey!19782 () (_ BitVec 32))

(assert (=> mapNonEmpty!19782 (= (arr!13442 _values!549) (store mapRest!19782 mapKey!19782 mapValue!19782))))

(declare-fun b!451497 () Bool)

(declare-fun tp_is_empty!12097 () Bool)

(assert (=> b!451497 (= e!264427 tp_is_empty!12097)))

(declare-fun b!451498 () Bool)

(declare-fun res!268878 () Bool)

(assert (=> b!451498 (=> (not res!268878) (not e!264429))))

(assert (=> b!451498 (= res!268878 (and (= (size!13795 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13794 _keys!709) (size!13795 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!451499 () Bool)

(declare-fun e!264434 () Bool)

(declare-fun call!29865 () ListLongMap!6925)

(declare-fun call!29866 () ListLongMap!6925)

(assert (=> b!451499 (= e!264434 (= call!29865 call!29866))))

(declare-fun b!451500 () Bool)

(declare-fun res!268879 () Bool)

(assert (=> b!451500 (=> (not res!268879) (not e!264429))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27993 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!451500 (= res!268879 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!451501 () Bool)

(declare-fun +!1577 (ListLongMap!6925 tuple2!8022) ListLongMap!6925)

(assert (=> b!451501 (= e!264434 (= call!29866 (+!1577 call!29865 (tuple2!8023 k0!794 v!412))))))

(declare-fun b!451502 () Bool)

(declare-fun res!268884 () Bool)

(assert (=> b!451502 (=> (not res!268884) (not e!264429))))

(assert (=> b!451502 (= res!268884 (or (= (select (arr!13441 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13441 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19782 () Bool)

(assert (=> mapIsEmpty!19782 mapRes!19782))

(declare-fun b!451503 () Bool)

(declare-fun e!264432 () Bool)

(assert (=> b!451503 (= e!264432 (bvslt i!563 (size!13795 _values!549)))))

(declare-fun get!6622 (ValueCell!5705 V!17235) V!17235)

(declare-fun dynLambda!854 (Int (_ BitVec 64)) V!17235)

(assert (=> b!451503 (= lt!204775 (+!1577 (getCurrentListMapNoExtraKeys!1675 lt!204777 lt!204779 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8023 (select (arr!13441 lt!204777) from!863) (get!6622 (select (arr!13442 lt!204779) from!863) (dynLambda!854 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!451504 () Bool)

(assert (=> b!451504 (= e!264428 tp_is_empty!12097)))

(declare-fun b!451505 () Bool)

(declare-fun res!268877 () Bool)

(assert (=> b!451505 (=> (not res!268877) (not e!264429))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!451505 (= res!268877 (validMask!0 mask!1025))))

(declare-fun b!451506 () Bool)

(declare-fun res!268882 () Bool)

(assert (=> b!451506 (=> (not res!268882) (not e!264433))))

(assert (=> b!451506 (= res!268882 (bvsle from!863 i!563))))

(declare-fun bm!29862 () Bool)

(declare-fun c!56016 () Bool)

(assert (=> bm!29862 (= call!29865 (getCurrentListMapNoExtraKeys!1675 (ite c!56016 _keys!709 lt!204777) (ite c!56016 _values!549 lt!204779) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451507 () Bool)

(assert (=> b!451507 (= e!264429 e!264433)))

(declare-fun res!268885 () Bool)

(assert (=> b!451507 (=> (not res!268885) (not e!264433))))

(assert (=> b!451507 (= res!268885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204777 mask!1025))))

(assert (=> b!451507 (= lt!204777 (array!27994 (store (arr!13441 _keys!709) i!563 k0!794) (size!13794 _keys!709)))))

(declare-fun b!451508 () Bool)

(declare-fun res!268875 () Bool)

(assert (=> b!451508 (=> (not res!268875) (not e!264429))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!451508 (= res!268875 (validKeyInArray!0 k0!794))))

(declare-fun b!451509 () Bool)

(declare-fun res!268886 () Bool)

(assert (=> b!451509 (=> (not res!268886) (not e!264429))))

(assert (=> b!451509 (= res!268886 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13794 _keys!709))))))

(declare-fun b!451495 () Bool)

(declare-fun res!268880 () Bool)

(assert (=> b!451495 (=> (not res!268880) (not e!264429))))

(assert (=> b!451495 (= res!268880 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8080))))

(declare-fun res!268873 () Bool)

(assert (=> start!40756 (=> (not res!268873) (not e!264429))))

(assert (=> start!40756 (= res!268873 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13794 _keys!709))))))

(assert (=> start!40756 e!264429))

(assert (=> start!40756 tp_is_empty!12097))

(assert (=> start!40756 tp!38100))

(assert (=> start!40756 true))

(declare-fun array_inv!9796 (array!27995) Bool)

(assert (=> start!40756 (and (array_inv!9796 _values!549) e!264430)))

(declare-fun array_inv!9797 (array!27993) Bool)

(assert (=> start!40756 (array_inv!9797 _keys!709)))

(declare-fun b!451510 () Bool)

(assert (=> b!451510 (= e!264426 (not e!264432))))

(declare-fun res!268876 () Bool)

(assert (=> b!451510 (=> res!268876 e!264432)))

(assert (=> b!451510 (= res!268876 (validKeyInArray!0 (select (arr!13441 _keys!709) from!863)))))

(assert (=> b!451510 e!264434))

(assert (=> b!451510 (= c!56016 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13177 0))(
  ( (Unit!13178) )
))
(declare-fun lt!204776 () Unit!13177)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!716 (array!27993 array!27995 (_ BitVec 32) (_ BitVec 32) V!17235 V!17235 (_ BitVec 32) (_ BitVec 64) V!17235 (_ BitVec 32) Int) Unit!13177)

(assert (=> b!451510 (= lt!204776 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!716 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29863 () Bool)

(assert (=> bm!29863 (= call!29866 (getCurrentListMapNoExtraKeys!1675 (ite c!56016 lt!204777 _keys!709) (ite c!56016 lt!204779 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!40756 res!268873) b!451505))

(assert (= (and b!451505 res!268877) b!451498))

(assert (= (and b!451498 res!268878) b!451492))

(assert (= (and b!451492 res!268881) b!451495))

(assert (= (and b!451495 res!268880) b!451509))

(assert (= (and b!451509 res!268886) b!451508))

(assert (= (and b!451508 res!268875) b!451502))

(assert (= (and b!451502 res!268884) b!451500))

(assert (= (and b!451500 res!268879) b!451507))

(assert (= (and b!451507 res!268885) b!451493))

(assert (= (and b!451493 res!268874) b!451506))

(assert (= (and b!451506 res!268882) b!451494))

(assert (= (and b!451494 res!268883) b!451510))

(assert (= (and b!451510 c!56016) b!451501))

(assert (= (and b!451510 (not c!56016)) b!451499))

(assert (= (or b!451501 b!451499) bm!29863))

(assert (= (or b!451501 b!451499) bm!29862))

(assert (= (and b!451510 (not res!268876)) b!451503))

(assert (= (and b!451496 condMapEmpty!19782) mapIsEmpty!19782))

(assert (= (and b!451496 (not condMapEmpty!19782)) mapNonEmpty!19782))

(get-info :version)

(assert (= (and mapNonEmpty!19782 ((_ is ValueCellFull!5705) mapValue!19782)) b!451497))

(assert (= (and b!451496 ((_ is ValueCellFull!5705) mapDefault!19782)) b!451504))

(assert (= start!40756 b!451496))

(declare-fun b_lambda!9519 () Bool)

(assert (=> (not b_lambda!9519) (not b!451503)))

(declare-fun t!13855 () Bool)

(declare-fun tb!3731 () Bool)

(assert (=> (and start!40756 (= defaultEntry!557 defaultEntry!557) t!13855) tb!3731))

(declare-fun result!7007 () Bool)

(assert (=> tb!3731 (= result!7007 tp_is_empty!12097)))

(assert (=> b!451503 t!13855))

(declare-fun b_and!18781 () Bool)

(assert (= b_and!18779 (and (=> t!13855 result!7007) b_and!18781)))

(declare-fun m!434777 () Bool)

(assert (=> b!451500 m!434777))

(declare-fun m!434779 () Bool)

(assert (=> b!451508 m!434779))

(declare-fun m!434781 () Bool)

(assert (=> b!451502 m!434781))

(declare-fun m!434783 () Bool)

(assert (=> b!451510 m!434783))

(assert (=> b!451510 m!434783))

(declare-fun m!434785 () Bool)

(assert (=> b!451510 m!434785))

(declare-fun m!434787 () Bool)

(assert (=> b!451510 m!434787))

(declare-fun m!434789 () Bool)

(assert (=> b!451493 m!434789))

(declare-fun m!434791 () Bool)

(assert (=> bm!29862 m!434791))

(declare-fun m!434793 () Bool)

(assert (=> b!451494 m!434793))

(declare-fun m!434795 () Bool)

(assert (=> b!451494 m!434795))

(declare-fun m!434797 () Bool)

(assert (=> b!451494 m!434797))

(declare-fun m!434799 () Bool)

(assert (=> b!451505 m!434799))

(declare-fun m!434801 () Bool)

(assert (=> b!451507 m!434801))

(declare-fun m!434803 () Bool)

(assert (=> b!451507 m!434803))

(declare-fun m!434805 () Bool)

(assert (=> b!451495 m!434805))

(declare-fun m!434807 () Bool)

(assert (=> bm!29863 m!434807))

(declare-fun m!434809 () Bool)

(assert (=> start!40756 m!434809))

(declare-fun m!434811 () Bool)

(assert (=> start!40756 m!434811))

(declare-fun m!434813 () Bool)

(assert (=> b!451492 m!434813))

(declare-fun m!434815 () Bool)

(assert (=> b!451501 m!434815))

(declare-fun m!434817 () Bool)

(assert (=> b!451503 m!434817))

(declare-fun m!434819 () Bool)

(assert (=> b!451503 m!434819))

(declare-fun m!434821 () Bool)

(assert (=> b!451503 m!434821))

(declare-fun m!434823 () Bool)

(assert (=> b!451503 m!434823))

(assert (=> b!451503 m!434821))

(declare-fun m!434825 () Bool)

(assert (=> b!451503 m!434825))

(assert (=> b!451503 m!434819))

(assert (=> b!451503 m!434817))

(declare-fun m!434827 () Bool)

(assert (=> b!451503 m!434827))

(declare-fun m!434829 () Bool)

(assert (=> mapNonEmpty!19782 m!434829))

(check-sat (not bm!29862) (not b!451493) (not b!451507) (not b!451503) (not b_next!10759) b_and!18781 (not b_lambda!9519) (not b!451505) (not bm!29863) (not b!451510) (not b!451492) (not b!451500) (not start!40756) (not b!451495) (not b!451501) (not b!451494) tp_is_empty!12097 (not b!451508) (not mapNonEmpty!19782))
(check-sat b_and!18781 (not b_next!10759))
