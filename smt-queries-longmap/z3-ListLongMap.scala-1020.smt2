; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21724 () Bool)

(assert start!21724)

(declare-fun b!218399 () Bool)

(declare-fun b_free!5869 () Bool)

(declare-fun b_next!5869 () Bool)

(assert (=> b!218399 (= b_free!5869 (not b_next!5869))))

(declare-fun tp!20742 () Bool)

(declare-fun b_and!12773 () Bool)

(assert (=> b!218399 (= tp!20742 b_and!12773)))

(declare-fun b!218397 () Bool)

(declare-fun e!142058 () Bool)

(declare-fun tp_is_empty!5731 () Bool)

(assert (=> b!218397 (= e!142058 tp_is_empty!5731)))

(declare-fun mapNonEmpty!9759 () Bool)

(declare-fun mapRes!9759 () Bool)

(declare-fun tp!20741 () Bool)

(assert (=> mapNonEmpty!9759 (= mapRes!9759 (and tp!20741 e!142058))))

(declare-datatypes ((V!7289 0))(
  ( (V!7290 (val!2910 Int)) )
))
(declare-datatypes ((ValueCell!2522 0))(
  ( (ValueCellFull!2522 (v!4929 V!7289)) (EmptyCell!2522) )
))
(declare-fun mapValue!9759 () ValueCell!2522)

(declare-fun mapKey!9759 () (_ BitVec 32))

