; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5896 () Bool)

(assert start!5896)

(declare-fun b_free!1375 () Bool)

(declare-fun b_next!1375 () Bool)

(assert (=> start!5896 (= b_free!1375 (not b_next!1375))))

(declare-fun tp!5750 () Bool)

(declare-fun b_and!2399 () Bool)

(assert (=> start!5896 (= tp!5750 b_and!2399)))

(declare-fun res!24559 () Bool)

(declare-fun e!26217 () Bool)

(assert (=> start!5896 (=> (not res!24559) (not e!26217))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5896 (= res!24559 (validMask!0 mask!853))))

(assert (=> start!5896 e!26217))

(assert (=> start!5896 true))

(assert (=> start!5896 tp!5750))

(declare-fun b!41374 () Bool)

(declare-fun e!26218 () Bool)

(assert (=> b!41374 (= e!26217 (not e!26218))))

(declare-fun res!24558 () Bool)

(assert (=> b!41374 (=> res!24558 e!26218)))

(declare-datatypes ((V!2113 0))(
  ( (V!2114 (val!921 Int)) )
))
(declare-datatypes ((tuple2!1496 0))(
  ( (tuple2!1497 (_1!759 (_ BitVec 64)) (_2!759 V!2113)) )
))
(declare-datatypes ((List!1064 0))(
  ( (Nil!1061) (Cons!1060 (h!1637 tuple2!1496) (t!3935 List!1064)) )
))
(declare-datatypes ((ListLongMap!1073 0))(
  ( (ListLongMap!1074 (toList!552 List!1064)) )
))
(declare-fun lt!16255 () ListLongMap!1073)

(assert (=> b!41374 (= res!24558 (= lt!16255 (ListLongMap!1074 Nil!1061)))))

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2615 0))(
  ( (array!2616 (arr!1251 (Array (_ BitVec 32) (_ BitVec 64))) (size!1403 (_ BitVec 32))) )
))
(declare-fun lt!16252 () array!2615)

(declare-datatypes ((ValueCell!635 0))(
  ( (ValueCellFull!635 (v!2005 V!2113)) (EmptyCell!635) )
))
(declare-datatypes ((array!2617 0))(
  ( (array!2618 (arr!1252 (Array (_ BitVec 32) ValueCell!635)) (size!1404 (_ BitVec 32))) )
))
(declare-fun lt!16253 () array!2617)

(declare-fun lt!16254 () V!2113)

(declare-datatypes ((LongMapFixedSize!250 0))(
  ( (LongMapFixedSize!251 (defaultEntry!1815 Int) (mask!5216 (_ BitVec 32)) (extraKeys!1706 (_ BitVec 32)) (zeroValue!1733 V!2113) (minValue!1733 V!2113) (_size!174 (_ BitVec 32)) (_keys!3322 array!2615) (_values!1798 array!2617) (_vacant!174 (_ BitVec 32))) )
))
(declare-fun map!699 (LongMapFixedSize!250) ListLongMap!1073)

(assert (=> b!41374 (= lt!16255 (map!699 (LongMapFixedSize!251 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16254 lt!16254 #b00000000000000000000000000000000 lt!16252 lt!16253 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1065 0))(
  ( (Nil!1062) (Cons!1061 (h!1638 (_ BitVec 64)) (t!3936 List!1065)) )
))
(declare-fun arrayNoDuplicates!0 (array!2615 (_ BitVec 32) List!1065) Bool)

(assert (=> b!41374 (arrayNoDuplicates!0 lt!16252 #b00000000000000000000000000000000 Nil!1062)))

(declare-datatypes ((Unit!1005 0))(
  ( (Unit!1006) )
))
(declare-fun lt!16257 () Unit!1005)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2615 (_ BitVec 32) (_ BitVec 32) List!1065) Unit!1005)

(assert (=> b!41374 (= lt!16257 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16252 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1062))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2615 (_ BitVec 32)) Bool)

(assert (=> b!41374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16252 mask!853)))

(declare-fun lt!16256 () Unit!1005)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2615 (_ BitVec 32) (_ BitVec 32)) Unit!1005)

