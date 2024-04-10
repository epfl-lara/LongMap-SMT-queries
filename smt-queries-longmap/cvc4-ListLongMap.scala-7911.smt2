; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98214 () Bool)

(assert start!98214)

(declare-fun b_free!23915 () Bool)

(declare-fun b_next!23915 () Bool)

(assert (=> start!98214 (= b_free!23915 (not b_next!23915))))

(declare-fun tp!84449 () Bool)

(declare-fun b_and!38613 () Bool)

(assert (=> start!98214 (= tp!84449 b_and!38613)))

(declare-fun b!1130796 () Bool)

(declare-fun res!755508 () Bool)

(declare-fun e!643549 () Bool)

(assert (=> b!1130796 (=> (not res!755508) (not e!643549))))

(declare-datatypes ((array!73747 0))(
  ( (array!73748 (arr!35526 (Array (_ BitVec 32) (_ BitVec 64))) (size!36062 (_ BitVec 32))) )
))
(declare-fun lt!502202 () array!73747)

(declare-datatypes ((List!24756 0))(
  ( (Nil!24753) (Cons!24752 (h!25961 (_ BitVec 64)) (t!35663 List!24756)) )
))
(declare-fun arrayNoDuplicates!0 (array!73747 (_ BitVec 32) List!24756) Bool)

(assert (=> b!1130796 (= res!755508 (arrayNoDuplicates!0 lt!502202 #b00000000000000000000000000000000 Nil!24753))))

(declare-fun b!1130797 () Bool)

(declare-fun e!643547 () Bool)

(declare-fun e!643555 () Bool)

(assert (=> b!1130797 (= e!643547 e!643555)))

(declare-fun res!755506 () Bool)

(assert (=> b!1130797 (=> res!755506 e!643555)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1130797 (= res!755506 (not (= from!1455 i!673)))))

(declare-datatypes ((V!43053 0))(
  ( (V!43054 (val!14279 Int)) )
))
(declare-fun zeroValue!944 () V!43053)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!17992 0))(
  ( (tuple2!17993 (_1!9007 (_ BitVec 64)) (_2!9007 V!43053)) )
))
(declare-datatypes ((List!24757 0))(
  ( (Nil!24754) (Cons!24753 (h!25962 tuple2!17992) (t!35664 List!24757)) )
))
(declare-datatypes ((ListLongMap!15961 0))(
  ( (ListLongMap!15962 (toList!7996 List!24757)) )
))
(declare-fun lt!502191 () ListLongMap!15961)

(declare-fun minValue!944 () V!43053)

(declare-datatypes ((ValueCell!13513 0))(
  ( (ValueCellFull!13513 (v!16912 V!43053)) (EmptyCell!13513) )
))
(declare-datatypes ((array!73749 0))(
  ( (array!73750 (arr!35527 (Array (_ BitVec 32) ValueCell!13513)) (size!36063 (_ BitVec 32))) )
))
(declare-fun lt!502200 () array!73749)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4483 (array!73747 array!73749 (_ BitVec 32) (_ BitVec 32) V!43053 V!43053 (_ BitVec 32) Int) ListLongMap!15961)

(assert (=> b!1130797 (= lt!502191 (getCurrentListMapNoExtraKeys!4483 lt!502202 lt!502200 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73749)

(declare-fun dynLambda!2558 (Int (_ BitVec 64)) V!43053)

(assert (=> b!1130797 (= lt!502200 (array!73750 (store (arr!35527 _values!996) i!673 (ValueCellFull!13513 (dynLambda!2558 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36063 _values!996)))))

(declare-fun _keys!1208 () array!73747)

(declare-fun lt!502193 () ListLongMap!15961)

(assert (=> b!1130797 (= lt!502193 (getCurrentListMapNoExtraKeys!4483 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!48450 () Bool)

(declare-fun call!48455 () ListLongMap!15961)

(declare-fun call!48460 () ListLongMap!15961)

(assert (=> bm!48450 (= call!48455 call!48460)))

(declare-fun b!1130799 () Bool)

(declare-fun res!755510 () Bool)

(declare-fun e!643556 () Bool)

(assert (=> b!1130799 (=> (not res!755510) (not e!643556))))

(assert (=> b!1130799 (= res!755510 (and (= (size!36063 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36062 _keys!1208) (size!36063 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1130800 () Bool)

(declare-fun res!755516 () Bool)

(assert (=> b!1130800 (=> (not res!755516) (not e!643556))))

(assert (=> b!1130800 (= res!755516 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36062 _keys!1208))))))

(declare-fun b!1130801 () Bool)

(declare-fun res!755517 () Bool)

(assert (=> b!1130801 (=> (not res!755517) (not e!643556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73747 (_ BitVec 32)) Bool)

(assert (=> b!1130801 (= res!755517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1130802 () Bool)

(declare-fun call!48459 () Bool)

(assert (=> b!1130802 call!48459))

(declare-datatypes ((Unit!37046 0))(
  ( (Unit!37047) )
))
(declare-fun lt!502195 () Unit!37046)

(declare-fun call!48456 () Unit!37046)

(assert (=> b!1130802 (= lt!502195 call!48456)))

(declare-fun e!643554 () Unit!37046)

(assert (=> b!1130802 (= e!643554 lt!502195)))

(declare-fun b!1130803 () Bool)

(declare-fun e!643548 () Bool)

(declare-fun e!643544 () Bool)

(declare-fun mapRes!44485 () Bool)

(assert (=> b!1130803 (= e!643548 (and e!643544 mapRes!44485))))

(declare-fun condMapEmpty!44485 () Bool)

(declare-fun mapDefault!44485 () ValueCell!13513)

