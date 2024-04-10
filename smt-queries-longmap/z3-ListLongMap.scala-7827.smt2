; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97708 () Bool)

(assert start!97708)

(declare-fun b!1117044 () Bool)

(declare-fun res!745904 () Bool)

(declare-fun e!636372 () Bool)

(assert (=> b!1117044 (=> (not res!745904) (not e!636372))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117044 (= res!745904 (validKeyInArray!0 k0!934))))

(declare-fun b!1117045 () Bool)

(declare-fun e!636371 () Bool)

(assert (=> b!1117045 (= e!636371 (not true))))

(declare-datatypes ((array!72775 0))(
  ( (array!72776 (arr!35040 (Array (_ BitVec 32) (_ BitVec 64))) (size!35576 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72775)

(declare-fun arrayContainsKey!0 (array!72775 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117045 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36658 0))(
  ( (Unit!36659) )
))
(declare-fun lt!497227 () Unit!36658)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72775 (_ BitVec 64) (_ BitVec 32)) Unit!36658)

(assert (=> b!1117045 (= lt!497227 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1117046 () Bool)

(assert (=> b!1117046 (= e!636372 e!636371)))

(declare-fun res!745908 () Bool)

(assert (=> b!1117046 (=> (not res!745908) (not e!636371))))

(declare-fun lt!497228 () array!72775)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72775 (_ BitVec 32)) Bool)

(assert (=> b!1117046 (= res!745908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497228 mask!1564))))

