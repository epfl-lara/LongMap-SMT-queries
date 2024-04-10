; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75900 () Bool)

(assert start!75900)

(declare-fun b!893031 () Bool)

(declare-fun b_free!15835 () Bool)

(declare-fun b_next!15835 () Bool)

(assert (=> b!893031 (= b_free!15835 (not b_next!15835))))

(declare-fun tp!55477 () Bool)

(declare-fun b_and!26097 () Bool)

(assert (=> b!893031 (= tp!55477 b_and!26097)))

(declare-fun res!604857 () Bool)

(declare-fun e!498631 () Bool)

(assert (=> start!75900 (=> (not res!604857) (not e!498631))))

(declare-datatypes ((array!52308 0))(
  ( (array!52309 (arr!25159 (Array (_ BitVec 32) (_ BitVec 64))) (size!25603 (_ BitVec 32))) )
))
(declare-datatypes ((V!29183 0))(
  ( (V!29184 (val!9132 Int)) )
))
(declare-datatypes ((ValueCell!8600 0))(
  ( (ValueCellFull!8600 (v!11611 V!29183)) (EmptyCell!8600) )
))
(declare-datatypes ((array!52310 0))(
  ( (array!52311 (arr!25160 (Array (_ BitVec 32) ValueCell!8600)) (size!25604 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4216 0))(
  ( (LongMapFixedSize!4217 (defaultEntry!5308 Int) (mask!25830 (_ BitVec 32)) (extraKeys!5003 (_ BitVec 32)) (zeroValue!5107 V!29183) (minValue!5107 V!29183) (_size!2163 (_ BitVec 32)) (_keys!9993 array!52308) (_values!5294 array!52310) (_vacant!2163 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4216)

(declare-fun valid!1629 (LongMapFixedSize!4216) Bool)

(assert (=> start!75900 (= res!604857 (valid!1629 thiss!1181))))

(assert (=> start!75900 e!498631))

(declare-fun e!498635 () Bool)

(assert (=> start!75900 e!498635))

(assert (=> start!75900 true))

(declare-fun mapIsEmpty!28802 () Bool)

(declare-fun mapRes!28802 () Bool)

(assert (=> mapIsEmpty!28802 mapRes!28802))

(declare-fun b!893030 () Bool)

(assert (=> b!893030 (= e!498631 (not true))))

(declare-fun e!498630 () Bool)

(assert (=> b!893030 e!498630))

(declare-fun res!604859 () Bool)

(assert (=> b!893030 (=> res!604859 e!498630)))

(declare-datatypes ((SeekEntryResult!8856 0))(
  ( (MissingZero!8856 (index!37795 (_ BitVec 32))) (Found!8856 (index!37796 (_ BitVec 32))) (Intermediate!8856 (undefined!9668 Bool) (index!37797 (_ BitVec 32)) (x!75908 (_ BitVec 32))) (Undefined!8856) (MissingVacant!8856 (index!37798 (_ BitVec 32))) )
))
(declare-fun lt!403507 () SeekEntryResult!8856)

(assert (=> b!893030 (= res!604859 (not (is-Found!8856 lt!403507)))))

(declare-datatypes ((Unit!30410 0))(
  ( (Unit!30411) )
))
(declare-fun lt!403506 () Unit!30410)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!55 (array!52308 array!52310 (_ BitVec 32) (_ BitVec 32) V!29183 V!29183 (_ BitVec 64)) Unit!30410)

(assert (=> b!893030 (= lt!403506 (lemmaSeekEntryGivesInRangeIndex!55 (_keys!9993 thiss!1181) (_values!5294 thiss!1181) (mask!25830 thiss!1181) (extraKeys!5003 thiss!1181) (zeroValue!5107 thiss!1181) (minValue!5107 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52308 (_ BitVec 32)) SeekEntryResult!8856)

(assert (=> b!893030 (= lt!403507 (seekEntry!0 key!785 (_keys!9993 thiss!1181) (mask!25830 thiss!1181)))))

(declare-fun tp_is_empty!18163 () Bool)

(declare-fun e!498634 () Bool)

(declare-fun array_inv!19758 (array!52308) Bool)

(declare-fun array_inv!19759 (array!52310) Bool)

(assert (=> b!893031 (= e!498635 (and tp!55477 tp_is_empty!18163 (array_inv!19758 (_keys!9993 thiss!1181)) (array_inv!19759 (_values!5294 thiss!1181)) e!498634))))

(declare-fun b!893032 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!893032 (= e!498630 (inRange!0 (index!37796 lt!403507) (mask!25830 thiss!1181)))))

(declare-fun b!893033 () Bool)

(declare-fun e!498633 () Bool)

(assert (=> b!893033 (= e!498633 tp_is_empty!18163)))

(declare-fun b!893034 () Bool)

(declare-fun res!604858 () Bool)

(assert (=> b!893034 (=> (not res!604858) (not e!498631))))

(assert (=> b!893034 (= res!604858 (not (= key!785 (bvneg key!785))))))

(declare-fun b!893035 () Bool)

(declare-fun e!498636 () Bool)

(assert (=> b!893035 (= e!498636 tp_is_empty!18163)))

(declare-fun b!893036 () Bool)

(assert (=> b!893036 (= e!498634 (and e!498633 mapRes!28802))))

(declare-fun condMapEmpty!28802 () Bool)

(declare-fun mapDefault!28802 () ValueCell!8600)

