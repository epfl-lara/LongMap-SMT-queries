; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5912 () Bool)

(assert start!5912)

(declare-fun b_free!1387 () Bool)

(declare-fun b_next!1387 () Bool)

(assert (=> start!5912 (= b_free!1387 (not b_next!1387))))

(declare-fun tp!5768 () Bool)

(declare-fun b_and!2421 () Bool)

(assert (=> start!5912 (= tp!5768 b_and!2421)))

(declare-fun b!41402 () Bool)

(declare-fun res!24607 () Bool)

(declare-fun e!26217 () Bool)

(assert (=> b!41402 (=> res!24607 e!26217)))

(declare-datatypes ((V!2129 0))(
  ( (V!2130 (val!927 Int)) )
))
(declare-datatypes ((tuple2!1490 0))(
  ( (tuple2!1491 (_1!756 (_ BitVec 64)) (_2!756 V!2129)) )
))
(declare-datatypes ((List!1062 0))(
  ( (Nil!1059) (Cons!1058 (h!1635 tuple2!1490) (t!3945 List!1062)) )
))
(declare-datatypes ((ListLongMap!1061 0))(
  ( (ListLongMap!1062 (toList!546 List!1062)) )
))
(declare-fun lt!16354 () ListLongMap!1061)

(declare-fun isEmpty!248 (List!1062) Bool)

(assert (=> b!41402 (= res!24607 (isEmpty!248 (toList!546 lt!16354)))))

(declare-fun b!41403 () Bool)

(declare-fun res!24608 () Bool)

(assert (=> b!41403 (=> res!24608 e!26217)))

(declare-fun mask!853 () (_ BitVec 32))

