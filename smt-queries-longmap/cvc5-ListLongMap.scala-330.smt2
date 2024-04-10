; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6034 () Bool)

(assert start!6034)

(declare-fun b_free!1441 () Bool)

(declare-fun b_next!1441 () Bool)

(assert (=> start!6034 (= b_free!1441 (not b_next!1441))))

(declare-fun tp!5849 () Bool)

(declare-fun b_and!2531 () Bool)

(assert (=> start!6034 (= tp!5849 b_and!2531)))

(declare-fun b!41991 () Bool)

(declare-datatypes ((Unit!1071 0))(
  ( (Unit!1072) )
))
(declare-fun e!26544 () Unit!1071)

(declare-fun Unit!1073 () Unit!1071)

(assert (=> b!41991 (= e!26544 Unit!1073)))

(declare-fun b!41990 () Bool)

(declare-fun Unit!1074 () Unit!1071)

(assert (=> b!41990 (= e!26544 Unit!1074)))

(declare-datatypes ((V!2201 0))(
  ( (V!2202 (val!954 Int)) )
))
(declare-datatypes ((tuple2!1562 0))(
  ( (tuple2!1563 (_1!792 (_ BitVec 64)) (_2!792 V!2201)) )
))
(declare-fun lt!17145 () tuple2!1562)

(declare-datatypes ((List!1130 0))(
  ( (Nil!1127) (Cons!1126 (h!1703 tuple2!1562) (t!4067 List!1130)) )
))
(declare-datatypes ((ListLongMap!1139 0))(
  ( (ListLongMap!1140 (toList!585 List!1130)) )
))
(declare-fun lt!17151 () ListLongMap!1139)

(declare-fun head!884 (List!1130) tuple2!1562)

(assert (=> b!41990 (= lt!17145 (head!884 (toList!585 lt!17151)))))

(declare-fun lt!17156 () Unit!1071)

(declare-fun lt!17147 () V!2201)

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((ValueCell!668 0))(
  ( (ValueCellFull!668 (v!2038 V!2201)) (EmptyCell!668) )
))
(declare-datatypes ((array!2747 0))(
  ( (array!2748 (arr!1317 (Array (_ BitVec 32) ValueCell!668)) (size!1475 (_ BitVec 32))) )
))
(declare-fun lt!17154 () array!2747)

(declare-datatypes ((array!2749 0))(
  ( (array!2750 (arr!1318 (Array (_ BitVec 32) (_ BitVec 64))) (size!1476 (_ BitVec 32))) )
))
(declare-fun lt!17149 () array!2749)

(declare-fun lemmaKeyInListMapIsInArray!100 (array!2749 array!2747 (_ BitVec 32) (_ BitVec 32) V!2201 V!2201 (_ BitVec 64) Int) Unit!1071)

