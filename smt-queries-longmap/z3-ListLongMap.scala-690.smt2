; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16648 () Bool)

(assert start!16648)

(declare-fun b!166171 () Bool)

(declare-fun b_free!3949 () Bool)

(declare-fun b_next!3949 () Bool)

(assert (=> b!166171 (= b_free!3949 (not b_next!3949))))

(declare-fun tp!14448 () Bool)

(declare-fun b_and!10337 () Bool)

(assert (=> b!166171 (= tp!14448 b_and!10337)))

(declare-fun b!166170 () Bool)

(declare-fun res!78940 () Bool)

(declare-fun e!109004 () Bool)

(assert (=> b!166170 (=> (not res!78940) (not e!109004))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!166170 (= res!78940 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!6345 () Bool)

(declare-fun mapRes!6345 () Bool)

(assert (=> mapIsEmpty!6345 mapRes!6345))

(declare-fun tp_is_empty!3751 () Bool)

(declare-fun e!108999 () Bool)

(declare-fun e!109005 () Bool)

(declare-datatypes ((V!4649 0))(
  ( (V!4650 (val!1920 Int)) )
))
(declare-datatypes ((ValueCell!1532 0))(
  ( (ValueCellFull!1532 (v!3779 V!4649)) (EmptyCell!1532) )
))
(declare-datatypes ((array!6579 0))(
  ( (array!6580 (arr!3124 (Array (_ BitVec 32) (_ BitVec 64))) (size!3413 (_ BitVec 32))) )
))
(declare-datatypes ((array!6581 0))(
  ( (array!6582 (arr!3125 (Array (_ BitVec 32) ValueCell!1532)) (size!3414 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1972 0))(
  ( (LongMapFixedSize!1973 (defaultEntry!3428 Int) (mask!8156 (_ BitVec 32)) (extraKeys!3169 (_ BitVec 32)) (zeroValue!3271 V!4649) (minValue!3271 V!4649) (_size!1035 (_ BitVec 32)) (_keys!5252 array!6579) (_values!3411 array!6581) (_vacant!1035 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1972)

(declare-fun array_inv!2009 (array!6579) Bool)

(declare-fun array_inv!2010 (array!6581) Bool)

(assert (=> b!166171 (= e!108999 (and tp!14448 tp_is_empty!3751 (array_inv!2009 (_keys!5252 thiss!1248)) (array_inv!2010 (_values!3411 thiss!1248)) e!109005))))

(declare-fun b!166172 () Bool)

(declare-datatypes ((Unit!5027 0))(
  ( (Unit!5028) )
))
(declare-fun e!109003 () Unit!5027)

(declare-fun Unit!5029 () Unit!5027)

(assert (=> b!166172 (= e!109003 Unit!5029)))

(declare-fun lt!83081 () Unit!5027)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!81 (array!6579 array!6581 (_ BitVec 32) (_ BitVec 32) V!4649 V!4649 (_ BitVec 64) Int) Unit!5027)

(assert (=> b!166172 (= lt!83081 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!81 (_keys!5252 thiss!1248) (_values!3411 thiss!1248) (mask!8156 thiss!1248) (extraKeys!3169 thiss!1248) (zeroValue!3271 thiss!1248) (minValue!3271 thiss!1248) key!828 (defaultEntry!3428 thiss!1248)))))

(assert (=> b!166172 false))

(declare-fun b!166173 () Bool)

(declare-fun e!109006 () Bool)

(assert (=> b!166173 (= e!109006 tp_is_empty!3751)))

(declare-fun b!166175 () Bool)

(declare-fun res!78946 () Bool)

(declare-fun e!109000 () Bool)

(assert (=> b!166175 (=> (not res!78946) (not e!109000))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6579 (_ BitVec 32)) Bool)

(assert (=> b!166175 (= res!78946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5252 thiss!1248) (mask!8156 thiss!1248)))))

(declare-fun b!166176 () Bool)

(assert (=> b!166176 (= e!109000 false)))

(declare-fun lt!83078 () Bool)

(declare-datatypes ((List!2089 0))(
  ( (Nil!2086) (Cons!2085 (h!2702 (_ BitVec 64)) (t!6882 List!2089)) )
))
(declare-fun arrayNoDuplicates!0 (array!6579 (_ BitVec 32) List!2089) Bool)

(assert (=> b!166176 (= lt!83078 (arrayNoDuplicates!0 (_keys!5252 thiss!1248) #b00000000000000000000000000000000 Nil!2086))))

(declare-fun b!166177 () Bool)

(declare-fun res!78943 () Bool)

(assert (=> b!166177 (=> (not res!78943) (not e!109000))))

(assert (=> b!166177 (= res!78943 (and (= (size!3414 (_values!3411 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8156 thiss!1248))) (= (size!3413 (_keys!5252 thiss!1248)) (size!3414 (_values!3411 thiss!1248))) (bvsge (mask!8156 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3169 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3169 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!166178 () Bool)

(declare-fun e!109007 () Bool)

(assert (=> b!166178 (= e!109007 tp_is_empty!3751)))

(declare-fun b!166179 () Bool)

(assert (=> b!166179 (= e!109005 (and e!109006 mapRes!6345))))

(declare-fun condMapEmpty!6345 () Bool)

(declare-fun mapDefault!6345 () ValueCell!1532)

(assert (=> b!166179 (= condMapEmpty!6345 (= (arr!3125 (_values!3411 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1532)) mapDefault!6345)))))

(declare-fun b!166180 () Bool)

(declare-fun e!109001 () Bool)

(assert (=> b!166180 (= e!109004 e!109001)))

(declare-fun res!78944 () Bool)

(assert (=> b!166180 (=> (not res!78944) (not e!109001))))

(declare-datatypes ((SeekEntryResult!464 0))(
  ( (MissingZero!464 (index!4024 (_ BitVec 32))) (Found!464 (index!4025 (_ BitVec 32))) (Intermediate!464 (undefined!1276 Bool) (index!4026 (_ BitVec 32)) (x!18435 (_ BitVec 32))) (Undefined!464) (MissingVacant!464 (index!4027 (_ BitVec 32))) )
))
(declare-fun lt!83080 () SeekEntryResult!464)

(get-info :version)

(assert (=> b!166180 (= res!78944 (and (not ((_ is Undefined!464) lt!83080)) (not ((_ is MissingVacant!464) lt!83080)) (not ((_ is MissingZero!464) lt!83080)) ((_ is Found!464) lt!83080)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6579 (_ BitVec 32)) SeekEntryResult!464)

(assert (=> b!166180 (= lt!83080 (seekEntryOrOpen!0 key!828 (_keys!5252 thiss!1248) (mask!8156 thiss!1248)))))

(declare-fun mapNonEmpty!6345 () Bool)

(declare-fun tp!14447 () Bool)

(assert (=> mapNonEmpty!6345 (= mapRes!6345 (and tp!14447 e!109007))))

(declare-fun mapValue!6345 () ValueCell!1532)

(declare-fun mapKey!6345 () (_ BitVec 32))

(declare-fun mapRest!6345 () (Array (_ BitVec 32) ValueCell!1532))

(assert (=> mapNonEmpty!6345 (= (arr!3125 (_values!3411 thiss!1248)) (store mapRest!6345 mapKey!6345 mapValue!6345))))

(declare-fun b!166174 () Bool)

(declare-fun lt!83079 () Unit!5027)

(assert (=> b!166174 (= e!109003 lt!83079)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!84 (array!6579 array!6581 (_ BitVec 32) (_ BitVec 32) V!4649 V!4649 (_ BitVec 64) Int) Unit!5027)

(assert (=> b!166174 (= lt!83079 (lemmaInListMapThenSeekEntryOrOpenFindsIt!84 (_keys!5252 thiss!1248) (_values!3411 thiss!1248) (mask!8156 thiss!1248) (extraKeys!3169 thiss!1248) (zeroValue!3271 thiss!1248) (minValue!3271 thiss!1248) key!828 (defaultEntry!3428 thiss!1248)))))

(declare-fun res!78945 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166174 (= res!78945 (inRange!0 (index!4025 lt!83080) (mask!8156 thiss!1248)))))

(declare-fun e!109008 () Bool)

(assert (=> b!166174 (=> (not res!78945) (not e!109008))))

(assert (=> b!166174 e!109008))

(declare-fun res!78942 () Bool)

(assert (=> start!16648 (=> (not res!78942) (not e!109004))))

(declare-fun valid!873 (LongMapFixedSize!1972) Bool)

(assert (=> start!16648 (= res!78942 (valid!873 thiss!1248))))

(assert (=> start!16648 e!109004))

(assert (=> start!16648 e!108999))

(assert (=> start!16648 true))

(declare-fun b!166181 () Bool)

(assert (=> b!166181 (= e!109008 (= (select (arr!3124 (_keys!5252 thiss!1248)) (index!4025 lt!83080)) key!828))))

(declare-fun b!166182 () Bool)

(assert (=> b!166182 (= e!109001 e!109000)))

(declare-fun res!78941 () Bool)

(assert (=> b!166182 (=> (not res!78941) (not e!109000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166182 (= res!78941 (validMask!0 (mask!8156 thiss!1248)))))

(declare-fun lt!83082 () Unit!5027)

(assert (=> b!166182 (= lt!83082 e!109003)))

(declare-fun c!30179 () Bool)

(declare-datatypes ((tuple2!3086 0))(
  ( (tuple2!3087 (_1!1554 (_ BitVec 64)) (_2!1554 V!4649)) )
))
(declare-datatypes ((List!2090 0))(
  ( (Nil!2087) (Cons!2086 (h!2703 tuple2!3086) (t!6883 List!2090)) )
))
(declare-datatypes ((ListLongMap!2029 0))(
  ( (ListLongMap!2030 (toList!1030 List!2090)) )
))
(declare-fun contains!1075 (ListLongMap!2029 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!672 (array!6579 array!6581 (_ BitVec 32) (_ BitVec 32) V!4649 V!4649 (_ BitVec 32) Int) ListLongMap!2029)

(assert (=> b!166182 (= c!30179 (contains!1075 (getCurrentListMap!672 (_keys!5252 thiss!1248) (_values!3411 thiss!1248) (mask!8156 thiss!1248) (extraKeys!3169 thiss!1248) (zeroValue!3271 thiss!1248) (minValue!3271 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3428 thiss!1248)) key!828))))

(assert (= (and start!16648 res!78942) b!166170))

(assert (= (and b!166170 res!78940) b!166180))

(assert (= (and b!166180 res!78944) b!166182))

(assert (= (and b!166182 c!30179) b!166174))

(assert (= (and b!166182 (not c!30179)) b!166172))

(assert (= (and b!166174 res!78945) b!166181))

(assert (= (and b!166182 res!78941) b!166177))

(assert (= (and b!166177 res!78943) b!166175))

(assert (= (and b!166175 res!78946) b!166176))

(assert (= (and b!166179 condMapEmpty!6345) mapIsEmpty!6345))

(assert (= (and b!166179 (not condMapEmpty!6345)) mapNonEmpty!6345))

(assert (= (and mapNonEmpty!6345 ((_ is ValueCellFull!1532) mapValue!6345)) b!166178))

(assert (= (and b!166179 ((_ is ValueCellFull!1532) mapDefault!6345)) b!166173))

(assert (= b!166171 b!166179))

(assert (= start!16648 b!166171))

(declare-fun m!195175 () Bool)

(assert (=> mapNonEmpty!6345 m!195175))

(declare-fun m!195177 () Bool)

(assert (=> b!166181 m!195177))

(declare-fun m!195179 () Bool)

(assert (=> start!16648 m!195179))

(declare-fun m!195181 () Bool)

(assert (=> b!166176 m!195181))

(declare-fun m!195183 () Bool)

(assert (=> b!166175 m!195183))

(declare-fun m!195185 () Bool)

(assert (=> b!166174 m!195185))

(declare-fun m!195187 () Bool)

(assert (=> b!166174 m!195187))

(declare-fun m!195189 () Bool)

(assert (=> b!166180 m!195189))

(declare-fun m!195191 () Bool)

(assert (=> b!166171 m!195191))

(declare-fun m!195193 () Bool)

(assert (=> b!166171 m!195193))

(declare-fun m!195195 () Bool)

(assert (=> b!166182 m!195195))

(declare-fun m!195197 () Bool)

(assert (=> b!166182 m!195197))

(assert (=> b!166182 m!195197))

(declare-fun m!195199 () Bool)

(assert (=> b!166182 m!195199))

(declare-fun m!195201 () Bool)

(assert (=> b!166172 m!195201))

(check-sat tp_is_empty!3751 (not b!166171) (not b!166176) b_and!10337 (not b!166182) (not b!166175) (not b_next!3949) (not b!166172) (not b!166180) (not start!16648) (not b!166174) (not mapNonEmpty!6345))
(check-sat b_and!10337 (not b_next!3949))