(assert (=> b!41403 (= res!24608 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun res!24605 () Bool)

(declare-fun e!26216 () Bool)

(assert (=> start!5912 (=> (not res!24605) (not e!26216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5912 (= res!24605 (validMask!0 mask!853))))

(assert (=> start!5912 e!26216))

(assert (=> start!5912 true))

(assert (=> start!5912 tp!5768))

(declare-fun b!41401 () Bool)

(assert (=> b!41401 (= e!26216 (not e!26217))))

(declare-fun res!24606 () Bool)

(assert (=> b!41401 (=> res!24606 e!26217)))

(assert (=> b!41401 (= res!24606 (= lt!16354 (ListLongMap!1062 Nil!1059)))))

(declare-datatypes ((ValueCell!641 0))(
  ( (ValueCellFull!641 (v!2012 V!2129)) (EmptyCell!641) )
))
(declare-datatypes ((array!2625 0))(
  ( (array!2626 (arr!1256 (Array (_ BitVec 32) ValueCell!641)) (size!1408 (_ BitVec 32))) )
))
(declare-fun lt!16358 () array!2625)

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!16360 () V!2129)

(declare-datatypes ((array!2627 0))(
  ( (array!2628 (arr!1257 (Array (_ BitVec 32) (_ BitVec 64))) (size!1409 (_ BitVec 32))) )
))
(declare-fun lt!16356 () array!2627)

(declare-datatypes ((LongMapFixedSize!262 0))(
  ( (LongMapFixedSize!263 (defaultEntry!1821 Int) (mask!5226 (_ BitVec 32)) (extraKeys!1712 (_ BitVec 32)) (zeroValue!1739 V!2129) (minValue!1739 V!2129) (_size!180 (_ BitVec 32)) (_keys!3328 array!2627) (_values!1804 array!2625) (_vacant!180 (_ BitVec 32))) )
))
(declare-fun map!709 (LongMapFixedSize!262) ListLongMap!1061)

(assert (=> b!41401 (= lt!16354 (map!709 (LongMapFixedSize!263 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16360 lt!16360 #b00000000000000000000000000000000 lt!16356 lt!16358 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1063 0))(
  ( (Nil!1060) (Cons!1059 (h!1636 (_ BitVec 64)) (t!3946 List!1063)) )
))
(declare-fun arrayNoDuplicates!0 (array!2627 (_ BitVec 32) List!1063) Bool)

(assert (=> b!41401 (arrayNoDuplicates!0 lt!16356 #b00000000000000000000000000000000 Nil!1060)))

(declare-datatypes ((Unit!1029 0))(
  ( (Unit!1030) )
))
(declare-fun lt!16357 () Unit!1029)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2627 (_ BitVec 32) (_ BitVec 32) List!1063) Unit!1029)

(assert (=> b!41401 (= lt!16357 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16356 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1060))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2627 (_ BitVec 32)) Bool)

(assert (=> b!41401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16356 mask!853)))

(declare-fun lt!16359 () Unit!1029)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2627 (_ BitVec 32) (_ BitVec 32)) Unit!1029)

(assert (=> b!41401 (= lt!16359 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16356 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2627 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41401 (= (arrayCountValidKeys!0 lt!16356 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16353 () Unit!1029)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2627 (_ BitVec 32) (_ BitVec 32)) Unit!1029)

(assert (=> b!41401 (= lt!16353 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16356 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41401 (= lt!16358 (array!2626 ((as const (Array (_ BitVec 32) ValueCell!641)) EmptyCell!641) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41401 (= lt!16356 (array!2628 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!198 (Int (_ BitVec 64)) V!2129)

(assert (=> b!41401 (= lt!16360 (dynLambda!198 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41404 () Bool)

(assert (=> b!41404 (= e!26217 true)))

(declare-fun lt!16355 () Bool)

(declare-fun contains!517 (ListLongMap!1061 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!303 (array!2627 array!2625 (_ BitVec 32) (_ BitVec 32) V!2129 V!2129 (_ BitVec 32) Int) ListLongMap!1061)

(declare-fun head!855 (List!1062) tuple2!1490)

(assert (=> b!41404 (= lt!16355 (contains!517 (getCurrentListMap!303 lt!16356 lt!16358 mask!853 #b00000000000000000000000000000000 lt!16360 lt!16360 #b00000000000000000000000000000000 defaultEntry!470) (_1!756 (head!855 (toList!546 lt!16354)))))))

(assert (= (and start!5912 res!24605) b!41401))

(assert (= (and b!41401 (not res!24606)) b!41402))

(assert (= (and b!41402 (not res!24607)) b!41403))

(assert (= (and b!41403 (not res!24608)) b!41404))

(declare-fun b_lambda!2111 () Bool)

(assert (=> (not b_lambda!2111) (not b!41401)))

(declare-fun t!3944 () Bool)

(declare-fun tb!869 () Bool)

(assert (=> (and start!5912 (= defaultEntry!470 defaultEntry!470) t!3944) tb!869))

(declare-fun result!1489 () Bool)

(declare-fun tp_is_empty!1777 () Bool)

(assert (=> tb!869 (= result!1489 tp_is_empty!1777)))

(assert (=> b!41401 t!3944))

(declare-fun b_and!2423 () Bool)

(assert (= b_and!2421 (and (=> t!3944 result!1489) b_and!2423)))

(declare-fun m!34615 () Bool)

(assert (=> b!41402 m!34615))

(declare-fun m!34617 () Bool)

(assert (=> start!5912 m!34617))

(declare-fun m!34619 () Bool)

(assert (=> b!41401 m!34619))

(declare-fun m!34621 () Bool)

(assert (=> b!41401 m!34621))

(declare-fun m!34623 () Bool)

(assert (=> b!41401 m!34623))

(declare-fun m!34625 () Bool)

(assert (=> b!41401 m!34625))

(declare-fun m!34627 () Bool)

(assert (=> b!41401 m!34627))

(declare-fun m!34629 () Bool)

(assert (=> b!41401 m!34629))

(declare-fun m!34631 () Bool)

(assert (=> b!41401 m!34631))

(declare-fun m!34633 () Bool)

(assert (=> b!41401 m!34633))

(declare-fun m!34635 () Bool)

(assert (=> b!41404 m!34635))

(declare-fun m!34637 () Bool)

(assert (=> b!41404 m!34637))

(assert (=> b!41404 m!34635))

(declare-fun m!34639 () Bool)

(assert (=> b!41404 m!34639))

(check-sat (not b_lambda!2111) (not b!41401) (not start!5912) tp_is_empty!1777 (not b!41402) (not b!41404) b_and!2423 (not b_next!1387))
(check-sat b_and!2423 (not b_next!1387))
