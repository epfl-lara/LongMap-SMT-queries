; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98020 () Bool)

(assert start!98020)

(declare-fun b_free!23485 () Bool)

(declare-fun b_next!23485 () Bool)

(assert (=> start!98020 (= b_free!23485 (not b_next!23485))))

(declare-fun tp!83158 () Bool)

(declare-fun b_and!37769 () Bool)

(assert (=> start!98020 (= tp!83158 b_and!37769)))

(declare-fun b!1119927 () Bool)

(declare-fun e!637986 () Bool)

(declare-fun e!637984 () Bool)

(declare-fun mapRes!43840 () Bool)

(assert (=> b!1119927 (= e!637986 (and e!637984 mapRes!43840))))

(declare-fun condMapEmpty!43840 () Bool)

(declare-datatypes ((V!42481 0))(
  ( (V!42482 (val!14064 Int)) )
))
(declare-datatypes ((ValueCell!13298 0))(
  ( (ValueCellFull!13298 (v!16693 V!42481)) (EmptyCell!13298) )
))
(declare-datatypes ((array!72967 0))(
  ( (array!72968 (arr!35130 (Array (_ BitVec 32) ValueCell!13298)) (size!35667 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72967)

(declare-fun mapDefault!43840 () ValueCell!13298)

(assert (=> b!1119927 (= condMapEmpty!43840 (= (arr!35130 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13298)) mapDefault!43840)))))

(declare-fun b!1119928 () Bool)

(declare-fun e!637988 () Bool)

(declare-fun e!637983 () Bool)

(assert (=> b!1119928 (= e!637988 e!637983)))

(declare-fun res!747640 () Bool)

(assert (=> b!1119928 (=> (not res!747640) (not e!637983))))

(declare-datatypes ((array!72969 0))(
  ( (array!72970 (arr!35131 (Array (_ BitVec 32) (_ BitVec 64))) (size!35668 (_ BitVec 32))) )
))
(declare-fun lt!498045 () array!72969)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72969 (_ BitVec 32)) Bool)

(assert (=> b!1119928 (= res!747640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498045 mask!1564))))

(declare-fun _keys!1208 () array!72969)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1119928 (= lt!498045 (array!72970 (store (arr!35131 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35668 _keys!1208)))))

(declare-fun b!1119929 () Bool)

(declare-fun res!747644 () Bool)

(assert (=> b!1119929 (=> (not res!747644) (not e!637988))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1119929 (= res!747644 (validKeyInArray!0 k0!934))))

(declare-fun b!1119930 () Bool)

(declare-fun res!747646 () Bool)

(assert (=> b!1119930 (=> (not res!747646) (not e!637988))))

(assert (=> b!1119930 (= res!747646 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35668 _keys!1208))))))

(declare-fun res!747649 () Bool)

(assert (=> start!98020 (=> (not res!747649) (not e!637988))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98020 (= res!747649 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35668 _keys!1208))))))

(assert (=> start!98020 e!637988))

(declare-fun tp_is_empty!28015 () Bool)

(assert (=> start!98020 tp_is_empty!28015))

(declare-fun array_inv!27052 (array!72969) Bool)

(assert (=> start!98020 (array_inv!27052 _keys!1208)))

(assert (=> start!98020 true))

(assert (=> start!98020 tp!83158))

(declare-fun array_inv!27053 (array!72967) Bool)

(assert (=> start!98020 (and (array_inv!27053 _values!996) e!637986)))

(declare-fun b!1119931 () Bool)

(declare-fun res!747642 () Bool)

(assert (=> b!1119931 (=> (not res!747642) (not e!637988))))

(assert (=> b!1119931 (= res!747642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1119932 () Bool)

(declare-fun res!747645 () Bool)

(assert (=> b!1119932 (=> (not res!747645) (not e!637988))))

(declare-datatypes ((List!24450 0))(
  ( (Nil!24447) (Cons!24446 (h!25664 (_ BitVec 64)) (t!34923 List!24450)) )
))
(declare-fun arrayNoDuplicates!0 (array!72969 (_ BitVec 32) List!24450) Bool)

(assert (=> b!1119932 (= res!747645 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24447))))

(declare-fun b!1119933 () Bool)

(declare-fun res!747647 () Bool)

(assert (=> b!1119933 (=> (not res!747647) (not e!637988))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1119933 (= res!747647 (validMask!0 mask!1564))))

(declare-fun b!1119934 () Bool)

(declare-fun res!747648 () Bool)

(assert (=> b!1119934 (=> (not res!747648) (not e!637988))))

(assert (=> b!1119934 (= res!747648 (= (select (arr!35131 _keys!1208) i!673) k0!934))))

(declare-fun b!1119935 () Bool)

(declare-fun e!637987 () Bool)

(assert (=> b!1119935 (= e!637983 (not e!637987))))

(declare-fun res!747641 () Bool)

(assert (=> b!1119935 (=> res!747641 e!637987)))

(assert (=> b!1119935 (= res!747641 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72969 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1119935 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36693 0))(
  ( (Unit!36694) )
))
(declare-fun lt!498044 () Unit!36693)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72969 (_ BitVec 64) (_ BitVec 32)) Unit!36693)

