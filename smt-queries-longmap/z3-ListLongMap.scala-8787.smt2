; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106910 () Bool)

(assert start!106910)

(declare-fun b!1268096 () Bool)

(declare-fun e!722524 () Bool)

(declare-fun tp_is_empty!32637 () Bool)

(assert (=> b!1268096 (= e!722524 tp_is_empty!32637)))

(declare-fun b!1268097 () Bool)

(declare-fun res!844067 () Bool)

(declare-fun e!722522 () Bool)

(assert (=> b!1268097 (=> (not res!844067) (not e!722522))))

(declare-datatypes ((array!82540 0))(
  ( (array!82541 (arr!39811 (Array (_ BitVec 32) (_ BitVec 64))) (size!40347 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82540)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82540 (_ BitVec 32)) Bool)

(assert (=> b!1268097 (= res!844067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapNonEmpty!50524 () Bool)

(declare-fun mapRes!50524 () Bool)

(declare-fun tp!96703 () Bool)

(assert (=> mapNonEmpty!50524 (= mapRes!50524 (and tp!96703 e!722524))))

(declare-datatypes ((V!48709 0))(
  ( (V!48710 (val!16393 Int)) )
))
(declare-datatypes ((ValueCell!15465 0))(
  ( (ValueCellFull!15465 (v!19029 V!48709)) (EmptyCell!15465) )
))
(declare-datatypes ((array!82542 0))(
  ( (array!82543 (arr!39812 (Array (_ BitVec 32) ValueCell!15465)) (size!40348 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82542)

(declare-fun mapKey!50524 () (_ BitVec 32))

(declare-fun mapRest!50524 () (Array (_ BitVec 32) ValueCell!15465))

(declare-fun mapValue!50524 () ValueCell!15465)

(assert (=> mapNonEmpty!50524 (= (arr!39812 _values!1134) (store mapRest!50524 mapKey!50524 mapValue!50524))))

(declare-fun b!1268098 () Bool)

(declare-fun e!722521 () Bool)

(assert (=> b!1268098 (= e!722521 tp_is_empty!32637)))

(declare-fun b!1268099 () Bool)

(declare-fun res!844068 () Bool)

(assert (=> b!1268099 (=> (not res!844068) (not e!722522))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268099 (= res!844068 (and (= (size!40348 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40347 _keys!1364) (size!40348 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun res!844066 () Bool)

(assert (=> start!106910 (=> (not res!844066) (not e!722522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106910 (= res!844066 (validMask!0 mask!1730))))

(assert (=> start!106910 e!722522))

(declare-fun e!722523 () Bool)

(declare-fun array_inv!30299 (array!82542) Bool)

(assert (=> start!106910 (and (array_inv!30299 _values!1134) e!722523)))

(assert (=> start!106910 true))

(declare-fun array_inv!30300 (array!82540) Bool)

(assert (=> start!106910 (array_inv!30300 _keys!1364)))

(declare-fun b!1268095 () Bool)

(assert (=> b!1268095 (= e!722522 (bvsgt #b00000000000000000000000000000000 (size!40347 _keys!1364)))))

(declare-fun b!1268100 () Bool)

(assert (=> b!1268100 (= e!722523 (and e!722521 mapRes!50524))))

(declare-fun condMapEmpty!50524 () Bool)

(declare-fun mapDefault!50524 () ValueCell!15465)

(assert (=> b!1268100 (= condMapEmpty!50524 (= (arr!39812 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15465)) mapDefault!50524)))))

(declare-fun mapIsEmpty!50524 () Bool)

(assert (=> mapIsEmpty!50524 mapRes!50524))

(assert (= (and start!106910 res!844066) b!1268099))

(assert (= (and b!1268099 res!844068) b!1268097))

(assert (= (and b!1268097 res!844067) b!1268095))

(assert (= (and b!1268100 condMapEmpty!50524) mapIsEmpty!50524))

(assert (= (and b!1268100 (not condMapEmpty!50524)) mapNonEmpty!50524))

(get-info :version)

(assert (= (and mapNonEmpty!50524 ((_ is ValueCellFull!15465) mapValue!50524)) b!1268096))

(assert (= (and b!1268100 ((_ is ValueCellFull!15465) mapDefault!50524)) b!1268098))

(assert (= start!106910 b!1268100))

(declare-fun m!1167067 () Bool)

(assert (=> b!1268097 m!1167067))

(declare-fun m!1167069 () Bool)

(assert (=> mapNonEmpty!50524 m!1167069))

(declare-fun m!1167071 () Bool)

(assert (=> start!106910 m!1167071))

(declare-fun m!1167073 () Bool)

(assert (=> start!106910 m!1167073))

(declare-fun m!1167075 () Bool)

(assert (=> start!106910 m!1167075))

(check-sat (not start!106910) (not b!1268097) (not mapNonEmpty!50524) tp_is_empty!32637)
(check-sat)
(get-model)

(declare-fun d!139639 () Bool)

(assert (=> d!139639 (= (validMask!0 mask!1730) (and (or (= mask!1730 #b00000000000000000000000000000111) (= mask!1730 #b00000000000000000000000000001111) (= mask!1730 #b00000000000000000000000000011111) (= mask!1730 #b00000000000000000000000000111111) (= mask!1730 #b00000000000000000000000001111111) (= mask!1730 #b00000000000000000000000011111111) (= mask!1730 #b00000000000000000000000111111111) (= mask!1730 #b00000000000000000000001111111111) (= mask!1730 #b00000000000000000000011111111111) (= mask!1730 #b00000000000000000000111111111111) (= mask!1730 #b00000000000000000001111111111111) (= mask!1730 #b00000000000000000011111111111111) (= mask!1730 #b00000000000000000111111111111111) (= mask!1730 #b00000000000000001111111111111111) (= mask!1730 #b00000000000000011111111111111111) (= mask!1730 #b00000000000000111111111111111111) (= mask!1730 #b00000000000001111111111111111111) (= mask!1730 #b00000000000011111111111111111111) (= mask!1730 #b00000000000111111111111111111111) (= mask!1730 #b00000000001111111111111111111111) (= mask!1730 #b00000000011111111111111111111111) (= mask!1730 #b00000000111111111111111111111111) (= mask!1730 #b00000001111111111111111111111111) (= mask!1730 #b00000011111111111111111111111111) (= mask!1730 #b00000111111111111111111111111111) (= mask!1730 #b00001111111111111111111111111111) (= mask!1730 #b00011111111111111111111111111111) (= mask!1730 #b00111111111111111111111111111111)) (bvsle mask!1730 #b00111111111111111111111111111111)))))

(assert (=> start!106910 d!139639))

(declare-fun d!139641 () Bool)

(assert (=> d!139641 (= (array_inv!30299 _values!1134) (bvsge (size!40348 _values!1134) #b00000000000000000000000000000000))))

(assert (=> start!106910 d!139641))

(declare-fun d!139643 () Bool)

(assert (=> d!139643 (= (array_inv!30300 _keys!1364) (bvsge (size!40347 _keys!1364) #b00000000000000000000000000000000))))

(assert (=> start!106910 d!139643))

(declare-fun d!139645 () Bool)

(declare-fun res!844082 () Bool)

(declare-fun e!722546 () Bool)

(assert (=> d!139645 (=> res!844082 e!722546)))

(assert (=> d!139645 (= res!844082 (bvsge #b00000000000000000000000000000000 (size!40347 _keys!1364)))))

(assert (=> d!139645 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730) e!722546)))

(declare-fun b!1268127 () Bool)

(declare-fun e!722548 () Bool)

(declare-fun call!62506 () Bool)

(assert (=> b!1268127 (= e!722548 call!62506)))

(declare-fun b!1268128 () Bool)

(declare-fun e!722547 () Bool)

(assert (=> b!1268128 (= e!722547 call!62506)))

(declare-fun b!1268129 () Bool)

(assert (=> b!1268129 (= e!722547 e!722548)))

(declare-fun lt!574390 () (_ BitVec 64))

(assert (=> b!1268129 (= lt!574390 (select (arr!39811 _keys!1364) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42228 0))(
  ( (Unit!42229) )
))
(declare-fun lt!574391 () Unit!42228)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82540 (_ BitVec 64) (_ BitVec 32)) Unit!42228)

(assert (=> b!1268129 (= lt!574391 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1364 lt!574390 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82540 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1268129 (arrayContainsKey!0 _keys!1364 lt!574390 #b00000000000000000000000000000000)))

(declare-fun lt!574389 () Unit!42228)

(assert (=> b!1268129 (= lt!574389 lt!574391)))

(declare-fun res!844083 () Bool)

(declare-datatypes ((SeekEntryResult!9983 0))(
  ( (MissingZero!9983 (index!42303 (_ BitVec 32))) (Found!9983 (index!42304 (_ BitVec 32))) (Intermediate!9983 (undefined!10795 Bool) (index!42305 (_ BitVec 32)) (x!111834 (_ BitVec 32))) (Undefined!9983) (MissingVacant!9983 (index!42306 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82540 (_ BitVec 32)) SeekEntryResult!9983)

(assert (=> b!1268129 (= res!844083 (= (seekEntryOrOpen!0 (select (arr!39811 _keys!1364) #b00000000000000000000000000000000) _keys!1364 mask!1730) (Found!9983 #b00000000000000000000000000000000)))))

(assert (=> b!1268129 (=> (not res!844083) (not e!722548))))

(declare-fun bm!62503 () Bool)

(assert (=> bm!62503 (= call!62506 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1364 mask!1730))))

(declare-fun b!1268130 () Bool)

(assert (=> b!1268130 (= e!722546 e!722547)))

(declare-fun c!123623 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1268130 (= c!123623 (validKeyInArray!0 (select (arr!39811 _keys!1364) #b00000000000000000000000000000000)))))

(assert (= (and d!139645 (not res!844082)) b!1268130))

(assert (= (and b!1268130 c!123623) b!1268129))

(assert (= (and b!1268130 (not c!123623)) b!1268128))

(assert (= (and b!1268129 res!844083) b!1268127))

(assert (= (or b!1268127 b!1268128) bm!62503))

(declare-fun m!1167087 () Bool)

(assert (=> b!1268129 m!1167087))

(declare-fun m!1167089 () Bool)

(assert (=> b!1268129 m!1167089))

(declare-fun m!1167091 () Bool)

(assert (=> b!1268129 m!1167091))

(assert (=> b!1268129 m!1167087))

(declare-fun m!1167093 () Bool)

(assert (=> b!1268129 m!1167093))

(declare-fun m!1167095 () Bool)

(assert (=> bm!62503 m!1167095))

(assert (=> b!1268130 m!1167087))

(assert (=> b!1268130 m!1167087))

(declare-fun m!1167097 () Bool)

(assert (=> b!1268130 m!1167097))

(assert (=> b!1268097 d!139645))

(declare-fun mapIsEmpty!50530 () Bool)

(declare-fun mapRes!50530 () Bool)

(assert (=> mapIsEmpty!50530 mapRes!50530))

(declare-fun b!1268138 () Bool)

(declare-fun e!722554 () Bool)

(assert (=> b!1268138 (= e!722554 tp_is_empty!32637)))

(declare-fun b!1268137 () Bool)

(declare-fun e!722553 () Bool)

(assert (=> b!1268137 (= e!722553 tp_is_empty!32637)))

(declare-fun mapNonEmpty!50530 () Bool)

(declare-fun tp!96709 () Bool)

(assert (=> mapNonEmpty!50530 (= mapRes!50530 (and tp!96709 e!722553))))

(declare-fun mapKey!50530 () (_ BitVec 32))

(declare-fun mapValue!50530 () ValueCell!15465)

(declare-fun mapRest!50530 () (Array (_ BitVec 32) ValueCell!15465))

(assert (=> mapNonEmpty!50530 (= mapRest!50524 (store mapRest!50530 mapKey!50530 mapValue!50530))))

(declare-fun condMapEmpty!50530 () Bool)

(declare-fun mapDefault!50530 () ValueCell!15465)

(assert (=> mapNonEmpty!50524 (= condMapEmpty!50530 (= mapRest!50524 ((as const (Array (_ BitVec 32) ValueCell!15465)) mapDefault!50530)))))

(assert (=> mapNonEmpty!50524 (= tp!96703 (and e!722554 mapRes!50530))))

(assert (= (and mapNonEmpty!50524 condMapEmpty!50530) mapIsEmpty!50530))

(assert (= (and mapNonEmpty!50524 (not condMapEmpty!50530)) mapNonEmpty!50530))

(assert (= (and mapNonEmpty!50530 ((_ is ValueCellFull!15465) mapValue!50530)) b!1268137))

(assert (= (and mapNonEmpty!50524 ((_ is ValueCellFull!15465) mapDefault!50530)) b!1268138))

(declare-fun m!1167099 () Bool)

(assert (=> mapNonEmpty!50530 m!1167099))

(check-sat tp_is_empty!32637 (not b!1268129) (not b!1268130) (not mapNonEmpty!50530) (not bm!62503))
(check-sat)
