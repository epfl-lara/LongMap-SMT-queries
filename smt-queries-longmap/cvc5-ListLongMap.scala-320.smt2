; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5910 () Bool)

(assert start!5910)

(declare-fun b_free!1385 () Bool)

(declare-fun b_next!1385 () Bool)

(assert (=> start!5910 (= b_free!1385 (not b_next!1385))))

(declare-fun tp!5765 () Bool)

(declare-fun b_and!2417 () Bool)

(assert (=> start!5910 (= tp!5765 b_and!2417)))

(declare-fun b!41388 () Bool)

(declare-fun res!24594 () Bool)

(declare-fun e!26211 () Bool)

(assert (=> b!41388 (=> res!24594 e!26211)))

(declare-datatypes ((V!2125 0))(
  ( (V!2126 (val!926 Int)) )
))
(declare-datatypes ((tuple2!1488 0))(
  ( (tuple2!1489 (_1!755 (_ BitVec 64)) (_2!755 V!2125)) )
))
(declare-datatypes ((List!1060 0))(
  ( (Nil!1057) (Cons!1056 (h!1633 tuple2!1488) (t!3941 List!1060)) )
))
(declare-datatypes ((ListLongMap!1059 0))(
  ( (ListLongMap!1060 (toList!545 List!1060)) )
))
(declare-fun lt!16335 () ListLongMap!1059)

(declare-fun isEmpty!247 (List!1060) Bool)

(assert (=> b!41388 (= res!24594 (isEmpty!247 (toList!545 lt!16335)))))

(declare-fun b!41390 () Bool)

(assert (=> b!41390 (= e!26211 true)))

(declare-datatypes ((ValueCell!640 0))(
  ( (ValueCellFull!640 (v!2011 V!2125)) (EmptyCell!640) )
))
(declare-datatypes ((array!2621 0))(
  ( (array!2622 (arr!1254 (Array (_ BitVec 32) ValueCell!640)) (size!1406 (_ BitVec 32))) )
))
(declare-fun lt!16329 () array!2621)

(declare-fun lt!16334 () Bool)

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!16333 () V!2125)

(declare-datatypes ((array!2623 0))(
  ( (array!2624 (arr!1255 (Array (_ BitVec 32) (_ BitVec 64))) (size!1407 (_ BitVec 32))) )
))
(declare-fun lt!16331 () array!2623)

