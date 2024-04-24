; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21646 () Bool)

(assert start!21646)

(declare-fun b!217117 () Bool)

(declare-fun b_free!5791 () Bool)

(declare-fun b_next!5791 () Bool)

(assert (=> b!217117 (= b_free!5791 (not b_next!5791))))

(declare-fun tp!20507 () Bool)

(declare-fun b_and!12695 () Bool)

(assert (=> b!217117 (= tp!20507 b_and!12695)))

(declare-fun b!217111 () Bool)

(declare-fun res!106257 () Bool)

(declare-fun e!141243 () Bool)

(assert (=> b!217111 (=> (not res!106257) (not e!141243))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!217111 (= res!106257 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217112 () Bool)

(declare-fun e!141239 () Bool)

(assert (=> b!217112 (= e!141243 e!141239)))

(declare-fun res!106255 () Bool)

(assert (=> b!217112 (=> (not res!106255) (not e!141239))))

(declare-datatypes ((SeekEntryResult!740 0))(
  ( (MissingZero!740 (index!5130 (_ BitVec 32))) (Found!740 (index!5131 (_ BitVec 32))) (Intermediate!740 (undefined!1552 Bool) (index!5132 (_ BitVec 32)) (x!22684 (_ BitVec 32))) (Undefined!740) (MissingVacant!740 (index!5133 (_ BitVec 32))) )
))
(declare-fun lt!111338 () SeekEntryResult!740)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217112 (= res!106255 (or (= lt!111338 (MissingZero!740 index!297)) (= lt!111338 (MissingVacant!740 index!297))))))

