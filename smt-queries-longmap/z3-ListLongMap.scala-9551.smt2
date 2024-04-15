; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113168 () Bool)

(assert start!113168)

(declare-fun b_free!31219 () Bool)

(declare-fun b_next!31219 () Bool)

(assert (=> start!113168 (= b_free!31219 (not b_next!31219))))

(declare-fun tp!109463 () Bool)

(declare-fun b_and!50327 () Bool)

(assert (=> start!113168 (= tp!109463 b_and!50327)))

(declare-fun b!1341985 () Bool)

(declare-fun e!764090 () Bool)

(declare-fun e!764086 () Bool)

(declare-fun mapRes!57535 () Bool)

(assert (=> b!1341985 (= e!764090 (and e!764086 mapRes!57535))))

(declare-fun condMapEmpty!57535 () Bool)

(declare-datatypes ((V!54729 0))(
  ( (V!54730 (val!18684 Int)) )
))
(declare-datatypes ((ValueCell!17711 0))(
  ( (ValueCellFull!17711 (v!21331 V!54729)) (EmptyCell!17711) )
))
(declare-datatypes ((array!91231 0))(
  ( (array!91232 (arr!44072 (Array (_ BitVec 32) ValueCell!17711)) (size!44624 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91231)

(declare-fun mapDefault!57535 () ValueCell!17711)

(assert (=> b!1341985 (= condMapEmpty!57535 (= (arr!44072 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17711)) mapDefault!57535)))))

(declare-fun mapNonEmpty!57535 () Bool)

(declare-fun tp!109462 () Bool)

(declare-fun e!764087 () Bool)

(assert (=> mapNonEmpty!57535 (= mapRes!57535 (and tp!109462 e!764087))))

(declare-fun mapRest!57535 () (Array (_ BitVec 32) ValueCell!17711))

(declare-fun mapValue!57535 () ValueCell!17711)

(declare-fun mapKey!57535 () (_ BitVec 32))

(assert (=> mapNonEmpty!57535 (= (arr!44072 _values!1303) (store mapRest!57535 mapKey!57535 mapValue!57535))))

(declare-fun res!890326 () Bool)

(declare-fun e!764088 () Bool)

(assert (=> start!113168 (=> (not res!890326) (not e!764088))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113168 (= res!890326 (validMask!0 mask!1977))))

(assert (=> start!113168 e!764088))

(declare-fun tp_is_empty!37219 () Bool)

(assert (=> start!113168 tp_is_empty!37219))

(assert (=> start!113168 true))

(declare-datatypes ((array!91233 0))(
  ( (array!91234 (arr!44073 (Array (_ BitVec 32) (_ BitVec 64))) (size!44625 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91233)

(declare-fun array_inv!33413 (array!91233) Bool)

(assert (=> start!113168 (array_inv!33413 _keys!1571)))

(declare-fun array_inv!33414 (array!91231) Bool)

(assert (=> start!113168 (and (array_inv!33414 _values!1303) e!764090)))

(assert (=> start!113168 tp!109463))

(declare-fun b!1341986 () Bool)

(declare-fun res!890331 () Bool)

(assert (=> b!1341986 (=> (not res!890331) (not e!764088))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1341986 (= res!890331 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44625 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57535 () Bool)

(assert (=> mapIsEmpty!57535 mapRes!57535))

(declare-fun b!1341987 () Bool)

(assert (=> b!1341987 (= e!764087 tp_is_empty!37219)))

(declare-fun b!1341988 () Bool)

(declare-fun res!890324 () Bool)

(assert (=> b!1341988 (=> (not res!890324) (not e!764088))))

(assert (=> b!1341988 (= res!890324 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1341989 () Bool)

(declare-fun res!890332 () Bool)

(assert (=> b!1341989 (=> (not res!890332) (not e!764088))))

(assert (=> b!1341989 (= res!890332 (and (= (size!44624 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44625 _keys!1571) (size!44624 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1341990 () Bool)

(declare-fun res!890329 () Bool)

(assert (=> b!1341990 (=> (not res!890329) (not e!764088))))

(declare-datatypes ((List!31266 0))(
  ( (Nil!31263) (Cons!31262 (h!32471 (_ BitVec 64)) (t!45688 List!31266)) )
))
(declare-fun arrayNoDuplicates!0 (array!91233 (_ BitVec 32) List!31266) Bool)

(assert (=> b!1341990 (= res!890329 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31263))))

(declare-fun b!1341991 () Bool)

(declare-fun res!890328 () Bool)

(assert (=> b!1341991 (=> (not res!890328) (not e!764088))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91233 (_ BitVec 32)) Bool)

(assert (=> b!1341991 (= res!890328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1341992 () Bool)

(assert (=> b!1341992 (= e!764088 (not true))))

(declare-datatypes ((tuple2!24118 0))(
  ( (tuple2!24119 (_1!12070 (_ BitVec 64)) (_2!12070 V!54729)) )
))
(declare-datatypes ((List!31267 0))(
  ( (Nil!31264) (Cons!31263 (h!32472 tuple2!24118) (t!45689 List!31267)) )
))
(declare-datatypes ((ListLongMap!21775 0))(
  ( (ListLongMap!21776 (toList!10903 List!31267)) )
))
(declare-fun lt!594145 () ListLongMap!21775)

(declare-fun contains!9008 (ListLongMap!21775 (_ BitVec 64)) Bool)

(assert (=> b!1341992 (contains!9008 lt!594145 k0!1142)))

(declare-fun lt!594144 () V!54729)

(declare-datatypes ((Unit!43856 0))(
  ( (Unit!43857) )
))
(declare-fun lt!594147 () Unit!43856)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!346 ((_ BitVec 64) (_ BitVec 64) V!54729 ListLongMap!21775) Unit!43856)

(assert (=> b!1341992 (= lt!594147 (lemmaInListMapAfterAddingDiffThenInBefore!346 k0!1142 (select (arr!44073 _keys!1571) from!1960) lt!594144 lt!594145))))

(declare-fun lt!594143 () ListLongMap!21775)

(assert (=> b!1341992 (contains!9008 lt!594143 k0!1142)))

(declare-fun lt!594146 () Unit!43856)

(declare-fun zeroValue!1245 () V!54729)

(assert (=> b!1341992 (= lt!594146 (lemmaInListMapAfterAddingDiffThenInBefore!346 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594143))))

(declare-fun +!4807 (ListLongMap!21775 tuple2!24118) ListLongMap!21775)

(assert (=> b!1341992 (= lt!594143 (+!4807 lt!594145 (tuple2!24119 (select (arr!44073 _keys!1571) from!1960) lt!594144)))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun get!22253 (ValueCell!17711 V!54729) V!54729)

(declare-fun dynLambda!3737 (Int (_ BitVec 64)) V!54729)

(assert (=> b!1341992 (= lt!594144 (get!22253 (select (arr!44072 _values!1303) from!1960) (dynLambda!3737 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54729)

(declare-fun getCurrentListMapNoExtraKeys!6450 (array!91233 array!91231 (_ BitVec 32) (_ BitVec 32) V!54729 V!54729 (_ BitVec 32) Int) ListLongMap!21775)

(assert (=> b!1341992 (= lt!594145 (getCurrentListMapNoExtraKeys!6450 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1341993 () Bool)

(declare-fun res!890325 () Bool)

(assert (=> b!1341993 (=> (not res!890325) (not e!764088))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341993 (= res!890325 (validKeyInArray!0 (select (arr!44073 _keys!1571) from!1960)))))

(declare-fun b!1341994 () Bool)

(declare-fun res!890330 () Bool)

(assert (=> b!1341994 (=> (not res!890330) (not e!764088))))

(assert (=> b!1341994 (= res!890330 (not (= (select (arr!44073 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1341995 () Bool)

(declare-fun res!890327 () Bool)

(assert (=> b!1341995 (=> (not res!890327) (not e!764088))))

(declare-fun getCurrentListMap!5754 (array!91233 array!91231 (_ BitVec 32) (_ BitVec 32) V!54729 V!54729 (_ BitVec 32) Int) ListLongMap!21775)

(assert (=> b!1341995 (= res!890327 (contains!9008 (getCurrentListMap!5754 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1341996 () Bool)

(assert (=> b!1341996 (= e!764086 tp_is_empty!37219)))

(assert (= (and start!113168 res!890326) b!1341989))

(assert (= (and b!1341989 res!890332) b!1341991))

(assert (= (and b!1341991 res!890328) b!1341990))

(assert (= (and b!1341990 res!890329) b!1341986))

(assert (= (and b!1341986 res!890331) b!1341995))

(assert (= (and b!1341995 res!890327) b!1341994))

(assert (= (and b!1341994 res!890330) b!1341993))

(assert (= (and b!1341993 res!890325) b!1341988))

(assert (= (and b!1341988 res!890324) b!1341992))

(assert (= (and b!1341985 condMapEmpty!57535) mapIsEmpty!57535))

(assert (= (and b!1341985 (not condMapEmpty!57535)) mapNonEmpty!57535))

(get-info :version)

(assert (= (and mapNonEmpty!57535 ((_ is ValueCellFull!17711) mapValue!57535)) b!1341987))

(assert (= (and b!1341985 ((_ is ValueCellFull!17711) mapDefault!57535)) b!1341996))

(assert (= start!113168 b!1341985))

(declare-fun b_lambda!24385 () Bool)

(assert (=> (not b_lambda!24385) (not b!1341992)))

(declare-fun t!45687 () Bool)

(declare-fun tb!12225 () Bool)

(assert (=> (and start!113168 (= defaultEntry!1306 defaultEntry!1306) t!45687) tb!12225))

(declare-fun result!25549 () Bool)

(assert (=> tb!12225 (= result!25549 tp_is_empty!37219)))

(assert (=> b!1341992 t!45687))

(declare-fun b_and!50329 () Bool)

(assert (= b_and!50327 (and (=> t!45687 result!25549) b_and!50329)))

(declare-fun m!1229161 () Bool)

(assert (=> b!1341992 m!1229161))

(declare-fun m!1229163 () Bool)

(assert (=> b!1341992 m!1229163))

(declare-fun m!1229165 () Bool)

(assert (=> b!1341992 m!1229165))

(declare-fun m!1229167 () Bool)

(assert (=> b!1341992 m!1229167))

(declare-fun m!1229169 () Bool)

(assert (=> b!1341992 m!1229169))

(declare-fun m!1229171 () Bool)

(assert (=> b!1341992 m!1229171))

(declare-fun m!1229173 () Bool)

(assert (=> b!1341992 m!1229173))

(assert (=> b!1341992 m!1229169))

(declare-fun m!1229175 () Bool)

(assert (=> b!1341992 m!1229175))

(assert (=> b!1341992 m!1229163))

(declare-fun m!1229177 () Bool)

(assert (=> b!1341992 m!1229177))

(assert (=> b!1341992 m!1229167))

(declare-fun m!1229179 () Bool)

(assert (=> b!1341992 m!1229179))

(declare-fun m!1229181 () Bool)

(assert (=> b!1341995 m!1229181))

(assert (=> b!1341995 m!1229181))

(declare-fun m!1229183 () Bool)

(assert (=> b!1341995 m!1229183))

(declare-fun m!1229185 () Bool)

(assert (=> mapNonEmpty!57535 m!1229185))

(assert (=> b!1341994 m!1229163))

(assert (=> b!1341993 m!1229163))

(assert (=> b!1341993 m!1229163))

(declare-fun m!1229187 () Bool)

(assert (=> b!1341993 m!1229187))

(declare-fun m!1229189 () Bool)

(assert (=> b!1341991 m!1229189))

(declare-fun m!1229191 () Bool)

(assert (=> start!113168 m!1229191))

(declare-fun m!1229193 () Bool)

(assert (=> start!113168 m!1229193))

(declare-fun m!1229195 () Bool)

(assert (=> start!113168 m!1229195))

(declare-fun m!1229197 () Bool)

(assert (=> b!1341990 m!1229197))

(check-sat (not b!1341990) (not b!1341992) b_and!50329 (not b!1341995) (not b_lambda!24385) (not mapNonEmpty!57535) (not start!113168) (not b!1341991) tp_is_empty!37219 (not b!1341993) (not b_next!31219))
(check-sat b_and!50329 (not b_next!31219))
