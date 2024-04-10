; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98724 () Bool)

(assert start!98724)

(declare-fun b_free!24329 () Bool)

(declare-fun b_next!24329 () Bool)

(assert (=> start!98724 (= b_free!24329 (not b_next!24329))))

(declare-fun tp!85698 () Bool)

(declare-fun b_and!39507 () Bool)

(assert (=> start!98724 (= tp!85698 b_and!39507)))

(declare-fun call!53492 () Bool)

(declare-fun c!113820 () Bool)

(declare-datatypes ((V!43605 0))(
  ( (V!43606 (val!14486 Int)) )
))
(declare-datatypes ((tuple2!18384 0))(
  ( (tuple2!18385 (_1!9203 (_ BitVec 64)) (_2!9203 V!43605)) )
))
(declare-datatypes ((List!25133 0))(
  ( (Nil!25130) (Cons!25129 (h!26338 tuple2!18384) (t!36454 List!25133)) )
))
(declare-datatypes ((ListLongMap!16353 0))(
  ( (ListLongMap!16354 (toList!8192 List!25133)) )
))
(declare-fun lt!514609 () ListLongMap!16353)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun bm!53487 () Bool)

(declare-fun call!53491 () ListLongMap!16353)

(declare-fun contains!6713 (ListLongMap!16353 (_ BitVec 64)) Bool)

(assert (=> bm!53487 (= call!53492 (contains!6713 (ite c!113820 lt!514609 call!53491) k!934))))

(declare-datatypes ((array!74565 0))(
  ( (array!74566 (arr!35933 (Array (_ BitVec 32) (_ BitVec 64))) (size!36469 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74565)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!654178 () Bool)

(declare-fun b!1150146 () Bool)

(declare-fun arrayContainsKey!0 (array!74565 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1150146 (= e!654178 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!765070 () Bool)

(declare-fun e!654180 () Bool)

(assert (=> start!98724 (=> (not res!765070) (not e!654180))))

(assert (=> start!98724 (= res!765070 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36469 _keys!1208))))))

(assert (=> start!98724 e!654180))

(declare-fun tp_is_empty!28859 () Bool)

(assert (=> start!98724 tp_is_empty!28859))

(declare-fun array_inv!27520 (array!74565) Bool)

(assert (=> start!98724 (array_inv!27520 _keys!1208)))

(assert (=> start!98724 true))

(assert (=> start!98724 tp!85698))

(declare-datatypes ((ValueCell!13720 0))(
  ( (ValueCellFull!13720 (v!17123 V!43605)) (EmptyCell!13720) )
))
(declare-datatypes ((array!74567 0))(
  ( (array!74568 (arr!35934 (Array (_ BitVec 32) ValueCell!13720)) (size!36470 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74567)

(declare-fun e!654175 () Bool)

(declare-fun array_inv!27521 (array!74567) Bool)

(assert (=> start!98724 (and (array_inv!27521 _values!996) e!654175)))

(declare-fun b!1150147 () Bool)

(declare-fun res!765076 () Bool)

(declare-fun e!654173 () Bool)

(assert (=> b!1150147 (=> (not res!765076) (not e!654173))))

(declare-fun lt!514599 () array!74565)

(declare-datatypes ((List!25134 0))(
  ( (Nil!25131) (Cons!25130 (h!26339 (_ BitVec 64)) (t!36455 List!25134)) )
))
(declare-fun arrayNoDuplicates!0 (array!74565 (_ BitVec 32) List!25134) Bool)

(assert (=> b!1150147 (= res!765076 (arrayNoDuplicates!0 lt!514599 #b00000000000000000000000000000000 Nil!25131))))

(declare-fun b!1150148 () Bool)

(declare-fun e!654188 () Bool)

(declare-fun e!654176 () Bool)

(assert (=> b!1150148 (= e!654188 e!654176)))

(declare-fun res!765072 () Bool)

(assert (=> b!1150148 (=> res!765072 e!654176)))

(assert (=> b!1150148 (= res!765072 (not (= (select (arr!35933 _keys!1208) from!1455) k!934)))))

(declare-fun e!654177 () Bool)

(assert (=> b!1150148 e!654177))

(declare-fun c!113819 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1150148 (= c!113819 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!43605)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43605)

(declare-datatypes ((Unit!37819 0))(
  ( (Unit!37820) )
))
(declare-fun lt!514591 () Unit!37819)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!562 (array!74565 array!74567 (_ BitVec 32) (_ BitVec 32) V!43605 V!43605 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37819)

(assert (=> b!1150148 (= lt!514591 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!562 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150149 () Bool)

(declare-fun e!654183 () Bool)

(declare-fun mapRes!45113 () Bool)

(assert (=> b!1150149 (= e!654175 (and e!654183 mapRes!45113))))

(declare-fun condMapEmpty!45113 () Bool)

(declare-fun mapDefault!45113 () ValueCell!13720)

