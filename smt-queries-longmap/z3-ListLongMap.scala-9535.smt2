; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113296 () Bool)

(assert start!113296)

(declare-fun b_free!31123 () Bool)

(declare-fun b_next!31123 () Bool)

(assert (=> start!113296 (= b_free!31123 (not b_next!31123))))

(declare-fun tp!109174 () Bool)

(declare-fun b_and!50155 () Bool)

(assert (=> start!113296 (= tp!109174 b_and!50155)))

(declare-fun b!1341530 () Bool)

(declare-fun res!889578 () Bool)

(declare-fun e!764244 () Bool)

(assert (=> b!1341530 (=> (not res!889578) (not e!764244))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91221 0))(
  ( (array!91222 (arr!44062 (Array (_ BitVec 32) (_ BitVec 64))) (size!44613 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91221)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54601 0))(
  ( (V!54602 (val!18636 Int)) )
))
(declare-datatypes ((ValueCell!17663 0))(
  ( (ValueCellFull!17663 (v!21279 V!54601)) (EmptyCell!17663) )
))
(declare-datatypes ((array!91223 0))(
  ( (array!91224 (arr!44063 (Array (_ BitVec 32) ValueCell!17663)) (size!44614 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91223)

(assert (=> b!1341530 (= res!889578 (and (= (size!44614 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44613 _keys!1571) (size!44614 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1341531 () Bool)

(declare-fun res!889581 () Bool)

(assert (=> b!1341531 (=> (not res!889581) (not e!764244))))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341531 (= res!889581 (validKeyInArray!0 (select (arr!44062 _keys!1571) from!1960)))))

(declare-fun b!1341532 () Bool)

(declare-fun res!889580 () Bool)

(assert (=> b!1341532 (=> (not res!889580) (not e!764244))))

(declare-fun k0!1142 () (_ BitVec 64))

(assert (=> b!1341532 (= res!889580 (not (= (select (arr!44062 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1341533 () Bool)

(declare-fun res!889583 () Bool)

(assert (=> b!1341533 (=> (not res!889583) (not e!764244))))

(declare-datatypes ((List!31201 0))(
  ( (Nil!31198) (Cons!31197 (h!32415 (_ BitVec 64)) (t!45527 List!31201)) )
))
(declare-fun arrayNoDuplicates!0 (array!91221 (_ BitVec 32) List!31201) Bool)

(assert (=> b!1341533 (= res!889583 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31198))))

(declare-fun mapNonEmpty!57391 () Bool)

(declare-fun mapRes!57391 () Bool)

(declare-fun tp!109173 () Bool)

(declare-fun e!764242 () Bool)

(assert (=> mapNonEmpty!57391 (= mapRes!57391 (and tp!109173 e!764242))))

(declare-fun mapRest!57391 () (Array (_ BitVec 32) ValueCell!17663))

(declare-fun mapKey!57391 () (_ BitVec 32))

(declare-fun mapValue!57391 () ValueCell!17663)

(assert (=> mapNonEmpty!57391 (= (arr!44063 _values!1303) (store mapRest!57391 mapKey!57391 mapValue!57391))))

(declare-fun res!889576 () Bool)

(assert (=> start!113296 (=> (not res!889576) (not e!764244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113296 (= res!889576 (validMask!0 mask!1977))))

(assert (=> start!113296 e!764244))

(declare-fun tp_is_empty!37123 () Bool)

(assert (=> start!113296 tp_is_empty!37123))

(assert (=> start!113296 true))

(declare-fun array_inv!33485 (array!91221) Bool)

(assert (=> start!113296 (array_inv!33485 _keys!1571)))

(declare-fun e!764245 () Bool)

(declare-fun array_inv!33486 (array!91223) Bool)

(assert (=> start!113296 (and (array_inv!33486 _values!1303) e!764245)))

(assert (=> start!113296 tp!109174))

(declare-fun b!1341534 () Bool)

(declare-fun res!889582 () Bool)

(assert (=> b!1341534 (=> (not res!889582) (not e!764244))))

(assert (=> b!1341534 (= res!889582 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44613 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1341535 () Bool)

(declare-fun e!764243 () Bool)

(assert (=> b!1341535 (= e!764243 tp_is_empty!37123)))

(declare-fun b!1341536 () Bool)

(assert (=> b!1341536 (= e!764245 (and e!764243 mapRes!57391))))

(declare-fun condMapEmpty!57391 () Bool)

(declare-fun mapDefault!57391 () ValueCell!17663)

(assert (=> b!1341536 (= condMapEmpty!57391 (= (arr!44063 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17663)) mapDefault!57391)))))

(declare-fun mapIsEmpty!57391 () Bool)

(assert (=> mapIsEmpty!57391 mapRes!57391))

(declare-fun b!1341537 () Bool)

(declare-fun res!889577 () Bool)

(assert (=> b!1341537 (=> (not res!889577) (not e!764244))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91221 (_ BitVec 32)) Bool)

(assert (=> b!1341537 (= res!889577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1341538 () Bool)

(declare-fun res!889579 () Bool)

(assert (=> b!1341538 (=> (not res!889579) (not e!764244))))

(assert (=> b!1341538 (= res!889579 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1341539 () Bool)

(declare-fun res!889575 () Bool)

(assert (=> b!1341539 (=> (not res!889575) (not e!764244))))

(declare-fun minValue!1245 () V!54601)

(declare-fun zeroValue!1245 () V!54601)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24042 0))(
  ( (tuple2!24043 (_1!12032 (_ BitVec 64)) (_2!12032 V!54601)) )
))
(declare-datatypes ((List!31202 0))(
  ( (Nil!31199) (Cons!31198 (h!32416 tuple2!24042) (t!45528 List!31202)) )
))
(declare-datatypes ((ListLongMap!21707 0))(
  ( (ListLongMap!21708 (toList!10869 List!31202)) )
))
(declare-fun contains!9057 (ListLongMap!21707 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5822 (array!91221 array!91223 (_ BitVec 32) (_ BitVec 32) V!54601 V!54601 (_ BitVec 32) Int) ListLongMap!21707)

(assert (=> b!1341539 (= res!889575 (contains!9057 (getCurrentListMap!5822 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1341540 () Bool)

(assert (=> b!1341540 (= e!764244 false)))

(declare-fun lt!594446 () Bool)

(declare-fun +!4791 (ListLongMap!21707 tuple2!24042) ListLongMap!21707)

(declare-fun getCurrentListMapNoExtraKeys!6440 (array!91221 array!91223 (_ BitVec 32) (_ BitVec 32) V!54601 V!54601 (_ BitVec 32) Int) ListLongMap!21707)

(declare-fun get!22241 (ValueCell!17663 V!54601) V!54601)

(declare-fun dynLambda!3745 (Int (_ BitVec 64)) V!54601)

(assert (=> b!1341540 (= lt!594446 (contains!9057 (+!4791 (+!4791 (getCurrentListMapNoExtraKeys!6440 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24043 (select (arr!44062 _keys!1571) from!1960) (get!22241 (select (arr!44063 _values!1303) from!1960) (dynLambda!3745 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142))))

(declare-fun b!1341541 () Bool)

(assert (=> b!1341541 (= e!764242 tp_is_empty!37123)))

(assert (= (and start!113296 res!889576) b!1341530))

(assert (= (and b!1341530 res!889578) b!1341537))

(assert (= (and b!1341537 res!889577) b!1341533))

(assert (= (and b!1341533 res!889583) b!1341534))

(assert (= (and b!1341534 res!889582) b!1341539))

(assert (= (and b!1341539 res!889575) b!1341532))

(assert (= (and b!1341532 res!889580) b!1341531))

(assert (= (and b!1341531 res!889581) b!1341538))

(assert (= (and b!1341538 res!889579) b!1341540))

(assert (= (and b!1341536 condMapEmpty!57391) mapIsEmpty!57391))

(assert (= (and b!1341536 (not condMapEmpty!57391)) mapNonEmpty!57391))

(get-info :version)

(assert (= (and mapNonEmpty!57391 ((_ is ValueCellFull!17663) mapValue!57391)) b!1341541))

(assert (= (and b!1341536 ((_ is ValueCellFull!17663) mapDefault!57391)) b!1341535))

(assert (= start!113296 b!1341536))

(declare-fun b_lambda!24293 () Bool)

(assert (=> (not b_lambda!24293) (not b!1341540)))

(declare-fun t!45526 () Bool)

(declare-fun tb!12129 () Bool)

(assert (=> (and start!113296 (= defaultEntry!1306 defaultEntry!1306) t!45526) tb!12129))

(declare-fun result!25357 () Bool)

(assert (=> tb!12129 (= result!25357 tp_is_empty!37123)))

(assert (=> b!1341540 t!45526))

(declare-fun b_and!50157 () Bool)

(assert (= b_and!50155 (and (=> t!45526 result!25357) b_and!50157)))

(declare-fun m!1229607 () Bool)

(assert (=> b!1341540 m!1229607))

(declare-fun m!1229609 () Bool)

(assert (=> b!1341540 m!1229609))

(declare-fun m!1229611 () Bool)

(assert (=> b!1341540 m!1229611))

(declare-fun m!1229613 () Bool)

(assert (=> b!1341540 m!1229613))

(declare-fun m!1229615 () Bool)

(assert (=> b!1341540 m!1229615))

(declare-fun m!1229617 () Bool)

(assert (=> b!1341540 m!1229617))

(assert (=> b!1341540 m!1229611))

(declare-fun m!1229619 () Bool)

(assert (=> b!1341540 m!1229619))

(assert (=> b!1341540 m!1229613))

(assert (=> b!1341540 m!1229615))

(declare-fun m!1229621 () Bool)

(assert (=> b!1341540 m!1229621))

(assert (=> b!1341540 m!1229619))

(assert (=> b!1341540 m!1229607))

(assert (=> b!1341532 m!1229621))

(declare-fun m!1229623 () Bool)

(assert (=> b!1341537 m!1229623))

(declare-fun m!1229625 () Bool)

(assert (=> b!1341539 m!1229625))

(assert (=> b!1341539 m!1229625))

(declare-fun m!1229627 () Bool)

(assert (=> b!1341539 m!1229627))

(declare-fun m!1229629 () Bool)

(assert (=> mapNonEmpty!57391 m!1229629))

(declare-fun m!1229631 () Bool)

(assert (=> b!1341533 m!1229631))

(assert (=> b!1341531 m!1229621))

(assert (=> b!1341531 m!1229621))

(declare-fun m!1229633 () Bool)

(assert (=> b!1341531 m!1229633))

(declare-fun m!1229635 () Bool)

(assert (=> start!113296 m!1229635))

(declare-fun m!1229637 () Bool)

(assert (=> start!113296 m!1229637))

(declare-fun m!1229639 () Bool)

(assert (=> start!113296 m!1229639))

(check-sat (not b!1341531) tp_is_empty!37123 (not b!1341537) (not b!1341539) (not b!1341540) (not b_lambda!24293) (not mapNonEmpty!57391) (not b!1341533) (not b_next!31123) (not start!113296) b_and!50157)
(check-sat b_and!50157 (not b_next!31123))
