; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15748 () Bool)

(assert start!15748)

(declare-fun b!157166 () Bool)

(declare-fun b_free!3415 () Bool)

(declare-fun b_next!3415 () Bool)

(assert (=> b!157166 (= b_free!3415 (not b_next!3415))))

(declare-fun tp!12769 () Bool)

(declare-fun b_and!9829 () Bool)

(assert (=> b!157166 (= tp!12769 b_and!9829)))

(declare-fun b!157160 () Bool)

(declare-fun e!102838 () Bool)

(declare-fun tp_is_empty!3217 () Bool)

(assert (=> b!157160 (= e!102838 tp_is_empty!3217)))

(declare-fun b!157161 () Bool)

(declare-fun e!102837 () Bool)

(declare-fun e!102843 () Bool)

(assert (=> b!157161 (= e!102837 (not e!102843))))

(declare-fun res!74295 () Bool)

(assert (=> b!157161 (=> res!74295 e!102843)))

(declare-datatypes ((V!3937 0))(
  ( (V!3938 (val!1653 Int)) )
))
(declare-datatypes ((ValueCell!1265 0))(
  ( (ValueCellFull!1265 (v!3518 V!3937)) (EmptyCell!1265) )
))
(declare-datatypes ((array!5487 0))(
  ( (array!5488 (arr!2601 (Array (_ BitVec 32) (_ BitVec 64))) (size!2879 (_ BitVec 32))) )
))
(declare-datatypes ((array!5489 0))(
  ( (array!5490 (arr!2602 (Array (_ BitVec 32) ValueCell!1265)) (size!2880 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1438 0))(
  ( (LongMapFixedSize!1439 (defaultEntry!3161 Int) (mask!7632 (_ BitVec 32)) (extraKeys!2902 (_ BitVec 32)) (zeroValue!3004 V!3937) (minValue!3004 V!3937) (_size!768 (_ BitVec 32)) (_keys!4936 array!5487) (_values!3144 array!5489) (_vacant!768 (_ BitVec 32))) )
))
(declare-fun lt!81670 () LongMapFixedSize!1438)

(declare-fun valid!685 (LongMapFixedSize!1438) Bool)

(assert (=> b!157161 (= res!74295 (not (valid!685 lt!81670)))))

(declare-fun thiss!1248 () LongMapFixedSize!1438)

(declare-fun v!309 () V!3937)

(assert (=> b!157161 (= lt!81670 (LongMapFixedSize!1439 (defaultEntry!3161 thiss!1248) (mask!7632 thiss!1248) (bvor (extraKeys!2902 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3004 thiss!1248) v!309 (_size!768 thiss!1248) (_keys!4936 thiss!1248) (_values!3144 thiss!1248) (_vacant!768 thiss!1248)))))

(declare-datatypes ((tuple2!2866 0))(
  ( (tuple2!2867 (_1!1444 (_ BitVec 64)) (_2!1444 V!3937)) )
))
(declare-datatypes ((List!1875 0))(
  ( (Nil!1872) (Cons!1871 (h!2480 tuple2!2866) (t!6677 List!1875)) )
))
(declare-datatypes ((ListLongMap!1853 0))(
  ( (ListLongMap!1854 (toList!942 List!1875)) )
))
(declare-fun +!210 (ListLongMap!1853 tuple2!2866) ListLongMap!1853)

(declare-fun getCurrentListMap!606 (array!5487 array!5489 (_ BitVec 32) (_ BitVec 32) V!3937 V!3937 (_ BitVec 32) Int) ListLongMap!1853)

(assert (=> b!157161 (= (+!210 (getCurrentListMap!606 (_keys!4936 thiss!1248) (_values!3144 thiss!1248) (mask!7632 thiss!1248) (extraKeys!2902 thiss!1248) (zeroValue!3004 thiss!1248) (minValue!3004 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3161 thiss!1248)) (tuple2!2867 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!606 (_keys!4936 thiss!1248) (_values!3144 thiss!1248) (mask!7632 thiss!1248) (bvor (extraKeys!2902 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3004 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3161 thiss!1248)))))

(declare-datatypes ((Unit!4964 0))(
  ( (Unit!4965) )
))
(declare-fun lt!81669 () Unit!4964)

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!78 (array!5487 array!5489 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3937 V!3937 V!3937 Int) Unit!4964)

(assert (=> b!157161 (= lt!81669 (lemmaChangeLongMinValueKeyThenAddPairToListMap!78 (_keys!4936 thiss!1248) (_values!3144 thiss!1248) (mask!7632 thiss!1248) (extraKeys!2902 thiss!1248) (bvor (extraKeys!2902 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3004 thiss!1248) (minValue!3004 thiss!1248) v!309 (defaultEntry!3161 thiss!1248)))))

(declare-fun b!157162 () Bool)

(declare-fun e!102839 () Bool)

(assert (=> b!157162 (= e!102839 tp_is_empty!3217)))

(declare-fun res!74294 () Bool)

(assert (=> start!15748 (=> (not res!74294) (not e!102837))))

(assert (=> start!15748 (= res!74294 (valid!685 thiss!1248))))

(assert (=> start!15748 e!102837))

(declare-fun e!102840 () Bool)

(assert (=> start!15748 e!102840))

(assert (=> start!15748 true))

(assert (=> start!15748 tp_is_empty!3217))

(declare-fun b!157163 () Bool)

(declare-fun res!74296 () Bool)

(assert (=> b!157163 (=> (not res!74296) (not e!102837))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157163 (= res!74296 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!157164 () Bool)

(declare-fun e!102841 () Bool)

(declare-fun mapRes!5468 () Bool)

(assert (=> b!157164 (= e!102841 (and e!102838 mapRes!5468))))

(declare-fun condMapEmpty!5468 () Bool)

(declare-fun mapDefault!5468 () ValueCell!1265)

