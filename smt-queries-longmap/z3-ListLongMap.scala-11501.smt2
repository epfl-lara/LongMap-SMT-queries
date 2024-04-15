; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133790 () Bool)

(assert start!133790)

(declare-fun b!1564488 () Bool)

(declare-fun res!1069609 () Bool)

(declare-fun e!871986 () Bool)

(assert (=> b!1564488 (=> (not res!1069609) (not e!871986))))

(declare-datatypes ((array!104392 0))(
  ( (array!104393 (arr!50387 (Array (_ BitVec 32) (_ BitVec 64))) (size!50939 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104392)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104392 (_ BitVec 32)) Bool)

(assert (=> b!1564488 (= res!1069609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564489 () Bool)

(declare-fun res!1069605 () Bool)

(assert (=> b!1564489 (=> (not res!1069605) (not e!871986))))

(declare-datatypes ((List!36631 0))(
  ( (Nil!36628) (Cons!36627 (h!38074 (_ BitVec 64)) (t!51470 List!36631)) )
))
(declare-fun arrayNoDuplicates!0 (array!104392 (_ BitVec 32) List!36631) Bool)

(assert (=> b!1564489 (= res!1069605 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36628))))

(declare-fun b!1564490 () Bool)

(declare-fun res!1069607 () Bool)

(assert (=> b!1564490 (=> (not res!1069607) (not e!871986))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1564490 (= res!1069607 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50939 _keys!637)) (bvslt from!782 (size!50939 _keys!637))))))

(declare-fun b!1564491 () Bool)

(declare-fun res!1069608 () Bool)

(assert (=> b!1564491 (=> (not res!1069608) (not e!871986))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1564491 (= res!1069608 (validKeyInArray!0 (select (arr!50387 _keys!637) from!782)))))

(declare-fun b!1564492 () Bool)

