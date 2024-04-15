; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111094 () Bool)

(assert start!111094)

(declare-fun b_free!29929 () Bool)

(declare-fun b_next!29929 () Bool)

(assert (=> start!111094 (= b_free!29929 (not b_next!29929))))

(declare-fun tp!105109 () Bool)

(declare-fun b_and!48119 () Bool)

(assert (=> start!111094 (= tp!105109 b_and!48119)))

(declare-fun res!873194 () Bool)

(declare-fun e!750298 () Bool)

(assert (=> start!111094 (=> (not res!873194) (not e!750298))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111094 (= res!873194 (validMask!0 mask!2040))))

(assert (=> start!111094 e!750298))

(assert (=> start!111094 tp!105109))

(declare-datatypes ((array!88191 0))(
  ( (array!88192 (arr!42576 (Array (_ BitVec 32) (_ BitVec 64))) (size!43128 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88191)

(declare-fun array_inv!32343 (array!88191) Bool)

(assert (=> start!111094 (array_inv!32343 _keys!1628)))

(assert (=> start!111094 true))

(declare-fun tp_is_empty!35659 () Bool)

(assert (=> start!111094 tp_is_empty!35659))

(declare-datatypes ((V!52649 0))(
  ( (V!52650 (val!17904 Int)) )
))
(declare-datatypes ((ValueCell!16931 0))(
  ( (ValueCellFull!16931 (v!20530 V!52649)) (EmptyCell!16931) )
))
(declare-datatypes ((array!88193 0))(
  ( (array!88194 (arr!42577 (Array (_ BitVec 32) ValueCell!16931)) (size!43129 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88193)

(declare-fun e!750297 () Bool)

(declare-fun array_inv!32344 (array!88193) Bool)

(assert (=> start!111094 (and (array_inv!32344 _values!1354) e!750297)))

(declare-fun b!1315288 () Bool)

(declare-fun res!873195 () Bool)

(assert (=> b!1315288 (=> (not res!873195) (not e!750298))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1315288 (= res!873195 (and (= (size!43129 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43128 _keys!1628) (size!43129 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315289 () Bool)

(declare-fun res!873196 () Bool)

(assert (=> b!1315289 (=> (not res!873196) (not e!750298))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88191 (_ BitVec 32)) Bool)

(assert (=> b!1315289 (= res!873196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315290 () Bool)

(declare-fun res!873193 () Bool)

(assert (=> b!1315290 (=> (not res!873193) (not e!750298))))

(declare-datatypes ((List!30299 0))(
  ( (Nil!30296) (Cons!30295 (h!31504 (_ BitVec 64)) (t!43897 List!30299)) )
))
(declare-fun arrayNoDuplicates!0 (array!88191 (_ BitVec 32) List!30299) Bool)

(assert (=> b!1315290 (= res!873193 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30296))))

(declare-fun mapNonEmpty!55117 () Bool)

(declare-fun mapRes!55117 () Bool)

(declare-fun tp!105110 () Bool)

(declare-fun e!750296 () Bool)

(assert (=> mapNonEmpty!55117 (= mapRes!55117 (and tp!105110 e!750296))))

(declare-fun mapRest!55117 () (Array (_ BitVec 32) ValueCell!16931))

(declare-fun mapKey!55117 () (_ BitVec 32))

(declare-fun mapValue!55117 () ValueCell!16931)

(assert (=> mapNonEmpty!55117 (= (arr!42577 _values!1354) (store mapRest!55117 mapKey!55117 mapValue!55117))))

(declare-fun b!1315291 () Bool)

(assert (=> b!1315291 (= e!750298 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52649)

(declare-fun zeroValue!1296 () V!52649)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585717 () Bool)

(declare-datatypes ((tuple2!23184 0))(
  ( (tuple2!23185 (_1!11603 (_ BitVec 64)) (_2!11603 V!52649)) )
))
(declare-datatypes ((List!30300 0))(
  ( (Nil!30297) (Cons!30296 (h!31505 tuple2!23184) (t!43898 List!30300)) )
))
(declare-datatypes ((ListLongMap!20841 0))(
  ( (ListLongMap!20842 (toList!10436 List!30300)) )
))
(declare-fun contains!8513 (ListLongMap!20841 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5331 (array!88191 array!88193 (_ BitVec 32) (_ BitVec 32) V!52649 V!52649 (_ BitVec 32) Int) ListLongMap!20841)

(assert (=> b!1315291 (= lt!585717 (contains!8513 (getCurrentListMap!5331 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1315292 () Bool)

(declare-fun res!873192 () Bool)

(assert (=> b!1315292 (=> (not res!873192) (not e!750298))))

(assert (=> b!1315292 (= res!873192 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43128 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315293 () Bool)

(assert (=> b!1315293 (= e!750296 tp_is_empty!35659)))

(declare-fun mapIsEmpty!55117 () Bool)

(assert (=> mapIsEmpty!55117 mapRes!55117))

(declare-fun b!1315294 () Bool)

(declare-fun e!750299 () Bool)

(assert (=> b!1315294 (= e!750297 (and e!750299 mapRes!55117))))

(declare-fun condMapEmpty!55117 () Bool)

(declare-fun mapDefault!55117 () ValueCell!16931)

(assert (=> b!1315294 (= condMapEmpty!55117 (= (arr!42577 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16931)) mapDefault!55117)))))

(declare-fun b!1315295 () Bool)

(assert (=> b!1315295 (= e!750299 tp_is_empty!35659)))

(assert (= (and start!111094 res!873194) b!1315288))

(assert (= (and b!1315288 res!873195) b!1315289))

(assert (= (and b!1315289 res!873196) b!1315290))

(assert (= (and b!1315290 res!873193) b!1315292))

(assert (= (and b!1315292 res!873192) b!1315291))

(assert (= (and b!1315294 condMapEmpty!55117) mapIsEmpty!55117))

(assert (= (and b!1315294 (not condMapEmpty!55117)) mapNonEmpty!55117))

(get-info :version)

(assert (= (and mapNonEmpty!55117 ((_ is ValueCellFull!16931) mapValue!55117)) b!1315293))

(assert (= (and b!1315294 ((_ is ValueCellFull!16931) mapDefault!55117)) b!1315295))

(assert (= start!111094 b!1315294))

(declare-fun m!1203063 () Bool)

(assert (=> b!1315289 m!1203063))

(declare-fun m!1203065 () Bool)

(assert (=> mapNonEmpty!55117 m!1203065))

(declare-fun m!1203067 () Bool)

(assert (=> b!1315290 m!1203067))

(declare-fun m!1203069 () Bool)

(assert (=> b!1315291 m!1203069))

(assert (=> b!1315291 m!1203069))

(declare-fun m!1203071 () Bool)

(assert (=> b!1315291 m!1203071))

(declare-fun m!1203073 () Bool)

(assert (=> start!111094 m!1203073))

(declare-fun m!1203075 () Bool)

(assert (=> start!111094 m!1203075))

(declare-fun m!1203077 () Bool)

(assert (=> start!111094 m!1203077))

(check-sat (not b_next!29929) (not start!111094) b_and!48119 (not mapNonEmpty!55117) (not b!1315289) tp_is_empty!35659 (not b!1315290) (not b!1315291))
(check-sat b_and!48119 (not b_next!29929))
