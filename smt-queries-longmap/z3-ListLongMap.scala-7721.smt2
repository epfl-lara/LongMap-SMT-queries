; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97236 () Bool)

(assert start!97236)

(declare-fun mapIsEmpty!42754 () Bool)

(declare-fun mapRes!42754 () Bool)

(assert (=> mapIsEmpty!42754 mapRes!42754))

(declare-fun b!1104704 () Bool)

(declare-fun res!736634 () Bool)

(declare-fun e!630705 () Bool)

(assert (=> b!1104704 (=> (not res!736634) (not e!630705))))

(declare-datatypes ((array!71561 0))(
  ( (array!71562 (arr!34432 (Array (_ BitVec 32) (_ BitVec 64))) (size!34969 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71561)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71561 (_ BitVec 32)) Bool)

(assert (=> b!1104704 (= res!736634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1104705 () Bool)

(declare-fun e!630702 () Bool)

(declare-fun tp_is_empty!27301 () Bool)

(assert (=> b!1104705 (= e!630702 tp_is_empty!27301)))

(declare-fun b!1104706 () Bool)

(declare-fun res!736635 () Bool)

(assert (=> b!1104706 (=> (not res!736635) (not e!630705))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!41529 0))(
  ( (V!41530 (val!13707 Int)) )
))
(declare-datatypes ((ValueCell!12941 0))(
  ( (ValueCellFull!12941 (v!16334 V!41529)) (EmptyCell!12941) )
))
(declare-datatypes ((array!71563 0))(
  ( (array!71564 (arr!34433 (Array (_ BitVec 32) ValueCell!12941)) (size!34970 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71563)

(assert (=> b!1104706 (= res!736635 (and (= (size!34970 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34969 _keys!1208) (size!34970 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1104707 () Bool)

(declare-fun e!630706 () Bool)

(assert (=> b!1104707 (= e!630706 tp_is_empty!27301)))

(declare-fun res!736633 () Bool)

(assert (=> start!97236 (=> (not res!736633) (not e!630705))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97236 (= res!736633 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34969 _keys!1208))))))

(assert (=> start!97236 e!630705))

(declare-fun array_inv!26550 (array!71561) Bool)

(assert (=> start!97236 (array_inv!26550 _keys!1208)))

(assert (=> start!97236 true))

(declare-fun e!630704 () Bool)

(declare-fun array_inv!26551 (array!71563) Bool)

(assert (=> start!97236 (and (array_inv!26551 _values!996) e!630704)))

(declare-fun b!1104708 () Bool)

(assert (=> b!1104708 (= e!630704 (and e!630706 mapRes!42754))))

(declare-fun condMapEmpty!42754 () Bool)

(declare-fun mapDefault!42754 () ValueCell!12941)

(assert (=> b!1104708 (= condMapEmpty!42754 (= (arr!34433 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12941)) mapDefault!42754)))))

(declare-fun mapNonEmpty!42754 () Bool)

(declare-fun tp!81674 () Bool)

(assert (=> mapNonEmpty!42754 (= mapRes!42754 (and tp!81674 e!630702))))

(declare-fun mapValue!42754 () ValueCell!12941)

(declare-fun mapKey!42754 () (_ BitVec 32))

(declare-fun mapRest!42754 () (Array (_ BitVec 32) ValueCell!12941))

(assert (=> mapNonEmpty!42754 (= (arr!34433 _values!996) (store mapRest!42754 mapKey!42754 mapValue!42754))))

(declare-fun b!1104709 () Bool)

(declare-fun res!736639 () Bool)

(assert (=> b!1104709 (=> (not res!736639) (not e!630705))))

(declare-datatypes ((List!24058 0))(
  ( (Nil!24055) (Cons!24054 (h!25272 (_ BitVec 64)) (t!34315 List!24058)) )
))
(declare-fun noDuplicate!1596 (List!24058) Bool)

(assert (=> b!1104709 (= res!736639 (noDuplicate!1596 Nil!24055))))

(declare-fun b!1104710 () Bool)

(declare-fun res!736636 () Bool)

(assert (=> b!1104710 (=> (not res!736636) (not e!630705))))

(assert (=> b!1104710 (= res!736636 (and (bvsle #b00000000000000000000000000000000 (size!34969 _keys!1208)) (bvslt (size!34969 _keys!1208) #b01111111111111111111111111111111)))))

(declare-fun b!1104711 () Bool)

(declare-fun e!630701 () Bool)

(declare-fun contains!6436 (List!24058 (_ BitVec 64)) Bool)

(assert (=> b!1104711 (= e!630701 (contains!6436 Nil!24055 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1104712 () Bool)

(assert (=> b!1104712 (= e!630705 e!630701)))

(declare-fun res!736638 () Bool)

(assert (=> b!1104712 (=> res!736638 e!630701)))

(assert (=> b!1104712 (= res!736638 (contains!6436 Nil!24055 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1104713 () Bool)

(declare-fun res!736637 () Bool)

(assert (=> b!1104713 (=> (not res!736637) (not e!630705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1104713 (= res!736637 (validMask!0 mask!1564))))

(assert (= (and start!97236 res!736633) b!1104713))

(assert (= (and b!1104713 res!736637) b!1104706))

(assert (= (and b!1104706 res!736635) b!1104704))

(assert (= (and b!1104704 res!736634) b!1104710))

(assert (= (and b!1104710 res!736636) b!1104709))

(assert (= (and b!1104709 res!736639) b!1104712))

(assert (= (and b!1104712 (not res!736638)) b!1104711))

(assert (= (and b!1104708 condMapEmpty!42754) mapIsEmpty!42754))

(assert (= (and b!1104708 (not condMapEmpty!42754)) mapNonEmpty!42754))

(get-info :version)

(assert (= (and mapNonEmpty!42754 ((_ is ValueCellFull!12941) mapValue!42754)) b!1104705))

(assert (= (and b!1104708 ((_ is ValueCellFull!12941) mapDefault!42754)) b!1104707))

(assert (= start!97236 b!1104708))

(declare-fun m!1025229 () Bool)

(assert (=> b!1104711 m!1025229))

(declare-fun m!1025231 () Bool)

(assert (=> start!97236 m!1025231))

(declare-fun m!1025233 () Bool)

(assert (=> start!97236 m!1025233))

(declare-fun m!1025235 () Bool)

(assert (=> b!1104712 m!1025235))

(declare-fun m!1025237 () Bool)

(assert (=> b!1104704 m!1025237))

(declare-fun m!1025239 () Bool)

(assert (=> mapNonEmpty!42754 m!1025239))

(declare-fun m!1025241 () Bool)

(assert (=> b!1104713 m!1025241))

(declare-fun m!1025243 () Bool)

(assert (=> b!1104709 m!1025243))

(check-sat (not mapNonEmpty!42754) tp_is_empty!27301 (not b!1104704) (not b!1104713) (not b!1104712) (not b!1104709) (not b!1104711) (not start!97236))
(check-sat)
(get-model)

(declare-fun d!131289 () Bool)

(assert (=> d!131289 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1104713 d!131289))

(declare-fun b!1104782 () Bool)

(declare-fun e!630750 () Bool)

(declare-fun e!630749 () Bool)

(assert (=> b!1104782 (= e!630750 e!630749)))

(declare-fun lt!495583 () (_ BitVec 64))

(assert (=> b!1104782 (= lt!495583 (select (arr!34432 _keys!1208) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!36235 0))(
  ( (Unit!36236) )
))
(declare-fun lt!495582 () Unit!36235)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71561 (_ BitVec 64) (_ BitVec 32)) Unit!36235)

(assert (=> b!1104782 (= lt!495582 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!495583 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!71561 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1104782 (arrayContainsKey!0 _keys!1208 lt!495583 #b00000000000000000000000000000000)))

(declare-fun lt!495584 () Unit!36235)

(assert (=> b!1104782 (= lt!495584 lt!495582)))

(declare-fun res!736687 () Bool)

(declare-datatypes ((SeekEntryResult!9876 0))(
  ( (MissingZero!9876 (index!41875 (_ BitVec 32))) (Found!9876 (index!41876 (_ BitVec 32))) (Intermediate!9876 (undefined!10688 Bool) (index!41877 (_ BitVec 32)) (x!99227 (_ BitVec 32))) (Undefined!9876) (MissingVacant!9876 (index!41878 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71561 (_ BitVec 32)) SeekEntryResult!9876)

(assert (=> b!1104782 (= res!736687 (= (seekEntryOrOpen!0 (select (arr!34432 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9876 #b00000000000000000000000000000000)))))

(assert (=> b!1104782 (=> (not res!736687) (not e!630749))))

(declare-fun b!1104783 () Bool)

(declare-fun call!46392 () Bool)

(assert (=> b!1104783 (= e!630750 call!46392)))

(declare-fun bm!46389 () Bool)

(assert (=> bm!46389 (= call!46392 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1104784 () Bool)

(assert (=> b!1104784 (= e!630749 call!46392)))

(declare-fun b!1104785 () Bool)

(declare-fun e!630751 () Bool)

(assert (=> b!1104785 (= e!630751 e!630750)))

(declare-fun c!109389 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1104785 (= c!109389 (validKeyInArray!0 (select (arr!34432 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!131291 () Bool)

(declare-fun res!736686 () Bool)

(assert (=> d!131291 (=> res!736686 e!630751)))

(assert (=> d!131291 (= res!736686 (bvsge #b00000000000000000000000000000000 (size!34969 _keys!1208)))))

(assert (=> d!131291 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!630751)))

(assert (= (and d!131291 (not res!736686)) b!1104785))

(assert (= (and b!1104785 c!109389) b!1104782))

(assert (= (and b!1104785 (not c!109389)) b!1104783))

(assert (= (and b!1104782 res!736687) b!1104784))

(assert (= (or b!1104784 b!1104783) bm!46389))

(declare-fun m!1025277 () Bool)

(assert (=> b!1104782 m!1025277))

(declare-fun m!1025279 () Bool)

(assert (=> b!1104782 m!1025279))

(declare-fun m!1025281 () Bool)

(assert (=> b!1104782 m!1025281))

(assert (=> b!1104782 m!1025277))

(declare-fun m!1025283 () Bool)

(assert (=> b!1104782 m!1025283))

(declare-fun m!1025285 () Bool)

(assert (=> bm!46389 m!1025285))

(assert (=> b!1104785 m!1025277))

(assert (=> b!1104785 m!1025277))

(declare-fun m!1025287 () Bool)

(assert (=> b!1104785 m!1025287))

(assert (=> b!1104704 d!131291))

(declare-fun d!131293 () Bool)

(declare-fun lt!495587 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!540 (List!24058) (InoxSet (_ BitVec 64)))

(assert (=> d!131293 (= lt!495587 (select (content!540 Nil!24055) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!630756 () Bool)

(assert (=> d!131293 (= lt!495587 e!630756)))

(declare-fun res!736693 () Bool)

(assert (=> d!131293 (=> (not res!736693) (not e!630756))))

(assert (=> d!131293 (= res!736693 ((_ is Cons!24054) Nil!24055))))

(assert (=> d!131293 (= (contains!6436 Nil!24055 #b0000000000000000000000000000000000000000000000000000000000000000) lt!495587)))

(declare-fun b!1104790 () Bool)

(declare-fun e!630757 () Bool)

(assert (=> b!1104790 (= e!630756 e!630757)))

(declare-fun res!736692 () Bool)

(assert (=> b!1104790 (=> res!736692 e!630757)))

(assert (=> b!1104790 (= res!736692 (= (h!25272 Nil!24055) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1104791 () Bool)

(assert (=> b!1104791 (= e!630757 (contains!6436 (t!34315 Nil!24055) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!131293 res!736693) b!1104790))

(assert (= (and b!1104790 (not res!736692)) b!1104791))

(declare-fun m!1025289 () Bool)

(assert (=> d!131293 m!1025289))

(declare-fun m!1025291 () Bool)

(assert (=> d!131293 m!1025291))

(declare-fun m!1025293 () Bool)

(assert (=> b!1104791 m!1025293))

(assert (=> b!1104712 d!131293))

(declare-fun d!131295 () Bool)

(assert (=> d!131295 (= (array_inv!26550 _keys!1208) (bvsge (size!34969 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!97236 d!131295))

(declare-fun d!131297 () Bool)

(assert (=> d!131297 (= (array_inv!26551 _values!996) (bvsge (size!34970 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!97236 d!131297))

(declare-fun d!131299 () Bool)

(declare-fun lt!495588 () Bool)

(assert (=> d!131299 (= lt!495588 (select (content!540 Nil!24055) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!630758 () Bool)

(assert (=> d!131299 (= lt!495588 e!630758)))

(declare-fun res!736695 () Bool)

(assert (=> d!131299 (=> (not res!736695) (not e!630758))))

(assert (=> d!131299 (= res!736695 ((_ is Cons!24054) Nil!24055))))

(assert (=> d!131299 (= (contains!6436 Nil!24055 #b1000000000000000000000000000000000000000000000000000000000000000) lt!495588)))

(declare-fun b!1104792 () Bool)

(declare-fun e!630759 () Bool)

(assert (=> b!1104792 (= e!630758 e!630759)))

(declare-fun res!736694 () Bool)

(assert (=> b!1104792 (=> res!736694 e!630759)))

(assert (=> b!1104792 (= res!736694 (= (h!25272 Nil!24055) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1104793 () Bool)

(assert (=> b!1104793 (= e!630759 (contains!6436 (t!34315 Nil!24055) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!131299 res!736695) b!1104792))

(assert (= (and b!1104792 (not res!736694)) b!1104793))

(assert (=> d!131299 m!1025289))

(declare-fun m!1025295 () Bool)

(assert (=> d!131299 m!1025295))

(declare-fun m!1025297 () Bool)

(assert (=> b!1104793 m!1025297))

(assert (=> b!1104711 d!131299))

(declare-fun d!131301 () Bool)

(declare-fun res!736700 () Bool)

(declare-fun e!630764 () Bool)

(assert (=> d!131301 (=> res!736700 e!630764)))

(assert (=> d!131301 (= res!736700 ((_ is Nil!24055) Nil!24055))))

(assert (=> d!131301 (= (noDuplicate!1596 Nil!24055) e!630764)))

(declare-fun b!1104798 () Bool)

(declare-fun e!630765 () Bool)

(assert (=> b!1104798 (= e!630764 e!630765)))

(declare-fun res!736701 () Bool)

(assert (=> b!1104798 (=> (not res!736701) (not e!630765))))

(assert (=> b!1104798 (= res!736701 (not (contains!6436 (t!34315 Nil!24055) (h!25272 Nil!24055))))))

(declare-fun b!1104799 () Bool)

(assert (=> b!1104799 (= e!630765 (noDuplicate!1596 (t!34315 Nil!24055)))))

(assert (= (and d!131301 (not res!736700)) b!1104798))

(assert (= (and b!1104798 res!736701) b!1104799))

(declare-fun m!1025299 () Bool)

(assert (=> b!1104798 m!1025299))

(declare-fun m!1025301 () Bool)

(assert (=> b!1104799 m!1025301))

(assert (=> b!1104709 d!131301))

(declare-fun b!1104807 () Bool)

(declare-fun e!630770 () Bool)

(assert (=> b!1104807 (= e!630770 tp_is_empty!27301)))

(declare-fun mapIsEmpty!42763 () Bool)

(declare-fun mapRes!42763 () Bool)

(assert (=> mapIsEmpty!42763 mapRes!42763))

(declare-fun mapNonEmpty!42763 () Bool)

(declare-fun tp!81683 () Bool)

(declare-fun e!630771 () Bool)

(assert (=> mapNonEmpty!42763 (= mapRes!42763 (and tp!81683 e!630771))))

(declare-fun mapValue!42763 () ValueCell!12941)

(declare-fun mapRest!42763 () (Array (_ BitVec 32) ValueCell!12941))

(declare-fun mapKey!42763 () (_ BitVec 32))

(assert (=> mapNonEmpty!42763 (= mapRest!42754 (store mapRest!42763 mapKey!42763 mapValue!42763))))

(declare-fun b!1104806 () Bool)

(assert (=> b!1104806 (= e!630771 tp_is_empty!27301)))

(declare-fun condMapEmpty!42763 () Bool)

(declare-fun mapDefault!42763 () ValueCell!12941)

(assert (=> mapNonEmpty!42754 (= condMapEmpty!42763 (= mapRest!42754 ((as const (Array (_ BitVec 32) ValueCell!12941)) mapDefault!42763)))))

(assert (=> mapNonEmpty!42754 (= tp!81674 (and e!630770 mapRes!42763))))

(assert (= (and mapNonEmpty!42754 condMapEmpty!42763) mapIsEmpty!42763))

(assert (= (and mapNonEmpty!42754 (not condMapEmpty!42763)) mapNonEmpty!42763))

(assert (= (and mapNonEmpty!42763 ((_ is ValueCellFull!12941) mapValue!42763)) b!1104806))

(assert (= (and mapNonEmpty!42754 ((_ is ValueCellFull!12941) mapDefault!42763)) b!1104807))

(declare-fun m!1025303 () Bool)

(assert (=> mapNonEmpty!42763 m!1025303))

(check-sat (not b!1104785) (not b!1104799) tp_is_empty!27301 (not d!131299) (not mapNonEmpty!42763) (not b!1104793) (not b!1104798) (not bm!46389) (not d!131293) (not b!1104791) (not b!1104782))
(check-sat)
