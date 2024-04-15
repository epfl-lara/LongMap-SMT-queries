; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5900 () Bool)

(assert start!5900)

(declare-fun b_free!1385 () Bool)

(declare-fun b_next!1385 () Bool)

(assert (=> start!5900 (= b_free!1385 (not b_next!1385))))

(declare-fun tp!5765 () Bool)

(declare-fun b_and!2421 () Bool)

(assert (=> start!5900 (= tp!5765 b_and!2421)))

(declare-fun res!24593 () Bool)

(declare-fun e!26195 () Bool)

(assert (=> start!5900 (=> (not res!24593) (not e!26195))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5900 (= res!24593 (validMask!0 mask!853))))

(assert (=> start!5900 e!26195))

(assert (=> start!5900 true))

(assert (=> start!5900 tp!5765))

(declare-fun b!41366 () Bool)

(declare-fun res!24592 () Bool)

(declare-fun e!26194 () Bool)

(assert (=> b!41366 (=> res!24592 e!26194)))

(assert (=> b!41366 (= res!24592 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun b!41367 () Bool)

(assert (=> b!41367 (= e!26194 true)))

(declare-datatypes ((V!2125 0))(
  ( (V!2126 (val!926 Int)) )
))
(declare-fun lt!16358 () V!2125)

(declare-fun lt!16354 () Bool)

(declare-datatypes ((ValueCell!640 0))(
  ( (ValueCellFull!640 (v!2008 V!2125)) (EmptyCell!640) )
))
(declare-datatypes ((array!2609 0))(
  ( (array!2610 (arr!1248 (Array (_ BitVec 32) ValueCell!640)) (size!1400 (_ BitVec 32))) )
))
(declare-fun lt!16360 () array!2609)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((tuple2!1510 0))(
  ( (tuple2!1511 (_1!766 (_ BitVec 64)) (_2!766 V!2125)) )
))
(declare-datatypes ((List!1067 0))(
  ( (Nil!1064) (Cons!1063 (h!1640 tuple2!1510) (t!3947 List!1067)) )
))
(declare-datatypes ((ListLongMap!1075 0))(
  ( (ListLongMap!1076 (toList!553 List!1067)) )
))
(declare-fun lt!16359 () ListLongMap!1075)

(declare-datatypes ((array!2611 0))(
  ( (array!2612 (arr!1249 (Array (_ BitVec 32) (_ BitVec 64))) (size!1401 (_ BitVec 32))) )
))
(declare-fun lt!16357 () array!2611)

(declare-fun contains!523 (ListLongMap!1075 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!308 (array!2611 array!2609 (_ BitVec 32) (_ BitVec 32) V!2125 V!2125 (_ BitVec 32) Int) ListLongMap!1075)

(declare-fun head!856 (List!1067) tuple2!1510)

(assert (=> b!41367 (= lt!16354 (contains!523 (getCurrentListMap!308 lt!16357 lt!16360 mask!853 #b00000000000000000000000000000000 lt!16358 lt!16358 #b00000000000000000000000000000000 defaultEntry!470) (_1!766 (head!856 (toList!553 lt!16359)))))))

(declare-fun b!41365 () Bool)

(declare-fun res!24594 () Bool)

(assert (=> b!41365 (=> res!24594 e!26194)))

(declare-fun isEmpty!245 (List!1067) Bool)

(assert (=> b!41365 (= res!24594 (isEmpty!245 (toList!553 lt!16359)))))

(declare-fun b!41364 () Bool)

(assert (=> b!41364 (= e!26195 (not e!26194))))

(declare-fun res!24595 () Bool)

(assert (=> b!41364 (=> res!24595 e!26194)))

(assert (=> b!41364 (= res!24595 (= lt!16359 (ListLongMap!1076 Nil!1064)))))

(declare-datatypes ((LongMapFixedSize!260 0))(
  ( (LongMapFixedSize!261 (defaultEntry!1820 Int) (mask!5222 (_ BitVec 32)) (extraKeys!1711 (_ BitVec 32)) (zeroValue!1738 V!2125) (minValue!1738 V!2125) (_size!179 (_ BitVec 32)) (_keys!3326 array!2611) (_values!1803 array!2609) (_vacant!179 (_ BitVec 32))) )
))
(declare-fun map!707 (LongMapFixedSize!260) ListLongMap!1075)

(assert (=> b!41364 (= lt!16359 (map!707 (LongMapFixedSize!261 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16358 lt!16358 #b00000000000000000000000000000000 lt!16357 lt!16360 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1068 0))(
  ( (Nil!1065) (Cons!1064 (h!1641 (_ BitVec 64)) (t!3948 List!1068)) )
))
(declare-fun arrayNoDuplicates!0 (array!2611 (_ BitVec 32) List!1068) Bool)

(assert (=> b!41364 (arrayNoDuplicates!0 lt!16357 #b00000000000000000000000000000000 Nil!1065)))

(declare-datatypes ((Unit!1022 0))(
  ( (Unit!1023) )
))
(declare-fun lt!16355 () Unit!1022)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2611 (_ BitVec 32) (_ BitVec 32) List!1068) Unit!1022)

(assert (=> b!41364 (= lt!16355 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16357 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2611 (_ BitVec 32)) Bool)

(assert (=> b!41364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16357 mask!853)))

(declare-fun lt!16361 () Unit!1022)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2611 (_ BitVec 32) (_ BitVec 32)) Unit!1022)

(assert (=> b!41364 (= lt!16361 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16357 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2611 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41364 (= (arrayCountValidKeys!0 lt!16357 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16356 () Unit!1022)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2611 (_ BitVec 32) (_ BitVec 32)) Unit!1022)

(assert (=> b!41364 (= lt!16356 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16357 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41364 (= lt!16360 (array!2610 ((as const (Array (_ BitVec 32) ValueCell!640)) EmptyCell!640) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41364 (= lt!16357 (array!2612 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!200 (Int (_ BitVec 64)) V!2125)

(assert (=> b!41364 (= lt!16358 (dynLambda!200 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!5900 res!24593) b!41364))

(assert (= (and b!41364 (not res!24595)) b!41365))

(assert (= (and b!41365 (not res!24594)) b!41366))

(assert (= (and b!41366 (not res!24592)) b!41367))

(declare-fun b_lambda!2113 () Bool)

(assert (=> (not b_lambda!2113) (not b!41364)))

(declare-fun t!3946 () Bool)

(declare-fun tb!867 () Bool)

(assert (=> (and start!5900 (= defaultEntry!470 defaultEntry!470) t!3946) tb!867))

(declare-fun result!1485 () Bool)

(declare-fun tp_is_empty!1775 () Bool)

(assert (=> tb!867 (= result!1485 tp_is_empty!1775)))

(assert (=> b!41364 t!3946))

(declare-fun b_and!2423 () Bool)

(assert (= b_and!2421 (and (=> t!3946 result!1485) b_and!2423)))

(declare-fun m!34617 () Bool)

(assert (=> start!5900 m!34617))

(declare-fun m!34619 () Bool)

(assert (=> b!41367 m!34619))

(declare-fun m!34621 () Bool)

(assert (=> b!41367 m!34621))

(assert (=> b!41367 m!34619))

(declare-fun m!34623 () Bool)

(assert (=> b!41367 m!34623))

(declare-fun m!34625 () Bool)

(assert (=> b!41365 m!34625))

(declare-fun m!34627 () Bool)

(assert (=> b!41364 m!34627))

(declare-fun m!34629 () Bool)

(assert (=> b!41364 m!34629))

(declare-fun m!34631 () Bool)

(assert (=> b!41364 m!34631))

(declare-fun m!34633 () Bool)

(assert (=> b!41364 m!34633))

(declare-fun m!34635 () Bool)

(assert (=> b!41364 m!34635))

(declare-fun m!34637 () Bool)

(assert (=> b!41364 m!34637))

(declare-fun m!34639 () Bool)

(assert (=> b!41364 m!34639))

(declare-fun m!34641 () Bool)

(assert (=> b!41364 m!34641))

(push 1)

(assert (not b!41367))

(assert (not b!41365))

(assert (not b!41364))

(assert (not b_lambda!2113))

(assert tp_is_empty!1775)

(assert (not b_next!1385))

(assert (not start!5900))

(assert b_and!2423)

(check-sat)

(pop 1)

(push 1)

(assert b_and!2423)

(assert (not b_next!1385))

(check-sat)

(pop 1)

