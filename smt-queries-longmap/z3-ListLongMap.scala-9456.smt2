; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112344 () Bool)

(assert start!112344)

(declare-fun b_free!30739 () Bool)

(declare-fun b_next!30739 () Bool)

(assert (=> start!112344 (= b_free!30739 (not b_next!30739))))

(declare-fun tp!107854 () Bool)

(declare-fun b_and!49515 () Bool)

(assert (=> start!112344 (= tp!107854 b_and!49515)))

(declare-fun b!1331533 () Bool)

(declare-fun res!883604 () Bool)

(declare-fun e!758709 () Bool)

(assert (=> b!1331533 (=> (not res!883604) (not e!758709))))

(declare-datatypes ((array!90117 0))(
  ( (array!90118 (arr!43525 (Array (_ BitVec 32) (_ BitVec 64))) (size!44077 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90117)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90117 (_ BitVec 32)) Bool)

(assert (=> b!1331533 (= res!883604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1331534 () Bool)

(declare-fun res!883605 () Bool)

(assert (=> b!1331534 (=> (not res!883605) (not e!758709))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1331534 (= res!883605 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44077 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1331535 () Bool)

(declare-fun res!883607 () Bool)

(assert (=> b!1331535 (=> (not res!883607) (not e!758709))))

(declare-datatypes ((V!53969 0))(
  ( (V!53970 (val!18399 Int)) )
))
(declare-datatypes ((ValueCell!17426 0))(
  ( (ValueCellFull!17426 (v!21035 V!53969)) (EmptyCell!17426) )
))
(declare-datatypes ((array!90119 0))(
  ( (array!90120 (arr!43526 (Array (_ BitVec 32) ValueCell!17426)) (size!44078 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90119)

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53969)

(declare-fun zeroValue!1262 () V!53969)

(declare-datatypes ((tuple2!23772 0))(
  ( (tuple2!23773 (_1!11897 (_ BitVec 64)) (_2!11897 V!53969)) )
))
(declare-datatypes ((List!30910 0))(
  ( (Nil!30907) (Cons!30906 (h!32115 tuple2!23772) (t!45054 List!30910)) )
))
(declare-datatypes ((ListLongMap!21429 0))(
  ( (ListLongMap!21430 (toList!10730 List!30910)) )
))
(declare-fun contains!8822 (ListLongMap!21429 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5590 (array!90117 array!90119 (_ BitVec 32) (_ BitVec 32) V!53969 V!53969 (_ BitVec 32) Int) ListLongMap!21429)

(assert (=> b!1331535 (= res!883607 (contains!8822 (getCurrentListMap!5590 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1331536 () Bool)

(declare-fun e!758713 () Bool)

(declare-fun tp_is_empty!36649 () Bool)

(assert (=> b!1331536 (= e!758713 tp_is_empty!36649)))

(declare-fun b!1331537 () Bool)

(declare-fun res!883612 () Bool)

(assert (=> b!1331537 (=> (not res!883612) (not e!758709))))

(assert (=> b!1331537 (= res!883612 (and (= (size!44078 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44077 _keys!1590) (size!44078 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1331538 () Bool)

(declare-fun res!883610 () Bool)

(assert (=> b!1331538 (=> (not res!883610) (not e!758709))))

(assert (=> b!1331538 (= res!883610 (not (= (select (arr!43525 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1331539 () Bool)

(declare-fun res!883606 () Bool)

(assert (=> b!1331539 (=> (not res!883606) (not e!758709))))

(declare-datatypes ((List!30911 0))(
  ( (Nil!30908) (Cons!30907 (h!32116 (_ BitVec 64)) (t!45055 List!30911)) )
))
(declare-fun arrayNoDuplicates!0 (array!90117 (_ BitVec 32) List!30911) Bool)

(assert (=> b!1331539 (= res!883606 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30908))))

(declare-fun res!883608 () Bool)

(assert (=> start!112344 (=> (not res!883608) (not e!758709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112344 (= res!883608 (validMask!0 mask!1998))))

(assert (=> start!112344 e!758709))

(declare-fun e!758712 () Bool)

(declare-fun array_inv!33013 (array!90119) Bool)

(assert (=> start!112344 (and (array_inv!33013 _values!1320) e!758712)))

(assert (=> start!112344 true))

(declare-fun array_inv!33014 (array!90117) Bool)

(assert (=> start!112344 (array_inv!33014 _keys!1590)))

(assert (=> start!112344 tp!107854))

(assert (=> start!112344 tp_is_empty!36649))

(declare-fun mapIsEmpty!56647 () Bool)

(declare-fun mapRes!56647 () Bool)

(assert (=> mapIsEmpty!56647 mapRes!56647))

(declare-fun b!1331540 () Bool)

(assert (=> b!1331540 (= e!758709 (not true))))

(declare-fun lt!591425 () ListLongMap!21429)

(declare-fun +!4709 (ListLongMap!21429 tuple2!23772) ListLongMap!21429)

(assert (=> b!1331540 (contains!8822 (+!4709 lt!591425 (tuple2!23773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-datatypes ((Unit!43630 0))(
  ( (Unit!43631) )
))
(declare-fun lt!591429 () Unit!43630)

(declare-fun addStillContains!1163 (ListLongMap!21429 (_ BitVec 64) V!53969 (_ BitVec 64)) Unit!43630)

(assert (=> b!1331540 (= lt!591429 (addStillContains!1163 lt!591425 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> b!1331540 (contains!8822 lt!591425 k0!1153)))

(declare-fun lt!591428 () Unit!43630)

(declare-fun lt!591430 () V!53969)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!265 ((_ BitVec 64) (_ BitVec 64) V!53969 ListLongMap!21429) Unit!43630)

(assert (=> b!1331540 (= lt!591428 (lemmaInListMapAfterAddingDiffThenInBefore!265 k0!1153 (select (arr!43525 _keys!1590) from!1980) lt!591430 lt!591425))))

(declare-fun lt!591426 () ListLongMap!21429)

(assert (=> b!1331540 (contains!8822 lt!591426 k0!1153)))

(declare-fun lt!591427 () Unit!43630)

(assert (=> b!1331540 (= lt!591427 (lemmaInListMapAfterAddingDiffThenInBefore!265 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591426))))

(assert (=> b!1331540 (= lt!591426 (+!4709 lt!591425 (tuple2!23773 (select (arr!43525 _keys!1590) from!1980) lt!591430)))))

(declare-fun get!21952 (ValueCell!17426 V!53969) V!53969)

(declare-fun dynLambda!3639 (Int (_ BitVec 64)) V!53969)

(assert (=> b!1331540 (= lt!591430 (get!21952 (select (arr!43526 _values!1320) from!1980) (dynLambda!3639 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6347 (array!90117 array!90119 (_ BitVec 32) (_ BitVec 32) V!53969 V!53969 (_ BitVec 32) Int) ListLongMap!21429)

(assert (=> b!1331540 (= lt!591425 (getCurrentListMapNoExtraKeys!6347 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1331541 () Bool)

(declare-fun res!883611 () Bool)

(assert (=> b!1331541 (=> (not res!883611) (not e!758709))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331541 (= res!883611 (validKeyInArray!0 (select (arr!43525 _keys!1590) from!1980)))))

(declare-fun mapNonEmpty!56647 () Bool)

(declare-fun tp!107855 () Bool)

(assert (=> mapNonEmpty!56647 (= mapRes!56647 (and tp!107855 e!758713))))

(declare-fun mapKey!56647 () (_ BitVec 32))

(declare-fun mapRest!56647 () (Array (_ BitVec 32) ValueCell!17426))

(declare-fun mapValue!56647 () ValueCell!17426)

(assert (=> mapNonEmpty!56647 (= (arr!43526 _values!1320) (store mapRest!56647 mapKey!56647 mapValue!56647))))

(declare-fun b!1331542 () Bool)

(declare-fun res!883609 () Bool)

(assert (=> b!1331542 (=> (not res!883609) (not e!758709))))

(assert (=> b!1331542 (= res!883609 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1331543 () Bool)

(declare-fun e!758711 () Bool)

(assert (=> b!1331543 (= e!758711 tp_is_empty!36649)))

(declare-fun b!1331544 () Bool)

(assert (=> b!1331544 (= e!758712 (and e!758711 mapRes!56647))))

(declare-fun condMapEmpty!56647 () Bool)

(declare-fun mapDefault!56647 () ValueCell!17426)

(assert (=> b!1331544 (= condMapEmpty!56647 (= (arr!43526 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17426)) mapDefault!56647)))))

(assert (= (and start!112344 res!883608) b!1331537))

(assert (= (and b!1331537 res!883612) b!1331533))

(assert (= (and b!1331533 res!883604) b!1331539))

(assert (= (and b!1331539 res!883606) b!1331534))

(assert (= (and b!1331534 res!883605) b!1331535))

(assert (= (and b!1331535 res!883607) b!1331538))

(assert (= (and b!1331538 res!883610) b!1331541))

(assert (= (and b!1331541 res!883611) b!1331542))

(assert (= (and b!1331542 res!883609) b!1331540))

(assert (= (and b!1331544 condMapEmpty!56647) mapIsEmpty!56647))

(assert (= (and b!1331544 (not condMapEmpty!56647)) mapNonEmpty!56647))

(get-info :version)

(assert (= (and mapNonEmpty!56647 ((_ is ValueCellFull!17426) mapValue!56647)) b!1331536))

(assert (= (and b!1331544 ((_ is ValueCellFull!17426) mapDefault!56647)) b!1331543))

(assert (= start!112344 b!1331544))

(declare-fun b_lambda!23989 () Bool)

(assert (=> (not b_lambda!23989) (not b!1331540)))

(declare-fun t!45053 () Bool)

(declare-fun tb!11947 () Bool)

(assert (=> (and start!112344 (= defaultEntry!1323 defaultEntry!1323) t!45053) tb!11947))

(declare-fun result!24973 () Bool)

(assert (=> tb!11947 (= result!24973 tp_is_empty!36649)))

(assert (=> b!1331540 t!45053))

(declare-fun b_and!49517 () Bool)

(assert (= b_and!49515 (and (=> t!45053 result!24973) b_and!49517)))

(declare-fun m!1219767 () Bool)

(assert (=> b!1331533 m!1219767))

(declare-fun m!1219769 () Bool)

(assert (=> b!1331539 m!1219769))

(declare-fun m!1219771 () Bool)

(assert (=> start!112344 m!1219771))

(declare-fun m!1219773 () Bool)

(assert (=> start!112344 m!1219773))

(declare-fun m!1219775 () Bool)

(assert (=> start!112344 m!1219775))

(declare-fun m!1219777 () Bool)

(assert (=> b!1331535 m!1219777))

(assert (=> b!1331535 m!1219777))

(declare-fun m!1219779 () Bool)

(assert (=> b!1331535 m!1219779))

(declare-fun m!1219781 () Bool)

(assert (=> b!1331540 m!1219781))

(declare-fun m!1219783 () Bool)

(assert (=> b!1331540 m!1219783))

(declare-fun m!1219785 () Bool)

(assert (=> b!1331540 m!1219785))

(declare-fun m!1219787 () Bool)

(assert (=> b!1331540 m!1219787))

(assert (=> b!1331540 m!1219785))

(declare-fun m!1219789 () Bool)

(assert (=> b!1331540 m!1219789))

(declare-fun m!1219791 () Bool)

(assert (=> b!1331540 m!1219791))

(declare-fun m!1219793 () Bool)

(assert (=> b!1331540 m!1219793))

(declare-fun m!1219795 () Bool)

(assert (=> b!1331540 m!1219795))

(declare-fun m!1219797 () Bool)

(assert (=> b!1331540 m!1219797))

(declare-fun m!1219799 () Bool)

(assert (=> b!1331540 m!1219799))

(declare-fun m!1219801 () Bool)

(assert (=> b!1331540 m!1219801))

(declare-fun m!1219803 () Bool)

(assert (=> b!1331540 m!1219803))

(assert (=> b!1331540 m!1219787))

(declare-fun m!1219805 () Bool)

(assert (=> b!1331540 m!1219805))

(assert (=> b!1331540 m!1219797))

(assert (=> b!1331540 m!1219781))

(assert (=> b!1331541 m!1219781))

(assert (=> b!1331541 m!1219781))

(declare-fun m!1219807 () Bool)

(assert (=> b!1331541 m!1219807))

(declare-fun m!1219809 () Bool)

(assert (=> mapNonEmpty!56647 m!1219809))

(assert (=> b!1331538 m!1219781))

(check-sat (not b_lambda!23989) (not b!1331539) (not b_next!30739) (not mapNonEmpty!56647) b_and!49517 (not b!1331540) (not b!1331541) (not start!112344) (not b!1331533) (not b!1331535) tp_is_empty!36649)
(check-sat b_and!49517 (not b_next!30739))