(declare-datatypes ((array!10699 0))(
  ( (array!10700 (arr!5071 (Array (_ BitVec 32) ValueCell!2522)) (size!5403 (_ BitVec 32))) )
))
(declare-datatypes ((array!10701 0))(
  ( (array!10702 (arr!5072 (Array (_ BitVec 32) (_ BitVec 64))) (size!5404 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2944 0))(
  ( (LongMapFixedSize!2945 (defaultEntry!4122 Int) (mask!9897 (_ BitVec 32)) (extraKeys!3859 (_ BitVec 32)) (zeroValue!3963 V!7289) (minValue!3963 V!7289) (_size!1521 (_ BitVec 32)) (_keys!6171 array!10701) (_values!4105 array!10699) (_vacant!1521 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2944)

(declare-fun mapRest!9759 () (Array (_ BitVec 32) ValueCell!2522))

(assert (=> mapNonEmpty!9759 (= (arr!5071 (_values!4105 thiss!1504)) (store mapRest!9759 mapKey!9759 mapValue!9759))))

(declare-fun b!218398 () Bool)

(declare-fun res!107072 () Bool)

(declare-fun e!142057 () Bool)

(assert (=> b!218398 (=> (not res!107072) (not e!142057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!218398 (= res!107072 (validMask!0 (mask!9897 thiss!1504)))))

(declare-fun e!142061 () Bool)

(declare-fun e!142059 () Bool)

(declare-fun array_inv!3333 (array!10701) Bool)

(declare-fun array_inv!3334 (array!10699) Bool)

(assert (=> b!218399 (= e!142059 (and tp!20742 tp_is_empty!5731 (array_inv!3333 (_keys!6171 thiss!1504)) (array_inv!3334 (_values!4105 thiss!1504)) e!142061))))

(declare-fun b!218400 () Bool)

(declare-fun res!107075 () Bool)

(assert (=> b!218400 (=> (not res!107075) (not e!142057))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10701 (_ BitVec 32)) Bool)

(assert (=> b!218400 (= res!107075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6171 thiss!1504) (mask!9897 thiss!1504)))))

(declare-fun b!218401 () Bool)

(declare-fun res!107073 () Bool)

(assert (=> b!218401 (=> (not res!107073) (not e!142057))))

(assert (=> b!218401 (= res!107073 (and (= (size!5403 (_values!4105 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9897 thiss!1504))) (= (size!5404 (_keys!6171 thiss!1504)) (size!5403 (_values!4105 thiss!1504))) (bvsge (mask!9897 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3859 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3859 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!218402 () Bool)

(declare-fun res!107070 () Bool)

(declare-fun e!142062 () Bool)

(assert (=> b!218402 (=> (not res!107070) (not e!142062))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!218402 (= res!107070 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!218403 () Bool)

(assert (=> b!218403 (= e!142062 e!142057)))

(declare-fun res!107076 () Bool)

(assert (=> b!218403 (=> (not res!107076) (not e!142057))))

(declare-datatypes ((SeekEntryResult!764 0))(
  ( (MissingZero!764 (index!5226 (_ BitVec 32))) (Found!764 (index!5227 (_ BitVec 32))) (Intermediate!764 (undefined!1576 Bool) (index!5228 (_ BitVec 32)) (x!22812 (_ BitVec 32))) (Undefined!764) (MissingVacant!764 (index!5229 (_ BitVec 32))) )
))
(declare-fun lt!111571 () SeekEntryResult!764)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!218403 (= res!107076 (or (= lt!111571 (MissingZero!764 index!297)) (= lt!111571 (MissingVacant!764 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10701 (_ BitVec 32)) SeekEntryResult!764)

(assert (=> b!218403 (= lt!111571 (seekEntryOrOpen!0 key!932 (_keys!6171 thiss!1504) (mask!9897 thiss!1504)))))

(declare-fun b!218404 () Bool)

(declare-fun res!107071 () Bool)

(assert (=> b!218404 (=> (not res!107071) (not e!142057))))

(declare-datatypes ((tuple2!4246 0))(
  ( (tuple2!4247 (_1!2134 (_ BitVec 64)) (_2!2134 V!7289)) )
))
(declare-datatypes ((List!3145 0))(
  ( (Nil!3142) (Cons!3141 (h!3788 tuple2!4246) (t!8092 List!3145)) )
))
(declare-datatypes ((ListLongMap!3161 0))(
  ( (ListLongMap!3162 (toList!1596 List!3145)) )
))
(declare-fun contains!1451 (ListLongMap!3161 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1128 (array!10701 array!10699 (_ BitVec 32) (_ BitVec 32) V!7289 V!7289 (_ BitVec 32) Int) ListLongMap!3161)

(assert (=> b!218404 (= res!107071 (not (contains!1451 (getCurrentListMap!1128 (_keys!6171 thiss!1504) (_values!4105 thiss!1504) (mask!9897 thiss!1504) (extraKeys!3859 thiss!1504) (zeroValue!3963 thiss!1504) (minValue!3963 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4122 thiss!1504)) key!932)))))

(declare-fun b!218405 () Bool)

(declare-fun e!142063 () Bool)

(assert (=> b!218405 (= e!142063 tp_is_empty!5731)))

(declare-fun mapIsEmpty!9759 () Bool)

(assert (=> mapIsEmpty!9759 mapRes!9759))

(declare-fun b!218407 () Bool)

(assert (=> b!218407 (= e!142061 (and e!142063 mapRes!9759))))

(declare-fun condMapEmpty!9759 () Bool)

(declare-fun mapDefault!9759 () ValueCell!2522)

(assert (=> b!218407 (= condMapEmpty!9759 (= (arr!5071 (_values!4105 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2522)) mapDefault!9759)))))

(declare-fun b!218406 () Bool)

(assert (=> b!218406 (= e!142057 false)))

(declare-fun lt!111572 () Bool)

(declare-datatypes ((List!3146 0))(
  ( (Nil!3143) (Cons!3142 (h!3789 (_ BitVec 64)) (t!8093 List!3146)) )
))
(declare-fun arrayNoDuplicates!0 (array!10701 (_ BitVec 32) List!3146) Bool)

(assert (=> b!218406 (= lt!111572 (arrayNoDuplicates!0 (_keys!6171 thiss!1504) #b00000000000000000000000000000000 Nil!3143))))

(declare-fun res!107074 () Bool)

(assert (=> start!21724 (=> (not res!107074) (not e!142062))))

(declare-fun valid!1206 (LongMapFixedSize!2944) Bool)

(assert (=> start!21724 (= res!107074 (valid!1206 thiss!1504))))

(assert (=> start!21724 e!142062))

(assert (=> start!21724 e!142059))

(assert (=> start!21724 true))

(assert (= (and start!21724 res!107074) b!218402))

(assert (= (and b!218402 res!107070) b!218403))

(assert (= (and b!218403 res!107076) b!218404))

(assert (= (and b!218404 res!107071) b!218398))

(assert (= (and b!218398 res!107072) b!218401))

(assert (= (and b!218401 res!107073) b!218400))

(assert (= (and b!218400 res!107075) b!218406))

(assert (= (and b!218407 condMapEmpty!9759) mapIsEmpty!9759))

(assert (= (and b!218407 (not condMapEmpty!9759)) mapNonEmpty!9759))

(get-info :version)

(assert (= (and mapNonEmpty!9759 ((_ is ValueCellFull!2522) mapValue!9759)) b!218397))

(assert (= (and b!218407 ((_ is ValueCellFull!2522) mapDefault!9759)) b!218405))

(assert (= b!218399 b!218407))

(assert (= start!21724 b!218399))

(declare-fun m!244491 () Bool)

(assert (=> b!218398 m!244491))

(declare-fun m!244493 () Bool)

(assert (=> b!218404 m!244493))

(assert (=> b!218404 m!244493))

(declare-fun m!244495 () Bool)

(assert (=> b!218404 m!244495))

(declare-fun m!244497 () Bool)

(assert (=> start!21724 m!244497))

(declare-fun m!244499 () Bool)

(assert (=> b!218403 m!244499))

(declare-fun m!244501 () Bool)

(assert (=> b!218406 m!244501))

(declare-fun m!244503 () Bool)

(assert (=> mapNonEmpty!9759 m!244503))

(declare-fun m!244505 () Bool)

(assert (=> b!218399 m!244505))

(declare-fun m!244507 () Bool)

(assert (=> b!218399 m!244507))

(declare-fun m!244509 () Bool)

(assert (=> b!218400 m!244509))

(check-sat (not b_next!5869) (not b!218404) (not b!218398) (not start!21724) tp_is_empty!5731 (not b!218406) b_and!12773 (not b!218400) (not b!218403) (not b!218399) (not mapNonEmpty!9759))
(check-sat b_and!12773 (not b_next!5869))
