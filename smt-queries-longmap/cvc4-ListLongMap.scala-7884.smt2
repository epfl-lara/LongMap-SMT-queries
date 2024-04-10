; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98052 () Bool)

(assert start!98052)

(declare-fun b_free!23753 () Bool)

(declare-fun b_next!23753 () Bool)

(assert (=> start!98052 (= b_free!23753 (not b_next!23753))))

(declare-fun tp!83963 () Bool)

(declare-fun b_and!38289 () Bool)

(assert (=> start!98052 (= tp!83963 b_and!38289)))

(declare-fun mapNonEmpty!44242 () Bool)

(declare-fun mapRes!44242 () Bool)

(declare-fun tp!83962 () Bool)

(declare-fun e!640766 () Bool)

(assert (=> mapNonEmpty!44242 (= mapRes!44242 (and tp!83962 e!640766))))

(declare-fun mapKey!44242 () (_ BitVec 32))

(declare-datatypes ((V!42837 0))(
  ( (V!42838 (val!14198 Int)) )
))
(declare-datatypes ((ValueCell!13432 0))(
  ( (ValueCellFull!13432 (v!16831 V!42837)) (EmptyCell!13432) )
))
(declare-fun mapValue!44242 () ValueCell!13432)

(declare-datatypes ((array!73429 0))(
  ( (array!73430 (arr!35367 (Array (_ BitVec 32) ValueCell!13432)) (size!35903 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73429)

(declare-fun mapRest!44242 () (Array (_ BitVec 32) ValueCell!13432))

(assert (=> mapNonEmpty!44242 (= (arr!35367 _values!996) (store mapRest!44242 mapKey!44242 mapValue!44242))))

(declare-fun b!1125675 () Bool)

(declare-fun e!640765 () Bool)

(declare-fun e!640760 () Bool)

(assert (=> b!1125675 (= e!640765 e!640760)))

(declare-fun res!752187 () Bool)

(assert (=> b!1125675 (=> res!752187 e!640760)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1125675 (= res!752187 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!42837)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17844 0))(
  ( (tuple2!17845 (_1!8933 (_ BitVec 64)) (_2!8933 V!42837)) )
))
(declare-datatypes ((List!24623 0))(
  ( (Nil!24620) (Cons!24619 (h!25828 tuple2!17844) (t!35368 List!24623)) )
))
(declare-datatypes ((ListLongMap!15813 0))(
  ( (ListLongMap!15814 (toList!7922 List!24623)) )
))
(declare-fun lt!499938 () ListLongMap!15813)

(declare-datatypes ((array!73431 0))(
  ( (array!73432 (arr!35368 (Array (_ BitVec 32) (_ BitVec 64))) (size!35904 (_ BitVec 32))) )
))
(declare-fun lt!499940 () array!73431)

(declare-fun minValue!944 () V!42837)

(declare-fun lt!499941 () array!73429)

(declare-fun getCurrentListMapNoExtraKeys!4410 (array!73431 array!73429 (_ BitVec 32) (_ BitVec 32) V!42837 V!42837 (_ BitVec 32) Int) ListLongMap!15813)

(assert (=> b!1125675 (= lt!499938 (getCurrentListMapNoExtraKeys!4410 lt!499940 lt!499941 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2500 (Int (_ BitVec 64)) V!42837)

(assert (=> b!1125675 (= lt!499941 (array!73430 (store (arr!35367 _values!996) i!673 (ValueCellFull!13432 (dynLambda!2500 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35903 _values!996)))))

(declare-fun _keys!1208 () array!73431)

(declare-fun lt!499939 () ListLongMap!15813)

(assert (=> b!1125675 (= lt!499939 (getCurrentListMapNoExtraKeys!4410 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1125676 () Bool)

(declare-fun e!640763 () Bool)

(declare-fun call!47542 () ListLongMap!15813)

(declare-fun call!47541 () ListLongMap!15813)

(assert (=> b!1125676 (= e!640763 (= call!47542 call!47541))))

(declare-fun b!1125677 () Bool)

(declare-fun e!640762 () Bool)

(declare-fun e!640767 () Bool)

(assert (=> b!1125677 (= e!640762 (and e!640767 mapRes!44242))))

(declare-fun condMapEmpty!44242 () Bool)

(declare-fun mapDefault!44242 () ValueCell!13432)

