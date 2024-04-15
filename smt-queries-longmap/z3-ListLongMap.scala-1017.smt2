; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21706 () Bool)

(assert start!21706)

(declare-fun b!217908 () Bool)

(declare-fun b_free!5851 () Bool)

(declare-fun b_next!5851 () Bool)

(assert (=> b!217908 (= b_free!5851 (not b_next!5851))))

(declare-fun tp!20688 () Bool)

(declare-fun b_and!12715 () Bool)

(assert (=> b!217908 (= tp!20688 b_and!12715)))

(declare-fun b!217907 () Bool)

(declare-fun e!141744 () Bool)

(assert (=> b!217907 (= e!141744 false)))

(declare-fun lt!111277 () Bool)

(declare-datatypes ((V!7265 0))(
  ( (V!7266 (val!2901 Int)) )
))
(declare-datatypes ((ValueCell!2513 0))(
  ( (ValueCellFull!2513 (v!4913 V!7265)) (EmptyCell!2513) )
))
(declare-datatypes ((array!10657 0))(
  ( (array!10658 (arr!5049 (Array (_ BitVec 32) ValueCell!2513)) (size!5382 (_ BitVec 32))) )
))
(declare-datatypes ((array!10659 0))(
  ( (array!10660 (arr!5050 (Array (_ BitVec 32) (_ BitVec 64))) (size!5383 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2926 0))(
  ( (LongMapFixedSize!2927 (defaultEntry!4113 Int) (mask!9881 (_ BitVec 32)) (extraKeys!3850 (_ BitVec 32)) (zeroValue!3954 V!7265) (minValue!3954 V!7265) (_size!1512 (_ BitVec 32)) (_keys!6161 array!10659) (_values!4096 array!10657) (_vacant!1512 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2926)

(declare-datatypes ((List!3199 0))(
  ( (Nil!3196) (Cons!3195 (h!3842 (_ BitVec 64)) (t!8145 List!3199)) )
))
(declare-fun arrayNoDuplicates!0 (array!10659 (_ BitVec 32) List!3199) Bool)

(assert (=> b!217907 (= lt!111277 (arrayNoDuplicates!0 (_keys!6161 thiss!1504) #b00000000000000000000000000000000 Nil!3196))))

(declare-fun mapNonEmpty!9732 () Bool)

(declare-fun mapRes!9732 () Bool)

(declare-fun tp!20687 () Bool)

(declare-fun e!141747 () Bool)

(assert (=> mapNonEmpty!9732 (= mapRes!9732 (and tp!20687 e!141747))))

(declare-fun mapRest!9732 () (Array (_ BitVec 32) ValueCell!2513))

(declare-fun mapKey!9732 () (_ BitVec 32))

(declare-fun mapValue!9732 () ValueCell!2513)

(assert (=> mapNonEmpty!9732 (= (arr!5049 (_values!4096 thiss!1504)) (store mapRest!9732 mapKey!9732 mapValue!9732))))

(declare-fun e!141745 () Bool)

(declare-fun e!141743 () Bool)

(declare-fun tp_is_empty!5713 () Bool)

(declare-fun array_inv!3327 (array!10659) Bool)

(declare-fun array_inv!3328 (array!10657) Bool)

(assert (=> b!217908 (= e!141745 (and tp!20688 tp_is_empty!5713 (array_inv!3327 (_keys!6161 thiss!1504)) (array_inv!3328 (_values!4096 thiss!1504)) e!141743))))

(declare-fun b!217909 () Bool)

(declare-fun e!141749 () Bool)

(assert (=> b!217909 (= e!141743 (and e!141749 mapRes!9732))))

(declare-fun condMapEmpty!9732 () Bool)

(declare-fun mapDefault!9732 () ValueCell!2513)

(assert (=> b!217909 (= condMapEmpty!9732 (= (arr!5049 (_values!4096 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2513)) mapDefault!9732)))))

(declare-fun b!217910 () Bool)

(declare-fun res!106769 () Bool)

(assert (=> b!217910 (=> (not res!106769) (not e!141744))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217910 (= res!106769 (validMask!0 (mask!9881 thiss!1504)))))

(declare-fun mapIsEmpty!9732 () Bool)

(assert (=> mapIsEmpty!9732 mapRes!9732))

(declare-fun b!217911 () Bool)

(declare-fun res!106767 () Bool)

(declare-fun e!141746 () Bool)

(assert (=> b!217911 (=> (not res!106767) (not e!141746))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!217911 (= res!106767 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217912 () Bool)

(assert (=> b!217912 (= e!141749 tp_is_empty!5713)))

(declare-fun b!217913 () Bool)

(declare-fun res!106771 () Bool)

(assert (=> b!217913 (=> (not res!106771) (not e!141744))))

(declare-datatypes ((tuple2!4276 0))(
  ( (tuple2!4277 (_1!2149 (_ BitVec 64)) (_2!2149 V!7265)) )
))
(declare-datatypes ((List!3200 0))(
  ( (Nil!3197) (Cons!3196 (h!3843 tuple2!4276) (t!8146 List!3200)) )
))
(declare-datatypes ((ListLongMap!3179 0))(
  ( (ListLongMap!3180 (toList!1605 List!3200)) )
))
(declare-fun contains!1446 (ListLongMap!3179 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1114 (array!10659 array!10657 (_ BitVec 32) (_ BitVec 32) V!7265 V!7265 (_ BitVec 32) Int) ListLongMap!3179)

(assert (=> b!217913 (= res!106771 (not (contains!1446 (getCurrentListMap!1114 (_keys!6161 thiss!1504) (_values!4096 thiss!1504) (mask!9881 thiss!1504) (extraKeys!3850 thiss!1504) (zeroValue!3954 thiss!1504) (minValue!3954 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4113 thiss!1504)) key!932)))))

(declare-fun b!217914 () Bool)

(assert (=> b!217914 (= e!141746 e!141744)))

(declare-fun res!106768 () Bool)

(assert (=> b!217914 (=> (not res!106768) (not e!141744))))

(declare-datatypes ((SeekEntryResult!777 0))(
  ( (MissingZero!777 (index!5278 (_ BitVec 32))) (Found!777 (index!5279 (_ BitVec 32))) (Intermediate!777 (undefined!1589 Bool) (index!5280 (_ BitVec 32)) (x!22800 (_ BitVec 32))) (Undefined!777) (MissingVacant!777 (index!5281 (_ BitVec 32))) )
))
(declare-fun lt!111278 () SeekEntryResult!777)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217914 (= res!106768 (or (= lt!111278 (MissingZero!777 index!297)) (= lt!111278 (MissingVacant!777 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10659 (_ BitVec 32)) SeekEntryResult!777)

(assert (=> b!217914 (= lt!111278 (seekEntryOrOpen!0 key!932 (_keys!6161 thiss!1504) (mask!9881 thiss!1504)))))

(declare-fun res!106765 () Bool)

(assert (=> start!21706 (=> (not res!106765) (not e!141746))))

(declare-fun valid!1202 (LongMapFixedSize!2926) Bool)

(assert (=> start!21706 (= res!106765 (valid!1202 thiss!1504))))

(assert (=> start!21706 e!141746))

(assert (=> start!21706 e!141745))

(assert (=> start!21706 true))

(declare-fun b!217906 () Bool)

(declare-fun res!106770 () Bool)

(assert (=> b!217906 (=> (not res!106770) (not e!141744))))

(assert (=> b!217906 (= res!106770 (and (= (size!5382 (_values!4096 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9881 thiss!1504))) (= (size!5383 (_keys!6161 thiss!1504)) (size!5382 (_values!4096 thiss!1504))) (bvsge (mask!9881 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3850 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3850 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!217915 () Bool)

(assert (=> b!217915 (= e!141747 tp_is_empty!5713)))

(declare-fun b!217916 () Bool)

(declare-fun res!106766 () Bool)

(assert (=> b!217916 (=> (not res!106766) (not e!141744))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10659 (_ BitVec 32)) Bool)

(assert (=> b!217916 (= res!106766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6161 thiss!1504) (mask!9881 thiss!1504)))))

(assert (= (and start!21706 res!106765) b!217911))

(assert (= (and b!217911 res!106767) b!217914))

(assert (= (and b!217914 res!106768) b!217913))

(assert (= (and b!217913 res!106771) b!217910))

(assert (= (and b!217910 res!106769) b!217906))

(assert (= (and b!217906 res!106770) b!217916))

(assert (= (and b!217916 res!106766) b!217907))

(assert (= (and b!217909 condMapEmpty!9732) mapIsEmpty!9732))

(assert (= (and b!217909 (not condMapEmpty!9732)) mapNonEmpty!9732))

(get-info :version)

(assert (= (and mapNonEmpty!9732 ((_ is ValueCellFull!2513) mapValue!9732)) b!217915))

(assert (= (and b!217909 ((_ is ValueCellFull!2513) mapDefault!9732)) b!217912))

(assert (= b!217908 b!217909))

(assert (= start!21706 b!217908))

(declare-fun m!243513 () Bool)

(assert (=> b!217907 m!243513))

(declare-fun m!243515 () Bool)

(assert (=> b!217910 m!243515))

(declare-fun m!243517 () Bool)

(assert (=> b!217914 m!243517))

(declare-fun m!243519 () Bool)

(assert (=> b!217908 m!243519))

(declare-fun m!243521 () Bool)

(assert (=> b!217908 m!243521))

(declare-fun m!243523 () Bool)

(assert (=> b!217913 m!243523))

(assert (=> b!217913 m!243523))

(declare-fun m!243525 () Bool)

(assert (=> b!217913 m!243525))

(declare-fun m!243527 () Bool)

(assert (=> mapNonEmpty!9732 m!243527))

(declare-fun m!243529 () Bool)

(assert (=> start!21706 m!243529))

(declare-fun m!243531 () Bool)

(assert (=> b!217916 m!243531))

(check-sat (not b_next!5851) (not b!217914) (not start!21706) (not b!217913) tp_is_empty!5713 b_and!12715 (not b!217908) (not b!217907) (not mapNonEmpty!9732) (not b!217916) (not b!217910))
(check-sat b_and!12715 (not b_next!5851))
