; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6038 () Bool)

(assert start!6038)

(declare-fun b_free!1441 () Bool)

(declare-fun b_next!1441 () Bool)

(assert (=> start!6038 (= b_free!1441 (not b_next!1441))))

(declare-fun tp!5849 () Bool)

(declare-fun b_and!2529 () Bool)

(assert (=> start!6038 (= tp!5849 b_and!2529)))

(declare-fun b!41935 () Bool)

(declare-fun e!26507 () Bool)

(declare-datatypes ((array!2733 0))(
  ( (array!2734 (arr!1310 (Array (_ BitVec 32) (_ BitVec 64))) (size!1468 (_ BitVec 32))) )
))
(declare-fun lt!17113 () array!2733)

(declare-datatypes ((V!2201 0))(
  ( (V!2202 (val!954 Int)) )
))
(declare-datatypes ((tuple2!1544 0))(
  ( (tuple2!1545 (_1!783 (_ BitVec 64)) (_2!783 V!2201)) )
))
(declare-fun lt!17110 () tuple2!1544)

(declare-fun arrayContainsKey!0 (array!2733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!41935 (= e!26507 (arrayContainsKey!0 lt!17113 (_1!783 lt!17110) #b00000000000000000000000000000000))))

(declare-fun b!41933 () Bool)

(declare-datatypes ((Unit!1083 0))(
  ( (Unit!1084) )
))
(declare-fun e!26506 () Unit!1083)

(declare-fun Unit!1085 () Unit!1083)

(assert (=> b!41933 (= e!26506 Unit!1085)))

(declare-datatypes ((List!1116 0))(
  ( (Nil!1113) (Cons!1112 (h!1689 tuple2!1544) (t!4053 List!1116)) )
))
(declare-datatypes ((ListLongMap!1115 0))(
  ( (ListLongMap!1116 (toList!573 List!1116)) )
))
(declare-fun lt!17111 () ListLongMap!1115)

(declare-fun head!882 (List!1116) tuple2!1544)

(assert (=> b!41933 (= lt!17110 (head!882 (toList!573 lt!17111)))))

(declare-datatypes ((ValueCell!668 0))(
  ( (ValueCellFull!668 (v!2039 V!2201)) (EmptyCell!668) )
))
(declare-datatypes ((array!2735 0))(
  ( (array!2736 (arr!1311 (Array (_ BitVec 32) ValueCell!668)) (size!1469 (_ BitVec 32))) )
))
(declare-fun lt!17103 () array!2735)

(declare-fun lt!17108 () Unit!1083)

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!17102 () V!2201)

(declare-fun lemmaKeyInListMapIsInArray!106 (array!2733 array!2735 (_ BitVec 32) (_ BitVec 32) V!2201 V!2201 (_ BitVec 64) Int) Unit!1083)

(assert (=> b!41933 (= lt!17108 (lemmaKeyInListMapIsInArray!106 lt!17113 lt!17103 mask!853 #b00000000000000000000000000000000 lt!17102 lt!17102 (_1!783 lt!17110) defaultEntry!470))))

(declare-fun res!24988 () Bool)

(assert (=> b!41933 (= res!24988 (and (not (= (_1!783 lt!17110) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!783 lt!17110) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!41933 (=> (not res!24988) (not e!26507))))

(assert (=> b!41933 e!26507))

(declare-fun lt!17109 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2733 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41933 (= lt!17109 (arrayScanForKey!0 lt!17113 (_1!783 lt!17110) #b00000000000000000000000000000000))))

(assert (=> b!41933 false))

(declare-fun b!41932 () Bool)

(declare-fun e!26508 () Bool)

(assert (=> b!41932 (= e!26508 (not true))))

(declare-fun lt!17101 () Bool)

(declare-datatypes ((LongMapFixedSize!316 0))(
  ( (LongMapFixedSize!317 (defaultEntry!1851 Int) (mask!5283 (_ BitVec 32)) (extraKeys!1742 (_ BitVec 32)) (zeroValue!1769 V!2201) (minValue!1769 V!2201) (_size!207 (_ BitVec 32)) (_keys!3364 array!2733) (_values!1834 array!2735) (_vacant!207 (_ BitVec 32))) )
))
(declare-fun lt!17112 () LongMapFixedSize!316)

(declare-fun valid!135 (LongMapFixedSize!316) Bool)

(assert (=> b!41932 (= lt!17101 (valid!135 lt!17112))))

(declare-fun lt!17107 () Unit!1083)

(assert (=> b!41932 (= lt!17107 e!26506)))

(declare-fun c!5227 () Bool)

(assert (=> b!41932 (= c!5227 (not (= lt!17111 (ListLongMap!1116 Nil!1113))))))

(declare-fun map!754 (LongMapFixedSize!316) ListLongMap!1115)

(assert (=> b!41932 (= lt!17111 (map!754 lt!17112))))

(declare-datatypes ((List!1117 0))(
  ( (Nil!1114) (Cons!1113 (h!1690 (_ BitVec 64)) (t!4054 List!1117)) )
))
(declare-fun arrayNoDuplicates!0 (array!2733 (_ BitVec 32) List!1117) Bool)

(assert (=> b!41932 (arrayNoDuplicates!0 lt!17113 #b00000000000000000000000000000000 Nil!1114)))

(declare-fun lt!17106 () Unit!1083)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2733 (_ BitVec 32) (_ BitVec 32) List!1117) Unit!1083)

(assert (=> b!41932 (= lt!17106 (lemmaArrayNoDuplicatesInAll0Array!0 lt!17113 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2733 (_ BitVec 32)) Bool)

(assert (=> b!41932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17113 mask!853)))

(declare-fun lt!17105 () Unit!1083)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2733 (_ BitVec 32) (_ BitVec 32)) Unit!1083)

(assert (=> b!41932 (= lt!17105 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17113 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2733 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41932 (= (arrayCountValidKeys!0 lt!17113 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17104 () Unit!1083)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2733 (_ BitVec 32) (_ BitVec 32)) Unit!1083)

(assert (=> b!41932 (= lt!17104 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17113 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41932 (= lt!17112 (LongMapFixedSize!317 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17102 lt!17102 #b00000000000000000000000000000000 lt!17113 lt!17103 #b00000000000000000000000000000000))))

(assert (=> b!41932 (= lt!17103 (array!2736 ((as const (Array (_ BitVec 32) ValueCell!668)) EmptyCell!668) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41932 (= lt!17113 (array!2734 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!225 (Int (_ BitVec 64)) V!2201)

(assert (=> b!41932 (= lt!17102 (dynLambda!225 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!24989 () Bool)

(assert (=> start!6038 (=> (not res!24989) (not e!26508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6038 (= res!24989 (validMask!0 mask!853))))

(assert (=> start!6038 e!26508))

(assert (=> start!6038 true))

(assert (=> start!6038 tp!5849))

(declare-fun b!41934 () Bool)

(declare-fun Unit!1086 () Unit!1083)

(assert (=> b!41934 (= e!26506 Unit!1086)))

(assert (= (and start!6038 res!24989) b!41932))

(assert (= (and b!41932 c!5227) b!41933))

(assert (= (and b!41932 (not c!5227)) b!41934))

(assert (= (and b!41933 res!24988) b!41935))

(declare-fun b_lambda!2171 () Bool)

(assert (=> (not b_lambda!2171) (not b!41932)))

(declare-fun t!4052 () Bool)

(declare-fun tb!923 () Bool)

(assert (=> (and start!6038 (= defaultEntry!470 defaultEntry!470) t!4052) tb!923))

(declare-fun result!1597 () Bool)

(declare-fun tp_is_empty!1831 () Bool)

(assert (=> tb!923 (= result!1597 tp_is_empty!1831)))

(assert (=> b!41932 t!4052))

(declare-fun b_and!2531 () Bool)

(assert (= b_and!2529 (and (=> t!4052 result!1597) b_and!2531)))

(declare-fun m!35407 () Bool)

(assert (=> b!41935 m!35407))

(declare-fun m!35409 () Bool)

(assert (=> b!41933 m!35409))

(declare-fun m!35411 () Bool)

(assert (=> b!41933 m!35411))

(declare-fun m!35413 () Bool)

(assert (=> b!41933 m!35413))

(declare-fun m!35415 () Bool)

(assert (=> b!41932 m!35415))

(declare-fun m!35417 () Bool)

(assert (=> b!41932 m!35417))

(declare-fun m!35419 () Bool)

(assert (=> b!41932 m!35419))

(declare-fun m!35421 () Bool)

(assert (=> b!41932 m!35421))

(declare-fun m!35423 () Bool)

(assert (=> b!41932 m!35423))

(declare-fun m!35425 () Bool)

(assert (=> b!41932 m!35425))

(declare-fun m!35427 () Bool)

(assert (=> b!41932 m!35427))

(declare-fun m!35429 () Bool)

(assert (=> b!41932 m!35429))

(declare-fun m!35431 () Bool)

(assert (=> b!41932 m!35431))

(declare-fun m!35433 () Bool)

(assert (=> start!6038 m!35433))

(check-sat (not b_lambda!2171) (not start!6038) (not b!41932) tp_is_empty!1831 (not b!41933) (not b_next!1441) b_and!2531 (not b!41935))
(check-sat b_and!2531 (not b_next!1441))
