; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111088 () Bool)

(assert start!111088)

(declare-fun b_free!29923 () Bool)

(declare-fun b_next!29923 () Bool)

(assert (=> start!111088 (= b_free!29923 (not b_next!29923))))

(declare-fun tp!105092 () Bool)

(declare-fun b_and!48113 () Bool)

(assert (=> start!111088 (= tp!105092 b_and!48113)))

(declare-fun mapNonEmpty!55108 () Bool)

(declare-fun mapRes!55108 () Bool)

(declare-fun tp!105091 () Bool)

(declare-fun e!750250 () Bool)

(assert (=> mapNonEmpty!55108 (= mapRes!55108 (and tp!105091 e!750250))))

(declare-datatypes ((V!52641 0))(
  ( (V!52642 (val!17901 Int)) )
))
(declare-datatypes ((ValueCell!16928 0))(
  ( (ValueCellFull!16928 (v!20527 V!52641)) (EmptyCell!16928) )
))
(declare-fun mapValue!55108 () ValueCell!16928)

(declare-fun mapKey!55108 () (_ BitVec 32))

(declare-datatypes ((array!88179 0))(
  ( (array!88180 (arr!42570 (Array (_ BitVec 32) ValueCell!16928)) (size!43122 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88179)

(declare-fun mapRest!55108 () (Array (_ BitVec 32) ValueCell!16928))

(assert (=> mapNonEmpty!55108 (= (arr!42570 _values!1354) (store mapRest!55108 mapKey!55108 mapValue!55108))))

(declare-fun b!1315217 () Bool)

(declare-fun res!873150 () Bool)

(declare-fun e!750251 () Bool)

(assert (=> b!1315217 (=> (not res!873150) (not e!750251))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((array!88181 0))(
  ( (array!88182 (arr!42571 (Array (_ BitVec 32) (_ BitVec 64))) (size!43123 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88181)

(assert (=> b!1315217 (= res!873150 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43123 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315218 () Bool)

(declare-fun res!873147 () Bool)

(assert (=> b!1315218 (=> (not res!873147) (not e!750251))))

(declare-datatypes ((List!30294 0))(
  ( (Nil!30291) (Cons!30290 (h!31499 (_ BitVec 64)) (t!43892 List!30294)) )
))
(declare-fun arrayNoDuplicates!0 (array!88181 (_ BitVec 32) List!30294) Bool)

(assert (=> b!1315218 (= res!873147 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30291))))

(declare-fun b!1315219 () Bool)

(declare-fun res!873148 () Bool)

(assert (=> b!1315219 (=> (not res!873148) (not e!750251))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1315219 (= res!873148 (and (= (size!43122 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43123 _keys!1628) (size!43122 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315220 () Bool)

(assert (=> b!1315220 (= e!750251 false)))

(declare-fun lt!585708 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52641)

(declare-fun zeroValue!1296 () V!52641)

(declare-datatypes ((tuple2!23178 0))(
  ( (tuple2!23179 (_1!11600 (_ BitVec 64)) (_2!11600 V!52641)) )
))
(declare-datatypes ((List!30295 0))(
  ( (Nil!30292) (Cons!30291 (h!31500 tuple2!23178) (t!43893 List!30295)) )
))
(declare-datatypes ((ListLongMap!20835 0))(
  ( (ListLongMap!20836 (toList!10433 List!30295)) )
))
(declare-fun contains!8510 (ListLongMap!20835 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5328 (array!88181 array!88179 (_ BitVec 32) (_ BitVec 32) V!52641 V!52641 (_ BitVec 32) Int) ListLongMap!20835)

(assert (=> b!1315220 (= lt!585708 (contains!8510 (getCurrentListMap!5328 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1315221 () Bool)

(declare-fun e!750253 () Bool)

(declare-fun tp_is_empty!35653 () Bool)

(assert (=> b!1315221 (= e!750253 tp_is_empty!35653)))

(declare-fun b!1315216 () Bool)

(declare-fun e!750254 () Bool)

(assert (=> b!1315216 (= e!750254 (and e!750253 mapRes!55108))))

(declare-fun condMapEmpty!55108 () Bool)

(declare-fun mapDefault!55108 () ValueCell!16928)

(assert (=> b!1315216 (= condMapEmpty!55108 (= (arr!42570 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16928)) mapDefault!55108)))))

(declare-fun res!873149 () Bool)

(assert (=> start!111088 (=> (not res!873149) (not e!750251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111088 (= res!873149 (validMask!0 mask!2040))))

(assert (=> start!111088 e!750251))

(assert (=> start!111088 tp!105092))

(declare-fun array_inv!32339 (array!88181) Bool)

(assert (=> start!111088 (array_inv!32339 _keys!1628)))

(assert (=> start!111088 true))

(assert (=> start!111088 tp_is_empty!35653))

(declare-fun array_inv!32340 (array!88179) Bool)

(assert (=> start!111088 (and (array_inv!32340 _values!1354) e!750254)))

(declare-fun b!1315222 () Bool)

(declare-fun res!873151 () Bool)

(assert (=> b!1315222 (=> (not res!873151) (not e!750251))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88181 (_ BitVec 32)) Bool)

(assert (=> b!1315222 (= res!873151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315223 () Bool)

(assert (=> b!1315223 (= e!750250 tp_is_empty!35653)))

(declare-fun mapIsEmpty!55108 () Bool)

(assert (=> mapIsEmpty!55108 mapRes!55108))

(assert (= (and start!111088 res!873149) b!1315219))

(assert (= (and b!1315219 res!873148) b!1315222))

(assert (= (and b!1315222 res!873151) b!1315218))

(assert (= (and b!1315218 res!873147) b!1315217))

(assert (= (and b!1315217 res!873150) b!1315220))

(assert (= (and b!1315216 condMapEmpty!55108) mapIsEmpty!55108))

(assert (= (and b!1315216 (not condMapEmpty!55108)) mapNonEmpty!55108))

(get-info :version)

(assert (= (and mapNonEmpty!55108 ((_ is ValueCellFull!16928) mapValue!55108)) b!1315223))

(assert (= (and b!1315216 ((_ is ValueCellFull!16928) mapDefault!55108)) b!1315221))

(assert (= start!111088 b!1315216))

(declare-fun m!1203015 () Bool)

(assert (=> b!1315218 m!1203015))

(declare-fun m!1203017 () Bool)

(assert (=> b!1315220 m!1203017))

(assert (=> b!1315220 m!1203017))

(declare-fun m!1203019 () Bool)

(assert (=> b!1315220 m!1203019))

(declare-fun m!1203021 () Bool)

(assert (=> mapNonEmpty!55108 m!1203021))

(declare-fun m!1203023 () Bool)

(assert (=> b!1315222 m!1203023))

(declare-fun m!1203025 () Bool)

(assert (=> start!111088 m!1203025))

(declare-fun m!1203027 () Bool)

(assert (=> start!111088 m!1203027))

(declare-fun m!1203029 () Bool)

(assert (=> start!111088 m!1203029))

(check-sat (not b!1315218) (not b!1315220) (not mapNonEmpty!55108) (not b!1315222) b_and!48113 (not start!111088) tp_is_empty!35653 (not b_next!29923))
(check-sat b_and!48113 (not b_next!29923))
