; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97220 () Bool)

(assert start!97220)

(declare-fun res!736573 () Bool)

(declare-fun e!630633 () Bool)

(assert (=> start!97220 (=> (not res!736573) (not e!630633))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!71549 0))(
  ( (array!71550 (arr!34427 (Array (_ BitVec 32) (_ BitVec 64))) (size!34964 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71549)

(assert (=> start!97220 (= res!736573 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34964 _keys!1208))))))

(assert (=> start!97220 e!630633))

(declare-fun array_inv!26546 (array!71549) Bool)

(assert (=> start!97220 (array_inv!26546 _keys!1208)))

(assert (=> start!97220 true))

(declare-datatypes ((V!41521 0))(
  ( (V!41522 (val!13704 Int)) )
))
(declare-datatypes ((ValueCell!12938 0))(
  ( (ValueCellFull!12938 (v!16331 V!41521)) (EmptyCell!12938) )
))
(declare-datatypes ((array!71551 0))(
  ( (array!71552 (arr!34428 (Array (_ BitVec 32) ValueCell!12938)) (size!34965 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71551)

(declare-fun e!630637 () Bool)

(declare-fun array_inv!26547 (array!71551) Bool)

(assert (=> start!97220 (and (array_inv!26547 _values!996) e!630637)))

(declare-fun b!1104602 () Bool)

(declare-fun res!736572 () Bool)

(assert (=> b!1104602 (=> (not res!736572) (not e!630633))))

(assert (=> b!1104602 (= res!736572 (and (bvsle #b00000000000000000000000000000000 (size!34964 _keys!1208)) (bvslt (size!34964 _keys!1208) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!42742 () Bool)

(declare-fun mapRes!42742 () Bool)

(assert (=> mapIsEmpty!42742 mapRes!42742))

(declare-fun b!1104603 () Bool)

(declare-datatypes ((List!24056 0))(
  ( (Nil!24053) (Cons!24052 (h!25270 (_ BitVec 64)) (t!34313 List!24056)) )
))
(declare-fun noDuplicate!1594 (List!24056) Bool)

(assert (=> b!1104603 (= e!630633 (not (noDuplicate!1594 Nil!24053)))))

(declare-fun b!1104604 () Bool)

(declare-fun res!736574 () Bool)

(assert (=> b!1104604 (=> (not res!736574) (not e!630633))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1104604 (= res!736574 (validMask!0 mask!1564))))

(declare-fun b!1104605 () Bool)

(declare-fun res!736575 () Bool)

(assert (=> b!1104605 (=> (not res!736575) (not e!630633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71549 (_ BitVec 32)) Bool)

(assert (=> b!1104605 (= res!736575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1104606 () Bool)

(declare-fun res!736576 () Bool)

(assert (=> b!1104606 (=> (not res!736576) (not e!630633))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1104606 (= res!736576 (and (= (size!34965 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34964 _keys!1208) (size!34965 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1104607 () Bool)

(declare-fun e!630636 () Bool)

(assert (=> b!1104607 (= e!630637 (and e!630636 mapRes!42742))))

(declare-fun condMapEmpty!42742 () Bool)

(declare-fun mapDefault!42742 () ValueCell!12938)

(assert (=> b!1104607 (= condMapEmpty!42742 (= (arr!34428 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12938)) mapDefault!42742)))))

(declare-fun mapNonEmpty!42742 () Bool)

(declare-fun tp!81662 () Bool)

(declare-fun e!630634 () Bool)

(assert (=> mapNonEmpty!42742 (= mapRes!42742 (and tp!81662 e!630634))))

(declare-fun mapKey!42742 () (_ BitVec 32))

(declare-fun mapRest!42742 () (Array (_ BitVec 32) ValueCell!12938))

(declare-fun mapValue!42742 () ValueCell!12938)

(assert (=> mapNonEmpty!42742 (= (arr!34428 _values!996) (store mapRest!42742 mapKey!42742 mapValue!42742))))

(declare-fun b!1104608 () Bool)

(declare-fun tp_is_empty!27295 () Bool)

(assert (=> b!1104608 (= e!630636 tp_is_empty!27295)))

(declare-fun b!1104609 () Bool)

(assert (=> b!1104609 (= e!630634 tp_is_empty!27295)))

(assert (= (and start!97220 res!736573) b!1104604))

(assert (= (and b!1104604 res!736574) b!1104606))

(assert (= (and b!1104606 res!736576) b!1104605))

(assert (= (and b!1104605 res!736575) b!1104602))

(assert (= (and b!1104602 res!736572) b!1104603))

(assert (= (and b!1104607 condMapEmpty!42742) mapIsEmpty!42742))

(assert (= (and b!1104607 (not condMapEmpty!42742)) mapNonEmpty!42742))

(get-info :version)

(assert (= (and mapNonEmpty!42742 ((_ is ValueCellFull!12938) mapValue!42742)) b!1104609))

(assert (= (and b!1104607 ((_ is ValueCellFull!12938) mapDefault!42742)) b!1104608))

(assert (= start!97220 b!1104607))

(declare-fun m!1025175 () Bool)

(assert (=> b!1104603 m!1025175))

(declare-fun m!1025177 () Bool)

(assert (=> b!1104604 m!1025177))

(declare-fun m!1025179 () Bool)

(assert (=> start!97220 m!1025179))

(declare-fun m!1025181 () Bool)

(assert (=> start!97220 m!1025181))

(declare-fun m!1025183 () Bool)

(assert (=> mapNonEmpty!42742 m!1025183))

(declare-fun m!1025185 () Bool)

(assert (=> b!1104605 m!1025185))

(check-sat tp_is_empty!27295 (not b!1104605) (not b!1104604) (not mapNonEmpty!42742) (not b!1104603) (not start!97220))
(check-sat)
(get-model)

(declare-fun d!131277 () Bool)

(assert (=> d!131277 (= (array_inv!26546 _keys!1208) (bvsge (size!34964 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!97220 d!131277))

(declare-fun d!131279 () Bool)

(assert (=> d!131279 (= (array_inv!26547 _values!996) (bvsge (size!34965 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!97220 d!131279))

(declare-fun b!1104666 () Bool)

(declare-fun e!630676 () Bool)

(declare-fun e!630674 () Bool)

(assert (=> b!1104666 (= e!630676 e!630674)))

(declare-fun lt!495573 () (_ BitVec 64))

(assert (=> b!1104666 (= lt!495573 (select (arr!34427 _keys!1208) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!36233 0))(
  ( (Unit!36234) )
))
(declare-fun lt!495574 () Unit!36233)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71549 (_ BitVec 64) (_ BitVec 32)) Unit!36233)

(assert (=> b!1104666 (= lt!495574 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!495573 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!71549 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1104666 (arrayContainsKey!0 _keys!1208 lt!495573 #b00000000000000000000000000000000)))

(declare-fun lt!495575 () Unit!36233)

(assert (=> b!1104666 (= lt!495575 lt!495574)))

(declare-fun res!736612 () Bool)

(declare-datatypes ((SeekEntryResult!9875 0))(
  ( (MissingZero!9875 (index!41871 (_ BitVec 32))) (Found!9875 (index!41872 (_ BitVec 32))) (Intermediate!9875 (undefined!10687 Bool) (index!41873 (_ BitVec 32)) (x!99216 (_ BitVec 32))) (Undefined!9875) (MissingVacant!9875 (index!41874 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71549 (_ BitVec 32)) SeekEntryResult!9875)

(assert (=> b!1104666 (= res!736612 (= (seekEntryOrOpen!0 (select (arr!34427 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9875 #b00000000000000000000000000000000)))))

(assert (=> b!1104666 (=> (not res!736612) (not e!630674))))

(declare-fun bm!46386 () Bool)

(declare-fun call!46389 () Bool)

(assert (=> bm!46386 (= call!46389 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1104667 () Bool)

(assert (=> b!1104667 (= e!630674 call!46389)))

(declare-fun d!131281 () Bool)

(declare-fun res!736611 () Bool)

(declare-fun e!630675 () Bool)

(assert (=> d!131281 (=> res!736611 e!630675)))

(assert (=> d!131281 (= res!736611 (bvsge #b00000000000000000000000000000000 (size!34964 _keys!1208)))))

(assert (=> d!131281 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!630675)))

(declare-fun b!1104668 () Bool)

(assert (=> b!1104668 (= e!630676 call!46389)))

(declare-fun b!1104669 () Bool)

(assert (=> b!1104669 (= e!630675 e!630676)))

(declare-fun c!109386 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1104669 (= c!109386 (validKeyInArray!0 (select (arr!34427 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!131281 (not res!736611)) b!1104669))

(assert (= (and b!1104669 c!109386) b!1104666))

(assert (= (and b!1104669 (not c!109386)) b!1104668))

(assert (= (and b!1104666 res!736612) b!1104667))

(assert (= (or b!1104667 b!1104668) bm!46386))

(declare-fun m!1025211 () Bool)

(assert (=> b!1104666 m!1025211))

(declare-fun m!1025213 () Bool)

(assert (=> b!1104666 m!1025213))

(declare-fun m!1025215 () Bool)

(assert (=> b!1104666 m!1025215))

(assert (=> b!1104666 m!1025211))

(declare-fun m!1025217 () Bool)

(assert (=> b!1104666 m!1025217))

(declare-fun m!1025219 () Bool)

(assert (=> bm!46386 m!1025219))

(assert (=> b!1104669 m!1025211))

(assert (=> b!1104669 m!1025211))

(declare-fun m!1025221 () Bool)

(assert (=> b!1104669 m!1025221))

(assert (=> b!1104605 d!131281))

(declare-fun d!131283 () Bool)

(assert (=> d!131283 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1104604 d!131283))

(declare-fun d!131285 () Bool)

(declare-fun res!736617 () Bool)

(declare-fun e!630681 () Bool)

(assert (=> d!131285 (=> res!736617 e!630681)))

(assert (=> d!131285 (= res!736617 ((_ is Nil!24053) Nil!24053))))

(assert (=> d!131285 (= (noDuplicate!1594 Nil!24053) e!630681)))

(declare-fun b!1104674 () Bool)

(declare-fun e!630682 () Bool)

(assert (=> b!1104674 (= e!630681 e!630682)))

(declare-fun res!736618 () Bool)

(assert (=> b!1104674 (=> (not res!736618) (not e!630682))))

(declare-fun contains!6435 (List!24056 (_ BitVec 64)) Bool)

(assert (=> b!1104674 (= res!736618 (not (contains!6435 (t!34313 Nil!24053) (h!25270 Nil!24053))))))

(declare-fun b!1104675 () Bool)

(assert (=> b!1104675 (= e!630682 (noDuplicate!1594 (t!34313 Nil!24053)))))

(assert (= (and d!131285 (not res!736617)) b!1104674))

(assert (= (and b!1104674 res!736618) b!1104675))

(declare-fun m!1025223 () Bool)

(assert (=> b!1104674 m!1025223))

(declare-fun m!1025225 () Bool)

(assert (=> b!1104675 m!1025225))

(assert (=> b!1104603 d!131285))

(declare-fun mapIsEmpty!42751 () Bool)

(declare-fun mapRes!42751 () Bool)

(assert (=> mapIsEmpty!42751 mapRes!42751))

(declare-fun b!1104683 () Bool)

(declare-fun e!630688 () Bool)

(assert (=> b!1104683 (= e!630688 tp_is_empty!27295)))

(declare-fun mapNonEmpty!42751 () Bool)

(declare-fun tp!81671 () Bool)

(declare-fun e!630687 () Bool)

(assert (=> mapNonEmpty!42751 (= mapRes!42751 (and tp!81671 e!630687))))

(declare-fun mapRest!42751 () (Array (_ BitVec 32) ValueCell!12938))

(declare-fun mapValue!42751 () ValueCell!12938)

(declare-fun mapKey!42751 () (_ BitVec 32))

(assert (=> mapNonEmpty!42751 (= mapRest!42742 (store mapRest!42751 mapKey!42751 mapValue!42751))))

(declare-fun b!1104682 () Bool)

(assert (=> b!1104682 (= e!630687 tp_is_empty!27295)))

(declare-fun condMapEmpty!42751 () Bool)

(declare-fun mapDefault!42751 () ValueCell!12938)

(assert (=> mapNonEmpty!42742 (= condMapEmpty!42751 (= mapRest!42742 ((as const (Array (_ BitVec 32) ValueCell!12938)) mapDefault!42751)))))

(assert (=> mapNonEmpty!42742 (= tp!81662 (and e!630688 mapRes!42751))))

(assert (= (and mapNonEmpty!42742 condMapEmpty!42751) mapIsEmpty!42751))

(assert (= (and mapNonEmpty!42742 (not condMapEmpty!42751)) mapNonEmpty!42751))

(assert (= (and mapNonEmpty!42751 ((_ is ValueCellFull!12938) mapValue!42751)) b!1104682))

(assert (= (and mapNonEmpty!42742 ((_ is ValueCellFull!12938) mapDefault!42751)) b!1104683))

(declare-fun m!1025227 () Bool)

(assert (=> mapNonEmpty!42751 m!1025227))

(check-sat (not mapNonEmpty!42751) (not b!1104669) (not b!1104666) (not bm!46386) (not b!1104674) tp_is_empty!27295 (not b!1104675))
(check-sat)
