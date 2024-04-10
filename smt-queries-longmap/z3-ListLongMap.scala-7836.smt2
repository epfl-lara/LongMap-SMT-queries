; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97762 () Bool)

(assert start!97762)

(declare-fun b_free!23463 () Bool)

(declare-fun b_next!23463 () Bool)

(assert (=> start!97762 (= b_free!23463 (not b_next!23463))))

(declare-fun tp!83093 () Bool)

(declare-fun b_and!37737 () Bool)

(assert (=> start!97762 (= tp!83093 b_and!37737)))

(declare-fun b!1118138 () Bool)

(declare-fun res!746760 () Bool)

(declare-fun e!636900 () Bool)

(assert (=> b!1118138 (=> (not res!746760) (not e!636900))))

(declare-datatypes ((array!72877 0))(
  ( (array!72878 (arr!35091 (Array (_ BitVec 32) (_ BitVec 64))) (size!35627 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72877)

(declare-datatypes ((List!24408 0))(
  ( (Nil!24405) (Cons!24404 (h!25613 (_ BitVec 64)) (t!34889 List!24408)) )
))
(declare-fun arrayNoDuplicates!0 (array!72877 (_ BitVec 32) List!24408) Bool)

(assert (=> b!1118138 (= res!746760 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24405))))

(declare-fun b!1118139 () Bool)

(declare-fun e!636899 () Bool)

(assert (=> b!1118139 (= e!636900 e!636899)))

(declare-fun res!746759 () Bool)

(assert (=> b!1118139 (=> (not res!746759) (not e!636899))))

(declare-fun lt!497430 () array!72877)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72877 (_ BitVec 32)) Bool)

(assert (=> b!1118139 (= res!746759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497430 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1118139 (= lt!497430 (array!72878 (store (arr!35091 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35627 _keys!1208)))))

(declare-fun b!1118140 () Bool)

(declare-fun res!746761 () Bool)

(assert (=> b!1118140 (=> (not res!746761) (not e!636900))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118140 (= res!746761 (validKeyInArray!0 k0!934))))

(declare-fun b!1118141 () Bool)

(declare-fun res!746758 () Bool)

(assert (=> b!1118141 (=> (not res!746758) (not e!636899))))

(assert (=> b!1118141 (= res!746758 (arrayNoDuplicates!0 lt!497430 #b00000000000000000000000000000000 Nil!24405))))

(declare-fun mapIsEmpty!43807 () Bool)

(declare-fun mapRes!43807 () Bool)

(assert (=> mapIsEmpty!43807 mapRes!43807))

(declare-fun b!1118142 () Bool)

(declare-fun e!636901 () Bool)

(declare-fun e!636903 () Bool)

(assert (=> b!1118142 (= e!636901 (and e!636903 mapRes!43807))))

(declare-fun condMapEmpty!43807 () Bool)

(declare-datatypes ((V!42451 0))(
  ( (V!42452 (val!14053 Int)) )
))
(declare-datatypes ((ValueCell!13287 0))(
  ( (ValueCellFull!13287 (v!16686 V!42451)) (EmptyCell!13287) )
))
(declare-datatypes ((array!72879 0))(
  ( (array!72880 (arr!35092 (Array (_ BitVec 32) ValueCell!13287)) (size!35628 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72879)

(declare-fun mapDefault!43807 () ValueCell!13287)

(assert (=> b!1118142 (= condMapEmpty!43807 (= (arr!35092 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13287)) mapDefault!43807)))))

(declare-fun b!1118143 () Bool)

(declare-fun res!746762 () Bool)

(assert (=> b!1118143 (=> (not res!746762) (not e!636900))))

(assert (=> b!1118143 (= res!746762 (= (select (arr!35091 _keys!1208) i!673) k0!934))))

(declare-fun b!1118144 () Bool)

(declare-fun res!746754 () Bool)

(assert (=> b!1118144 (=> (not res!746754) (not e!636900))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118144 (= res!746754 (validMask!0 mask!1564))))

(declare-fun b!1118145 () Bool)

(declare-fun e!636902 () Bool)

(declare-fun tp_is_empty!27993 () Bool)

(assert (=> b!1118145 (= e!636902 tp_is_empty!27993)))

(declare-fun b!1118146 () Bool)

(declare-fun res!746756 () Bool)

(assert (=> b!1118146 (=> (not res!746756) (not e!636900))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1118146 (= res!746756 (and (= (size!35628 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35627 _keys!1208) (size!35628 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1118147 () Bool)

(declare-fun res!746755 () Bool)

(assert (=> b!1118147 (=> (not res!746755) (not e!636900))))

(assert (=> b!1118147 (= res!746755 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35627 _keys!1208))))))

(declare-fun b!1118149 () Bool)

(assert (=> b!1118149 (= e!636903 tp_is_empty!27993)))

(declare-fun mapNonEmpty!43807 () Bool)

(declare-fun tp!83092 () Bool)

(assert (=> mapNonEmpty!43807 (= mapRes!43807 (and tp!83092 e!636902))))

(declare-fun mapKey!43807 () (_ BitVec 32))

(declare-fun mapValue!43807 () ValueCell!13287)

(declare-fun mapRest!43807 () (Array (_ BitVec 32) ValueCell!13287))

(assert (=> mapNonEmpty!43807 (= (arr!35092 _values!996) (store mapRest!43807 mapKey!43807 mapValue!43807))))

(declare-fun b!1118150 () Bool)

(declare-fun e!636898 () Bool)

(assert (=> b!1118150 (= e!636898 true)))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!42451)

(declare-fun zeroValue!944 () V!42451)

(declare-datatypes ((tuple2!17622 0))(
  ( (tuple2!17623 (_1!8822 (_ BitVec 64)) (_2!8822 V!42451)) )
))
(declare-datatypes ((List!24409 0))(
  ( (Nil!24406) (Cons!24405 (h!25614 tuple2!17622) (t!34890 List!24409)) )
))
(declare-datatypes ((ListLongMap!15591 0))(
  ( (ListLongMap!15592 (toList!7811 List!24409)) )
))
(declare-fun lt!497432 () ListLongMap!15591)

(declare-fun getCurrentListMapNoExtraKeys!4301 (array!72877 array!72879 (_ BitVec 32) (_ BitVec 32) V!42451 V!42451 (_ BitVec 32) Int) ListLongMap!15591)

(assert (=> b!1118150 (= lt!497432 (getCurrentListMapNoExtraKeys!4301 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1118151 () Bool)

(assert (=> b!1118151 (= e!636899 (not e!636898))))

(declare-fun res!746763 () Bool)

(assert (=> b!1118151 (=> res!746763 e!636898)))

(assert (=> b!1118151 (= res!746763 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72877 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118151 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36696 0))(
  ( (Unit!36697) )
))
(declare-fun lt!497431 () Unit!36696)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72877 (_ BitVec 64) (_ BitVec 32)) Unit!36696)

(assert (=> b!1118151 (= lt!497431 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1118148 () Bool)

(declare-fun res!746757 () Bool)

(assert (=> b!1118148 (=> (not res!746757) (not e!636900))))

(assert (=> b!1118148 (= res!746757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!746764 () Bool)

(assert (=> start!97762 (=> (not res!746764) (not e!636900))))

(assert (=> start!97762 (= res!746764 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35627 _keys!1208))))))

(assert (=> start!97762 e!636900))

(assert (=> start!97762 tp_is_empty!27993))

(declare-fun array_inv!26960 (array!72877) Bool)

(assert (=> start!97762 (array_inv!26960 _keys!1208)))

(assert (=> start!97762 true))

(assert (=> start!97762 tp!83093))

(declare-fun array_inv!26961 (array!72879) Bool)

(assert (=> start!97762 (and (array_inv!26961 _values!996) e!636901)))

(assert (= (and start!97762 res!746764) b!1118144))

(assert (= (and b!1118144 res!746754) b!1118146))

(assert (= (and b!1118146 res!746756) b!1118148))

(assert (= (and b!1118148 res!746757) b!1118138))

(assert (= (and b!1118138 res!746760) b!1118147))

(assert (= (and b!1118147 res!746755) b!1118140))

(assert (= (and b!1118140 res!746761) b!1118143))

(assert (= (and b!1118143 res!746762) b!1118139))

(assert (= (and b!1118139 res!746759) b!1118141))

(assert (= (and b!1118141 res!746758) b!1118151))

(assert (= (and b!1118151 (not res!746763)) b!1118150))

(assert (= (and b!1118142 condMapEmpty!43807) mapIsEmpty!43807))

(assert (= (and b!1118142 (not condMapEmpty!43807)) mapNonEmpty!43807))

(get-info :version)

(assert (= (and mapNonEmpty!43807 ((_ is ValueCellFull!13287) mapValue!43807)) b!1118145))

(assert (= (and b!1118142 ((_ is ValueCellFull!13287) mapDefault!43807)) b!1118149))

(assert (= start!97762 b!1118142))

(declare-fun m!1033779 () Bool)

(assert (=> b!1118138 m!1033779))

(declare-fun m!1033781 () Bool)

(assert (=> b!1118139 m!1033781))

(declare-fun m!1033783 () Bool)

(assert (=> b!1118139 m!1033783))

(declare-fun m!1033785 () Bool)

(assert (=> b!1118150 m!1033785))

(declare-fun m!1033787 () Bool)

(assert (=> start!97762 m!1033787))

(declare-fun m!1033789 () Bool)

(assert (=> start!97762 m!1033789))

(declare-fun m!1033791 () Bool)

(assert (=> b!1118148 m!1033791))

(declare-fun m!1033793 () Bool)

(assert (=> mapNonEmpty!43807 m!1033793))

(declare-fun m!1033795 () Bool)

(assert (=> b!1118141 m!1033795))

(declare-fun m!1033797 () Bool)

(assert (=> b!1118151 m!1033797))

(declare-fun m!1033799 () Bool)

(assert (=> b!1118151 m!1033799))

(declare-fun m!1033801 () Bool)

(assert (=> b!1118144 m!1033801))

(declare-fun m!1033803 () Bool)

(assert (=> b!1118143 m!1033803))

(declare-fun m!1033805 () Bool)

(assert (=> b!1118140 m!1033805))

(check-sat (not b!1118144) b_and!37737 (not b!1118139) (not b!1118150) (not b!1118148) (not b!1118151) (not b_next!23463) tp_is_empty!27993 (not mapNonEmpty!43807) (not b!1118138) (not b!1118141) (not b!1118140) (not start!97762))
(check-sat b_and!37737 (not b_next!23463))
