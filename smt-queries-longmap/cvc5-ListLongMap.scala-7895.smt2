; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98114 () Bool)

(assert start!98114)

(declare-fun b_free!23815 () Bool)

(declare-fun b_next!23815 () Bool)

(assert (=> start!98114 (= b_free!23815 (not b_next!23815))))

(declare-fun tp!84149 () Bool)

(declare-fun b_and!38413 () Bool)

(assert (=> start!98114 (= tp!84149 b_and!38413)))

(declare-fun mapNonEmpty!44335 () Bool)

(declare-fun mapRes!44335 () Bool)

(declare-fun tp!84148 () Bool)

(declare-fun e!641689 () Bool)

(assert (=> mapNonEmpty!44335 (= mapRes!44335 (and tp!84148 e!641689))))

(declare-datatypes ((V!42921 0))(
  ( (V!42922 (val!14229 Int)) )
))
(declare-datatypes ((ValueCell!13463 0))(
  ( (ValueCellFull!13463 (v!16862 V!42921)) (EmptyCell!13463) )
))
(declare-fun mapValue!44335 () ValueCell!13463)

(declare-fun mapRest!44335 () (Array (_ BitVec 32) ValueCell!13463))

(declare-fun mapKey!44335 () (_ BitVec 32))

(declare-datatypes ((array!73551 0))(
  ( (array!73552 (arr!35428 (Array (_ BitVec 32) ValueCell!13463)) (size!35964 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73551)

(assert (=> mapNonEmpty!44335 (= (arr!35428 _values!996) (store mapRest!44335 mapKey!44335 mapValue!44335))))

(declare-fun b!1127419 () Bool)

(declare-fun e!641692 () Bool)

(declare-fun e!641695 () Bool)

(assert (=> b!1127419 (= e!641692 e!641695)))

(declare-fun res!753415 () Bool)

(assert (=> b!1127419 (=> res!753415 e!641695)))

(declare-datatypes ((array!73553 0))(
  ( (array!73554 (arr!35429 (Array (_ BitVec 32) (_ BitVec 64))) (size!35965 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73553)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1127419 (= res!753415 (not (= (select (arr!35429 _keys!1208) from!1455) k!934)))))

(declare-fun e!641690 () Bool)

(assert (=> b!1127419 e!641690))

(declare-fun c!109713 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1127419 (= c!109713 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42921)

(declare-datatypes ((Unit!36942 0))(
  ( (Unit!36943) )
))
(declare-fun lt!500583 () Unit!36942)

(declare-fun zeroValue!944 () V!42921)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!391 (array!73553 array!73551 (_ BitVec 32) (_ BitVec 32) V!42921 V!42921 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36942)

(assert (=> b!1127419 (= lt!500583 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!391 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127420 () Bool)

(declare-fun res!753412 () Bool)

(declare-fun e!641691 () Bool)

(assert (=> b!1127420 (=> (not res!753412) (not e!641691))))

(assert (=> b!1127420 (= res!753412 (and (= (size!35964 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35965 _keys!1208) (size!35964 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1127421 () Bool)

(assert (=> b!1127421 (= e!641695 true)))

(declare-fun lt!500579 () Bool)

(declare-datatypes ((tuple2!17898 0))(
  ( (tuple2!17899 (_1!8960 (_ BitVec 64)) (_2!8960 V!42921)) )
))
(declare-datatypes ((List!24670 0))(
  ( (Nil!24667) (Cons!24666 (h!25875 tuple2!17898) (t!35477 List!24670)) )
))
(declare-datatypes ((ListLongMap!15867 0))(
  ( (ListLongMap!15868 (toList!7949 List!24670)) )
))
(declare-fun contains!6479 (ListLongMap!15867 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4437 (array!73553 array!73551 (_ BitVec 32) (_ BitVec 32) V!42921 V!42921 (_ BitVec 32) Int) ListLongMap!15867)

(assert (=> b!1127421 (= lt!500579 (contains!6479 (getCurrentListMapNoExtraKeys!4437 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun b!1127422 () Bool)

(declare-fun e!641693 () Bool)

(declare-fun tp_is_empty!28345 () Bool)

(assert (=> b!1127422 (= e!641693 tp_is_empty!28345)))

(declare-fun b!1127423 () Bool)

(declare-fun res!753410 () Bool)

(assert (=> b!1127423 (=> (not res!753410) (not e!641691))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73553 (_ BitVec 32)) Bool)

(assert (=> b!1127423 (= res!753410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1127424 () Bool)

(declare-fun res!753414 () Bool)

(assert (=> b!1127424 (=> (not res!753414) (not e!641691))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1127424 (= res!753414 (validKeyInArray!0 k!934))))

(declare-fun b!1127425 () Bool)

(declare-fun e!641694 () Bool)

(assert (=> b!1127425 (= e!641694 (and e!641693 mapRes!44335))))

(declare-fun condMapEmpty!44335 () Bool)

(declare-fun mapDefault!44335 () ValueCell!13463)

