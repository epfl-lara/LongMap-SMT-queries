; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15066 () Bool)

(assert start!15066)

(declare-fun b!144577 () Bool)

(declare-fun b_free!3061 () Bool)

(declare-fun b_next!3061 () Bool)

(assert (=> b!144577 (= b_free!3061 (not b_next!3061))))

(declare-fun tp!11678 () Bool)

(declare-fun b_and!9013 () Bool)

(assert (=> b!144577 (= tp!11678 b_and!9013)))

(declare-fun b!144581 () Bool)

(declare-fun b_free!3063 () Bool)

(declare-fun b_next!3063 () Bool)

(assert (=> b!144581 (= b_free!3063 (not b_next!3063))))

(declare-fun tp!11675 () Bool)

(declare-fun b_and!9015 () Bool)

(assert (=> b!144581 (= tp!11675 b_and!9015)))

(declare-fun b!144563 () Bool)

(declare-fun e!94214 () Bool)

(declare-fun e!94212 () Bool)

(declare-fun mapRes!4904 () Bool)

(assert (=> b!144563 (= e!94214 (and e!94212 mapRes!4904))))

(declare-fun condMapEmpty!4904 () Bool)

(declare-datatypes ((V!3577 0))(
  ( (V!3578 (val!1518 Int)) )
))
(declare-datatypes ((array!4921 0))(
  ( (array!4922 (arr!2324 (Array (_ BitVec 32) (_ BitVec 64))) (size!2599 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1130 0))(
  ( (ValueCellFull!1130 (v!3319 V!3577)) (EmptyCell!1130) )
))
(declare-datatypes ((array!4923 0))(
  ( (array!4924 (arr!2325 (Array (_ BitVec 32) ValueCell!1130)) (size!2600 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1168 0))(
  ( (LongMapFixedSize!1169 (defaultEntry!2988 Int) (mask!7352 (_ BitVec 32)) (extraKeys!2735 (_ BitVec 32)) (zeroValue!2834 V!3577) (minValue!2834 V!3577) (_size!633 (_ BitVec 32)) (_keys!4755 array!4921) (_values!2971 array!4923) (_vacant!633 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!954 0))(
  ( (Cell!955 (v!3320 LongMapFixedSize!1168)) )
))
(declare-datatypes ((LongMap!954 0))(
  ( (LongMap!955 (underlying!488 Cell!954)) )
))
(declare-fun thiss!992 () LongMap!954)

(declare-fun mapDefault!4904 () ValueCell!1130)

(assert (=> b!144563 (= condMapEmpty!4904 (= (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1130)) mapDefault!4904)))))

(declare-fun b!144564 () Bool)

(declare-fun res!68859 () Bool)

(declare-fun e!94203 () Bool)

(assert (=> b!144564 (=> (not res!68859) (not e!94203))))

(declare-fun newMap!16 () LongMapFixedSize!1168)

(declare-fun valid!580 (LongMapFixedSize!1168) Bool)

(assert (=> b!144564 (= res!68859 (valid!580 newMap!16))))

(declare-fun mapNonEmpty!4903 () Bool)

(declare-fun tp!11676 () Bool)

(declare-fun e!94207 () Bool)

(assert (=> mapNonEmpty!4903 (= mapRes!4904 (and tp!11676 e!94207))))

(declare-fun mapKey!4904 () (_ BitVec 32))

(declare-fun mapValue!4903 () ValueCell!1130)

(declare-fun mapRest!4903 () (Array (_ BitVec 32) ValueCell!1130))

(assert (=> mapNonEmpty!4903 (= (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) (store mapRest!4903 mapKey!4904 mapValue!4903))))

(declare-fun mapIsEmpty!4903 () Bool)

(assert (=> mapIsEmpty!4903 mapRes!4904))

(declare-fun b!144565 () Bool)

(declare-fun res!68863 () Bool)

(declare-fun e!94204 () Bool)

(assert (=> b!144565 (=> res!68863 e!94204)))

(declare-datatypes ((List!1735 0))(
  ( (Nil!1732) (Cons!1731 (h!2339 (_ BitVec 64)) (t!6368 List!1735)) )
))
(declare-fun lt!75945 () List!1735)

(declare-fun contains!917 (List!1735 (_ BitVec 64)) Bool)

(assert (=> b!144565 (= res!68863 (contains!917 lt!75945 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun from!355 () (_ BitVec 32))

(declare-fun b!144566 () Bool)

(declare-fun arrayNoDuplicates!0 (array!4921 (_ BitVec 32) List!1735) Bool)

(assert (=> b!144566 (= e!94204 (arrayNoDuplicates!0 (_keys!4755 (v!3320 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!75945))))

(declare-fun b!144567 () Bool)

(declare-fun tp_is_empty!2947 () Bool)

(assert (=> b!144567 (= e!94212 tp_is_empty!2947)))

(declare-fun b!144569 () Bool)

(declare-fun e!94216 () Bool)

(declare-fun e!94205 () Bool)

(assert (=> b!144569 (= e!94216 e!94205)))

(declare-fun b!144570 () Bool)

(declare-fun e!94211 () Bool)

(assert (=> b!144570 (= e!94211 tp_is_empty!2947)))

(declare-fun b!144571 () Bool)

(declare-fun e!94202 () Bool)

(declare-fun e!94213 () Bool)

(declare-fun mapRes!4903 () Bool)

(assert (=> b!144571 (= e!94202 (and e!94213 mapRes!4903))))

(declare-fun condMapEmpty!4903 () Bool)

(declare-fun mapDefault!4903 () ValueCell!1130)

(assert (=> b!144571 (= condMapEmpty!4903 (= (arr!2325 (_values!2971 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1130)) mapDefault!4903)))))

(declare-fun b!144572 () Bool)

(declare-fun e!94201 () Bool)

(declare-fun e!94215 () Bool)

(assert (=> b!144572 (= e!94201 e!94215)))

(declare-fun res!68862 () Bool)

(assert (=> b!144572 (=> (not res!68862) (not e!94215))))

(declare-datatypes ((tuple2!2650 0))(
  ( (tuple2!2651 (_1!1336 (_ BitVec 64)) (_2!1336 V!3577)) )
))
(declare-datatypes ((List!1736 0))(
  ( (Nil!1733) (Cons!1732 (h!2340 tuple2!2650) (t!6369 List!1736)) )
))
(declare-datatypes ((ListLongMap!1699 0))(
  ( (ListLongMap!1700 (toList!865 List!1736)) )
))
(declare-fun lt!75946 () ListLongMap!1699)

(declare-fun contains!918 (ListLongMap!1699 (_ BitVec 64)) Bool)

(assert (=> b!144572 (= res!68862 (contains!918 lt!75946 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2652 0))(
  ( (tuple2!2653 (_1!1337 Bool) (_2!1337 LongMapFixedSize!1168)) )
))
(declare-fun lt!75948 () tuple2!2652)

(declare-fun update!216 (LongMapFixedSize!1168 (_ BitVec 64) V!3577) tuple2!2652)

(declare-fun get!1553 (ValueCell!1130 V!3577) V!3577)

(declare-fun dynLambda!446 (Int (_ BitVec 64)) V!3577)

(assert (=> b!144572 (= lt!75948 (update!216 newMap!16 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!144573 () Bool)

(assert (=> b!144573 (= e!94215 (not e!94204))))

(declare-fun res!68858 () Bool)

(assert (=> b!144573 (=> res!68858 e!94204)))

(assert (=> b!144573 (= res!68858 (or (bvsge (size!2599 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2599 (_keys!4755 (v!3320 (underlying!488 thiss!992)))))))))

(assert (=> b!144573 (= lt!75945 (Cons!1731 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) Nil!1732))))

(assert (=> b!144573 (arrayNoDuplicates!0 (_keys!4755 (v!3320 (underlying!488 thiss!992))) from!355 Nil!1732)))

(declare-datatypes ((Unit!4574 0))(
  ( (Unit!4575) )
))
(declare-fun lt!75943 () Unit!4574)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4921 (_ BitVec 32) (_ BitVec 32)) Unit!4574)

(assert (=> b!144573 (= lt!75943 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4755 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!4921 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!144573 (arrayContainsKey!0 (_keys!4755 (v!3320 (underlying!488 thiss!992))) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!75947 () Unit!4574)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!146 (array!4921 array!4923 (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 (_ BitVec 64) (_ BitVec 32) Int) Unit!4574)

(assert (=> b!144573 (= lt!75947 (lemmaListMapContainsThenArrayContainsFrom!146 (_keys!4755 (v!3320 (underlying!488 thiss!992))) (_values!2971 (v!3320 (underlying!488 thiss!992))) (mask!7352 (v!3320 (underlying!488 thiss!992))) (extraKeys!2735 (v!3320 (underlying!488 thiss!992))) (zeroValue!2834 (v!3320 (underlying!488 thiss!992))) (minValue!2834 (v!3320 (underlying!488 thiss!992))) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2988 (v!3320 (underlying!488 thiss!992)))))))

(declare-fun b!144574 () Bool)

(assert (=> b!144574 (= e!94203 e!94201)))

(declare-fun res!68860 () Bool)

(assert (=> b!144574 (=> (not res!68860) (not e!94201))))

(declare-fun lt!75944 () ListLongMap!1699)

(assert (=> b!144574 (= res!68860 (and (= lt!75944 lt!75946) (not (= (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1441 (LongMapFixedSize!1168) ListLongMap!1699)

(assert (=> b!144574 (= lt!75946 (map!1441 newMap!16))))

(declare-fun getCurrentListMap!537 (array!4921 array!4923 (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 (_ BitVec 32) Int) ListLongMap!1699)

(assert (=> b!144574 (= lt!75944 (getCurrentListMap!537 (_keys!4755 (v!3320 (underlying!488 thiss!992))) (_values!2971 (v!3320 (underlying!488 thiss!992))) (mask!7352 (v!3320 (underlying!488 thiss!992))) (extraKeys!2735 (v!3320 (underlying!488 thiss!992))) (zeroValue!2834 (v!3320 (underlying!488 thiss!992))) (minValue!2834 (v!3320 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2988 (v!3320 (underlying!488 thiss!992)))))))

(declare-fun mapNonEmpty!4904 () Bool)

(declare-fun tp!11677 () Bool)

(assert (=> mapNonEmpty!4904 (= mapRes!4903 (and tp!11677 e!94211))))

(declare-fun mapValue!4904 () ValueCell!1130)

(declare-fun mapKey!4903 () (_ BitVec 32))

(declare-fun mapRest!4904 () (Array (_ BitVec 32) ValueCell!1130))

(assert (=> mapNonEmpty!4904 (= (arr!2325 (_values!2971 newMap!16)) (store mapRest!4904 mapKey!4903 mapValue!4904))))

(declare-fun b!144575 () Bool)

(declare-fun res!68864 () Bool)

(assert (=> b!144575 (=> res!68864 e!94204)))

(declare-fun noDuplicate!54 (List!1735) Bool)

(assert (=> b!144575 (= res!68864 (not (noDuplicate!54 lt!75945)))))

(declare-fun b!144576 () Bool)

(declare-fun res!68865 () Bool)

(assert (=> b!144576 (=> res!68865 e!94204)))

(assert (=> b!144576 (= res!68865 (contains!917 lt!75945 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94210 () Bool)

(declare-fun array_inv!1451 (array!4921) Bool)

(declare-fun array_inv!1452 (array!4923) Bool)

(assert (=> b!144577 (= e!94210 (and tp!11678 tp_is_empty!2947 (array_inv!1451 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (array_inv!1452 (_values!2971 (v!3320 (underlying!488 thiss!992)))) e!94214))))

(declare-fun b!144578 () Bool)

(assert (=> b!144578 (= e!94205 e!94210)))

(declare-fun res!68866 () Bool)

(assert (=> start!15066 (=> (not res!68866) (not e!94203))))

(declare-fun valid!581 (LongMap!954) Bool)

(assert (=> start!15066 (= res!68866 (valid!581 thiss!992))))

(assert (=> start!15066 e!94203))

(assert (=> start!15066 e!94216))

(assert (=> start!15066 true))

(declare-fun e!94209 () Bool)

(assert (=> start!15066 e!94209))

(declare-fun b!144568 () Bool)

(assert (=> b!144568 (= e!94207 tp_is_empty!2947)))

(declare-fun b!144579 () Bool)

(declare-fun res!68857 () Bool)

(assert (=> b!144579 (=> (not res!68857) (not e!94203))))

(assert (=> b!144579 (= res!68857 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7352 newMap!16)) (_size!633 (v!3320 (underlying!488 thiss!992)))))))

(declare-fun b!144580 () Bool)

(assert (=> b!144580 (= e!94213 tp_is_empty!2947)))

(assert (=> b!144581 (= e!94209 (and tp!11675 tp_is_empty!2947 (array_inv!1451 (_keys!4755 newMap!16)) (array_inv!1452 (_values!2971 newMap!16)) e!94202))))

(declare-fun mapIsEmpty!4904 () Bool)

(assert (=> mapIsEmpty!4904 mapRes!4903))

(declare-fun b!144582 () Bool)

(declare-fun res!68861 () Bool)

(assert (=> b!144582 (=> (not res!68861) (not e!94203))))

(assert (=> b!144582 (= res!68861 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2599 (_keys!4755 (v!3320 (underlying!488 thiss!992)))))))))

(assert (= (and start!15066 res!68866) b!144582))

(assert (= (and b!144582 res!68861) b!144564))

(assert (= (and b!144564 res!68859) b!144579))

(assert (= (and b!144579 res!68857) b!144574))

(assert (= (and b!144574 res!68860) b!144572))

(assert (= (and b!144572 res!68862) b!144573))

(assert (= (and b!144573 (not res!68858)) b!144575))

(assert (= (and b!144575 (not res!68864)) b!144576))

(assert (= (and b!144576 (not res!68865)) b!144565))

(assert (= (and b!144565 (not res!68863)) b!144566))

(assert (= (and b!144563 condMapEmpty!4904) mapIsEmpty!4903))

(assert (= (and b!144563 (not condMapEmpty!4904)) mapNonEmpty!4903))

(get-info :version)

(assert (= (and mapNonEmpty!4903 ((_ is ValueCellFull!1130) mapValue!4903)) b!144568))

(assert (= (and b!144563 ((_ is ValueCellFull!1130) mapDefault!4904)) b!144567))

(assert (= b!144577 b!144563))

(assert (= b!144578 b!144577))

(assert (= b!144569 b!144578))

(assert (= start!15066 b!144569))

(assert (= (and b!144571 condMapEmpty!4903) mapIsEmpty!4904))

(assert (= (and b!144571 (not condMapEmpty!4903)) mapNonEmpty!4904))

(assert (= (and mapNonEmpty!4904 ((_ is ValueCellFull!1130) mapValue!4904)) b!144570))

(assert (= (and b!144571 ((_ is ValueCellFull!1130) mapDefault!4903)) b!144580))

(assert (= b!144581 b!144571))

(assert (= start!15066 b!144581))

(declare-fun b_lambda!6501 () Bool)

(assert (=> (not b_lambda!6501) (not b!144572)))

(declare-fun t!6365 () Bool)

(declare-fun tb!2593 () Bool)

(assert (=> (and b!144577 (= (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) (defaultEntry!2988 (v!3320 (underlying!488 thiss!992)))) t!6365) tb!2593))

(declare-fun result!4247 () Bool)

(assert (=> tb!2593 (= result!4247 tp_is_empty!2947)))

(assert (=> b!144572 t!6365))

(declare-fun b_and!9017 () Bool)

(assert (= b_and!9013 (and (=> t!6365 result!4247) b_and!9017)))

(declare-fun tb!2595 () Bool)

(declare-fun t!6367 () Bool)

(assert (=> (and b!144581 (= (defaultEntry!2988 newMap!16) (defaultEntry!2988 (v!3320 (underlying!488 thiss!992)))) t!6367) tb!2595))

(declare-fun result!4251 () Bool)

(assert (= result!4251 result!4247))

(assert (=> b!144572 t!6367))

(declare-fun b_and!9019 () Bool)

(assert (= b_and!9015 (and (=> t!6367 result!4251) b_and!9019)))

(declare-fun m!174415 () Bool)

(assert (=> b!144564 m!174415))

(declare-fun m!174417 () Bool)

(assert (=> b!144574 m!174417))

(declare-fun m!174419 () Bool)

(assert (=> b!144574 m!174419))

(declare-fun m!174421 () Bool)

(assert (=> b!144574 m!174421))

(declare-fun m!174423 () Bool)

(assert (=> b!144573 m!174423))

(declare-fun m!174425 () Bool)

(assert (=> b!144573 m!174425))

(assert (=> b!144573 m!174417))

(declare-fun m!174427 () Bool)

(assert (=> b!144573 m!174427))

(assert (=> b!144573 m!174417))

(assert (=> b!144573 m!174417))

(declare-fun m!174429 () Bool)

(assert (=> b!144573 m!174429))

(declare-fun m!174431 () Bool)

(assert (=> mapNonEmpty!4903 m!174431))

(declare-fun m!174433 () Bool)

(assert (=> start!15066 m!174433))

(declare-fun m!174435 () Bool)

(assert (=> b!144576 m!174435))

(declare-fun m!174437 () Bool)

(assert (=> b!144581 m!174437))

(declare-fun m!174439 () Bool)

(assert (=> b!144581 m!174439))

(declare-fun m!174441 () Bool)

(assert (=> mapNonEmpty!4904 m!174441))

(declare-fun m!174443 () Bool)

(assert (=> b!144577 m!174443))

(declare-fun m!174445 () Bool)

(assert (=> b!144577 m!174445))

(declare-fun m!174447 () Bool)

(assert (=> b!144575 m!174447))

(declare-fun m!174449 () Bool)

(assert (=> b!144572 m!174449))

(declare-fun m!174451 () Bool)

(assert (=> b!144572 m!174451))

(declare-fun m!174453 () Bool)

(assert (=> b!144572 m!174453))

(assert (=> b!144572 m!174417))

(assert (=> b!144572 m!174417))

(declare-fun m!174455 () Bool)

(assert (=> b!144572 m!174455))

(assert (=> b!144572 m!174451))

(assert (=> b!144572 m!174417))

(assert (=> b!144572 m!174453))

(declare-fun m!174457 () Bool)

(assert (=> b!144572 m!174457))

(assert (=> b!144572 m!174449))

(declare-fun m!174459 () Bool)

(assert (=> b!144565 m!174459))

(declare-fun m!174461 () Bool)

(assert (=> b!144566 m!174461))

(check-sat (not mapNonEmpty!4903) (not b!144581) b_and!9019 (not b!144566) (not b_lambda!6501) (not b_next!3061) (not mapNonEmpty!4904) (not b!144576) (not b!144574) (not b!144572) (not b!144577) (not b!144565) (not b!144575) (not b_next!3063) tp_is_empty!2947 b_and!9017 (not b!144564) (not b!144573) (not start!15066))
(check-sat b_and!9017 b_and!9019 (not b_next!3061) (not b_next!3063))
(get-model)

(declare-fun b_lambda!6507 () Bool)

(assert (= b_lambda!6501 (or (and b!144577 b_free!3061) (and b!144581 b_free!3063 (= (defaultEntry!2988 newMap!16) (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))))) b_lambda!6507)))

(check-sat (not mapNonEmpty!4903) (not b!144581) b_and!9019 (not b!144566) (not b_next!3061) (not mapNonEmpty!4904) (not b_lambda!6507) (not b!144576) (not b!144574) (not b!144572) (not b!144577) (not b!144565) (not b!144575) (not b_next!3063) tp_is_empty!2947 b_and!9017 (not b!144564) (not b!144573) (not start!15066))
(check-sat b_and!9017 b_and!9019 (not b_next!3061) (not b_next!3063))
(get-model)

(declare-fun d!46115 () Bool)

(assert (=> d!46115 (= (array_inv!1451 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvsge (size!2599 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!144577 d!46115))

(declare-fun d!46117 () Bool)

(assert (=> d!46117 (= (array_inv!1452 (_values!2971 (v!3320 (underlying!488 thiss!992)))) (bvsge (size!2600 (_values!2971 (v!3320 (underlying!488 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!144577 d!46117))

(declare-fun d!46119 () Bool)

(declare-fun res!68933 () Bool)

(declare-fun e!94315 () Bool)

(assert (=> d!46119 (=> (not res!68933) (not e!94315))))

(declare-fun simpleValid!99 (LongMapFixedSize!1168) Bool)

(assert (=> d!46119 (= res!68933 (simpleValid!99 newMap!16))))

(assert (=> d!46119 (= (valid!580 newMap!16) e!94315)))

(declare-fun b!144715 () Bool)

(declare-fun res!68934 () Bool)

(assert (=> b!144715 (=> (not res!68934) (not e!94315))))

(declare-fun arrayCountValidKeys!0 (array!4921 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!144715 (= res!68934 (= (arrayCountValidKeys!0 (_keys!4755 newMap!16) #b00000000000000000000000000000000 (size!2599 (_keys!4755 newMap!16))) (_size!633 newMap!16)))))

(declare-fun b!144716 () Bool)

(declare-fun res!68935 () Bool)

(assert (=> b!144716 (=> (not res!68935) (not e!94315))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4921 (_ BitVec 32)) Bool)

(assert (=> b!144716 (= res!68935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4755 newMap!16) (mask!7352 newMap!16)))))

(declare-fun b!144717 () Bool)

(assert (=> b!144717 (= e!94315 (arrayNoDuplicates!0 (_keys!4755 newMap!16) #b00000000000000000000000000000000 Nil!1732))))

(assert (= (and d!46119 res!68933) b!144715))

(assert (= (and b!144715 res!68934) b!144716))

(assert (= (and b!144716 res!68935) b!144717))

(declare-fun m!174559 () Bool)

(assert (=> d!46119 m!174559))

(declare-fun m!174561 () Bool)

(assert (=> b!144715 m!174561))

(declare-fun m!174563 () Bool)

(assert (=> b!144716 m!174563))

(declare-fun m!174565 () Bool)

(assert (=> b!144717 m!174565))

(assert (=> b!144564 d!46119))

(declare-fun b!144728 () Bool)

(declare-fun e!94326 () Bool)

(declare-fun call!16082 () Bool)

(assert (=> b!144728 (= e!94326 call!16082)))

(declare-fun b!144730 () Bool)

(declare-fun e!94327 () Bool)

(declare-fun e!94324 () Bool)

(assert (=> b!144730 (= e!94327 e!94324)))

(declare-fun res!68944 () Bool)

(assert (=> b!144730 (=> (not res!68944) (not e!94324))))

(declare-fun e!94325 () Bool)

(assert (=> b!144730 (= res!68944 (not e!94325))))

(declare-fun res!68942 () Bool)

(assert (=> b!144730 (=> (not res!68942) (not e!94325))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!144730 (= res!68942 (validKeyInArray!0 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun b!144731 () Bool)

(assert (=> b!144731 (= e!94326 call!16082)))

(declare-fun bm!16079 () Bool)

(declare-fun c!27380 () Bool)

(assert (=> bm!16079 (= call!16082 (arrayNoDuplicates!0 (_keys!4755 (v!3320 (underlying!488 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!27380 (Cons!1731 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) Nil!1732) Nil!1732)))))

(declare-fun b!144732 () Bool)

(assert (=> b!144732 (= e!94324 e!94326)))

(assert (=> b!144732 (= c!27380 (validKeyInArray!0 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun b!144729 () Bool)

(assert (=> b!144729 (= e!94325 (contains!917 Nil!1732 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun d!46121 () Bool)

(declare-fun res!68943 () Bool)

(assert (=> d!46121 (=> res!68943 e!94327)))

(assert (=> d!46121 (= res!68943 (bvsge from!355 (size!2599 (_keys!4755 (v!3320 (underlying!488 thiss!992))))))))

(assert (=> d!46121 (= (arrayNoDuplicates!0 (_keys!4755 (v!3320 (underlying!488 thiss!992))) from!355 Nil!1732) e!94327)))

(assert (= (and d!46121 (not res!68943)) b!144730))

(assert (= (and b!144730 res!68942) b!144729))

(assert (= (and b!144730 res!68944) b!144732))

(assert (= (and b!144732 c!27380) b!144728))

(assert (= (and b!144732 (not c!27380)) b!144731))

(assert (= (or b!144728 b!144731) bm!16079))

(assert (=> b!144730 m!174417))

(assert (=> b!144730 m!174417))

(declare-fun m!174567 () Bool)

(assert (=> b!144730 m!174567))

(assert (=> bm!16079 m!174417))

(declare-fun m!174569 () Bool)

(assert (=> bm!16079 m!174569))

(assert (=> b!144732 m!174417))

(assert (=> b!144732 m!174417))

(assert (=> b!144732 m!174567))

(assert (=> b!144729 m!174417))

(assert (=> b!144729 m!174417))

(declare-fun m!174571 () Bool)

(assert (=> b!144729 m!174571))

(assert (=> b!144573 d!46121))

(declare-fun d!46123 () Bool)

(assert (=> d!46123 (arrayNoDuplicates!0 (_keys!4755 (v!3320 (underlying!488 thiss!992))) from!355 Nil!1732)))

(declare-fun lt!75987 () Unit!4574)

(declare-fun choose!39 (array!4921 (_ BitVec 32) (_ BitVec 32)) Unit!4574)

(assert (=> d!46123 (= lt!75987 (choose!39 (_keys!4755 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!46123 (bvslt (size!2599 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!46123 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4755 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000000 from!355) lt!75987)))

(declare-fun bs!6112 () Bool)

(assert (= bs!6112 d!46123))

(assert (=> bs!6112 m!174425))

(declare-fun m!174573 () Bool)

(assert (=> bs!6112 m!174573))

(assert (=> b!144573 d!46123))

(declare-fun d!46125 () Bool)

(declare-fun res!68949 () Bool)

(declare-fun e!94332 () Bool)

(assert (=> d!46125 (=> res!68949 e!94332)))

(assert (=> d!46125 (= res!68949 (= (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (=> d!46125 (= (arrayContainsKey!0 (_keys!4755 (v!3320 (underlying!488 thiss!992))) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!94332)))

(declare-fun b!144737 () Bool)

(declare-fun e!94333 () Bool)

(assert (=> b!144737 (= e!94332 e!94333)))

(declare-fun res!68950 () Bool)

(assert (=> b!144737 (=> (not res!68950) (not e!94333))))

(assert (=> b!144737 (= res!68950 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2599 (_keys!4755 (v!3320 (underlying!488 thiss!992))))))))

(declare-fun b!144738 () Bool)

(assert (=> b!144738 (= e!94333 (arrayContainsKey!0 (_keys!4755 (v!3320 (underlying!488 thiss!992))) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!46125 (not res!68949)) b!144737))

(assert (= (and b!144737 res!68950) b!144738))

(declare-fun m!174575 () Bool)

(assert (=> d!46125 m!174575))

(assert (=> b!144738 m!174417))

(declare-fun m!174577 () Bool)

(assert (=> b!144738 m!174577))

(assert (=> b!144573 d!46125))

(declare-fun d!46127 () Bool)

(declare-fun e!94336 () Bool)

(assert (=> d!46127 e!94336))

(declare-fun c!27383 () Bool)

(assert (=> d!46127 (= c!27383 (and (not (= (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!75990 () Unit!4574)

(declare-fun choose!896 (array!4921 array!4923 (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 (_ BitVec 64) (_ BitVec 32) Int) Unit!4574)

(assert (=> d!46127 (= lt!75990 (choose!896 (_keys!4755 (v!3320 (underlying!488 thiss!992))) (_values!2971 (v!3320 (underlying!488 thiss!992))) (mask!7352 (v!3320 (underlying!488 thiss!992))) (extraKeys!2735 (v!3320 (underlying!488 thiss!992))) (zeroValue!2834 (v!3320 (underlying!488 thiss!992))) (minValue!2834 (v!3320 (underlying!488 thiss!992))) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2988 (v!3320 (underlying!488 thiss!992)))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!46127 (validMask!0 (mask!7352 (v!3320 (underlying!488 thiss!992))))))

(assert (=> d!46127 (= (lemmaListMapContainsThenArrayContainsFrom!146 (_keys!4755 (v!3320 (underlying!488 thiss!992))) (_values!2971 (v!3320 (underlying!488 thiss!992))) (mask!7352 (v!3320 (underlying!488 thiss!992))) (extraKeys!2735 (v!3320 (underlying!488 thiss!992))) (zeroValue!2834 (v!3320 (underlying!488 thiss!992))) (minValue!2834 (v!3320 (underlying!488 thiss!992))) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2988 (v!3320 (underlying!488 thiss!992)))) lt!75990)))

(declare-fun b!144743 () Bool)

(assert (=> b!144743 (= e!94336 (arrayContainsKey!0 (_keys!4755 (v!3320 (underlying!488 thiss!992))) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!144744 () Bool)

(assert (=> b!144744 (= e!94336 (ite (= (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2735 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2735 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!46127 c!27383) b!144743))

(assert (= (and d!46127 (not c!27383)) b!144744))

(assert (=> d!46127 m!174417))

(declare-fun m!174579 () Bool)

(assert (=> d!46127 m!174579))

(declare-fun m!174581 () Bool)

(assert (=> d!46127 m!174581))

(assert (=> b!144743 m!174417))

(assert (=> b!144743 m!174429))

(assert (=> b!144573 d!46127))

(declare-fun d!46129 () Bool)

(assert (=> d!46129 (= (map!1441 newMap!16) (getCurrentListMap!537 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun bs!6113 () Bool)

(assert (= bs!6113 d!46129))

(declare-fun m!174583 () Bool)

(assert (=> bs!6113 m!174583))

(assert (=> b!144574 d!46129))

(declare-fun bm!16094 () Bool)

(declare-fun call!16101 () ListLongMap!1699)

(declare-fun call!16102 () ListLongMap!1699)

(assert (=> bm!16094 (= call!16101 call!16102)))

(declare-fun b!144787 () Bool)

(declare-fun c!27398 () Bool)

(assert (=> b!144787 (= c!27398 (and (not (= (bvand (extraKeys!2735 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2735 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!94364 () ListLongMap!1699)

(declare-fun e!94368 () ListLongMap!1699)

(assert (=> b!144787 (= e!94364 e!94368)))

(declare-fun b!144788 () Bool)

(declare-fun e!94372 () Bool)

(assert (=> b!144788 (= e!94372 (validKeyInArray!0 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!144790 () Bool)

(declare-fun call!16099 () ListLongMap!1699)

(assert (=> b!144790 (= e!94368 call!16099)))

(declare-fun b!144791 () Bool)

(declare-fun e!94375 () Bool)

(declare-fun e!94370 () Bool)

(assert (=> b!144791 (= e!94375 e!94370)))

(declare-fun res!68977 () Bool)

(declare-fun call!16100 () Bool)

(assert (=> b!144791 (= res!68977 call!16100)))

(assert (=> b!144791 (=> (not res!68977) (not e!94370))))

(declare-fun b!144792 () Bool)

(declare-fun e!94374 () Bool)

(assert (=> b!144792 (= e!94374 e!94375)))

(declare-fun c!27400 () Bool)

(assert (=> b!144792 (= c!27400 (not (= (bvand (extraKeys!2735 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!16095 () Bool)

(declare-fun call!16097 () Bool)

(declare-fun lt!76053 () ListLongMap!1699)

(assert (=> bm!16095 (= call!16097 (contains!918 lt!76053 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!16096 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!143 (array!4921 array!4923 (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 (_ BitVec 32) Int) ListLongMap!1699)

(assert (=> bm!16096 (= call!16102 (getCurrentListMapNoExtraKeys!143 (_keys!4755 (v!3320 (underlying!488 thiss!992))) (_values!2971 (v!3320 (underlying!488 thiss!992))) (mask!7352 (v!3320 (underlying!488 thiss!992))) (extraKeys!2735 (v!3320 (underlying!488 thiss!992))) (zeroValue!2834 (v!3320 (underlying!488 thiss!992))) (minValue!2834 (v!3320 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2988 (v!3320 (underlying!488 thiss!992)))))))

(declare-fun b!144793 () Bool)

(declare-fun e!94365 () Bool)

(declare-fun apply!123 (ListLongMap!1699 (_ BitVec 64)) V!3577)

(assert (=> b!144793 (= e!94365 (= (apply!123 lt!76053 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2834 (v!3320 (underlying!488 thiss!992)))))))

(declare-fun bm!16097 () Bool)

(declare-fun call!16103 () ListLongMap!1699)

(assert (=> bm!16097 (= call!16103 call!16101)))

(declare-fun b!144794 () Bool)

(declare-fun e!94367 () ListLongMap!1699)

(assert (=> b!144794 (= e!94367 e!94364)))

(declare-fun c!27399 () Bool)

(assert (=> b!144794 (= c!27399 (and (not (= (bvand (extraKeys!2735 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2735 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!94373 () Bool)

(declare-fun b!144795 () Bool)

(assert (=> b!144795 (= e!94373 (= (apply!123 lt!76053 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!144795 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2600 (_values!2971 (v!3320 (underlying!488 thiss!992))))))))

(assert (=> b!144795 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2599 (_keys!4755 (v!3320 (underlying!488 thiss!992))))))))

(declare-fun bm!16098 () Bool)

(declare-fun call!16098 () ListLongMap!1699)

(declare-fun c!27397 () Bool)

(declare-fun +!176 (ListLongMap!1699 tuple2!2650) ListLongMap!1699)

(assert (=> bm!16098 (= call!16098 (+!176 (ite c!27397 call!16102 (ite c!27399 call!16101 call!16103)) (ite (or c!27397 c!27399) (tuple2!2651 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2834 (v!3320 (underlying!488 thiss!992)))) (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3320 (underlying!488 thiss!992)))))))))

(declare-fun b!144796 () Bool)

(declare-fun e!94366 () Bool)

(assert (=> b!144796 (= e!94366 (not call!16097))))

(declare-fun b!144789 () Bool)

(assert (=> b!144789 (= e!94367 (+!176 call!16098 (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3320 (underlying!488 thiss!992))))))))

(declare-fun d!46131 () Bool)

(assert (=> d!46131 e!94374))

(declare-fun res!68975 () Bool)

(assert (=> d!46131 (=> (not res!68975) (not e!94374))))

(assert (=> d!46131 (= res!68975 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2599 (_keys!4755 (v!3320 (underlying!488 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2599 (_keys!4755 (v!3320 (underlying!488 thiss!992))))))))))

(declare-fun lt!76045 () ListLongMap!1699)

(assert (=> d!46131 (= lt!76053 lt!76045)))

(declare-fun lt!76051 () Unit!4574)

(declare-fun e!94371 () Unit!4574)

(assert (=> d!46131 (= lt!76051 e!94371)))

(declare-fun c!27396 () Bool)

(assert (=> d!46131 (= c!27396 e!94372)))

(declare-fun res!68974 () Bool)

(assert (=> d!46131 (=> (not res!68974) (not e!94372))))

(assert (=> d!46131 (= res!68974 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2599 (_keys!4755 (v!3320 (underlying!488 thiss!992))))))))

(assert (=> d!46131 (= lt!76045 e!94367)))

(assert (=> d!46131 (= c!27397 (and (not (= (bvand (extraKeys!2735 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2735 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!46131 (validMask!0 (mask!7352 (v!3320 (underlying!488 thiss!992))))))

(assert (=> d!46131 (= (getCurrentListMap!537 (_keys!4755 (v!3320 (underlying!488 thiss!992))) (_values!2971 (v!3320 (underlying!488 thiss!992))) (mask!7352 (v!3320 (underlying!488 thiss!992))) (extraKeys!2735 (v!3320 (underlying!488 thiss!992))) (zeroValue!2834 (v!3320 (underlying!488 thiss!992))) (minValue!2834 (v!3320 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2988 (v!3320 (underlying!488 thiss!992)))) lt!76053)))

(declare-fun bm!16099 () Bool)

(assert (=> bm!16099 (= call!16099 call!16098)))

(declare-fun b!144797 () Bool)

(declare-fun res!68973 () Bool)

(assert (=> b!144797 (=> (not res!68973) (not e!94374))))

(declare-fun e!94363 () Bool)

(assert (=> b!144797 (= res!68973 e!94363)))

(declare-fun res!68972 () Bool)

(assert (=> b!144797 (=> res!68972 e!94363)))

(declare-fun e!94369 () Bool)

(assert (=> b!144797 (= res!68972 (not e!94369))))

(declare-fun res!68969 () Bool)

(assert (=> b!144797 (=> (not res!68969) (not e!94369))))

(assert (=> b!144797 (= res!68969 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2599 (_keys!4755 (v!3320 (underlying!488 thiss!992))))))))

(declare-fun b!144798 () Bool)

(assert (=> b!144798 (= e!94370 (= (apply!123 lt!76053 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2834 (v!3320 (underlying!488 thiss!992)))))))

(declare-fun b!144799 () Bool)

(declare-fun Unit!4576 () Unit!4574)

(assert (=> b!144799 (= e!94371 Unit!4576)))

(declare-fun b!144800 () Bool)

(assert (=> b!144800 (= e!94363 e!94373)))

(declare-fun res!68971 () Bool)

(assert (=> b!144800 (=> (not res!68971) (not e!94373))))

(assert (=> b!144800 (= res!68971 (contains!918 lt!76053 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!144800 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2599 (_keys!4755 (v!3320 (underlying!488 thiss!992))))))))

(declare-fun bm!16100 () Bool)

(assert (=> bm!16100 (= call!16100 (contains!918 lt!76053 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144801 () Bool)

(assert (=> b!144801 (= e!94366 e!94365)))

(declare-fun res!68970 () Bool)

(assert (=> b!144801 (= res!68970 call!16097)))

(assert (=> b!144801 (=> (not res!68970) (not e!94365))))

(declare-fun b!144802 () Bool)

(assert (=> b!144802 (= e!94368 call!16103)))

(declare-fun b!144803 () Bool)

(declare-fun lt!76042 () Unit!4574)

(assert (=> b!144803 (= e!94371 lt!76042)))

(declare-fun lt!76046 () ListLongMap!1699)

(assert (=> b!144803 (= lt!76046 (getCurrentListMapNoExtraKeys!143 (_keys!4755 (v!3320 (underlying!488 thiss!992))) (_values!2971 (v!3320 (underlying!488 thiss!992))) (mask!7352 (v!3320 (underlying!488 thiss!992))) (extraKeys!2735 (v!3320 (underlying!488 thiss!992))) (zeroValue!2834 (v!3320 (underlying!488 thiss!992))) (minValue!2834 (v!3320 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2988 (v!3320 (underlying!488 thiss!992)))))))

(declare-fun lt!76035 () (_ BitVec 64))

(assert (=> b!144803 (= lt!76035 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76048 () (_ BitVec 64))

(assert (=> b!144803 (= lt!76048 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!76052 () Unit!4574)

(declare-fun addStillContains!99 (ListLongMap!1699 (_ BitVec 64) V!3577 (_ BitVec 64)) Unit!4574)

(assert (=> b!144803 (= lt!76052 (addStillContains!99 lt!76046 lt!76035 (zeroValue!2834 (v!3320 (underlying!488 thiss!992))) lt!76048))))

(assert (=> b!144803 (contains!918 (+!176 lt!76046 (tuple2!2651 lt!76035 (zeroValue!2834 (v!3320 (underlying!488 thiss!992))))) lt!76048)))

(declare-fun lt!76055 () Unit!4574)

(assert (=> b!144803 (= lt!76055 lt!76052)))

(declare-fun lt!76038 () ListLongMap!1699)

(assert (=> b!144803 (= lt!76038 (getCurrentListMapNoExtraKeys!143 (_keys!4755 (v!3320 (underlying!488 thiss!992))) (_values!2971 (v!3320 (underlying!488 thiss!992))) (mask!7352 (v!3320 (underlying!488 thiss!992))) (extraKeys!2735 (v!3320 (underlying!488 thiss!992))) (zeroValue!2834 (v!3320 (underlying!488 thiss!992))) (minValue!2834 (v!3320 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2988 (v!3320 (underlying!488 thiss!992)))))))

(declare-fun lt!76039 () (_ BitVec 64))

(assert (=> b!144803 (= lt!76039 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76047 () (_ BitVec 64))

(assert (=> b!144803 (= lt!76047 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!76056 () Unit!4574)

(declare-fun addApplyDifferent!99 (ListLongMap!1699 (_ BitVec 64) V!3577 (_ BitVec 64)) Unit!4574)

(assert (=> b!144803 (= lt!76056 (addApplyDifferent!99 lt!76038 lt!76039 (minValue!2834 (v!3320 (underlying!488 thiss!992))) lt!76047))))

(assert (=> b!144803 (= (apply!123 (+!176 lt!76038 (tuple2!2651 lt!76039 (minValue!2834 (v!3320 (underlying!488 thiss!992))))) lt!76047) (apply!123 lt!76038 lt!76047))))

(declare-fun lt!76040 () Unit!4574)

(assert (=> b!144803 (= lt!76040 lt!76056)))

(declare-fun lt!76049 () ListLongMap!1699)

(assert (=> b!144803 (= lt!76049 (getCurrentListMapNoExtraKeys!143 (_keys!4755 (v!3320 (underlying!488 thiss!992))) (_values!2971 (v!3320 (underlying!488 thiss!992))) (mask!7352 (v!3320 (underlying!488 thiss!992))) (extraKeys!2735 (v!3320 (underlying!488 thiss!992))) (zeroValue!2834 (v!3320 (underlying!488 thiss!992))) (minValue!2834 (v!3320 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2988 (v!3320 (underlying!488 thiss!992)))))))

(declare-fun lt!76054 () (_ BitVec 64))

(assert (=> b!144803 (= lt!76054 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76037 () (_ BitVec 64))

(assert (=> b!144803 (= lt!76037 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!76044 () Unit!4574)

(assert (=> b!144803 (= lt!76044 (addApplyDifferent!99 lt!76049 lt!76054 (zeroValue!2834 (v!3320 (underlying!488 thiss!992))) lt!76037))))

(assert (=> b!144803 (= (apply!123 (+!176 lt!76049 (tuple2!2651 lt!76054 (zeroValue!2834 (v!3320 (underlying!488 thiss!992))))) lt!76037) (apply!123 lt!76049 lt!76037))))

(declare-fun lt!76050 () Unit!4574)

(assert (=> b!144803 (= lt!76050 lt!76044)))

(declare-fun lt!76036 () ListLongMap!1699)

(assert (=> b!144803 (= lt!76036 (getCurrentListMapNoExtraKeys!143 (_keys!4755 (v!3320 (underlying!488 thiss!992))) (_values!2971 (v!3320 (underlying!488 thiss!992))) (mask!7352 (v!3320 (underlying!488 thiss!992))) (extraKeys!2735 (v!3320 (underlying!488 thiss!992))) (zeroValue!2834 (v!3320 (underlying!488 thiss!992))) (minValue!2834 (v!3320 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2988 (v!3320 (underlying!488 thiss!992)))))))

(declare-fun lt!76041 () (_ BitVec 64))

(assert (=> b!144803 (= lt!76041 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76043 () (_ BitVec 64))

(assert (=> b!144803 (= lt!76043 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!144803 (= lt!76042 (addApplyDifferent!99 lt!76036 lt!76041 (minValue!2834 (v!3320 (underlying!488 thiss!992))) lt!76043))))

(assert (=> b!144803 (= (apply!123 (+!176 lt!76036 (tuple2!2651 lt!76041 (minValue!2834 (v!3320 (underlying!488 thiss!992))))) lt!76043) (apply!123 lt!76036 lt!76043))))

(declare-fun b!144804 () Bool)

(assert (=> b!144804 (= e!94375 (not call!16100))))

(declare-fun b!144805 () Bool)

(assert (=> b!144805 (= e!94369 (validKeyInArray!0 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!144806 () Bool)

(declare-fun res!68976 () Bool)

(assert (=> b!144806 (=> (not res!68976) (not e!94374))))

(assert (=> b!144806 (= res!68976 e!94366)))

(declare-fun c!27401 () Bool)

(assert (=> b!144806 (= c!27401 (not (= (bvand (extraKeys!2735 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!144807 () Bool)

(assert (=> b!144807 (= e!94364 call!16099)))

(assert (= (and d!46131 c!27397) b!144789))

(assert (= (and d!46131 (not c!27397)) b!144794))

(assert (= (and b!144794 c!27399) b!144807))

(assert (= (and b!144794 (not c!27399)) b!144787))

(assert (= (and b!144787 c!27398) b!144790))

(assert (= (and b!144787 (not c!27398)) b!144802))

(assert (= (or b!144790 b!144802) bm!16097))

(assert (= (or b!144807 bm!16097) bm!16094))

(assert (= (or b!144807 b!144790) bm!16099))

(assert (= (or b!144789 bm!16094) bm!16096))

(assert (= (or b!144789 bm!16099) bm!16098))

(assert (= (and d!46131 res!68974) b!144788))

(assert (= (and d!46131 c!27396) b!144803))

(assert (= (and d!46131 (not c!27396)) b!144799))

(assert (= (and d!46131 res!68975) b!144797))

(assert (= (and b!144797 res!68969) b!144805))

(assert (= (and b!144797 (not res!68972)) b!144800))

(assert (= (and b!144800 res!68971) b!144795))

(assert (= (and b!144797 res!68973) b!144806))

(assert (= (and b!144806 c!27401) b!144801))

(assert (= (and b!144806 (not c!27401)) b!144796))

(assert (= (and b!144801 res!68970) b!144793))

(assert (= (or b!144801 b!144796) bm!16095))

(assert (= (and b!144806 res!68976) b!144792))

(assert (= (and b!144792 c!27400) b!144791))

(assert (= (and b!144792 (not c!27400)) b!144804))

(assert (= (and b!144791 res!68977) b!144798))

(assert (= (or b!144791 b!144804) bm!16100))

(declare-fun b_lambda!6509 () Bool)

(assert (=> (not b_lambda!6509) (not b!144795)))

(assert (=> b!144795 t!6365))

(declare-fun b_and!9037 () Bool)

(assert (= b_and!9017 (and (=> t!6365 result!4247) b_and!9037)))

(assert (=> b!144795 t!6367))

(declare-fun b_and!9039 () Bool)

(assert (= b_and!9019 (and (=> t!6367 result!4251) b_and!9039)))

(assert (=> d!46131 m!174581))

(assert (=> b!144795 m!174451))

(assert (=> b!144795 m!174575))

(declare-fun m!174585 () Bool)

(assert (=> b!144795 m!174585))

(declare-fun m!174587 () Bool)

(assert (=> b!144795 m!174587))

(assert (=> b!144795 m!174451))

(declare-fun m!174589 () Bool)

(assert (=> b!144795 m!174589))

(assert (=> b!144795 m!174587))

(assert (=> b!144795 m!174575))

(declare-fun m!174591 () Bool)

(assert (=> b!144789 m!174591))

(assert (=> b!144805 m!174575))

(assert (=> b!144805 m!174575))

(declare-fun m!174593 () Bool)

(assert (=> b!144805 m!174593))

(declare-fun m!174595 () Bool)

(assert (=> bm!16100 m!174595))

(declare-fun m!174597 () Bool)

(assert (=> bm!16096 m!174597))

(assert (=> b!144800 m!174575))

(assert (=> b!144800 m!174575))

(declare-fun m!174599 () Bool)

(assert (=> b!144800 m!174599))

(assert (=> b!144788 m!174575))

(assert (=> b!144788 m!174575))

(assert (=> b!144788 m!174593))

(declare-fun m!174601 () Bool)

(assert (=> b!144798 m!174601))

(declare-fun m!174603 () Bool)

(assert (=> bm!16098 m!174603))

(declare-fun m!174605 () Bool)

(assert (=> bm!16095 m!174605))

(declare-fun m!174607 () Bool)

(assert (=> b!144793 m!174607))

(declare-fun m!174609 () Bool)

(assert (=> b!144803 m!174609))

(declare-fun m!174611 () Bool)

(assert (=> b!144803 m!174611))

(declare-fun m!174613 () Bool)

(assert (=> b!144803 m!174613))

(declare-fun m!174615 () Bool)

(assert (=> b!144803 m!174615))

(declare-fun m!174617 () Bool)

(assert (=> b!144803 m!174617))

(declare-fun m!174619 () Bool)

(assert (=> b!144803 m!174619))

(declare-fun m!174621 () Bool)

(assert (=> b!144803 m!174621))

(declare-fun m!174623 () Bool)

(assert (=> b!144803 m!174623))

(declare-fun m!174625 () Bool)

(assert (=> b!144803 m!174625))

(assert (=> b!144803 m!174597))

(assert (=> b!144803 m!174609))

(declare-fun m!174627 () Bool)

(assert (=> b!144803 m!174627))

(assert (=> b!144803 m!174619))

(declare-fun m!174629 () Bool)

(assert (=> b!144803 m!174629))

(assert (=> b!144803 m!174615))

(declare-fun m!174631 () Bool)

(assert (=> b!144803 m!174631))

(declare-fun m!174633 () Bool)

(assert (=> b!144803 m!174633))

(declare-fun m!174635 () Bool)

(assert (=> b!144803 m!174635))

(declare-fun m!174637 () Bool)

(assert (=> b!144803 m!174637))

(assert (=> b!144803 m!174635))

(assert (=> b!144803 m!174575))

(assert (=> b!144574 d!46131))

(declare-fun d!46133 () Bool)

(assert (=> d!46133 (= (valid!581 thiss!992) (valid!580 (v!3320 (underlying!488 thiss!992))))))

(declare-fun bs!6114 () Bool)

(assert (= bs!6114 d!46133))

(declare-fun m!174639 () Bool)

(assert (=> bs!6114 m!174639))

(assert (=> start!15066 d!46133))

(declare-fun d!46135 () Bool)

(declare-fun lt!76059 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!142 (List!1735) (InoxSet (_ BitVec 64)))

(assert (=> d!46135 (= lt!76059 (select (content!142 lt!75945) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94380 () Bool)

(assert (=> d!46135 (= lt!76059 e!94380)))

(declare-fun res!68983 () Bool)

(assert (=> d!46135 (=> (not res!68983) (not e!94380))))

(assert (=> d!46135 (= res!68983 ((_ is Cons!1731) lt!75945))))

(assert (=> d!46135 (= (contains!917 lt!75945 #b1000000000000000000000000000000000000000000000000000000000000000) lt!76059)))

(declare-fun b!144812 () Bool)

(declare-fun e!94381 () Bool)

(assert (=> b!144812 (= e!94380 e!94381)))

(declare-fun res!68982 () Bool)

(assert (=> b!144812 (=> res!68982 e!94381)))

(assert (=> b!144812 (= res!68982 (= (h!2339 lt!75945) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144813 () Bool)

(assert (=> b!144813 (= e!94381 (contains!917 (t!6368 lt!75945) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!46135 res!68983) b!144812))

(assert (= (and b!144812 (not res!68982)) b!144813))

(declare-fun m!174641 () Bool)

(assert (=> d!46135 m!174641))

(declare-fun m!174643 () Bool)

(assert (=> d!46135 m!174643))

(declare-fun m!174645 () Bool)

(assert (=> b!144813 m!174645))

(assert (=> b!144565 d!46135))

(declare-fun d!46137 () Bool)

(declare-fun res!68988 () Bool)

(declare-fun e!94386 () Bool)

(assert (=> d!46137 (=> res!68988 e!94386)))

(assert (=> d!46137 (= res!68988 ((_ is Nil!1732) lt!75945))))

(assert (=> d!46137 (= (noDuplicate!54 lt!75945) e!94386)))

(declare-fun b!144818 () Bool)

(declare-fun e!94387 () Bool)

(assert (=> b!144818 (= e!94386 e!94387)))

(declare-fun res!68989 () Bool)

(assert (=> b!144818 (=> (not res!68989) (not e!94387))))

(assert (=> b!144818 (= res!68989 (not (contains!917 (t!6368 lt!75945) (h!2339 lt!75945))))))

(declare-fun b!144819 () Bool)

(assert (=> b!144819 (= e!94387 (noDuplicate!54 (t!6368 lt!75945)))))

(assert (= (and d!46137 (not res!68988)) b!144818))

(assert (= (and b!144818 res!68989) b!144819))

(declare-fun m!174647 () Bool)

(assert (=> b!144818 m!174647))

(declare-fun m!174649 () Bool)

(assert (=> b!144819 m!174649))

(assert (=> b!144575 d!46137))

(declare-fun d!46139 () Bool)

(assert (=> d!46139 (= (array_inv!1451 (_keys!4755 newMap!16)) (bvsge (size!2599 (_keys!4755 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!144581 d!46139))

(declare-fun d!46141 () Bool)

(assert (=> d!46141 (= (array_inv!1452 (_values!2971 newMap!16)) (bvsge (size!2600 (_values!2971 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!144581 d!46141))

(declare-fun b!144820 () Bool)

(declare-fun e!94390 () Bool)

(declare-fun call!16104 () Bool)

(assert (=> b!144820 (= e!94390 call!16104)))

(declare-fun b!144822 () Bool)

(declare-fun e!94391 () Bool)

(declare-fun e!94388 () Bool)

(assert (=> b!144822 (= e!94391 e!94388)))

(declare-fun res!68992 () Bool)

(assert (=> b!144822 (=> (not res!68992) (not e!94388))))

(declare-fun e!94389 () Bool)

(assert (=> b!144822 (= res!68992 (not e!94389))))

(declare-fun res!68990 () Bool)

(assert (=> b!144822 (=> (not res!68990) (not e!94389))))

(assert (=> b!144822 (= res!68990 (validKeyInArray!0 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!144823 () Bool)

(assert (=> b!144823 (= e!94390 call!16104)))

(declare-fun c!27402 () Bool)

(declare-fun bm!16101 () Bool)

(assert (=> bm!16101 (= call!16104 (arrayNoDuplicates!0 (_keys!4755 (v!3320 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (ite c!27402 (Cons!1731 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) lt!75945) lt!75945)))))

(declare-fun b!144824 () Bool)

(assert (=> b!144824 (= e!94388 e!94390)))

(assert (=> b!144824 (= c!27402 (validKeyInArray!0 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!144821 () Bool)

(assert (=> b!144821 (= e!94389 (contains!917 lt!75945 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun d!46143 () Bool)

(declare-fun res!68991 () Bool)

(assert (=> d!46143 (=> res!68991 e!94391)))

(assert (=> d!46143 (= res!68991 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2599 (_keys!4755 (v!3320 (underlying!488 thiss!992))))))))

(assert (=> d!46143 (= (arrayNoDuplicates!0 (_keys!4755 (v!3320 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!75945) e!94391)))

(assert (= (and d!46143 (not res!68991)) b!144822))

(assert (= (and b!144822 res!68990) b!144821))

(assert (= (and b!144822 res!68992) b!144824))

(assert (= (and b!144824 c!27402) b!144820))

(assert (= (and b!144824 (not c!27402)) b!144823))

(assert (= (or b!144820 b!144823) bm!16101))

(assert (=> b!144822 m!174575))

(assert (=> b!144822 m!174575))

(assert (=> b!144822 m!174593))

(assert (=> bm!16101 m!174575))

(declare-fun m!174651 () Bool)

(assert (=> bm!16101 m!174651))

(assert (=> b!144824 m!174575))

(assert (=> b!144824 m!174575))

(assert (=> b!144824 m!174593))

(assert (=> b!144821 m!174575))

(assert (=> b!144821 m!174575))

(declare-fun m!174653 () Bool)

(assert (=> b!144821 m!174653))

(assert (=> b!144566 d!46143))

(declare-fun d!46145 () Bool)

(declare-fun lt!76060 () Bool)

(assert (=> d!46145 (= lt!76060 (select (content!142 lt!75945) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94392 () Bool)

(assert (=> d!46145 (= lt!76060 e!94392)))

(declare-fun res!68994 () Bool)

(assert (=> d!46145 (=> (not res!68994) (not e!94392))))

(assert (=> d!46145 (= res!68994 ((_ is Cons!1731) lt!75945))))

(assert (=> d!46145 (= (contains!917 lt!75945 #b0000000000000000000000000000000000000000000000000000000000000000) lt!76060)))

(declare-fun b!144825 () Bool)

(declare-fun e!94393 () Bool)

(assert (=> b!144825 (= e!94392 e!94393)))

(declare-fun res!68993 () Bool)

(assert (=> b!144825 (=> res!68993 e!94393)))

(assert (=> b!144825 (= res!68993 (= (h!2339 lt!75945) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144826 () Bool)

(assert (=> b!144826 (= e!94393 (contains!917 (t!6368 lt!75945) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!46145 res!68994) b!144825))

(assert (= (and b!144825 (not res!68993)) b!144826))

(assert (=> d!46145 m!174641))

(declare-fun m!174655 () Bool)

(assert (=> d!46145 m!174655))

(declare-fun m!174657 () Bool)

(assert (=> b!144826 m!174657))

(assert (=> b!144576 d!46145))

(declare-fun d!46147 () Bool)

(declare-fun e!94398 () Bool)

(assert (=> d!46147 e!94398))

(declare-fun res!68997 () Bool)

(assert (=> d!46147 (=> res!68997 e!94398)))

(declare-fun lt!76072 () Bool)

(assert (=> d!46147 (= res!68997 (not lt!76072))))

(declare-fun lt!76070 () Bool)

(assert (=> d!46147 (= lt!76072 lt!76070)))

(declare-fun lt!76069 () Unit!4574)

(declare-fun e!94399 () Unit!4574)

(assert (=> d!46147 (= lt!76069 e!94399)))

(declare-fun c!27405 () Bool)

(assert (=> d!46147 (= c!27405 lt!76070)))

(declare-fun containsKey!183 (List!1736 (_ BitVec 64)) Bool)

(assert (=> d!46147 (= lt!76070 (containsKey!183 (toList!865 lt!75946) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (=> d!46147 (= (contains!918 lt!75946 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)) lt!76072)))

(declare-fun b!144833 () Bool)

(declare-fun lt!76071 () Unit!4574)

(assert (=> b!144833 (= e!94399 lt!76071)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!131 (List!1736 (_ BitVec 64)) Unit!4574)

(assert (=> b!144833 (= lt!76071 (lemmaContainsKeyImpliesGetValueByKeyDefined!131 (toList!865 lt!75946) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-datatypes ((Option!186 0))(
  ( (Some!185 (v!3327 V!3577)) (None!184) )
))
(declare-fun isDefined!132 (Option!186) Bool)

(declare-fun getValueByKey!180 (List!1736 (_ BitVec 64)) Option!186)

(assert (=> b!144833 (isDefined!132 (getValueByKey!180 (toList!865 lt!75946) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun b!144834 () Bool)

(declare-fun Unit!4577 () Unit!4574)

(assert (=> b!144834 (= e!94399 Unit!4577)))

(declare-fun b!144835 () Bool)

(assert (=> b!144835 (= e!94398 (isDefined!132 (getValueByKey!180 (toList!865 lt!75946) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355))))))

(assert (= (and d!46147 c!27405) b!144833))

(assert (= (and d!46147 (not c!27405)) b!144834))

(assert (= (and d!46147 (not res!68997)) b!144835))

(assert (=> d!46147 m!174417))

(declare-fun m!174659 () Bool)

(assert (=> d!46147 m!174659))

(assert (=> b!144833 m!174417))

(declare-fun m!174661 () Bool)

(assert (=> b!144833 m!174661))

(assert (=> b!144833 m!174417))

(declare-fun m!174663 () Bool)

(assert (=> b!144833 m!174663))

(assert (=> b!144833 m!174663))

(declare-fun m!174665 () Bool)

(assert (=> b!144833 m!174665))

(assert (=> b!144835 m!174417))

(assert (=> b!144835 m!174663))

(assert (=> b!144835 m!174663))

(assert (=> b!144835 m!174665))

(assert (=> b!144572 d!46147))

(declare-fun b!144920 () Bool)

(declare-fun e!94453 () tuple2!2652)

(declare-fun lt!76145 () tuple2!2652)

(assert (=> b!144920 (= e!94453 (tuple2!2653 (_1!1337 lt!76145) (_2!1337 lt!76145)))))

(declare-fun call!16157 () tuple2!2652)

(assert (=> b!144920 (= lt!76145 call!16157)))

(declare-fun bm!16150 () Bool)

(declare-datatypes ((SeekEntryResult!276 0))(
  ( (MissingZero!276 (index!3270 (_ BitVec 32))) (Found!276 (index!3271 (_ BitVec 32))) (Intermediate!276 (undefined!1088 Bool) (index!3272 (_ BitVec 32)) (x!16508 (_ BitVec 32))) (Undefined!276) (MissingVacant!276 (index!3273 (_ BitVec 32))) )
))
(declare-fun call!16153 () SeekEntryResult!276)

(declare-fun call!16169 () SeekEntryResult!276)

(assert (=> bm!16150 (= call!16153 call!16169)))

(declare-fun bm!16151 () Bool)

(declare-fun call!16161 () Bool)

(declare-fun call!16170 () Bool)

(assert (=> bm!16151 (= call!16161 call!16170)))

(declare-fun b!144921 () Bool)

(declare-fun e!94462 () Bool)

(declare-fun e!94464 () Bool)

(assert (=> b!144921 (= e!94462 e!94464)))

(declare-fun call!16163 () ListLongMap!1699)

(declare-fun res!69029 () Bool)

(assert (=> b!144921 (= res!69029 (contains!918 call!16163 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (=> b!144921 (=> (not res!69029) (not e!94464))))

(declare-fun bm!16152 () Bool)

(declare-fun call!16176 () ListLongMap!1699)

(declare-fun call!16171 () ListLongMap!1699)

(assert (=> bm!16152 (= call!16176 call!16171)))

(declare-fun c!27435 () Bool)

(declare-fun lt!76132 () array!4923)

(declare-fun lt!76136 () (_ BitVec 32))

(declare-fun bm!16153 () Bool)

(declare-fun lt!76152 () (_ BitVec 32))

(declare-fun c!27442 () Bool)

(assert (=> bm!16153 (= call!16171 (getCurrentListMap!537 (_keys!4755 newMap!16) (ite c!27442 (_values!2971 newMap!16) lt!76132) (mask!7352 newMap!16) (ite c!27442 (ite c!27435 lt!76152 lt!76136) (extraKeys!2735 newMap!16)) (ite (and c!27442 c!27435) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2834 newMap!16)) (ite c!27442 (ite c!27435 (minValue!2834 newMap!16) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2834 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun bm!16154 () Bool)

(declare-fun call!16175 () ListLongMap!1699)

(declare-fun call!16158 () ListLongMap!1699)

(assert (=> bm!16154 (= call!16175 call!16158)))

(declare-fun bm!16155 () Bool)

(declare-fun call!16159 () ListLongMap!1699)

(assert (=> bm!16155 (= call!16159 call!16158)))

(declare-fun b!144922 () Bool)

(declare-fun c!27444 () Bool)

(declare-fun lt!76144 () SeekEntryResult!276)

(assert (=> b!144922 (= c!27444 ((_ is MissingVacant!276) lt!76144))))

(declare-fun e!94448 () tuple2!2652)

(assert (=> b!144922 (= e!94448 e!94453)))

(declare-fun call!16164 () Unit!4574)

(declare-fun bm!16156 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!68 (array!4921 array!4923 (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 (_ BitVec 64) Int) Unit!4574)

(assert (=> bm!16156 (= call!16164 (lemmaInListMapThenSeekEntryOrOpenFindsIt!68 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (defaultEntry!2988 newMap!16)))))

(declare-fun b!144923 () Bool)

(declare-fun e!94456 () Bool)

(declare-fun e!94460 () Bool)

(assert (=> b!144923 (= e!94456 e!94460)))

(declare-fun res!69033 () Bool)

(declare-fun call!16165 () Bool)

(assert (=> b!144923 (= res!69033 call!16165)))

(assert (=> b!144923 (=> (not res!69033) (not e!94460))))

(declare-fun b!144924 () Bool)

(declare-fun res!69036 () Bool)

(declare-fun lt!76139 () SeekEntryResult!276)

(assert (=> b!144924 (= res!69036 (= (select (arr!2324 (_keys!4755 newMap!16)) (index!3273 lt!76139)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94465 () Bool)

(assert (=> b!144924 (=> (not res!69036) (not e!94465))))

(declare-fun call!16167 () Bool)

(declare-fun bm!16157 () Bool)

(assert (=> bm!16157 (= call!16167 (arrayContainsKey!0 (_keys!4755 newMap!16) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!144925 () Bool)

(declare-fun e!94449 () Bool)

(declare-fun call!16172 () Bool)

(assert (=> b!144925 (= e!94449 (not call!16172))))

(declare-fun e!94458 () Bool)

(declare-fun lt!76150 () SeekEntryResult!276)

(declare-fun b!144926 () Bool)

(assert (=> b!144926 (= e!94458 (= (select (arr!2324 (_keys!4755 newMap!16)) (index!3271 lt!76150)) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun b!144927 () Bool)

(declare-fun res!69028 () Bool)

(declare-fun lt!76141 () SeekEntryResult!276)

(assert (=> b!144927 (= res!69028 (= (select (arr!2324 (_keys!4755 newMap!16)) (index!3273 lt!76141)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!144927 (=> (not res!69028) (not e!94460))))

(declare-fun b!144928 () Bool)

(declare-fun res!69034 () Bool)

(declare-fun e!94451 () Bool)

(assert (=> b!144928 (=> (not res!69034) (not e!94451))))

(assert (=> b!144928 (= res!69034 call!16165)))

(declare-fun e!94463 () Bool)

(assert (=> b!144928 (= e!94463 e!94451)))

(declare-fun b!144929 () Bool)

(assert (=> b!144929 (= e!94465 (not call!16172))))

(declare-fun c!27441 () Bool)

(declare-fun bm!16158 () Bool)

(assert (=> bm!16158 (= call!16158 (getCurrentListMap!537 (_keys!4755 newMap!16) (ite (or c!27442 c!27441) (_values!2971 newMap!16) (array!4924 (store (arr!2325 (_values!2971 newMap!16)) (index!3271 lt!76144) (ValueCellFull!1130 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2600 (_values!2971 newMap!16)))) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun call!16166 () ListLongMap!1699)

(declare-fun b!144930 () Bool)

(assert (=> b!144930 (= e!94464 (= call!16163 (+!176 call!16166 (tuple2!2651 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!144931 () Bool)

(declare-fun lt!76149 () Unit!4574)

(declare-fun lt!76153 () Unit!4574)

(assert (=> b!144931 (= lt!76149 lt!76153)))

(assert (=> b!144931 (contains!918 call!16171 (select (arr!2324 (_keys!4755 newMap!16)) (index!3271 lt!76144)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!128 (array!4921 array!4923 (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 (_ BitVec 32) Int) Unit!4574)

(assert (=> b!144931 (= lt!76153 (lemmaValidKeyInArrayIsInListMap!128 (_keys!4755 newMap!16) lt!76132 (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (index!3271 lt!76144) (defaultEntry!2988 newMap!16)))))

(assert (=> b!144931 (= lt!76132 (array!4924 (store (arr!2325 (_values!2971 newMap!16)) (index!3271 lt!76144) (ValueCellFull!1130 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2600 (_values!2971 newMap!16))))))

(declare-fun lt!76138 () Unit!4574)

(declare-fun lt!76140 () Unit!4574)

(assert (=> b!144931 (= lt!76138 lt!76140)))

(declare-fun call!16173 () ListLongMap!1699)

(assert (=> b!144931 (= call!16173 call!16175)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!68 (array!4921 array!4923 (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 (_ BitVec 32) (_ BitVec 64) V!3577 Int) Unit!4574)

(assert (=> b!144931 (= lt!76140 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!68 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (index!3271 lt!76144) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76148 () Unit!4574)

(declare-fun e!94461 () Unit!4574)

(assert (=> b!144931 (= lt!76148 e!94461)))

(declare-fun c!27447 () Bool)

(declare-fun call!16160 () Bool)

(assert (=> b!144931 (= c!27447 call!16160)))

(declare-fun e!94444 () tuple2!2652)

(assert (=> b!144931 (= e!94444 (tuple2!2653 true (LongMapFixedSize!1169 (defaultEntry!2988 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (_size!633 newMap!16) (_keys!4755 newMap!16) (array!4924 (store (arr!2325 (_values!2971 newMap!16)) (index!3271 lt!76144) (ValueCellFull!1130 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2600 (_values!2971 newMap!16))) (_vacant!633 newMap!16))))))

(declare-fun b!144932 () Bool)

(declare-fun e!94457 () tuple2!2652)

(declare-fun e!94455 () tuple2!2652)

(assert (=> b!144932 (= e!94457 e!94455)))

(assert (=> b!144932 (= c!27435 (= (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!16159 () Bool)

(declare-fun call!16168 () Bool)

(assert (=> bm!16159 (= call!16168 call!16170)))

(declare-fun bm!16160 () Bool)

(declare-fun call!16162 () Bool)

(assert (=> bm!16160 (= call!16162 call!16167)))

(declare-fun bm!16161 () Bool)

(declare-fun call!16155 () Unit!4574)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!68 (array!4921 array!4923 (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 (_ BitVec 64) Int) Unit!4574)

(assert (=> bm!16161 (= call!16155 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!68 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (defaultEntry!2988 newMap!16)))))

(declare-fun b!144933 () Bool)

(assert (=> b!144933 (= e!94451 (not call!16162))))

(declare-fun bm!16162 () Bool)

(declare-fun call!16174 () Bool)

(assert (=> bm!16162 (= call!16174 call!16161)))

(declare-fun b!144934 () Bool)

(declare-fun c!27439 () Bool)

(assert (=> b!144934 (= c!27439 ((_ is MissingVacant!276) lt!76141))))

(assert (=> b!144934 (= e!94463 e!94456)))

(declare-fun bm!16163 () Bool)

(declare-fun call!16154 () ListLongMap!1699)

(assert (=> bm!16163 (= call!16154 call!16173)))

(declare-fun b!144935 () Bool)

(declare-fun lt!76129 () Unit!4574)

(declare-fun lt!76135 () Unit!4574)

(assert (=> b!144935 (= lt!76129 lt!76135)))

(assert (=> b!144935 (= call!16154 call!16176)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!68 (array!4921 array!4923 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 V!3577 Int) Unit!4574)

(assert (=> b!144935 (= lt!76135 (lemmaChangeZeroKeyThenAddPairToListMap!68 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) lt!76152 (zeroValue!2834 newMap!16) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2834 newMap!16) (defaultEntry!2988 newMap!16)))))

(assert (=> b!144935 (= lt!76152 (bvor (extraKeys!2735 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!144935 (= e!94455 (tuple2!2653 true (LongMapFixedSize!1169 (defaultEntry!2988 newMap!16) (mask!7352 newMap!16) (bvor (extraKeys!2735 newMap!16) #b00000000000000000000000000000001) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2834 newMap!16) (_size!633 newMap!16) (_keys!4755 newMap!16) (_values!2971 newMap!16) (_vacant!633 newMap!16))))))

(declare-fun bm!16164 () Bool)

(declare-fun updateHelperNewKey!68 (LongMapFixedSize!1168 (_ BitVec 64) V!3577 (_ BitVec 32)) tuple2!2652)

(assert (=> bm!16164 (= call!16157 (updateHelperNewKey!68 newMap!16 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!27444 (index!3273 lt!76144) (index!3270 lt!76144))))))

(declare-fun b!144936 () Bool)

(declare-fun e!94454 () Bool)

(assert (=> b!144936 (= e!94454 e!94462)))

(declare-fun c!27436 () Bool)

(declare-fun lt!76137 () tuple2!2652)

(assert (=> b!144936 (= c!27436 (_1!1337 lt!76137))))

(declare-fun b!144937 () Bool)

(declare-fun lt!76151 () tuple2!2652)

(assert (=> b!144937 (= lt!76151 call!16157)))

(assert (=> b!144937 (= e!94444 (tuple2!2653 (_1!1337 lt!76151) (_2!1337 lt!76151)))))

(declare-fun bm!16165 () Bool)

(assert (=> bm!16165 (= call!16166 (map!1441 (ite c!27436 newMap!16 (_2!1337 lt!76137))))))

(declare-fun b!144938 () Bool)

(declare-fun e!94452 () ListLongMap!1699)

(assert (=> b!144938 (= e!94452 (getCurrentListMap!537 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun b!144939 () Bool)

(declare-fun e!94445 () Unit!4574)

(declare-fun lt!76146 () Unit!4574)

(assert (=> b!144939 (= e!94445 lt!76146)))

(assert (=> b!144939 (= lt!76146 call!16155)))

(declare-fun call!16156 () SeekEntryResult!276)

(assert (=> b!144939 (= lt!76139 call!16156)))

(declare-fun c!27443 () Bool)

(assert (=> b!144939 (= c!27443 ((_ is MissingZero!276) lt!76139))))

(declare-fun e!94446 () Bool)

(assert (=> b!144939 e!94446))

(declare-fun bm!16166 () Bool)

(assert (=> bm!16166 (= call!16156 call!16169)))

(declare-fun b!144940 () Bool)

(assert (=> b!144940 (= e!94453 e!94444)))

(declare-fun c!27445 () Bool)

(assert (=> b!144940 (= c!27445 ((_ is MissingZero!276) lt!76144))))

(declare-fun bm!16167 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4921 (_ BitVec 32)) SeekEntryResult!276)

(assert (=> bm!16167 (= call!16169 (seekEntryOrOpen!0 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (_keys!4755 newMap!16) (mask!7352 newMap!16)))))

(declare-fun bm!16168 () Bool)

(assert (=> bm!16168 (= call!16172 call!16167)))

(declare-fun b!144941 () Bool)

(declare-fun lt!76130 () Unit!4574)

(assert (=> b!144941 (= lt!76130 e!94445)))

(declare-fun c!27438 () Bool)

(assert (=> b!144941 (= c!27438 call!16160)))

(assert (=> b!144941 (= e!94448 (tuple2!2653 false newMap!16))))

(declare-fun b!144942 () Bool)

(declare-fun e!94447 () Bool)

(assert (=> b!144942 (= e!94447 ((_ is Undefined!276) lt!76139))))

(declare-fun b!144943 () Bool)

(declare-fun e!94450 () ListLongMap!1699)

(assert (=> b!144943 (= e!94450 call!16175)))

(declare-fun b!144944 () Bool)

(assert (=> b!144944 (= e!94457 e!94448)))

(assert (=> b!144944 (= lt!76144 (seekEntryOrOpen!0 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (_keys!4755 newMap!16) (mask!7352 newMap!16)))))

(assert (=> b!144944 (= c!27441 ((_ is Undefined!276) lt!76144))))

(declare-fun b!144945 () Bool)

(assert (=> b!144945 (= e!94452 call!16159)))

(declare-fun b!144946 () Bool)

(declare-fun c!27440 () Bool)

(assert (=> b!144946 (= c!27440 ((_ is MissingVacant!276) lt!76139))))

(assert (=> b!144946 (= e!94446 e!94447)))

(declare-fun b!144947 () Bool)

(assert (=> b!144947 (= e!94447 e!94465)))

(declare-fun res!69026 () Bool)

(assert (=> b!144947 (= res!69026 call!16174)))

(assert (=> b!144947 (=> (not res!69026) (not e!94465))))

(declare-fun lt!76127 () SeekEntryResult!276)

(declare-fun bm!16169 () Bool)

(declare-fun c!27446 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!16169 (= call!16170 (inRange!0 (ite c!27441 (ite c!27438 (index!3271 lt!76127) (ite c!27443 (index!3270 lt!76139) (index!3273 lt!76139))) (ite c!27447 (index!3271 lt!76150) (ite c!27446 (index!3270 lt!76141) (index!3273 lt!76141)))) (mask!7352 newMap!16)))))

(declare-fun b!144948 () Bool)

(assert (=> b!144948 (= e!94462 (= call!16166 call!16163))))

(declare-fun b!144949 () Bool)

(declare-fun res!69030 () Bool)

(assert (=> b!144949 (=> (not res!69030) (not e!94451))))

(assert (=> b!144949 (= res!69030 (= (select (arr!2324 (_keys!4755 newMap!16)) (index!3270 lt!76141)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144950 () Bool)

(declare-fun Unit!4578 () Unit!4574)

(assert (=> b!144950 (= e!94445 Unit!4578)))

(declare-fun lt!76134 () Unit!4574)

(assert (=> b!144950 (= lt!76134 call!16164)))

(assert (=> b!144950 (= lt!76127 call!16156)))

(declare-fun res!69035 () Bool)

(assert (=> b!144950 (= res!69035 ((_ is Found!276) lt!76127))))

(declare-fun e!94459 () Bool)

(assert (=> b!144950 (=> (not res!69035) (not e!94459))))

(assert (=> b!144950 e!94459))

(declare-fun lt!76131 () Unit!4574)

(assert (=> b!144950 (= lt!76131 lt!76134)))

(assert (=> b!144950 false))

(declare-fun b!144951 () Bool)

(declare-fun res!69039 () Bool)

(assert (=> b!144951 (= res!69039 call!16168)))

(assert (=> b!144951 (=> (not res!69039) (not e!94458))))

(declare-fun b!144952 () Bool)

(declare-fun res!69038 () Bool)

(assert (=> b!144952 (= res!69038 call!16161)))

(assert (=> b!144952 (=> (not res!69038) (not e!94459))))

(declare-fun b!144953 () Bool)

(assert (=> b!144953 (= e!94456 ((_ is Undefined!276) lt!76141))))

(declare-fun b!144954 () Bool)

(declare-fun res!69032 () Bool)

(assert (=> b!144954 (=> (not res!69032) (not e!94449))))

(assert (=> b!144954 (= res!69032 (= (select (arr!2324 (_keys!4755 newMap!16)) (index!3270 lt!76139)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!16170 () Bool)

(assert (=> bm!16170 (= call!16163 (map!1441 (ite c!27436 (_2!1337 lt!76137) newMap!16)))))

(declare-fun bm!16171 () Bool)

(assert (=> bm!16171 (= call!16173 (+!176 e!94452 (ite c!27442 (ite c!27435 (tuple2!2651 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2651 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!27434 () Bool)

(assert (=> bm!16171 (= c!27434 c!27442)))

(declare-fun b!144955 () Bool)

(declare-fun res!69037 () Bool)

(assert (=> b!144955 (=> (not res!69037) (not e!94449))))

(assert (=> b!144955 (= res!69037 call!16174)))

(assert (=> b!144955 (= e!94446 e!94449)))

(declare-fun b!144956 () Bool)

(assert (=> b!144956 (= e!94460 (not call!16162))))

(declare-fun bm!16172 () Bool)

(assert (=> bm!16172 (= call!16165 call!16168)))

(declare-fun b!144957 () Bool)

(assert (=> b!144957 (= e!94459 (= (select (arr!2324 (_keys!4755 newMap!16)) (index!3271 lt!76127)) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun d!46149 () Bool)

(assert (=> d!46149 e!94454))

(declare-fun res!69027 () Bool)

(assert (=> d!46149 (=> (not res!69027) (not e!94454))))

(assert (=> d!46149 (= res!69027 (valid!580 (_2!1337 lt!76137)))))

(assert (=> d!46149 (= lt!76137 e!94457)))

(assert (=> d!46149 (= c!27442 (= (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (bvneg (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355))))))

(assert (=> d!46149 (valid!580 newMap!16)))

(assert (=> d!46149 (= (update!216 newMap!16 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!76137)))

(declare-fun b!144958 () Bool)

(declare-fun lt!76133 () Unit!4574)

(assert (=> b!144958 (= e!94461 lt!76133)))

(assert (=> b!144958 (= lt!76133 call!16164)))

(assert (=> b!144958 (= lt!76150 call!16153)))

(declare-fun res!69031 () Bool)

(assert (=> b!144958 (= res!69031 ((_ is Found!276) lt!76150))))

(assert (=> b!144958 (=> (not res!69031) (not e!94458))))

(assert (=> b!144958 e!94458))

(declare-fun b!144959 () Bool)

(assert (=> b!144959 (= e!94450 (getCurrentListMap!537 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun b!144960 () Bool)

(declare-fun lt!76143 () Unit!4574)

(declare-fun lt!76147 () Unit!4574)

(assert (=> b!144960 (= lt!76143 lt!76147)))

(assert (=> b!144960 (= call!16154 call!16176)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!68 (array!4921 array!4923 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 V!3577 Int) Unit!4574)

(assert (=> b!144960 (= lt!76147 (lemmaChangeLongMinValueKeyThenAddPairToListMap!68 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) lt!76136 (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2988 newMap!16)))))

(assert (=> b!144960 (= lt!76136 (bvor (extraKeys!2735 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!144960 (= e!94455 (tuple2!2653 true (LongMapFixedSize!1169 (defaultEntry!2988 newMap!16) (mask!7352 newMap!16) (bvor (extraKeys!2735 newMap!16) #b00000000000000000000000000000010) (zeroValue!2834 newMap!16) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!633 newMap!16) (_keys!4755 newMap!16) (_values!2971 newMap!16) (_vacant!633 newMap!16))))))

(declare-fun bm!16173 () Bool)

(declare-fun c!27437 () Bool)

(assert (=> bm!16173 (= c!27437 c!27441)))

(assert (=> bm!16173 (= call!16160 (contains!918 e!94450 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun b!144961 () Bool)

(declare-fun Unit!4579 () Unit!4574)

(assert (=> b!144961 (= e!94461 Unit!4579)))

(declare-fun lt!76128 () Unit!4574)

(assert (=> b!144961 (= lt!76128 call!16155)))

(assert (=> b!144961 (= lt!76141 call!16153)))

(assert (=> b!144961 (= c!27446 ((_ is MissingZero!276) lt!76141))))

(assert (=> b!144961 e!94463))

(declare-fun lt!76142 () Unit!4574)

(assert (=> b!144961 (= lt!76142 lt!76128)))

(assert (=> b!144961 false))

(assert (= (and d!46149 c!27442) b!144932))

(assert (= (and d!46149 (not c!27442)) b!144944))

(assert (= (and b!144932 c!27435) b!144935))

(assert (= (and b!144932 (not c!27435)) b!144960))

(assert (= (or b!144935 b!144960) bm!16152))

(assert (= (or b!144935 b!144960) bm!16155))

(assert (= (or b!144935 b!144960) bm!16163))

(assert (= (and b!144944 c!27441) b!144941))

(assert (= (and b!144944 (not c!27441)) b!144922))

(assert (= (and b!144941 c!27438) b!144950))

(assert (= (and b!144941 (not c!27438)) b!144939))

(assert (= (and b!144950 res!69035) b!144952))

(assert (= (and b!144952 res!69038) b!144957))

(assert (= (and b!144939 c!27443) b!144955))

(assert (= (and b!144939 (not c!27443)) b!144946))

(assert (= (and b!144955 res!69037) b!144954))

(assert (= (and b!144954 res!69032) b!144925))

(assert (= (and b!144946 c!27440) b!144947))

(assert (= (and b!144946 (not c!27440)) b!144942))

(assert (= (and b!144947 res!69026) b!144924))

(assert (= (and b!144924 res!69036) b!144929))

(assert (= (or b!144955 b!144947) bm!16162))

(assert (= (or b!144925 b!144929) bm!16168))

(assert (= (or b!144952 bm!16162) bm!16151))

(assert (= (or b!144950 b!144939) bm!16166))

(assert (= (and b!144922 c!27444) b!144920))

(assert (= (and b!144922 (not c!27444)) b!144940))

(assert (= (and b!144940 c!27445) b!144937))

(assert (= (and b!144940 (not c!27445)) b!144931))

(assert (= (and b!144931 c!27447) b!144958))

(assert (= (and b!144931 (not c!27447)) b!144961))

(assert (= (and b!144958 res!69031) b!144951))

(assert (= (and b!144951 res!69039) b!144926))

(assert (= (and b!144961 c!27446) b!144928))

(assert (= (and b!144961 (not c!27446)) b!144934))

(assert (= (and b!144928 res!69034) b!144949))

(assert (= (and b!144949 res!69030) b!144933))

(assert (= (and b!144934 c!27439) b!144923))

(assert (= (and b!144934 (not c!27439)) b!144953))

(assert (= (and b!144923 res!69033) b!144927))

(assert (= (and b!144927 res!69028) b!144956))

(assert (= (or b!144928 b!144923) bm!16172))

(assert (= (or b!144933 b!144956) bm!16160))

(assert (= (or b!144951 bm!16172) bm!16159))

(assert (= (or b!144958 b!144961) bm!16150))

(assert (= (or b!144920 b!144937) bm!16164))

(assert (= (or b!144950 b!144958) bm!16156))

(assert (= (or b!144939 b!144961) bm!16161))

(assert (= (or bm!16166 bm!16150) bm!16167))

(assert (= (or b!144941 b!144931) bm!16154))

(assert (= (or bm!16168 bm!16160) bm!16157))

(assert (= (or bm!16151 bm!16159) bm!16169))

(assert (= (or b!144941 b!144931) bm!16173))

(assert (= (and bm!16173 c!27437) b!144943))

(assert (= (and bm!16173 (not c!27437)) b!144959))

(assert (= (or bm!16155 bm!16154) bm!16158))

(assert (= (or bm!16152 b!144931) bm!16153))

(assert (= (or bm!16163 b!144931) bm!16171))

(assert (= (and bm!16171 c!27434) b!144945))

(assert (= (and bm!16171 (not c!27434)) b!144938))

(assert (= (and d!46149 res!69027) b!144936))

(assert (= (and b!144936 c!27436) b!144921))

(assert (= (and b!144936 (not c!27436)) b!144948))

(assert (= (and b!144921 res!69029) b!144930))

(assert (= (or b!144930 b!144948) bm!16165))

(assert (= (or b!144921 b!144930 b!144948) bm!16170))

(declare-fun m!174667 () Bool)

(assert (=> b!144954 m!174667))

(declare-fun m!174669 () Bool)

(assert (=> b!144930 m!174669))

(declare-fun m!174671 () Bool)

(assert (=> bm!16169 m!174671))

(assert (=> b!144944 m!174417))

(declare-fun m!174673 () Bool)

(assert (=> b!144944 m!174673))

(assert (=> b!144931 m!174417))

(assert (=> b!144931 m!174453))

(declare-fun m!174675 () Bool)

(assert (=> b!144931 m!174675))

(declare-fun m!174677 () Bool)

(assert (=> b!144931 m!174677))

(declare-fun m!174679 () Bool)

(assert (=> b!144931 m!174679))

(declare-fun m!174681 () Bool)

(assert (=> b!144931 m!174681))

(assert (=> b!144931 m!174677))

(declare-fun m!174683 () Bool)

(assert (=> b!144931 m!174683))

(declare-fun m!174685 () Bool)

(assert (=> b!144957 m!174685))

(declare-fun m!174687 () Bool)

(assert (=> bm!16171 m!174687))

(assert (=> bm!16164 m!174417))

(assert (=> bm!16164 m!174453))

(declare-fun m!174689 () Bool)

(assert (=> bm!16164 m!174689))

(assert (=> b!144959 m!174583))

(assert (=> b!144935 m!174453))

(declare-fun m!174691 () Bool)

(assert (=> b!144935 m!174691))

(declare-fun m!174693 () Bool)

(assert (=> b!144926 m!174693))

(assert (=> bm!16156 m!174417))

(declare-fun m!174695 () Bool)

(assert (=> bm!16156 m!174695))

(assert (=> bm!16161 m!174417))

(declare-fun m!174697 () Bool)

(assert (=> bm!16161 m!174697))

(assert (=> b!144960 m!174453))

(declare-fun m!174699 () Bool)

(assert (=> b!144960 m!174699))

(assert (=> bm!16167 m!174417))

(assert (=> bm!16167 m!174673))

(declare-fun m!174701 () Bool)

(assert (=> bm!16170 m!174701))

(declare-fun m!174703 () Bool)

(assert (=> b!144924 m!174703))

(declare-fun m!174705 () Bool)

(assert (=> b!144927 m!174705))

(assert (=> bm!16158 m!174681))

(declare-fun m!174707 () Bool)

(assert (=> bm!16158 m!174707))

(declare-fun m!174709 () Bool)

(assert (=> bm!16165 m!174709))

(assert (=> b!144921 m!174417))

(declare-fun m!174711 () Bool)

(assert (=> b!144921 m!174711))

(assert (=> bm!16173 m!174417))

(declare-fun m!174713 () Bool)

(assert (=> bm!16173 m!174713))

(declare-fun m!174715 () Bool)

(assert (=> d!46149 m!174715))

(assert (=> d!46149 m!174415))

(declare-fun m!174717 () Bool)

(assert (=> bm!16153 m!174717))

(declare-fun m!174719 () Bool)

(assert (=> b!144949 m!174719))

(assert (=> b!144938 m!174583))

(assert (=> bm!16157 m!174417))

(declare-fun m!174721 () Bool)

(assert (=> bm!16157 m!174721))

(assert (=> b!144572 d!46149))

(declare-fun d!46151 () Bool)

(declare-fun c!27450 () Bool)

(assert (=> d!46151 (= c!27450 ((_ is ValueCellFull!1130) (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun e!94468 () V!3577)

(assert (=> d!46151 (= (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!94468)))

(declare-fun b!144966 () Bool)

(declare-fun get!1554 (ValueCell!1130 V!3577) V!3577)

(assert (=> b!144966 (= e!94468 (get!1554 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!144967 () Bool)

(declare-fun get!1555 (ValueCell!1130 V!3577) V!3577)

(assert (=> b!144967 (= e!94468 (get!1555 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!46151 c!27450) b!144966))

(assert (= (and d!46151 (not c!27450)) b!144967))

(assert (=> b!144966 m!174449))

(assert (=> b!144966 m!174451))

(declare-fun m!174723 () Bool)

(assert (=> b!144966 m!174723))

(assert (=> b!144967 m!174449))

(assert (=> b!144967 m!174451))

(declare-fun m!174725 () Bool)

(assert (=> b!144967 m!174725))

(assert (=> b!144572 d!46151))

(declare-fun mapIsEmpty!4919 () Bool)

(declare-fun mapRes!4919 () Bool)

(assert (=> mapIsEmpty!4919 mapRes!4919))

(declare-fun condMapEmpty!4919 () Bool)

(declare-fun mapDefault!4919 () ValueCell!1130)

(assert (=> mapNonEmpty!4903 (= condMapEmpty!4919 (= mapRest!4903 ((as const (Array (_ BitVec 32) ValueCell!1130)) mapDefault!4919)))))

(declare-fun e!94474 () Bool)

(assert (=> mapNonEmpty!4903 (= tp!11676 (and e!94474 mapRes!4919))))

(declare-fun b!144975 () Bool)

(assert (=> b!144975 (= e!94474 tp_is_empty!2947)))

(declare-fun mapNonEmpty!4919 () Bool)

(declare-fun tp!11705 () Bool)

(declare-fun e!94473 () Bool)

(assert (=> mapNonEmpty!4919 (= mapRes!4919 (and tp!11705 e!94473))))

(declare-fun mapValue!4919 () ValueCell!1130)

(declare-fun mapKey!4919 () (_ BitVec 32))

(declare-fun mapRest!4919 () (Array (_ BitVec 32) ValueCell!1130))

(assert (=> mapNonEmpty!4919 (= mapRest!4903 (store mapRest!4919 mapKey!4919 mapValue!4919))))

(declare-fun b!144974 () Bool)

(assert (=> b!144974 (= e!94473 tp_is_empty!2947)))

(assert (= (and mapNonEmpty!4903 condMapEmpty!4919) mapIsEmpty!4919))

(assert (= (and mapNonEmpty!4903 (not condMapEmpty!4919)) mapNonEmpty!4919))

(assert (= (and mapNonEmpty!4919 ((_ is ValueCellFull!1130) mapValue!4919)) b!144974))

(assert (= (and mapNonEmpty!4903 ((_ is ValueCellFull!1130) mapDefault!4919)) b!144975))

(declare-fun m!174727 () Bool)

(assert (=> mapNonEmpty!4919 m!174727))

(declare-fun mapIsEmpty!4920 () Bool)

(declare-fun mapRes!4920 () Bool)

(assert (=> mapIsEmpty!4920 mapRes!4920))

(declare-fun condMapEmpty!4920 () Bool)

(declare-fun mapDefault!4920 () ValueCell!1130)

(assert (=> mapNonEmpty!4904 (= condMapEmpty!4920 (= mapRest!4904 ((as const (Array (_ BitVec 32) ValueCell!1130)) mapDefault!4920)))))

(declare-fun e!94476 () Bool)

(assert (=> mapNonEmpty!4904 (= tp!11677 (and e!94476 mapRes!4920))))

(declare-fun b!144977 () Bool)

(assert (=> b!144977 (= e!94476 tp_is_empty!2947)))

(declare-fun mapNonEmpty!4920 () Bool)

(declare-fun tp!11706 () Bool)

(declare-fun e!94475 () Bool)

(assert (=> mapNonEmpty!4920 (= mapRes!4920 (and tp!11706 e!94475))))

(declare-fun mapKey!4920 () (_ BitVec 32))

(declare-fun mapRest!4920 () (Array (_ BitVec 32) ValueCell!1130))

(declare-fun mapValue!4920 () ValueCell!1130)

(assert (=> mapNonEmpty!4920 (= mapRest!4904 (store mapRest!4920 mapKey!4920 mapValue!4920))))

(declare-fun b!144976 () Bool)

(assert (=> b!144976 (= e!94475 tp_is_empty!2947)))

(assert (= (and mapNonEmpty!4904 condMapEmpty!4920) mapIsEmpty!4920))

(assert (= (and mapNonEmpty!4904 (not condMapEmpty!4920)) mapNonEmpty!4920))

(assert (= (and mapNonEmpty!4920 ((_ is ValueCellFull!1130) mapValue!4920)) b!144976))

(assert (= (and mapNonEmpty!4904 ((_ is ValueCellFull!1130) mapDefault!4920)) b!144977))

(declare-fun m!174729 () Bool)

(assert (=> mapNonEmpty!4920 m!174729))

(declare-fun b_lambda!6511 () Bool)

(assert (= b_lambda!6509 (or (and b!144577 b_free!3061) (and b!144581 b_free!3063 (= (defaultEntry!2988 newMap!16) (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))))) b_lambda!6511)))

(check-sat (not b!144826) (not b!144715) (not d!46127) b_and!9037 (not bm!16079) (not b!144788) (not b!144944) (not b!144793) (not b!144805) (not b!144730) (not bm!16095) (not b!144803) (not b!144967) (not bm!16170) (not b!144835) (not b!144959) (not d!46145) (not b!144789) (not bm!16169) (not bm!16171) (not bm!16153) (not d!46131) (not bm!16161) (not bm!16167) (not b!144717) (not b!144824) (not bm!16173) (not bm!16158) (not b_lambda!6511) (not b!144743) (not b!144819) (not b!144960) (not bm!16098) (not b!144818) (not d!46129) (not b!144935) (not d!46119) (not b!144822) (not d!46149) (not mapNonEmpty!4920) (not mapNonEmpty!4919) (not bm!16157) (not bm!16164) (not b_next!3061) (not b!144732) (not b!144966) (not bm!16100) (not b!144798) (not d!46135) (not b!144738) (not b!144921) (not bm!16165) (not b!144813) (not b!144833) (not b_lambda!6507) b_and!9039 (not b!144930) (not b!144931) (not bm!16101) (not b!144716) (not b!144938) (not b!144729) (not d!46147) (not b!144821) (not bm!16096) (not b_next!3063) (not d!46123) tp_is_empty!2947 (not b!144800) (not bm!16156) (not b!144795) (not d!46133))
(check-sat b_and!9037 b_and!9039 (not b_next!3061) (not b_next!3063))
(get-model)

(declare-fun lt!76154 () Bool)

(declare-fun d!46153 () Bool)

(assert (=> d!46153 (= lt!76154 (select (content!142 lt!75945) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!94477 () Bool)

(assert (=> d!46153 (= lt!76154 e!94477)))

(declare-fun res!69041 () Bool)

(assert (=> d!46153 (=> (not res!69041) (not e!94477))))

(assert (=> d!46153 (= res!69041 ((_ is Cons!1731) lt!75945))))

(assert (=> d!46153 (= (contains!917 lt!75945 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!76154)))

(declare-fun b!144978 () Bool)

(declare-fun e!94478 () Bool)

(assert (=> b!144978 (= e!94477 e!94478)))

(declare-fun res!69040 () Bool)

(assert (=> b!144978 (=> res!69040 e!94478)))

(assert (=> b!144978 (= res!69040 (= (h!2339 lt!75945) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!144979 () Bool)

(assert (=> b!144979 (= e!94478 (contains!917 (t!6368 lt!75945) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!46153 res!69041) b!144978))

(assert (= (and b!144978 (not res!69040)) b!144979))

(assert (=> d!46153 m!174641))

(assert (=> d!46153 m!174575))

(declare-fun m!174731 () Bool)

(assert (=> d!46153 m!174731))

(assert (=> b!144979 m!174575))

(declare-fun m!174733 () Bool)

(assert (=> b!144979 m!174733))

(assert (=> b!144821 d!46153))

(declare-fun d!46155 () Bool)

(declare-fun e!94479 () Bool)

(assert (=> d!46155 e!94479))

(declare-fun res!69042 () Bool)

(assert (=> d!46155 (=> res!69042 e!94479)))

(declare-fun lt!76158 () Bool)

(assert (=> d!46155 (= res!69042 (not lt!76158))))

(declare-fun lt!76156 () Bool)

(assert (=> d!46155 (= lt!76158 lt!76156)))

(declare-fun lt!76155 () Unit!4574)

(declare-fun e!94480 () Unit!4574)

(assert (=> d!46155 (= lt!76155 e!94480)))

(declare-fun c!27451 () Bool)

(assert (=> d!46155 (= c!27451 lt!76156)))

(assert (=> d!46155 (= lt!76156 (containsKey!183 (toList!865 e!94450) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (=> d!46155 (= (contains!918 e!94450 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)) lt!76158)))

(declare-fun b!144980 () Bool)

(declare-fun lt!76157 () Unit!4574)

(assert (=> b!144980 (= e!94480 lt!76157)))

(assert (=> b!144980 (= lt!76157 (lemmaContainsKeyImpliesGetValueByKeyDefined!131 (toList!865 e!94450) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (=> b!144980 (isDefined!132 (getValueByKey!180 (toList!865 e!94450) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun b!144981 () Bool)

(declare-fun Unit!4580 () Unit!4574)

(assert (=> b!144981 (= e!94480 Unit!4580)))

(declare-fun b!144982 () Bool)

(assert (=> b!144982 (= e!94479 (isDefined!132 (getValueByKey!180 (toList!865 e!94450) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355))))))

(assert (= (and d!46155 c!27451) b!144980))

(assert (= (and d!46155 (not c!27451)) b!144981))

(assert (= (and d!46155 (not res!69042)) b!144982))

(assert (=> d!46155 m!174417))

(declare-fun m!174735 () Bool)

(assert (=> d!46155 m!174735))

(assert (=> b!144980 m!174417))

(declare-fun m!174737 () Bool)

(assert (=> b!144980 m!174737))

(assert (=> b!144980 m!174417))

(declare-fun m!174739 () Bool)

(assert (=> b!144980 m!174739))

(assert (=> b!144980 m!174739))

(declare-fun m!174741 () Bool)

(assert (=> b!144980 m!174741))

(assert (=> b!144982 m!174417))

(assert (=> b!144982 m!174739))

(assert (=> b!144982 m!174739))

(assert (=> b!144982 m!174741))

(assert (=> bm!16173 d!46155))

(declare-fun b!144995 () Bool)

(declare-fun e!94487 () SeekEntryResult!276)

(declare-fun lt!76165 () SeekEntryResult!276)

(assert (=> b!144995 (= e!94487 (Found!276 (index!3272 lt!76165)))))

(declare-fun b!144997 () Bool)

(declare-fun e!94488 () SeekEntryResult!276)

(assert (=> b!144997 (= e!94488 Undefined!276)))

(declare-fun b!144998 () Bool)

(declare-fun e!94489 () SeekEntryResult!276)

(assert (=> b!144998 (= e!94489 (MissingZero!276 (index!3272 lt!76165)))))

(declare-fun b!144999 () Bool)

(declare-fun c!27459 () Bool)

(declare-fun lt!76167 () (_ BitVec 64))

(assert (=> b!144999 (= c!27459 (= lt!76167 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!144999 (= e!94487 e!94489)))

(declare-fun b!145000 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4921 (_ BitVec 32)) SeekEntryResult!276)

(assert (=> b!145000 (= e!94489 (seekKeyOrZeroReturnVacant!0 (x!16508 lt!76165) (index!3272 lt!76165) (index!3272 lt!76165) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (_keys!4755 newMap!16) (mask!7352 newMap!16)))))

(declare-fun lt!76166 () SeekEntryResult!276)

(declare-fun d!46157 () Bool)

(assert (=> d!46157 (and (or ((_ is Undefined!276) lt!76166) (not ((_ is Found!276) lt!76166)) (and (bvsge (index!3271 lt!76166) #b00000000000000000000000000000000) (bvslt (index!3271 lt!76166) (size!2599 (_keys!4755 newMap!16))))) (or ((_ is Undefined!276) lt!76166) ((_ is Found!276) lt!76166) (not ((_ is MissingZero!276) lt!76166)) (and (bvsge (index!3270 lt!76166) #b00000000000000000000000000000000) (bvslt (index!3270 lt!76166) (size!2599 (_keys!4755 newMap!16))))) (or ((_ is Undefined!276) lt!76166) ((_ is Found!276) lt!76166) ((_ is MissingZero!276) lt!76166) (not ((_ is MissingVacant!276) lt!76166)) (and (bvsge (index!3273 lt!76166) #b00000000000000000000000000000000) (bvslt (index!3273 lt!76166) (size!2599 (_keys!4755 newMap!16))))) (or ((_ is Undefined!276) lt!76166) (ite ((_ is Found!276) lt!76166) (= (select (arr!2324 (_keys!4755 newMap!16)) (index!3271 lt!76166)) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)) (ite ((_ is MissingZero!276) lt!76166) (= (select (arr!2324 (_keys!4755 newMap!16)) (index!3270 lt!76166)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!276) lt!76166) (= (select (arr!2324 (_keys!4755 newMap!16)) (index!3273 lt!76166)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!46157 (= lt!76166 e!94488)))

(declare-fun c!27460 () Bool)

(assert (=> d!46157 (= c!27460 (and ((_ is Intermediate!276) lt!76165) (undefined!1088 lt!76165)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4921 (_ BitVec 32)) SeekEntryResult!276)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!46157 (= lt!76165 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (mask!7352 newMap!16)) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (_keys!4755 newMap!16) (mask!7352 newMap!16)))))

(assert (=> d!46157 (validMask!0 (mask!7352 newMap!16))))

(assert (=> d!46157 (= (seekEntryOrOpen!0 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (_keys!4755 newMap!16) (mask!7352 newMap!16)) lt!76166)))

(declare-fun b!144996 () Bool)

(assert (=> b!144996 (= e!94488 e!94487)))

(assert (=> b!144996 (= lt!76167 (select (arr!2324 (_keys!4755 newMap!16)) (index!3272 lt!76165)))))

(declare-fun c!27458 () Bool)

(assert (=> b!144996 (= c!27458 (= lt!76167 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (= (and d!46157 c!27460) b!144997))

(assert (= (and d!46157 (not c!27460)) b!144996))

(assert (= (and b!144996 c!27458) b!144995))

(assert (= (and b!144996 (not c!27458)) b!144999))

(assert (= (and b!144999 c!27459) b!144998))

(assert (= (and b!144999 (not c!27459)) b!145000))

(assert (=> b!145000 m!174417))

(declare-fun m!174743 () Bool)

(assert (=> b!145000 m!174743))

(declare-fun m!174745 () Bool)

(assert (=> d!46157 m!174745))

(assert (=> d!46157 m!174417))

(declare-fun m!174747 () Bool)

(assert (=> d!46157 m!174747))

(assert (=> d!46157 m!174417))

(assert (=> d!46157 m!174745))

(declare-fun m!174749 () Bool)

(assert (=> d!46157 m!174749))

(declare-fun m!174751 () Bool)

(assert (=> d!46157 m!174751))

(declare-fun m!174753 () Bool)

(assert (=> d!46157 m!174753))

(declare-fun m!174755 () Bool)

(assert (=> d!46157 m!174755))

(declare-fun m!174757 () Bool)

(assert (=> b!144996 m!174757))

(assert (=> b!144944 d!46157))

(declare-fun d!46159 () Bool)

(declare-fun e!94490 () Bool)

(assert (=> d!46159 e!94490))

(declare-fun res!69043 () Bool)

(assert (=> d!46159 (=> res!69043 e!94490)))

(declare-fun lt!76171 () Bool)

(assert (=> d!46159 (= res!69043 (not lt!76171))))

(declare-fun lt!76169 () Bool)

(assert (=> d!46159 (= lt!76171 lt!76169)))

(declare-fun lt!76168 () Unit!4574)

(declare-fun e!94491 () Unit!4574)

(assert (=> d!46159 (= lt!76168 e!94491)))

(declare-fun c!27461 () Bool)

(assert (=> d!46159 (= c!27461 lt!76169)))

(assert (=> d!46159 (= lt!76169 (containsKey!183 (toList!865 call!16171) (select (arr!2324 (_keys!4755 newMap!16)) (index!3271 lt!76144))))))

(assert (=> d!46159 (= (contains!918 call!16171 (select (arr!2324 (_keys!4755 newMap!16)) (index!3271 lt!76144))) lt!76171)))

(declare-fun b!145001 () Bool)

(declare-fun lt!76170 () Unit!4574)

(assert (=> b!145001 (= e!94491 lt!76170)))

(assert (=> b!145001 (= lt!76170 (lemmaContainsKeyImpliesGetValueByKeyDefined!131 (toList!865 call!16171) (select (arr!2324 (_keys!4755 newMap!16)) (index!3271 lt!76144))))))

(assert (=> b!145001 (isDefined!132 (getValueByKey!180 (toList!865 call!16171) (select (arr!2324 (_keys!4755 newMap!16)) (index!3271 lt!76144))))))

(declare-fun b!145002 () Bool)

(declare-fun Unit!4581 () Unit!4574)

(assert (=> b!145002 (= e!94491 Unit!4581)))

(declare-fun b!145003 () Bool)

(assert (=> b!145003 (= e!94490 (isDefined!132 (getValueByKey!180 (toList!865 call!16171) (select (arr!2324 (_keys!4755 newMap!16)) (index!3271 lt!76144)))))))

(assert (= (and d!46159 c!27461) b!145001))

(assert (= (and d!46159 (not c!27461)) b!145002))

(assert (= (and d!46159 (not res!69043)) b!145003))

(assert (=> d!46159 m!174677))

(declare-fun m!174759 () Bool)

(assert (=> d!46159 m!174759))

(assert (=> b!145001 m!174677))

(declare-fun m!174761 () Bool)

(assert (=> b!145001 m!174761))

(assert (=> b!145001 m!174677))

(declare-fun m!174763 () Bool)

(assert (=> b!145001 m!174763))

(assert (=> b!145001 m!174763))

(declare-fun m!174765 () Bool)

(assert (=> b!145001 m!174765))

(assert (=> b!145003 m!174677))

(assert (=> b!145003 m!174763))

(assert (=> b!145003 m!174763))

(assert (=> b!145003 m!174765))

(assert (=> b!144931 d!46159))

(declare-fun d!46161 () Bool)

(declare-fun e!94494 () Bool)

(assert (=> d!46161 e!94494))

(declare-fun res!69046 () Bool)

(assert (=> d!46161 (=> (not res!69046) (not e!94494))))

(assert (=> d!46161 (= res!69046 (and (bvsge (index!3271 lt!76144) #b00000000000000000000000000000000) (bvslt (index!3271 lt!76144) (size!2599 (_keys!4755 newMap!16)))))))

(declare-fun lt!76174 () Unit!4574)

(declare-fun choose!897 (array!4921 array!4923 (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 (_ BitVec 32) Int) Unit!4574)

(assert (=> d!46161 (= lt!76174 (choose!897 (_keys!4755 newMap!16) lt!76132 (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (index!3271 lt!76144) (defaultEntry!2988 newMap!16)))))

(assert (=> d!46161 (validMask!0 (mask!7352 newMap!16))))

(assert (=> d!46161 (= (lemmaValidKeyInArrayIsInListMap!128 (_keys!4755 newMap!16) lt!76132 (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (index!3271 lt!76144) (defaultEntry!2988 newMap!16)) lt!76174)))

(declare-fun b!145006 () Bool)

(assert (=> b!145006 (= e!94494 (contains!918 (getCurrentListMap!537 (_keys!4755 newMap!16) lt!76132 (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)) (select (arr!2324 (_keys!4755 newMap!16)) (index!3271 lt!76144))))))

(assert (= (and d!46161 res!69046) b!145006))

(declare-fun m!174767 () Bool)

(assert (=> d!46161 m!174767))

(assert (=> d!46161 m!174753))

(declare-fun m!174769 () Bool)

(assert (=> b!145006 m!174769))

(assert (=> b!145006 m!174677))

(assert (=> b!145006 m!174769))

(assert (=> b!145006 m!174677))

(declare-fun m!174771 () Bool)

(assert (=> b!145006 m!174771))

(assert (=> b!144931 d!46161))

(declare-fun d!46163 () Bool)

(declare-fun e!94497 () Bool)

(assert (=> d!46163 e!94497))

(declare-fun res!69049 () Bool)

(assert (=> d!46163 (=> (not res!69049) (not e!94497))))

(assert (=> d!46163 (= res!69049 (and (bvsge (index!3271 lt!76144) #b00000000000000000000000000000000) (bvslt (index!3271 lt!76144) (size!2600 (_values!2971 newMap!16)))))))

(declare-fun lt!76177 () Unit!4574)

(declare-fun choose!898 (array!4921 array!4923 (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 (_ BitVec 32) (_ BitVec 64) V!3577 Int) Unit!4574)

(assert (=> d!46163 (= lt!76177 (choose!898 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (index!3271 lt!76144) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2988 newMap!16)))))

(assert (=> d!46163 (validMask!0 (mask!7352 newMap!16))))

(assert (=> d!46163 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!68 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (index!3271 lt!76144) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2988 newMap!16)) lt!76177)))

(declare-fun b!145009 () Bool)

(assert (=> b!145009 (= e!94497 (= (+!176 (getCurrentListMap!537 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)) (tuple2!2651 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!537 (_keys!4755 newMap!16) (array!4924 (store (arr!2325 (_values!2971 newMap!16)) (index!3271 lt!76144) (ValueCellFull!1130 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2600 (_values!2971 newMap!16))) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16))))))

(assert (= (and d!46163 res!69049) b!145009))

(assert (=> d!46163 m!174417))

(assert (=> d!46163 m!174453))

(declare-fun m!174773 () Bool)

(assert (=> d!46163 m!174773))

(assert (=> d!46163 m!174753))

(assert (=> b!145009 m!174583))

(assert (=> b!145009 m!174583))

(declare-fun m!174775 () Bool)

(assert (=> b!145009 m!174775))

(assert (=> b!145009 m!174681))

(declare-fun m!174777 () Bool)

(assert (=> b!145009 m!174777))

(assert (=> b!144931 d!46163))

(declare-fun bm!16174 () Bool)

(declare-fun call!16181 () ListLongMap!1699)

(declare-fun call!16182 () ListLongMap!1699)

(assert (=> bm!16174 (= call!16181 call!16182)))

(declare-fun b!145010 () Bool)

(declare-fun c!27464 () Bool)

(assert (=> b!145010 (= c!27464 (and (not (= (bvand (extraKeys!2735 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2735 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!94499 () ListLongMap!1699)

(declare-fun e!94503 () ListLongMap!1699)

(assert (=> b!145010 (= e!94499 e!94503)))

(declare-fun b!145011 () Bool)

(declare-fun e!94507 () Bool)

(assert (=> b!145011 (= e!94507 (validKeyInArray!0 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!145013 () Bool)

(declare-fun call!16179 () ListLongMap!1699)

(assert (=> b!145013 (= e!94503 call!16179)))

(declare-fun b!145014 () Bool)

(declare-fun e!94510 () Bool)

(declare-fun e!94505 () Bool)

(assert (=> b!145014 (= e!94510 e!94505)))

(declare-fun res!69058 () Bool)

(declare-fun call!16180 () Bool)

(assert (=> b!145014 (= res!69058 call!16180)))

(assert (=> b!145014 (=> (not res!69058) (not e!94505))))

(declare-fun b!145015 () Bool)

(declare-fun e!94509 () Bool)

(assert (=> b!145015 (= e!94509 e!94510)))

(declare-fun c!27466 () Bool)

(assert (=> b!145015 (= c!27466 (not (= (bvand (extraKeys!2735 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!16175 () Bool)

(declare-fun call!16177 () Bool)

(declare-fun lt!76196 () ListLongMap!1699)

(assert (=> bm!16175 (= call!16177 (contains!918 lt!76196 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!16176 () Bool)

(assert (=> bm!16176 (= call!16182 (getCurrentListMapNoExtraKeys!143 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun b!145016 () Bool)

(declare-fun e!94500 () Bool)

(assert (=> b!145016 (= e!94500 (= (apply!123 lt!76196 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2834 newMap!16)))))

(declare-fun bm!16177 () Bool)

(declare-fun call!16183 () ListLongMap!1699)

(assert (=> bm!16177 (= call!16183 call!16181)))

(declare-fun b!145017 () Bool)

(declare-fun e!94502 () ListLongMap!1699)

(assert (=> b!145017 (= e!94502 e!94499)))

(declare-fun c!27465 () Bool)

(assert (=> b!145017 (= c!27465 (and (not (= (bvand (extraKeys!2735 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2735 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!145018 () Bool)

(declare-fun e!94508 () Bool)

(assert (=> b!145018 (= e!94508 (= (apply!123 lt!76196 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000)) (get!1553 (select (arr!2325 (_values!2971 newMap!16)) #b00000000000000000000000000000000) (dynLambda!446 (defaultEntry!2988 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!145018 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2600 (_values!2971 newMap!16))))))

(assert (=> b!145018 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2599 (_keys!4755 newMap!16))))))

(declare-fun c!27463 () Bool)

(declare-fun call!16178 () ListLongMap!1699)

(declare-fun bm!16178 () Bool)

(assert (=> bm!16178 (= call!16178 (+!176 (ite c!27463 call!16182 (ite c!27465 call!16181 call!16183)) (ite (or c!27463 c!27465) (tuple2!2651 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2834 newMap!16)) (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 newMap!16)))))))

(declare-fun b!145019 () Bool)

(declare-fun e!94501 () Bool)

(assert (=> b!145019 (= e!94501 (not call!16177))))

(declare-fun b!145012 () Bool)

(assert (=> b!145012 (= e!94502 (+!176 call!16178 (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 newMap!16))))))

(declare-fun d!46165 () Bool)

(assert (=> d!46165 e!94509))

(declare-fun res!69056 () Bool)

(assert (=> d!46165 (=> (not res!69056) (not e!94509))))

(assert (=> d!46165 (= res!69056 (or (bvsge #b00000000000000000000000000000000 (size!2599 (_keys!4755 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2599 (_keys!4755 newMap!16))))))))

(declare-fun lt!76188 () ListLongMap!1699)

(assert (=> d!46165 (= lt!76196 lt!76188)))

(declare-fun lt!76194 () Unit!4574)

(declare-fun e!94506 () Unit!4574)

(assert (=> d!46165 (= lt!76194 e!94506)))

(declare-fun c!27462 () Bool)

(assert (=> d!46165 (= c!27462 e!94507)))

(declare-fun res!69055 () Bool)

(assert (=> d!46165 (=> (not res!69055) (not e!94507))))

(assert (=> d!46165 (= res!69055 (bvslt #b00000000000000000000000000000000 (size!2599 (_keys!4755 newMap!16))))))

(assert (=> d!46165 (= lt!76188 e!94502)))

(assert (=> d!46165 (= c!27463 (and (not (= (bvand (extraKeys!2735 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2735 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!46165 (validMask!0 (mask!7352 newMap!16))))

(assert (=> d!46165 (= (getCurrentListMap!537 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)) lt!76196)))

(declare-fun bm!16179 () Bool)

(assert (=> bm!16179 (= call!16179 call!16178)))

(declare-fun b!145020 () Bool)

(declare-fun res!69054 () Bool)

(assert (=> b!145020 (=> (not res!69054) (not e!94509))))

(declare-fun e!94498 () Bool)

(assert (=> b!145020 (= res!69054 e!94498)))

(declare-fun res!69053 () Bool)

(assert (=> b!145020 (=> res!69053 e!94498)))

(declare-fun e!94504 () Bool)

(assert (=> b!145020 (= res!69053 (not e!94504))))

(declare-fun res!69050 () Bool)

(assert (=> b!145020 (=> (not res!69050) (not e!94504))))

(assert (=> b!145020 (= res!69050 (bvslt #b00000000000000000000000000000000 (size!2599 (_keys!4755 newMap!16))))))

(declare-fun b!145021 () Bool)

(assert (=> b!145021 (= e!94505 (= (apply!123 lt!76196 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2834 newMap!16)))))

(declare-fun b!145022 () Bool)

(declare-fun Unit!4582 () Unit!4574)

(assert (=> b!145022 (= e!94506 Unit!4582)))

(declare-fun b!145023 () Bool)

(assert (=> b!145023 (= e!94498 e!94508)))

(declare-fun res!69052 () Bool)

(assert (=> b!145023 (=> (not res!69052) (not e!94508))))

(assert (=> b!145023 (= res!69052 (contains!918 lt!76196 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!145023 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2599 (_keys!4755 newMap!16))))))

(declare-fun bm!16180 () Bool)

(assert (=> bm!16180 (= call!16180 (contains!918 lt!76196 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145024 () Bool)

(assert (=> b!145024 (= e!94501 e!94500)))

(declare-fun res!69051 () Bool)

(assert (=> b!145024 (= res!69051 call!16177)))

(assert (=> b!145024 (=> (not res!69051) (not e!94500))))

(declare-fun b!145025 () Bool)

(assert (=> b!145025 (= e!94503 call!16183)))

(declare-fun b!145026 () Bool)

(declare-fun lt!76185 () Unit!4574)

(assert (=> b!145026 (= e!94506 lt!76185)))

(declare-fun lt!76189 () ListLongMap!1699)

(assert (=> b!145026 (= lt!76189 (getCurrentListMapNoExtraKeys!143 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76178 () (_ BitVec 64))

(assert (=> b!145026 (= lt!76178 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76191 () (_ BitVec 64))

(assert (=> b!145026 (= lt!76191 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76195 () Unit!4574)

(assert (=> b!145026 (= lt!76195 (addStillContains!99 lt!76189 lt!76178 (zeroValue!2834 newMap!16) lt!76191))))

(assert (=> b!145026 (contains!918 (+!176 lt!76189 (tuple2!2651 lt!76178 (zeroValue!2834 newMap!16))) lt!76191)))

(declare-fun lt!76198 () Unit!4574)

(assert (=> b!145026 (= lt!76198 lt!76195)))

(declare-fun lt!76181 () ListLongMap!1699)

(assert (=> b!145026 (= lt!76181 (getCurrentListMapNoExtraKeys!143 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76182 () (_ BitVec 64))

(assert (=> b!145026 (= lt!76182 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76190 () (_ BitVec 64))

(assert (=> b!145026 (= lt!76190 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76199 () Unit!4574)

(assert (=> b!145026 (= lt!76199 (addApplyDifferent!99 lt!76181 lt!76182 (minValue!2834 newMap!16) lt!76190))))

(assert (=> b!145026 (= (apply!123 (+!176 lt!76181 (tuple2!2651 lt!76182 (minValue!2834 newMap!16))) lt!76190) (apply!123 lt!76181 lt!76190))))

(declare-fun lt!76183 () Unit!4574)

(assert (=> b!145026 (= lt!76183 lt!76199)))

(declare-fun lt!76192 () ListLongMap!1699)

(assert (=> b!145026 (= lt!76192 (getCurrentListMapNoExtraKeys!143 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76197 () (_ BitVec 64))

(assert (=> b!145026 (= lt!76197 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76180 () (_ BitVec 64))

(assert (=> b!145026 (= lt!76180 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76187 () Unit!4574)

(assert (=> b!145026 (= lt!76187 (addApplyDifferent!99 lt!76192 lt!76197 (zeroValue!2834 newMap!16) lt!76180))))

(assert (=> b!145026 (= (apply!123 (+!176 lt!76192 (tuple2!2651 lt!76197 (zeroValue!2834 newMap!16))) lt!76180) (apply!123 lt!76192 lt!76180))))

(declare-fun lt!76193 () Unit!4574)

(assert (=> b!145026 (= lt!76193 lt!76187)))

(declare-fun lt!76179 () ListLongMap!1699)

(assert (=> b!145026 (= lt!76179 (getCurrentListMapNoExtraKeys!143 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76184 () (_ BitVec 64))

(assert (=> b!145026 (= lt!76184 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76186 () (_ BitVec 64))

(assert (=> b!145026 (= lt!76186 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!145026 (= lt!76185 (addApplyDifferent!99 lt!76179 lt!76184 (minValue!2834 newMap!16) lt!76186))))

(assert (=> b!145026 (= (apply!123 (+!176 lt!76179 (tuple2!2651 lt!76184 (minValue!2834 newMap!16))) lt!76186) (apply!123 lt!76179 lt!76186))))

(declare-fun b!145027 () Bool)

(assert (=> b!145027 (= e!94510 (not call!16180))))

(declare-fun b!145028 () Bool)

(assert (=> b!145028 (= e!94504 (validKeyInArray!0 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!145029 () Bool)

(declare-fun res!69057 () Bool)

(assert (=> b!145029 (=> (not res!69057) (not e!94509))))

(assert (=> b!145029 (= res!69057 e!94501)))

(declare-fun c!27467 () Bool)

(assert (=> b!145029 (= c!27467 (not (= (bvand (extraKeys!2735 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!145030 () Bool)

(assert (=> b!145030 (= e!94499 call!16179)))

(assert (= (and d!46165 c!27463) b!145012))

(assert (= (and d!46165 (not c!27463)) b!145017))

(assert (= (and b!145017 c!27465) b!145030))

(assert (= (and b!145017 (not c!27465)) b!145010))

(assert (= (and b!145010 c!27464) b!145013))

(assert (= (and b!145010 (not c!27464)) b!145025))

(assert (= (or b!145013 b!145025) bm!16177))

(assert (= (or b!145030 bm!16177) bm!16174))

(assert (= (or b!145030 b!145013) bm!16179))

(assert (= (or b!145012 bm!16174) bm!16176))

(assert (= (or b!145012 bm!16179) bm!16178))

(assert (= (and d!46165 res!69055) b!145011))

(assert (= (and d!46165 c!27462) b!145026))

(assert (= (and d!46165 (not c!27462)) b!145022))

(assert (= (and d!46165 res!69056) b!145020))

(assert (= (and b!145020 res!69050) b!145028))

(assert (= (and b!145020 (not res!69053)) b!145023))

(assert (= (and b!145023 res!69052) b!145018))

(assert (= (and b!145020 res!69054) b!145029))

(assert (= (and b!145029 c!27467) b!145024))

(assert (= (and b!145029 (not c!27467)) b!145019))

(assert (= (and b!145024 res!69051) b!145016))

(assert (= (or b!145024 b!145019) bm!16175))

(assert (= (and b!145029 res!69057) b!145015))

(assert (= (and b!145015 c!27466) b!145014))

(assert (= (and b!145015 (not c!27466)) b!145027))

(assert (= (and b!145014 res!69058) b!145021))

(assert (= (or b!145014 b!145027) bm!16180))

(declare-fun b_lambda!6513 () Bool)

(assert (=> (not b_lambda!6513) (not b!145018)))

(declare-fun tb!2605 () Bool)

(declare-fun t!6381 () Bool)

(assert (=> (and b!144577 (= (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) (defaultEntry!2988 newMap!16)) t!6381) tb!2605))

(declare-fun result!4267 () Bool)

(assert (=> tb!2605 (= result!4267 tp_is_empty!2947)))

(assert (=> b!145018 t!6381))

(declare-fun b_and!9041 () Bool)

(assert (= b_and!9037 (and (=> t!6381 result!4267) b_and!9041)))

(declare-fun t!6383 () Bool)

(declare-fun tb!2607 () Bool)

(assert (=> (and b!144581 (= (defaultEntry!2988 newMap!16) (defaultEntry!2988 newMap!16)) t!6383) tb!2607))

(declare-fun result!4269 () Bool)

(assert (= result!4269 result!4267))

(assert (=> b!145018 t!6383))

(declare-fun b_and!9043 () Bool)

(assert (= b_and!9039 (and (=> t!6383 result!4269) b_and!9043)))

(assert (=> d!46165 m!174753))

(declare-fun m!174779 () Bool)

(assert (=> b!145018 m!174779))

(declare-fun m!174781 () Bool)

(assert (=> b!145018 m!174781))

(declare-fun m!174783 () Bool)

(assert (=> b!145018 m!174783))

(declare-fun m!174785 () Bool)

(assert (=> b!145018 m!174785))

(assert (=> b!145018 m!174779))

(declare-fun m!174787 () Bool)

(assert (=> b!145018 m!174787))

(assert (=> b!145018 m!174785))

(assert (=> b!145018 m!174781))

(declare-fun m!174789 () Bool)

(assert (=> b!145012 m!174789))

(assert (=> b!145028 m!174781))

(assert (=> b!145028 m!174781))

(declare-fun m!174791 () Bool)

(assert (=> b!145028 m!174791))

(declare-fun m!174793 () Bool)

(assert (=> bm!16180 m!174793))

(declare-fun m!174795 () Bool)

(assert (=> bm!16176 m!174795))

(assert (=> b!145023 m!174781))

(assert (=> b!145023 m!174781))

(declare-fun m!174797 () Bool)

(assert (=> b!145023 m!174797))

(assert (=> b!145011 m!174781))

(assert (=> b!145011 m!174781))

(assert (=> b!145011 m!174791))

(declare-fun m!174799 () Bool)

(assert (=> b!145021 m!174799))

(declare-fun m!174801 () Bool)

(assert (=> bm!16178 m!174801))

(declare-fun m!174803 () Bool)

(assert (=> bm!16175 m!174803))

(declare-fun m!174805 () Bool)

(assert (=> b!145016 m!174805))

(declare-fun m!174807 () Bool)

(assert (=> b!145026 m!174807))

(declare-fun m!174809 () Bool)

(assert (=> b!145026 m!174809))

(declare-fun m!174811 () Bool)

(assert (=> b!145026 m!174811))

(declare-fun m!174813 () Bool)

(assert (=> b!145026 m!174813))

(declare-fun m!174815 () Bool)

(assert (=> b!145026 m!174815))

(declare-fun m!174817 () Bool)

(assert (=> b!145026 m!174817))

(declare-fun m!174819 () Bool)

(assert (=> b!145026 m!174819))

(declare-fun m!174821 () Bool)

(assert (=> b!145026 m!174821))

(declare-fun m!174823 () Bool)

(assert (=> b!145026 m!174823))

(assert (=> b!145026 m!174795))

(assert (=> b!145026 m!174807))

(declare-fun m!174825 () Bool)

(assert (=> b!145026 m!174825))

(assert (=> b!145026 m!174817))

(declare-fun m!174827 () Bool)

(assert (=> b!145026 m!174827))

(assert (=> b!145026 m!174813))

(declare-fun m!174829 () Bool)

(assert (=> b!145026 m!174829))

(declare-fun m!174831 () Bool)

(assert (=> b!145026 m!174831))

(declare-fun m!174833 () Bool)

(assert (=> b!145026 m!174833))

(declare-fun m!174835 () Bool)

(assert (=> b!145026 m!174835))

(assert (=> b!145026 m!174833))

(assert (=> b!145026 m!174781))

(assert (=> b!144959 d!46165))

(declare-fun d!46167 () Bool)

(declare-fun e!94511 () Bool)

(assert (=> d!46167 e!94511))

(declare-fun res!69059 () Bool)

(assert (=> d!46167 (=> res!69059 e!94511)))

(declare-fun lt!76203 () Bool)

(assert (=> d!46167 (= res!69059 (not lt!76203))))

(declare-fun lt!76201 () Bool)

(assert (=> d!46167 (= lt!76203 lt!76201)))

(declare-fun lt!76200 () Unit!4574)

(declare-fun e!94512 () Unit!4574)

(assert (=> d!46167 (= lt!76200 e!94512)))

(declare-fun c!27468 () Bool)

(assert (=> d!46167 (= c!27468 lt!76201)))

(assert (=> d!46167 (= lt!76201 (containsKey!183 (toList!865 lt!76053) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!46167 (= (contains!918 lt!76053 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!76203)))

(declare-fun b!145031 () Bool)

(declare-fun lt!76202 () Unit!4574)

(assert (=> b!145031 (= e!94512 lt!76202)))

(assert (=> b!145031 (= lt!76202 (lemmaContainsKeyImpliesGetValueByKeyDefined!131 (toList!865 lt!76053) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!145031 (isDefined!132 (getValueByKey!180 (toList!865 lt!76053) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!145032 () Bool)

(declare-fun Unit!4583 () Unit!4574)

(assert (=> b!145032 (= e!94512 Unit!4583)))

(declare-fun b!145033 () Bool)

(assert (=> b!145033 (= e!94511 (isDefined!132 (getValueByKey!180 (toList!865 lt!76053) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!46167 c!27468) b!145031))

(assert (= (and d!46167 (not c!27468)) b!145032))

(assert (= (and d!46167 (not res!69059)) b!145033))

(assert (=> d!46167 m!174575))

(declare-fun m!174837 () Bool)

(assert (=> d!46167 m!174837))

(assert (=> b!145031 m!174575))

(declare-fun m!174839 () Bool)

(assert (=> b!145031 m!174839))

(assert (=> b!145031 m!174575))

(declare-fun m!174841 () Bool)

(assert (=> b!145031 m!174841))

(assert (=> b!145031 m!174841))

(declare-fun m!174843 () Bool)

(assert (=> b!145031 m!174843))

(assert (=> b!145033 m!174575))

(assert (=> b!145033 m!174841))

(assert (=> b!145033 m!174841))

(assert (=> b!145033 m!174843))

(assert (=> b!144800 d!46167))

(declare-fun bm!16181 () Bool)

(declare-fun call!16188 () ListLongMap!1699)

(declare-fun call!16189 () ListLongMap!1699)

(assert (=> bm!16181 (= call!16188 call!16189)))

(declare-fun b!145034 () Bool)

(declare-fun c!27471 () Bool)

(assert (=> b!145034 (= c!27471 (and (not (= (bvand (extraKeys!2735 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2735 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!94514 () ListLongMap!1699)

(declare-fun e!94518 () ListLongMap!1699)

(assert (=> b!145034 (= e!94514 e!94518)))

(declare-fun b!145035 () Bool)

(declare-fun e!94522 () Bool)

(assert (=> b!145035 (= e!94522 (validKeyInArray!0 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!145037 () Bool)

(declare-fun call!16186 () ListLongMap!1699)

(assert (=> b!145037 (= e!94518 call!16186)))

(declare-fun b!145038 () Bool)

(declare-fun e!94525 () Bool)

(declare-fun e!94520 () Bool)

(assert (=> b!145038 (= e!94525 e!94520)))

(declare-fun res!69068 () Bool)

(declare-fun call!16187 () Bool)

(assert (=> b!145038 (= res!69068 call!16187)))

(assert (=> b!145038 (=> (not res!69068) (not e!94520))))

(declare-fun b!145039 () Bool)

(declare-fun e!94524 () Bool)

(assert (=> b!145039 (= e!94524 e!94525)))

(declare-fun c!27473 () Bool)

(assert (=> b!145039 (= c!27473 (not (= (bvand (extraKeys!2735 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!16182 () Bool)

(declare-fun call!16184 () Bool)

(declare-fun lt!76222 () ListLongMap!1699)

(assert (=> bm!16182 (= call!16184 (contains!918 lt!76222 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!16183 () Bool)

(assert (=> bm!16183 (= call!16189 (getCurrentListMapNoExtraKeys!143 (_keys!4755 newMap!16) (ite (or c!27442 c!27441) (_values!2971 newMap!16) (array!4924 (store (arr!2325 (_values!2971 newMap!16)) (index!3271 lt!76144) (ValueCellFull!1130 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2600 (_values!2971 newMap!16)))) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun b!145040 () Bool)

(declare-fun e!94515 () Bool)

(assert (=> b!145040 (= e!94515 (= (apply!123 lt!76222 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2834 newMap!16)))))

(declare-fun bm!16184 () Bool)

(declare-fun call!16190 () ListLongMap!1699)

(assert (=> bm!16184 (= call!16190 call!16188)))

(declare-fun b!145041 () Bool)

(declare-fun e!94517 () ListLongMap!1699)

(assert (=> b!145041 (= e!94517 e!94514)))

(declare-fun c!27472 () Bool)

(assert (=> b!145041 (= c!27472 (and (not (= (bvand (extraKeys!2735 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2735 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!94523 () Bool)

(declare-fun b!145042 () Bool)

(assert (=> b!145042 (= e!94523 (= (apply!123 lt!76222 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000)) (get!1553 (select (arr!2325 (ite (or c!27442 c!27441) (_values!2971 newMap!16) (array!4924 (store (arr!2325 (_values!2971 newMap!16)) (index!3271 lt!76144) (ValueCellFull!1130 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2600 (_values!2971 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!446 (defaultEntry!2988 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!145042 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2600 (ite (or c!27442 c!27441) (_values!2971 newMap!16) (array!4924 (store (arr!2325 (_values!2971 newMap!16)) (index!3271 lt!76144) (ValueCellFull!1130 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2600 (_values!2971 newMap!16)))))))))

(assert (=> b!145042 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2599 (_keys!4755 newMap!16))))))

(declare-fun bm!16185 () Bool)

(declare-fun c!27470 () Bool)

(declare-fun call!16185 () ListLongMap!1699)

(assert (=> bm!16185 (= call!16185 (+!176 (ite c!27470 call!16189 (ite c!27472 call!16188 call!16190)) (ite (or c!27470 c!27472) (tuple2!2651 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2834 newMap!16)) (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 newMap!16)))))))

(declare-fun b!145043 () Bool)

(declare-fun e!94516 () Bool)

(assert (=> b!145043 (= e!94516 (not call!16184))))

(declare-fun b!145036 () Bool)

(assert (=> b!145036 (= e!94517 (+!176 call!16185 (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 newMap!16))))))

(declare-fun d!46169 () Bool)

(assert (=> d!46169 e!94524))

(declare-fun res!69066 () Bool)

(assert (=> d!46169 (=> (not res!69066) (not e!94524))))

(assert (=> d!46169 (= res!69066 (or (bvsge #b00000000000000000000000000000000 (size!2599 (_keys!4755 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2599 (_keys!4755 newMap!16))))))))

(declare-fun lt!76214 () ListLongMap!1699)

(assert (=> d!46169 (= lt!76222 lt!76214)))

(declare-fun lt!76220 () Unit!4574)

(declare-fun e!94521 () Unit!4574)

(assert (=> d!46169 (= lt!76220 e!94521)))

(declare-fun c!27469 () Bool)

(assert (=> d!46169 (= c!27469 e!94522)))

(declare-fun res!69065 () Bool)

(assert (=> d!46169 (=> (not res!69065) (not e!94522))))

(assert (=> d!46169 (= res!69065 (bvslt #b00000000000000000000000000000000 (size!2599 (_keys!4755 newMap!16))))))

(assert (=> d!46169 (= lt!76214 e!94517)))

(assert (=> d!46169 (= c!27470 (and (not (= (bvand (extraKeys!2735 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2735 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!46169 (validMask!0 (mask!7352 newMap!16))))

(assert (=> d!46169 (= (getCurrentListMap!537 (_keys!4755 newMap!16) (ite (or c!27442 c!27441) (_values!2971 newMap!16) (array!4924 (store (arr!2325 (_values!2971 newMap!16)) (index!3271 lt!76144) (ValueCellFull!1130 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2600 (_values!2971 newMap!16)))) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)) lt!76222)))

(declare-fun bm!16186 () Bool)

(assert (=> bm!16186 (= call!16186 call!16185)))

(declare-fun b!145044 () Bool)

(declare-fun res!69064 () Bool)

(assert (=> b!145044 (=> (not res!69064) (not e!94524))))

(declare-fun e!94513 () Bool)

(assert (=> b!145044 (= res!69064 e!94513)))

(declare-fun res!69063 () Bool)

(assert (=> b!145044 (=> res!69063 e!94513)))

(declare-fun e!94519 () Bool)

(assert (=> b!145044 (= res!69063 (not e!94519))))

(declare-fun res!69060 () Bool)

(assert (=> b!145044 (=> (not res!69060) (not e!94519))))

(assert (=> b!145044 (= res!69060 (bvslt #b00000000000000000000000000000000 (size!2599 (_keys!4755 newMap!16))))))

(declare-fun b!145045 () Bool)

(assert (=> b!145045 (= e!94520 (= (apply!123 lt!76222 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2834 newMap!16)))))

(declare-fun b!145046 () Bool)

(declare-fun Unit!4584 () Unit!4574)

(assert (=> b!145046 (= e!94521 Unit!4584)))

(declare-fun b!145047 () Bool)

(assert (=> b!145047 (= e!94513 e!94523)))

(declare-fun res!69062 () Bool)

(assert (=> b!145047 (=> (not res!69062) (not e!94523))))

(assert (=> b!145047 (= res!69062 (contains!918 lt!76222 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!145047 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2599 (_keys!4755 newMap!16))))))

(declare-fun bm!16187 () Bool)

(assert (=> bm!16187 (= call!16187 (contains!918 lt!76222 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145048 () Bool)

(assert (=> b!145048 (= e!94516 e!94515)))

(declare-fun res!69061 () Bool)

(assert (=> b!145048 (= res!69061 call!16184)))

(assert (=> b!145048 (=> (not res!69061) (not e!94515))))

(declare-fun b!145049 () Bool)

(assert (=> b!145049 (= e!94518 call!16190)))

(declare-fun b!145050 () Bool)

(declare-fun lt!76211 () Unit!4574)

(assert (=> b!145050 (= e!94521 lt!76211)))

(declare-fun lt!76215 () ListLongMap!1699)

(assert (=> b!145050 (= lt!76215 (getCurrentListMapNoExtraKeys!143 (_keys!4755 newMap!16) (ite (or c!27442 c!27441) (_values!2971 newMap!16) (array!4924 (store (arr!2325 (_values!2971 newMap!16)) (index!3271 lt!76144) (ValueCellFull!1130 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2600 (_values!2971 newMap!16)))) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76204 () (_ BitVec 64))

(assert (=> b!145050 (= lt!76204 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76217 () (_ BitVec 64))

(assert (=> b!145050 (= lt!76217 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76221 () Unit!4574)

(assert (=> b!145050 (= lt!76221 (addStillContains!99 lt!76215 lt!76204 (zeroValue!2834 newMap!16) lt!76217))))

(assert (=> b!145050 (contains!918 (+!176 lt!76215 (tuple2!2651 lt!76204 (zeroValue!2834 newMap!16))) lt!76217)))

(declare-fun lt!76224 () Unit!4574)

(assert (=> b!145050 (= lt!76224 lt!76221)))

(declare-fun lt!76207 () ListLongMap!1699)

(assert (=> b!145050 (= lt!76207 (getCurrentListMapNoExtraKeys!143 (_keys!4755 newMap!16) (ite (or c!27442 c!27441) (_values!2971 newMap!16) (array!4924 (store (arr!2325 (_values!2971 newMap!16)) (index!3271 lt!76144) (ValueCellFull!1130 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2600 (_values!2971 newMap!16)))) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76208 () (_ BitVec 64))

(assert (=> b!145050 (= lt!76208 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76216 () (_ BitVec 64))

(assert (=> b!145050 (= lt!76216 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76225 () Unit!4574)

(assert (=> b!145050 (= lt!76225 (addApplyDifferent!99 lt!76207 lt!76208 (minValue!2834 newMap!16) lt!76216))))

(assert (=> b!145050 (= (apply!123 (+!176 lt!76207 (tuple2!2651 lt!76208 (minValue!2834 newMap!16))) lt!76216) (apply!123 lt!76207 lt!76216))))

(declare-fun lt!76209 () Unit!4574)

(assert (=> b!145050 (= lt!76209 lt!76225)))

(declare-fun lt!76218 () ListLongMap!1699)

(assert (=> b!145050 (= lt!76218 (getCurrentListMapNoExtraKeys!143 (_keys!4755 newMap!16) (ite (or c!27442 c!27441) (_values!2971 newMap!16) (array!4924 (store (arr!2325 (_values!2971 newMap!16)) (index!3271 lt!76144) (ValueCellFull!1130 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2600 (_values!2971 newMap!16)))) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76223 () (_ BitVec 64))

(assert (=> b!145050 (= lt!76223 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76206 () (_ BitVec 64))

(assert (=> b!145050 (= lt!76206 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76213 () Unit!4574)

(assert (=> b!145050 (= lt!76213 (addApplyDifferent!99 lt!76218 lt!76223 (zeroValue!2834 newMap!16) lt!76206))))

(assert (=> b!145050 (= (apply!123 (+!176 lt!76218 (tuple2!2651 lt!76223 (zeroValue!2834 newMap!16))) lt!76206) (apply!123 lt!76218 lt!76206))))

(declare-fun lt!76219 () Unit!4574)

(assert (=> b!145050 (= lt!76219 lt!76213)))

(declare-fun lt!76205 () ListLongMap!1699)

(assert (=> b!145050 (= lt!76205 (getCurrentListMapNoExtraKeys!143 (_keys!4755 newMap!16) (ite (or c!27442 c!27441) (_values!2971 newMap!16) (array!4924 (store (arr!2325 (_values!2971 newMap!16)) (index!3271 lt!76144) (ValueCellFull!1130 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2600 (_values!2971 newMap!16)))) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76210 () (_ BitVec 64))

(assert (=> b!145050 (= lt!76210 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76212 () (_ BitVec 64))

(assert (=> b!145050 (= lt!76212 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!145050 (= lt!76211 (addApplyDifferent!99 lt!76205 lt!76210 (minValue!2834 newMap!16) lt!76212))))

(assert (=> b!145050 (= (apply!123 (+!176 lt!76205 (tuple2!2651 lt!76210 (minValue!2834 newMap!16))) lt!76212) (apply!123 lt!76205 lt!76212))))

(declare-fun b!145051 () Bool)

(assert (=> b!145051 (= e!94525 (not call!16187))))

(declare-fun b!145052 () Bool)

(assert (=> b!145052 (= e!94519 (validKeyInArray!0 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!145053 () Bool)

(declare-fun res!69067 () Bool)

(assert (=> b!145053 (=> (not res!69067) (not e!94524))))

(assert (=> b!145053 (= res!69067 e!94516)))

(declare-fun c!27474 () Bool)

(assert (=> b!145053 (= c!27474 (not (= (bvand (extraKeys!2735 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!145054 () Bool)

(assert (=> b!145054 (= e!94514 call!16186)))

(assert (= (and d!46169 c!27470) b!145036))

(assert (= (and d!46169 (not c!27470)) b!145041))

(assert (= (and b!145041 c!27472) b!145054))

(assert (= (and b!145041 (not c!27472)) b!145034))

(assert (= (and b!145034 c!27471) b!145037))

(assert (= (and b!145034 (not c!27471)) b!145049))

(assert (= (or b!145037 b!145049) bm!16184))

(assert (= (or b!145054 bm!16184) bm!16181))

(assert (= (or b!145054 b!145037) bm!16186))

(assert (= (or b!145036 bm!16181) bm!16183))

(assert (= (or b!145036 bm!16186) bm!16185))

(assert (= (and d!46169 res!69065) b!145035))

(assert (= (and d!46169 c!27469) b!145050))

(assert (= (and d!46169 (not c!27469)) b!145046))

(assert (= (and d!46169 res!69066) b!145044))

(assert (= (and b!145044 res!69060) b!145052))

(assert (= (and b!145044 (not res!69063)) b!145047))

(assert (= (and b!145047 res!69062) b!145042))

(assert (= (and b!145044 res!69064) b!145053))

(assert (= (and b!145053 c!27474) b!145048))

(assert (= (and b!145053 (not c!27474)) b!145043))

(assert (= (and b!145048 res!69061) b!145040))

(assert (= (or b!145048 b!145043) bm!16182))

(assert (= (and b!145053 res!69067) b!145039))

(assert (= (and b!145039 c!27473) b!145038))

(assert (= (and b!145039 (not c!27473)) b!145051))

(assert (= (and b!145038 res!69068) b!145045))

(assert (= (or b!145038 b!145051) bm!16187))

(declare-fun b_lambda!6515 () Bool)

(assert (=> (not b_lambda!6515) (not b!145042)))

(assert (=> b!145042 t!6381))

(declare-fun b_and!9045 () Bool)

(assert (= b_and!9041 (and (=> t!6381 result!4267) b_and!9045)))

(assert (=> b!145042 t!6383))

(declare-fun b_and!9047 () Bool)

(assert (= b_and!9043 (and (=> t!6383 result!4269) b_and!9047)))

(assert (=> d!46169 m!174753))

(assert (=> b!145042 m!174779))

(assert (=> b!145042 m!174781))

(declare-fun m!174845 () Bool)

(assert (=> b!145042 m!174845))

(declare-fun m!174847 () Bool)

(assert (=> b!145042 m!174847))

(assert (=> b!145042 m!174779))

(declare-fun m!174849 () Bool)

(assert (=> b!145042 m!174849))

(assert (=> b!145042 m!174847))

(assert (=> b!145042 m!174781))

(declare-fun m!174851 () Bool)

(assert (=> b!145036 m!174851))

(assert (=> b!145052 m!174781))

(assert (=> b!145052 m!174781))

(assert (=> b!145052 m!174791))

(declare-fun m!174853 () Bool)

(assert (=> bm!16187 m!174853))

(declare-fun m!174855 () Bool)

(assert (=> bm!16183 m!174855))

(assert (=> b!145047 m!174781))

(assert (=> b!145047 m!174781))

(declare-fun m!174857 () Bool)

(assert (=> b!145047 m!174857))

(assert (=> b!145035 m!174781))

(assert (=> b!145035 m!174781))

(assert (=> b!145035 m!174791))

(declare-fun m!174859 () Bool)

(assert (=> b!145045 m!174859))

(declare-fun m!174861 () Bool)

(assert (=> bm!16185 m!174861))

(declare-fun m!174863 () Bool)

(assert (=> bm!16182 m!174863))

(declare-fun m!174865 () Bool)

(assert (=> b!145040 m!174865))

(declare-fun m!174867 () Bool)

(assert (=> b!145050 m!174867))

(declare-fun m!174869 () Bool)

(assert (=> b!145050 m!174869))

(declare-fun m!174871 () Bool)

(assert (=> b!145050 m!174871))

(declare-fun m!174873 () Bool)

(assert (=> b!145050 m!174873))

(declare-fun m!174875 () Bool)

(assert (=> b!145050 m!174875))

(declare-fun m!174877 () Bool)

(assert (=> b!145050 m!174877))

(declare-fun m!174879 () Bool)

(assert (=> b!145050 m!174879))

(declare-fun m!174881 () Bool)

(assert (=> b!145050 m!174881))

(declare-fun m!174883 () Bool)

(assert (=> b!145050 m!174883))

(assert (=> b!145050 m!174855))

(assert (=> b!145050 m!174867))

(declare-fun m!174885 () Bool)

(assert (=> b!145050 m!174885))

(assert (=> b!145050 m!174877))

(declare-fun m!174887 () Bool)

(assert (=> b!145050 m!174887))

(assert (=> b!145050 m!174873))

(declare-fun m!174889 () Bool)

(assert (=> b!145050 m!174889))

(declare-fun m!174891 () Bool)

(assert (=> b!145050 m!174891))

(declare-fun m!174893 () Bool)

(assert (=> b!145050 m!174893))

(declare-fun m!174895 () Bool)

(assert (=> b!145050 m!174895))

(assert (=> b!145050 m!174893))

(assert (=> b!145050 m!174781))

(assert (=> bm!16158 d!46169))

(declare-fun d!46171 () Bool)

(declare-fun lt!76226 () Bool)

(assert (=> d!46171 (= lt!76226 (select (content!142 (t!6368 lt!75945)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94526 () Bool)

(assert (=> d!46171 (= lt!76226 e!94526)))

(declare-fun res!69070 () Bool)

(assert (=> d!46171 (=> (not res!69070) (not e!94526))))

(assert (=> d!46171 (= res!69070 ((_ is Cons!1731) (t!6368 lt!75945)))))

(assert (=> d!46171 (= (contains!917 (t!6368 lt!75945) #b0000000000000000000000000000000000000000000000000000000000000000) lt!76226)))

(declare-fun b!145055 () Bool)

(declare-fun e!94527 () Bool)

(assert (=> b!145055 (= e!94526 e!94527)))

(declare-fun res!69069 () Bool)

(assert (=> b!145055 (=> res!69069 e!94527)))

(assert (=> b!145055 (= res!69069 (= (h!2339 (t!6368 lt!75945)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145056 () Bool)

(assert (=> b!145056 (= e!94527 (contains!917 (t!6368 (t!6368 lt!75945)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!46171 res!69070) b!145055))

(assert (= (and b!145055 (not res!69069)) b!145056))

(declare-fun m!174897 () Bool)

(assert (=> d!46171 m!174897))

(declare-fun m!174899 () Bool)

(assert (=> d!46171 m!174899))

(declare-fun m!174901 () Bool)

(assert (=> b!145056 m!174901))

(assert (=> b!144826 d!46171))

(declare-fun bm!16188 () Bool)

(declare-fun call!16195 () ListLongMap!1699)

(declare-fun call!16196 () ListLongMap!1699)

(assert (=> bm!16188 (= call!16195 call!16196)))

(declare-fun b!145057 () Bool)

(declare-fun c!27477 () Bool)

(assert (=> b!145057 (= c!27477 (and (not (= (bvand (ite c!27442 (ite c!27435 lt!76152 lt!76136) (extraKeys!2735 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!27442 (ite c!27435 lt!76152 lt!76136) (extraKeys!2735 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!94529 () ListLongMap!1699)

(declare-fun e!94533 () ListLongMap!1699)

(assert (=> b!145057 (= e!94529 e!94533)))

(declare-fun b!145058 () Bool)

(declare-fun e!94537 () Bool)

(assert (=> b!145058 (= e!94537 (validKeyInArray!0 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!145060 () Bool)

(declare-fun call!16193 () ListLongMap!1699)

(assert (=> b!145060 (= e!94533 call!16193)))

(declare-fun b!145061 () Bool)

(declare-fun e!94540 () Bool)

(declare-fun e!94535 () Bool)

(assert (=> b!145061 (= e!94540 e!94535)))

(declare-fun res!69079 () Bool)

(declare-fun call!16194 () Bool)

(assert (=> b!145061 (= res!69079 call!16194)))

(assert (=> b!145061 (=> (not res!69079) (not e!94535))))

(declare-fun b!145062 () Bool)

(declare-fun e!94539 () Bool)

(assert (=> b!145062 (= e!94539 e!94540)))

(declare-fun c!27479 () Bool)

(assert (=> b!145062 (= c!27479 (not (= (bvand (ite c!27442 (ite c!27435 lt!76152 lt!76136) (extraKeys!2735 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!16189 () Bool)

(declare-fun call!16191 () Bool)

(declare-fun lt!76245 () ListLongMap!1699)

(assert (=> bm!16189 (= call!16191 (contains!918 lt!76245 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!16190 () Bool)

(assert (=> bm!16190 (= call!16196 (getCurrentListMapNoExtraKeys!143 (_keys!4755 newMap!16) (ite c!27442 (_values!2971 newMap!16) lt!76132) (mask!7352 newMap!16) (ite c!27442 (ite c!27435 lt!76152 lt!76136) (extraKeys!2735 newMap!16)) (ite (and c!27442 c!27435) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2834 newMap!16)) (ite c!27442 (ite c!27435 (minValue!2834 newMap!16) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2834 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun b!145063 () Bool)

(declare-fun e!94530 () Bool)

(assert (=> b!145063 (= e!94530 (= (apply!123 lt!76245 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!27442 c!27435) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2834 newMap!16))))))

(declare-fun bm!16191 () Bool)

(declare-fun call!16197 () ListLongMap!1699)

(assert (=> bm!16191 (= call!16197 call!16195)))

(declare-fun b!145064 () Bool)

(declare-fun e!94532 () ListLongMap!1699)

(assert (=> b!145064 (= e!94532 e!94529)))

(declare-fun c!27478 () Bool)

(assert (=> b!145064 (= c!27478 (and (not (= (bvand (ite c!27442 (ite c!27435 lt!76152 lt!76136) (extraKeys!2735 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!27442 (ite c!27435 lt!76152 lt!76136) (extraKeys!2735 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!94538 () Bool)

(declare-fun b!145065 () Bool)

(assert (=> b!145065 (= e!94538 (= (apply!123 lt!76245 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000)) (get!1553 (select (arr!2325 (ite c!27442 (_values!2971 newMap!16) lt!76132)) #b00000000000000000000000000000000) (dynLambda!446 (defaultEntry!2988 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!145065 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2600 (ite c!27442 (_values!2971 newMap!16) lt!76132))))))

(assert (=> b!145065 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2599 (_keys!4755 newMap!16))))))

(declare-fun call!16192 () ListLongMap!1699)

(declare-fun bm!16192 () Bool)

(declare-fun c!27476 () Bool)

(assert (=> bm!16192 (= call!16192 (+!176 (ite c!27476 call!16196 (ite c!27478 call!16195 call!16197)) (ite (or c!27476 c!27478) (tuple2!2651 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!27442 c!27435) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2834 newMap!16))) (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!27442 (ite c!27435 (minValue!2834 newMap!16) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2834 newMap!16))))))))

(declare-fun b!145066 () Bool)

(declare-fun e!94531 () Bool)

(assert (=> b!145066 (= e!94531 (not call!16191))))

(declare-fun b!145059 () Bool)

(assert (=> b!145059 (= e!94532 (+!176 call!16192 (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!27442 (ite c!27435 (minValue!2834 newMap!16) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2834 newMap!16)))))))

(declare-fun d!46173 () Bool)

(assert (=> d!46173 e!94539))

(declare-fun res!69077 () Bool)

(assert (=> d!46173 (=> (not res!69077) (not e!94539))))

(assert (=> d!46173 (= res!69077 (or (bvsge #b00000000000000000000000000000000 (size!2599 (_keys!4755 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2599 (_keys!4755 newMap!16))))))))

(declare-fun lt!76237 () ListLongMap!1699)

(assert (=> d!46173 (= lt!76245 lt!76237)))

(declare-fun lt!76243 () Unit!4574)

(declare-fun e!94536 () Unit!4574)

(assert (=> d!46173 (= lt!76243 e!94536)))

(declare-fun c!27475 () Bool)

(assert (=> d!46173 (= c!27475 e!94537)))

(declare-fun res!69076 () Bool)

(assert (=> d!46173 (=> (not res!69076) (not e!94537))))

(assert (=> d!46173 (= res!69076 (bvslt #b00000000000000000000000000000000 (size!2599 (_keys!4755 newMap!16))))))

(assert (=> d!46173 (= lt!76237 e!94532)))

(assert (=> d!46173 (= c!27476 (and (not (= (bvand (ite c!27442 (ite c!27435 lt!76152 lt!76136) (extraKeys!2735 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!27442 (ite c!27435 lt!76152 lt!76136) (extraKeys!2735 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!46173 (validMask!0 (mask!7352 newMap!16))))

(assert (=> d!46173 (= (getCurrentListMap!537 (_keys!4755 newMap!16) (ite c!27442 (_values!2971 newMap!16) lt!76132) (mask!7352 newMap!16) (ite c!27442 (ite c!27435 lt!76152 lt!76136) (extraKeys!2735 newMap!16)) (ite (and c!27442 c!27435) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2834 newMap!16)) (ite c!27442 (ite c!27435 (minValue!2834 newMap!16) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2834 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)) lt!76245)))

(declare-fun bm!16193 () Bool)

(assert (=> bm!16193 (= call!16193 call!16192)))

(declare-fun b!145067 () Bool)

(declare-fun res!69075 () Bool)

(assert (=> b!145067 (=> (not res!69075) (not e!94539))))

(declare-fun e!94528 () Bool)

(assert (=> b!145067 (= res!69075 e!94528)))

(declare-fun res!69074 () Bool)

(assert (=> b!145067 (=> res!69074 e!94528)))

(declare-fun e!94534 () Bool)

(assert (=> b!145067 (= res!69074 (not e!94534))))

(declare-fun res!69071 () Bool)

(assert (=> b!145067 (=> (not res!69071) (not e!94534))))

(assert (=> b!145067 (= res!69071 (bvslt #b00000000000000000000000000000000 (size!2599 (_keys!4755 newMap!16))))))

(declare-fun b!145068 () Bool)

(assert (=> b!145068 (= e!94535 (= (apply!123 lt!76245 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!27442 (ite c!27435 (minValue!2834 newMap!16) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2834 newMap!16))))))

(declare-fun b!145069 () Bool)

(declare-fun Unit!4585 () Unit!4574)

(assert (=> b!145069 (= e!94536 Unit!4585)))

(declare-fun b!145070 () Bool)

(assert (=> b!145070 (= e!94528 e!94538)))

(declare-fun res!69073 () Bool)

(assert (=> b!145070 (=> (not res!69073) (not e!94538))))

(assert (=> b!145070 (= res!69073 (contains!918 lt!76245 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!145070 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2599 (_keys!4755 newMap!16))))))

(declare-fun bm!16194 () Bool)

(assert (=> bm!16194 (= call!16194 (contains!918 lt!76245 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145071 () Bool)

(assert (=> b!145071 (= e!94531 e!94530)))

(declare-fun res!69072 () Bool)

(assert (=> b!145071 (= res!69072 call!16191)))

(assert (=> b!145071 (=> (not res!69072) (not e!94530))))

(declare-fun b!145072 () Bool)

(assert (=> b!145072 (= e!94533 call!16197)))

(declare-fun b!145073 () Bool)

(declare-fun lt!76234 () Unit!4574)

(assert (=> b!145073 (= e!94536 lt!76234)))

(declare-fun lt!76238 () ListLongMap!1699)

(assert (=> b!145073 (= lt!76238 (getCurrentListMapNoExtraKeys!143 (_keys!4755 newMap!16) (ite c!27442 (_values!2971 newMap!16) lt!76132) (mask!7352 newMap!16) (ite c!27442 (ite c!27435 lt!76152 lt!76136) (extraKeys!2735 newMap!16)) (ite (and c!27442 c!27435) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2834 newMap!16)) (ite c!27442 (ite c!27435 (minValue!2834 newMap!16) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2834 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76227 () (_ BitVec 64))

(assert (=> b!145073 (= lt!76227 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76240 () (_ BitVec 64))

(assert (=> b!145073 (= lt!76240 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76244 () Unit!4574)

(assert (=> b!145073 (= lt!76244 (addStillContains!99 lt!76238 lt!76227 (ite (and c!27442 c!27435) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2834 newMap!16)) lt!76240))))

(assert (=> b!145073 (contains!918 (+!176 lt!76238 (tuple2!2651 lt!76227 (ite (and c!27442 c!27435) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2834 newMap!16)))) lt!76240)))

(declare-fun lt!76247 () Unit!4574)

(assert (=> b!145073 (= lt!76247 lt!76244)))

(declare-fun lt!76230 () ListLongMap!1699)

(assert (=> b!145073 (= lt!76230 (getCurrentListMapNoExtraKeys!143 (_keys!4755 newMap!16) (ite c!27442 (_values!2971 newMap!16) lt!76132) (mask!7352 newMap!16) (ite c!27442 (ite c!27435 lt!76152 lt!76136) (extraKeys!2735 newMap!16)) (ite (and c!27442 c!27435) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2834 newMap!16)) (ite c!27442 (ite c!27435 (minValue!2834 newMap!16) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2834 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76231 () (_ BitVec 64))

(assert (=> b!145073 (= lt!76231 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76239 () (_ BitVec 64))

(assert (=> b!145073 (= lt!76239 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76248 () Unit!4574)

(assert (=> b!145073 (= lt!76248 (addApplyDifferent!99 lt!76230 lt!76231 (ite c!27442 (ite c!27435 (minValue!2834 newMap!16) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2834 newMap!16)) lt!76239))))

(assert (=> b!145073 (= (apply!123 (+!176 lt!76230 (tuple2!2651 lt!76231 (ite c!27442 (ite c!27435 (minValue!2834 newMap!16) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2834 newMap!16)))) lt!76239) (apply!123 lt!76230 lt!76239))))

(declare-fun lt!76232 () Unit!4574)

(assert (=> b!145073 (= lt!76232 lt!76248)))

(declare-fun lt!76241 () ListLongMap!1699)

(assert (=> b!145073 (= lt!76241 (getCurrentListMapNoExtraKeys!143 (_keys!4755 newMap!16) (ite c!27442 (_values!2971 newMap!16) lt!76132) (mask!7352 newMap!16) (ite c!27442 (ite c!27435 lt!76152 lt!76136) (extraKeys!2735 newMap!16)) (ite (and c!27442 c!27435) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2834 newMap!16)) (ite c!27442 (ite c!27435 (minValue!2834 newMap!16) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2834 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76246 () (_ BitVec 64))

(assert (=> b!145073 (= lt!76246 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76229 () (_ BitVec 64))

(assert (=> b!145073 (= lt!76229 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76236 () Unit!4574)

(assert (=> b!145073 (= lt!76236 (addApplyDifferent!99 lt!76241 lt!76246 (ite (and c!27442 c!27435) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2834 newMap!16)) lt!76229))))

(assert (=> b!145073 (= (apply!123 (+!176 lt!76241 (tuple2!2651 lt!76246 (ite (and c!27442 c!27435) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2834 newMap!16)))) lt!76229) (apply!123 lt!76241 lt!76229))))

(declare-fun lt!76242 () Unit!4574)

(assert (=> b!145073 (= lt!76242 lt!76236)))

(declare-fun lt!76228 () ListLongMap!1699)

(assert (=> b!145073 (= lt!76228 (getCurrentListMapNoExtraKeys!143 (_keys!4755 newMap!16) (ite c!27442 (_values!2971 newMap!16) lt!76132) (mask!7352 newMap!16) (ite c!27442 (ite c!27435 lt!76152 lt!76136) (extraKeys!2735 newMap!16)) (ite (and c!27442 c!27435) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2834 newMap!16)) (ite c!27442 (ite c!27435 (minValue!2834 newMap!16) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2834 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76233 () (_ BitVec 64))

(assert (=> b!145073 (= lt!76233 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76235 () (_ BitVec 64))

(assert (=> b!145073 (= lt!76235 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!145073 (= lt!76234 (addApplyDifferent!99 lt!76228 lt!76233 (ite c!27442 (ite c!27435 (minValue!2834 newMap!16) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2834 newMap!16)) lt!76235))))

(assert (=> b!145073 (= (apply!123 (+!176 lt!76228 (tuple2!2651 lt!76233 (ite c!27442 (ite c!27435 (minValue!2834 newMap!16) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2834 newMap!16)))) lt!76235) (apply!123 lt!76228 lt!76235))))

(declare-fun b!145074 () Bool)

(assert (=> b!145074 (= e!94540 (not call!16194))))

(declare-fun b!145075 () Bool)

(assert (=> b!145075 (= e!94534 (validKeyInArray!0 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!145076 () Bool)

(declare-fun res!69078 () Bool)

(assert (=> b!145076 (=> (not res!69078) (not e!94539))))

(assert (=> b!145076 (= res!69078 e!94531)))

(declare-fun c!27480 () Bool)

(assert (=> b!145076 (= c!27480 (not (= (bvand (ite c!27442 (ite c!27435 lt!76152 lt!76136) (extraKeys!2735 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!145077 () Bool)

(assert (=> b!145077 (= e!94529 call!16193)))

(assert (= (and d!46173 c!27476) b!145059))

(assert (= (and d!46173 (not c!27476)) b!145064))

(assert (= (and b!145064 c!27478) b!145077))

(assert (= (and b!145064 (not c!27478)) b!145057))

(assert (= (and b!145057 c!27477) b!145060))

(assert (= (and b!145057 (not c!27477)) b!145072))

(assert (= (or b!145060 b!145072) bm!16191))

(assert (= (or b!145077 bm!16191) bm!16188))

(assert (= (or b!145077 b!145060) bm!16193))

(assert (= (or b!145059 bm!16188) bm!16190))

(assert (= (or b!145059 bm!16193) bm!16192))

(assert (= (and d!46173 res!69076) b!145058))

(assert (= (and d!46173 c!27475) b!145073))

(assert (= (and d!46173 (not c!27475)) b!145069))

(assert (= (and d!46173 res!69077) b!145067))

(assert (= (and b!145067 res!69071) b!145075))

(assert (= (and b!145067 (not res!69074)) b!145070))

(assert (= (and b!145070 res!69073) b!145065))

(assert (= (and b!145067 res!69075) b!145076))

(assert (= (and b!145076 c!27480) b!145071))

(assert (= (and b!145076 (not c!27480)) b!145066))

(assert (= (and b!145071 res!69072) b!145063))

(assert (= (or b!145071 b!145066) bm!16189))

(assert (= (and b!145076 res!69078) b!145062))

(assert (= (and b!145062 c!27479) b!145061))

(assert (= (and b!145062 (not c!27479)) b!145074))

(assert (= (and b!145061 res!69079) b!145068))

(assert (= (or b!145061 b!145074) bm!16194))

(declare-fun b_lambda!6517 () Bool)

(assert (=> (not b_lambda!6517) (not b!145065)))

(assert (=> b!145065 t!6381))

(declare-fun b_and!9049 () Bool)

(assert (= b_and!9045 (and (=> t!6381 result!4267) b_and!9049)))

(assert (=> b!145065 t!6383))

(declare-fun b_and!9051 () Bool)

(assert (= b_and!9047 (and (=> t!6383 result!4269) b_and!9051)))

(assert (=> d!46173 m!174753))

(assert (=> b!145065 m!174779))

(assert (=> b!145065 m!174781))

(declare-fun m!174903 () Bool)

(assert (=> b!145065 m!174903))

(declare-fun m!174905 () Bool)

(assert (=> b!145065 m!174905))

(assert (=> b!145065 m!174779))

(declare-fun m!174907 () Bool)

(assert (=> b!145065 m!174907))

(assert (=> b!145065 m!174905))

(assert (=> b!145065 m!174781))

(declare-fun m!174909 () Bool)

(assert (=> b!145059 m!174909))

(assert (=> b!145075 m!174781))

(assert (=> b!145075 m!174781))

(assert (=> b!145075 m!174791))

(declare-fun m!174911 () Bool)

(assert (=> bm!16194 m!174911))

(declare-fun m!174913 () Bool)

(assert (=> bm!16190 m!174913))

(assert (=> b!145070 m!174781))

(assert (=> b!145070 m!174781))

(declare-fun m!174915 () Bool)

(assert (=> b!145070 m!174915))

(assert (=> b!145058 m!174781))

(assert (=> b!145058 m!174781))

(assert (=> b!145058 m!174791))

(declare-fun m!174917 () Bool)

(assert (=> b!145068 m!174917))

(declare-fun m!174919 () Bool)

(assert (=> bm!16192 m!174919))

(declare-fun m!174921 () Bool)

(assert (=> bm!16189 m!174921))

(declare-fun m!174923 () Bool)

(assert (=> b!145063 m!174923))

(declare-fun m!174925 () Bool)

(assert (=> b!145073 m!174925))

(declare-fun m!174927 () Bool)

(assert (=> b!145073 m!174927))

(declare-fun m!174929 () Bool)

(assert (=> b!145073 m!174929))

(declare-fun m!174931 () Bool)

(assert (=> b!145073 m!174931))

(declare-fun m!174933 () Bool)

(assert (=> b!145073 m!174933))

(declare-fun m!174935 () Bool)

(assert (=> b!145073 m!174935))

(declare-fun m!174937 () Bool)

(assert (=> b!145073 m!174937))

(declare-fun m!174939 () Bool)

(assert (=> b!145073 m!174939))

(declare-fun m!174941 () Bool)

(assert (=> b!145073 m!174941))

(assert (=> b!145073 m!174913))

(assert (=> b!145073 m!174925))

(declare-fun m!174943 () Bool)

(assert (=> b!145073 m!174943))

(assert (=> b!145073 m!174935))

(declare-fun m!174945 () Bool)

(assert (=> b!145073 m!174945))

(assert (=> b!145073 m!174931))

(declare-fun m!174947 () Bool)

(assert (=> b!145073 m!174947))

(declare-fun m!174949 () Bool)

(assert (=> b!145073 m!174949))

(declare-fun m!174951 () Bool)

(assert (=> b!145073 m!174951))

(declare-fun m!174953 () Bool)

(assert (=> b!145073 m!174953))

(assert (=> b!145073 m!174951))

(assert (=> b!145073 m!174781))

(assert (=> bm!16153 d!46173))

(declare-fun d!46175 () Bool)

(assert (=> d!46175 (= (validKeyInArray!0 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!144824 d!46175))

(declare-fun d!46177 () Bool)

(assert (=> d!46177 (= (inRange!0 (ite c!27441 (ite c!27438 (index!3271 lt!76127) (ite c!27443 (index!3270 lt!76139) (index!3273 lt!76139))) (ite c!27447 (index!3271 lt!76150) (ite c!27446 (index!3270 lt!76141) (index!3273 lt!76141)))) (mask!7352 newMap!16)) (and (bvsge (ite c!27441 (ite c!27438 (index!3271 lt!76127) (ite c!27443 (index!3270 lt!76139) (index!3273 lt!76139))) (ite c!27447 (index!3271 lt!76150) (ite c!27446 (index!3270 lt!76141) (index!3273 lt!76141)))) #b00000000000000000000000000000000) (bvslt (ite c!27441 (ite c!27438 (index!3271 lt!76127) (ite c!27443 (index!3270 lt!76139) (index!3273 lt!76139))) (ite c!27447 (index!3271 lt!76150) (ite c!27446 (index!3270 lt!76141) (index!3273 lt!76141)))) (bvadd (mask!7352 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!16169 d!46177))

(assert (=> b!144805 d!46175))

(declare-fun b!145094 () Bool)

(declare-fun res!69091 () Bool)

(declare-fun e!94549 () Bool)

(assert (=> b!145094 (=> (not res!69091) (not e!94549))))

(declare-fun call!16202 () Bool)

(assert (=> b!145094 (= res!69091 call!16202)))

(declare-fun e!94551 () Bool)

(assert (=> b!145094 (= e!94551 e!94549)))

(declare-fun b!145095 () Bool)

(declare-fun e!94552 () Bool)

(declare-fun call!16203 () Bool)

(assert (=> b!145095 (= e!94552 (not call!16203))))

(declare-fun b!145096 () Bool)

(assert (=> b!145096 (= e!94549 (not call!16203))))

(declare-fun b!145097 () Bool)

(declare-fun lt!76254 () SeekEntryResult!276)

(assert (=> b!145097 (and (bvsge (index!3270 lt!76254) #b00000000000000000000000000000000) (bvslt (index!3270 lt!76254) (size!2599 (_keys!4755 newMap!16))))))

(declare-fun res!69088 () Bool)

(assert (=> b!145097 (= res!69088 (= (select (arr!2324 (_keys!4755 newMap!16)) (index!3270 lt!76254)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!145097 (=> (not res!69088) (not e!94552))))

(declare-fun bm!16199 () Bool)

(declare-fun c!27485 () Bool)

(assert (=> bm!16199 (= call!16202 (inRange!0 (ite c!27485 (index!3270 lt!76254) (index!3273 lt!76254)) (mask!7352 newMap!16)))))

(declare-fun bm!16200 () Bool)

(assert (=> bm!16200 (= call!16203 (arrayContainsKey!0 (_keys!4755 newMap!16) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!145099 () Bool)

(declare-fun res!69090 () Bool)

(assert (=> b!145099 (=> (not res!69090) (not e!94549))))

(assert (=> b!145099 (= res!69090 (= (select (arr!2324 (_keys!4755 newMap!16)) (index!3273 lt!76254)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!145099 (and (bvsge (index!3273 lt!76254) #b00000000000000000000000000000000) (bvslt (index!3273 lt!76254) (size!2599 (_keys!4755 newMap!16))))))

(declare-fun b!145100 () Bool)

(declare-fun e!94550 () Bool)

(assert (=> b!145100 (= e!94550 e!94551)))

(declare-fun c!27486 () Bool)

(assert (=> b!145100 (= c!27486 ((_ is MissingVacant!276) lt!76254))))

(declare-fun b!145101 () Bool)

(assert (=> b!145101 (= e!94550 e!94552)))

(declare-fun res!69089 () Bool)

(assert (=> b!145101 (= res!69089 call!16202)))

(assert (=> b!145101 (=> (not res!69089) (not e!94552))))

(declare-fun b!145098 () Bool)

(assert (=> b!145098 (= e!94551 ((_ is Undefined!276) lt!76254))))

(declare-fun d!46179 () Bool)

(assert (=> d!46179 e!94550))

(assert (=> d!46179 (= c!27485 ((_ is MissingZero!276) lt!76254))))

(assert (=> d!46179 (= lt!76254 (seekEntryOrOpen!0 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (_keys!4755 newMap!16) (mask!7352 newMap!16)))))

(declare-fun lt!76253 () Unit!4574)

(declare-fun choose!899 (array!4921 array!4923 (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 (_ BitVec 64) Int) Unit!4574)

(assert (=> d!46179 (= lt!76253 (choose!899 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (defaultEntry!2988 newMap!16)))))

(assert (=> d!46179 (validMask!0 (mask!7352 newMap!16))))

(assert (=> d!46179 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!68 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (defaultEntry!2988 newMap!16)) lt!76253)))

(assert (= (and d!46179 c!27485) b!145101))

(assert (= (and d!46179 (not c!27485)) b!145100))

(assert (= (and b!145101 res!69089) b!145097))

(assert (= (and b!145097 res!69088) b!145095))

(assert (= (and b!145100 c!27486) b!145094))

(assert (= (and b!145100 (not c!27486)) b!145098))

(assert (= (and b!145094 res!69091) b!145099))

(assert (= (and b!145099 res!69090) b!145096))

(assert (= (or b!145101 b!145094) bm!16199))

(assert (= (or b!145095 b!145096) bm!16200))

(declare-fun m!174955 () Bool)

(assert (=> b!145097 m!174955))

(declare-fun m!174957 () Bool)

(assert (=> bm!16199 m!174957))

(declare-fun m!174959 () Bool)

(assert (=> b!145099 m!174959))

(assert (=> d!46179 m!174417))

(assert (=> d!46179 m!174673))

(assert (=> d!46179 m!174417))

(declare-fun m!174961 () Bool)

(assert (=> d!46179 m!174961))

(assert (=> d!46179 m!174753))

(assert (=> bm!16200 m!174417))

(assert (=> bm!16200 m!174721))

(assert (=> bm!16161 d!46179))

(declare-fun d!46181 () Bool)

(declare-fun res!69096 () Bool)

(declare-fun e!94557 () Bool)

(assert (=> d!46181 (=> res!69096 e!94557)))

(assert (=> d!46181 (= res!69096 (and ((_ is Cons!1732) (toList!865 lt!75946)) (= (_1!1336 (h!2340 (toList!865 lt!75946))) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355))))))

(assert (=> d!46181 (= (containsKey!183 (toList!865 lt!75946) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)) e!94557)))

(declare-fun b!145106 () Bool)

(declare-fun e!94558 () Bool)

(assert (=> b!145106 (= e!94557 e!94558)))

(declare-fun res!69097 () Bool)

(assert (=> b!145106 (=> (not res!69097) (not e!94558))))

(assert (=> b!145106 (= res!69097 (and (or (not ((_ is Cons!1732) (toList!865 lt!75946))) (bvsle (_1!1336 (h!2340 (toList!865 lt!75946))) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355))) ((_ is Cons!1732) (toList!865 lt!75946)) (bvslt (_1!1336 (h!2340 (toList!865 lt!75946))) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355))))))

(declare-fun b!145107 () Bool)

(assert (=> b!145107 (= e!94558 (containsKey!183 (t!6369 (toList!865 lt!75946)) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (= (and d!46181 (not res!69096)) b!145106))

(assert (= (and b!145106 res!69097) b!145107))

(assert (=> b!145107 m!174417))

(declare-fun m!174963 () Bool)

(assert (=> b!145107 m!174963))

(assert (=> d!46147 d!46181))

(declare-fun d!46183 () Bool)

(declare-fun e!94559 () Bool)

(assert (=> d!46183 e!94559))

(declare-fun res!69098 () Bool)

(assert (=> d!46183 (=> res!69098 e!94559)))

(declare-fun lt!76258 () Bool)

(assert (=> d!46183 (= res!69098 (not lt!76258))))

(declare-fun lt!76256 () Bool)

(assert (=> d!46183 (= lt!76258 lt!76256)))

(declare-fun lt!76255 () Unit!4574)

(declare-fun e!94560 () Unit!4574)

(assert (=> d!46183 (= lt!76255 e!94560)))

(declare-fun c!27487 () Bool)

(assert (=> d!46183 (= c!27487 lt!76256)))

(assert (=> d!46183 (= lt!76256 (containsKey!183 (toList!865 call!16163) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (=> d!46183 (= (contains!918 call!16163 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)) lt!76258)))

(declare-fun b!145108 () Bool)

(declare-fun lt!76257 () Unit!4574)

(assert (=> b!145108 (= e!94560 lt!76257)))

(assert (=> b!145108 (= lt!76257 (lemmaContainsKeyImpliesGetValueByKeyDefined!131 (toList!865 call!16163) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (=> b!145108 (isDefined!132 (getValueByKey!180 (toList!865 call!16163) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun b!145109 () Bool)

(declare-fun Unit!4586 () Unit!4574)

(assert (=> b!145109 (= e!94560 Unit!4586)))

(declare-fun b!145110 () Bool)

(assert (=> b!145110 (= e!94559 (isDefined!132 (getValueByKey!180 (toList!865 call!16163) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355))))))

(assert (= (and d!46183 c!27487) b!145108))

(assert (= (and d!46183 (not c!27487)) b!145109))

(assert (= (and d!46183 (not res!69098)) b!145110))

(assert (=> d!46183 m!174417))

(declare-fun m!174965 () Bool)

(assert (=> d!46183 m!174965))

(assert (=> b!145108 m!174417))

(declare-fun m!174967 () Bool)

(assert (=> b!145108 m!174967))

(assert (=> b!145108 m!174417))

(declare-fun m!174969 () Bool)

(assert (=> b!145108 m!174969))

(assert (=> b!145108 m!174969))

(declare-fun m!174971 () Bool)

(assert (=> b!145108 m!174971))

(assert (=> b!145110 m!174417))

(assert (=> b!145110 m!174969))

(assert (=> b!145110 m!174969))

(assert (=> b!145110 m!174971))

(assert (=> b!144921 d!46183))

(assert (=> b!144788 d!46175))

(declare-fun d!46185 () Bool)

(declare-fun res!69099 () Bool)

(declare-fun e!94561 () Bool)

(assert (=> d!46185 (=> res!69099 e!94561)))

(assert (=> d!46185 (= res!69099 ((_ is Nil!1732) (t!6368 lt!75945)))))

(assert (=> d!46185 (= (noDuplicate!54 (t!6368 lt!75945)) e!94561)))

(declare-fun b!145111 () Bool)

(declare-fun e!94562 () Bool)

(assert (=> b!145111 (= e!94561 e!94562)))

(declare-fun res!69100 () Bool)

(assert (=> b!145111 (=> (not res!69100) (not e!94562))))

(assert (=> b!145111 (= res!69100 (not (contains!917 (t!6368 (t!6368 lt!75945)) (h!2339 (t!6368 lt!75945)))))))

(declare-fun b!145112 () Bool)

(assert (=> b!145112 (= e!94562 (noDuplicate!54 (t!6368 (t!6368 lt!75945))))))

(assert (= (and d!46185 (not res!69099)) b!145111))

(assert (= (and b!145111 res!69100) b!145112))

(declare-fun m!174973 () Bool)

(assert (=> b!145111 m!174973))

(declare-fun m!174975 () Bool)

(assert (=> b!145112 m!174975))

(assert (=> b!144819 d!46185))

(declare-fun d!46187 () Bool)

(declare-fun get!1556 (Option!186) V!3577)

(assert (=> d!46187 (= (apply!123 lt!76036 lt!76043) (get!1556 (getValueByKey!180 (toList!865 lt!76036) lt!76043)))))

(declare-fun bs!6115 () Bool)

(assert (= bs!6115 d!46187))

(declare-fun m!174977 () Bool)

(assert (=> bs!6115 m!174977))

(assert (=> bs!6115 m!174977))

(declare-fun m!174979 () Bool)

(assert (=> bs!6115 m!174979))

(assert (=> b!144803 d!46187))

(declare-fun d!46189 () Bool)

(declare-fun e!94565 () Bool)

(assert (=> d!46189 e!94565))

(declare-fun res!69105 () Bool)

(assert (=> d!46189 (=> (not res!69105) (not e!94565))))

(declare-fun lt!76270 () ListLongMap!1699)

(assert (=> d!46189 (= res!69105 (contains!918 lt!76270 (_1!1336 (tuple2!2651 lt!76041 (minValue!2834 (v!3320 (underlying!488 thiss!992)))))))))

(declare-fun lt!76268 () List!1736)

(assert (=> d!46189 (= lt!76270 (ListLongMap!1700 lt!76268))))

(declare-fun lt!76269 () Unit!4574)

(declare-fun lt!76267 () Unit!4574)

(assert (=> d!46189 (= lt!76269 lt!76267)))

(assert (=> d!46189 (= (getValueByKey!180 lt!76268 (_1!1336 (tuple2!2651 lt!76041 (minValue!2834 (v!3320 (underlying!488 thiss!992)))))) (Some!185 (_2!1336 (tuple2!2651 lt!76041 (minValue!2834 (v!3320 (underlying!488 thiss!992)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!94 (List!1736 (_ BitVec 64) V!3577) Unit!4574)

(assert (=> d!46189 (= lt!76267 (lemmaContainsTupThenGetReturnValue!94 lt!76268 (_1!1336 (tuple2!2651 lt!76041 (minValue!2834 (v!3320 (underlying!488 thiss!992))))) (_2!1336 (tuple2!2651 lt!76041 (minValue!2834 (v!3320 (underlying!488 thiss!992)))))))))

(declare-fun insertStrictlySorted!97 (List!1736 (_ BitVec 64) V!3577) List!1736)

(assert (=> d!46189 (= lt!76268 (insertStrictlySorted!97 (toList!865 lt!76036) (_1!1336 (tuple2!2651 lt!76041 (minValue!2834 (v!3320 (underlying!488 thiss!992))))) (_2!1336 (tuple2!2651 lt!76041 (minValue!2834 (v!3320 (underlying!488 thiss!992)))))))))

(assert (=> d!46189 (= (+!176 lt!76036 (tuple2!2651 lt!76041 (minValue!2834 (v!3320 (underlying!488 thiss!992))))) lt!76270)))

(declare-fun b!145117 () Bool)

(declare-fun res!69106 () Bool)

(assert (=> b!145117 (=> (not res!69106) (not e!94565))))

(assert (=> b!145117 (= res!69106 (= (getValueByKey!180 (toList!865 lt!76270) (_1!1336 (tuple2!2651 lt!76041 (minValue!2834 (v!3320 (underlying!488 thiss!992)))))) (Some!185 (_2!1336 (tuple2!2651 lt!76041 (minValue!2834 (v!3320 (underlying!488 thiss!992))))))))))

(declare-fun b!145118 () Bool)

(declare-fun contains!921 (List!1736 tuple2!2650) Bool)

(assert (=> b!145118 (= e!94565 (contains!921 (toList!865 lt!76270) (tuple2!2651 lt!76041 (minValue!2834 (v!3320 (underlying!488 thiss!992))))))))

(assert (= (and d!46189 res!69105) b!145117))

(assert (= (and b!145117 res!69106) b!145118))

(declare-fun m!174981 () Bool)

(assert (=> d!46189 m!174981))

(declare-fun m!174983 () Bool)

(assert (=> d!46189 m!174983))

(declare-fun m!174985 () Bool)

(assert (=> d!46189 m!174985))

(declare-fun m!174987 () Bool)

(assert (=> d!46189 m!174987))

(declare-fun m!174989 () Bool)

(assert (=> b!145117 m!174989))

(declare-fun m!174991 () Bool)

(assert (=> b!145118 m!174991))

(assert (=> b!144803 d!46189))

(declare-fun d!46191 () Bool)

(declare-fun e!94566 () Bool)

(assert (=> d!46191 e!94566))

(declare-fun res!69107 () Bool)

(assert (=> d!46191 (=> (not res!69107) (not e!94566))))

(declare-fun lt!76274 () ListLongMap!1699)

(assert (=> d!46191 (= res!69107 (contains!918 lt!76274 (_1!1336 (tuple2!2651 lt!76035 (zeroValue!2834 (v!3320 (underlying!488 thiss!992)))))))))

(declare-fun lt!76272 () List!1736)

(assert (=> d!46191 (= lt!76274 (ListLongMap!1700 lt!76272))))

(declare-fun lt!76273 () Unit!4574)

(declare-fun lt!76271 () Unit!4574)

(assert (=> d!46191 (= lt!76273 lt!76271)))

(assert (=> d!46191 (= (getValueByKey!180 lt!76272 (_1!1336 (tuple2!2651 lt!76035 (zeroValue!2834 (v!3320 (underlying!488 thiss!992)))))) (Some!185 (_2!1336 (tuple2!2651 lt!76035 (zeroValue!2834 (v!3320 (underlying!488 thiss!992)))))))))

(assert (=> d!46191 (= lt!76271 (lemmaContainsTupThenGetReturnValue!94 lt!76272 (_1!1336 (tuple2!2651 lt!76035 (zeroValue!2834 (v!3320 (underlying!488 thiss!992))))) (_2!1336 (tuple2!2651 lt!76035 (zeroValue!2834 (v!3320 (underlying!488 thiss!992)))))))))

(assert (=> d!46191 (= lt!76272 (insertStrictlySorted!97 (toList!865 lt!76046) (_1!1336 (tuple2!2651 lt!76035 (zeroValue!2834 (v!3320 (underlying!488 thiss!992))))) (_2!1336 (tuple2!2651 lt!76035 (zeroValue!2834 (v!3320 (underlying!488 thiss!992)))))))))

(assert (=> d!46191 (= (+!176 lt!76046 (tuple2!2651 lt!76035 (zeroValue!2834 (v!3320 (underlying!488 thiss!992))))) lt!76274)))

(declare-fun b!145119 () Bool)

(declare-fun res!69108 () Bool)

(assert (=> b!145119 (=> (not res!69108) (not e!94566))))

(assert (=> b!145119 (= res!69108 (= (getValueByKey!180 (toList!865 lt!76274) (_1!1336 (tuple2!2651 lt!76035 (zeroValue!2834 (v!3320 (underlying!488 thiss!992)))))) (Some!185 (_2!1336 (tuple2!2651 lt!76035 (zeroValue!2834 (v!3320 (underlying!488 thiss!992))))))))))

(declare-fun b!145120 () Bool)

(assert (=> b!145120 (= e!94566 (contains!921 (toList!865 lt!76274) (tuple2!2651 lt!76035 (zeroValue!2834 (v!3320 (underlying!488 thiss!992))))))))

(assert (= (and d!46191 res!69107) b!145119))

(assert (= (and b!145119 res!69108) b!145120))

(declare-fun m!174993 () Bool)

(assert (=> d!46191 m!174993))

(declare-fun m!174995 () Bool)

(assert (=> d!46191 m!174995))

(declare-fun m!174997 () Bool)

(assert (=> d!46191 m!174997))

(declare-fun m!174999 () Bool)

(assert (=> d!46191 m!174999))

(declare-fun m!175001 () Bool)

(assert (=> b!145119 m!175001))

(declare-fun m!175003 () Bool)

(assert (=> b!145120 m!175003))

(assert (=> b!144803 d!46191))

(declare-fun d!46193 () Bool)

(assert (=> d!46193 (= (apply!123 (+!176 lt!76036 (tuple2!2651 lt!76041 (minValue!2834 (v!3320 (underlying!488 thiss!992))))) lt!76043) (apply!123 lt!76036 lt!76043))))

(declare-fun lt!76277 () Unit!4574)

(declare-fun choose!900 (ListLongMap!1699 (_ BitVec 64) V!3577 (_ BitVec 64)) Unit!4574)

(assert (=> d!46193 (= lt!76277 (choose!900 lt!76036 lt!76041 (minValue!2834 (v!3320 (underlying!488 thiss!992))) lt!76043))))

(declare-fun e!94569 () Bool)

(assert (=> d!46193 e!94569))

(declare-fun res!69111 () Bool)

(assert (=> d!46193 (=> (not res!69111) (not e!94569))))

(assert (=> d!46193 (= res!69111 (contains!918 lt!76036 lt!76043))))

(assert (=> d!46193 (= (addApplyDifferent!99 lt!76036 lt!76041 (minValue!2834 (v!3320 (underlying!488 thiss!992))) lt!76043) lt!76277)))

(declare-fun b!145124 () Bool)

(assert (=> b!145124 (= e!94569 (not (= lt!76043 lt!76041)))))

(assert (= (and d!46193 res!69111) b!145124))

(assert (=> d!46193 m!174623))

(declare-fun m!175005 () Bool)

(assert (=> d!46193 m!175005))

(declare-fun m!175007 () Bool)

(assert (=> d!46193 m!175007))

(assert (=> d!46193 m!174615))

(assert (=> d!46193 m!174615))

(assert (=> d!46193 m!174631))

(assert (=> b!144803 d!46193))

(declare-fun d!46195 () Bool)

(assert (=> d!46195 (= (apply!123 lt!76038 lt!76047) (get!1556 (getValueByKey!180 (toList!865 lt!76038) lt!76047)))))

(declare-fun bs!6116 () Bool)

(assert (= bs!6116 d!46195))

(declare-fun m!175009 () Bool)

(assert (=> bs!6116 m!175009))

(assert (=> bs!6116 m!175009))

(declare-fun m!175011 () Bool)

(assert (=> bs!6116 m!175011))

(assert (=> b!144803 d!46195))

(declare-fun d!46197 () Bool)

(assert (=> d!46197 (= (apply!123 (+!176 lt!76038 (tuple2!2651 lt!76039 (minValue!2834 (v!3320 (underlying!488 thiss!992))))) lt!76047) (apply!123 lt!76038 lt!76047))))

(declare-fun lt!76278 () Unit!4574)

(assert (=> d!46197 (= lt!76278 (choose!900 lt!76038 lt!76039 (minValue!2834 (v!3320 (underlying!488 thiss!992))) lt!76047))))

(declare-fun e!94570 () Bool)

(assert (=> d!46197 e!94570))

(declare-fun res!69112 () Bool)

(assert (=> d!46197 (=> (not res!69112) (not e!94570))))

(assert (=> d!46197 (= res!69112 (contains!918 lt!76038 lt!76047))))

(assert (=> d!46197 (= (addApplyDifferent!99 lt!76038 lt!76039 (minValue!2834 (v!3320 (underlying!488 thiss!992))) lt!76047) lt!76278)))

(declare-fun b!145125 () Bool)

(assert (=> b!145125 (= e!94570 (not (= lt!76047 lt!76039)))))

(assert (= (and d!46197 res!69112) b!145125))

(assert (=> d!46197 m!174625))

(declare-fun m!175013 () Bool)

(assert (=> d!46197 m!175013))

(declare-fun m!175015 () Bool)

(assert (=> d!46197 m!175015))

(assert (=> d!46197 m!174635))

(assert (=> d!46197 m!174635))

(assert (=> d!46197 m!174637))

(assert (=> b!144803 d!46197))

(declare-fun d!46199 () Bool)

(declare-fun e!94571 () Bool)

(assert (=> d!46199 e!94571))

(declare-fun res!69113 () Bool)

(assert (=> d!46199 (=> (not res!69113) (not e!94571))))

(declare-fun lt!76282 () ListLongMap!1699)

(assert (=> d!46199 (= res!69113 (contains!918 lt!76282 (_1!1336 (tuple2!2651 lt!76054 (zeroValue!2834 (v!3320 (underlying!488 thiss!992)))))))))

(declare-fun lt!76280 () List!1736)

(assert (=> d!46199 (= lt!76282 (ListLongMap!1700 lt!76280))))

(declare-fun lt!76281 () Unit!4574)

(declare-fun lt!76279 () Unit!4574)

(assert (=> d!46199 (= lt!76281 lt!76279)))

(assert (=> d!46199 (= (getValueByKey!180 lt!76280 (_1!1336 (tuple2!2651 lt!76054 (zeroValue!2834 (v!3320 (underlying!488 thiss!992)))))) (Some!185 (_2!1336 (tuple2!2651 lt!76054 (zeroValue!2834 (v!3320 (underlying!488 thiss!992)))))))))

(assert (=> d!46199 (= lt!76279 (lemmaContainsTupThenGetReturnValue!94 lt!76280 (_1!1336 (tuple2!2651 lt!76054 (zeroValue!2834 (v!3320 (underlying!488 thiss!992))))) (_2!1336 (tuple2!2651 lt!76054 (zeroValue!2834 (v!3320 (underlying!488 thiss!992)))))))))

(assert (=> d!46199 (= lt!76280 (insertStrictlySorted!97 (toList!865 lt!76049) (_1!1336 (tuple2!2651 lt!76054 (zeroValue!2834 (v!3320 (underlying!488 thiss!992))))) (_2!1336 (tuple2!2651 lt!76054 (zeroValue!2834 (v!3320 (underlying!488 thiss!992)))))))))

(assert (=> d!46199 (= (+!176 lt!76049 (tuple2!2651 lt!76054 (zeroValue!2834 (v!3320 (underlying!488 thiss!992))))) lt!76282)))

(declare-fun b!145126 () Bool)

(declare-fun res!69114 () Bool)

(assert (=> b!145126 (=> (not res!69114) (not e!94571))))

(assert (=> b!145126 (= res!69114 (= (getValueByKey!180 (toList!865 lt!76282) (_1!1336 (tuple2!2651 lt!76054 (zeroValue!2834 (v!3320 (underlying!488 thiss!992)))))) (Some!185 (_2!1336 (tuple2!2651 lt!76054 (zeroValue!2834 (v!3320 (underlying!488 thiss!992))))))))))

(declare-fun b!145127 () Bool)

(assert (=> b!145127 (= e!94571 (contains!921 (toList!865 lt!76282) (tuple2!2651 lt!76054 (zeroValue!2834 (v!3320 (underlying!488 thiss!992))))))))

(assert (= (and d!46199 res!69113) b!145126))

(assert (= (and b!145126 res!69114) b!145127))

(declare-fun m!175017 () Bool)

(assert (=> d!46199 m!175017))

(declare-fun m!175019 () Bool)

(assert (=> d!46199 m!175019))

(declare-fun m!175021 () Bool)

(assert (=> d!46199 m!175021))

(declare-fun m!175023 () Bool)

(assert (=> d!46199 m!175023))

(declare-fun m!175025 () Bool)

(assert (=> b!145126 m!175025))

(declare-fun m!175027 () Bool)

(assert (=> b!145127 m!175027))

(assert (=> b!144803 d!46199))

(declare-fun d!46201 () Bool)

(declare-fun e!94572 () Bool)

(assert (=> d!46201 e!94572))

(declare-fun res!69115 () Bool)

(assert (=> d!46201 (=> (not res!69115) (not e!94572))))

(declare-fun lt!76286 () ListLongMap!1699)

(assert (=> d!46201 (= res!69115 (contains!918 lt!76286 (_1!1336 (tuple2!2651 lt!76039 (minValue!2834 (v!3320 (underlying!488 thiss!992)))))))))

(declare-fun lt!76284 () List!1736)

(assert (=> d!46201 (= lt!76286 (ListLongMap!1700 lt!76284))))

(declare-fun lt!76285 () Unit!4574)

(declare-fun lt!76283 () Unit!4574)

(assert (=> d!46201 (= lt!76285 lt!76283)))

(assert (=> d!46201 (= (getValueByKey!180 lt!76284 (_1!1336 (tuple2!2651 lt!76039 (minValue!2834 (v!3320 (underlying!488 thiss!992)))))) (Some!185 (_2!1336 (tuple2!2651 lt!76039 (minValue!2834 (v!3320 (underlying!488 thiss!992)))))))))

(assert (=> d!46201 (= lt!76283 (lemmaContainsTupThenGetReturnValue!94 lt!76284 (_1!1336 (tuple2!2651 lt!76039 (minValue!2834 (v!3320 (underlying!488 thiss!992))))) (_2!1336 (tuple2!2651 lt!76039 (minValue!2834 (v!3320 (underlying!488 thiss!992)))))))))

(assert (=> d!46201 (= lt!76284 (insertStrictlySorted!97 (toList!865 lt!76038) (_1!1336 (tuple2!2651 lt!76039 (minValue!2834 (v!3320 (underlying!488 thiss!992))))) (_2!1336 (tuple2!2651 lt!76039 (minValue!2834 (v!3320 (underlying!488 thiss!992)))))))))

(assert (=> d!46201 (= (+!176 lt!76038 (tuple2!2651 lt!76039 (minValue!2834 (v!3320 (underlying!488 thiss!992))))) lt!76286)))

(declare-fun b!145128 () Bool)

(declare-fun res!69116 () Bool)

(assert (=> b!145128 (=> (not res!69116) (not e!94572))))

(assert (=> b!145128 (= res!69116 (= (getValueByKey!180 (toList!865 lt!76286) (_1!1336 (tuple2!2651 lt!76039 (minValue!2834 (v!3320 (underlying!488 thiss!992)))))) (Some!185 (_2!1336 (tuple2!2651 lt!76039 (minValue!2834 (v!3320 (underlying!488 thiss!992))))))))))

(declare-fun b!145129 () Bool)

(assert (=> b!145129 (= e!94572 (contains!921 (toList!865 lt!76286) (tuple2!2651 lt!76039 (minValue!2834 (v!3320 (underlying!488 thiss!992))))))))

(assert (= (and d!46201 res!69115) b!145128))

(assert (= (and b!145128 res!69116) b!145129))

(declare-fun m!175029 () Bool)

(assert (=> d!46201 m!175029))

(declare-fun m!175031 () Bool)

(assert (=> d!46201 m!175031))

(declare-fun m!175033 () Bool)

(assert (=> d!46201 m!175033))

(declare-fun m!175035 () Bool)

(assert (=> d!46201 m!175035))

(declare-fun m!175037 () Bool)

(assert (=> b!145128 m!175037))

(declare-fun m!175039 () Bool)

(assert (=> b!145129 m!175039))

(assert (=> b!144803 d!46201))

(declare-fun d!46203 () Bool)

(assert (=> d!46203 (= (apply!123 (+!176 lt!76049 (tuple2!2651 lt!76054 (zeroValue!2834 (v!3320 (underlying!488 thiss!992))))) lt!76037) (get!1556 (getValueByKey!180 (toList!865 (+!176 lt!76049 (tuple2!2651 lt!76054 (zeroValue!2834 (v!3320 (underlying!488 thiss!992)))))) lt!76037)))))

(declare-fun bs!6117 () Bool)

(assert (= bs!6117 d!46203))

(declare-fun m!175041 () Bool)

(assert (=> bs!6117 m!175041))

(assert (=> bs!6117 m!175041))

(declare-fun m!175043 () Bool)

(assert (=> bs!6117 m!175043))

(assert (=> b!144803 d!46203))

(declare-fun b!145154 () Bool)

(declare-fun res!69128 () Bool)

(declare-fun e!94590 () Bool)

(assert (=> b!145154 (=> (not res!69128) (not e!94590))))

(declare-fun lt!76303 () ListLongMap!1699)

(assert (=> b!145154 (= res!69128 (not (contains!918 lt!76303 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!145155 () Bool)

(declare-fun e!94591 () Bool)

(declare-fun e!94587 () Bool)

(assert (=> b!145155 (= e!94591 e!94587)))

(assert (=> b!145155 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2599 (_keys!4755 (v!3320 (underlying!488 thiss!992))))))))

(declare-fun res!69125 () Bool)

(assert (=> b!145155 (= res!69125 (contains!918 lt!76303 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!145155 (=> (not res!69125) (not e!94587))))

(declare-fun b!145156 () Bool)

(assert (=> b!145156 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2599 (_keys!4755 (v!3320 (underlying!488 thiss!992))))))))

(assert (=> b!145156 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2600 (_values!2971 (v!3320 (underlying!488 thiss!992))))))))

(assert (=> b!145156 (= e!94587 (= (apply!123 lt!76303 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!145157 () Bool)

(declare-fun e!94592 () Bool)

(declare-fun isEmpty!430 (ListLongMap!1699) Bool)

(assert (=> b!145157 (= e!94592 (isEmpty!430 lt!76303))))

(declare-fun bm!16203 () Bool)

(declare-fun call!16206 () ListLongMap!1699)

(assert (=> bm!16203 (= call!16206 (getCurrentListMapNoExtraKeys!143 (_keys!4755 (v!3320 (underlying!488 thiss!992))) (_values!2971 (v!3320 (underlying!488 thiss!992))) (mask!7352 (v!3320 (underlying!488 thiss!992))) (extraKeys!2735 (v!3320 (underlying!488 thiss!992))) (zeroValue!2834 (v!3320 (underlying!488 thiss!992))) (minValue!2834 (v!3320 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2988 (v!3320 (underlying!488 thiss!992)))))))

(declare-fun b!145158 () Bool)

(declare-fun e!94593 () ListLongMap!1699)

(assert (=> b!145158 (= e!94593 call!16206)))

(declare-fun b!145159 () Bool)

(assert (=> b!145159 (= e!94592 (= lt!76303 (getCurrentListMapNoExtraKeys!143 (_keys!4755 (v!3320 (underlying!488 thiss!992))) (_values!2971 (v!3320 (underlying!488 thiss!992))) (mask!7352 (v!3320 (underlying!488 thiss!992))) (extraKeys!2735 (v!3320 (underlying!488 thiss!992))) (zeroValue!2834 (v!3320 (underlying!488 thiss!992))) (minValue!2834 (v!3320 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))))))))

(declare-fun b!145160 () Bool)

(assert (=> b!145160 (= e!94591 e!94592)))

(declare-fun c!27498 () Bool)

(assert (=> b!145160 (= c!27498 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2599 (_keys!4755 (v!3320 (underlying!488 thiss!992))))))))

(declare-fun b!145161 () Bool)

(declare-fun lt!76305 () Unit!4574)

(declare-fun lt!76302 () Unit!4574)

(assert (=> b!145161 (= lt!76305 lt!76302)))

(declare-fun lt!76306 () (_ BitVec 64))

(declare-fun lt!76301 () (_ BitVec 64))

(declare-fun lt!76304 () V!3577)

(declare-fun lt!76307 () ListLongMap!1699)

(assert (=> b!145161 (not (contains!918 (+!176 lt!76307 (tuple2!2651 lt!76301 lt!76304)) lt!76306))))

(declare-fun addStillNotContains!69 (ListLongMap!1699 (_ BitVec 64) V!3577 (_ BitVec 64)) Unit!4574)

(assert (=> b!145161 (= lt!76302 (addStillNotContains!69 lt!76307 lt!76301 lt!76304 lt!76306))))

(assert (=> b!145161 (= lt!76306 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!145161 (= lt!76304 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!145161 (= lt!76301 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!145161 (= lt!76307 call!16206)))

(assert (=> b!145161 (= e!94593 (+!176 call!16206 (tuple2!2651 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!145163 () Bool)

(declare-fun e!94589 () ListLongMap!1699)

(assert (=> b!145163 (= e!94589 (ListLongMap!1700 Nil!1733))))

(declare-fun b!145164 () Bool)

(declare-fun e!94588 () Bool)

(assert (=> b!145164 (= e!94588 (validKeyInArray!0 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!145164 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!145165 () Bool)

(assert (=> b!145165 (= e!94589 e!94593)))

(declare-fun c!27496 () Bool)

(assert (=> b!145165 (= c!27496 (validKeyInArray!0 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!145162 () Bool)

(assert (=> b!145162 (= e!94590 e!94591)))

(declare-fun c!27499 () Bool)

(assert (=> b!145162 (= c!27499 e!94588)))

(declare-fun res!69127 () Bool)

(assert (=> b!145162 (=> (not res!69127) (not e!94588))))

(assert (=> b!145162 (= res!69127 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2599 (_keys!4755 (v!3320 (underlying!488 thiss!992))))))))

(declare-fun d!46205 () Bool)

(assert (=> d!46205 e!94590))

(declare-fun res!69126 () Bool)

(assert (=> d!46205 (=> (not res!69126) (not e!94590))))

(assert (=> d!46205 (= res!69126 (not (contains!918 lt!76303 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46205 (= lt!76303 e!94589)))

(declare-fun c!27497 () Bool)

(assert (=> d!46205 (= c!27497 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2599 (_keys!4755 (v!3320 (underlying!488 thiss!992))))))))

(assert (=> d!46205 (validMask!0 (mask!7352 (v!3320 (underlying!488 thiss!992))))))

(assert (=> d!46205 (= (getCurrentListMapNoExtraKeys!143 (_keys!4755 (v!3320 (underlying!488 thiss!992))) (_values!2971 (v!3320 (underlying!488 thiss!992))) (mask!7352 (v!3320 (underlying!488 thiss!992))) (extraKeys!2735 (v!3320 (underlying!488 thiss!992))) (zeroValue!2834 (v!3320 (underlying!488 thiss!992))) (minValue!2834 (v!3320 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2988 (v!3320 (underlying!488 thiss!992)))) lt!76303)))

(assert (= (and d!46205 c!27497) b!145163))

(assert (= (and d!46205 (not c!27497)) b!145165))

(assert (= (and b!145165 c!27496) b!145161))

(assert (= (and b!145165 (not c!27496)) b!145158))

(assert (= (or b!145161 b!145158) bm!16203))

(assert (= (and d!46205 res!69126) b!145154))

(assert (= (and b!145154 res!69128) b!145162))

(assert (= (and b!145162 res!69127) b!145164))

(assert (= (and b!145162 c!27499) b!145155))

(assert (= (and b!145162 (not c!27499)) b!145160))

(assert (= (and b!145155 res!69125) b!145156))

(assert (= (and b!145160 c!27498) b!145159))

(assert (= (and b!145160 (not c!27498)) b!145157))

(declare-fun b_lambda!6519 () Bool)

(assert (=> (not b_lambda!6519) (not b!145156)))

(assert (=> b!145156 t!6365))

(declare-fun b_and!9053 () Bool)

(assert (= b_and!9049 (and (=> t!6365 result!4247) b_and!9053)))

(assert (=> b!145156 t!6367))

(declare-fun b_and!9055 () Bool)

(assert (= b_and!9051 (and (=> t!6367 result!4251) b_and!9055)))

(declare-fun b_lambda!6521 () Bool)

(assert (=> (not b_lambda!6521) (not b!145161)))

(assert (=> b!145161 t!6365))

(declare-fun b_and!9057 () Bool)

(assert (= b_and!9053 (and (=> t!6365 result!4247) b_and!9057)))

(assert (=> b!145161 t!6367))

(declare-fun b_and!9059 () Bool)

(assert (= b_and!9055 (and (=> t!6367 result!4251) b_and!9059)))

(assert (=> b!145156 m!174451))

(assert (=> b!145156 m!174587))

(assert (=> b!145156 m!174451))

(assert (=> b!145156 m!174589))

(assert (=> b!145156 m!174587))

(assert (=> b!145156 m!174575))

(declare-fun m!175045 () Bool)

(assert (=> b!145156 m!175045))

(assert (=> b!145156 m!174575))

(assert (=> b!145164 m!174575))

(assert (=> b!145164 m!174575))

(assert (=> b!145164 m!174593))

(assert (=> b!145161 m!174451))

(declare-fun m!175047 () Bool)

(assert (=> b!145161 m!175047))

(declare-fun m!175049 () Bool)

(assert (=> b!145161 m!175049))

(assert (=> b!145161 m!174587))

(assert (=> b!145161 m!174451))

(assert (=> b!145161 m!174589))

(declare-fun m!175051 () Bool)

(assert (=> b!145161 m!175051))

(assert (=> b!145161 m!174587))

(declare-fun m!175053 () Bool)

(assert (=> b!145161 m!175053))

(assert (=> b!145161 m!175047))

(assert (=> b!145161 m!174575))

(assert (=> b!145165 m!174575))

(assert (=> b!145165 m!174575))

(assert (=> b!145165 m!174593))

(declare-fun m!175055 () Bool)

(assert (=> d!46205 m!175055))

(assert (=> d!46205 m!174581))

(declare-fun m!175057 () Bool)

(assert (=> b!145154 m!175057))

(declare-fun m!175059 () Bool)

(assert (=> b!145157 m!175059))

(assert (=> b!145155 m!174575))

(assert (=> b!145155 m!174575))

(declare-fun m!175061 () Bool)

(assert (=> b!145155 m!175061))

(declare-fun m!175063 () Bool)

(assert (=> b!145159 m!175063))

(assert (=> bm!16203 m!175063))

(assert (=> b!144803 d!46205))

(declare-fun d!46207 () Bool)

(declare-fun e!94594 () Bool)

(assert (=> d!46207 e!94594))

(declare-fun res!69129 () Bool)

(assert (=> d!46207 (=> res!69129 e!94594)))

(declare-fun lt!76311 () Bool)

(assert (=> d!46207 (= res!69129 (not lt!76311))))

(declare-fun lt!76309 () Bool)

(assert (=> d!46207 (= lt!76311 lt!76309)))

(declare-fun lt!76308 () Unit!4574)

(declare-fun e!94595 () Unit!4574)

(assert (=> d!46207 (= lt!76308 e!94595)))

(declare-fun c!27500 () Bool)

(assert (=> d!46207 (= c!27500 lt!76309)))

(assert (=> d!46207 (= lt!76309 (containsKey!183 (toList!865 (+!176 lt!76046 (tuple2!2651 lt!76035 (zeroValue!2834 (v!3320 (underlying!488 thiss!992)))))) lt!76048))))

(assert (=> d!46207 (= (contains!918 (+!176 lt!76046 (tuple2!2651 lt!76035 (zeroValue!2834 (v!3320 (underlying!488 thiss!992))))) lt!76048) lt!76311)))

(declare-fun b!145166 () Bool)

(declare-fun lt!76310 () Unit!4574)

(assert (=> b!145166 (= e!94595 lt!76310)))

(assert (=> b!145166 (= lt!76310 (lemmaContainsKeyImpliesGetValueByKeyDefined!131 (toList!865 (+!176 lt!76046 (tuple2!2651 lt!76035 (zeroValue!2834 (v!3320 (underlying!488 thiss!992)))))) lt!76048))))

(assert (=> b!145166 (isDefined!132 (getValueByKey!180 (toList!865 (+!176 lt!76046 (tuple2!2651 lt!76035 (zeroValue!2834 (v!3320 (underlying!488 thiss!992)))))) lt!76048))))

(declare-fun b!145167 () Bool)

(declare-fun Unit!4587 () Unit!4574)

(assert (=> b!145167 (= e!94595 Unit!4587)))

(declare-fun b!145168 () Bool)

(assert (=> b!145168 (= e!94594 (isDefined!132 (getValueByKey!180 (toList!865 (+!176 lt!76046 (tuple2!2651 lt!76035 (zeroValue!2834 (v!3320 (underlying!488 thiss!992)))))) lt!76048)))))

(assert (= (and d!46207 c!27500) b!145166))

(assert (= (and d!46207 (not c!27500)) b!145167))

(assert (= (and d!46207 (not res!69129)) b!145168))

(declare-fun m!175065 () Bool)

(assert (=> d!46207 m!175065))

(declare-fun m!175067 () Bool)

(assert (=> b!145166 m!175067))

(declare-fun m!175069 () Bool)

(assert (=> b!145166 m!175069))

(assert (=> b!145166 m!175069))

(declare-fun m!175071 () Bool)

(assert (=> b!145166 m!175071))

(assert (=> b!145168 m!175069))

(assert (=> b!145168 m!175069))

(assert (=> b!145168 m!175071))

(assert (=> b!144803 d!46207))

(declare-fun d!46209 () Bool)

(assert (=> d!46209 (= (apply!123 (+!176 lt!76049 (tuple2!2651 lt!76054 (zeroValue!2834 (v!3320 (underlying!488 thiss!992))))) lt!76037) (apply!123 lt!76049 lt!76037))))

(declare-fun lt!76312 () Unit!4574)

(assert (=> d!46209 (= lt!76312 (choose!900 lt!76049 lt!76054 (zeroValue!2834 (v!3320 (underlying!488 thiss!992))) lt!76037))))

(declare-fun e!94596 () Bool)

(assert (=> d!46209 e!94596))

(declare-fun res!69130 () Bool)

(assert (=> d!46209 (=> (not res!69130) (not e!94596))))

(assert (=> d!46209 (= res!69130 (contains!918 lt!76049 lt!76037))))

(assert (=> d!46209 (= (addApplyDifferent!99 lt!76049 lt!76054 (zeroValue!2834 (v!3320 (underlying!488 thiss!992))) lt!76037) lt!76312)))

(declare-fun b!145169 () Bool)

(assert (=> b!145169 (= e!94596 (not (= lt!76037 lt!76054)))))

(assert (= (and d!46209 res!69130) b!145169))

(assert (=> d!46209 m!174629))

(declare-fun m!175073 () Bool)

(assert (=> d!46209 m!175073))

(declare-fun m!175075 () Bool)

(assert (=> d!46209 m!175075))

(assert (=> d!46209 m!174609))

(assert (=> d!46209 m!174609))

(assert (=> d!46209 m!174627))

(assert (=> b!144803 d!46209))

(declare-fun d!46211 () Bool)

(assert (=> d!46211 (= (apply!123 (+!176 lt!76036 (tuple2!2651 lt!76041 (minValue!2834 (v!3320 (underlying!488 thiss!992))))) lt!76043) (get!1556 (getValueByKey!180 (toList!865 (+!176 lt!76036 (tuple2!2651 lt!76041 (minValue!2834 (v!3320 (underlying!488 thiss!992)))))) lt!76043)))))

(declare-fun bs!6118 () Bool)

(assert (= bs!6118 d!46211))

(declare-fun m!175077 () Bool)

(assert (=> bs!6118 m!175077))

(assert (=> bs!6118 m!175077))

(declare-fun m!175079 () Bool)

(assert (=> bs!6118 m!175079))

(assert (=> b!144803 d!46211))

(declare-fun d!46213 () Bool)

(assert (=> d!46213 (= (apply!123 lt!76049 lt!76037) (get!1556 (getValueByKey!180 (toList!865 lt!76049) lt!76037)))))

(declare-fun bs!6119 () Bool)

(assert (= bs!6119 d!46213))

(declare-fun m!175081 () Bool)

(assert (=> bs!6119 m!175081))

(assert (=> bs!6119 m!175081))

(declare-fun m!175083 () Bool)

(assert (=> bs!6119 m!175083))

(assert (=> b!144803 d!46213))

(declare-fun d!46215 () Bool)

(assert (=> d!46215 (contains!918 (+!176 lt!76046 (tuple2!2651 lt!76035 (zeroValue!2834 (v!3320 (underlying!488 thiss!992))))) lt!76048)))

(declare-fun lt!76315 () Unit!4574)

(declare-fun choose!901 (ListLongMap!1699 (_ BitVec 64) V!3577 (_ BitVec 64)) Unit!4574)

(assert (=> d!46215 (= lt!76315 (choose!901 lt!76046 lt!76035 (zeroValue!2834 (v!3320 (underlying!488 thiss!992))) lt!76048))))

(assert (=> d!46215 (contains!918 lt!76046 lt!76048)))

(assert (=> d!46215 (= (addStillContains!99 lt!76046 lt!76035 (zeroValue!2834 (v!3320 (underlying!488 thiss!992))) lt!76048) lt!76315)))

(declare-fun bs!6120 () Bool)

(assert (= bs!6120 d!46215))

(assert (=> bs!6120 m!174619))

(assert (=> bs!6120 m!174619))

(assert (=> bs!6120 m!174621))

(declare-fun m!175085 () Bool)

(assert (=> bs!6120 m!175085))

(declare-fun m!175087 () Bool)

(assert (=> bs!6120 m!175087))

(assert (=> b!144803 d!46215))

(declare-fun d!46217 () Bool)

(assert (=> d!46217 (= (apply!123 (+!176 lt!76038 (tuple2!2651 lt!76039 (minValue!2834 (v!3320 (underlying!488 thiss!992))))) lt!76047) (get!1556 (getValueByKey!180 (toList!865 (+!176 lt!76038 (tuple2!2651 lt!76039 (minValue!2834 (v!3320 (underlying!488 thiss!992)))))) lt!76047)))))

(declare-fun bs!6121 () Bool)

(assert (= bs!6121 d!46217))

(declare-fun m!175089 () Bool)

(assert (=> bs!6121 m!175089))

(assert (=> bs!6121 m!175089))

(declare-fun m!175091 () Bool)

(assert (=> bs!6121 m!175091))

(assert (=> b!144803 d!46217))

(declare-fun d!46219 () Bool)

(assert (=> d!46219 (= (apply!123 lt!76053 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1556 (getValueByKey!180 (toList!865 lt!76053) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!6122 () Bool)

(assert (= bs!6122 d!46219))

(assert (=> bs!6122 m!174575))

(assert (=> bs!6122 m!174841))

(assert (=> bs!6122 m!174841))

(declare-fun m!175093 () Bool)

(assert (=> bs!6122 m!175093))

(assert (=> b!144795 d!46219))

(declare-fun d!46221 () Bool)

(declare-fun c!27501 () Bool)

(assert (=> d!46221 (= c!27501 ((_ is ValueCellFull!1130) (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!94597 () V!3577)

(assert (=> d!46221 (= (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!94597)))

(declare-fun b!145171 () Bool)

(assert (=> b!145171 (= e!94597 (get!1554 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!145172 () Bool)

(assert (=> b!145172 (= e!94597 (get!1555 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!46221 c!27501) b!145171))

(assert (= (and d!46221 (not c!27501)) b!145172))

(assert (=> b!145171 m!174587))

(assert (=> b!145171 m!174451))

(declare-fun m!175095 () Bool)

(assert (=> b!145171 m!175095))

(assert (=> b!145172 m!174587))

(assert (=> b!145172 m!174451))

(declare-fun m!175097 () Bool)

(assert (=> b!145172 m!175097))

(assert (=> b!144795 d!46221))

(declare-fun d!46223 () Bool)

(assert (=> d!46223 (= (get!1555 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!144967 d!46223))

(declare-fun d!46225 () Bool)

(declare-fun c!27504 () Bool)

(assert (=> d!46225 (= c!27504 ((_ is Nil!1732) lt!75945))))

(declare-fun e!94600 () (InoxSet (_ BitVec 64)))

(assert (=> d!46225 (= (content!142 lt!75945) e!94600)))

(declare-fun b!145177 () Bool)

(assert (=> b!145177 (= e!94600 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!145178 () Bool)

(assert (=> b!145178 (= e!94600 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!2339 lt!75945) true) (content!142 (t!6368 lt!75945))))))

(assert (= (and d!46225 c!27504) b!145177))

(assert (= (and d!46225 (not c!27504)) b!145178))

(declare-fun m!175099 () Bool)

(assert (=> b!145178 m!175099))

(assert (=> b!145178 m!174897))

(assert (=> d!46145 d!46225))

(assert (=> d!46129 d!46165))

(declare-fun d!46227 () Bool)

(declare-fun lt!76316 () Bool)

(assert (=> d!46227 (= lt!76316 (select (content!142 Nil!1732) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun e!94601 () Bool)

(assert (=> d!46227 (= lt!76316 e!94601)))

(declare-fun res!69132 () Bool)

(assert (=> d!46227 (=> (not res!69132) (not e!94601))))

(assert (=> d!46227 (= res!69132 ((_ is Cons!1731) Nil!1732))))

(assert (=> d!46227 (= (contains!917 Nil!1732 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)) lt!76316)))

(declare-fun b!145179 () Bool)

(declare-fun e!94602 () Bool)

(assert (=> b!145179 (= e!94601 e!94602)))

(declare-fun res!69131 () Bool)

(assert (=> b!145179 (=> res!69131 e!94602)))

(assert (=> b!145179 (= res!69131 (= (h!2339 Nil!1732) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun b!145180 () Bool)

(assert (=> b!145180 (= e!94602 (contains!917 (t!6368 Nil!1732) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (= (and d!46227 res!69132) b!145179))

(assert (= (and b!145179 (not res!69131)) b!145180))

(declare-fun m!175101 () Bool)

(assert (=> d!46227 m!175101))

(assert (=> d!46227 m!174417))

(declare-fun m!175103 () Bool)

(assert (=> d!46227 m!175103))

(assert (=> b!145180 m!174417))

(declare-fun m!175105 () Bool)

(assert (=> b!145180 m!175105))

(assert (=> b!144729 d!46227))

(declare-fun b!145215 () Bool)

(declare-fun e!94623 () Unit!4574)

(declare-fun Unit!4588 () Unit!4574)

(assert (=> b!145215 (= e!94623 Unit!4588)))

(declare-fun lt!76392 () Unit!4574)

(assert (=> b!145215 (= lt!76392 (lemmaInListMapThenSeekEntryOrOpenFindsIt!68 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76391 () SeekEntryResult!276)

(declare-fun call!16217 () SeekEntryResult!276)

(assert (=> b!145215 (= lt!76391 call!16217)))

(declare-fun res!69155 () Bool)

(assert (=> b!145215 (= res!69155 ((_ is Found!276) lt!76391))))

(declare-fun e!94620 () Bool)

(assert (=> b!145215 (=> (not res!69155) (not e!94620))))

(assert (=> b!145215 e!94620))

(declare-fun lt!76382 () Unit!4574)

(assert (=> b!145215 (= lt!76382 lt!76392)))

(assert (=> b!145215 false))

(declare-fun b!145216 () Bool)

(declare-fun lt!76399 () Unit!4574)

(assert (=> b!145216 (= e!94623 lt!76399)))

(assert (=> b!145216 (= lt!76399 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!68 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76406 () SeekEntryResult!276)

(assert (=> b!145216 (= lt!76406 call!16217)))

(declare-fun c!27513 () Bool)

(assert (=> b!145216 (= c!27513 ((_ is MissingZero!276) lt!76406))))

(declare-fun e!94626 () Bool)

(assert (=> b!145216 e!94626))

(declare-fun b!145217 () Bool)

(declare-fun e!94621 () Bool)

(assert (=> b!145217 (= e!94621 ((_ is Undefined!276) lt!76406))))

(declare-fun b!145218 () Bool)

(declare-fun e!94619 () Bool)

(assert (=> b!145218 (= e!94621 e!94619)))

(declare-fun res!69154 () Bool)

(declare-fun call!16215 () Bool)

(assert (=> b!145218 (= res!69154 call!16215)))

(assert (=> b!145218 (=> (not res!69154) (not e!94619))))

(declare-fun b!145219 () Bool)

(declare-fun res!69158 () Bool)

(assert (=> b!145219 (= res!69158 (= (select (arr!2324 (_keys!4755 newMap!16)) (index!3273 lt!76406)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!145219 (=> (not res!69158) (not e!94619))))

(declare-fun b!145220 () Bool)

(declare-fun c!27516 () Bool)

(assert (=> b!145220 (= c!27516 ((_ is MissingVacant!276) lt!76406))))

(assert (=> b!145220 (= e!94626 e!94621)))

(declare-fun b!145221 () Bool)

(declare-fun res!69159 () Bool)

(declare-fun e!94625 () Bool)

(assert (=> b!145221 (=> (not res!69159) (not e!94625))))

(assert (=> b!145221 (= res!69159 call!16215)))

(assert (=> b!145221 (= e!94626 e!94625)))

(declare-fun bm!16212 () Bool)

(assert (=> bm!16212 (= call!16217 (seekEntryOrOpen!0 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (_keys!4755 newMap!16) (mask!7352 newMap!16)))))

(declare-fun b!145222 () Bool)

(declare-fun res!69157 () Bool)

(declare-fun e!94622 () Bool)

(assert (=> b!145222 (=> (not res!69157) (not e!94622))))

(declare-fun lt!76405 () tuple2!2652)

(assert (=> b!145222 (= res!69157 (valid!580 (_2!1337 lt!76405)))))

(declare-fun b!145223 () Bool)

(declare-fun res!69153 () Bool)

(assert (=> b!145223 (=> (not res!69153) (not e!94625))))

(assert (=> b!145223 (= res!69153 (= (select (arr!2324 (_keys!4755 newMap!16)) (index!3270 lt!76406)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145224 () Bool)

(declare-fun res!69156 () Bool)

(declare-fun call!16218 () Bool)

(assert (=> b!145224 (= res!69156 call!16218)))

(assert (=> b!145224 (=> (not res!69156) (not e!94620))))

(declare-fun bm!16213 () Bool)

(assert (=> bm!16213 (= call!16215 call!16218)))

(declare-fun b!145225 () Bool)

(declare-fun res!69151 () Bool)

(assert (=> b!145225 (=> (not res!69151) (not e!94622))))

(assert (=> b!145225 (= res!69151 (contains!918 (map!1441 (_2!1337 lt!76405)) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun b!145226 () Bool)

(declare-fun e!94624 () Unit!4574)

(declare-fun Unit!4589 () Unit!4574)

(assert (=> b!145226 (= e!94624 Unit!4589)))

(declare-fun b!145227 () Bool)

(declare-fun Unit!4590 () Unit!4574)

(assert (=> b!145227 (= e!94624 Unit!4590)))

(declare-fun lt!76385 () Unit!4574)

(declare-fun lemmaArrayContainsKeyThenInListMap!48 (array!4921 array!4923 (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 (_ BitVec 64) (_ BitVec 32) Int) Unit!4574)

(assert (=> b!145227 (= lt!76385 (lemmaArrayContainsKeyThenInListMap!48 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(assert (=> b!145227 (contains!918 (getCurrentListMap!537 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355))))

(declare-fun lt!76380 () Unit!4574)

(assert (=> b!145227 (= lt!76380 lt!76385)))

(assert (=> b!145227 false))

(declare-fun b!145228 () Bool)

(assert (=> b!145228 (= e!94620 (= (select (arr!2324 (_keys!4755 newMap!16)) (index!3271 lt!76391)) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun b!145229 () Bool)

(declare-fun call!16216 () Bool)

(assert (=> b!145229 (= e!94625 (not call!16216))))

(declare-fun b!145230 () Bool)

(assert (=> b!145230 (= e!94622 (= (map!1441 (_2!1337 lt!76405)) (+!176 (map!1441 newMap!16) (tuple2!2651 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!16214 () Bool)

(assert (=> bm!16214 (= call!16216 (arrayContainsKey!0 (_keys!4755 newMap!16) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun d!46229 () Bool)

(assert (=> d!46229 e!94622))

(declare-fun res!69152 () Bool)

(assert (=> d!46229 (=> (not res!69152) (not e!94622))))

(assert (=> d!46229 (= res!69152 (_1!1337 lt!76405))))

(assert (=> d!46229 (= lt!76405 (tuple2!2653 true (LongMapFixedSize!1169 (defaultEntry!2988 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (bvadd (_size!633 newMap!16) #b00000000000000000000000000000001) (array!4922 (store (arr!2324 (_keys!4755 newMap!16)) (ite c!27444 (index!3273 lt!76144) (index!3270 lt!76144)) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)) (size!2599 (_keys!4755 newMap!16))) (array!4924 (store (arr!2325 (_values!2971 newMap!16)) (ite c!27444 (index!3273 lt!76144) (index!3270 lt!76144)) (ValueCellFull!1130 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2600 (_values!2971 newMap!16))) (_vacant!633 newMap!16))))))

(declare-fun lt!76386 () Unit!4574)

(declare-fun lt!76397 () Unit!4574)

(assert (=> d!46229 (= lt!76386 lt!76397)))

(declare-fun lt!76379 () array!4923)

(declare-fun lt!76394 () array!4921)

(assert (=> d!46229 (contains!918 (getCurrentListMap!537 lt!76394 lt!76379 (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)) (select (store (arr!2324 (_keys!4755 newMap!16)) (ite c!27444 (index!3273 lt!76144) (index!3270 lt!76144)) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)) (ite c!27444 (index!3273 lt!76144) (index!3270 lt!76144))))))

(assert (=> d!46229 (= lt!76397 (lemmaValidKeyInArrayIsInListMap!128 lt!76394 lt!76379 (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (ite c!27444 (index!3273 lt!76144) (index!3270 lt!76144)) (defaultEntry!2988 newMap!16)))))

(assert (=> d!46229 (= lt!76379 (array!4924 (store (arr!2325 (_values!2971 newMap!16)) (ite c!27444 (index!3273 lt!76144) (index!3270 lt!76144)) (ValueCellFull!1130 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2600 (_values!2971 newMap!16))))))

(assert (=> d!46229 (= lt!76394 (array!4922 (store (arr!2324 (_keys!4755 newMap!16)) (ite c!27444 (index!3273 lt!76144) (index!3270 lt!76144)) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)) (size!2599 (_keys!4755 newMap!16))))))

(declare-fun lt!76393 () Unit!4574)

(declare-fun lt!76383 () Unit!4574)

(assert (=> d!46229 (= lt!76393 lt!76383)))

(declare-fun lt!76387 () array!4921)

(assert (=> d!46229 (= (arrayCountValidKeys!0 lt!76387 (ite c!27444 (index!3273 lt!76144) (index!3270 lt!76144)) (bvadd (ite c!27444 (index!3273 lt!76144) (index!3270 lt!76144)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4921 (_ BitVec 32)) Unit!4574)

(assert (=> d!46229 (= lt!76383 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!76387 (ite c!27444 (index!3273 lt!76144) (index!3270 lt!76144))))))

(assert (=> d!46229 (= lt!76387 (array!4922 (store (arr!2324 (_keys!4755 newMap!16)) (ite c!27444 (index!3273 lt!76144) (index!3270 lt!76144)) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)) (size!2599 (_keys!4755 newMap!16))))))

(declare-fun lt!76401 () Unit!4574)

(declare-fun lt!76404 () Unit!4574)

(assert (=> d!46229 (= lt!76401 lt!76404)))

(declare-fun lt!76402 () array!4921)

(assert (=> d!46229 (arrayContainsKey!0 lt!76402 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4921 (_ BitVec 64) (_ BitVec 32)) Unit!4574)

(assert (=> d!46229 (= lt!76404 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!76402 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (ite c!27444 (index!3273 lt!76144) (index!3270 lt!76144))))))

(assert (=> d!46229 (= lt!76402 (array!4922 (store (arr!2324 (_keys!4755 newMap!16)) (ite c!27444 (index!3273 lt!76144) (index!3270 lt!76144)) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)) (size!2599 (_keys!4755 newMap!16))))))

(declare-fun lt!76390 () Unit!4574)

(declare-fun lt!76384 () Unit!4574)

(assert (=> d!46229 (= lt!76390 lt!76384)))

(assert (=> d!46229 (= (+!176 (getCurrentListMap!537 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)) (tuple2!2651 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!537 (array!4922 (store (arr!2324 (_keys!4755 newMap!16)) (ite c!27444 (index!3273 lt!76144) (index!3270 lt!76144)) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)) (size!2599 (_keys!4755 newMap!16))) (array!4924 (store (arr!2325 (_values!2971 newMap!16)) (ite c!27444 (index!3273 lt!76144) (index!3270 lt!76144)) (ValueCellFull!1130 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2600 (_values!2971 newMap!16))) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!48 (array!4921 array!4923 (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 (_ BitVec 32) (_ BitVec 64) V!3577 Int) Unit!4574)

(assert (=> d!46229 (= lt!76384 (lemmaAddValidKeyToArrayThenAddPairToListMap!48 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (ite c!27444 (index!3273 lt!76144) (index!3270 lt!76144)) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76400 () Unit!4574)

(declare-fun lt!76389 () Unit!4574)

(assert (=> d!46229 (= lt!76400 lt!76389)))

(assert (=> d!46229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4922 (store (arr!2324 (_keys!4755 newMap!16)) (ite c!27444 (index!3273 lt!76144) (index!3270 lt!76144)) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)) (size!2599 (_keys!4755 newMap!16))) (mask!7352 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4921 (_ BitVec 32) (_ BitVec 32)) Unit!4574)

(assert (=> d!46229 (= lt!76389 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (_keys!4755 newMap!16) (ite c!27444 (index!3273 lt!76144) (index!3270 lt!76144)) (mask!7352 newMap!16)))))

(declare-fun lt!76396 () Unit!4574)

(declare-fun lt!76403 () Unit!4574)

(assert (=> d!46229 (= lt!76396 lt!76403)))

(assert (=> d!46229 (= (arrayCountValidKeys!0 (array!4922 (store (arr!2324 (_keys!4755 newMap!16)) (ite c!27444 (index!3273 lt!76144) (index!3270 lt!76144)) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)) (size!2599 (_keys!4755 newMap!16))) #b00000000000000000000000000000000 (size!2599 (_keys!4755 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4755 newMap!16) #b00000000000000000000000000000000 (size!2599 (_keys!4755 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4921 (_ BitVec 32) (_ BitVec 64)) Unit!4574)

(assert (=> d!46229 (= lt!76403 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4755 newMap!16) (ite c!27444 (index!3273 lt!76144) (index!3270 lt!76144)) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun lt!76378 () Unit!4574)

(declare-fun lt!76395 () Unit!4574)

(assert (=> d!46229 (= lt!76378 lt!76395)))

(declare-fun lt!76377 () (_ BitVec 32))

(declare-fun lt!76381 () List!1735)

(assert (=> d!46229 (arrayNoDuplicates!0 (array!4922 (store (arr!2324 (_keys!4755 newMap!16)) (ite c!27444 (index!3273 lt!76144) (index!3270 lt!76144)) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)) (size!2599 (_keys!4755 newMap!16))) lt!76377 lt!76381)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4921 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1735) Unit!4574)

(assert (=> d!46229 (= lt!76395 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4755 newMap!16) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (ite c!27444 (index!3273 lt!76144) (index!3270 lt!76144)) lt!76377 lt!76381))))

(assert (=> d!46229 (= lt!76381 Nil!1732)))

(assert (=> d!46229 (= lt!76377 #b00000000000000000000000000000000)))

(declare-fun lt!76388 () Unit!4574)

(assert (=> d!46229 (= lt!76388 e!94624)))

(declare-fun c!27515 () Bool)

(assert (=> d!46229 (= c!27515 (arrayContainsKey!0 (_keys!4755 newMap!16) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!76398 () Unit!4574)

(assert (=> d!46229 (= lt!76398 e!94623)))

(declare-fun c!27514 () Bool)

(assert (=> d!46229 (= c!27514 (contains!918 (getCurrentListMap!537 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (=> d!46229 (valid!580 newMap!16)))

(assert (=> d!46229 (= (updateHelperNewKey!68 newMap!16 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!27444 (index!3273 lt!76144) (index!3270 lt!76144))) lt!76405)))

(declare-fun b!145231 () Bool)

(assert (=> b!145231 (= e!94619 (not call!16216))))

(declare-fun bm!16215 () Bool)

(assert (=> bm!16215 (= call!16218 (inRange!0 (ite c!27514 (index!3271 lt!76391) (ite c!27513 (index!3270 lt!76406) (index!3273 lt!76406))) (mask!7352 newMap!16)))))

(assert (= (and d!46229 c!27514) b!145215))

(assert (= (and d!46229 (not c!27514)) b!145216))

(assert (= (and b!145215 res!69155) b!145224))

(assert (= (and b!145224 res!69156) b!145228))

(assert (= (and b!145216 c!27513) b!145221))

(assert (= (and b!145216 (not c!27513)) b!145220))

(assert (= (and b!145221 res!69159) b!145223))

(assert (= (and b!145223 res!69153) b!145229))

(assert (= (and b!145220 c!27516) b!145218))

(assert (= (and b!145220 (not c!27516)) b!145217))

(assert (= (and b!145218 res!69154) b!145219))

(assert (= (and b!145219 res!69158) b!145231))

(assert (= (or b!145221 b!145218) bm!16213))

(assert (= (or b!145229 b!145231) bm!16214))

(assert (= (or b!145224 bm!16213) bm!16215))

(assert (= (or b!145215 b!145216) bm!16212))

(assert (= (and d!46229 c!27515) b!145227))

(assert (= (and d!46229 (not c!27515)) b!145226))

(assert (= (and d!46229 res!69152) b!145222))

(assert (= (and b!145222 res!69157) b!145225))

(assert (= (and b!145225 res!69151) b!145230))

(assert (=> bm!16212 m!174417))

(assert (=> bm!16212 m!174673))

(assert (=> b!145227 m!174417))

(declare-fun m!175107 () Bool)

(assert (=> b!145227 m!175107))

(assert (=> b!145227 m!174583))

(assert (=> b!145227 m!174583))

(assert (=> b!145227 m!174417))

(declare-fun m!175109 () Bool)

(assert (=> b!145227 m!175109))

(declare-fun m!175111 () Bool)

(assert (=> d!46229 m!175111))

(assert (=> d!46229 m!174415))

(declare-fun m!175113 () Bool)

(assert (=> d!46229 m!175113))

(assert (=> d!46229 m!174417))

(declare-fun m!175115 () Bool)

(assert (=> d!46229 m!175115))

(assert (=> d!46229 m!174417))

(assert (=> d!46229 m!174453))

(declare-fun m!175117 () Bool)

(assert (=> d!46229 m!175117))

(declare-fun m!175119 () Bool)

(assert (=> d!46229 m!175119))

(assert (=> d!46229 m!175111))

(declare-fun m!175121 () Bool)

(assert (=> d!46229 m!175121))

(assert (=> d!46229 m!174583))

(declare-fun m!175123 () Bool)

(assert (=> d!46229 m!175123))

(assert (=> d!46229 m!174417))

(declare-fun m!175125 () Bool)

(assert (=> d!46229 m!175125))

(assert (=> d!46229 m!174583))

(assert (=> d!46229 m!174775))

(declare-fun m!175127 () Bool)

(assert (=> d!46229 m!175127))

(assert (=> d!46229 m!174583))

(assert (=> d!46229 m!174417))

(assert (=> d!46229 m!175109))

(assert (=> d!46229 m!174417))

(declare-fun m!175129 () Bool)

(assert (=> d!46229 m!175129))

(declare-fun m!175131 () Bool)

(assert (=> d!46229 m!175131))

(assert (=> d!46229 m!174417))

(assert (=> d!46229 m!174721))

(declare-fun m!175133 () Bool)

(assert (=> d!46229 m!175133))

(declare-fun m!175135 () Bool)

(assert (=> d!46229 m!175135))

(declare-fun m!175137 () Bool)

(assert (=> d!46229 m!175137))

(declare-fun m!175139 () Bool)

(assert (=> d!46229 m!175139))

(assert (=> d!46229 m!174417))

(declare-fun m!175141 () Bool)

(assert (=> d!46229 m!175141))

(assert (=> d!46229 m!174417))

(declare-fun m!175143 () Bool)

(assert (=> d!46229 m!175143))

(declare-fun m!175145 () Bool)

(assert (=> d!46229 m!175145))

(assert (=> d!46229 m!174561))

(assert (=> d!46229 m!175119))

(declare-fun m!175147 () Bool)

(assert (=> b!145222 m!175147))

(declare-fun m!175149 () Bool)

(assert (=> b!145228 m!175149))

(declare-fun m!175151 () Bool)

(assert (=> b!145225 m!175151))

(assert (=> b!145225 m!175151))

(assert (=> b!145225 m!174417))

(declare-fun m!175153 () Bool)

(assert (=> b!145225 m!175153))

(assert (=> bm!16214 m!174417))

(assert (=> bm!16214 m!174721))

(declare-fun m!175155 () Bool)

(assert (=> b!145219 m!175155))

(assert (=> b!145215 m!174417))

(assert (=> b!145215 m!174695))

(declare-fun m!175157 () Bool)

(assert (=> b!145223 m!175157))

(assert (=> b!145230 m!175151))

(assert (=> b!145230 m!174419))

(assert (=> b!145230 m!174419))

(declare-fun m!175159 () Bool)

(assert (=> b!145230 m!175159))

(declare-fun m!175161 () Bool)

(assert (=> bm!16215 m!175161))

(assert (=> b!145216 m!174417))

(assert (=> b!145216 m!174697))

(assert (=> bm!16164 d!46229))

(declare-fun d!46231 () Bool)

(declare-fun e!94629 () Bool)

(assert (=> d!46231 e!94629))

(declare-fun res!69164 () Bool)

(assert (=> d!46231 (=> (not res!69164) (not e!94629))))

(declare-fun lt!76411 () SeekEntryResult!276)

(assert (=> d!46231 (= res!69164 ((_ is Found!276) lt!76411))))

(assert (=> d!46231 (= lt!76411 (seekEntryOrOpen!0 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (_keys!4755 newMap!16) (mask!7352 newMap!16)))))

(declare-fun lt!76412 () Unit!4574)

(declare-fun choose!902 (array!4921 array!4923 (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 (_ BitVec 64) Int) Unit!4574)

(assert (=> d!46231 (= lt!76412 (choose!902 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (defaultEntry!2988 newMap!16)))))

(assert (=> d!46231 (validMask!0 (mask!7352 newMap!16))))

(assert (=> d!46231 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!68 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (defaultEntry!2988 newMap!16)) lt!76412)))

(declare-fun b!145236 () Bool)

(declare-fun res!69165 () Bool)

(assert (=> b!145236 (=> (not res!69165) (not e!94629))))

(assert (=> b!145236 (= res!69165 (inRange!0 (index!3271 lt!76411) (mask!7352 newMap!16)))))

(declare-fun b!145237 () Bool)

(assert (=> b!145237 (= e!94629 (= (select (arr!2324 (_keys!4755 newMap!16)) (index!3271 lt!76411)) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (=> b!145237 (and (bvsge (index!3271 lt!76411) #b00000000000000000000000000000000) (bvslt (index!3271 lt!76411) (size!2599 (_keys!4755 newMap!16))))))

(assert (= (and d!46231 res!69164) b!145236))

(assert (= (and b!145236 res!69165) b!145237))

(assert (=> d!46231 m!174417))

(assert (=> d!46231 m!174673))

(assert (=> d!46231 m!174417))

(declare-fun m!175163 () Bool)

(assert (=> d!46231 m!175163))

(assert (=> d!46231 m!174753))

(declare-fun m!175165 () Bool)

(assert (=> b!145236 m!175165))

(declare-fun m!175167 () Bool)

(assert (=> b!145237 m!175167))

(assert (=> bm!16156 d!46231))

(assert (=> bm!16096 d!46205))

(assert (=> bm!16167 d!46157))

(declare-fun b!145246 () Bool)

(declare-fun e!94637 () Bool)

(declare-fun call!16221 () Bool)

(assert (=> b!145246 (= e!94637 call!16221)))

(declare-fun d!46233 () Bool)

(declare-fun res!69171 () Bool)

(declare-fun e!94638 () Bool)

(assert (=> d!46233 (=> res!69171 e!94638)))

(assert (=> d!46233 (= res!69171 (bvsge #b00000000000000000000000000000000 (size!2599 (_keys!4755 newMap!16))))))

(assert (=> d!46233 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4755 newMap!16) (mask!7352 newMap!16)) e!94638)))

(declare-fun bm!16218 () Bool)

(assert (=> bm!16218 (= call!16221 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4755 newMap!16) (mask!7352 newMap!16)))))

(declare-fun b!145247 () Bool)

(declare-fun e!94636 () Bool)

(assert (=> b!145247 (= e!94636 call!16221)))

(declare-fun b!145248 () Bool)

(assert (=> b!145248 (= e!94638 e!94636)))

(declare-fun c!27519 () Bool)

(assert (=> b!145248 (= c!27519 (validKeyInArray!0 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!145249 () Bool)

(assert (=> b!145249 (= e!94636 e!94637)))

(declare-fun lt!76420 () (_ BitVec 64))

(assert (=> b!145249 (= lt!76420 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76421 () Unit!4574)

(assert (=> b!145249 (= lt!76421 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4755 newMap!16) lt!76420 #b00000000000000000000000000000000))))

(assert (=> b!145249 (arrayContainsKey!0 (_keys!4755 newMap!16) lt!76420 #b00000000000000000000000000000000)))

(declare-fun lt!76419 () Unit!4574)

(assert (=> b!145249 (= lt!76419 lt!76421)))

(declare-fun res!69170 () Bool)

(assert (=> b!145249 (= res!69170 (= (seekEntryOrOpen!0 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000) (_keys!4755 newMap!16) (mask!7352 newMap!16)) (Found!276 #b00000000000000000000000000000000)))))

(assert (=> b!145249 (=> (not res!69170) (not e!94637))))

(assert (= (and d!46233 (not res!69171)) b!145248))

(assert (= (and b!145248 c!27519) b!145249))

(assert (= (and b!145248 (not c!27519)) b!145247))

(assert (= (and b!145249 res!69170) b!145246))

(assert (= (or b!145246 b!145247) bm!16218))

(declare-fun m!175169 () Bool)

(assert (=> bm!16218 m!175169))

(assert (=> b!145248 m!174781))

(assert (=> b!145248 m!174781))

(assert (=> b!145248 m!174791))

(assert (=> b!145249 m!174781))

(declare-fun m!175171 () Bool)

(assert (=> b!145249 m!175171))

(declare-fun m!175173 () Bool)

(assert (=> b!145249 m!175173))

(assert (=> b!145249 m!174781))

(declare-fun m!175175 () Bool)

(assert (=> b!145249 m!175175))

(assert (=> b!144716 d!46233))

(declare-fun d!46235 () Bool)

(assert (=> d!46235 (isDefined!132 (getValueByKey!180 (toList!865 lt!75946) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun lt!76424 () Unit!4574)

(declare-fun choose!903 (List!1736 (_ BitVec 64)) Unit!4574)

(assert (=> d!46235 (= lt!76424 (choose!903 (toList!865 lt!75946) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun e!94641 () Bool)

(assert (=> d!46235 e!94641))

(declare-fun res!69174 () Bool)

(assert (=> d!46235 (=> (not res!69174) (not e!94641))))

(declare-fun isStrictlySorted!315 (List!1736) Bool)

(assert (=> d!46235 (= res!69174 (isStrictlySorted!315 (toList!865 lt!75946)))))

(assert (=> d!46235 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!131 (toList!865 lt!75946) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)) lt!76424)))

(declare-fun b!145252 () Bool)

(assert (=> b!145252 (= e!94641 (containsKey!183 (toList!865 lt!75946) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (= (and d!46235 res!69174) b!145252))

(assert (=> d!46235 m!174417))

(assert (=> d!46235 m!174663))

(assert (=> d!46235 m!174663))

(assert (=> d!46235 m!174665))

(assert (=> d!46235 m!174417))

(declare-fun m!175177 () Bool)

(assert (=> d!46235 m!175177))

(declare-fun m!175179 () Bool)

(assert (=> d!46235 m!175179))

(assert (=> b!145252 m!174417))

(assert (=> b!145252 m!174659))

(assert (=> b!144833 d!46235))

(declare-fun d!46237 () Bool)

(declare-fun isEmpty!431 (Option!186) Bool)

(assert (=> d!46237 (= (isDefined!132 (getValueByKey!180 (toList!865 lt!75946) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355))) (not (isEmpty!431 (getValueByKey!180 (toList!865 lt!75946) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))))

(declare-fun bs!6123 () Bool)

(assert (= bs!6123 d!46237))

(assert (=> bs!6123 m!174663))

(declare-fun m!175181 () Bool)

(assert (=> bs!6123 m!175181))

(assert (=> b!144833 d!46237))

(declare-fun b!145262 () Bool)

(declare-fun e!94646 () Option!186)

(declare-fun e!94647 () Option!186)

(assert (=> b!145262 (= e!94646 e!94647)))

(declare-fun c!27525 () Bool)

(assert (=> b!145262 (= c!27525 (and ((_ is Cons!1732) (toList!865 lt!75946)) (not (= (_1!1336 (h!2340 (toList!865 lt!75946))) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))))

(declare-fun b!145263 () Bool)

(assert (=> b!145263 (= e!94647 (getValueByKey!180 (t!6369 (toList!865 lt!75946)) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun b!145261 () Bool)

(assert (=> b!145261 (= e!94646 (Some!185 (_2!1336 (h!2340 (toList!865 lt!75946)))))))

(declare-fun b!145264 () Bool)

(assert (=> b!145264 (= e!94647 None!184)))

(declare-fun c!27524 () Bool)

(declare-fun d!46239 () Bool)

(assert (=> d!46239 (= c!27524 (and ((_ is Cons!1732) (toList!865 lt!75946)) (= (_1!1336 (h!2340 (toList!865 lt!75946))) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355))))))

(assert (=> d!46239 (= (getValueByKey!180 (toList!865 lt!75946) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)) e!94646)))

(assert (= (and d!46239 c!27524) b!145261))

(assert (= (and d!46239 (not c!27524)) b!145262))

(assert (= (and b!145262 c!27525) b!145263))

(assert (= (and b!145262 (not c!27525)) b!145264))

(assert (=> b!145263 m!174417))

(declare-fun m!175183 () Bool)

(assert (=> b!145263 m!175183))

(assert (=> b!144833 d!46239))

(declare-fun d!46241 () Bool)

(declare-fun res!69175 () Bool)

(declare-fun e!94648 () Bool)

(assert (=> d!46241 (=> res!69175 e!94648)))

(assert (=> d!46241 (= res!69175 (= (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (=> d!46241 (= (arrayContainsKey!0 (_keys!4755 (v!3320 (underlying!488 thiss!992))) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!94648)))

(declare-fun b!145265 () Bool)

(declare-fun e!94649 () Bool)

(assert (=> b!145265 (= e!94648 e!94649)))

(declare-fun res!69176 () Bool)

(assert (=> b!145265 (=> (not res!69176) (not e!94649))))

(assert (=> b!145265 (= res!69176 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2599 (_keys!4755 (v!3320 (underlying!488 thiss!992))))))))

(declare-fun b!145266 () Bool)

(assert (=> b!145266 (= e!94649 (arrayContainsKey!0 (_keys!4755 (v!3320 (underlying!488 thiss!992))) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!46241 (not res!69175)) b!145265))

(assert (= (and b!145265 res!69176) b!145266))

(declare-fun m!175185 () Bool)

(assert (=> d!46241 m!175185))

(assert (=> b!145266 m!174417))

(declare-fun m!175187 () Bool)

(assert (=> b!145266 m!175187))

(assert (=> b!144738 d!46241))

(declare-fun b!145275 () Bool)

(declare-fun res!69185 () Bool)

(declare-fun e!94652 () Bool)

(assert (=> b!145275 (=> (not res!69185) (not e!94652))))

(assert (=> b!145275 (= res!69185 (and (= (size!2600 (_values!2971 newMap!16)) (bvadd (mask!7352 newMap!16) #b00000000000000000000000000000001)) (= (size!2599 (_keys!4755 newMap!16)) (size!2600 (_values!2971 newMap!16))) (bvsge (_size!633 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!633 newMap!16) (bvadd (mask!7352 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!145277 () Bool)

(declare-fun res!69187 () Bool)

(assert (=> b!145277 (=> (not res!69187) (not e!94652))))

(declare-fun size!2605 (LongMapFixedSize!1168) (_ BitVec 32))

(assert (=> b!145277 (= res!69187 (= (size!2605 newMap!16) (bvadd (_size!633 newMap!16) (bvsdiv (bvadd (extraKeys!2735 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!145278 () Bool)

(assert (=> b!145278 (= e!94652 (and (bvsge (extraKeys!2735 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2735 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!633 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun d!46243 () Bool)

(declare-fun res!69186 () Bool)

(assert (=> d!46243 (=> (not res!69186) (not e!94652))))

(assert (=> d!46243 (= res!69186 (validMask!0 (mask!7352 newMap!16)))))

(assert (=> d!46243 (= (simpleValid!99 newMap!16) e!94652)))

(declare-fun b!145276 () Bool)

(declare-fun res!69188 () Bool)

(assert (=> b!145276 (=> (not res!69188) (not e!94652))))

(assert (=> b!145276 (= res!69188 (bvsge (size!2605 newMap!16) (_size!633 newMap!16)))))

(assert (= (and d!46243 res!69186) b!145275))

(assert (= (and b!145275 res!69185) b!145276))

(assert (= (and b!145276 res!69188) b!145277))

(assert (= (and b!145277 res!69187) b!145278))

(declare-fun m!175189 () Bool)

(assert (=> b!145277 m!175189))

(assert (=> d!46243 m!174753))

(assert (=> b!145276 m!175189))

(assert (=> d!46119 d!46243))

(declare-fun d!46245 () Bool)

(assert (=> d!46245 (= (validKeyInArray!0 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)) (and (not (= (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!144732 d!46245))

(assert (=> b!144938 d!46165))

(declare-fun d!46247 () Bool)

(assert (=> d!46247 (= (map!1441 (ite c!27436 (_2!1337 lt!76137) newMap!16)) (getCurrentListMap!537 (_keys!4755 (ite c!27436 (_2!1337 lt!76137) newMap!16)) (_values!2971 (ite c!27436 (_2!1337 lt!76137) newMap!16)) (mask!7352 (ite c!27436 (_2!1337 lt!76137) newMap!16)) (extraKeys!2735 (ite c!27436 (_2!1337 lt!76137) newMap!16)) (zeroValue!2834 (ite c!27436 (_2!1337 lt!76137) newMap!16)) (minValue!2834 (ite c!27436 (_2!1337 lt!76137) newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2988 (ite c!27436 (_2!1337 lt!76137) newMap!16))))))

(declare-fun bs!6124 () Bool)

(assert (= bs!6124 d!46247))

(declare-fun m!175191 () Bool)

(assert (=> bs!6124 m!175191))

(assert (=> bm!16170 d!46247))

(declare-fun d!46249 () Bool)

(declare-fun lt!76425 () Bool)

(assert (=> d!46249 (= lt!76425 (select (content!142 (t!6368 lt!75945)) (h!2339 lt!75945)))))

(declare-fun e!94653 () Bool)

(assert (=> d!46249 (= lt!76425 e!94653)))

(declare-fun res!69190 () Bool)

(assert (=> d!46249 (=> (not res!69190) (not e!94653))))

(assert (=> d!46249 (= res!69190 ((_ is Cons!1731) (t!6368 lt!75945)))))

(assert (=> d!46249 (= (contains!917 (t!6368 lt!75945) (h!2339 lt!75945)) lt!76425)))

(declare-fun b!145279 () Bool)

(declare-fun e!94654 () Bool)

(assert (=> b!145279 (= e!94653 e!94654)))

(declare-fun res!69189 () Bool)

(assert (=> b!145279 (=> res!69189 e!94654)))

(assert (=> b!145279 (= res!69189 (= (h!2339 (t!6368 lt!75945)) (h!2339 lt!75945)))))

(declare-fun b!145280 () Bool)

(assert (=> b!145280 (= e!94654 (contains!917 (t!6368 (t!6368 lt!75945)) (h!2339 lt!75945)))))

(assert (= (and d!46249 res!69190) b!145279))

(assert (= (and b!145279 (not res!69189)) b!145280))

(assert (=> d!46249 m!174897))

(declare-fun m!175193 () Bool)

(assert (=> d!46249 m!175193))

(declare-fun m!175195 () Bool)

(assert (=> b!145280 m!175195))

(assert (=> b!144818 d!46249))

(assert (=> d!46123 d!46121))

(declare-fun d!46251 () Bool)

(assert (=> d!46251 (arrayNoDuplicates!0 (_keys!4755 (v!3320 (underlying!488 thiss!992))) from!355 Nil!1732)))

(assert (=> d!46251 true))

(declare-fun _$71!174 () Unit!4574)

(assert (=> d!46251 (= (choose!39 (_keys!4755 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!174)))

(declare-fun bs!6125 () Bool)

(assert (= bs!6125 d!46251))

(assert (=> bs!6125 m!174425))

(assert (=> d!46123 d!46251))

(declare-fun d!46253 () Bool)

(declare-fun e!94657 () Bool)

(assert (=> d!46253 e!94657))

(declare-fun c!27528 () Bool)

(assert (=> d!46253 (= c!27528 (and (not (= (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!46253 true))

(declare-fun _$29!174 () Unit!4574)

(assert (=> d!46253 (= (choose!896 (_keys!4755 (v!3320 (underlying!488 thiss!992))) (_values!2971 (v!3320 (underlying!488 thiss!992))) (mask!7352 (v!3320 (underlying!488 thiss!992))) (extraKeys!2735 (v!3320 (underlying!488 thiss!992))) (zeroValue!2834 (v!3320 (underlying!488 thiss!992))) (minValue!2834 (v!3320 (underlying!488 thiss!992))) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2988 (v!3320 (underlying!488 thiss!992)))) _$29!174)))

(declare-fun b!145285 () Bool)

(assert (=> b!145285 (= e!94657 (arrayContainsKey!0 (_keys!4755 (v!3320 (underlying!488 thiss!992))) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!145286 () Bool)

(assert (=> b!145286 (= e!94657 (ite (= (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2735 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2735 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!46253 c!27528) b!145285))

(assert (= (and d!46253 (not c!27528)) b!145286))

(assert (=> b!145285 m!174417))

(assert (=> b!145285 m!174429))

(assert (=> d!46127 d!46253))

(declare-fun d!46255 () Bool)

(assert (=> d!46255 (= (validMask!0 (mask!7352 (v!3320 (underlying!488 thiss!992)))) (and (or (= (mask!7352 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000111) (= (mask!7352 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000001111) (= (mask!7352 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000011111) (= (mask!7352 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000111111) (= (mask!7352 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000001111111) (= (mask!7352 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000011111111) (= (mask!7352 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000111111111) (= (mask!7352 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000001111111111) (= (mask!7352 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000011111111111) (= (mask!7352 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000111111111111) (= (mask!7352 (v!3320 (underlying!488 thiss!992))) #b00000000000000000001111111111111) (= (mask!7352 (v!3320 (underlying!488 thiss!992))) #b00000000000000000011111111111111) (= (mask!7352 (v!3320 (underlying!488 thiss!992))) #b00000000000000000111111111111111) (= (mask!7352 (v!3320 (underlying!488 thiss!992))) #b00000000000000001111111111111111) (= (mask!7352 (v!3320 (underlying!488 thiss!992))) #b00000000000000011111111111111111) (= (mask!7352 (v!3320 (underlying!488 thiss!992))) #b00000000000000111111111111111111) (= (mask!7352 (v!3320 (underlying!488 thiss!992))) #b00000000000001111111111111111111) (= (mask!7352 (v!3320 (underlying!488 thiss!992))) #b00000000000011111111111111111111) (= (mask!7352 (v!3320 (underlying!488 thiss!992))) #b00000000000111111111111111111111) (= (mask!7352 (v!3320 (underlying!488 thiss!992))) #b00000000001111111111111111111111) (= (mask!7352 (v!3320 (underlying!488 thiss!992))) #b00000000011111111111111111111111) (= (mask!7352 (v!3320 (underlying!488 thiss!992))) #b00000000111111111111111111111111) (= (mask!7352 (v!3320 (underlying!488 thiss!992))) #b00000001111111111111111111111111) (= (mask!7352 (v!3320 (underlying!488 thiss!992))) #b00000011111111111111111111111111) (= (mask!7352 (v!3320 (underlying!488 thiss!992))) #b00000111111111111111111111111111) (= (mask!7352 (v!3320 (underlying!488 thiss!992))) #b00001111111111111111111111111111) (= (mask!7352 (v!3320 (underlying!488 thiss!992))) #b00011111111111111111111111111111) (= (mask!7352 (v!3320 (underlying!488 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7352 (v!3320 (underlying!488 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> d!46127 d!46255))

(declare-fun d!46257 () Bool)

(assert (=> d!46257 (= (+!176 (getCurrentListMap!537 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)) (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!537 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) lt!76136 (zeroValue!2834 newMap!16) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76428 () Unit!4574)

(declare-fun choose!904 (array!4921 array!4923 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 V!3577 Int) Unit!4574)

(assert (=> d!46257 (= lt!76428 (choose!904 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) lt!76136 (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2988 newMap!16)))))

(assert (=> d!46257 (validMask!0 (mask!7352 newMap!16))))

(assert (=> d!46257 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!68 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) lt!76136 (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2988 newMap!16)) lt!76428)))

(declare-fun bs!6126 () Bool)

(assert (= bs!6126 d!46257))

(assert (=> bs!6126 m!174583))

(assert (=> bs!6126 m!174453))

(declare-fun m!175197 () Bool)

(assert (=> bs!6126 m!175197))

(assert (=> bs!6126 m!174583))

(declare-fun m!175199 () Bool)

(assert (=> bs!6126 m!175199))

(assert (=> bs!6126 m!174753))

(assert (=> bs!6126 m!174453))

(declare-fun m!175201 () Bool)

(assert (=> bs!6126 m!175201))

(assert (=> b!144960 d!46257))

(declare-fun d!46259 () Bool)

(declare-fun e!94658 () Bool)

(assert (=> d!46259 e!94658))

(declare-fun res!69191 () Bool)

(assert (=> d!46259 (=> res!69191 e!94658)))

(declare-fun lt!76432 () Bool)

(assert (=> d!46259 (= res!69191 (not lt!76432))))

(declare-fun lt!76430 () Bool)

(assert (=> d!46259 (= lt!76432 lt!76430)))

(declare-fun lt!76429 () Unit!4574)

(declare-fun e!94659 () Unit!4574)

(assert (=> d!46259 (= lt!76429 e!94659)))

(declare-fun c!27529 () Bool)

(assert (=> d!46259 (= c!27529 lt!76430)))

(assert (=> d!46259 (= lt!76430 (containsKey!183 (toList!865 lt!76053) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!46259 (= (contains!918 lt!76053 #b1000000000000000000000000000000000000000000000000000000000000000) lt!76432)))

(declare-fun b!145287 () Bool)

(declare-fun lt!76431 () Unit!4574)

(assert (=> b!145287 (= e!94659 lt!76431)))

(assert (=> b!145287 (= lt!76431 (lemmaContainsKeyImpliesGetValueByKeyDefined!131 (toList!865 lt!76053) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!145287 (isDefined!132 (getValueByKey!180 (toList!865 lt!76053) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145288 () Bool)

(declare-fun Unit!4591 () Unit!4574)

(assert (=> b!145288 (= e!94659 Unit!4591)))

(declare-fun b!145289 () Bool)

(assert (=> b!145289 (= e!94658 (isDefined!132 (getValueByKey!180 (toList!865 lt!76053) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!46259 c!27529) b!145287))

(assert (= (and d!46259 (not c!27529)) b!145288))

(assert (= (and d!46259 (not res!69191)) b!145289))

(declare-fun m!175203 () Bool)

(assert (=> d!46259 m!175203))

(declare-fun m!175205 () Bool)

(assert (=> b!145287 m!175205))

(declare-fun m!175207 () Bool)

(assert (=> b!145287 m!175207))

(assert (=> b!145287 m!175207))

(declare-fun m!175209 () Bool)

(assert (=> b!145287 m!175209))

(assert (=> b!145289 m!175207))

(assert (=> b!145289 m!175207))

(assert (=> b!145289 m!175209))

(assert (=> bm!16100 d!46259))

(declare-fun d!46261 () Bool)

(declare-fun e!94660 () Bool)

(assert (=> d!46261 e!94660))

(declare-fun res!69192 () Bool)

(assert (=> d!46261 (=> (not res!69192) (not e!94660))))

(declare-fun lt!76436 () ListLongMap!1699)

(assert (=> d!46261 (= res!69192 (contains!918 lt!76436 (_1!1336 (tuple2!2651 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!76434 () List!1736)

(assert (=> d!46261 (= lt!76436 (ListLongMap!1700 lt!76434))))

(declare-fun lt!76435 () Unit!4574)

(declare-fun lt!76433 () Unit!4574)

(assert (=> d!46261 (= lt!76435 lt!76433)))

(assert (=> d!46261 (= (getValueByKey!180 lt!76434 (_1!1336 (tuple2!2651 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!185 (_2!1336 (tuple2!2651 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!46261 (= lt!76433 (lemmaContainsTupThenGetReturnValue!94 lt!76434 (_1!1336 (tuple2!2651 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1336 (tuple2!2651 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!46261 (= lt!76434 (insertStrictlySorted!97 (toList!865 call!16166) (_1!1336 (tuple2!2651 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1336 (tuple2!2651 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!46261 (= (+!176 call!16166 (tuple2!2651 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!76436)))

(declare-fun b!145290 () Bool)

(declare-fun res!69193 () Bool)

(assert (=> b!145290 (=> (not res!69193) (not e!94660))))

(assert (=> b!145290 (= res!69193 (= (getValueByKey!180 (toList!865 lt!76436) (_1!1336 (tuple2!2651 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!185 (_2!1336 (tuple2!2651 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!145291 () Bool)

(assert (=> b!145291 (= e!94660 (contains!921 (toList!865 lt!76436) (tuple2!2651 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!46261 res!69192) b!145290))

(assert (= (and b!145290 res!69193) b!145291))

(declare-fun m!175211 () Bool)

(assert (=> d!46261 m!175211))

(declare-fun m!175213 () Bool)

(assert (=> d!46261 m!175213))

(declare-fun m!175215 () Bool)

(assert (=> d!46261 m!175215))

(declare-fun m!175217 () Bool)

(assert (=> d!46261 m!175217))

(declare-fun m!175219 () Bool)

(assert (=> b!145290 m!175219))

(declare-fun m!175221 () Bool)

(assert (=> b!145291 m!175221))

(assert (=> b!144930 d!46261))

(assert (=> b!144835 d!46237))

(assert (=> b!144835 d!46239))

(assert (=> d!46131 d!46255))

(declare-fun b!145292 () Bool)

(declare-fun e!94663 () Bool)

(declare-fun call!16222 () Bool)

(assert (=> b!145292 (= e!94663 call!16222)))

(declare-fun b!145294 () Bool)

(declare-fun e!94664 () Bool)

(declare-fun e!94661 () Bool)

(assert (=> b!145294 (= e!94664 e!94661)))

(declare-fun res!69196 () Bool)

(assert (=> b!145294 (=> (not res!69196) (not e!94661))))

(declare-fun e!94662 () Bool)

(assert (=> b!145294 (= res!69196 (not e!94662))))

(declare-fun res!69194 () Bool)

(assert (=> b!145294 (=> (not res!69194) (not e!94662))))

(assert (=> b!145294 (= res!69194 (validKeyInArray!0 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!145295 () Bool)

(assert (=> b!145295 (= e!94663 call!16222)))

(declare-fun c!27530 () Bool)

(declare-fun bm!16219 () Bool)

(assert (=> bm!16219 (= call!16222 (arrayNoDuplicates!0 (_keys!4755 (v!3320 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!27530 (Cons!1731 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (ite c!27402 (Cons!1731 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) lt!75945) lt!75945)) (ite c!27402 (Cons!1731 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) lt!75945) lt!75945))))))

(declare-fun b!145296 () Bool)

(assert (=> b!145296 (= e!94661 e!94663)))

(assert (=> b!145296 (= c!27530 (validKeyInArray!0 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!145293 () Bool)

(assert (=> b!145293 (= e!94662 (contains!917 (ite c!27402 (Cons!1731 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) lt!75945) lt!75945) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun d!46263 () Bool)

(declare-fun res!69195 () Bool)

(assert (=> d!46263 (=> res!69195 e!94664)))

(assert (=> d!46263 (= res!69195 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2599 (_keys!4755 (v!3320 (underlying!488 thiss!992))))))))

(assert (=> d!46263 (= (arrayNoDuplicates!0 (_keys!4755 (v!3320 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (ite c!27402 (Cons!1731 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) lt!75945) lt!75945)) e!94664)))

(assert (= (and d!46263 (not res!69195)) b!145294))

(assert (= (and b!145294 res!69194) b!145293))

(assert (= (and b!145294 res!69196) b!145296))

(assert (= (and b!145296 c!27530) b!145292))

(assert (= (and b!145296 (not c!27530)) b!145295))

(assert (= (or b!145292 b!145295) bm!16219))

(assert (=> b!145294 m!175185))

(assert (=> b!145294 m!175185))

(declare-fun m!175223 () Bool)

(assert (=> b!145294 m!175223))

(assert (=> bm!16219 m!175185))

(declare-fun m!175225 () Bool)

(assert (=> bm!16219 m!175225))

(assert (=> b!145296 m!175185))

(assert (=> b!145296 m!175185))

(assert (=> b!145296 m!175223))

(assert (=> b!145293 m!175185))

(assert (=> b!145293 m!175185))

(declare-fun m!175227 () Bool)

(assert (=> b!145293 m!175227))

(assert (=> bm!16101 d!46263))

(declare-fun d!46265 () Bool)

(declare-fun res!69197 () Bool)

(declare-fun e!94665 () Bool)

(assert (=> d!46265 (=> (not res!69197) (not e!94665))))

(assert (=> d!46265 (= res!69197 (simpleValid!99 (v!3320 (underlying!488 thiss!992))))))

(assert (=> d!46265 (= (valid!580 (v!3320 (underlying!488 thiss!992))) e!94665)))

(declare-fun b!145297 () Bool)

(declare-fun res!69198 () Bool)

(assert (=> b!145297 (=> (not res!69198) (not e!94665))))

(assert (=> b!145297 (= res!69198 (= (arrayCountValidKeys!0 (_keys!4755 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000000 (size!2599 (_keys!4755 (v!3320 (underlying!488 thiss!992))))) (_size!633 (v!3320 (underlying!488 thiss!992)))))))

(declare-fun b!145298 () Bool)

(declare-fun res!69199 () Bool)

(assert (=> b!145298 (=> (not res!69199) (not e!94665))))

(assert (=> b!145298 (= res!69199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4755 (v!3320 (underlying!488 thiss!992))) (mask!7352 (v!3320 (underlying!488 thiss!992)))))))

(declare-fun b!145299 () Bool)

(assert (=> b!145299 (= e!94665 (arrayNoDuplicates!0 (_keys!4755 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000000 Nil!1732))))

(assert (= (and d!46265 res!69197) b!145297))

(assert (= (and b!145297 res!69198) b!145298))

(assert (= (and b!145298 res!69199) b!145299))

(declare-fun m!175229 () Bool)

(assert (=> d!46265 m!175229))

(declare-fun m!175231 () Bool)

(assert (=> b!145297 m!175231))

(declare-fun m!175233 () Bool)

(assert (=> b!145298 m!175233))

(declare-fun m!175235 () Bool)

(assert (=> b!145299 m!175235))

(assert (=> d!46133 d!46265))

(declare-fun d!46267 () Bool)

(declare-fun e!94666 () Bool)

(assert (=> d!46267 e!94666))

(declare-fun res!69200 () Bool)

(assert (=> d!46267 (=> (not res!69200) (not e!94666))))

(declare-fun lt!76440 () ListLongMap!1699)

(assert (=> d!46267 (= res!69200 (contains!918 lt!76440 (_1!1336 (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3320 (underlying!488 thiss!992)))))))))

(declare-fun lt!76438 () List!1736)

(assert (=> d!46267 (= lt!76440 (ListLongMap!1700 lt!76438))))

(declare-fun lt!76439 () Unit!4574)

(declare-fun lt!76437 () Unit!4574)

(assert (=> d!46267 (= lt!76439 lt!76437)))

(assert (=> d!46267 (= (getValueByKey!180 lt!76438 (_1!1336 (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3320 (underlying!488 thiss!992)))))) (Some!185 (_2!1336 (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3320 (underlying!488 thiss!992)))))))))

(assert (=> d!46267 (= lt!76437 (lemmaContainsTupThenGetReturnValue!94 lt!76438 (_1!1336 (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3320 (underlying!488 thiss!992))))) (_2!1336 (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3320 (underlying!488 thiss!992)))))))))

(assert (=> d!46267 (= lt!76438 (insertStrictlySorted!97 (toList!865 call!16098) (_1!1336 (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3320 (underlying!488 thiss!992))))) (_2!1336 (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3320 (underlying!488 thiss!992)))))))))

(assert (=> d!46267 (= (+!176 call!16098 (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3320 (underlying!488 thiss!992))))) lt!76440)))

(declare-fun b!145300 () Bool)

(declare-fun res!69201 () Bool)

(assert (=> b!145300 (=> (not res!69201) (not e!94666))))

(assert (=> b!145300 (= res!69201 (= (getValueByKey!180 (toList!865 lt!76440) (_1!1336 (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3320 (underlying!488 thiss!992)))))) (Some!185 (_2!1336 (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3320 (underlying!488 thiss!992))))))))))

(declare-fun b!145301 () Bool)

(assert (=> b!145301 (= e!94666 (contains!921 (toList!865 lt!76440) (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3320 (underlying!488 thiss!992))))))))

(assert (= (and d!46267 res!69200) b!145300))

(assert (= (and b!145300 res!69201) b!145301))

(declare-fun m!175237 () Bool)

(assert (=> d!46267 m!175237))

(declare-fun m!175239 () Bool)

(assert (=> d!46267 m!175239))

(declare-fun m!175241 () Bool)

(assert (=> d!46267 m!175241))

(declare-fun m!175243 () Bool)

(assert (=> d!46267 m!175243))

(declare-fun m!175245 () Bool)

(assert (=> b!145300 m!175245))

(declare-fun m!175247 () Bool)

(assert (=> b!145301 m!175247))

(assert (=> b!144789 d!46267))

(assert (=> b!144743 d!46125))

(assert (=> b!144822 d!46175))

(assert (=> d!46135 d!46225))

(declare-fun d!46269 () Bool)

(assert (=> d!46269 (= (map!1441 (ite c!27436 newMap!16 (_2!1337 lt!76137))) (getCurrentListMap!537 (_keys!4755 (ite c!27436 newMap!16 (_2!1337 lt!76137))) (_values!2971 (ite c!27436 newMap!16 (_2!1337 lt!76137))) (mask!7352 (ite c!27436 newMap!16 (_2!1337 lt!76137))) (extraKeys!2735 (ite c!27436 newMap!16 (_2!1337 lt!76137))) (zeroValue!2834 (ite c!27436 newMap!16 (_2!1337 lt!76137))) (minValue!2834 (ite c!27436 newMap!16 (_2!1337 lt!76137))) #b00000000000000000000000000000000 (defaultEntry!2988 (ite c!27436 newMap!16 (_2!1337 lt!76137)))))))

(declare-fun bs!6127 () Bool)

(assert (= bs!6127 d!46269))

(declare-fun m!175249 () Bool)

(assert (=> bs!6127 m!175249))

(assert (=> bm!16165 d!46269))

(declare-fun d!46271 () Bool)

(assert (=> d!46271 (= (get!1554 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3319 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (=> b!144966 d!46271))

(assert (=> b!144730 d!46245))

(declare-fun d!46273 () Bool)

(assert (=> d!46273 (= (apply!123 lt!76053 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1556 (getValueByKey!180 (toList!865 lt!76053) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6128 () Bool)

(assert (= bs!6128 d!46273))

(declare-fun m!175251 () Bool)

(assert (=> bs!6128 m!175251))

(assert (=> bs!6128 m!175251))

(declare-fun m!175253 () Bool)

(assert (=> bs!6128 m!175253))

(assert (=> b!144793 d!46273))

(declare-fun d!46275 () Bool)

(assert (=> d!46275 (= (+!176 (getCurrentListMap!537 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)) (tuple2!2651 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!537 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) lt!76152 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76443 () Unit!4574)

(declare-fun choose!905 (array!4921 array!4923 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 V!3577 Int) Unit!4574)

(assert (=> d!46275 (= lt!76443 (choose!905 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) lt!76152 (zeroValue!2834 newMap!16) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2834 newMap!16) (defaultEntry!2988 newMap!16)))))

(assert (=> d!46275 (validMask!0 (mask!7352 newMap!16))))

(assert (=> d!46275 (= (lemmaChangeZeroKeyThenAddPairToListMap!68 (_keys!4755 newMap!16) (_values!2971 newMap!16) (mask!7352 newMap!16) (extraKeys!2735 newMap!16) lt!76152 (zeroValue!2834 newMap!16) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2834 newMap!16) (defaultEntry!2988 newMap!16)) lt!76443)))

(declare-fun bs!6129 () Bool)

(assert (= bs!6129 d!46275))

(assert (=> bs!6129 m!174583))

(declare-fun m!175255 () Bool)

(assert (=> bs!6129 m!175255))

(assert (=> bs!6129 m!174583))

(assert (=> bs!6129 m!174453))

(declare-fun m!175257 () Bool)

(assert (=> bs!6129 m!175257))

(assert (=> bs!6129 m!174753))

(assert (=> bs!6129 m!174453))

(declare-fun m!175259 () Bool)

(assert (=> bs!6129 m!175259))

(assert (=> b!144935 d!46275))

(declare-fun d!46277 () Bool)

(declare-fun e!94667 () Bool)

(assert (=> d!46277 e!94667))

(declare-fun res!69202 () Bool)

(assert (=> d!46277 (=> res!69202 e!94667)))

(declare-fun lt!76447 () Bool)

(assert (=> d!46277 (= res!69202 (not lt!76447))))

(declare-fun lt!76445 () Bool)

(assert (=> d!46277 (= lt!76447 lt!76445)))

(declare-fun lt!76444 () Unit!4574)

(declare-fun e!94668 () Unit!4574)

(assert (=> d!46277 (= lt!76444 e!94668)))

(declare-fun c!27531 () Bool)

(assert (=> d!46277 (= c!27531 lt!76445)))

(assert (=> d!46277 (= lt!76445 (containsKey!183 (toList!865 lt!76053) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!46277 (= (contains!918 lt!76053 #b0000000000000000000000000000000000000000000000000000000000000000) lt!76447)))

(declare-fun b!145302 () Bool)

(declare-fun lt!76446 () Unit!4574)

(assert (=> b!145302 (= e!94668 lt!76446)))

(assert (=> b!145302 (= lt!76446 (lemmaContainsKeyImpliesGetValueByKeyDefined!131 (toList!865 lt!76053) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!145302 (isDefined!132 (getValueByKey!180 (toList!865 lt!76053) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145303 () Bool)

(declare-fun Unit!4592 () Unit!4574)

(assert (=> b!145303 (= e!94668 Unit!4592)))

(declare-fun b!145304 () Bool)

(assert (=> b!145304 (= e!94667 (isDefined!132 (getValueByKey!180 (toList!865 lt!76053) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!46277 c!27531) b!145302))

(assert (= (and d!46277 (not c!27531)) b!145303))

(assert (= (and d!46277 (not res!69202)) b!145304))

(declare-fun m!175261 () Bool)

(assert (=> d!46277 m!175261))

(declare-fun m!175263 () Bool)

(assert (=> b!145302 m!175263))

(assert (=> b!145302 m!175251))

(assert (=> b!145302 m!175251))

(declare-fun m!175265 () Bool)

(assert (=> b!145302 m!175265))

(assert (=> b!145304 m!175251))

(assert (=> b!145304 m!175251))

(assert (=> b!145304 m!175265))

(assert (=> bm!16095 d!46277))

(declare-fun d!46279 () Bool)

(declare-fun res!69203 () Bool)

(declare-fun e!94669 () Bool)

(assert (=> d!46279 (=> (not res!69203) (not e!94669))))

(assert (=> d!46279 (= res!69203 (simpleValid!99 (_2!1337 lt!76137)))))

(assert (=> d!46279 (= (valid!580 (_2!1337 lt!76137)) e!94669)))

(declare-fun b!145305 () Bool)

(declare-fun res!69204 () Bool)

(assert (=> b!145305 (=> (not res!69204) (not e!94669))))

(assert (=> b!145305 (= res!69204 (= (arrayCountValidKeys!0 (_keys!4755 (_2!1337 lt!76137)) #b00000000000000000000000000000000 (size!2599 (_keys!4755 (_2!1337 lt!76137)))) (_size!633 (_2!1337 lt!76137))))))

(declare-fun b!145306 () Bool)

(declare-fun res!69205 () Bool)

(assert (=> b!145306 (=> (not res!69205) (not e!94669))))

(assert (=> b!145306 (= res!69205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4755 (_2!1337 lt!76137)) (mask!7352 (_2!1337 lt!76137))))))

(declare-fun b!145307 () Bool)

(assert (=> b!145307 (= e!94669 (arrayNoDuplicates!0 (_keys!4755 (_2!1337 lt!76137)) #b00000000000000000000000000000000 Nil!1732))))

(assert (= (and d!46279 res!69203) b!145305))

(assert (= (and b!145305 res!69204) b!145306))

(assert (= (and b!145306 res!69205) b!145307))

(declare-fun m!175267 () Bool)

(assert (=> d!46279 m!175267))

(declare-fun m!175269 () Bool)

(assert (=> b!145305 m!175269))

(declare-fun m!175271 () Bool)

(assert (=> b!145306 m!175271))

(declare-fun m!175273 () Bool)

(assert (=> b!145307 m!175273))

(assert (=> d!46149 d!46279))

(assert (=> d!46149 d!46119))

(declare-fun b!145308 () Bool)

(declare-fun e!94672 () Bool)

(declare-fun call!16223 () Bool)

(assert (=> b!145308 (= e!94672 call!16223)))

(declare-fun b!145310 () Bool)

(declare-fun e!94673 () Bool)

(declare-fun e!94670 () Bool)

(assert (=> b!145310 (= e!94673 e!94670)))

(declare-fun res!69208 () Bool)

(assert (=> b!145310 (=> (not res!69208) (not e!94670))))

(declare-fun e!94671 () Bool)

(assert (=> b!145310 (= res!69208 (not e!94671))))

(declare-fun res!69206 () Bool)

(assert (=> b!145310 (=> (not res!69206) (not e!94671))))

(assert (=> b!145310 (= res!69206 (validKeyInArray!0 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!145311 () Bool)

(assert (=> b!145311 (= e!94672 call!16223)))

(declare-fun bm!16220 () Bool)

(declare-fun c!27532 () Bool)

(assert (=> bm!16220 (= call!16223 (arrayNoDuplicates!0 (_keys!4755 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!27532 (Cons!1731 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000) Nil!1732) Nil!1732)))))

(declare-fun b!145312 () Bool)

(assert (=> b!145312 (= e!94670 e!94672)))

(assert (=> b!145312 (= c!27532 (validKeyInArray!0 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!145309 () Bool)

(assert (=> b!145309 (= e!94671 (contains!917 Nil!1732 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!46281 () Bool)

(declare-fun res!69207 () Bool)

(assert (=> d!46281 (=> res!69207 e!94673)))

(assert (=> d!46281 (= res!69207 (bvsge #b00000000000000000000000000000000 (size!2599 (_keys!4755 newMap!16))))))

(assert (=> d!46281 (= (arrayNoDuplicates!0 (_keys!4755 newMap!16) #b00000000000000000000000000000000 Nil!1732) e!94673)))

(assert (= (and d!46281 (not res!69207)) b!145310))

(assert (= (and b!145310 res!69206) b!145309))

(assert (= (and b!145310 res!69208) b!145312))

(assert (= (and b!145312 c!27532) b!145308))

(assert (= (and b!145312 (not c!27532)) b!145311))

(assert (= (or b!145308 b!145311) bm!16220))

(assert (=> b!145310 m!174781))

(assert (=> b!145310 m!174781))

(assert (=> b!145310 m!174791))

(assert (=> bm!16220 m!174781))

(declare-fun m!175275 () Bool)

(assert (=> bm!16220 m!175275))

(assert (=> b!145312 m!174781))

(assert (=> b!145312 m!174781))

(assert (=> b!145312 m!174791))

(assert (=> b!145309 m!174781))

(assert (=> b!145309 m!174781))

(declare-fun m!175277 () Bool)

(assert (=> b!145309 m!175277))

(assert (=> b!144717 d!46281))

(declare-fun d!46283 () Bool)

(assert (=> d!46283 (= (apply!123 lt!76053 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1556 (getValueByKey!180 (toList!865 lt!76053) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6130 () Bool)

(assert (= bs!6130 d!46283))

(assert (=> bs!6130 m!175207))

(assert (=> bs!6130 m!175207))

(declare-fun m!175279 () Bool)

(assert (=> bs!6130 m!175279))

(assert (=> b!144798 d!46283))

(declare-fun b!145321 () Bool)

(declare-fun e!94678 () (_ BitVec 32))

(declare-fun call!16226 () (_ BitVec 32))

(assert (=> b!145321 (= e!94678 (bvadd #b00000000000000000000000000000001 call!16226))))

(declare-fun b!145322 () Bool)

(declare-fun e!94679 () (_ BitVec 32))

(assert (=> b!145322 (= e!94679 e!94678)))

(declare-fun c!27538 () Bool)

(assert (=> b!145322 (= c!27538 (validKeyInArray!0 (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!145323 () Bool)

(assert (=> b!145323 (= e!94679 #b00000000000000000000000000000000)))

(declare-fun bm!16223 () Bool)

(assert (=> bm!16223 (= call!16226 (arrayCountValidKeys!0 (_keys!4755 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2599 (_keys!4755 newMap!16))))))

(declare-fun b!145324 () Bool)

(assert (=> b!145324 (= e!94678 call!16226)))

(declare-fun d!46285 () Bool)

(declare-fun lt!76450 () (_ BitVec 32))

(assert (=> d!46285 (and (bvsge lt!76450 #b00000000000000000000000000000000) (bvsle lt!76450 (bvsub (size!2599 (_keys!4755 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!46285 (= lt!76450 e!94679)))

(declare-fun c!27537 () Bool)

(assert (=> d!46285 (= c!27537 (bvsge #b00000000000000000000000000000000 (size!2599 (_keys!4755 newMap!16))))))

(assert (=> d!46285 (and (bvsle #b00000000000000000000000000000000 (size!2599 (_keys!4755 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2599 (_keys!4755 newMap!16)) (size!2599 (_keys!4755 newMap!16))))))

(assert (=> d!46285 (= (arrayCountValidKeys!0 (_keys!4755 newMap!16) #b00000000000000000000000000000000 (size!2599 (_keys!4755 newMap!16))) lt!76450)))

(assert (= (and d!46285 c!27537) b!145323))

(assert (= (and d!46285 (not c!27537)) b!145322))

(assert (= (and b!145322 c!27538) b!145321))

(assert (= (and b!145322 (not c!27538)) b!145324))

(assert (= (or b!145321 b!145324) bm!16223))

(assert (=> b!145322 m!174781))

(assert (=> b!145322 m!174781))

(assert (=> b!145322 m!174791))

(declare-fun m!175281 () Bool)

(assert (=> bm!16223 m!175281))

(assert (=> b!144715 d!46285))

(declare-fun d!46287 () Bool)

(declare-fun lt!76451 () Bool)

(assert (=> d!46287 (= lt!76451 (select (content!142 (t!6368 lt!75945)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94680 () Bool)

(assert (=> d!46287 (= lt!76451 e!94680)))

(declare-fun res!69210 () Bool)

(assert (=> d!46287 (=> (not res!69210) (not e!94680))))

(assert (=> d!46287 (= res!69210 ((_ is Cons!1731) (t!6368 lt!75945)))))

(assert (=> d!46287 (= (contains!917 (t!6368 lt!75945) #b1000000000000000000000000000000000000000000000000000000000000000) lt!76451)))

(declare-fun b!145325 () Bool)

(declare-fun e!94681 () Bool)

(assert (=> b!145325 (= e!94680 e!94681)))

(declare-fun res!69209 () Bool)

(assert (=> b!145325 (=> res!69209 e!94681)))

(assert (=> b!145325 (= res!69209 (= (h!2339 (t!6368 lt!75945)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145326 () Bool)

(assert (=> b!145326 (= e!94681 (contains!917 (t!6368 (t!6368 lt!75945)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!46287 res!69210) b!145325))

(assert (= (and b!145325 (not res!69209)) b!145326))

(assert (=> d!46287 m!174897))

(declare-fun m!175283 () Bool)

(assert (=> d!46287 m!175283))

(declare-fun m!175285 () Bool)

(assert (=> b!145326 m!175285))

(assert (=> b!144813 d!46287))

(declare-fun d!46289 () Bool)

(declare-fun e!94682 () Bool)

(assert (=> d!46289 e!94682))

(declare-fun res!69211 () Bool)

(assert (=> d!46289 (=> (not res!69211) (not e!94682))))

(declare-fun lt!76455 () ListLongMap!1699)

(assert (=> d!46289 (= res!69211 (contains!918 lt!76455 (_1!1336 (ite c!27442 (ite c!27435 (tuple2!2651 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2651 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!76453 () List!1736)

(assert (=> d!46289 (= lt!76455 (ListLongMap!1700 lt!76453))))

(declare-fun lt!76454 () Unit!4574)

(declare-fun lt!76452 () Unit!4574)

(assert (=> d!46289 (= lt!76454 lt!76452)))

(assert (=> d!46289 (= (getValueByKey!180 lt!76453 (_1!1336 (ite c!27442 (ite c!27435 (tuple2!2651 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2651 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!185 (_2!1336 (ite c!27442 (ite c!27435 (tuple2!2651 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2651 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!46289 (= lt!76452 (lemmaContainsTupThenGetReturnValue!94 lt!76453 (_1!1336 (ite c!27442 (ite c!27435 (tuple2!2651 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2651 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1336 (ite c!27442 (ite c!27435 (tuple2!2651 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2651 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!46289 (= lt!76453 (insertStrictlySorted!97 (toList!865 e!94452) (_1!1336 (ite c!27442 (ite c!27435 (tuple2!2651 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2651 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1336 (ite c!27442 (ite c!27435 (tuple2!2651 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2651 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!46289 (= (+!176 e!94452 (ite c!27442 (ite c!27435 (tuple2!2651 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2651 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!76455)))

(declare-fun b!145327 () Bool)

(declare-fun res!69212 () Bool)

(assert (=> b!145327 (=> (not res!69212) (not e!94682))))

(assert (=> b!145327 (= res!69212 (= (getValueByKey!180 (toList!865 lt!76455) (_1!1336 (ite c!27442 (ite c!27435 (tuple2!2651 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2651 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!185 (_2!1336 (ite c!27442 (ite c!27435 (tuple2!2651 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2651 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!145328 () Bool)

(assert (=> b!145328 (= e!94682 (contains!921 (toList!865 lt!76455) (ite c!27442 (ite c!27435 (tuple2!2651 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2651 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1553 (select (arr!2325 (_values!2971 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!46289 res!69211) b!145327))

(assert (= (and b!145327 res!69212) b!145328))

(declare-fun m!175287 () Bool)

(assert (=> d!46289 m!175287))

(declare-fun m!175289 () Bool)

(assert (=> d!46289 m!175289))

(declare-fun m!175291 () Bool)

(assert (=> d!46289 m!175291))

(declare-fun m!175293 () Bool)

(assert (=> d!46289 m!175293))

(declare-fun m!175295 () Bool)

(assert (=> b!145327 m!175295))

(declare-fun m!175297 () Bool)

(assert (=> b!145328 m!175297))

(assert (=> bm!16171 d!46289))

(declare-fun d!46291 () Bool)

(declare-fun e!94683 () Bool)

(assert (=> d!46291 e!94683))

(declare-fun res!69213 () Bool)

(assert (=> d!46291 (=> (not res!69213) (not e!94683))))

(declare-fun lt!76459 () ListLongMap!1699)

(assert (=> d!46291 (= res!69213 (contains!918 lt!76459 (_1!1336 (ite (or c!27397 c!27399) (tuple2!2651 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2834 (v!3320 (underlying!488 thiss!992)))) (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3320 (underlying!488 thiss!992))))))))))

(declare-fun lt!76457 () List!1736)

(assert (=> d!46291 (= lt!76459 (ListLongMap!1700 lt!76457))))

(declare-fun lt!76458 () Unit!4574)

(declare-fun lt!76456 () Unit!4574)

(assert (=> d!46291 (= lt!76458 lt!76456)))

(assert (=> d!46291 (= (getValueByKey!180 lt!76457 (_1!1336 (ite (or c!27397 c!27399) (tuple2!2651 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2834 (v!3320 (underlying!488 thiss!992)))) (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3320 (underlying!488 thiss!992))))))) (Some!185 (_2!1336 (ite (or c!27397 c!27399) (tuple2!2651 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2834 (v!3320 (underlying!488 thiss!992)))) (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3320 (underlying!488 thiss!992))))))))))

(assert (=> d!46291 (= lt!76456 (lemmaContainsTupThenGetReturnValue!94 lt!76457 (_1!1336 (ite (or c!27397 c!27399) (tuple2!2651 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2834 (v!3320 (underlying!488 thiss!992)))) (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3320 (underlying!488 thiss!992)))))) (_2!1336 (ite (or c!27397 c!27399) (tuple2!2651 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2834 (v!3320 (underlying!488 thiss!992)))) (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3320 (underlying!488 thiss!992))))))))))

(assert (=> d!46291 (= lt!76457 (insertStrictlySorted!97 (toList!865 (ite c!27397 call!16102 (ite c!27399 call!16101 call!16103))) (_1!1336 (ite (or c!27397 c!27399) (tuple2!2651 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2834 (v!3320 (underlying!488 thiss!992)))) (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3320 (underlying!488 thiss!992)))))) (_2!1336 (ite (or c!27397 c!27399) (tuple2!2651 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2834 (v!3320 (underlying!488 thiss!992)))) (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3320 (underlying!488 thiss!992))))))))))

(assert (=> d!46291 (= (+!176 (ite c!27397 call!16102 (ite c!27399 call!16101 call!16103)) (ite (or c!27397 c!27399) (tuple2!2651 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2834 (v!3320 (underlying!488 thiss!992)))) (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3320 (underlying!488 thiss!992)))))) lt!76459)))

(declare-fun b!145329 () Bool)

(declare-fun res!69214 () Bool)

(assert (=> b!145329 (=> (not res!69214) (not e!94683))))

(assert (=> b!145329 (= res!69214 (= (getValueByKey!180 (toList!865 lt!76459) (_1!1336 (ite (or c!27397 c!27399) (tuple2!2651 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2834 (v!3320 (underlying!488 thiss!992)))) (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3320 (underlying!488 thiss!992))))))) (Some!185 (_2!1336 (ite (or c!27397 c!27399) (tuple2!2651 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2834 (v!3320 (underlying!488 thiss!992)))) (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3320 (underlying!488 thiss!992)))))))))))

(declare-fun b!145330 () Bool)

(assert (=> b!145330 (= e!94683 (contains!921 (toList!865 lt!76459) (ite (or c!27397 c!27399) (tuple2!2651 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2834 (v!3320 (underlying!488 thiss!992)))) (tuple2!2651 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3320 (underlying!488 thiss!992)))))))))

(assert (= (and d!46291 res!69213) b!145329))

(assert (= (and b!145329 res!69214) b!145330))

(declare-fun m!175299 () Bool)

(assert (=> d!46291 m!175299))

(declare-fun m!175301 () Bool)

(assert (=> d!46291 m!175301))

(declare-fun m!175303 () Bool)

(assert (=> d!46291 m!175303))

(declare-fun m!175305 () Bool)

(assert (=> d!46291 m!175305))

(declare-fun m!175307 () Bool)

(assert (=> b!145329 m!175307))

(declare-fun m!175309 () Bool)

(assert (=> b!145330 m!175309))

(assert (=> bm!16098 d!46291))

(declare-fun d!46293 () Bool)

(declare-fun res!69215 () Bool)

(declare-fun e!94684 () Bool)

(assert (=> d!46293 (=> res!69215 e!94684)))

(assert (=> d!46293 (= res!69215 (= (select (arr!2324 (_keys!4755 newMap!16)) #b00000000000000000000000000000000) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (=> d!46293 (= (arrayContainsKey!0 (_keys!4755 newMap!16) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) #b00000000000000000000000000000000) e!94684)))

(declare-fun b!145331 () Bool)

(declare-fun e!94685 () Bool)

(assert (=> b!145331 (= e!94684 e!94685)))

(declare-fun res!69216 () Bool)

(assert (=> b!145331 (=> (not res!69216) (not e!94685))))

(assert (=> b!145331 (= res!69216 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2599 (_keys!4755 newMap!16))))))

(declare-fun b!145332 () Bool)

(assert (=> b!145332 (= e!94685 (arrayContainsKey!0 (_keys!4755 newMap!16) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!46293 (not res!69215)) b!145331))

(assert (= (and b!145331 res!69216) b!145332))

(assert (=> d!46293 m!174781))

(assert (=> b!145332 m!174417))

(declare-fun m!175311 () Bool)

(assert (=> b!145332 m!175311))

(assert (=> bm!16157 d!46293))

(declare-fun b!145333 () Bool)

(declare-fun e!94688 () Bool)

(declare-fun call!16227 () Bool)

(assert (=> b!145333 (= e!94688 call!16227)))

(declare-fun b!145335 () Bool)

(declare-fun e!94689 () Bool)

(declare-fun e!94686 () Bool)

(assert (=> b!145335 (= e!94689 e!94686)))

(declare-fun res!69219 () Bool)

(assert (=> b!145335 (=> (not res!69219) (not e!94686))))

(declare-fun e!94687 () Bool)

(assert (=> b!145335 (= res!69219 (not e!94687))))

(declare-fun res!69217 () Bool)

(assert (=> b!145335 (=> (not res!69217) (not e!94687))))

(assert (=> b!145335 (= res!69217 (validKeyInArray!0 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!145336 () Bool)

(assert (=> b!145336 (= e!94688 call!16227)))

(declare-fun c!27539 () Bool)

(declare-fun bm!16224 () Bool)

(assert (=> bm!16224 (= call!16227 (arrayNoDuplicates!0 (_keys!4755 (v!3320 (underlying!488 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!27539 (Cons!1731 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!27380 (Cons!1731 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) Nil!1732) Nil!1732)) (ite c!27380 (Cons!1731 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) Nil!1732) Nil!1732))))))

(declare-fun b!145337 () Bool)

(assert (=> b!145337 (= e!94686 e!94688)))

(assert (=> b!145337 (= c!27539 (validKeyInArray!0 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!145334 () Bool)

(assert (=> b!145334 (= e!94687 (contains!917 (ite c!27380 (Cons!1731 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) Nil!1732) Nil!1732) (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun d!46295 () Bool)

(declare-fun res!69218 () Bool)

(assert (=> d!46295 (=> res!69218 e!94689)))

(assert (=> d!46295 (= res!69218 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2599 (_keys!4755 (v!3320 (underlying!488 thiss!992))))))))

(assert (=> d!46295 (= (arrayNoDuplicates!0 (_keys!4755 (v!3320 (underlying!488 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!27380 (Cons!1731 (select (arr!2324 (_keys!4755 (v!3320 (underlying!488 thiss!992)))) from!355) Nil!1732) Nil!1732)) e!94689)))

(assert (= (and d!46295 (not res!69218)) b!145335))

(assert (= (and b!145335 res!69217) b!145334))

(assert (= (and b!145335 res!69219) b!145337))

(assert (= (and b!145337 c!27539) b!145333))

(assert (= (and b!145337 (not c!27539)) b!145336))

(assert (= (or b!145333 b!145336) bm!16224))

(declare-fun m!175313 () Bool)

(assert (=> b!145335 m!175313))

(assert (=> b!145335 m!175313))

(declare-fun m!175315 () Bool)

(assert (=> b!145335 m!175315))

(assert (=> bm!16224 m!175313))

(declare-fun m!175317 () Bool)

(assert (=> bm!16224 m!175317))

(assert (=> b!145337 m!175313))

(assert (=> b!145337 m!175313))

(assert (=> b!145337 m!175315))

(assert (=> b!145334 m!175313))

(assert (=> b!145334 m!175313))

(declare-fun m!175319 () Bool)

(assert (=> b!145334 m!175319))

(assert (=> bm!16079 d!46295))

(declare-fun mapIsEmpty!4921 () Bool)

(declare-fun mapRes!4921 () Bool)

(assert (=> mapIsEmpty!4921 mapRes!4921))

(declare-fun condMapEmpty!4921 () Bool)

(declare-fun mapDefault!4921 () ValueCell!1130)

(assert (=> mapNonEmpty!4919 (= condMapEmpty!4921 (= mapRest!4919 ((as const (Array (_ BitVec 32) ValueCell!1130)) mapDefault!4921)))))

(declare-fun e!94691 () Bool)

(assert (=> mapNonEmpty!4919 (= tp!11705 (and e!94691 mapRes!4921))))

(declare-fun b!145339 () Bool)

(assert (=> b!145339 (= e!94691 tp_is_empty!2947)))

(declare-fun mapNonEmpty!4921 () Bool)

(declare-fun tp!11707 () Bool)

(declare-fun e!94690 () Bool)

(assert (=> mapNonEmpty!4921 (= mapRes!4921 (and tp!11707 e!94690))))

(declare-fun mapKey!4921 () (_ BitVec 32))

(declare-fun mapRest!4921 () (Array (_ BitVec 32) ValueCell!1130))

(declare-fun mapValue!4921 () ValueCell!1130)

(assert (=> mapNonEmpty!4921 (= mapRest!4919 (store mapRest!4921 mapKey!4921 mapValue!4921))))

(declare-fun b!145338 () Bool)

(assert (=> b!145338 (= e!94690 tp_is_empty!2947)))

(assert (= (and mapNonEmpty!4919 condMapEmpty!4921) mapIsEmpty!4921))

(assert (= (and mapNonEmpty!4919 (not condMapEmpty!4921)) mapNonEmpty!4921))

(assert (= (and mapNonEmpty!4921 ((_ is ValueCellFull!1130) mapValue!4921)) b!145338))

(assert (= (and mapNonEmpty!4919 ((_ is ValueCellFull!1130) mapDefault!4921)) b!145339))

(declare-fun m!175321 () Bool)

(assert (=> mapNonEmpty!4921 m!175321))

(declare-fun mapIsEmpty!4922 () Bool)

(declare-fun mapRes!4922 () Bool)

(assert (=> mapIsEmpty!4922 mapRes!4922))

(declare-fun condMapEmpty!4922 () Bool)

(declare-fun mapDefault!4922 () ValueCell!1130)

(assert (=> mapNonEmpty!4920 (= condMapEmpty!4922 (= mapRest!4920 ((as const (Array (_ BitVec 32) ValueCell!1130)) mapDefault!4922)))))

(declare-fun e!94693 () Bool)

(assert (=> mapNonEmpty!4920 (= tp!11706 (and e!94693 mapRes!4922))))

(declare-fun b!145341 () Bool)

(assert (=> b!145341 (= e!94693 tp_is_empty!2947)))

(declare-fun mapNonEmpty!4922 () Bool)

(declare-fun tp!11708 () Bool)

(declare-fun e!94692 () Bool)

(assert (=> mapNonEmpty!4922 (= mapRes!4922 (and tp!11708 e!94692))))

(declare-fun mapKey!4922 () (_ BitVec 32))

(declare-fun mapRest!4922 () (Array (_ BitVec 32) ValueCell!1130))

(declare-fun mapValue!4922 () ValueCell!1130)

(assert (=> mapNonEmpty!4922 (= mapRest!4920 (store mapRest!4922 mapKey!4922 mapValue!4922))))

(declare-fun b!145340 () Bool)

(assert (=> b!145340 (= e!94692 tp_is_empty!2947)))

(assert (= (and mapNonEmpty!4920 condMapEmpty!4922) mapIsEmpty!4922))

(assert (= (and mapNonEmpty!4920 (not condMapEmpty!4922)) mapNonEmpty!4922))

(assert (= (and mapNonEmpty!4922 ((_ is ValueCellFull!1130) mapValue!4922)) b!145340))

(assert (= (and mapNonEmpty!4920 ((_ is ValueCellFull!1130) mapDefault!4922)) b!145341))

(declare-fun m!175323 () Bool)

(assert (=> mapNonEmpty!4922 m!175323))

(declare-fun b_lambda!6523 () Bool)

(assert (= b_lambda!6517 (or (and b!144577 b_free!3061 (= (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) (defaultEntry!2988 newMap!16))) (and b!144581 b_free!3063) b_lambda!6523)))

(declare-fun b_lambda!6525 () Bool)

(assert (= b_lambda!6513 (or (and b!144577 b_free!3061 (= (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) (defaultEntry!2988 newMap!16))) (and b!144581 b_free!3063) b_lambda!6525)))

(declare-fun b_lambda!6527 () Bool)

(assert (= b_lambda!6521 (or (and b!144577 b_free!3061) (and b!144581 b_free!3063 (= (defaultEntry!2988 newMap!16) (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))))) b_lambda!6527)))

(declare-fun b_lambda!6529 () Bool)

(assert (= b_lambda!6519 (or (and b!144577 b_free!3061) (and b!144581 b_free!3063 (= (defaultEntry!2988 newMap!16) (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))))) b_lambda!6529)))

(declare-fun b_lambda!6531 () Bool)

(assert (= b_lambda!6515 (or (and b!144577 b_free!3061 (= (defaultEntry!2988 (v!3320 (underlying!488 thiss!992))) (defaultEntry!2988 newMap!16))) (and b!144581 b_free!3063) b_lambda!6531)))

(check-sat (not d!46171) (not d!46205) (not b!145290) (not b!145297) (not b!145166) (not b!145059) (not b!145042) (not b!145128) (not bm!16187) (not b!145050) (not d!46247) (not d!46209) (not b!144982) (not bm!16214) (not b!145006) (not bm!16194) (not b!145011) (not b!145330) (not b!145285) (not b!145165) (not bm!16189) (not b!145334) (not b!145178) (not b!145298) (not b!145302) (not b!145304) (not b!145299) (not d!46219) (not b!145028) (not b!145216) (not d!46287) (not b!145073) (not b!145307) (not b!145058) (not d!46195) (not b!145068) (not d!46261) (not b_lambda!6527) (not b!145287) (not b!145056) (not b!145031) (not d!46197) (not b!145159) (not d!46237) (not b!145052) (not b!145305) (not b!145012) (not b!145180) (not d!46179) (not d!46215) (not b!145306) (not d!46167) (not b_lambda!6525) (not mapNonEmpty!4921) (not d!46229) (not b!145310) (not b!145018) (not b!145276) (not b!145035) (not d!46291) (not b!144979) (not b!145172) (not b!145129) (not b!145312) (not b!145063) (not b!145301) (not d!46289) (not d!46267) (not b!145225) (not d!46191) (not d!46249) (not bm!16200) (not b!145300) (not b!145249) (not b_lambda!6511) (not bm!16219) (not d!46273) (not d!46163) (not b!145215) (not d!46243) (not b!145026) (not b!145309) (not b!145003) (not b!145033) (not b!145293) (not d!46235) (not b!145168) (not b!145000) (not b!145230) (not b!145157) (not b!145117) (not b_lambda!6523) (not b!145021) (not b!145075) (not d!46283) (not d!46155) (not b!145047) (not b!145294) (not b!145126) (not d!46257) (not bm!16215) (not b!145248) (not d!46199) (not b!145111) (not b!145156) (not bm!16224) (not b!145332) (not d!46157) (not b!145329) (not d!46161) (not bm!16203) (not bm!16176) (not b!145266) (not d!46207) (not d!46153) (not d!46279) (not b!145107) (not d!46193) (not b!145119) (not b!145112) (not b!145171) (not d!46183) (not bm!16192) (not b!145155) (not b!145009) (not b!145110) (not b!145327) (not bm!16223) (not d!46169) (not b!145161) (not b!145036) (not d!46211) (not d!46227) (not b!145164) (not b!145236) (not d!46269) (not bm!16182) (not b!145227) (not b_lambda!6531) (not b_next!3061) (not bm!16218) (not b!145065) (not bm!16220) (not bm!16183) (not b!145222) (not b!145296) (not b!145070) (not b_lambda!6529) (not d!46277) (not d!46251) (not b!145001) (not d!46187) (not d!46189) (not d!46259) (not b!145040) (not bm!16212) (not b!145337) (not d!46203) (not d!46165) (not b!145252) (not b!145328) (not b!145023) b_and!9059 (not b_lambda!6507) (not b!145335) (not bm!16185) (not b!145322) (not b!145120) (not bm!16178) (not b!145108) (not b!145154) (not d!46201) (not b!145326) (not b!145291) (not b!145118) (not b!145016) (not b!145263) (not bm!16180) (not d!46213) (not d!46173) (not bm!16190) b_and!9057 (not d!46159) (not b!145127) (not b!145045) (not b_next!3063) tp_is_empty!2947 (not b!145277) (not bm!16199) (not d!46275) (not b!144980) (not bm!16175) (not b!145280) (not mapNonEmpty!4922) (not d!46217) (not d!46231) (not b!145289) (not d!46265))
(check-sat b_and!9057 b_and!9059 (not b_next!3061) (not b_next!3063))
