; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5884 () Bool)

(assert start!5884)

(declare-fun b_free!1369 () Bool)

(declare-fun b_next!1369 () Bool)

(assert (=> start!5884 (= b_free!1369 (not b_next!1369))))

(declare-fun tp!5741 () Bool)

(declare-fun b_and!2389 () Bool)

(assert (=> start!5884 (= tp!5741 b_and!2389)))

(declare-fun res!24503 () Bool)

(declare-fun e!26147 () Bool)

(assert (=> start!5884 (=> (not res!24503) (not e!26147))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5884 (= res!24503 (validMask!0 mask!853))))

(assert (=> start!5884 e!26147))

(assert (=> start!5884 true))

(assert (=> start!5884 tp!5741))

(declare-fun b!41259 () Bool)

(declare-fun e!26146 () Bool)

(assert (=> b!41259 (= e!26147 (not e!26146))))

(declare-fun res!24505 () Bool)

(assert (=> b!41259 (=> res!24505 e!26146)))

(declare-datatypes ((V!2105 0))(
  ( (V!2106 (val!918 Int)) )
))
(declare-datatypes ((tuple2!1494 0))(
  ( (tuple2!1495 (_1!758 (_ BitVec 64)) (_2!758 V!2105)) )
))
(declare-datatypes ((List!1051 0))(
  ( (Nil!1048) (Cons!1047 (h!1624 tuple2!1494) (t!3915 List!1051)) )
))
(declare-datatypes ((ListLongMap!1059 0))(
  ( (ListLongMap!1060 (toList!545 List!1051)) )
))
(declare-fun lt!16178 () ListLongMap!1059)

(assert (=> b!41259 (= res!24505 (= lt!16178 (ListLongMap!1060 Nil!1048)))))

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2577 0))(
  ( (array!2578 (arr!1232 (Array (_ BitVec 32) (_ BitVec 64))) (size!1384 (_ BitVec 32))) )
))
(declare-fun lt!16177 () array!2577)

(declare-fun lt!16179 () V!2105)

(declare-datatypes ((ValueCell!632 0))(
  ( (ValueCellFull!632 (v!2000 V!2105)) (EmptyCell!632) )
))
(declare-datatypes ((array!2579 0))(
  ( (array!2580 (arr!1233 (Array (_ BitVec 32) ValueCell!632)) (size!1385 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!244 0))(
  ( (LongMapFixedSize!245 (defaultEntry!1812 Int) (mask!5210 (_ BitVec 32)) (extraKeys!1703 (_ BitVec 32)) (zeroValue!1730 V!2105) (minValue!1730 V!2105) (_size!171 (_ BitVec 32)) (_keys!3318 array!2577) (_values!1795 array!2579) (_vacant!171 (_ BitVec 32))) )
))
(declare-fun map!695 (LongMapFixedSize!244) ListLongMap!1059)

(assert (=> b!41259 (= lt!16178 (map!695 (LongMapFixedSize!245 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16179 lt!16179 #b00000000000000000000000000000000 lt!16177 (array!2580 ((as const (Array (_ BitVec 32) ValueCell!632)) EmptyCell!632) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1052 0))(
  ( (Nil!1049) (Cons!1048 (h!1625 (_ BitVec 64)) (t!3916 List!1052)) )
))
(declare-fun arrayNoDuplicates!0 (array!2577 (_ BitVec 32) List!1052) Bool)

(assert (=> b!41259 (arrayNoDuplicates!0 lt!16177 #b00000000000000000000000000000000 Nil!1049)))

(declare-datatypes ((Unit!1006 0))(
  ( (Unit!1007) )
))
(declare-fun lt!16180 () Unit!1006)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2577 (_ BitVec 32) (_ BitVec 32) List!1052) Unit!1006)

(assert (=> b!41259 (= lt!16180 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16177 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2577 (_ BitVec 32)) Bool)

(assert (=> b!41259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16177 mask!853)))

(declare-fun lt!16181 () Unit!1006)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2577 (_ BitVec 32) (_ BitVec 32)) Unit!1006)

(assert (=> b!41259 (= lt!16181 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16177 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2577 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41259 (= (arrayCountValidKeys!0 lt!16177 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16176 () Unit!1006)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2577 (_ BitVec 32) (_ BitVec 32)) Unit!1006)

(assert (=> b!41259 (= lt!16176 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16177 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41259 (= lt!16177 (array!2578 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!192 (Int (_ BitVec 64)) V!2105)

(assert (=> b!41259 (= lt!16179 (dynLambda!192 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41260 () Bool)

(declare-fun res!24504 () Bool)

(assert (=> b!41260 (=> res!24504 e!26146)))

(declare-fun isEmpty!237 (List!1051) Bool)

(assert (=> b!41260 (= res!24504 (isEmpty!237 (toList!545 lt!16178)))))

(declare-fun b!41261 () Bool)

(assert (=> b!41261 (= e!26146 (not (= (toList!545 lt!16178) Nil!1048)))))

(assert (= (and start!5884 res!24503) b!41259))

(assert (= (and b!41259 (not res!24505)) b!41260))

(assert (= (and b!41260 (not res!24504)) b!41261))

(declare-fun b_lambda!2097 () Bool)

(assert (=> (not b_lambda!2097) (not b!41259)))

(declare-fun t!3914 () Bool)

(declare-fun tb!851 () Bool)

(assert (=> (and start!5884 (= defaultEntry!470 defaultEntry!470) t!3914) tb!851))

(declare-fun result!1453 () Bool)

(declare-fun tp_is_empty!1759 () Bool)

(assert (=> tb!851 (= result!1453 tp_is_empty!1759)))

(assert (=> b!41259 t!3914))

(declare-fun b_and!2391 () Bool)

(assert (= b_and!2389 (and (=> t!3914 result!1453) b_and!2391)))

(declare-fun m!34427 () Bool)

(assert (=> start!5884 m!34427))

(declare-fun m!34429 () Bool)

(assert (=> b!41259 m!34429))

(declare-fun m!34431 () Bool)

(assert (=> b!41259 m!34431))

(declare-fun m!34433 () Bool)

(assert (=> b!41259 m!34433))

(declare-fun m!34435 () Bool)

(assert (=> b!41259 m!34435))

(declare-fun m!34437 () Bool)

(assert (=> b!41259 m!34437))

(declare-fun m!34439 () Bool)

(assert (=> b!41259 m!34439))

(declare-fun m!34441 () Bool)

(assert (=> b!41259 m!34441))

(declare-fun m!34443 () Bool)

(assert (=> b!41259 m!34443))

(declare-fun m!34445 () Bool)

(assert (=> b!41260 m!34445))

(check-sat tp_is_empty!1759 (not b_next!1369) (not start!5884) b_and!2391 (not b_lambda!2097) (not b!41260) (not b!41259))
(check-sat b_and!2391 (not b_next!1369))
