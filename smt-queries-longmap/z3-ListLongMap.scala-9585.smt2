; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113372 () Bool)

(assert start!113372)

(declare-fun b_free!31423 () Bool)

(declare-fun b_next!31423 () Bool)

(assert (=> start!113372 (= b_free!31423 (not b_next!31423))))

(declare-fun tp!110074 () Bool)

(declare-fun b_and!50681 () Bool)

(assert (=> start!113372 (= tp!110074 b_and!50681)))

(declare-fun mapIsEmpty!57841 () Bool)

(declare-fun mapRes!57841 () Bool)

(assert (=> mapIsEmpty!57841 mapRes!57841))

(declare-fun b!1345641 () Bool)

(declare-fun e!765682 () Bool)

(declare-fun tp_is_empty!37423 () Bool)

(assert (=> b!1345641 (= e!765682 tp_is_empty!37423)))

(declare-fun b!1345642 () Bool)

(declare-fun res!892916 () Bool)

(declare-fun e!765685 () Bool)

(assert (=> b!1345642 (=> (not res!892916) (not e!765685))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91629 0))(
  ( (array!91630 (arr!44271 (Array (_ BitVec 32) (_ BitVec 64))) (size!44823 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91629)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1345642 (= res!892916 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44823 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1345643 () Bool)

(declare-fun res!892915 () Bool)

(assert (=> b!1345643 (=> (not res!892915) (not e!765685))))

(declare-datatypes ((List!31419 0))(
  ( (Nil!31416) (Cons!31415 (h!32624 (_ BitVec 64)) (t!45991 List!31419)) )
))
(declare-fun arrayNoDuplicates!0 (array!91629 (_ BitVec 32) List!31419) Bool)

(assert (=> b!1345643 (= res!892915 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31416))))

(declare-fun b!1345644 () Bool)

(declare-fun e!765684 () Bool)

(assert (=> b!1345644 (= e!765684 (not true))))

(declare-datatypes ((V!55001 0))(
  ( (V!55002 (val!18786 Int)) )
))
(declare-datatypes ((tuple2!24284 0))(
  ( (tuple2!24285 (_1!12153 (_ BitVec 64)) (_2!12153 V!55001)) )
))
(declare-datatypes ((List!31420 0))(
  ( (Nil!31417) (Cons!31416 (h!32625 tuple2!24284) (t!45992 List!31420)) )
))
(declare-datatypes ((ListLongMap!21941 0))(
  ( (ListLongMap!21942 (toList!10986 List!31420)) )
))
(declare-fun lt!595219 () ListLongMap!21941)

(declare-fun contains!9091 (ListLongMap!21941 (_ BitVec 64)) Bool)

(assert (=> b!1345644 (contains!9091 lt!595219 k0!1142)))

(declare-datatypes ((Unit!43960 0))(
  ( (Unit!43961) )
))
(declare-fun lt!595220 () Unit!43960)

(declare-fun lt!595221 () V!55001)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!398 ((_ BitVec 64) (_ BitVec 64) V!55001 ListLongMap!21941) Unit!43960)

(assert (=> b!1345644 (= lt!595220 (lemmaInListMapAfterAddingDiffThenInBefore!398 k0!1142 (select (arr!44271 _keys!1571) from!1960) lt!595221 lt!595219))))

(declare-fun b!1345645 () Bool)

(declare-fun res!892917 () Bool)

(assert (=> b!1345645 (=> (not res!892917) (not e!765685))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91629 (_ BitVec 32)) Bool)

(assert (=> b!1345645 (= res!892917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1345646 () Bool)

(declare-fun res!892920 () Bool)

(assert (=> b!1345646 (=> (not res!892920) (not e!765685))))

(declare-datatypes ((ValueCell!17813 0))(
  ( (ValueCellFull!17813 (v!21433 V!55001)) (EmptyCell!17813) )
))
(declare-datatypes ((array!91631 0))(
  ( (array!91632 (arr!44272 (Array (_ BitVec 32) ValueCell!17813)) (size!44824 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91631)

(assert (=> b!1345646 (= res!892920 (and (= (size!44824 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44823 _keys!1571) (size!44824 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1345647 () Bool)

(declare-fun res!892921 () Bool)

(assert (=> b!1345647 (=> (not res!892921) (not e!765685))))

(assert (=> b!1345647 (= res!892921 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1345648 () Bool)

(declare-fun res!892918 () Bool)

(assert (=> b!1345648 (=> (not res!892918) (not e!765685))))

(declare-fun minValue!1245 () V!55001)

(declare-fun zeroValue!1245 () V!55001)

(declare-fun defaultEntry!1306 () Int)

(declare-fun getCurrentListMap!5826 (array!91629 array!91631 (_ BitVec 32) (_ BitVec 32) V!55001 V!55001 (_ BitVec 32) Int) ListLongMap!21941)

(assert (=> b!1345648 (= res!892918 (contains!9091 (getCurrentListMap!5826 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1345649 () Bool)

(declare-fun res!892911 () Bool)

(assert (=> b!1345649 (=> (not res!892911) (not e!765685))))

(assert (=> b!1345649 (= res!892911 (not (= (select (arr!44271 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1345640 () Bool)

(declare-fun res!892912 () Bool)

(assert (=> b!1345640 (=> (not res!892912) (not e!765685))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1345640 (= res!892912 (validKeyInArray!0 (select (arr!44271 _keys!1571) from!1960)))))

(declare-fun res!892919 () Bool)

(assert (=> start!113372 (=> (not res!892919) (not e!765685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113372 (= res!892919 (validMask!0 mask!1977))))

(assert (=> start!113372 e!765685))

(assert (=> start!113372 tp_is_empty!37423))

(assert (=> start!113372 true))

(declare-fun array_inv!33555 (array!91629) Bool)

(assert (=> start!113372 (array_inv!33555 _keys!1571)))

(declare-fun e!765681 () Bool)

(declare-fun array_inv!33556 (array!91631) Bool)

(assert (=> start!113372 (and (array_inv!33556 _values!1303) e!765681)))

(assert (=> start!113372 tp!110074))

(declare-fun b!1345650 () Bool)

(assert (=> b!1345650 (= e!765681 (and e!765682 mapRes!57841))))

(declare-fun condMapEmpty!57841 () Bool)

(declare-fun mapDefault!57841 () ValueCell!17813)

(assert (=> b!1345650 (= condMapEmpty!57841 (= (arr!44272 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17813)) mapDefault!57841)))))

(declare-fun b!1345651 () Bool)

(declare-fun res!892914 () Bool)

(assert (=> b!1345651 (=> (not res!892914) (not e!765684))))

(assert (=> b!1345651 (= res!892914 (not (= k0!1142 (select (arr!44271 _keys!1571) from!1960))))))

(declare-fun mapNonEmpty!57841 () Bool)

(declare-fun tp!110075 () Bool)

(declare-fun e!765686 () Bool)

(assert (=> mapNonEmpty!57841 (= mapRes!57841 (and tp!110075 e!765686))))

(declare-fun mapValue!57841 () ValueCell!17813)

(declare-fun mapKey!57841 () (_ BitVec 32))

(declare-fun mapRest!57841 () (Array (_ BitVec 32) ValueCell!17813))

(assert (=> mapNonEmpty!57841 (= (arr!44272 _values!1303) (store mapRest!57841 mapKey!57841 mapValue!57841))))

(declare-fun b!1345652 () Bool)

(assert (=> b!1345652 (= e!765686 tp_is_empty!37423)))

(declare-fun b!1345653 () Bool)

(assert (=> b!1345653 (= e!765685 e!765684)))

(declare-fun res!892913 () Bool)

(assert (=> b!1345653 (=> (not res!892913) (not e!765684))))

(declare-fun +!4860 (ListLongMap!21941 tuple2!24284) ListLongMap!21941)

(assert (=> b!1345653 (= res!892913 (contains!9091 (+!4860 lt!595219 (tuple2!24285 (select (arr!44271 _keys!1571) from!1960) lt!595221)) k0!1142))))

(declare-fun getCurrentListMapNoExtraKeys!6503 (array!91629 array!91631 (_ BitVec 32) (_ BitVec 32) V!55001 V!55001 (_ BitVec 32) Int) ListLongMap!21941)

(assert (=> b!1345653 (= lt!595219 (getCurrentListMapNoExtraKeys!6503 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22374 (ValueCell!17813 V!55001) V!55001)

(declare-fun dynLambda!3790 (Int (_ BitVec 64)) V!55001)

(assert (=> b!1345653 (= lt!595221 (get!22374 (select (arr!44272 _values!1303) from!1960) (dynLambda!3790 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!113372 res!892919) b!1345646))

(assert (= (and b!1345646 res!892920) b!1345645))

(assert (= (and b!1345645 res!892917) b!1345643))

(assert (= (and b!1345643 res!892915) b!1345642))

(assert (= (and b!1345642 res!892916) b!1345648))

(assert (= (and b!1345648 res!892918) b!1345649))

(assert (= (and b!1345649 res!892911) b!1345640))

(assert (= (and b!1345640 res!892912) b!1345647))

(assert (= (and b!1345647 res!892921) b!1345653))

(assert (= (and b!1345653 res!892913) b!1345651))

(assert (= (and b!1345651 res!892914) b!1345644))

(assert (= (and b!1345650 condMapEmpty!57841) mapIsEmpty!57841))

(assert (= (and b!1345650 (not condMapEmpty!57841)) mapNonEmpty!57841))

(get-info :version)

(assert (= (and mapNonEmpty!57841 ((_ is ValueCellFull!17813) mapValue!57841)) b!1345652))

(assert (= (and b!1345650 ((_ is ValueCellFull!17813) mapDefault!57841)) b!1345641))

(assert (= start!113372 b!1345650))

(declare-fun b_lambda!24535 () Bool)

(assert (=> (not b_lambda!24535) (not b!1345653)))

(declare-fun t!45990 () Bool)

(declare-fun tb!12375 () Bool)

(assert (=> (and start!113372 (= defaultEntry!1306 defaultEntry!1306) t!45990) tb!12375))

(declare-fun result!25849 () Bool)

(assert (=> tb!12375 (= result!25849 tp_is_empty!37423)))

(assert (=> b!1345653 t!45990))

(declare-fun b_and!50683 () Bool)

(assert (= b_and!50681 (and (=> t!45990 result!25849) b_and!50683)))

(declare-fun m!1232539 () Bool)

(assert (=> b!1345651 m!1232539))

(declare-fun m!1232541 () Bool)

(assert (=> b!1345644 m!1232541))

(assert (=> b!1345644 m!1232539))

(assert (=> b!1345644 m!1232539))

(declare-fun m!1232543 () Bool)

(assert (=> b!1345644 m!1232543))

(declare-fun m!1232545 () Bool)

(assert (=> b!1345643 m!1232545))

(declare-fun m!1232547 () Bool)

(assert (=> b!1345653 m!1232547))

(declare-fun m!1232549 () Bool)

(assert (=> b!1345653 m!1232549))

(declare-fun m!1232551 () Bool)

(assert (=> b!1345653 m!1232551))

(declare-fun m!1232553 () Bool)

(assert (=> b!1345653 m!1232553))

(assert (=> b!1345653 m!1232549))

(declare-fun m!1232555 () Bool)

(assert (=> b!1345653 m!1232555))

(assert (=> b!1345653 m!1232551))

(assert (=> b!1345653 m!1232555))

(declare-fun m!1232557 () Bool)

(assert (=> b!1345653 m!1232557))

(assert (=> b!1345653 m!1232539))

(declare-fun m!1232559 () Bool)

(assert (=> b!1345645 m!1232559))

(declare-fun m!1232561 () Bool)

(assert (=> b!1345648 m!1232561))

(assert (=> b!1345648 m!1232561))

(declare-fun m!1232563 () Bool)

(assert (=> b!1345648 m!1232563))

(assert (=> b!1345649 m!1232539))

(declare-fun m!1232565 () Bool)

(assert (=> start!113372 m!1232565))

(declare-fun m!1232567 () Bool)

(assert (=> start!113372 m!1232567))

(declare-fun m!1232569 () Bool)

(assert (=> start!113372 m!1232569))

(declare-fun m!1232571 () Bool)

(assert (=> mapNonEmpty!57841 m!1232571))

(assert (=> b!1345640 m!1232539))

(assert (=> b!1345640 m!1232539))

(declare-fun m!1232573 () Bool)

(assert (=> b!1345640 m!1232573))

(check-sat b_and!50683 (not mapNonEmpty!57841) (not b!1345640) (not b!1345643) (not b!1345645) (not b_next!31423) tp_is_empty!37423 (not b!1345653) (not start!113372) (not b_lambda!24535) (not b!1345644) (not b!1345648))
(check-sat b_and!50683 (not b_next!31423))