(assert (=> b!1117046 (= lt!497228 (array!72776 (store (arr!35040 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35576 _keys!1208)))))

(declare-fun b!1117047 () Bool)

(declare-fun res!745909 () Bool)

(assert (=> b!1117047 (=> (not res!745909) (not e!636372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117047 (= res!745909 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!43726 () Bool)

(declare-fun mapRes!43726 () Bool)

(assert (=> mapIsEmpty!43726 mapRes!43726))

(declare-fun res!745906 () Bool)

(assert (=> start!97708 (=> (not res!745906) (not e!636372))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97708 (= res!745906 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35576 _keys!1208))))))

(assert (=> start!97708 e!636372))

(declare-fun array_inv!26928 (array!72775) Bool)

(assert (=> start!97708 (array_inv!26928 _keys!1208)))

(assert (=> start!97708 true))

(declare-datatypes ((V!42379 0))(
  ( (V!42380 (val!14026 Int)) )
))
(declare-datatypes ((ValueCell!13260 0))(
  ( (ValueCellFull!13260 (v!16659 V!42379)) (EmptyCell!13260) )
))
(declare-datatypes ((array!72777 0))(
  ( (array!72778 (arr!35041 (Array (_ BitVec 32) ValueCell!13260)) (size!35577 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72777)

(declare-fun e!636375 () Bool)

(declare-fun array_inv!26929 (array!72777) Bool)

(assert (=> start!97708 (and (array_inv!26929 _values!996) e!636375)))

(declare-fun b!1117048 () Bool)

(declare-fun e!636373 () Bool)

(declare-fun tp_is_empty!27939 () Bool)

(assert (=> b!1117048 (= e!636373 tp_is_empty!27939)))

(declare-fun mapNonEmpty!43726 () Bool)

(declare-fun tp!82970 () Bool)

(declare-fun e!636370 () Bool)

(assert (=> mapNonEmpty!43726 (= mapRes!43726 (and tp!82970 e!636370))))

(declare-fun mapRest!43726 () (Array (_ BitVec 32) ValueCell!13260))

(declare-fun mapKey!43726 () (_ BitVec 32))

(declare-fun mapValue!43726 () ValueCell!13260)

(assert (=> mapNonEmpty!43726 (= (arr!35041 _values!996) (store mapRest!43726 mapKey!43726 mapValue!43726))))

(declare-fun b!1117049 () Bool)

(declare-fun res!745911 () Bool)

(assert (=> b!1117049 (=> (not res!745911) (not e!636372))))

(assert (=> b!1117049 (= res!745911 (= (select (arr!35040 _keys!1208) i!673) k0!934))))

(declare-fun b!1117050 () Bool)

(assert (=> b!1117050 (= e!636370 tp_is_empty!27939)))

(declare-fun b!1117051 () Bool)

(declare-fun res!745907 () Bool)

(assert (=> b!1117051 (=> (not res!745907) (not e!636371))))

(declare-datatypes ((List!24381 0))(
  ( (Nil!24378) (Cons!24377 (h!25586 (_ BitVec 64)) (t!34862 List!24381)) )
))
(declare-fun arrayNoDuplicates!0 (array!72775 (_ BitVec 32) List!24381) Bool)

(assert (=> b!1117051 (= res!745907 (arrayNoDuplicates!0 lt!497228 #b00000000000000000000000000000000 Nil!24378))))

(declare-fun b!1117052 () Bool)

(declare-fun res!745912 () Bool)

(assert (=> b!1117052 (=> (not res!745912) (not e!636372))))

(assert (=> b!1117052 (= res!745912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1117053 () Bool)

(declare-fun res!745905 () Bool)

(assert (=> b!1117053 (=> (not res!745905) (not e!636372))))

(assert (=> b!1117053 (= res!745905 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35576 _keys!1208))))))

(declare-fun b!1117054 () Bool)

(assert (=> b!1117054 (= e!636375 (and e!636373 mapRes!43726))))

(declare-fun condMapEmpty!43726 () Bool)

(declare-fun mapDefault!43726 () ValueCell!13260)

(assert (=> b!1117054 (= condMapEmpty!43726 (= (arr!35041 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13260)) mapDefault!43726)))))

(declare-fun b!1117055 () Bool)

(declare-fun res!745910 () Bool)

(assert (=> b!1117055 (=> (not res!745910) (not e!636372))))

(assert (=> b!1117055 (= res!745910 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24378))))

(declare-fun b!1117056 () Bool)

(declare-fun res!745903 () Bool)

(assert (=> b!1117056 (=> (not res!745903) (not e!636372))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1117056 (= res!745903 (and (= (size!35577 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35576 _keys!1208) (size!35577 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!97708 res!745906) b!1117047))

(assert (= (and b!1117047 res!745909) b!1117056))

(assert (= (and b!1117056 res!745903) b!1117052))

(assert (= (and b!1117052 res!745912) b!1117055))

(assert (= (and b!1117055 res!745910) b!1117053))

(assert (= (and b!1117053 res!745905) b!1117044))

(assert (= (and b!1117044 res!745904) b!1117049))

(assert (= (and b!1117049 res!745911) b!1117046))

(assert (= (and b!1117046 res!745908) b!1117051))

(assert (= (and b!1117051 res!745907) b!1117045))

(assert (= (and b!1117054 condMapEmpty!43726) mapIsEmpty!43726))

(assert (= (and b!1117054 (not condMapEmpty!43726)) mapNonEmpty!43726))

(get-info :version)

(assert (= (and mapNonEmpty!43726 ((_ is ValueCellFull!13260) mapValue!43726)) b!1117050))

(assert (= (and b!1117054 ((_ is ValueCellFull!13260) mapDefault!43726)) b!1117048))

(assert (= start!97708 b!1117054))

(declare-fun m!1033051 () Bool)

(assert (=> b!1117045 m!1033051))

(declare-fun m!1033053 () Bool)

(assert (=> b!1117045 m!1033053))

(declare-fun m!1033055 () Bool)

(assert (=> b!1117052 m!1033055))

(declare-fun m!1033057 () Bool)

(assert (=> b!1117046 m!1033057))

(declare-fun m!1033059 () Bool)

(assert (=> b!1117046 m!1033059))

(declare-fun m!1033061 () Bool)

(assert (=> b!1117044 m!1033061))

(declare-fun m!1033063 () Bool)

(assert (=> b!1117055 m!1033063))

(declare-fun m!1033065 () Bool)

(assert (=> b!1117051 m!1033065))

(declare-fun m!1033067 () Bool)

(assert (=> b!1117047 m!1033067))

(declare-fun m!1033069 () Bool)

(assert (=> b!1117049 m!1033069))

(declare-fun m!1033071 () Bool)

(assert (=> start!97708 m!1033071))

(declare-fun m!1033073 () Bool)

(assert (=> start!97708 m!1033073))

(declare-fun m!1033075 () Bool)

(assert (=> mapNonEmpty!43726 m!1033075))

(check-sat (not mapNonEmpty!43726) (not b!1117045) (not b!1117052) (not b!1117051) (not start!97708) (not b!1117046) (not b!1117044) (not b!1117055) tp_is_empty!27939 (not b!1117047))
(check-sat)
