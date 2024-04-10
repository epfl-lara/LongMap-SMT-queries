; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21684 () Bool)

(assert start!21684)

(declare-fun b!217766 () Bool)

(declare-fun b_free!5833 () Bool)

(declare-fun b_next!5833 () Bool)

(assert (=> b!217766 (= b_free!5833 (not b_next!5833))))

(declare-fun tp!20633 () Bool)

(declare-fun b_and!12723 () Bool)

(assert (=> b!217766 (= tp!20633 b_and!12723)))

(declare-fun b!217756 () Bool)

(declare-fun res!106672 () Bool)

(declare-fun e!141657 () Bool)

(assert (=> b!217756 (=> (not res!106672) (not e!141657))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!217756 (= res!106672 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217757 () Bool)

(declare-fun e!141658 () Bool)

(declare-fun tp_is_empty!5695 () Bool)

(assert (=> b!217757 (= e!141658 tp_is_empty!5695)))

(declare-fun b!217758 () Bool)

(declare-fun e!141660 () Bool)

(assert (=> b!217758 (= e!141657 e!141660)))

(declare-fun res!106677 () Bool)

(assert (=> b!217758 (=> (not res!106677) (not e!141660))))

(declare-datatypes ((SeekEntryResult!772 0))(
  ( (MissingZero!772 (index!5258 (_ BitVec 32))) (Found!772 (index!5259 (_ BitVec 32))) (Intermediate!772 (undefined!1584 Bool) (index!5260 (_ BitVec 32)) (x!22772 (_ BitVec 32))) (Undefined!772) (MissingVacant!772 (index!5261 (_ BitVec 32))) )
))
(declare-fun lt!111405 () SeekEntryResult!772)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217758 (= res!106677 (or (= lt!111405 (MissingZero!772 index!297)) (= lt!111405 (MissingVacant!772 index!297))))))

(declare-datatypes ((V!7241 0))(
  ( (V!7242 (val!2892 Int)) )
))
(declare-datatypes ((ValueCell!2504 0))(
  ( (ValueCellFull!2504 (v!4910 V!7241)) (EmptyCell!2504) )
))
(declare-datatypes ((array!10629 0))(
  ( (array!10630 (arr!5036 (Array (_ BitVec 32) ValueCell!2504)) (size!5368 (_ BitVec 32))) )
))
(declare-datatypes ((array!10631 0))(
  ( (array!10632 (arr!5037 (Array (_ BitVec 32) (_ BitVec 64))) (size!5369 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2908 0))(
  ( (LongMapFixedSize!2909 (defaultEntry!4104 Int) (mask!9867 (_ BitVec 32)) (extraKeys!3841 (_ BitVec 32)) (zeroValue!3945 V!7241) (minValue!3945 V!7241) (_size!1503 (_ BitVec 32)) (_keys!6153 array!10631) (_values!4087 array!10629) (_vacant!1503 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2908)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10631 (_ BitVec 32)) SeekEntryResult!772)

(assert (=> b!217758 (= lt!111405 (seekEntryOrOpen!0 key!932 (_keys!6153 thiss!1504) (mask!9867 thiss!1504)))))

(declare-fun res!106673 () Bool)

(assert (=> start!21684 (=> (not res!106673) (not e!141657))))

(declare-fun valid!1179 (LongMapFixedSize!2908) Bool)

(assert (=> start!21684 (= res!106673 (valid!1179 thiss!1504))))

(assert (=> start!21684 e!141657))

(declare-fun e!141656 () Bool)

(assert (=> start!21684 e!141656))

(assert (=> start!21684 true))

(declare-fun mapIsEmpty!9705 () Bool)

(declare-fun mapRes!9705 () Bool)

(assert (=> mapIsEmpty!9705 mapRes!9705))

(declare-fun b!217759 () Bool)

(declare-fun res!106675 () Bool)

(assert (=> b!217759 (=> (not res!106675) (not e!141660))))

(declare-datatypes ((tuple2!4296 0))(
  ( (tuple2!4297 (_1!2159 (_ BitVec 64)) (_2!2159 V!7241)) )
))
(declare-datatypes ((List!3201 0))(
  ( (Nil!3198) (Cons!3197 (h!3844 tuple2!4296) (t!8156 List!3201)) )
))
(declare-datatypes ((ListLongMap!3209 0))(
  ( (ListLongMap!3210 (toList!1620 List!3201)) )
))
(declare-fun contains!1461 (ListLongMap!3209 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1148 (array!10631 array!10629 (_ BitVec 32) (_ BitVec 32) V!7241 V!7241 (_ BitVec 32) Int) ListLongMap!3209)

(assert (=> b!217759 (= res!106675 (not (contains!1461 (getCurrentListMap!1148 (_keys!6153 thiss!1504) (_values!4087 thiss!1504) (mask!9867 thiss!1504) (extraKeys!3841 thiss!1504) (zeroValue!3945 thiss!1504) (minValue!3945 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4104 thiss!1504)) key!932)))))

(declare-fun b!217760 () Bool)

(declare-fun res!106671 () Bool)

(assert (=> b!217760 (=> (not res!106671) (not e!141660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217760 (= res!106671 (validMask!0 (mask!9867 thiss!1504)))))

(declare-fun b!217761 () Bool)

(declare-fun res!106676 () Bool)

(assert (=> b!217761 (=> (not res!106676) (not e!141660))))

(assert (=> b!217761 (= res!106676 (and (= (size!5368 (_values!4087 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9867 thiss!1504))) (= (size!5369 (_keys!6153 thiss!1504)) (size!5368 (_values!4087 thiss!1504))) (bvsge (mask!9867 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3841 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3841 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!9705 () Bool)

(declare-fun tp!20634 () Bool)

(declare-fun e!141659 () Bool)

(assert (=> mapNonEmpty!9705 (= mapRes!9705 (and tp!20634 e!141659))))

(declare-fun mapKey!9705 () (_ BitVec 32))

(declare-fun mapValue!9705 () ValueCell!2504)

(declare-fun mapRest!9705 () (Array (_ BitVec 32) ValueCell!2504))

(assert (=> mapNonEmpty!9705 (= (arr!5036 (_values!4087 thiss!1504)) (store mapRest!9705 mapKey!9705 mapValue!9705))))

(declare-fun b!217762 () Bool)

(assert (=> b!217762 (= e!141659 tp_is_empty!5695)))

(declare-fun b!217763 () Bool)

(declare-fun res!106674 () Bool)

(assert (=> b!217763 (=> (not res!106674) (not e!141660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10631 (_ BitVec 32)) Bool)

(assert (=> b!217763 (= res!106674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6153 thiss!1504) (mask!9867 thiss!1504)))))

(declare-fun b!217764 () Bool)

(assert (=> b!217764 (= e!141660 false)))

(declare-fun lt!111404 () Bool)

(declare-datatypes ((List!3202 0))(
  ( (Nil!3199) (Cons!3198 (h!3845 (_ BitVec 64)) (t!8157 List!3202)) )
))
(declare-fun arrayNoDuplicates!0 (array!10631 (_ BitVec 32) List!3202) Bool)

(assert (=> b!217764 (= lt!111404 (arrayNoDuplicates!0 (_keys!6153 thiss!1504) #b00000000000000000000000000000000 Nil!3199))))

(declare-fun b!217765 () Bool)

(declare-fun e!141655 () Bool)

(assert (=> b!217765 (= e!141655 (and e!141658 mapRes!9705))))

(declare-fun condMapEmpty!9705 () Bool)

(declare-fun mapDefault!9705 () ValueCell!2504)

