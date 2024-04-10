; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97134 () Bool)

(assert start!97134)

(declare-fun b!1104889 () Bool)

(declare-fun res!737189 () Bool)

(declare-fun e!630642 () Bool)

(assert (=> b!1104889 (=> (not res!737189) (not e!630642))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1104889 (= res!737189 (validMask!0 mask!1564))))

(declare-fun b!1104890 () Bool)

(declare-fun res!737192 () Bool)

(assert (=> b!1104890 (=> (not res!737192) (not e!630642))))

(declare-datatypes ((array!71683 0))(
  ( (array!71684 (arr!34495 (Array (_ BitVec 32) (_ BitVec 64))) (size!35031 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71683)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1104890 (= res!737192 (= (select (arr!34495 _keys!1208) i!673) k0!934))))

(declare-fun b!1104891 () Bool)

(declare-fun e!630643 () Bool)

(declare-fun tp_is_empty!27381 () Bool)

(assert (=> b!1104891 (= e!630643 tp_is_empty!27381)))

(declare-fun b!1104892 () Bool)

(declare-fun res!737183 () Bool)

(assert (=> b!1104892 (=> (not res!737183) (not e!630642))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!41635 0))(
  ( (V!41636 (val!13747 Int)) )
))
(declare-datatypes ((ValueCell!12981 0))(
  ( (ValueCellFull!12981 (v!16380 V!41635)) (EmptyCell!12981) )
))
(declare-datatypes ((array!71685 0))(
  ( (array!71686 (arr!34496 (Array (_ BitVec 32) ValueCell!12981)) (size!35032 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71685)

(assert (=> b!1104892 (= res!737183 (and (= (size!35032 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35031 _keys!1208) (size!35032 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1104893 () Bool)

(declare-fun e!630644 () Bool)

(declare-fun mapRes!42886 () Bool)

(assert (=> b!1104893 (= e!630644 (and e!630643 mapRes!42886))))

(declare-fun condMapEmpty!42886 () Bool)

(declare-fun mapDefault!42886 () ValueCell!12981)

(assert (=> b!1104893 (= condMapEmpty!42886 (= (arr!34496 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12981)) mapDefault!42886)))))

(declare-fun b!1104894 () Bool)

(declare-fun e!630647 () Bool)

(assert (=> b!1104894 (= e!630642 e!630647)))

(declare-fun res!737184 () Bool)

(assert (=> b!1104894 (=> (not res!737184) (not e!630647))))

(declare-fun lt!495215 () array!71683)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71683 (_ BitVec 32)) Bool)

(assert (=> b!1104894 (= res!737184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495215 mask!1564))))

(assert (=> b!1104894 (= lt!495215 (array!71684 (store (arr!34495 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35031 _keys!1208)))))

(declare-fun b!1104895 () Bool)

(assert (=> b!1104895 (= e!630647 (not true))))

(declare-fun arrayContainsKey!0 (array!71683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1104895 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36254 0))(
  ( (Unit!36255) )
))
(declare-fun lt!495214 () Unit!36254)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71683 (_ BitVec 64) (_ BitVec 32)) Unit!36254)

(assert (=> b!1104895 (= lt!495214 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1104896 () Bool)

(declare-fun res!737187 () Bool)

(assert (=> b!1104896 (=> (not res!737187) (not e!630642))))

(assert (=> b!1104896 (= res!737187 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35031 _keys!1208))))))

(declare-fun b!1104897 () Bool)

(declare-fun res!737190 () Bool)

(assert (=> b!1104897 (=> (not res!737190) (not e!630642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1104897 (= res!737190 (validKeyInArray!0 k0!934))))

(declare-fun b!1104898 () Bool)

(declare-fun res!737186 () Bool)

(assert (=> b!1104898 (=> (not res!737186) (not e!630647))))

(declare-datatypes ((List!24065 0))(
  ( (Nil!24062) (Cons!24061 (h!25270 (_ BitVec 64)) (t!34330 List!24065)) )
))
(declare-fun arrayNoDuplicates!0 (array!71683 (_ BitVec 32) List!24065) Bool)

(assert (=> b!1104898 (= res!737186 (arrayNoDuplicates!0 lt!495215 #b00000000000000000000000000000000 Nil!24062))))

(declare-fun res!737188 () Bool)

(assert (=> start!97134 (=> (not res!737188) (not e!630642))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97134 (= res!737188 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35031 _keys!1208))))))

(assert (=> start!97134 e!630642))

(declare-fun array_inv!26556 (array!71683) Bool)

(assert (=> start!97134 (array_inv!26556 _keys!1208)))

(assert (=> start!97134 true))

(declare-fun array_inv!26557 (array!71685) Bool)

(assert (=> start!97134 (and (array_inv!26557 _values!996) e!630644)))

(declare-fun b!1104899 () Bool)

(declare-fun e!630646 () Bool)

(assert (=> b!1104899 (= e!630646 tp_is_empty!27381)))

(declare-fun mapIsEmpty!42886 () Bool)

(assert (=> mapIsEmpty!42886 mapRes!42886))

(declare-fun b!1104900 () Bool)

(declare-fun res!737185 () Bool)

(assert (=> b!1104900 (=> (not res!737185) (not e!630642))))

(assert (=> b!1104900 (= res!737185 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24062))))

(declare-fun mapNonEmpty!42886 () Bool)

(declare-fun tp!81806 () Bool)

(assert (=> mapNonEmpty!42886 (= mapRes!42886 (and tp!81806 e!630646))))

(declare-fun mapKey!42886 () (_ BitVec 32))

(declare-fun mapRest!42886 () (Array (_ BitVec 32) ValueCell!12981))

(declare-fun mapValue!42886 () ValueCell!12981)

(assert (=> mapNonEmpty!42886 (= (arr!34496 _values!996) (store mapRest!42886 mapKey!42886 mapValue!42886))))

(declare-fun b!1104901 () Bool)

(declare-fun res!737191 () Bool)

(assert (=> b!1104901 (=> (not res!737191) (not e!630642))))

(assert (=> b!1104901 (= res!737191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97134 res!737188) b!1104889))

(assert (= (and b!1104889 res!737189) b!1104892))

(assert (= (and b!1104892 res!737183) b!1104901))

(assert (= (and b!1104901 res!737191) b!1104900))

(assert (= (and b!1104900 res!737185) b!1104896))

(assert (= (and b!1104896 res!737187) b!1104897))

(assert (= (and b!1104897 res!737190) b!1104890))

(assert (= (and b!1104890 res!737192) b!1104894))

(assert (= (and b!1104894 res!737184) b!1104898))

(assert (= (and b!1104898 res!737186) b!1104895))

(assert (= (and b!1104893 condMapEmpty!42886) mapIsEmpty!42886))

(assert (= (and b!1104893 (not condMapEmpty!42886)) mapNonEmpty!42886))

(get-info :version)

(assert (= (and mapNonEmpty!42886 ((_ is ValueCellFull!12981) mapValue!42886)) b!1104899))

(assert (= (and b!1104893 ((_ is ValueCellFull!12981) mapDefault!42886)) b!1104891))

(assert (= start!97134 b!1104893))

(declare-fun m!1024463 () Bool)

(assert (=> b!1104890 m!1024463))

(declare-fun m!1024465 () Bool)

(assert (=> b!1104889 m!1024465))

(declare-fun m!1024467 () Bool)

(assert (=> b!1104900 m!1024467))

(declare-fun m!1024469 () Bool)

(assert (=> b!1104901 m!1024469))

(declare-fun m!1024471 () Bool)

(assert (=> start!97134 m!1024471))

(declare-fun m!1024473 () Bool)

(assert (=> start!97134 m!1024473))

(declare-fun m!1024475 () Bool)

(assert (=> mapNonEmpty!42886 m!1024475))

(declare-fun m!1024477 () Bool)

(assert (=> b!1104895 m!1024477))

(declare-fun m!1024479 () Bool)

(assert (=> b!1104895 m!1024479))

(declare-fun m!1024481 () Bool)

(assert (=> b!1104897 m!1024481))

(declare-fun m!1024483 () Bool)

(assert (=> b!1104898 m!1024483))

(declare-fun m!1024485 () Bool)

(assert (=> b!1104894 m!1024485))

(declare-fun m!1024487 () Bool)

(assert (=> b!1104894 m!1024487))

(check-sat (not mapNonEmpty!42886) (not b!1104898) (not start!97134) (not b!1104894) (not b!1104900) (not b!1104897) tp_is_empty!27381 (not b!1104895) (not b!1104901) (not b!1104889))
(check-sat)
