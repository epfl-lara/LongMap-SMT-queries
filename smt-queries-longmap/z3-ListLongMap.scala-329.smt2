; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6030 () Bool)

(assert start!6030)

(declare-fun b_free!1437 () Bool)

(declare-fun b_next!1437 () Bool)

(assert (=> start!6030 (= b_free!1437 (not b_next!1437))))

(declare-fun tp!5843 () Bool)

(declare-fun b_and!2523 () Bool)

(assert (=> start!6030 (= tp!5843 b_and!2523)))

(declare-fun b!41964 () Bool)

(declare-fun e!26525 () Bool)

(declare-datatypes ((array!2739 0))(
  ( (array!2740 (arr!1313 (Array (_ BitVec 32) (_ BitVec 64))) (size!1471 (_ BitVec 32))) )
))
(declare-fun lt!17088 () array!2739)

(declare-datatypes ((V!2195 0))(
  ( (V!2196 (val!952 Int)) )
))
(declare-datatypes ((tuple2!1558 0))(
  ( (tuple2!1559 (_1!790 (_ BitVec 64)) (_2!790 V!2195)) )
))
(declare-fun lt!17083 () tuple2!1558)

(declare-fun arrayContainsKey!0 (array!2739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!41964 (= e!26525 (arrayContainsKey!0 lt!17088 (_1!790 lt!17083) #b00000000000000000000000000000000))))

(declare-fun res!24993 () Bool)

(declare-fun e!26527 () Bool)

(assert (=> start!6030 (=> (not res!24993) (not e!26527))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6030 (= res!24993 (validMask!0 mask!853))))

(assert (=> start!6030 e!26527))

(assert (=> start!6030 true))

(assert (=> start!6030 tp!5843))

(declare-fun b!41961 () Bool)

(declare-fun e!26526 () Bool)

(assert (=> b!41961 (= e!26527 (not e!26526))))

(declare-fun res!24994 () Bool)

(assert (=> b!41961 (=> res!24994 e!26526)))

(declare-datatypes ((List!1126 0))(
  ( (Nil!1123) (Cons!1122 (h!1699 tuple2!1558) (t!4059 List!1126)) )
))
(declare-datatypes ((ListLongMap!1135 0))(
  ( (ListLongMap!1136 (toList!583 List!1126)) )
))
(declare-fun lt!17089 () ListLongMap!1135)

(assert (=> b!41961 (= res!24994 (= lt!17089 (ListLongMap!1136 Nil!1123)))))

(declare-datatypes ((ValueCell!666 0))(
  ( (ValueCellFull!666 (v!2036 V!2195)) (EmptyCell!666) )
))
(declare-datatypes ((array!2741 0))(
  ( (array!2742 (arr!1314 (Array (_ BitVec 32) ValueCell!666)) (size!1472 (_ BitVec 32))) )
))
(declare-fun lt!17087 () array!2741)

(declare-fun lt!17082 () V!2195)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((LongMapFixedSize!312 0))(
  ( (LongMapFixedSize!313 (defaultEntry!1849 Int) (mask!5279 (_ BitVec 32)) (extraKeys!1740 (_ BitVec 32)) (zeroValue!1767 V!2195) (minValue!1767 V!2195) (_size!205 (_ BitVec 32)) (_keys!3362 array!2739) (_values!1832 array!2741) (_vacant!205 (_ BitVec 32))) )
))
(declare-fun map!750 (LongMapFixedSize!312) ListLongMap!1135)

(assert (=> b!41961 (= lt!17089 (map!750 (LongMapFixedSize!313 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17082 lt!17082 #b00000000000000000000000000000000 lt!17088 lt!17087 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1127 0))(
  ( (Nil!1124) (Cons!1123 (h!1700 (_ BitVec 64)) (t!4060 List!1127)) )
))
(declare-fun arrayNoDuplicates!0 (array!2739 (_ BitVec 32) List!1127) Bool)

(assert (=> b!41961 (arrayNoDuplicates!0 lt!17088 #b00000000000000000000000000000000 Nil!1124)))

(declare-datatypes ((Unit!1067 0))(
  ( (Unit!1068) )
))
(declare-fun lt!17090 () Unit!1067)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2739 (_ BitVec 32) (_ BitVec 32) List!1127) Unit!1067)

(assert (=> b!41961 (= lt!17090 (lemmaArrayNoDuplicatesInAll0Array!0 lt!17088 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1124))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2739 (_ BitVec 32)) Bool)

(assert (=> b!41961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17088 mask!853)))

(declare-fun lt!17086 () Unit!1067)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2739 (_ BitVec 32) (_ BitVec 32)) Unit!1067)

(assert (=> b!41961 (= lt!17086 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17088 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2739 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41961 (= (arrayCountValidKeys!0 lt!17088 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17085 () Unit!1067)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2739 (_ BitVec 32) (_ BitVec 32)) Unit!1067)

(assert (=> b!41961 (= lt!17085 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17088 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41961 (= lt!17087 (array!2742 ((as const (Array (_ BitVec 32) ValueCell!666)) EmptyCell!666) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41961 (= lt!17088 (array!2740 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!227 (Int (_ BitVec 64)) V!2195)

(assert (=> b!41961 (= lt!17082 (dynLambda!227 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41963 () Bool)

(assert (=> b!41963 (= e!26526 true)))

(assert (=> b!41963 e!26525))

(declare-fun res!24995 () Bool)

(assert (=> b!41963 (=> (not res!24995) (not e!26525))))

(assert (=> b!41963 (= res!24995 (and (not (= (_1!790 lt!17083) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!790 lt!17083) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!17084 () Unit!1067)

(declare-fun lemmaKeyInListMapIsInArray!98 (array!2739 array!2741 (_ BitVec 32) (_ BitVec 32) V!2195 V!2195 (_ BitVec 64) Int) Unit!1067)

(assert (=> b!41963 (= lt!17084 (lemmaKeyInListMapIsInArray!98 lt!17088 lt!17087 mask!853 #b00000000000000000000000000000000 lt!17082 lt!17082 (_1!790 lt!17083) defaultEntry!470))))

(declare-fun head!882 (List!1126) tuple2!1558)

(assert (=> b!41963 (= lt!17083 (head!882 (toList!583 lt!17089)))))

(declare-fun b!41962 () Bool)

(declare-fun res!24996 () Bool)

(assert (=> b!41962 (=> res!24996 e!26526)))

(declare-fun isEmpty!269 (List!1126) Bool)

(assert (=> b!41962 (= res!24996 (isEmpty!269 (toList!583 lt!17089)))))

(assert (= (and start!6030 res!24993) b!41961))

(assert (= (and b!41961 (not res!24994)) b!41962))

(assert (= (and b!41962 (not res!24996)) b!41963))

(assert (= (and b!41963 res!24995) b!41964))

(declare-fun b_lambda!2167 () Bool)

(assert (=> (not b_lambda!2167) (not b!41961)))

(declare-fun t!4058 () Bool)

(declare-fun tb!919 () Bool)

(assert (=> (and start!6030 (= defaultEntry!470 defaultEntry!470) t!4058) tb!919))

(declare-fun result!1589 () Bool)

(declare-fun tp_is_empty!1827 () Bool)

(assert (=> tb!919 (= result!1589 tp_is_empty!1827)))

(assert (=> b!41961 t!4058))

(declare-fun b_and!2525 () Bool)

(assert (= b_and!2523 (and (=> t!4058 result!1589) b_and!2525)))

(declare-fun m!35481 () Bool)

(assert (=> b!41963 m!35481))

(declare-fun m!35483 () Bool)

(assert (=> b!41963 m!35483))

(declare-fun m!35485 () Bool)

(assert (=> start!6030 m!35485))

(declare-fun m!35487 () Bool)

(assert (=> b!41964 m!35487))

(declare-fun m!35489 () Bool)

(assert (=> b!41961 m!35489))

(declare-fun m!35491 () Bool)

(assert (=> b!41961 m!35491))

(declare-fun m!35493 () Bool)

(assert (=> b!41961 m!35493))

(declare-fun m!35495 () Bool)

(assert (=> b!41961 m!35495))

(declare-fun m!35497 () Bool)

(assert (=> b!41961 m!35497))

(declare-fun m!35499 () Bool)

(assert (=> b!41961 m!35499))

(declare-fun m!35501 () Bool)

(assert (=> b!41961 m!35501))

(declare-fun m!35503 () Bool)

(assert (=> b!41961 m!35503))

(declare-fun m!35505 () Bool)

(assert (=> b!41962 m!35505))

(check-sat (not b!41964) (not b_next!1437) tp_is_empty!1827 (not start!6030) b_and!2525 (not b!41962) (not b_lambda!2167) (not b!41961) (not b!41963))
(check-sat b_and!2525 (not b_next!1437))
