; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133324 () Bool)

(assert start!133324)

(declare-fun b!1559053 () Bool)

(declare-fun e!868666 () Bool)

(declare-fun tp_is_empty!38479 () Bool)

(assert (=> b!1559053 (= e!868666 tp_is_empty!38479)))

(declare-fun mapIsEmpty!59088 () Bool)

(declare-fun mapRes!59088 () Bool)

(assert (=> mapIsEmpty!59088 mapRes!59088))

(declare-fun mapNonEmpty!59088 () Bool)

(declare-fun tp!112744 () Bool)

(declare-fun e!868667 () Bool)

(assert (=> mapNonEmpty!59088 (= mapRes!59088 (and tp!112744 e!868667))))

(declare-fun mapKey!59088 () (_ BitVec 32))

(declare-datatypes ((V!59513 0))(
  ( (V!59514 (val!19323 Int)) )
))
(declare-datatypes ((ValueCell!18209 0))(
  ( (ValueCellFull!18209 (v!22070 V!59513)) (EmptyCell!18209) )
))
(declare-datatypes ((array!103606 0))(
  ( (array!103607 (arr!49998 (Array (_ BitVec 32) ValueCell!18209)) (size!50550 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103606)

(declare-fun mapValue!59088 () ValueCell!18209)

(declare-fun mapRest!59088 () (Array (_ BitVec 32) ValueCell!18209))

(assert (=> mapNonEmpty!59088 (= (arr!49998 _values!487) (store mapRest!59088 mapKey!59088 mapValue!59088))))

(declare-fun b!1559054 () Bool)

(declare-fun res!1066219 () Bool)

(declare-fun e!868663 () Bool)

(assert (=> b!1559054 (=> (not res!1066219) (not e!868663))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103608 0))(
  ( (array!103609 (arr!49999 (Array (_ BitVec 32) (_ BitVec 64))) (size!50551 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103608)

(assert (=> b!1559054 (= res!1066219 (and (= (size!50550 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50551 _keys!637) (size!50550 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1559055 () Bool)

(declare-fun e!868665 () Bool)

(assert (=> b!1559055 (= e!868665 (and e!868666 mapRes!59088))))

(declare-fun condMapEmpty!59088 () Bool)

(declare-fun mapDefault!59088 () ValueCell!18209)

(assert (=> b!1559055 (= condMapEmpty!59088 (= (arr!49998 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18209)) mapDefault!59088)))))

(declare-fun b!1559056 () Bool)

(declare-fun res!1066220 () Bool)

(assert (=> b!1559056 (=> (not res!1066220) (not e!868663))))

(assert (=> b!1559056 (= res!1066220 (and (bvsle #b00000000000000000000000000000000 (size!50551 _keys!637)) (bvslt (size!50551 _keys!637) #b01111111111111111111111111111111)))))

(declare-fun b!1559057 () Bool)

(declare-fun res!1066221 () Bool)

(assert (=> b!1559057 (=> (not res!1066221) (not e!868663))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103608 (_ BitVec 32)) Bool)

(assert (=> b!1559057 (= res!1066221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun res!1066222 () Bool)

(assert (=> start!133324 (=> (not res!1066222) (not e!868663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133324 (= res!1066222 (validMask!0 mask!947))))

(assert (=> start!133324 e!868663))

(assert (=> start!133324 true))

(declare-fun array_inv!39069 (array!103606) Bool)

(assert (=> start!133324 (and (array_inv!39069 _values!487) e!868665)))

(declare-fun array_inv!39070 (array!103608) Bool)

(assert (=> start!133324 (array_inv!39070 _keys!637)))

(declare-fun b!1559058 () Bool)

(declare-datatypes ((List!36390 0))(
  ( (Nil!36387) (Cons!36386 (h!37833 (_ BitVec 64)) (t!51115 List!36390)) )
))
(declare-fun noDuplicate!2662 (List!36390) Bool)

(assert (=> b!1559058 (= e!868663 (not (noDuplicate!2662 Nil!36387)))))

(declare-fun b!1559059 () Bool)

(assert (=> b!1559059 (= e!868667 tp_is_empty!38479)))

(assert (= (and start!133324 res!1066222) b!1559054))

(assert (= (and b!1559054 res!1066219) b!1559057))

(assert (= (and b!1559057 res!1066221) b!1559056))

(assert (= (and b!1559056 res!1066220) b!1559058))

(assert (= (and b!1559055 condMapEmpty!59088) mapIsEmpty!59088))

(assert (= (and b!1559055 (not condMapEmpty!59088)) mapNonEmpty!59088))

(get-info :version)

(assert (= (and mapNonEmpty!59088 ((_ is ValueCellFull!18209) mapValue!59088)) b!1559059))

(assert (= (and b!1559055 ((_ is ValueCellFull!18209) mapDefault!59088)) b!1559053))

(assert (= start!133324 b!1559055))

(declare-fun m!1434743 () Bool)

(assert (=> mapNonEmpty!59088 m!1434743))

(declare-fun m!1434745 () Bool)

(assert (=> b!1559057 m!1434745))

(declare-fun m!1434747 () Bool)

(assert (=> start!133324 m!1434747))

(declare-fun m!1434749 () Bool)

(assert (=> start!133324 m!1434749))

(declare-fun m!1434751 () Bool)

(assert (=> start!133324 m!1434751))

(declare-fun m!1434753 () Bool)

(assert (=> b!1559058 m!1434753))

(check-sat (not start!133324) (not b!1559058) (not mapNonEmpty!59088) (not b!1559057) tp_is_empty!38479)
(check-sat)
(get-model)

(declare-fun d!162669 () Bool)

(declare-fun res!1066251 () Bool)

(declare-fun e!868702 () Bool)

(assert (=> d!162669 (=> res!1066251 e!868702)))

(assert (=> d!162669 (= res!1066251 ((_ is Nil!36387) Nil!36387))))

(assert (=> d!162669 (= (noDuplicate!2662 Nil!36387) e!868702)))

(declare-fun b!1559106 () Bool)

(declare-fun e!868703 () Bool)

(assert (=> b!1559106 (= e!868702 e!868703)))

(declare-fun res!1066252 () Bool)

(assert (=> b!1559106 (=> (not res!1066252) (not e!868703))))

(declare-fun contains!10176 (List!36390 (_ BitVec 64)) Bool)

(assert (=> b!1559106 (= res!1066252 (not (contains!10176 (t!51115 Nil!36387) (h!37833 Nil!36387))))))

(declare-fun b!1559107 () Bool)

(assert (=> b!1559107 (= e!868703 (noDuplicate!2662 (t!51115 Nil!36387)))))

(assert (= (and d!162669 (not res!1066251)) b!1559106))

(assert (= (and b!1559106 res!1066252) b!1559107))

(declare-fun m!1434779 () Bool)

(assert (=> b!1559106 m!1434779))

(declare-fun m!1434781 () Bool)

(assert (=> b!1559107 m!1434781))

(assert (=> b!1559058 d!162669))

(declare-fun d!162671 () Bool)

(assert (=> d!162671 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!133324 d!162671))

(declare-fun d!162673 () Bool)

(assert (=> d!162673 (= (array_inv!39069 _values!487) (bvsge (size!50550 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!133324 d!162673))

(declare-fun d!162675 () Bool)

(assert (=> d!162675 (= (array_inv!39070 _keys!637) (bvsge (size!50551 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!133324 d!162675))

(declare-fun d!162677 () Bool)

(declare-fun res!1066257 () Bool)

(declare-fun e!868711 () Bool)

(assert (=> d!162677 (=> res!1066257 e!868711)))

(assert (=> d!162677 (= res!1066257 (bvsge #b00000000000000000000000000000000 (size!50551 _keys!637)))))

(assert (=> d!162677 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!868711)))

(declare-fun b!1559116 () Bool)

(declare-fun e!868710 () Bool)

(declare-fun call!71806 () Bool)

(assert (=> b!1559116 (= e!868710 call!71806)))

(declare-fun bm!71803 () Bool)

(assert (=> bm!71803 (= call!71806 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1559117 () Bool)

(assert (=> b!1559117 (= e!868711 e!868710)))

(declare-fun c!144132 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1559117 (= c!144132 (validKeyInArray!0 (select (arr!49999 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1559118 () Bool)

(declare-fun e!868712 () Bool)

(assert (=> b!1559118 (= e!868712 call!71806)))

(declare-fun b!1559119 () Bool)

(assert (=> b!1559119 (= e!868710 e!868712)))

(declare-fun lt!670590 () (_ BitVec 64))

(assert (=> b!1559119 (= lt!670590 (select (arr!49999 _keys!637) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51714 0))(
  ( (Unit!51715) )
))
(declare-fun lt!670589 () Unit!51714)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!103608 (_ BitVec 64) (_ BitVec 32)) Unit!51714)

(assert (=> b!1559119 (= lt!670589 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!670590 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!103608 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1559119 (arrayContainsKey!0 _keys!637 lt!670590 #b00000000000000000000000000000000)))

(declare-fun lt!670591 () Unit!51714)

(assert (=> b!1559119 (= lt!670591 lt!670589)))

(declare-fun res!1066258 () Bool)

(declare-datatypes ((SeekEntryResult!13519 0))(
  ( (MissingZero!13519 (index!56474 (_ BitVec 32))) (Found!13519 (index!56475 (_ BitVec 32))) (Intermediate!13519 (undefined!14331 Bool) (index!56476 (_ BitVec 32)) (x!139770 (_ BitVec 32))) (Undefined!13519) (MissingVacant!13519 (index!56477 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!103608 (_ BitVec 32)) SeekEntryResult!13519)

(assert (=> b!1559119 (= res!1066258 (= (seekEntryOrOpen!0 (select (arr!49999 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13519 #b00000000000000000000000000000000)))))

(assert (=> b!1559119 (=> (not res!1066258) (not e!868712))))

(assert (= (and d!162677 (not res!1066257)) b!1559117))

(assert (= (and b!1559117 c!144132) b!1559119))

(assert (= (and b!1559117 (not c!144132)) b!1559116))

(assert (= (and b!1559119 res!1066258) b!1559118))

(assert (= (or b!1559118 b!1559116) bm!71803))

(declare-fun m!1434783 () Bool)

(assert (=> bm!71803 m!1434783))

(declare-fun m!1434785 () Bool)

(assert (=> b!1559117 m!1434785))

(assert (=> b!1559117 m!1434785))

(declare-fun m!1434787 () Bool)

(assert (=> b!1559117 m!1434787))

(assert (=> b!1559119 m!1434785))

(declare-fun m!1434789 () Bool)

(assert (=> b!1559119 m!1434789))

(declare-fun m!1434791 () Bool)

(assert (=> b!1559119 m!1434791))

(assert (=> b!1559119 m!1434785))

(declare-fun m!1434793 () Bool)

(assert (=> b!1559119 m!1434793))

(assert (=> b!1559057 d!162677))

(declare-fun mapNonEmpty!59097 () Bool)

(declare-fun mapRes!59097 () Bool)

(declare-fun tp!112753 () Bool)

(declare-fun e!868718 () Bool)

(assert (=> mapNonEmpty!59097 (= mapRes!59097 (and tp!112753 e!868718))))

(declare-fun mapRest!59097 () (Array (_ BitVec 32) ValueCell!18209))

(declare-fun mapKey!59097 () (_ BitVec 32))

(declare-fun mapValue!59097 () ValueCell!18209)

(assert (=> mapNonEmpty!59097 (= mapRest!59088 (store mapRest!59097 mapKey!59097 mapValue!59097))))

(declare-fun mapIsEmpty!59097 () Bool)

(assert (=> mapIsEmpty!59097 mapRes!59097))

(declare-fun b!1559126 () Bool)

(assert (=> b!1559126 (= e!868718 tp_is_empty!38479)))

(declare-fun b!1559127 () Bool)

(declare-fun e!868717 () Bool)

(assert (=> b!1559127 (= e!868717 tp_is_empty!38479)))

(declare-fun condMapEmpty!59097 () Bool)

(declare-fun mapDefault!59097 () ValueCell!18209)

(assert (=> mapNonEmpty!59088 (= condMapEmpty!59097 (= mapRest!59088 ((as const (Array (_ BitVec 32) ValueCell!18209)) mapDefault!59097)))))

(assert (=> mapNonEmpty!59088 (= tp!112744 (and e!868717 mapRes!59097))))

(assert (= (and mapNonEmpty!59088 condMapEmpty!59097) mapIsEmpty!59097))

(assert (= (and mapNonEmpty!59088 (not condMapEmpty!59097)) mapNonEmpty!59097))

(assert (= (and mapNonEmpty!59097 ((_ is ValueCellFull!18209) mapValue!59097)) b!1559126))

(assert (= (and mapNonEmpty!59088 ((_ is ValueCellFull!18209) mapDefault!59097)) b!1559127))

(declare-fun m!1434795 () Bool)

(assert (=> mapNonEmpty!59097 m!1434795))

(check-sat (not b!1559117) (not b!1559119) (not bm!71803) (not mapNonEmpty!59097) (not b!1559106) tp_is_empty!38479 (not b!1559107))
(check-sat)
