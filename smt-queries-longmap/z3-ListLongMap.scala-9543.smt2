; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113122 () Bool)

(assert start!113122)

(declare-fun b_free!31173 () Bool)

(declare-fun b_next!31173 () Bool)

(assert (=> start!113122 (= b_free!31173 (not b_next!31173))))

(declare-fun tp!109324 () Bool)

(declare-fun b_and!50253 () Bool)

(assert (=> start!113122 (= tp!109324 b_and!50253)))

(declare-fun mapNonEmpty!57466 () Bool)

(declare-fun mapRes!57466 () Bool)

(declare-fun tp!109323 () Bool)

(declare-fun e!763777 () Bool)

(assert (=> mapNonEmpty!57466 (= mapRes!57466 (and tp!109323 e!763777))))

(declare-datatypes ((V!54667 0))(
  ( (V!54668 (val!18661 Int)) )
))
(declare-datatypes ((ValueCell!17688 0))(
  ( (ValueCellFull!17688 (v!21309 V!54667)) (EmptyCell!17688) )
))
(declare-fun mapValue!57466 () ValueCell!17688)

(declare-fun mapKey!57466 () (_ BitVec 32))

(declare-fun mapRest!57466 () (Array (_ BitVec 32) ValueCell!17688))

(declare-datatypes ((array!91198 0))(
  ( (array!91199 (arr!44055 (Array (_ BitVec 32) ValueCell!17688)) (size!44605 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91198)

(assert (=> mapNonEmpty!57466 (= (arr!44055 _values!1303) (store mapRest!57466 mapKey!57466 mapValue!57466))))

(declare-fun b!1341181 () Bool)

(declare-fun res!889737 () Bool)

(declare-fun e!763774 () Bool)

(assert (=> b!1341181 (=> (not res!889737) (not e!763774))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91200 0))(
  ( (array!91201 (arr!44056 (Array (_ BitVec 32) (_ BitVec 64))) (size!44606 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91200)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1341181 (= res!889737 (not (= (select (arr!44056 _keys!1571) from!1960) k0!1142)))))

(declare-fun res!889733 () Bool)

(assert (=> start!113122 (=> (not res!889733) (not e!763774))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113122 (= res!889733 (validMask!0 mask!1977))))

(assert (=> start!113122 e!763774))

(declare-fun tp_is_empty!37173 () Bool)

(assert (=> start!113122 tp_is_empty!37173))

(assert (=> start!113122 true))

(declare-fun array_inv!33211 (array!91200) Bool)

(assert (=> start!113122 (array_inv!33211 _keys!1571)))

(declare-fun e!763775 () Bool)

(declare-fun array_inv!33212 (array!91198) Bool)

(assert (=> start!113122 (and (array_inv!33212 _values!1303) e!763775)))

(assert (=> start!113122 tp!109324))

(declare-fun b!1341182 () Bool)

(declare-fun res!889732 () Bool)

(assert (=> b!1341182 (=> (not res!889732) (not e!763774))))

(declare-datatypes ((List!31186 0))(
  ( (Nil!31183) (Cons!31182 (h!32391 (_ BitVec 64)) (t!45570 List!31186)) )
))
(declare-fun arrayNoDuplicates!0 (array!91200 (_ BitVec 32) List!31186) Bool)

(assert (=> b!1341182 (= res!889732 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31183))))

(declare-fun b!1341183 () Bool)

(declare-fun e!763778 () Bool)

(assert (=> b!1341183 (= e!763775 (and e!763778 mapRes!57466))))

(declare-fun condMapEmpty!57466 () Bool)

(declare-fun mapDefault!57466 () ValueCell!17688)

(assert (=> b!1341183 (= condMapEmpty!57466 (= (arr!44055 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17688)) mapDefault!57466)))))

(declare-fun mapIsEmpty!57466 () Bool)

(assert (=> mapIsEmpty!57466 mapRes!57466))

(declare-fun b!1341184 () Bool)

(declare-fun res!889738 () Bool)

(assert (=> b!1341184 (=> (not res!889738) (not e!763774))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341184 (= res!889738 (validKeyInArray!0 (select (arr!44056 _keys!1571) from!1960)))))

(declare-fun b!1341185 () Bool)

(declare-fun res!889736 () Bool)

(assert (=> b!1341185 (=> (not res!889736) (not e!763774))))

(declare-fun minValue!1245 () V!54667)

(declare-fun zeroValue!1245 () V!54667)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24026 0))(
  ( (tuple2!24027 (_1!12024 (_ BitVec 64)) (_2!12024 V!54667)) )
))
(declare-datatypes ((List!31187 0))(
  ( (Nil!31184) (Cons!31183 (h!32392 tuple2!24026) (t!45571 List!31187)) )
))
(declare-datatypes ((ListLongMap!21683 0))(
  ( (ListLongMap!21684 (toList!10857 List!31187)) )
))
(declare-fun contains!9033 (ListLongMap!21683 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5822 (array!91200 array!91198 (_ BitVec 32) (_ BitVec 32) V!54667 V!54667 (_ BitVec 32) Int) ListLongMap!21683)

(assert (=> b!1341185 (= res!889736 (contains!9033 (getCurrentListMap!5822 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1341186 () Bool)

(assert (=> b!1341186 (= e!763777 tp_is_empty!37173)))

(declare-fun b!1341187 () Bool)

(assert (=> b!1341187 (= e!763778 tp_is_empty!37173)))

(declare-fun b!1341188 () Bool)

(declare-fun res!889735 () Bool)

(assert (=> b!1341188 (=> (not res!889735) (not e!763774))))

(assert (=> b!1341188 (= res!889735 (and (= (size!44605 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44606 _keys!1571) (size!44605 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1341189 () Bool)

(declare-fun res!889740 () Bool)

(assert (=> b!1341189 (=> (not res!889740) (not e!763774))))

(assert (=> b!1341189 (= res!889740 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44606 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1341190 () Bool)

(declare-fun res!889734 () Bool)

(assert (=> b!1341190 (=> (not res!889734) (not e!763774))))

(assert (=> b!1341190 (= res!889734 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1341191 () Bool)

(assert (=> b!1341191 (= e!763774 (not true))))

(declare-fun lt!594105 () ListLongMap!21683)

(assert (=> b!1341191 (contains!9033 lt!594105 k0!1142)))

(declare-datatypes ((Unit!44019 0))(
  ( (Unit!44020) )
))
(declare-fun lt!594104 () Unit!44019)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!340 ((_ BitVec 64) (_ BitVec 64) V!54667 ListLongMap!21683) Unit!44019)

(assert (=> b!1341191 (= lt!594104 (lemmaInListMapAfterAddingDiffThenInBefore!340 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594105))))

(declare-fun +!4771 (ListLongMap!21683 tuple2!24026) ListLongMap!21683)

(declare-fun getCurrentListMapNoExtraKeys!6413 (array!91200 array!91198 (_ BitVec 32) (_ BitVec 32) V!54667 V!54667 (_ BitVec 32) Int) ListLongMap!21683)

(declare-fun get!22234 (ValueCell!17688 V!54667) V!54667)

(declare-fun dynLambda!3710 (Int (_ BitVec 64)) V!54667)

(assert (=> b!1341191 (= lt!594105 (+!4771 (getCurrentListMapNoExtraKeys!6413 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24027 (select (arr!44056 _keys!1571) from!1960) (get!22234 (select (arr!44055 _values!1303) from!1960) (dynLambda!3710 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1341192 () Bool)

(declare-fun res!889739 () Bool)

(assert (=> b!1341192 (=> (not res!889739) (not e!763774))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91200 (_ BitVec 32)) Bool)

(assert (=> b!1341192 (= res!889739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(assert (= (and start!113122 res!889733) b!1341188))

(assert (= (and b!1341188 res!889735) b!1341192))

(assert (= (and b!1341192 res!889739) b!1341182))

(assert (= (and b!1341182 res!889732) b!1341189))

(assert (= (and b!1341189 res!889740) b!1341185))

(assert (= (and b!1341185 res!889736) b!1341181))

(assert (= (and b!1341181 res!889737) b!1341184))

(assert (= (and b!1341184 res!889738) b!1341190))

(assert (= (and b!1341190 res!889734) b!1341191))

(assert (= (and b!1341183 condMapEmpty!57466) mapIsEmpty!57466))

(assert (= (and b!1341183 (not condMapEmpty!57466)) mapNonEmpty!57466))

(get-info :version)

(assert (= (and mapNonEmpty!57466 ((_ is ValueCellFull!17688) mapValue!57466)) b!1341186))

(assert (= (and b!1341183 ((_ is ValueCellFull!17688) mapDefault!57466)) b!1341187))

(assert (= start!113122 b!1341183))

(declare-fun b_lambda!24349 () Bool)

(assert (=> (not b_lambda!24349) (not b!1341191)))

(declare-fun t!45569 () Bool)

(declare-fun tb!12187 () Bool)

(assert (=> (and start!113122 (= defaultEntry!1306 defaultEntry!1306) t!45569) tb!12187))

(declare-fun result!25465 () Bool)

(assert (=> tb!12187 (= result!25465 tp_is_empty!37173)))

(assert (=> b!1341191 t!45569))

(declare-fun b_and!50255 () Bool)

(assert (= b_and!50253 (and (=> t!45569 result!25465) b_and!50255)))

(declare-fun m!1228859 () Bool)

(assert (=> b!1341192 m!1228859))

(declare-fun m!1228861 () Bool)

(assert (=> b!1341191 m!1228861))

(declare-fun m!1228863 () Bool)

(assert (=> b!1341191 m!1228863))

(declare-fun m!1228865 () Bool)

(assert (=> b!1341191 m!1228865))

(declare-fun m!1228867 () Bool)

(assert (=> b!1341191 m!1228867))

(assert (=> b!1341191 m!1228861))

(declare-fun m!1228869 () Bool)

(assert (=> b!1341191 m!1228869))

(assert (=> b!1341191 m!1228863))

(assert (=> b!1341191 m!1228865))

(declare-fun m!1228871 () Bool)

(assert (=> b!1341191 m!1228871))

(declare-fun m!1228873 () Bool)

(assert (=> b!1341191 m!1228873))

(declare-fun m!1228875 () Bool)

(assert (=> b!1341191 m!1228875))

(declare-fun m!1228877 () Bool)

(assert (=> start!113122 m!1228877))

(declare-fun m!1228879 () Bool)

(assert (=> start!113122 m!1228879))

(declare-fun m!1228881 () Bool)

(assert (=> start!113122 m!1228881))

(assert (=> b!1341184 m!1228875))

(assert (=> b!1341184 m!1228875))

(declare-fun m!1228883 () Bool)

(assert (=> b!1341184 m!1228883))

(declare-fun m!1228885 () Bool)

(assert (=> b!1341182 m!1228885))

(declare-fun m!1228887 () Bool)

(assert (=> mapNonEmpty!57466 m!1228887))

(assert (=> b!1341181 m!1228875))

(declare-fun m!1228889 () Bool)

(assert (=> b!1341185 m!1228889))

(assert (=> b!1341185 m!1228889))

(declare-fun m!1228891 () Bool)

(assert (=> b!1341185 m!1228891))

(check-sat b_and!50255 (not b!1341185) tp_is_empty!37173 (not b_next!31173) (not mapNonEmpty!57466) (not b!1341182) (not b!1341192) (not b!1341184) (not start!113122) (not b!1341191) (not b_lambda!24349))
(check-sat b_and!50255 (not b_next!31173))
