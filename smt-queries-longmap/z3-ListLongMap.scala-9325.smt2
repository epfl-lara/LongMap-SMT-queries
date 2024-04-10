; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111388 () Bool)

(assert start!111388)

(declare-fun b_free!30045 () Bool)

(declare-fun b_next!30045 () Bool)

(assert (=> start!111388 (= b_free!30045 (not b_next!30045))))

(declare-fun tp!105611 () Bool)

(declare-fun b_and!48265 () Bool)

(assert (=> start!111388 (= tp!105611 b_and!48265)))

(declare-fun b!1318060 () Bool)

(declare-fun res!874760 () Bool)

(declare-fun e!752178 () Bool)

(assert (=> b!1318060 (=> (not res!874760) (not e!752178))))

(declare-datatypes ((array!88680 0))(
  ( (array!88681 (arr!42814 (Array (_ BitVec 32) (_ BitVec 64))) (size!43364 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88680)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!52923 0))(
  ( (V!52924 (val!18007 Int)) )
))
(declare-datatypes ((ValueCell!17034 0))(
  ( (ValueCellFull!17034 (v!20637 V!52923)) (EmptyCell!17034) )
))
(declare-datatypes ((array!88682 0))(
  ( (array!88683 (arr!42815 (Array (_ BitVec 32) ValueCell!17034)) (size!43365 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88682)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1318060 (= res!874760 (and (= (size!43365 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43364 _keys!1609) (size!43365 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1318061 () Bool)

(declare-fun res!874756 () Bool)

(assert (=> b!1318061 (=> (not res!874756) (not e!752178))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1318061 (= res!874756 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43364 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55445 () Bool)

(declare-fun mapRes!55445 () Bool)

(assert (=> mapIsEmpty!55445 mapRes!55445))

(declare-fun b!1318062 () Bool)

(assert (=> b!1318062 (= e!752178 false)))

(declare-fun zeroValue!1279 () V!52923)

(declare-fun minValue!1279 () V!52923)

(declare-fun defaultEntry!1340 () Int)

(declare-fun lt!586443 () Bool)

(declare-datatypes ((tuple2!23178 0))(
  ( (tuple2!23179 (_1!11600 (_ BitVec 64)) (_2!11600 V!52923)) )
))
(declare-datatypes ((List!30334 0))(
  ( (Nil!30331) (Cons!30330 (h!31539 tuple2!23178) (t!43942 List!30334)) )
))
(declare-datatypes ((ListLongMap!20835 0))(
  ( (ListLongMap!20836 (toList!10433 List!30334)) )
))
(declare-fun contains!8588 (ListLongMap!20835 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5446 (array!88680 array!88682 (_ BitVec 32) (_ BitVec 32) V!52923 V!52923 (_ BitVec 32) Int) ListLongMap!20835)

(assert (=> b!1318062 (= lt!586443 (contains!8588 (getCurrentListMap!5446 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1318064 () Bool)

(declare-fun e!752175 () Bool)

(declare-fun tp_is_empty!35865 () Bool)

(assert (=> b!1318064 (= e!752175 tp_is_empty!35865)))

(declare-fun b!1318065 () Bool)

(declare-fun res!874757 () Bool)

(assert (=> b!1318065 (=> (not res!874757) (not e!752178))))

(declare-datatypes ((List!30335 0))(
  ( (Nil!30332) (Cons!30331 (h!31540 (_ BitVec 64)) (t!43943 List!30335)) )
))
(declare-fun arrayNoDuplicates!0 (array!88680 (_ BitVec 32) List!30335) Bool)

(assert (=> b!1318065 (= res!874757 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30332))))

(declare-fun b!1318066 () Bool)

(declare-fun e!752179 () Bool)

(assert (=> b!1318066 (= e!752179 tp_is_empty!35865)))

(declare-fun mapNonEmpty!55445 () Bool)

(declare-fun tp!105610 () Bool)

(assert (=> mapNonEmpty!55445 (= mapRes!55445 (and tp!105610 e!752175))))

(declare-fun mapValue!55445 () ValueCell!17034)

(declare-fun mapKey!55445 () (_ BitVec 32))

(declare-fun mapRest!55445 () (Array (_ BitVec 32) ValueCell!17034))

(assert (=> mapNonEmpty!55445 (= (arr!42815 _values!1337) (store mapRest!55445 mapKey!55445 mapValue!55445))))

(declare-fun b!1318067 () Bool)

(declare-fun res!874758 () Bool)

(assert (=> b!1318067 (=> (not res!874758) (not e!752178))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88680 (_ BitVec 32)) Bool)

(assert (=> b!1318067 (= res!874758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1318063 () Bool)

(declare-fun e!752177 () Bool)

(assert (=> b!1318063 (= e!752177 (and e!752179 mapRes!55445))))

(declare-fun condMapEmpty!55445 () Bool)

(declare-fun mapDefault!55445 () ValueCell!17034)

(assert (=> b!1318063 (= condMapEmpty!55445 (= (arr!42815 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17034)) mapDefault!55445)))))

(declare-fun res!874759 () Bool)

(assert (=> start!111388 (=> (not res!874759) (not e!752178))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111388 (= res!874759 (validMask!0 mask!2019))))

(assert (=> start!111388 e!752178))

(declare-fun array_inv!32337 (array!88680) Bool)

(assert (=> start!111388 (array_inv!32337 _keys!1609)))

(assert (=> start!111388 true))

(assert (=> start!111388 tp_is_empty!35865))

(declare-fun array_inv!32338 (array!88682) Bool)

(assert (=> start!111388 (and (array_inv!32338 _values!1337) e!752177)))

(assert (=> start!111388 tp!105611))

(assert (= (and start!111388 res!874759) b!1318060))

(assert (= (and b!1318060 res!874760) b!1318067))

(assert (= (and b!1318067 res!874758) b!1318065))

(assert (= (and b!1318065 res!874757) b!1318061))

(assert (= (and b!1318061 res!874756) b!1318062))

(assert (= (and b!1318063 condMapEmpty!55445) mapIsEmpty!55445))

(assert (= (and b!1318063 (not condMapEmpty!55445)) mapNonEmpty!55445))

(get-info :version)

(assert (= (and mapNonEmpty!55445 ((_ is ValueCellFull!17034) mapValue!55445)) b!1318064))

(assert (= (and b!1318063 ((_ is ValueCellFull!17034) mapDefault!55445)) b!1318066))

(assert (= start!111388 b!1318063))

(declare-fun m!1205707 () Bool)

(assert (=> b!1318062 m!1205707))

(assert (=> b!1318062 m!1205707))

(declare-fun m!1205709 () Bool)

(assert (=> b!1318062 m!1205709))

(declare-fun m!1205711 () Bool)

(assert (=> start!111388 m!1205711))

(declare-fun m!1205713 () Bool)

(assert (=> start!111388 m!1205713))

(declare-fun m!1205715 () Bool)

(assert (=> start!111388 m!1205715))

(declare-fun m!1205717 () Bool)

(assert (=> mapNonEmpty!55445 m!1205717))

(declare-fun m!1205719 () Bool)

(assert (=> b!1318065 m!1205719))

(declare-fun m!1205721 () Bool)

(assert (=> b!1318067 m!1205721))

(check-sat (not b!1318067) (not b!1318065) (not b!1318062) tp_is_empty!35865 (not start!111388) (not mapNonEmpty!55445) b_and!48265 (not b_next!30045))
(check-sat b_and!48265 (not b_next!30045))
