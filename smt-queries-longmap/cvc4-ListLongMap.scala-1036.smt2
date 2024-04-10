; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21902 () Bool)

(assert start!21902)

(declare-fun b!222097 () Bool)

(declare-fun b_free!5969 () Bool)

(declare-fun b_next!5969 () Bool)

(assert (=> b!222097 (= b_free!5969 (not b_next!5969))))

(declare-fun tp!21049 () Bool)

(declare-fun b_and!12867 () Bool)

(assert (=> b!222097 (= tp!21049 b_and!12867)))

(declare-fun b!222076 () Bool)

(declare-fun e!144330 () Bool)

(declare-fun call!20741 () Bool)

(assert (=> b!222076 (= e!144330 (not call!20741))))

(declare-fun b!222077 () Bool)

(declare-fun e!144332 () Bool)

(declare-fun e!144323 () Bool)

(assert (=> b!222077 (= e!144332 e!144323)))

(declare-fun res!108996 () Bool)

(assert (=> b!222077 (=> (not res!108996) (not e!144323))))

(declare-datatypes ((SeekEntryResult!833 0))(
  ( (MissingZero!833 (index!5502 (_ BitVec 32))) (Found!833 (index!5503 (_ BitVec 32))) (Intermediate!833 (undefined!1645 Bool) (index!5504 (_ BitVec 32)) (x!23037 (_ BitVec 32))) (Undefined!833) (MissingVacant!833 (index!5505 (_ BitVec 32))) )
))
(declare-fun lt!112562 () SeekEntryResult!833)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!222077 (= res!108996 (or (= lt!112562 (MissingZero!833 index!297)) (= lt!112562 (MissingVacant!833 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7421 0))(
  ( (V!7422 (val!2960 Int)) )
))
(declare-datatypes ((ValueCell!2572 0))(
  ( (ValueCellFull!2572 (v!4980 V!7421)) (EmptyCell!2572) )
))
(declare-datatypes ((array!10905 0))(
  ( (array!10906 (arr!5172 (Array (_ BitVec 32) ValueCell!2572)) (size!5505 (_ BitVec 32))) )
))
(declare-datatypes ((array!10907 0))(
  ( (array!10908 (arr!5173 (Array (_ BitVec 32) (_ BitVec 64))) (size!5506 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3044 0))(
  ( (LongMapFixedSize!3045 (defaultEntry!4181 Int) (mask!9997 (_ BitVec 32)) (extraKeys!3918 (_ BitVec 32)) (zeroValue!4022 V!7421) (minValue!4022 V!7421) (_size!1571 (_ BitVec 32)) (_keys!6235 array!10907) (_values!4164 array!10905) (_vacant!1571 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3044)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10907 (_ BitVec 32)) SeekEntryResult!833)

(assert (=> b!222077 (= lt!112562 (seekEntryOrOpen!0 key!932 (_keys!6235 thiss!1504) (mask!9997 thiss!1504)))))

(declare-fun b!222078 () Bool)

(declare-fun e!144319 () Bool)

(declare-fun e!144334 () Bool)

(assert (=> b!222078 (= e!144319 e!144334)))

(declare-fun res!109005 () Bool)

(declare-fun call!20742 () Bool)

(assert (=> b!222078 (= res!109005 call!20742)))

(assert (=> b!222078 (=> (not res!109005) (not e!144334))))

(declare-fun b!222079 () Bool)

(declare-datatypes ((Unit!6648 0))(
  ( (Unit!6649) )
))
(declare-fun e!144333 () Unit!6648)

(declare-fun Unit!6650 () Unit!6648)

(assert (=> b!222079 (= e!144333 Unit!6650)))

(declare-fun lt!112566 () Unit!6648)

(declare-fun lemmaArrayContainsKeyThenInListMap!57 (array!10907 array!10905 (_ BitVec 32) (_ BitVec 32) V!7421 V!7421 (_ BitVec 64) (_ BitVec 32) Int) Unit!6648)

(assert (=> b!222079 (= lt!112566 (lemmaArrayContainsKeyThenInListMap!57 (_keys!6235 thiss!1504) (_values!4164 thiss!1504) (mask!9997 thiss!1504) (extraKeys!3918 thiss!1504) (zeroValue!4022 thiss!1504) (minValue!4022 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4181 thiss!1504)))))

(assert (=> b!222079 false))

(declare-fun b!222080 () Bool)

(declare-fun res!109001 () Bool)

(declare-fun e!144327 () Bool)

(assert (=> b!222080 (=> (not res!109001) (not e!144327))))

(declare-fun e!144324 () Bool)

(assert (=> b!222080 (= res!109001 e!144324)))

(declare-fun res!109009 () Bool)

(assert (=> b!222080 (=> res!109009 e!144324)))

(declare-fun e!144335 () Bool)

(assert (=> b!222080 (= res!109009 e!144335)))

(declare-fun res!109000 () Bool)

(assert (=> b!222080 (=> (not res!109000) (not e!144335))))

(assert (=> b!222080 (= res!109000 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!222081 () Bool)

(declare-fun e!144318 () Bool)

(assert (=> b!222081 (= e!144324 e!144318)))

(declare-fun res!108999 () Bool)

(assert (=> b!222081 (=> (not res!108999) (not e!144318))))

(assert (=> b!222081 (= res!108999 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!222082 () Bool)

(declare-fun res!109006 () Bool)

(assert (=> b!222082 (=> (not res!109006) (not e!144327))))

(declare-datatypes ((List!3298 0))(
  ( (Nil!3295) (Cons!3294 (h!3942 (_ BitVec 64)) (t!8257 List!3298)) )
))
(declare-fun contains!1518 (List!3298 (_ BitVec 64)) Bool)

(assert (=> b!222082 (= res!109006 (not (contains!1518 Nil!3295 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!222083 () Bool)

(declare-fun e!144331 () Unit!6648)

(declare-fun Unit!6651 () Unit!6648)

(assert (=> b!222083 (= e!144331 Unit!6651)))

(declare-fun lt!112563 () Unit!6648)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!222 (array!10907 array!10905 (_ BitVec 32) (_ BitVec 32) V!7421 V!7421 (_ BitVec 64) Int) Unit!6648)

(assert (=> b!222083 (= lt!112563 (lemmaInListMapThenSeekEntryOrOpenFindsIt!222 (_keys!6235 thiss!1504) (_values!4164 thiss!1504) (mask!9997 thiss!1504) (extraKeys!3918 thiss!1504) (zeroValue!4022 thiss!1504) (minValue!4022 thiss!1504) key!932 (defaultEntry!4181 thiss!1504)))))

(assert (=> b!222083 false))

(declare-fun b!222084 () Bool)

(assert (=> b!222084 (= e!144335 (contains!1518 Nil!3295 key!932))))

(declare-fun b!222085 () Bool)

(declare-fun res!108997 () Bool)

(assert (=> b!222085 (=> (not res!108997) (not e!144330))))

(assert (=> b!222085 (= res!108997 call!20742)))

(declare-fun e!144321 () Bool)

(assert (=> b!222085 (= e!144321 e!144330)))

(declare-fun b!222086 () Bool)

(declare-fun e!144326 () Bool)

(assert (=> b!222086 (= e!144326 e!144327)))

(declare-fun res!109003 () Bool)

(assert (=> b!222086 (=> (not res!109003) (not e!144327))))

(assert (=> b!222086 (= res!109003 (and (bvslt (size!5506 (_keys!6235 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5506 (_keys!6235 thiss!1504)))))))

(declare-fun lt!112568 () Unit!6648)

(assert (=> b!222086 (= lt!112568 e!144333)))

(declare-fun c!36911 () Bool)

(declare-fun arrayContainsKey!0 (array!10907 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222086 (= c!36911 (arrayContainsKey!0 (_keys!6235 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!222087 () Bool)

(assert (=> b!222087 (= e!144334 (not call!20741))))

(declare-fun b!222088 () Bool)

(declare-fun e!144325 () Bool)

(declare-fun tp_is_empty!5831 () Bool)

(assert (=> b!222088 (= e!144325 tp_is_empty!5831)))

(declare-fun b!222089 () Bool)

(declare-fun Unit!6652 () Unit!6648)

(assert (=> b!222089 (= e!144333 Unit!6652)))

(declare-fun b!222090 () Bool)

(assert (=> b!222090 (= e!144319 (is-Undefined!833 lt!112562))))

(declare-fun mapNonEmpty!9916 () Bool)

(declare-fun mapRes!9916 () Bool)

(declare-fun tp!21048 () Bool)

(assert (=> mapNonEmpty!9916 (= mapRes!9916 (and tp!21048 e!144325))))

(declare-fun mapKey!9916 () (_ BitVec 32))

(declare-fun mapRest!9916 () (Array (_ BitVec 32) ValueCell!2572))

(declare-fun mapValue!9916 () ValueCell!2572)

(assert (=> mapNonEmpty!9916 (= (arr!5172 (_values!4164 thiss!1504)) (store mapRest!9916 mapKey!9916 mapValue!9916))))

(declare-fun res!109007 () Bool)

(assert (=> start!21902 (=> (not res!109007) (not e!144332))))

(declare-fun valid!1229 (LongMapFixedSize!3044) Bool)

(assert (=> start!21902 (= res!109007 (valid!1229 thiss!1504))))

(assert (=> start!21902 e!144332))

(declare-fun e!144322 () Bool)

(assert (=> start!21902 e!144322))

(assert (=> start!21902 true))

(declare-fun b!222091 () Bool)

(declare-fun lt!112565 () Unit!6648)

(assert (=> b!222091 (= e!144331 lt!112565)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!233 (array!10907 array!10905 (_ BitVec 32) (_ BitVec 32) V!7421 V!7421 (_ BitVec 64) Int) Unit!6648)

(assert (=> b!222091 (= lt!112565 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!233 (_keys!6235 thiss!1504) (_values!4164 thiss!1504) (mask!9997 thiss!1504) (extraKeys!3918 thiss!1504) (zeroValue!4022 thiss!1504) (minValue!4022 thiss!1504) key!932 (defaultEntry!4181 thiss!1504)))))

(declare-fun c!36909 () Bool)

(assert (=> b!222091 (= c!36909 (is-MissingZero!833 lt!112562))))

(assert (=> b!222091 e!144321))

(declare-fun b!222092 () Bool)

(declare-fun res!108995 () Bool)

(assert (=> b!222092 (=> (not res!108995) (not e!144330))))

(assert (=> b!222092 (= res!108995 (= (select (arr!5173 (_keys!6235 thiss!1504)) (index!5502 lt!112562)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!222093 () Bool)

(declare-fun res!109008 () Bool)

(assert (=> b!222093 (=> (not res!109008) (not e!144327))))

(declare-fun noDuplicate!68 (List!3298) Bool)

(assert (=> b!222093 (= res!109008 (noDuplicate!68 Nil!3295))))

(declare-fun b!222094 () Bool)

(declare-fun res!109002 () Bool)

(assert (=> b!222094 (=> (not res!109002) (not e!144327))))

(assert (=> b!222094 (= res!109002 (not (contains!1518 Nil!3295 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!222095 () Bool)

(declare-fun res!108998 () Bool)

(assert (=> b!222095 (= res!108998 (= (select (arr!5173 (_keys!6235 thiss!1504)) (index!5505 lt!112562)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!222095 (=> (not res!108998) (not e!144334))))

(declare-fun b!222096 () Bool)

(assert (=> b!222096 (= e!144327 false)))

(declare-fun lt!112564 () Bool)

(declare-fun arrayNoDuplicates!0 (array!10907 (_ BitVec 32) List!3298) Bool)

(assert (=> b!222096 (= lt!112564 (arrayNoDuplicates!0 (_keys!6235 thiss!1504) #b00000000000000000000000000000000 Nil!3295))))

(declare-fun e!144320 () Bool)

(declare-fun array_inv!3425 (array!10907) Bool)

(declare-fun array_inv!3426 (array!10905) Bool)

(assert (=> b!222097 (= e!144322 (and tp!21049 tp_is_empty!5831 (array_inv!3425 (_keys!6235 thiss!1504)) (array_inv!3426 (_values!4164 thiss!1504)) e!144320))))

(declare-fun bm!20738 () Bool)

(assert (=> bm!20738 (= call!20741 (arrayContainsKey!0 (_keys!6235 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!222098 () Bool)

(declare-fun res!109004 () Bool)

(assert (=> b!222098 (=> (not res!109004) (not e!144332))))

(assert (=> b!222098 (= res!109004 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!20739 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20739 (= call!20742 (inRange!0 (ite c!36909 (index!5502 lt!112562) (index!5505 lt!112562)) (mask!9997 thiss!1504)))))

(declare-fun b!222099 () Bool)

(declare-fun c!36912 () Bool)

(assert (=> b!222099 (= c!36912 (is-MissingVacant!833 lt!112562))))

(assert (=> b!222099 (= e!144321 e!144319)))

(declare-fun mapIsEmpty!9916 () Bool)

(assert (=> mapIsEmpty!9916 mapRes!9916))

(declare-fun b!222100 () Bool)

(assert (=> b!222100 (= e!144323 e!144326)))

(declare-fun res!108994 () Bool)

(assert (=> b!222100 (=> (not res!108994) (not e!144326))))

(assert (=> b!222100 (= res!108994 (inRange!0 index!297 (mask!9997 thiss!1504)))))

(declare-fun lt!112567 () Unit!6648)

(assert (=> b!222100 (= lt!112567 e!144331)))

(declare-fun c!36910 () Bool)

(declare-datatypes ((tuple2!4396 0))(
  ( (tuple2!4397 (_1!2209 (_ BitVec 64)) (_2!2209 V!7421)) )
))
(declare-datatypes ((List!3299 0))(
  ( (Nil!3296) (Cons!3295 (h!3943 tuple2!4396) (t!8258 List!3299)) )
))
(declare-datatypes ((ListLongMap!3309 0))(
  ( (ListLongMap!3310 (toList!1670 List!3299)) )
))
(declare-fun contains!1519 (ListLongMap!3309 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1198 (array!10907 array!10905 (_ BitVec 32) (_ BitVec 32) V!7421 V!7421 (_ BitVec 32) Int) ListLongMap!3309)

(assert (=> b!222100 (= c!36910 (contains!1519 (getCurrentListMap!1198 (_keys!6235 thiss!1504) (_values!4164 thiss!1504) (mask!9997 thiss!1504) (extraKeys!3918 thiss!1504) (zeroValue!4022 thiss!1504) (minValue!4022 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4181 thiss!1504)) key!932))))

(declare-fun b!222101 () Bool)

(declare-fun e!144328 () Bool)

(assert (=> b!222101 (= e!144320 (and e!144328 mapRes!9916))))

(declare-fun condMapEmpty!9916 () Bool)

(declare-fun mapDefault!9916 () ValueCell!2572)