(assert (=> b!41990 (= lt!17156 (lemmaKeyInListMapIsInArray!100 lt!17149 lt!17154 mask!853 #b00000000000000000000000000000000 lt!17147 lt!17147 (_1!792 lt!17145) defaultEntry!470))))

(declare-fun res!25014 () Bool)

(assert (=> b!41990 (= res!25014 (and (not (= (_1!792 lt!17145) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!792 lt!17145) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!26543 () Bool)

(assert (=> b!41990 (=> (not res!25014) (not e!26543))))

(assert (=> b!41990 e!26543))

(declare-fun lt!17146 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2749 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41990 (= lt!17146 (arrayScanForKey!0 lt!17149 (_1!792 lt!17145) #b00000000000000000000000000000000))))

(assert (=> b!41990 false))

(declare-fun b!41989 () Bool)

(declare-fun e!26545 () Bool)

(assert (=> b!41989 (= e!26545 (not true))))

(declare-fun lt!17155 () Bool)

(declare-datatypes ((LongMapFixedSize!316 0))(
  ( (LongMapFixedSize!317 (defaultEntry!1851 Int) (mask!5283 (_ BitVec 32)) (extraKeys!1742 (_ BitVec 32)) (zeroValue!1769 V!2201) (minValue!1769 V!2201) (_size!207 (_ BitVec 32)) (_keys!3364 array!2749) (_values!1834 array!2747) (_vacant!207 (_ BitVec 32))) )
))
(declare-fun lt!17150 () LongMapFixedSize!316)

(declare-fun valid!121 (LongMapFixedSize!316) Bool)

(assert (=> b!41989 (= lt!17155 (valid!121 lt!17150))))

(declare-fun lt!17153 () Unit!1071)

(assert (=> b!41989 (= lt!17153 e!26544)))

(declare-fun c!5243 () Bool)

(assert (=> b!41989 (= c!5243 (not (= lt!17151 (ListLongMap!1140 Nil!1127))))))

(declare-fun map!754 (LongMapFixedSize!316) ListLongMap!1139)

(assert (=> b!41989 (= lt!17151 (map!754 lt!17150))))

(declare-datatypes ((List!1131 0))(
  ( (Nil!1128) (Cons!1127 (h!1704 (_ BitVec 64)) (t!4068 List!1131)) )
))
(declare-fun arrayNoDuplicates!0 (array!2749 (_ BitVec 32) List!1131) Bool)

(assert (=> b!41989 (arrayNoDuplicates!0 lt!17149 #b00000000000000000000000000000000 Nil!1128)))

(declare-fun lt!17152 () Unit!1071)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2749 (_ BitVec 32) (_ BitVec 32) List!1131) Unit!1071)

(assert (=> b!41989 (= lt!17152 (lemmaArrayNoDuplicatesInAll0Array!0 lt!17149 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2749 (_ BitVec 32)) Bool)

(assert (=> b!41989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17149 mask!853)))

(declare-fun lt!17144 () Unit!1071)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2749 (_ BitVec 32) (_ BitVec 32)) Unit!1071)

(assert (=> b!41989 (= lt!17144 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17149 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2749 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41989 (= (arrayCountValidKeys!0 lt!17149 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17148 () Unit!1071)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2749 (_ BitVec 32) (_ BitVec 32)) Unit!1071)

(assert (=> b!41989 (= lt!17148 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17149 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41989 (= lt!17150 (LongMapFixedSize!317 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17147 lt!17147 #b00000000000000000000000000000000 lt!17149 lt!17154 #b00000000000000000000000000000000))))

(assert (=> b!41989 (= lt!17154 (array!2748 ((as const (Array (_ BitVec 32) ValueCell!668)) EmptyCell!668) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41989 (= lt!17149 (array!2750 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!229 (Int (_ BitVec 64)) V!2201)

(assert (=> b!41989 (= lt!17147 (dynLambda!229 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41992 () Bool)

(declare-fun arrayContainsKey!0 (array!2749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!41992 (= e!26543 (arrayContainsKey!0 lt!17149 (_1!792 lt!17145) #b00000000000000000000000000000000))))

(declare-fun res!25013 () Bool)

(assert (=> start!6034 (=> (not res!25013) (not e!26545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6034 (= res!25013 (validMask!0 mask!853))))

(assert (=> start!6034 e!26545))

(assert (=> start!6034 true))

(assert (=> start!6034 tp!5849))

(assert (= (and start!6034 res!25013) b!41989))

(assert (= (and b!41989 c!5243) b!41990))

(assert (= (and b!41989 (not c!5243)) b!41991))

(assert (= (and b!41990 res!25014) b!41992))

(declare-fun b_lambda!2171 () Bool)

(assert (=> (not b_lambda!2171) (not b!41989)))

(declare-fun t!4066 () Bool)

(declare-fun tb!923 () Bool)

(assert (=> (and start!6034 (= defaultEntry!470 defaultEntry!470) t!4066) tb!923))

(declare-fun result!1597 () Bool)

(declare-fun tp_is_empty!1831 () Bool)

(assert (=> tb!923 (= result!1597 tp_is_empty!1831)))

(assert (=> b!41989 t!4066))

(declare-fun b_and!2533 () Bool)

(assert (= b_and!2531 (and (=> t!4066 result!1597) b_and!2533)))

(declare-fun m!35533 () Bool)

(assert (=> b!41990 m!35533))

(declare-fun m!35535 () Bool)

(assert (=> b!41990 m!35535))

(declare-fun m!35537 () Bool)

(assert (=> b!41990 m!35537))

(declare-fun m!35539 () Bool)

(assert (=> b!41989 m!35539))

(declare-fun m!35541 () Bool)

(assert (=> b!41989 m!35541))

(declare-fun m!35543 () Bool)

(assert (=> b!41989 m!35543))

(declare-fun m!35545 () Bool)

(assert (=> b!41989 m!35545))

(declare-fun m!35547 () Bool)

(assert (=> b!41989 m!35547))

(declare-fun m!35549 () Bool)

(assert (=> b!41989 m!35549))

(declare-fun m!35551 () Bool)

(assert (=> b!41989 m!35551))

(declare-fun m!35553 () Bool)

(assert (=> b!41989 m!35553))

(declare-fun m!35555 () Bool)

(assert (=> b!41989 m!35555))

(declare-fun m!35557 () Bool)

(assert (=> b!41992 m!35557))

(declare-fun m!35559 () Bool)

(assert (=> start!6034 m!35559))

(push 1)

(assert tp_is_empty!1831)

(assert b_and!2533)

(assert (not b_next!1441))

(assert (not b_lambda!2171))

(assert (not start!6034))

(assert (not b!41989))

(assert (not b!41990))

(assert (not b!41992))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2533)

(assert (not b_next!1441))

(check-sat)

(pop 1)

