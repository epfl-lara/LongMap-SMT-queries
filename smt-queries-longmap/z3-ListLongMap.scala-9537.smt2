; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113086 () Bool)

(assert start!113086)

(declare-fun b_free!31137 () Bool)

(declare-fun b_next!31137 () Bool)

(assert (=> start!113086 (= b_free!31137 (not b_next!31137))))

(declare-fun tp!109216 () Bool)

(declare-fun b_and!50181 () Bool)

(assert (=> start!113086 (= tp!109216 b_and!50181)))

(declare-fun b!1340497 () Bool)

(declare-fun res!889250 () Bool)

(declare-fun e!763505 () Bool)

(assert (=> b!1340497 (=> (not res!889250) (not e!763505))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91126 0))(
  ( (array!91127 (arr!44019 (Array (_ BitVec 32) (_ BitVec 64))) (size!44569 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91126)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1340497 (= res!889250 (not (= (select (arr!44019 _keys!1571) from!1960) k0!1142)))))

(declare-fun mapIsEmpty!57412 () Bool)

(declare-fun mapRes!57412 () Bool)

(assert (=> mapIsEmpty!57412 mapRes!57412))

(declare-fun b!1340498 () Bool)

(assert (=> b!1340498 (= e!763505 (not true))))

(declare-datatypes ((V!54619 0))(
  ( (V!54620 (val!18643 Int)) )
))
(declare-datatypes ((tuple2!23994 0))(
  ( (tuple2!23995 (_1!12008 (_ BitVec 64)) (_2!12008 V!54619)) )
))
(declare-datatypes ((List!31157 0))(
  ( (Nil!31154) (Cons!31153 (h!32362 tuple2!23994) (t!45505 List!31157)) )
))
(declare-datatypes ((ListLongMap!21651 0))(
  ( (ListLongMap!21652 (toList!10841 List!31157)) )
))
(declare-fun lt!593996 () ListLongMap!21651)

(declare-fun contains!9017 (ListLongMap!21651 (_ BitVec 64)) Bool)

(assert (=> b!1340498 (contains!9017 lt!593996 k0!1142)))

(declare-fun zeroValue!1245 () V!54619)

(declare-datatypes ((Unit!43993 0))(
  ( (Unit!43994) )
))
(declare-fun lt!593997 () Unit!43993)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!327 ((_ BitVec 64) (_ BitVec 64) V!54619 ListLongMap!21651) Unit!43993)

(assert (=> b!1340498 (= lt!593997 (lemmaInListMapAfterAddingDiffThenInBefore!327 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!593996))))

(declare-fun minValue!1245 () V!54619)

