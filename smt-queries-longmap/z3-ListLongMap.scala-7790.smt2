; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97720 () Bool)

(assert start!97720)

(declare-fun b!1114003 () Bool)

(declare-fun res!743072 () Bool)

(declare-fun e!635209 () Bool)

(assert (=> b!1114003 (=> (not res!743072) (not e!635209))))

(declare-datatypes ((array!72381 0))(
  ( (array!72382 (arr!34837 (Array (_ BitVec 32) (_ BitVec 64))) (size!35374 (_ BitVec 32))) )
))
(declare-fun lt!497070 () array!72381)

(declare-datatypes ((List!24315 0))(
  ( (Nil!24312) (Cons!24311 (h!25529 (_ BitVec 64)) (t!34788 List!24315)) )
))
(declare-fun arrayNoDuplicates!0 (array!72381 (_ BitVec 32) List!24315) Bool)

(assert (=> b!1114003 (= res!743072 (arrayNoDuplicates!0 lt!497070 #b00000000000000000000000000000000 Nil!24312))))

(declare-fun mapNonEmpty!43390 () Bool)

(declare-fun mapRes!43390 () Bool)

(declare-fun tp!82634 () Bool)

(declare-fun e!635214 () Bool)

(assert (=> mapNonEmpty!43390 (= mapRes!43390 (and tp!82634 e!635214))))

(declare-datatypes ((V!42081 0))(
  ( (V!42082 (val!13914 Int)) )
))
(declare-datatypes ((ValueCell!13148 0))(
  ( (ValueCellFull!13148 (v!16543 V!42081)) (EmptyCell!13148) )
))
(declare-fun mapValue!43390 () ValueCell!13148)

(declare-datatypes ((array!72383 0))(
  ( (array!72384 (arr!34838 (Array (_ BitVec 32) ValueCell!13148)) (size!35375 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72383)

(declare-fun mapRest!43390 () (Array (_ BitVec 32) ValueCell!13148))

(declare-fun mapKey!43390 () (_ BitVec 32))

(assert (=> mapNonEmpty!43390 (= (arr!34838 _values!996) (store mapRest!43390 mapKey!43390 mapValue!43390))))

(declare-fun b!1114004 () Bool)

(declare-fun res!743068 () Bool)

(declare-fun e!635210 () Bool)

(assert (=> b!1114004 (=> (not res!743068) (not e!635210))))

(declare-fun _keys!1208 () array!72381)

(assert (=> b!1114004 (= res!743068 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24312))))

(declare-fun b!1114005 () Bool)

(declare-fun res!743071 () Bool)

(assert (=> b!1114005 (=> (not res!743071) (not e!635210))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114005 (= res!743071 (validKeyInArray!0 k0!934))))

(declare-fun b!1114006 () Bool)

(declare-fun res!743070 () Bool)

(assert (=> b!1114006 (=> (not res!743070) (not e!635210))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1114006 (= res!743070 (= (select (arr!34837 _keys!1208) i!673) k0!934))))

(declare-fun b!1114007 () Bool)

(assert (=> b!1114007 (= e!635209 (not true))))

(declare-fun arrayContainsKey!0 (array!72381 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114007 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36495 0))(
  ( (Unit!36496) )
))
(declare-fun lt!497071 () Unit!36495)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72381 (_ BitVec 64) (_ BitVec 32)) Unit!36495)

(assert (=> b!1114007 (= lt!497071 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!43390 () Bool)

(assert (=> mapIsEmpty!43390 mapRes!43390))

(declare-fun b!1114008 () Bool)

(declare-fun res!743074 () Bool)

(assert (=> b!1114008 (=> (not res!743074) (not e!635210))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72381 (_ BitVec 32)) Bool)

(assert (=> b!1114008 (= res!743074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!743069 () Bool)

(assert (=> start!97720 (=> (not res!743069) (not e!635210))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97720 (= res!743069 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35374 _keys!1208))))))

(assert (=> start!97720 e!635210))

(declare-fun array_inv!26842 (array!72381) Bool)

(assert (=> start!97720 (array_inv!26842 _keys!1208)))

(assert (=> start!97720 true))

(declare-fun e!635211 () Bool)

(declare-fun array_inv!26843 (array!72383) Bool)

(assert (=> start!97720 (and (array_inv!26843 _values!996) e!635211)))

(declare-fun b!1114009 () Bool)

(declare-fun tp_is_empty!27715 () Bool)

(assert (=> b!1114009 (= e!635214 tp_is_empty!27715)))

(declare-fun b!1114010 () Bool)

(declare-fun res!743067 () Bool)

(assert (=> b!1114010 (=> (not res!743067) (not e!635210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114010 (= res!743067 (validMask!0 mask!1564))))

(declare-fun b!1114011 () Bool)

(declare-fun res!743073 () Bool)

(assert (=> b!1114011 (=> (not res!743073) (not e!635210))))

(assert (=> b!1114011 (= res!743073 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35374 _keys!1208))))))

(declare-fun b!1114012 () Bool)

(declare-fun e!635213 () Bool)

(assert (=> b!1114012 (= e!635213 tp_is_empty!27715)))

(declare-fun b!1114013 () Bool)

(declare-fun res!743065 () Bool)

(assert (=> b!1114013 (=> (not res!743065) (not e!635210))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1114013 (= res!743065 (and (= (size!35375 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35374 _keys!1208) (size!35375 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1114014 () Bool)

(assert (=> b!1114014 (= e!635211 (and e!635213 mapRes!43390))))

(declare-fun condMapEmpty!43390 () Bool)

(declare-fun mapDefault!43390 () ValueCell!13148)

(assert (=> b!1114014 (= condMapEmpty!43390 (= (arr!34838 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13148)) mapDefault!43390)))))

(declare-fun b!1114015 () Bool)

(assert (=> b!1114015 (= e!635210 e!635209)))

(declare-fun res!743066 () Bool)

(assert (=> b!1114015 (=> (not res!743066) (not e!635209))))

(assert (=> b!1114015 (= res!743066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497070 mask!1564))))

(assert (=> b!1114015 (= lt!497070 (array!72382 (store (arr!34837 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35374 _keys!1208)))))

(assert (= (and start!97720 res!743069) b!1114010))

(assert (= (and b!1114010 res!743067) b!1114013))

(assert (= (and b!1114013 res!743065) b!1114008))

(assert (= (and b!1114008 res!743074) b!1114004))

(assert (= (and b!1114004 res!743068) b!1114011))

(assert (= (and b!1114011 res!743073) b!1114005))

(assert (= (and b!1114005 res!743071) b!1114006))

(assert (= (and b!1114006 res!743070) b!1114015))

(assert (= (and b!1114015 res!743066) b!1114003))

(assert (= (and b!1114003 res!743072) b!1114007))

(assert (= (and b!1114014 condMapEmpty!43390) mapIsEmpty!43390))

(assert (= (and b!1114014 (not condMapEmpty!43390)) mapNonEmpty!43390))

(get-info :version)

(assert (= (and mapNonEmpty!43390 ((_ is ValueCellFull!13148) mapValue!43390)) b!1114009))

(assert (= (and b!1114014 ((_ is ValueCellFull!13148) mapDefault!43390)) b!1114012))

(assert (= start!97720 b!1114014))

(declare-fun m!1031811 () Bool)

(assert (=> b!1114006 m!1031811))

(declare-fun m!1031813 () Bool)

(assert (=> b!1114015 m!1031813))

(declare-fun m!1031815 () Bool)

(assert (=> b!1114015 m!1031815))

(declare-fun m!1031817 () Bool)

(assert (=> b!1114007 m!1031817))

(declare-fun m!1031819 () Bool)

(assert (=> b!1114007 m!1031819))

(declare-fun m!1031821 () Bool)

(assert (=> mapNonEmpty!43390 m!1031821))

(declare-fun m!1031823 () Bool)

(assert (=> b!1114008 m!1031823))

(declare-fun m!1031825 () Bool)

(assert (=> b!1114010 m!1031825))

(declare-fun m!1031827 () Bool)

(assert (=> start!97720 m!1031827))

(declare-fun m!1031829 () Bool)

(assert (=> start!97720 m!1031829))

(declare-fun m!1031831 () Bool)

(assert (=> b!1114003 m!1031831))

(declare-fun m!1031833 () Bool)

(assert (=> b!1114004 m!1031833))

(declare-fun m!1031835 () Bool)

(assert (=> b!1114005 m!1031835))

(check-sat (not b!1114003) (not b!1114004) (not b!1114007) (not b!1114015) (not b!1114010) tp_is_empty!27715 (not b!1114008) (not start!97720) (not mapNonEmpty!43390) (not b!1114005))
(check-sat)
