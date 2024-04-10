; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97876 () Bool)

(assert start!97876)

(declare-fun b_free!23577 () Bool)

(declare-fun b_next!23577 () Bool)

(assert (=> start!97876 (= b_free!23577 (not b_next!23577))))

(declare-fun tp!83434 () Bool)

(declare-fun b_and!37937 () Bool)

(assert (=> start!97876 (= tp!83434 b_and!37937)))

(declare-fun b!1120633 () Bool)

(declare-fun res!748645 () Bool)

(declare-fun e!638110 () Bool)

(assert (=> b!1120633 (=> (not res!748645) (not e!638110))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((array!73095 0))(
  ( (array!73096 (arr!35200 (Array (_ BitVec 32) (_ BitVec 64))) (size!35736 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73095)

(assert (=> b!1120633 (= res!748645 (= (select (arr!35200 _keys!1208) i!673) k0!934))))

(declare-fun b!1120634 () Bool)

(declare-fun res!748651 () Bool)

(assert (=> b!1120634 (=> (not res!748651) (not e!638110))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73095 (_ BitVec 32)) Bool)

(assert (=> b!1120634 (= res!748651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1120635 () Bool)

(declare-fun e!638109 () Bool)

(declare-fun tp_is_empty!28107 () Bool)

(assert (=> b!1120635 (= e!638109 tp_is_empty!28107)))

(declare-fun b!1120636 () Bool)

(declare-fun res!748649 () Bool)

(declare-fun e!638108 () Bool)

(assert (=> b!1120636 (=> (not res!748649) (not e!638108))))

(declare-fun lt!498086 () array!73095)

(declare-datatypes ((List!24489 0))(
  ( (Nil!24486) (Cons!24485 (h!25694 (_ BitVec 64)) (t!35058 List!24489)) )
))
(declare-fun arrayNoDuplicates!0 (array!73095 (_ BitVec 32) List!24489) Bool)

(assert (=> b!1120636 (= res!748649 (arrayNoDuplicates!0 lt!498086 #b00000000000000000000000000000000 Nil!24486))))

(declare-fun b!1120637 () Bool)

(declare-fun res!748650 () Bool)

(assert (=> b!1120637 (=> (not res!748650) (not e!638110))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1120637 (= res!748650 (validKeyInArray!0 k0!934))))

(declare-datatypes ((V!42603 0))(
  ( (V!42604 (val!14110 Int)) )
))
(declare-fun zeroValue!944 () V!42603)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!47010 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13344 0))(
  ( (ValueCellFull!13344 (v!16743 V!42603)) (EmptyCell!13344) )
))
(declare-datatypes ((array!73097 0))(
  ( (array!73098 (arr!35201 (Array (_ BitVec 32) ValueCell!13344)) (size!35737 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73097)

(declare-fun minValue!944 () V!42603)

(declare-datatypes ((tuple2!17704 0))(
  ( (tuple2!17705 (_1!8863 (_ BitVec 64)) (_2!8863 V!42603)) )
))
(declare-datatypes ((List!24490 0))(
  ( (Nil!24487) (Cons!24486 (h!25695 tuple2!17704) (t!35059 List!24490)) )
))
(declare-datatypes ((ListLongMap!15673 0))(
  ( (ListLongMap!15674 (toList!7852 List!24490)) )
))
(declare-fun call!47014 () ListLongMap!15673)

(declare-fun getCurrentListMapNoExtraKeys!4342 (array!73095 array!73097 (_ BitVec 32) (_ BitVec 32) V!42603 V!42603 (_ BitVec 32) Int) ListLongMap!15673)

(assert (=> bm!47010 (= call!47014 (getCurrentListMapNoExtraKeys!4342 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1120638 () Bool)

(declare-fun e!638111 () Bool)

(assert (=> b!1120638 (= e!638111 tp_is_empty!28107)))

(declare-fun e!638107 () Bool)

(declare-fun b!1120639 () Bool)

(declare-fun call!47013 () ListLongMap!15673)

(declare-fun -!1065 (ListLongMap!15673 (_ BitVec 64)) ListLongMap!15673)

(assert (=> b!1120639 (= e!638107 (= call!47013 (-!1065 call!47014 k0!934)))))

(declare-fun b!1120640 () Bool)

(declare-fun e!638105 () Bool)

(declare-fun mapRes!43978 () Bool)

(assert (=> b!1120640 (= e!638105 (and e!638109 mapRes!43978))))

(declare-fun condMapEmpty!43978 () Bool)

(declare-fun mapDefault!43978 () ValueCell!13344)

(assert (=> b!1120640 (= condMapEmpty!43978 (= (arr!35201 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13344)) mapDefault!43978)))))

(declare-fun mapNonEmpty!43978 () Bool)

(declare-fun tp!83435 () Bool)

(assert (=> mapNonEmpty!43978 (= mapRes!43978 (and tp!83435 e!638111))))

(declare-fun mapRest!43978 () (Array (_ BitVec 32) ValueCell!13344))

(declare-fun mapKey!43978 () (_ BitVec 32))

(declare-fun mapValue!43978 () ValueCell!13344)

(assert (=> mapNonEmpty!43978 (= (arr!35201 _values!996) (store mapRest!43978 mapKey!43978 mapValue!43978))))

(declare-fun bm!47011 () Bool)

(declare-fun lt!498089 () array!73097)

(assert (=> bm!47011 (= call!47013 (getCurrentListMapNoExtraKeys!4342 lt!498086 lt!498089 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1120642 () Bool)

(declare-fun res!748647 () Bool)

(assert (=> b!1120642 (=> (not res!748647) (not e!638110))))

(assert (=> b!1120642 (= res!748647 (and (= (size!35737 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35736 _keys!1208) (size!35737 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1120643 () Bool)

(declare-fun res!748642 () Bool)

(assert (=> b!1120643 (=> (not res!748642) (not e!638110))))

(assert (=> b!1120643 (= res!748642 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24486))))

(declare-fun b!1120644 () Bool)

(assert (=> b!1120644 (= e!638107 (= call!47013 call!47014))))

(declare-fun b!1120645 () Bool)

(declare-fun e!638112 () Bool)

(assert (=> b!1120645 (= e!638108 (not e!638112))))

(declare-fun res!748648 () Bool)

(assert (=> b!1120645 (=> res!748648 e!638112)))

(assert (=> b!1120645 (= res!748648 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1120645 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36770 0))(
  ( (Unit!36771) )
))
(declare-fun lt!498085 () Unit!36770)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73095 (_ BitVec 64) (_ BitVec 32)) Unit!36770)

(assert (=> b!1120645 (= lt!498085 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1120646 () Bool)

(declare-fun res!748640 () Bool)

(assert (=> b!1120646 (=> (not res!748640) (not e!638110))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1120646 (= res!748640 (validMask!0 mask!1564))))

(declare-fun b!1120647 () Bool)

(declare-fun res!748643 () Bool)

(assert (=> b!1120647 (=> (not res!748643) (not e!638110))))

(assert (=> b!1120647 (= res!748643 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35736 _keys!1208))))))

(declare-fun b!1120648 () Bool)

(declare-fun e!638104 () Bool)

(assert (=> b!1120648 (= e!638104 true)))

(assert (=> b!1120648 e!638107))

(declare-fun c!109356 () Bool)

(assert (=> b!1120648 (= c!109356 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!498088 () Unit!36770)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!315 (array!73095 array!73097 (_ BitVec 32) (_ BitVec 32) V!42603 V!42603 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36770)

(assert (=> b!1120648 (= lt!498088 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!315 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1120649 () Bool)

(assert (=> b!1120649 (= e!638110 e!638108)))

(declare-fun res!748646 () Bool)

(assert (=> b!1120649 (=> (not res!748646) (not e!638108))))

(assert (=> b!1120649 (= res!748646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498086 mask!1564))))

(assert (=> b!1120649 (= lt!498086 (array!73096 (store (arr!35200 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35736 _keys!1208)))))

(declare-fun mapIsEmpty!43978 () Bool)

(assert (=> mapIsEmpty!43978 mapRes!43978))

(declare-fun b!1120641 () Bool)

(assert (=> b!1120641 (= e!638112 e!638104)))

(declare-fun res!748641 () Bool)

(assert (=> b!1120641 (=> res!748641 e!638104)))

(assert (=> b!1120641 (= res!748641 (not (= from!1455 i!673)))))

(declare-fun lt!498084 () ListLongMap!15673)

(assert (=> b!1120641 (= lt!498084 (getCurrentListMapNoExtraKeys!4342 lt!498086 lt!498089 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2445 (Int (_ BitVec 64)) V!42603)

(assert (=> b!1120641 (= lt!498089 (array!73098 (store (arr!35201 _values!996) i!673 (ValueCellFull!13344 (dynLambda!2445 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35737 _values!996)))))

(declare-fun lt!498087 () ListLongMap!15673)

(assert (=> b!1120641 (= lt!498087 (getCurrentListMapNoExtraKeys!4342 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!748644 () Bool)

(assert (=> start!97876 (=> (not res!748644) (not e!638110))))

(assert (=> start!97876 (= res!748644 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35736 _keys!1208))))))

(assert (=> start!97876 e!638110))

(assert (=> start!97876 tp_is_empty!28107))

(declare-fun array_inv!27034 (array!73095) Bool)

(assert (=> start!97876 (array_inv!27034 _keys!1208)))

(assert (=> start!97876 true))

(assert (=> start!97876 tp!83434))

(declare-fun array_inv!27035 (array!73097) Bool)

(assert (=> start!97876 (and (array_inv!27035 _values!996) e!638105)))

(assert (= (and start!97876 res!748644) b!1120646))

(assert (= (and b!1120646 res!748640) b!1120642))

(assert (= (and b!1120642 res!748647) b!1120634))

(assert (= (and b!1120634 res!748651) b!1120643))

(assert (= (and b!1120643 res!748642) b!1120647))

(assert (= (and b!1120647 res!748643) b!1120637))

(assert (= (and b!1120637 res!748650) b!1120633))

(assert (= (and b!1120633 res!748645) b!1120649))

(assert (= (and b!1120649 res!748646) b!1120636))

(assert (= (and b!1120636 res!748649) b!1120645))

(assert (= (and b!1120645 (not res!748648)) b!1120641))

(assert (= (and b!1120641 (not res!748641)) b!1120648))

(assert (= (and b!1120648 c!109356) b!1120639))

(assert (= (and b!1120648 (not c!109356)) b!1120644))

(assert (= (or b!1120639 b!1120644) bm!47011))

(assert (= (or b!1120639 b!1120644) bm!47010))

(assert (= (and b!1120640 condMapEmpty!43978) mapIsEmpty!43978))

(assert (= (and b!1120640 (not condMapEmpty!43978)) mapNonEmpty!43978))

(get-info :version)

(assert (= (and mapNonEmpty!43978 ((_ is ValueCellFull!13344) mapValue!43978)) b!1120638))

(assert (= (and b!1120640 ((_ is ValueCellFull!13344) mapDefault!43978)) b!1120635))

(assert (= start!97876 b!1120640))

(declare-fun b_lambda!18547 () Bool)

(assert (=> (not b_lambda!18547) (not b!1120641)))

(declare-fun t!35057 () Bool)

(declare-fun tb!8389 () Bool)

(assert (=> (and start!97876 (= defaultEntry!1004 defaultEntry!1004) t!35057) tb!8389))

(declare-fun result!17339 () Bool)

(assert (=> tb!8389 (= result!17339 tp_is_empty!28107)))

(assert (=> b!1120641 t!35057))

(declare-fun b_and!37939 () Bool)

(assert (= b_and!37937 (and (=> t!35057 result!17339) b_and!37939)))

(declare-fun m!1035641 () Bool)

(assert (=> bm!47010 m!1035641))

(declare-fun m!1035643 () Bool)

(assert (=> b!1120641 m!1035643))

(declare-fun m!1035645 () Bool)

(assert (=> b!1120641 m!1035645))

(declare-fun m!1035647 () Bool)

(assert (=> b!1120641 m!1035647))

(declare-fun m!1035649 () Bool)

(assert (=> b!1120641 m!1035649))

(declare-fun m!1035651 () Bool)

(assert (=> b!1120636 m!1035651))

(declare-fun m!1035653 () Bool)

(assert (=> mapNonEmpty!43978 m!1035653))

(declare-fun m!1035655 () Bool)

(assert (=> start!97876 m!1035655))

(declare-fun m!1035657 () Bool)

(assert (=> start!97876 m!1035657))

(declare-fun m!1035659 () Bool)

(assert (=> bm!47011 m!1035659))

(declare-fun m!1035661 () Bool)

(assert (=> b!1120646 m!1035661))

(declare-fun m!1035663 () Bool)

(assert (=> b!1120643 m!1035663))

(declare-fun m!1035665 () Bool)

(assert (=> b!1120637 m!1035665))

(declare-fun m!1035667 () Bool)

(assert (=> b!1120649 m!1035667))

(declare-fun m!1035669 () Bool)

(assert (=> b!1120649 m!1035669))

(declare-fun m!1035671 () Bool)

(assert (=> b!1120639 m!1035671))

(declare-fun m!1035673 () Bool)

(assert (=> b!1120634 m!1035673))

(declare-fun m!1035675 () Bool)

(assert (=> b!1120648 m!1035675))

(declare-fun m!1035677 () Bool)

(assert (=> b!1120645 m!1035677))

(declare-fun m!1035679 () Bool)

(assert (=> b!1120645 m!1035679))

(declare-fun m!1035681 () Bool)

(assert (=> b!1120633 m!1035681))

(check-sat (not b!1120646) (not b_next!23577) (not b!1120649) (not b!1120639) (not b_lambda!18547) (not b!1120645) tp_is_empty!28107 (not b!1120636) (not b!1120643) (not b!1120648) (not b!1120637) (not mapNonEmpty!43978) (not start!97876) b_and!37939 (not b!1120634) (not bm!47010) (not b!1120641) (not bm!47011))
(check-sat b_and!37939 (not b_next!23577))
