; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113318 () Bool)

(assert start!113318)

(declare-fun b_free!31369 () Bool)

(declare-fun b_next!31369 () Bool)

(assert (=> start!113318 (= b_free!31369 (not b_next!31369))))

(declare-fun tp!109912 () Bool)

(declare-fun b_and!50573 () Bool)

(assert (=> start!113318 (= tp!109912 b_and!50573)))

(declare-fun res!892057 () Bool)

(declare-fun e!765211 () Bool)

(assert (=> start!113318 (=> (not res!892057) (not e!765211))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113318 (= res!892057 (validMask!0 mask!1977))))

(assert (=> start!113318 e!765211))

(declare-fun tp_is_empty!37369 () Bool)

(assert (=> start!113318 tp_is_empty!37369))

(assert (=> start!113318 true))

(declare-datatypes ((array!91523 0))(
  ( (array!91524 (arr!44218 (Array (_ BitVec 32) (_ BitVec 64))) (size!44770 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91523)

(declare-fun array_inv!33513 (array!91523) Bool)

(assert (=> start!113318 (array_inv!33513 _keys!1571)))

(declare-datatypes ((V!54929 0))(
  ( (V!54930 (val!18759 Int)) )
))
(declare-datatypes ((ValueCell!17786 0))(
  ( (ValueCellFull!17786 (v!21406 V!54929)) (EmptyCell!17786) )
))
(declare-datatypes ((array!91525 0))(
  ( (array!91526 (arr!44219 (Array (_ BitVec 32) ValueCell!17786)) (size!44771 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91525)

(declare-fun e!765215 () Bool)

(declare-fun array_inv!33514 (array!91525) Bool)

(assert (=> start!113318 (and (array_inv!33514 _values!1303) e!765215)))

(assert (=> start!113318 tp!109912))

(declare-fun mapNonEmpty!57760 () Bool)

(declare-fun mapRes!57760 () Bool)

(declare-fun tp!109913 () Bool)

(declare-fun e!765214 () Bool)

(assert (=> mapNonEmpty!57760 (= mapRes!57760 (and tp!109913 e!765214))))

(declare-fun mapValue!57760 () ValueCell!17786)

(declare-fun mapKey!57760 () (_ BitVec 32))

(declare-fun mapRest!57760 () (Array (_ BitVec 32) ValueCell!17786))

(assert (=> mapNonEmpty!57760 (= (arr!44219 _values!1303) (store mapRest!57760 mapKey!57760 mapValue!57760))))

(declare-fun b!1344484 () Bool)

(declare-fun e!765212 () Bool)

(assert (=> b!1344484 (= e!765215 (and e!765212 mapRes!57760))))

(declare-fun condMapEmpty!57760 () Bool)

(declare-fun mapDefault!57760 () ValueCell!17786)

(assert (=> b!1344484 (= condMapEmpty!57760 (= (arr!44219 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17786)) mapDefault!57760)))))

(declare-fun b!1344485 () Bool)

(declare-fun res!892056 () Bool)

(assert (=> b!1344485 (=> (not res!892056) (not e!765211))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1344485 (= res!892056 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1344486 () Bool)

(declare-fun res!892054 () Bool)

(assert (=> b!1344486 (=> (not res!892054) (not e!765211))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1344486 (= res!892054 (not (= (select (arr!44218 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1344487 () Bool)

(declare-fun res!892053 () Bool)

(assert (=> b!1344487 (=> (not res!892053) (not e!765211))))

(assert (=> b!1344487 (= res!892053 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44770 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57760 () Bool)

(assert (=> mapIsEmpty!57760 mapRes!57760))

(declare-fun b!1344488 () Bool)

(assert (=> b!1344488 (= e!765214 tp_is_empty!37369)))

(declare-fun b!1344489 () Bool)

(declare-fun res!892060 () Bool)

(assert (=> b!1344489 (=> (not res!892060) (not e!765211))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1344489 (= res!892060 (validKeyInArray!0 (select (arr!44218 _keys!1571) from!1960)))))

(declare-fun b!1344490 () Bool)

(declare-fun res!892059 () Bool)

(assert (=> b!1344490 (=> (not res!892059) (not e!765211))))

(declare-fun minValue!1245 () V!54929)

(declare-fun zeroValue!1245 () V!54929)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24234 0))(
  ( (tuple2!24235 (_1!12128 (_ BitVec 64)) (_2!12128 V!54929)) )
))
(declare-datatypes ((List!31376 0))(
  ( (Nil!31373) (Cons!31372 (h!32581 tuple2!24234) (t!45894 List!31376)) )
))
(declare-datatypes ((ListLongMap!21891 0))(
  ( (ListLongMap!21892 (toList!10961 List!31376)) )
))
(declare-fun contains!9066 (ListLongMap!21891 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5807 (array!91523 array!91525 (_ BitVec 32) (_ BitVec 32) V!54929 V!54929 (_ BitVec 32) Int) ListLongMap!21891)

(assert (=> b!1344490 (= res!892059 (contains!9066 (getCurrentListMap!5807 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1344491 () Bool)

(declare-fun res!892058 () Bool)

(assert (=> b!1344491 (=> (not res!892058) (not e!765211))))

(assert (=> b!1344491 (= res!892058 (and (= (size!44771 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44770 _keys!1571) (size!44771 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1344492 () Bool)

(assert (=> b!1344492 (= e!765212 tp_is_empty!37369)))

(declare-fun b!1344493 () Bool)

(declare-fun res!892055 () Bool)

(assert (=> b!1344493 (=> (not res!892055) (not e!765211))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91523 (_ BitVec 32)) Bool)

(assert (=> b!1344493 (= res!892055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344494 () Bool)

(declare-fun res!892052 () Bool)

(assert (=> b!1344494 (=> (not res!892052) (not e!765211))))

(declare-datatypes ((List!31377 0))(
  ( (Nil!31374) (Cons!31373 (h!32582 (_ BitVec 64)) (t!45895 List!31377)) )
))
(declare-fun arrayNoDuplicates!0 (array!91523 (_ BitVec 32) List!31377) Bool)

(assert (=> b!1344494 (= res!892052 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31374))))

(declare-fun b!1344495 () Bool)

(assert (=> b!1344495 (= e!765211 false)))

(declare-fun lt!595008 () Bool)

(declare-fun +!4842 (ListLongMap!21891 tuple2!24234) ListLongMap!21891)

(declare-fun getCurrentListMapNoExtraKeys!6485 (array!91523 array!91525 (_ BitVec 32) (_ BitVec 32) V!54929 V!54929 (_ BitVec 32) Int) ListLongMap!21891)

(declare-fun get!22338 (ValueCell!17786 V!54929) V!54929)

(declare-fun dynLambda!3772 (Int (_ BitVec 64)) V!54929)

(assert (=> b!1344495 (= lt!595008 (contains!9066 (+!4842 (getCurrentListMapNoExtraKeys!6485 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24235 (select (arr!44218 _keys!1571) from!1960) (get!22338 (select (arr!44219 _values!1303) from!1960) (dynLambda!3772 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) k0!1142))))

(assert (= (and start!113318 res!892057) b!1344491))

(assert (= (and b!1344491 res!892058) b!1344493))

(assert (= (and b!1344493 res!892055) b!1344494))

(assert (= (and b!1344494 res!892052) b!1344487))

(assert (= (and b!1344487 res!892053) b!1344490))

(assert (= (and b!1344490 res!892059) b!1344486))

(assert (= (and b!1344486 res!892054) b!1344489))

(assert (= (and b!1344489 res!892060) b!1344485))

(assert (= (and b!1344485 res!892056) b!1344495))

(assert (= (and b!1344484 condMapEmpty!57760) mapIsEmpty!57760))

(assert (= (and b!1344484 (not condMapEmpty!57760)) mapNonEmpty!57760))

(get-info :version)

(assert (= (and mapNonEmpty!57760 ((_ is ValueCellFull!17786) mapValue!57760)) b!1344488))

(assert (= (and b!1344484 ((_ is ValueCellFull!17786) mapDefault!57760)) b!1344492))

(assert (= start!113318 b!1344484))

(declare-fun b_lambda!24481 () Bool)

(assert (=> (not b_lambda!24481) (not b!1344495)))

(declare-fun t!45893 () Bool)

(declare-fun tb!12321 () Bool)

(assert (=> (and start!113318 (= defaultEntry!1306 defaultEntry!1306) t!45893) tb!12321))

(declare-fun result!25741 () Bool)

(assert (=> tb!12321 (= result!25741 tp_is_empty!37369)))

(assert (=> b!1344495 t!45893))

(declare-fun b_and!50575 () Bool)

(assert (= b_and!50573 (and (=> t!45893 result!25741) b_and!50575)))

(declare-fun m!1231591 () Bool)

(assert (=> b!1344489 m!1231591))

(assert (=> b!1344489 m!1231591))

(declare-fun m!1231593 () Bool)

(assert (=> b!1344489 m!1231593))

(declare-fun m!1231595 () Bool)

(assert (=> b!1344494 m!1231595))

(declare-fun m!1231597 () Bool)

(assert (=> start!113318 m!1231597))

(declare-fun m!1231599 () Bool)

(assert (=> start!113318 m!1231599))

(declare-fun m!1231601 () Bool)

(assert (=> start!113318 m!1231601))

(declare-fun m!1231603 () Bool)

(assert (=> b!1344493 m!1231603))

(assert (=> b!1344486 m!1231591))

(declare-fun m!1231605 () Bool)

(assert (=> mapNonEmpty!57760 m!1231605))

(declare-fun m!1231607 () Bool)

(assert (=> b!1344495 m!1231607))

(declare-fun m!1231609 () Bool)

(assert (=> b!1344495 m!1231609))

(declare-fun m!1231611 () Bool)

(assert (=> b!1344495 m!1231611))

(declare-fun m!1231613 () Bool)

(assert (=> b!1344495 m!1231613))

(assert (=> b!1344495 m!1231607))

(declare-fun m!1231615 () Bool)

(assert (=> b!1344495 m!1231615))

(assert (=> b!1344495 m!1231609))

(assert (=> b!1344495 m!1231611))

(assert (=> b!1344495 m!1231615))

(declare-fun m!1231617 () Bool)

(assert (=> b!1344495 m!1231617))

(assert (=> b!1344495 m!1231591))

(declare-fun m!1231619 () Bool)

(assert (=> b!1344490 m!1231619))

(assert (=> b!1344490 m!1231619))

(declare-fun m!1231621 () Bool)

(assert (=> b!1344490 m!1231621))

(check-sat tp_is_empty!37369 (not mapNonEmpty!57760) (not b!1344495) (not start!113318) (not b_next!31369) (not b!1344489) (not b_lambda!24481) (not b!1344493) b_and!50575 (not b!1344490) (not b!1344494))
(check-sat b_and!50575 (not b_next!31369))
