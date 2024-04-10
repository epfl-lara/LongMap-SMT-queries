; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98220 () Bool)

(assert start!98220)

(declare-fun b_free!23921 () Bool)

(declare-fun b_next!23921 () Bool)

(assert (=> start!98220 (= b_free!23921 (not b_next!23921))))

(declare-fun tp!84467 () Bool)

(declare-fun b_and!38625 () Bool)

(assert (=> start!98220 (= tp!84467 b_and!38625)))

(declare-fun res!755649 () Bool)

(declare-fun e!643685 () Bool)

(assert (=> start!98220 (=> (not res!755649) (not e!643685))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73759 0))(
  ( (array!73760 (arr!35532 (Array (_ BitVec 32) (_ BitVec 64))) (size!36068 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73759)

(assert (=> start!98220 (= res!755649 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36068 _keys!1208))))))

(assert (=> start!98220 e!643685))

(declare-fun tp_is_empty!28451 () Bool)

(assert (=> start!98220 tp_is_empty!28451))

(declare-fun array_inv!27256 (array!73759) Bool)

(assert (=> start!98220 (array_inv!27256 _keys!1208)))

(assert (=> start!98220 true))

(assert (=> start!98220 tp!84467))

(declare-datatypes ((V!43061 0))(
  ( (V!43062 (val!14282 Int)) )
))
(declare-datatypes ((ValueCell!13516 0))(
  ( (ValueCellFull!13516 (v!16915 V!43061)) (EmptyCell!13516) )
))
(declare-datatypes ((array!73761 0))(
  ( (array!73762 (arr!35533 (Array (_ BitVec 32) ValueCell!13516)) (size!36069 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73761)

(declare-fun e!643683 () Bool)

(declare-fun array_inv!27257 (array!73761) Bool)

(assert (=> start!98220 (and (array_inv!27257 _values!996) e!643683)))

(declare-fun bm!48522 () Bool)

(declare-datatypes ((Unit!37053 0))(
  ( (Unit!37054) )
))
(declare-fun call!48528 () Unit!37053)

(declare-fun call!48526 () Unit!37053)

(assert (=> bm!48522 (= call!48528 call!48526)))

(declare-fun mapNonEmpty!44494 () Bool)

(declare-fun mapRes!44494 () Bool)

(declare-fun tp!84466 () Bool)

(declare-fun e!643689 () Bool)

(assert (=> mapNonEmpty!44494 (= mapRes!44494 (and tp!84466 e!643689))))

(declare-fun mapValue!44494 () ValueCell!13516)

(declare-fun mapKey!44494 () (_ BitVec 32))

(declare-fun mapRest!44494 () (Array (_ BitVec 32) ValueCell!13516))

(assert (=> mapNonEmpty!44494 (= (arr!35533 _values!996) (store mapRest!44494 mapKey!44494 mapValue!44494))))

(declare-fun b!1131036 () Bool)

(declare-fun e!643690 () Bool)

(declare-fun e!643680 () Bool)

(assert (=> b!1131036 (= e!643690 e!643680)))

(declare-fun res!755644 () Bool)

(assert (=> b!1131036 (=> res!755644 e!643680)))

(assert (=> b!1131036 (= res!755644 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36068 _keys!1208))))))

(declare-fun lt!502335 () Unit!37053)

(declare-fun e!643691 () Unit!37053)

(assert (=> b!1131036 (= lt!502335 e!643691)))

(declare-fun c!110115 () Bool)

(declare-fun lt!502333 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1131036 (= c!110115 (and (not lt!502333) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1131036 (= lt!502333 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1131037 () Bool)

(declare-fun res!755643 () Bool)

(declare-fun e!643684 () Bool)

(assert (=> b!1131037 (=> (not res!755643) (not e!643684))))

(declare-fun lt!502326 () array!73759)

(declare-datatypes ((List!24762 0))(
  ( (Nil!24759) (Cons!24758 (h!25967 (_ BitVec 64)) (t!35675 List!24762)) )
))
(declare-fun arrayNoDuplicates!0 (array!73759 (_ BitVec 32) List!24762) Bool)

(assert (=> b!1131037 (= res!755643 (arrayNoDuplicates!0 lt!502326 #b00000000000000000000000000000000 Nil!24759))))

(declare-fun b!1131038 () Bool)

(declare-fun res!755646 () Bool)

(assert (=> b!1131038 (=> (not res!755646) (not e!643685))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1131038 (= res!755646 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36068 _keys!1208))))))

(declare-fun b!1131039 () Bool)

(declare-fun e!643686 () Unit!37053)

(assert (=> b!1131039 (= e!643691 e!643686)))

(declare-fun c!110113 () Bool)

(assert (=> b!1131039 (= c!110113 (and (not lt!502333) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1131040 () Bool)

(declare-fun res!755645 () Bool)

(assert (=> b!1131040 (=> (not res!755645) (not e!643685))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73759 (_ BitVec 32)) Bool)

(assert (=> b!1131040 (= res!755645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-datatypes ((tuple2!17998 0))(
  ( (tuple2!17999 (_1!9010 (_ BitVec 64)) (_2!9010 V!43061)) )
))
(declare-datatypes ((List!24763 0))(
  ( (Nil!24760) (Cons!24759 (h!25968 tuple2!17998) (t!35676 List!24763)) )
))
(declare-datatypes ((ListLongMap!15967 0))(
  ( (ListLongMap!15968 (toList!7999 List!24763)) )
))
(declare-fun lt!502324 () ListLongMap!15967)

(declare-fun call!48527 () ListLongMap!15967)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun call!48525 () Bool)

(declare-fun bm!48523 () Bool)

(declare-fun contains!6521 (ListLongMap!15967 (_ BitVec 64)) Bool)

(assert (=> bm!48523 (= call!48525 (contains!6521 (ite c!110115 lt!502324 call!48527) k!934))))

(declare-fun b!1131041 () Bool)

(declare-fun e!643682 () Bool)

(declare-fun e!643681 () Bool)

(assert (=> b!1131041 (= e!643682 e!643681)))

(declare-fun res!755640 () Bool)

(assert (=> b!1131041 (=> res!755640 e!643681)))

(assert (=> b!1131041 (= res!755640 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!43061)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!502323 () array!73761)

(declare-fun lt!502334 () ListLongMap!15967)

(declare-fun minValue!944 () V!43061)

(declare-fun getCurrentListMapNoExtraKeys!4486 (array!73759 array!73761 (_ BitVec 32) (_ BitVec 32) V!43061 V!43061 (_ BitVec 32) Int) ListLongMap!15967)

(assert (=> b!1131041 (= lt!502334 (getCurrentListMapNoExtraKeys!4486 lt!502326 lt!502323 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2560 (Int (_ BitVec 64)) V!43061)

(assert (=> b!1131041 (= lt!502323 (array!73762 (store (arr!35533 _values!996) i!673 (ValueCellFull!13516 (dynLambda!2560 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36069 _values!996)))))

(declare-fun lt!502332 () ListLongMap!15967)

(assert (=> b!1131041 (= lt!502332 (getCurrentListMapNoExtraKeys!4486 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun call!48530 () ListLongMap!15967)

(declare-fun bm!48524 () Bool)

(assert (=> bm!48524 (= call!48530 (getCurrentListMapNoExtraKeys!4486 lt!502326 lt!502323 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48525 () Bool)

(declare-fun call!48529 () ListLongMap!15967)

(assert (=> bm!48525 (= call!48527 call!48529)))

(declare-fun bm!48526 () Bool)

(declare-fun lt!502337 () ListLongMap!15967)

(declare-fun addStillContains!708 (ListLongMap!15967 (_ BitVec 64) V!43061 (_ BitVec 64)) Unit!37053)

(assert (=> bm!48526 (= call!48526 (addStillContains!708 lt!502337 (ite (or c!110115 c!110113) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110115 c!110113) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1131042 () Bool)

(assert (=> b!1131042 (= e!643689 tp_is_empty!28451)))

(declare-fun b!1131043 () Bool)

(declare-fun e!643678 () Bool)

(assert (=> b!1131043 (= e!643681 e!643678)))

(declare-fun res!755648 () Bool)

(assert (=> b!1131043 (=> res!755648 e!643678)))

(assert (=> b!1131043 (= res!755648 (not (= (select (arr!35532 _keys!1208) from!1455) k!934)))))

(declare-fun e!643692 () Bool)

(assert (=> b!1131043 e!643692))

(declare-fun c!110114 () Bool)

(assert (=> b!1131043 (= c!110114 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!502325 () Unit!37053)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!428 (array!73759 array!73761 (_ BitVec 32) (_ BitVec 32) V!43061 V!43061 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37053)

(assert (=> b!1131043 (= lt!502325 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!428 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131044 () Bool)

(declare-fun res!755651 () Bool)

(assert (=> b!1131044 (=> (not res!755651) (not e!643685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1131044 (= res!755651 (validMask!0 mask!1564))))

(declare-fun b!1131045 () Bool)

(declare-fun call!48531 () ListLongMap!15967)

(assert (=> b!1131045 (= e!643692 (= call!48530 call!48531))))

(declare-fun b!1131046 () Bool)

(assert (=> b!1131046 (= e!643680 true)))

(declare-fun lt!502328 () Bool)

(declare-fun getCurrentListMap!4429 (array!73759 array!73761 (_ BitVec 32) (_ BitVec 32) V!43061 V!43061 (_ BitVec 32) Int) ListLongMap!15967)

(assert (=> b!1131046 (= lt!502328 (contains!6521 (getCurrentListMap!4429 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun b!1131047 () Bool)

(assert (=> b!1131047 (= e!643678 e!643690)))

(declare-fun res!755639 () Bool)

(assert (=> b!1131047 (=> res!755639 e!643690)))

(assert (=> b!1131047 (= res!755639 (not (contains!6521 lt!502337 k!934)))))

(assert (=> b!1131047 (= lt!502337 (getCurrentListMapNoExtraKeys!4486 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131048 () Bool)

(declare-fun res!755652 () Bool)

(assert (=> b!1131048 (=> (not res!755652) (not e!643685))))

(assert (=> b!1131048 (= res!755652 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24759))))

(declare-fun mapIsEmpty!44494 () Bool)

(assert (=> mapIsEmpty!44494 mapRes!44494))

(declare-fun b!1131049 () Bool)

(declare-fun res!755647 () Bool)

(assert (=> b!1131049 (=> (not res!755647) (not e!643685))))

(assert (=> b!1131049 (= res!755647 (and (= (size!36069 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36068 _keys!1208) (size!36069 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1131050 () Bool)

(declare-fun c!110112 () Bool)

(assert (=> b!1131050 (= c!110112 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!502333))))

(declare-fun e!643688 () Unit!37053)

(assert (=> b!1131050 (= e!643686 e!643688)))

(declare-fun b!1131051 () Bool)

(declare-fun e!643679 () Bool)

(assert (=> b!1131051 (= e!643683 (and e!643679 mapRes!44494))))

(declare-fun condMapEmpty!44494 () Bool)

(declare-fun mapDefault!44494 () ValueCell!13516)

