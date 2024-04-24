; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111096 () Bool)

(assert start!111096)

(declare-fun b_free!29707 () Bool)

(declare-fun b_next!29707 () Bool)

(assert (=> start!111096 (= b_free!29707 (not b_next!29707))))

(declare-fun tp!104443 () Bool)

(declare-fun b_and!47917 () Bool)

(assert (=> start!111096 (= tp!104443 b_and!47917)))

(declare-fun b!1313894 () Bool)

(declare-fun e!749509 () Bool)

(declare-fun tp_is_empty!35437 () Bool)

(assert (=> b!1313894 (= e!749509 tp_is_empty!35437)))

(declare-fun b!1313895 () Bool)

(declare-fun e!749507 () Bool)

(assert (=> b!1313895 (= e!749507 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87911 0))(
  ( (array!87912 (arr!42431 (Array (_ BitVec 32) (_ BitVec 64))) (size!42982 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87911)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52353 0))(
  ( (V!52354 (val!17793 Int)) )
))
(declare-fun minValue!1296 () V!52353)

(declare-datatypes ((ValueCell!16820 0))(
  ( (ValueCellFull!16820 (v!20415 V!52353)) (EmptyCell!16820) )
))
(declare-datatypes ((array!87913 0))(
  ( (array!87914 (arr!42432 (Array (_ BitVec 32) ValueCell!16820)) (size!42983 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87913)

(declare-fun zeroValue!1296 () V!52353)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!586055 () Bool)

(declare-datatypes ((tuple2!22966 0))(
  ( (tuple2!22967 (_1!11494 (_ BitVec 64)) (_2!11494 V!52353)) )
))
(declare-datatypes ((List!30117 0))(
  ( (Nil!30114) (Cons!30113 (h!31331 tuple2!22966) (t!43715 List!30117)) )
))
(declare-datatypes ((ListLongMap!20631 0))(
  ( (ListLongMap!20632 (toList!10331 List!30117)) )
))
(declare-fun contains!8493 (ListLongMap!20631 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5335 (array!87911 array!87913 (_ BitVec 32) (_ BitVec 32) V!52353 V!52353 (_ BitVec 32) Int) ListLongMap!20631)

(assert (=> b!1313895 (= lt!586055 (contains!8493 (getCurrentListMap!5335 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1313896 () Bool)

(declare-fun res!871975 () Bool)

(assert (=> b!1313896 (=> (not res!871975) (not e!749507))))

(declare-datatypes ((List!30118 0))(
  ( (Nil!30115) (Cons!30114 (h!31332 (_ BitVec 64)) (t!43716 List!30118)) )
))
(declare-fun arrayNoDuplicates!0 (array!87911 (_ BitVec 32) List!30118) Bool)

(assert (=> b!1313896 (= res!871975 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30115))))

(declare-fun b!1313897 () Bool)

(declare-fun res!871976 () Bool)

(assert (=> b!1313897 (=> (not res!871976) (not e!749507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87911 (_ BitVec 32)) Bool)

(assert (=> b!1313897 (= res!871976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!871977 () Bool)

(assert (=> start!111096 (=> (not res!871977) (not e!749507))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111096 (= res!871977 (validMask!0 mask!2040))))

(assert (=> start!111096 e!749507))

(assert (=> start!111096 tp!104443))

(declare-fun array_inv!32313 (array!87911) Bool)

(assert (=> start!111096 (array_inv!32313 _keys!1628)))

(assert (=> start!111096 true))

(assert (=> start!111096 tp_is_empty!35437))

(declare-fun e!749506 () Bool)

(declare-fun array_inv!32314 (array!87913) Bool)

(assert (=> start!111096 (and (array_inv!32314 _values!1354) e!749506)))

(declare-fun b!1313898 () Bool)

(declare-fun res!871978 () Bool)

(assert (=> b!1313898 (=> (not res!871978) (not e!749507))))

(assert (=> b!1313898 (= res!871978 (and (= (size!42983 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42982 _keys!1628) (size!42983 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313899 () Bool)

(declare-fun e!749508 () Bool)

(assert (=> b!1313899 (= e!749508 tp_is_empty!35437)))

(declare-fun b!1313900 () Bool)

(declare-fun mapRes!54784 () Bool)

(assert (=> b!1313900 (= e!749506 (and e!749508 mapRes!54784))))

(declare-fun condMapEmpty!54784 () Bool)

(declare-fun mapDefault!54784 () ValueCell!16820)

(assert (=> b!1313900 (= condMapEmpty!54784 (= (arr!42432 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16820)) mapDefault!54784)))))

(declare-fun b!1313901 () Bool)

(declare-fun res!871979 () Bool)

(assert (=> b!1313901 (=> (not res!871979) (not e!749507))))

(assert (=> b!1313901 (= res!871979 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42982 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!54784 () Bool)

(assert (=> mapIsEmpty!54784 mapRes!54784))

(declare-fun mapNonEmpty!54784 () Bool)

(declare-fun tp!104442 () Bool)

(assert (=> mapNonEmpty!54784 (= mapRes!54784 (and tp!104442 e!749509))))

(declare-fun mapRest!54784 () (Array (_ BitVec 32) ValueCell!16820))

(declare-fun mapValue!54784 () ValueCell!16820)

(declare-fun mapKey!54784 () (_ BitVec 32))

(assert (=> mapNonEmpty!54784 (= (arr!42432 _values!1354) (store mapRest!54784 mapKey!54784 mapValue!54784))))

(assert (= (and start!111096 res!871977) b!1313898))

(assert (= (and b!1313898 res!871978) b!1313897))

(assert (= (and b!1313897 res!871976) b!1313896))

(assert (= (and b!1313896 res!871975) b!1313901))

(assert (= (and b!1313901 res!871979) b!1313895))

(assert (= (and b!1313900 condMapEmpty!54784) mapIsEmpty!54784))

(assert (= (and b!1313900 (not condMapEmpty!54784)) mapNonEmpty!54784))

(get-info :version)

(assert (= (and mapNonEmpty!54784 ((_ is ValueCellFull!16820) mapValue!54784)) b!1313894))

(assert (= (and b!1313900 ((_ is ValueCellFull!16820) mapDefault!54784)) b!1313899))

(assert (= start!111096 b!1313900))

(declare-fun m!1203329 () Bool)

(assert (=> start!111096 m!1203329))

(declare-fun m!1203331 () Bool)

(assert (=> start!111096 m!1203331))

(declare-fun m!1203333 () Bool)

(assert (=> start!111096 m!1203333))

(declare-fun m!1203335 () Bool)

(assert (=> b!1313895 m!1203335))

(assert (=> b!1313895 m!1203335))

(declare-fun m!1203337 () Bool)

(assert (=> b!1313895 m!1203337))

(declare-fun m!1203339 () Bool)

(assert (=> mapNonEmpty!54784 m!1203339))

(declare-fun m!1203341 () Bool)

(assert (=> b!1313896 m!1203341))

(declare-fun m!1203343 () Bool)

(assert (=> b!1313897 m!1203343))

(check-sat (not b!1313897) (not b_next!29707) (not b!1313896) tp_is_empty!35437 (not start!111096) (not b!1313895) b_and!47917 (not mapNonEmpty!54784))
(check-sat b_and!47917 (not b_next!29707))
