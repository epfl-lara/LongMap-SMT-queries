; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5890 () Bool)

(assert start!5890)

(declare-fun b_free!1369 () Bool)

(declare-fun b_next!1369 () Bool)

(assert (=> start!5890 (= b_free!1369 (not b_next!1369))))

(declare-fun tp!5741 () Bool)

(declare-fun b_and!2387 () Bool)

(assert (=> start!5890 (= tp!5741 b_and!2387)))

(declare-fun res!24531 () Bool)

(declare-fun e!26200 () Bool)

(assert (=> start!5890 (=> (not res!24531) (not e!26200))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5890 (= res!24531 (validMask!0 mask!853))))

(assert (=> start!5890 e!26200))

(assert (=> start!5890 true))

(assert (=> start!5890 tp!5741))

(declare-fun b!41339 () Bool)

(declare-fun e!26199 () Bool)

(assert (=> b!41339 (= e!26200 (not e!26199))))

(declare-fun res!24529 () Bool)

(assert (=> b!41339 (=> res!24529 e!26199)))

(declare-datatypes ((V!2105 0))(
  ( (V!2106 (val!918 Int)) )
))
(declare-datatypes ((tuple2!1490 0))(
  ( (tuple2!1491 (_1!756 (_ BitVec 64)) (_2!756 V!2105)) )
))
(declare-datatypes ((List!1058 0))(
  ( (Nil!1055) (Cons!1054 (h!1631 tuple2!1490) (t!3923 List!1058)) )
))
(declare-datatypes ((ListLongMap!1067 0))(
  ( (ListLongMap!1068 (toList!549 List!1058)) )
))
(declare-fun lt!16195 () ListLongMap!1067)

(assert (=> b!41339 (= res!24529 (= lt!16195 (ListLongMap!1068 Nil!1055)))))

(declare-fun lt!16197 () V!2105)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2603 0))(
  ( (array!2604 (arr!1245 (Array (_ BitVec 32) (_ BitVec 64))) (size!1397 (_ BitVec 32))) )
))
(declare-fun lt!16199 () array!2603)

(declare-datatypes ((ValueCell!632 0))(
  ( (ValueCellFull!632 (v!2002 V!2105)) (EmptyCell!632) )
))
(declare-datatypes ((array!2605 0))(
  ( (array!2606 (arr!1246 (Array (_ BitVec 32) ValueCell!632)) (size!1398 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!244 0))(
  ( (LongMapFixedSize!245 (defaultEntry!1812 Int) (mask!5211 (_ BitVec 32)) (extraKeys!1703 (_ BitVec 32)) (zeroValue!1730 V!2105) (minValue!1730 V!2105) (_size!171 (_ BitVec 32)) (_keys!3319 array!2603) (_values!1795 array!2605) (_vacant!171 (_ BitVec 32))) )
))
(declare-fun map!694 (LongMapFixedSize!244) ListLongMap!1067)

(assert (=> b!41339 (= lt!16195 (map!694 (LongMapFixedSize!245 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16197 lt!16197 #b00000000000000000000000000000000 lt!16199 (array!2606 ((as const (Array (_ BitVec 32) ValueCell!632)) EmptyCell!632) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1059 0))(
  ( (Nil!1056) (Cons!1055 (h!1632 (_ BitVec 64)) (t!3924 List!1059)) )
))
(declare-fun arrayNoDuplicates!0 (array!2603 (_ BitVec 32) List!1059) Bool)

(assert (=> b!41339 (arrayNoDuplicates!0 lt!16199 #b00000000000000000000000000000000 Nil!1056)))

(declare-datatypes ((Unit!999 0))(
  ( (Unit!1000) )
))
(declare-fun lt!16198 () Unit!999)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2603 (_ BitVec 32) (_ BitVec 32) List!1059) Unit!999)

(assert (=> b!41339 (= lt!16198 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16199 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1056))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2603 (_ BitVec 32)) Bool)

(assert (=> b!41339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16199 mask!853)))

(declare-fun lt!16196 () Unit!999)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2603 (_ BitVec 32) (_ BitVec 32)) Unit!999)

(assert (=> b!41339 (= lt!16196 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16199 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2603 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41339 (= (arrayCountValidKeys!0 lt!16199 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16194 () Unit!999)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2603 (_ BitVec 32) (_ BitVec 32)) Unit!999)

(assert (=> b!41339 (= lt!16194 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16199 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41339 (= lt!16199 (array!2604 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!193 (Int (_ BitVec 64)) V!2105)

(assert (=> b!41339 (= lt!16197 (dynLambda!193 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41340 () Bool)

(declare-fun res!24530 () Bool)

(assert (=> b!41340 (=> res!24530 e!26199)))

(declare-fun isEmpty!235 (List!1058) Bool)

(assert (=> b!41340 (= res!24530 (isEmpty!235 (toList!549 lt!16195)))))

(declare-fun b!41341 () Bool)

(assert (=> b!41341 (= e!26199 (not (= (toList!549 lt!16195) Nil!1055)))))

(assert (= (and start!5890 res!24531) b!41339))

(assert (= (and b!41339 (not res!24529)) b!41340))

(assert (= (and b!41340 (not res!24530)) b!41341))

(declare-fun b_lambda!2093 () Bool)

(assert (=> (not b_lambda!2093) (not b!41339)))

(declare-fun t!3922 () Bool)

(declare-fun tb!851 () Bool)

(assert (=> (and start!5890 (= defaultEntry!470 defaultEntry!470) t!3922) tb!851))

(declare-fun result!1453 () Bool)

(declare-fun tp_is_empty!1759 () Bool)

(assert (=> tb!851 (= result!1453 tp_is_empty!1759)))

(assert (=> b!41339 t!3922))

(declare-fun b_and!2389 () Bool)

(assert (= b_and!2387 (and (=> t!3922 result!1453) b_and!2389)))

(declare-fun m!34525 () Bool)

(assert (=> start!5890 m!34525))

(declare-fun m!34527 () Bool)

(assert (=> b!41339 m!34527))

(declare-fun m!34529 () Bool)

(assert (=> b!41339 m!34529))

(declare-fun m!34531 () Bool)

(assert (=> b!41339 m!34531))

(declare-fun m!34533 () Bool)

(assert (=> b!41339 m!34533))

(declare-fun m!34535 () Bool)

(assert (=> b!41339 m!34535))

(declare-fun m!34537 () Bool)

(assert (=> b!41339 m!34537))

(declare-fun m!34539 () Bool)

(assert (=> b!41339 m!34539))

(declare-fun m!34541 () Bool)

(assert (=> b!41339 m!34541))

(declare-fun m!34543 () Bool)

(assert (=> b!41340 m!34543))

(push 1)

(assert (not b!41339))

(assert (not b_lambda!2093))

(assert tp_is_empty!1759)

(assert (not b_next!1369))

(assert b_and!2389)

(assert (not start!5890))

(assert (not b!41340))

(check-sat)

