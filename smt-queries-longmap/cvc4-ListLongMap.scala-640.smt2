; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16192 () Bool)

(assert start!16192)

(declare-fun b!161509 () Bool)

(declare-fun b_free!3653 () Bool)

(declare-fun b_next!3653 () Bool)

(assert (=> b!161509 (= b_free!3653 (not b_next!3653))))

(declare-fun tp!13528 () Bool)

(declare-fun b_and!10067 () Bool)

(assert (=> b!161509 (= tp!13528 b_and!10067)))

(declare-fun b!161504 () Bool)

(declare-fun e!105562 () Bool)

(assert (=> b!161504 (= e!105562 false)))

(declare-datatypes ((Unit!5023 0))(
  ( (Unit!5024) )
))
(declare-fun lt!82227 () Unit!5023)

(declare-fun e!105560 () Unit!5023)

(assert (=> b!161504 (= lt!82227 e!105560)))

(declare-fun c!29968 () Bool)

(declare-datatypes ((V!4253 0))(
  ( (V!4254 (val!1772 Int)) )
))
(declare-datatypes ((ValueCell!1384 0))(
  ( (ValueCellFull!1384 (v!3637 V!4253)) (EmptyCell!1384) )
))
(declare-datatypes ((array!5989 0))(
  ( (array!5990 (arr!2839 (Array (_ BitVec 32) (_ BitVec 64))) (size!3123 (_ BitVec 32))) )
))
(declare-datatypes ((array!5991 0))(
  ( (array!5992 (arr!2840 (Array (_ BitVec 32) ValueCell!1384)) (size!3124 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1676 0))(
  ( (LongMapFixedSize!1677 (defaultEntry!3280 Int) (mask!7872 (_ BitVec 32)) (extraKeys!3021 (_ BitVec 32)) (zeroValue!3123 V!4253) (minValue!3123 V!4253) (_size!887 (_ BitVec 32)) (_keys!5081 array!5989) (_values!3263 array!5991) (_vacant!887 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1676)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2964 0))(
  ( (tuple2!2965 (_1!1493 (_ BitVec 64)) (_2!1493 V!4253)) )
))
(declare-datatypes ((List!1978 0))(
  ( (Nil!1975) (Cons!1974 (h!2587 tuple2!2964) (t!6780 List!1978)) )
))
(declare-datatypes ((ListLongMap!1951 0))(
  ( (ListLongMap!1952 (toList!991 List!1978)) )
))
(declare-fun contains!1027 (ListLongMap!1951 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!655 (array!5989 array!5991 (_ BitVec 32) (_ BitVec 32) V!4253 V!4253 (_ BitVec 32) Int) ListLongMap!1951)

(assert (=> b!161504 (= c!29968 (contains!1027 (getCurrentListMap!655 (_keys!5081 thiss!1248) (_values!3263 thiss!1248) (mask!7872 thiss!1248) (extraKeys!3021 thiss!1248) (zeroValue!3123 thiss!1248) (minValue!3123 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3280 thiss!1248)) key!828))))

(declare-fun res!76548 () Bool)

(assert (=> start!16192 (=> (not res!76548) (not e!105562))))

(declare-fun valid!768 (LongMapFixedSize!1676) Bool)

(assert (=> start!16192 (= res!76548 (valid!768 thiss!1248))))

(assert (=> start!16192 e!105562))

(declare-fun e!105559 () Bool)

(assert (=> start!16192 e!105559))

(assert (=> start!16192 true))

(declare-fun b!161505 () Bool)

(declare-fun e!105563 () Bool)

(declare-fun tp_is_empty!3455 () Bool)

(assert (=> b!161505 (= e!105563 tp_is_empty!3455)))

(declare-fun b!161506 () Bool)

(declare-fun Unit!5025 () Unit!5023)

(assert (=> b!161506 (= e!105560 Unit!5025)))

(declare-fun lt!82228 () Unit!5023)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!79 (array!5989 array!5991 (_ BitVec 32) (_ BitVec 32) V!4253 V!4253 (_ BitVec 64) Int) Unit!5023)

(assert (=> b!161506 (= lt!82228 (lemmaInListMapThenSeekEntryOrOpenFindsIt!79 (_keys!5081 thiss!1248) (_values!3263 thiss!1248) (mask!7872 thiss!1248) (extraKeys!3021 thiss!1248) (zeroValue!3123 thiss!1248) (minValue!3123 thiss!1248) key!828 (defaultEntry!3280 thiss!1248)))))

(assert (=> b!161506 false))

(declare-fun b!161507 () Bool)

(declare-fun e!105558 () Bool)

(declare-fun e!105561 () Bool)

(declare-fun mapRes!5870 () Bool)

(assert (=> b!161507 (= e!105558 (and e!105561 mapRes!5870))))

(declare-fun condMapEmpty!5870 () Bool)

(declare-fun mapDefault!5870 () ValueCell!1384)

