; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112346 () Bool)

(assert start!112346)

(declare-fun b_free!30741 () Bool)

(declare-fun b_next!30741 () Bool)

(assert (=> start!112346 (= b_free!30741 (not b_next!30741))))

(declare-fun tp!107860 () Bool)

(declare-fun b_and!49537 () Bool)

(assert (=> start!112346 (= tp!107860 b_and!49537)))

(declare-fun res!883662 () Bool)

(declare-fun e!758759 () Bool)

(assert (=> start!112346 (=> (not res!883662) (not e!758759))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112346 (= res!883662 (validMask!0 mask!1998))))

(assert (=> start!112346 e!758759))

(declare-datatypes ((V!53971 0))(
  ( (V!53972 (val!18400 Int)) )
))
(declare-datatypes ((ValueCell!17427 0))(
  ( (ValueCellFull!17427 (v!21037 V!53971)) (EmptyCell!17427) )
))
(declare-datatypes ((array!90182 0))(
  ( (array!90183 (arr!43557 (Array (_ BitVec 32) ValueCell!17427)) (size!44107 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90182)

(declare-fun e!758761 () Bool)

(declare-fun array_inv!32853 (array!90182) Bool)

(assert (=> start!112346 (and (array_inv!32853 _values!1320) e!758761)))

(assert (=> start!112346 true))

(declare-datatypes ((array!90184 0))(
  ( (array!90185 (arr!43558 (Array (_ BitVec 32) (_ BitVec 64))) (size!44108 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90184)

(declare-fun array_inv!32854 (array!90184) Bool)

(assert (=> start!112346 (array_inv!32854 _keys!1590)))

(assert (=> start!112346 tp!107860))

(declare-fun tp_is_empty!36651 () Bool)

(assert (=> start!112346 tp_is_empty!36651))

(declare-fun b!1331641 () Bool)

(declare-fun e!758757 () Bool)

(assert (=> b!1331641 (= e!758757 tp_is_empty!36651)))

(declare-fun b!1331642 () Bool)

(declare-fun res!883661 () Bool)

(assert (=> b!1331642 (=> (not res!883661) (not e!758759))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1331642 (= res!883661 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!56650 () Bool)

(declare-fun mapRes!56650 () Bool)

(assert (=> mapIsEmpty!56650 mapRes!56650))

(declare-fun b!1331643 () Bool)

(declare-fun res!883665 () Bool)

(assert (=> b!1331643 (=> (not res!883665) (not e!758759))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53971)

(declare-fun zeroValue!1262 () V!53971)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23704 0))(
  ( (tuple2!23705 (_1!11863 (_ BitVec 64)) (_2!11863 V!53971)) )
))
(declare-datatypes ((List!30853 0))(
  ( (Nil!30850) (Cons!30849 (h!32058 tuple2!23704) (t!45007 List!30853)) )
))
(declare-datatypes ((ListLongMap!21361 0))(
  ( (ListLongMap!21362 (toList!10696 List!30853)) )
))
(declare-fun contains!8860 (ListLongMap!21361 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5679 (array!90184 array!90182 (_ BitVec 32) (_ BitVec 32) V!53971 V!53971 (_ BitVec 32) Int) ListLongMap!21361)

(assert (=> b!1331643 (= res!883665 (contains!8860 (getCurrentListMap!5679 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1331644 () Bool)

(declare-fun res!883667 () Bool)

(assert (=> b!1331644 (=> (not res!883667) (not e!758759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90184 (_ BitVec 32)) Bool)

(assert (=> b!1331644 (= res!883667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1331645 () Bool)

(assert (=> b!1331645 (= e!758759 (not true))))

(declare-fun lt!591633 () ListLongMap!21361)

(declare-fun +!4690 (ListLongMap!21361 tuple2!23704) ListLongMap!21361)

(assert (=> b!1331645 (contains!8860 (+!4690 lt!591633 (tuple2!23705 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-datatypes ((Unit!43829 0))(
  ( (Unit!43830) )
))
(declare-fun lt!591632 () Unit!43829)

(declare-fun addStillContains!1169 (ListLongMap!21361 (_ BitVec 64) V!53971 (_ BitVec 64)) Unit!43829)

(assert (=> b!1331645 (= lt!591632 (addStillContains!1169 lt!591633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> b!1331645 (contains!8860 lt!591633 k0!1153)))

(declare-fun lt!591630 () V!53971)

(declare-fun lt!591631 () Unit!43829)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!277 ((_ BitVec 64) (_ BitVec 64) V!53971 ListLongMap!21361) Unit!43829)

(assert (=> b!1331645 (= lt!591631 (lemmaInListMapAfterAddingDiffThenInBefore!277 k0!1153 (select (arr!43558 _keys!1590) from!1980) lt!591630 lt!591633))))

(declare-fun lt!591629 () ListLongMap!21361)

(assert (=> b!1331645 (contains!8860 lt!591629 k0!1153)))

(declare-fun lt!591634 () Unit!43829)

(assert (=> b!1331645 (= lt!591634 (lemmaInListMapAfterAddingDiffThenInBefore!277 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591629))))

(assert (=> b!1331645 (= lt!591629 (+!4690 lt!591633 (tuple2!23705 (select (arr!43558 _keys!1590) from!1980) lt!591630)))))

(declare-fun get!21966 (ValueCell!17427 V!53971) V!53971)

(declare-fun dynLambda!3629 (Int (_ BitVec 64)) V!53971)

(assert (=> b!1331645 (= lt!591630 (get!21966 (select (arr!43557 _values!1320) from!1980) (dynLambda!3629 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6328 (array!90184 array!90182 (_ BitVec 32) (_ BitVec 32) V!53971 V!53971 (_ BitVec 32) Int) ListLongMap!21361)

(assert (=> b!1331645 (= lt!591633 (getCurrentListMapNoExtraKeys!6328 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1331646 () Bool)

(declare-fun e!758758 () Bool)

(assert (=> b!1331646 (= e!758758 tp_is_empty!36651)))

(declare-fun b!1331647 () Bool)

(declare-fun res!883666 () Bool)

(assert (=> b!1331647 (=> (not res!883666) (not e!758759))))

(assert (=> b!1331647 (= res!883666 (and (= (size!44107 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44108 _keys!1590) (size!44107 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56650 () Bool)

(declare-fun tp!107859 () Bool)

(assert (=> mapNonEmpty!56650 (= mapRes!56650 (and tp!107859 e!758758))))

(declare-fun mapValue!56650 () ValueCell!17427)

(declare-fun mapKey!56650 () (_ BitVec 32))

(declare-fun mapRest!56650 () (Array (_ BitVec 32) ValueCell!17427))

(assert (=> mapNonEmpty!56650 (= (arr!43557 _values!1320) (store mapRest!56650 mapKey!56650 mapValue!56650))))

(declare-fun b!1331648 () Bool)

(declare-fun res!883660 () Bool)

(assert (=> b!1331648 (=> (not res!883660) (not e!758759))))

(assert (=> b!1331648 (= res!883660 (not (= (select (arr!43558 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1331649 () Bool)

(declare-fun res!883663 () Bool)

(assert (=> b!1331649 (=> (not res!883663) (not e!758759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331649 (= res!883663 (validKeyInArray!0 (select (arr!43558 _keys!1590) from!1980)))))

(declare-fun b!1331650 () Bool)

(declare-fun res!883664 () Bool)

(assert (=> b!1331650 (=> (not res!883664) (not e!758759))))

(assert (=> b!1331650 (= res!883664 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44108 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1331651 () Bool)

(declare-fun res!883668 () Bool)

(assert (=> b!1331651 (=> (not res!883668) (not e!758759))))

(declare-datatypes ((List!30854 0))(
  ( (Nil!30851) (Cons!30850 (h!32059 (_ BitVec 64)) (t!45008 List!30854)) )
))
(declare-fun arrayNoDuplicates!0 (array!90184 (_ BitVec 32) List!30854) Bool)

(assert (=> b!1331651 (= res!883668 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30851))))

(declare-fun b!1331652 () Bool)

(assert (=> b!1331652 (= e!758761 (and e!758757 mapRes!56650))))

(declare-fun condMapEmpty!56650 () Bool)

(declare-fun mapDefault!56650 () ValueCell!17427)

(assert (=> b!1331652 (= condMapEmpty!56650 (= (arr!43557 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17427)) mapDefault!56650)))))

(assert (= (and start!112346 res!883662) b!1331647))

(assert (= (and b!1331647 res!883666) b!1331644))

(assert (= (and b!1331644 res!883667) b!1331651))

(assert (= (and b!1331651 res!883668) b!1331650))

(assert (= (and b!1331650 res!883664) b!1331643))

(assert (= (and b!1331643 res!883665) b!1331648))

(assert (= (and b!1331648 res!883660) b!1331649))

(assert (= (and b!1331649 res!883663) b!1331642))

(assert (= (and b!1331642 res!883661) b!1331645))

(assert (= (and b!1331652 condMapEmpty!56650) mapIsEmpty!56650))

(assert (= (and b!1331652 (not condMapEmpty!56650)) mapNonEmpty!56650))

(get-info :version)

(assert (= (and mapNonEmpty!56650 ((_ is ValueCellFull!17427) mapValue!56650)) b!1331646))

(assert (= (and b!1331652 ((_ is ValueCellFull!17427) mapDefault!56650)) b!1331641))

(assert (= start!112346 b!1331652))

(declare-fun b_lambda!24001 () Bool)

(assert (=> (not b_lambda!24001) (not b!1331645)))

(declare-fun t!45006 () Bool)

(declare-fun tb!11957 () Bool)

(assert (=> (and start!112346 (= defaultEntry!1323 defaultEntry!1323) t!45006) tb!11957))

(declare-fun result!24985 () Bool)

(assert (=> tb!11957 (= result!24985 tp_is_empty!36651)))

(assert (=> b!1331645 t!45006))

(declare-fun b_and!49539 () Bool)

(assert (= b_and!49537 (and (=> t!45006 result!24985) b_and!49539)))

(declare-fun m!1220327 () Bool)

(assert (=> b!1331645 m!1220327))

(declare-fun m!1220329 () Bool)

(assert (=> b!1331645 m!1220329))

(declare-fun m!1220331 () Bool)

(assert (=> b!1331645 m!1220331))

(declare-fun m!1220333 () Bool)

(assert (=> b!1331645 m!1220333))

(assert (=> b!1331645 m!1220331))

(declare-fun m!1220335 () Bool)

(assert (=> b!1331645 m!1220335))

(declare-fun m!1220337 () Bool)

(assert (=> b!1331645 m!1220337))

(declare-fun m!1220339 () Bool)

(assert (=> b!1331645 m!1220339))

(assert (=> b!1331645 m!1220327))

(declare-fun m!1220341 () Bool)

(assert (=> b!1331645 m!1220341))

(declare-fun m!1220343 () Bool)

(assert (=> b!1331645 m!1220343))

(assert (=> b!1331645 m!1220333))

(declare-fun m!1220345 () Bool)

(assert (=> b!1331645 m!1220345))

(declare-fun m!1220347 () Bool)

(assert (=> b!1331645 m!1220347))

(declare-fun m!1220349 () Bool)

(assert (=> b!1331645 m!1220349))

(assert (=> b!1331645 m!1220345))

(declare-fun m!1220351 () Bool)

(assert (=> b!1331645 m!1220351))

(declare-fun m!1220353 () Bool)

(assert (=> b!1331644 m!1220353))

(assert (=> b!1331649 m!1220345))

(assert (=> b!1331649 m!1220345))

(declare-fun m!1220355 () Bool)

(assert (=> b!1331649 m!1220355))

(declare-fun m!1220357 () Bool)

(assert (=> mapNonEmpty!56650 m!1220357))

(declare-fun m!1220359 () Bool)

(assert (=> start!112346 m!1220359))

(declare-fun m!1220361 () Bool)

(assert (=> start!112346 m!1220361))

(declare-fun m!1220363 () Bool)

(assert (=> start!112346 m!1220363))

(declare-fun m!1220365 () Bool)

(assert (=> b!1331643 m!1220365))

(assert (=> b!1331643 m!1220365))

(declare-fun m!1220367 () Bool)

(assert (=> b!1331643 m!1220367))

(declare-fun m!1220369 () Bool)

(assert (=> b!1331651 m!1220369))

(assert (=> b!1331648 m!1220345))

(check-sat (not b!1331649) (not start!112346) (not b_next!30741) (not b!1331645) (not b!1331644) (not mapNonEmpty!56650) tp_is_empty!36651 (not b_lambda!24001) (not b!1331651) b_and!49539 (not b!1331643))
(check-sat b_and!49539 (not b_next!30741))
