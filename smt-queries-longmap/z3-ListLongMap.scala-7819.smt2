; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97652 () Bool)

(assert start!97652)

(declare-fun b!1115940 () Bool)

(declare-fun res!745088 () Bool)

(declare-fun e!635841 () Bool)

(assert (=> b!1115940 (=> (not res!745088) (not e!635841))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115940 (= res!745088 (validKeyInArray!0 k0!934))))

(declare-fun b!1115941 () Bool)

(declare-fun e!635840 () Bool)

(declare-fun e!635844 () Bool)

(declare-fun mapRes!43651 () Bool)

(assert (=> b!1115941 (= e!635840 (and e!635844 mapRes!43651))))

(declare-fun condMapEmpty!43651 () Bool)

(declare-datatypes ((V!42313 0))(
  ( (V!42314 (val!14001 Int)) )
))
(declare-datatypes ((ValueCell!13235 0))(
  ( (ValueCellFull!13235 (v!16633 V!42313)) (EmptyCell!13235) )
))
(declare-datatypes ((array!72576 0))(
  ( (array!72577 (arr!34941 (Array (_ BitVec 32) ValueCell!13235)) (size!35479 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72576)

(declare-fun mapDefault!43651 () ValueCell!13235)

(assert (=> b!1115941 (= condMapEmpty!43651 (= (arr!34941 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13235)) mapDefault!43651)))))

(declare-fun b!1115942 () Bool)

(declare-fun tp_is_empty!27889 () Bool)

(assert (=> b!1115942 (= e!635844 tp_is_empty!27889)))

(declare-fun b!1115943 () Bool)

(declare-fun res!745086 () Bool)

(assert (=> b!1115943 (=> (not res!745086) (not e!635841))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115943 (= res!745086 (validMask!0 mask!1564))))

(declare-fun b!1115945 () Bool)

(declare-fun res!745087 () Bool)

(assert (=> b!1115945 (=> (not res!745087) (not e!635841))))

(declare-datatypes ((array!72578 0))(
  ( (array!72579 (arr!34942 (Array (_ BitVec 32) (_ BitVec 64))) (size!35480 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72578)

(declare-datatypes ((List!24395 0))(
  ( (Nil!24392) (Cons!24391 (h!25600 (_ BitVec 64)) (t!34867 List!24395)) )
))
(declare-fun arrayNoDuplicates!0 (array!72578 (_ BitVec 32) List!24395) Bool)

(assert (=> b!1115945 (= res!745087 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24392))))

(declare-fun b!1115946 () Bool)

(declare-fun res!745092 () Bool)

(declare-fun e!635842 () Bool)

(assert (=> b!1115946 (=> (not res!745092) (not e!635842))))

(declare-fun lt!496878 () array!72578)

(assert (=> b!1115946 (= res!745092 (arrayNoDuplicates!0 lt!496878 #b00000000000000000000000000000000 Nil!24392))))

(declare-fun b!1115947 () Bool)

(assert (=> b!1115947 (= e!635842 (not true))))

(declare-fun arrayContainsKey!0 (array!72578 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115947 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36451 0))(
  ( (Unit!36452) )
))
(declare-fun lt!496877 () Unit!36451)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72578 (_ BitVec 64) (_ BitVec 32)) Unit!36451)

(assert (=> b!1115947 (= lt!496877 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!43651 () Bool)

(assert (=> mapIsEmpty!43651 mapRes!43651))

(declare-fun mapNonEmpty!43651 () Bool)

(declare-fun tp!82895 () Bool)

(declare-fun e!635843 () Bool)

(assert (=> mapNonEmpty!43651 (= mapRes!43651 (and tp!82895 e!635843))))

(declare-fun mapKey!43651 () (_ BitVec 32))

(declare-fun mapValue!43651 () ValueCell!13235)

(declare-fun mapRest!43651 () (Array (_ BitVec 32) ValueCell!13235))

(assert (=> mapNonEmpty!43651 (= (arr!34941 _values!996) (store mapRest!43651 mapKey!43651 mapValue!43651))))

(declare-fun b!1115948 () Bool)

(declare-fun res!745085 () Bool)

(assert (=> b!1115948 (=> (not res!745085) (not e!635841))))

(assert (=> b!1115948 (= res!745085 (= (select (arr!34942 _keys!1208) i!673) k0!934))))

(declare-fun b!1115949 () Bool)

(assert (=> b!1115949 (= e!635841 e!635842)))

(declare-fun res!745084 () Bool)

(assert (=> b!1115949 (=> (not res!745084) (not e!635842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72578 (_ BitVec 32)) Bool)

(assert (=> b!1115949 (= res!745084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496878 mask!1564))))

(assert (=> b!1115949 (= lt!496878 (array!72579 (store (arr!34942 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35480 _keys!1208)))))

(declare-fun b!1115950 () Bool)

(declare-fun res!745091 () Bool)

(assert (=> b!1115950 (=> (not res!745091) (not e!635841))))

(assert (=> b!1115950 (= res!745091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1115951 () Bool)

(declare-fun res!745093 () Bool)

(assert (=> b!1115951 (=> (not res!745093) (not e!635841))))

(assert (=> b!1115951 (= res!745093 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35480 _keys!1208))))))

(declare-fun b!1115952 () Bool)

(assert (=> b!1115952 (= e!635843 tp_is_empty!27889)))

(declare-fun b!1115944 () Bool)

(declare-fun res!745089 () Bool)

(assert (=> b!1115944 (=> (not res!745089) (not e!635841))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1115944 (= res!745089 (and (= (size!35479 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35480 _keys!1208) (size!35479 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!745090 () Bool)

(assert (=> start!97652 (=> (not res!745090) (not e!635841))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97652 (= res!745090 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35480 _keys!1208))))))

(assert (=> start!97652 e!635841))

(declare-fun array_inv!26924 (array!72578) Bool)

(assert (=> start!97652 (array_inv!26924 _keys!1208)))

(assert (=> start!97652 true))

(declare-fun array_inv!26925 (array!72576) Bool)

(assert (=> start!97652 (and (array_inv!26925 _values!996) e!635840)))

(assert (= (and start!97652 res!745090) b!1115943))

(assert (= (and b!1115943 res!745086) b!1115944))

(assert (= (and b!1115944 res!745089) b!1115950))

(assert (= (and b!1115950 res!745091) b!1115945))

(assert (= (and b!1115945 res!745087) b!1115951))

(assert (= (and b!1115951 res!745093) b!1115940))

(assert (= (and b!1115940 res!745088) b!1115948))

(assert (= (and b!1115948 res!745085) b!1115949))

(assert (= (and b!1115949 res!745084) b!1115946))

(assert (= (and b!1115946 res!745092) b!1115947))

(assert (= (and b!1115941 condMapEmpty!43651) mapIsEmpty!43651))

(assert (= (and b!1115941 (not condMapEmpty!43651)) mapNonEmpty!43651))

(get-info :version)

(assert (= (and mapNonEmpty!43651 ((_ is ValueCellFull!13235) mapValue!43651)) b!1115952))

(assert (= (and b!1115941 ((_ is ValueCellFull!13235) mapDefault!43651)) b!1115942))

(assert (= start!97652 b!1115941))

(declare-fun m!1031775 () Bool)

(assert (=> b!1115946 m!1031775))

(declare-fun m!1031777 () Bool)

(assert (=> b!1115940 m!1031777))

(declare-fun m!1031779 () Bool)

(assert (=> b!1115943 m!1031779))

(declare-fun m!1031781 () Bool)

(assert (=> b!1115950 m!1031781))

(declare-fun m!1031783 () Bool)

(assert (=> start!97652 m!1031783))

(declare-fun m!1031785 () Bool)

(assert (=> start!97652 m!1031785))

(declare-fun m!1031787 () Bool)

(assert (=> b!1115948 m!1031787))

(declare-fun m!1031789 () Bool)

(assert (=> b!1115947 m!1031789))

(declare-fun m!1031791 () Bool)

(assert (=> b!1115947 m!1031791))

(declare-fun m!1031793 () Bool)

(assert (=> mapNonEmpty!43651 m!1031793))

(declare-fun m!1031795 () Bool)

(assert (=> b!1115949 m!1031795))

(declare-fun m!1031797 () Bool)

(assert (=> b!1115949 m!1031797))

(declare-fun m!1031799 () Bool)

(assert (=> b!1115945 m!1031799))

(check-sat (not b!1115946) (not b!1115950) (not b!1115947) (not b!1115945) (not b!1115943) (not start!97652) (not mapNonEmpty!43651) tp_is_empty!27889 (not b!1115940) (not b!1115949))
(check-sat)
