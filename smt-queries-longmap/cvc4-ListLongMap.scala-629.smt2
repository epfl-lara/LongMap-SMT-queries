; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16126 () Bool)

(assert start!16126)

(declare-fun b!160491 () Bool)

(declare-fun b_free!3587 () Bool)

(declare-fun b_next!3587 () Bool)

(assert (=> b!160491 (= b_free!3587 (not b_next!3587))))

(declare-fun tp!13331 () Bool)

(declare-fun b_and!10001 () Bool)

(assert (=> b!160491 (= tp!13331 b_and!10001)))

(declare-fun b!160485 () Bool)

(declare-fun res!75999 () Bool)

(declare-fun e!104930 () Bool)

(assert (=> b!160485 (=> (not res!75999) (not e!104930))))

(declare-datatypes ((V!4165 0))(
  ( (V!4166 (val!1739 Int)) )
))
(declare-datatypes ((ValueCell!1351 0))(
  ( (ValueCellFull!1351 (v!3604 V!4165)) (EmptyCell!1351) )
))
(declare-datatypes ((array!5857 0))(
  ( (array!5858 (arr!2773 (Array (_ BitVec 32) (_ BitVec 64))) (size!3057 (_ BitVec 32))) )
))
(declare-datatypes ((array!5859 0))(
  ( (array!5860 (arr!2774 (Array (_ BitVec 32) ValueCell!1351)) (size!3058 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1610 0))(
  ( (LongMapFixedSize!1611 (defaultEntry!3247 Int) (mask!7817 (_ BitVec 32)) (extraKeys!2988 (_ BitVec 32)) (zeroValue!3090 V!4165) (minValue!3090 V!4165) (_size!854 (_ BitVec 32)) (_keys!5048 array!5857) (_values!3230 array!5859) (_vacant!854 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1610)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2922 0))(
  ( (tuple2!2923 (_1!1472 (_ BitVec 64)) (_2!1472 V!4165)) )
))
(declare-datatypes ((List!1944 0))(
  ( (Nil!1941) (Cons!1940 (h!2553 tuple2!2922) (t!6746 List!1944)) )
))
(declare-datatypes ((ListLongMap!1909 0))(
  ( (ListLongMap!1910 (toList!970 List!1944)) )
))
(declare-fun contains!1006 (ListLongMap!1909 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!634 (array!5857 array!5859 (_ BitVec 32) (_ BitVec 32) V!4165 V!4165 (_ BitVec 32) Int) ListLongMap!1909)

(assert (=> b!160485 (= res!75999 (not (contains!1006 (getCurrentListMap!634 (_keys!5048 thiss!1248) (_values!3230 thiss!1248) (mask!7817 thiss!1248) (extraKeys!2988 thiss!1248) (zeroValue!3090 thiss!1248) (minValue!3090 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3247 thiss!1248)) key!828)))))

(declare-fun b!160486 () Bool)

(declare-fun res!75997 () Bool)

(assert (=> b!160486 (=> (not res!75997) (not e!104930))))

(declare-datatypes ((SeekEntryResult!333 0))(
  ( (MissingZero!333 (index!3500 (_ BitVec 32))) (Found!333 (index!3501 (_ BitVec 32))) (Intermediate!333 (undefined!1145 Bool) (index!3502 (_ BitVec 32)) (x!17709 (_ BitVec 32))) (Undefined!333) (MissingVacant!333 (index!3503 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5857 (_ BitVec 32)) SeekEntryResult!333)

(assert (=> b!160486 (= res!75997 (is-Undefined!333 (seekEntryOrOpen!0 key!828 (_keys!5048 thiss!1248) (mask!7817 thiss!1248))))))

(declare-fun b!160487 () Bool)

(declare-fun res!76001 () Bool)

(assert (=> b!160487 (=> (not res!76001) (not e!104930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160487 (= res!76001 (validMask!0 (mask!7817 thiss!1248)))))

(declare-fun mapNonEmpty!5771 () Bool)

(declare-fun mapRes!5771 () Bool)

(declare-fun tp!13330 () Bool)

(declare-fun e!104932 () Bool)

(assert (=> mapNonEmpty!5771 (= mapRes!5771 (and tp!13330 e!104932))))

(declare-fun mapKey!5771 () (_ BitVec 32))

(declare-fun mapValue!5771 () ValueCell!1351)

(declare-fun mapRest!5771 () (Array (_ BitVec 32) ValueCell!1351))

(assert (=> mapNonEmpty!5771 (= (arr!2774 (_values!3230 thiss!1248)) (store mapRest!5771 mapKey!5771 mapValue!5771))))

(declare-fun mapIsEmpty!5771 () Bool)

(assert (=> mapIsEmpty!5771 mapRes!5771))

(declare-fun b!160488 () Bool)

(declare-fun res!75996 () Bool)

(assert (=> b!160488 (=> (not res!75996) (not e!104930))))

(assert (=> b!160488 (= res!75996 (and (= (size!3058 (_values!3230 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7817 thiss!1248))) (= (size!3057 (_keys!5048 thiss!1248)) (size!3058 (_values!3230 thiss!1248))) (bvsge (mask!7817 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2988 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2988 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!160489 () Bool)

(declare-fun tp_is_empty!3389 () Bool)

(assert (=> b!160489 (= e!104932 tp_is_empty!3389)))

(declare-fun b!160490 () Bool)

(declare-fun res!76000 () Bool)

(assert (=> b!160490 (=> (not res!76000) (not e!104930))))

(assert (=> b!160490 (= res!76000 (not (= key!828 (bvneg key!828))))))

(declare-fun e!104931 () Bool)

(declare-fun e!104934 () Bool)

(declare-fun array_inv!1769 (array!5857) Bool)

(declare-fun array_inv!1770 (array!5859) Bool)

(assert (=> b!160491 (= e!104934 (and tp!13331 tp_is_empty!3389 (array_inv!1769 (_keys!5048 thiss!1248)) (array_inv!1770 (_values!3230 thiss!1248)) e!104931))))

(declare-fun res!75998 () Bool)

(assert (=> start!16126 (=> (not res!75998) (not e!104930))))

(declare-fun valid!746 (LongMapFixedSize!1610) Bool)

(assert (=> start!16126 (= res!75998 (valid!746 thiss!1248))))

(assert (=> start!16126 e!104930))

(assert (=> start!16126 e!104934))

(assert (=> start!16126 true))

(declare-fun b!160492 () Bool)

(assert (=> b!160492 (= e!104930 false)))

(declare-fun lt!82093 () Bool)

(declare-datatypes ((List!1945 0))(
  ( (Nil!1942) (Cons!1941 (h!2554 (_ BitVec 64)) (t!6747 List!1945)) )
))
(declare-fun arrayNoDuplicates!0 (array!5857 (_ BitVec 32) List!1945) Bool)

(assert (=> b!160492 (= lt!82093 (arrayNoDuplicates!0 (_keys!5048 thiss!1248) #b00000000000000000000000000000000 Nil!1942))))

(declare-fun b!160493 () Bool)

(declare-fun e!104933 () Bool)

(assert (=> b!160493 (= e!104933 tp_is_empty!3389)))

(declare-fun b!160494 () Bool)

(declare-fun res!75995 () Bool)

(assert (=> b!160494 (=> (not res!75995) (not e!104930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5857 (_ BitVec 32)) Bool)

(assert (=> b!160494 (= res!75995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5048 thiss!1248) (mask!7817 thiss!1248)))))

(declare-fun b!160495 () Bool)

(assert (=> b!160495 (= e!104931 (and e!104933 mapRes!5771))))

(declare-fun condMapEmpty!5771 () Bool)

(declare-fun mapDefault!5771 () ValueCell!1351)

