; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110700 () Bool)

(assert start!110700)

(declare-fun b_free!29535 () Bool)

(declare-fun b_next!29535 () Bool)

(assert (=> start!110700 (= b_free!29535 (not b_next!29535))))

(declare-fun tp!103926 () Bool)

(declare-fun b_and!47743 () Bool)

(assert (=> start!110700 (= tp!103926 b_and!47743)))

(declare-fun b!1309975 () Bool)

(declare-fun e!747377 () Bool)

(assert (=> b!1309975 (= e!747377 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87520 0))(
  ( (array!87521 (arr!42240 (Array (_ BitVec 32) (_ BitVec 64))) (size!42790 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87520)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52123 0))(
  ( (V!52124 (val!17707 Int)) )
))
(declare-fun minValue!1296 () V!52123)

(declare-datatypes ((ValueCell!16734 0))(
  ( (ValueCellFull!16734 (v!20334 V!52123)) (EmptyCell!16734) )
))
(declare-datatypes ((array!87522 0))(
  ( (array!87523 (arr!42241 (Array (_ BitVec 32) ValueCell!16734)) (size!42791 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87522)

(declare-fun zeroValue!1296 () V!52123)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22808 0))(
  ( (tuple2!22809 (_1!11415 (_ BitVec 64)) (_2!11415 V!52123)) )
))
(declare-datatypes ((List!29947 0))(
  ( (Nil!29944) (Cons!29943 (h!31152 tuple2!22808) (t!43553 List!29947)) )
))
(declare-datatypes ((ListLongMap!20465 0))(
  ( (ListLongMap!20466 (toList!10248 List!29947)) )
))
(declare-fun contains!8398 (ListLongMap!20465 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5261 (array!87520 array!87522 (_ BitVec 32) (_ BitVec 32) V!52123 V!52123 (_ BitVec 32) Int) ListLongMap!20465)

(assert (=> b!1309975 (contains!8398 (getCurrentListMap!5261 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43320 0))(
  ( (Unit!43321) )
))
(declare-fun lt!585321 () Unit!43320)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!6 (array!87520 array!87522 (_ BitVec 32) (_ BitVec 32) V!52123 V!52123 (_ BitVec 64) (_ BitVec 32) Int) Unit!43320)

(assert (=> b!1309975 (= lt!585321 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!6 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1309976 () Bool)

(declare-fun e!747375 () Bool)

(declare-fun tp_is_empty!35265 () Bool)

(assert (=> b!1309976 (= e!747375 tp_is_empty!35265)))

(declare-fun b!1309977 () Bool)

(declare-fun res!869619 () Bool)

(assert (=> b!1309977 (=> (not res!869619) (not e!747377))))

(assert (=> b!1309977 (= res!869619 (and (= (size!42791 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42790 _keys!1628) (size!42791 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309978 () Bool)

(declare-fun res!869613 () Bool)

(assert (=> b!1309978 (=> (not res!869613) (not e!747377))))

(assert (=> b!1309978 (= res!869613 (not (= (select (arr!42240 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1309979 () Bool)

(declare-fun res!869618 () Bool)

(assert (=> b!1309979 (=> (not res!869618) (not e!747377))))

(assert (=> b!1309979 (= res!869618 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1309980 () Bool)

(declare-fun res!869617 () Bool)

(assert (=> b!1309980 (=> (not res!869617) (not e!747377))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87520 (_ BitVec 32)) Bool)

(assert (=> b!1309980 (= res!869617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309981 () Bool)

(declare-fun res!869612 () Bool)

(assert (=> b!1309981 (=> (not res!869612) (not e!747377))))

(assert (=> b!1309981 (= res!869612 (contains!8398 (getCurrentListMap!5261 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1309982 () Bool)

(declare-fun res!869615 () Bool)

(assert (=> b!1309982 (=> (not res!869615) (not e!747377))))

(assert (=> b!1309982 (= res!869615 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42790 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54526 () Bool)

(declare-fun mapRes!54526 () Bool)

(declare-fun tp!103927 () Bool)

(declare-fun e!747373 () Bool)

(assert (=> mapNonEmpty!54526 (= mapRes!54526 (and tp!103927 e!747373))))

(declare-fun mapKey!54526 () (_ BitVec 32))

(declare-fun mapRest!54526 () (Array (_ BitVec 32) ValueCell!16734))

(declare-fun mapValue!54526 () ValueCell!16734)

(assert (=> mapNonEmpty!54526 (= (arr!42241 _values!1354) (store mapRest!54526 mapKey!54526 mapValue!54526))))

(declare-fun res!869614 () Bool)

(assert (=> start!110700 (=> (not res!869614) (not e!747377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110700 (= res!869614 (validMask!0 mask!2040))))

(assert (=> start!110700 e!747377))

(assert (=> start!110700 tp!103926))

(declare-fun array_inv!31919 (array!87520) Bool)

(assert (=> start!110700 (array_inv!31919 _keys!1628)))

(assert (=> start!110700 true))

(assert (=> start!110700 tp_is_empty!35265))

(declare-fun e!747374 () Bool)

(declare-fun array_inv!31920 (array!87522) Bool)

(assert (=> start!110700 (and (array_inv!31920 _values!1354) e!747374)))

(declare-fun b!1309983 () Bool)

(assert (=> b!1309983 (= e!747374 (and e!747375 mapRes!54526))))

(declare-fun condMapEmpty!54526 () Bool)

(declare-fun mapDefault!54526 () ValueCell!16734)

(assert (=> b!1309983 (= condMapEmpty!54526 (= (arr!42241 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16734)) mapDefault!54526)))))

(declare-fun b!1309984 () Bool)

(declare-fun res!869616 () Bool)

(assert (=> b!1309984 (=> (not res!869616) (not e!747377))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1309984 (= res!869616 (validKeyInArray!0 (select (arr!42240 _keys!1628) from!2020)))))

(declare-fun b!1309985 () Bool)

(assert (=> b!1309985 (= e!747373 tp_is_empty!35265)))

(declare-fun b!1309986 () Bool)

(declare-fun res!869611 () Bool)

(assert (=> b!1309986 (=> (not res!869611) (not e!747377))))

(declare-datatypes ((List!29948 0))(
  ( (Nil!29945) (Cons!29944 (h!31153 (_ BitVec 64)) (t!43554 List!29948)) )
))
(declare-fun arrayNoDuplicates!0 (array!87520 (_ BitVec 32) List!29948) Bool)

(assert (=> b!1309986 (= res!869611 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29945))))

(declare-fun mapIsEmpty!54526 () Bool)

(assert (=> mapIsEmpty!54526 mapRes!54526))

(assert (= (and start!110700 res!869614) b!1309977))

(assert (= (and b!1309977 res!869619) b!1309980))

(assert (= (and b!1309980 res!869617) b!1309986))

(assert (= (and b!1309986 res!869611) b!1309982))

(assert (= (and b!1309982 res!869615) b!1309981))

(assert (= (and b!1309981 res!869612) b!1309978))

(assert (= (and b!1309978 res!869613) b!1309984))

(assert (= (and b!1309984 res!869616) b!1309979))

(assert (= (and b!1309979 res!869618) b!1309975))

(assert (= (and b!1309983 condMapEmpty!54526) mapIsEmpty!54526))

(assert (= (and b!1309983 (not condMapEmpty!54526)) mapNonEmpty!54526))

(get-info :version)

(assert (= (and mapNonEmpty!54526 ((_ is ValueCellFull!16734) mapValue!54526)) b!1309985))

(assert (= (and b!1309983 ((_ is ValueCellFull!16734) mapDefault!54526)) b!1309976))

(assert (= start!110700 b!1309983))

(declare-fun m!1199885 () Bool)

(assert (=> b!1309980 m!1199885))

(declare-fun m!1199887 () Bool)

(assert (=> b!1309981 m!1199887))

(assert (=> b!1309981 m!1199887))

(declare-fun m!1199889 () Bool)

(assert (=> b!1309981 m!1199889))

(declare-fun m!1199891 () Bool)

(assert (=> b!1309984 m!1199891))

(assert (=> b!1309984 m!1199891))

(declare-fun m!1199893 () Bool)

(assert (=> b!1309984 m!1199893))

(declare-fun m!1199895 () Bool)

(assert (=> mapNonEmpty!54526 m!1199895))

(declare-fun m!1199897 () Bool)

(assert (=> b!1309975 m!1199897))

(assert (=> b!1309975 m!1199897))

(declare-fun m!1199899 () Bool)

(assert (=> b!1309975 m!1199899))

(declare-fun m!1199901 () Bool)

(assert (=> b!1309975 m!1199901))

(declare-fun m!1199903 () Bool)

(assert (=> b!1309986 m!1199903))

(assert (=> b!1309978 m!1199891))

(declare-fun m!1199905 () Bool)

(assert (=> start!110700 m!1199905))

(declare-fun m!1199907 () Bool)

(assert (=> start!110700 m!1199907))

(declare-fun m!1199909 () Bool)

(assert (=> start!110700 m!1199909))

(check-sat (not b!1309980) (not b!1309986) tp_is_empty!35265 (not b!1309984) (not b!1309981) b_and!47743 (not mapNonEmpty!54526) (not b!1309975) (not b_next!29535) (not start!110700))
(check-sat b_and!47743 (not b_next!29535))
