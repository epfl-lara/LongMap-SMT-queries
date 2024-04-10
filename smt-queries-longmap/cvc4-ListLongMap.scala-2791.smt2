; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40638 () Bool)

(assert start!40638)

(declare-fun b_free!10649 () Bool)

(declare-fun b_next!10649 () Bool)

(assert (=> start!40638 (= b_free!10649 (not b_next!10649))))

(declare-fun tp!37766 () Bool)

(declare-fun b_and!18657 () Bool)

(assert (=> start!40638 (= tp!37766 b_and!18657)))

(declare-fun b!448772 () Bool)

(declare-fun res!266804 () Bool)

(declare-fun e!263259 () Bool)

(assert (=> b!448772 (=> (not res!266804) (not e!263259))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!448772 (= res!266804 (bvsle from!863 i!563))))

(declare-fun b!448773 () Bool)

(assert (=> b!448773 (= e!263259 false)))

(declare-datatypes ((V!17087 0))(
  ( (V!17088 (val!6038 Int)) )
))
(declare-fun minValue!515 () V!17087)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5650 0))(
  ( (ValueCellFull!5650 (v!8293 V!17087)) (EmptyCell!5650) )
))
(declare-datatypes ((array!27781 0))(
  ( (array!27782 (arr!13336 (Array (_ BitVec 32) ValueCell!5650)) (size!13688 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27781)

(declare-fun zeroValue!515 () V!17087)

(declare-datatypes ((tuple2!7924 0))(
  ( (tuple2!7925 (_1!3973 (_ BitVec 64)) (_2!3973 V!17087)) )
))
(declare-datatypes ((List!7989 0))(
  ( (Nil!7986) (Cons!7985 (h!8841 tuple2!7924) (t!13751 List!7989)) )
))
(declare-datatypes ((ListLongMap!6837 0))(
  ( (ListLongMap!6838 (toList!3434 List!7989)) )
))
(declare-fun lt!204234 () ListLongMap!6837)

(declare-fun v!412 () V!17087)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!27783 0))(
  ( (array!27784 (arr!13337 (Array (_ BitVec 32) (_ BitVec 64))) (size!13689 (_ BitVec 32))) )
))
(declare-fun lt!204232 () array!27783)

(declare-fun getCurrentListMapNoExtraKeys!1620 (array!27783 array!27781 (_ BitVec 32) (_ BitVec 32) V!17087 V!17087 (_ BitVec 32) Int) ListLongMap!6837)

(assert (=> b!448773 (= lt!204234 (getCurrentListMapNoExtraKeys!1620 lt!204232 (array!27782 (store (arr!13336 _values!549) i!563 (ValueCellFull!5650 v!412)) (size!13688 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _keys!709 () array!27783)

(declare-fun lt!204233 () ListLongMap!6837)

(assert (=> b!448773 (= lt!204233 (getCurrentListMapNoExtraKeys!1620 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!19614 () Bool)

(declare-fun mapRes!19614 () Bool)

(assert (=> mapIsEmpty!19614 mapRes!19614))

(declare-fun b!448774 () Bool)

(declare-fun res!266811 () Bool)

(declare-fun e!263264 () Bool)

(assert (=> b!448774 (=> (not res!266811) (not e!263264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27783 (_ BitVec 32)) Bool)

(assert (=> b!448774 (= res!266811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!448775 () Bool)

(declare-fun res!266807 () Bool)

(assert (=> b!448775 (=> (not res!266807) (not e!263259))))

(declare-datatypes ((List!7990 0))(
  ( (Nil!7987) (Cons!7986 (h!8842 (_ BitVec 64)) (t!13752 List!7990)) )
))
(declare-fun arrayNoDuplicates!0 (array!27783 (_ BitVec 32) List!7990) Bool)

(assert (=> b!448775 (= res!266807 (arrayNoDuplicates!0 lt!204232 #b00000000000000000000000000000000 Nil!7987))))

(declare-fun res!266801 () Bool)

(assert (=> start!40638 (=> (not res!266801) (not e!263264))))

(assert (=> start!40638 (= res!266801 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13689 _keys!709))))))

(assert (=> start!40638 e!263264))

(declare-fun tp_is_empty!11987 () Bool)

(assert (=> start!40638 tp_is_empty!11987))

(assert (=> start!40638 tp!37766))

(assert (=> start!40638 true))

(declare-fun e!263263 () Bool)

(declare-fun array_inv!9666 (array!27781) Bool)

(assert (=> start!40638 (and (array_inv!9666 _values!549) e!263263)))

(declare-fun array_inv!9667 (array!27783) Bool)

(assert (=> start!40638 (array_inv!9667 _keys!709)))

(declare-fun b!448776 () Bool)

(declare-fun res!266803 () Bool)

(assert (=> b!448776 (=> (not res!266803) (not e!263264))))

(assert (=> b!448776 (= res!266803 (or (= (select (arr!13337 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13337 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!448777 () Bool)

(declare-fun e!263260 () Bool)

(assert (=> b!448777 (= e!263260 tp_is_empty!11987)))

(declare-fun b!448778 () Bool)

(declare-fun res!266810 () Bool)

(assert (=> b!448778 (=> (not res!266810) (not e!263264))))

(assert (=> b!448778 (= res!266810 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7987))))

(declare-fun b!448779 () Bool)

(declare-fun res!266809 () Bool)

(assert (=> b!448779 (=> (not res!266809) (not e!263264))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!448779 (= res!266809 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!448780 () Bool)

(assert (=> b!448780 (= e!263263 (and e!263260 mapRes!19614))))

(declare-fun condMapEmpty!19614 () Bool)

(declare-fun mapDefault!19614 () ValueCell!5650)

