; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110916 () Bool)

(assert start!110916)

(declare-fun b_free!29751 () Bool)

(declare-fun b_next!29751 () Bool)

(assert (=> start!110916 (= b_free!29751 (not b_next!29751))))

(declare-fun tp!104575 () Bool)

(declare-fun b_and!47959 () Bool)

(assert (=> start!110916 (= tp!104575 b_and!47959)))

(declare-fun b!1313138 () Bool)

(declare-fun e!748995 () Bool)

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313138 (= e!748995 (bvslt (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000))))

(declare-fun b!1313139 () Bool)

(declare-fun res!871805 () Bool)

(assert (=> b!1313139 (=> (not res!871805) (not e!748995))))

(declare-datatypes ((array!87944 0))(
  ( (array!87945 (arr!42452 (Array (_ BitVec 32) (_ BitVec 64))) (size!43002 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87944)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52411 0))(
  ( (V!52412 (val!17815 Int)) )
))
(declare-datatypes ((ValueCell!16842 0))(
  ( (ValueCellFull!16842 (v!20442 V!52411)) (EmptyCell!16842) )
))
(declare-datatypes ((array!87946 0))(
  ( (array!87947 (arr!42453 (Array (_ BitVec 32) ValueCell!16842)) (size!43003 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87946)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1313139 (= res!871805 (and (= (size!43003 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43002 _keys!1628) (size!43003 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!871803 () Bool)

(assert (=> start!110916 (=> (not res!871803) (not e!748995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110916 (= res!871803 (validMask!0 mask!2040))))

(assert (=> start!110916 e!748995))

(assert (=> start!110916 tp!104575))

(declare-fun array_inv!32069 (array!87944) Bool)

(assert (=> start!110916 (array_inv!32069 _keys!1628)))

(assert (=> start!110916 true))

(declare-fun tp_is_empty!35481 () Bool)

(assert (=> start!110916 tp_is_empty!35481))

(declare-fun e!748993 () Bool)

(declare-fun array_inv!32070 (array!87946) Bool)

(assert (=> start!110916 (and (array_inv!32070 _values!1354) e!748993)))

(declare-fun b!1313140 () Bool)

(declare-fun res!871808 () Bool)

(assert (=> b!1313140 (=> (not res!871808) (not e!748995))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52411)

(declare-fun zeroValue!1296 () V!52411)

(declare-datatypes ((tuple2!22970 0))(
  ( (tuple2!22971 (_1!11496 (_ BitVec 64)) (_2!11496 V!52411)) )
))
(declare-datatypes ((List!30104 0))(
  ( (Nil!30101) (Cons!30100 (h!31309 tuple2!22970) (t!43710 List!30104)) )
))
(declare-datatypes ((ListLongMap!20627 0))(
  ( (ListLongMap!20628 (toList!10329 List!30104)) )
))
(declare-fun contains!8479 (ListLongMap!20627 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5342 (array!87944 array!87946 (_ BitVec 32) (_ BitVec 32) V!52411 V!52411 (_ BitVec 32) Int) ListLongMap!20627)

(assert (=> b!1313140 (= res!871808 (contains!8479 (getCurrentListMap!5342 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1313141 () Bool)

(declare-fun res!871806 () Bool)

(assert (=> b!1313141 (=> (not res!871806) (not e!748995))))

(assert (=> b!1313141 (= res!871806 (not (= (select (arr!42452 _keys!1628) from!2020) k0!1175)))))

(declare-fun mapIsEmpty!54850 () Bool)

(declare-fun mapRes!54850 () Bool)

(assert (=> mapIsEmpty!54850 mapRes!54850))

(declare-fun b!1313142 () Bool)

(declare-fun res!871809 () Bool)

(assert (=> b!1313142 (=> (not res!871809) (not e!748995))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87944 (_ BitVec 32)) Bool)

(assert (=> b!1313142 (= res!871809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313143 () Bool)

(declare-fun res!871804 () Bool)

(assert (=> b!1313143 (=> (not res!871804) (not e!748995))))

(declare-datatypes ((List!30105 0))(
  ( (Nil!30102) (Cons!30101 (h!31310 (_ BitVec 64)) (t!43711 List!30105)) )
))
(declare-fun arrayNoDuplicates!0 (array!87944 (_ BitVec 32) List!30105) Bool)

(assert (=> b!1313143 (= res!871804 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30102))))

(declare-fun b!1313144 () Bool)

(declare-fun e!748994 () Bool)

(assert (=> b!1313144 (= e!748994 tp_is_empty!35481)))

(declare-fun b!1313145 () Bool)

(declare-fun res!871802 () Bool)

(assert (=> b!1313145 (=> (not res!871802) (not e!748995))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1313145 (= res!871802 (not (validKeyInArray!0 (select (arr!42452 _keys!1628) from!2020))))))

(declare-fun b!1313146 () Bool)

(declare-fun e!748996 () Bool)

(assert (=> b!1313146 (= e!748993 (and e!748996 mapRes!54850))))

(declare-fun condMapEmpty!54850 () Bool)

(declare-fun mapDefault!54850 () ValueCell!16842)

(assert (=> b!1313146 (= condMapEmpty!54850 (= (arr!42453 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16842)) mapDefault!54850)))))

(declare-fun b!1313147 () Bool)

(assert (=> b!1313147 (= e!748996 tp_is_empty!35481)))

(declare-fun mapNonEmpty!54850 () Bool)

(declare-fun tp!104574 () Bool)

(assert (=> mapNonEmpty!54850 (= mapRes!54850 (and tp!104574 e!748994))))

(declare-fun mapKey!54850 () (_ BitVec 32))

(declare-fun mapValue!54850 () ValueCell!16842)

(declare-fun mapRest!54850 () (Array (_ BitVec 32) ValueCell!16842))

(assert (=> mapNonEmpty!54850 (= (arr!42453 _values!1354) (store mapRest!54850 mapKey!54850 mapValue!54850))))

(declare-fun b!1313148 () Bool)

(declare-fun res!871807 () Bool)

(assert (=> b!1313148 (=> (not res!871807) (not e!748995))))

(assert (=> b!1313148 (= res!871807 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43002 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!110916 res!871803) b!1313139))

(assert (= (and b!1313139 res!871805) b!1313142))

(assert (= (and b!1313142 res!871809) b!1313143))

(assert (= (and b!1313143 res!871804) b!1313148))

(assert (= (and b!1313148 res!871807) b!1313140))

(assert (= (and b!1313140 res!871808) b!1313141))

(assert (= (and b!1313141 res!871806) b!1313145))

(assert (= (and b!1313145 res!871802) b!1313138))

(assert (= (and b!1313146 condMapEmpty!54850) mapIsEmpty!54850))

(assert (= (and b!1313146 (not condMapEmpty!54850)) mapNonEmpty!54850))

(get-info :version)

(assert (= (and mapNonEmpty!54850 ((_ is ValueCellFull!16842) mapValue!54850)) b!1313144))

(assert (= (and b!1313146 ((_ is ValueCellFull!16842) mapDefault!54850)) b!1313147))

(assert (= start!110916 b!1313146))

(declare-fun m!1202087 () Bool)

(assert (=> start!110916 m!1202087))

(declare-fun m!1202089 () Bool)

(assert (=> start!110916 m!1202089))

(declare-fun m!1202091 () Bool)

(assert (=> start!110916 m!1202091))

(declare-fun m!1202093 () Bool)

(assert (=> b!1313143 m!1202093))

(declare-fun m!1202095 () Bool)

(assert (=> mapNonEmpty!54850 m!1202095))

(declare-fun m!1202097 () Bool)

(assert (=> b!1313140 m!1202097))

(assert (=> b!1313140 m!1202097))

(declare-fun m!1202099 () Bool)

(assert (=> b!1313140 m!1202099))

(declare-fun m!1202101 () Bool)

(assert (=> b!1313141 m!1202101))

(assert (=> b!1313145 m!1202101))

(assert (=> b!1313145 m!1202101))

(declare-fun m!1202103 () Bool)

(assert (=> b!1313145 m!1202103))

(declare-fun m!1202105 () Bool)

(assert (=> b!1313142 m!1202105))

(check-sat (not b!1313142) tp_is_empty!35481 (not b_next!29751) b_and!47959 (not start!110916) (not b!1313145) (not mapNonEmpty!54850) (not b!1313143) (not b!1313140))
(check-sat b_and!47959 (not b_next!29751))
