; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97910 () Bool)

(assert start!97910)

(declare-fun b_free!23611 () Bool)

(declare-fun b_next!23611 () Bool)

(assert (=> start!97910 (= b_free!23611 (not b_next!23611))))

(declare-fun tp!83537 () Bool)

(declare-fun b_and!38005 () Bool)

(assert (=> start!97910 (= tp!83537 b_and!38005)))

(declare-fun e!638566 () Bool)

(declare-fun b!1121534 () Bool)

(declare-datatypes ((V!42649 0))(
  ( (V!42650 (val!14127 Int)) )
))
(declare-datatypes ((tuple2!17732 0))(
  ( (tuple2!17733 (_1!8877 (_ BitVec 64)) (_2!8877 V!42649)) )
))
(declare-datatypes ((List!24515 0))(
  ( (Nil!24512) (Cons!24511 (h!25720 tuple2!17732) (t!35118 List!24515)) )
))
(declare-datatypes ((ListLongMap!15701 0))(
  ( (ListLongMap!15702 (toList!7866 List!24515)) )
))
(declare-fun call!47115 () ListLongMap!15701)

(declare-fun call!47116 () ListLongMap!15701)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1076 (ListLongMap!15701 (_ BitVec 64)) ListLongMap!15701)

(assert (=> b!1121534 (= e!638566 (= call!47116 (-!1076 call!47115 k!934)))))

(declare-fun zeroValue!944 () V!42649)

(declare-datatypes ((array!73163 0))(
  ( (array!73164 (arr!35234 (Array (_ BitVec 32) (_ BitVec 64))) (size!35770 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73163)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!47112 () Bool)

(declare-datatypes ((ValueCell!13361 0))(
  ( (ValueCellFull!13361 (v!16760 V!42649)) (EmptyCell!13361) )
))
(declare-datatypes ((array!73165 0))(
  ( (array!73166 (arr!35235 (Array (_ BitVec 32) ValueCell!13361)) (size!35771 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73165)

(declare-fun minValue!944 () V!42649)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4355 (array!73163 array!73165 (_ BitVec 32) (_ BitVec 32) V!42649 V!42649 (_ BitVec 32) Int) ListLongMap!15701)

(assert (=> bm!47112 (= call!47115 (getCurrentListMapNoExtraKeys!4355 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121535 () Bool)

(declare-fun e!638567 () Bool)

(declare-fun e!638565 () Bool)

(declare-fun mapRes!44029 () Bool)

(assert (=> b!1121535 (= e!638567 (and e!638565 mapRes!44029))))

(declare-fun condMapEmpty!44029 () Bool)

(declare-fun mapDefault!44029 () ValueCell!13361)