(declare-datatypes ((V!7185 0))(
  ( (V!7186 (val!2871 Int)) )
))
(declare-datatypes ((ValueCell!2483 0))(
  ( (ValueCellFull!2483 (v!4890 V!7185)) (EmptyCell!2483) )
))
(declare-datatypes ((array!10543 0))(
  ( (array!10544 (arr!4993 (Array (_ BitVec 32) ValueCell!2483)) (size!5325 (_ BitVec 32))) )
))
(declare-datatypes ((array!10545 0))(
  ( (array!10546 (arr!4994 (Array (_ BitVec 32) (_ BitVec 64))) (size!5326 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2866 0))(
  ( (LongMapFixedSize!2867 (defaultEntry!4083 Int) (mask!9832 (_ BitVec 32)) (extraKeys!3820 (_ BitVec 32)) (zeroValue!3924 V!7185) (minValue!3924 V!7185) (_size!1482 (_ BitVec 32)) (_keys!6132 array!10545) (_values!4066 array!10543) (_vacant!1482 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2866)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10545 (_ BitVec 32)) SeekEntryResult!740)

(assert (=> b!217112 (= lt!111338 (seekEntryOrOpen!0 key!932 (_keys!6132 thiss!1504) (mask!9832 thiss!1504)))))

(declare-fun b!217113 () Bool)

(declare-fun res!106253 () Bool)

(assert (=> b!217113 (=> (not res!106253) (not e!141239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10545 (_ BitVec 32)) Bool)

(assert (=> b!217113 (= res!106253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6132 thiss!1504) (mask!9832 thiss!1504)))))

(declare-fun b!217114 () Bool)

(declare-fun e!141238 () Bool)

(declare-fun tp_is_empty!5653 () Bool)

(assert (=> b!217114 (= e!141238 tp_is_empty!5653)))

(declare-fun mapNonEmpty!9642 () Bool)

(declare-fun mapRes!9642 () Bool)

(declare-fun tp!20508 () Bool)

(assert (=> mapNonEmpty!9642 (= mapRes!9642 (and tp!20508 e!141238))))

(declare-fun mapValue!9642 () ValueCell!2483)

(declare-fun mapRest!9642 () (Array (_ BitVec 32) ValueCell!2483))

(declare-fun mapKey!9642 () (_ BitVec 32))

(assert (=> mapNonEmpty!9642 (= (arr!4993 (_values!4066 thiss!1504)) (store mapRest!9642 mapKey!9642 mapValue!9642))))

(declare-fun b!217115 () Bool)

(declare-fun res!106251 () Bool)

(assert (=> b!217115 (=> (not res!106251) (not e!141239))))

(assert (=> b!217115 (= res!106251 (and (= (size!5325 (_values!4066 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9832 thiss!1504))) (= (size!5326 (_keys!6132 thiss!1504)) (size!5325 (_values!4066 thiss!1504))) (bvsge (mask!9832 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3820 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3820 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!217110 () Bool)

(declare-fun res!106254 () Bool)

(assert (=> b!217110 (=> (not res!106254) (not e!141239))))

(declare-datatypes ((tuple2!4192 0))(
  ( (tuple2!4193 (_1!2107 (_ BitVec 64)) (_2!2107 V!7185)) )
))
(declare-datatypes ((List!3093 0))(
  ( (Nil!3090) (Cons!3089 (h!3736 tuple2!4192) (t!8040 List!3093)) )
))
(declare-datatypes ((ListLongMap!3107 0))(
  ( (ListLongMap!3108 (toList!1569 List!3093)) )
))
(declare-fun contains!1424 (ListLongMap!3107 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1101 (array!10545 array!10543 (_ BitVec 32) (_ BitVec 32) V!7185 V!7185 (_ BitVec 32) Int) ListLongMap!3107)

(assert (=> b!217110 (= res!106254 (contains!1424 (getCurrentListMap!1101 (_keys!6132 thiss!1504) (_values!4066 thiss!1504) (mask!9832 thiss!1504) (extraKeys!3820 thiss!1504) (zeroValue!3924 thiss!1504) (minValue!3924 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4083 thiss!1504)) key!932))))

(declare-fun res!106256 () Bool)

(assert (=> start!21646 (=> (not res!106256) (not e!141243))))

(declare-fun valid!1181 (LongMapFixedSize!2866) Bool)

(assert (=> start!21646 (= res!106256 (valid!1181 thiss!1504))))

(assert (=> start!21646 e!141243))

(declare-fun e!141244 () Bool)

(assert (=> start!21646 e!141244))

(assert (=> start!21646 true))

(declare-fun b!217116 () Bool)

(declare-fun e!141240 () Bool)

(declare-fun e!141241 () Bool)

(assert (=> b!217116 (= e!141240 (and e!141241 mapRes!9642))))

(declare-fun condMapEmpty!9642 () Bool)

(declare-fun mapDefault!9642 () ValueCell!2483)

(assert (=> b!217116 (= condMapEmpty!9642 (= (arr!4993 (_values!4066 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2483)) mapDefault!9642)))))

(declare-fun array_inv!3277 (array!10545) Bool)

(declare-fun array_inv!3278 (array!10543) Bool)

(assert (=> b!217117 (= e!141244 (and tp!20507 tp_is_empty!5653 (array_inv!3277 (_keys!6132 thiss!1504)) (array_inv!3278 (_values!4066 thiss!1504)) e!141240))))

(declare-fun mapIsEmpty!9642 () Bool)

(assert (=> mapIsEmpty!9642 mapRes!9642))

(declare-fun b!217118 () Bool)

(declare-fun res!106252 () Bool)

(assert (=> b!217118 (=> (not res!106252) (not e!141239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217118 (= res!106252 (validMask!0 (mask!9832 thiss!1504)))))

(declare-fun b!217119 () Bool)

(assert (=> b!217119 (= e!141241 tp_is_empty!5653)))

(declare-fun b!217120 () Bool)

(assert (=> b!217120 (= e!141239 false)))

(declare-fun lt!111337 () Bool)

(declare-datatypes ((List!3094 0))(
  ( (Nil!3091) (Cons!3090 (h!3737 (_ BitVec 64)) (t!8041 List!3094)) )
))
(declare-fun arrayNoDuplicates!0 (array!10545 (_ BitVec 32) List!3094) Bool)

(assert (=> b!217120 (= lt!111337 (arrayNoDuplicates!0 (_keys!6132 thiss!1504) #b00000000000000000000000000000000 Nil!3091))))

(assert (= (and start!21646 res!106256) b!217111))

(assert (= (and b!217111 res!106257) b!217112))

(assert (= (and b!217112 res!106255) b!217110))

(assert (= (and b!217110 res!106254) b!217118))

(assert (= (and b!217118 res!106252) b!217115))

(assert (= (and b!217115 res!106251) b!217113))

(assert (= (and b!217113 res!106253) b!217120))

(assert (= (and b!217116 condMapEmpty!9642) mapIsEmpty!9642))

(assert (= (and b!217116 (not condMapEmpty!9642)) mapNonEmpty!9642))

(get-info :version)

(assert (= (and mapNonEmpty!9642 ((_ is ValueCellFull!2483) mapValue!9642)) b!217114))

(assert (= (and b!217116 ((_ is ValueCellFull!2483) mapDefault!9642)) b!217119))

(assert (= b!217117 b!217116))

(assert (= start!21646 b!217117))

(declare-fun m!243711 () Bool)

(assert (=> b!217118 m!243711))

(declare-fun m!243713 () Bool)

(assert (=> b!217110 m!243713))

(assert (=> b!217110 m!243713))

(declare-fun m!243715 () Bool)

(assert (=> b!217110 m!243715))

(declare-fun m!243717 () Bool)

(assert (=> b!217112 m!243717))

(declare-fun m!243719 () Bool)

(assert (=> start!21646 m!243719))

(declare-fun m!243721 () Bool)

(assert (=> b!217117 m!243721))

(declare-fun m!243723 () Bool)

(assert (=> b!217117 m!243723))

(declare-fun m!243725 () Bool)

(assert (=> b!217120 m!243725))

(declare-fun m!243727 () Bool)

(assert (=> mapNonEmpty!9642 m!243727))

(declare-fun m!243729 () Bool)

(assert (=> b!217113 m!243729))

(check-sat (not b!217110) tp_is_empty!5653 b_and!12695 (not b!217112) (not b_next!5791) (not b!217120) (not start!21646) (not b!217118) (not mapNonEmpty!9642) (not b!217117) (not b!217113))
(check-sat b_and!12695 (not b_next!5791))
