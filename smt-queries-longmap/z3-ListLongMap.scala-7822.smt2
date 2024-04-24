; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97912 () Bool)

(assert start!97912)

(declare-fun b!1117747 () Bool)

(declare-fun res!745954 () Bool)

(declare-fun e!636941 () Bool)

(assert (=> b!1117747 (=> (not res!745954) (not e!636941))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72753 0))(
  ( (array!72754 (arr!35023 (Array (_ BitVec 32) (_ BitVec 64))) (size!35560 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72753)

(assert (=> b!1117747 (= res!745954 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35560 _keys!1208))))))

(declare-fun b!1117748 () Bool)

(declare-fun res!745952 () Bool)

(assert (=> b!1117748 (=> (not res!745952) (not e!636941))))

(declare-datatypes ((List!24388 0))(
  ( (Nil!24385) (Cons!24384 (h!25602 (_ BitVec 64)) (t!34861 List!24388)) )
))
(declare-fun arrayNoDuplicates!0 (array!72753 (_ BitVec 32) List!24388) Bool)

(assert (=> b!1117748 (= res!745952 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24385))))

(declare-fun b!1117749 () Bool)

(declare-fun e!636942 () Bool)

(declare-fun tp_is_empty!27907 () Bool)

(assert (=> b!1117749 (= e!636942 tp_is_empty!27907)))

(declare-fun b!1117750 () Bool)

(declare-fun res!745953 () Bool)

(assert (=> b!1117750 (=> (not res!745953) (not e!636941))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1117750 (= res!745953 (= (select (arr!35023 _keys!1208) i!673) k0!934))))

(declare-fun b!1117751 () Bool)

(declare-fun res!745948 () Bool)

(assert (=> b!1117751 (=> (not res!745948) (not e!636941))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117751 (= res!745948 (validMask!0 mask!1564))))

(declare-fun b!1117752 () Bool)

(declare-fun e!636937 () Bool)

(assert (=> b!1117752 (= e!636937 tp_is_empty!27907)))

(declare-fun res!745950 () Bool)

(assert (=> start!97912 (=> (not res!745950) (not e!636941))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97912 (= res!745950 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35560 _keys!1208))))))

(assert (=> start!97912 e!636941))

(declare-fun array_inv!26984 (array!72753) Bool)

(assert (=> start!97912 (array_inv!26984 _keys!1208)))

(assert (=> start!97912 true))

