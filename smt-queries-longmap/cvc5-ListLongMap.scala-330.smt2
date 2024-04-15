; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6032 () Bool)

(assert start!6032)

(declare-fun b_free!1445 () Bool)

(declare-fun b_next!1445 () Bool)

(assert (=> start!6032 (= b_free!1445 (not b_next!1445))))

(declare-fun tp!5855 () Bool)

(declare-fun b_and!2541 () Bool)

(assert (=> start!6032 (= tp!5855 b_and!2541)))

(declare-fun b!41937 () Bool)

(declare-fun e!26509 () Bool)

(assert (=> b!41937 (= e!26509 (not true))))

(declare-fun lt!17216 () Bool)

(declare-datatypes ((array!2729 0))(
  ( (array!2730 (arr!1308 (Array (_ BitVec 32) (_ BitVec 64))) (size!1466 (_ BitVec 32))) )
))
(declare-datatypes ((V!2205 0))(
  ( (V!2206 (val!956 Int)) )
))
(declare-datatypes ((ValueCell!670 0))(
  ( (ValueCellFull!670 (v!2038 V!2205)) (EmptyCell!670) )
))
(declare-datatypes ((array!2731 0))(
  ( (array!2732 (arr!1309 (Array (_ BitVec 32) ValueCell!670)) (size!1467 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!320 0))(
  ( (LongMapFixedSize!321 (defaultEntry!1853 Int) (mask!5284 (_ BitVec 32)) (extraKeys!1744 (_ BitVec 32)) (zeroValue!1771 V!2205) (minValue!1771 V!2205) (_size!209 (_ BitVec 32)) (_keys!3365 array!2729) (_values!1836 array!2731) (_vacant!209 (_ BitVec 32))) )
))
(declare-fun lt!17212 () LongMapFixedSize!320)

(declare-fun valid!133 (LongMapFixedSize!320) Bool)

(assert (=> b!41937 (= lt!17216 (valid!133 lt!17212))))

(declare-datatypes ((Unit!1086 0))(
  ( (Unit!1087) )
))
(declare-fun lt!17215 () Unit!1086)

(declare-fun e!26510 () Unit!1086)

(assert (=> b!41937 (= lt!17215 e!26510)))

(declare-fun c!5222 () Bool)

(declare-datatypes ((tuple2!1570 0))(
  ( (tuple2!1571 (_1!796 (_ BitVec 64)) (_2!796 V!2205)) )
))
(declare-datatypes ((List!1127 0))(
  ( (Nil!1124) (Cons!1123 (h!1700 tuple2!1570) (t!4067 List!1127)) )
))
(declare-datatypes ((ListLongMap!1135 0))(
  ( (ListLongMap!1136 (toList!583 List!1127)) )
))
(declare-fun lt!17208 () ListLongMap!1135)

(assert (=> b!41937 (= c!5222 (not (= lt!17208 (ListLongMap!1136 Nil!1124))))))

(declare-fun map!757 (LongMapFixedSize!320) ListLongMap!1135)

(assert (=> b!41937 (= lt!17208 (map!757 lt!17212))))

(declare-fun lt!17207 () array!2729)

(declare-datatypes ((List!1128 0))(
  ( (Nil!1125) (Cons!1124 (h!1701 (_ BitVec 64)) (t!4068 List!1128)) )
))
(declare-fun arrayNoDuplicates!0 (array!2729 (_ BitVec 32) List!1128) Bool)

(assert (=> b!41937 (arrayNoDuplicates!0 lt!17207 #b00000000000000000000000000000000 Nil!1125)))

(declare-fun lt!17209 () Unit!1086)

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2729 (_ BitVec 32) (_ BitVec 32) List!1128) Unit!1086)

(assert (=> b!41937 (= lt!17209 (lemmaArrayNoDuplicatesInAll0Array!0 lt!17207 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2729 (_ BitVec 32)) Bool)

(assert (=> b!41937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17207 mask!853)))

(declare-fun lt!17211 () Unit!1086)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2729 (_ BitVec 32) (_ BitVec 32)) Unit!1086)

(assert (=> b!41937 (= lt!17211 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17207 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2729 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41937 (= (arrayCountValidKeys!0 lt!17207 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17214 () Unit!1086)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2729 (_ BitVec 32) (_ BitVec 32)) Unit!1086)

(assert (=> b!41937 (= lt!17214 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17207 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!17210 () V!2205)

(declare-fun lt!17206 () array!2731)

(assert (=> b!41937 (= lt!17212 (LongMapFixedSize!321 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17210 lt!17210 #b00000000000000000000000000000000 lt!17207 lt!17206 #b00000000000000000000000000000000))))

(assert (=> b!41937 (= lt!17206 (array!2732 ((as const (Array (_ BitVec 32) ValueCell!670)) EmptyCell!670) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41937 (= lt!17207 (array!2730 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!230 (Int (_ BitVec 64)) V!2205)

(assert (=> b!41937 (= lt!17210 (dynLambda!230 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!25000 () Bool)

(assert (=> start!6032 (=> (not res!25000) (not e!26509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6032 (= res!25000 (validMask!0 mask!853))))

(assert (=> start!6032 e!26509))

(assert (=> start!6032 true))

(assert (=> start!6032 tp!5855))

(declare-fun b!41938 () Bool)

(declare-fun Unit!1088 () Unit!1086)

(assert (=> b!41938 (= e!26510 Unit!1088)))

(declare-fun lt!17205 () tuple2!1570)

(declare-fun head!886 (List!1127) tuple2!1570)

(assert (=> b!41938 (= lt!17205 (head!886 (toList!583 lt!17208)))))

(declare-fun lt!17204 () Unit!1086)

(declare-fun lemmaKeyInListMapIsInArray!108 (array!2729 array!2731 (_ BitVec 32) (_ BitVec 32) V!2205 V!2205 (_ BitVec 64) Int) Unit!1086)

(assert (=> b!41938 (= lt!17204 (lemmaKeyInListMapIsInArray!108 lt!17207 lt!17206 mask!853 #b00000000000000000000000000000000 lt!17210 lt!17210 (_1!796 lt!17205) defaultEntry!470))))

(declare-fun res!24999 () Bool)

(assert (=> b!41938 (= res!24999 (and (not (= (_1!796 lt!17205) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!796 lt!17205) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!26508 () Bool)

(assert (=> b!41938 (=> (not res!24999) (not e!26508))))

(assert (=> b!41938 e!26508))

(declare-fun lt!17213 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2729 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41938 (= lt!17213 (arrayScanForKey!0 lt!17207 (_1!796 lt!17205) #b00000000000000000000000000000000))))

(assert (=> b!41938 false))

(declare-fun b!41940 () Bool)

(declare-fun arrayContainsKey!0 (array!2729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!41940 (= e!26508 (arrayContainsKey!0 lt!17207 (_1!796 lt!17205) #b00000000000000000000000000000000))))

(declare-fun b!41939 () Bool)

(declare-fun Unit!1089 () Unit!1086)

(assert (=> b!41939 (= e!26510 Unit!1089)))

(assert (= (and start!6032 res!25000) b!41937))

(assert (= (and b!41937 c!5222) b!41938))

(assert (= (and b!41937 (not c!5222)) b!41939))

(assert (= (and b!41938 res!24999) b!41940))

(declare-fun b_lambda!2179 () Bool)

(assert (=> (not b_lambda!2179) (not b!41937)))

(declare-fun t!4066 () Bool)

(declare-fun tb!927 () Bool)

(assert (=> (and start!6032 (= defaultEntry!470 defaultEntry!470) t!4066) tb!927))

(declare-fun result!1605 () Bool)

(declare-fun tp_is_empty!1835 () Bool)

(assert (=> tb!927 (= result!1605 tp_is_empty!1835)))

(assert (=> b!41937 t!4066))

(declare-fun b_and!2543 () Bool)

(assert (= b_and!2541 (and (=> t!4066 result!1605) b_and!2543)))

(declare-fun m!35491 () Bool)

(assert (=> b!41937 m!35491))

(declare-fun m!35493 () Bool)

(assert (=> b!41937 m!35493))

(declare-fun m!35495 () Bool)

(assert (=> b!41937 m!35495))

(declare-fun m!35497 () Bool)

(assert (=> b!41937 m!35497))

(declare-fun m!35499 () Bool)

(assert (=> b!41937 m!35499))

(declare-fun m!35501 () Bool)

(assert (=> b!41937 m!35501))

(declare-fun m!35503 () Bool)

(assert (=> b!41937 m!35503))

(declare-fun m!35505 () Bool)

(assert (=> b!41937 m!35505))

(declare-fun m!35507 () Bool)

(assert (=> b!41937 m!35507))

(declare-fun m!35509 () Bool)

(assert (=> start!6032 m!35509))

(declare-fun m!35511 () Bool)

(assert (=> b!41938 m!35511))

(declare-fun m!35513 () Bool)

(assert (=> b!41938 m!35513))

(declare-fun m!35515 () Bool)

(assert (=> b!41938 m!35515))

(declare-fun m!35517 () Bool)

(assert (=> b!41940 m!35517))

(push 1)

(assert (not b!41937))

(assert (not b!41938))

(assert b_and!2543)

(assert (not b_lambda!2179))

(assert tp_is_empty!1835)

(assert (not start!6032))

(assert (not b_next!1445))

(assert (not b!41940))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2543)

(assert (not b_next!1445))

(check-sat)

(pop 1)

