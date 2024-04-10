; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15584 () Bool)

(assert start!15584)

(declare-fun b!155117 () Bool)

(declare-fun b_free!3251 () Bool)

(declare-fun b_next!3251 () Bool)

(assert (=> b!155117 (= b_free!3251 (not b_next!3251))))

(declare-fun tp!12278 () Bool)

(declare-fun b_and!9665 () Bool)

(assert (=> b!155117 (= tp!12278 b_and!9665)))

(declare-fun b!155112 () Bool)

(declare-fun res!73233 () Bool)

(declare-fun e!101334 () Bool)

(assert (=> b!155112 (=> (not res!73233) (not e!101334))))

(declare-datatypes ((V!3717 0))(
  ( (V!3718 (val!1571 Int)) )
))
(declare-datatypes ((ValueCell!1183 0))(
  ( (ValueCellFull!1183 (v!3436 V!3717)) (EmptyCell!1183) )
))
(declare-datatypes ((array!5159 0))(
  ( (array!5160 (arr!2437 (Array (_ BitVec 32) (_ BitVec 64))) (size!2715 (_ BitVec 32))) )
))
(declare-datatypes ((array!5161 0))(
  ( (array!5162 (arr!2438 (Array (_ BitVec 32) ValueCell!1183)) (size!2716 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1274 0))(
  ( (LongMapFixedSize!1275 (defaultEntry!3079 Int) (mask!7494 (_ BitVec 32)) (extraKeys!2820 (_ BitVec 32)) (zeroValue!2922 V!3717) (minValue!2922 V!3717) (_size!686 (_ BitVec 32)) (_keys!4854 array!5159) (_values!3062 array!5161) (_vacant!686 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1274)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155112 (= res!73233 (validMask!0 (mask!7494 thiss!1248)))))

(declare-fun b!155113 () Bool)

(declare-fun res!73230 () Bool)

(assert (=> b!155113 (=> (not res!73230) (not e!101334))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155113 (= res!73230 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!5222 () Bool)

(declare-fun mapRes!5222 () Bool)

(declare-fun tp!12277 () Bool)

(declare-fun e!101336 () Bool)

(assert (=> mapNonEmpty!5222 (= mapRes!5222 (and tp!12277 e!101336))))

(declare-fun mapValue!5222 () ValueCell!1183)

(declare-fun mapKey!5222 () (_ BitVec 32))

(declare-fun mapRest!5222 () (Array (_ BitVec 32) ValueCell!1183))

(assert (=> mapNonEmpty!5222 (= (arr!2438 (_values!3062 thiss!1248)) (store mapRest!5222 mapKey!5222 mapValue!5222))))

(declare-fun b!155114 () Bool)

(assert (=> b!155114 (= e!101334 false)))

(declare-fun lt!81328 () Bool)

(declare-datatypes ((List!1815 0))(
  ( (Nil!1812) (Cons!1811 (h!2420 (_ BitVec 64)) (t!6617 List!1815)) )
))
(declare-fun arrayNoDuplicates!0 (array!5159 (_ BitVec 32) List!1815) Bool)

(assert (=> b!155114 (= lt!81328 (arrayNoDuplicates!0 (_keys!4854 thiss!1248) #b00000000000000000000000000000000 Nil!1812))))

(declare-fun b!155116 () Bool)

(declare-fun e!101337 () Bool)

(declare-fun tp_is_empty!3053 () Bool)

(assert (=> b!155116 (= e!101337 tp_is_empty!3053)))

(declare-fun e!101332 () Bool)

(declare-fun e!101333 () Bool)

(declare-fun array_inv!1541 (array!5159) Bool)

(declare-fun array_inv!1542 (array!5161) Bool)

(assert (=> b!155117 (= e!101332 (and tp!12278 tp_is_empty!3053 (array_inv!1541 (_keys!4854 thiss!1248)) (array_inv!1542 (_values!3062 thiss!1248)) e!101333))))

(declare-fun res!73231 () Bool)

(assert (=> start!15584 (=> (not res!73231) (not e!101334))))

(declare-fun valid!627 (LongMapFixedSize!1274) Bool)

(assert (=> start!15584 (= res!73231 (valid!627 thiss!1248))))

(assert (=> start!15584 e!101334))

(assert (=> start!15584 e!101332))

(assert (=> start!15584 true))

(declare-fun b!155115 () Bool)

(declare-fun res!73232 () Bool)

(assert (=> b!155115 (=> (not res!73232) (not e!101334))))

(assert (=> b!155115 (= res!73232 (and (= (size!2716 (_values!3062 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7494 thiss!1248))) (= (size!2715 (_keys!4854 thiss!1248)) (size!2716 (_values!3062 thiss!1248))) (bvsge (mask!7494 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2820 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2820 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2820 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2820 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2820 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2820 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2820 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!155118 () Bool)

(declare-fun res!73234 () Bool)

(assert (=> b!155118 (=> (not res!73234) (not e!101334))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5159 (_ BitVec 32)) Bool)

(assert (=> b!155118 (= res!73234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4854 thiss!1248) (mask!7494 thiss!1248)))))

(declare-fun mapIsEmpty!5222 () Bool)

(assert (=> mapIsEmpty!5222 mapRes!5222))

(declare-fun b!155119 () Bool)

(assert (=> b!155119 (= e!101336 tp_is_empty!3053)))

(declare-fun b!155120 () Bool)

(assert (=> b!155120 (= e!101333 (and e!101337 mapRes!5222))))

(declare-fun condMapEmpty!5222 () Bool)

(declare-fun mapDefault!5222 () ValueCell!1183)

