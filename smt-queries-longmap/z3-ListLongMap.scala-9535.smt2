; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113074 () Bool)

(assert start!113074)

(declare-fun b_free!31125 () Bool)

(declare-fun b_next!31125 () Bool)

(assert (=> start!113074 (= b_free!31125 (not b_next!31125))))

(declare-fun tp!109179 () Bool)

(declare-fun b_and!50157 () Bool)

(assert (=> start!113074 (= tp!109179 b_and!50157)))

(declare-fun res!889089 () Bool)

(declare-fun e!763417 () Bool)

(assert (=> start!113074 (=> (not res!889089) (not e!763417))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113074 (= res!889089 (validMask!0 mask!1977))))

(assert (=> start!113074 e!763417))

(declare-fun tp_is_empty!37125 () Bool)

(assert (=> start!113074 tp_is_empty!37125))

(assert (=> start!113074 true))

(declare-datatypes ((array!91102 0))(
  ( (array!91103 (arr!44007 (Array (_ BitVec 32) (_ BitVec 64))) (size!44557 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91102)

(declare-fun array_inv!33179 (array!91102) Bool)

(assert (=> start!113074 (array_inv!33179 _keys!1571)))

(declare-datatypes ((V!54603 0))(
  ( (V!54604 (val!18637 Int)) )
))
(declare-datatypes ((ValueCell!17664 0))(
  ( (ValueCellFull!17664 (v!21285 V!54603)) (EmptyCell!17664) )
))
(declare-datatypes ((array!91104 0))(
  ( (array!91105 (arr!44008 (Array (_ BitVec 32) ValueCell!17664)) (size!44558 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91104)

(declare-fun e!763416 () Bool)

(declare-fun array_inv!33180 (array!91104) Bool)

(assert (=> start!113074 (and (array_inv!33180 _values!1303) e!763416)))

(assert (=> start!113074 tp!109179))

(declare-fun b!1340269 () Bool)

(declare-fun res!889091 () Bool)

(assert (=> b!1340269 (=> (not res!889091) (not e!763417))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1340269 (= res!889091 (and (= (size!44558 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44557 _keys!1571) (size!44558 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1340270 () Bool)

(declare-fun e!763414 () Bool)

(assert (=> b!1340270 (= e!763414 tp_is_empty!37125)))

(declare-fun b!1340271 () Bool)

(declare-fun res!889084 () Bool)

(assert (=> b!1340271 (=> (not res!889084) (not e!763417))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1340271 (= res!889084 (not (= (select (arr!44007 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1340272 () Bool)

(declare-fun res!889087 () Bool)

(assert (=> b!1340272 (=> (not res!889087) (not e!763417))))

(assert (=> b!1340272 (= res!889087 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1340273 () Bool)

(declare-fun res!889088 () Bool)

(assert (=> b!1340273 (=> (not res!889088) (not e!763417))))

(declare-datatypes ((List!31149 0))(
  ( (Nil!31146) (Cons!31145 (h!32354 (_ BitVec 64)) (t!45485 List!31149)) )
))
(declare-fun arrayNoDuplicates!0 (array!91102 (_ BitVec 32) List!31149) Bool)

(assert (=> b!1340273 (= res!889088 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31146))))

(declare-fun b!1340274 () Bool)

(declare-fun e!763418 () Bool)

(declare-fun mapRes!57394 () Bool)

(assert (=> b!1340274 (= e!763416 (and e!763418 mapRes!57394))))

(declare-fun condMapEmpty!57394 () Bool)

(declare-fun mapDefault!57394 () ValueCell!17664)

(assert (=> b!1340274 (= condMapEmpty!57394 (= (arr!44008 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17664)) mapDefault!57394)))))

(declare-fun mapNonEmpty!57394 () Bool)

(declare-fun tp!109180 () Bool)

(assert (=> mapNonEmpty!57394 (= mapRes!57394 (and tp!109180 e!763414))))

(declare-fun mapValue!57394 () ValueCell!17664)

(declare-fun mapKey!57394 () (_ BitVec 32))

(declare-fun mapRest!57394 () (Array (_ BitVec 32) ValueCell!17664))

(assert (=> mapNonEmpty!57394 (= (arr!44008 _values!1303) (store mapRest!57394 mapKey!57394 mapValue!57394))))

(declare-fun b!1340275 () Bool)

(assert (=> b!1340275 (= e!763417 false)))

(declare-fun minValue!1245 () V!54603)

(declare-fun zeroValue!1245 () V!54603)

(declare-fun defaultEntry!1306 () Int)

(declare-fun lt!593973 () Bool)

(declare-datatypes ((tuple2!23986 0))(
  ( (tuple2!23987 (_1!12004 (_ BitVec 64)) (_2!12004 V!54603)) )
))
(declare-datatypes ((List!31150 0))(
  ( (Nil!31147) (Cons!31146 (h!32355 tuple2!23986) (t!45486 List!31150)) )
))
(declare-datatypes ((ListLongMap!21643 0))(
  ( (ListLongMap!21644 (toList!10837 List!31150)) )
))
(declare-fun contains!9013 (ListLongMap!21643 (_ BitVec 64)) Bool)

(declare-fun +!4755 (ListLongMap!21643 tuple2!23986) ListLongMap!21643)

(declare-fun getCurrentListMapNoExtraKeys!6397 (array!91102 array!91104 (_ BitVec 32) (_ BitVec 32) V!54603 V!54603 (_ BitVec 32) Int) ListLongMap!21643)

(declare-fun get!22202 (ValueCell!17664 V!54603) V!54603)

(declare-fun dynLambda!3694 (Int (_ BitVec 64)) V!54603)

(assert (=> b!1340275 (= lt!593973 (contains!9013 (+!4755 (+!4755 (getCurrentListMapNoExtraKeys!6397 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!23987 (select (arr!44007 _keys!1571) from!1960) (get!22202 (select (arr!44008 _values!1303) from!1960) (dynLambda!3694 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23987 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142))))

(declare-fun b!1340276 () Bool)

(declare-fun res!889086 () Bool)

(assert (=> b!1340276 (=> (not res!889086) (not e!763417))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91102 (_ BitVec 32)) Bool)

(assert (=> b!1340276 (= res!889086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!57394 () Bool)

(assert (=> mapIsEmpty!57394 mapRes!57394))

(declare-fun b!1340277 () Bool)

(declare-fun res!889085 () Bool)

(assert (=> b!1340277 (=> (not res!889085) (not e!763417))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340277 (= res!889085 (validKeyInArray!0 (select (arr!44007 _keys!1571) from!1960)))))

(declare-fun b!1340278 () Bool)

(declare-fun res!889090 () Bool)

(assert (=> b!1340278 (=> (not res!889090) (not e!763417))))

(assert (=> b!1340278 (= res!889090 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44557 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1340279 () Bool)

(assert (=> b!1340279 (= e!763418 tp_is_empty!37125)))

(declare-fun b!1340280 () Bool)

(declare-fun res!889092 () Bool)

(assert (=> b!1340280 (=> (not res!889092) (not e!763417))))

(declare-fun getCurrentListMap!5805 (array!91102 array!91104 (_ BitVec 32) (_ BitVec 32) V!54603 V!54603 (_ BitVec 32) Int) ListLongMap!21643)

(assert (=> b!1340280 (= res!889092 (contains!9013 (getCurrentListMap!5805 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(assert (= (and start!113074 res!889089) b!1340269))

(assert (= (and b!1340269 res!889091) b!1340276))

(assert (= (and b!1340276 res!889086) b!1340273))

(assert (= (and b!1340273 res!889088) b!1340278))

(assert (= (and b!1340278 res!889090) b!1340280))

(assert (= (and b!1340280 res!889092) b!1340271))

(assert (= (and b!1340271 res!889084) b!1340277))

(assert (= (and b!1340277 res!889085) b!1340272))

(assert (= (and b!1340272 res!889087) b!1340275))

(assert (= (and b!1340274 condMapEmpty!57394) mapIsEmpty!57394))

(assert (= (and b!1340274 (not condMapEmpty!57394)) mapNonEmpty!57394))

(get-info :version)

(assert (= (and mapNonEmpty!57394 ((_ is ValueCellFull!17664) mapValue!57394)) b!1340270))

(assert (= (and b!1340274 ((_ is ValueCellFull!17664) mapDefault!57394)) b!1340279))

(assert (= start!113074 b!1340274))

(declare-fun b_lambda!24301 () Bool)

(assert (=> (not b_lambda!24301) (not b!1340275)))

(declare-fun t!45484 () Bool)

(declare-fun tb!12139 () Bool)

(assert (=> (and start!113074 (= defaultEntry!1306 defaultEntry!1306) t!45484) tb!12139))

(declare-fun result!25369 () Bool)

(assert (=> tb!12139 (= result!25369 tp_is_empty!37125)))

(assert (=> b!1340275 t!45484))

(declare-fun b_and!50159 () Bool)

(assert (= b_and!50157 (and (=> t!45484 result!25369) b_and!50159)))

(declare-fun m!1228043 () Bool)

(assert (=> b!1340273 m!1228043))

(declare-fun m!1228045 () Bool)

(assert (=> b!1340271 m!1228045))

(declare-fun m!1228047 () Bool)

(assert (=> b!1340280 m!1228047))

(assert (=> b!1340280 m!1228047))

(declare-fun m!1228049 () Bool)

(assert (=> b!1340280 m!1228049))

(declare-fun m!1228051 () Bool)

(assert (=> mapNonEmpty!57394 m!1228051))

(assert (=> b!1340277 m!1228045))

(assert (=> b!1340277 m!1228045))

(declare-fun m!1228053 () Bool)

(assert (=> b!1340277 m!1228053))

(declare-fun m!1228055 () Bool)

(assert (=> start!113074 m!1228055))

(declare-fun m!1228057 () Bool)

(assert (=> start!113074 m!1228057))

(declare-fun m!1228059 () Bool)

(assert (=> start!113074 m!1228059))

(declare-fun m!1228061 () Bool)

(assert (=> b!1340276 m!1228061))

(declare-fun m!1228063 () Bool)

(assert (=> b!1340275 m!1228063))

(declare-fun m!1228065 () Bool)

(assert (=> b!1340275 m!1228065))

(declare-fun m!1228067 () Bool)

(assert (=> b!1340275 m!1228067))

(declare-fun m!1228069 () Bool)

(assert (=> b!1340275 m!1228069))

(declare-fun m!1228071 () Bool)

(assert (=> b!1340275 m!1228071))

(declare-fun m!1228073 () Bool)

(assert (=> b!1340275 m!1228073))

(assert (=> b!1340275 m!1228067))

(declare-fun m!1228075 () Bool)

(assert (=> b!1340275 m!1228075))

(assert (=> b!1340275 m!1228069))

(assert (=> b!1340275 m!1228071))

(assert (=> b!1340275 m!1228045))

(assert (=> b!1340275 m!1228075))

(assert (=> b!1340275 m!1228063))

(check-sat (not b_lambda!24301) (not b_next!31125) (not b!1340276) (not mapNonEmpty!57394) tp_is_empty!37125 (not b!1340275) (not b!1340280) (not b!1340277) b_and!50159 (not start!113074) (not b!1340273))
(check-sat b_and!50159 (not b_next!31125))
