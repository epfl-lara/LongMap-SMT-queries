; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112340 () Bool)

(assert start!112340)

(declare-fun b_free!30735 () Bool)

(declare-fun b_next!30735 () Bool)

(assert (=> start!112340 (= b_free!30735 (not b_next!30735))))

(declare-fun tp!107842 () Bool)

(declare-fun b_and!49525 () Bool)

(assert (=> start!112340 (= tp!107842 b_and!49525)))

(declare-fun b!1331527 () Bool)

(declare-fun e!758714 () Bool)

(declare-fun tp_is_empty!36645 () Bool)

(assert (=> b!1331527 (= e!758714 tp_is_empty!36645)))

(declare-fun b!1331528 () Bool)

(declare-fun e!758712 () Bool)

(assert (=> b!1331528 (= e!758712 (not true))))

(declare-datatypes ((V!53963 0))(
  ( (V!53964 (val!18397 Int)) )
))
(declare-datatypes ((tuple2!23698 0))(
  ( (tuple2!23699 (_1!11860 (_ BitVec 64)) (_2!11860 V!53963)) )
))
(declare-datatypes ((List!30847 0))(
  ( (Nil!30844) (Cons!30843 (h!32052 tuple2!23698) (t!44995 List!30847)) )
))
(declare-datatypes ((ListLongMap!21355 0))(
  ( (ListLongMap!21356 (toList!10693 List!30847)) )
))
(declare-fun lt!591575 () ListLongMap!21355)

(declare-fun minValue!1262 () V!53963)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8857 (ListLongMap!21355 (_ BitVec 64)) Bool)

(declare-fun +!4687 (ListLongMap!21355 tuple2!23698) ListLongMap!21355)

