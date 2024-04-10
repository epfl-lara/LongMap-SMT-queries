; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8350 () Bool)

(assert start!8350)

(declare-fun b!55573 () Bool)

(declare-fun b_free!1865 () Bool)

(declare-fun b_next!1865 () Bool)

(assert (=> b!55573 (= b_free!1865 (not b_next!1865))))

(declare-fun tp!7698 () Bool)

(declare-fun b_and!3271 () Bool)

(assert (=> b!55573 (= tp!7698 b_and!3271)))

(declare-fun b!55574 () Bool)

(declare-fun b_free!1867 () Bool)

(declare-fun b_next!1867 () Bool)

(assert (=> b!55574 (= b_free!1867 (not b_next!1867))))

(declare-fun tp!7696 () Bool)

(declare-fun b_and!3273 () Bool)

(assert (=> b!55574 (= tp!7696 b_and!3273)))

(declare-fun mapIsEmpty!2717 () Bool)

(declare-fun mapRes!2717 () Bool)

(assert (=> mapIsEmpty!2717 mapRes!2717))

(declare-fun b!55565 () Bool)

(declare-fun e!36512 () Bool)

(declare-fun e!36523 () Bool)

(assert (=> b!55565 (= e!36512 e!36523)))

(declare-fun mapNonEmpty!2717 () Bool)

(declare-fun mapRes!2718 () Bool)

(declare-fun tp!7695 () Bool)

(declare-fun e!36514 () Bool)

(assert (=> mapNonEmpty!2717 (= mapRes!2718 (and tp!7695 e!36514))))

