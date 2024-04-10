; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131924 () Bool)

(assert start!131924)

(declare-fun b_free!31637 () Bool)

(declare-fun b_next!31637 () Bool)

(assert (=> start!131924 (= b_free!31637 (not b_next!31637))))

(declare-fun tp!111163 () Bool)

(declare-fun b_and!51047 () Bool)

(assert (=> start!131924 (= tp!111163 b_and!51047)))

(declare-fun res!1059533 () Bool)

(declare-fun e!859845 () Bool)

(assert (=> start!131924 (=> (not res!1059533) (not e!859845))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131924 (= res!1059533 (validMask!0 mask!926))))

(assert (=> start!131924 e!859845))

(declare-datatypes ((array!103034 0))(
  ( (array!103035 (arr!49719 (Array (_ BitVec 32) (_ BitVec 64))) (size!50269 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103034)

(declare-fun array_inv!38673 (array!103034) Bool)

(assert (=> start!131924 (array_inv!38673 _keys!618)))

(declare-fun tp_is_empty!37913 () Bool)

(assert (=> start!131924 tp_is_empty!37913))

(assert (=> start!131924 true))

(assert (=> start!131924 tp!111163))

(declare-datatypes ((V!58993 0))(
  ( (V!58994 (val!19034 Int)) )
))
(declare-datatypes ((ValueCell!18046 0))(
  ( (ValueCellFull!18046 (v!21835 V!58993)) (EmptyCell!18046) )
))
(declare-datatypes ((array!103036 0))(
  ( (array!103037 (arr!49720 (Array (_ BitVec 32) ValueCell!18046)) (size!50270 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103036)

(declare-fun e!859848 () Bool)

(declare-fun array_inv!38674 (array!103036) Bool)

(assert (=> start!131924 (and (array_inv!38674 _values!470) e!859848)))

(declare-fun b!1544767 () Bool)

(declare-datatypes ((tuple2!24454 0))(
  ( (tuple2!24455 (_1!12238 (_ BitVec 64)) (_2!12238 V!58993)) )
))
(declare-datatypes ((List!35969 0))(
  ( (Nil!35966) (Cons!35965 (h!37410 tuple2!24454) (t!50663 List!35969)) )
))
(declare-datatypes ((ListLongMap!22063 0))(
  ( (ListLongMap!22064 (toList!11047 List!35969)) )
))
(declare-fun e!859846 () ListLongMap!22063)

(declare-fun call!69009 () ListLongMap!22063)

(assert (=> b!1544767 (= e!859846 call!69009)))

(declare-fun b!1544768 () Bool)

(declare-fun e!859843 () Bool)

(assert (=> b!1544768 (= e!859843 tp_is_empty!37913)))

(declare-fun b!1544769 () Bool)

(declare-fun e!859841 () ListLongMap!22063)

(assert (=> b!1544769 (= e!859841 call!69009)))

(declare-fun b!1544770 () Bool)

(declare-fun e!859847 () ListLongMap!22063)

(declare-fun call!69007 () ListLongMap!22063)

(declare-fun minValue!436 () V!58993)

(declare-fun +!4883 (ListLongMap!22063 tuple2!24454) ListLongMap!22063)

(assert (=> b!1544770 (= e!859847 (+!4883 call!69007 (tuple2!24455 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1544771 () Bool)

(declare-fun e!859842 () Bool)

(assert (=> b!1544771 (= e!859842 tp_is_empty!37913)))

(declare-fun mapNonEmpty!58573 () Bool)

(declare-fun mapRes!58573 () Bool)

(declare-fun tp!111162 () Bool)

(assert (=> mapNonEmpty!58573 (= mapRes!58573 (and tp!111162 e!859843))))

(declare-fun mapValue!58573 () ValueCell!18046)

(declare-fun mapRest!58573 () (Array (_ BitVec 32) ValueCell!18046))

(declare-fun mapKey!58573 () (_ BitVec 32))

(assert (=> mapNonEmpty!58573 (= (arr!49720 _values!470) (store mapRest!58573 mapKey!58573 mapValue!58573))))

(declare-fun zeroValue!436 () V!58993)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun bm!69002 () Bool)

(declare-fun call!69005 () ListLongMap!22063)

(declare-fun getCurrentListMapNoExtraKeys!6517 (array!103034 array!103036 (_ BitVec 32) (_ BitVec 32) V!58993 V!58993 (_ BitVec 32) Int) ListLongMap!22063)

(assert (=> bm!69002 (= call!69005 (getCurrentListMapNoExtraKeys!6517 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapIsEmpty!58573 () Bool)

(assert (=> mapIsEmpty!58573 mapRes!58573))

(declare-fun b!1544772 () Bool)

(assert (=> b!1544772 (= e!859848 (and e!859842 mapRes!58573))))

(declare-fun condMapEmpty!58573 () Bool)

(declare-fun mapDefault!58573 () ValueCell!18046)

