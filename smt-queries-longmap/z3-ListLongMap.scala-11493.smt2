; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133758 () Bool)

(assert start!133758)

(declare-fun b!1564079 () Bool)

(declare-fun res!1069293 () Bool)

(declare-fun e!871735 () Bool)

(assert (=> b!1564079 (=> (not res!1069293) (not e!871735))))

(declare-datatypes ((array!104374 0))(
  ( (array!104375 (arr!50379 (Array (_ BitVec 32) (_ BitVec 64))) (size!50929 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104374)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104374 (_ BitVec 32)) Bool)

(assert (=> b!1564079 (= res!1069293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564080 () Bool)

(declare-fun res!1069291 () Bool)

(assert (=> b!1564080 (=> (not res!1069291) (not e!871735))))

(declare-datatypes ((List!36551 0))(
  ( (Nil!36548) (Cons!36547 (h!37993 (_ BitVec 64)) (t!51398 List!36551)) )
))
(declare-fun arrayNoDuplicates!0 (array!104374 (_ BitVec 32) List!36551) Bool)

(assert (=> b!1564080 (= res!1069291 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36548))))

(declare-fun b!1564081 () Bool)

(declare-fun e!871736 () Bool)

(declare-fun tp_is_empty!38841 () Bool)

(assert (=> b!1564081 (= e!871736 tp_is_empty!38841)))

(declare-fun mapIsEmpty!59637 () Bool)

(declare-fun mapRes!59637 () Bool)

(assert (=> mapIsEmpty!59637 mapRes!59637))

(declare-fun b!1564082 () Bool)

(declare-fun e!871737 () Bool)

(assert (=> b!1564082 (= e!871737 tp_is_empty!38841)))

(declare-fun b!1564083 () Bool)

(declare-fun e!871734 () Bool)

(assert (=> b!1564083 (= e!871734 (and e!871736 mapRes!59637))))

(declare-fun condMapEmpty!59637 () Bool)

(declare-datatypes ((V!59995 0))(
  ( (V!59996 (val!19504 Int)) )
))
(declare-datatypes ((ValueCell!18390 0))(
  ( (ValueCellFull!18390 (v!22256 V!59995)) (EmptyCell!18390) )
))
(declare-datatypes ((array!104376 0))(
  ( (array!104377 (arr!50380 (Array (_ BitVec 32) ValueCell!18390)) (size!50930 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104376)

(declare-fun mapDefault!59637 () ValueCell!18390)

(assert (=> b!1564083 (= condMapEmpty!59637 (= (arr!50380 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18390)) mapDefault!59637)))))

(declare-fun mapNonEmpty!59637 () Bool)

(declare-fun tp!113562 () Bool)

(assert (=> mapNonEmpty!59637 (= mapRes!59637 (and tp!113562 e!871737))))

(declare-fun mapKey!59637 () (_ BitVec 32))

(declare-fun mapRest!59637 () (Array (_ BitVec 32) ValueCell!18390))

(declare-fun mapValue!59637 () ValueCell!18390)

(assert (=> mapNonEmpty!59637 (= (arr!50380 _values!487) (store mapRest!59637 mapKey!59637 mapValue!59637))))

(declare-fun res!1069292 () Bool)

(assert (=> start!133758 (=> (not res!1069292) (not e!871735))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133758 (= res!1069292 (validMask!0 mask!947))))

(assert (=> start!133758 e!871735))

(assert (=> start!133758 true))

(declare-fun array_inv!39151 (array!104374) Bool)

(assert (=> start!133758 (array_inv!39151 _keys!637)))

(declare-fun array_inv!39152 (array!104376) Bool)

(assert (=> start!133758 (and (array_inv!39152 _values!487) e!871734)))

(declare-fun b!1564084 () Bool)

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1564084 (= e!871735 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50929 _keys!637)) (bvslt (bvsub (bvadd #b00000000000000000000000000000001 (size!50929 _keys!637)) from!782) #b00000000000000000000000000000000)))))

(declare-fun b!1564085 () Bool)

(declare-fun res!1069290 () Bool)

(assert (=> b!1564085 (=> (not res!1069290) (not e!871735))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1564085 (= res!1069290 (and (= (size!50930 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50929 _keys!637) (size!50930 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(assert (= (and start!133758 res!1069292) b!1564085))

(assert (= (and b!1564085 res!1069290) b!1564079))

(assert (= (and b!1564079 res!1069293) b!1564080))

(assert (= (and b!1564080 res!1069291) b!1564084))

(assert (= (and b!1564083 condMapEmpty!59637) mapIsEmpty!59637))

(assert (= (and b!1564083 (not condMapEmpty!59637)) mapNonEmpty!59637))

(get-info :version)

(assert (= (and mapNonEmpty!59637 ((_ is ValueCellFull!18390) mapValue!59637)) b!1564082))

(assert (= (and b!1564083 ((_ is ValueCellFull!18390) mapDefault!59637)) b!1564081))

(assert (= start!133758 b!1564083))

(declare-fun m!1439425 () Bool)

(assert (=> b!1564079 m!1439425))

(declare-fun m!1439427 () Bool)

(assert (=> b!1564080 m!1439427))

(declare-fun m!1439429 () Bool)

(assert (=> mapNonEmpty!59637 m!1439429))

(declare-fun m!1439431 () Bool)

(assert (=> start!133758 m!1439431))

(declare-fun m!1439433 () Bool)

(assert (=> start!133758 m!1439433))

(declare-fun m!1439435 () Bool)

(assert (=> start!133758 m!1439435))

(check-sat tp_is_empty!38841 (not b!1564079) (not mapNonEmpty!59637) (not start!133758) (not b!1564080))
(check-sat)
(get-model)

(declare-fun b!1564117 () Bool)

(declare-fun e!871765 () Bool)

(declare-fun e!871763 () Bool)

(assert (=> b!1564117 (= e!871765 e!871763)))

(declare-fun c!144227 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1564117 (= c!144227 (validKeyInArray!0 (select (arr!50379 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun d!163067 () Bool)

(declare-fun res!1069314 () Bool)

(declare-fun e!871764 () Bool)

(assert (=> d!163067 (=> res!1069314 e!871764)))

(assert (=> d!163067 (= res!1069314 (bvsge #b00000000000000000000000000000000 (size!50929 _keys!637)))))

(assert (=> d!163067 (= (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36548) e!871764)))

(declare-fun b!1564118 () Bool)

(assert (=> b!1564118 (= e!871764 e!871765)))

(declare-fun res!1069312 () Bool)

(assert (=> b!1564118 (=> (not res!1069312) (not e!871765))))

(declare-fun e!871762 () Bool)

(assert (=> b!1564118 (= res!1069312 (not e!871762))))

(declare-fun res!1069313 () Bool)

(assert (=> b!1564118 (=> (not res!1069313) (not e!871762))))

(assert (=> b!1564118 (= res!1069313 (validKeyInArray!0 (select (arr!50379 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1564119 () Bool)

(declare-fun call!71847 () Bool)

(assert (=> b!1564119 (= e!871763 call!71847)))

(declare-fun b!1564120 () Bool)

(assert (=> b!1564120 (= e!871763 call!71847)))

(declare-fun b!1564121 () Bool)

(declare-fun contains!10305 (List!36551 (_ BitVec 64)) Bool)

(assert (=> b!1564121 (= e!871762 (contains!10305 Nil!36548 (select (arr!50379 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun bm!71844 () Bool)

(assert (=> bm!71844 (= call!71847 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!144227 (Cons!36547 (select (arr!50379 _keys!637) #b00000000000000000000000000000000) Nil!36548) Nil!36548)))))

(assert (= (and d!163067 (not res!1069314)) b!1564118))

(assert (= (and b!1564118 res!1069313) b!1564121))

(assert (= (and b!1564118 res!1069312) b!1564117))

(assert (= (and b!1564117 c!144227) b!1564119))

(assert (= (and b!1564117 (not c!144227)) b!1564120))

(assert (= (or b!1564119 b!1564120) bm!71844))

(declare-fun m!1439449 () Bool)

(assert (=> b!1564117 m!1439449))

(assert (=> b!1564117 m!1439449))

(declare-fun m!1439451 () Bool)

(assert (=> b!1564117 m!1439451))

(assert (=> b!1564118 m!1439449))

(assert (=> b!1564118 m!1439449))

(assert (=> b!1564118 m!1439451))

(assert (=> b!1564121 m!1439449))

(assert (=> b!1564121 m!1439449))

(declare-fun m!1439453 () Bool)

(assert (=> b!1564121 m!1439453))

(assert (=> bm!71844 m!1439449))

(declare-fun m!1439455 () Bool)

(assert (=> bm!71844 m!1439455))

(assert (=> b!1564080 d!163067))

(declare-fun d!163069 () Bool)

(declare-fun res!1069320 () Bool)

(declare-fun e!871772 () Bool)

(assert (=> d!163069 (=> res!1069320 e!871772)))

(assert (=> d!163069 (= res!1069320 (bvsge #b00000000000000000000000000000000 (size!50929 _keys!637)))))

(assert (=> d!163069 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!871772)))

(declare-fun bm!71847 () Bool)

(declare-fun call!71850 () Bool)

(assert (=> bm!71847 (= call!71850 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1564130 () Bool)

(declare-fun e!871773 () Bool)

(assert (=> b!1564130 (= e!871773 call!71850)))

(declare-fun b!1564131 () Bool)

(declare-fun e!871774 () Bool)

(assert (=> b!1564131 (= e!871772 e!871774)))

(declare-fun c!144230 () Bool)

(assert (=> b!1564131 (= c!144230 (validKeyInArray!0 (select (arr!50379 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1564132 () Bool)

(assert (=> b!1564132 (= e!871774 call!71850)))

(declare-fun b!1564133 () Bool)

(assert (=> b!1564133 (= e!871774 e!871773)))

(declare-fun lt!672006 () (_ BitVec 64))

(assert (=> b!1564133 (= lt!672006 (select (arr!50379 _keys!637) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51984 0))(
  ( (Unit!51985) )
))
(declare-fun lt!672005 () Unit!51984)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104374 (_ BitVec 64) (_ BitVec 32)) Unit!51984)

(assert (=> b!1564133 (= lt!672005 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!672006 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104374 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1564133 (arrayContainsKey!0 _keys!637 lt!672006 #b00000000000000000000000000000000)))

(declare-fun lt!672004 () Unit!51984)

(assert (=> b!1564133 (= lt!672004 lt!672005)))

(declare-fun res!1069319 () Bool)

(declare-datatypes ((SeekEntryResult!13521 0))(
  ( (MissingZero!13521 (index!56482 (_ BitVec 32))) (Found!13521 (index!56483 (_ BitVec 32))) (Intermediate!13521 (undefined!14333 Bool) (index!56484 (_ BitVec 32)) (x!140435 (_ BitVec 32))) (Undefined!13521) (MissingVacant!13521 (index!56485 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104374 (_ BitVec 32)) SeekEntryResult!13521)

(assert (=> b!1564133 (= res!1069319 (= (seekEntryOrOpen!0 (select (arr!50379 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13521 #b00000000000000000000000000000000)))))

(assert (=> b!1564133 (=> (not res!1069319) (not e!871773))))

(assert (= (and d!163069 (not res!1069320)) b!1564131))

(assert (= (and b!1564131 c!144230) b!1564133))

(assert (= (and b!1564131 (not c!144230)) b!1564132))

(assert (= (and b!1564133 res!1069319) b!1564130))

(assert (= (or b!1564130 b!1564132) bm!71847))

(declare-fun m!1439457 () Bool)

(assert (=> bm!71847 m!1439457))

(assert (=> b!1564131 m!1439449))

(assert (=> b!1564131 m!1439449))

(assert (=> b!1564131 m!1439451))

(assert (=> b!1564133 m!1439449))

(declare-fun m!1439459 () Bool)

(assert (=> b!1564133 m!1439459))

(declare-fun m!1439461 () Bool)

(assert (=> b!1564133 m!1439461))

(assert (=> b!1564133 m!1439449))

(declare-fun m!1439463 () Bool)

(assert (=> b!1564133 m!1439463))

(assert (=> b!1564079 d!163069))

(declare-fun d!163071 () Bool)

(assert (=> d!163071 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!133758 d!163071))

(declare-fun d!163073 () Bool)

(assert (=> d!163073 (= (array_inv!39151 _keys!637) (bvsge (size!50929 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!133758 d!163073))

(declare-fun d!163075 () Bool)

(assert (=> d!163075 (= (array_inv!39152 _values!487) (bvsge (size!50930 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!133758 d!163075))

(declare-fun mapIsEmpty!59643 () Bool)

(declare-fun mapRes!59643 () Bool)

(assert (=> mapIsEmpty!59643 mapRes!59643))

(declare-fun b!1564141 () Bool)

(declare-fun e!871779 () Bool)

(assert (=> b!1564141 (= e!871779 tp_is_empty!38841)))

(declare-fun condMapEmpty!59643 () Bool)

(declare-fun mapDefault!59643 () ValueCell!18390)

(assert (=> mapNonEmpty!59637 (= condMapEmpty!59643 (= mapRest!59637 ((as const (Array (_ BitVec 32) ValueCell!18390)) mapDefault!59643)))))

(assert (=> mapNonEmpty!59637 (= tp!113562 (and e!871779 mapRes!59643))))

(declare-fun b!1564140 () Bool)

(declare-fun e!871780 () Bool)

(assert (=> b!1564140 (= e!871780 tp_is_empty!38841)))

(declare-fun mapNonEmpty!59643 () Bool)

(declare-fun tp!113568 () Bool)

(assert (=> mapNonEmpty!59643 (= mapRes!59643 (and tp!113568 e!871780))))

(declare-fun mapKey!59643 () (_ BitVec 32))

(declare-fun mapRest!59643 () (Array (_ BitVec 32) ValueCell!18390))

(declare-fun mapValue!59643 () ValueCell!18390)

(assert (=> mapNonEmpty!59643 (= mapRest!59637 (store mapRest!59643 mapKey!59643 mapValue!59643))))

(assert (= (and mapNonEmpty!59637 condMapEmpty!59643) mapIsEmpty!59643))

(assert (= (and mapNonEmpty!59637 (not condMapEmpty!59643)) mapNonEmpty!59643))

(assert (= (and mapNonEmpty!59643 ((_ is ValueCellFull!18390) mapValue!59643)) b!1564140))

(assert (= (and mapNonEmpty!59637 ((_ is ValueCellFull!18390) mapDefault!59643)) b!1564141))

(declare-fun m!1439465 () Bool)

(assert (=> mapNonEmpty!59643 m!1439465))

(check-sat (not b!1564117) (not b!1564118) (not mapNonEmpty!59643) (not b!1564121) (not b!1564131) (not bm!71844) (not bm!71847) (not b!1564133) tp_is_empty!38841)
(check-sat)
