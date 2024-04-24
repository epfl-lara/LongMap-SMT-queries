; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97822 () Bool)

(assert start!97822)

(declare-fun b!1115992 () Bool)

(declare-fun e!636132 () Bool)

(declare-fun tp_is_empty!27817 () Bool)

(assert (=> b!1115992 (= e!636132 tp_is_empty!27817)))

(declare-fun b!1115993 () Bool)

(declare-fun e!636130 () Bool)

(assert (=> b!1115993 (= e!636130 (not true))))

(declare-datatypes ((array!72575 0))(
  ( (array!72576 (arr!34934 (Array (_ BitVec 32) (_ BitVec 64))) (size!35471 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72575)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72575 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115993 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36555 0))(
  ( (Unit!36556) )
))
(declare-fun lt!497376 () Unit!36555)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72575 (_ BitVec 64) (_ BitVec 32)) Unit!36555)

(assert (=> b!1115993 (= lt!497376 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1115994 () Bool)

(declare-fun res!744601 () Bool)

(declare-fun e!636129 () Bool)

(assert (=> b!1115994 (=> (not res!744601) (not e!636129))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72575 (_ BitVec 32)) Bool)

(assert (=> b!1115994 (= res!744601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1115995 () Bool)

(declare-fun res!744603 () Bool)

(assert (=> b!1115995 (=> (not res!744603) (not e!636129))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115995 (= res!744603 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!43543 () Bool)

(declare-fun mapRes!43543 () Bool)

(assert (=> mapIsEmpty!43543 mapRes!43543))

(declare-fun b!1115996 () Bool)

(declare-fun e!636128 () Bool)

(assert (=> b!1115996 (= e!636128 tp_is_empty!27817)))

(declare-fun b!1115997 () Bool)

(declare-fun res!744597 () Bool)

(assert (=> b!1115997 (=> (not res!744597) (not e!636130))))

(declare-fun lt!497377 () array!72575)

(declare-datatypes ((List!24351 0))(
  ( (Nil!24348) (Cons!24347 (h!25565 (_ BitVec 64)) (t!34824 List!24351)) )
))
(declare-fun arrayNoDuplicates!0 (array!72575 (_ BitVec 32) List!24351) Bool)

(assert (=> b!1115997 (= res!744597 (arrayNoDuplicates!0 lt!497377 #b00000000000000000000000000000000 Nil!24348))))

(declare-fun b!1115998 () Bool)

(declare-fun res!744604 () Bool)

(assert (=> b!1115998 (=> (not res!744604) (not e!636129))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42217 0))(
  ( (V!42218 (val!13965 Int)) )
))
(declare-datatypes ((ValueCell!13199 0))(
  ( (ValueCellFull!13199 (v!16594 V!42217)) (EmptyCell!13199) )
))
(declare-datatypes ((array!72577 0))(
  ( (array!72578 (arr!34935 (Array (_ BitVec 32) ValueCell!13199)) (size!35472 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72577)

(assert (=> b!1115998 (= res!744604 (and (= (size!35472 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35471 _keys!1208) (size!35472 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1115999 () Bool)

(declare-fun res!744596 () Bool)

(assert (=> b!1115999 (=> (not res!744596) (not e!636129))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115999 (= res!744596 (validKeyInArray!0 k0!934))))

(declare-fun b!1116000 () Bool)

(assert (=> b!1116000 (= e!636129 e!636130)))

(declare-fun res!744599 () Bool)

(assert (=> b!1116000 (=> (not res!744599) (not e!636130))))

(assert (=> b!1116000 (= res!744599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497377 mask!1564))))

(assert (=> b!1116000 (= lt!497377 (array!72576 (store (arr!34934 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35471 _keys!1208)))))

(declare-fun mapNonEmpty!43543 () Bool)

(declare-fun tp!82787 () Bool)

(assert (=> mapNonEmpty!43543 (= mapRes!43543 (and tp!82787 e!636128))))

(declare-fun mapValue!43543 () ValueCell!13199)

(declare-fun mapKey!43543 () (_ BitVec 32))

(declare-fun mapRest!43543 () (Array (_ BitVec 32) ValueCell!13199))

(assert (=> mapNonEmpty!43543 (= (arr!34935 _values!996) (store mapRest!43543 mapKey!43543 mapValue!43543))))

(declare-fun b!1116001 () Bool)

(declare-fun res!744600 () Bool)

(assert (=> b!1116001 (=> (not res!744600) (not e!636129))))

(assert (=> b!1116001 (= res!744600 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35471 _keys!1208))))))

(declare-fun res!744602 () Bool)

(assert (=> start!97822 (=> (not res!744602) (not e!636129))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97822 (= res!744602 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35471 _keys!1208))))))

(assert (=> start!97822 e!636129))

(declare-fun array_inv!26920 (array!72575) Bool)

(assert (=> start!97822 (array_inv!26920 _keys!1208)))

(assert (=> start!97822 true))

(declare-fun e!636131 () Bool)

(declare-fun array_inv!26921 (array!72577) Bool)

(assert (=> start!97822 (and (array_inv!26921 _values!996) e!636131)))

(declare-fun b!1116002 () Bool)

(assert (=> b!1116002 (= e!636131 (and e!636132 mapRes!43543))))

(declare-fun condMapEmpty!43543 () Bool)

(declare-fun mapDefault!43543 () ValueCell!13199)

(assert (=> b!1116002 (= condMapEmpty!43543 (= (arr!34935 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13199)) mapDefault!43543)))))

(declare-fun b!1116003 () Bool)

(declare-fun res!744595 () Bool)

(assert (=> b!1116003 (=> (not res!744595) (not e!636129))))

(assert (=> b!1116003 (= res!744595 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24348))))

(declare-fun b!1116004 () Bool)

(declare-fun res!744598 () Bool)

(assert (=> b!1116004 (=> (not res!744598) (not e!636129))))

(assert (=> b!1116004 (= res!744598 (= (select (arr!34934 _keys!1208) i!673) k0!934))))

(assert (= (and start!97822 res!744602) b!1115995))

(assert (= (and b!1115995 res!744603) b!1115998))

(assert (= (and b!1115998 res!744604) b!1115994))

(assert (= (and b!1115994 res!744601) b!1116003))

(assert (= (and b!1116003 res!744595) b!1116001))

(assert (= (and b!1116001 res!744600) b!1115999))

(assert (= (and b!1115999 res!744596) b!1116004))

(assert (= (and b!1116004 res!744598) b!1116000))

(assert (= (and b!1116000 res!744599) b!1115997))

(assert (= (and b!1115997 res!744597) b!1115993))

(assert (= (and b!1116002 condMapEmpty!43543) mapIsEmpty!43543))

(assert (= (and b!1116002 (not condMapEmpty!43543)) mapNonEmpty!43543))

(get-info :version)

(assert (= (and mapNonEmpty!43543 ((_ is ValueCellFull!13199) mapValue!43543)) b!1115996))

(assert (= (and b!1116002 ((_ is ValueCellFull!13199) mapDefault!43543)) b!1115992))

(assert (= start!97822 b!1116002))

(declare-fun m!1033137 () Bool)

(assert (=> b!1115994 m!1033137))

(declare-fun m!1033139 () Bool)

(assert (=> b!1115995 m!1033139))

(declare-fun m!1033141 () Bool)

(assert (=> b!1115999 m!1033141))

(declare-fun m!1033143 () Bool)

(assert (=> b!1116003 m!1033143))

(declare-fun m!1033145 () Bool)

(assert (=> b!1115993 m!1033145))

(declare-fun m!1033147 () Bool)

(assert (=> b!1115993 m!1033147))

(declare-fun m!1033149 () Bool)

(assert (=> b!1115997 m!1033149))

(declare-fun m!1033151 () Bool)

(assert (=> mapNonEmpty!43543 m!1033151))

(declare-fun m!1033153 () Bool)

(assert (=> start!97822 m!1033153))

(declare-fun m!1033155 () Bool)

(assert (=> start!97822 m!1033155))

(declare-fun m!1033157 () Bool)

(assert (=> b!1116000 m!1033157))

(declare-fun m!1033159 () Bool)

(assert (=> b!1116000 m!1033159))

(declare-fun m!1033161 () Bool)

(assert (=> b!1116004 m!1033161))

(check-sat (not b!1115993) (not b!1115995) (not start!97822) (not b!1116003) (not b!1115999) (not b!1115994) (not mapNonEmpty!43543) (not b!1116000) (not b!1115997) tp_is_empty!27817)
(check-sat)