(assert (=> b!1119935 (= lt!498044 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1119936 () Bool)

(declare-fun res!747639 () Bool)

(assert (=> b!1119936 (=> (not res!747639) (not e!637983))))

(assert (=> b!1119936 (= res!747639 (arrayNoDuplicates!0 lt!498045 #b00000000000000000000000000000000 Nil!24447))))

(declare-fun b!1119937 () Bool)

(assert (=> b!1119937 (= e!637987 true)))

(declare-fun zeroValue!944 () V!42481)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!17660 0))(
  ( (tuple2!17661 (_1!8841 (_ BitVec 64)) (_2!8841 V!42481)) )
))
(declare-datatypes ((List!24451 0))(
  ( (Nil!24448) (Cons!24447 (h!25665 tuple2!17660) (t!34924 List!24451)) )
))
(declare-datatypes ((ListLongMap!15637 0))(
  ( (ListLongMap!15638 (toList!7834 List!24451)) )
))
(declare-fun lt!498046 () ListLongMap!15637)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42481)

(declare-fun getCurrentListMapNoExtraKeys!4364 (array!72969 array!72967 (_ BitVec 32) (_ BitVec 32) V!42481 V!42481 (_ BitVec 32) Int) ListLongMap!15637)

(assert (=> b!1119937 (= lt!498046 (getCurrentListMapNoExtraKeys!4364 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1119938 () Bool)

(declare-fun res!747643 () Bool)

(assert (=> b!1119938 (=> (not res!747643) (not e!637988))))

(assert (=> b!1119938 (= res!747643 (and (= (size!35667 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35668 _keys!1208) (size!35667 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!43840 () Bool)

(declare-fun tp!83159 () Bool)

(declare-fun e!637989 () Bool)

(assert (=> mapNonEmpty!43840 (= mapRes!43840 (and tp!83159 e!637989))))

(declare-fun mapValue!43840 () ValueCell!13298)

(declare-fun mapRest!43840 () (Array (_ BitVec 32) ValueCell!13298))

(declare-fun mapKey!43840 () (_ BitVec 32))

(assert (=> mapNonEmpty!43840 (= (arr!35130 _values!996) (store mapRest!43840 mapKey!43840 mapValue!43840))))

(declare-fun mapIsEmpty!43840 () Bool)

(assert (=> mapIsEmpty!43840 mapRes!43840))

(declare-fun b!1119939 () Bool)

(assert (=> b!1119939 (= e!637989 tp_is_empty!28015)))

(declare-fun b!1119940 () Bool)

(assert (=> b!1119940 (= e!637984 tp_is_empty!28015)))

(assert (= (and start!98020 res!747649) b!1119933))

(assert (= (and b!1119933 res!747647) b!1119938))

(assert (= (and b!1119938 res!747643) b!1119931))

(assert (= (and b!1119931 res!747642) b!1119932))

(assert (= (and b!1119932 res!747645) b!1119930))

(assert (= (and b!1119930 res!747646) b!1119929))

(assert (= (and b!1119929 res!747644) b!1119934))

(assert (= (and b!1119934 res!747648) b!1119928))

(assert (= (and b!1119928 res!747640) b!1119936))

(assert (= (and b!1119936 res!747639) b!1119935))

(assert (= (and b!1119935 (not res!747641)) b!1119937))

(assert (= (and b!1119927 condMapEmpty!43840) mapIsEmpty!43840))

(assert (= (and b!1119927 (not condMapEmpty!43840)) mapNonEmpty!43840))

(get-info :version)

(assert (= (and mapNonEmpty!43840 ((_ is ValueCellFull!13298) mapValue!43840)) b!1119939))

(assert (= (and b!1119927 ((_ is ValueCellFull!13298) mapDefault!43840)) b!1119940))

(assert (= start!98020 b!1119927))

(declare-fun m!1035759 () Bool)

(assert (=> start!98020 m!1035759))

(declare-fun m!1035761 () Bool)

(assert (=> start!98020 m!1035761))

(declare-fun m!1035763 () Bool)

(assert (=> b!1119933 m!1035763))

(declare-fun m!1035765 () Bool)

(assert (=> b!1119928 m!1035765))

(declare-fun m!1035767 () Bool)

(assert (=> b!1119928 m!1035767))

(declare-fun m!1035769 () Bool)

(assert (=> b!1119929 m!1035769))

(declare-fun m!1035771 () Bool)

(assert (=> b!1119934 m!1035771))

(declare-fun m!1035773 () Bool)

(assert (=> b!1119936 m!1035773))

(declare-fun m!1035775 () Bool)

(assert (=> b!1119932 m!1035775))

(declare-fun m!1035777 () Bool)

(assert (=> b!1119935 m!1035777))

(declare-fun m!1035779 () Bool)

(assert (=> b!1119935 m!1035779))

(declare-fun m!1035781 () Bool)

(assert (=> b!1119931 m!1035781))

(declare-fun m!1035783 () Bool)

(assert (=> b!1119937 m!1035783))

(declare-fun m!1035785 () Bool)

(assert (=> mapNonEmpty!43840 m!1035785))

(check-sat (not b_next!23485) (not b!1119928) (not b!1119937) (not b!1119932) (not b!1119931) b_and!37769 tp_is_empty!28015 (not b!1119936) (not mapNonEmpty!43840) (not b!1119929) (not b!1119935) (not start!98020) (not b!1119933))
(check-sat b_and!37769 (not b_next!23485))
