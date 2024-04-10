; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113176 () Bool)

(assert start!113176)

(declare-fun b_free!31227 () Bool)

(declare-fun b_next!31227 () Bool)

(assert (=> start!113176 (= b_free!31227 (not b_next!31227))))

(declare-fun tp!109486 () Bool)

(declare-fun b_and!50361 () Bool)

(assert (=> start!113176 (= tp!109486 b_and!50361)))

(declare-fun b!1342207 () Bool)

(declare-fun res!890467 () Bool)

(declare-fun e!764183 () Bool)

(assert (=> b!1342207 (=> (not res!890467) (not e!764183))))

(declare-datatypes ((array!91304 0))(
  ( (array!91305 (arr!44108 (Array (_ BitVec 32) (_ BitVec 64))) (size!44658 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91304)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91304 (_ BitVec 32)) Bool)

(assert (=> b!1342207 (= res!890467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1342208 () Bool)

(declare-fun res!890462 () Bool)

(assert (=> b!1342208 (=> (not res!890462) (not e!764183))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1342208 (= res!890462 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1342209 () Bool)

(declare-fun e!764182 () Bool)

(declare-fun tp_is_empty!37227 () Bool)

(assert (=> b!1342209 (= e!764182 tp_is_empty!37227)))

(declare-fun res!890464 () Bool)

(assert (=> start!113176 (=> (not res!890464) (not e!764183))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113176 (= res!890464 (validMask!0 mask!1977))))

(assert (=> start!113176 e!764183))

(assert (=> start!113176 tp_is_empty!37227))

(assert (=> start!113176 true))

(declare-fun array_inv!33249 (array!91304) Bool)

(assert (=> start!113176 (array_inv!33249 _keys!1571)))

(declare-datatypes ((V!54739 0))(
  ( (V!54740 (val!18688 Int)) )
))
(declare-datatypes ((ValueCell!17715 0))(
  ( (ValueCellFull!17715 (v!21336 V!54739)) (EmptyCell!17715) )
))
(declare-datatypes ((array!91306 0))(
  ( (array!91307 (arr!44109 (Array (_ BitVec 32) ValueCell!17715)) (size!44659 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91306)

(declare-fun e!764179 () Bool)

(declare-fun array_inv!33250 (array!91306) Bool)

(assert (=> start!113176 (and (array_inv!33250 _values!1303) e!764179)))

(assert (=> start!113176 tp!109486))

(declare-fun b!1342210 () Bool)

(declare-fun e!764180 () Bool)

(assert (=> b!1342210 (= e!764180 tp_is_empty!37227)))

(declare-fun mapNonEmpty!57547 () Bool)

(declare-fun mapRes!57547 () Bool)

(declare-fun tp!109485 () Bool)

(assert (=> mapNonEmpty!57547 (= mapRes!57547 (and tp!109485 e!764182))))

(declare-fun mapRest!57547 () (Array (_ BitVec 32) ValueCell!17715))

(declare-fun mapValue!57547 () ValueCell!17715)

(declare-fun mapKey!57547 () (_ BitVec 32))

(assert (=> mapNonEmpty!57547 (= (arr!44109 _values!1303) (store mapRest!57547 mapKey!57547 mapValue!57547))))

(declare-fun b!1342211 () Bool)

(declare-fun res!890465 () Bool)

(assert (=> b!1342211 (=> (not res!890465) (not e!764183))))

(declare-datatypes ((List!31228 0))(
  ( (Nil!31225) (Cons!31224 (h!32433 (_ BitVec 64)) (t!45666 List!31228)) )
))
(declare-fun arrayNoDuplicates!0 (array!91304 (_ BitVec 32) List!31228) Bool)

(assert (=> b!1342211 (= res!890465 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31225))))

(declare-fun b!1342212 () Bool)

(declare-fun res!890468 () Bool)

(assert (=> b!1342212 (=> (not res!890468) (not e!764183))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1342212 (= res!890468 (not (= (select (arr!44108 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1342213 () Bool)

(declare-fun res!890461 () Bool)

(assert (=> b!1342213 (=> (not res!890461) (not e!764183))))

(assert (=> b!1342213 (= res!890461 (and (= (size!44659 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44658 _keys!1571) (size!44659 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1342214 () Bool)

(declare-fun res!890469 () Bool)

(assert (=> b!1342214 (=> (not res!890469) (not e!764183))))

(declare-fun minValue!1245 () V!54739)

(declare-fun zeroValue!1245 () V!54739)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24072 0))(
  ( (tuple2!24073 (_1!12047 (_ BitVec 64)) (_2!12047 V!54739)) )
))
(declare-datatypes ((List!31229 0))(
  ( (Nil!31226) (Cons!31225 (h!32434 tuple2!24072) (t!45667 List!31229)) )
))
(declare-datatypes ((ListLongMap!21729 0))(
  ( (ListLongMap!21730 (toList!10880 List!31229)) )
))
(declare-fun contains!9056 (ListLongMap!21729 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5844 (array!91304 array!91306 (_ BitVec 32) (_ BitVec 32) V!54739 V!54739 (_ BitVec 32) Int) ListLongMap!21729)

(assert (=> b!1342214 (= res!890469 (contains!9056 (getCurrentListMap!5844 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1342215 () Bool)

(assert (=> b!1342215 (= e!764183 (not true))))

(declare-fun lt!594392 () ListLongMap!21729)

(assert (=> b!1342215 (contains!9056 lt!594392 k0!1142)))

(declare-datatypes ((Unit!44059 0))(
  ( (Unit!44060) )
))
(declare-fun lt!594389 () Unit!44059)

(declare-fun lt!594391 () V!54739)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!360 ((_ BitVec 64) (_ BitVec 64) V!54739 ListLongMap!21729) Unit!44059)

(assert (=> b!1342215 (= lt!594389 (lemmaInListMapAfterAddingDiffThenInBefore!360 k0!1142 (select (arr!44108 _keys!1571) from!1960) lt!594391 lt!594392))))

(declare-fun lt!594390 () ListLongMap!21729)

(assert (=> b!1342215 (contains!9056 lt!594390 k0!1142)))

(declare-fun lt!594393 () Unit!44059)

(assert (=> b!1342215 (= lt!594393 (lemmaInListMapAfterAddingDiffThenInBefore!360 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594390))))

(declare-fun +!4791 (ListLongMap!21729 tuple2!24072) ListLongMap!21729)

(assert (=> b!1342215 (= lt!594390 (+!4791 lt!594392 (tuple2!24073 (select (arr!44108 _keys!1571) from!1960) lt!594391)))))

(declare-fun get!22272 (ValueCell!17715 V!54739) V!54739)

(declare-fun dynLambda!3730 (Int (_ BitVec 64)) V!54739)

(assert (=> b!1342215 (= lt!594391 (get!22272 (select (arr!44109 _values!1303) from!1960) (dynLambda!3730 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6433 (array!91304 array!91306 (_ BitVec 32) (_ BitVec 32) V!54739 V!54739 (_ BitVec 32) Int) ListLongMap!21729)

(assert (=> b!1342215 (= lt!594392 (getCurrentListMapNoExtraKeys!6433 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun mapIsEmpty!57547 () Bool)

(assert (=> mapIsEmpty!57547 mapRes!57547))

(declare-fun b!1342216 () Bool)

(declare-fun res!890463 () Bool)

(assert (=> b!1342216 (=> (not res!890463) (not e!764183))))

(assert (=> b!1342216 (= res!890463 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44658 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1342217 () Bool)

(assert (=> b!1342217 (= e!764179 (and e!764180 mapRes!57547))))

(declare-fun condMapEmpty!57547 () Bool)

(declare-fun mapDefault!57547 () ValueCell!17715)

(assert (=> b!1342217 (= condMapEmpty!57547 (= (arr!44109 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17715)) mapDefault!57547)))))

(declare-fun b!1342218 () Bool)

(declare-fun res!890466 () Bool)

(assert (=> b!1342218 (=> (not res!890466) (not e!764183))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342218 (= res!890466 (validKeyInArray!0 (select (arr!44108 _keys!1571) from!1960)))))

(assert (= (and start!113176 res!890464) b!1342213))

(assert (= (and b!1342213 res!890461) b!1342207))

(assert (= (and b!1342207 res!890467) b!1342211))

(assert (= (and b!1342211 res!890465) b!1342216))

(assert (= (and b!1342216 res!890463) b!1342214))

(assert (= (and b!1342214 res!890469) b!1342212))

(assert (= (and b!1342212 res!890468) b!1342218))

(assert (= (and b!1342218 res!890466) b!1342208))

(assert (= (and b!1342208 res!890462) b!1342215))

(assert (= (and b!1342217 condMapEmpty!57547) mapIsEmpty!57547))

(assert (= (and b!1342217 (not condMapEmpty!57547)) mapNonEmpty!57547))

(get-info :version)

(assert (= (and mapNonEmpty!57547 ((_ is ValueCellFull!17715) mapValue!57547)) b!1342209))

(assert (= (and b!1342217 ((_ is ValueCellFull!17715) mapDefault!57547)) b!1342210))

(assert (= start!113176 b!1342217))

(declare-fun b_lambda!24403 () Bool)

(assert (=> (not b_lambda!24403) (not b!1342215)))

(declare-fun t!45665 () Bool)

(declare-fun tb!12241 () Bool)

(assert (=> (and start!113176 (= defaultEntry!1306 defaultEntry!1306) t!45665) tb!12241))

(declare-fun result!25573 () Bool)

(assert (=> tb!12241 (= result!25573 tp_is_empty!37227)))

(assert (=> b!1342215 t!45665))

(declare-fun b_and!50363 () Bool)

(assert (= b_and!50361 (and (=> t!45665 result!25573) b_and!50363)))

(declare-fun m!1229829 () Bool)

(assert (=> b!1342212 m!1229829))

(declare-fun m!1229831 () Bool)

(assert (=> start!113176 m!1229831))

(declare-fun m!1229833 () Bool)

(assert (=> start!113176 m!1229833))

(declare-fun m!1229835 () Bool)

(assert (=> start!113176 m!1229835))

(declare-fun m!1229837 () Bool)

(assert (=> b!1342211 m!1229837))

(declare-fun m!1229839 () Bool)

(assert (=> mapNonEmpty!57547 m!1229839))

(declare-fun m!1229841 () Bool)

(assert (=> b!1342207 m!1229841))

(declare-fun m!1229843 () Bool)

(assert (=> b!1342215 m!1229843))

(declare-fun m!1229845 () Bool)

(assert (=> b!1342215 m!1229845))

(declare-fun m!1229847 () Bool)

(assert (=> b!1342215 m!1229847))

(declare-fun m!1229849 () Bool)

(assert (=> b!1342215 m!1229849))

(assert (=> b!1342215 m!1229845))

(assert (=> b!1342215 m!1229847))

(assert (=> b!1342215 m!1229829))

(assert (=> b!1342215 m!1229829))

(declare-fun m!1229851 () Bool)

(assert (=> b!1342215 m!1229851))

(declare-fun m!1229853 () Bool)

(assert (=> b!1342215 m!1229853))

(declare-fun m!1229855 () Bool)

(assert (=> b!1342215 m!1229855))

(declare-fun m!1229857 () Bool)

(assert (=> b!1342215 m!1229857))

(declare-fun m!1229859 () Bool)

(assert (=> b!1342215 m!1229859))

(declare-fun m!1229861 () Bool)

(assert (=> b!1342214 m!1229861))

(assert (=> b!1342214 m!1229861))

(declare-fun m!1229863 () Bool)

(assert (=> b!1342214 m!1229863))

(assert (=> b!1342218 m!1229829))

(assert (=> b!1342218 m!1229829))

(declare-fun m!1229865 () Bool)

(assert (=> b!1342218 m!1229865))

(check-sat (not b_next!31227) (not b!1342207) (not b!1342218) (not b!1342215) (not mapNonEmpty!57547) b_and!50363 (not b!1342211) (not b_lambda!24403) (not b!1342214) tp_is_empty!37227 (not start!113176))
(check-sat b_and!50363 (not b_next!31227))
