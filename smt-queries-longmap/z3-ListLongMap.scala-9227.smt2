; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110710 () Bool)

(assert start!110710)

(declare-fun b_free!29545 () Bool)

(declare-fun b_next!29545 () Bool)

(assert (=> start!110710 (= b_free!29545 (not b_next!29545))))

(declare-fun tp!103957 () Bool)

(declare-fun b_and!47735 () Bool)

(assert (=> start!110710 (= tp!103957 b_and!47735)))

(declare-fun mapNonEmpty!54541 () Bool)

(declare-fun mapRes!54541 () Bool)

(declare-fun tp!103958 () Bool)

(declare-fun e!747418 () Bool)

(assert (=> mapNonEmpty!54541 (= mapRes!54541 (and tp!103958 e!747418))))

(declare-datatypes ((V!52137 0))(
  ( (V!52138 (val!17712 Int)) )
))
(declare-datatypes ((ValueCell!16739 0))(
  ( (ValueCellFull!16739 (v!20338 V!52137)) (EmptyCell!16739) )
))
(declare-fun mapValue!54541 () ValueCell!16739)

(declare-fun mapKey!54541 () (_ BitVec 32))

(declare-fun mapRest!54541 () (Array (_ BitVec 32) ValueCell!16739))

(declare-datatypes ((array!87455 0))(
  ( (array!87456 (arr!42208 (Array (_ BitVec 32) ValueCell!16739)) (size!42760 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87455)

(assert (=> mapNonEmpty!54541 (= (arr!42208 _values!1354) (store mapRest!54541 mapKey!54541 mapValue!54541))))

(declare-fun b!1310086 () Bool)

(declare-fun e!747419 () Bool)

(assert (=> b!1310086 (= e!747419 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87457 0))(
  ( (array!87458 (arr!42209 (Array (_ BitVec 32) (_ BitVec 64))) (size!42761 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87457)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52137)

(declare-fun zeroValue!1296 () V!52137)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22906 0))(
  ( (tuple2!22907 (_1!11464 (_ BitVec 64)) (_2!11464 V!52137)) )
))
(declare-datatypes ((List!30031 0))(
  ( (Nil!30028) (Cons!30027 (h!31236 tuple2!22906) (t!43629 List!30031)) )
))
(declare-datatypes ((ListLongMap!20563 0))(
  ( (ListLongMap!20564 (toList!10297 List!30031)) )
))
(declare-fun contains!8374 (ListLongMap!20563 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5192 (array!87457 array!87455 (_ BitVec 32) (_ BitVec 32) V!52137 V!52137 (_ BitVec 32) Int) ListLongMap!20563)

(assert (=> b!1310086 (contains!8374 (getCurrentListMap!5192 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43167 0))(
  ( (Unit!43168) )
))
(declare-fun lt!585150 () Unit!43167)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!10 (array!87457 array!87455 (_ BitVec 32) (_ BitVec 32) V!52137 V!52137 (_ BitVec 64) (_ BitVec 32) Int) Unit!43167)

(assert (=> b!1310086 (= lt!585150 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!10 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1310087 () Bool)

(declare-fun res!869719 () Bool)

(assert (=> b!1310087 (=> (not res!869719) (not e!747419))))

(assert (=> b!1310087 (= res!869719 (contains!8374 (getCurrentListMap!5192 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1310088 () Bool)

(declare-fun tp_is_empty!35275 () Bool)

(assert (=> b!1310088 (= e!747418 tp_is_empty!35275)))

(declare-fun b!1310089 () Bool)

(declare-fun res!869717 () Bool)

(assert (=> b!1310089 (=> (not res!869717) (not e!747419))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87457 (_ BitVec 32)) Bool)

(assert (=> b!1310089 (= res!869717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310090 () Bool)

(declare-fun res!869725 () Bool)

(assert (=> b!1310090 (=> (not res!869725) (not e!747419))))

(assert (=> b!1310090 (= res!869725 (not (= (select (arr!42209 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1310091 () Bool)

(declare-fun e!747416 () Bool)

(declare-fun e!747417 () Bool)

(assert (=> b!1310091 (= e!747416 (and e!747417 mapRes!54541))))

(declare-fun condMapEmpty!54541 () Bool)

(declare-fun mapDefault!54541 () ValueCell!16739)

(assert (=> b!1310091 (= condMapEmpty!54541 (= (arr!42208 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16739)) mapDefault!54541)))))

(declare-fun mapIsEmpty!54541 () Bool)

(assert (=> mapIsEmpty!54541 mapRes!54541))

(declare-fun b!1310092 () Bool)

(declare-fun res!869724 () Bool)

(assert (=> b!1310092 (=> (not res!869724) (not e!747419))))

(assert (=> b!1310092 (= res!869724 (and (= (size!42760 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42761 _keys!1628) (size!42760 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310093 () Bool)

(assert (=> b!1310093 (= e!747417 tp_is_empty!35275)))

(declare-fun res!869721 () Bool)

(assert (=> start!110710 (=> (not res!869721) (not e!747419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110710 (= res!869721 (validMask!0 mask!2040))))

(assert (=> start!110710 e!747419))

(assert (=> start!110710 tp!103957))

(declare-fun array_inv!32085 (array!87457) Bool)

(assert (=> start!110710 (array_inv!32085 _keys!1628)))

(assert (=> start!110710 true))

(assert (=> start!110710 tp_is_empty!35275))

(declare-fun array_inv!32086 (array!87455) Bool)

(assert (=> start!110710 (and (array_inv!32086 _values!1354) e!747416)))

(declare-fun b!1310085 () Bool)

(declare-fun res!869718 () Bool)

(assert (=> b!1310085 (=> (not res!869718) (not e!747419))))

(assert (=> b!1310085 (= res!869718 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42761 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310094 () Bool)

(declare-fun res!869723 () Bool)

(assert (=> b!1310094 (=> (not res!869723) (not e!747419))))

(declare-datatypes ((List!30032 0))(
  ( (Nil!30029) (Cons!30028 (h!31237 (_ BitVec 64)) (t!43630 List!30032)) )
))
(declare-fun arrayNoDuplicates!0 (array!87457 (_ BitVec 32) List!30032) Bool)

(assert (=> b!1310094 (= res!869723 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30029))))

(declare-fun b!1310095 () Bool)

(declare-fun res!869722 () Bool)

(assert (=> b!1310095 (=> (not res!869722) (not e!747419))))

(assert (=> b!1310095 (= res!869722 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1310096 () Bool)

(declare-fun res!869720 () Bool)

(assert (=> b!1310096 (=> (not res!869720) (not e!747419))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1310096 (= res!869720 (validKeyInArray!0 (select (arr!42209 _keys!1628) from!2020)))))

(assert (= (and start!110710 res!869721) b!1310092))

(assert (= (and b!1310092 res!869724) b!1310089))

(assert (= (and b!1310089 res!869717) b!1310094))

(assert (= (and b!1310094 res!869723) b!1310085))

(assert (= (and b!1310085 res!869718) b!1310087))

(assert (= (and b!1310087 res!869719) b!1310090))

(assert (= (and b!1310090 res!869725) b!1310096))

(assert (= (and b!1310096 res!869720) b!1310095))

(assert (= (and b!1310095 res!869722) b!1310086))

(assert (= (and b!1310091 condMapEmpty!54541) mapIsEmpty!54541))

(assert (= (and b!1310091 (not condMapEmpty!54541)) mapNonEmpty!54541))

(get-info :version)

(assert (= (and mapNonEmpty!54541 ((_ is ValueCellFull!16739) mapValue!54541)) b!1310088))

(assert (= (and b!1310091 ((_ is ValueCellFull!16739) mapDefault!54541)) b!1310093))

(assert (= start!110710 b!1310091))

(declare-fun m!1199499 () Bool)

(assert (=> b!1310089 m!1199499))

(declare-fun m!1199501 () Bool)

(assert (=> b!1310096 m!1199501))

(assert (=> b!1310096 m!1199501))

(declare-fun m!1199503 () Bool)

(assert (=> b!1310096 m!1199503))

(declare-fun m!1199505 () Bool)

(assert (=> b!1310094 m!1199505))

(declare-fun m!1199507 () Bool)

(assert (=> b!1310087 m!1199507))

(assert (=> b!1310087 m!1199507))

(declare-fun m!1199509 () Bool)

(assert (=> b!1310087 m!1199509))

(assert (=> b!1310090 m!1199501))

(declare-fun m!1199511 () Bool)

(assert (=> b!1310086 m!1199511))

(assert (=> b!1310086 m!1199511))

(declare-fun m!1199513 () Bool)

(assert (=> b!1310086 m!1199513))

(declare-fun m!1199515 () Bool)

(assert (=> b!1310086 m!1199515))

(declare-fun m!1199517 () Bool)

(assert (=> mapNonEmpty!54541 m!1199517))

(declare-fun m!1199519 () Bool)

(assert (=> start!110710 m!1199519))

(declare-fun m!1199521 () Bool)

(assert (=> start!110710 m!1199521))

(declare-fun m!1199523 () Bool)

(assert (=> start!110710 m!1199523))

(check-sat (not b!1310094) (not b_next!29545) (not start!110710) (not b!1310096) (not b!1310086) tp_is_empty!35275 (not b!1310087) (not mapNonEmpty!54541) b_and!47735 (not b!1310089))
(check-sat b_and!47735 (not b_next!29545))
