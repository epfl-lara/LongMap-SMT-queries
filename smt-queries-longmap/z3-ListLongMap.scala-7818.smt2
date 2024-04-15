; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97646 () Bool)

(assert start!97646)

(declare-fun b!1115823 () Bool)

(declare-fun res!744996 () Bool)

(declare-fun e!635785 () Bool)

(assert (=> b!1115823 (=> (not res!744996) (not e!635785))))

(declare-datatypes ((array!72564 0))(
  ( (array!72565 (arr!34935 (Array (_ BitVec 32) (_ BitVec 64))) (size!35473 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72564)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1115823 (= res!744996 (= (select (arr!34935 _keys!1208) i!673) k0!934))))

(declare-fun b!1115824 () Bool)

(declare-fun e!635789 () Bool)

(declare-fun tp_is_empty!27883 () Bool)

(assert (=> b!1115824 (= e!635789 tp_is_empty!27883)))

(declare-fun mapNonEmpty!43642 () Bool)

(declare-fun mapRes!43642 () Bool)

(declare-fun tp!82886 () Bool)

(assert (=> mapNonEmpty!43642 (= mapRes!43642 (and tp!82886 e!635789))))

(declare-fun mapKey!43642 () (_ BitVec 32))

(declare-datatypes ((V!42305 0))(
  ( (V!42306 (val!13998 Int)) )
))
(declare-datatypes ((ValueCell!13232 0))(
  ( (ValueCellFull!13232 (v!16630 V!42305)) (EmptyCell!13232) )
))
(declare-datatypes ((array!72566 0))(
  ( (array!72567 (arr!34936 (Array (_ BitVec 32) ValueCell!13232)) (size!35474 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72566)

(declare-fun mapRest!43642 () (Array (_ BitVec 32) ValueCell!13232))

(declare-fun mapValue!43642 () ValueCell!13232)

(assert (=> mapNonEmpty!43642 (= (arr!34936 _values!996) (store mapRest!43642 mapKey!43642 mapValue!43642))))

(declare-fun b!1115825 () Bool)

(declare-fun res!745000 () Bool)

(assert (=> b!1115825 (=> (not res!745000) (not e!635785))))

(assert (=> b!1115825 (= res!745000 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35473 _keys!1208))))))

(declare-fun b!1115826 () Bool)

(declare-fun res!745001 () Bool)

(assert (=> b!1115826 (=> (not res!745001) (not e!635785))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115826 (= res!745001 (validKeyInArray!0 k0!934))))

(declare-fun b!1115827 () Bool)

(declare-fun res!744994 () Bool)

(assert (=> b!1115827 (=> (not res!744994) (not e!635785))))

(declare-datatypes ((List!24392 0))(
  ( (Nil!24389) (Cons!24388 (h!25597 (_ BitVec 64)) (t!34864 List!24392)) )
))
(declare-fun arrayNoDuplicates!0 (array!72564 (_ BitVec 32) List!24392) Bool)

(assert (=> b!1115827 (= res!744994 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24389))))

(declare-fun b!1115828 () Bool)

(declare-fun res!744999 () Bool)

(assert (=> b!1115828 (=> (not res!744999) (not e!635785))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115828 (= res!744999 (validMask!0 mask!1564))))

(declare-fun b!1115829 () Bool)

(declare-fun e!635786 () Bool)

(declare-fun e!635790 () Bool)

(assert (=> b!1115829 (= e!635786 (and e!635790 mapRes!43642))))

(declare-fun condMapEmpty!43642 () Bool)

(declare-fun mapDefault!43642 () ValueCell!13232)

(assert (=> b!1115829 (= condMapEmpty!43642 (= (arr!34936 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13232)) mapDefault!43642)))))

(declare-fun res!744995 () Bool)

(assert (=> start!97646 (=> (not res!744995) (not e!635785))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97646 (= res!744995 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35473 _keys!1208))))))

(assert (=> start!97646 e!635785))

(declare-fun array_inv!26920 (array!72564) Bool)

(assert (=> start!97646 (array_inv!26920 _keys!1208)))

(assert (=> start!97646 true))

(declare-fun array_inv!26921 (array!72566) Bool)

(assert (=> start!97646 (and (array_inv!26921 _values!996) e!635786)))

(declare-fun mapIsEmpty!43642 () Bool)

(assert (=> mapIsEmpty!43642 mapRes!43642))

(declare-fun b!1115830 () Bool)

