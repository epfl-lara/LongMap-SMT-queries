; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75822 () Bool)

(assert start!75822)

(declare-fun b!890355 () Bool)

(declare-fun b_free!15625 () Bool)

(declare-fun b_next!15625 () Bool)

(assert (=> b!890355 (= b_free!15625 (not b_next!15625))))

(declare-fun tp!54844 () Bool)

(declare-fun b_and!25875 () Bool)

(assert (=> b!890355 (= tp!54844 b_and!25875)))

(declare-fun b!890347 () Bool)

(declare-fun res!603130 () Bool)

(declare-fun e!496372 () Bool)

(assert (=> b!890347 (=> (not res!603130) (not e!496372))))

(declare-datatypes ((array!51925 0))(
  ( (array!51926 (arr!24964 (Array (_ BitVec 32) (_ BitVec 64))) (size!25409 (_ BitVec 32))) )
))
(declare-datatypes ((V!28903 0))(
  ( (V!28904 (val!9027 Int)) )
))
(declare-datatypes ((ValueCell!8495 0))(
  ( (ValueCellFull!8495 (v!11502 V!28903)) (EmptyCell!8495) )
))
(declare-datatypes ((array!51927 0))(
  ( (array!51928 (arr!24965 (Array (_ BitVec 32) ValueCell!8495)) (size!25410 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4006 0))(
  ( (LongMapFixedSize!4007 (defaultEntry!5200 Int) (mask!25692 (_ BitVec 32)) (extraKeys!4894 (_ BitVec 32)) (zeroValue!4998 V!28903) (minValue!4998 V!28903) (_size!2058 (_ BitVec 32)) (_keys!9911 array!51925) (_values!5185 array!51927) (_vacant!2058 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4006)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51925 (_ BitVec 32)) Bool)

(assert (=> b!890347 (= res!603130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9911 thiss!1181) (mask!25692 thiss!1181)))))

(declare-fun b!890348 () Bool)

(declare-fun e!496377 () Bool)

(declare-fun e!496375 () Bool)

(declare-fun mapRes!28484 () Bool)

(assert (=> b!890348 (= e!496377 (and e!496375 mapRes!28484))))

(declare-fun condMapEmpty!28484 () Bool)

(declare-fun mapDefault!28484 () ValueCell!8495)

(assert (=> b!890348 (= condMapEmpty!28484 (= (arr!24965 (_values!5185 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8495)) mapDefault!28484)))))

(declare-fun b!890349 () Bool)

(declare-fun res!603133 () Bool)

(declare-fun e!496374 () Bool)

(assert (=> b!890349 (=> (not res!603133) (not e!496374))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!890349 (= res!603133 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890350 () Bool)

(declare-fun tp_is_empty!17953 () Bool)

(assert (=> b!890350 (= e!496375 tp_is_empty!17953)))

(declare-fun b!890351 () Bool)

(declare-fun e!496371 () Bool)

(assert (=> b!890351 (= e!496371 tp_is_empty!17953)))

(declare-fun mapNonEmpty!28484 () Bool)

(declare-fun tp!54845 () Bool)

(assert (=> mapNonEmpty!28484 (= mapRes!28484 (and tp!54845 e!496371))))

(declare-fun mapKey!28484 () (_ BitVec 32))

(declare-fun mapRest!28484 () (Array (_ BitVec 32) ValueCell!8495))

(declare-fun mapValue!28484 () ValueCell!8495)

(assert (=> mapNonEmpty!28484 (= (arr!24965 (_values!5185 thiss!1181)) (store mapRest!28484 mapKey!28484 mapValue!28484))))

(declare-fun res!603129 () Bool)

(assert (=> start!75822 (=> (not res!603129) (not e!496374))))

(declare-fun valid!1572 (LongMapFixedSize!4006) Bool)

(assert (=> start!75822 (= res!603129 (valid!1572 thiss!1181))))

(assert (=> start!75822 e!496374))

(declare-fun e!496373 () Bool)

(assert (=> start!75822 e!496373))

(assert (=> start!75822 true))

(declare-fun mapIsEmpty!28484 () Bool)

(assert (=> mapIsEmpty!28484 mapRes!28484))

(declare-fun b!890352 () Bool)

(assert (=> b!890352 (= e!496372 false)))

(declare-fun lt!402395 () Bool)

(declare-datatypes ((List!17656 0))(
  ( (Nil!17653) (Cons!17652 (h!18789 (_ BitVec 64)) (t!24947 List!17656)) )
))
(declare-fun arrayNoDuplicates!0 (array!51925 (_ BitVec 32) List!17656) Bool)

(assert (=> b!890352 (= lt!402395 (arrayNoDuplicates!0 (_keys!9911 thiss!1181) #b00000000000000000000000000000000 Nil!17653))))

(declare-fun b!890353 () Bool)

(assert (=> b!890353 (= e!496374 e!496372)))

(declare-fun res!603132 () Bool)

(assert (=> b!890353 (=> (not res!603132) (not e!496372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890353 (= res!603132 (validMask!0 (mask!25692 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8727 0))(
  ( (MissingZero!8727 (index!37279 (_ BitVec 32))) (Found!8727 (index!37280 (_ BitVec 32))) (Intermediate!8727 (undefined!9539 Bool) (index!37281 (_ BitVec 32)) (x!75485 (_ BitVec 32))) (Undefined!8727) (MissingVacant!8727 (index!37282 (_ BitVec 32))) )
))
(declare-fun lt!402394 () SeekEntryResult!8727)

(declare-fun seekEntry!0 ((_ BitVec 64) array!51925 (_ BitVec 32)) SeekEntryResult!8727)

(assert (=> b!890353 (= lt!402394 (seekEntry!0 key!785 (_keys!9911 thiss!1181) (mask!25692 thiss!1181)))))

(declare-fun b!890354 () Bool)

(declare-fun res!603131 () Bool)

(assert (=> b!890354 (=> (not res!603131) (not e!496372))))

(assert (=> b!890354 (= res!603131 (and (= (size!25410 (_values!5185 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25692 thiss!1181))) (= (size!25409 (_keys!9911 thiss!1181)) (size!25410 (_values!5185 thiss!1181))) (bvsge (mask!25692 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4894 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4894 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun array_inv!19680 (array!51925) Bool)

(declare-fun array_inv!19681 (array!51927) Bool)

(assert (=> b!890355 (= e!496373 (and tp!54844 tp_is_empty!17953 (array_inv!19680 (_keys!9911 thiss!1181)) (array_inv!19681 (_values!5185 thiss!1181)) e!496377))))

(assert (= (and start!75822 res!603129) b!890349))

(assert (= (and b!890349 res!603133) b!890353))

(assert (= (and b!890353 res!603132) b!890354))

(assert (= (and b!890354 res!603131) b!890347))

(assert (= (and b!890347 res!603130) b!890352))

(assert (= (and b!890348 condMapEmpty!28484) mapIsEmpty!28484))

(assert (= (and b!890348 (not condMapEmpty!28484)) mapNonEmpty!28484))

(get-info :version)

(assert (= (and mapNonEmpty!28484 ((_ is ValueCellFull!8495) mapValue!28484)) b!890351))

(assert (= (and b!890348 ((_ is ValueCellFull!8495) mapDefault!28484)) b!890350))

(assert (= b!890355 b!890348))

(assert (= start!75822 b!890355))

(declare-fun m!829651 () Bool)

(assert (=> b!890353 m!829651))

(declare-fun m!829653 () Bool)

(assert (=> b!890353 m!829653))

(declare-fun m!829655 () Bool)

(assert (=> b!890352 m!829655))

(declare-fun m!829657 () Bool)

(assert (=> start!75822 m!829657))

(declare-fun m!829659 () Bool)

(assert (=> b!890347 m!829659))

(declare-fun m!829661 () Bool)

(assert (=> mapNonEmpty!28484 m!829661))

(declare-fun m!829663 () Bool)

(assert (=> b!890355 m!829663))

(declare-fun m!829665 () Bool)

(assert (=> b!890355 m!829665))

(check-sat (not b_next!15625) (not b!890352) (not mapNonEmpty!28484) (not b!890347) (not start!75822) tp_is_empty!17953 b_and!25875 (not b!890355) (not b!890353))
(check-sat b_and!25875 (not b_next!15625))
