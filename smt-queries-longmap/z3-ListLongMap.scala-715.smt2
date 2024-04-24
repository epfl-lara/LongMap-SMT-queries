; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16798 () Bool)

(assert start!16798)

(declare-fun b!169178 () Bool)

(declare-fun b_free!4099 () Bool)

(declare-fun b_next!4099 () Bool)

(assert (=> b!169178 (= b_free!4099 (not b_next!4099))))

(declare-fun tp!14901 () Bool)

(declare-fun b_and!10527 () Bool)

(assert (=> b!169178 (= tp!14901 b_and!10527)))

(declare-fun b!169173 () Bool)

(declare-fun b_free!4101 () Bool)

(declare-fun b_next!4101 () Bool)

(assert (=> b!169173 (= b_free!4101 (not b_next!4101))))

(declare-fun tp!14904 () Bool)

(declare-fun b_and!10529 () Bool)

(assert (=> b!169173 (= tp!14904 b_and!10529)))

(declare-fun b!169168 () Bool)

(declare-fun e!111354 () Bool)

(declare-fun e!111351 () Bool)

(declare-fun mapRes!6572 () Bool)

(assert (=> b!169168 (= e!111354 (and e!111351 mapRes!6572))))

(declare-fun condMapEmpty!6573 () Bool)

