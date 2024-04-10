; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98000 () Bool)

(assert start!98000)

(declare-fun b_free!23701 () Bool)

(declare-fun b_next!23701 () Bool)

(assert (=> start!98000 (= b_free!23701 (not b_next!23701))))

(declare-fun tp!83806 () Bool)

(declare-fun b_and!38185 () Bool)

(assert (=> start!98000 (= tp!83806 b_and!38185)))

(declare-fun b!1124078 () Bool)

(declare-fun res!751041 () Bool)

(declare-fun e!639910 () Bool)

(assert (=> b!1124078 (=> (not res!751041) (not e!639910))))

(declare-datatypes ((array!73329 0))(
  ( (array!73330 (arr!35317 (Array (_ BitVec 32) (_ BitVec 64))) (size!35853 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73329)

(declare-datatypes ((List!24579 0))(
  ( (Nil!24576) (Cons!24575 (h!25784 (_ BitVec 64)) (t!35272 List!24579)) )
))
(declare-fun arrayNoDuplicates!0 (array!73329 (_ BitVec 32) List!24579) Bool)

(assert (=> b!1124078 (= res!751041 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24576))))

(declare-fun b!1124079 () Bool)

(declare-fun res!751033 () Bool)

(declare-fun e!639915 () Bool)

(assert (=> b!1124079 (=> (not res!751033) (not e!639915))))

(declare-fun lt!499323 () array!73329)

(assert (=> b!1124079 (= res!751033 (arrayNoDuplicates!0 lt!499323 #b00000000000000000000000000000000 Nil!24576))))

(declare-fun b!1124080 () Bool)

(declare-fun e!639912 () Bool)

(declare-fun e!639909 () Bool)

(assert (=> b!1124080 (= e!639912 e!639909)))

(declare-fun res!751034 () Bool)

(assert (=> b!1124080 (=> res!751034 e!639909)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1124080 (= res!751034 (not (= from!1455 i!673)))))

(declare-datatypes ((V!42769 0))(
  ( (V!42770 (val!14172 Int)) )
))
(declare-fun zeroValue!944 () V!42769)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42769)

(declare-datatypes ((ValueCell!13406 0))(
  ( (ValueCellFull!13406 (v!16805 V!42769)) (EmptyCell!13406) )
))
(declare-datatypes ((array!73331 0))(
  ( (array!73332 (arr!35318 (Array (_ BitVec 32) ValueCell!13406)) (size!35854 (_ BitVec 32))) )
))
(declare-fun lt!499322 () array!73331)

(declare-datatypes ((tuple2!17800 0))(
  ( (tuple2!17801 (_1!8911 (_ BitVec 64)) (_2!8911 V!42769)) )
))
(declare-datatypes ((List!24580 0))(
  ( (Nil!24577) (Cons!24576 (h!25785 tuple2!17800) (t!35273 List!24580)) )
))
(declare-datatypes ((ListLongMap!15769 0))(
  ( (ListLongMap!15770 (toList!7900 List!24580)) )
))
(declare-fun lt!499327 () ListLongMap!15769)

(declare-fun getCurrentListMapNoExtraKeys!4388 (array!73329 array!73331 (_ BitVec 32) (_ BitVec 32) V!42769 V!42769 (_ BitVec 32) Int) ListLongMap!15769)

(assert (=> b!1124080 (= lt!499327 (getCurrentListMapNoExtraKeys!4388 lt!499323 lt!499322 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73331)

(declare-fun dynLambda!2484 (Int (_ BitVec 64)) V!42769)

(assert (=> b!1124080 (= lt!499322 (array!73332 (store (arr!35318 _values!996) i!673 (ValueCellFull!13406 (dynLambda!2484 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35854 _values!996)))))

(declare-fun lt!499328 () ListLongMap!15769)

(assert (=> b!1124080 (= lt!499328 (getCurrentListMapNoExtraKeys!4388 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1124081 () Bool)

(declare-fun e!639916 () Bool)

(declare-fun e!639917 () Bool)

(assert (=> b!1124081 (= e!639916 e!639917)))

(declare-fun res!751035 () Bool)

(assert (=> b!1124081 (=> res!751035 e!639917)))

(declare-fun lt!499325 () ListLongMap!15769)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6439 (ListLongMap!15769 (_ BitVec 64)) Bool)

(assert (=> b!1124081 (= res!751035 (not (contains!6439 lt!499325 k!934)))))

(assert (=> b!1124081 (= lt!499325 (getCurrentListMapNoExtraKeys!4388 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124082 () Bool)

(declare-fun res!751038 () Bool)

(assert (=> b!1124082 (=> (not res!751038) (not e!639910))))

(assert (=> b!1124082 (= res!751038 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35853 _keys!1208))))))

(declare-fun b!1124083 () Bool)

(declare-fun res!751045 () Bool)

(assert (=> b!1124083 (=> (not res!751045) (not e!639910))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73329 (_ BitVec 32)) Bool)

(assert (=> b!1124083 (= res!751045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!47382 () Bool)

(declare-fun call!47385 () ListLongMap!15769)

(assert (=> bm!47382 (= call!47385 (getCurrentListMapNoExtraKeys!4388 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44164 () Bool)

(declare-fun mapRes!44164 () Bool)

(declare-fun tp!83807 () Bool)

(declare-fun e!639918 () Bool)

(assert (=> mapNonEmpty!44164 (= mapRes!44164 (and tp!83807 e!639918))))

(declare-fun mapKey!44164 () (_ BitVec 32))

(declare-fun mapValue!44164 () ValueCell!13406)

(declare-fun mapRest!44164 () (Array (_ BitVec 32) ValueCell!13406))

(assert (=> mapNonEmpty!44164 (= (arr!35318 _values!996) (store mapRest!44164 mapKey!44164 mapValue!44164))))

(declare-fun res!751031 () Bool)

(assert (=> start!98000 (=> (not res!751031) (not e!639910))))

(assert (=> start!98000 (= res!751031 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35853 _keys!1208))))))

(assert (=> start!98000 e!639910))

(declare-fun tp_is_empty!28231 () Bool)

(assert (=> start!98000 tp_is_empty!28231))

(declare-fun array_inv!27110 (array!73329) Bool)

(assert (=> start!98000 (array_inv!27110 _keys!1208)))

(assert (=> start!98000 true))

(assert (=> start!98000 tp!83806))

(declare-fun e!639911 () Bool)

(declare-fun array_inv!27111 (array!73331) Bool)

(assert (=> start!98000 (and (array_inv!27111 _values!996) e!639911)))

(declare-fun b!1124084 () Bool)

(declare-fun res!751039 () Bool)

(assert (=> b!1124084 (=> res!751039 e!639917)))

(assert (=> b!1124084 (= res!751039 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!47386 () ListLongMap!15769)

(declare-fun b!1124085 () Bool)

(declare-fun e!639913 () Bool)

(declare-fun -!1105 (ListLongMap!15769 (_ BitVec 64)) ListLongMap!15769)

(assert (=> b!1124085 (= e!639913 (= call!47386 (-!1105 call!47385 k!934)))))

(declare-fun b!1124086 () Bool)

(declare-fun e!639914 () Bool)

(assert (=> b!1124086 (= e!639911 (and e!639914 mapRes!44164))))

(declare-fun condMapEmpty!44164 () Bool)

(declare-fun mapDefault!44164 () ValueCell!13406)

