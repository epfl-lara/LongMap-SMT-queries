; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16542 () Bool)

(assert start!16542)

(declare-fun b!164614 () Bool)

(declare-fun b_free!3847 () Bool)

(declare-fun b_next!3847 () Bool)

(assert (=> b!164614 (= b_free!3847 (not b_next!3847))))

(declare-fun tp!14142 () Bool)

(declare-fun b_and!10261 () Bool)

(assert (=> b!164614 (= tp!14142 b_and!10261)))

(declare-fun b!164612 () Bool)

(declare-fun e!107998 () Bool)

(declare-fun e!107996 () Bool)

(assert (=> b!164612 (= e!107998 e!107996)))

(declare-fun res!77965 () Bool)

(assert (=> b!164612 (=> (not res!77965) (not e!107996))))

(declare-datatypes ((SeekEntryResult!420 0))(
  ( (MissingZero!420 (index!3848 (_ BitVec 32))) (Found!420 (index!3849 (_ BitVec 32))) (Intermediate!420 (undefined!1232 Bool) (index!3850 (_ BitVec 32)) (x!18256 (_ BitVec 32))) (Undefined!420) (MissingVacant!420 (index!3851 (_ BitVec 32))) )
))
(declare-fun lt!82921 () SeekEntryResult!420)

