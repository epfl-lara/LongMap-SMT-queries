; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97368 () Bool)

(assert start!97368)

(declare-fun mapNonEmpty!42883 () Bool)

(declare-fun mapRes!42883 () Bool)

(declare-fun tp!81803 () Bool)

(declare-fun e!631480 () Bool)

(assert (=> mapNonEmpty!42883 (= mapRes!42883 (and tp!81803 e!631480))))

(declare-datatypes ((V!41633 0))(
  ( (V!41634 (val!13746 Int)) )
))
(declare-datatypes ((ValueCell!12980 0))(
  ( (ValueCellFull!12980 (v!16375 V!41633)) (EmptyCell!12980) )
))
(declare-fun mapValue!42883 () ValueCell!12980)

(declare-datatypes ((array!71715 0))(
  ( (array!71716 (arr!34505 (Array (_ BitVec 32) ValueCell!12980)) (size!35042 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71715)

(declare-fun mapRest!42883 () (Array (_ BitVec 32) ValueCell!12980))

(declare-fun mapKey!42883 () (_ BitVec 32))

(assert (=> mapNonEmpty!42883 (= (arr!34505 _values!996) (store mapRest!42883 mapKey!42883 mapValue!42883))))

(declare-fun b!1106177 () Bool)

(declare-fun e!631482 () Bool)

(declare-fun e!631483 () Bool)

(assert (=> b!1106177 (= e!631482 (and e!631483 mapRes!42883))))

(declare-fun condMapEmpty!42883 () Bool)

(declare-fun mapDefault!42883 () ValueCell!12980)

(assert (=> b!1106177 (= condMapEmpty!42883 (= (arr!34505 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12980)) mapDefault!42883)))))

(declare-fun b!1106178 () Bool)

(declare-fun tp_is_empty!27379 () Bool)

(assert (=> b!1106178 (= e!631483 tp_is_empty!27379)))

(declare-fun res!737681 () Bool)

(declare-fun e!631481 () Bool)

(assert (=> start!97368 (=> (not res!737681) (not e!631481))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!71717 0))(
  ( (array!71718 (arr!34506 (Array (_ BitVec 32) (_ BitVec 64))) (size!35043 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71717)

(assert (=> start!97368 (= res!737681 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35043 _keys!1208))))))

(assert (=> start!97368 e!631481))

(declare-fun array_inv!26602 (array!71717) Bool)

(assert (=> start!97368 (array_inv!26602 _keys!1208)))

(assert (=> start!97368 true))

(declare-fun array_inv!26603 (array!71715) Bool)

(assert (=> start!97368 (and (array_inv!26603 _values!996) e!631482)))

(declare-fun b!1106179 () Bool)

(assert (=> b!1106179 (= e!631480 tp_is_empty!27379)))

(declare-fun b!1106180 () Bool)

(declare-fun e!631484 () Bool)

(assert (=> b!1106180 (= e!631484 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106180 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36243 0))(
  ( (Unit!36244) )
))
(declare-fun lt!495723 () Unit!36243)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71717 (_ BitVec 64) (_ BitVec 32)) Unit!36243)

