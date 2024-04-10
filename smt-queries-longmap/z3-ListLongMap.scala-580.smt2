; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15624 () Bool)

(assert start!15624)

(declare-fun b!155659 () Bool)

(declare-fun b_free!3291 () Bool)

(declare-fun b_next!3291 () Bool)

(assert (=> b!155659 (= b_free!3291 (not b_next!3291))))

(declare-fun tp!12398 () Bool)

(declare-fun b_and!9705 () Bool)

(assert (=> b!155659 (= tp!12398 b_and!9705)))

(declare-fun b!155652 () Bool)

(declare-fun e!101692 () Bool)

(declare-fun tp_is_empty!3093 () Bool)

(assert (=> b!155652 (= e!101692 tp_is_empty!3093)))

(declare-fun b!155653 () Bool)

(declare-fun res!73532 () Bool)

(declare-fun e!101693 () Bool)

(assert (=> b!155653 (=> (not res!73532) (not e!101693))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155653 (= res!73532 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!5282 () Bool)

(declare-fun mapRes!5282 () Bool)

(assert (=> mapIsEmpty!5282 mapRes!5282))

(declare-fun b!155654 () Bool)

(declare-fun res!73533 () Bool)

(assert (=> b!155654 (=> (not res!73533) (not e!101693))))

(declare-datatypes ((V!3771 0))(
  ( (V!3772 (val!1591 Int)) )
))
(declare-datatypes ((ValueCell!1203 0))(
  ( (ValueCellFull!1203 (v!3456 V!3771)) (EmptyCell!1203) )
))
(declare-datatypes ((array!5239 0))(
  ( (array!5240 (arr!2477 (Array (_ BitVec 32) (_ BitVec 64))) (size!2755 (_ BitVec 32))) )
))
(declare-datatypes ((array!5241 0))(
  ( (array!5242 (arr!2478 (Array (_ BitVec 32) ValueCell!1203)) (size!2756 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1314 0))(
  ( (LongMapFixedSize!1315 (defaultEntry!3099 Int) (mask!7528 (_ BitVec 32)) (extraKeys!2840 (_ BitVec 32)) (zeroValue!2942 V!3771) (minValue!2942 V!3771) (_size!706 (_ BitVec 32)) (_keys!4874 array!5239) (_values!3082 array!5241) (_vacant!706 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1314)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155654 (= res!73533 (validMask!0 (mask!7528 thiss!1248)))))

(declare-fun b!155655 () Bool)

(declare-fun res!73530 () Bool)

(assert (=> b!155655 (=> (not res!73530) (not e!101693))))

(assert (=> b!155655 (= res!73530 (and (= (size!2756 (_values!3082 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7528 thiss!1248))) (= (size!2755 (_keys!4874 thiss!1248)) (size!2756 (_values!3082 thiss!1248))) (bvsge (mask!7528 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2840 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2840 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2840 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2840 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2840 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2840 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2840 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!155656 () Bool)

(declare-fun e!101694 () Bool)

(assert (=> b!155656 (= e!101694 tp_is_empty!3093)))

(declare-fun b!155657 () Bool)

(declare-fun res!73531 () Bool)

(assert (=> b!155657 (=> (not res!73531) (not e!101693))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5239 (_ BitVec 32)) Bool)

(assert (=> b!155657 (= res!73531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4874 thiss!1248) (mask!7528 thiss!1248)))))

(declare-fun b!155658 () Bool)

(declare-fun e!101697 () Bool)

(assert (=> b!155658 (= e!101697 (and e!101692 mapRes!5282))))

(declare-fun condMapEmpty!5282 () Bool)

(declare-fun mapDefault!5282 () ValueCell!1203)

(assert (=> b!155658 (= condMapEmpty!5282 (= (arr!2478 (_values!3082 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1203)) mapDefault!5282)))))

(declare-fun res!73534 () Bool)

(assert (=> start!15624 (=> (not res!73534) (not e!101693))))

(declare-fun valid!643 (LongMapFixedSize!1314) Bool)

(assert (=> start!15624 (= res!73534 (valid!643 thiss!1248))))

(assert (=> start!15624 e!101693))

(declare-fun e!101696 () Bool)

(assert (=> start!15624 e!101696))

(assert (=> start!15624 true))

(declare-fun mapNonEmpty!5282 () Bool)

(declare-fun tp!12397 () Bool)

(assert (=> mapNonEmpty!5282 (= mapRes!5282 (and tp!12397 e!101694))))

(declare-fun mapRest!5282 () (Array (_ BitVec 32) ValueCell!1203))

(declare-fun mapValue!5282 () ValueCell!1203)

(declare-fun mapKey!5282 () (_ BitVec 32))

(assert (=> mapNonEmpty!5282 (= (arr!2478 (_values!3082 thiss!1248)) (store mapRest!5282 mapKey!5282 mapValue!5282))))

(declare-fun array_inv!1563 (array!5239) Bool)

(declare-fun array_inv!1564 (array!5241) Bool)

(assert (=> b!155659 (= e!101696 (and tp!12398 tp_is_empty!3093 (array_inv!1563 (_keys!4874 thiss!1248)) (array_inv!1564 (_values!3082 thiss!1248)) e!101697))))

(declare-fun b!155660 () Bool)

(assert (=> b!155660 (= e!101693 false)))

(declare-fun lt!81388 () Bool)

(declare-datatypes ((List!1830 0))(
  ( (Nil!1827) (Cons!1826 (h!2435 (_ BitVec 64)) (t!6632 List!1830)) )
))
(declare-fun arrayNoDuplicates!0 (array!5239 (_ BitVec 32) List!1830) Bool)

(assert (=> b!155660 (= lt!81388 (arrayNoDuplicates!0 (_keys!4874 thiss!1248) #b00000000000000000000000000000000 Nil!1827))))

(assert (= (and start!15624 res!73534) b!155653))

(assert (= (and b!155653 res!73532) b!155654))

(assert (= (and b!155654 res!73533) b!155655))

(assert (= (and b!155655 res!73530) b!155657))

(assert (= (and b!155657 res!73531) b!155660))

(assert (= (and b!155658 condMapEmpty!5282) mapIsEmpty!5282))

(assert (= (and b!155658 (not condMapEmpty!5282)) mapNonEmpty!5282))

(get-info :version)

(assert (= (and mapNonEmpty!5282 ((_ is ValueCellFull!1203) mapValue!5282)) b!155656))

(assert (= (and b!155658 ((_ is ValueCellFull!1203) mapDefault!5282)) b!155652))

(assert (= b!155659 b!155658))

(assert (= start!15624 b!155659))

(declare-fun m!189449 () Bool)

(assert (=> b!155659 m!189449))

(declare-fun m!189451 () Bool)

(assert (=> b!155659 m!189451))

(declare-fun m!189453 () Bool)

(assert (=> mapNonEmpty!5282 m!189453))

(declare-fun m!189455 () Bool)

(assert (=> start!15624 m!189455))

(declare-fun m!189457 () Bool)

(assert (=> b!155657 m!189457))

(declare-fun m!189459 () Bool)

(assert (=> b!155654 m!189459))

(declare-fun m!189461 () Bool)

(assert (=> b!155660 m!189461))

(check-sat (not b!155660) (not b!155657) b_and!9705 (not b!155659) (not b!155654) (not start!15624) (not mapNonEmpty!5282) tp_is_empty!3093 (not b_next!3291))
(check-sat b_and!9705 (not b_next!3291))
