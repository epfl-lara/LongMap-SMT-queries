; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97322 () Bool)

(assert start!97322)

(declare-fun b!1105561 () Bool)

(declare-fun e!631165 () Bool)

(declare-fun e!631168 () Bool)

(assert (=> b!1105561 (= e!631165 e!631168)))

(declare-fun res!737220 () Bool)

(assert (=> b!1105561 (=> res!737220 e!631168)))

(declare-datatypes ((List!24074 0))(
  ( (Nil!24071) (Cons!24070 (h!25288 (_ BitVec 64)) (t!34331 List!24074)) )
))
(declare-fun contains!6440 (List!24074 (_ BitVec 64)) Bool)

(assert (=> b!1105561 (= res!737220 (contains!6440 Nil!24071 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1105562 () Bool)

(declare-fun e!631166 () Bool)

(declare-fun tp_is_empty!27349 () Bool)

(assert (=> b!1105562 (= e!631166 tp_is_empty!27349)))

(declare-fun b!1105563 () Bool)

(declare-fun res!737216 () Bool)

(assert (=> b!1105563 (=> (not res!737216) (not e!631165))))

(declare-datatypes ((array!71655 0))(
  ( (array!71656 (arr!34476 (Array (_ BitVec 32) (_ BitVec 64))) (size!35013 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71655)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1105563 (= res!737216 (= (select (arr!34476 _keys!1208) i!673) k0!934))))

(declare-fun b!1105564 () Bool)

(declare-fun e!631167 () Bool)

(declare-fun e!631169 () Bool)

(declare-fun mapRes!42835 () Bool)

(assert (=> b!1105564 (= e!631167 (and e!631169 mapRes!42835))))

(declare-fun condMapEmpty!42835 () Bool)

(declare-datatypes ((V!41593 0))(
  ( (V!41594 (val!13731 Int)) )
))
(declare-datatypes ((ValueCell!12965 0))(
  ( (ValueCellFull!12965 (v!16359 V!41593)) (EmptyCell!12965) )
))
(declare-datatypes ((array!71657 0))(
  ( (array!71658 (arr!34477 (Array (_ BitVec 32) ValueCell!12965)) (size!35014 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71657)

(declare-fun mapDefault!42835 () ValueCell!12965)

(assert (=> b!1105564 (= condMapEmpty!42835 (= (arr!34477 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12965)) mapDefault!42835)))))

(declare-fun b!1105565 () Bool)

(assert (=> b!1105565 (= e!631168 (contains!6440 Nil!24071 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!42835 () Bool)

(declare-fun tp!81755 () Bool)

(assert (=> mapNonEmpty!42835 (= mapRes!42835 (and tp!81755 e!631166))))

(declare-fun mapValue!42835 () ValueCell!12965)

(declare-fun mapRest!42835 () (Array (_ BitVec 32) ValueCell!12965))

(declare-fun mapKey!42835 () (_ BitVec 32))

(assert (=> mapNonEmpty!42835 (= (arr!34477 _values!996) (store mapRest!42835 mapKey!42835 mapValue!42835))))

(declare-fun b!1105566 () Bool)

(declare-fun res!737223 () Bool)

(assert (=> b!1105566 (=> (not res!737223) (not e!631165))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105566 (= res!737223 (validMask!0 mask!1564))))

(declare-fun b!1105567 () Bool)

(declare-fun res!737222 () Bool)

(assert (=> b!1105567 (=> (not res!737222) (not e!631165))))

(assert (=> b!1105567 (= res!737222 (and (bvsle #b00000000000000000000000000000000 (size!35013 _keys!1208)) (bvslt (size!35013 _keys!1208) #b01111111111111111111111111111111)))))

(declare-fun b!1105568 () Bool)

(declare-fun res!737226 () Bool)

(assert (=> b!1105568 (=> (not res!737226) (not e!631165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71655 (_ BitVec 32)) Bool)

(assert (=> b!1105568 (= res!737226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!71656 (store (arr!34476 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35013 _keys!1208)) mask!1564))))

(declare-fun b!1105569 () Bool)

(declare-fun res!737227 () Bool)

(assert (=> b!1105569 (=> (not res!737227) (not e!631165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105569 (= res!737227 (validKeyInArray!0 k0!934))))

(declare-fun b!1105570 () Bool)

(assert (=> b!1105570 (= e!631169 tp_is_empty!27349)))

(declare-fun b!1105571 () Bool)

(declare-fun res!737221 () Bool)

(assert (=> b!1105571 (=> (not res!737221) (not e!631165))))

(assert (=> b!1105571 (= res!737221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!737225 () Bool)

(assert (=> start!97322 (=> (not res!737225) (not e!631165))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97322 (= res!737225 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35013 _keys!1208))))))

(assert (=> start!97322 e!631165))

(declare-fun array_inv!26578 (array!71655) Bool)

(assert (=> start!97322 (array_inv!26578 _keys!1208)))

(assert (=> start!97322 true))

(declare-fun array_inv!26579 (array!71657) Bool)

(assert (=> start!97322 (and (array_inv!26579 _values!996) e!631167)))

(declare-fun b!1105572 () Bool)

(declare-fun res!737218 () Bool)

(assert (=> b!1105572 (=> (not res!737218) (not e!631165))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1105572 (= res!737218 (and (= (size!35014 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35013 _keys!1208) (size!35014 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1105573 () Bool)

(declare-fun res!737224 () Bool)

(assert (=> b!1105573 (=> (not res!737224) (not e!631165))))

(declare-fun noDuplicate!1600 (List!24074) Bool)

(assert (=> b!1105573 (= res!737224 (noDuplicate!1600 Nil!24071))))

(declare-fun b!1105574 () Bool)

(declare-fun res!737219 () Bool)

(assert (=> b!1105574 (=> (not res!737219) (not e!631165))))

(assert (=> b!1105574 (= res!737219 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35013 _keys!1208))))))

(declare-fun mapIsEmpty!42835 () Bool)

(assert (=> mapIsEmpty!42835 mapRes!42835))

(declare-fun b!1105575 () Bool)

(declare-fun res!737217 () Bool)

(assert (=> b!1105575 (=> (not res!737217) (not e!631165))))

(declare-fun arrayNoDuplicates!0 (array!71655 (_ BitVec 32) List!24074) Bool)

(assert (=> b!1105575 (= res!737217 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24071))))

(assert (= (and start!97322 res!737225) b!1105566))

(assert (= (and b!1105566 res!737223) b!1105572))

(assert (= (and b!1105572 res!737218) b!1105571))

(assert (= (and b!1105571 res!737221) b!1105575))

(assert (= (and b!1105575 res!737217) b!1105574))

(assert (= (and b!1105574 res!737219) b!1105569))

(assert (= (and b!1105569 res!737227) b!1105563))

(assert (= (and b!1105563 res!737216) b!1105568))

(assert (= (and b!1105568 res!737226) b!1105567))

(assert (= (and b!1105567 res!737222) b!1105573))

(assert (= (and b!1105573 res!737224) b!1105561))

(assert (= (and b!1105561 (not res!737220)) b!1105565))

(assert (= (and b!1105564 condMapEmpty!42835) mapIsEmpty!42835))

(assert (= (and b!1105564 (not condMapEmpty!42835)) mapNonEmpty!42835))

(get-info :version)

(assert (= (and mapNonEmpty!42835 ((_ is ValueCellFull!12965) mapValue!42835)) b!1105562))

(assert (= (and b!1105564 ((_ is ValueCellFull!12965) mapDefault!42835)) b!1105570))

(assert (= start!97322 b!1105564))

(declare-fun m!1025723 () Bool)

(assert (=> b!1105566 m!1025723))

(declare-fun m!1025725 () Bool)

(assert (=> b!1105571 m!1025725))

(declare-fun m!1025727 () Bool)

(assert (=> b!1105569 m!1025727))

(declare-fun m!1025729 () Bool)

(assert (=> b!1105568 m!1025729))

(declare-fun m!1025731 () Bool)

(assert (=> b!1105568 m!1025731))

(declare-fun m!1025733 () Bool)

(assert (=> b!1105565 m!1025733))

(declare-fun m!1025735 () Bool)

(assert (=> b!1105573 m!1025735))

(declare-fun m!1025737 () Bool)

(assert (=> mapNonEmpty!42835 m!1025737))

(declare-fun m!1025739 () Bool)

(assert (=> b!1105575 m!1025739))

(declare-fun m!1025741 () Bool)

(assert (=> b!1105563 m!1025741))

(declare-fun m!1025743 () Bool)

(assert (=> b!1105561 m!1025743))

(declare-fun m!1025745 () Bool)

(assert (=> start!97322 m!1025745))

(declare-fun m!1025747 () Bool)

(assert (=> start!97322 m!1025747))

(check-sat (not b!1105566) (not start!97322) (not mapNonEmpty!42835) (not b!1105575) (not b!1105569) (not b!1105565) (not b!1105573) (not b!1105571) (not b!1105568) (not b!1105561) tp_is_empty!27349)
(check-sat)
(get-model)

(declare-fun d!131349 () Bool)

(declare-fun lt!495633 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!541 (List!24074) (InoxSet (_ BitVec 64)))

(assert (=> d!131349 (= lt!495633 (select (content!541 Nil!24071) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!631211 () Bool)

(assert (=> d!131349 (= lt!495633 e!631211)))

(declare-fun res!737304 () Bool)

(assert (=> d!131349 (=> (not res!737304) (not e!631211))))

(assert (=> d!131349 (= res!737304 ((_ is Cons!24070) Nil!24071))))

(assert (=> d!131349 (= (contains!6440 Nil!24071 #b1000000000000000000000000000000000000000000000000000000000000000) lt!495633)))

(declare-fun b!1105670 () Bool)

(declare-fun e!631212 () Bool)

(assert (=> b!1105670 (= e!631211 e!631212)))

(declare-fun res!737305 () Bool)

(assert (=> b!1105670 (=> res!737305 e!631212)))

(assert (=> b!1105670 (= res!737305 (= (h!25288 Nil!24071) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1105671 () Bool)

(assert (=> b!1105671 (= e!631212 (contains!6440 (t!34331 Nil!24071) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!131349 res!737304) b!1105670))

(assert (= (and b!1105670 (not res!737305)) b!1105671))

(declare-fun m!1025801 () Bool)

(assert (=> d!131349 m!1025801))

(declare-fun m!1025803 () Bool)

(assert (=> d!131349 m!1025803))

(declare-fun m!1025805 () Bool)

(assert (=> b!1105671 m!1025805))

(assert (=> b!1105565 d!131349))

(declare-fun d!131351 () Bool)

(declare-fun lt!495634 () Bool)

(assert (=> d!131351 (= lt!495634 (select (content!541 Nil!24071) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!631213 () Bool)

(assert (=> d!131351 (= lt!495634 e!631213)))

(declare-fun res!737306 () Bool)

(assert (=> d!131351 (=> (not res!737306) (not e!631213))))

(assert (=> d!131351 (= res!737306 ((_ is Cons!24070) Nil!24071))))

(assert (=> d!131351 (= (contains!6440 Nil!24071 #b0000000000000000000000000000000000000000000000000000000000000000) lt!495634)))

(declare-fun b!1105672 () Bool)

(declare-fun e!631214 () Bool)

(assert (=> b!1105672 (= e!631213 e!631214)))

(declare-fun res!737307 () Bool)

(assert (=> b!1105672 (=> res!737307 e!631214)))

(assert (=> b!1105672 (= res!737307 (= (h!25288 Nil!24071) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1105673 () Bool)

(assert (=> b!1105673 (= e!631214 (contains!6440 (t!34331 Nil!24071) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!131351 res!737306) b!1105672))

(assert (= (and b!1105672 (not res!737307)) b!1105673))

(assert (=> d!131351 m!1025801))

(declare-fun m!1025807 () Bool)

(assert (=> d!131351 m!1025807))

(declare-fun m!1025809 () Bool)

(assert (=> b!1105673 m!1025809))

(assert (=> b!1105561 d!131351))

(declare-fun b!1105684 () Bool)

(declare-fun e!631225 () Bool)

(assert (=> b!1105684 (= e!631225 (contains!6440 Nil!24071 (select (arr!34476 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1105685 () Bool)

(declare-fun e!631226 () Bool)

(declare-fun e!631224 () Bool)

(assert (=> b!1105685 (= e!631226 e!631224)))

(declare-fun res!737314 () Bool)

(assert (=> b!1105685 (=> (not res!737314) (not e!631224))))

(assert (=> b!1105685 (= res!737314 (not e!631225))))

(declare-fun res!737315 () Bool)

(assert (=> b!1105685 (=> (not res!737315) (not e!631225))))

(assert (=> b!1105685 (= res!737315 (validKeyInArray!0 (select (arr!34476 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1105686 () Bool)

(declare-fun e!631223 () Bool)

(declare-fun call!46409 () Bool)

(assert (=> b!1105686 (= e!631223 call!46409)))

(declare-fun b!1105687 () Bool)

(assert (=> b!1105687 (= e!631224 e!631223)))

(declare-fun c!109406 () Bool)

(assert (=> b!1105687 (= c!109406 (validKeyInArray!0 (select (arr!34476 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1105688 () Bool)

(assert (=> b!1105688 (= e!631223 call!46409)))

(declare-fun d!131353 () Bool)

(declare-fun res!737316 () Bool)

(assert (=> d!131353 (=> res!737316 e!631226)))

(assert (=> d!131353 (= res!737316 (bvsge #b00000000000000000000000000000000 (size!35013 _keys!1208)))))

(assert (=> d!131353 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24071) e!631226)))

(declare-fun bm!46406 () Bool)

(assert (=> bm!46406 (= call!46409 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!109406 (Cons!24070 (select (arr!34476 _keys!1208) #b00000000000000000000000000000000) Nil!24071) Nil!24071)))))

(assert (= (and d!131353 (not res!737316)) b!1105685))

(assert (= (and b!1105685 res!737315) b!1105684))

(assert (= (and b!1105685 res!737314) b!1105687))

(assert (= (and b!1105687 c!109406) b!1105686))

(assert (= (and b!1105687 (not c!109406)) b!1105688))

(assert (= (or b!1105686 b!1105688) bm!46406))

(declare-fun m!1025811 () Bool)

(assert (=> b!1105684 m!1025811))

(assert (=> b!1105684 m!1025811))

(declare-fun m!1025813 () Bool)

(assert (=> b!1105684 m!1025813))

(assert (=> b!1105685 m!1025811))

(assert (=> b!1105685 m!1025811))

(declare-fun m!1025815 () Bool)

(assert (=> b!1105685 m!1025815))

(assert (=> b!1105687 m!1025811))

(assert (=> b!1105687 m!1025811))

(assert (=> b!1105687 m!1025815))

(assert (=> bm!46406 m!1025811))

(declare-fun m!1025817 () Bool)

(assert (=> bm!46406 m!1025817))

(assert (=> b!1105575 d!131353))

(declare-fun d!131355 () Bool)

(assert (=> d!131355 (= (array_inv!26578 _keys!1208) (bvsge (size!35013 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!97322 d!131355))

(declare-fun d!131357 () Bool)

(assert (=> d!131357 (= (array_inv!26579 _values!996) (bvsge (size!35014 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!97322 d!131357))

(declare-fun b!1105697 () Bool)

(declare-fun e!631234 () Bool)

(declare-fun e!631233 () Bool)

(assert (=> b!1105697 (= e!631234 e!631233)))

(declare-fun lt!495642 () (_ BitVec 64))

(assert (=> b!1105697 (= lt!495642 (select (arr!34476 _keys!1208) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!36241 0))(
  ( (Unit!36242) )
))
(declare-fun lt!495643 () Unit!36241)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71655 (_ BitVec 64) (_ BitVec 32)) Unit!36241)

(assert (=> b!1105697 (= lt!495643 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!495642 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!71655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1105697 (arrayContainsKey!0 _keys!1208 lt!495642 #b00000000000000000000000000000000)))

(declare-fun lt!495641 () Unit!36241)

(assert (=> b!1105697 (= lt!495641 lt!495643)))

(declare-fun res!737322 () Bool)

(declare-datatypes ((SeekEntryResult!9879 0))(
  ( (MissingZero!9879 (index!41887 (_ BitVec 32))) (Found!9879 (index!41888 (_ BitVec 32))) (Intermediate!9879 (undefined!10691 Bool) (index!41889 (_ BitVec 32)) (x!99300 (_ BitVec 32))) (Undefined!9879) (MissingVacant!9879 (index!41890 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71655 (_ BitVec 32)) SeekEntryResult!9879)

(assert (=> b!1105697 (= res!737322 (= (seekEntryOrOpen!0 (select (arr!34476 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9879 #b00000000000000000000000000000000)))))

(assert (=> b!1105697 (=> (not res!737322) (not e!631233))))

(declare-fun b!1105698 () Bool)

(declare-fun call!46412 () Bool)

(assert (=> b!1105698 (= e!631234 call!46412)))

(declare-fun d!131359 () Bool)

(declare-fun res!737321 () Bool)

(declare-fun e!631235 () Bool)

(assert (=> d!131359 (=> res!737321 e!631235)))

(assert (=> d!131359 (= res!737321 (bvsge #b00000000000000000000000000000000 (size!35013 _keys!1208)))))

(assert (=> d!131359 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!631235)))

(declare-fun b!1105699 () Bool)

(assert (=> b!1105699 (= e!631233 call!46412)))

(declare-fun b!1105700 () Bool)

(assert (=> b!1105700 (= e!631235 e!631234)))

(declare-fun c!109409 () Bool)

(assert (=> b!1105700 (= c!109409 (validKeyInArray!0 (select (arr!34476 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!46409 () Bool)

(assert (=> bm!46409 (= call!46412 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(assert (= (and d!131359 (not res!737321)) b!1105700))

(assert (= (and b!1105700 c!109409) b!1105697))

(assert (= (and b!1105700 (not c!109409)) b!1105698))

(assert (= (and b!1105697 res!737322) b!1105699))

(assert (= (or b!1105699 b!1105698) bm!46409))

(assert (=> b!1105697 m!1025811))

(declare-fun m!1025819 () Bool)

(assert (=> b!1105697 m!1025819))

(declare-fun m!1025821 () Bool)

(assert (=> b!1105697 m!1025821))

(assert (=> b!1105697 m!1025811))

(declare-fun m!1025823 () Bool)

(assert (=> b!1105697 m!1025823))

(assert (=> b!1105700 m!1025811))

(assert (=> b!1105700 m!1025811))

(assert (=> b!1105700 m!1025815))

(declare-fun m!1025825 () Bool)

(assert (=> bm!46409 m!1025825))

(assert (=> b!1105571 d!131359))

(declare-fun d!131361 () Bool)

(assert (=> d!131361 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1105566 d!131361))

(declare-fun d!131363 () Bool)

(declare-fun res!737327 () Bool)

(declare-fun e!631240 () Bool)

(assert (=> d!131363 (=> res!737327 e!631240)))

(assert (=> d!131363 (= res!737327 ((_ is Nil!24071) Nil!24071))))

(assert (=> d!131363 (= (noDuplicate!1600 Nil!24071) e!631240)))

(declare-fun b!1105705 () Bool)

(declare-fun e!631241 () Bool)

(assert (=> b!1105705 (= e!631240 e!631241)))

(declare-fun res!737328 () Bool)

(assert (=> b!1105705 (=> (not res!737328) (not e!631241))))

(assert (=> b!1105705 (= res!737328 (not (contains!6440 (t!34331 Nil!24071) (h!25288 Nil!24071))))))

(declare-fun b!1105706 () Bool)

(assert (=> b!1105706 (= e!631241 (noDuplicate!1600 (t!34331 Nil!24071)))))

(assert (= (and d!131363 (not res!737327)) b!1105705))

(assert (= (and b!1105705 res!737328) b!1105706))

(declare-fun m!1025827 () Bool)

(assert (=> b!1105705 m!1025827))

(declare-fun m!1025829 () Bool)

(assert (=> b!1105706 m!1025829))

(assert (=> b!1105573 d!131363))

(declare-fun b!1105707 () Bool)

(declare-fun e!631243 () Bool)

(declare-fun e!631242 () Bool)

(assert (=> b!1105707 (= e!631243 e!631242)))

(declare-fun lt!495645 () (_ BitVec 64))

(assert (=> b!1105707 (= lt!495645 (select (arr!34476 (array!71656 (store (arr!34476 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35013 _keys!1208))) #b00000000000000000000000000000000))))

(declare-fun lt!495646 () Unit!36241)

(assert (=> b!1105707 (= lt!495646 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71656 (store (arr!34476 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35013 _keys!1208)) lt!495645 #b00000000000000000000000000000000))))

(assert (=> b!1105707 (arrayContainsKey!0 (array!71656 (store (arr!34476 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35013 _keys!1208)) lt!495645 #b00000000000000000000000000000000)))

(declare-fun lt!495644 () Unit!36241)

(assert (=> b!1105707 (= lt!495644 lt!495646)))

(declare-fun res!737330 () Bool)

(assert (=> b!1105707 (= res!737330 (= (seekEntryOrOpen!0 (select (arr!34476 (array!71656 (store (arr!34476 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35013 _keys!1208))) #b00000000000000000000000000000000) (array!71656 (store (arr!34476 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35013 _keys!1208)) mask!1564) (Found!9879 #b00000000000000000000000000000000)))))

(assert (=> b!1105707 (=> (not res!737330) (not e!631242))))

(declare-fun b!1105708 () Bool)

(declare-fun call!46413 () Bool)

(assert (=> b!1105708 (= e!631243 call!46413)))

(declare-fun d!131365 () Bool)

(declare-fun res!737329 () Bool)

(declare-fun e!631244 () Bool)

(assert (=> d!131365 (=> res!737329 e!631244)))

(assert (=> d!131365 (= res!737329 (bvsge #b00000000000000000000000000000000 (size!35013 (array!71656 (store (arr!34476 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35013 _keys!1208)))))))

(assert (=> d!131365 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!71656 (store (arr!34476 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35013 _keys!1208)) mask!1564) e!631244)))

(declare-fun b!1105709 () Bool)

(assert (=> b!1105709 (= e!631242 call!46413)))

(declare-fun b!1105710 () Bool)

(assert (=> b!1105710 (= e!631244 e!631243)))

(declare-fun c!109410 () Bool)

(assert (=> b!1105710 (= c!109410 (validKeyInArray!0 (select (arr!34476 (array!71656 (store (arr!34476 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35013 _keys!1208))) #b00000000000000000000000000000000)))))

(declare-fun bm!46410 () Bool)

(assert (=> bm!46410 (= call!46413 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!71656 (store (arr!34476 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35013 _keys!1208)) mask!1564))))

(assert (= (and d!131365 (not res!737329)) b!1105710))

(assert (= (and b!1105710 c!109410) b!1105707))

(assert (= (and b!1105710 (not c!109410)) b!1105708))

(assert (= (and b!1105707 res!737330) b!1105709))

(assert (= (or b!1105709 b!1105708) bm!46410))

(declare-fun m!1025831 () Bool)

(assert (=> b!1105707 m!1025831))

(declare-fun m!1025833 () Bool)

(assert (=> b!1105707 m!1025833))

(declare-fun m!1025835 () Bool)

(assert (=> b!1105707 m!1025835))

(assert (=> b!1105707 m!1025831))

(declare-fun m!1025837 () Bool)

(assert (=> b!1105707 m!1025837))

(assert (=> b!1105710 m!1025831))

(assert (=> b!1105710 m!1025831))

(declare-fun m!1025839 () Bool)

(assert (=> b!1105710 m!1025839))

(declare-fun m!1025841 () Bool)

(assert (=> bm!46410 m!1025841))

(assert (=> b!1105568 d!131365))

(declare-fun d!131367 () Bool)

(assert (=> d!131367 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1105569 d!131367))

(declare-fun mapNonEmpty!42844 () Bool)

(declare-fun mapRes!42844 () Bool)

(declare-fun tp!81764 () Bool)

(declare-fun e!631249 () Bool)

(assert (=> mapNonEmpty!42844 (= mapRes!42844 (and tp!81764 e!631249))))

(declare-fun mapValue!42844 () ValueCell!12965)

(declare-fun mapKey!42844 () (_ BitVec 32))

(declare-fun mapRest!42844 () (Array (_ BitVec 32) ValueCell!12965))

(assert (=> mapNonEmpty!42844 (= mapRest!42835 (store mapRest!42844 mapKey!42844 mapValue!42844))))

(declare-fun b!1105718 () Bool)

(declare-fun e!631250 () Bool)

(assert (=> b!1105718 (= e!631250 tp_is_empty!27349)))

(declare-fun mapIsEmpty!42844 () Bool)

(assert (=> mapIsEmpty!42844 mapRes!42844))

(declare-fun b!1105717 () Bool)

(assert (=> b!1105717 (= e!631249 tp_is_empty!27349)))

(declare-fun condMapEmpty!42844 () Bool)

(declare-fun mapDefault!42844 () ValueCell!12965)

(assert (=> mapNonEmpty!42835 (= condMapEmpty!42844 (= mapRest!42835 ((as const (Array (_ BitVec 32) ValueCell!12965)) mapDefault!42844)))))

(assert (=> mapNonEmpty!42835 (= tp!81755 (and e!631250 mapRes!42844))))

(assert (= (and mapNonEmpty!42835 condMapEmpty!42844) mapIsEmpty!42844))

(assert (= (and mapNonEmpty!42835 (not condMapEmpty!42844)) mapNonEmpty!42844))

(assert (= (and mapNonEmpty!42844 ((_ is ValueCellFull!12965) mapValue!42844)) b!1105717))

(assert (= (and mapNonEmpty!42835 ((_ is ValueCellFull!12965) mapDefault!42844)) b!1105718))

(declare-fun m!1025843 () Bool)

(assert (=> mapNonEmpty!42844 m!1025843))

(check-sat (not b!1105705) (not b!1105710) (not bm!46409) (not b!1105700) (not b!1105706) (not b!1105697) (not bm!46406) (not b!1105707) tp_is_empty!27349 (not d!131349) (not b!1105673) (not b!1105685) (not mapNonEmpty!42844) (not bm!46410) (not b!1105684) (not b!1105687) (not d!131351) (not b!1105671))
(check-sat)
