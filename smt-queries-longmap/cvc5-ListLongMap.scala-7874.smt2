; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97988 () Bool)

(assert start!97988)

(declare-fun b_free!23689 () Bool)

(declare-fun b_next!23689 () Bool)

(assert (=> start!97988 (= b_free!23689 (not b_next!23689))))

(declare-fun tp!83771 () Bool)

(declare-fun b_and!38161 () Bool)

(assert (=> start!97988 (= tp!83771 b_and!38161)))

(declare-fun b!1123706 () Bool)

(declare-fun res!750765 () Bool)

(declare-fun e!639715 () Bool)

(assert (=> b!1123706 (=> (not res!750765) (not e!639715))))

(declare-datatypes ((array!73305 0))(
  ( (array!73306 (arr!35305 (Array (_ BitVec 32) (_ BitVec 64))) (size!35841 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73305)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1123706 (= res!750765 (= (select (arr!35305 _keys!1208) i!673) k!934))))

(declare-fun b!1123707 () Bool)

(declare-fun e!639712 () Bool)

(declare-fun tp_is_empty!28219 () Bool)

(assert (=> b!1123707 (= e!639712 tp_is_empty!28219)))

(declare-fun b!1123708 () Bool)

(declare-fun e!639711 () Bool)

(assert (=> b!1123708 (= e!639715 e!639711)))

(declare-fun res!750763 () Bool)

(assert (=> b!1123708 (=> (not res!750763) (not e!639711))))

(declare-fun lt!499180 () array!73305)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73305 (_ BitVec 32)) Bool)

(assert (=> b!1123708 (= res!750763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499180 mask!1564))))

(assert (=> b!1123708 (= lt!499180 (array!73306 (store (arr!35305 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35841 _keys!1208)))))

(declare-datatypes ((V!42753 0))(
  ( (V!42754 (val!14166 Int)) )
))
(declare-datatypes ((tuple2!17788 0))(
  ( (tuple2!17789 (_1!8905 (_ BitVec 64)) (_2!8905 V!42753)) )
))
(declare-datatypes ((List!24567 0))(
  ( (Nil!24564) (Cons!24563 (h!25772 tuple2!17788) (t!35248 List!24567)) )
))
(declare-datatypes ((ListLongMap!15757 0))(
  ( (ListLongMap!15758 (toList!7894 List!24567)) )
))
(declare-fun call!47349 () ListLongMap!15757)

(declare-fun e!639719 () Bool)

(declare-fun b!1123709 () Bool)

(declare-fun call!47350 () ListLongMap!15757)

(declare-fun -!1099 (ListLongMap!15757 (_ BitVec 64)) ListLongMap!15757)

(assert (=> b!1123709 (= e!639719 (= call!47350 (-!1099 call!47349 k!934)))))

(declare-fun b!1123710 () Bool)

(declare-fun e!639720 () Bool)

(assert (=> b!1123710 (= e!639720 tp_is_empty!28219)))

(declare-fun b!1123711 () Bool)

(declare-fun e!639714 () Bool)

(declare-fun e!639713 () Bool)

(assert (=> b!1123711 (= e!639714 e!639713)))

(declare-fun res!750767 () Bool)

(assert (=> b!1123711 (=> res!750767 e!639713)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1123711 (= res!750767 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!42753)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42753)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!499183 () ListLongMap!15757)

(declare-datatypes ((ValueCell!13400 0))(
  ( (ValueCellFull!13400 (v!16799 V!42753)) (EmptyCell!13400) )
))
(declare-datatypes ((array!73307 0))(
  ( (array!73308 (arr!35306 (Array (_ BitVec 32) ValueCell!13400)) (size!35842 (_ BitVec 32))) )
))
(declare-fun lt!499179 () array!73307)

(declare-fun getCurrentListMapNoExtraKeys!4382 (array!73305 array!73307 (_ BitVec 32) (_ BitVec 32) V!42753 V!42753 (_ BitVec 32) Int) ListLongMap!15757)

(assert (=> b!1123711 (= lt!499183 (getCurrentListMapNoExtraKeys!4382 lt!499180 lt!499179 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73307)

(declare-fun dynLambda!2478 (Int (_ BitVec 64)) V!42753)

(assert (=> b!1123711 (= lt!499179 (array!73308 (store (arr!35306 _values!996) i!673 (ValueCellFull!13400 (dynLambda!2478 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35842 _values!996)))))

(declare-fun lt!499182 () ListLongMap!15757)

(assert (=> b!1123711 (= lt!499182 (getCurrentListMapNoExtraKeys!4382 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1123712 () Bool)

(declare-fun res!750772 () Bool)

(assert (=> b!1123712 (=> (not res!750772) (not e!639711))))

(declare-datatypes ((List!24568 0))(
  ( (Nil!24565) (Cons!24564 (h!25773 (_ BitVec 64)) (t!35249 List!24568)) )
))
(declare-fun arrayNoDuplicates!0 (array!73305 (_ BitVec 32) List!24568) Bool)

(assert (=> b!1123712 (= res!750772 (arrayNoDuplicates!0 lt!499180 #b00000000000000000000000000000000 Nil!24565))))

(declare-fun b!1123713 () Bool)

(declare-fun res!750771 () Bool)

(assert (=> b!1123713 (=> (not res!750771) (not e!639715))))

(assert (=> b!1123713 (= res!750771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!44146 () Bool)

(declare-fun mapRes!44146 () Bool)

(assert (=> mapIsEmpty!44146 mapRes!44146))

(declare-fun b!1123714 () Bool)

(declare-fun e!639718 () Bool)

(assert (=> b!1123714 (= e!639718 (and e!639720 mapRes!44146))))

(declare-fun condMapEmpty!44146 () Bool)

(declare-fun mapDefault!44146 () ValueCell!13400)

