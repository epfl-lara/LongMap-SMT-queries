; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112304 () Bool)

(assert start!112304)

(declare-fun b_free!30699 () Bool)

(declare-fun b_next!30699 () Bool)

(assert (=> start!112304 (= b_free!30699 (not b_next!30699))))

(declare-fun tp!107734 () Bool)

(declare-fun b_and!49453 () Bool)

(assert (=> start!112304 (= tp!107734 b_and!49453)))

(declare-fun b!1330843 () Bool)

(declare-fun res!883093 () Bool)

(declare-fun e!758442 () Bool)

(assert (=> b!1330843 (=> (not res!883093) (not e!758442))))

(declare-datatypes ((V!53915 0))(
  ( (V!53916 (val!18379 Int)) )
))
(declare-datatypes ((ValueCell!17406 0))(
  ( (ValueCellFull!17406 (v!21016 V!53915)) (EmptyCell!17406) )
))
(declare-datatypes ((array!90102 0))(
  ( (array!90103 (arr!43517 (Array (_ BitVec 32) ValueCell!17406)) (size!44067 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90102)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90104 0))(
  ( (array!90105 (arr!43518 (Array (_ BitVec 32) (_ BitVec 64))) (size!44068 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90104)

(assert (=> b!1330843 (= res!883093 (and (= (size!44067 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44068 _keys!1590) (size!44067 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56587 () Bool)

(declare-fun mapRes!56587 () Bool)

(declare-fun tp!107733 () Bool)

(declare-fun e!758444 () Bool)

(assert (=> mapNonEmpty!56587 (= mapRes!56587 (and tp!107733 e!758444))))

(declare-fun mapKey!56587 () (_ BitVec 32))

(declare-fun mapRest!56587 () (Array (_ BitVec 32) ValueCell!17406))

(declare-fun mapValue!56587 () ValueCell!17406)

(assert (=> mapNonEmpty!56587 (= (arr!43517 _values!1320) (store mapRest!56587 mapKey!56587 mapValue!56587))))

(declare-fun b!1330844 () Bool)

(assert (=> b!1330844 (= e!758442 (not true))))

(declare-datatypes ((tuple2!23670 0))(
  ( (tuple2!23671 (_1!11846 (_ BitVec 64)) (_2!11846 V!53915)) )
))
(declare-datatypes ((List!30820 0))(
  ( (Nil!30817) (Cons!30816 (h!32025 tuple2!23670) (t!44932 List!30820)) )
))
(declare-datatypes ((ListLongMap!21327 0))(
  ( (ListLongMap!21328 (toList!10679 List!30820)) )
))
(declare-fun lt!591304 () ListLongMap!21327)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8843 (ListLongMap!21327 (_ BitVec 64)) Bool)

(assert (=> b!1330844 (contains!8843 lt!591304 k0!1153)))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lt!591300 () V!53915)

(declare-datatypes ((Unit!43801 0))(
  ( (Unit!43802) )
))
(declare-fun lt!591303 () Unit!43801)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!263 ((_ BitVec 64) (_ BitVec 64) V!53915 ListLongMap!21327) Unit!43801)

(assert (=> b!1330844 (= lt!591303 (lemmaInListMapAfterAddingDiffThenInBefore!263 k0!1153 (select (arr!43518 _keys!1590) from!1980) lt!591300 lt!591304))))

(declare-fun lt!591301 () ListLongMap!21327)

(assert (=> b!1330844 (contains!8843 lt!591301 k0!1153)))

(declare-fun lt!591302 () Unit!43801)

(declare-fun minValue!1262 () V!53915)

(assert (=> b!1330844 (= lt!591302 (lemmaInListMapAfterAddingDiffThenInBefore!263 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591301))))

(declare-fun +!4676 (ListLongMap!21327 tuple2!23670) ListLongMap!21327)

(assert (=> b!1330844 (= lt!591301 (+!4676 lt!591304 (tuple2!23671 (select (arr!43518 _keys!1590) from!1980) lt!591300)))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21938 (ValueCell!17406 V!53915) V!53915)

(declare-fun dynLambda!3615 (Int (_ BitVec 64)) V!53915)

(assert (=> b!1330844 (= lt!591300 (get!21938 (select (arr!43517 _values!1320) from!1980) (dynLambda!3615 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1262 () V!53915)

(declare-fun getCurrentListMapNoExtraKeys!6314 (array!90104 array!90102 (_ BitVec 32) (_ BitVec 32) V!53915 V!53915 (_ BitVec 32) Int) ListLongMap!21327)

(assert (=> b!1330844 (= lt!591304 (getCurrentListMapNoExtraKeys!6314 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1330845 () Bool)

(declare-fun res!883097 () Bool)

(assert (=> b!1330845 (=> (not res!883097) (not e!758442))))

(declare-datatypes ((List!30821 0))(
  ( (Nil!30818) (Cons!30817 (h!32026 (_ BitVec 64)) (t!44933 List!30821)) )
))
(declare-fun arrayNoDuplicates!0 (array!90104 (_ BitVec 32) List!30821) Bool)

(assert (=> b!1330845 (= res!883097 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30818))))

(declare-fun b!1330846 () Bool)

(declare-fun res!883098 () Bool)

(assert (=> b!1330846 (=> (not res!883098) (not e!758442))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330846 (= res!883098 (validKeyInArray!0 (select (arr!43518 _keys!1590) from!1980)))))

(declare-fun res!883096 () Bool)

(assert (=> start!112304 (=> (not res!883096) (not e!758442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112304 (= res!883096 (validMask!0 mask!1998))))

(assert (=> start!112304 e!758442))

(declare-fun e!758445 () Bool)

(declare-fun array_inv!32827 (array!90102) Bool)

(assert (=> start!112304 (and (array_inv!32827 _values!1320) e!758445)))

(assert (=> start!112304 true))

(declare-fun array_inv!32828 (array!90104) Bool)

(assert (=> start!112304 (array_inv!32828 _keys!1590)))

(assert (=> start!112304 tp!107734))

(declare-fun tp_is_empty!36609 () Bool)

(assert (=> start!112304 tp_is_empty!36609))

(declare-fun b!1330847 () Bool)

(declare-fun res!883094 () Bool)

(assert (=> b!1330847 (=> (not res!883094) (not e!758442))))

(assert (=> b!1330847 (= res!883094 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1330848 () Bool)

(assert (=> b!1330848 (= e!758444 tp_is_empty!36609)))

(declare-fun b!1330849 () Bool)

(declare-fun e!758443 () Bool)

(assert (=> b!1330849 (= e!758443 tp_is_empty!36609)))

(declare-fun b!1330850 () Bool)

(declare-fun res!883101 () Bool)

(assert (=> b!1330850 (=> (not res!883101) (not e!758442))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90104 (_ BitVec 32)) Bool)

(assert (=> b!1330850 (= res!883101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1330851 () Bool)

(declare-fun res!883099 () Bool)

(assert (=> b!1330851 (=> (not res!883099) (not e!758442))))

(assert (=> b!1330851 (= res!883099 (not (= (select (arr!43518 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1330852 () Bool)

(declare-fun res!883100 () Bool)

(assert (=> b!1330852 (=> (not res!883100) (not e!758442))))

(declare-fun getCurrentListMap!5665 (array!90104 array!90102 (_ BitVec 32) (_ BitVec 32) V!53915 V!53915 (_ BitVec 32) Int) ListLongMap!21327)

(assert (=> b!1330852 (= res!883100 (contains!8843 (getCurrentListMap!5665 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1330853 () Bool)

(declare-fun res!883095 () Bool)

(assert (=> b!1330853 (=> (not res!883095) (not e!758442))))

(assert (=> b!1330853 (= res!883095 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44068 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!56587 () Bool)

(assert (=> mapIsEmpty!56587 mapRes!56587))

(declare-fun b!1330854 () Bool)

(assert (=> b!1330854 (= e!758445 (and e!758443 mapRes!56587))))

(declare-fun condMapEmpty!56587 () Bool)

(declare-fun mapDefault!56587 () ValueCell!17406)

(assert (=> b!1330854 (= condMapEmpty!56587 (= (arr!43517 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17406)) mapDefault!56587)))))

(assert (= (and start!112304 res!883096) b!1330843))

(assert (= (and b!1330843 res!883093) b!1330850))

(assert (= (and b!1330850 res!883101) b!1330845))

(assert (= (and b!1330845 res!883097) b!1330853))

(assert (= (and b!1330853 res!883095) b!1330852))

(assert (= (and b!1330852 res!883100) b!1330851))

(assert (= (and b!1330851 res!883099) b!1330846))

(assert (= (and b!1330846 res!883098) b!1330847))

(assert (= (and b!1330847 res!883094) b!1330844))

(assert (= (and b!1330854 condMapEmpty!56587) mapIsEmpty!56587))

(assert (= (and b!1330854 (not condMapEmpty!56587)) mapNonEmpty!56587))

(get-info :version)

(assert (= (and mapNonEmpty!56587 ((_ is ValueCellFull!17406) mapValue!56587)) b!1330848))

(assert (= (and b!1330854 ((_ is ValueCellFull!17406) mapDefault!56587)) b!1330849))

(assert (= start!112304 b!1330854))

(declare-fun b_lambda!23959 () Bool)

(assert (=> (not b_lambda!23959) (not b!1330844)))

(declare-fun t!44931 () Bool)

(declare-fun tb!11915 () Bool)

(assert (=> (and start!112304 (= defaultEntry!1323 defaultEntry!1323) t!44931) tb!11915))

(declare-fun result!24901 () Bool)

(assert (=> tb!11915 (= result!24901 tp_is_empty!36609)))

(assert (=> b!1330844 t!44931))

(declare-fun b_and!49455 () Bool)

(assert (= b_and!49453 (and (=> t!44931 result!24901) b_and!49455)))

(declare-fun m!1219505 () Bool)

(assert (=> b!1330850 m!1219505))

(declare-fun m!1219507 () Bool)

(assert (=> b!1330844 m!1219507))

(declare-fun m!1219509 () Bool)

(assert (=> b!1330844 m!1219509))

(assert (=> b!1330844 m!1219507))

(declare-fun m!1219511 () Bool)

(assert (=> b!1330844 m!1219511))

(declare-fun m!1219513 () Bool)

(assert (=> b!1330844 m!1219513))

(declare-fun m!1219515 () Bool)

(assert (=> b!1330844 m!1219515))

(declare-fun m!1219517 () Bool)

(assert (=> b!1330844 m!1219517))

(declare-fun m!1219519 () Bool)

(assert (=> b!1330844 m!1219519))

(assert (=> b!1330844 m!1219513))

(declare-fun m!1219521 () Bool)

(assert (=> b!1330844 m!1219521))

(declare-fun m!1219523 () Bool)

(assert (=> b!1330844 m!1219523))

(assert (=> b!1330844 m!1219509))

(declare-fun m!1219525 () Bool)

(assert (=> b!1330844 m!1219525))

(declare-fun m!1219527 () Bool)

(assert (=> mapNonEmpty!56587 m!1219527))

(declare-fun m!1219529 () Bool)

(assert (=> start!112304 m!1219529))

(declare-fun m!1219531 () Bool)

(assert (=> start!112304 m!1219531))

(declare-fun m!1219533 () Bool)

(assert (=> start!112304 m!1219533))

(assert (=> b!1330846 m!1219513))

(assert (=> b!1330846 m!1219513))

(declare-fun m!1219535 () Bool)

(assert (=> b!1330846 m!1219535))

(declare-fun m!1219537 () Bool)

(assert (=> b!1330852 m!1219537))

(assert (=> b!1330852 m!1219537))

(declare-fun m!1219539 () Bool)

(assert (=> b!1330852 m!1219539))

(declare-fun m!1219541 () Bool)

(assert (=> b!1330845 m!1219541))

(assert (=> b!1330851 m!1219513))

(check-sat (not b_next!30699) tp_is_empty!36609 (not b!1330844) (not b!1330850) (not start!112304) (not b!1330846) (not mapNonEmpty!56587) (not b!1330852) (not b!1330845) (not b_lambda!23959) b_and!49455)
(check-sat b_and!49455 (not b_next!30699))
