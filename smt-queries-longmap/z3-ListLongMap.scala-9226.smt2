; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110706 () Bool)

(assert start!110706)

(declare-fun b_free!29541 () Bool)

(declare-fun b_next!29541 () Bool)

(assert (=> start!110706 (= b_free!29541 (not b_next!29541))))

(declare-fun tp!103945 () Bool)

(declare-fun b_and!47749 () Bool)

(assert (=> start!110706 (= tp!103945 b_and!47749)))

(declare-fun b!1310083 () Bool)

(declare-fun e!747419 () Bool)

(declare-fun tp_is_empty!35271 () Bool)

(assert (=> b!1310083 (= e!747419 tp_is_empty!35271)))

(declare-fun b!1310084 () Bool)

(declare-fun res!869698 () Bool)

(declare-fun e!747418 () Bool)

(assert (=> b!1310084 (=> (not res!869698) (not e!747418))))

(declare-datatypes ((array!87532 0))(
  ( (array!87533 (arr!42246 (Array (_ BitVec 32) (_ BitVec 64))) (size!42796 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87532)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1310084 (= res!869698 (validKeyInArray!0 (select (arr!42246 _keys!1628) from!2020)))))

(declare-fun res!869697 () Bool)

(assert (=> start!110706 (=> (not res!869697) (not e!747418))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110706 (= res!869697 (validMask!0 mask!2040))))

(assert (=> start!110706 e!747418))

(assert (=> start!110706 tp!103945))

(declare-fun array_inv!31923 (array!87532) Bool)

(assert (=> start!110706 (array_inv!31923 _keys!1628)))

(assert (=> start!110706 true))

(assert (=> start!110706 tp_is_empty!35271))

(declare-datatypes ((V!52131 0))(
  ( (V!52132 (val!17710 Int)) )
))
(declare-datatypes ((ValueCell!16737 0))(
  ( (ValueCellFull!16737 (v!20337 V!52131)) (EmptyCell!16737) )
))
(declare-datatypes ((array!87534 0))(
  ( (array!87535 (arr!42247 (Array (_ BitVec 32) ValueCell!16737)) (size!42797 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87534)

(declare-fun e!747422 () Bool)

(declare-fun array_inv!31924 (array!87534) Bool)

(assert (=> start!110706 (and (array_inv!31924 _values!1354) e!747422)))

(declare-fun b!1310085 () Bool)

(declare-fun res!869693 () Bool)

(assert (=> b!1310085 (=> (not res!869693) (not e!747418))))

(declare-fun k0!1175 () (_ BitVec 64))

(assert (=> b!1310085 (= res!869693 (not (= (select (arr!42246 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1310086 () Bool)

(declare-fun res!869700 () Bool)

(assert (=> b!1310086 (=> (not res!869700) (not e!747418))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87532 (_ BitVec 32)) Bool)

(assert (=> b!1310086 (= res!869700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310087 () Bool)

(declare-fun res!869699 () Bool)

(assert (=> b!1310087 (=> (not res!869699) (not e!747418))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52131)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun zeroValue!1296 () V!52131)

(declare-datatypes ((tuple2!22812 0))(
  ( (tuple2!22813 (_1!11417 (_ BitVec 64)) (_2!11417 V!52131)) )
))
(declare-datatypes ((List!29951 0))(
  ( (Nil!29948) (Cons!29947 (h!31156 tuple2!22812) (t!43557 List!29951)) )
))
(declare-datatypes ((ListLongMap!20469 0))(
  ( (ListLongMap!20470 (toList!10250 List!29951)) )
))
(declare-fun contains!8400 (ListLongMap!20469 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5263 (array!87532 array!87534 (_ BitVec 32) (_ BitVec 32) V!52131 V!52131 (_ BitVec 32) Int) ListLongMap!20469)

(assert (=> b!1310087 (= res!869699 (contains!8400 (getCurrentListMap!5263 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapNonEmpty!54535 () Bool)

(declare-fun mapRes!54535 () Bool)

(declare-fun tp!103944 () Bool)

(assert (=> mapNonEmpty!54535 (= mapRes!54535 (and tp!103944 e!747419))))

(declare-fun mapValue!54535 () ValueCell!16737)

(declare-fun mapKey!54535 () (_ BitVec 32))

(declare-fun mapRest!54535 () (Array (_ BitVec 32) ValueCell!16737))

(assert (=> mapNonEmpty!54535 (= (arr!42247 _values!1354) (store mapRest!54535 mapKey!54535 mapValue!54535))))

(declare-fun b!1310088 () Bool)

(declare-fun e!747420 () Bool)

(assert (=> b!1310088 (= e!747422 (and e!747420 mapRes!54535))))

(declare-fun condMapEmpty!54535 () Bool)

(declare-fun mapDefault!54535 () ValueCell!16737)

(assert (=> b!1310088 (= condMapEmpty!54535 (= (arr!42247 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16737)) mapDefault!54535)))))

(declare-fun b!1310089 () Bool)

(assert (=> b!1310089 (= e!747418 (not true))))

(assert (=> b!1310089 (contains!8400 (getCurrentListMap!5263 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43322 0))(
  ( (Unit!43323) )
))
(declare-fun lt!585330 () Unit!43322)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!7 (array!87532 array!87534 (_ BitVec 32) (_ BitVec 32) V!52131 V!52131 (_ BitVec 64) (_ BitVec 32) Int) Unit!43322)

(assert (=> b!1310089 (= lt!585330 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!7 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1310090 () Bool)

(declare-fun res!869692 () Bool)

(assert (=> b!1310090 (=> (not res!869692) (not e!747418))))

(assert (=> b!1310090 (= res!869692 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1310091 () Bool)

(declare-fun res!869696 () Bool)

(assert (=> b!1310091 (=> (not res!869696) (not e!747418))))

(assert (=> b!1310091 (= res!869696 (and (= (size!42797 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42796 _keys!1628) (size!42797 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310092 () Bool)

(declare-fun res!869695 () Bool)

(assert (=> b!1310092 (=> (not res!869695) (not e!747418))))

(declare-datatypes ((List!29952 0))(
  ( (Nil!29949) (Cons!29948 (h!31157 (_ BitVec 64)) (t!43558 List!29952)) )
))
(declare-fun arrayNoDuplicates!0 (array!87532 (_ BitVec 32) List!29952) Bool)

(assert (=> b!1310092 (= res!869695 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29949))))

(declare-fun b!1310093 () Bool)

(declare-fun res!869694 () Bool)

(assert (=> b!1310093 (=> (not res!869694) (not e!747418))))

(assert (=> b!1310093 (= res!869694 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42796 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!54535 () Bool)

(assert (=> mapIsEmpty!54535 mapRes!54535))

(declare-fun b!1310094 () Bool)

(assert (=> b!1310094 (= e!747420 tp_is_empty!35271)))

(assert (= (and start!110706 res!869697) b!1310091))

(assert (= (and b!1310091 res!869696) b!1310086))

(assert (= (and b!1310086 res!869700) b!1310092))

(assert (= (and b!1310092 res!869695) b!1310093))

(assert (= (and b!1310093 res!869694) b!1310087))

(assert (= (and b!1310087 res!869699) b!1310085))

(assert (= (and b!1310085 res!869693) b!1310084))

(assert (= (and b!1310084 res!869698) b!1310090))

(assert (= (and b!1310090 res!869692) b!1310089))

(assert (= (and b!1310088 condMapEmpty!54535) mapIsEmpty!54535))

(assert (= (and b!1310088 (not condMapEmpty!54535)) mapNonEmpty!54535))

(get-info :version)

(assert (= (and mapNonEmpty!54535 ((_ is ValueCellFull!16737) mapValue!54535)) b!1310083))

(assert (= (and b!1310088 ((_ is ValueCellFull!16737) mapDefault!54535)) b!1310094))

(assert (= start!110706 b!1310088))

(declare-fun m!1199963 () Bool)

(assert (=> b!1310092 m!1199963))

(declare-fun m!1199965 () Bool)

(assert (=> start!110706 m!1199965))

(declare-fun m!1199967 () Bool)

(assert (=> start!110706 m!1199967))

(declare-fun m!1199969 () Bool)

(assert (=> start!110706 m!1199969))

(declare-fun m!1199971 () Bool)

(assert (=> b!1310084 m!1199971))

(assert (=> b!1310084 m!1199971))

(declare-fun m!1199973 () Bool)

(assert (=> b!1310084 m!1199973))

(declare-fun m!1199975 () Bool)

(assert (=> mapNonEmpty!54535 m!1199975))

(declare-fun m!1199977 () Bool)

(assert (=> b!1310087 m!1199977))

(assert (=> b!1310087 m!1199977))

(declare-fun m!1199979 () Bool)

(assert (=> b!1310087 m!1199979))

(declare-fun m!1199981 () Bool)

(assert (=> b!1310086 m!1199981))

(declare-fun m!1199983 () Bool)

(assert (=> b!1310089 m!1199983))

(assert (=> b!1310089 m!1199983))

(declare-fun m!1199985 () Bool)

(assert (=> b!1310089 m!1199985))

(declare-fun m!1199987 () Bool)

(assert (=> b!1310089 m!1199987))

(assert (=> b!1310085 m!1199971))

(check-sat tp_is_empty!35271 b_and!47749 (not b_next!29541) (not b!1310089) (not start!110706) (not b!1310086) (not b!1310092) (not b!1310084) (not b!1310087) (not mapNonEmpty!54535))
(check-sat b_and!47749 (not b_next!29541))
