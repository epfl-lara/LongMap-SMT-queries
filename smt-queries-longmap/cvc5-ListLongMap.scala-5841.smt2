; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75432 () Bool)

(assert start!75432)

(declare-fun b!887976 () Bool)

(declare-fun b_free!15547 () Bool)

(declare-fun b_next!15547 () Bool)

(assert (=> b!887976 (= b_free!15547 (not b_next!15547))))

(declare-fun tp!54588 () Bool)

(declare-fun b_and!25783 () Bool)

(assert (=> b!887976 (= tp!54588 b_and!25783)))

(declare-fun mapNonEmpty!28345 () Bool)

(declare-fun mapRes!28345 () Bool)

(declare-fun tp!54587 () Bool)

(declare-fun e!494691 () Bool)

(assert (=> mapNonEmpty!28345 (= mapRes!28345 (and tp!54587 e!494691))))

(declare-datatypes ((V!28799 0))(
  ( (V!28800 (val!8988 Int)) )
))
(declare-datatypes ((ValueCell!8456 0))(
  ( (ValueCellFull!8456 (v!11460 V!28799)) (EmptyCell!8456) )
))
(declare-fun mapValue!28345 () ValueCell!8456)

(declare-datatypes ((array!51718 0))(
  ( (array!51719 (arr!24871 (Array (_ BitVec 32) (_ BitVec 64))) (size!25311 (_ BitVec 32))) )
))
(declare-datatypes ((array!51720 0))(
  ( (array!51721 (arr!24872 (Array (_ BitVec 32) ValueCell!8456)) (size!25312 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3928 0))(
  ( (LongMapFixedSize!3929 (defaultEntry!5155 Int) (mask!25565 (_ BitVec 32)) (extraKeys!4849 (_ BitVec 32)) (zeroValue!4953 V!28799) (minValue!4953 V!28799) (_size!2019 (_ BitVec 32)) (_keys!9832 array!51718) (_values!5140 array!51720) (_vacant!2019 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3928)

(declare-fun mapKey!28345 () (_ BitVec 32))

(declare-fun mapRest!28345 () (Array (_ BitVec 32) ValueCell!8456))

(assert (=> mapNonEmpty!28345 (= (arr!24872 (_values!5140 thiss!1181)) (store mapRest!28345 mapKey!28345 mapValue!28345))))

(declare-fun e!494689 () Bool)

(declare-fun e!494690 () Bool)

(declare-fun tp_is_empty!17875 () Bool)

(declare-fun array_inv!19576 (array!51718) Bool)

(declare-fun array_inv!19577 (array!51720) Bool)

(assert (=> b!887976 (= e!494689 (and tp!54588 tp_is_empty!17875 (array_inv!19576 (_keys!9832 thiss!1181)) (array_inv!19577 (_values!5140 thiss!1181)) e!494690))))

(declare-fun mapIsEmpty!28345 () Bool)

(assert (=> mapIsEmpty!28345 mapRes!28345))

(declare-fun b!887977 () Bool)

(assert (=> b!887977 (= e!494691 tp_is_empty!17875)))

(declare-fun res!602228 () Bool)

(declare-fun e!494688 () Bool)

(assert (=> start!75432 (=> (not res!602228) (not e!494688))))

(declare-fun valid!1532 (LongMapFixedSize!3928) Bool)

(assert (=> start!75432 (= res!602228 (valid!1532 thiss!1181))))

(assert (=> start!75432 e!494688))

(assert (=> start!75432 e!494689))

(assert (=> start!75432 true))

(declare-fun b!887978 () Bool)

(assert (=> b!887978 (= e!494688 false)))

(declare-fun lt!401531 () Bool)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4316 (LongMapFixedSize!3928 (_ BitVec 64)) Bool)

(assert (=> b!887978 (= lt!401531 (contains!4316 thiss!1181 key!785))))

(declare-fun b!887979 () Bool)

(declare-fun res!602227 () Bool)

(assert (=> b!887979 (=> (not res!602227) (not e!494688))))

(assert (=> b!887979 (= res!602227 (and (= key!785 (bvneg key!785)) (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4849 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!887980 () Bool)

(declare-fun e!494693 () Bool)

(assert (=> b!887980 (= e!494693 tp_is_empty!17875)))

(declare-fun b!887981 () Bool)

(assert (=> b!887981 (= e!494690 (and e!494693 mapRes!28345))))

(declare-fun condMapEmpty!28345 () Bool)

(declare-fun mapDefault!28345 () ValueCell!8456)

