; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111318 () Bool)

(assert start!111318)

(declare-fun b_free!29929 () Bool)

(declare-fun b_next!29929 () Bool)

(assert (=> start!111318 (= b_free!29929 (not b_next!29929))))

(declare-fun tp!105109 () Bool)

(declare-fun b_and!48139 () Bool)

(assert (=> start!111318 (= tp!105109 b_and!48139)))

(declare-fun res!873741 () Bool)

(declare-fun e!751173 () Bool)

(assert (=> start!111318 (=> (not res!873741) (not e!751173))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111318 (= res!873741 (validMask!0 mask!2040))))

(assert (=> start!111318 e!751173))

(assert (=> start!111318 tp!105109))

(declare-datatypes ((array!88339 0))(
  ( (array!88340 (arr!42645 (Array (_ BitVec 32) (_ BitVec 64))) (size!43196 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88339)

(declare-fun array_inv!32475 (array!88339) Bool)

(assert (=> start!111318 (array_inv!32475 _keys!1628)))

(assert (=> start!111318 true))

(declare-fun tp_is_empty!35659 () Bool)

(assert (=> start!111318 tp_is_empty!35659))

(declare-datatypes ((V!52649 0))(
  ( (V!52650 (val!17904 Int)) )
))
(declare-datatypes ((ValueCell!16931 0))(
  ( (ValueCellFull!16931 (v!20526 V!52649)) (EmptyCell!16931) )
))
(declare-datatypes ((array!88341 0))(
  ( (array!88342 (arr!42646 (Array (_ BitVec 32) ValueCell!16931)) (size!43197 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88341)

(declare-fun e!751171 () Bool)

(declare-fun array_inv!32476 (array!88341) Bool)

(assert (=> start!111318 (and (array_inv!32476 _values!1354) e!751171)))

(declare-fun b!1316657 () Bool)

(declare-fun e!751175 () Bool)

(declare-fun mapRes!55117 () Bool)

(assert (=> b!1316657 (= e!751171 (and e!751175 mapRes!55117))))

(declare-fun condMapEmpty!55117 () Bool)

(declare-fun mapDefault!55117 () ValueCell!16931)

(assert (=> b!1316657 (= condMapEmpty!55117 (= (arr!42646 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16931)) mapDefault!55117)))))

(declare-fun b!1316658 () Bool)

(declare-fun res!873739 () Bool)

(assert (=> b!1316658 (=> (not res!873739) (not e!751173))))

(declare-datatypes ((List!30265 0))(
  ( (Nil!30262) (Cons!30261 (h!31479 (_ BitVec 64)) (t!43863 List!30265)) )
))
(declare-fun arrayNoDuplicates!0 (array!88339 (_ BitVec 32) List!30265) Bool)

(assert (=> b!1316658 (= res!873739 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30262))))

(declare-fun mapIsEmpty!55117 () Bool)

(assert (=> mapIsEmpty!55117 mapRes!55117))

(declare-fun b!1316659 () Bool)

(declare-fun e!751174 () Bool)

(assert (=> b!1316659 (= e!751174 tp_is_empty!35659)))

(declare-fun b!1316660 () Bool)

(declare-fun res!873740 () Bool)

(assert (=> b!1316660 (=> (not res!873740) (not e!751173))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1316660 (= res!873740 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43196 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!55117 () Bool)

(declare-fun tp!105108 () Bool)

(assert (=> mapNonEmpty!55117 (= mapRes!55117 (and tp!105108 e!751174))))

(declare-fun mapKey!55117 () (_ BitVec 32))

(declare-fun mapRest!55117 () (Array (_ BitVec 32) ValueCell!16931))

(declare-fun mapValue!55117 () ValueCell!16931)

(assert (=> mapNonEmpty!55117 (= (arr!42646 _values!1354) (store mapRest!55117 mapKey!55117 mapValue!55117))))

(declare-fun b!1316661 () Bool)

(declare-fun res!873742 () Bool)

(assert (=> b!1316661 (=> (not res!873742) (not e!751173))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88339 (_ BitVec 32)) Bool)

(assert (=> b!1316661 (= res!873742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1316662 () Bool)

(assert (=> b!1316662 (= e!751173 false)))

(declare-fun minValue!1296 () V!52649)

(declare-fun zeroValue!1296 () V!52649)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!586379 () Bool)

(declare-datatypes ((tuple2!23120 0))(
  ( (tuple2!23121 (_1!11571 (_ BitVec 64)) (_2!11571 V!52649)) )
))
(declare-datatypes ((List!30266 0))(
  ( (Nil!30263) (Cons!30262 (h!31480 tuple2!23120) (t!43864 List!30266)) )
))
(declare-datatypes ((ListLongMap!20785 0))(
  ( (ListLongMap!20786 (toList!10408 List!30266)) )
))
(declare-fun contains!8570 (ListLongMap!20785 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5412 (array!88339 array!88341 (_ BitVec 32) (_ BitVec 32) V!52649 V!52649 (_ BitVec 32) Int) ListLongMap!20785)

(assert (=> b!1316662 (= lt!586379 (contains!8570 (getCurrentListMap!5412 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1316663 () Bool)

(assert (=> b!1316663 (= e!751175 tp_is_empty!35659)))

(declare-fun b!1316664 () Bool)

(declare-fun res!873743 () Bool)

(assert (=> b!1316664 (=> (not res!873743) (not e!751173))))

(assert (=> b!1316664 (= res!873743 (and (= (size!43197 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43196 _keys!1628) (size!43197 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!111318 res!873741) b!1316664))

(assert (= (and b!1316664 res!873743) b!1316661))

(assert (= (and b!1316661 res!873742) b!1316658))

(assert (= (and b!1316658 res!873739) b!1316660))

(assert (= (and b!1316660 res!873740) b!1316662))

(assert (= (and b!1316657 condMapEmpty!55117) mapIsEmpty!55117))

(assert (= (and b!1316657 (not condMapEmpty!55117)) mapNonEmpty!55117))

(get-info :version)

(assert (= (and mapNonEmpty!55117 ((_ is ValueCellFull!16931) mapValue!55117)) b!1316659))

(assert (= (and b!1316657 ((_ is ValueCellFull!16931) mapDefault!55117)) b!1316663))

(assert (= start!111318 b!1316657))

(declare-fun m!1205177 () Bool)

(assert (=> b!1316662 m!1205177))

(assert (=> b!1316662 m!1205177))

(declare-fun m!1205179 () Bool)

(assert (=> b!1316662 m!1205179))

(declare-fun m!1205181 () Bool)

(assert (=> b!1316661 m!1205181))

(declare-fun m!1205183 () Bool)

(assert (=> start!111318 m!1205183))

(declare-fun m!1205185 () Bool)

(assert (=> start!111318 m!1205185))

(declare-fun m!1205187 () Bool)

(assert (=> start!111318 m!1205187))

(declare-fun m!1205189 () Bool)

(assert (=> b!1316658 m!1205189))

(declare-fun m!1205191 () Bool)

(assert (=> mapNonEmpty!55117 m!1205191))

(check-sat (not start!111318) (not b!1316658) b_and!48139 (not b_next!29929) (not mapNonEmpty!55117) tp_is_empty!35659 (not b!1316662) (not b!1316661))
(check-sat b_and!48139 (not b_next!29929))
