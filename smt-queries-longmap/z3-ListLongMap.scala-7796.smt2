; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97756 () Bool)

(assert start!97756)

(declare-fun b!1114705 () Bool)

(declare-fun e!635538 () Bool)

(assert (=> b!1114705 (= e!635538 (not true))))

(declare-datatypes ((array!72449 0))(
  ( (array!72450 (arr!34871 (Array (_ BitVec 32) (_ BitVec 64))) (size!35408 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72449)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114705 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36515 0))(
  ( (Unit!36516) )
))
(declare-fun lt!497179 () Unit!36515)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72449 (_ BitVec 64) (_ BitVec 32)) Unit!36515)

(assert (=> b!1114705 (= lt!497179 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1114706 () Bool)

(declare-fun res!743613 () Bool)

(declare-fun e!635533 () Bool)

(assert (=> b!1114706 (=> (not res!743613) (not e!635533))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114706 (= res!743613 (validMask!0 mask!1564))))

(declare-fun b!1114707 () Bool)

(declare-fun res!743608 () Bool)

(assert (=> b!1114707 (=> (not res!743608) (not e!635533))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114707 (= res!743608 (validKeyInArray!0 k0!934))))

(declare-fun b!1114708 () Bool)

(declare-fun res!743606 () Bool)

(assert (=> b!1114708 (=> (not res!743606) (not e!635533))))

(assert (=> b!1114708 (= res!743606 (= (select (arr!34871 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!43444 () Bool)

(declare-fun mapRes!43444 () Bool)

(assert (=> mapIsEmpty!43444 mapRes!43444))

(declare-fun b!1114709 () Bool)

(declare-fun res!743609 () Bool)

(assert (=> b!1114709 (=> (not res!743609) (not e!635533))))

(assert (=> b!1114709 (= res!743609 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35408 _keys!1208))))))

(declare-fun b!1114710 () Bool)

(declare-fun e!635535 () Bool)

(declare-fun tp_is_empty!27751 () Bool)

(assert (=> b!1114710 (= e!635535 tp_is_empty!27751)))

(declare-fun res!743614 () Bool)

(assert (=> start!97756 (=> (not res!743614) (not e!635533))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97756 (= res!743614 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35408 _keys!1208))))))

(assert (=> start!97756 e!635533))

(declare-fun array_inv!26868 (array!72449) Bool)

(assert (=> start!97756 (array_inv!26868 _keys!1208)))

(assert (=> start!97756 true))

(declare-datatypes ((V!42129 0))(
  ( (V!42130 (val!13932 Int)) )
))
(declare-datatypes ((ValueCell!13166 0))(
  ( (ValueCellFull!13166 (v!16561 V!42129)) (EmptyCell!13166) )
))
(declare-datatypes ((array!72451 0))(
  ( (array!72452 (arr!34872 (Array (_ BitVec 32) ValueCell!13166)) (size!35409 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72451)

(declare-fun e!635534 () Bool)

(declare-fun array_inv!26869 (array!72451) Bool)

(assert (=> start!97756 (and (array_inv!26869 _values!996) e!635534)))

(declare-fun mapNonEmpty!43444 () Bool)

(declare-fun tp!82688 () Bool)

(assert (=> mapNonEmpty!43444 (= mapRes!43444 (and tp!82688 e!635535))))

(declare-fun mapKey!43444 () (_ BitVec 32))

(declare-fun mapValue!43444 () ValueCell!13166)

(declare-fun mapRest!43444 () (Array (_ BitVec 32) ValueCell!13166))

(assert (=> mapNonEmpty!43444 (= (arr!34872 _values!996) (store mapRest!43444 mapKey!43444 mapValue!43444))))

(declare-fun b!1114711 () Bool)

(declare-fun res!743611 () Bool)

(assert (=> b!1114711 (=> (not res!743611) (not e!635533))))

(declare-datatypes ((List!24328 0))(
  ( (Nil!24325) (Cons!24324 (h!25542 (_ BitVec 64)) (t!34801 List!24328)) )
))
(declare-fun arrayNoDuplicates!0 (array!72449 (_ BitVec 32) List!24328) Bool)

(assert (=> b!1114711 (= res!743611 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24325))))

(declare-fun b!1114712 () Bool)

(declare-fun res!743607 () Bool)

(assert (=> b!1114712 (=> (not res!743607) (not e!635533))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72449 (_ BitVec 32)) Bool)

(assert (=> b!1114712 (= res!743607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1114713 () Bool)

(declare-fun e!635537 () Bool)

(assert (=> b!1114713 (= e!635534 (and e!635537 mapRes!43444))))

(declare-fun condMapEmpty!43444 () Bool)

(declare-fun mapDefault!43444 () ValueCell!13166)

(assert (=> b!1114713 (= condMapEmpty!43444 (= (arr!34872 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13166)) mapDefault!43444)))))

(declare-fun b!1114714 () Bool)

(declare-fun res!743612 () Bool)

(assert (=> b!1114714 (=> (not res!743612) (not e!635533))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1114714 (= res!743612 (and (= (size!35409 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35408 _keys!1208) (size!35409 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1114715 () Bool)

(assert (=> b!1114715 (= e!635533 e!635538)))

(declare-fun res!743605 () Bool)

(assert (=> b!1114715 (=> (not res!743605) (not e!635538))))

(declare-fun lt!497178 () array!72449)

(assert (=> b!1114715 (= res!743605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497178 mask!1564))))

(assert (=> b!1114715 (= lt!497178 (array!72450 (store (arr!34871 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35408 _keys!1208)))))

(declare-fun b!1114716 () Bool)

(assert (=> b!1114716 (= e!635537 tp_is_empty!27751)))

(declare-fun b!1114717 () Bool)

(declare-fun res!743610 () Bool)

(assert (=> b!1114717 (=> (not res!743610) (not e!635538))))

(assert (=> b!1114717 (= res!743610 (arrayNoDuplicates!0 lt!497178 #b00000000000000000000000000000000 Nil!24325))))

(assert (= (and start!97756 res!743614) b!1114706))

(assert (= (and b!1114706 res!743613) b!1114714))

(assert (= (and b!1114714 res!743612) b!1114712))

(assert (= (and b!1114712 res!743607) b!1114711))

(assert (= (and b!1114711 res!743611) b!1114709))

(assert (= (and b!1114709 res!743609) b!1114707))

(assert (= (and b!1114707 res!743608) b!1114708))

(assert (= (and b!1114708 res!743606) b!1114715))

(assert (= (and b!1114715 res!743605) b!1114717))

(assert (= (and b!1114717 res!743610) b!1114705))

(assert (= (and b!1114713 condMapEmpty!43444) mapIsEmpty!43444))

(assert (= (and b!1114713 (not condMapEmpty!43444)) mapNonEmpty!43444))

(get-info :version)

(assert (= (and mapNonEmpty!43444 ((_ is ValueCellFull!13166) mapValue!43444)) b!1114710))

(assert (= (and b!1114713 ((_ is ValueCellFull!13166) mapDefault!43444)) b!1114716))

(assert (= start!97756 b!1114713))

(declare-fun m!1032279 () Bool)

(assert (=> mapNonEmpty!43444 m!1032279))

(declare-fun m!1032281 () Bool)

(assert (=> b!1114712 m!1032281))

(declare-fun m!1032283 () Bool)

(assert (=> b!1114706 m!1032283))

(declare-fun m!1032285 () Bool)

(assert (=> start!97756 m!1032285))

(declare-fun m!1032287 () Bool)

(assert (=> start!97756 m!1032287))

(declare-fun m!1032289 () Bool)

(assert (=> b!1114705 m!1032289))

(declare-fun m!1032291 () Bool)

(assert (=> b!1114705 m!1032291))

(declare-fun m!1032293 () Bool)

(assert (=> b!1114715 m!1032293))

(declare-fun m!1032295 () Bool)

(assert (=> b!1114715 m!1032295))

(declare-fun m!1032297 () Bool)

(assert (=> b!1114717 m!1032297))

(declare-fun m!1032299 () Bool)

(assert (=> b!1114708 m!1032299))

(declare-fun m!1032301 () Bool)

(assert (=> b!1114711 m!1032301))

(declare-fun m!1032303 () Bool)

(assert (=> b!1114707 m!1032303))

(check-sat (not b!1114717) (not b!1114711) (not start!97756) tp_is_empty!27751 (not b!1114706) (not b!1114705) (not mapNonEmpty!43444) (not b!1114712) (not b!1114707) (not b!1114715))
(check-sat)
