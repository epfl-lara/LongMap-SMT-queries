; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17288 () Bool)

(assert start!17288)

(declare-fun b!173319 () Bool)

(declare-fun b_free!4313 () Bool)

(declare-fun b_next!4313 () Bool)

(assert (=> b!173319 (= b_free!4313 (not b_next!4313))))

(declare-fun tp!15602 () Bool)

(declare-fun b_and!10753 () Bool)

(assert (=> b!173319 (= tp!15602 b_and!10753)))

(declare-fun b!173313 () Bool)

(declare-fun res!82297 () Bool)

(declare-fun e!114505 () Bool)

(assert (=> b!173313 (=> (not res!82297) (not e!114505))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!173313 (= res!82297 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!6954 () Bool)

(declare-fun mapRes!6954 () Bool)

(assert (=> mapIsEmpty!6954 mapRes!6954))

(declare-fun b!173314 () Bool)

(declare-fun e!114499 () Bool)

(assert (=> b!173314 (= e!114505 (not e!114499))))

(declare-fun res!82296 () Bool)

(assert (=> b!173314 (=> (not res!82296) (not e!114499))))

(declare-datatypes ((V!5093 0))(
  ( (V!5094 (val!2087 Int)) )
))
(declare-datatypes ((ValueCell!1699 0))(
  ( (ValueCellFull!1699 (v!3955 V!5093)) (EmptyCell!1699) )
))
(declare-datatypes ((array!7301 0))(
  ( (array!7302 (arr!3469 (Array (_ BitVec 32) (_ BitVec 64))) (size!3768 (_ BitVec 32))) )
))
(declare-datatypes ((array!7303 0))(
  ( (array!7304 (arr!3470 (Array (_ BitVec 32) ValueCell!1699)) (size!3769 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2306 0))(
  ( (LongMapFixedSize!2307 (defaultEntry!3599 Int) (mask!8471 (_ BitVec 32)) (extraKeys!3338 (_ BitVec 32)) (zeroValue!3440 V!5093) (minValue!3442 V!5093) (_size!1202 (_ BitVec 32)) (_keys!5440 array!7301) (_values!3582 array!7303) (_vacant!1202 (_ BitVec 32))) )
))
(declare-fun lt!85738 () LongMapFixedSize!2306)

(declare-fun valid!974 (LongMapFixedSize!2306) Bool)

(assert (=> b!173314 (= res!82296 (valid!974 lt!85738))))

(declare-fun thiss!1248 () LongMapFixedSize!2306)

(declare-fun v!309 () V!5093)

(assert (=> b!173314 (= lt!85738 (LongMapFixedSize!2307 (defaultEntry!3599 thiss!1248) (mask!8471 thiss!1248) (bvor (extraKeys!3338 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3440 thiss!1248) v!309 (_size!1202 thiss!1248) (_keys!5440 thiss!1248) (_values!3582 thiss!1248) (_vacant!1202 thiss!1248)))))

(declare-datatypes ((tuple2!3242 0))(
  ( (tuple2!3243 (_1!1632 (_ BitVec 64)) (_2!1632 V!5093)) )
))
(declare-datatypes ((List!2207 0))(
  ( (Nil!2204) (Cons!2203 (h!2820 tuple2!3242) (t!7014 List!2207)) )
))
(declare-datatypes ((ListLongMap!2169 0))(
  ( (ListLongMap!2170 (toList!1100 List!2207)) )
))
(declare-fun +!247 (ListLongMap!2169 tuple2!3242) ListLongMap!2169)

(declare-fun getCurrentListMap!752 (array!7301 array!7303 (_ BitVec 32) (_ BitVec 32) V!5093 V!5093 (_ BitVec 32) Int) ListLongMap!2169)

(assert (=> b!173314 (= (+!247 (getCurrentListMap!752 (_keys!5440 thiss!1248) (_values!3582 thiss!1248) (mask!8471 thiss!1248) (extraKeys!3338 thiss!1248) (zeroValue!3440 thiss!1248) (minValue!3442 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3599 thiss!1248)) (tuple2!3243 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!752 (_keys!5440 thiss!1248) (_values!3582 thiss!1248) (mask!8471 thiss!1248) (bvor (extraKeys!3338 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3440 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3599 thiss!1248)))))

(declare-datatypes ((Unit!5316 0))(
  ( (Unit!5317) )
))
(declare-fun lt!85737 () Unit!5316)

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!86 (array!7301 array!7303 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!5093 V!5093 V!5093 Int) Unit!5316)

(assert (=> b!173314 (= lt!85737 (lemmaChangeLongMinValueKeyThenAddPairToListMap!86 (_keys!5440 thiss!1248) (_values!3582 thiss!1248) (mask!8471 thiss!1248) (extraKeys!3338 thiss!1248) (bvor (extraKeys!3338 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3440 thiss!1248) (minValue!3442 thiss!1248) v!309 (defaultEntry!3599 thiss!1248)))))

(declare-fun b!173315 () Bool)

(declare-fun e!114500 () Bool)

(declare-fun e!114502 () Bool)

(assert (=> b!173315 (= e!114500 (and e!114502 mapRes!6954))))

(declare-fun condMapEmpty!6954 () Bool)

(declare-fun mapDefault!6954 () ValueCell!1699)

