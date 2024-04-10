; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21632 () Bool)

(assert start!21632)

(declare-fun b!216899 () Bool)

(declare-fun b_free!5781 () Bool)

(declare-fun b_next!5781 () Bool)

(assert (=> b!216899 (= b_free!5781 (not b_next!5781))))

(declare-fun tp!20477 () Bool)

(declare-fun b_and!12671 () Bool)

(assert (=> b!216899 (= tp!20477 b_and!12671)))

(declare-fun mapIsEmpty!9627 () Bool)

(declare-fun mapRes!9627 () Bool)

(assert (=> mapIsEmpty!9627 mapRes!9627))

(declare-fun res!106125 () Bool)

(declare-fun e!141112 () Bool)

(assert (=> start!21632 (=> (not res!106125) (not e!141112))))

(declare-datatypes ((V!7171 0))(
  ( (V!7172 (val!2866 Int)) )
))
(declare-datatypes ((ValueCell!2478 0))(
  ( (ValueCellFull!2478 (v!4884 V!7171)) (EmptyCell!2478) )
))
(declare-datatypes ((array!10525 0))(
  ( (array!10526 (arr!4984 (Array (_ BitVec 32) ValueCell!2478)) (size!5316 (_ BitVec 32))) )
))
(declare-datatypes ((array!10527 0))(
  ( (array!10528 (arr!4985 (Array (_ BitVec 32) (_ BitVec 64))) (size!5317 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2856 0))(
  ( (LongMapFixedSize!2857 (defaultEntry!4078 Int) (mask!9823 (_ BitVec 32)) (extraKeys!3815 (_ BitVec 32)) (zeroValue!3919 V!7171) (minValue!3919 V!7171) (_size!1477 (_ BitVec 32)) (_keys!6127 array!10527) (_values!4061 array!10525) (_vacant!1477 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2856)

(declare-fun valid!1160 (LongMapFixedSize!2856) Bool)

(assert (=> start!21632 (= res!106125 (valid!1160 thiss!1504))))

(assert (=> start!21632 e!141112))

(declare-fun e!141113 () Bool)

(assert (=> start!21632 e!141113))

(assert (=> start!21632 true))

(declare-fun b!216898 () Bool)

(declare-fun e!141114 () Bool)

(assert (=> b!216898 (= e!141112 e!141114)))

(declare-fun res!106127 () Bool)

(assert (=> b!216898 (=> (not res!106127) (not e!141114))))

(declare-datatypes ((SeekEntryResult!754 0))(
  ( (MissingZero!754 (index!5186 (_ BitVec 32))) (Found!754 (index!5187 (_ BitVec 32))) (Intermediate!754 (undefined!1566 Bool) (index!5188 (_ BitVec 32)) (x!22682 (_ BitVec 32))) (Undefined!754) (MissingVacant!754 (index!5189 (_ BitVec 32))) )
))
(declare-fun lt!111248 () SeekEntryResult!754)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216898 (= res!106127 (or (= lt!111248 (MissingZero!754 index!297)) (= lt!111248 (MissingVacant!754 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10527 (_ BitVec 32)) SeekEntryResult!754)

(assert (=> b!216898 (= lt!111248 (seekEntryOrOpen!0 key!932 (_keys!6127 thiss!1504) (mask!9823 thiss!1504)))))

(declare-fun e!141109 () Bool)

(declare-fun tp_is_empty!5643 () Bool)

(declare-fun array_inv!3295 (array!10527) Bool)

(declare-fun array_inv!3296 (array!10525) Bool)

(assert (=> b!216899 (= e!141113 (and tp!20477 tp_is_empty!5643 (array_inv!3295 (_keys!6127 thiss!1504)) (array_inv!3296 (_values!4061 thiss!1504)) e!141109))))

(declare-fun b!216900 () Bool)

(declare-fun e!141115 () Bool)

(assert (=> b!216900 (= e!141109 (and e!141115 mapRes!9627))))

(declare-fun condMapEmpty!9627 () Bool)

(declare-fun mapDefault!9627 () ValueCell!2478)

(assert (=> b!216900 (= condMapEmpty!9627 (= (arr!4984 (_values!4061 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2478)) mapDefault!9627)))))

(declare-fun b!216901 () Bool)

(declare-fun res!106129 () Bool)

(assert (=> b!216901 (=> (not res!106129) (not e!141112))))

(assert (=> b!216901 (= res!106129 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216902 () Bool)

(declare-fun res!106130 () Bool)

(assert (=> b!216902 (=> (not res!106130) (not e!141114))))

(declare-datatypes ((tuple2!4266 0))(
  ( (tuple2!4267 (_1!2144 (_ BitVec 64)) (_2!2144 V!7171)) )
))
(declare-datatypes ((List!3169 0))(
  ( (Nil!3166) (Cons!3165 (h!3812 tuple2!4266) (t!8124 List!3169)) )
))
(declare-datatypes ((ListLongMap!3179 0))(
  ( (ListLongMap!3180 (toList!1605 List!3169)) )
))
(declare-fun contains!1446 (ListLongMap!3179 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1133 (array!10527 array!10525 (_ BitVec 32) (_ BitVec 32) V!7171 V!7171 (_ BitVec 32) Int) ListLongMap!3179)

(assert (=> b!216902 (= res!106130 (contains!1446 (getCurrentListMap!1133 (_keys!6127 thiss!1504) (_values!4061 thiss!1504) (mask!9823 thiss!1504) (extraKeys!3815 thiss!1504) (zeroValue!3919 thiss!1504) (minValue!3919 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4078 thiss!1504)) key!932))))

(declare-fun b!216903 () Bool)

(declare-fun e!141111 () Bool)

(assert (=> b!216903 (= e!141111 tp_is_empty!5643)))

(declare-fun b!216904 () Bool)

(declare-fun res!106128 () Bool)

(assert (=> b!216904 (=> (not res!106128) (not e!141114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10527 (_ BitVec 32)) Bool)

(assert (=> b!216904 (= res!106128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6127 thiss!1504) (mask!9823 thiss!1504)))))

(declare-fun b!216905 () Bool)

(assert (=> b!216905 (= e!141115 tp_is_empty!5643)))

(declare-fun b!216906 () Bool)

(declare-fun res!106131 () Bool)

(assert (=> b!216906 (=> (not res!106131) (not e!141114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216906 (= res!106131 (validMask!0 (mask!9823 thiss!1504)))))

(declare-fun b!216907 () Bool)

(assert (=> b!216907 (= e!141114 false)))

(declare-fun lt!111249 () Bool)

(declare-datatypes ((List!3170 0))(
  ( (Nil!3167) (Cons!3166 (h!3813 (_ BitVec 64)) (t!8125 List!3170)) )
))
(declare-fun arrayNoDuplicates!0 (array!10527 (_ BitVec 32) List!3170) Bool)

(assert (=> b!216907 (= lt!111249 (arrayNoDuplicates!0 (_keys!6127 thiss!1504) #b00000000000000000000000000000000 Nil!3167))))

(declare-fun b!216908 () Bool)

(declare-fun res!106126 () Bool)

(assert (=> b!216908 (=> (not res!106126) (not e!141114))))

(assert (=> b!216908 (= res!106126 (and (= (size!5316 (_values!4061 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9823 thiss!1504))) (= (size!5317 (_keys!6127 thiss!1504)) (size!5316 (_values!4061 thiss!1504))) (bvsge (mask!9823 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3815 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3815 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!9627 () Bool)

(declare-fun tp!20478 () Bool)

(assert (=> mapNonEmpty!9627 (= mapRes!9627 (and tp!20478 e!141111))))

(declare-fun mapKey!9627 () (_ BitVec 32))

(declare-fun mapValue!9627 () ValueCell!2478)

(declare-fun mapRest!9627 () (Array (_ BitVec 32) ValueCell!2478))

(assert (=> mapNonEmpty!9627 (= (arr!4984 (_values!4061 thiss!1504)) (store mapRest!9627 mapKey!9627 mapValue!9627))))

(assert (= (and start!21632 res!106125) b!216901))

(assert (= (and b!216901 res!106129) b!216898))

(assert (= (and b!216898 res!106127) b!216902))

(assert (= (and b!216902 res!106130) b!216906))

(assert (= (and b!216906 res!106131) b!216908))

(assert (= (and b!216908 res!106126) b!216904))

(assert (= (and b!216904 res!106128) b!216907))

(assert (= (and b!216900 condMapEmpty!9627) mapIsEmpty!9627))

(assert (= (and b!216900 (not condMapEmpty!9627)) mapNonEmpty!9627))

(get-info :version)

(assert (= (and mapNonEmpty!9627 ((_ is ValueCellFull!2478) mapValue!9627)) b!216903))

(assert (= (and b!216900 ((_ is ValueCellFull!2478) mapDefault!9627)) b!216905))

(assert (= b!216899 b!216900))

(assert (= start!21632 b!216899))

(declare-fun m!243429 () Bool)

(assert (=> start!21632 m!243429))

(declare-fun m!243431 () Bool)

(assert (=> b!216906 m!243431))

(declare-fun m!243433 () Bool)

(assert (=> b!216907 m!243433))

(declare-fun m!243435 () Bool)

(assert (=> b!216898 m!243435))

(declare-fun m!243437 () Bool)

(assert (=> b!216902 m!243437))

(assert (=> b!216902 m!243437))

(declare-fun m!243439 () Bool)

(assert (=> b!216902 m!243439))

(declare-fun m!243441 () Bool)

(assert (=> mapNonEmpty!9627 m!243441))

(declare-fun m!243443 () Bool)

(assert (=> b!216899 m!243443))

(declare-fun m!243445 () Bool)

(assert (=> b!216899 m!243445))

(declare-fun m!243447 () Bool)

(assert (=> b!216904 m!243447))

(check-sat (not start!21632) (not b_next!5781) (not b!216902) (not mapNonEmpty!9627) (not b!216906) (not b!216898) tp_is_empty!5643 b_and!12671 (not b!216907) (not b!216899) (not b!216904))
(check-sat b_and!12671 (not b_next!5781))
