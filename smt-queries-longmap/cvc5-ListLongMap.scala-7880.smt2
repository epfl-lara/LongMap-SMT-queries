; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98024 () Bool)

(assert start!98024)

(declare-fun b_free!23725 () Bool)

(declare-fun b_next!23725 () Bool)

(assert (=> start!98024 (= b_free!23725 (not b_next!23725))))

(declare-fun tp!83879 () Bool)

(declare-fun b_and!38233 () Bool)

(assert (=> start!98024 (= tp!83879 b_and!38233)))

(declare-fun mapIsEmpty!44200 () Bool)

(declare-fun mapRes!44200 () Bool)

(assert (=> mapIsEmpty!44200 mapRes!44200))

(declare-fun res!751585 () Bool)

(declare-fun e!640313 () Bool)

(assert (=> start!98024 (=> (not res!751585) (not e!640313))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73377 0))(
  ( (array!73378 (arr!35341 (Array (_ BitVec 32) (_ BitVec 64))) (size!35877 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73377)

(assert (=> start!98024 (= res!751585 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35877 _keys!1208))))))

(assert (=> start!98024 e!640313))

(declare-fun tp_is_empty!28255 () Bool)

(assert (=> start!98024 tp_is_empty!28255))

(declare-fun array_inv!27128 (array!73377) Bool)

(assert (=> start!98024 (array_inv!27128 _keys!1208)))

(assert (=> start!98024 true))

(assert (=> start!98024 tp!83879))

(declare-datatypes ((V!42801 0))(
  ( (V!42802 (val!14184 Int)) )
))
(declare-datatypes ((ValueCell!13418 0))(
  ( (ValueCellFull!13418 (v!16817 V!42801)) (EmptyCell!13418) )
))
(declare-datatypes ((array!73379 0))(
  ( (array!73380 (arr!35342 (Array (_ BitVec 32) ValueCell!13418)) (size!35878 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73379)

(declare-fun e!640314 () Bool)

(declare-fun array_inv!27129 (array!73379) Bool)

(assert (=> start!98024 (and (array_inv!27129 _values!996) e!640314)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!47454 () Bool)

(declare-fun lt!499614 () array!73379)

(declare-datatypes ((tuple2!17820 0))(
  ( (tuple2!17821 (_1!8921 (_ BitVec 64)) (_2!8921 V!42801)) )
))
(declare-datatypes ((List!24600 0))(
  ( (Nil!24597) (Cons!24596 (h!25805 tuple2!17820) (t!35317 List!24600)) )
))
(declare-datatypes ((ListLongMap!15789 0))(
  ( (ListLongMap!15790 (toList!7910 List!24600)) )
))
(declare-fun call!47457 () ListLongMap!15789)

(declare-fun minValue!944 () V!42801)

(declare-fun zeroValue!944 () V!42801)

(declare-fun lt!499612 () array!73377)

(declare-fun getCurrentListMapNoExtraKeys!4398 (array!73377 array!73379 (_ BitVec 32) (_ BitVec 32) V!42801 V!42801 (_ BitVec 32) Int) ListLongMap!15789)

(assert (=> bm!47454 (= call!47457 (getCurrentListMapNoExtraKeys!4398 lt!499612 lt!499614 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124822 () Bool)

(declare-fun res!751584 () Bool)

(declare-fun e!640310 () Bool)

(assert (=> b!1124822 (=> (not res!751584) (not e!640310))))

(declare-datatypes ((List!24601 0))(
  ( (Nil!24598) (Cons!24597 (h!25806 (_ BitVec 64)) (t!35318 List!24601)) )
))
(declare-fun arrayNoDuplicates!0 (array!73377 (_ BitVec 32) List!24601) Bool)

(assert (=> b!1124822 (= res!751584 (arrayNoDuplicates!0 lt!499612 #b00000000000000000000000000000000 Nil!24598))))

(declare-fun b!1124823 () Bool)

(declare-fun e!640306 () Bool)

(assert (=> b!1124823 (= e!640314 (and e!640306 mapRes!44200))))

(declare-fun condMapEmpty!44200 () Bool)

(declare-fun mapDefault!44200 () ValueCell!13418)

