; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110610 () Bool)

(assert start!110610)

(declare-fun b_free!29445 () Bool)

(declare-fun b_next!29445 () Bool)

(assert (=> start!110610 (= b_free!29445 (not b_next!29445))))

(declare-fun tp!103656 () Bool)

(declare-fun b_and!47653 () Bool)

(assert (=> start!110610 (= tp!103656 b_and!47653)))

(declare-fun b!1308787 () Bool)

(declare-fun e!746700 () Bool)

(declare-fun tp_is_empty!35175 () Bool)

(assert (=> b!1308787 (= e!746700 tp_is_empty!35175)))

(declare-fun res!868834 () Bool)

(declare-fun e!746699 () Bool)

(assert (=> start!110610 (=> (not res!868834) (not e!746699))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110610 (= res!868834 (validMask!0 mask!2040))))

(assert (=> start!110610 e!746699))

(assert (=> start!110610 tp!103656))

(declare-datatypes ((array!87346 0))(
  ( (array!87347 (arr!42153 (Array (_ BitVec 32) (_ BitVec 64))) (size!42703 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87346)

(declare-fun array_inv!31861 (array!87346) Bool)

(assert (=> start!110610 (array_inv!31861 _keys!1628)))

(assert (=> start!110610 true))

(assert (=> start!110610 tp_is_empty!35175))

(declare-datatypes ((V!52003 0))(
  ( (V!52004 (val!17662 Int)) )
))
(declare-datatypes ((ValueCell!16689 0))(
  ( (ValueCellFull!16689 (v!20289 V!52003)) (EmptyCell!16689) )
))
(declare-datatypes ((array!87348 0))(
  ( (array!87349 (arr!42154 (Array (_ BitVec 32) ValueCell!16689)) (size!42704 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87348)

(declare-fun e!746701 () Bool)

(declare-fun array_inv!31862 (array!87348) Bool)

(assert (=> start!110610 (and (array_inv!31862 _values!1354) e!746701)))

(declare-fun b!1308788 () Bool)

(declare-fun res!868831 () Bool)

(assert (=> b!1308788 (=> (not res!868831) (not e!746699))))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1308788 (= res!868831 (validKeyInArray!0 (select (arr!42153 _keys!1628) from!2020)))))

(declare-fun b!1308789 () Bool)

(declare-fun res!868829 () Bool)

(assert (=> b!1308789 (=> (not res!868829) (not e!746699))))

(declare-fun k0!1175 () (_ BitVec 64))

(assert (=> b!1308789 (= res!868829 (not (= (select (arr!42153 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1308790 () Bool)

(declare-fun res!868828 () Bool)

(assert (=> b!1308790 (=> (not res!868828) (not e!746699))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1308790 (= res!868828 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1308791 () Bool)

(declare-fun e!746702 () Bool)

(assert (=> b!1308791 (= e!746702 tp_is_empty!35175)))

(declare-fun b!1308792 () Bool)

(declare-fun res!868835 () Bool)

(assert (=> b!1308792 (=> (not res!868835) (not e!746699))))

(assert (=> b!1308792 (= res!868835 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42703 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308793 () Bool)

(declare-fun res!868832 () Bool)

(assert (=> b!1308793 (=> (not res!868832) (not e!746699))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52003)

(declare-fun zeroValue!1296 () V!52003)

(declare-datatypes ((tuple2!22742 0))(
  ( (tuple2!22743 (_1!11382 (_ BitVec 64)) (_2!11382 V!52003)) )
))
(declare-datatypes ((List!29883 0))(
  ( (Nil!29880) (Cons!29879 (h!31088 tuple2!22742) (t!43489 List!29883)) )
))
(declare-datatypes ((ListLongMap!20399 0))(
  ( (ListLongMap!20400 (toList!10215 List!29883)) )
))
(declare-fun contains!8365 (ListLongMap!20399 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5228 (array!87346 array!87348 (_ BitVec 32) (_ BitVec 32) V!52003 V!52003 (_ BitVec 32) Int) ListLongMap!20399)

(assert (=> b!1308793 (= res!868832 (contains!8365 (getCurrentListMap!5228 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1308794 () Bool)

(assert (=> b!1308794 (= e!746699 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000)))))

(assert (=> b!1308794 (contains!8365 (getCurrentListMap!5228 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43308 0))(
  ( (Unit!43309) )
))
(declare-fun lt!585186 () Unit!43308)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!18 (array!87346 array!87348 (_ BitVec 32) (_ BitVec 32) V!52003 V!52003 (_ BitVec 64) (_ BitVec 32) Int) Unit!43308)

(assert (=> b!1308794 (= lt!585186 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!18 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun mapNonEmpty!54391 () Bool)

(declare-fun mapRes!54391 () Bool)

(declare-fun tp!103657 () Bool)

(assert (=> mapNonEmpty!54391 (= mapRes!54391 (and tp!103657 e!746702))))

(declare-fun mapRest!54391 () (Array (_ BitVec 32) ValueCell!16689))

(declare-fun mapValue!54391 () ValueCell!16689)

(declare-fun mapKey!54391 () (_ BitVec 32))

(assert (=> mapNonEmpty!54391 (= (arr!42154 _values!1354) (store mapRest!54391 mapKey!54391 mapValue!54391))))

(declare-fun b!1308795 () Bool)

(declare-fun res!868833 () Bool)

(assert (=> b!1308795 (=> (not res!868833) (not e!746699))))

(declare-datatypes ((List!29884 0))(
  ( (Nil!29881) (Cons!29880 (h!31089 (_ BitVec 64)) (t!43490 List!29884)) )
))
(declare-fun arrayNoDuplicates!0 (array!87346 (_ BitVec 32) List!29884) Bool)

(assert (=> b!1308795 (= res!868833 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29881))))

(declare-fun mapIsEmpty!54391 () Bool)

(assert (=> mapIsEmpty!54391 mapRes!54391))

(declare-fun b!1308796 () Bool)

(declare-fun res!868836 () Bool)

(assert (=> b!1308796 (=> (not res!868836) (not e!746699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87346 (_ BitVec 32)) Bool)

(assert (=> b!1308796 (= res!868836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1308797 () Bool)

(assert (=> b!1308797 (= e!746701 (and e!746700 mapRes!54391))))

(declare-fun condMapEmpty!54391 () Bool)

(declare-fun mapDefault!54391 () ValueCell!16689)

(assert (=> b!1308797 (= condMapEmpty!54391 (= (arr!42154 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16689)) mapDefault!54391)))))

(declare-fun b!1308798 () Bool)

(declare-fun res!868830 () Bool)

(assert (=> b!1308798 (=> (not res!868830) (not e!746699))))

(assert (=> b!1308798 (= res!868830 (and (= (size!42704 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42703 _keys!1628) (size!42704 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!110610 res!868834) b!1308798))

(assert (= (and b!1308798 res!868830) b!1308796))

(assert (= (and b!1308796 res!868836) b!1308795))

(assert (= (and b!1308795 res!868833) b!1308792))

(assert (= (and b!1308792 res!868835) b!1308793))

(assert (= (and b!1308793 res!868832) b!1308789))

(assert (= (and b!1308789 res!868829) b!1308788))

(assert (= (and b!1308788 res!868831) b!1308790))

(assert (= (and b!1308790 res!868828) b!1308794))

(assert (= (and b!1308797 condMapEmpty!54391) mapIsEmpty!54391))

(assert (= (and b!1308797 (not condMapEmpty!54391)) mapNonEmpty!54391))

(get-info :version)

(assert (= (and mapNonEmpty!54391 ((_ is ValueCellFull!16689) mapValue!54391)) b!1308791))

(assert (= (and b!1308797 ((_ is ValueCellFull!16689) mapDefault!54391)) b!1308787))

(assert (= start!110610 b!1308797))

(declare-fun m!1199075 () Bool)

(assert (=> start!110610 m!1199075))

(declare-fun m!1199077 () Bool)

(assert (=> start!110610 m!1199077))

(declare-fun m!1199079 () Bool)

(assert (=> start!110610 m!1199079))

(declare-fun m!1199081 () Bool)

(assert (=> b!1308788 m!1199081))

(assert (=> b!1308788 m!1199081))

(declare-fun m!1199083 () Bool)

(assert (=> b!1308788 m!1199083))

(declare-fun m!1199085 () Bool)

(assert (=> mapNonEmpty!54391 m!1199085))

(declare-fun m!1199087 () Bool)

(assert (=> b!1308796 m!1199087))

(declare-fun m!1199089 () Bool)

(assert (=> b!1308793 m!1199089))

(assert (=> b!1308793 m!1199089))

(declare-fun m!1199091 () Bool)

(assert (=> b!1308793 m!1199091))

(declare-fun m!1199093 () Bool)

(assert (=> b!1308794 m!1199093))

(assert (=> b!1308794 m!1199093))

(declare-fun m!1199095 () Bool)

(assert (=> b!1308794 m!1199095))

(declare-fun m!1199097 () Bool)

(assert (=> b!1308794 m!1199097))

(assert (=> b!1308789 m!1199081))

(declare-fun m!1199099 () Bool)

(assert (=> b!1308795 m!1199099))

(check-sat (not b!1308793) (not start!110610) (not b!1308794) (not b!1308795) (not b!1308788) b_and!47653 (not b_next!29445) tp_is_empty!35175 (not mapNonEmpty!54391) (not b!1308796))
(check-sat b_and!47653 (not b_next!29445))
