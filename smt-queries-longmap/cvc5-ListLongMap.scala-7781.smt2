; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97430 () Bool)

(assert start!97430)

(declare-fun b_free!23401 () Bool)

(declare-fun b_next!23401 () Bool)

(assert (=> start!97430 (= b_free!23401 (not b_next!23401))))

(declare-fun tp!82501 () Bool)

(declare-fun b_and!37639 () Bool)

(assert (=> start!97430 (= tp!82501 b_and!37639)))

(declare-fun b!1111431 () Bool)

(declare-fun res!741688 () Bool)

(declare-fun e!633767 () Bool)

(assert (=> b!1111431 (=> (not res!741688) (not e!633767))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72239 0))(
  ( (array!72240 (arr!34772 (Array (_ BitVec 32) (_ BitVec 64))) (size!35308 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72239)

(assert (=> b!1111431 (= res!741688 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35308 _keys!1208))))))

(declare-fun b!1111432 () Bool)

(declare-fun e!633769 () Bool)

(declare-fun tp_is_empty!27661 () Bool)

(assert (=> b!1111432 (= e!633769 tp_is_empty!27661)))

(declare-fun b!1111433 () Bool)

(declare-fun res!741685 () Bool)

(assert (=> b!1111433 (=> (not res!741685) (not e!633767))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42009 0))(
  ( (V!42010 (val!13887 Int)) )
))
(declare-datatypes ((ValueCell!13121 0))(
  ( (ValueCellFull!13121 (v!16520 V!42009)) (EmptyCell!13121) )
))
(declare-datatypes ((array!72241 0))(
  ( (array!72242 (arr!34773 (Array (_ BitVec 32) ValueCell!13121)) (size!35309 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72241)

(assert (=> b!1111433 (= res!741685 (and (= (size!35309 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35308 _keys!1208) (size!35309 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!43309 () Bool)

(declare-fun mapRes!43309 () Bool)

(assert (=> mapIsEmpty!43309 mapRes!43309))

(declare-fun e!633766 () Bool)

(declare-datatypes ((tuple2!17576 0))(
  ( (tuple2!17577 (_1!8799 (_ BitVec 64)) (_2!8799 V!42009)) )
))
(declare-datatypes ((List!24259 0))(
  ( (Nil!24256) (Cons!24255 (h!25464 tuple2!17576) (t!34706 List!24259)) )
))
(declare-datatypes ((ListLongMap!15545 0))(
  ( (ListLongMap!15546 (toList!7788 List!24259)) )
))
(declare-fun call!46899 () ListLongMap!15545)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun call!46900 () ListLongMap!15545)

(declare-fun b!1111434 () Bool)

(declare-fun -!1056 (ListLongMap!15545 (_ BitVec 64)) ListLongMap!15545)

(assert (=> b!1111434 (= e!633766 (= call!46899 (-!1056 call!46900 k!934)))))

(declare-fun b!1111435 () Bool)

(declare-fun res!741686 () Bool)

(assert (=> b!1111435 (=> (not res!741686) (not e!633767))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1111435 (= res!741686 (validKeyInArray!0 k!934))))

(declare-fun b!1111437 () Bool)

(declare-fun res!741683 () Bool)

(declare-fun e!633771 () Bool)

(assert (=> b!1111437 (=> (not res!741683) (not e!633771))))

(declare-fun lt!496342 () array!72239)

(declare-datatypes ((List!24260 0))(
  ( (Nil!24257) (Cons!24256 (h!25465 (_ BitVec 64)) (t!34707 List!24260)) )
))
(declare-fun arrayNoDuplicates!0 (array!72239 (_ BitVec 32) List!24260) Bool)

(assert (=> b!1111437 (= res!741683 (arrayNoDuplicates!0 lt!496342 #b00000000000000000000000000000000 Nil!24257))))

(declare-fun b!1111438 () Bool)

(declare-fun e!633764 () Bool)

(assert (=> b!1111438 (= e!633771 (not e!633764))))

(declare-fun res!741690 () Bool)

(assert (=> b!1111438 (=> res!741690 e!633764)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1111438 (= res!741690 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35308 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72239 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1111438 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36474 0))(
  ( (Unit!36475) )
))
(declare-fun lt!496341 () Unit!36474)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72239 (_ BitVec 64) (_ BitVec 32)) Unit!36474)

(assert (=> b!1111438 (= lt!496341 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1111439 () Bool)

(assert (=> b!1111439 (= e!633766 (= call!46899 call!46900))))

(declare-fun b!1111440 () Bool)

(declare-fun e!633765 () Bool)

(declare-fun e!633768 () Bool)

(assert (=> b!1111440 (= e!633765 (and e!633768 mapRes!43309))))

(declare-fun condMapEmpty!43309 () Bool)

(declare-fun mapDefault!43309 () ValueCell!13121)

