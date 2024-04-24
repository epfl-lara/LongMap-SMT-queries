; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15458 () Bool)

(assert start!15458)

(declare-fun b!153613 () Bool)

(declare-fun b_free!3193 () Bool)

(declare-fun b_next!3193 () Bool)

(assert (=> b!153613 (= b_free!3193 (not b_next!3193))))

(declare-fun tp!12098 () Bool)

(declare-fun b_and!9569 () Bool)

(assert (=> b!153613 (= tp!12098 b_and!9569)))

(declare-fun b!153620 () Bool)

(declare-fun b_free!3195 () Bool)

(declare-fun b_next!3195 () Bool)

(assert (=> b!153620 (= b_free!3195 (not b_next!3195))))

(declare-fun tp!12097 () Bool)

(declare-fun b_and!9571 () Bool)

(assert (=> b!153620 (= tp!12097 b_and!9571)))

(declare-fun mapNonEmpty!5125 () Bool)

(declare-fun mapRes!5125 () Bool)

(declare-fun tp!12095 () Bool)

(declare-fun e!100307 () Bool)

(assert (=> mapNonEmpty!5125 (= mapRes!5125 (and tp!12095 e!100307))))

(declare-datatypes ((V!3665 0))(
  ( (V!3666 (val!1551 Int)) )
))
(declare-datatypes ((ValueCell!1163 0))(
  ( (ValueCellFull!1163 (v!3405 V!3665)) (EmptyCell!1163) )
))
(declare-fun mapRest!5126 () (Array (_ BitVec 32) ValueCell!1163))

(declare-fun mapValue!5126 () ValueCell!1163)

(declare-fun mapKey!5126 () (_ BitVec 32))

