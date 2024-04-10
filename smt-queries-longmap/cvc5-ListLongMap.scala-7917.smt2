; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98342 () Bool)

(assert start!98342)

(declare-fun b_free!23947 () Bool)

(declare-fun b_next!23947 () Bool)

(assert (=> start!98342 (= b_free!23947 (not b_next!23947))))

(declare-fun tp!84552 () Bool)

(declare-fun b_and!38743 () Bool)

(assert (=> start!98342 (= tp!84552 b_and!38743)))

(declare-fun b!1132831 () Bool)

(declare-fun e!644731 () Bool)

(assert (=> b!1132831 (= e!644731 true)))

(declare-fun e!644738 () Bool)

(assert (=> b!1132831 e!644738))

(declare-fun res!756489 () Bool)

(assert (=> b!1132831 (=> (not res!756489) (not e!644738))))

(declare-fun e!644740 () Bool)

(assert (=> b!1132831 (= res!756489 e!644740)))

(declare-fun c!110505 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1132831 (= c!110505 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((V!43097 0))(
  ( (V!43098 (val!14295 Int)) )
))
(declare-fun zeroValue!944 () V!43097)

(declare-datatypes ((array!73815 0))(
  ( (array!73816 (arr!35558 (Array (_ BitVec 32) (_ BitVec 64))) (size!36094 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73815)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((Unit!37119 0))(
  ( (Unit!37120) )
))
(declare-fun lt!503372 () Unit!37119)

(declare-datatypes ((ValueCell!13529 0))(
  ( (ValueCellFull!13529 (v!16932 V!43097)) (EmptyCell!13529) )
))
(declare-datatypes ((array!73817 0))(
  ( (array!73818 (arr!35559 (Array (_ BitVec 32) ValueCell!13529)) (size!36095 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73817)

(declare-fun minValue!944 () V!43097)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!326 (array!73815 array!73817 (_ BitVec 32) (_ BitVec 32) V!43097 V!43097 (_ BitVec 64) (_ BitVec 32) Int) Unit!37119)

(assert (=> b!1132831 (= lt!503372 (lemmaListMapContainsThenArrayContainsFrom!326 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!503374 () Unit!37119)

(declare-fun e!644736 () Unit!37119)

(assert (=> b!1132831 (= lt!503374 e!644736)))

(declare-fun c!110507 () Bool)

(declare-fun lt!503366 () Bool)

(assert (=> b!1132831 (= c!110507 (and (not lt!503366) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1132831 (= lt!503366 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1132832 () Bool)

(declare-fun e!644727 () Bool)

(declare-fun e!644741 () Bool)

(assert (=> b!1132832 (= e!644727 (not e!644741))))

(declare-fun res!756490 () Bool)

(assert (=> b!1132832 (=> res!756490 e!644741)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1132832 (= res!756490 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1132832 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!503373 () Unit!37119)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73815 (_ BitVec 64) (_ BitVec 32)) Unit!37119)

(assert (=> b!1132832 (= lt!503373 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1132833 () Bool)

(assert (=> b!1132833 (= e!644740 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!503366) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1132834 () Bool)

(declare-fun e!644729 () Unit!37119)

(declare-fun Unit!37121 () Unit!37119)

(assert (=> b!1132834 (= e!644729 Unit!37121)))

(declare-fun b!1132835 () Bool)

(declare-fun e!644730 () Bool)

(declare-fun tp_is_empty!28477 () Bool)

(assert (=> b!1132835 (= e!644730 tp_is_empty!28477)))

(declare-fun b!1132836 () Bool)

(declare-fun e!644734 () Bool)

(declare-fun e!644733 () Bool)

(declare-fun mapRes!44540 () Bool)

(assert (=> b!1132836 (= e!644734 (and e!644733 mapRes!44540))))

(declare-fun condMapEmpty!44540 () Bool)

(declare-fun mapDefault!44540 () ValueCell!13529)

