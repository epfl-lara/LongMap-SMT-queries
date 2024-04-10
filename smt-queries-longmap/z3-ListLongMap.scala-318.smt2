; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5892 () Bool)

(assert start!5892)

(declare-fun b_free!1371 () Bool)

(declare-fun b_next!1371 () Bool)

(assert (=> start!5892 (= b_free!1371 (not b_next!1371))))

(declare-fun tp!5744 () Bool)

(declare-fun b_and!2391 () Bool)

(assert (=> start!5892 (= tp!5744 b_and!2391)))

(declare-fun res!24538 () Bool)

(declare-fun e!26206 () Bool)

(assert (=> start!5892 (=> (not res!24538) (not e!26206))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5892 (= res!24538 (validMask!0 mask!853))))

(assert (=> start!5892 e!26206))

(assert (=> start!5892 true))

(assert (=> start!5892 tp!5744))

(declare-fun b!41350 () Bool)

(declare-fun e!26205 () Bool)

(assert (=> b!41350 (= e!26206 (not e!26205))))

(declare-fun res!24540 () Bool)

(assert (=> b!41350 (=> res!24540 e!26205)))

(declare-datatypes ((V!2107 0))(
  ( (V!2108 (val!919 Int)) )
))
(declare-datatypes ((tuple2!1492 0))(
  ( (tuple2!1493 (_1!757 (_ BitVec 64)) (_2!757 V!2107)) )
))
(declare-datatypes ((List!1060 0))(
  ( (Nil!1057) (Cons!1056 (h!1633 tuple2!1492) (t!3927 List!1060)) )
))
(declare-datatypes ((ListLongMap!1069 0))(
  ( (ListLongMap!1070 (toList!550 List!1060)) )
))
(declare-fun lt!16215 () ListLongMap!1069)

(assert (=> b!41350 (= res!24540 (= lt!16215 (ListLongMap!1070 Nil!1057)))))

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2607 0))(
  ( (array!2608 (arr!1247 (Array (_ BitVec 32) (_ BitVec 64))) (size!1399 (_ BitVec 32))) )
))
(declare-fun lt!16217 () array!2607)

(declare-fun lt!16214 () V!2107)

(declare-datatypes ((ValueCell!633 0))(
  ( (ValueCellFull!633 (v!2003 V!2107)) (EmptyCell!633) )
))
(declare-datatypes ((array!2609 0))(
  ( (array!2610 (arr!1248 (Array (_ BitVec 32) ValueCell!633)) (size!1400 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!246 0))(
  ( (LongMapFixedSize!247 (defaultEntry!1813 Int) (mask!5212 (_ BitVec 32)) (extraKeys!1704 (_ BitVec 32)) (zeroValue!1731 V!2107) (minValue!1731 V!2107) (_size!172 (_ BitVec 32)) (_keys!3320 array!2607) (_values!1796 array!2609) (_vacant!172 (_ BitVec 32))) )
))
(declare-fun map!695 (LongMapFixedSize!246) ListLongMap!1069)

(assert (=> b!41350 (= lt!16215 (map!695 (LongMapFixedSize!247 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16214 lt!16214 #b00000000000000000000000000000000 lt!16217 (array!2610 ((as const (Array (_ BitVec 32) ValueCell!633)) EmptyCell!633) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1061 0))(
  ( (Nil!1058) (Cons!1057 (h!1634 (_ BitVec 64)) (t!3928 List!1061)) )
))
(declare-fun arrayNoDuplicates!0 (array!2607 (_ BitVec 32) List!1061) Bool)

(assert (=> b!41350 (arrayNoDuplicates!0 lt!16217 #b00000000000000000000000000000000 Nil!1058)))

(declare-datatypes ((Unit!1001 0))(
  ( (Unit!1002) )
))
(declare-fun lt!16212 () Unit!1001)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2607 (_ BitVec 32) (_ BitVec 32) List!1061) Unit!1001)

(assert (=> b!41350 (= lt!16212 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16217 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2607 (_ BitVec 32)) Bool)

(assert (=> b!41350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16217 mask!853)))

(declare-fun lt!16213 () Unit!1001)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2607 (_ BitVec 32) (_ BitVec 32)) Unit!1001)

(assert (=> b!41350 (= lt!16213 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16217 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2607 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41350 (= (arrayCountValidKeys!0 lt!16217 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16216 () Unit!1001)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2607 (_ BitVec 32) (_ BitVec 32)) Unit!1001)

(assert (=> b!41350 (= lt!16216 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16217 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41350 (= lt!16217 (array!2608 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!194 (Int (_ BitVec 64)) V!2107)

(assert (=> b!41350 (= lt!16214 (dynLambda!194 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41351 () Bool)

(declare-fun res!24539 () Bool)

(assert (=> b!41351 (=> res!24539 e!26205)))

(declare-fun isEmpty!236 (List!1060) Bool)

(assert (=> b!41351 (= res!24539 (isEmpty!236 (toList!550 lt!16215)))))

(declare-fun b!41352 () Bool)

(assert (=> b!41352 (= e!26205 (not (= (toList!550 lt!16215) Nil!1057)))))

(assert (= (and start!5892 res!24538) b!41350))

(assert (= (and b!41350 (not res!24540)) b!41351))

(assert (= (and b!41351 (not res!24539)) b!41352))

(declare-fun b_lambda!2095 () Bool)

(assert (=> (not b_lambda!2095) (not b!41350)))

(declare-fun t!3926 () Bool)

(declare-fun tb!853 () Bool)

(assert (=> (and start!5892 (= defaultEntry!470 defaultEntry!470) t!3926) tb!853))

(declare-fun result!1457 () Bool)

(declare-fun tp_is_empty!1761 () Bool)

(assert (=> tb!853 (= result!1457 tp_is_empty!1761)))

(assert (=> b!41350 t!3926))

(declare-fun b_and!2393 () Bool)

(assert (= b_and!2391 (and (=> t!3926 result!1457) b_and!2393)))

(declare-fun m!34545 () Bool)

(assert (=> start!5892 m!34545))

(declare-fun m!34547 () Bool)

(assert (=> b!41350 m!34547))

(declare-fun m!34549 () Bool)

(assert (=> b!41350 m!34549))

(declare-fun m!34551 () Bool)

(assert (=> b!41350 m!34551))

(declare-fun m!34553 () Bool)

(assert (=> b!41350 m!34553))

(declare-fun m!34555 () Bool)

(assert (=> b!41350 m!34555))

(declare-fun m!34557 () Bool)

(assert (=> b!41350 m!34557))

(declare-fun m!34559 () Bool)

(assert (=> b!41350 m!34559))

(declare-fun m!34561 () Bool)

(assert (=> b!41350 m!34561))

(declare-fun m!34563 () Bool)

(assert (=> b!41351 m!34563))

(check-sat (not b!41351) (not start!5892) (not b_next!1371) (not b!41350) tp_is_empty!1761 b_and!2393 (not b_lambda!2095))
(check-sat b_and!2393 (not b_next!1371))
