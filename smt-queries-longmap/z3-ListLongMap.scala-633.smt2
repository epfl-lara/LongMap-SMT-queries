; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16148 () Bool)

(assert start!16148)

(declare-fun b!160858 () Bool)

(declare-fun b_free!3609 () Bool)

(declare-fun b_next!3609 () Bool)

(assert (=> b!160858 (= b_free!3609 (not b_next!3609))))

(declare-fun tp!13397 () Bool)

(declare-fun b_and!10023 () Bool)

(assert (=> b!160858 (= tp!13397 b_and!10023)))

(declare-fun b!160848 () Bool)

(declare-fun e!105130 () Bool)

(declare-fun e!105127 () Bool)

(declare-fun mapRes!5804 () Bool)

(assert (=> b!160848 (= e!105130 (and e!105127 mapRes!5804))))

(declare-fun condMapEmpty!5804 () Bool)

(declare-datatypes ((V!4195 0))(
  ( (V!4196 (val!1750 Int)) )
))
(declare-datatypes ((ValueCell!1362 0))(
  ( (ValueCellFull!1362 (v!3615 V!4195)) (EmptyCell!1362) )
))
(declare-datatypes ((array!5901 0))(
  ( (array!5902 (arr!2795 (Array (_ BitVec 32) (_ BitVec 64))) (size!3079 (_ BitVec 32))) )
))
(declare-datatypes ((array!5903 0))(
  ( (array!5904 (arr!2796 (Array (_ BitVec 32) ValueCell!1362)) (size!3080 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1632 0))(
  ( (LongMapFixedSize!1633 (defaultEntry!3258 Int) (mask!7836 (_ BitVec 32)) (extraKeys!2999 (_ BitVec 32)) (zeroValue!3101 V!4195) (minValue!3101 V!4195) (_size!865 (_ BitVec 32)) (_keys!5059 array!5901) (_values!3241 array!5903) (_vacant!865 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1632)

(declare-fun mapDefault!5804 () ValueCell!1362)

(assert (=> b!160848 (= condMapEmpty!5804 (= (arr!2796 (_values!3241 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1362)) mapDefault!5804)))))

(declare-fun b!160849 () Bool)

(declare-fun res!76229 () Bool)

(declare-fun e!105128 () Bool)

(assert (=> b!160849 (=> (not res!76229) (not e!105128))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160849 (= res!76229 (validMask!0 (mask!7836 thiss!1248)))))

(declare-fun b!160850 () Bool)

(declare-fun res!76227 () Bool)

(assert (=> b!160850 (=> (not res!76227) (not e!105128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5901 (_ BitVec 32)) Bool)

(assert (=> b!160850 (= res!76227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5059 thiss!1248) (mask!7836 thiss!1248)))))

(declare-fun mapNonEmpty!5804 () Bool)

(declare-fun tp!13396 () Bool)

(declare-fun e!105131 () Bool)

(assert (=> mapNonEmpty!5804 (= mapRes!5804 (and tp!13396 e!105131))))

(declare-fun mapRest!5804 () (Array (_ BitVec 32) ValueCell!1362))

(declare-fun mapValue!5804 () ValueCell!1362)

(declare-fun mapKey!5804 () (_ BitVec 32))

(assert (=> mapNonEmpty!5804 (= (arr!2796 (_values!3241 thiss!1248)) (store mapRest!5804 mapKey!5804 mapValue!5804))))

(declare-fun res!76231 () Bool)

(assert (=> start!16148 (=> (not res!76231) (not e!105128))))

(declare-fun valid!753 (LongMapFixedSize!1632) Bool)

(assert (=> start!16148 (= res!76231 (valid!753 thiss!1248))))

(assert (=> start!16148 e!105128))

(declare-fun e!105132 () Bool)

(assert (=> start!16148 e!105132))

(assert (=> start!16148 true))

(declare-fun b!160851 () Bool)

(declare-fun tp_is_empty!3411 () Bool)

(assert (=> b!160851 (= e!105127 tp_is_empty!3411)))

(declare-fun b!160852 () Bool)

(assert (=> b!160852 (= e!105128 false)))

(declare-fun lt!82126 () Bool)

(declare-datatypes ((List!1959 0))(
  ( (Nil!1956) (Cons!1955 (h!2568 (_ BitVec 64)) (t!6761 List!1959)) )
))
(declare-fun arrayNoDuplicates!0 (array!5901 (_ BitVec 32) List!1959) Bool)

(assert (=> b!160852 (= lt!82126 (arrayNoDuplicates!0 (_keys!5059 thiss!1248) #b00000000000000000000000000000000 Nil!1956))))

(declare-fun b!160853 () Bool)

(declare-fun res!76228 () Bool)

(assert (=> b!160853 (=> (not res!76228) (not e!105128))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!160853 (= res!76228 (not (= key!828 (bvneg key!828))))))

(declare-fun b!160854 () Bool)

(declare-fun res!76226 () Bool)

(assert (=> b!160854 (=> (not res!76226) (not e!105128))))

(declare-datatypes ((tuple2!2938 0))(
  ( (tuple2!2939 (_1!1480 (_ BitVec 64)) (_2!1480 V!4195)) )
))
(declare-datatypes ((List!1960 0))(
  ( (Nil!1957) (Cons!1956 (h!2569 tuple2!2938) (t!6762 List!1960)) )
))
(declare-datatypes ((ListLongMap!1925 0))(
  ( (ListLongMap!1926 (toList!978 List!1960)) )
))
(declare-fun contains!1014 (ListLongMap!1925 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!642 (array!5901 array!5903 (_ BitVec 32) (_ BitVec 32) V!4195 V!4195 (_ BitVec 32) Int) ListLongMap!1925)

(assert (=> b!160854 (= res!76226 (not (contains!1014 (getCurrentListMap!642 (_keys!5059 thiss!1248) (_values!3241 thiss!1248) (mask!7836 thiss!1248) (extraKeys!2999 thiss!1248) (zeroValue!3101 thiss!1248) (minValue!3101 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3258 thiss!1248)) key!828)))))

(declare-fun b!160855 () Bool)

(declare-fun res!76232 () Bool)

(assert (=> b!160855 (=> (not res!76232) (not e!105128))))

(assert (=> b!160855 (= res!76232 (and (= (size!3080 (_values!3241 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7836 thiss!1248))) (= (size!3079 (_keys!5059 thiss!1248)) (size!3080 (_values!3241 thiss!1248))) (bvsge (mask!7836 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2999 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2999 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!160856 () Bool)

(declare-fun res!76230 () Bool)

(assert (=> b!160856 (=> (not res!76230) (not e!105128))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!341 0))(
  ( (MissingZero!341 (index!3532 (_ BitVec 32))) (Found!341 (index!3533 (_ BitVec 32))) (Intermediate!341 (undefined!1153 Bool) (index!3534 (_ BitVec 32)) (x!17749 (_ BitVec 32))) (Undefined!341) (MissingVacant!341 (index!3535 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5901 (_ BitVec 32)) SeekEntryResult!341)

(assert (=> b!160856 (= res!76230 ((_ is Undefined!341) (seekEntryOrOpen!0 key!828 (_keys!5059 thiss!1248) (mask!7836 thiss!1248))))))

(declare-fun mapIsEmpty!5804 () Bool)

(assert (=> mapIsEmpty!5804 mapRes!5804))

(declare-fun b!160857 () Bool)

(assert (=> b!160857 (= e!105131 tp_is_empty!3411)))

(declare-fun array_inv!1787 (array!5901) Bool)

(declare-fun array_inv!1788 (array!5903) Bool)

(assert (=> b!160858 (= e!105132 (and tp!13397 tp_is_empty!3411 (array_inv!1787 (_keys!5059 thiss!1248)) (array_inv!1788 (_values!3241 thiss!1248)) e!105130))))

(assert (= (and start!16148 res!76231) b!160853))

(assert (= (and b!160853 res!76228) b!160856))

(assert (= (and b!160856 res!76230) b!160854))

(assert (= (and b!160854 res!76226) b!160849))

(assert (= (and b!160849 res!76229) b!160855))

(assert (= (and b!160855 res!76232) b!160850))

(assert (= (and b!160850 res!76227) b!160852))

(assert (= (and b!160848 condMapEmpty!5804) mapIsEmpty!5804))

(assert (= (and b!160848 (not condMapEmpty!5804)) mapNonEmpty!5804))

(assert (= (and mapNonEmpty!5804 ((_ is ValueCellFull!1362) mapValue!5804)) b!160857))

(assert (= (and b!160848 ((_ is ValueCellFull!1362) mapDefault!5804)) b!160851))

(assert (= b!160858 b!160848))

(assert (= start!16148 b!160858))

(declare-fun m!192557 () Bool)

(assert (=> b!160856 m!192557))

(declare-fun m!192559 () Bool)

(assert (=> b!160854 m!192559))

(assert (=> b!160854 m!192559))

(declare-fun m!192561 () Bool)

(assert (=> b!160854 m!192561))

(declare-fun m!192563 () Bool)

(assert (=> b!160858 m!192563))

(declare-fun m!192565 () Bool)

(assert (=> b!160858 m!192565))

(declare-fun m!192567 () Bool)

(assert (=> b!160852 m!192567))

(declare-fun m!192569 () Bool)

(assert (=> b!160849 m!192569))

(declare-fun m!192571 () Bool)

(assert (=> mapNonEmpty!5804 m!192571))

(declare-fun m!192573 () Bool)

(assert (=> b!160850 m!192573))

(declare-fun m!192575 () Bool)

(assert (=> start!16148 m!192575))

(check-sat (not b!160852) (not b!160856) (not b!160854) (not b!160850) (not b_next!3609) tp_is_empty!3411 (not mapNonEmpty!5804) (not start!16148) b_and!10023 (not b!160849) (not b!160858))
(check-sat b_and!10023 (not b_next!3609))
