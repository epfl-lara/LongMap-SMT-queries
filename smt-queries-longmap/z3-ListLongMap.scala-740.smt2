; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17236 () Bool)

(assert start!17236)

(declare-fun b!172702 () Bool)

(declare-fun b_free!4279 () Bool)

(declare-fun b_next!4279 () Bool)

(assert (=> b!172702 (= b_free!4279 (not b_next!4279))))

(declare-fun tp!15495 () Bool)

(declare-fun b_and!10693 () Bool)

(assert (=> b!172702 (= tp!15495 b_and!10693)))

(declare-fun mapIsEmpty!6897 () Bool)

(declare-fun mapRes!6897 () Bool)

(assert (=> mapIsEmpty!6897 mapRes!6897))

(declare-fun b!172701 () Bool)

(declare-fun e!114030 () Bool)

(declare-fun tp_is_empty!4051 () Bool)

(assert (=> b!172701 (= e!114030 tp_is_empty!4051)))

(declare-fun e!114032 () Bool)

(declare-fun e!114028 () Bool)

(declare-datatypes ((V!5049 0))(
  ( (V!5050 (val!2070 Int)) )
))
(declare-datatypes ((ValueCell!1682 0))(
  ( (ValueCellFull!1682 (v!3932 V!5049)) (EmptyCell!1682) )
))
(declare-datatypes ((array!7209 0))(
  ( (array!7210 (arr!3424 (Array (_ BitVec 32) (_ BitVec 64))) (size!3724 (_ BitVec 32))) )
))
(declare-datatypes ((array!7211 0))(
  ( (array!7212 (arr!3425 (Array (_ BitVec 32) ValueCell!1682)) (size!3725 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2272 0))(
  ( (LongMapFixedSize!2273 (defaultEntry!3582 Int) (mask!8439 (_ BitVec 32)) (extraKeys!3321 (_ BitVec 32)) (zeroValue!3423 V!5049) (minValue!3425 V!5049) (_size!1185 (_ BitVec 32)) (_keys!5420 array!7209) (_values!3565 array!7211) (_vacant!1185 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2272)

(declare-fun array_inv!2207 (array!7209) Bool)

(declare-fun array_inv!2208 (array!7211) Bool)

(assert (=> b!172702 (= e!114028 (and tp!15495 tp_is_empty!4051 (array_inv!2207 (_keys!5420 thiss!1248)) (array_inv!2208 (_values!3565 thiss!1248)) e!114032))))

(declare-fun mapNonEmpty!6897 () Bool)

(declare-fun tp!15494 () Bool)

(assert (=> mapNonEmpty!6897 (= mapRes!6897 (and tp!15494 e!114030))))

(declare-fun mapValue!6897 () ValueCell!1682)

(declare-fun mapKey!6897 () (_ BitVec 32))

(declare-fun mapRest!6897 () (Array (_ BitVec 32) ValueCell!1682))

(assert (=> mapNonEmpty!6897 (= (arr!3425 (_values!3565 thiss!1248)) (store mapRest!6897 mapKey!6897 mapValue!6897))))

(declare-fun res!81974 () Bool)

(declare-fun e!114031 () Bool)

(assert (=> start!17236 (=> (not res!81974) (not e!114031))))

(declare-fun valid!982 (LongMapFixedSize!2272) Bool)

(assert (=> start!17236 (= res!81974 (valid!982 thiss!1248))))

(assert (=> start!17236 e!114031))

(assert (=> start!17236 e!114028))

(assert (=> start!17236 true))

(declare-fun b!172703 () Bool)

(declare-fun e!114033 () Bool)

(assert (=> b!172703 (= e!114033 tp_is_empty!4051)))

(declare-fun b!172704 () Bool)

(declare-fun res!81975 () Bool)

(assert (=> b!172704 (=> (not res!81975) (not e!114031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172704 (= res!81975 (validMask!0 (mask!8439 thiss!1248)))))

(declare-fun b!172705 () Bool)

(assert (=> b!172705 (= e!114031 (and (= (size!3725 (_values!3565 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8439 thiss!1248))) (= (size!3724 (_keys!5420 thiss!1248)) (size!3725 (_values!3565 thiss!1248))) (bvsge (mask!8439 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3321 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3321 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3321 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsgt (bvor (extraKeys!3321 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011)))))

(declare-fun b!172706 () Bool)

(declare-fun res!81976 () Bool)

(assert (=> b!172706 (=> (not res!81976) (not e!114031))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172706 (= res!81976 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!172707 () Bool)

(assert (=> b!172707 (= e!114032 (and e!114033 mapRes!6897))))

(declare-fun condMapEmpty!6897 () Bool)

(declare-fun mapDefault!6897 () ValueCell!1682)

(assert (=> b!172707 (= condMapEmpty!6897 (= (arr!3425 (_values!3565 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1682)) mapDefault!6897)))))

(assert (= (and start!17236 res!81974) b!172706))

(assert (= (and b!172706 res!81976) b!172704))

(assert (= (and b!172704 res!81975) b!172705))

(assert (= (and b!172707 condMapEmpty!6897) mapIsEmpty!6897))

(assert (= (and b!172707 (not condMapEmpty!6897)) mapNonEmpty!6897))

(get-info :version)

(assert (= (and mapNonEmpty!6897 ((_ is ValueCellFull!1682) mapValue!6897)) b!172701))

(assert (= (and b!172707 ((_ is ValueCellFull!1682) mapDefault!6897)) b!172703))

(assert (= b!172702 b!172707))

(assert (= start!17236 b!172702))

(declare-fun m!200803 () Bool)

(assert (=> b!172702 m!200803))

(declare-fun m!200805 () Bool)

(assert (=> b!172702 m!200805))

(declare-fun m!200807 () Bool)

(assert (=> mapNonEmpty!6897 m!200807))

(declare-fun m!200809 () Bool)

(assert (=> start!17236 m!200809))

(declare-fun m!200811 () Bool)

(assert (=> b!172704 m!200811))

(check-sat (not b!172702) (not b_next!4279) (not mapNonEmpty!6897) (not start!17236) tp_is_empty!4051 b_and!10693 (not b!172704))
(check-sat b_and!10693 (not b_next!4279))
