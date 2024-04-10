; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15656 () Bool)

(assert start!15656)

(declare-fun b!156001 () Bool)

(declare-fun b_free!3323 () Bool)

(declare-fun b_next!3323 () Bool)

(assert (=> b!156001 (= b_free!3323 (not b_next!3323))))

(declare-fun tp!12493 () Bool)

(declare-fun b_and!9737 () Bool)

(assert (=> b!156001 (= tp!12493 b_and!9737)))

(declare-fun mapIsEmpty!5330 () Bool)

(declare-fun mapRes!5330 () Bool)

(assert (=> mapIsEmpty!5330 mapRes!5330))

(declare-fun b!155997 () Bool)

(declare-fun e!101998 () Bool)

(declare-fun tp_is_empty!3125 () Bool)

(assert (=> b!155997 (= e!101998 tp_is_empty!3125)))

(declare-fun mapNonEmpty!5330 () Bool)

(declare-fun tp!12494 () Bool)

(assert (=> mapNonEmpty!5330 (= mapRes!5330 (and tp!12494 e!101998))))

(declare-fun mapKey!5330 () (_ BitVec 32))

(declare-datatypes ((V!3813 0))(
  ( (V!3814 (val!1607 Int)) )
))
(declare-datatypes ((ValueCell!1219 0))(
  ( (ValueCellFull!1219 (v!3472 V!3813)) (EmptyCell!1219) )
))
(declare-fun mapRest!5330 () (Array (_ BitVec 32) ValueCell!1219))

(declare-fun mapValue!5330 () ValueCell!1219)

(declare-datatypes ((array!5303 0))(
  ( (array!5304 (arr!2509 (Array (_ BitVec 32) (_ BitVec 64))) (size!2787 (_ BitVec 32))) )
))
(declare-datatypes ((array!5305 0))(
  ( (array!5306 (arr!2510 (Array (_ BitVec 32) ValueCell!1219)) (size!2788 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1346 0))(
  ( (LongMapFixedSize!1347 (defaultEntry!3115 Int) (mask!7554 (_ BitVec 32)) (extraKeys!2856 (_ BitVec 32)) (zeroValue!2958 V!3813) (minValue!2958 V!3813) (_size!722 (_ BitVec 32)) (_keys!4890 array!5303) (_values!3098 array!5305) (_vacant!722 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1346)

(assert (=> mapNonEmpty!5330 (= (arr!2510 (_values!3098 thiss!1248)) (store mapRest!5330 mapKey!5330 mapValue!5330))))

(declare-fun b!155998 () Bool)

(declare-fun e!102001 () Bool)

(assert (=> b!155998 (= e!102001 tp_is_empty!3125)))

(declare-fun b!155999 () Bool)

(declare-fun res!73684 () Bool)

(declare-fun e!102000 () Bool)

(assert (=> b!155999 (=> (not res!73684) (not e!102000))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155999 (= res!73684 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!156000 () Bool)

(assert (=> b!156000 (= e!102000 (not true))))

(declare-fun lt!81490 () Bool)

(declare-fun v!309 () V!3813)

(declare-fun valid!655 (LongMapFixedSize!1346) Bool)

(assert (=> b!156000 (= lt!81490 (valid!655 (LongMapFixedSize!1347 (defaultEntry!3115 thiss!1248) (mask!7554 thiss!1248) (bvor (extraKeys!2856 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2958 thiss!1248) (_size!722 thiss!1248) (_keys!4890 thiss!1248) (_values!3098 thiss!1248) (_vacant!722 thiss!1248))))))

(declare-datatypes ((tuple2!2848 0))(
  ( (tuple2!2849 (_1!1435 (_ BitVec 64)) (_2!1435 V!3813)) )
))
(declare-datatypes ((List!1842 0))(
  ( (Nil!1839) (Cons!1838 (h!2447 tuple2!2848) (t!6644 List!1842)) )
))
(declare-datatypes ((ListLongMap!1835 0))(
  ( (ListLongMap!1836 (toList!933 List!1842)) )
))
(declare-fun +!201 (ListLongMap!1835 tuple2!2848) ListLongMap!1835)

(declare-fun getCurrentListMap!597 (array!5303 array!5305 (_ BitVec 32) (_ BitVec 32) V!3813 V!3813 (_ BitVec 32) Int) ListLongMap!1835)

(assert (=> b!156000 (= (+!201 (getCurrentListMap!597 (_keys!4890 thiss!1248) (_values!3098 thiss!1248) (mask!7554 thiss!1248) (extraKeys!2856 thiss!1248) (zeroValue!2958 thiss!1248) (minValue!2958 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3115 thiss!1248)) (tuple2!2849 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!597 (_keys!4890 thiss!1248) (_values!3098 thiss!1248) (mask!7554 thiss!1248) (bvor (extraKeys!2856 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2958 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3115 thiss!1248)))))

(declare-datatypes ((Unit!4946 0))(
  ( (Unit!4947) )
))
(declare-fun lt!81489 () Unit!4946)

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!80 (array!5303 array!5305 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3813 V!3813 V!3813 Int) Unit!4946)

(assert (=> b!156000 (= lt!81489 (lemmaChangeZeroKeyThenAddPairToListMap!80 (_keys!4890 thiss!1248) (_values!3098 thiss!1248) (mask!7554 thiss!1248) (extraKeys!2856 thiss!1248) (bvor (extraKeys!2856 thiss!1248) #b00000000000000000000000000000001) (zeroValue!2958 thiss!1248) v!309 (minValue!2958 thiss!1248) (defaultEntry!3115 thiss!1248)))))

(declare-fun e!102003 () Bool)

(declare-fun e!101999 () Bool)

(declare-fun array_inv!1583 (array!5303) Bool)

(declare-fun array_inv!1584 (array!5305) Bool)

(assert (=> b!156001 (= e!101999 (and tp!12493 tp_is_empty!3125 (array_inv!1583 (_keys!4890 thiss!1248)) (array_inv!1584 (_values!3098 thiss!1248)) e!102003))))

(declare-fun b!156002 () Bool)

(assert (=> b!156002 (= e!102003 (and e!102001 mapRes!5330))))

(declare-fun condMapEmpty!5330 () Bool)

(declare-fun mapDefault!5330 () ValueCell!1219)

