; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97842 () Bool)

(assert start!97842)

(declare-fun b_free!23543 () Bool)

(declare-fun b_next!23543 () Bool)

(assert (=> start!97842 (= b_free!23543 (not b_next!23543))))

(declare-fun tp!83332 () Bool)

(declare-fun b_and!37869 () Bool)

(assert (=> start!97842 (= tp!83332 b_and!37869)))

(declare-fun b!1119870 () Bool)

(declare-fun e!637739 () Bool)

(assert (=> b!1119870 (= e!637739 true)))

(declare-datatypes ((V!42557 0))(
  ( (V!42558 (val!14093 Int)) )
))
(declare-fun zeroValue!944 () V!42557)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73029 0))(
  ( (array!73030 (arr!35167 (Array (_ BitVec 32) (_ BitVec 64))) (size!35703 (_ BitVec 32))) )
))
(declare-fun lt!497872 () array!73029)

(declare-datatypes ((tuple2!17682 0))(
  ( (tuple2!17683 (_1!8852 (_ BitVec 64)) (_2!8852 V!42557)) )
))
(declare-datatypes ((List!24468 0))(
  ( (Nil!24465) (Cons!24464 (h!25673 tuple2!17682) (t!35003 List!24468)) )
))
(declare-datatypes ((ListLongMap!15651 0))(
  ( (ListLongMap!15652 (toList!7841 List!24468)) )
))
(declare-fun lt!497873 () ListLongMap!15651)

(declare-datatypes ((ValueCell!13327 0))(
  ( (ValueCellFull!13327 (v!16726 V!42557)) (EmptyCell!13327) )
))
(declare-datatypes ((array!73031 0))(
  ( (array!73032 (arr!35168 (Array (_ BitVec 32) ValueCell!13327)) (size!35704 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73031)

(declare-fun minValue!944 () V!42557)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4331 (array!73029 array!73031 (_ BitVec 32) (_ BitVec 32) V!42557 V!42557 (_ BitVec 32) Int) ListLongMap!15651)

(declare-fun dynLambda!2435 (Int (_ BitVec 64)) V!42557)

(assert (=> b!1119870 (= lt!497873 (getCurrentListMapNoExtraKeys!4331 lt!497872 (array!73032 (store (arr!35168 _values!996) i!673 (ValueCellFull!13327 (dynLambda!2435 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35704 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!73029)

(declare-fun lt!497871 () ListLongMap!15651)

(assert (=> b!1119870 (= lt!497871 (getCurrentListMapNoExtraKeys!4331 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1119871 () Bool)

(declare-fun e!637742 () Bool)

(declare-fun e!637737 () Bool)

(declare-fun mapRes!43927 () Bool)

(assert (=> b!1119871 (= e!637742 (and e!637737 mapRes!43927))))

(declare-fun condMapEmpty!43927 () Bool)

(declare-fun mapDefault!43927 () ValueCell!13327)

