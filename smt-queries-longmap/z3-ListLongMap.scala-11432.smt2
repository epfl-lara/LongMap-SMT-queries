; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133310 () Bool)

(assert start!133310)

(declare-fun mapNonEmpty!59076 () Bool)

(declare-fun mapRes!59076 () Bool)

(declare-fun tp!112732 () Bool)

(declare-fun e!868607 () Bool)

(assert (=> mapNonEmpty!59076 (= mapRes!59076 (and tp!112732 e!868607))))

(declare-fun mapKey!59076 () (_ BitVec 32))

(declare-datatypes ((V!59505 0))(
  ( (V!59506 (val!19320 Int)) )
))
(declare-datatypes ((ValueCell!18206 0))(
  ( (ValueCellFull!18206 (v!22067 V!59505)) (EmptyCell!18206) )
))
(declare-datatypes ((array!103592 0))(
  ( (array!103593 (arr!49992 (Array (_ BitVec 32) ValueCell!18206)) (size!50544 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103592)

(declare-fun mapRest!59076 () (Array (_ BitVec 32) ValueCell!18206))

(declare-fun mapValue!59076 () ValueCell!18206)

(assert (=> mapNonEmpty!59076 (= (arr!49992 _values!487) (store mapRest!59076 mapKey!59076 mapValue!59076))))

(declare-fun b!1558977 () Bool)

(declare-fun e!868603 () Bool)

(declare-fun tp_is_empty!38473 () Bool)

(assert (=> b!1558977 (= e!868603 tp_is_empty!38473)))

(declare-fun b!1558978 () Bool)

(declare-fun e!868606 () Bool)

(declare-datatypes ((array!103594 0))(
  ( (array!103595 (arr!49993 (Array (_ BitVec 32) (_ BitVec 64))) (size!50545 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103594)

(assert (=> b!1558978 (= e!868606 (and (bvsle #b00000000000000000000000000000000 (size!50545 _keys!637)) (bvsge (size!50545 _keys!637) #b01111111111111111111111111111111)))))

(declare-fun b!1558979 () Bool)

(declare-fun res!1066186 () Bool)

(assert (=> b!1558979 (=> (not res!1066186) (not e!868606))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103594 (_ BitVec 32)) Bool)

(assert (=> b!1558979 (= res!1066186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun res!1066185 () Bool)

(assert (=> start!133310 (=> (not res!1066185) (not e!868606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133310 (= res!1066185 (validMask!0 mask!947))))

(assert (=> start!133310 e!868606))

(assert (=> start!133310 true))

(declare-fun e!868605 () Bool)

(declare-fun array_inv!39065 (array!103592) Bool)

(assert (=> start!133310 (and (array_inv!39065 _values!487) e!868605)))

(declare-fun array_inv!39066 (array!103594) Bool)

(assert (=> start!133310 (array_inv!39066 _keys!637)))

(declare-fun b!1558980 () Bool)

(assert (=> b!1558980 (= e!868607 tp_is_empty!38473)))

(declare-fun b!1558981 () Bool)

(declare-fun res!1066184 () Bool)

(assert (=> b!1558981 (=> (not res!1066184) (not e!868606))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1558981 (= res!1066184 (and (= (size!50544 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50545 _keys!637) (size!50544 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!59076 () Bool)

(assert (=> mapIsEmpty!59076 mapRes!59076))

(declare-fun b!1558982 () Bool)

(assert (=> b!1558982 (= e!868605 (and e!868603 mapRes!59076))))

(declare-fun condMapEmpty!59076 () Bool)

(declare-fun mapDefault!59076 () ValueCell!18206)

(assert (=> b!1558982 (= condMapEmpty!59076 (= (arr!49992 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18206)) mapDefault!59076)))))

(assert (= (and start!133310 res!1066185) b!1558981))

(assert (= (and b!1558981 res!1066184) b!1558979))

(assert (= (and b!1558979 res!1066186) b!1558978))

(assert (= (and b!1558982 condMapEmpty!59076) mapIsEmpty!59076))

(assert (= (and b!1558982 (not condMapEmpty!59076)) mapNonEmpty!59076))

(get-info :version)

(assert (= (and mapNonEmpty!59076 ((_ is ValueCellFull!18206) mapValue!59076)) b!1558980))

(assert (= (and b!1558982 ((_ is ValueCellFull!18206) mapDefault!59076)) b!1558977))

(assert (= start!133310 b!1558982))

(declare-fun m!1434699 () Bool)

(assert (=> mapNonEmpty!59076 m!1434699))

(declare-fun m!1434701 () Bool)

(assert (=> b!1558979 m!1434701))

(declare-fun m!1434703 () Bool)

(assert (=> start!133310 m!1434703))

(declare-fun m!1434705 () Bool)

(assert (=> start!133310 m!1434705))

(declare-fun m!1434707 () Bool)

(assert (=> start!133310 m!1434707))

(check-sat (not start!133310) (not b!1558979) (not mapNonEmpty!59076) tp_is_empty!38473)
(check-sat)
(get-model)

(declare-fun d!162659 () Bool)

(assert (=> d!162659 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!133310 d!162659))

(declare-fun d!162661 () Bool)

(assert (=> d!162661 (= (array_inv!39065 _values!487) (bvsge (size!50544 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!133310 d!162661))

(declare-fun d!162663 () Bool)

(assert (=> d!162663 (= (array_inv!39066 _keys!637) (bvsge (size!50545 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!133310 d!162663))

(declare-fun b!1559027 () Bool)

(declare-fun e!868646 () Bool)

(declare-fun call!71803 () Bool)

(assert (=> b!1559027 (= e!868646 call!71803)))

(declare-fun d!162665 () Bool)

(declare-fun res!1066209 () Bool)

(declare-fun e!868644 () Bool)

(assert (=> d!162665 (=> res!1066209 e!868644)))

(assert (=> d!162665 (= res!1066209 (bvsge #b00000000000000000000000000000000 (size!50545 _keys!637)))))

(assert (=> d!162665 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!868644)))

(declare-fun b!1559028 () Bool)

(declare-fun e!868645 () Bool)

(assert (=> b!1559028 (= e!868645 call!71803)))

(declare-fun b!1559029 () Bool)

(assert (=> b!1559029 (= e!868646 e!868645)))

(declare-fun lt!670580 () (_ BitVec 64))

(assert (=> b!1559029 (= lt!670580 (select (arr!49993 _keys!637) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51712 0))(
  ( (Unit!51713) )
))
(declare-fun lt!670581 () Unit!51712)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!103594 (_ BitVec 64) (_ BitVec 32)) Unit!51712)

(assert (=> b!1559029 (= lt!670581 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!670580 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!103594 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1559029 (arrayContainsKey!0 _keys!637 lt!670580 #b00000000000000000000000000000000)))

(declare-fun lt!670582 () Unit!51712)

(assert (=> b!1559029 (= lt!670582 lt!670581)))

(declare-fun res!1066210 () Bool)

(declare-datatypes ((SeekEntryResult!13518 0))(
  ( (MissingZero!13518 (index!56470 (_ BitVec 32))) (Found!13518 (index!56471 (_ BitVec 32))) (Intermediate!13518 (undefined!14330 Bool) (index!56472 (_ BitVec 32)) (x!139759 (_ BitVec 32))) (Undefined!13518) (MissingVacant!13518 (index!56473 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!103594 (_ BitVec 32)) SeekEntryResult!13518)

(assert (=> b!1559029 (= res!1066210 (= (seekEntryOrOpen!0 (select (arr!49993 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13518 #b00000000000000000000000000000000)))))

(assert (=> b!1559029 (=> (not res!1066210) (not e!868645))))

(declare-fun b!1559030 () Bool)

(assert (=> b!1559030 (= e!868644 e!868646)))

(declare-fun c!144129 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1559030 (= c!144129 (validKeyInArray!0 (select (arr!49993 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun bm!71800 () Bool)

(assert (=> bm!71800 (= call!71803 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(assert (= (and d!162665 (not res!1066209)) b!1559030))

(assert (= (and b!1559030 c!144129) b!1559029))

(assert (= (and b!1559030 (not c!144129)) b!1559027))

(assert (= (and b!1559029 res!1066210) b!1559028))

(assert (= (or b!1559028 b!1559027) bm!71800))

(declare-fun m!1434729 () Bool)

(assert (=> b!1559029 m!1434729))

(declare-fun m!1434731 () Bool)

(assert (=> b!1559029 m!1434731))

(declare-fun m!1434733 () Bool)

(assert (=> b!1559029 m!1434733))

(assert (=> b!1559029 m!1434729))

(declare-fun m!1434735 () Bool)

(assert (=> b!1559029 m!1434735))

(assert (=> b!1559030 m!1434729))

(assert (=> b!1559030 m!1434729))

(declare-fun m!1434737 () Bool)

(assert (=> b!1559030 m!1434737))

(declare-fun m!1434739 () Bool)

(assert (=> bm!71800 m!1434739))

(assert (=> b!1558979 d!162665))

(declare-fun b!1559038 () Bool)

(declare-fun e!868651 () Bool)

(assert (=> b!1559038 (= e!868651 tp_is_empty!38473)))

(declare-fun mapIsEmpty!59085 () Bool)

(declare-fun mapRes!59085 () Bool)

(assert (=> mapIsEmpty!59085 mapRes!59085))

(declare-fun mapNonEmpty!59085 () Bool)

(declare-fun tp!112741 () Bool)

(declare-fun e!868652 () Bool)

(assert (=> mapNonEmpty!59085 (= mapRes!59085 (and tp!112741 e!868652))))

(declare-fun mapRest!59085 () (Array (_ BitVec 32) ValueCell!18206))

(declare-fun mapKey!59085 () (_ BitVec 32))

(declare-fun mapValue!59085 () ValueCell!18206)

(assert (=> mapNonEmpty!59085 (= mapRest!59076 (store mapRest!59085 mapKey!59085 mapValue!59085))))

(declare-fun b!1559037 () Bool)

(assert (=> b!1559037 (= e!868652 tp_is_empty!38473)))

(declare-fun condMapEmpty!59085 () Bool)

(declare-fun mapDefault!59085 () ValueCell!18206)

(assert (=> mapNonEmpty!59076 (= condMapEmpty!59085 (= mapRest!59076 ((as const (Array (_ BitVec 32) ValueCell!18206)) mapDefault!59085)))))

(assert (=> mapNonEmpty!59076 (= tp!112732 (and e!868651 mapRes!59085))))

(assert (= (and mapNonEmpty!59076 condMapEmpty!59085) mapIsEmpty!59085))

(assert (= (and mapNonEmpty!59076 (not condMapEmpty!59085)) mapNonEmpty!59085))

(assert (= (and mapNonEmpty!59085 ((_ is ValueCellFull!18206) mapValue!59085)) b!1559037))

(assert (= (and mapNonEmpty!59076 ((_ is ValueCellFull!18206) mapDefault!59085)) b!1559038))

(declare-fun m!1434741 () Bool)

(assert (=> mapNonEmpty!59085 m!1434741))

(check-sat (not mapNonEmpty!59085) (not bm!71800) (not b!1559029) tp_is_empty!38473 (not b!1559030))
(check-sat)
