; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15728 () Bool)

(assert start!15728)

(declare-fun b!156940 () Bool)

(declare-fun b_free!3395 () Bool)

(declare-fun b_next!3395 () Bool)

(assert (=> b!156940 (= b_free!3395 (not b_next!3395))))

(declare-fun tp!12709 () Bool)

(declare-fun b_and!9809 () Bool)

(assert (=> b!156940 (= tp!12709 b_and!9809)))

(declare-fun b!156939 () Bool)

(declare-fun e!102648 () Bool)

(declare-fun tp_is_empty!3197 () Bool)

(assert (=> b!156939 (= e!102648 tp_is_empty!3197)))

(declare-fun e!102651 () Bool)

(declare-fun e!102649 () Bool)

(declare-datatypes ((V!3909 0))(
  ( (V!3910 (val!1643 Int)) )
))
(declare-datatypes ((ValueCell!1255 0))(
  ( (ValueCellFull!1255 (v!3508 V!3909)) (EmptyCell!1255) )
))
(declare-datatypes ((array!5447 0))(
  ( (array!5448 (arr!2581 (Array (_ BitVec 32) (_ BitVec 64))) (size!2859 (_ BitVec 32))) )
))
(declare-datatypes ((array!5449 0))(
  ( (array!5450 (arr!2582 (Array (_ BitVec 32) ValueCell!1255)) (size!2860 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1418 0))(
  ( (LongMapFixedSize!1419 (defaultEntry!3151 Int) (mask!7614 (_ BitVec 32)) (extraKeys!2892 (_ BitVec 32)) (zeroValue!2994 V!3909) (minValue!2994 V!3909) (_size!758 (_ BitVec 32)) (_keys!4926 array!5447) (_values!3134 array!5449) (_vacant!758 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1418)

(declare-fun array_inv!1629 (array!5447) Bool)

(declare-fun array_inv!1630 (array!5449) Bool)

(assert (=> b!156940 (= e!102649 (and tp!12709 tp_is_empty!3197 (array_inv!1629 (_keys!4926 thiss!1248)) (array_inv!1630 (_values!3134 thiss!1248)) e!102651))))

(declare-fun b!156941 () Bool)

(declare-fun res!74194 () Bool)

(declare-fun e!102646 () Bool)

(assert (=> b!156941 (=> (not res!74194) (not e!102646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156941 (= res!74194 (validMask!0 (mask!7614 thiss!1248)))))

(declare-fun b!156942 () Bool)

(declare-fun res!74193 () Bool)

(assert (=> b!156942 (=> (not res!74193) (not e!102646))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156942 (= res!74193 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156943 () Bool)

(declare-fun res!74195 () Bool)

(assert (=> b!156943 (=> (not res!74195) (not e!102646))))

(assert (=> b!156943 (= res!74195 (and (= (size!2860 (_values!3134 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7614 thiss!1248))) (= (size!2859 (_keys!4926 thiss!1248)) (size!2860 (_values!3134 thiss!1248))) (bvsge (mask!7614 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2892 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2892 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2892 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2892 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2892 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2892 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2892 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!156944 () Bool)

(assert (=> b!156944 (= e!102646 false)))

(declare-fun lt!81607 () Bool)

(declare-datatypes ((List!1865 0))(
  ( (Nil!1862) (Cons!1861 (h!2470 (_ BitVec 64)) (t!6667 List!1865)) )
))
(declare-fun arrayNoDuplicates!0 (array!5447 (_ BitVec 32) List!1865) Bool)

(assert (=> b!156944 (= lt!81607 (arrayNoDuplicates!0 (_keys!4926 thiss!1248) #b00000000000000000000000000000000 Nil!1862))))

(declare-fun res!74196 () Bool)

(assert (=> start!15728 (=> (not res!74196) (not e!102646))))

(declare-fun valid!676 (LongMapFixedSize!1418) Bool)

(assert (=> start!15728 (= res!74196 (valid!676 thiss!1248))))

(assert (=> start!15728 e!102646))

(assert (=> start!15728 e!102649))

(assert (=> start!15728 true))

(declare-fun b!156945 () Bool)

(declare-fun mapRes!5438 () Bool)

(assert (=> b!156945 (= e!102651 (and e!102648 mapRes!5438))))

(declare-fun condMapEmpty!5438 () Bool)

(declare-fun mapDefault!5438 () ValueCell!1255)

