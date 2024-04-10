; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6376 () Bool)

(assert start!6376)

(declare-fun b_free!1465 () Bool)

(declare-fun b_next!1465 () Bool)

(assert (=> start!6376 (= b_free!1465 (not b_next!1465))))

(declare-fun tp!5885 () Bool)

(declare-fun b_and!2579 () Bool)

(assert (=> start!6376 (= tp!5885 b_and!2579)))

(declare-fun res!25419 () Bool)

(declare-fun e!27100 () Bool)

(assert (=> start!6376 (=> (not res!25419) (not e!27100))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6376 (= res!25419 (validMask!0 mask!853))))

(assert (=> start!6376 e!27100))

(assert (=> start!6376 true))

(assert (=> start!6376 tp!5885))

(declare-fun b!42757 () Bool)

(assert (=> b!42757 (= e!27100 (not true))))

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2855 0))(
  ( (array!2856 (arr!1371 (Array (_ BitVec 32) (_ BitVec 64))) (size!1550 (_ BitVec 32))) )
))
(declare-fun lt!17969 () array!2855)

(declare-datatypes ((V!2261 0))(
  ( (V!2262 (val!966 Int)) )
))
(declare-fun lt!17965 () V!2261)

(declare-datatypes ((tuple2!1586 0))(
  ( (tuple2!1587 (_1!804 (_ BitVec 64)) (_2!804 V!2261)) )
))
(declare-datatypes ((List!1160 0))(
  ( (Nil!1157) (Cons!1156 (h!1733 tuple2!1586) (t!4121 List!1160)) )
))
(declare-datatypes ((ListLongMap!1163 0))(
  ( (ListLongMap!1164 (toList!597 List!1160)) )
))
(declare-fun lt!17968 () ListLongMap!1163)

(declare-datatypes ((ValueCell!680 0))(
  ( (ValueCellFull!680 (v!2056 V!2261)) (EmptyCell!680) )
))
(declare-datatypes ((array!2857 0))(
  ( (array!2858 (arr!1372 (Array (_ BitVec 32) ValueCell!680)) (size!1551 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!340 0))(
  ( (LongMapFixedSize!341 (defaultEntry!1863 Int) (mask!5391 (_ BitVec 32)) (extraKeys!1754 (_ BitVec 32)) (zeroValue!1781 V!2261) (minValue!1781 V!2261) (_size!219 (_ BitVec 32)) (_keys!3406 array!2855) (_values!1846 array!2857) (_vacant!219 (_ BitVec 32))) )
))
(declare-fun map!802 (LongMapFixedSize!340) ListLongMap!1163)

(assert (=> b!42757 (= lt!17968 (map!802 (LongMapFixedSize!341 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17965 lt!17965 #b00000000000000000000000000000000 lt!17969 (array!2858 ((as const (Array (_ BitVec 32) ValueCell!680)) EmptyCell!680) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1161 0))(
  ( (Nil!1158) (Cons!1157 (h!1734 (_ BitVec 64)) (t!4122 List!1161)) )
))
(declare-fun arrayNoDuplicates!0 (array!2855 (_ BitVec 32) List!1161) Bool)

(assert (=> b!42757 (arrayNoDuplicates!0 lt!17969 #b00000000000000000000000000000000 Nil!1158)))

(declare-datatypes ((Unit!1161 0))(
  ( (Unit!1162) )
))
(declare-fun lt!17964 () Unit!1161)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2855 (_ BitVec 32) (_ BitVec 32) List!1161) Unit!1161)

(assert (=> b!42757 (= lt!17964 (lemmaArrayNoDuplicatesInAll0Array!0 lt!17969 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1158))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2855 (_ BitVec 32)) Bool)

(assert (=> b!42757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17969 mask!853)))

(declare-fun lt!17967 () Unit!1161)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2855 (_ BitVec 32) (_ BitVec 32)) Unit!1161)

(assert (=> b!42757 (= lt!17967 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17969 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2855 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42757 (= (arrayCountValidKeys!0 lt!17969 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17966 () Unit!1161)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2855 (_ BitVec 32) (_ BitVec 32)) Unit!1161)

(assert (=> b!42757 (= lt!17966 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17969 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42757 (= lt!17969 (array!2856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!241 (Int (_ BitVec 64)) V!2261)

(assert (=> b!42757 (= lt!17965 (dynLambda!241 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6376 res!25419) b!42757))

(declare-fun b_lambda!2201 () Bool)

(assert (=> (not b_lambda!2201) (not b!42757)))

(declare-fun t!4120 () Bool)

(declare-fun tb!947 () Bool)

(assert (=> (and start!6376 (= defaultEntry!470 defaultEntry!470) t!4120) tb!947))

(declare-fun result!1645 () Bool)

(declare-fun tp_is_empty!1855 () Bool)

(assert (=> tb!947 (= result!1645 tp_is_empty!1855)))

(assert (=> b!42757 t!4120))

(declare-fun b_and!2581 () Bool)

(assert (= b_and!2579 (and (=> t!4120 result!1645) b_and!2581)))

(declare-fun m!36479 () Bool)

(assert (=> start!6376 m!36479))

(declare-fun m!36481 () Bool)

(assert (=> b!42757 m!36481))

(declare-fun m!36483 () Bool)

(assert (=> b!42757 m!36483))

(declare-fun m!36485 () Bool)

(assert (=> b!42757 m!36485))

(declare-fun m!36487 () Bool)

(assert (=> b!42757 m!36487))

(declare-fun m!36489 () Bool)

(assert (=> b!42757 m!36489))

(declare-fun m!36491 () Bool)

(assert (=> b!42757 m!36491))

(declare-fun m!36493 () Bool)

(assert (=> b!42757 m!36493))

(declare-fun m!36495 () Bool)

(assert (=> b!42757 m!36495))

(push 1)

(assert (not b_lambda!2201))

(assert b_and!2581)

(assert (not start!6376))

(assert (not b!42757))

(assert tp_is_empty!1855)

(assert (not b_next!1465))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2581)

(assert (not b_next!1465))

(check-sat)

(pop 1)

