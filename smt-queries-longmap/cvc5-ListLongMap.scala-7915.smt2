; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98234 () Bool)

(assert start!98234)

(declare-fun b_free!23935 () Bool)

(declare-fun b_next!23935 () Bool)

(assert (=> start!98234 (= b_free!23935 (not b_next!23935))))

(declare-fun tp!84509 () Bool)

(declare-fun b_and!38653 () Bool)

(assert (=> start!98234 (= tp!84509 b_and!38653)))

(declare-fun b!1131607 () Bool)

(declare-fun res!755953 () Bool)

(declare-fun e!643996 () Bool)

(assert (=> b!1131607 (=> (not res!755953) (not e!643996))))

(declare-datatypes ((array!73787 0))(
  ( (array!73788 (arr!35546 (Array (_ BitVec 32) (_ BitVec 64))) (size!36082 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73787)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73787 (_ BitVec 32)) Bool)

(assert (=> b!1131607 (= res!755953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1131608 () Bool)

(declare-fun e!644004 () Bool)

(assert (=> b!1131608 (= e!643996 e!644004)))

(declare-fun res!755951 () Bool)

(assert (=> b!1131608 (=> (not res!755951) (not e!644004))))

(declare-fun lt!502640 () array!73787)

(assert (=> b!1131608 (= res!755951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!502640 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1131608 (= lt!502640 (array!73788 (store (arr!35546 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36082 _keys!1208)))))

(declare-fun bm!48690 () Bool)

(declare-datatypes ((Unit!37070 0))(
  ( (Unit!37071) )
))
(declare-fun call!48696 () Unit!37070)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun c!110210 () Bool)

(declare-datatypes ((V!43081 0))(
  ( (V!43082 (val!14289 Int)) )
))
(declare-datatypes ((tuple2!18012 0))(
  ( (tuple2!18013 (_1!9017 (_ BitVec 64)) (_2!9017 V!43081)) )
))
(declare-datatypes ((List!24775 0))(
  ( (Nil!24772) (Cons!24771 (h!25980 tuple2!18012) (t!35702 List!24775)) )
))
(declare-datatypes ((ListLongMap!15981 0))(
  ( (ListLongMap!15982 (toList!8006 List!24775)) )
))
(declare-fun lt!502651 () ListLongMap!15981)

(declare-fun minValue!944 () V!43081)

(declare-fun lt!502642 () ListLongMap!15981)

(declare-fun zeroValue!944 () V!43081)

(declare-fun c!110207 () Bool)

(declare-fun addStillContains!713 (ListLongMap!15981 (_ BitVec 64) V!43081 (_ BitVec 64)) Unit!37070)

(assert (=> bm!48690 (= call!48696 (addStillContains!713 (ite c!110207 lt!502642 lt!502651) (ite c!110207 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110210 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110207 minValue!944 (ite c!110210 zeroValue!944 minValue!944)) k!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun e!644005 () Bool)

(declare-fun b!1131609 () Bool)

(declare-fun lt!502643 () Bool)

(assert (=> b!1131609 (= e!644005 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!502643) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1131610 () Bool)

(declare-fun res!755955 () Bool)

(assert (=> b!1131610 (=> (not res!755955) (not e!643996))))

(declare-datatypes ((List!24776 0))(
  ( (Nil!24773) (Cons!24772 (h!25981 (_ BitVec 64)) (t!35703 List!24776)) )
))
(declare-fun arrayNoDuplicates!0 (array!73787 (_ BitVec 32) List!24776) Bool)

(assert (=> b!1131610 (= res!755955 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24773))))

(declare-fun b!1131611 () Bool)

(declare-fun e!644000 () Unit!37070)

(declare-fun lt!502646 () Unit!37070)

(assert (=> b!1131611 (= e!644000 lt!502646)))

(declare-fun lt!502645 () Unit!37070)

(assert (=> b!1131611 (= lt!502645 (addStillContains!713 lt!502651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun call!48697 () ListLongMap!15981)

(assert (=> b!1131611 (= lt!502642 call!48697)))

(declare-fun call!48700 () Bool)

(assert (=> b!1131611 call!48700))

(assert (=> b!1131611 (= lt!502646 call!48696)))

(declare-fun contains!6528 (ListLongMap!15981 (_ BitVec 64)) Bool)

(declare-fun +!3450 (ListLongMap!15981 tuple2!18012) ListLongMap!15981)

(assert (=> b!1131611 (contains!6528 (+!3450 lt!502642 (tuple2!18013 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun res!755947 () Bool)

(assert (=> start!98234 (=> (not res!755947) (not e!643996))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98234 (= res!755947 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36082 _keys!1208))))))

(assert (=> start!98234 e!643996))

(declare-fun tp_is_empty!28465 () Bool)

(assert (=> start!98234 tp_is_empty!28465))

(declare-fun array_inv!27266 (array!73787) Bool)

(assert (=> start!98234 (array_inv!27266 _keys!1208)))

(assert (=> start!98234 true))

(assert (=> start!98234 tp!84509))

(declare-datatypes ((ValueCell!13523 0))(
  ( (ValueCellFull!13523 (v!16922 V!43081)) (EmptyCell!13523) )
))
(declare-datatypes ((array!73789 0))(
  ( (array!73790 (arr!35547 (Array (_ BitVec 32) ValueCell!13523)) (size!36083 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73789)

(declare-fun e!644002 () Bool)

(declare-fun array_inv!27267 (array!73789) Bool)

(assert (=> start!98234 (and (array_inv!27267 _values!996) e!644002)))

(declare-fun defaultEntry!1004 () Int)

(declare-fun call!48695 () ListLongMap!15981)

(declare-fun bm!48691 () Bool)

(declare-fun lt!502639 () array!73789)

(declare-fun getCurrentListMapNoExtraKeys!4493 (array!73787 array!73789 (_ BitVec 32) (_ BitVec 32) V!43081 V!43081 (_ BitVec 32) Int) ListLongMap!15981)

(assert (=> bm!48691 (= call!48695 (getCurrentListMapNoExtraKeys!4493 lt!502640 lt!502639 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131612 () Bool)

(declare-fun e!644007 () Unit!37070)

(declare-fun Unit!37072 () Unit!37070)

(assert (=> b!1131612 (= e!644007 Unit!37072)))

(declare-fun b!1131613 () Bool)

(declare-fun res!755944 () Bool)

(assert (=> b!1131613 (=> (not res!755944) (not e!644004))))

(assert (=> b!1131613 (= res!755944 (arrayNoDuplicates!0 lt!502640 #b00000000000000000000000000000000 Nil!24773))))

(declare-fun b!1131614 () Bool)

(declare-fun res!755945 () Bool)

(assert (=> b!1131614 (=> (not res!755945) (not e!643996))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1131614 (= res!755945 (validKeyInArray!0 k!934))))

(declare-fun mapIsEmpty!44515 () Bool)

(declare-fun mapRes!44515 () Bool)

(assert (=> mapIsEmpty!44515 mapRes!44515))

(declare-fun b!1131615 () Bool)

(declare-fun lt!502644 () Unit!37070)

(assert (=> b!1131615 (= e!644007 lt!502644)))

(declare-fun call!48694 () Unit!37070)

(assert (=> b!1131615 (= lt!502644 call!48694)))

(declare-fun call!48693 () Bool)

(assert (=> b!1131615 call!48693))

(declare-fun b!1131616 () Bool)

(declare-fun e!644003 () Bool)

(declare-fun e!643999 () Bool)

(assert (=> b!1131616 (= e!644003 e!643999)))

(declare-fun res!755956 () Bool)

(assert (=> b!1131616 (=> res!755956 e!643999)))

(assert (=> b!1131616 (= res!755956 (not (contains!6528 lt!502651 k!934)))))

(assert (=> b!1131616 (= lt!502651 (getCurrentListMapNoExtraKeys!4493 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!48698 () ListLongMap!15981)

(declare-fun bm!48692 () Bool)

(assert (=> bm!48692 (= call!48698 (getCurrentListMapNoExtraKeys!4493 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48693 () Bool)

(declare-fun call!48699 () ListLongMap!15981)

(assert (=> bm!48693 (= call!48699 call!48697)))

(declare-fun b!1131617 () Bool)

(declare-fun e!643994 () Bool)

(assert (=> b!1131617 (= e!644002 (and e!643994 mapRes!44515))))

(declare-fun condMapEmpty!44515 () Bool)

(declare-fun mapDefault!44515 () ValueCell!13523)

