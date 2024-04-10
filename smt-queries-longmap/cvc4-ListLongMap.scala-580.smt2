; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15626 () Bool)

(assert start!15626)

(declare-fun b!155679 () Bool)

(declare-fun b_free!3293 () Bool)

(declare-fun b_next!3293 () Bool)

(assert (=> b!155679 (= b_free!3293 (not b_next!3293))))

(declare-fun tp!12403 () Bool)

(declare-fun b_and!9707 () Bool)

(assert (=> b!155679 (= tp!12403 b_and!9707)))

(declare-fun tp_is_empty!3095 () Bool)

(declare-fun e!101711 () Bool)

(declare-fun e!101712 () Bool)

(declare-datatypes ((V!3773 0))(
  ( (V!3774 (val!1592 Int)) )
))
(declare-datatypes ((ValueCell!1204 0))(
  ( (ValueCellFull!1204 (v!3457 V!3773)) (EmptyCell!1204) )
))
(declare-datatypes ((array!5243 0))(
  ( (array!5244 (arr!2479 (Array (_ BitVec 32) (_ BitVec 64))) (size!2757 (_ BitVec 32))) )
))
(declare-datatypes ((array!5245 0))(
  ( (array!5246 (arr!2480 (Array (_ BitVec 32) ValueCell!1204)) (size!2758 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1316 0))(
  ( (LongMapFixedSize!1317 (defaultEntry!3100 Int) (mask!7529 (_ BitVec 32)) (extraKeys!2841 (_ BitVec 32)) (zeroValue!2943 V!3773) (minValue!2943 V!3773) (_size!707 (_ BitVec 32)) (_keys!4875 array!5243) (_values!3083 array!5245) (_vacant!707 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1316)

(declare-fun array_inv!1565 (array!5243) Bool)

(declare-fun array_inv!1566 (array!5245) Bool)

(assert (=> b!155679 (= e!101712 (and tp!12403 tp_is_empty!3095 (array_inv!1565 (_keys!4875 thiss!1248)) (array_inv!1566 (_values!3083 thiss!1248)) e!101711))))

(declare-fun b!155680 () Bool)

(declare-fun e!101713 () Bool)

(assert (=> b!155680 (= e!101713 tp_is_empty!3095)))

(declare-fun mapIsEmpty!5285 () Bool)

(declare-fun mapRes!5285 () Bool)

(assert (=> mapIsEmpty!5285 mapRes!5285))

(declare-fun b!155681 () Bool)

(declare-fun res!73546 () Bool)

(declare-fun e!101715 () Bool)

(assert (=> b!155681 (=> (not res!73546) (not e!101715))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155681 (= res!73546 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!5285 () Bool)

(declare-fun tp!12404 () Bool)

(declare-fun e!101714 () Bool)

(assert (=> mapNonEmpty!5285 (= mapRes!5285 (and tp!12404 e!101714))))

(declare-fun mapKey!5285 () (_ BitVec 32))

(declare-fun mapValue!5285 () ValueCell!1204)

(declare-fun mapRest!5285 () (Array (_ BitVec 32) ValueCell!1204))

(assert (=> mapNonEmpty!5285 (= (arr!2480 (_values!3083 thiss!1248)) (store mapRest!5285 mapKey!5285 mapValue!5285))))

(declare-fun b!155682 () Bool)

(assert (=> b!155682 (= e!101714 tp_is_empty!3095)))

(declare-fun b!155683 () Bool)

(declare-fun res!73548 () Bool)

(assert (=> b!155683 (=> (not res!73548) (not e!101715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5243 (_ BitVec 32)) Bool)

(assert (=> b!155683 (= res!73548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4875 thiss!1248) (mask!7529 thiss!1248)))))

(declare-fun res!73549 () Bool)

(assert (=> start!15626 (=> (not res!73549) (not e!101715))))

(declare-fun valid!644 (LongMapFixedSize!1316) Bool)

(assert (=> start!15626 (= res!73549 (valid!644 thiss!1248))))

(assert (=> start!15626 e!101715))

(assert (=> start!15626 e!101712))

(assert (=> start!15626 true))

(declare-fun b!155684 () Bool)

(declare-fun res!73545 () Bool)

(assert (=> b!155684 (=> (not res!73545) (not e!101715))))

(assert (=> b!155684 (= res!73545 (and (= (size!2758 (_values!3083 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7529 thiss!1248))) (= (size!2757 (_keys!4875 thiss!1248)) (size!2758 (_values!3083 thiss!1248))) (bvsge (mask!7529 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2841 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2841 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2841 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2841 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2841 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2841 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2841 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!155685 () Bool)

(declare-fun res!73547 () Bool)

(assert (=> b!155685 (=> (not res!73547) (not e!101715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155685 (= res!73547 (validMask!0 (mask!7529 thiss!1248)))))

(declare-fun b!155686 () Bool)

(assert (=> b!155686 (= e!101715 false)))

(declare-fun lt!81391 () Bool)

(declare-datatypes ((List!1831 0))(
  ( (Nil!1828) (Cons!1827 (h!2436 (_ BitVec 64)) (t!6633 List!1831)) )
))
(declare-fun arrayNoDuplicates!0 (array!5243 (_ BitVec 32) List!1831) Bool)

(assert (=> b!155686 (= lt!81391 (arrayNoDuplicates!0 (_keys!4875 thiss!1248) #b00000000000000000000000000000000 Nil!1828))))

(declare-fun b!155687 () Bool)

(assert (=> b!155687 (= e!101711 (and e!101713 mapRes!5285))))

(declare-fun condMapEmpty!5285 () Bool)

(declare-fun mapDefault!5285 () ValueCell!1204)