(declare-fun contains!516 (ListLongMap!1059 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!302 (array!2623 array!2621 (_ BitVec 32) (_ BitVec 32) V!2125 V!2125 (_ BitVec 32) Int) ListLongMap!1059)

(declare-fun head!854 (List!1060) tuple2!1488)

(assert (=> b!41390 (= lt!16334 (contains!516 (getCurrentListMap!302 lt!16331 lt!16329 mask!853 #b00000000000000000000000000000000 lt!16333 lt!16333 #b00000000000000000000000000000000 defaultEntry!470) (_1!755 (head!854 (toList!545 lt!16335)))))))

(declare-fun res!24596 () Bool)

(declare-fun e!26210 () Bool)

(assert (=> start!5910 (=> (not res!24596) (not e!26210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5910 (= res!24596 (validMask!0 mask!853))))

(assert (=> start!5910 e!26210))

(assert (=> start!5910 true))

(assert (=> start!5910 tp!5765))

(declare-fun b!41387 () Bool)

(assert (=> b!41387 (= e!26210 (not e!26211))))

(declare-fun res!24593 () Bool)

(assert (=> b!41387 (=> res!24593 e!26211)))

(assert (=> b!41387 (= res!24593 (= lt!16335 (ListLongMap!1060 Nil!1057)))))

(declare-datatypes ((LongMapFixedSize!260 0))(
  ( (LongMapFixedSize!261 (defaultEntry!1820 Int) (mask!5223 (_ BitVec 32)) (extraKeys!1711 (_ BitVec 32)) (zeroValue!1738 V!2125) (minValue!1738 V!2125) (_size!179 (_ BitVec 32)) (_keys!3327 array!2623) (_values!1803 array!2621) (_vacant!179 (_ BitVec 32))) )
))
(declare-fun map!706 (LongMapFixedSize!260) ListLongMap!1059)

(assert (=> b!41387 (= lt!16335 (map!706 (LongMapFixedSize!261 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16333 lt!16333 #b00000000000000000000000000000000 lt!16331 lt!16329 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1061 0))(
  ( (Nil!1058) (Cons!1057 (h!1634 (_ BitVec 64)) (t!3942 List!1061)) )
))
(declare-fun arrayNoDuplicates!0 (array!2623 (_ BitVec 32) List!1061) Bool)

(assert (=> b!41387 (arrayNoDuplicates!0 lt!16331 #b00000000000000000000000000000000 Nil!1058)))

(declare-datatypes ((Unit!1027 0))(
  ( (Unit!1028) )
))
(declare-fun lt!16330 () Unit!1027)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2623 (_ BitVec 32) (_ BitVec 32) List!1061) Unit!1027)

(assert (=> b!41387 (= lt!16330 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16331 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2623 (_ BitVec 32)) Bool)

(assert (=> b!41387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16331 mask!853)))

(declare-fun lt!16336 () Unit!1027)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2623 (_ BitVec 32) (_ BitVec 32)) Unit!1027)

(assert (=> b!41387 (= lt!16336 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16331 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2623 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41387 (= (arrayCountValidKeys!0 lt!16331 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16332 () Unit!1027)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2623 (_ BitVec 32) (_ BitVec 32)) Unit!1027)

(assert (=> b!41387 (= lt!16332 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16331 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41387 (= lt!16329 (array!2622 ((as const (Array (_ BitVec 32) ValueCell!640)) EmptyCell!640) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41387 (= lt!16331 (array!2624 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!197 (Int (_ BitVec 64)) V!2125)

(assert (=> b!41387 (= lt!16333 (dynLambda!197 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41389 () Bool)

(declare-fun res!24595 () Bool)

(assert (=> b!41389 (=> res!24595 e!26211)))

(assert (=> b!41389 (= res!24595 (bvslt mask!853 #b00000000000000000000000000000000))))

(assert (= (and start!5910 res!24596) b!41387))

(assert (= (and b!41387 (not res!24593)) b!41388))

(assert (= (and b!41388 (not res!24594)) b!41389))

(assert (= (and b!41389 (not res!24595)) b!41390))

(declare-fun b_lambda!2109 () Bool)

(assert (=> (not b_lambda!2109) (not b!41387)))

(declare-fun t!3940 () Bool)

(declare-fun tb!867 () Bool)

(assert (=> (and start!5910 (= defaultEntry!470 defaultEntry!470) t!3940) tb!867))

(declare-fun result!1485 () Bool)

(declare-fun tp_is_empty!1775 () Bool)

(assert (=> tb!867 (= result!1485 tp_is_empty!1775)))

(assert (=> b!41387 t!3940))

(declare-fun b_and!2419 () Bool)

(assert (= b_and!2417 (and (=> t!3940 result!1485) b_and!2419)))

(declare-fun m!34589 () Bool)

(assert (=> b!41388 m!34589))

(declare-fun m!34591 () Bool)

(assert (=> b!41390 m!34591))

(declare-fun m!34593 () Bool)

(assert (=> b!41390 m!34593))

(assert (=> b!41390 m!34591))

(declare-fun m!34595 () Bool)

(assert (=> b!41390 m!34595))

(declare-fun m!34597 () Bool)

(assert (=> start!5910 m!34597))

(declare-fun m!34599 () Bool)

(assert (=> b!41387 m!34599))

(declare-fun m!34601 () Bool)

(assert (=> b!41387 m!34601))

(declare-fun m!34603 () Bool)

(assert (=> b!41387 m!34603))

(declare-fun m!34605 () Bool)

(assert (=> b!41387 m!34605))

(declare-fun m!34607 () Bool)

(assert (=> b!41387 m!34607))

(declare-fun m!34609 () Bool)

(assert (=> b!41387 m!34609))

(declare-fun m!34611 () Bool)

(assert (=> b!41387 m!34611))

(declare-fun m!34613 () Bool)

(assert (=> b!41387 m!34613))

(push 1)

(assert (not start!5910))

(assert (not b!41387))

(assert tp_is_empty!1775)

(assert (not b!41390))

(assert (not b_next!1385))

(assert b_and!2419)

(assert (not b_lambda!2109))

(assert (not b!41388))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2419)

(assert (not b_next!1385))

(check-sat)

(pop 1)

