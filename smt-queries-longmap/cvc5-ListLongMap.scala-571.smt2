; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15568 () Bool)

(assert start!15568)

(declare-fun b!154902 () Bool)

(declare-fun b_free!3235 () Bool)

(declare-fun b_next!3235 () Bool)

(assert (=> b!154902 (= b_free!3235 (not b_next!3235))))

(declare-fun tp!12230 () Bool)

(declare-fun b_and!9649 () Bool)

(assert (=> b!154902 (= tp!12230 b_and!9649)))

(declare-fun mapNonEmpty!5198 () Bool)

(declare-fun mapRes!5198 () Bool)

(declare-fun tp!12229 () Bool)

(declare-fun e!101191 () Bool)

(assert (=> mapNonEmpty!5198 (= mapRes!5198 (and tp!12229 e!101191))))

(declare-datatypes ((V!3697 0))(
  ( (V!3698 (val!1563 Int)) )
))
(declare-datatypes ((ValueCell!1175 0))(
  ( (ValueCellFull!1175 (v!3428 V!3697)) (EmptyCell!1175) )
))
(declare-fun mapRest!5198 () (Array (_ BitVec 32) ValueCell!1175))

(declare-fun mapValue!5198 () ValueCell!1175)

(declare-datatypes ((array!5127 0))(
  ( (array!5128 (arr!2421 (Array (_ BitVec 32) (_ BitVec 64))) (size!2699 (_ BitVec 32))) )
))
(declare-datatypes ((array!5129 0))(
  ( (array!5130 (arr!2422 (Array (_ BitVec 32) ValueCell!1175)) (size!2700 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1258 0))(
  ( (LongMapFixedSize!1259 (defaultEntry!3071 Int) (mask!7482 (_ BitVec 32)) (extraKeys!2812 (_ BitVec 32)) (zeroValue!2914 V!3697) (minValue!2914 V!3697) (_size!678 (_ BitVec 32)) (_keys!4846 array!5127) (_values!3054 array!5129) (_vacant!678 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1258)

(declare-fun mapKey!5198 () (_ BitVec 32))

(assert (=> mapNonEmpty!5198 (= (arr!2422 (_values!3054 thiss!1248)) (store mapRest!5198 mapKey!5198 mapValue!5198))))

(declare-fun b!154896 () Bool)

(declare-fun res!73110 () Bool)

(declare-fun e!101193 () Bool)

(assert (=> b!154896 (=> (not res!73110) (not e!101193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!154896 (= res!73110 (validMask!0 (mask!7482 thiss!1248)))))

(declare-fun b!154897 () Bool)

(declare-fun res!73113 () Bool)

(assert (=> b!154897 (=> (not res!73113) (not e!101193))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!154897 (= res!73113 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!154898 () Bool)

(declare-fun tp_is_empty!3037 () Bool)

(assert (=> b!154898 (= e!101191 tp_is_empty!3037)))

(declare-fun b!154899 () Bool)

(declare-fun res!73111 () Bool)

(assert (=> b!154899 (=> (not res!73111) (not e!101193))))

(assert (=> b!154899 (= res!73111 (and (= (size!2700 (_values!3054 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7482 thiss!1248))) (= (size!2699 (_keys!4846 thiss!1248)) (size!2700 (_values!3054 thiss!1248))) (bvsge (mask!7482 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2812 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2812 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2812 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2812 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2812 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2812 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2812 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!154900 () Bool)

(declare-fun res!73112 () Bool)

(assert (=> b!154900 (=> (not res!73112) (not e!101193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5127 (_ BitVec 32)) Bool)

(assert (=> b!154900 (= res!73112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4846 thiss!1248) (mask!7482 thiss!1248)))))

(declare-fun b!154901 () Bool)

(declare-fun e!101190 () Bool)

(declare-fun e!101188 () Bool)

(assert (=> b!154901 (= e!101190 (and e!101188 mapRes!5198))))

(declare-fun condMapEmpty!5198 () Bool)

(declare-fun mapDefault!5198 () ValueCell!1175)

