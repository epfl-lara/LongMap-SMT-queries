; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15580 () Bool)

(assert start!15580)

(declare-fun b!155058 () Bool)

(declare-fun b_free!3247 () Bool)

(declare-fun b_next!3247 () Bool)

(assert (=> b!155058 (= b_free!3247 (not b_next!3247))))

(declare-fun tp!12266 () Bool)

(declare-fun b_and!9661 () Bool)

(assert (=> b!155058 (= tp!12266 b_and!9661)))

(declare-fun tp_is_empty!3049 () Bool)

(declare-datatypes ((V!3713 0))(
  ( (V!3714 (val!1569 Int)) )
))
(declare-datatypes ((ValueCell!1181 0))(
  ( (ValueCellFull!1181 (v!3434 V!3713)) (EmptyCell!1181) )
))
(declare-datatypes ((array!5151 0))(
  ( (array!5152 (arr!2433 (Array (_ BitVec 32) (_ BitVec 64))) (size!2711 (_ BitVec 32))) )
))
(declare-datatypes ((array!5153 0))(
  ( (array!5154 (arr!2434 (Array (_ BitVec 32) ValueCell!1181)) (size!2712 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1270 0))(
  ( (LongMapFixedSize!1271 (defaultEntry!3077 Int) (mask!7492 (_ BitVec 32)) (extraKeys!2818 (_ BitVec 32)) (zeroValue!2920 V!3713) (minValue!2920 V!3713) (_size!684 (_ BitVec 32)) (_keys!4852 array!5151) (_values!3060 array!5153) (_vacant!684 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1270)

(declare-fun e!101300 () Bool)

(declare-fun e!101301 () Bool)

(declare-fun array_inv!1537 (array!5151) Bool)

(declare-fun array_inv!1538 (array!5153) Bool)

(assert (=> b!155058 (= e!101300 (and tp!12266 tp_is_empty!3049 (array_inv!1537 (_keys!4852 thiss!1248)) (array_inv!1538 (_values!3060 thiss!1248)) e!101301))))

(declare-fun mapNonEmpty!5216 () Bool)

(declare-fun mapRes!5216 () Bool)

(declare-fun tp!12265 () Bool)

(declare-fun e!101297 () Bool)

(assert (=> mapNonEmpty!5216 (= mapRes!5216 (and tp!12265 e!101297))))

(declare-fun mapKey!5216 () (_ BitVec 32))

(declare-fun mapValue!5216 () ValueCell!1181)

(declare-fun mapRest!5216 () (Array (_ BitVec 32) ValueCell!1181))

(assert (=> mapNonEmpty!5216 (= (arr!2434 (_values!3060 thiss!1248)) (store mapRest!5216 mapKey!5216 mapValue!5216))))

(declare-fun b!155059 () Bool)

(declare-fun res!73201 () Bool)

(declare-fun e!101299 () Bool)

(assert (=> b!155059 (=> (not res!73201) (not e!101299))))

(assert (=> b!155059 (= res!73201 (and (= (size!2712 (_values!3060 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7492 thiss!1248))) (= (size!2711 (_keys!4852 thiss!1248)) (size!2712 (_values!3060 thiss!1248))) (bvsge (mask!7492 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2818 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2818 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2818 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2818 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2818 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2818 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2818 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!155060 () Bool)

(declare-fun res!73202 () Bool)

(assert (=> b!155060 (=> (not res!73202) (not e!101299))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155060 (= res!73202 (validMask!0 (mask!7492 thiss!1248)))))

(declare-fun b!155061 () Bool)

(assert (=> b!155061 (= e!101299 false)))

(declare-fun lt!81322 () Bool)

(declare-datatypes ((List!1813 0))(
  ( (Nil!1810) (Cons!1809 (h!2418 (_ BitVec 64)) (t!6615 List!1813)) )
))
(declare-fun arrayNoDuplicates!0 (array!5151 (_ BitVec 32) List!1813) Bool)

(assert (=> b!155061 (= lt!81322 (arrayNoDuplicates!0 (_keys!4852 thiss!1248) #b00000000000000000000000000000000 Nil!1810))))

(declare-fun b!155062 () Bool)

(declare-fun res!73204 () Bool)

(assert (=> b!155062 (=> (not res!73204) (not e!101299))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155062 (= res!73204 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!155063 () Bool)

(assert (=> b!155063 (= e!101297 tp_is_empty!3049)))

(declare-fun mapIsEmpty!5216 () Bool)

(assert (=> mapIsEmpty!5216 mapRes!5216))

(declare-fun b!155064 () Bool)

(declare-fun e!101298 () Bool)

(assert (=> b!155064 (= e!101298 tp_is_empty!3049)))

(declare-fun res!73200 () Bool)

(assert (=> start!15580 (=> (not res!73200) (not e!101299))))

(declare-fun valid!625 (LongMapFixedSize!1270) Bool)

(assert (=> start!15580 (= res!73200 (valid!625 thiss!1248))))

(assert (=> start!15580 e!101299))

(assert (=> start!15580 e!101300))

(assert (=> start!15580 true))

(declare-fun b!155065 () Bool)

(declare-fun res!73203 () Bool)

(assert (=> b!155065 (=> (not res!73203) (not e!101299))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5151 (_ BitVec 32)) Bool)

(assert (=> b!155065 (= res!73203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4852 thiss!1248) (mask!7492 thiss!1248)))))

(declare-fun b!155066 () Bool)

(assert (=> b!155066 (= e!101301 (and e!101298 mapRes!5216))))

(declare-fun condMapEmpty!5216 () Bool)

(declare-fun mapDefault!5216 () ValueCell!1181)