(declare-fun defaultEntry!1306 () Int)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17670 0))(
  ( (ValueCellFull!17670 (v!21291 V!54619)) (EmptyCell!17670) )
))
(declare-datatypes ((array!91128 0))(
  ( (array!91129 (arr!44020 (Array (_ BitVec 32) ValueCell!17670)) (size!44570 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91128)

(declare-fun +!4758 (ListLongMap!21651 tuple2!23994) ListLongMap!21651)

(declare-fun getCurrentListMapNoExtraKeys!6400 (array!91126 array!91128 (_ BitVec 32) (_ BitVec 32) V!54619 V!54619 (_ BitVec 32) Int) ListLongMap!21651)

(declare-fun get!22209 (ValueCell!17670 V!54619) V!54619)

(declare-fun dynLambda!3697 (Int (_ BitVec 64)) V!54619)

(assert (=> b!1340498 (= lt!593996 (+!4758 (getCurrentListMapNoExtraKeys!6400 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!23995 (select (arr!44019 _keys!1571) from!1960) (get!22209 (select (arr!44020 _values!1303) from!1960) (dynLambda!3697 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1340499 () Bool)

(declare-fun res!889249 () Bool)

(assert (=> b!1340499 (=> (not res!889249) (not e!763505))))

(assert (=> b!1340499 (= res!889249 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!57412 () Bool)

(declare-fun tp!109215 () Bool)

(declare-fun e!763507 () Bool)

(assert (=> mapNonEmpty!57412 (= mapRes!57412 (and tp!109215 e!763507))))

(declare-fun mapValue!57412 () ValueCell!17670)

(declare-fun mapKey!57412 () (_ BitVec 32))

(declare-fun mapRest!57412 () (Array (_ BitVec 32) ValueCell!17670))

(assert (=> mapNonEmpty!57412 (= (arr!44020 _values!1303) (store mapRest!57412 mapKey!57412 mapValue!57412))))

(declare-fun b!1340500 () Bool)

(declare-fun res!889248 () Bool)

(assert (=> b!1340500 (=> (not res!889248) (not e!763505))))

(assert (=> b!1340500 (= res!889248 (and (= (size!44570 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44569 _keys!1571) (size!44570 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1340501 () Bool)

(declare-fun res!889254 () Bool)

(assert (=> b!1340501 (=> (not res!889254) (not e!763505))))

(declare-fun getCurrentListMap!5809 (array!91126 array!91128 (_ BitVec 32) (_ BitVec 32) V!54619 V!54619 (_ BitVec 32) Int) ListLongMap!21651)

(assert (=> b!1340501 (= res!889254 (contains!9017 (getCurrentListMap!5809 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1340502 () Bool)

(declare-fun e!763508 () Bool)

(declare-fun e!763504 () Bool)

(assert (=> b!1340502 (= e!763508 (and e!763504 mapRes!57412))))

(declare-fun condMapEmpty!57412 () Bool)

(declare-fun mapDefault!57412 () ValueCell!17670)

(assert (=> b!1340502 (= condMapEmpty!57412 (= (arr!44020 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17670)) mapDefault!57412)))))

(declare-fun b!1340503 () Bool)

(declare-fun tp_is_empty!37137 () Bool)

(assert (=> b!1340503 (= e!763507 tp_is_empty!37137)))

(declare-fun res!889247 () Bool)

(assert (=> start!113086 (=> (not res!889247) (not e!763505))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113086 (= res!889247 (validMask!0 mask!1977))))

(assert (=> start!113086 e!763505))

(assert (=> start!113086 tp_is_empty!37137))

(assert (=> start!113086 true))

(declare-fun array_inv!33189 (array!91126) Bool)

(assert (=> start!113086 (array_inv!33189 _keys!1571)))

(declare-fun array_inv!33190 (array!91128) Bool)

(assert (=> start!113086 (and (array_inv!33190 _values!1303) e!763508)))

(assert (=> start!113086 tp!109216))

(declare-fun b!1340504 () Bool)

(declare-fun res!889246 () Bool)

(assert (=> b!1340504 (=> (not res!889246) (not e!763505))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91126 (_ BitVec 32)) Bool)

(assert (=> b!1340504 (= res!889246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1340505 () Bool)

(assert (=> b!1340505 (= e!763504 tp_is_empty!37137)))

(declare-fun b!1340506 () Bool)

(declare-fun res!889251 () Bool)

(assert (=> b!1340506 (=> (not res!889251) (not e!763505))))

(declare-datatypes ((List!31158 0))(
  ( (Nil!31155) (Cons!31154 (h!32363 (_ BitVec 64)) (t!45506 List!31158)) )
))
(declare-fun arrayNoDuplicates!0 (array!91126 (_ BitVec 32) List!31158) Bool)

(assert (=> b!1340506 (= res!889251 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31155))))

(declare-fun b!1340507 () Bool)

(declare-fun res!889252 () Bool)

(assert (=> b!1340507 (=> (not res!889252) (not e!763505))))

(assert (=> b!1340507 (= res!889252 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44569 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1340508 () Bool)

(declare-fun res!889253 () Bool)

(assert (=> b!1340508 (=> (not res!889253) (not e!763505))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340508 (= res!889253 (validKeyInArray!0 (select (arr!44019 _keys!1571) from!1960)))))

(assert (= (and start!113086 res!889247) b!1340500))

(assert (= (and b!1340500 res!889248) b!1340504))

(assert (= (and b!1340504 res!889246) b!1340506))

(assert (= (and b!1340506 res!889251) b!1340507))

(assert (= (and b!1340507 res!889252) b!1340501))

(assert (= (and b!1340501 res!889254) b!1340497))

(assert (= (and b!1340497 res!889250) b!1340508))

(assert (= (and b!1340508 res!889253) b!1340499))

(assert (= (and b!1340499 res!889249) b!1340498))

(assert (= (and b!1340502 condMapEmpty!57412) mapIsEmpty!57412))

(assert (= (and b!1340502 (not condMapEmpty!57412)) mapNonEmpty!57412))

(get-info :version)

(assert (= (and mapNonEmpty!57412 ((_ is ValueCellFull!17670) mapValue!57412)) b!1340503))

(assert (= (and b!1340502 ((_ is ValueCellFull!17670) mapDefault!57412)) b!1340505))

(assert (= start!113086 b!1340502))

(declare-fun b_lambda!24313 () Bool)

(assert (=> (not b_lambda!24313) (not b!1340498)))

(declare-fun t!45504 () Bool)

(declare-fun tb!12151 () Bool)

(assert (=> (and start!113086 (= defaultEntry!1306 defaultEntry!1306) t!45504) tb!12151))

(declare-fun result!25393 () Bool)

(assert (=> tb!12151 (= result!25393 tp_is_empty!37137)))

(assert (=> b!1340498 t!45504))

(declare-fun b_and!50183 () Bool)

(assert (= b_and!50181 (and (=> t!45504 result!25393) b_and!50183)))

(declare-fun m!1228247 () Bool)

(assert (=> b!1340506 m!1228247))

(declare-fun m!1228249 () Bool)

(assert (=> mapNonEmpty!57412 m!1228249))

(declare-fun m!1228251 () Bool)

(assert (=> b!1340497 m!1228251))

(declare-fun m!1228253 () Bool)

(assert (=> b!1340504 m!1228253))

(declare-fun m!1228255 () Bool)

(assert (=> b!1340498 m!1228255))

(declare-fun m!1228257 () Bool)

(assert (=> b!1340498 m!1228257))

(declare-fun m!1228259 () Bool)

(assert (=> b!1340498 m!1228259))

(declare-fun m!1228261 () Bool)

(assert (=> b!1340498 m!1228261))

(declare-fun m!1228263 () Bool)

(assert (=> b!1340498 m!1228263))

(assert (=> b!1340498 m!1228257))

(declare-fun m!1228265 () Bool)

(assert (=> b!1340498 m!1228265))

(assert (=> b!1340498 m!1228259))

(assert (=> b!1340498 m!1228261))

(declare-fun m!1228267 () Bool)

(assert (=> b!1340498 m!1228267))

(assert (=> b!1340498 m!1228251))

(declare-fun m!1228269 () Bool)

(assert (=> b!1340501 m!1228269))

(assert (=> b!1340501 m!1228269))

(declare-fun m!1228271 () Bool)

(assert (=> b!1340501 m!1228271))

(assert (=> b!1340508 m!1228251))

(assert (=> b!1340508 m!1228251))

(declare-fun m!1228273 () Bool)

(assert (=> b!1340508 m!1228273))

(declare-fun m!1228275 () Bool)

(assert (=> start!113086 m!1228275))

(declare-fun m!1228277 () Bool)

(assert (=> start!113086 m!1228277))

(declare-fun m!1228279 () Bool)

(assert (=> start!113086 m!1228279))

(check-sat b_and!50183 tp_is_empty!37137 (not b!1340498) (not mapNonEmpty!57412) (not b!1340501) (not b!1340508) (not b!1340506) (not start!113086) (not b_next!31137) (not b!1340504) (not b_lambda!24313))
(check-sat b_and!50183 (not b_next!31137))