(declare-fun e!635788 () Bool)

(assert (=> b!1115830 (= e!635785 e!635788)))

(declare-fun res!744998 () Bool)

(assert (=> b!1115830 (=> (not res!744998) (not e!635788))))

(declare-fun lt!496860 () array!72564)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72564 (_ BitVec 32)) Bool)

(assert (=> b!1115830 (= res!744998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496860 mask!1564))))

(assert (=> b!1115830 (= lt!496860 (array!72565 (store (arr!34935 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35473 _keys!1208)))))

(declare-fun b!1115831 () Bool)

(declare-fun res!744997 () Bool)

(assert (=> b!1115831 (=> (not res!744997) (not e!635785))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1115831 (= res!744997 (and (= (size!35474 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35473 _keys!1208) (size!35474 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1115832 () Bool)

(declare-fun res!745002 () Bool)

(assert (=> b!1115832 (=> (not res!745002) (not e!635785))))

(assert (=> b!1115832 (= res!745002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1115833 () Bool)

(assert (=> b!1115833 (= e!635790 tp_is_empty!27883)))

(declare-fun b!1115834 () Bool)

(declare-fun res!745003 () Bool)

(assert (=> b!1115834 (=> (not res!745003) (not e!635788))))

(assert (=> b!1115834 (= res!745003 (arrayNoDuplicates!0 lt!496860 #b00000000000000000000000000000000 Nil!24389))))

(declare-fun b!1115835 () Bool)

(assert (=> b!1115835 (= e!635788 (not true))))

(declare-fun arrayContainsKey!0 (array!72564 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115835 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36445 0))(
  ( (Unit!36446) )
))
(declare-fun lt!496859 () Unit!36445)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72564 (_ BitVec 64) (_ BitVec 32)) Unit!36445)

(assert (=> b!1115835 (= lt!496859 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!97646 res!744995) b!1115828))

(assert (= (and b!1115828 res!744999) b!1115831))

(assert (= (and b!1115831 res!744997) b!1115832))

(assert (= (and b!1115832 res!745002) b!1115827))

(assert (= (and b!1115827 res!744994) b!1115825))

(assert (= (and b!1115825 res!745000) b!1115826))

(assert (= (and b!1115826 res!745001) b!1115823))

(assert (= (and b!1115823 res!744996) b!1115830))

(assert (= (and b!1115830 res!744998) b!1115834))

(assert (= (and b!1115834 res!745003) b!1115835))

(assert (= (and b!1115829 condMapEmpty!43642) mapIsEmpty!43642))

(assert (= (and b!1115829 (not condMapEmpty!43642)) mapNonEmpty!43642))

(get-info :version)

(assert (= (and mapNonEmpty!43642 ((_ is ValueCellFull!13232) mapValue!43642)) b!1115824))

(assert (= (and b!1115829 ((_ is ValueCellFull!13232) mapDefault!43642)) b!1115833))

(assert (= start!97646 b!1115829))

(declare-fun m!1031697 () Bool)

(assert (=> start!97646 m!1031697))

(declare-fun m!1031699 () Bool)

(assert (=> start!97646 m!1031699))

(declare-fun m!1031701 () Bool)

(assert (=> mapNonEmpty!43642 m!1031701))

(declare-fun m!1031703 () Bool)

(assert (=> b!1115823 m!1031703))

(declare-fun m!1031705 () Bool)

(assert (=> b!1115834 m!1031705))

(declare-fun m!1031707 () Bool)

(assert (=> b!1115832 m!1031707))

(declare-fun m!1031709 () Bool)

(assert (=> b!1115826 m!1031709))

(declare-fun m!1031711 () Bool)

(assert (=> b!1115827 m!1031711))

(declare-fun m!1031713 () Bool)

(assert (=> b!1115828 m!1031713))

(declare-fun m!1031715 () Bool)

(assert (=> b!1115835 m!1031715))

(declare-fun m!1031717 () Bool)

(assert (=> b!1115835 m!1031717))

(declare-fun m!1031719 () Bool)

(assert (=> b!1115830 m!1031719))

(declare-fun m!1031721 () Bool)

(assert (=> b!1115830 m!1031721))

(check-sat (not b!1115827) (not mapNonEmpty!43642) (not b!1115830) (not start!97646) (not b!1115828) (not b!1115835) (not b!1115826) tp_is_empty!27883 (not b!1115832) (not b!1115834))
(check-sat)
