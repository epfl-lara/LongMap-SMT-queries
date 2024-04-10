; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19134 () Bool)

(assert start!19134)

(declare-fun b!188259 () Bool)

(declare-fun b_free!4621 () Bool)

(declare-fun b_next!4621 () Bool)

(assert (=> b!188259 (= b_free!4621 (not b_next!4621))))

(declare-fun tp!16683 () Bool)

(declare-fun b_and!11251 () Bool)

(assert (=> b!188259 (= tp!16683 b_and!11251)))

(declare-fun mapIsEmpty!7573 () Bool)

(declare-fun mapRes!7573 () Bool)

(assert (=> mapIsEmpty!7573 mapRes!7573))

(declare-fun b!188258 () Bool)

(declare-fun res!88995 () Bool)

(declare-fun e!123897 () Bool)

(assert (=> b!188258 (=> (not res!88995) (not e!123897))))

(declare-datatypes ((V!5505 0))(
  ( (V!5506 (val!2241 Int)) )
))
(declare-datatypes ((ValueCell!1853 0))(
  ( (ValueCellFull!1853 (v!4158 V!5505)) (EmptyCell!1853) )
))
(declare-datatypes ((array!8007 0))(
  ( (array!8008 (arr!3777 (Array (_ BitVec 32) (_ BitVec 64))) (size!4097 (_ BitVec 32))) )
))
(declare-datatypes ((array!8009 0))(
  ( (array!8010 (arr!3778 (Array (_ BitVec 32) ValueCell!1853)) (size!4098 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2614 0))(
  ( (LongMapFixedSize!2615 (defaultEntry!3839 Int) (mask!9002 (_ BitVec 32)) (extraKeys!3576 (_ BitVec 32)) (zeroValue!3680 V!5505) (minValue!3680 V!5505) (_size!1356 (_ BitVec 32)) (_keys!5798 array!8007) (_values!3822 array!8009) (_vacant!1356 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2614)

(assert (=> b!188258 (= res!88995 (and (= (size!4098 (_values!3822 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9002 thiss!1248))) (= (size!4097 (_keys!5798 thiss!1248)) (size!4098 (_values!3822 thiss!1248))) (bvsge (mask!9002 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3576 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3576 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun tp_is_empty!4393 () Bool)

(declare-fun e!123891 () Bool)

(declare-fun e!123894 () Bool)

(declare-fun array_inv!2445 (array!8007) Bool)

(declare-fun array_inv!2446 (array!8009) Bool)

(assert (=> b!188259 (= e!123891 (and tp!16683 tp_is_empty!4393 (array_inv!2445 (_keys!5798 thiss!1248)) (array_inv!2446 (_values!3822 thiss!1248)) e!123894))))

(declare-fun b!188260 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun e!123893 () Bool)

(declare-datatypes ((SeekEntryResult!652 0))(
  ( (MissingZero!652 (index!4778 (_ BitVec 32))) (Found!652 (index!4779 (_ BitVec 32))) (Intermediate!652 (undefined!1464 Bool) (index!4780 (_ BitVec 32)) (x!20338 (_ BitVec 32))) (Undefined!652) (MissingVacant!652 (index!4781 (_ BitVec 32))) )
))
(declare-fun lt!93170 () SeekEntryResult!652)

(assert (=> b!188260 (= e!123893 (= (select (arr!3777 (_keys!5798 thiss!1248)) (index!4779 lt!93170)) key!828))))

(declare-fun b!188261 () Bool)

(declare-datatypes ((Unit!5673 0))(
  ( (Unit!5674) )
))
(declare-fun e!123890 () Unit!5673)

(declare-fun lt!93171 () Unit!5673)

(assert (=> b!188261 (= e!123890 lt!93171)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!154 (array!8007 array!8009 (_ BitVec 32) (_ BitVec 32) V!5505 V!5505 (_ BitVec 64) Int) Unit!5673)

(assert (=> b!188261 (= lt!93171 (lemmaInListMapThenSeekEntryOrOpenFindsIt!154 (_keys!5798 thiss!1248) (_values!3822 thiss!1248) (mask!9002 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) key!828 (defaultEntry!3839 thiss!1248)))))

(declare-fun res!88999 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!188261 (= res!88999 (inRange!0 (index!4779 lt!93170) (mask!9002 thiss!1248)))))

(assert (=> b!188261 (=> (not res!88999) (not e!123893))))

(assert (=> b!188261 e!123893))

(declare-fun b!188262 () Bool)

(declare-fun e!123896 () Bool)

(assert (=> b!188262 (= e!123896 tp_is_empty!4393)))

(declare-fun b!188263 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8007 (_ BitVec 32)) Bool)

(assert (=> b!188263 (= e!123897 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5798 thiss!1248) (mask!9002 thiss!1248))))))

(declare-fun res!88994 () Bool)

(declare-fun e!123895 () Bool)

(assert (=> start!19134 (=> (not res!88994) (not e!123895))))

(declare-fun valid!1076 (LongMapFixedSize!2614) Bool)

(assert (=> start!19134 (= res!88994 (valid!1076 thiss!1248))))

(assert (=> start!19134 e!123895))

(assert (=> start!19134 e!123891))

(assert (=> start!19134 true))

(declare-fun b!188264 () Bool)

(declare-fun e!123888 () Bool)

(assert (=> b!188264 (= e!123895 e!123888)))

(declare-fun res!88996 () Bool)

(assert (=> b!188264 (=> (not res!88996) (not e!123888))))

(assert (=> b!188264 (= res!88996 (and (not (is-Undefined!652 lt!93170)) (not (is-MissingVacant!652 lt!93170)) (not (is-MissingZero!652 lt!93170)) (is-Found!652 lt!93170)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8007 (_ BitVec 32)) SeekEntryResult!652)

(assert (=> b!188264 (= lt!93170 (seekEntryOrOpen!0 key!828 (_keys!5798 thiss!1248) (mask!9002 thiss!1248)))))

(declare-fun b!188265 () Bool)

(declare-fun Unit!5675 () Unit!5673)

(assert (=> b!188265 (= e!123890 Unit!5675)))

(declare-fun lt!93173 () Unit!5673)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!158 (array!8007 array!8009 (_ BitVec 32) (_ BitVec 32) V!5505 V!5505 (_ BitVec 64) Int) Unit!5673)

(assert (=> b!188265 (= lt!93173 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!158 (_keys!5798 thiss!1248) (_values!3822 thiss!1248) (mask!9002 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) key!828 (defaultEntry!3839 thiss!1248)))))

(assert (=> b!188265 false))

(declare-fun b!188266 () Bool)

(assert (=> b!188266 (= e!123888 e!123897)))

(declare-fun res!88997 () Bool)

(assert (=> b!188266 (=> (not res!88997) (not e!123897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!188266 (= res!88997 (validMask!0 (mask!9002 thiss!1248)))))

(declare-fun lt!93172 () Unit!5673)

(assert (=> b!188266 (= lt!93172 e!123890)))

(declare-fun c!33839 () Bool)

(declare-datatypes ((tuple2!3486 0))(
  ( (tuple2!3487 (_1!1754 (_ BitVec 64)) (_2!1754 V!5505)) )
))
(declare-datatypes ((List!2388 0))(
  ( (Nil!2385) (Cons!2384 (h!3021 tuple2!3486) (t!7284 List!2388)) )
))
(declare-datatypes ((ListLongMap!2403 0))(
  ( (ListLongMap!2404 (toList!1217 List!2388)) )
))
(declare-fun contains!1321 (ListLongMap!2403 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!865 (array!8007 array!8009 (_ BitVec 32) (_ BitVec 32) V!5505 V!5505 (_ BitVec 32) Int) ListLongMap!2403)

(assert (=> b!188266 (= c!33839 (contains!1321 (getCurrentListMap!865 (_keys!5798 thiss!1248) (_values!3822 thiss!1248) (mask!9002 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3839 thiss!1248)) key!828))))

(declare-fun b!188267 () Bool)

(declare-fun e!123892 () Bool)

(assert (=> b!188267 (= e!123892 tp_is_empty!4393)))

(declare-fun b!188268 () Bool)

(assert (=> b!188268 (= e!123894 (and e!123896 mapRes!7573))))

(declare-fun condMapEmpty!7573 () Bool)

(declare-fun mapDefault!7573 () ValueCell!1853)

