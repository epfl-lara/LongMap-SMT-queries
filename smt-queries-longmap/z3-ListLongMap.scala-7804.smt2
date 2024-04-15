; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97562 () Bool)

(assert start!97562)

(declare-fun b!1114185 () Bool)

(declare-fun res!743735 () Bool)

(declare-fun e!635029 () Bool)

(assert (=> b!1114185 (=> (not res!743735) (not e!635029))))

(declare-datatypes ((array!72404 0))(
  ( (array!72405 (arr!34855 (Array (_ BitVec 32) (_ BitVec 64))) (size!35393 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72404)

(declare-datatypes ((List!24360 0))(
  ( (Nil!24357) (Cons!24356 (h!25565 (_ BitVec 64)) (t!34832 List!24360)) )
))
(declare-fun arrayNoDuplicates!0 (array!72404 (_ BitVec 32) List!24360) Bool)

(assert (=> b!1114185 (= res!743735 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24357))))

(declare-fun b!1114187 () Bool)

(declare-fun res!743740 () Bool)

(assert (=> b!1114187 (=> (not res!743740) (not e!635029))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42193 0))(
  ( (V!42194 (val!13956 Int)) )
))
(declare-datatypes ((ValueCell!13190 0))(
  ( (ValueCellFull!13190 (v!16588 V!42193)) (EmptyCell!13190) )
))
(declare-datatypes ((array!72406 0))(
  ( (array!72407 (arr!34856 (Array (_ BitVec 32) ValueCell!13190)) (size!35394 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72406)

(assert (=> b!1114187 (= res!743740 (and (= (size!35394 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35393 _keys!1208) (size!35394 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1114188 () Bool)

(declare-fun e!635034 () Bool)

(assert (=> b!1114188 (= e!635034 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72404 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114188 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36391 0))(
  ( (Unit!36392) )
))
(declare-fun lt!496607 () Unit!36391)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72404 (_ BitVec 64) (_ BitVec 32)) Unit!36391)

(assert (=> b!1114188 (= lt!496607 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1114189 () Bool)

(declare-fun res!743739 () Bool)

(assert (=> b!1114189 (=> (not res!743739) (not e!635029))))

(assert (=> b!1114189 (= res!743739 (= (select (arr!34855 _keys!1208) i!673) k0!934))))

(declare-fun b!1114190 () Bool)

(declare-fun e!635033 () Bool)

(declare-fun tp_is_empty!27799 () Bool)

(assert (=> b!1114190 (= e!635033 tp_is_empty!27799)))

(declare-fun mapIsEmpty!43516 () Bool)

(declare-fun mapRes!43516 () Bool)

(assert (=> mapIsEmpty!43516 mapRes!43516))

(declare-fun b!1114191 () Bool)

(assert (=> b!1114191 (= e!635029 e!635034)))

(declare-fun res!743743 () Bool)

(assert (=> b!1114191 (=> (not res!743743) (not e!635034))))

(declare-fun lt!496608 () array!72404)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72404 (_ BitVec 32)) Bool)

(assert (=> b!1114191 (= res!743743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496608 mask!1564))))

(assert (=> b!1114191 (= lt!496608 (array!72405 (store (arr!34855 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35393 _keys!1208)))))

(declare-fun b!1114192 () Bool)

(declare-fun e!635031 () Bool)

(assert (=> b!1114192 (= e!635031 tp_is_empty!27799)))

(declare-fun b!1114193 () Bool)

(declare-fun e!635032 () Bool)

(assert (=> b!1114193 (= e!635032 (and e!635031 mapRes!43516))))

(declare-fun condMapEmpty!43516 () Bool)

(declare-fun mapDefault!43516 () ValueCell!13190)

(assert (=> b!1114193 (= condMapEmpty!43516 (= (arr!34856 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13190)) mapDefault!43516)))))

(declare-fun b!1114194 () Bool)

(declare-fun res!743741 () Bool)

(assert (=> b!1114194 (=> (not res!743741) (not e!635034))))

(assert (=> b!1114194 (= res!743741 (arrayNoDuplicates!0 lt!496608 #b00000000000000000000000000000000 Nil!24357))))

(declare-fun mapNonEmpty!43516 () Bool)

(declare-fun tp!82760 () Bool)

(assert (=> mapNonEmpty!43516 (= mapRes!43516 (and tp!82760 e!635033))))

(declare-fun mapValue!43516 () ValueCell!13190)

(declare-fun mapKey!43516 () (_ BitVec 32))

(declare-fun mapRest!43516 () (Array (_ BitVec 32) ValueCell!13190))

(assert (=> mapNonEmpty!43516 (= (arr!34856 _values!996) (store mapRest!43516 mapKey!43516 mapValue!43516))))

(declare-fun b!1114195 () Bool)

(declare-fun res!743737 () Bool)

(assert (=> b!1114195 (=> (not res!743737) (not e!635029))))

(assert (=> b!1114195 (= res!743737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!743736 () Bool)

(assert (=> start!97562 (=> (not res!743736) (not e!635029))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97562 (= res!743736 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35393 _keys!1208))))))

(assert (=> start!97562 e!635029))

(declare-fun array_inv!26872 (array!72404) Bool)

(assert (=> start!97562 (array_inv!26872 _keys!1208)))

(assert (=> start!97562 true))

(declare-fun array_inv!26873 (array!72406) Bool)

(assert (=> start!97562 (and (array_inv!26873 _values!996) e!635032)))

(declare-fun b!1114186 () Bool)

(declare-fun res!743738 () Bool)

(assert (=> b!1114186 (=> (not res!743738) (not e!635029))))

(assert (=> b!1114186 (= res!743738 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35393 _keys!1208))))))

(declare-fun b!1114196 () Bool)

(declare-fun res!743734 () Bool)

(assert (=> b!1114196 (=> (not res!743734) (not e!635029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114196 (= res!743734 (validMask!0 mask!1564))))

(declare-fun b!1114197 () Bool)

(declare-fun res!743742 () Bool)

(assert (=> b!1114197 (=> (not res!743742) (not e!635029))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114197 (= res!743742 (validKeyInArray!0 k0!934))))

(assert (= (and start!97562 res!743736) b!1114196))

(assert (= (and b!1114196 res!743734) b!1114187))

(assert (= (and b!1114187 res!743740) b!1114195))

(assert (= (and b!1114195 res!743737) b!1114185))

(assert (= (and b!1114185 res!743735) b!1114186))

(assert (= (and b!1114186 res!743738) b!1114197))

(assert (= (and b!1114197 res!743742) b!1114189))

(assert (= (and b!1114189 res!743739) b!1114191))

(assert (= (and b!1114191 res!743743) b!1114194))

(assert (= (and b!1114194 res!743741) b!1114188))

(assert (= (and b!1114193 condMapEmpty!43516) mapIsEmpty!43516))

(assert (= (and b!1114193 (not condMapEmpty!43516)) mapNonEmpty!43516))

(get-info :version)

(assert (= (and mapNonEmpty!43516 ((_ is ValueCellFull!13190) mapValue!43516)) b!1114190))

(assert (= (and b!1114193 ((_ is ValueCellFull!13190) mapDefault!43516)) b!1114192))

(assert (= start!97562 b!1114193))

(declare-fun m!1030605 () Bool)

(assert (=> b!1114195 m!1030605))

(declare-fun m!1030607 () Bool)

(assert (=> b!1114194 m!1030607))

(declare-fun m!1030609 () Bool)

(assert (=> mapNonEmpty!43516 m!1030609))

(declare-fun m!1030611 () Bool)

(assert (=> b!1114189 m!1030611))

(declare-fun m!1030613 () Bool)

(assert (=> b!1114197 m!1030613))

(declare-fun m!1030615 () Bool)

(assert (=> start!97562 m!1030615))

(declare-fun m!1030617 () Bool)

(assert (=> start!97562 m!1030617))

(declare-fun m!1030619 () Bool)

(assert (=> b!1114196 m!1030619))

(declare-fun m!1030621 () Bool)

(assert (=> b!1114188 m!1030621))

(declare-fun m!1030623 () Bool)

(assert (=> b!1114188 m!1030623))

(declare-fun m!1030625 () Bool)

(assert (=> b!1114191 m!1030625))

(declare-fun m!1030627 () Bool)

(assert (=> b!1114191 m!1030627))

(declare-fun m!1030629 () Bool)

(assert (=> b!1114185 m!1030629))

(check-sat (not mapNonEmpty!43516) tp_is_empty!27799 (not start!97562) (not b!1114194) (not b!1114185) (not b!1114191) (not b!1114196) (not b!1114195) (not b!1114197) (not b!1114188))
(check-sat)
