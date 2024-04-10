; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78964 () Bool)

(assert start!78964)

(declare-fun b_free!17177 () Bool)

(declare-fun b_next!17177 () Bool)

(assert (=> start!78964 (= b_free!17177 (not b_next!17177))))

(declare-fun tp!59972 () Bool)

(declare-fun b_and!28091 () Bool)

(assert (=> start!78964 (= tp!59972 b_and!28091)))

(declare-fun b!924013 () Bool)

(declare-fun res!622921 () Bool)

(declare-fun e!518496 () Bool)

(assert (=> b!924013 (=> (not res!622921) (not e!518496))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31211 0))(
  ( (V!31212 (val!9893 Int)) )
))
(declare-datatypes ((ValueCell!9361 0))(
  ( (ValueCellFull!9361 (v!12411 V!31211)) (EmptyCell!9361) )
))
(declare-datatypes ((array!55342 0))(
  ( (array!55343 (arr!26616 (Array (_ BitVec 32) ValueCell!9361)) (size!27075 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55342)

(declare-datatypes ((array!55344 0))(
  ( (array!55345 (arr!26617 (Array (_ BitVec 32) (_ BitVec 64))) (size!27076 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55344)

(assert (=> b!924013 (= res!622921 (and (= (size!27075 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27076 _keys!1487) (size!27075 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!924014 () Bool)

(declare-fun res!622924 () Bool)

(assert (=> b!924014 (=> (not res!622924) (not e!518496))))

(declare-datatypes ((List!18687 0))(
  ( (Nil!18684) (Cons!18683 (h!19829 (_ BitVec 64)) (t!26594 List!18687)) )
))
(declare-fun arrayNoDuplicates!0 (array!55344 (_ BitVec 32) List!18687) Bool)

(assert (=> b!924014 (= res!622924 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18684))))

(declare-fun res!622926 () Bool)

(assert (=> start!78964 (=> (not res!622926) (not e!518496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78964 (= res!622926 (validMask!0 mask!1881))))

(assert (=> start!78964 e!518496))

(assert (=> start!78964 true))

(declare-fun tp_is_empty!19685 () Bool)

(assert (=> start!78964 tp_is_empty!19685))

(declare-fun e!518490 () Bool)

(declare-fun array_inv!20730 (array!55342) Bool)

(assert (=> start!78964 (and (array_inv!20730 _values!1231) e!518490)))

(assert (=> start!78964 tp!59972))

(declare-fun array_inv!20731 (array!55344) Bool)

(assert (=> start!78964 (array_inv!20731 _keys!1487)))

(declare-fun b!924015 () Bool)

(declare-fun e!518499 () Bool)

(declare-fun e!518494 () Bool)

(assert (=> b!924015 (= e!518499 e!518494)))

(declare-fun res!622922 () Bool)

(assert (=> b!924015 (=> (not res!622922) (not e!518494))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun v!791 () V!31211)

(declare-fun lt!415342 () V!31211)

(assert (=> b!924015 (= res!622922 (and (= lt!415342 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!12884 0))(
  ( (tuple2!12885 (_1!6453 (_ BitVec 64)) (_2!6453 V!31211)) )
))
(declare-datatypes ((List!18688 0))(
  ( (Nil!18685) (Cons!18684 (h!19830 tuple2!12884) (t!26595 List!18688)) )
))
(declare-datatypes ((ListLongMap!11581 0))(
  ( (ListLongMap!11582 (toList!5806 List!18688)) )
))
(declare-fun lt!415339 () ListLongMap!11581)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun apply!636 (ListLongMap!11581 (_ BitVec 64)) V!31211)

(assert (=> b!924015 (= lt!415342 (apply!636 lt!415339 k!1099))))

(declare-fun b!924016 () Bool)

(declare-datatypes ((Unit!31185 0))(
  ( (Unit!31186) )
))
(declare-fun e!518497 () Unit!31185)

(declare-fun e!518495 () Unit!31185)

(assert (=> b!924016 (= e!518497 e!518495)))

(declare-fun lt!415334 () (_ BitVec 64))

(assert (=> b!924016 (= lt!415334 (select (arr!26617 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96356 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!924016 (= c!96356 (validKeyInArray!0 lt!415334))))

(declare-fun mapIsEmpty!31284 () Bool)

(declare-fun mapRes!31284 () Bool)

(assert (=> mapIsEmpty!31284 mapRes!31284))

(declare-fun b!924017 () Bool)

(declare-fun e!518491 () Bool)

(assert (=> b!924017 (= e!518490 (and e!518491 mapRes!31284))))

(declare-fun condMapEmpty!31284 () Bool)

(declare-fun mapDefault!31284 () ValueCell!9361)

