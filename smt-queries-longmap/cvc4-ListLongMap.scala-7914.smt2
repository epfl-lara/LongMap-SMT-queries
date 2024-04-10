; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98232 () Bool)

(assert start!98232)

(declare-fun b_free!23933 () Bool)

(declare-fun b_next!23933 () Bool)

(assert (=> start!98232 (= b_free!23933 (not b_next!23933))))

(declare-fun tp!84503 () Bool)

(declare-fun b_and!38649 () Bool)

(assert (=> start!98232 (= tp!84503 b_and!38649)))

(declare-fun b!1131524 () Bool)

(declare-datatypes ((Unit!37067 0))(
  ( (Unit!37068) )
))
(declare-fun e!643950 () Unit!37067)

(declare-fun Unit!37069 () Unit!37067)

(assert (=> b!1131524 (= e!643950 Unit!37069)))

(declare-datatypes ((array!73783 0))(
  ( (array!73784 (arr!35544 (Array (_ BitVec 32) (_ BitVec 64))) (size!36080 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73783)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!643960 () Bool)

(declare-fun b!1131525 () Bool)

(declare-fun arrayContainsKey!0 (array!73783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1131525 (= e!643960 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!755910 () Bool)

(declare-fun e!643962 () Bool)

(assert (=> start!98232 (=> (not res!755910) (not e!643962))))

(assert (=> start!98232 (= res!755910 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36080 _keys!1208))))))

(assert (=> start!98232 e!643962))

(declare-fun tp_is_empty!28463 () Bool)

(assert (=> start!98232 tp_is_empty!28463))

(declare-fun array_inv!27264 (array!73783) Bool)

(assert (=> start!98232 (array_inv!27264 _keys!1208)))

(assert (=> start!98232 true))

(assert (=> start!98232 tp!84503))

(declare-datatypes ((V!43077 0))(
  ( (V!43078 (val!14288 Int)) )
))
(declare-datatypes ((ValueCell!13522 0))(
  ( (ValueCellFull!13522 (v!16921 V!43077)) (EmptyCell!13522) )
))
(declare-datatypes ((array!73785 0))(
  ( (array!73786 (arr!35545 (Array (_ BitVec 32) ValueCell!13522)) (size!36081 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73785)

(declare-fun e!643951 () Bool)

(declare-fun array_inv!27265 (array!73785) Bool)

(assert (=> start!98232 (and (array_inv!27265 _values!996) e!643951)))

(declare-fun b!1131526 () Bool)

(declare-fun e!643948 () Bool)

(assert (=> b!1131526 (= e!643948 tp_is_empty!28463)))

(declare-fun b!1131527 () Bool)

(declare-fun e!643957 () Bool)

(declare-fun e!643958 () Bool)

(assert (=> b!1131527 (= e!643957 e!643958)))

(declare-fun res!755902 () Bool)

(assert (=> b!1131527 (=> res!755902 e!643958)))

(declare-datatypes ((tuple2!18010 0))(
  ( (tuple2!18011 (_1!9016 (_ BitVec 64)) (_2!9016 V!43077)) )
))
(declare-datatypes ((List!24773 0))(
  ( (Nil!24770) (Cons!24769 (h!25978 tuple2!18010) (t!35698 List!24773)) )
))
(declare-datatypes ((ListLongMap!15979 0))(
  ( (ListLongMap!15980 (toList!8005 List!24773)) )
))
(declare-fun lt!502597 () ListLongMap!15979)

(declare-fun contains!6527 (ListLongMap!15979 (_ BitVec 64)) Bool)

(assert (=> b!1131527 (= res!755902 (not (contains!6527 lt!502597 k!934)))))

(declare-fun zeroValue!944 () V!43077)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43077)

(declare-fun getCurrentListMapNoExtraKeys!4492 (array!73783 array!73785 (_ BitVec 32) (_ BitVec 32) V!43077 V!43077 (_ BitVec 32) Int) ListLongMap!15979)

(assert (=> b!1131527 (= lt!502597 (getCurrentListMapNoExtraKeys!4492 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131528 () Bool)

(declare-fun e!643952 () Bool)

(declare-fun call!48672 () ListLongMap!15979)

(declare-fun call!48670 () ListLongMap!15979)

(assert (=> b!1131528 (= e!643952 (= call!48672 call!48670))))

(declare-fun bm!48666 () Bool)

(declare-fun lt!502603 () array!73783)

(declare-fun lt!502599 () array!73785)

(assert (=> bm!48666 (= call!48672 (getCurrentListMapNoExtraKeys!4492 lt!502603 lt!502599 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!502596 () Bool)

(declare-fun b!1131529 () Bool)

(assert (=> b!1131529 (= e!643960 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!502596) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!48667 () Bool)

(declare-fun call!48669 () Bool)

(declare-fun call!48674 () Bool)

(assert (=> bm!48667 (= call!48669 call!48674)))

(declare-fun b!1131530 () Bool)

(declare-fun res!755904 () Bool)

(assert (=> b!1131530 (=> (not res!755904) (not e!643962))))

(assert (=> b!1131530 (= res!755904 (and (= (size!36081 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36080 _keys!1208) (size!36081 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1131531 () Bool)

(declare-fun e!643953 () Unit!37067)

(declare-fun e!643955 () Unit!37067)

(assert (=> b!1131531 (= e!643953 e!643955)))

(declare-fun c!110193 () Bool)

(assert (=> b!1131531 (= c!110193 (and (not lt!502596) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1131532 () Bool)

(assert (=> b!1131532 call!48669))

(declare-fun lt!502598 () Unit!37067)

(declare-fun call!48675 () Unit!37067)

(assert (=> b!1131532 (= lt!502598 call!48675)))

(assert (=> b!1131532 (= e!643955 lt!502598)))

(declare-fun b!1131533 () Bool)

(declare-fun res!755914 () Bool)

(assert (=> b!1131533 (=> (not res!755914) (not e!643962))))

(declare-datatypes ((List!24774 0))(
  ( (Nil!24771) (Cons!24770 (h!25979 (_ BitVec 64)) (t!35699 List!24774)) )
))
(declare-fun arrayNoDuplicates!0 (array!73783 (_ BitVec 32) List!24774) Bool)

(assert (=> b!1131533 (= res!755914 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24771))))

(declare-fun lt!502593 () ListLongMap!15979)

(declare-fun bm!48668 () Bool)

(declare-fun c!110194 () Bool)

(declare-fun call!48676 () ListLongMap!15979)

(declare-fun +!3449 (ListLongMap!15979 tuple2!18010) ListLongMap!15979)

(assert (=> bm!48668 (= call!48676 (+!3449 (ite c!110194 lt!502593 lt!502597) (ite c!110194 (tuple2!18011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110193 (tuple2!18011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1131534 () Bool)

(declare-fun res!755912 () Bool)

(assert (=> b!1131534 (=> (not res!755912) (not e!643962))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1131534 (= res!755912 (validKeyInArray!0 k!934))))

(declare-fun b!1131535 () Bool)

(declare-fun e!643961 () Bool)

(declare-fun e!643949 () Bool)

(assert (=> b!1131535 (= e!643961 (not e!643949))))

(declare-fun res!755911 () Bool)

(assert (=> b!1131535 (=> res!755911 e!643949)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1131535 (= res!755911 (bvsgt from!1455 i!673))))

(assert (=> b!1131535 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!502607 () Unit!37067)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73783 (_ BitVec 64) (_ BitVec 32)) Unit!37067)

(assert (=> b!1131535 (= lt!502607 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun bm!48669 () Bool)

(assert (=> bm!48669 (= call!48670 (getCurrentListMapNoExtraKeys!4492 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131536 () Bool)

(assert (=> b!1131536 (= e!643962 e!643961)))

(declare-fun res!755907 () Bool)

(assert (=> b!1131536 (=> (not res!755907) (not e!643961))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73783 (_ BitVec 32)) Bool)

(assert (=> b!1131536 (= res!755907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!502603 mask!1564))))

(assert (=> b!1131536 (= lt!502603 (array!73784 (store (arr!35544 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36080 _keys!1208)))))

(declare-fun mapNonEmpty!44512 () Bool)

(declare-fun mapRes!44512 () Bool)

(declare-fun tp!84502 () Bool)

(assert (=> mapNonEmpty!44512 (= mapRes!44512 (and tp!84502 e!643948))))

(declare-fun mapKey!44512 () (_ BitVec 32))

(declare-fun mapValue!44512 () ValueCell!13522)

(declare-fun mapRest!44512 () (Array (_ BitVec 32) ValueCell!13522))

(assert (=> mapNonEmpty!44512 (= (arr!35545 _values!996) (store mapRest!44512 mapKey!44512 mapValue!44512))))

(declare-fun b!1131537 () Bool)

(declare-fun e!643959 () Bool)

(assert (=> b!1131537 (= e!643959 tp_is_empty!28463)))

(declare-fun b!1131538 () Bool)

(declare-fun res!755913 () Bool)

(assert (=> b!1131538 (=> (not res!755913) (not e!643962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1131538 (= res!755913 (validMask!0 mask!1564))))

(declare-fun b!1131539 () Bool)

(assert (=> b!1131539 (= e!643951 (and e!643959 mapRes!44512))))

(declare-fun condMapEmpty!44512 () Bool)

(declare-fun mapDefault!44512 () ValueCell!13522)

