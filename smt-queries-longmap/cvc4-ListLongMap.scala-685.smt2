; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16618 () Bool)

(assert start!16618)

(declare-fun b!165869 () Bool)

(declare-fun b_free!3923 () Bool)

(declare-fun b_next!3923 () Bool)

(assert (=> b!165869 (= b_free!3923 (not b_next!3923))))

(declare-fun tp!14370 () Bool)

(declare-fun b_and!10337 () Bool)

(assert (=> b!165869 (= tp!14370 b_and!10337)))

(declare-fun mapIsEmpty!6306 () Bool)

(declare-fun mapRes!6306 () Bool)

(assert (=> mapIsEmpty!6306 mapRes!6306))

(declare-fun b!165866 () Bool)

(declare-fun e!108797 () Bool)

(declare-fun e!108795 () Bool)

(assert (=> b!165866 (= e!108797 e!108795)))

(declare-fun res!78767 () Bool)

(assert (=> b!165866 (=> (not res!78767) (not e!108795))))

(declare-datatypes ((SeekEntryResult!444 0))(
  ( (MissingZero!444 (index!3944 (_ BitVec 32))) (Found!444 (index!3945 (_ BitVec 32))) (Intermediate!444 (undefined!1256 Bool) (index!3946 (_ BitVec 32)) (x!18376 (_ BitVec 32))) (Undefined!444) (MissingVacant!444 (index!3947 (_ BitVec 32))) )
))
(declare-fun lt!83149 () SeekEntryResult!444)

(assert (=> b!165866 (= res!78767 (and (not (is-Undefined!444 lt!83149)) (not (is-MissingVacant!444 lt!83149)) (not (is-MissingZero!444 lt!83149)) (is-Found!444 lt!83149)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4613 0))(
  ( (V!4614 (val!1907 Int)) )
))
(declare-datatypes ((ValueCell!1519 0))(
  ( (ValueCellFull!1519 (v!3772 V!4613)) (EmptyCell!1519) )
))
(declare-datatypes ((array!6547 0))(
  ( (array!6548 (arr!3109 (Array (_ BitVec 32) (_ BitVec 64))) (size!3397 (_ BitVec 32))) )
))
(declare-datatypes ((array!6549 0))(
  ( (array!6550 (arr!3110 (Array (_ BitVec 32) ValueCell!1519)) (size!3398 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1946 0))(
  ( (LongMapFixedSize!1947 (defaultEntry!3415 Int) (mask!8134 (_ BitVec 32)) (extraKeys!3156 (_ BitVec 32)) (zeroValue!3258 V!4613) (minValue!3258 V!4613) (_size!1022 (_ BitVec 32)) (_keys!5240 array!6547) (_values!3398 array!6549) (_vacant!1022 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1946)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6547 (_ BitVec 32)) SeekEntryResult!444)

(assert (=> b!165866 (= lt!83149 (seekEntryOrOpen!0 key!828 (_keys!5240 thiss!1248) (mask!8134 thiss!1248)))))

(declare-fun b!165867 () Bool)

(declare-fun res!78765 () Bool)

(assert (=> b!165867 (=> (not res!78765) (not e!108795))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165867 (= res!78765 (validMask!0 (mask!8134 thiss!1248)))))

(declare-fun mapNonEmpty!6306 () Bool)

(declare-fun tp!14369 () Bool)

(declare-fun e!108800 () Bool)

(assert (=> mapNonEmpty!6306 (= mapRes!6306 (and tp!14369 e!108800))))

(declare-fun mapRest!6306 () (Array (_ BitVec 32) ValueCell!1519))

(declare-fun mapValue!6306 () ValueCell!1519)

(declare-fun mapKey!6306 () (_ BitVec 32))

(assert (=> mapNonEmpty!6306 (= (arr!3110 (_values!3398 thiss!1248)) (store mapRest!6306 mapKey!6306 mapValue!6306))))

(declare-fun b!165868 () Bool)

(declare-fun res!78763 () Bool)

(assert (=> b!165868 (=> (not res!78763) (not e!108795))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6547 (_ BitVec 32)) Bool)

(assert (=> b!165868 (= res!78763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5240 thiss!1248) (mask!8134 thiss!1248)))))

(declare-fun tp_is_empty!3725 () Bool)

(declare-fun e!108796 () Bool)

(declare-fun e!108794 () Bool)

(declare-fun array_inv!1995 (array!6547) Bool)

(declare-fun array_inv!1996 (array!6549) Bool)

(assert (=> b!165869 (= e!108794 (and tp!14370 tp_is_empty!3725 (array_inv!1995 (_keys!5240 thiss!1248)) (array_inv!1996 (_values!3398 thiss!1248)) e!108796))))

(declare-fun b!165870 () Bool)

(assert (=> b!165870 (= e!108800 tp_is_empty!3725)))

(declare-fun b!165871 () Bool)

(declare-fun res!78762 () Bool)

(assert (=> b!165871 (=> (not res!78762) (not e!108797))))

(assert (=> b!165871 (= res!78762 (not (= key!828 (bvneg key!828))))))

(declare-fun res!78768 () Bool)

(assert (=> start!16618 (=> (not res!78768) (not e!108797))))

(declare-fun valid!859 (LongMapFixedSize!1946) Bool)

(assert (=> start!16618 (= res!78768 (valid!859 thiss!1248))))

(assert (=> start!16618 e!108797))

(assert (=> start!16618 e!108794))

(assert (=> start!16618 true))

(declare-fun b!165872 () Bool)

(declare-fun res!78766 () Bool)

(assert (=> b!165872 (=> (not res!78766) (not e!108795))))

(declare-datatypes ((tuple2!3086 0))(
  ( (tuple2!3087 (_1!1554 (_ BitVec 64)) (_2!1554 V!4613)) )
))
(declare-datatypes ((List!2072 0))(
  ( (Nil!2069) (Cons!2068 (h!2685 tuple2!3086) (t!6874 List!2072)) )
))
(declare-datatypes ((ListLongMap!2041 0))(
  ( (ListLongMap!2042 (toList!1036 List!2072)) )
))
(declare-fun contains!1078 (ListLongMap!2041 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!694 (array!6547 array!6549 (_ BitVec 32) (_ BitVec 32) V!4613 V!4613 (_ BitVec 32) Int) ListLongMap!2041)

(assert (=> b!165872 (= res!78766 (not (contains!1078 (getCurrentListMap!694 (_keys!5240 thiss!1248) (_values!3398 thiss!1248) (mask!8134 thiss!1248) (extraKeys!3156 thiss!1248) (zeroValue!3258 thiss!1248) (minValue!3258 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3415 thiss!1248)) key!828)))))

(declare-fun b!165873 () Bool)

(declare-fun e!108798 () Bool)

(assert (=> b!165873 (= e!108796 (and e!108798 mapRes!6306))))

(declare-fun condMapEmpty!6306 () Bool)

(declare-fun mapDefault!6306 () ValueCell!1519)

