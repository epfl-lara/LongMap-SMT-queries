; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113164 () Bool)

(assert start!113164)

(declare-fun b_free!31215 () Bool)

(declare-fun b_next!31215 () Bool)

(assert (=> start!113164 (= b_free!31215 (not b_next!31215))))

(declare-fun tp!109450 () Bool)

(declare-fun b_and!50337 () Bool)

(assert (=> start!113164 (= tp!109450 b_and!50337)))

(declare-fun b!1341979 () Bool)

(declare-fun e!764093 () Bool)

(declare-fun tp_is_empty!37215 () Bool)

(assert (=> b!1341979 (= e!764093 tp_is_empty!37215)))

(declare-fun mapIsEmpty!57529 () Bool)

(declare-fun mapRes!57529 () Bool)

(assert (=> mapIsEmpty!57529 mapRes!57529))

(declare-fun b!1341980 () Bool)

(declare-fun res!890300 () Bool)

(declare-fun e!764092 () Bool)

(assert (=> b!1341980 (=> (not res!890300) (not e!764092))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91282 0))(
  ( (array!91283 (arr!44097 (Array (_ BitVec 32) (_ BitVec 64))) (size!44647 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91282)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1341980 (= res!890300 (not (= (select (arr!44097 _keys!1571) from!1960) k0!1142)))))

(declare-fun mapNonEmpty!57529 () Bool)

(declare-fun tp!109449 () Bool)

(declare-fun e!764091 () Bool)

(assert (=> mapNonEmpty!57529 (= mapRes!57529 (and tp!109449 e!764091))))

(declare-datatypes ((V!54723 0))(
  ( (V!54724 (val!18682 Int)) )
))
(declare-datatypes ((ValueCell!17709 0))(
  ( (ValueCellFull!17709 (v!21330 V!54723)) (EmptyCell!17709) )
))
(declare-fun mapValue!57529 () ValueCell!17709)

(declare-fun mapRest!57529 () (Array (_ BitVec 32) ValueCell!17709))

(declare-fun mapKey!57529 () (_ BitVec 32))

(declare-datatypes ((array!91284 0))(
  ( (array!91285 (arr!44098 (Array (_ BitVec 32) ValueCell!17709)) (size!44648 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91284)

(assert (=> mapNonEmpty!57529 (= (arr!44098 _values!1303) (store mapRest!57529 mapKey!57529 mapValue!57529))))

(declare-fun b!1341981 () Bool)

(declare-fun res!890307 () Bool)

(assert (=> b!1341981 (=> (not res!890307) (not e!764092))))

(declare-fun minValue!1245 () V!54723)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!54723)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24062 0))(
  ( (tuple2!24063 (_1!12042 (_ BitVec 64)) (_2!12042 V!54723)) )
))
(declare-datatypes ((List!31218 0))(
  ( (Nil!31215) (Cons!31214 (h!32423 tuple2!24062) (t!45644 List!31218)) )
))
(declare-datatypes ((ListLongMap!21719 0))(
  ( (ListLongMap!21720 (toList!10875 List!31218)) )
))
(declare-fun contains!9051 (ListLongMap!21719 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5839 (array!91282 array!91284 (_ BitVec 32) (_ BitVec 32) V!54723 V!54723 (_ BitVec 32) Int) ListLongMap!21719)

(assert (=> b!1341981 (= res!890307 (contains!9051 (getCurrentListMap!5839 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1341983 () Bool)

(declare-fun e!764089 () Bool)

(assert (=> b!1341983 (= e!764089 (and e!764093 mapRes!57529))))

(declare-fun condMapEmpty!57529 () Bool)

(declare-fun mapDefault!57529 () ValueCell!17709)

(assert (=> b!1341983 (= condMapEmpty!57529 (= (arr!44098 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17709)) mapDefault!57529)))))

(declare-fun b!1341984 () Bool)

(assert (=> b!1341984 (= e!764092 (not true))))

(declare-fun lt!594302 () ListLongMap!21719)

(assert (=> b!1341984 (contains!9051 lt!594302 k0!1142)))

(declare-fun lt!594303 () V!54723)

(declare-datatypes ((Unit!44051 0))(
  ( (Unit!44052) )
))
(declare-fun lt!594301 () Unit!44051)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!356 ((_ BitVec 64) (_ BitVec 64) V!54723 ListLongMap!21719) Unit!44051)

(assert (=> b!1341984 (= lt!594301 (lemmaInListMapAfterAddingDiffThenInBefore!356 k0!1142 (select (arr!44097 _keys!1571) from!1960) lt!594303 lt!594302))))

(declare-fun lt!594299 () ListLongMap!21719)

(assert (=> b!1341984 (contains!9051 lt!594299 k0!1142)))

(declare-fun lt!594300 () Unit!44051)

(assert (=> b!1341984 (= lt!594300 (lemmaInListMapAfterAddingDiffThenInBefore!356 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594299))))

(declare-fun +!4787 (ListLongMap!21719 tuple2!24062) ListLongMap!21719)

(assert (=> b!1341984 (= lt!594299 (+!4787 lt!594302 (tuple2!24063 (select (arr!44097 _keys!1571) from!1960) lt!594303)))))

(declare-fun get!22264 (ValueCell!17709 V!54723) V!54723)

(declare-fun dynLambda!3726 (Int (_ BitVec 64)) V!54723)

(assert (=> b!1341984 (= lt!594303 (get!22264 (select (arr!44098 _values!1303) from!1960) (dynLambda!3726 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6429 (array!91282 array!91284 (_ BitVec 32) (_ BitVec 32) V!54723 V!54723 (_ BitVec 32) Int) ListLongMap!21719)

(assert (=> b!1341984 (= lt!594302 (getCurrentListMapNoExtraKeys!6429 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1341985 () Bool)

(declare-fun res!890304 () Bool)

(assert (=> b!1341985 (=> (not res!890304) (not e!764092))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341985 (= res!890304 (validKeyInArray!0 (select (arr!44097 _keys!1571) from!1960)))))

(declare-fun b!1341986 () Bool)

(assert (=> b!1341986 (= e!764091 tp_is_empty!37215)))

(declare-fun b!1341987 () Bool)

(declare-fun res!890306 () Bool)

(assert (=> b!1341987 (=> (not res!890306) (not e!764092))))

(assert (=> b!1341987 (= res!890306 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1341988 () Bool)

(declare-fun res!890299 () Bool)

(assert (=> b!1341988 (=> (not res!890299) (not e!764092))))

(assert (=> b!1341988 (= res!890299 (and (= (size!44648 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44647 _keys!1571) (size!44648 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!890302 () Bool)

(assert (=> start!113164 (=> (not res!890302) (not e!764092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113164 (= res!890302 (validMask!0 mask!1977))))

(assert (=> start!113164 e!764092))

(assert (=> start!113164 tp_is_empty!37215))

(assert (=> start!113164 true))

(declare-fun array_inv!33241 (array!91282) Bool)

(assert (=> start!113164 (array_inv!33241 _keys!1571)))

(declare-fun array_inv!33242 (array!91284) Bool)

(assert (=> start!113164 (and (array_inv!33242 _values!1303) e!764089)))

(assert (=> start!113164 tp!109450))

(declare-fun b!1341982 () Bool)

(declare-fun res!890303 () Bool)

(assert (=> b!1341982 (=> (not res!890303) (not e!764092))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91282 (_ BitVec 32)) Bool)

(assert (=> b!1341982 (= res!890303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1341989 () Bool)

(declare-fun res!890301 () Bool)

(assert (=> b!1341989 (=> (not res!890301) (not e!764092))))

(declare-datatypes ((List!31219 0))(
  ( (Nil!31216) (Cons!31215 (h!32424 (_ BitVec 64)) (t!45645 List!31219)) )
))
(declare-fun arrayNoDuplicates!0 (array!91282 (_ BitVec 32) List!31219) Bool)

(assert (=> b!1341989 (= res!890301 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31216))))

(declare-fun b!1341990 () Bool)

(declare-fun res!890305 () Bool)

(assert (=> b!1341990 (=> (not res!890305) (not e!764092))))

(assert (=> b!1341990 (= res!890305 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44647 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!113164 res!890302) b!1341988))

(assert (= (and b!1341988 res!890299) b!1341982))

(assert (= (and b!1341982 res!890303) b!1341989))

(assert (= (and b!1341989 res!890301) b!1341990))

(assert (= (and b!1341990 res!890305) b!1341981))

(assert (= (and b!1341981 res!890307) b!1341980))

(assert (= (and b!1341980 res!890300) b!1341985))

(assert (= (and b!1341985 res!890304) b!1341987))

(assert (= (and b!1341987 res!890306) b!1341984))

(assert (= (and b!1341983 condMapEmpty!57529) mapIsEmpty!57529))

(assert (= (and b!1341983 (not condMapEmpty!57529)) mapNonEmpty!57529))

(get-info :version)

(assert (= (and mapNonEmpty!57529 ((_ is ValueCellFull!17709) mapValue!57529)) b!1341986))

(assert (= (and b!1341983 ((_ is ValueCellFull!17709) mapDefault!57529)) b!1341979))

(assert (= start!113164 b!1341983))

(declare-fun b_lambda!24391 () Bool)

(assert (=> (not b_lambda!24391) (not b!1341984)))

(declare-fun t!45643 () Bool)

(declare-fun tb!12229 () Bool)

(assert (=> (and start!113164 (= defaultEntry!1306 defaultEntry!1306) t!45643) tb!12229))

(declare-fun result!25549 () Bool)

(assert (=> tb!12229 (= result!25549 tp_is_empty!37215)))

(assert (=> b!1341984 t!45643))

(declare-fun b_and!50339 () Bool)

(assert (= b_and!50337 (and (=> t!45643 result!25549) b_and!50339)))

(declare-fun m!1229601 () Bool)

(assert (=> mapNonEmpty!57529 m!1229601))

(declare-fun m!1229603 () Bool)

(assert (=> b!1341981 m!1229603))

(assert (=> b!1341981 m!1229603))

(declare-fun m!1229605 () Bool)

(assert (=> b!1341981 m!1229605))

(declare-fun m!1229607 () Bool)

(assert (=> b!1341985 m!1229607))

(assert (=> b!1341985 m!1229607))

(declare-fun m!1229609 () Bool)

(assert (=> b!1341985 m!1229609))

(declare-fun m!1229611 () Bool)

(assert (=> b!1341989 m!1229611))

(declare-fun m!1229613 () Bool)

(assert (=> start!113164 m!1229613))

(declare-fun m!1229615 () Bool)

(assert (=> start!113164 m!1229615))

(declare-fun m!1229617 () Bool)

(assert (=> start!113164 m!1229617))

(declare-fun m!1229619 () Bool)

(assert (=> b!1341982 m!1229619))

(declare-fun m!1229621 () Bool)

(assert (=> b!1341984 m!1229621))

(declare-fun m!1229623 () Bool)

(assert (=> b!1341984 m!1229623))

(declare-fun m!1229625 () Bool)

(assert (=> b!1341984 m!1229625))

(declare-fun m!1229627 () Bool)

(assert (=> b!1341984 m!1229627))

(assert (=> b!1341984 m!1229607))

(declare-fun m!1229629 () Bool)

(assert (=> b!1341984 m!1229629))

(assert (=> b!1341984 m!1229623))

(declare-fun m!1229631 () Bool)

(assert (=> b!1341984 m!1229631))

(assert (=> b!1341984 m!1229625))

(assert (=> b!1341984 m!1229607))

(declare-fun m!1229633 () Bool)

(assert (=> b!1341984 m!1229633))

(declare-fun m!1229635 () Bool)

(assert (=> b!1341984 m!1229635))

(declare-fun m!1229637 () Bool)

(assert (=> b!1341984 m!1229637))

(assert (=> b!1341980 m!1229607))

(check-sat (not b!1341982) (not b!1341989) (not b!1341984) (not b_lambda!24391) (not b!1341985) (not start!113164) b_and!50339 tp_is_empty!37215 (not b!1341981) (not b_next!31215) (not mapNonEmpty!57529))
(check-sat b_and!50339 (not b_next!31215))