(assert (=> b!41374 (= lt!16256 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16252 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2615 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41374 (= (arrayCountValidKeys!0 lt!16252 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16259 () Unit!1005)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2615 (_ BitVec 32) (_ BitVec 32)) Unit!1005)

(assert (=> b!41374 (= lt!16259 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16252 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41374 (= lt!16253 (array!2618 ((as const (Array (_ BitVec 32) ValueCell!635)) EmptyCell!635) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41374 (= lt!16252 (array!2616 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!196 (Int (_ BitVec 64)) V!2113)

(assert (=> b!41374 (= lt!16254 (dynLambda!196 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41377 () Bool)

(assert (=> b!41377 (= e!26218 true)))

(declare-fun lt!16258 () Bool)

(declare-fun contains!520 (ListLongMap!1073 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!313 (array!2615 array!2617 (_ BitVec 32) (_ BitVec 32) V!2113 V!2113 (_ BitVec 32) Int) ListLongMap!1073)

(declare-fun head!851 (List!1064) tuple2!1496)

(assert (=> b!41377 (= lt!16258 (contains!520 (getCurrentListMap!313 lt!16252 lt!16253 mask!853 #b00000000000000000000000000000000 lt!16254 lt!16254 #b00000000000000000000000000000000 defaultEntry!470) (_1!759 (head!851 (toList!552 lt!16255)))))))

(declare-fun b!41376 () Bool)

(declare-fun res!24560 () Bool)

(assert (=> b!41376 (=> res!24560 e!26218)))

(assert (=> b!41376 (= res!24560 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun b!41375 () Bool)

(declare-fun res!24561 () Bool)

(assert (=> b!41375 (=> res!24561 e!26218)))

(declare-fun isEmpty!238 (List!1064) Bool)

(assert (=> b!41375 (= res!24561 (isEmpty!238 (toList!552 lt!16255)))))

(assert (= (and start!5896 res!24559) b!41374))

(assert (= (and b!41374 (not res!24558)) b!41375))

(assert (= (and b!41375 (not res!24561)) b!41376))

(assert (= (and b!41376 (not res!24560)) b!41377))

(declare-fun b_lambda!2099 () Bool)

(assert (=> (not b_lambda!2099) (not b!41374)))

(declare-fun t!3934 () Bool)

(declare-fun tb!857 () Bool)

(assert (=> (and start!5896 (= defaultEntry!470 defaultEntry!470) t!3934) tb!857))

(declare-fun result!1465 () Bool)

(declare-fun tp_is_empty!1765 () Bool)

(assert (=> tb!857 (= result!1465 tp_is_empty!1765)))

(assert (=> b!41374 t!3934))

(declare-fun b_and!2401 () Bool)

(assert (= b_and!2399 (and (=> t!3934 result!1465) b_and!2401)))

(declare-fun m!34585 () Bool)

(assert (=> start!5896 m!34585))

(declare-fun m!34587 () Bool)

(assert (=> b!41374 m!34587))

(declare-fun m!34589 () Bool)

(assert (=> b!41374 m!34589))

(declare-fun m!34591 () Bool)

(assert (=> b!41374 m!34591))

(declare-fun m!34593 () Bool)

(assert (=> b!41374 m!34593))

(declare-fun m!34595 () Bool)

(assert (=> b!41374 m!34595))

(declare-fun m!34597 () Bool)

(assert (=> b!41374 m!34597))

(declare-fun m!34599 () Bool)

(assert (=> b!41374 m!34599))

(declare-fun m!34601 () Bool)

(assert (=> b!41374 m!34601))

(declare-fun m!34603 () Bool)

(assert (=> b!41377 m!34603))

(declare-fun m!34605 () Bool)

(assert (=> b!41377 m!34605))

(assert (=> b!41377 m!34603))

(declare-fun m!34607 () Bool)

(assert (=> b!41377 m!34607))

(declare-fun m!34609 () Bool)

(assert (=> b!41375 m!34609))

(push 1)

(assert tp_is_empty!1765)

(assert (not b_next!1375))

(assert (not b!41374))

(assert (not b_lambda!2099))

(assert (not start!5896))

(assert b_and!2401)

(assert (not b!41377))

(assert (not b!41375))

(check-sat)

(pop 1)

(push 1)

