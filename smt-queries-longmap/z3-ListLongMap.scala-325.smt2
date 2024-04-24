; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5936 () Bool)

(assert start!5936)

(declare-fun b_free!1411 () Bool)

(declare-fun b_next!1411 () Bool)

(assert (=> start!5936 (= b_free!1411 (not b_next!1411))))

(declare-fun tp!5804 () Bool)

(declare-fun b_and!2469 () Bool)

(assert (=> start!5936 (= tp!5804 b_and!2469)))

(declare-fun b!41571 () Bool)

(declare-fun res!24749 () Bool)

(declare-fun e!26288 () Bool)

(assert (=> b!41571 (=> res!24749 e!26288)))

(declare-fun mask!853 () (_ BitVec 32))

(assert (=> b!41571 (= res!24749 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun b!41570 () Bool)

(declare-fun res!24751 () Bool)

(assert (=> b!41570 (=> res!24751 e!26288)))

(declare-datatypes ((V!2161 0))(
  ( (V!2162 (val!939 Int)) )
))
(declare-datatypes ((tuple2!1514 0))(
  ( (tuple2!1515 (_1!768 (_ BitVec 64)) (_2!768 V!2161)) )
))
(declare-datatypes ((List!1086 0))(
  ( (Nil!1083) (Cons!1082 (h!1659 tuple2!1514) (t!3993 List!1086)) )
))
(declare-datatypes ((ListLongMap!1085 0))(
  ( (ListLongMap!1086 (toList!558 List!1086)) )
))
(declare-fun lt!16643 () ListLongMap!1085)

(declare-fun isEmpty!260 (List!1086) Bool)

(assert (=> b!41570 (= res!24751 (isEmpty!260 (toList!558 lt!16643)))))

(declare-fun b!41572 () Bool)

(assert (=> b!41572 (= e!26288 true)))

(declare-fun lt!16647 () V!2161)

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!16644 () Bool)

(declare-datatypes ((ValueCell!653 0))(
  ( (ValueCellFull!653 (v!2024 V!2161)) (EmptyCell!653) )
))
(declare-datatypes ((array!2673 0))(
  ( (array!2674 (arr!1280 (Array (_ BitVec 32) ValueCell!653)) (size!1432 (_ BitVec 32))) )
))
(declare-fun lt!16646 () array!2673)

(declare-datatypes ((array!2675 0))(
  ( (array!2676 (arr!1281 (Array (_ BitVec 32) (_ BitVec 64))) (size!1433 (_ BitVec 32))) )
))
(declare-fun lt!16641 () array!2675)

(declare-fun contains!529 (ListLongMap!1085 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!315 (array!2675 array!2673 (_ BitVec 32) (_ BitVec 32) V!2161 V!2161 (_ BitVec 32) Int) ListLongMap!1085)

(declare-fun head!867 (List!1086) tuple2!1514)

(assert (=> b!41572 (= lt!16644 (contains!529 (getCurrentListMap!315 lt!16641 lt!16646 mask!853 #b00000000000000000000000000000000 lt!16647 lt!16647 #b00000000000000000000000000000000 defaultEntry!470) (_1!768 (head!867 (toList!558 lt!16643)))))))

(declare-fun b!41569 () Bool)

(declare-fun e!26289 () Bool)

(assert (=> b!41569 (= e!26289 (not e!26288))))

(declare-fun res!24750 () Bool)

(assert (=> b!41569 (=> res!24750 e!26288)))

(assert (=> b!41569 (= res!24750 (= lt!16643 (ListLongMap!1086 Nil!1083)))))

(declare-datatypes ((LongMapFixedSize!286 0))(
  ( (LongMapFixedSize!287 (defaultEntry!1833 Int) (mask!5246 (_ BitVec 32)) (extraKeys!1724 (_ BitVec 32)) (zeroValue!1751 V!2161) (minValue!1751 V!2161) (_size!192 (_ BitVec 32)) (_keys!3340 array!2675) (_values!1816 array!2673) (_vacant!192 (_ BitVec 32))) )
))
(declare-fun map!729 (LongMapFixedSize!286) ListLongMap!1085)

(assert (=> b!41569 (= lt!16643 (map!729 (LongMapFixedSize!287 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16647 lt!16647 #b00000000000000000000000000000000 lt!16641 lt!16646 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1087 0))(
  ( (Nil!1084) (Cons!1083 (h!1660 (_ BitVec 64)) (t!3994 List!1087)) )
))
(declare-fun arrayNoDuplicates!0 (array!2675 (_ BitVec 32) List!1087) Bool)

(assert (=> b!41569 (arrayNoDuplicates!0 lt!16641 #b00000000000000000000000000000000 Nil!1084)))

(declare-datatypes ((Unit!1053 0))(
  ( (Unit!1054) )
))
(declare-fun lt!16642 () Unit!1053)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2675 (_ BitVec 32) (_ BitVec 32) List!1087) Unit!1053)

(assert (=> b!41569 (= lt!16642 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16641 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1084))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2675 (_ BitVec 32)) Bool)

(assert (=> b!41569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16641 mask!853)))

(declare-fun lt!16645 () Unit!1053)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2675 (_ BitVec 32) (_ BitVec 32)) Unit!1053)

(assert (=> b!41569 (= lt!16645 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16641 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2675 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41569 (= (arrayCountValidKeys!0 lt!16641 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16648 () Unit!1053)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2675 (_ BitVec 32) (_ BitVec 32)) Unit!1053)

(assert (=> b!41569 (= lt!16648 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16641 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41569 (= lt!16646 (array!2674 ((as const (Array (_ BitVec 32) ValueCell!653)) EmptyCell!653) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41569 (= lt!16641 (array!2676 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!210 (Int (_ BitVec 64)) V!2161)

(assert (=> b!41569 (= lt!16647 (dynLambda!210 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!24752 () Bool)

(assert (=> start!5936 (=> (not res!24752) (not e!26289))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5936 (= res!24752 (validMask!0 mask!853))))

(assert (=> start!5936 e!26289))

(assert (=> start!5936 true))

(assert (=> start!5936 tp!5804))

(assert (= (and start!5936 res!24752) b!41569))

(assert (= (and b!41569 (not res!24750)) b!41570))

(assert (= (and b!41570 (not res!24751)) b!41571))

(assert (= (and b!41571 (not res!24749)) b!41572))

(declare-fun b_lambda!2135 () Bool)

(assert (=> (not b_lambda!2135) (not b!41569)))

(declare-fun t!3992 () Bool)

(declare-fun tb!893 () Bool)

(assert (=> (and start!5936 (= defaultEntry!470 defaultEntry!470) t!3992) tb!893))

(declare-fun result!1537 () Bool)

(declare-fun tp_is_empty!1801 () Bool)

(assert (=> tb!893 (= result!1537 tp_is_empty!1801)))

(assert (=> b!41569 t!3992))

(declare-fun b_and!2471 () Bool)

(assert (= b_and!2469 (and (=> t!3992 result!1537) b_and!2471)))

(declare-fun m!34927 () Bool)

(assert (=> b!41570 m!34927))

(declare-fun m!34929 () Bool)

(assert (=> b!41572 m!34929))

(declare-fun m!34931 () Bool)

(assert (=> b!41572 m!34931))

(assert (=> b!41572 m!34929))

(declare-fun m!34933 () Bool)

(assert (=> b!41572 m!34933))

(declare-fun m!34935 () Bool)

(assert (=> b!41569 m!34935))

(declare-fun m!34937 () Bool)

(assert (=> b!41569 m!34937))

(declare-fun m!34939 () Bool)

(assert (=> b!41569 m!34939))

(declare-fun m!34941 () Bool)

(assert (=> b!41569 m!34941))

(declare-fun m!34943 () Bool)

(assert (=> b!41569 m!34943))

(declare-fun m!34945 () Bool)

(assert (=> b!41569 m!34945))

(declare-fun m!34947 () Bool)

(assert (=> b!41569 m!34947))

(declare-fun m!34949 () Bool)

(assert (=> b!41569 m!34949))

(declare-fun m!34951 () Bool)

(assert (=> start!5936 m!34951))

(check-sat (not b!41572) b_and!2471 (not b!41570) tp_is_empty!1801 (not b_lambda!2135) (not b_next!1411) (not start!5936) (not b!41569))
(check-sat b_and!2471 (not b_next!1411))