(assert (=> b!1331528 (contains!8857 (+!4687 lt!591575 (tuple2!23699 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-datatypes ((Unit!43823 0))(
  ( (Unit!43824) )
))
(declare-fun lt!591577 () Unit!43823)

(declare-fun addStillContains!1166 (ListLongMap!21355 (_ BitVec 64) V!53963 (_ BitVec 64)) Unit!43823)

(assert (=> b!1331528 (= lt!591577 (addStillContains!1166 lt!591575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> b!1331528 (contains!8857 lt!591575 k0!1153)))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lt!591580 () Unit!43823)

(declare-datatypes ((array!90170 0))(
  ( (array!90171 (arr!43551 (Array (_ BitVec 32) (_ BitVec 64))) (size!44101 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90170)

(declare-fun lt!591578 () V!53963)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!274 ((_ BitVec 64) (_ BitVec 64) V!53963 ListLongMap!21355) Unit!43823)

(assert (=> b!1331528 (= lt!591580 (lemmaInListMapAfterAddingDiffThenInBefore!274 k0!1153 (select (arr!43551 _keys!1590) from!1980) lt!591578 lt!591575))))

(declare-fun lt!591576 () ListLongMap!21355)

(assert (=> b!1331528 (contains!8857 lt!591576 k0!1153)))

(declare-fun lt!591579 () Unit!43823)

(assert (=> b!1331528 (= lt!591579 (lemmaInListMapAfterAddingDiffThenInBefore!274 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591576))))

(assert (=> b!1331528 (= lt!591576 (+!4687 lt!591575 (tuple2!23699 (select (arr!43551 _keys!1590) from!1980) lt!591578)))))

(declare-datatypes ((ValueCell!17424 0))(
  ( (ValueCellFull!17424 (v!21034 V!53963)) (EmptyCell!17424) )
))
(declare-datatypes ((array!90172 0))(
  ( (array!90173 (arr!43552 (Array (_ BitVec 32) ValueCell!17424)) (size!44102 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90172)

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21961 (ValueCell!17424 V!53963) V!53963)

(declare-fun dynLambda!3626 (Int (_ BitVec 64)) V!53963)

(assert (=> b!1331528 (= lt!591578 (get!21961 (select (arr!43552 _values!1320) from!1980) (dynLambda!3626 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!53963)

(declare-fun getCurrentListMapNoExtraKeys!6325 (array!90170 array!90172 (_ BitVec 32) (_ BitVec 32) V!53963 V!53963 (_ BitVec 32) Int) ListLongMap!21355)

(assert (=> b!1331528 (= lt!591575 (getCurrentListMapNoExtraKeys!6325 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1331529 () Bool)

(declare-fun res!883579 () Bool)

(assert (=> b!1331529 (=> (not res!883579) (not e!758712))))

(declare-fun getCurrentListMap!5677 (array!90170 array!90172 (_ BitVec 32) (_ BitVec 32) V!53963 V!53963 (_ BitVec 32) Int) ListLongMap!21355)

(assert (=> b!1331529 (= res!883579 (contains!8857 (getCurrentListMap!5677 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1331530 () Bool)

(declare-fun res!883586 () Bool)

(assert (=> b!1331530 (=> (not res!883586) (not e!758712))))

(assert (=> b!1331530 (= res!883586 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1331531 () Bool)

(declare-fun res!883584 () Bool)

(assert (=> b!1331531 (=> (not res!883584) (not e!758712))))

(assert (=> b!1331531 (= res!883584 (and (= (size!44102 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44101 _keys!1590) (size!44102 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1331533 () Bool)

(declare-fun e!758715 () Bool)

(declare-fun mapRes!56641 () Bool)

(assert (=> b!1331533 (= e!758715 (and e!758714 mapRes!56641))))

(declare-fun condMapEmpty!56641 () Bool)

(declare-fun mapDefault!56641 () ValueCell!17424)

(assert (=> b!1331533 (= condMapEmpty!56641 (= (arr!43552 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17424)) mapDefault!56641)))))

(declare-fun b!1331534 () Bool)

(declare-fun res!883587 () Bool)

(assert (=> b!1331534 (=> (not res!883587) (not e!758712))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331534 (= res!883587 (validKeyInArray!0 (select (arr!43551 _keys!1590) from!1980)))))

(declare-fun b!1331535 () Bool)

(declare-fun res!883580 () Bool)

(assert (=> b!1331535 (=> (not res!883580) (not e!758712))))

(assert (=> b!1331535 (= res!883580 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44101 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1331536 () Bool)

(declare-fun res!883581 () Bool)

(assert (=> b!1331536 (=> (not res!883581) (not e!758712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90170 (_ BitVec 32)) Bool)

(assert (=> b!1331536 (= res!883581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!883585 () Bool)

(assert (=> start!112340 (=> (not res!883585) (not e!758712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112340 (= res!883585 (validMask!0 mask!1998))))

(assert (=> start!112340 e!758712))

(declare-fun array_inv!32849 (array!90172) Bool)

(assert (=> start!112340 (and (array_inv!32849 _values!1320) e!758715)))

(assert (=> start!112340 true))

(declare-fun array_inv!32850 (array!90170) Bool)

(assert (=> start!112340 (array_inv!32850 _keys!1590)))

(assert (=> start!112340 tp!107842))

(assert (=> start!112340 tp_is_empty!36645))

(declare-fun b!1331532 () Bool)

(declare-fun res!883583 () Bool)

(assert (=> b!1331532 (=> (not res!883583) (not e!758712))))

(declare-datatypes ((List!30848 0))(
  ( (Nil!30845) (Cons!30844 (h!32053 (_ BitVec 64)) (t!44996 List!30848)) )
))
(declare-fun arrayNoDuplicates!0 (array!90170 (_ BitVec 32) List!30848) Bool)

(assert (=> b!1331532 (= res!883583 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30845))))

(declare-fun mapIsEmpty!56641 () Bool)

(assert (=> mapIsEmpty!56641 mapRes!56641))

(declare-fun mapNonEmpty!56641 () Bool)

(declare-fun tp!107841 () Bool)

(declare-fun e!758713 () Bool)

(assert (=> mapNonEmpty!56641 (= mapRes!56641 (and tp!107841 e!758713))))

(declare-fun mapValue!56641 () ValueCell!17424)

(declare-fun mapKey!56641 () (_ BitVec 32))

(declare-fun mapRest!56641 () (Array (_ BitVec 32) ValueCell!17424))

(assert (=> mapNonEmpty!56641 (= (arr!43552 _values!1320) (store mapRest!56641 mapKey!56641 mapValue!56641))))

(declare-fun b!1331537 () Bool)

(declare-fun res!883582 () Bool)

(assert (=> b!1331537 (=> (not res!883582) (not e!758712))))

(assert (=> b!1331537 (= res!883582 (not (= (select (arr!43551 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1331538 () Bool)

(assert (=> b!1331538 (= e!758713 tp_is_empty!36645)))

(assert (= (and start!112340 res!883585) b!1331531))

(assert (= (and b!1331531 res!883584) b!1331536))

(assert (= (and b!1331536 res!883581) b!1331532))

(assert (= (and b!1331532 res!883583) b!1331535))

(assert (= (and b!1331535 res!883580) b!1331529))

(assert (= (and b!1331529 res!883579) b!1331537))

(assert (= (and b!1331537 res!883582) b!1331534))

(assert (= (and b!1331534 res!883587) b!1331530))

(assert (= (and b!1331530 res!883586) b!1331528))

(assert (= (and b!1331533 condMapEmpty!56641) mapIsEmpty!56641))

(assert (= (and b!1331533 (not condMapEmpty!56641)) mapNonEmpty!56641))

(get-info :version)

(assert (= (and mapNonEmpty!56641 ((_ is ValueCellFull!17424) mapValue!56641)) b!1331538))

(assert (= (and b!1331533 ((_ is ValueCellFull!17424) mapDefault!56641)) b!1331527))

(assert (= start!112340 b!1331533))

(declare-fun b_lambda!23995 () Bool)

(assert (=> (not b_lambda!23995) (not b!1331528)))

(declare-fun t!44994 () Bool)

(declare-fun tb!11951 () Bool)

(assert (=> (and start!112340 (= defaultEntry!1323 defaultEntry!1323) t!44994) tb!11951))

(declare-fun result!24973 () Bool)

(assert (=> tb!11951 (= result!24973 tp_is_empty!36645)))

(assert (=> b!1331528 t!44994))

(declare-fun b_and!49527 () Bool)

(assert (= b_and!49525 (and (=> t!44994 result!24973) b_and!49527)))

(declare-fun m!1220195 () Bool)

(assert (=> mapNonEmpty!56641 m!1220195))

(declare-fun m!1220197 () Bool)

(assert (=> b!1331537 m!1220197))

(declare-fun m!1220199 () Bool)

(assert (=> b!1331536 m!1220199))

(declare-fun m!1220201 () Bool)

(assert (=> b!1331532 m!1220201))

(declare-fun m!1220203 () Bool)

(assert (=> start!112340 m!1220203))

(declare-fun m!1220205 () Bool)

(assert (=> start!112340 m!1220205))

(declare-fun m!1220207 () Bool)

(assert (=> start!112340 m!1220207))

(declare-fun m!1220209 () Bool)

(assert (=> b!1331528 m!1220209))

(declare-fun m!1220211 () Bool)

(assert (=> b!1331528 m!1220211))

(declare-fun m!1220213 () Bool)

(assert (=> b!1331528 m!1220213))

(declare-fun m!1220215 () Bool)

(assert (=> b!1331528 m!1220215))

(declare-fun m!1220217 () Bool)

(assert (=> b!1331528 m!1220217))

(declare-fun m!1220219 () Bool)

(assert (=> b!1331528 m!1220219))

(declare-fun m!1220221 () Bool)

(assert (=> b!1331528 m!1220221))

(assert (=> b!1331528 m!1220197))

(declare-fun m!1220223 () Bool)

(assert (=> b!1331528 m!1220223))

(assert (=> b!1331528 m!1220219))

(assert (=> b!1331528 m!1220221))

(declare-fun m!1220225 () Bool)

(assert (=> b!1331528 m!1220225))

(assert (=> b!1331528 m!1220211))

(declare-fun m!1220227 () Bool)

(assert (=> b!1331528 m!1220227))

(declare-fun m!1220229 () Bool)

(assert (=> b!1331528 m!1220229))

(declare-fun m!1220231 () Bool)

(assert (=> b!1331528 m!1220231))

(assert (=> b!1331528 m!1220197))

(declare-fun m!1220233 () Bool)

(assert (=> b!1331529 m!1220233))

(assert (=> b!1331529 m!1220233))

(declare-fun m!1220235 () Bool)

(assert (=> b!1331529 m!1220235))

(assert (=> b!1331534 m!1220197))

(assert (=> b!1331534 m!1220197))

(declare-fun m!1220237 () Bool)

(assert (=> b!1331534 m!1220237))

(check-sat (not b!1331532) b_and!49527 (not mapNonEmpty!56641) (not b_next!30735) (not b!1331528) (not start!112340) tp_is_empty!36645 (not b!1331534) (not b!1331529) (not b!1331536) (not b_lambda!23995))
(check-sat b_and!49527 (not b_next!30735))
