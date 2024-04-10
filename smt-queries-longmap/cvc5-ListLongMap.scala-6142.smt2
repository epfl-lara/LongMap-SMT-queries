; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78960 () Bool)

(assert start!78960)

(declare-fun b_free!17173 () Bool)

(declare-fun b_next!17173 () Bool)

(assert (=> start!78960 (= b_free!17173 (not b_next!17173))))

(declare-fun tp!59959 () Bool)

(declare-fun b_and!28083 () Bool)

(assert (=> start!78960 (= tp!59959 b_and!28083)))

(declare-fun res!622867 () Bool)

(declare-fun e!518421 () Bool)

(assert (=> start!78960 (=> (not res!622867) (not e!518421))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78960 (= res!622867 (validMask!0 mask!1881))))

(assert (=> start!78960 e!518421))

(assert (=> start!78960 true))

(declare-fun tp_is_empty!19681 () Bool)

(assert (=> start!78960 tp_is_empty!19681))

(declare-datatypes ((V!31207 0))(
  ( (V!31208 (val!9891 Int)) )
))
(declare-datatypes ((ValueCell!9359 0))(
  ( (ValueCellFull!9359 (v!12409 V!31207)) (EmptyCell!9359) )
))
(declare-datatypes ((array!55334 0))(
  ( (array!55335 (arr!26612 (Array (_ BitVec 32) ValueCell!9359)) (size!27071 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55334)

(declare-fun e!518419 () Bool)

(declare-fun array_inv!20726 (array!55334) Bool)

(assert (=> start!78960 (and (array_inv!20726 _values!1231) e!518419)))

(assert (=> start!78960 tp!59959))

(declare-datatypes ((array!55336 0))(
  ( (array!55337 (arr!26613 (Array (_ BitVec 32) (_ BitVec 64))) (size!27072 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55336)

(declare-fun array_inv!20727 (array!55336) Bool)

(assert (=> start!78960 (array_inv!20727 _keys!1487)))

(declare-fun b!923901 () Bool)

(declare-fun e!518426 () Bool)

(assert (=> b!923901 (= e!518426 false)))

(declare-fun lt!415249 () V!31207)

(declare-datatypes ((tuple2!12880 0))(
  ( (tuple2!12881 (_1!6451 (_ BitVec 64)) (_2!6451 V!31207)) )
))
(declare-datatypes ((List!18684 0))(
  ( (Nil!18681) (Cons!18680 (h!19826 tuple2!12880) (t!26587 List!18684)) )
))
(declare-datatypes ((ListLongMap!11577 0))(
  ( (ListLongMap!11578 (toList!5804 List!18684)) )
))
(declare-fun lt!415242 () ListLongMap!11577)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun apply!634 (ListLongMap!11577 (_ BitVec 64)) V!31207)

(assert (=> b!923901 (= lt!415249 (apply!634 lt!415242 k!1099))))

(declare-fun b!923902 () Bool)

(declare-fun res!622872 () Bool)

(assert (=> b!923902 (=> (not res!622872) (not e!518421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55336 (_ BitVec 32)) Bool)

(assert (=> b!923902 (= res!622872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!923903 () Bool)

(declare-datatypes ((Unit!31179 0))(
  ( (Unit!31180) )
))
(declare-fun e!518418 () Unit!31179)

(declare-fun e!518420 () Unit!31179)

(assert (=> b!923903 (= e!518418 e!518420)))

(declare-fun lt!415247 () (_ BitVec 64))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!923903 (= lt!415247 (select (arr!26613 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96338 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!923903 (= c!96338 (validKeyInArray!0 lt!415247))))

(declare-fun b!923904 () Bool)

(declare-fun e!518428 () Bool)

(assert (=> b!923904 (= e!518428 e!518426)))

(declare-fun res!622870 () Bool)

(assert (=> b!923904 (=> (not res!622870) (not e!518426))))

(declare-fun contains!4866 (ListLongMap!11577 (_ BitVec 64)) Bool)

(assert (=> b!923904 (= res!622870 (contains!4866 lt!415242 k!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31207)

(declare-fun minValue!1173 () V!31207)

(declare-fun getCurrentListMap!3057 (array!55336 array!55334 (_ BitVec 32) (_ BitVec 32) V!31207 V!31207 (_ BitVec 32) Int) ListLongMap!11577)

(assert (=> b!923904 (= lt!415242 (getCurrentListMap!3057 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!923905 () Bool)

(declare-fun e!518422 () Bool)

(declare-fun mapRes!31278 () Bool)

(assert (=> b!923905 (= e!518419 (and e!518422 mapRes!31278))))

(declare-fun condMapEmpty!31278 () Bool)

(declare-fun mapDefault!31278 () ValueCell!9359)