(declare-datatypes ((V!2779 0))(
  ( (V!2780 (val!1219 Int)) )
))
(declare-datatypes ((array!3621 0))(
  ( (array!3622 (arr!1733 (Array (_ BitVec 32) (_ BitVec 64))) (size!1962 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!831 0))(
  ( (ValueCellFull!831 (v!2324 V!2779)) (EmptyCell!831) )
))
(declare-datatypes ((array!3623 0))(
  ( (array!3624 (arr!1734 (Array (_ BitVec 32) ValueCell!831)) (size!1963 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!570 0))(
  ( (LongMapFixedSize!571 (defaultEntry!1999 Int) (mask!5858 (_ BitVec 32)) (extraKeys!1890 (_ BitVec 32)) (zeroValue!1917 V!2779) (minValue!1917 V!2779) (_size!334 (_ BitVec 32)) (_keys!3619 array!3621) (_values!1982 array!3623) (_vacant!334 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!386 0))(
  ( (Cell!387 (v!2325 LongMapFixedSize!570)) )
))
(declare-datatypes ((LongMap!386 0))(
  ( (LongMap!387 (underlying!204 Cell!386)) )
))
(declare-fun thiss!992 () LongMap!386)

(declare-fun mapValue!2718 () ValueCell!831)

(declare-fun mapRest!2718 () (Array (_ BitVec 32) ValueCell!831))

(declare-fun mapKey!2718 () (_ BitVec 32))

(assert (=> mapNonEmpty!2717 (= (arr!1734 (_values!1982 (v!2325 (underlying!204 thiss!992)))) (store mapRest!2718 mapKey!2718 mapValue!2718))))

(declare-fun b!55566 () Bool)

(declare-fun e!36517 () Bool)

(declare-fun e!36526 () Bool)

(assert (=> b!55566 (= e!36517 (not e!36526))))

(declare-fun res!31294 () Bool)

(assert (=> b!55566 (=> res!31294 e!36526)))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!55566 (= res!31294 (or (bvsge (size!1962 (_keys!3619 (v!2325 (underlying!204 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!1962 (_keys!3619 (v!2325 (underlying!204 thiss!992)))))))))

(declare-datatypes ((List!1398 0))(
  ( (Nil!1395) (Cons!1394 (h!1974 (_ BitVec 64)) (t!4632 List!1398)) )
))
(declare-fun lt!21978 () List!1398)

(assert (=> b!55566 (= lt!21978 (Cons!1394 (select (arr!1733 (_keys!3619 (v!2325 (underlying!204 thiss!992)))) from!355) Nil!1395))))

(declare-fun arrayNoDuplicates!0 (array!3621 (_ BitVec 32) List!1398) Bool)

(assert (=> b!55566 (arrayNoDuplicates!0 (_keys!3619 (v!2325 (underlying!204 thiss!992))) from!355 Nil!1395)))

(declare-datatypes ((Unit!1457 0))(
  ( (Unit!1458) )
))
(declare-fun lt!21979 () Unit!1457)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3621 (_ BitVec 32) (_ BitVec 32)) Unit!1457)

(assert (=> b!55566 (= lt!21979 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3619 (v!2325 (underlying!204 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!3621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!55566 (arrayContainsKey!0 (_keys!3619 (v!2325 (underlying!204 thiss!992))) (select (arr!1733 (_keys!3619 (v!2325 (underlying!204 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!21980 () Unit!1457)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!18 (array!3621 array!3623 (_ BitVec 32) (_ BitVec 32) V!2779 V!2779 (_ BitVec 64) (_ BitVec 32) Int) Unit!1457)

(assert (=> b!55566 (= lt!21980 (lemmaListMapContainsThenArrayContainsFrom!18 (_keys!3619 (v!2325 (underlying!204 thiss!992))) (_values!1982 (v!2325 (underlying!204 thiss!992))) (mask!5858 (v!2325 (underlying!204 thiss!992))) (extraKeys!1890 (v!2325 (underlying!204 thiss!992))) (zeroValue!1917 (v!2325 (underlying!204 thiss!992))) (minValue!1917 (v!2325 (underlying!204 thiss!992))) (select (arr!1733 (_keys!3619 (v!2325 (underlying!204 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1999 (v!2325 (underlying!204 thiss!992)))))))

(declare-fun b!55567 () Bool)

(declare-fun e!36520 () Bool)

(declare-fun tp_is_empty!2349 () Bool)

(assert (=> b!55567 (= e!36520 tp_is_empty!2349)))

(declare-fun b!55568 () Bool)

(declare-fun res!31293 () Bool)

(declare-fun e!36521 () Bool)

(assert (=> b!55568 (=> (not res!31293) (not e!36521))))

(assert (=> b!55568 (= res!31293 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1962 (_keys!3619 (v!2325 (underlying!204 thiss!992)))))))))

(declare-fun res!31288 () Bool)

(assert (=> start!8350 (=> (not res!31288) (not e!36521))))

(declare-fun valid!228 (LongMap!386) Bool)

(assert (=> start!8350 (= res!31288 (valid!228 thiss!992))))

(assert (=> start!8350 e!36521))

(declare-fun e!36516 () Bool)

(assert (=> start!8350 e!36516))

(assert (=> start!8350 true))

(declare-fun e!36527 () Bool)

(assert (=> start!8350 e!36527))

(declare-fun b!55569 () Bool)

(declare-fun e!36525 () Bool)

(assert (=> b!55569 (= e!36525 e!36517)))

(declare-fun res!31295 () Bool)

(assert (=> b!55569 (=> (not res!31295) (not e!36517))))

(declare-datatypes ((tuple2!1970 0))(
  ( (tuple2!1971 (_1!996 (_ BitVec 64)) (_2!996 V!2779)) )
))
(declare-datatypes ((List!1399 0))(
  ( (Nil!1396) (Cons!1395 (h!1975 tuple2!1970) (t!4633 List!1399)) )
))
(declare-datatypes ((ListLongMap!1333 0))(
  ( (ListLongMap!1334 (toList!682 List!1399)) )
))
(declare-fun lt!21981 () ListLongMap!1333)

(declare-fun contains!658 (ListLongMap!1333 (_ BitVec 64)) Bool)

(assert (=> b!55569 (= res!31295 (contains!658 lt!21981 (select (arr!1733 (_keys!3619 (v!2325 (underlying!204 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!570)

(declare-datatypes ((tuple2!1972 0))(
  ( (tuple2!1973 (_1!997 Bool) (_2!997 LongMapFixedSize!570)) )
))
(declare-fun lt!21983 () tuple2!1972)

(declare-fun update!63 (LongMapFixedSize!570 (_ BitVec 64) V!2779) tuple2!1972)

(declare-fun get!1035 (ValueCell!831 V!2779) V!2779)

(declare-fun dynLambda!294 (Int (_ BitVec 64)) V!2779)

(assert (=> b!55569 (= lt!21983 (update!63 newMap!16 (select (arr!1733 (_keys!3619 (v!2325 (underlying!204 thiss!992)))) from!355) (get!1035 (select (arr!1734 (_values!1982 (v!2325 (underlying!204 thiss!992)))) from!355) (dynLambda!294 (defaultEntry!1999 (v!2325 (underlying!204 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!55570 () Bool)

(declare-fun res!31298 () Bool)

(assert (=> b!55570 (=> res!31298 e!36526)))

(declare-fun contains!659 (List!1398 (_ BitVec 64)) Bool)

(assert (=> b!55570 (= res!31298 (contains!659 lt!21978 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!55571 () Bool)

(assert (=> b!55571 (= e!36516 e!36512)))

(declare-fun b!55572 () Bool)

(declare-fun res!31291 () Bool)

(assert (=> b!55572 (=> (not res!31291) (not e!36521))))

(assert (=> b!55572 (= res!31291 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5858 newMap!16)) (_size!334 (v!2325 (underlying!204 thiss!992)))))))

(declare-fun e!36513 () Bool)

(declare-fun array_inv!1073 (array!3621) Bool)

(declare-fun array_inv!1074 (array!3623) Bool)

(assert (=> b!55573 (= e!36523 (and tp!7698 tp_is_empty!2349 (array_inv!1073 (_keys!3619 (v!2325 (underlying!204 thiss!992)))) (array_inv!1074 (_values!1982 (v!2325 (underlying!204 thiss!992)))) e!36513))))

(declare-fun e!36524 () Bool)

(assert (=> b!55574 (= e!36527 (and tp!7696 tp_is_empty!2349 (array_inv!1073 (_keys!3619 newMap!16)) (array_inv!1074 (_values!1982 newMap!16)) e!36524))))

(declare-fun b!55575 () Bool)

(declare-fun e!36515 () Bool)

(assert (=> b!55575 (= e!36515 tp_is_empty!2349)))

(declare-fun b!55576 () Bool)

(declare-fun res!31290 () Bool)

(assert (=> b!55576 (=> res!31290 e!36526)))

(assert (=> b!55576 (= res!31290 (contains!659 lt!21978 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!55577 () Bool)

(declare-fun res!31289 () Bool)

(assert (=> b!55577 (=> res!31289 e!36526)))

(assert (=> b!55577 (= res!31289 (not (arrayNoDuplicates!0 (_keys!3619 (v!2325 (underlying!204 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!21978)))))

(declare-fun b!55578 () Bool)

(assert (=> b!55578 (= e!36514 tp_is_empty!2349)))

(declare-fun mapNonEmpty!2718 () Bool)

(declare-fun tp!7697 () Bool)

(declare-fun e!36519 () Bool)

(assert (=> mapNonEmpty!2718 (= mapRes!2717 (and tp!7697 e!36519))))

(declare-fun mapRest!2717 () (Array (_ BitVec 32) ValueCell!831))

(declare-fun mapKey!2717 () (_ BitVec 32))

(declare-fun mapValue!2717 () ValueCell!831)

(assert (=> mapNonEmpty!2718 (= (arr!1734 (_values!1982 newMap!16)) (store mapRest!2717 mapKey!2717 mapValue!2717))))

(declare-fun b!55579 () Bool)

(assert (=> b!55579 (= e!36521 e!36525)))

(declare-fun res!31296 () Bool)

(assert (=> b!55579 (=> (not res!31296) (not e!36525))))

(declare-fun lt!21984 () ListLongMap!1333)

(assert (=> b!55579 (= res!31296 (and (= lt!21984 lt!21981) (not (= (select (arr!1733 (_keys!3619 (v!2325 (underlying!204 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1733 (_keys!3619 (v!2325 (underlying!204 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1076 (LongMapFixedSize!570) ListLongMap!1333)

(assert (=> b!55579 (= lt!21981 (map!1076 newMap!16))))

(declare-fun getCurrentListMap!389 (array!3621 array!3623 (_ BitVec 32) (_ BitVec 32) V!2779 V!2779 (_ BitVec 32) Int) ListLongMap!1333)

(assert (=> b!55579 (= lt!21984 (getCurrentListMap!389 (_keys!3619 (v!2325 (underlying!204 thiss!992))) (_values!1982 (v!2325 (underlying!204 thiss!992))) (mask!5858 (v!2325 (underlying!204 thiss!992))) (extraKeys!1890 (v!2325 (underlying!204 thiss!992))) (zeroValue!1917 (v!2325 (underlying!204 thiss!992))) (minValue!1917 (v!2325 (underlying!204 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1999 (v!2325 (underlying!204 thiss!992)))))))

(declare-fun b!55580 () Bool)

(assert (=> b!55580 (= e!36513 (and e!36520 mapRes!2718))))

(declare-fun condMapEmpty!2717 () Bool)

(declare-fun mapDefault!2717 () ValueCell!831)

(assert (=> b!55580 (= condMapEmpty!2717 (= (arr!1734 (_values!1982 (v!2325 (underlying!204 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!831)) mapDefault!2717)))))

(declare-fun b!55581 () Bool)

(declare-fun res!31297 () Bool)

(assert (=> b!55581 (=> res!31297 e!36526)))

(declare-fun noDuplicate!43 (List!1398) Bool)

(assert (=> b!55581 (= res!31297 (not (noDuplicate!43 lt!21978)))))

(declare-fun b!55582 () Bool)

(assert (=> b!55582 (= e!36524 (and e!36515 mapRes!2717))))

(declare-fun condMapEmpty!2718 () Bool)

(declare-fun mapDefault!2718 () ValueCell!831)

(assert (=> b!55582 (= condMapEmpty!2718 (= (arr!1734 (_values!1982 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!831)) mapDefault!2718)))))

(declare-fun b!55583 () Bool)

(assert (=> b!55583 (= e!36526 true)))

(declare-fun lt!21982 () Bool)

(assert (=> b!55583 (= lt!21982 (contains!659 lt!21978 (select (arr!1733 (_keys!3619 (v!2325 (underlying!204 thiss!992)))) from!355)))))

(declare-fun b!55584 () Bool)

(assert (=> b!55584 (= e!36519 tp_is_empty!2349)))

(declare-fun b!55585 () Bool)

(declare-fun res!31292 () Bool)

(assert (=> b!55585 (=> (not res!31292) (not e!36521))))

(declare-fun valid!229 (LongMapFixedSize!570) Bool)

(assert (=> b!55585 (= res!31292 (valid!229 newMap!16))))

(declare-fun mapIsEmpty!2718 () Bool)

(assert (=> mapIsEmpty!2718 mapRes!2718))

(assert (= (and start!8350 res!31288) b!55568))

(assert (= (and b!55568 res!31293) b!55585))

(assert (= (and b!55585 res!31292) b!55572))

(assert (= (and b!55572 res!31291) b!55579))

(assert (= (and b!55579 res!31296) b!55569))

(assert (= (and b!55569 res!31295) b!55566))

(assert (= (and b!55566 (not res!31294)) b!55581))

(assert (= (and b!55581 (not res!31297)) b!55576))

(assert (= (and b!55576 (not res!31290)) b!55570))

(assert (= (and b!55570 (not res!31298)) b!55577))

(assert (= (and b!55577 (not res!31289)) b!55583))

(assert (= (and b!55580 condMapEmpty!2717) mapIsEmpty!2718))

(assert (= (and b!55580 (not condMapEmpty!2717)) mapNonEmpty!2717))

(get-info :version)

(assert (= (and mapNonEmpty!2717 ((_ is ValueCellFull!831) mapValue!2718)) b!55578))

(assert (= (and b!55580 ((_ is ValueCellFull!831) mapDefault!2717)) b!55567))

(assert (= b!55573 b!55580))

(assert (= b!55565 b!55573))

(assert (= b!55571 b!55565))

(assert (= start!8350 b!55571))

(assert (= (and b!55582 condMapEmpty!2718) mapIsEmpty!2717))

(assert (= (and b!55582 (not condMapEmpty!2718)) mapNonEmpty!2718))

(assert (= (and mapNonEmpty!2718 ((_ is ValueCellFull!831) mapValue!2717)) b!55584))

(assert (= (and b!55582 ((_ is ValueCellFull!831) mapDefault!2718)) b!55575))

(assert (= b!55574 b!55582))

(assert (= start!8350 b!55574))

(declare-fun b_lambda!2443 () Bool)

(assert (=> (not b_lambda!2443) (not b!55569)))

(declare-fun t!4629 () Bool)

(declare-fun tb!1209 () Bool)

(assert (=> (and b!55573 (= (defaultEntry!1999 (v!2325 (underlying!204 thiss!992))) (defaultEntry!1999 (v!2325 (underlying!204 thiss!992)))) t!4629) tb!1209))

(declare-fun result!2211 () Bool)

(assert (=> tb!1209 (= result!2211 tp_is_empty!2349)))

(assert (=> b!55569 t!4629))

(declare-fun b_and!3275 () Bool)

(assert (= b_and!3271 (and (=> t!4629 result!2211) b_and!3275)))

(declare-fun t!4631 () Bool)

(declare-fun tb!1211 () Bool)

(assert (=> (and b!55574 (= (defaultEntry!1999 newMap!16) (defaultEntry!1999 (v!2325 (underlying!204 thiss!992)))) t!4631) tb!1211))

(declare-fun result!2215 () Bool)

(assert (= result!2215 result!2211))

(assert (=> b!55569 t!4631))

(declare-fun b_and!3277 () Bool)

(assert (= b_and!3273 (and (=> t!4631 result!2215) b_and!3277)))

(declare-fun m!46855 () Bool)

(assert (=> b!55573 m!46855))

(declare-fun m!46857 () Bool)

(assert (=> b!55573 m!46857))

(declare-fun m!46859 () Bool)

(assert (=> b!55583 m!46859))

(assert (=> b!55583 m!46859))

(declare-fun m!46861 () Bool)

(assert (=> b!55583 m!46861))

(declare-fun m!46863 () Bool)

(assert (=> mapNonEmpty!2718 m!46863))

(declare-fun m!46865 () Bool)

(assert (=> b!55576 m!46865))

(declare-fun m!46867 () Bool)

(assert (=> b!55581 m!46867))

(declare-fun m!46869 () Bool)

(assert (=> b!55570 m!46869))

(declare-fun m!46871 () Bool)

(assert (=> b!55574 m!46871))

(declare-fun m!46873 () Bool)

(assert (=> b!55574 m!46873))

(declare-fun m!46875 () Bool)

(assert (=> b!55585 m!46875))

(declare-fun m!46877 () Bool)

(assert (=> b!55569 m!46877))

(declare-fun m!46879 () Bool)

(assert (=> b!55569 m!46879))

(declare-fun m!46881 () Bool)

(assert (=> b!55569 m!46881))

(assert (=> b!55569 m!46859))

(assert (=> b!55569 m!46879))

(assert (=> b!55569 m!46859))

(declare-fun m!46883 () Bool)

(assert (=> b!55569 m!46883))

(assert (=> b!55569 m!46859))

(assert (=> b!55569 m!46881))

(declare-fun m!46885 () Bool)

(assert (=> b!55569 m!46885))

(assert (=> b!55569 m!46877))

(declare-fun m!46887 () Bool)

(assert (=> b!55577 m!46887))

(assert (=> b!55579 m!46859))

(declare-fun m!46889 () Bool)

(assert (=> b!55579 m!46889))

(declare-fun m!46891 () Bool)

(assert (=> b!55579 m!46891))

(declare-fun m!46893 () Bool)

(assert (=> start!8350 m!46893))

(declare-fun m!46895 () Bool)

(assert (=> mapNonEmpty!2717 m!46895))

(declare-fun m!46897 () Bool)

(assert (=> b!55566 m!46897))

(declare-fun m!46899 () Bool)

(assert (=> b!55566 m!46899))

(assert (=> b!55566 m!46859))

(declare-fun m!46901 () Bool)

(assert (=> b!55566 m!46901))

(assert (=> b!55566 m!46859))

(assert (=> b!55566 m!46859))

(declare-fun m!46903 () Bool)

(assert (=> b!55566 m!46903))

(check-sat (not b!55574) (not b!55573) (not b!55569) (not b!55585) (not mapNonEmpty!2717) (not start!8350) (not b!55576) tp_is_empty!2349 (not b!55566) (not b_next!1867) (not b!55570) b_and!3277 (not b_lambda!2443) (not b_next!1865) b_and!3275 (not b!55577) (not b!55579) (not b!55581) (not mapNonEmpty!2718) (not b!55583))
(check-sat b_and!3275 b_and!3277 (not b_next!1865) (not b_next!1867))
