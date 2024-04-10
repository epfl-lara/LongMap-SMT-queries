; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15752 () Bool)

(assert start!15752)

(declare-fun b!157204 () Bool)

(declare-fun b_free!3419 () Bool)

(declare-fun b_next!3419 () Bool)

(assert (=> b!157204 (= b_free!3419 (not b_next!3419))))

(declare-fun tp!12781 () Bool)

(declare-fun b_and!9833 () Bool)

(assert (=> b!157204 (= tp!12781 b_and!9833)))

(declare-fun b!157202 () Bool)

(declare-fun e!102882 () Bool)

(declare-fun e!102885 () Bool)

(assert (=> b!157202 (= e!102882 (not e!102885))))

(declare-fun res!74313 () Bool)

(assert (=> b!157202 (=> res!74313 e!102885)))

(declare-datatypes ((V!3941 0))(
  ( (V!3942 (val!1655 Int)) )
))
(declare-datatypes ((ValueCell!1267 0))(
  ( (ValueCellFull!1267 (v!3520 V!3941)) (EmptyCell!1267) )
))
(declare-datatypes ((array!5495 0))(
  ( (array!5496 (arr!2605 (Array (_ BitVec 32) (_ BitVec 64))) (size!2883 (_ BitVec 32))) )
))
(declare-datatypes ((array!5497 0))(
  ( (array!5498 (arr!2606 (Array (_ BitVec 32) ValueCell!1267)) (size!2884 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1442 0))(
  ( (LongMapFixedSize!1443 (defaultEntry!3163 Int) (mask!7634 (_ BitVec 32)) (extraKeys!2904 (_ BitVec 32)) (zeroValue!3006 V!3941) (minValue!3006 V!3941) (_size!770 (_ BitVec 32)) (_keys!4938 array!5495) (_values!3146 array!5497) (_vacant!770 (_ BitVec 32))) )
))
(declare-fun lt!81686 () LongMapFixedSize!1442)

(declare-fun valid!687 (LongMapFixedSize!1442) Bool)

(assert (=> b!157202 (= res!74313 (not (valid!687 lt!81686)))))

(declare-fun thiss!1248 () LongMapFixedSize!1442)

(declare-fun v!309 () V!3941)

(assert (=> b!157202 (= lt!81686 (LongMapFixedSize!1443 (defaultEntry!3163 thiss!1248) (mask!7634 thiss!1248) (bvor (extraKeys!2904 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3006 thiss!1248) v!309 (_size!770 thiss!1248) (_keys!4938 thiss!1248) (_values!3146 thiss!1248) (_vacant!770 thiss!1248)))))

(declare-datatypes ((tuple2!2870 0))(
  ( (tuple2!2871 (_1!1446 (_ BitVec 64)) (_2!1446 V!3941)) )
))
(declare-datatypes ((List!1877 0))(
  ( (Nil!1874) (Cons!1873 (h!2482 tuple2!2870) (t!6679 List!1877)) )
))
(declare-datatypes ((ListLongMap!1857 0))(
  ( (ListLongMap!1858 (toList!944 List!1877)) )
))
(declare-fun +!212 (ListLongMap!1857 tuple2!2870) ListLongMap!1857)

(declare-fun getCurrentListMap!608 (array!5495 array!5497 (_ BitVec 32) (_ BitVec 32) V!3941 V!3941 (_ BitVec 32) Int) ListLongMap!1857)

(assert (=> b!157202 (= (+!212 (getCurrentListMap!608 (_keys!4938 thiss!1248) (_values!3146 thiss!1248) (mask!7634 thiss!1248) (extraKeys!2904 thiss!1248) (zeroValue!3006 thiss!1248) (minValue!3006 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3163 thiss!1248)) (tuple2!2871 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!608 (_keys!4938 thiss!1248) (_values!3146 thiss!1248) (mask!7634 thiss!1248) (bvor (extraKeys!2904 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3006 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3163 thiss!1248)))))

(declare-datatypes ((Unit!4968 0))(
  ( (Unit!4969) )
))
(declare-fun lt!81687 () Unit!4968)

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!80 (array!5495 array!5497 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3941 V!3941 V!3941 Int) Unit!4968)

(assert (=> b!157202 (= lt!81687 (lemmaChangeLongMinValueKeyThenAddPairToListMap!80 (_keys!4938 thiss!1248) (_values!3146 thiss!1248) (mask!7634 thiss!1248) (extraKeys!2904 thiss!1248) (bvor (extraKeys!2904 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3006 thiss!1248) (minValue!3006 thiss!1248) v!309 (defaultEntry!3163 thiss!1248)))))

(declare-fun b!157203 () Bool)

(declare-fun e!102879 () Bool)

(declare-fun tp_is_empty!3221 () Bool)

(assert (=> b!157203 (= e!102879 tp_is_empty!3221)))

(declare-fun e!102883 () Bool)

(declare-fun e!102881 () Bool)

(declare-fun array_inv!1651 (array!5495) Bool)

(declare-fun array_inv!1652 (array!5497) Bool)

(assert (=> b!157204 (= e!102883 (and tp!12781 tp_is_empty!3221 (array_inv!1651 (_keys!4938 thiss!1248)) (array_inv!1652 (_values!3146 thiss!1248)) e!102881))))

(declare-fun b!157205 () Bool)

(declare-fun res!74312 () Bool)

(assert (=> b!157205 (=> (not res!74312) (not e!102882))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157205 (= res!74312 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!5474 () Bool)

(declare-fun mapRes!5474 () Bool)

(assert (=> mapIsEmpty!5474 mapRes!5474))

(declare-fun b!157207 () Bool)

(assert (=> b!157207 (= e!102881 (and e!102879 mapRes!5474))))

(declare-fun condMapEmpty!5474 () Bool)

(declare-fun mapDefault!5474 () ValueCell!1267)

