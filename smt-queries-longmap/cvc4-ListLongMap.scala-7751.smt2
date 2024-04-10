; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97254 () Bool)

(assert start!97254)

(declare-fun b_free!23225 () Bool)

(declare-fun b_next!23225 () Bool)

(assert (=> start!97254 (= b_free!23225 (not b_next!23225))))

(declare-fun tp!81973 () Bool)

(declare-fun b_and!37281 () Bool)

(assert (=> start!97254 (= tp!81973 b_and!37281)))

(declare-fun b!1106995 () Bool)

(declare-fun res!738777 () Bool)

(declare-fun e!631636 () Bool)

(assert (=> b!1106995 (=> (not res!738777) (not e!631636))))

(declare-datatypes ((array!71887 0))(
  ( (array!71888 (arr!34596 (Array (_ BitVec 32) (_ BitVec 64))) (size!35132 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71887)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71887 (_ BitVec 32)) Bool)

(assert (=> b!1106995 (= res!738777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!738781 () Bool)

(assert (=> start!97254 (=> (not res!738781) (not e!631636))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97254 (= res!738781 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35132 _keys!1208))))))

(assert (=> start!97254 e!631636))

(declare-fun tp_is_empty!27485 () Bool)

(assert (=> start!97254 tp_is_empty!27485))

(declare-fun array_inv!26622 (array!71887) Bool)

(assert (=> start!97254 (array_inv!26622 _keys!1208)))

(assert (=> start!97254 true))

(assert (=> start!97254 tp!81973))

(declare-datatypes ((V!41773 0))(
  ( (V!41774 (val!13799 Int)) )
))
(declare-datatypes ((ValueCell!13033 0))(
  ( (ValueCellFull!13033 (v!16432 V!41773)) (EmptyCell!13033) )
))
(declare-datatypes ((array!71889 0))(
  ( (array!71890 (arr!34597 (Array (_ BitVec 32) ValueCell!13033)) (size!35133 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71889)

(declare-fun e!631637 () Bool)

(declare-fun array_inv!26623 (array!71889) Bool)

(assert (=> start!97254 (and (array_inv!26623 _values!996) e!631637)))

(declare-fun e!631639 () Bool)

(declare-datatypes ((tuple2!17422 0))(
  ( (tuple2!17423 (_1!8722 (_ BitVec 64)) (_2!8722 V!41773)) )
))
(declare-datatypes ((List!24110 0))(
  ( (Nil!24107) (Cons!24106 (h!25315 tuple2!17422) (t!34381 List!24110)) )
))
(declare-datatypes ((ListLongMap!15391 0))(
  ( (ListLongMap!15392 (toList!7711 List!24110)) )
))
(declare-fun call!46372 () ListLongMap!15391)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun call!46371 () ListLongMap!15391)

(declare-fun b!1106996 () Bool)

(declare-fun -!994 (ListLongMap!15391 (_ BitVec 64)) ListLongMap!15391)

(assert (=> b!1106996 (= e!631639 (= call!46372 (-!994 call!46371 k!934)))))

(declare-fun b!1106997 () Bool)

(declare-fun res!738783 () Bool)

(assert (=> b!1106997 (=> (not res!738783) (not e!631636))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1106997 (= res!738783 (= (select (arr!34596 _keys!1208) i!673) k!934))))

(declare-fun b!1106998 () Bool)

(declare-fun e!631640 () Bool)

(assert (=> b!1106998 (= e!631640 true)))

(assert (=> b!1106998 e!631639))

(declare-fun c!109017 () Bool)

(assert (=> b!1106998 (= c!109017 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!41773)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!41773)

(declare-datatypes ((Unit!36328 0))(
  ( (Unit!36329) )
))
(declare-fun lt!495549 () Unit!36328)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!240 (array!71887 array!71889 (_ BitVec 32) (_ BitVec 32) V!41773 V!41773 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36328)

(assert (=> b!1106998 (= lt!495549 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!240 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1106999 () Bool)

(declare-fun res!738782 () Bool)

(assert (=> b!1106999 (=> (not res!738782) (not e!631636))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106999 (= res!738782 (validKeyInArray!0 k!934))))

(declare-fun b!1107000 () Bool)

(assert (=> b!1107000 (= e!631639 (= call!46372 call!46371))))

(declare-fun b!1107001 () Bool)

(declare-fun e!631634 () Bool)

(assert (=> b!1107001 (= e!631636 e!631634)))

(declare-fun res!738780 () Bool)

(assert (=> b!1107001 (=> (not res!738780) (not e!631634))))

(declare-fun lt!495551 () array!71887)

(assert (=> b!1107001 (= res!738780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495551 mask!1564))))

(assert (=> b!1107001 (= lt!495551 (array!71888 (store (arr!34596 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35132 _keys!1208)))))

(declare-fun b!1107002 () Bool)

(declare-fun res!738787 () Bool)

(assert (=> b!1107002 (=> (not res!738787) (not e!631636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107002 (= res!738787 (validMask!0 mask!1564))))

(declare-fun b!1107003 () Bool)

(declare-fun e!631638 () Bool)

(declare-fun mapRes!43045 () Bool)

(assert (=> b!1107003 (= e!631637 (and e!631638 mapRes!43045))))

(declare-fun condMapEmpty!43045 () Bool)

(declare-fun mapDefault!43045 () ValueCell!13033)

