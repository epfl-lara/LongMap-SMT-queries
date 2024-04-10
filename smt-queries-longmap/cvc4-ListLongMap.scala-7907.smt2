; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98190 () Bool)

(assert start!98190)

(declare-fun b_free!23891 () Bool)

(declare-fun b_next!23891 () Bool)

(assert (=> start!98190 (= b_free!23891 (not b_next!23891))))

(declare-fun tp!84376 () Bool)

(declare-fun b_and!38565 () Bool)

(assert (=> start!98190 (= tp!84376 b_and!38565)))

(declare-fun b!1129836 () Bool)

(declare-fun res!754977 () Bool)

(declare-fun e!643005 () Bool)

(assert (=> b!1129836 (=> (not res!754977) (not e!643005))))

(declare-datatypes ((array!73699 0))(
  ( (array!73700 (arr!35502 (Array (_ BitVec 32) (_ BitVec 64))) (size!36038 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73699)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!43021 0))(
  ( (V!43022 (val!14267 Int)) )
))
(declare-datatypes ((ValueCell!13501 0))(
  ( (ValueCellFull!13501 (v!16900 V!43021)) (EmptyCell!13501) )
))
(declare-datatypes ((array!73701 0))(
  ( (array!73702 (arr!35503 (Array (_ BitVec 32) ValueCell!13501)) (size!36039 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73701)

(assert (=> b!1129836 (= res!754977 (and (= (size!36039 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36038 _keys!1208) (size!36039 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1129837 () Bool)

(declare-fun e!643003 () Bool)

(declare-fun e!643012 () Bool)

(assert (=> b!1129837 (= e!643003 e!643012)))

(declare-fun res!754966 () Bool)

(assert (=> b!1129837 (=> res!754966 e!643012)))

(declare-datatypes ((tuple2!17968 0))(
  ( (tuple2!17969 (_1!8995 (_ BitVec 64)) (_2!8995 V!43021)) )
))
(declare-datatypes ((List!24734 0))(
  ( (Nil!24731) (Cons!24730 (h!25939 tuple2!17968) (t!35617 List!24734)) )
))
(declare-datatypes ((ListLongMap!15937 0))(
  ( (ListLongMap!15938 (toList!7984 List!24734)) )
))
(declare-fun lt!501650 () ListLongMap!15937)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6507 (ListLongMap!15937 (_ BitVec 64)) Bool)

(assert (=> b!1129837 (= res!754966 (not (contains!6507 lt!501650 k!934)))))

(declare-fun zeroValue!944 () V!43021)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43021)

(declare-fun getCurrentListMapNoExtraKeys!4471 (array!73699 array!73701 (_ BitVec 32) (_ BitVec 32) V!43021 V!43021 (_ BitVec 32) Int) ListLongMap!15937)

(assert (=> b!1129837 (= lt!501650 (getCurrentListMapNoExtraKeys!4471 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!48166 () ListLongMap!15937)

(declare-fun c!109933 () Bool)

(declare-fun bm!48162 () Bool)

(declare-fun lt!501659 () ListLongMap!15937)

(declare-fun c!109934 () Bool)

(declare-fun +!3435 (ListLongMap!15937 tuple2!17968) ListLongMap!15937)

(assert (=> bm!48162 (= call!48166 (+!3435 (ite c!109933 lt!501659 lt!501650) (ite c!109933 (tuple2!17969 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!109934 (tuple2!17969 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!17969 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1129838 () Bool)

(declare-fun e!643016 () Bool)

(declare-fun e!643013 () Bool)

(declare-fun mapRes!44449 () Bool)

(assert (=> b!1129838 (= e!643016 (and e!643013 mapRes!44449))))

(declare-fun condMapEmpty!44449 () Bool)

(declare-fun mapDefault!44449 () ValueCell!13501)