(assert (=> b!1564492 (= e!871986 (bvsge (bvsub (size!50939 _keys!637) from!782) (bvsub (bvadd #b00000000000000000000000000000001 (size!50939 _keys!637)) from!782)))))

(declare-fun b!1564493 () Bool)

(declare-fun e!871990 () Bool)

(declare-fun tp_is_empty!38887 () Bool)

(assert (=> b!1564493 (= e!871990 tp_is_empty!38887)))

(declare-fun mapIsEmpty!59713 () Bool)

(declare-fun mapRes!59713 () Bool)

(assert (=> mapIsEmpty!59713 mapRes!59713))

(declare-fun b!1564495 () Bool)

(declare-fun res!1069606 () Bool)

(assert (=> b!1564495 (=> (not res!1069606) (not e!871986))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!60057 0))(
  ( (V!60058 (val!19527 Int)) )
))
(declare-datatypes ((ValueCell!18413 0))(
  ( (ValueCellFull!18413 (v!22277 V!60057)) (EmptyCell!18413) )
))
(declare-datatypes ((array!104394 0))(
  ( (array!104395 (arr!50388 (Array (_ BitVec 32) ValueCell!18413)) (size!50940 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104394)

(assert (=> b!1564495 (= res!1069606 (and (= (size!50940 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50939 _keys!637) (size!50940 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1069604 () Bool)

(assert (=> start!133790 (=> (not res!1069604) (not e!871986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133790 (= res!1069604 (validMask!0 mask!947))))

(assert (=> start!133790 e!871986))

(assert (=> start!133790 true))

(declare-fun array_inv!39357 (array!104392) Bool)

(assert (=> start!133790 (array_inv!39357 _keys!637)))

(declare-fun e!871987 () Bool)

(declare-fun array_inv!39358 (array!104394) Bool)

(assert (=> start!133790 (and (array_inv!39358 _values!487) e!871987)))

(declare-fun b!1564494 () Bool)

(declare-fun e!871988 () Bool)

(assert (=> b!1564494 (= e!871988 tp_is_empty!38887)))

(declare-fun mapNonEmpty!59713 () Bool)

(declare-fun tp!113639 () Bool)

(assert (=> mapNonEmpty!59713 (= mapRes!59713 (and tp!113639 e!871990))))

(declare-fun mapRest!59713 () (Array (_ BitVec 32) ValueCell!18413))

(declare-fun mapValue!59713 () ValueCell!18413)

(declare-fun mapKey!59713 () (_ BitVec 32))

(assert (=> mapNonEmpty!59713 (= (arr!50388 _values!487) (store mapRest!59713 mapKey!59713 mapValue!59713))))

(declare-fun b!1564496 () Bool)

(assert (=> b!1564496 (= e!871987 (and e!871988 mapRes!59713))))

(declare-fun condMapEmpty!59713 () Bool)

(declare-fun mapDefault!59713 () ValueCell!18413)

(assert (=> b!1564496 (= condMapEmpty!59713 (= (arr!50388 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18413)) mapDefault!59713)))))

(assert (= (and start!133790 res!1069604) b!1564495))

(assert (= (and b!1564495 res!1069606) b!1564488))

(assert (= (and b!1564488 res!1069609) b!1564489))

(assert (= (and b!1564489 res!1069605) b!1564490))

(assert (= (and b!1564490 res!1069607) b!1564491))

(assert (= (and b!1564491 res!1069608) b!1564492))

(assert (= (and b!1564496 condMapEmpty!59713) mapIsEmpty!59713))

(assert (= (and b!1564496 (not condMapEmpty!59713)) mapNonEmpty!59713))

(get-info :version)

(assert (= (and mapNonEmpty!59713 ((_ is ValueCellFull!18413) mapValue!59713)) b!1564493))

(assert (= (and b!1564496 ((_ is ValueCellFull!18413) mapDefault!59713)) b!1564494))

(assert (= start!133790 b!1564496))

(declare-fun m!1438989 () Bool)

(assert (=> b!1564488 m!1438989))

(declare-fun m!1438991 () Bool)

(assert (=> b!1564491 m!1438991))

(assert (=> b!1564491 m!1438991))

(declare-fun m!1438993 () Bool)

(assert (=> b!1564491 m!1438993))

(declare-fun m!1438995 () Bool)

(assert (=> b!1564489 m!1438995))

(declare-fun m!1438997 () Bool)

(assert (=> start!133790 m!1438997))

(declare-fun m!1438999 () Bool)

(assert (=> start!133790 m!1438999))

(declare-fun m!1439001 () Bool)

(assert (=> start!133790 m!1439001))

(declare-fun m!1439003 () Bool)

(assert (=> mapNonEmpty!59713 m!1439003))

(check-sat (not b!1564489) (not mapNonEmpty!59713) (not b!1564491) (not b!1564488) tp_is_empty!38887 (not start!133790))
(check-sat)
(get-model)

(declare-fun d!162887 () Bool)

(assert (=> d!162887 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!133790 d!162887))

(declare-fun d!162889 () Bool)

(assert (=> d!162889 (= (array_inv!39357 _keys!637) (bvsge (size!50939 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!133790 d!162889))

(declare-fun d!162891 () Bool)

(assert (=> d!162891 (= (array_inv!39358 _values!487) (bvsge (size!50940 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!133790 d!162891))

(declare-fun d!162893 () Bool)

(declare-fun res!1069653 () Bool)

(declare-fun e!872029 () Bool)

(assert (=> d!162893 (=> res!1069653 e!872029)))

(assert (=> d!162893 (= res!1069653 (bvsge #b00000000000000000000000000000000 (size!50939 _keys!637)))))

(assert (=> d!162893 (= (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36628) e!872029)))

(declare-fun b!1564561 () Bool)

(declare-fun e!872032 () Bool)

(assert (=> b!1564561 (= e!872029 e!872032)))

(declare-fun res!1069652 () Bool)

(assert (=> b!1564561 (=> (not res!1069652) (not e!872032))))

(declare-fun e!872030 () Bool)

(assert (=> b!1564561 (= res!1069652 (not e!872030))))

(declare-fun res!1069654 () Bool)

(assert (=> b!1564561 (=> (not res!1069654) (not e!872030))))

(assert (=> b!1564561 (= res!1069654 (validKeyInArray!0 (select (arr!50387 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun bm!71823 () Bool)

(declare-fun call!71826 () Bool)

(declare-fun c!144165 () Bool)

(assert (=> bm!71823 (= call!71826 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!144165 (Cons!36627 (select (arr!50387 _keys!637) #b00000000000000000000000000000000) Nil!36628) Nil!36628)))))

(declare-fun b!1564562 () Bool)

(declare-fun e!872031 () Bool)

(assert (=> b!1564562 (= e!872031 call!71826)))

(declare-fun b!1564563 () Bool)

(declare-fun contains!10283 (List!36631 (_ BitVec 64)) Bool)

(assert (=> b!1564563 (= e!872030 (contains!10283 Nil!36628 (select (arr!50387 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1564564 () Bool)

(assert (=> b!1564564 (= e!872031 call!71826)))

(declare-fun b!1564565 () Bool)

(assert (=> b!1564565 (= e!872032 e!872031)))

(assert (=> b!1564565 (= c!144165 (validKeyInArray!0 (select (arr!50387 _keys!637) #b00000000000000000000000000000000)))))

(assert (= (and d!162893 (not res!1069653)) b!1564561))

(assert (= (and b!1564561 res!1069654) b!1564563))

(assert (= (and b!1564561 res!1069652) b!1564565))

(assert (= (and b!1564565 c!144165) b!1564564))

(assert (= (and b!1564565 (not c!144165)) b!1564562))

(assert (= (or b!1564564 b!1564562) bm!71823))

(declare-fun m!1439037 () Bool)

(assert (=> b!1564561 m!1439037))

(assert (=> b!1564561 m!1439037))

(declare-fun m!1439039 () Bool)

(assert (=> b!1564561 m!1439039))

(assert (=> bm!71823 m!1439037))

(declare-fun m!1439041 () Bool)

(assert (=> bm!71823 m!1439041))

(assert (=> b!1564563 m!1439037))

(assert (=> b!1564563 m!1439037))

(declare-fun m!1439043 () Bool)

(assert (=> b!1564563 m!1439043))

(assert (=> b!1564565 m!1439037))

(assert (=> b!1564565 m!1439037))

(assert (=> b!1564565 m!1439039))

(assert (=> b!1564489 d!162893))

(declare-fun b!1564574 () Bool)

(declare-fun e!872040 () Bool)

(declare-fun call!71829 () Bool)

(assert (=> b!1564574 (= e!872040 call!71829)))

(declare-fun b!1564575 () Bool)

(declare-fun e!872041 () Bool)

(assert (=> b!1564575 (= e!872041 e!872040)))

(declare-fun c!144168 () Bool)

(assert (=> b!1564575 (= c!144168 (validKeyInArray!0 (select (arr!50387 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1564577 () Bool)

(declare-fun e!872039 () Bool)

(assert (=> b!1564577 (= e!872040 e!872039)))

(declare-fun lt!671830 () (_ BitVec 64))

(assert (=> b!1564577 (= lt!671830 (select (arr!50387 _keys!637) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51804 0))(
  ( (Unit!51805) )
))
(declare-fun lt!671829 () Unit!51804)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104392 (_ BitVec 64) (_ BitVec 32)) Unit!51804)

(assert (=> b!1564577 (= lt!671829 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!671830 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104392 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1564577 (arrayContainsKey!0 _keys!637 lt!671830 #b00000000000000000000000000000000)))

(declare-fun lt!671828 () Unit!51804)

(assert (=> b!1564577 (= lt!671828 lt!671829)))

(declare-fun res!1069660 () Bool)

(declare-datatypes ((SeekEntryResult!13523 0))(
  ( (MissingZero!13523 (index!56490 (_ BitVec 32))) (Found!13523 (index!56491 (_ BitVec 32))) (Intermediate!13523 (undefined!14335 Bool) (index!56492 (_ BitVec 32)) (x!140558 (_ BitVec 32))) (Undefined!13523) (MissingVacant!13523 (index!56493 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104392 (_ BitVec 32)) SeekEntryResult!13523)

(assert (=> b!1564577 (= res!1069660 (= (seekEntryOrOpen!0 (select (arr!50387 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13523 #b00000000000000000000000000000000)))))

(assert (=> b!1564577 (=> (not res!1069660) (not e!872039))))

(declare-fun bm!71826 () Bool)

(assert (=> bm!71826 (= call!71829 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1564576 () Bool)

(assert (=> b!1564576 (= e!872039 call!71829)))

(declare-fun d!162895 () Bool)

(declare-fun res!1069659 () Bool)

(assert (=> d!162895 (=> res!1069659 e!872041)))

(assert (=> d!162895 (= res!1069659 (bvsge #b00000000000000000000000000000000 (size!50939 _keys!637)))))

(assert (=> d!162895 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!872041)))

(assert (= (and d!162895 (not res!1069659)) b!1564575))

(assert (= (and b!1564575 c!144168) b!1564577))

(assert (= (and b!1564575 (not c!144168)) b!1564574))

(assert (= (and b!1564577 res!1069660) b!1564576))

(assert (= (or b!1564576 b!1564574) bm!71826))

(assert (=> b!1564575 m!1439037))

(assert (=> b!1564575 m!1439037))

(assert (=> b!1564575 m!1439039))

(assert (=> b!1564577 m!1439037))

(declare-fun m!1439045 () Bool)

(assert (=> b!1564577 m!1439045))

(declare-fun m!1439047 () Bool)

(assert (=> b!1564577 m!1439047))

(assert (=> b!1564577 m!1439037))

(declare-fun m!1439049 () Bool)

(assert (=> b!1564577 m!1439049))

(declare-fun m!1439051 () Bool)

(assert (=> bm!71826 m!1439051))

(assert (=> b!1564488 d!162895))

(declare-fun d!162897 () Bool)

(assert (=> d!162897 (= (validKeyInArray!0 (select (arr!50387 _keys!637) from!782)) (and (not (= (select (arr!50387 _keys!637) from!782) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50387 _keys!637) from!782) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1564491 d!162897))

(declare-fun b!1564584 () Bool)

(declare-fun e!872047 () Bool)

(assert (=> b!1564584 (= e!872047 tp_is_empty!38887)))

(declare-fun condMapEmpty!59722 () Bool)

(declare-fun mapDefault!59722 () ValueCell!18413)

(assert (=> mapNonEmpty!59713 (= condMapEmpty!59722 (= mapRest!59713 ((as const (Array (_ BitVec 32) ValueCell!18413)) mapDefault!59722)))))

(declare-fun e!872046 () Bool)

(declare-fun mapRes!59722 () Bool)

(assert (=> mapNonEmpty!59713 (= tp!113639 (and e!872046 mapRes!59722))))

(declare-fun b!1564585 () Bool)

(assert (=> b!1564585 (= e!872046 tp_is_empty!38887)))

(declare-fun mapIsEmpty!59722 () Bool)

(assert (=> mapIsEmpty!59722 mapRes!59722))

(declare-fun mapNonEmpty!59722 () Bool)

(declare-fun tp!113648 () Bool)

(assert (=> mapNonEmpty!59722 (= mapRes!59722 (and tp!113648 e!872047))))

(declare-fun mapRest!59722 () (Array (_ BitVec 32) ValueCell!18413))

(declare-fun mapKey!59722 () (_ BitVec 32))

(declare-fun mapValue!59722 () ValueCell!18413)

(assert (=> mapNonEmpty!59722 (= mapRest!59713 (store mapRest!59722 mapKey!59722 mapValue!59722))))

(assert (= (and mapNonEmpty!59713 condMapEmpty!59722) mapIsEmpty!59722))

(assert (= (and mapNonEmpty!59713 (not condMapEmpty!59722)) mapNonEmpty!59722))

(assert (= (and mapNonEmpty!59722 ((_ is ValueCellFull!18413) mapValue!59722)) b!1564584))

(assert (= (and mapNonEmpty!59713 ((_ is ValueCellFull!18413) mapDefault!59722)) b!1564585))

(declare-fun m!1439053 () Bool)

(assert (=> mapNonEmpty!59722 m!1439053))

(check-sat (not b!1564575) (not mapNonEmpty!59722) (not bm!71823) tp_is_empty!38887 (not bm!71826) (not b!1564565) (not b!1564561) (not b!1564563) (not b!1564577))
(check-sat)
