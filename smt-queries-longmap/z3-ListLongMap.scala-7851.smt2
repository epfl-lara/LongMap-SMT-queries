; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98086 () Bool)

(assert start!98086)

(declare-fun b_free!23551 () Bool)

(declare-fun b_next!23551 () Bool)

(assert (=> start!98086 (= b_free!23551 (not b_next!23551))))

(declare-fun tp!83357 () Bool)

(declare-fun b_and!37895 () Bool)

(assert (=> start!98086 (= tp!83357 b_and!37895)))

(declare-fun b!1121373 () Bool)

(declare-fun res!748737 () Bool)

(declare-fun e!638679 () Bool)

(assert (=> b!1121373 (=> (not res!748737) (not e!638679))))

(declare-datatypes ((array!73093 0))(
  ( (array!73094 (arr!35193 (Array (_ BitVec 32) (_ BitVec 64))) (size!35730 (_ BitVec 32))) )
))
(declare-fun lt!498436 () array!73093)

(declare-datatypes ((List!24494 0))(
  ( (Nil!24491) (Cons!24490 (h!25708 (_ BitVec 64)) (t!35029 List!24494)) )
))
(declare-fun arrayNoDuplicates!0 (array!73093 (_ BitVec 32) List!24494) Bool)

(assert (=> b!1121373 (= res!748737 (arrayNoDuplicates!0 lt!498436 #b00000000000000000000000000000000 Nil!24491))))

(declare-fun b!1121374 () Bool)

(declare-fun res!748735 () Bool)

(declare-fun e!638681 () Bool)

(assert (=> b!1121374 (=> (not res!748735) (not e!638681))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1121374 (= res!748735 (validMask!0 mask!1564))))

(declare-fun b!1121375 () Bool)

(declare-fun res!748736 () Bool)

(assert (=> b!1121375 (=> (not res!748736) (not e!638681))))

(declare-fun _keys!1208 () array!73093)

(assert (=> b!1121375 (= res!748736 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24491))))

(declare-fun res!748730 () Bool)

(assert (=> start!98086 (=> (not res!748730) (not e!638681))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98086 (= res!748730 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35730 _keys!1208))))))

(assert (=> start!98086 e!638681))

(declare-fun tp_is_empty!28081 () Bool)

(assert (=> start!98086 tp_is_empty!28081))

(declare-fun array_inv!27094 (array!73093) Bool)

(assert (=> start!98086 (array_inv!27094 _keys!1208)))

(assert (=> start!98086 true))

(assert (=> start!98086 tp!83357))

