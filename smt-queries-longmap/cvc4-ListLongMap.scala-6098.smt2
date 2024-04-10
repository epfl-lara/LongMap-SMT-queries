; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78700 () Bool)

(assert start!78700)

(declare-fun b_free!16913 () Bool)

(declare-fun b_next!16913 () Bool)

(assert (=> start!78700 (= b_free!16913 (not b_next!16913))))

(declare-fun tp!59179 () Bool)

(declare-fun b_and!27563 () Bool)

(assert (=> start!78700 (= tp!59179 b_and!27563)))

(declare-fun mapNonEmpty!30888 () Bool)

(declare-fun mapRes!30888 () Bool)

(declare-fun tp!59180 () Bool)

(declare-fun e!515251 () Bool)

(assert (=> mapNonEmpty!30888 (= mapRes!30888 (and tp!59180 e!515251))))

(declare-fun mapKey!30888 () (_ BitVec 32))

(declare-datatypes ((V!30859 0))(
  ( (V!30860 (val!9761 Int)) )
))
(declare-datatypes ((ValueCell!9229 0))(
  ( (ValueCellFull!9229 (v!12279 V!30859)) (EmptyCell!9229) )
))
(declare-datatypes ((array!54828 0))(
  ( (array!54829 (arr!26359 (Array (_ BitVec 32) ValueCell!9229)) (size!26818 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54828)

(declare-fun mapRest!30888 () (Array (_ BitVec 32) ValueCell!9229))

(declare-fun mapValue!30888 () ValueCell!9229)

(assert (=> mapNonEmpty!30888 (= (arr!26359 _values!1231) (store mapRest!30888 mapKey!30888 mapValue!30888))))

(declare-fun b!917796 () Bool)

(declare-fun e!515246 () Bool)

(declare-fun e!515245 () Bool)

(assert (=> b!917796 (= e!515246 e!515245)))

(declare-fun res!618764 () Bool)

(assert (=> b!917796 (=> (not res!618764) (not e!515245))))

(declare-datatypes ((tuple2!12680 0))(
  ( (tuple2!12681 (_1!6351 (_ BitVec 64)) (_2!6351 V!30859)) )
))
(declare-datatypes ((List!18489 0))(
  ( (Nil!18486) (Cons!18485 (h!19631 tuple2!12680) (t!26132 List!18489)) )
))
(declare-datatypes ((ListLongMap!11377 0))(
  ( (ListLongMap!11378 (toList!5704 List!18489)) )
))
(declare-fun lt!412093 () ListLongMap!11377)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4755 (ListLongMap!11377 (_ BitVec 64)) Bool)

(assert (=> b!917796 (= res!618764 (contains!4755 lt!412093 k!1099))))

(declare-datatypes ((array!54830 0))(
  ( (array!54831 (arr!26360 (Array (_ BitVec 32) (_ BitVec 64))) (size!26819 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54830)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30859)

(declare-fun minValue!1173 () V!30859)

(declare-fun getCurrentListMap!2962 (array!54830 array!54828 (_ BitVec 32) (_ BitVec 32) V!30859 V!30859 (_ BitVec 32) Int) ListLongMap!11377)

(assert (=> b!917796 (= lt!412093 (getCurrentListMap!2962 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!917797 () Bool)

(declare-fun res!618768 () Bool)

(assert (=> b!917797 (=> (not res!618768) (not e!515246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54830 (_ BitVec 32)) Bool)

(assert (=> b!917797 (= res!618768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917799 () Bool)

(declare-fun res!618761 () Bool)

(assert (=> b!917799 (=> (not res!618761) (not e!515246))))

(assert (=> b!917799 (= res!618761 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26819 _keys!1487))))))

(declare-fun b!917800 () Bool)

(declare-fun e!515247 () Bool)

(declare-fun e!515249 () Bool)

(assert (=> b!917800 (= e!515247 (and e!515249 mapRes!30888))))

(declare-fun condMapEmpty!30888 () Bool)

(declare-fun mapDefault!30888 () ValueCell!9229)

