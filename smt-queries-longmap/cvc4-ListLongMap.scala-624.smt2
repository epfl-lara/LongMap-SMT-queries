; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16096 () Bool)

(assert start!16096)

(declare-fun b!159993 () Bool)

(declare-fun b_free!3557 () Bool)

(declare-fun b_next!3557 () Bool)

(assert (=> b!159993 (= b_free!3557 (not b_next!3557))))

(declare-fun tp!13240 () Bool)

(declare-fun b_and!9971 () Bool)

(assert (=> b!159993 (= tp!13240 b_and!9971)))

(declare-fun mapNonEmpty!5726 () Bool)

(declare-fun mapRes!5726 () Bool)

(declare-fun tp!13241 () Bool)

(declare-fun e!104663 () Bool)

(assert (=> mapNonEmpty!5726 (= mapRes!5726 (and tp!13241 e!104663))))

(declare-fun mapKey!5726 () (_ BitVec 32))

(declare-datatypes ((V!4125 0))(
  ( (V!4126 (val!1724 Int)) )
))
(declare-datatypes ((ValueCell!1336 0))(
  ( (ValueCellFull!1336 (v!3589 V!4125)) (EmptyCell!1336) )
))
(declare-fun mapValue!5726 () ValueCell!1336)

(declare-datatypes ((array!5797 0))(
  ( (array!5798 (arr!2743 (Array (_ BitVec 32) (_ BitVec 64))) (size!3027 (_ BitVec 32))) )
))
(declare-datatypes ((array!5799 0))(
  ( (array!5800 (arr!2744 (Array (_ BitVec 32) ValueCell!1336)) (size!3028 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1580 0))(
  ( (LongMapFixedSize!1581 (defaultEntry!3232 Int) (mask!7792 (_ BitVec 32)) (extraKeys!2973 (_ BitVec 32)) (zeroValue!3075 V!4125) (minValue!3075 V!4125) (_size!839 (_ BitVec 32)) (_keys!5033 array!5797) (_values!3215 array!5799) (_vacant!839 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1580)

(declare-fun mapRest!5726 () (Array (_ BitVec 32) ValueCell!1336))

(assert (=> mapNonEmpty!5726 (= (arr!2744 (_values!3215 thiss!1248)) (store mapRest!5726 mapKey!5726 mapValue!5726))))

(declare-fun b!159990 () Bool)

(declare-fun res!75683 () Bool)

(declare-fun e!104660 () Bool)

(assert (=> b!159990 (=> (not res!75683) (not e!104660))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!159990 (= res!75683 (not (= key!828 (bvneg key!828))))))

(declare-fun b!159992 () Bool)

(declare-fun tp_is_empty!3359 () Bool)

(assert (=> b!159992 (= e!104663 tp_is_empty!3359)))

(declare-fun e!104664 () Bool)

(declare-fun e!104661 () Bool)

(declare-fun array_inv!1747 (array!5797) Bool)

(declare-fun array_inv!1748 (array!5799) Bool)

(assert (=> b!159993 (= e!104664 (and tp!13240 tp_is_empty!3359 (array_inv!1747 (_keys!5033 thiss!1248)) (array_inv!1748 (_values!3215 thiss!1248)) e!104661))))

(declare-fun b!159994 () Bool)

(declare-fun res!75682 () Bool)

(assert (=> b!159994 (=> (not res!75682) (not e!104660))))

(declare-datatypes ((SeekEntryResult!322 0))(
  ( (MissingZero!322 (index!3456 (_ BitVec 32))) (Found!322 (index!3457 (_ BitVec 32))) (Intermediate!322 (undefined!1134 Bool) (index!3458 (_ BitVec 32)) (x!17658 (_ BitVec 32))) (Undefined!322) (MissingVacant!322 (index!3459 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5797 (_ BitVec 32)) SeekEntryResult!322)

(assert (=> b!159994 (= res!75682 (is-Undefined!322 (seekEntryOrOpen!0 key!828 (_keys!5033 thiss!1248) (mask!7792 thiss!1248))))))

(declare-fun b!159995 () Bool)

(declare-fun e!104659 () Bool)

(assert (=> b!159995 (= e!104659 tp_is_empty!3359)))

(declare-fun b!159996 () Bool)

(declare-fun res!75685 () Bool)

(assert (=> b!159996 (=> (not res!75685) (not e!104660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5797 (_ BitVec 32)) Bool)

(assert (=> b!159996 (= res!75685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5033 thiss!1248) (mask!7792 thiss!1248)))))

(declare-fun mapIsEmpty!5726 () Bool)

(assert (=> mapIsEmpty!5726 mapRes!5726))

(declare-fun b!159997 () Bool)

(assert (=> b!159997 (= e!104660 false)))

(declare-fun lt!82048 () Bool)

(declare-datatypes ((List!1926 0))(
  ( (Nil!1923) (Cons!1922 (h!2535 (_ BitVec 64)) (t!6728 List!1926)) )
))
(declare-fun arrayNoDuplicates!0 (array!5797 (_ BitVec 32) List!1926) Bool)

(assert (=> b!159997 (= lt!82048 (arrayNoDuplicates!0 (_keys!5033 thiss!1248) #b00000000000000000000000000000000 Nil!1923))))

(declare-fun b!159998 () Bool)

(declare-fun res!75681 () Bool)

(assert (=> b!159998 (=> (not res!75681) (not e!104660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159998 (= res!75681 (validMask!0 (mask!7792 thiss!1248)))))

(declare-fun b!159991 () Bool)

(declare-fun res!75686 () Bool)

(assert (=> b!159991 (=> (not res!75686) (not e!104660))))

(assert (=> b!159991 (= res!75686 (and (= (size!3028 (_values!3215 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7792 thiss!1248))) (= (size!3027 (_keys!5033 thiss!1248)) (size!3028 (_values!3215 thiss!1248))) (bvsge (mask!7792 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2973 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2973 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!75680 () Bool)

(assert (=> start!16096 (=> (not res!75680) (not e!104660))))

(declare-fun valid!736 (LongMapFixedSize!1580) Bool)

(assert (=> start!16096 (= res!75680 (valid!736 thiss!1248))))

(assert (=> start!16096 e!104660))

(assert (=> start!16096 e!104664))

(assert (=> start!16096 true))

(declare-fun b!159999 () Bool)

(declare-fun res!75684 () Bool)

(assert (=> b!159999 (=> (not res!75684) (not e!104660))))

(declare-datatypes ((tuple2!2904 0))(
  ( (tuple2!2905 (_1!1463 (_ BitVec 64)) (_2!1463 V!4125)) )
))
(declare-datatypes ((List!1927 0))(
  ( (Nil!1924) (Cons!1923 (h!2536 tuple2!2904) (t!6729 List!1927)) )
))
(declare-datatypes ((ListLongMap!1891 0))(
  ( (ListLongMap!1892 (toList!961 List!1927)) )
))
(declare-fun contains!997 (ListLongMap!1891 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!625 (array!5797 array!5799 (_ BitVec 32) (_ BitVec 32) V!4125 V!4125 (_ BitVec 32) Int) ListLongMap!1891)

(assert (=> b!159999 (= res!75684 (contains!997 (getCurrentListMap!625 (_keys!5033 thiss!1248) (_values!3215 thiss!1248) (mask!7792 thiss!1248) (extraKeys!2973 thiss!1248) (zeroValue!3075 thiss!1248) (minValue!3075 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3232 thiss!1248)) key!828))))

(declare-fun b!160000 () Bool)

(assert (=> b!160000 (= e!104661 (and e!104659 mapRes!5726))))

(declare-fun condMapEmpty!5726 () Bool)

(declare-fun mapDefault!5726 () ValueCell!1336)

