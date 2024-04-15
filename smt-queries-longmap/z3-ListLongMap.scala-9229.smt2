; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110722 () Bool)

(assert start!110722)

(declare-fun b_free!29557 () Bool)

(declare-fun b_next!29557 () Bool)

(assert (=> start!110722 (= b_free!29557 (not b_next!29557))))

(declare-fun tp!103994 () Bool)

(declare-fun b_and!47747 () Bool)

(assert (=> start!110722 (= tp!103994 b_and!47747)))

(declare-fun b!1310301 () Bool)

(declare-fun res!869882 () Bool)

(declare-fun e!747507 () Bool)

(assert (=> b!1310301 (=> (not res!869882) (not e!747507))))

(declare-datatypes ((array!87477 0))(
  ( (array!87478 (arr!42219 (Array (_ BitVec 32) (_ BitVec 64))) (size!42771 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87477)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(assert (=> b!1310301 (= res!869882 (not (= (select (arr!42219 _keys!1628) from!2020) k0!1175)))))

(declare-fun mapIsEmpty!54559 () Bool)

(declare-fun mapRes!54559 () Bool)

(assert (=> mapIsEmpty!54559 mapRes!54559))

(declare-fun res!869879 () Bool)

(assert (=> start!110722 (=> (not res!869879) (not e!747507))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110722 (= res!869879 (validMask!0 mask!2040))))

(assert (=> start!110722 e!747507))

(assert (=> start!110722 tp!103994))

(declare-fun array_inv!32091 (array!87477) Bool)

(assert (=> start!110722 (array_inv!32091 _keys!1628)))

(assert (=> start!110722 true))

(declare-fun tp_is_empty!35287 () Bool)

(assert (=> start!110722 tp_is_empty!35287))

(declare-datatypes ((V!52153 0))(
  ( (V!52154 (val!17718 Int)) )
))
(declare-datatypes ((ValueCell!16745 0))(
  ( (ValueCellFull!16745 (v!20344 V!52153)) (EmptyCell!16745) )
))
(declare-datatypes ((array!87479 0))(
  ( (array!87480 (arr!42220 (Array (_ BitVec 32) ValueCell!16745)) (size!42772 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87479)

(declare-fun e!747508 () Bool)

(declare-fun array_inv!32092 (array!87479) Bool)

(assert (=> start!110722 (and (array_inv!32092 _values!1354) e!747508)))

(declare-fun b!1310302 () Bool)

(declare-fun res!869881 () Bool)

(assert (=> b!1310302 (=> (not res!869881) (not e!747507))))

(assert (=> b!1310302 (= res!869881 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42771 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310303 () Bool)

(declare-fun res!869880 () Bool)

(assert (=> b!1310303 (=> (not res!869880) (not e!747507))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52153)

(declare-fun zeroValue!1296 () V!52153)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22910 0))(
  ( (tuple2!22911 (_1!11466 (_ BitVec 64)) (_2!11466 V!52153)) )
))
(declare-datatypes ((List!30035 0))(
  ( (Nil!30032) (Cons!30031 (h!31240 tuple2!22910) (t!43633 List!30035)) )
))
(declare-datatypes ((ListLongMap!20567 0))(
  ( (ListLongMap!20568 (toList!10299 List!30035)) )
))
(declare-fun contains!8376 (ListLongMap!20567 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5194 (array!87477 array!87479 (_ BitVec 32) (_ BitVec 32) V!52153 V!52153 (_ BitVec 32) Int) ListLongMap!20567)

(assert (=> b!1310303 (= res!869880 (contains!8376 (getCurrentListMap!5194 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1310304 () Bool)

(declare-fun res!869883 () Bool)

(assert (=> b!1310304 (=> (not res!869883) (not e!747507))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1310304 (= res!869883 (validKeyInArray!0 (select (arr!42219 _keys!1628) from!2020)))))

(declare-fun b!1310305 () Bool)

(declare-fun res!869887 () Bool)

(assert (=> b!1310305 (=> (not res!869887) (not e!747507))))

(assert (=> b!1310305 (= res!869887 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1310306 () Bool)

(declare-fun res!869884 () Bool)

(assert (=> b!1310306 (=> (not res!869884) (not e!747507))))

(assert (=> b!1310306 (= res!869884 (and (= (size!42772 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42771 _keys!1628) (size!42772 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310307 () Bool)

(declare-fun e!747509 () Bool)

(assert (=> b!1310307 (= e!747509 tp_is_empty!35287)))

(declare-fun b!1310308 () Bool)

(declare-fun res!869886 () Bool)

(assert (=> b!1310308 (=> (not res!869886) (not e!747507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87477 (_ BitVec 32)) Bool)

(assert (=> b!1310308 (= res!869886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310309 () Bool)

(assert (=> b!1310309 (= e!747507 (not true))))

(assert (=> b!1310309 (contains!8376 (getCurrentListMap!5194 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43171 0))(
  ( (Unit!43172) )
))
(declare-fun lt!585168 () Unit!43171)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!12 (array!87477 array!87479 (_ BitVec 32) (_ BitVec 32) V!52153 V!52153 (_ BitVec 64) (_ BitVec 32) Int) Unit!43171)

(assert (=> b!1310309 (= lt!585168 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!12 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1310310 () Bool)

(declare-fun res!869885 () Bool)

(assert (=> b!1310310 (=> (not res!869885) (not e!747507))))

(declare-datatypes ((List!30036 0))(
  ( (Nil!30033) (Cons!30032 (h!31241 (_ BitVec 64)) (t!43634 List!30036)) )
))
(declare-fun arrayNoDuplicates!0 (array!87477 (_ BitVec 32) List!30036) Bool)

(assert (=> b!1310310 (= res!869885 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30033))))

(declare-fun mapNonEmpty!54559 () Bool)

(declare-fun tp!103993 () Bool)

(declare-fun e!747505 () Bool)

(assert (=> mapNonEmpty!54559 (= mapRes!54559 (and tp!103993 e!747505))))

(declare-fun mapKey!54559 () (_ BitVec 32))

(declare-fun mapRest!54559 () (Array (_ BitVec 32) ValueCell!16745))

(declare-fun mapValue!54559 () ValueCell!16745)

(assert (=> mapNonEmpty!54559 (= (arr!42220 _values!1354) (store mapRest!54559 mapKey!54559 mapValue!54559))))

(declare-fun b!1310311 () Bool)

(assert (=> b!1310311 (= e!747505 tp_is_empty!35287)))

(declare-fun b!1310312 () Bool)

(assert (=> b!1310312 (= e!747508 (and e!747509 mapRes!54559))))

(declare-fun condMapEmpty!54559 () Bool)

(declare-fun mapDefault!54559 () ValueCell!16745)

(assert (=> b!1310312 (= condMapEmpty!54559 (= (arr!42220 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16745)) mapDefault!54559)))))

(assert (= (and start!110722 res!869879) b!1310306))

(assert (= (and b!1310306 res!869884) b!1310308))

(assert (= (and b!1310308 res!869886) b!1310310))

(assert (= (and b!1310310 res!869885) b!1310302))

(assert (= (and b!1310302 res!869881) b!1310303))

(assert (= (and b!1310303 res!869880) b!1310301))

(assert (= (and b!1310301 res!869882) b!1310304))

(assert (= (and b!1310304 res!869883) b!1310305))

(assert (= (and b!1310305 res!869887) b!1310309))

(assert (= (and b!1310312 condMapEmpty!54559) mapIsEmpty!54559))

(assert (= (and b!1310312 (not condMapEmpty!54559)) mapNonEmpty!54559))

(get-info :version)

(assert (= (and mapNonEmpty!54559 ((_ is ValueCellFull!16745) mapValue!54559)) b!1310311))

(assert (= (and b!1310312 ((_ is ValueCellFull!16745) mapDefault!54559)) b!1310307))

(assert (= start!110722 b!1310312))

(declare-fun m!1199655 () Bool)

(assert (=> b!1310301 m!1199655))

(declare-fun m!1199657 () Bool)

(assert (=> start!110722 m!1199657))

(declare-fun m!1199659 () Bool)

(assert (=> start!110722 m!1199659))

(declare-fun m!1199661 () Bool)

(assert (=> start!110722 m!1199661))

(declare-fun m!1199663 () Bool)

(assert (=> b!1310310 m!1199663))

(declare-fun m!1199665 () Bool)

(assert (=> b!1310308 m!1199665))

(declare-fun m!1199667 () Bool)

(assert (=> b!1310303 m!1199667))

(assert (=> b!1310303 m!1199667))

(declare-fun m!1199669 () Bool)

(assert (=> b!1310303 m!1199669))

(declare-fun m!1199671 () Bool)

(assert (=> b!1310309 m!1199671))

(assert (=> b!1310309 m!1199671))

(declare-fun m!1199673 () Bool)

(assert (=> b!1310309 m!1199673))

(declare-fun m!1199675 () Bool)

(assert (=> b!1310309 m!1199675))

(declare-fun m!1199677 () Bool)

(assert (=> mapNonEmpty!54559 m!1199677))

(assert (=> b!1310304 m!1199655))

(assert (=> b!1310304 m!1199655))

(declare-fun m!1199679 () Bool)

(assert (=> b!1310304 m!1199679))

(check-sat tp_is_empty!35287 b_and!47747 (not b!1310308) (not b!1310310) (not b!1310303) (not b!1310309) (not b!1310304) (not b_next!29557) (not start!110722) (not mapNonEmpty!54559))
(check-sat b_and!47747 (not b_next!29557))