(declare-datatypes ((V!4849 0))(
  ( (V!4850 (val!1995 Int)) )
))
(declare-datatypes ((ValueCell!1607 0))(
  ( (ValueCellFull!1607 (v!3861 V!4849)) (EmptyCell!1607) )
))
(declare-datatypes ((array!6885 0))(
  ( (array!6886 (arr!3278 (Array (_ BitVec 32) (_ BitVec 64))) (size!3566 (_ BitVec 32))) )
))
(declare-datatypes ((array!6887 0))(
  ( (array!6888 (arr!3279 (Array (_ BitVec 32) ValueCell!1607)) (size!3567 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2122 0))(
  ( (LongMapFixedSize!2123 (defaultEntry!3503 Int) (mask!8282 (_ BitVec 32)) (extraKeys!3244 (_ BitVec 32)) (zeroValue!3346 V!4849) (minValue!3346 V!4849) (_size!1110 (_ BitVec 32)) (_keys!5328 array!6885) (_values!3486 array!6887) (_vacant!1110 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2122)

(declare-fun mapDefault!6573 () ValueCell!1607)

(assert (=> b!169168 (= condMapEmpty!6573 (= (arr!3279 (_values!3486 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1607)) mapDefault!6573)))))

(declare-fun b!169169 () Bool)

(declare-fun res!80508 () Bool)

(declare-fun e!111358 () Bool)

(assert (=> b!169169 (=> (not res!80508) (not e!111358))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!169169 (= res!80508 (not (= key!828 (bvneg key!828))))))

(declare-fun b!169170 () Bool)

(declare-fun e!111353 () Bool)

(declare-fun tp_is_empty!3901 () Bool)

(assert (=> b!169170 (= e!111353 tp_is_empty!3901)))

(declare-fun b!169171 () Bool)

(declare-fun e!111357 () Bool)

(assert (=> b!169171 (= e!111358 e!111357)))

(declare-fun res!80506 () Bool)

(assert (=> b!169171 (=> (not res!80506) (not e!111357))))

(declare-datatypes ((SeekEntryResult!511 0))(
  ( (MissingZero!511 (index!4212 (_ BitVec 32))) (Found!511 (index!4213 (_ BitVec 32))) (Intermediate!511 (undefined!1323 Bool) (index!4214 (_ BitVec 32)) (x!18683 (_ BitVec 32))) (Undefined!511) (MissingVacant!511 (index!4215 (_ BitVec 32))) )
))
(declare-fun lt!84905 () SeekEntryResult!511)

(get-info :version)

(assert (=> b!169171 (= res!80506 (and (not ((_ is Undefined!511) lt!84905)) (not ((_ is MissingVacant!511) lt!84905)) (not ((_ is MissingZero!511) lt!84905)) (not ((_ is Found!511) lt!84905))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6885 (_ BitVec 32)) SeekEntryResult!511)

(assert (=> b!169171 (= lt!84905 (seekEntryOrOpen!0 key!828 (_keys!5328 thiss!1248) (mask!8282 thiss!1248)))))

(declare-fun b!169172 () Bool)

(assert (=> b!169172 (= e!111357 false)))

(declare-fun lt!84906 () Bool)

(declare-datatypes ((tuple2!3162 0))(
  ( (tuple2!3163 (_1!1592 Bool) (_2!1592 LongMapFixedSize!2122)) )
))
(declare-fun err!39 () tuple2!3162)

(declare-fun valid!927 (LongMapFixedSize!2122) Bool)

(assert (=> b!169172 (= lt!84906 (valid!927 (_2!1592 err!39)))))

(assert (=> b!169172 true))

(declare-fun e!111362 () Bool)

(assert (=> b!169172 e!111362))

(declare-fun res!80507 () Bool)

(assert (=> start!16798 (=> (not res!80507) (not e!111358))))

(assert (=> start!16798 (= res!80507 (valid!927 thiss!1248))))

(assert (=> start!16798 e!111358))

(declare-fun e!111355 () Bool)

(assert (=> start!16798 e!111355))

(assert (=> start!16798 true))

(declare-fun mapIsEmpty!6572 () Bool)

(assert (=> mapIsEmpty!6572 mapRes!6572))

(declare-fun array_inv!2099 (array!6885) Bool)

(declare-fun array_inv!2100 (array!6887) Bool)

(assert (=> b!169173 (= e!111355 (and tp!14904 tp_is_empty!3901 (array_inv!2099 (_keys!5328 thiss!1248)) (array_inv!2100 (_values!3486 thiss!1248)) e!111354))))

(declare-fun mapIsEmpty!6573 () Bool)

(declare-fun mapRes!6573 () Bool)

(assert (=> mapIsEmpty!6573 mapRes!6573))

(declare-fun b!169174 () Bool)

(declare-fun e!111361 () Bool)

(assert (=> b!169174 (= e!111361 tp_is_empty!3901)))

(declare-fun mapNonEmpty!6572 () Bool)

(declare-fun tp!14903 () Bool)

(assert (=> mapNonEmpty!6572 (= mapRes!6572 (and tp!14903 e!111361))))

(declare-fun mapKey!6573 () (_ BitVec 32))

(declare-fun mapRest!6572 () (Array (_ BitVec 32) ValueCell!1607))

(declare-fun mapValue!6573 () ValueCell!1607)

(assert (=> mapNonEmpty!6572 (= (arr!3279 (_values!3486 thiss!1248)) (store mapRest!6572 mapKey!6573 mapValue!6573))))

(declare-fun b!169175 () Bool)

(declare-fun e!111360 () Bool)

(assert (=> b!169175 (= e!111360 (and e!111353 mapRes!6573))))

(declare-fun condMapEmpty!6572 () Bool)

(declare-fun mapDefault!6572 () ValueCell!1607)

(assert (=> b!169175 (= condMapEmpty!6572 (= (arr!3279 (_values!3486 (_2!1592 err!39))) ((as const (Array (_ BitVec 32) ValueCell!1607)) mapDefault!6572)))))

(declare-fun b!169176 () Bool)

(declare-fun e!111359 () Bool)

(assert (=> b!169176 (= e!111359 tp_is_empty!3901)))

(declare-fun b!169177 () Bool)

(assert (=> b!169177 (= e!111351 tp_is_empty!3901)))

(assert (=> b!169178 (= e!111362 (and tp!14901 tp_is_empty!3901 (array_inv!2099 (_keys!5328 (_2!1592 err!39))) (array_inv!2100 (_values!3486 (_2!1592 err!39))) e!111360))))

(declare-fun mapNonEmpty!6573 () Bool)

(declare-fun tp!14902 () Bool)

(assert (=> mapNonEmpty!6573 (= mapRes!6573 (and tp!14902 e!111359))))

(declare-fun mapRest!6573 () (Array (_ BitVec 32) ValueCell!1607))

(declare-fun mapKey!6572 () (_ BitVec 32))

(declare-fun mapValue!6572 () ValueCell!1607)

(assert (=> mapNonEmpty!6573 (= (arr!3279 (_values!3486 (_2!1592 err!39))) (store mapRest!6573 mapKey!6572 mapValue!6572))))

(assert (= (and start!16798 res!80507) b!169169))

(assert (= (and b!169169 res!80508) b!169171))

(assert (= (and b!169171 res!80506) b!169172))

(assert (= (and b!169175 condMapEmpty!6572) mapIsEmpty!6573))

(assert (= (and b!169175 (not condMapEmpty!6572)) mapNonEmpty!6573))

(assert (= (and mapNonEmpty!6573 ((_ is ValueCellFull!1607) mapValue!6572)) b!169176))

(assert (= (and b!169175 ((_ is ValueCellFull!1607) mapDefault!6572)) b!169170))

(assert (= b!169178 b!169175))

(assert (= b!169172 b!169178))

(assert (= (and b!169168 condMapEmpty!6573) mapIsEmpty!6572))

(assert (= (and b!169168 (not condMapEmpty!6573)) mapNonEmpty!6572))

(assert (= (and mapNonEmpty!6572 ((_ is ValueCellFull!1607) mapValue!6573)) b!169174))

(assert (= (and b!169168 ((_ is ValueCellFull!1607) mapDefault!6573)) b!169177))

(assert (= b!169173 b!169168))

(assert (= start!16798 b!169173))

(declare-fun m!198461 () Bool)

(assert (=> mapNonEmpty!6573 m!198461))

(declare-fun m!198463 () Bool)

(assert (=> b!169178 m!198463))

(declare-fun m!198465 () Bool)

(assert (=> b!169178 m!198465))

(declare-fun m!198467 () Bool)

(assert (=> b!169173 m!198467))

(declare-fun m!198469 () Bool)

(assert (=> b!169173 m!198469))

(declare-fun m!198471 () Bool)

(assert (=> start!16798 m!198471))

(declare-fun m!198473 () Bool)

(assert (=> mapNonEmpty!6572 m!198473))

(declare-fun m!198475 () Bool)

(assert (=> b!169172 m!198475))

(declare-fun m!198477 () Bool)

(assert (=> b!169171 m!198477))

(check-sat (not mapNonEmpty!6572) (not b!169172) (not b!169178) (not b_next!4099) tp_is_empty!3901 (not b_next!4101) (not mapNonEmpty!6573) b_and!10529 (not start!16798) (not b!169171) (not b!169173) b_and!10527)
(check-sat b_and!10527 b_and!10529 (not b_next!4101) (not b_next!4099))
