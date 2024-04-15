; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15590 () Bool)

(assert start!15590)

(declare-fun b!154996 () Bool)

(declare-fun b_free!3253 () Bool)

(declare-fun b_next!3253 () Bool)

(assert (=> b!154996 (= b_free!3253 (not b_next!3253))))

(declare-fun tp!12284 () Bool)

(declare-fun b_and!9641 () Bool)

(assert (=> b!154996 (= tp!12284 b_and!9641)))

(declare-fun b!154992 () Bool)

(declare-fun e!101253 () Bool)

(assert (=> b!154992 (= e!101253 false)))

(declare-fun lt!81150 () Bool)

(declare-datatypes ((V!3721 0))(
  ( (V!3722 (val!1572 Int)) )
))
(declare-datatypes ((ValueCell!1184 0))(
  ( (ValueCellFull!1184 (v!3431 V!3721)) (EmptyCell!1184) )
))
(declare-datatypes ((array!5143 0))(
  ( (array!5144 (arr!2428 (Array (_ BitVec 32) (_ BitVec 64))) (size!2707 (_ BitVec 32))) )
))
(declare-datatypes ((array!5145 0))(
  ( (array!5146 (arr!2429 (Array (_ BitVec 32) ValueCell!1184)) (size!2708 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1276 0))(
  ( (LongMapFixedSize!1277 (defaultEntry!3080 Int) (mask!7496 (_ BitVec 32)) (extraKeys!2821 (_ BitVec 32)) (zeroValue!2923 V!3721) (minValue!2923 V!3721) (_size!687 (_ BitVec 32)) (_keys!4854 array!5143) (_values!3063 array!5145) (_vacant!687 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1276)

(declare-datatypes ((List!1819 0))(
  ( (Nil!1816) (Cons!1815 (h!2424 (_ BitVec 64)) (t!6612 List!1819)) )
))
(declare-fun arrayNoDuplicates!0 (array!5143 (_ BitVec 32) List!1819) Bool)

(assert (=> b!154992 (= lt!81150 (arrayNoDuplicates!0 (_keys!4854 thiss!1248) #b00000000000000000000000000000000 Nil!1816))))

(declare-fun b!154993 () Bool)

(declare-fun e!101252 () Bool)

(declare-fun tp_is_empty!3055 () Bool)

(assert (=> b!154993 (= e!101252 tp_is_empty!3055)))

(declare-fun b!154994 () Bool)

(declare-fun e!101251 () Bool)

(assert (=> b!154994 (= e!101251 tp_is_empty!3055)))

(declare-fun b!154995 () Bool)

(declare-fun res!73153 () Bool)

(assert (=> b!154995 (=> (not res!73153) (not e!101253))))

(assert (=> b!154995 (= res!73153 (and (= (size!2708 (_values!3063 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7496 thiss!1248))) (= (size!2707 (_keys!4854 thiss!1248)) (size!2708 (_values!3063 thiss!1248))) (bvsge (mask!7496 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2821 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2821 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2821 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2821 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2821 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2821 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2821 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!73150 () Bool)

(assert (=> start!15590 (=> (not res!73150) (not e!101253))))

(declare-fun valid!635 (LongMapFixedSize!1276) Bool)

(assert (=> start!15590 (= res!73150 (valid!635 thiss!1248))))

(assert (=> start!15590 e!101253))

(declare-fun e!101254 () Bool)

(assert (=> start!15590 e!101254))

(assert (=> start!15590 true))

(declare-fun e!101250 () Bool)

(declare-fun array_inv!1557 (array!5143) Bool)

(declare-fun array_inv!1558 (array!5145) Bool)

(assert (=> b!154996 (= e!101254 (and tp!12284 tp_is_empty!3055 (array_inv!1557 (_keys!4854 thiss!1248)) (array_inv!1558 (_values!3063 thiss!1248)) e!101250))))

(declare-fun mapNonEmpty!5225 () Bool)

(declare-fun mapRes!5225 () Bool)

(declare-fun tp!12283 () Bool)

(assert (=> mapNonEmpty!5225 (= mapRes!5225 (and tp!12283 e!101251))))

(declare-fun mapValue!5225 () ValueCell!1184)

(declare-fun mapKey!5225 () (_ BitVec 32))

(declare-fun mapRest!5225 () (Array (_ BitVec 32) ValueCell!1184))

(assert (=> mapNonEmpty!5225 (= (arr!2429 (_values!3063 thiss!1248)) (store mapRest!5225 mapKey!5225 mapValue!5225))))

(declare-fun b!154997 () Bool)

(assert (=> b!154997 (= e!101250 (and e!101252 mapRes!5225))))

(declare-fun condMapEmpty!5225 () Bool)

(declare-fun mapDefault!5225 () ValueCell!1184)

(assert (=> b!154997 (= condMapEmpty!5225 (= (arr!2429 (_values!3063 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1184)) mapDefault!5225)))))

(declare-fun mapIsEmpty!5225 () Bool)

(assert (=> mapIsEmpty!5225 mapRes!5225))

(declare-fun b!154998 () Bool)

(declare-fun res!73151 () Bool)

(assert (=> b!154998 (=> (not res!73151) (not e!101253))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!154998 (= res!73151 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!154999 () Bool)

(declare-fun res!73154 () Bool)

(assert (=> b!154999 (=> (not res!73154) (not e!101253))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!154999 (= res!73154 (validMask!0 (mask!7496 thiss!1248)))))

(declare-fun b!155000 () Bool)

(declare-fun res!73152 () Bool)

(assert (=> b!155000 (=> (not res!73152) (not e!101253))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5143 (_ BitVec 32)) Bool)

(assert (=> b!155000 (= res!73152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4854 thiss!1248) (mask!7496 thiss!1248)))))

(assert (= (and start!15590 res!73150) b!154998))

(assert (= (and b!154998 res!73151) b!154999))

(assert (= (and b!154999 res!73154) b!154995))

(assert (= (and b!154995 res!73153) b!155000))

(assert (= (and b!155000 res!73152) b!154992))

(assert (= (and b!154997 condMapEmpty!5225) mapIsEmpty!5225))

(assert (= (and b!154997 (not condMapEmpty!5225)) mapNonEmpty!5225))

(get-info :version)

(assert (= (and mapNonEmpty!5225 ((_ is ValueCellFull!1184) mapValue!5225)) b!154994))

(assert (= (and b!154997 ((_ is ValueCellFull!1184) mapDefault!5225)) b!154993))

(assert (= b!154996 b!154997))

(assert (= start!15590 b!154996))

(declare-fun m!188563 () Bool)

(assert (=> b!154992 m!188563))

(declare-fun m!188565 () Bool)

(assert (=> mapNonEmpty!5225 m!188565))

(declare-fun m!188567 () Bool)

(assert (=> b!154999 m!188567))

(declare-fun m!188569 () Bool)

(assert (=> b!155000 m!188569))

(declare-fun m!188571 () Bool)

(assert (=> start!15590 m!188571))

(declare-fun m!188573 () Bool)

(assert (=> b!154996 m!188573))

(declare-fun m!188575 () Bool)

(assert (=> b!154996 m!188575))

(check-sat tp_is_empty!3055 b_and!9641 (not b!154999) (not b_next!3253) (not start!15590) (not mapNonEmpty!5225) (not b!155000) (not b!154992) (not b!154996))
(check-sat b_and!9641 (not b_next!3253))
