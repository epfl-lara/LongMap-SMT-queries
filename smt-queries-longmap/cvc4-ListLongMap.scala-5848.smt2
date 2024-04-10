; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75566 () Bool)

(assert start!75566)

(declare-fun b!888857 () Bool)

(declare-fun b_free!15593 () Bool)

(declare-fun b_next!15593 () Bool)

(assert (=> b!888857 (= b_free!15593 (not b_next!15593))))

(declare-fun tp!54734 () Bool)

(declare-fun b_and!25833 () Bool)

(assert (=> b!888857 (= tp!54734 b_and!25833)))

(declare-fun b!888852 () Bool)

(declare-fun res!602511 () Bool)

(declare-fun e!495363 () Bool)

(assert (=> b!888852 (=> (not res!602511) (not e!495363))))

(declare-fun key!785 () (_ BitVec 64))

(declare-datatypes ((array!51814 0))(
  ( (array!51815 (arr!24917 (Array (_ BitVec 32) (_ BitVec 64))) (size!25359 (_ BitVec 32))) )
))
(declare-datatypes ((V!28859 0))(
  ( (V!28860 (val!9011 Int)) )
))
(declare-datatypes ((ValueCell!8479 0))(
  ( (ValueCellFull!8479 (v!11488 V!28859)) (EmptyCell!8479) )
))
(declare-datatypes ((array!51816 0))(
  ( (array!51817 (arr!24918 (Array (_ BitVec 32) ValueCell!8479)) (size!25360 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3974 0))(
  ( (LongMapFixedSize!3975 (defaultEntry!5184 Int) (mask!25616 (_ BitVec 32)) (extraKeys!4878 (_ BitVec 32)) (zeroValue!4982 V!28859) (minValue!4982 V!28859) (_size!2042 (_ BitVec 32)) (_keys!9865 array!51814) (_values!5169 array!51816) (_vacant!2042 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3974)

(assert (=> b!888852 (= res!602511 (and (= key!785 (bvneg key!785)) (or (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!4878 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (or (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!4878 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!888853 () Bool)

(declare-fun res!602512 () Bool)

(assert (=> b!888853 (=> (not res!602512) (not e!495363))))

(declare-fun contains!4333 (LongMapFixedSize!3974 (_ BitVec 64)) Bool)

(assert (=> b!888853 (= res!602512 (contains!4333 thiss!1181 key!785))))

(declare-fun mapNonEmpty!28422 () Bool)

(declare-fun mapRes!28422 () Bool)

(declare-fun tp!54733 () Bool)

(declare-fun e!495360 () Bool)

(assert (=> mapNonEmpty!28422 (= mapRes!28422 (and tp!54733 e!495360))))

(declare-fun mapValue!28422 () ValueCell!8479)

(declare-fun mapRest!28422 () (Array (_ BitVec 32) ValueCell!8479))

(declare-fun mapKey!28422 () (_ BitVec 32))

(assert (=> mapNonEmpty!28422 (= (arr!24918 (_values!5169 thiss!1181)) (store mapRest!28422 mapKey!28422 mapValue!28422))))

(declare-fun b!888854 () Bool)

(declare-fun tp_is_empty!17921 () Bool)

(assert (=> b!888854 (= e!495360 tp_is_empty!17921)))

(declare-fun b!888855 () Bool)

(declare-datatypes ((Option!450 0))(
  ( (Some!449 (v!11489 V!28859)) (None!448) )
))
(declare-fun isDefined!323 (Option!450) Bool)

(declare-datatypes ((tuple2!11940 0))(
  ( (tuple2!11941 (_1!5981 (_ BitVec 64)) (_2!5981 V!28859)) )
))
(declare-datatypes ((List!17694 0))(
  ( (Nil!17691) (Cons!17690 (h!18821 tuple2!11940) (t!24993 List!17694)) )
))
(declare-fun getValueByKey!444 (List!17694 (_ BitVec 64)) Option!450)

(declare-datatypes ((ListLongMap!10637 0))(
  ( (ListLongMap!10638 (toList!5334 List!17694)) )
))
(declare-fun map!12123 (LongMapFixedSize!3974) ListLongMap!10637)

(assert (=> b!888855 (= e!495363 (not (isDefined!323 (getValueByKey!444 (toList!5334 (map!12123 thiss!1181)) key!785))))))

(declare-fun b!888856 () Bool)

(declare-fun e!495364 () Bool)

(assert (=> b!888856 (= e!495364 tp_is_empty!17921)))

(declare-fun res!602513 () Bool)

(assert (=> start!75566 (=> (not res!602513) (not e!495363))))

(declare-fun valid!1550 (LongMapFixedSize!3974) Bool)

(assert (=> start!75566 (= res!602513 (valid!1550 thiss!1181))))

(assert (=> start!75566 e!495363))

(declare-fun e!495362 () Bool)

(assert (=> start!75566 e!495362))

(assert (=> start!75566 true))

(declare-fun e!495361 () Bool)

(declare-fun array_inv!19608 (array!51814) Bool)

(declare-fun array_inv!19609 (array!51816) Bool)

(assert (=> b!888857 (= e!495362 (and tp!54734 tp_is_empty!17921 (array_inv!19608 (_keys!9865 thiss!1181)) (array_inv!19609 (_values!5169 thiss!1181)) e!495361))))

(declare-fun mapIsEmpty!28422 () Bool)

(assert (=> mapIsEmpty!28422 mapRes!28422))

(declare-fun b!888858 () Bool)

(assert (=> b!888858 (= e!495361 (and e!495364 mapRes!28422))))

(declare-fun condMapEmpty!28422 () Bool)

(declare-fun mapDefault!28422 () ValueCell!8479)