(declare-datatypes ((array!5061 0))(
  ( (array!5062 (arr!2390 (Array (_ BitVec 32) (_ BitVec 64))) (size!2667 (_ BitVec 32))) )
))
(declare-datatypes ((array!5063 0))(
  ( (array!5064 (arr!2391 (Array (_ BitVec 32) ValueCell!1163)) (size!2668 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1234 0))(
  ( (LongMapFixedSize!1235 (defaultEntry!3056 Int) (mask!7456 (_ BitVec 32)) (extraKeys!2797 (_ BitVec 32)) (zeroValue!2899 V!3665) (minValue!2899 V!3665) (_size!666 (_ BitVec 32)) (_keys!4829 array!5061) (_values!3039 array!5063) (_vacant!666 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1016 0))(
  ( (Cell!1017 (v!3406 LongMapFixedSize!1234)) )
))
(declare-datatypes ((LongMap!1016 0))(
  ( (LongMap!1017 (underlying!519 Cell!1016)) )
))
(declare-fun thiss!992 () LongMap!1016)

(assert (=> mapNonEmpty!5125 (= (arr!2391 (_values!3039 (v!3406 (underlying!519 thiss!992)))) (store mapRest!5126 mapKey!5126 mapValue!5126))))

(declare-fun b!153610 () Bool)

(declare-fun res!72593 () Bool)

(declare-fun e!100299 () Bool)

(assert (=> b!153610 (=> (not res!72593) (not e!100299))))

(declare-fun newMap!16 () LongMapFixedSize!1234)

(declare-fun valid!627 (LongMapFixedSize!1234) Bool)

(assert (=> b!153610 (= res!72593 (valid!627 newMap!16))))

(declare-fun mapIsEmpty!5125 () Bool)

(assert (=> mapIsEmpty!5125 mapRes!5125))

(declare-fun b!153611 () Bool)

(declare-fun e!100300 () Bool)

(declare-fun e!100305 () Bool)

(assert (=> b!153611 (= e!100300 e!100305)))

(declare-fun mapNonEmpty!5126 () Bool)

(declare-fun mapRes!5126 () Bool)

(declare-fun tp!12096 () Bool)

(declare-fun e!100297 () Bool)

(assert (=> mapNonEmpty!5126 (= mapRes!5126 (and tp!12096 e!100297))))

(declare-fun mapRest!5125 () (Array (_ BitVec 32) ValueCell!1163))

(declare-fun mapValue!5125 () ValueCell!1163)

(declare-fun mapKey!5125 () (_ BitVec 32))

(assert (=> mapNonEmpty!5126 (= (arr!2391 (_values!3039 newMap!16)) (store mapRest!5125 mapKey!5125 mapValue!5125))))

(declare-fun b!153612 () Bool)

(declare-fun tp_is_empty!3013 () Bool)

(assert (=> b!153612 (= e!100307 tp_is_empty!3013)))

(declare-fun mapIsEmpty!5126 () Bool)

(assert (=> mapIsEmpty!5126 mapRes!5126))

(declare-fun e!100296 () Bool)

(declare-fun array_inv!1505 (array!5061) Bool)

(declare-fun array_inv!1506 (array!5063) Bool)

(assert (=> b!153613 (= e!100305 (and tp!12098 tp_is_empty!3013 (array_inv!1505 (_keys!4829 (v!3406 (underlying!519 thiss!992)))) (array_inv!1506 (_values!3039 (v!3406 (underlying!519 thiss!992)))) e!100296))))

(declare-fun b!153614 () Bool)

(declare-fun e!100301 () Bool)

(declare-fun e!100295 () Bool)

(assert (=> b!153614 (= e!100301 (and e!100295 mapRes!5126))))

(declare-fun condMapEmpty!5125 () Bool)

(declare-fun mapDefault!5126 () ValueCell!1163)

(assert (=> b!153614 (= condMapEmpty!5125 (= (arr!2391 (_values!3039 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1163)) mapDefault!5126)))))

(declare-fun b!153615 () Bool)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!153615 (= e!100299 (and (or (= (select (arr!2390 (_keys!4829 (v!3406 (underlying!519 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!2390 (_keys!4829 (v!3406 (underlying!519 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!355 #b00000000000000000000000000000000) (bvsge (bvsub from!355 #b00000000000000000000000000000001) from!355)))))

(declare-fun b!153616 () Bool)

(declare-fun res!72597 () Bool)

(assert (=> b!153616 (=> (not res!72597) (not e!100299))))

(assert (=> b!153616 (= res!72597 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7456 newMap!16)) (_size!666 (v!3406 (underlying!519 thiss!992)))))))

(declare-fun res!72596 () Bool)

(assert (=> start!15458 (=> (not res!72596) (not e!100299))))

(declare-fun valid!628 (LongMap!1016) Bool)

(assert (=> start!15458 (= res!72596 (valid!628 thiss!992))))

(assert (=> start!15458 e!100299))

(declare-fun e!100306 () Bool)

(assert (=> start!15458 e!100306))

(assert (=> start!15458 true))

(declare-fun e!100304 () Bool)

(assert (=> start!15458 e!100304))

(declare-fun b!153617 () Bool)

(declare-fun res!72594 () Bool)

(assert (=> b!153617 (=> (not res!72594) (not e!100299))))

(declare-datatypes ((tuple2!2748 0))(
  ( (tuple2!2749 (_1!1385 (_ BitVec 64)) (_2!1385 V!3665)) )
))
(declare-datatypes ((List!1784 0))(
  ( (Nil!1781) (Cons!1780 (h!2389 tuple2!2748) (t!6566 List!1784)) )
))
(declare-datatypes ((ListLongMap!1753 0))(
  ( (ListLongMap!1754 (toList!892 List!1784)) )
))
(declare-fun getCurrentListMap!561 (array!5061 array!5063 (_ BitVec 32) (_ BitVec 32) V!3665 V!3665 (_ BitVec 32) Int) ListLongMap!1753)

(declare-fun map!1488 (LongMapFixedSize!1234) ListLongMap!1753)

(assert (=> b!153617 (= res!72594 (= (getCurrentListMap!561 (_keys!4829 (v!3406 (underlying!519 thiss!992))) (_values!3039 (v!3406 (underlying!519 thiss!992))) (mask!7456 (v!3406 (underlying!519 thiss!992))) (extraKeys!2797 (v!3406 (underlying!519 thiss!992))) (zeroValue!2899 (v!3406 (underlying!519 thiss!992))) (minValue!2899 (v!3406 (underlying!519 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3056 (v!3406 (underlying!519 thiss!992)))) (map!1488 newMap!16)))))

(declare-fun b!153618 () Bool)

(declare-fun e!100298 () Bool)

(assert (=> b!153618 (= e!100298 tp_is_empty!3013)))

(declare-fun b!153619 () Bool)

(assert (=> b!153619 (= e!100295 tp_is_empty!3013)))

(assert (=> b!153620 (= e!100304 (and tp!12097 tp_is_empty!3013 (array_inv!1505 (_keys!4829 newMap!16)) (array_inv!1506 (_values!3039 newMap!16)) e!100301))))

(declare-fun b!153621 () Bool)

(declare-fun res!72595 () Bool)

(assert (=> b!153621 (=> (not res!72595) (not e!100299))))

(assert (=> b!153621 (= res!72595 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2667 (_keys!4829 (v!3406 (underlying!519 thiss!992)))))))))

(declare-fun b!153622 () Bool)

(assert (=> b!153622 (= e!100296 (and e!100298 mapRes!5125))))

(declare-fun condMapEmpty!5126 () Bool)

(declare-fun mapDefault!5125 () ValueCell!1163)

(assert (=> b!153622 (= condMapEmpty!5126 (= (arr!2391 (_values!3039 (v!3406 (underlying!519 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1163)) mapDefault!5125)))))

(declare-fun b!153623 () Bool)

(assert (=> b!153623 (= e!100306 e!100300)))

(declare-fun b!153624 () Bool)

(assert (=> b!153624 (= e!100297 tp_is_empty!3013)))

(assert (= (and start!15458 res!72596) b!153621))

(assert (= (and b!153621 res!72595) b!153610))

(assert (= (and b!153610 res!72593) b!153616))

(assert (= (and b!153616 res!72597) b!153617))

(assert (= (and b!153617 res!72594) b!153615))

(assert (= (and b!153622 condMapEmpty!5126) mapIsEmpty!5125))

(assert (= (and b!153622 (not condMapEmpty!5126)) mapNonEmpty!5125))

(get-info :version)

(assert (= (and mapNonEmpty!5125 ((_ is ValueCellFull!1163) mapValue!5126)) b!153612))

(assert (= (and b!153622 ((_ is ValueCellFull!1163) mapDefault!5125)) b!153618))

(assert (= b!153613 b!153622))

(assert (= b!153611 b!153613))

(assert (= b!153623 b!153611))

(assert (= start!15458 b!153623))

(assert (= (and b!153614 condMapEmpty!5125) mapIsEmpty!5126))

(assert (= (and b!153614 (not condMapEmpty!5125)) mapNonEmpty!5126))

(assert (= (and mapNonEmpty!5126 ((_ is ValueCellFull!1163) mapValue!5125)) b!153624))

(assert (= (and b!153614 ((_ is ValueCellFull!1163) mapDefault!5126)) b!153619))

(assert (= b!153620 b!153614))

(assert (= start!15458 b!153620))

(declare-fun m!187641 () Bool)

(assert (=> mapNonEmpty!5125 m!187641))

(declare-fun m!187643 () Bool)

(assert (=> b!153620 m!187643))

(declare-fun m!187645 () Bool)

(assert (=> b!153620 m!187645))

(declare-fun m!187647 () Bool)

(assert (=> b!153615 m!187647))

(declare-fun m!187649 () Bool)

(assert (=> b!153617 m!187649))

(declare-fun m!187651 () Bool)

(assert (=> b!153617 m!187651))

(declare-fun m!187653 () Bool)

(assert (=> b!153613 m!187653))

(declare-fun m!187655 () Bool)

(assert (=> b!153613 m!187655))

(declare-fun m!187657 () Bool)

(assert (=> start!15458 m!187657))

(declare-fun m!187659 () Bool)

(assert (=> b!153610 m!187659))

(declare-fun m!187661 () Bool)

(assert (=> mapNonEmpty!5126 m!187661))

(check-sat (not mapNonEmpty!5125) (not b!153610) b_and!9569 tp_is_empty!3013 (not start!15458) (not b!153617) b_and!9571 (not b!153613) (not mapNonEmpty!5126) (not b_next!3193) (not b_next!3195) (not b!153620))
(check-sat b_and!9569 b_and!9571 (not b_next!3193) (not b_next!3195))