(declare-datatypes ((V!42337 0))(
  ( (V!42338 (val!14010 Int)) )
))
(declare-datatypes ((ValueCell!13244 0))(
  ( (ValueCellFull!13244 (v!16639 V!42337)) (EmptyCell!13244) )
))
(declare-datatypes ((array!72755 0))(
  ( (array!72756 (arr!35024 (Array (_ BitVec 32) ValueCell!13244)) (size!35561 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72755)

(declare-fun e!636938 () Bool)

(declare-fun array_inv!26985 (array!72755) Bool)

(assert (=> start!97912 (and (array_inv!26985 _values!996) e!636938)))

(declare-fun b!1117753 () Bool)

(declare-fun res!745945 () Bool)

(assert (=> b!1117753 (=> (not res!745945) (not e!636941))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1117753 (= res!745945 (and (= (size!35561 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35560 _keys!1208) (size!35561 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!43678 () Bool)

(declare-fun mapRes!43678 () Bool)

(assert (=> mapIsEmpty!43678 mapRes!43678))

(declare-fun b!1117754 () Bool)

(declare-fun res!745951 () Bool)

(assert (=> b!1117754 (=> (not res!745951) (not e!636941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72753 (_ BitVec 32)) Bool)

(assert (=> b!1117754 (= res!745951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1117755 () Bool)

(assert (=> b!1117755 (= e!636938 (and e!636942 mapRes!43678))))

(declare-fun condMapEmpty!43678 () Bool)

(declare-fun mapDefault!43678 () ValueCell!13244)

(assert (=> b!1117755 (= condMapEmpty!43678 (= (arr!35024 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13244)) mapDefault!43678)))))

(declare-fun mapNonEmpty!43678 () Bool)

(declare-fun tp!82922 () Bool)

(assert (=> mapNonEmpty!43678 (= mapRes!43678 (and tp!82922 e!636937))))

(declare-fun mapRest!43678 () (Array (_ BitVec 32) ValueCell!13244))

(declare-fun mapKey!43678 () (_ BitVec 32))

(declare-fun mapValue!43678 () ValueCell!13244)

(assert (=> mapNonEmpty!43678 (= (arr!35024 _values!996) (store mapRest!43678 mapKey!43678 mapValue!43678))))

(declare-fun b!1117756 () Bool)

(declare-fun res!745947 () Bool)

(declare-fun e!636939 () Bool)

(assert (=> b!1117756 (=> (not res!745947) (not e!636939))))

(declare-fun lt!497647 () array!72753)

(assert (=> b!1117756 (= res!745947 (arrayNoDuplicates!0 lt!497647 #b00000000000000000000000000000000 Nil!24385))))

(declare-fun b!1117757 () Bool)

(assert (=> b!1117757 (= e!636939 (not true))))

(declare-fun arrayContainsKey!0 (array!72753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117757 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36611 0))(
  ( (Unit!36612) )
))
(declare-fun lt!497646 () Unit!36611)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72753 (_ BitVec 64) (_ BitVec 32)) Unit!36611)

(assert (=> b!1117757 (= lt!497646 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1117758 () Bool)

(declare-fun res!745946 () Bool)

(assert (=> b!1117758 (=> (not res!745946) (not e!636941))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117758 (= res!745946 (validKeyInArray!0 k0!934))))

(declare-fun b!1117759 () Bool)

(assert (=> b!1117759 (= e!636941 e!636939)))

(declare-fun res!745949 () Bool)

(assert (=> b!1117759 (=> (not res!745949) (not e!636939))))

(assert (=> b!1117759 (= res!745949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497647 mask!1564))))

(assert (=> b!1117759 (= lt!497647 (array!72754 (store (arr!35023 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35560 _keys!1208)))))

(assert (= (and start!97912 res!745950) b!1117751))

(assert (= (and b!1117751 res!745948) b!1117753))

(assert (= (and b!1117753 res!745945) b!1117754))

(assert (= (and b!1117754 res!745951) b!1117748))

(assert (= (and b!1117748 res!745952) b!1117747))

(assert (= (and b!1117747 res!745954) b!1117758))

(assert (= (and b!1117758 res!745946) b!1117750))

(assert (= (and b!1117750 res!745953) b!1117759))

(assert (= (and b!1117759 res!745949) b!1117756))

(assert (= (and b!1117756 res!745947) b!1117757))

(assert (= (and b!1117755 condMapEmpty!43678) mapIsEmpty!43678))

(assert (= (and b!1117755 (not condMapEmpty!43678)) mapNonEmpty!43678))

(get-info :version)

(assert (= (and mapNonEmpty!43678 ((_ is ValueCellFull!13244) mapValue!43678)) b!1117752))

(assert (= (and b!1117755 ((_ is ValueCellFull!13244) mapDefault!43678)) b!1117749))

(assert (= start!97912 b!1117755))

(declare-fun m!1034307 () Bool)

(assert (=> b!1117748 m!1034307))

(declare-fun m!1034309 () Bool)

(assert (=> b!1117757 m!1034309))

(declare-fun m!1034311 () Bool)

(assert (=> b!1117757 m!1034311))

(declare-fun m!1034313 () Bool)

(assert (=> start!97912 m!1034313))

(declare-fun m!1034315 () Bool)

(assert (=> start!97912 m!1034315))

(declare-fun m!1034317 () Bool)

(assert (=> b!1117751 m!1034317))

(declare-fun m!1034319 () Bool)

(assert (=> b!1117750 m!1034319))

(declare-fun m!1034321 () Bool)

(assert (=> b!1117754 m!1034321))

(declare-fun m!1034323 () Bool)

(assert (=> b!1117756 m!1034323))

(declare-fun m!1034325 () Bool)

(assert (=> b!1117759 m!1034325))

(declare-fun m!1034327 () Bool)

(assert (=> b!1117759 m!1034327))

(declare-fun m!1034329 () Bool)

(assert (=> mapNonEmpty!43678 m!1034329))

(declare-fun m!1034331 () Bool)

(assert (=> b!1117758 m!1034331))

(check-sat (not b!1117757) (not b!1117756) tp_is_empty!27907 (not b!1117751) (not b!1117748) (not b!1117754) (not b!1117758) (not mapNonEmpty!43678) (not start!97912) (not b!1117759))
(check-sat)
