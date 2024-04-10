; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78676 () Bool)

(assert start!78676)

(declare-fun b_free!16889 () Bool)

(declare-fun b_next!16889 () Bool)

(assert (=> start!78676 (= b_free!16889 (not b_next!16889))))

(declare-fun tp!59107 () Bool)

(declare-fun b_and!27515 () Bool)

(assert (=> start!78676 (= tp!59107 b_and!27515)))

(declare-fun b!917304 () Bool)

(declare-fun res!618403 () Bool)

(declare-fun e!514994 () Bool)

(assert (=> b!917304 (=> (not res!618403) (not e!514994))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!917304 (= res!618403 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!917305 () Bool)

(declare-fun e!514993 () Bool)

(assert (=> b!917305 (= e!514993 e!514994)))

(declare-fun res!618405 () Bool)

(assert (=> b!917305 (=> (not res!618405) (not e!514994))))

(declare-datatypes ((V!30827 0))(
  ( (V!30828 (val!9749 Int)) )
))
(declare-datatypes ((tuple2!12660 0))(
  ( (tuple2!12661 (_1!6341 (_ BitVec 64)) (_2!6341 V!30827)) )
))
(declare-datatypes ((List!18470 0))(
  ( (Nil!18467) (Cons!18466 (h!19612 tuple2!12660) (t!26089 List!18470)) )
))
(declare-datatypes ((ListLongMap!11357 0))(
  ( (ListLongMap!11358 (toList!5694 List!18470)) )
))
(declare-fun lt!411984 () ListLongMap!11357)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4746 (ListLongMap!11357 (_ BitVec 64)) Bool)

(assert (=> b!917305 (= res!618405 (contains!4746 lt!411984 k!1099))))

(declare-datatypes ((array!54780 0))(
  ( (array!54781 (arr!26335 (Array (_ BitVec 32) (_ BitVec 64))) (size!26794 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54780)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9217 0))(
  ( (ValueCellFull!9217 (v!12267 V!30827)) (EmptyCell!9217) )
))
(declare-datatypes ((array!54782 0))(
  ( (array!54783 (arr!26336 (Array (_ BitVec 32) ValueCell!9217)) (size!26795 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54782)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30827)

(declare-fun minValue!1173 () V!30827)

(declare-fun getCurrentListMap!2953 (array!54780 array!54782 (_ BitVec 32) (_ BitVec 32) V!30827 V!30827 (_ BitVec 32) Int) ListLongMap!11357)

(assert (=> b!917305 (= lt!411984 (getCurrentListMap!2953 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!917306 () Bool)

(declare-fun e!514996 () Bool)

(declare-fun tp_is_empty!19397 () Bool)

(assert (=> b!917306 (= e!514996 tp_is_empty!19397)))

(declare-fun b!917307 () Bool)

(declare-fun res!618400 () Bool)

(assert (=> b!917307 (=> (not res!618400) (not e!514993))))

(declare-datatypes ((List!18471 0))(
  ( (Nil!18468) (Cons!18467 (h!19613 (_ BitVec 64)) (t!26090 List!18471)) )
))
(declare-fun arrayNoDuplicates!0 (array!54780 (_ BitVec 32) List!18471) Bool)

(assert (=> b!917307 (= res!618400 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18468))))

(declare-fun b!917308 () Bool)

(declare-fun res!618401 () Bool)

(assert (=> b!917308 (=> (not res!618401) (not e!514993))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54780 (_ BitVec 32)) Bool)

(assert (=> b!917308 (= res!618401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917309 () Bool)

(declare-fun e!514999 () Bool)

(declare-fun mapRes!30852 () Bool)

(assert (=> b!917309 (= e!514999 (and e!514996 mapRes!30852))))

(declare-fun condMapEmpty!30852 () Bool)

(declare-fun mapDefault!30852 () ValueCell!9217)

