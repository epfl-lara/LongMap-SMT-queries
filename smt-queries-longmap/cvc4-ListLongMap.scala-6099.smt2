; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78706 () Bool)

(assert start!78706)

(declare-fun b_free!16919 () Bool)

(declare-fun b_next!16919 () Bool)

(assert (=> start!78706 (= b_free!16919 (not b_next!16919))))

(declare-fun tp!59198 () Bool)

(declare-fun b_and!27575 () Bool)

(assert (=> start!78706 (= tp!59198 b_and!27575)))

(declare-fun b!917919 () Bool)

(declare-fun e!515311 () Bool)

(assert (=> b!917919 (= e!515311 (not true))))

(declare-datatypes ((array!54838 0))(
  ( (array!54839 (arr!26364 (Array (_ BitVec 32) (_ BitVec 64))) (size!26823 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54838)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun lt!412119 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30867 0))(
  ( (V!30868 (val!9764 Int)) )
))
(declare-datatypes ((ValueCell!9232 0))(
  ( (ValueCellFull!9232 (v!12282 V!30867)) (EmptyCell!9232) )
))
(declare-datatypes ((array!54840 0))(
  ( (array!54841 (arr!26365 (Array (_ BitVec 32) ValueCell!9232)) (size!26824 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54840)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30867)

(declare-fun minValue!1173 () V!30867)

(declare-datatypes ((tuple2!12684 0))(
  ( (tuple2!12685 (_1!6353 (_ BitVec 64)) (_2!6353 V!30867)) )
))
(declare-datatypes ((List!18492 0))(
  ( (Nil!18489) (Cons!18488 (h!19634 tuple2!12684) (t!26141 List!18492)) )
))
(declare-datatypes ((ListLongMap!11381 0))(
  ( (ListLongMap!11382 (toList!5706 List!18492)) )
))
(declare-fun getCurrentListMap!2964 (array!54838 array!54840 (_ BitVec 32) (_ BitVec 32) V!30867 V!30867 (_ BitVec 32) Int) ListLongMap!11381)

(declare-fun +!2620 (ListLongMap!11381 tuple2!12684) ListLongMap!11381)

(declare-fun get!13815 (ValueCell!9232 V!30867) V!30867)

(declare-fun dynLambda!1409 (Int (_ BitVec 64)) V!30867)

(assert (=> b!917919 (= (getCurrentListMap!2964 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2620 (getCurrentListMap!2964 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12685 lt!412119 (get!13815 (select (arr!26365 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1409 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30988 0))(
  ( (Unit!30989) )
))
(declare-fun lt!412118 () Unit!30988)

(declare-fun lemmaListMapRecursiveValidKeyArray!10 (array!54838 array!54840 (_ BitVec 32) (_ BitVec 32) V!30867 V!30867 (_ BitVec 32) Int) Unit!30988)

(assert (=> b!917919 (= lt!412118 (lemmaListMapRecursiveValidKeyArray!10 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!917920 () Bool)

(declare-fun e!515314 () Bool)

(declare-fun tp_is_empty!19427 () Bool)

(assert (=> b!917920 (= e!515314 tp_is_empty!19427)))

(declare-fun b!917921 () Bool)

(declare-fun e!515313 () Bool)

(assert (=> b!917921 (= e!515313 tp_is_empty!19427)))

(declare-fun res!618850 () Bool)

(declare-fun e!515309 () Bool)

(assert (=> start!78706 (=> (not res!618850) (not e!515309))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78706 (= res!618850 (validMask!0 mask!1881))))

(assert (=> start!78706 e!515309))

(assert (=> start!78706 true))

(assert (=> start!78706 tp_is_empty!19427))

(declare-fun e!515312 () Bool)

(declare-fun array_inv!20558 (array!54840) Bool)

(assert (=> start!78706 (and (array_inv!20558 _values!1231) e!515312)))

(assert (=> start!78706 tp!59198))

(declare-fun array_inv!20559 (array!54838) Bool)

(assert (=> start!78706 (array_inv!20559 _keys!1487)))

(declare-fun b!917922 () Bool)

(declare-fun res!618858 () Bool)

(assert (=> b!917922 (=> (not res!618858) (not e!515309))))

(assert (=> b!917922 (= res!618858 (and (= (size!26824 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26823 _keys!1487) (size!26824 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30897 () Bool)

(declare-fun mapRes!30897 () Bool)

(assert (=> mapIsEmpty!30897 mapRes!30897))

(declare-fun b!917923 () Bool)

(declare-fun e!515310 () Bool)

(assert (=> b!917923 (= e!515310 e!515311)))

(declare-fun res!618859 () Bool)

(assert (=> b!917923 (=> (not res!618859) (not e!515311))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!917923 (= res!618859 (validKeyInArray!0 lt!412119))))

(assert (=> b!917923 (= lt!412119 (select (arr!26364 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!917924 () Bool)

(declare-fun res!618852 () Bool)

(assert (=> b!917924 (=> (not res!618852) (not e!515309))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54838 (_ BitVec 32)) Bool)

(assert (=> b!917924 (= res!618852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917925 () Bool)

(assert (=> b!917925 (= e!515312 (and e!515313 mapRes!30897))))

(declare-fun condMapEmpty!30897 () Bool)

(declare-fun mapDefault!30897 () ValueCell!9232)

