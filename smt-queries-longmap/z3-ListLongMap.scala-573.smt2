; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15582 () Bool)

(assert start!15582)

(declare-fun b!155093 () Bool)

(declare-fun b_free!3249 () Bool)

(declare-fun b_next!3249 () Bool)

(assert (=> b!155093 (= b_free!3249 (not b_next!3249))))

(declare-fun tp!12271 () Bool)

(declare-fun b_and!9663 () Bool)

(assert (=> b!155093 (= tp!12271 b_and!9663)))

(declare-fun b!155085 () Bool)

(declare-fun e!101319 () Bool)

(declare-fun e!101316 () Bool)

(declare-fun mapRes!5219 () Bool)

(assert (=> b!155085 (= e!101319 (and e!101316 mapRes!5219))))

(declare-fun condMapEmpty!5219 () Bool)

(declare-datatypes ((V!3715 0))(
  ( (V!3716 (val!1570 Int)) )
))
(declare-datatypes ((ValueCell!1182 0))(
  ( (ValueCellFull!1182 (v!3435 V!3715)) (EmptyCell!1182) )
))
(declare-datatypes ((array!5155 0))(
  ( (array!5156 (arr!2435 (Array (_ BitVec 32) (_ BitVec 64))) (size!2713 (_ BitVec 32))) )
))
(declare-datatypes ((array!5157 0))(
  ( (array!5158 (arr!2436 (Array (_ BitVec 32) ValueCell!1182)) (size!2714 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1272 0))(
  ( (LongMapFixedSize!1273 (defaultEntry!3078 Int) (mask!7493 (_ BitVec 32)) (extraKeys!2819 (_ BitVec 32)) (zeroValue!2921 V!3715) (minValue!2921 V!3715) (_size!685 (_ BitVec 32)) (_keys!4853 array!5155) (_values!3061 array!5157) (_vacant!685 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1272)

(declare-fun mapDefault!5219 () ValueCell!1182)

(assert (=> b!155085 (= condMapEmpty!5219 (= (arr!2436 (_values!3061 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1182)) mapDefault!5219)))))

(declare-fun b!155086 () Bool)

(declare-fun tp_is_empty!3051 () Bool)

(assert (=> b!155086 (= e!101316 tp_is_empty!3051)))

(declare-fun b!155087 () Bool)

(declare-fun res!73215 () Bool)

(declare-fun e!101314 () Bool)

(assert (=> b!155087 (=> (not res!73215) (not e!101314))))

(assert (=> b!155087 (= res!73215 (and (= (size!2714 (_values!3061 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7493 thiss!1248))) (= (size!2713 (_keys!4853 thiss!1248)) (size!2714 (_values!3061 thiss!1248))) (bvsge (mask!7493 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2819 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2819 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2819 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2819 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2819 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2819 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2819 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!5219 () Bool)

(declare-fun tp!12272 () Bool)

(declare-fun e!101315 () Bool)

(assert (=> mapNonEmpty!5219 (= mapRes!5219 (and tp!12272 e!101315))))

(declare-fun mapKey!5219 () (_ BitVec 32))

(declare-fun mapValue!5219 () ValueCell!1182)

(declare-fun mapRest!5219 () (Array (_ BitVec 32) ValueCell!1182))

(assert (=> mapNonEmpty!5219 (= (arr!2436 (_values!3061 thiss!1248)) (store mapRest!5219 mapKey!5219 mapValue!5219))))

(declare-fun b!155088 () Bool)

(assert (=> b!155088 (= e!101315 tp_is_empty!3051)))

(declare-fun b!155089 () Bool)

(declare-fun res!73217 () Bool)

(assert (=> b!155089 (=> (not res!73217) (not e!101314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155089 (= res!73217 (validMask!0 (mask!7493 thiss!1248)))))

(declare-fun res!73218 () Bool)

(assert (=> start!15582 (=> (not res!73218) (not e!101314))))

(declare-fun valid!626 (LongMapFixedSize!1272) Bool)

(assert (=> start!15582 (= res!73218 (valid!626 thiss!1248))))

(assert (=> start!15582 e!101314))

(declare-fun e!101318 () Bool)

(assert (=> start!15582 e!101318))

(assert (=> start!15582 true))

(declare-fun b!155090 () Bool)

(assert (=> b!155090 (= e!101314 false)))

(declare-fun lt!81325 () Bool)

(declare-datatypes ((List!1814 0))(
  ( (Nil!1811) (Cons!1810 (h!2419 (_ BitVec 64)) (t!6616 List!1814)) )
))
(declare-fun arrayNoDuplicates!0 (array!5155 (_ BitVec 32) List!1814) Bool)

(assert (=> b!155090 (= lt!81325 (arrayNoDuplicates!0 (_keys!4853 thiss!1248) #b00000000000000000000000000000000 Nil!1811))))

(declare-fun mapIsEmpty!5219 () Bool)

(assert (=> mapIsEmpty!5219 mapRes!5219))

(declare-fun b!155091 () Bool)

(declare-fun res!73216 () Bool)

(assert (=> b!155091 (=> (not res!73216) (not e!101314))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155091 (= res!73216 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!155092 () Bool)

(declare-fun res!73219 () Bool)

(assert (=> b!155092 (=> (not res!73219) (not e!101314))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5155 (_ BitVec 32)) Bool)

(assert (=> b!155092 (= res!73219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4853 thiss!1248) (mask!7493 thiss!1248)))))

(declare-fun array_inv!1539 (array!5155) Bool)

(declare-fun array_inv!1540 (array!5157) Bool)

(assert (=> b!155093 (= e!101318 (and tp!12271 tp_is_empty!3051 (array_inv!1539 (_keys!4853 thiss!1248)) (array_inv!1540 (_values!3061 thiss!1248)) e!101319))))

(assert (= (and start!15582 res!73218) b!155091))

(assert (= (and b!155091 res!73216) b!155089))

(assert (= (and b!155089 res!73217) b!155087))

(assert (= (and b!155087 res!73215) b!155092))

(assert (= (and b!155092 res!73219) b!155090))

(assert (= (and b!155085 condMapEmpty!5219) mapIsEmpty!5219))

(assert (= (and b!155085 (not condMapEmpty!5219)) mapNonEmpty!5219))

(get-info :version)

(assert (= (and mapNonEmpty!5219 ((_ is ValueCellFull!1182) mapValue!5219)) b!155088))

(assert (= (and b!155085 ((_ is ValueCellFull!1182) mapDefault!5219)) b!155086))

(assert (= b!155093 b!155085))

(assert (= start!15582 b!155093))

(declare-fun m!189155 () Bool)

(assert (=> b!155089 m!189155))

(declare-fun m!189157 () Bool)

(assert (=> start!15582 m!189157))

(declare-fun m!189159 () Bool)

(assert (=> b!155092 m!189159))

(declare-fun m!189161 () Bool)

(assert (=> mapNonEmpty!5219 m!189161))

(declare-fun m!189163 () Bool)

(assert (=> b!155093 m!189163))

(declare-fun m!189165 () Bool)

(assert (=> b!155093 m!189165))

(declare-fun m!189167 () Bool)

(assert (=> b!155090 m!189167))

(check-sat (not start!15582) (not b_next!3249) (not b!155092) tp_is_empty!3051 (not b!155090) b_and!9663 (not b!155089) (not mapNonEmpty!5219) (not b!155093))
(check-sat b_and!9663 (not b_next!3249))
