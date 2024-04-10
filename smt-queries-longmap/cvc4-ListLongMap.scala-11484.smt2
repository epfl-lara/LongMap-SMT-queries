; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133706 () Bool)

(assert start!133706)

(declare-fun b_free!32069 () Bool)

(declare-fun b_next!32069 () Bool)

(assert (=> start!133706 (= b_free!32069 (not b_next!32069))))

(declare-fun tp!113412 () Bool)

(declare-fun b_and!51639 () Bool)

(assert (=> start!133706 (= tp!113412 b_and!51639)))

(declare-fun b!1563305 () Bool)

(declare-fun e!871276 () Bool)

(declare-fun e!871272 () Bool)

(assert (=> b!1563305 (= e!871276 e!871272)))

(declare-fun res!1068752 () Bool)

(assert (=> b!1563305 (=> (not res!1068752) (not e!871272))))

(declare-datatypes ((V!59925 0))(
  ( (V!59926 (val!19478 Int)) )
))
(declare-datatypes ((tuple2!25132 0))(
  ( (tuple2!25133 (_1!12577 (_ BitVec 64)) (_2!12577 V!59925)) )
))
(declare-datatypes ((List!36516 0))(
  ( (Nil!36513) (Cons!36512 (h!37958 tuple2!25132) (t!51363 List!36516)) )
))
(declare-datatypes ((ListLongMap!22567 0))(
  ( (ListLongMap!22568 (toList!11299 List!36516)) )
))
(declare-fun lt!671862 () ListLongMap!22567)

(declare-fun contains!10289 (ListLongMap!22567 (_ BitVec 64)) Bool)

(assert (=> b!1563305 (= res!1068752 (not (contains!10289 lt!671862 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59925)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59925)

(declare-datatypes ((ValueCell!18364 0))(
  ( (ValueCellFull!18364 (v!22230 V!59925)) (EmptyCell!18364) )
))
(declare-datatypes ((array!104276 0))(
  ( (array!104277 (arr!50330 (Array (_ BitVec 32) ValueCell!18364)) (size!50880 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104276)

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104278 0))(
  ( (array!104279 (arr!50331 (Array (_ BitVec 32) (_ BitVec 64))) (size!50881 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104278)

(declare-fun getCurrentListMapNoExtraKeys!6682 (array!104278 array!104276 (_ BitVec 32) (_ BitVec 32) V!59925 V!59925 (_ BitVec 32) Int) ListLongMap!22567)

(assert (=> b!1563305 (= lt!671862 (getCurrentListMapNoExtraKeys!6682 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapNonEmpty!59559 () Bool)

(declare-fun mapRes!59559 () Bool)

(declare-fun tp!113411 () Bool)

(declare-fun e!871273 () Bool)

(assert (=> mapNonEmpty!59559 (= mapRes!59559 (and tp!113411 e!871273))))

(declare-fun mapKey!59559 () (_ BitVec 32))

(declare-fun mapValue!59559 () ValueCell!18364)

(declare-fun mapRest!59559 () (Array (_ BitVec 32) ValueCell!18364))

(assert (=> mapNonEmpty!59559 (= (arr!50330 _values!487) (store mapRest!59559 mapKey!59559 mapValue!59559))))

(declare-fun res!1068755 () Bool)

(assert (=> start!133706 (=> (not res!1068755) (not e!871276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133706 (= res!1068755 (validMask!0 mask!947))))

(assert (=> start!133706 e!871276))

(assert (=> start!133706 tp!113412))

(declare-fun tp_is_empty!38789 () Bool)

(assert (=> start!133706 tp_is_empty!38789))

(assert (=> start!133706 true))

(declare-fun array_inv!39117 (array!104278) Bool)

(assert (=> start!133706 (array_inv!39117 _keys!637)))

(declare-fun e!871271 () Bool)

(declare-fun array_inv!39118 (array!104276) Bool)

(assert (=> start!133706 (and (array_inv!39118 _values!487) e!871271)))

(declare-fun b!1563306 () Bool)

(declare-fun res!1068754 () Bool)

(assert (=> b!1563306 (=> (not res!1068754) (not e!871276))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563306 (= res!1068754 (not (validKeyInArray!0 (select (arr!50331 _keys!637) from!782))))))

(declare-fun b!1563307 () Bool)

(declare-fun e!871275 () Bool)

(assert (=> b!1563307 (= e!871275 tp_is_empty!38789)))

(declare-fun mapIsEmpty!59559 () Bool)

(assert (=> mapIsEmpty!59559 mapRes!59559))

(declare-fun b!1563308 () Bool)

(assert (=> b!1563308 (= e!871271 (and e!871275 mapRes!59559))))

(declare-fun condMapEmpty!59559 () Bool)

(declare-fun mapDefault!59559 () ValueCell!18364)

