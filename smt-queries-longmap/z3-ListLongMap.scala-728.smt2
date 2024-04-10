; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16962 () Bool)

(assert start!16962)

(declare-fun b!170530 () Bool)

(declare-fun b_free!4209 () Bool)

(declare-fun b_next!4209 () Bool)

(assert (=> b!170530 (= b_free!4209 (not b_next!4209))))

(declare-fun tp!15250 () Bool)

(declare-fun b_and!10623 () Bool)

(assert (=> b!170530 (= tp!15250 b_and!10623)))

(declare-fun mapNonEmpty!6758 () Bool)

(declare-fun mapRes!6758 () Bool)

(declare-fun tp!15251 () Bool)

(declare-fun e!112537 () Bool)

(assert (=> mapNonEmpty!6758 (= mapRes!6758 (and tp!15251 e!112537))))

(declare-datatypes ((V!4955 0))(
  ( (V!4956 (val!2035 Int)) )
))
(declare-datatypes ((ValueCell!1647 0))(
  ( (ValueCellFull!1647 (v!3900 V!4955)) (EmptyCell!1647) )
))
(declare-fun mapValue!6758 () ValueCell!1647)

(declare-fun mapKey!6758 () (_ BitVec 32))

(declare-fun mapRest!6758 () (Array (_ BitVec 32) ValueCell!1647))

(declare-datatypes ((array!7071 0))(
  ( (array!7072 (arr!3365 (Array (_ BitVec 32) (_ BitVec 64))) (size!3658 (_ BitVec 32))) )
))
(declare-datatypes ((array!7073 0))(
  ( (array!7074 (arr!3366 (Array (_ BitVec 32) ValueCell!1647)) (size!3659 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2202 0))(
  ( (LongMapFixedSize!2203 (defaultEntry!3543 Int) (mask!8359 (_ BitVec 32)) (extraKeys!3284 (_ BitVec 32)) (zeroValue!3386 V!4955) (minValue!3386 V!4955) (_size!1150 (_ BitVec 32)) (_keys!5373 array!7071) (_values!3526 array!7073) (_vacant!1150 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2202)

(assert (=> mapNonEmpty!6758 (= (arr!3366 (_values!3526 thiss!1248)) (store mapRest!6758 mapKey!6758 mapValue!6758))))

(declare-fun b!170527 () Bool)

(declare-fun e!112540 () Bool)

(declare-fun e!112538 () Bool)

(assert (=> b!170527 (= e!112540 (and e!112538 mapRes!6758))))

(declare-fun condMapEmpty!6758 () Bool)

(declare-fun mapDefault!6758 () ValueCell!1647)

(assert (=> b!170527 (= condMapEmpty!6758 (= (arr!3366 (_values!3526 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1647)) mapDefault!6758)))))

(declare-fun mapIsEmpty!6758 () Bool)

(assert (=> mapIsEmpty!6758 mapRes!6758))

(declare-fun b!170528 () Bool)

(declare-fun res!81063 () Bool)

(declare-fun e!112539 () Bool)

(assert (=> b!170528 (=> (not res!81063) (not e!112539))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!170528 (= res!81063 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!170529 () Bool)

(declare-fun tp_is_empty!3981 () Bool)

(assert (=> b!170529 (= e!112537 tp_is_empty!3981)))

(declare-fun e!112541 () Bool)

(declare-fun array_inv!2151 (array!7071) Bool)

(declare-fun array_inv!2152 (array!7073) Bool)

(assert (=> b!170530 (= e!112541 (and tp!15250 tp_is_empty!3981 (array_inv!2151 (_keys!5373 thiss!1248)) (array_inv!2152 (_values!3526 thiss!1248)) e!112540))))

(declare-fun b!170532 () Bool)

(assert (=> b!170532 (= e!112539 (and (= (size!3659 (_values!3526 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8359 thiss!1248))) (= (size!3658 (_keys!5373 thiss!1248)) (size!3659 (_values!3526 thiss!1248))) (bvsge (mask!8359 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3284 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3284 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3284 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3284 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (not (= (bvand (extraKeys!3284 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!3284 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))))

(declare-fun b!170533 () Bool)

(assert (=> b!170533 (= e!112538 tp_is_empty!3981)))

(declare-fun res!81061 () Bool)

(assert (=> start!16962 (=> (not res!81061) (not e!112539))))

(declare-fun valid!940 (LongMapFixedSize!2202) Bool)

(assert (=> start!16962 (= res!81061 (valid!940 thiss!1248))))

(assert (=> start!16962 e!112539))

(assert (=> start!16962 e!112541))

(assert (=> start!16962 true))

(declare-fun b!170531 () Bool)

(declare-fun res!81062 () Bool)

(assert (=> b!170531 (=> (not res!81062) (not e!112539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!170531 (= res!81062 (validMask!0 (mask!8359 thiss!1248)))))

(assert (= (and start!16962 res!81061) b!170528))

(assert (= (and b!170528 res!81063) b!170531))

(assert (= (and b!170531 res!81062) b!170532))

(assert (= (and b!170527 condMapEmpty!6758) mapIsEmpty!6758))

(assert (= (and b!170527 (not condMapEmpty!6758)) mapNonEmpty!6758))

(get-info :version)

(assert (= (and mapNonEmpty!6758 ((_ is ValueCellFull!1647) mapValue!6758)) b!170529))

(assert (= (and b!170527 ((_ is ValueCellFull!1647) mapDefault!6758)) b!170533))

(assert (= b!170530 b!170527))

(assert (= start!16962 b!170530))

(declare-fun m!198993 () Bool)

(assert (=> mapNonEmpty!6758 m!198993))

(declare-fun m!198995 () Bool)

(assert (=> b!170530 m!198995))

(declare-fun m!198997 () Bool)

(assert (=> b!170530 m!198997))

(declare-fun m!198999 () Bool)

(assert (=> start!16962 m!198999))

(declare-fun m!199001 () Bool)

(assert (=> b!170531 m!199001))

(check-sat (not start!16962) (not b!170531) tp_is_empty!3981 (not mapNonEmpty!6758) b_and!10623 (not b_next!4209) (not b!170530))
(check-sat b_and!10623 (not b_next!4209))