(assert (=> b!164612 (= res!77965 (and (not (is-Undefined!420 lt!82921)) (not (is-MissingVacant!420 lt!82921)) (not (is-MissingZero!420 lt!82921)) (is-Found!420 lt!82921)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4513 0))(
  ( (V!4514 (val!1869 Int)) )
))
(declare-datatypes ((ValueCell!1481 0))(
  ( (ValueCellFull!1481 (v!3734 V!4513)) (EmptyCell!1481) )
))
(declare-datatypes ((array!6395 0))(
  ( (array!6396 (arr!3033 (Array (_ BitVec 32) (_ BitVec 64))) (size!3321 (_ BitVec 32))) )
))
(declare-datatypes ((array!6397 0))(
  ( (array!6398 (arr!3034 (Array (_ BitVec 32) ValueCell!1481)) (size!3322 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1870 0))(
  ( (LongMapFixedSize!1871 (defaultEntry!3377 Int) (mask!8072 (_ BitVec 32)) (extraKeys!3118 (_ BitVec 32)) (zeroValue!3220 V!4513) (minValue!3220 V!4513) (_size!984 (_ BitVec 32)) (_keys!5202 array!6395) (_values!3360 array!6397) (_vacant!984 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1870)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6395 (_ BitVec 32)) SeekEntryResult!420)

(assert (=> b!164612 (= lt!82921 (seekEntryOrOpen!0 key!828 (_keys!5202 thiss!1248) (mask!8072 thiss!1248)))))

(declare-fun b!164613 () Bool)

(declare-fun res!77969 () Bool)

(assert (=> b!164613 (=> (not res!77969) (not e!107996))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6395 (_ BitVec 32)) Bool)

(assert (=> b!164613 (= res!77969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5202 thiss!1248) (mask!8072 thiss!1248)))))

(declare-fun e!107999 () Bool)

(declare-fun tp_is_empty!3649 () Bool)

(declare-fun e!108000 () Bool)

(declare-fun array_inv!1945 (array!6395) Bool)

(declare-fun array_inv!1946 (array!6397) Bool)

(assert (=> b!164614 (= e!108000 (and tp!14142 tp_is_empty!3649 (array_inv!1945 (_keys!5202 thiss!1248)) (array_inv!1946 (_values!3360 thiss!1248)) e!107999))))

(declare-fun b!164615 () Bool)

(declare-fun res!77970 () Bool)

(assert (=> b!164615 (=> (not res!77970) (not e!107996))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164615 (= res!77970 (validMask!0 (mask!8072 thiss!1248)))))

(declare-fun mapIsEmpty!6192 () Bool)

(declare-fun mapRes!6192 () Bool)

(assert (=> mapIsEmpty!6192 mapRes!6192))

(declare-fun b!164616 () Bool)

(assert (=> b!164616 (= e!107996 false)))

(declare-fun lt!82920 () Bool)

(declare-datatypes ((List!2016 0))(
  ( (Nil!2013) (Cons!2012 (h!2629 (_ BitVec 64)) (t!6818 List!2016)) )
))
(declare-fun arrayNoDuplicates!0 (array!6395 (_ BitVec 32) List!2016) Bool)

(assert (=> b!164616 (= lt!82920 (arrayNoDuplicates!0 (_keys!5202 thiss!1248) #b00000000000000000000000000000000 Nil!2013))))

(declare-fun mapNonEmpty!6192 () Bool)

(declare-fun tp!14141 () Bool)

(declare-fun e!108002 () Bool)

(assert (=> mapNonEmpty!6192 (= mapRes!6192 (and tp!14141 e!108002))))

(declare-fun mapKey!6192 () (_ BitVec 32))

(declare-fun mapValue!6192 () ValueCell!1481)

(declare-fun mapRest!6192 () (Array (_ BitVec 32) ValueCell!1481))

(assert (=> mapNonEmpty!6192 (= (arr!3034 (_values!3360 thiss!1248)) (store mapRest!6192 mapKey!6192 mapValue!6192))))

(declare-fun b!164617 () Bool)

(assert (=> b!164617 (= e!108002 tp_is_empty!3649)))

(declare-fun b!164618 () Bool)

(declare-fun res!77967 () Bool)

(assert (=> b!164618 (=> (not res!77967) (not e!107996))))

(declare-datatypes ((tuple2!3034 0))(
  ( (tuple2!3035 (_1!1528 (_ BitVec 64)) (_2!1528 V!4513)) )
))
(declare-datatypes ((List!2017 0))(
  ( (Nil!2014) (Cons!2013 (h!2630 tuple2!3034) (t!6819 List!2017)) )
))
(declare-datatypes ((ListLongMap!1989 0))(
  ( (ListLongMap!1990 (toList!1010 List!2017)) )
))
(declare-fun contains!1052 (ListLongMap!1989 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!668 (array!6395 array!6397 (_ BitVec 32) (_ BitVec 32) V!4513 V!4513 (_ BitVec 32) Int) ListLongMap!1989)

(assert (=> b!164618 (= res!77967 (contains!1052 (getCurrentListMap!668 (_keys!5202 thiss!1248) (_values!3360 thiss!1248) (mask!8072 thiss!1248) (extraKeys!3118 thiss!1248) (zeroValue!3220 thiss!1248) (minValue!3220 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3377 thiss!1248)) key!828))))

(declare-fun res!77968 () Bool)

(assert (=> start!16542 (=> (not res!77968) (not e!107998))))

(declare-fun valid!833 (LongMapFixedSize!1870) Bool)

(assert (=> start!16542 (= res!77968 (valid!833 thiss!1248))))

(assert (=> start!16542 e!107998))

(assert (=> start!16542 e!108000))

(assert (=> start!16542 true))

(declare-fun b!164619 () Bool)

(declare-fun res!77966 () Bool)

(assert (=> b!164619 (=> (not res!77966) (not e!107996))))

(assert (=> b!164619 (= res!77966 (and (= (size!3322 (_values!3360 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8072 thiss!1248))) (= (size!3321 (_keys!5202 thiss!1248)) (size!3322 (_values!3360 thiss!1248))) (bvsge (mask!8072 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3118 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3118 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!164620 () Bool)

(declare-fun e!108001 () Bool)

(assert (=> b!164620 (= e!108001 tp_is_empty!3649)))

(declare-fun b!164621 () Bool)

(declare-fun res!77964 () Bool)

(assert (=> b!164621 (=> (not res!77964) (not e!107998))))

(assert (=> b!164621 (= res!77964 (not (= key!828 (bvneg key!828))))))

(declare-fun b!164622 () Bool)

(assert (=> b!164622 (= e!107999 (and e!108001 mapRes!6192))))

(declare-fun condMapEmpty!6192 () Bool)

(declare-fun mapDefault!6192 () ValueCell!1481)

