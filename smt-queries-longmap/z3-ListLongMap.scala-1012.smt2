; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21674 () Bool)

(assert start!21674)

(declare-fun b!217591 () Bool)

(declare-fun b_free!5823 () Bool)

(declare-fun b_next!5823 () Bool)

(assert (=> b!217591 (= b_free!5823 (not b_next!5823))))

(declare-fun tp!20603 () Bool)

(declare-fun b_and!12713 () Bool)

(assert (=> b!217591 (= tp!20603 b_and!12713)))

(declare-fun e!141552 () Bool)

(declare-fun e!141556 () Bool)

(declare-fun tp_is_empty!5685 () Bool)

(declare-datatypes ((V!7227 0))(
  ( (V!7228 (val!2887 Int)) )
))
(declare-datatypes ((ValueCell!2499 0))(
  ( (ValueCellFull!2499 (v!4905 V!7227)) (EmptyCell!2499) )
))
(declare-datatypes ((array!10609 0))(
  ( (array!10610 (arr!5026 (Array (_ BitVec 32) ValueCell!2499)) (size!5358 (_ BitVec 32))) )
))
(declare-datatypes ((array!10611 0))(
  ( (array!10612 (arr!5027 (Array (_ BitVec 32) (_ BitVec 64))) (size!5359 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2898 0))(
  ( (LongMapFixedSize!2899 (defaultEntry!4099 Int) (mask!9858 (_ BitVec 32)) (extraKeys!3836 (_ BitVec 32)) (zeroValue!3940 V!7227) (minValue!3940 V!7227) (_size!1498 (_ BitVec 32)) (_keys!6148 array!10611) (_values!4082 array!10609) (_vacant!1498 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2898)

(declare-fun array_inv!3329 (array!10611) Bool)

(declare-fun array_inv!3330 (array!10609) Bool)

(assert (=> b!217591 (= e!141556 (and tp!20603 tp_is_empty!5685 (array_inv!3329 (_keys!6148 thiss!1504)) (array_inv!3330 (_values!4082 thiss!1504)) e!141552))))

(declare-fun b!217592 () Bool)

(declare-fun e!141554 () Bool)

(assert (=> b!217592 (= e!141554 tp_is_empty!5685)))

(declare-fun res!106566 () Bool)

(declare-fun e!141553 () Bool)

(assert (=> start!21674 (=> (not res!106566) (not e!141553))))

(declare-fun valid!1175 (LongMapFixedSize!2898) Bool)

(assert (=> start!21674 (= res!106566 (valid!1175 thiss!1504))))

(assert (=> start!21674 e!141553))

(assert (=> start!21674 e!141556))

(assert (=> start!21674 true))

(declare-fun b!217593 () Bool)

(declare-fun e!141555 () Bool)

(assert (=> b!217593 (= e!141553 e!141555)))

(declare-fun res!106571 () Bool)

(assert (=> b!217593 (=> (not res!106571) (not e!141555))))

(declare-datatypes ((SeekEntryResult!769 0))(
  ( (MissingZero!769 (index!5246 (_ BitVec 32))) (Found!769 (index!5247 (_ BitVec 32))) (Intermediate!769 (undefined!1581 Bool) (index!5248 (_ BitVec 32)) (x!22753 (_ BitVec 32))) (Undefined!769) (MissingVacant!769 (index!5249 (_ BitVec 32))) )
))
(declare-fun lt!111375 () SeekEntryResult!769)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217593 (= res!106571 (or (= lt!111375 (MissingZero!769 index!297)) (= lt!111375 (MissingVacant!769 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10611 (_ BitVec 32)) SeekEntryResult!769)

(assert (=> b!217593 (= lt!111375 (seekEntryOrOpen!0 key!932 (_keys!6148 thiss!1504) (mask!9858 thiss!1504)))))

(declare-fun b!217594 () Bool)

(declare-fun res!106570 () Bool)

(assert (=> b!217594 (=> (not res!106570) (not e!141555))))

(assert (=> b!217594 (= res!106570 (and (= (size!5358 (_values!4082 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9858 thiss!1504))) (= (size!5359 (_keys!6148 thiss!1504)) (size!5358 (_values!4082 thiss!1504))) (bvsge (mask!9858 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3836 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3836 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!217595 () Bool)

(declare-fun res!106569 () Bool)

(assert (=> b!217595 (=> (not res!106569) (not e!141555))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10611 (_ BitVec 32)) Bool)

(assert (=> b!217595 (= res!106569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6148 thiss!1504) (mask!9858 thiss!1504)))))

(declare-fun mapNonEmpty!9690 () Bool)

(declare-fun mapRes!9690 () Bool)

(declare-fun tp!20604 () Bool)

(assert (=> mapNonEmpty!9690 (= mapRes!9690 (and tp!20604 e!141554))))

(declare-fun mapValue!9690 () ValueCell!2499)

(declare-fun mapRest!9690 () (Array (_ BitVec 32) ValueCell!2499))

(declare-fun mapKey!9690 () (_ BitVec 32))

(assert (=> mapNonEmpty!9690 (= (arr!5026 (_values!4082 thiss!1504)) (store mapRest!9690 mapKey!9690 mapValue!9690))))

(declare-fun mapIsEmpty!9690 () Bool)

(assert (=> mapIsEmpty!9690 mapRes!9690))

(declare-fun b!217596 () Bool)

(assert (=> b!217596 (= e!141555 false)))

(declare-fun lt!111374 () Bool)

(declare-datatypes ((List!3195 0))(
  ( (Nil!3192) (Cons!3191 (h!3838 (_ BitVec 64)) (t!8150 List!3195)) )
))
(declare-fun arrayNoDuplicates!0 (array!10611 (_ BitVec 32) List!3195) Bool)

(assert (=> b!217596 (= lt!111374 (arrayNoDuplicates!0 (_keys!6148 thiss!1504) #b00000000000000000000000000000000 Nil!3192))))

(declare-fun b!217597 () Bool)

(declare-fun res!106572 () Bool)

(assert (=> b!217597 (=> (not res!106572) (not e!141555))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217597 (= res!106572 (validMask!0 (mask!9858 thiss!1504)))))

(declare-fun b!217598 () Bool)

(declare-fun e!141550 () Bool)

(assert (=> b!217598 (= e!141550 tp_is_empty!5685)))

(declare-fun b!217599 () Bool)

(declare-fun res!106567 () Bool)

(assert (=> b!217599 (=> (not res!106567) (not e!141553))))

(assert (=> b!217599 (= res!106567 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217600 () Bool)

(declare-fun res!106568 () Bool)

(assert (=> b!217600 (=> (not res!106568) (not e!141555))))

(declare-datatypes ((tuple2!4290 0))(
  ( (tuple2!4291 (_1!2156 (_ BitVec 64)) (_2!2156 V!7227)) )
))
(declare-datatypes ((List!3196 0))(
  ( (Nil!3193) (Cons!3192 (h!3839 tuple2!4290) (t!8151 List!3196)) )
))
(declare-datatypes ((ListLongMap!3203 0))(
  ( (ListLongMap!3204 (toList!1617 List!3196)) )
))
(declare-fun contains!1458 (ListLongMap!3203 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1145 (array!10611 array!10609 (_ BitVec 32) (_ BitVec 32) V!7227 V!7227 (_ BitVec 32) Int) ListLongMap!3203)

(assert (=> b!217600 (= res!106568 (not (contains!1458 (getCurrentListMap!1145 (_keys!6148 thiss!1504) (_values!4082 thiss!1504) (mask!9858 thiss!1504) (extraKeys!3836 thiss!1504) (zeroValue!3940 thiss!1504) (minValue!3940 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4099 thiss!1504)) key!932)))))

(declare-fun b!217601 () Bool)

(assert (=> b!217601 (= e!141552 (and e!141550 mapRes!9690))))

(declare-fun condMapEmpty!9690 () Bool)

(declare-fun mapDefault!9690 () ValueCell!2499)

(assert (=> b!217601 (= condMapEmpty!9690 (= (arr!5026 (_values!4082 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2499)) mapDefault!9690)))))

(assert (= (and start!21674 res!106566) b!217599))

(assert (= (and b!217599 res!106567) b!217593))

(assert (= (and b!217593 res!106571) b!217600))

(assert (= (and b!217600 res!106568) b!217597))

(assert (= (and b!217597 res!106572) b!217594))

(assert (= (and b!217594 res!106570) b!217595))

(assert (= (and b!217595 res!106569) b!217596))

(assert (= (and b!217601 condMapEmpty!9690) mapIsEmpty!9690))

(assert (= (and b!217601 (not condMapEmpty!9690)) mapNonEmpty!9690))

(get-info :version)

(assert (= (and mapNonEmpty!9690 ((_ is ValueCellFull!2499) mapValue!9690)) b!217592))

(assert (= (and b!217601 ((_ is ValueCellFull!2499) mapDefault!9690)) b!217598))

(assert (= b!217591 b!217601))

(assert (= start!21674 b!217591))

(declare-fun m!243849 () Bool)

(assert (=> mapNonEmpty!9690 m!243849))

(declare-fun m!243851 () Bool)

(assert (=> b!217595 m!243851))

(declare-fun m!243853 () Bool)

(assert (=> b!217591 m!243853))

(declare-fun m!243855 () Bool)

(assert (=> b!217591 m!243855))

(declare-fun m!243857 () Bool)

(assert (=> b!217593 m!243857))

(declare-fun m!243859 () Bool)

(assert (=> b!217596 m!243859))

(declare-fun m!243861 () Bool)

(assert (=> b!217600 m!243861))

(assert (=> b!217600 m!243861))

(declare-fun m!243863 () Bool)

(assert (=> b!217600 m!243863))

(declare-fun m!243865 () Bool)

(assert (=> b!217597 m!243865))

(declare-fun m!243867 () Bool)

(assert (=> start!21674 m!243867))

(check-sat (not start!21674) b_and!12713 (not b!217595) tp_is_empty!5685 (not b!217600) (not b!217593) (not b!217591) (not mapNonEmpty!9690) (not b_next!5823) (not b!217597) (not b!217596))
(check-sat b_and!12713 (not b_next!5823))