(assert (=> b!1106180 (= lt!495723 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1106181 () Bool)

(declare-fun res!737684 () Bool)

(assert (=> b!1106181 (=> (not res!737684) (not e!631481))))

(assert (=> b!1106181 (= res!737684 (= (select (arr!34506 _keys!1208) i!673) k0!934))))

(declare-fun b!1106182 () Bool)

(declare-fun res!737675 () Bool)

(assert (=> b!1106182 (=> (not res!737675) (not e!631484))))

(declare-fun lt!495724 () array!71717)

(declare-datatypes ((List!24087 0))(
  ( (Nil!24084) (Cons!24083 (h!25301 (_ BitVec 64)) (t!34344 List!24087)) )
))
(declare-fun arrayNoDuplicates!0 (array!71717 (_ BitVec 32) List!24087) Bool)

(assert (=> b!1106182 (= res!737675 (arrayNoDuplicates!0 lt!495724 #b00000000000000000000000000000000 Nil!24084))))

(declare-fun mapIsEmpty!42883 () Bool)

(assert (=> mapIsEmpty!42883 mapRes!42883))

(declare-fun b!1106183 () Bool)

(declare-fun res!737677 () Bool)

(assert (=> b!1106183 (=> (not res!737677) (not e!631481))))

(assert (=> b!1106183 (= res!737677 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35043 _keys!1208))))))

(declare-fun b!1106184 () Bool)

(declare-fun res!737680 () Bool)

(assert (=> b!1106184 (=> (not res!737680) (not e!631481))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106184 (= res!737680 (validKeyInArray!0 k0!934))))

(declare-fun b!1106185 () Bool)

(declare-fun res!737682 () Bool)

(assert (=> b!1106185 (=> (not res!737682) (not e!631481))))

(assert (=> b!1106185 (= res!737682 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24084))))

(declare-fun b!1106186 () Bool)

(declare-fun res!737678 () Bool)

(assert (=> b!1106186 (=> (not res!737678) (not e!631481))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1106186 (= res!737678 (and (= (size!35042 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35043 _keys!1208) (size!35042 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1106187 () Bool)

(assert (=> b!1106187 (= e!631481 e!631484)))

(declare-fun res!737683 () Bool)

(assert (=> b!1106187 (=> (not res!737683) (not e!631484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71717 (_ BitVec 32)) Bool)

(assert (=> b!1106187 (= res!737683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495724 mask!1564))))

(assert (=> b!1106187 (= lt!495724 (array!71718 (store (arr!34506 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35043 _keys!1208)))))

(declare-fun b!1106188 () Bool)

(declare-fun res!737676 () Bool)

(assert (=> b!1106188 (=> (not res!737676) (not e!631481))))

(assert (=> b!1106188 (= res!737676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1106189 () Bool)

(declare-fun res!737679 () Bool)

(assert (=> b!1106189 (=> (not res!737679) (not e!631481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106189 (= res!737679 (validMask!0 mask!1564))))

(assert (= (and start!97368 res!737681) b!1106189))

(assert (= (and b!1106189 res!737679) b!1106186))

(assert (= (and b!1106186 res!737678) b!1106188))

(assert (= (and b!1106188 res!737676) b!1106185))

(assert (= (and b!1106185 res!737682) b!1106183))

(assert (= (and b!1106183 res!737677) b!1106184))

(assert (= (and b!1106184 res!737680) b!1106181))

(assert (= (and b!1106181 res!737684) b!1106187))

(assert (= (and b!1106187 res!737683) b!1106182))

(assert (= (and b!1106182 res!737675) b!1106180))

(assert (= (and b!1106177 condMapEmpty!42883) mapIsEmpty!42883))

(assert (= (and b!1106177 (not condMapEmpty!42883)) mapNonEmpty!42883))

(get-info :version)

(assert (= (and mapNonEmpty!42883 ((_ is ValueCellFull!12980) mapValue!42883)) b!1106179))

(assert (= (and b!1106177 ((_ is ValueCellFull!12980) mapDefault!42883)) b!1106178))

(assert (= start!97368 b!1106177))

(declare-fun m!1026109 () Bool)

(assert (=> b!1106180 m!1026109))

(declare-fun m!1026111 () Bool)

(assert (=> b!1106180 m!1026111))

(declare-fun m!1026113 () Bool)

(assert (=> b!1106185 m!1026113))

(declare-fun m!1026115 () Bool)

(assert (=> b!1106184 m!1026115))

(declare-fun m!1026117 () Bool)

(assert (=> b!1106189 m!1026117))

(declare-fun m!1026119 () Bool)

(assert (=> mapNonEmpty!42883 m!1026119))

(declare-fun m!1026121 () Bool)

(assert (=> b!1106182 m!1026121))

(declare-fun m!1026123 () Bool)

(assert (=> b!1106187 m!1026123))

(declare-fun m!1026125 () Bool)

(assert (=> b!1106187 m!1026125))

(declare-fun m!1026127 () Bool)

(assert (=> b!1106181 m!1026127))

(declare-fun m!1026129 () Bool)

(assert (=> start!97368 m!1026129))

(declare-fun m!1026131 () Bool)

(assert (=> start!97368 m!1026131))

(declare-fun m!1026133 () Bool)

(assert (=> b!1106188 m!1026133))

(check-sat (not b!1106187) (not b!1106182) (not b!1106180) tp_is_empty!27379 (not b!1106184) (not b!1106188) (not b!1106189) (not b!1106185) (not mapNonEmpty!42883) (not start!97368))
(check-sat)
