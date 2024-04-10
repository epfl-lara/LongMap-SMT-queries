; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97618 () Bool)

(assert start!97618)

(declare-fun b!1115289 () Bool)

(declare-fun res!744559 () Bool)

(declare-fun e!635561 () Bool)

(assert (=> b!1115289 (=> (not res!744559) (not e!635561))))

(declare-datatypes ((array!72599 0))(
  ( (array!72600 (arr!34952 (Array (_ BitVec 32) (_ BitVec 64))) (size!35488 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72599)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72599 (_ BitVec 32)) Bool)

(assert (=> b!1115289 (= res!744559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!43591 () Bool)

(declare-fun mapRes!43591 () Bool)

(declare-fun tp!82835 () Bool)

(declare-fun e!635564 () Bool)

(assert (=> mapNonEmpty!43591 (= mapRes!43591 (and tp!82835 e!635564))))

(declare-datatypes ((V!42259 0))(
  ( (V!42260 (val!13981 Int)) )
))
(declare-datatypes ((ValueCell!13215 0))(
  ( (ValueCellFull!13215 (v!16614 V!42259)) (EmptyCell!13215) )
))
(declare-fun mapRest!43591 () (Array (_ BitVec 32) ValueCell!13215))

(declare-fun mapValue!43591 () ValueCell!13215)

(declare-datatypes ((array!72601 0))(
  ( (array!72602 (arr!34953 (Array (_ BitVec 32) ValueCell!13215)) (size!35489 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72601)

(declare-fun mapKey!43591 () (_ BitVec 32))

(assert (=> mapNonEmpty!43591 (= (arr!34953 _values!996) (store mapRest!43591 mapKey!43591 mapValue!43591))))

(declare-fun b!1115290 () Bool)

(declare-fun e!635560 () Bool)

(declare-fun tp_is_empty!27849 () Bool)

(assert (=> b!1115290 (= e!635560 tp_is_empty!27849)))

(declare-fun b!1115291 () Bool)

(declare-fun res!744554 () Bool)

(assert (=> b!1115291 (=> (not res!744554) (not e!635561))))

(declare-datatypes ((List!24344 0))(
  ( (Nil!24341) (Cons!24340 (h!25549 (_ BitVec 64)) (t!34825 List!24344)) )
))
(declare-fun arrayNoDuplicates!0 (array!72599 (_ BitVec 32) List!24344) Bool)

(assert (=> b!1115291 (= res!744554 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24341))))

(declare-fun b!1115292 () Bool)

(declare-fun e!635565 () Bool)

(assert (=> b!1115292 (= e!635561 e!635565)))

(declare-fun res!744562 () Bool)

(assert (=> b!1115292 (=> (not res!744562) (not e!635565))))

(declare-fun lt!496958 () array!72599)

(assert (=> b!1115292 (= res!744562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496958 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1115292 (= lt!496958 (array!72600 (store (arr!34952 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35488 _keys!1208)))))

(declare-fun b!1115293 () Bool)

(assert (=> b!1115293 (= e!635565 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115293 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36606 0))(
  ( (Unit!36607) )
))
(declare-fun lt!496957 () Unit!36606)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72599 (_ BitVec 64) (_ BitVec 32)) Unit!36606)

(assert (=> b!1115293 (= lt!496957 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!43591 () Bool)

(assert (=> mapIsEmpty!43591 mapRes!43591))

(declare-fun b!1115294 () Bool)

(declare-fun res!744555 () Bool)

(assert (=> b!1115294 (=> (not res!744555) (not e!635561))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115294 (= res!744555 (validKeyInArray!0 k0!934))))

(declare-fun b!1115295 () Bool)

(declare-fun res!744556 () Bool)

(assert (=> b!1115295 (=> (not res!744556) (not e!635561))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1115295 (= res!744556 (and (= (size!35489 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35488 _keys!1208) (size!35489 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!744557 () Bool)

(assert (=> start!97618 (=> (not res!744557) (not e!635561))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97618 (= res!744557 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35488 _keys!1208))))))

(assert (=> start!97618 e!635561))

(declare-fun array_inv!26872 (array!72599) Bool)

(assert (=> start!97618 (array_inv!26872 _keys!1208)))

(assert (=> start!97618 true))

(declare-fun e!635562 () Bool)

(declare-fun array_inv!26873 (array!72601) Bool)

(assert (=> start!97618 (and (array_inv!26873 _values!996) e!635562)))

(declare-fun b!1115296 () Bool)

(assert (=> b!1115296 (= e!635562 (and e!635560 mapRes!43591))))

(declare-fun condMapEmpty!43591 () Bool)

(declare-fun mapDefault!43591 () ValueCell!13215)

(assert (=> b!1115296 (= condMapEmpty!43591 (= (arr!34953 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13215)) mapDefault!43591)))))

(declare-fun b!1115297 () Bool)

(declare-fun res!744561 () Bool)

(assert (=> b!1115297 (=> (not res!744561) (not e!635561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115297 (= res!744561 (validMask!0 mask!1564))))

(declare-fun b!1115298 () Bool)

(assert (=> b!1115298 (= e!635564 tp_is_empty!27849)))

(declare-fun b!1115299 () Bool)

(declare-fun res!744553 () Bool)

(assert (=> b!1115299 (=> (not res!744553) (not e!635565))))

(assert (=> b!1115299 (= res!744553 (arrayNoDuplicates!0 lt!496958 #b00000000000000000000000000000000 Nil!24341))))

(declare-fun b!1115300 () Bool)

(declare-fun res!744560 () Bool)

(assert (=> b!1115300 (=> (not res!744560) (not e!635561))))

(assert (=> b!1115300 (= res!744560 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35488 _keys!1208))))))

(declare-fun b!1115301 () Bool)

(declare-fun res!744558 () Bool)

(assert (=> b!1115301 (=> (not res!744558) (not e!635561))))

(assert (=> b!1115301 (= res!744558 (= (select (arr!34952 _keys!1208) i!673) k0!934))))

(assert (= (and start!97618 res!744557) b!1115297))

(assert (= (and b!1115297 res!744561) b!1115295))

(assert (= (and b!1115295 res!744556) b!1115289))

(assert (= (and b!1115289 res!744559) b!1115291))

(assert (= (and b!1115291 res!744554) b!1115300))

(assert (= (and b!1115300 res!744560) b!1115294))

(assert (= (and b!1115294 res!744555) b!1115301))

(assert (= (and b!1115301 res!744558) b!1115292))

(assert (= (and b!1115292 res!744562) b!1115299))

(assert (= (and b!1115299 res!744553) b!1115293))

(assert (= (and b!1115296 condMapEmpty!43591) mapIsEmpty!43591))

(assert (= (and b!1115296 (not condMapEmpty!43591)) mapNonEmpty!43591))

(get-info :version)

(assert (= (and mapNonEmpty!43591 ((_ is ValueCellFull!13215) mapValue!43591)) b!1115298))

(assert (= (and b!1115296 ((_ is ValueCellFull!13215) mapDefault!43591)) b!1115290))

(assert (= start!97618 b!1115296))

(declare-fun m!1031881 () Bool)

(assert (=> b!1115291 m!1031881))

(declare-fun m!1031883 () Bool)

(assert (=> start!97618 m!1031883))

(declare-fun m!1031885 () Bool)

(assert (=> start!97618 m!1031885))

(declare-fun m!1031887 () Bool)

(assert (=> b!1115293 m!1031887))

(declare-fun m!1031889 () Bool)

(assert (=> b!1115293 m!1031889))

(declare-fun m!1031891 () Bool)

(assert (=> b!1115297 m!1031891))

(declare-fun m!1031893 () Bool)

(assert (=> b!1115299 m!1031893))

(declare-fun m!1031895 () Bool)

(assert (=> b!1115301 m!1031895))

(declare-fun m!1031897 () Bool)

(assert (=> b!1115292 m!1031897))

(declare-fun m!1031899 () Bool)

(assert (=> b!1115292 m!1031899))

(declare-fun m!1031901 () Bool)

(assert (=> b!1115294 m!1031901))

(declare-fun m!1031903 () Bool)

(assert (=> b!1115289 m!1031903))

(declare-fun m!1031905 () Bool)

(assert (=> mapNonEmpty!43591 m!1031905))

(check-sat (not b!1115299) (not b!1115293) (not b!1115297) (not b!1115291) (not b!1115294) (not start!97618) (not mapNonEmpty!43591) (not b!1115292) tp_is_empty!27849 (not b!1115289))
(check-sat)
