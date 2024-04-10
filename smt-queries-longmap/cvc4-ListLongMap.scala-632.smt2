; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16144 () Bool)

(assert start!16144)

(declare-fun b!160784 () Bool)

(declare-fun b_free!3605 () Bool)

(declare-fun b_next!3605 () Bool)

(assert (=> b!160784 (= b_free!3605 (not b_next!3605))))

(declare-fun tp!13385 () Bool)

(declare-fun b_and!10019 () Bool)

(assert (=> b!160784 (= tp!13385 b_and!10019)))

(declare-fun b!160782 () Bool)

(declare-fun e!105095 () Bool)

(declare-fun tp_is_empty!3407 () Bool)

(assert (=> b!160782 (= e!105095 tp_is_empty!3407)))

(declare-fun b!160783 () Bool)

(declare-fun res!76184 () Bool)

(declare-fun e!105091 () Bool)

(assert (=> b!160783 (=> (not res!76184) (not e!105091))))

(declare-datatypes ((V!4189 0))(
  ( (V!4190 (val!1748 Int)) )
))
(declare-datatypes ((ValueCell!1360 0))(
  ( (ValueCellFull!1360 (v!3613 V!4189)) (EmptyCell!1360) )
))
(declare-datatypes ((array!5893 0))(
  ( (array!5894 (arr!2791 (Array (_ BitVec 32) (_ BitVec 64))) (size!3075 (_ BitVec 32))) )
))
(declare-datatypes ((array!5895 0))(
  ( (array!5896 (arr!2792 (Array (_ BitVec 32) ValueCell!1360)) (size!3076 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1628 0))(
  ( (LongMapFixedSize!1629 (defaultEntry!3256 Int) (mask!7832 (_ BitVec 32)) (extraKeys!2997 (_ BitVec 32)) (zeroValue!3099 V!4189) (minValue!3099 V!4189) (_size!863 (_ BitVec 32)) (_keys!5057 array!5893) (_values!3239 array!5895) (_vacant!863 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1628)

(assert (=> b!160783 (= res!76184 (and (= (size!3076 (_values!3239 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7832 thiss!1248))) (= (size!3075 (_keys!5057 thiss!1248)) (size!3076 (_values!3239 thiss!1248))) (bvsge (mask!7832 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2997 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2997 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!5798 () Bool)

(declare-fun mapRes!5798 () Bool)

(declare-fun tp!13384 () Bool)

(assert (=> mapNonEmpty!5798 (= mapRes!5798 (and tp!13384 e!105095))))

(declare-fun mapKey!5798 () (_ BitVec 32))

(declare-fun mapValue!5798 () ValueCell!1360)

(declare-fun mapRest!5798 () (Array (_ BitVec 32) ValueCell!1360))

(assert (=> mapNonEmpty!5798 (= (arr!2792 (_values!3239 thiss!1248)) (store mapRest!5798 mapKey!5798 mapValue!5798))))

(declare-fun e!105096 () Bool)

(declare-fun e!105094 () Bool)

(declare-fun array_inv!1783 (array!5893) Bool)

(declare-fun array_inv!1784 (array!5895) Bool)

(assert (=> b!160784 (= e!105094 (and tp!13385 tp_is_empty!3407 (array_inv!1783 (_keys!5057 thiss!1248)) (array_inv!1784 (_values!3239 thiss!1248)) e!105096))))

(declare-fun b!160785 () Bool)

(declare-fun res!76188 () Bool)

(assert (=> b!160785 (=> (not res!76188) (not e!105091))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5893 (_ BitVec 32)) Bool)

(assert (=> b!160785 (= res!76188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5057 thiss!1248) (mask!7832 thiss!1248)))))

(declare-fun mapIsEmpty!5798 () Bool)

(assert (=> mapIsEmpty!5798 mapRes!5798))

(declare-fun b!160786 () Bool)

(assert (=> b!160786 (= e!105091 false)))

(declare-fun lt!82120 () Bool)

(declare-datatypes ((List!1956 0))(
  ( (Nil!1953) (Cons!1952 (h!2565 (_ BitVec 64)) (t!6758 List!1956)) )
))
(declare-fun arrayNoDuplicates!0 (array!5893 (_ BitVec 32) List!1956) Bool)

(assert (=> b!160786 (= lt!82120 (arrayNoDuplicates!0 (_keys!5057 thiss!1248) #b00000000000000000000000000000000 Nil!1953))))

(declare-fun b!160787 () Bool)

(declare-fun res!76189 () Bool)

(assert (=> b!160787 (=> (not res!76189) (not e!105091))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!340 0))(
  ( (MissingZero!340 (index!3528 (_ BitVec 32))) (Found!340 (index!3529 (_ BitVec 32))) (Intermediate!340 (undefined!1152 Bool) (index!3530 (_ BitVec 32)) (x!17740 (_ BitVec 32))) (Undefined!340) (MissingVacant!340 (index!3531 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5893 (_ BitVec 32)) SeekEntryResult!340)

(assert (=> b!160787 (= res!76189 (is-Undefined!340 (seekEntryOrOpen!0 key!828 (_keys!5057 thiss!1248) (mask!7832 thiss!1248))))))

(declare-fun b!160789 () Bool)

(declare-fun res!76187 () Bool)

(assert (=> b!160789 (=> (not res!76187) (not e!105091))))

(declare-datatypes ((tuple2!2934 0))(
  ( (tuple2!2935 (_1!1478 (_ BitVec 64)) (_2!1478 V!4189)) )
))
(declare-datatypes ((List!1957 0))(
  ( (Nil!1954) (Cons!1953 (h!2566 tuple2!2934) (t!6759 List!1957)) )
))
(declare-datatypes ((ListLongMap!1921 0))(
  ( (ListLongMap!1922 (toList!976 List!1957)) )
))
(declare-fun contains!1012 (ListLongMap!1921 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!640 (array!5893 array!5895 (_ BitVec 32) (_ BitVec 32) V!4189 V!4189 (_ BitVec 32) Int) ListLongMap!1921)

(assert (=> b!160789 (= res!76187 (not (contains!1012 (getCurrentListMap!640 (_keys!5057 thiss!1248) (_values!3239 thiss!1248) (mask!7832 thiss!1248) (extraKeys!2997 thiss!1248) (zeroValue!3099 thiss!1248) (minValue!3099 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3256 thiss!1248)) key!828)))))

(declare-fun b!160790 () Bool)

(declare-fun e!105092 () Bool)

(assert (=> b!160790 (= e!105096 (and e!105092 mapRes!5798))))

(declare-fun condMapEmpty!5798 () Bool)

(declare-fun mapDefault!5798 () ValueCell!1360)