(declare-datatypes ((V!42569 0))(
  ( (V!42570 (val!14097 Int)) )
))
(declare-datatypes ((ValueCell!13331 0))(
  ( (ValueCellFull!13331 (v!16726 V!42569)) (EmptyCell!13331) )
))
(declare-datatypes ((array!73095 0))(
  ( (array!73096 (arr!35194 (Array (_ BitVec 32) ValueCell!13331)) (size!35731 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73095)

(declare-fun e!638680 () Bool)

(declare-fun array_inv!27095 (array!73095) Bool)

(assert (=> start!98086 (and (array_inv!27095 _values!996) e!638680)))

(declare-fun mapNonEmpty!43939 () Bool)

(declare-fun mapRes!43939 () Bool)

(declare-fun tp!83356 () Bool)

(declare-fun e!638682 () Bool)

(assert (=> mapNonEmpty!43939 (= mapRes!43939 (and tp!83356 e!638682))))

(declare-fun mapKey!43939 () (_ BitVec 32))

(declare-fun mapValue!43939 () ValueCell!13331)

(declare-fun mapRest!43939 () (Array (_ BitVec 32) ValueCell!13331))

(assert (=> mapNonEmpty!43939 (= (arr!35194 _values!996) (store mapRest!43939 mapKey!43939 mapValue!43939))))

(declare-fun b!1121376 () Bool)

(declare-fun e!638678 () Bool)

(assert (=> b!1121376 (= e!638679 (not e!638678))))

(declare-fun res!748732 () Bool)

(assert (=> b!1121376 (=> res!748732 e!638678)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1121376 (= res!748732 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73093 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1121376 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36741 0))(
  ( (Unit!36742) )
))
(declare-fun lt!498435 () Unit!36741)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73093 (_ BitVec 64) (_ BitVec 32)) Unit!36741)

(assert (=> b!1121376 (= lt!498435 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1121377 () Bool)

(declare-fun res!748734 () Bool)

(assert (=> b!1121377 (=> (not res!748734) (not e!638681))))

(assert (=> b!1121377 (= res!748734 (= (select (arr!35193 _keys!1208) i!673) k0!934))))

(declare-fun b!1121378 () Bool)

(assert (=> b!1121378 (= e!638682 tp_is_empty!28081)))

(declare-fun b!1121379 () Bool)

(declare-fun e!638677 () Bool)

(assert (=> b!1121379 (= e!638680 (and e!638677 mapRes!43939))))

(declare-fun condMapEmpty!43939 () Bool)

(declare-fun mapDefault!43939 () ValueCell!13331)

(assert (=> b!1121379 (= condMapEmpty!43939 (= (arr!35194 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13331)) mapDefault!43939)))))

(declare-fun b!1121380 () Bool)

(declare-fun res!748733 () Bool)

(assert (=> b!1121380 (=> (not res!748733) (not e!638681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73093 (_ BitVec 32)) Bool)

(assert (=> b!1121380 (= res!748733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43939 () Bool)

(assert (=> mapIsEmpty!43939 mapRes!43939))

(declare-fun b!1121381 () Bool)

(declare-fun res!748728 () Bool)

(assert (=> b!1121381 (=> (not res!748728) (not e!638681))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1121381 (= res!748728 (validKeyInArray!0 k0!934))))

(declare-fun b!1121382 () Bool)

(assert (=> b!1121382 (= e!638677 tp_is_empty!28081)))

(declare-fun b!1121383 () Bool)

(assert (=> b!1121383 (= e!638678 true)))

(declare-fun zeroValue!944 () V!42569)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun minValue!944 () V!42569)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17698 0))(
  ( (tuple2!17699 (_1!8860 (_ BitVec 64)) (_2!8860 V!42569)) )
))
(declare-datatypes ((List!24495 0))(
  ( (Nil!24492) (Cons!24491 (h!25709 tuple2!17698) (t!35030 List!24495)) )
))
(declare-datatypes ((ListLongMap!15675 0))(
  ( (ListLongMap!15676 (toList!7853 List!24495)) )
))
(declare-fun lt!498433 () ListLongMap!15675)

(declare-fun getCurrentListMapNoExtraKeys!4383 (array!73093 array!73095 (_ BitVec 32) (_ BitVec 32) V!42569 V!42569 (_ BitVec 32) Int) ListLongMap!15675)

(declare-fun dynLambda!2472 (Int (_ BitVec 64)) V!42569)

(assert (=> b!1121383 (= lt!498433 (getCurrentListMapNoExtraKeys!4383 lt!498436 (array!73096 (store (arr!35194 _values!996) i!673 (ValueCellFull!13331 (dynLambda!2472 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35731 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!498434 () ListLongMap!15675)

(assert (=> b!1121383 (= lt!498434 (getCurrentListMapNoExtraKeys!4383 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1121384 () Bool)

(declare-fun res!748738 () Bool)

(assert (=> b!1121384 (=> (not res!748738) (not e!638681))))

(assert (=> b!1121384 (= res!748738 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35730 _keys!1208))))))

(declare-fun b!1121385 () Bool)

(declare-fun res!748731 () Bool)

(assert (=> b!1121385 (=> (not res!748731) (not e!638681))))

(assert (=> b!1121385 (= res!748731 (and (= (size!35731 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35730 _keys!1208) (size!35731 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1121386 () Bool)

(assert (=> b!1121386 (= e!638681 e!638679)))

(declare-fun res!748729 () Bool)

(assert (=> b!1121386 (=> (not res!748729) (not e!638679))))

(assert (=> b!1121386 (= res!748729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498436 mask!1564))))

(assert (=> b!1121386 (= lt!498436 (array!73094 (store (arr!35193 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35730 _keys!1208)))))

(assert (= (and start!98086 res!748730) b!1121374))

(assert (= (and b!1121374 res!748735) b!1121385))

(assert (= (and b!1121385 res!748731) b!1121380))

(assert (= (and b!1121380 res!748733) b!1121375))

(assert (= (and b!1121375 res!748736) b!1121384))

(assert (= (and b!1121384 res!748738) b!1121381))

(assert (= (and b!1121381 res!748728) b!1121377))

(assert (= (and b!1121377 res!748734) b!1121386))

(assert (= (and b!1121386 res!748729) b!1121373))

(assert (= (and b!1121373 res!748737) b!1121376))

(assert (= (and b!1121376 (not res!748732)) b!1121383))

(assert (= (and b!1121379 condMapEmpty!43939) mapIsEmpty!43939))

(assert (= (and b!1121379 (not condMapEmpty!43939)) mapNonEmpty!43939))

(get-info :version)

(assert (= (and mapNonEmpty!43939 ((_ is ValueCellFull!13331) mapValue!43939)) b!1121378))

(assert (= (and b!1121379 ((_ is ValueCellFull!13331) mapDefault!43939)) b!1121382))

(assert (= start!98086 b!1121379))

(declare-fun b_lambda!18531 () Bool)

(assert (=> (not b_lambda!18531) (not b!1121383)))

(declare-fun t!35028 () Bool)

(declare-fun tb!8355 () Bool)

(assert (=> (and start!98086 (= defaultEntry!1004 defaultEntry!1004) t!35028) tb!8355))

(declare-fun result!17279 () Bool)

(assert (=> tb!8355 (= result!17279 tp_is_empty!28081)))

(assert (=> b!1121383 t!35028))

(declare-fun b_and!37897 () Bool)

(assert (= b_and!37895 (and (=> t!35028 result!17279) b_and!37897)))

(declare-fun m!1036863 () Bool)

(assert (=> b!1121377 m!1036863))

(declare-fun m!1036865 () Bool)

(assert (=> b!1121380 m!1036865))

(declare-fun m!1036867 () Bool)

(assert (=> start!98086 m!1036867))

(declare-fun m!1036869 () Bool)

(assert (=> start!98086 m!1036869))

(declare-fun m!1036871 () Bool)

(assert (=> b!1121381 m!1036871))

(declare-fun m!1036873 () Bool)

(assert (=> b!1121374 m!1036873))

(declare-fun m!1036875 () Bool)

(assert (=> b!1121375 m!1036875))

(declare-fun m!1036877 () Bool)

(assert (=> b!1121376 m!1036877))

(declare-fun m!1036879 () Bool)

(assert (=> b!1121376 m!1036879))

(declare-fun m!1036881 () Bool)

(assert (=> mapNonEmpty!43939 m!1036881))

(declare-fun m!1036883 () Bool)

(assert (=> b!1121383 m!1036883))

(declare-fun m!1036885 () Bool)

(assert (=> b!1121383 m!1036885))

(declare-fun m!1036887 () Bool)

(assert (=> b!1121383 m!1036887))

(declare-fun m!1036889 () Bool)

(assert (=> b!1121383 m!1036889))

(declare-fun m!1036891 () Bool)

(assert (=> b!1121386 m!1036891))

(declare-fun m!1036893 () Bool)

(assert (=> b!1121386 m!1036893))

(declare-fun m!1036895 () Bool)

(assert (=> b!1121373 m!1036895))

(check-sat (not b!1121375) (not b!1121374) (not b_lambda!18531) (not b!1121386) b_and!37897 (not b!1121373) (not b_next!23551) (not b!1121380) tp_is_empty!28081 (not mapNonEmpty!43939) (not start!98086) (not b!1121381) (not b!1121383) (not b!1121376))
(check-sat b_and!37897 (not b_next!23551))
