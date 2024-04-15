; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113192 () Bool)

(assert start!113192)

(declare-fun b_free!31243 () Bool)

(declare-fun b_next!31243 () Bool)

(assert (=> start!113192 (= b_free!31243 (not b_next!31243))))

(declare-fun tp!109535 () Bool)

(declare-fun b_and!50375 () Bool)

(assert (=> start!113192 (= tp!109535 b_and!50375)))

(declare-fun b!1342441 () Bool)

(declare-fun res!890652 () Bool)

(declare-fun e!764270 () Bool)

(assert (=> b!1342441 (=> (not res!890652) (not e!764270))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91277 0))(
  ( (array!91278 (arr!44095 (Array (_ BitVec 32) (_ BitVec 64))) (size!44647 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91277)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1342441 (= res!890652 (not (= (select (arr!44095 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1342442 () Bool)

(declare-fun res!890651 () Bool)

(assert (=> b!1342442 (=> (not res!890651) (not e!764270))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1342442 (= res!890651 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44647 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1342443 () Bool)

(declare-fun e!764269 () Bool)

(declare-fun tp_is_empty!37243 () Bool)

(assert (=> b!1342443 (= e!764269 tp_is_empty!37243)))

(declare-fun b!1342444 () Bool)

(declare-fun res!890649 () Bool)

(assert (=> b!1342444 (=> (not res!890649) (not e!764270))))

(assert (=> b!1342444 (= res!890649 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!57571 () Bool)

(declare-fun mapRes!57571 () Bool)

(assert (=> mapIsEmpty!57571 mapRes!57571))

(declare-fun b!1342445 () Bool)

(declare-fun res!890648 () Bool)

(assert (=> b!1342445 (=> (not res!890648) (not e!764270))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91277 (_ BitVec 32)) Bool)

(assert (=> b!1342445 (= res!890648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1342446 () Bool)

(declare-fun res!890650 () Bool)

(assert (=> b!1342446 (=> (not res!890650) (not e!764270))))

(declare-datatypes ((List!31285 0))(
  ( (Nil!31282) (Cons!31281 (h!32490 (_ BitVec 64)) (t!45731 List!31285)) )
))
(declare-fun arrayNoDuplicates!0 (array!91277 (_ BitVec 32) List!31285) Bool)

(assert (=> b!1342446 (= res!890650 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31282))))

(declare-fun res!890654 () Bool)

(assert (=> start!113192 (=> (not res!890654) (not e!764270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113192 (= res!890654 (validMask!0 mask!1977))))

(assert (=> start!113192 e!764270))

(assert (=> start!113192 tp_is_empty!37243))

(assert (=> start!113192 true))

(declare-fun array_inv!33433 (array!91277) Bool)

(assert (=> start!113192 (array_inv!33433 _keys!1571)))

(declare-datatypes ((V!54761 0))(
  ( (V!54762 (val!18696 Int)) )
))
(declare-datatypes ((ValueCell!17723 0))(
  ( (ValueCellFull!17723 (v!21343 V!54761)) (EmptyCell!17723) )
))
(declare-datatypes ((array!91279 0))(
  ( (array!91280 (arr!44096 (Array (_ BitVec 32) ValueCell!17723)) (size!44648 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91279)

(declare-fun e!764267 () Bool)

(declare-fun array_inv!33434 (array!91279) Bool)

(assert (=> start!113192 (and (array_inv!33434 _values!1303) e!764267)))

(assert (=> start!113192 tp!109535))

(declare-fun b!1342447 () Bool)

(declare-fun res!890653 () Bool)

(assert (=> b!1342447 (=> (not res!890653) (not e!764270))))

(declare-fun minValue!1245 () V!54761)

(declare-fun zeroValue!1245 () V!54761)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24140 0))(
  ( (tuple2!24141 (_1!12081 (_ BitVec 64)) (_2!12081 V!54761)) )
))
(declare-datatypes ((List!31286 0))(
  ( (Nil!31283) (Cons!31282 (h!32491 tuple2!24140) (t!45732 List!31286)) )
))
(declare-datatypes ((ListLongMap!21797 0))(
  ( (ListLongMap!21798 (toList!10914 List!31286)) )
))
(declare-fun contains!9019 (ListLongMap!21797 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5765 (array!91277 array!91279 (_ BitVec 32) (_ BitVec 32) V!54761 V!54761 (_ BitVec 32) Int) ListLongMap!21797)

(assert (=> b!1342447 (= res!890653 (contains!9019 (getCurrentListMap!5765 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1342448 () Bool)

(declare-fun e!764268 () Bool)

(assert (=> b!1342448 (= e!764267 (and e!764268 mapRes!57571))))

(declare-fun condMapEmpty!57571 () Bool)

(declare-fun mapDefault!57571 () ValueCell!17723)

(assert (=> b!1342448 (= condMapEmpty!57571 (= (arr!44096 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17723)) mapDefault!57571)))))

(declare-fun b!1342449 () Bool)

(assert (=> b!1342449 (= e!764270 (not true))))

(declare-fun lt!594326 () ListLongMap!21797)

(assert (=> b!1342449 (contains!9019 lt!594326 k0!1142)))

(declare-fun lt!594327 () V!54761)

(declare-datatypes ((Unit!43876 0))(
  ( (Unit!43877) )
))
(declare-fun lt!594325 () Unit!43876)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!356 ((_ BitVec 64) (_ BitVec 64) V!54761 ListLongMap!21797) Unit!43876)

(assert (=> b!1342449 (= lt!594325 (lemmaInListMapAfterAddingDiffThenInBefore!356 k0!1142 (select (arr!44095 _keys!1571) from!1960) lt!594327 lt!594326))))

(declare-fun lt!594324 () ListLongMap!21797)

(assert (=> b!1342449 (contains!9019 lt!594324 k0!1142)))

(declare-fun lt!594323 () Unit!43876)

(assert (=> b!1342449 (= lt!594323 (lemmaInListMapAfterAddingDiffThenInBefore!356 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594324))))

(declare-fun +!4817 (ListLongMap!21797 tuple2!24140) ListLongMap!21797)

(assert (=> b!1342449 (= lt!594324 (+!4817 lt!594326 (tuple2!24141 (select (arr!44095 _keys!1571) from!1960) lt!594327)))))

(declare-fun get!22271 (ValueCell!17723 V!54761) V!54761)

(declare-fun dynLambda!3747 (Int (_ BitVec 64)) V!54761)

(assert (=> b!1342449 (= lt!594327 (get!22271 (select (arr!44096 _values!1303) from!1960) (dynLambda!3747 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6460 (array!91277 array!91279 (_ BitVec 32) (_ BitVec 32) V!54761 V!54761 (_ BitVec 32) Int) ListLongMap!21797)

(assert (=> b!1342449 (= lt!594326 (getCurrentListMapNoExtraKeys!6460 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1342450 () Bool)

(declare-fun res!890655 () Bool)

(assert (=> b!1342450 (=> (not res!890655) (not e!764270))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342450 (= res!890655 (validKeyInArray!0 (select (arr!44095 _keys!1571) from!1960)))))

(declare-fun b!1342451 () Bool)

(assert (=> b!1342451 (= e!764268 tp_is_empty!37243)))

(declare-fun b!1342452 () Bool)

(declare-fun res!890656 () Bool)

(assert (=> b!1342452 (=> (not res!890656) (not e!764270))))

(assert (=> b!1342452 (= res!890656 (and (= (size!44648 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44647 _keys!1571) (size!44648 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57571 () Bool)

(declare-fun tp!109534 () Bool)

(assert (=> mapNonEmpty!57571 (= mapRes!57571 (and tp!109534 e!764269))))

(declare-fun mapValue!57571 () ValueCell!17723)

(declare-fun mapRest!57571 () (Array (_ BitVec 32) ValueCell!17723))

(declare-fun mapKey!57571 () (_ BitVec 32))

(assert (=> mapNonEmpty!57571 (= (arr!44096 _values!1303) (store mapRest!57571 mapKey!57571 mapValue!57571))))

(assert (= (and start!113192 res!890654) b!1342452))

(assert (= (and b!1342452 res!890656) b!1342445))

(assert (= (and b!1342445 res!890648) b!1342446))

(assert (= (and b!1342446 res!890650) b!1342442))

(assert (= (and b!1342442 res!890651) b!1342447))

(assert (= (and b!1342447 res!890653) b!1342441))

(assert (= (and b!1342441 res!890652) b!1342450))

(assert (= (and b!1342450 res!890655) b!1342444))

(assert (= (and b!1342444 res!890649) b!1342449))

(assert (= (and b!1342448 condMapEmpty!57571) mapIsEmpty!57571))

(assert (= (and b!1342448 (not condMapEmpty!57571)) mapNonEmpty!57571))

(get-info :version)

(assert (= (and mapNonEmpty!57571 ((_ is ValueCellFull!17723) mapValue!57571)) b!1342443))

(assert (= (and b!1342448 ((_ is ValueCellFull!17723) mapDefault!57571)) b!1342451))

(assert (= start!113192 b!1342448))

(declare-fun b_lambda!24409 () Bool)

(assert (=> (not b_lambda!24409) (not b!1342449)))

(declare-fun t!45730 () Bool)

(declare-fun tb!12249 () Bool)

(assert (=> (and start!113192 (= defaultEntry!1306 defaultEntry!1306) t!45730) tb!12249))

(declare-fun result!25597 () Bool)

(assert (=> tb!12249 (= result!25597 tp_is_empty!37243)))

(assert (=> b!1342449 t!45730))

(declare-fun b_and!50377 () Bool)

(assert (= b_and!50375 (and (=> t!45730 result!25597) b_and!50377)))

(declare-fun m!1229617 () Bool)

(assert (=> mapNonEmpty!57571 m!1229617))

(declare-fun m!1229619 () Bool)

(assert (=> b!1342446 m!1229619))

(declare-fun m!1229621 () Bool)

(assert (=> b!1342449 m!1229621))

(declare-fun m!1229623 () Bool)

(assert (=> b!1342449 m!1229623))

(declare-fun m!1229625 () Bool)

(assert (=> b!1342449 m!1229625))

(declare-fun m!1229627 () Bool)

(assert (=> b!1342449 m!1229627))

(assert (=> b!1342449 m!1229623))

(declare-fun m!1229629 () Bool)

(assert (=> b!1342449 m!1229629))

(assert (=> b!1342449 m!1229625))

(declare-fun m!1229631 () Bool)

(assert (=> b!1342449 m!1229631))

(declare-fun m!1229633 () Bool)

(assert (=> b!1342449 m!1229633))

(declare-fun m!1229635 () Bool)

(assert (=> b!1342449 m!1229635))

(declare-fun m!1229637 () Bool)

(assert (=> b!1342449 m!1229637))

(assert (=> b!1342449 m!1229631))

(declare-fun m!1229639 () Bool)

(assert (=> b!1342449 m!1229639))

(assert (=> b!1342450 m!1229631))

(assert (=> b!1342450 m!1229631))

(declare-fun m!1229641 () Bool)

(assert (=> b!1342450 m!1229641))

(declare-fun m!1229643 () Bool)

(assert (=> b!1342447 m!1229643))

(assert (=> b!1342447 m!1229643))

(declare-fun m!1229645 () Bool)

(assert (=> b!1342447 m!1229645))

(declare-fun m!1229647 () Bool)

(assert (=> b!1342445 m!1229647))

(declare-fun m!1229649 () Bool)

(assert (=> start!113192 m!1229649))

(declare-fun m!1229651 () Bool)

(assert (=> start!113192 m!1229651))

(declare-fun m!1229653 () Bool)

(assert (=> start!113192 m!1229653))

(assert (=> b!1342441 m!1229631))

(check-sat (not start!113192) b_and!50377 (not b_lambda!24409) (not b!1342446) (not b_next!31243) tp_is_empty!37243 (not b!1342449) (not b!1342445) (not b!1342450) (not mapNonEmpty!57571) (not b!1342447))
(check-sat b_and!50377 (not b_next!31243))
