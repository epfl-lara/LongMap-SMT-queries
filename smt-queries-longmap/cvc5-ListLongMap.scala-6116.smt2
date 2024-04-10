; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78804 () Bool)

(assert start!78804)

(declare-fun b_free!17017 () Bool)

(declare-fun b_next!17017 () Bool)

(assert (=> start!78804 (= b_free!17017 (not b_next!17017))))

(declare-fun tp!59492 () Bool)

(declare-fun b_and!27771 () Bool)

(assert (=> start!78804 (= tp!59492 b_and!27771)))

(declare-fun b!919928 () Bool)

(declare-fun res!620328 () Bool)

(declare-fun e!516342 () Bool)

(assert (=> b!919928 (=> (not res!620328) (not e!516342))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((V!30999 0))(
  ( (V!31000 (val!9813 Int)) )
))
(declare-fun v!791 () V!30999)

(declare-datatypes ((tuple2!12754 0))(
  ( (tuple2!12755 (_1!6388 (_ BitVec 64)) (_2!6388 V!30999)) )
))
(declare-datatypes ((List!18558 0))(
  ( (Nil!18555) (Cons!18554 (h!19700 tuple2!12754) (t!26305 List!18558)) )
))
(declare-datatypes ((ListLongMap!11451 0))(
  ( (ListLongMap!11452 (toList!5741 List!18558)) )
))
(declare-fun lt!412958 () ListLongMap!11451)

(declare-fun apply!584 (ListLongMap!11451 (_ BitVec 64)) V!30999)

(assert (=> b!919928 (= res!620328 (= (apply!584 lt!412958 k!1099) v!791))))

(declare-fun mapNonEmpty!31044 () Bool)

(declare-fun mapRes!31044 () Bool)

(declare-fun tp!59491 () Bool)

(declare-fun e!516343 () Bool)

(assert (=> mapNonEmpty!31044 (= mapRes!31044 (and tp!59491 e!516343))))

(declare-datatypes ((ValueCell!9281 0))(
  ( (ValueCellFull!9281 (v!12331 V!30999)) (EmptyCell!9281) )
))
(declare-fun mapValue!31044 () ValueCell!9281)

(declare-fun mapKey!31044 () (_ BitVec 32))

(declare-datatypes ((array!55032 0))(
  ( (array!55033 (arr!26461 (Array (_ BitVec 32) ValueCell!9281)) (size!26920 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55032)

(declare-fun mapRest!31044 () (Array (_ BitVec 32) ValueCell!9281))

(assert (=> mapNonEmpty!31044 (= (arr!26461 _values!1231) (store mapRest!31044 mapKey!31044 mapValue!31044))))

(declare-fun b!919929 () Bool)

(declare-fun e!516337 () Bool)

(declare-fun tp_is_empty!19525 () Bool)

(assert (=> b!919929 (= e!516337 tp_is_empty!19525)))

(declare-fun b!919930 () Bool)

(declare-fun res!620321 () Bool)

(assert (=> b!919930 (=> (not res!620321) (not e!516342))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!919930 (= res!620321 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!919931 () Bool)

(declare-fun e!516341 () Bool)

(assert (=> b!919931 (= e!516341 e!516342)))

(declare-fun res!620325 () Bool)

(assert (=> b!919931 (=> (not res!620325) (not e!516342))))

(declare-fun contains!4787 (ListLongMap!11451 (_ BitVec 64)) Bool)

(assert (=> b!919931 (= res!620325 (contains!4787 lt!412958 k!1099))))

(declare-datatypes ((array!55034 0))(
  ( (array!55035 (arr!26462 (Array (_ BitVec 32) (_ BitVec 64))) (size!26921 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55034)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30999)

(declare-fun minValue!1173 () V!30999)

(declare-fun getCurrentListMap!2997 (array!55034 array!55032 (_ BitVec 32) (_ BitVec 32) V!30999 V!30999 (_ BitVec 32) Int) ListLongMap!11451)

(assert (=> b!919931 (= lt!412958 (getCurrentListMap!2997 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!919932 () Bool)

(declare-fun res!620320 () Bool)

(assert (=> b!919932 (=> (not res!620320) (not e!516341))))

(assert (=> b!919932 (= res!620320 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26921 _keys!1487))))))

(declare-fun res!620326 () Bool)

(assert (=> start!78804 (=> (not res!620326) (not e!516341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78804 (= res!620326 (validMask!0 mask!1881))))

(assert (=> start!78804 e!516341))

(assert (=> start!78804 true))

(assert (=> start!78804 tp_is_empty!19525))

(declare-fun e!516339 () Bool)

(declare-fun array_inv!20622 (array!55032) Bool)

(assert (=> start!78804 (and (array_inv!20622 _values!1231) e!516339)))

(assert (=> start!78804 tp!59492))

(declare-fun array_inv!20623 (array!55034) Bool)

(assert (=> start!78804 (array_inv!20623 _keys!1487)))

(declare-fun mapIsEmpty!31044 () Bool)

(assert (=> mapIsEmpty!31044 mapRes!31044))

(declare-fun b!919933 () Bool)

(assert (=> b!919933 (= e!516343 tp_is_empty!19525)))

(declare-fun b!919934 () Bool)

(declare-fun res!620329 () Bool)

(assert (=> b!919934 (=> (not res!620329) (not e!516342))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919934 (= res!620329 (validKeyInArray!0 k!1099))))

(declare-fun b!919935 () Bool)

(assert (=> b!919935 (= e!516339 (and e!516337 mapRes!31044))))

(declare-fun condMapEmpty!31044 () Bool)

(declare-fun mapDefault!31044 () ValueCell!9281)

