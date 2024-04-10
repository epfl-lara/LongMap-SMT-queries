; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21704 () Bool)

(assert start!21704)

(declare-fun b!218094 () Bool)

(declare-fun b_free!5853 () Bool)

(declare-fun b_next!5853 () Bool)

(assert (=> b!218094 (= b_free!5853 (not b_next!5853))))

(declare-fun tp!20694 () Bool)

(declare-fun b_and!12743 () Bool)

(assert (=> b!218094 (= tp!20694 b_and!12743)))

(declare-fun b!218086 () Bool)

(declare-fun res!106887 () Bool)

(declare-fun e!141865 () Bool)

(assert (=> b!218086 (=> (not res!106887) (not e!141865))))

(declare-datatypes ((V!7267 0))(
  ( (V!7268 (val!2902 Int)) )
))
(declare-datatypes ((ValueCell!2514 0))(
  ( (ValueCellFull!2514 (v!4920 V!7267)) (EmptyCell!2514) )
))
(declare-datatypes ((array!10669 0))(
  ( (array!10670 (arr!5056 (Array (_ BitVec 32) ValueCell!2514)) (size!5388 (_ BitVec 32))) )
))
(declare-datatypes ((array!10671 0))(
  ( (array!10672 (arr!5057 (Array (_ BitVec 32) (_ BitVec 64))) (size!5389 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2928 0))(
  ( (LongMapFixedSize!2929 (defaultEntry!4114 Int) (mask!9883 (_ BitVec 32)) (extraKeys!3851 (_ BitVec 32)) (zeroValue!3955 V!7267) (minValue!3955 V!7267) (_size!1513 (_ BitVec 32)) (_keys!6163 array!10671) (_values!4097 array!10669) (_vacant!1513 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2928)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!218086 (= res!106887 (validMask!0 (mask!9883 thiss!1504)))))

(declare-fun b!218087 () Bool)

(declare-fun res!106882 () Bool)

(assert (=> b!218087 (=> (not res!106882) (not e!141865))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10671 (_ BitVec 32)) Bool)

(assert (=> b!218087 (= res!106882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6163 thiss!1504) (mask!9883 thiss!1504)))))

(declare-fun b!218088 () Bool)

(assert (=> b!218088 (= e!141865 false)))

(declare-fun lt!111464 () Bool)

(declare-datatypes ((List!3218 0))(
  ( (Nil!3215) (Cons!3214 (h!3861 (_ BitVec 64)) (t!8173 List!3218)) )
))
(declare-fun arrayNoDuplicates!0 (array!10671 (_ BitVec 32) List!3218) Bool)

(assert (=> b!218088 (= lt!111464 (arrayNoDuplicates!0 (_keys!6163 thiss!1504) #b00000000000000000000000000000000 Nil!3215))))

(declare-fun b!218089 () Bool)

(declare-fun res!106885 () Bool)

(declare-fun e!141870 () Bool)

(assert (=> b!218089 (=> (not res!106885) (not e!141870))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!218089 (= res!106885 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!106881 () Bool)

(assert (=> start!21704 (=> (not res!106881) (not e!141870))))

(declare-fun valid!1187 (LongMapFixedSize!2928) Bool)

(assert (=> start!21704 (= res!106881 (valid!1187 thiss!1504))))

(assert (=> start!21704 e!141870))

(declare-fun e!141867 () Bool)

(assert (=> start!21704 e!141867))

(assert (=> start!21704 true))

(declare-fun b!218090 () Bool)

(declare-fun e!141871 () Bool)

(declare-fun tp_is_empty!5715 () Bool)

(assert (=> b!218090 (= e!141871 tp_is_empty!5715)))

(declare-fun b!218091 () Bool)

(declare-fun res!106884 () Bool)

(assert (=> b!218091 (=> (not res!106884) (not e!141865))))

(declare-datatypes ((tuple2!4312 0))(
  ( (tuple2!4313 (_1!2167 (_ BitVec 64)) (_2!2167 V!7267)) )
))
(declare-datatypes ((List!3219 0))(
  ( (Nil!3216) (Cons!3215 (h!3862 tuple2!4312) (t!8174 List!3219)) )
))
(declare-datatypes ((ListLongMap!3225 0))(
  ( (ListLongMap!3226 (toList!1628 List!3219)) )
))
(declare-fun contains!1469 (ListLongMap!3225 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1156 (array!10671 array!10669 (_ BitVec 32) (_ BitVec 32) V!7267 V!7267 (_ BitVec 32) Int) ListLongMap!3225)

(assert (=> b!218091 (= res!106884 (not (contains!1469 (getCurrentListMap!1156 (_keys!6163 thiss!1504) (_values!4097 thiss!1504) (mask!9883 thiss!1504) (extraKeys!3851 thiss!1504) (zeroValue!3955 thiss!1504) (minValue!3955 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4114 thiss!1504)) key!932)))))

(declare-fun b!218092 () Bool)

(assert (=> b!218092 (= e!141870 e!141865)))

(declare-fun res!106883 () Bool)

(assert (=> b!218092 (=> (not res!106883) (not e!141865))))

(declare-datatypes ((SeekEntryResult!780 0))(
  ( (MissingZero!780 (index!5290 (_ BitVec 32))) (Found!780 (index!5291 (_ BitVec 32))) (Intermediate!780 (undefined!1592 Bool) (index!5292 (_ BitVec 32)) (x!22804 (_ BitVec 32))) (Undefined!780) (MissingVacant!780 (index!5293 (_ BitVec 32))) )
))
(declare-fun lt!111465 () SeekEntryResult!780)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!218092 (= res!106883 (or (= lt!111465 (MissingZero!780 index!297)) (= lt!111465 (MissingVacant!780 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10671 (_ BitVec 32)) SeekEntryResult!780)

(assert (=> b!218092 (= lt!111465 (seekEntryOrOpen!0 key!932 (_keys!6163 thiss!1504) (mask!9883 thiss!1504)))))

(declare-fun b!218093 () Bool)

(declare-fun e!141868 () Bool)

(declare-fun e!141866 () Bool)

(declare-fun mapRes!9735 () Bool)

(assert (=> b!218093 (= e!141868 (and e!141866 mapRes!9735))))

(declare-fun condMapEmpty!9735 () Bool)

(declare-fun mapDefault!9735 () ValueCell!2514)

(assert (=> b!218093 (= condMapEmpty!9735 (= (arr!5056 (_values!4097 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2514)) mapDefault!9735)))))

(declare-fun array_inv!3349 (array!10671) Bool)

(declare-fun array_inv!3350 (array!10669) Bool)

(assert (=> b!218094 (= e!141867 (and tp!20694 tp_is_empty!5715 (array_inv!3349 (_keys!6163 thiss!1504)) (array_inv!3350 (_values!4097 thiss!1504)) e!141868))))

(declare-fun b!218095 () Bool)

(declare-fun res!106886 () Bool)

(assert (=> b!218095 (=> (not res!106886) (not e!141865))))

(assert (=> b!218095 (= res!106886 (and (= (size!5388 (_values!4097 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9883 thiss!1504))) (= (size!5389 (_keys!6163 thiss!1504)) (size!5388 (_values!4097 thiss!1504))) (bvsge (mask!9883 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3851 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3851 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!9735 () Bool)

(assert (=> mapIsEmpty!9735 mapRes!9735))

(declare-fun mapNonEmpty!9735 () Bool)

(declare-fun tp!20693 () Bool)

(assert (=> mapNonEmpty!9735 (= mapRes!9735 (and tp!20693 e!141871))))

(declare-fun mapRest!9735 () (Array (_ BitVec 32) ValueCell!2514))

(declare-fun mapValue!9735 () ValueCell!2514)

(declare-fun mapKey!9735 () (_ BitVec 32))

(assert (=> mapNonEmpty!9735 (= (arr!5056 (_values!4097 thiss!1504)) (store mapRest!9735 mapKey!9735 mapValue!9735))))

(declare-fun b!218096 () Bool)

(assert (=> b!218096 (= e!141866 tp_is_empty!5715)))

(assert (= (and start!21704 res!106881) b!218089))

(assert (= (and b!218089 res!106885) b!218092))

(assert (= (and b!218092 res!106883) b!218091))

(assert (= (and b!218091 res!106884) b!218086))

(assert (= (and b!218086 res!106887) b!218095))

(assert (= (and b!218095 res!106886) b!218087))

(assert (= (and b!218087 res!106882) b!218088))

(assert (= (and b!218093 condMapEmpty!9735) mapIsEmpty!9735))

(assert (= (and b!218093 (not condMapEmpty!9735)) mapNonEmpty!9735))

(get-info :version)

(assert (= (and mapNonEmpty!9735 ((_ is ValueCellFull!2514) mapValue!9735)) b!218090))

(assert (= (and b!218093 ((_ is ValueCellFull!2514) mapDefault!9735)) b!218096))

(assert (= b!218094 b!218093))

(assert (= start!21704 b!218094))

(declare-fun m!244149 () Bool)

(assert (=> start!21704 m!244149))

(declare-fun m!244151 () Bool)

(assert (=> b!218088 m!244151))

(declare-fun m!244153 () Bool)

(assert (=> b!218087 m!244153))

(declare-fun m!244155 () Bool)

(assert (=> b!218086 m!244155))

(declare-fun m!244157 () Bool)

(assert (=> b!218094 m!244157))

(declare-fun m!244159 () Bool)

(assert (=> b!218094 m!244159))

(declare-fun m!244161 () Bool)

(assert (=> b!218091 m!244161))

(assert (=> b!218091 m!244161))

(declare-fun m!244163 () Bool)

(assert (=> b!218091 m!244163))

(declare-fun m!244165 () Bool)

(assert (=> b!218092 m!244165))

(declare-fun m!244167 () Bool)

(assert (=> mapNonEmpty!9735 m!244167))

(check-sat (not b!218092) (not b!218086) (not b!218094) (not mapNonEmpty!9735) b_and!12743 (not b!218088) (not start!21704) (not b!218087) tp_is_empty!5715 (not b_next!5853) (not b!218091))
(check-sat b_and!12743 (not b_next!5853))
