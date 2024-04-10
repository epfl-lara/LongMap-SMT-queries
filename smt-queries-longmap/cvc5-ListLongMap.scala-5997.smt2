; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77834 () Bool)

(assert start!77834)

(declare-fun b_free!16393 () Bool)

(declare-fun b_next!16393 () Bool)

(assert (=> start!77834 (= b_free!16393 (not b_next!16393))))

(declare-fun tp!57444 () Bool)

(declare-fun b_and!26943 () Bool)

(assert (=> start!77834 (= tp!57444 b_and!26943)))

(declare-fun b!908719 () Bool)

(declare-fun e!509312 () Bool)

(declare-fun tp_is_empty!18811 () Bool)

(assert (=> b!908719 (= e!509312 tp_is_empty!18811)))

(declare-fun b!908720 () Bool)

(declare-fun e!509316 () Bool)

(declare-fun e!509319 () Bool)

(assert (=> b!908720 (= e!509316 (not e!509319))))

(declare-fun res!613347 () Bool)

(assert (=> b!908720 (=> res!613347 e!509319)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53650 0))(
  ( (array!53651 (arr!25783 (Array (_ BitVec 32) (_ BitVec 64))) (size!26242 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53650)

(assert (=> b!908720 (= res!613347 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26242 _keys!1386))))))

(declare-datatypes ((V!30047 0))(
  ( (V!30048 (val!9456 Int)) )
))
(declare-datatypes ((ValueCell!8924 0))(
  ( (ValueCellFull!8924 (v!11963 V!30047)) (EmptyCell!8924) )
))
(declare-datatypes ((array!53652 0))(
  ( (array!53653 (arr!25784 (Array (_ BitVec 32) ValueCell!8924)) (size!26243 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53652)

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!409818 () V!30047)

(declare-fun get!13575 (ValueCell!8924 V!30047) V!30047)

(declare-fun dynLambda!1380 (Int (_ BitVec 64)) V!30047)

(assert (=> b!908720 (= lt!409818 (get!13575 (select (arr!25784 _values!1152) i!717) (dynLambda!1380 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53650 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!908720 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((Unit!30840 0))(
  ( (Unit!30841) )
))
(declare-fun lt!409820 () Unit!30840)

(declare-fun zeroValue!1094 () V!30047)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30047)

(declare-fun lemmaKeyInListMapIsInArray!252 (array!53650 array!53652 (_ BitVec 32) (_ BitVec 32) V!30047 V!30047 (_ BitVec 64) Int) Unit!30840)

(assert (=> b!908720 (= lt!409820 (lemmaKeyInListMapIsInArray!252 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!908721 () Bool)

(declare-fun res!613353 () Bool)

(assert (=> b!908721 (=> (not res!613353) (not e!509316))))

(assert (=> b!908721 (= res!613353 (and (= (select (arr!25783 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!908722 () Bool)

(declare-fun e!509314 () Bool)

(assert (=> b!908722 (= e!509314 e!509316)))

(declare-fun res!613351 () Bool)

(assert (=> b!908722 (=> (not res!613351) (not e!509316))))

(declare-datatypes ((tuple2!12320 0))(
  ( (tuple2!12321 (_1!6171 (_ BitVec 64)) (_2!6171 V!30047)) )
))
(declare-datatypes ((List!18115 0))(
  ( (Nil!18112) (Cons!18111 (h!19257 tuple2!12320) (t!25680 List!18115)) )
))
(declare-datatypes ((ListLongMap!11017 0))(
  ( (ListLongMap!11018 (toList!5524 List!18115)) )
))
(declare-fun lt!409819 () ListLongMap!11017)

(declare-fun contains!4567 (ListLongMap!11017 (_ BitVec 64)) Bool)

(assert (=> b!908722 (= res!613351 (contains!4567 lt!409819 k!1033))))

(declare-fun getCurrentListMap!2787 (array!53650 array!53652 (_ BitVec 32) (_ BitVec 32) V!30047 V!30047 (_ BitVec 32) Int) ListLongMap!11017)

(assert (=> b!908722 (= lt!409819 (getCurrentListMap!2787 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!908723 () Bool)

(declare-fun res!613349 () Bool)

(assert (=> b!908723 (=> (not res!613349) (not e!509316))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!908723 (= res!613349 (inRange!0 i!717 mask!1756))))

(declare-fun b!908725 () Bool)

(declare-fun e!509318 () Bool)

(declare-fun mapRes!29932 () Bool)

(assert (=> b!908725 (= e!509318 (and e!509312 mapRes!29932))))

(declare-fun condMapEmpty!29932 () Bool)

(declare-fun mapDefault!29932 () ValueCell!8924)

