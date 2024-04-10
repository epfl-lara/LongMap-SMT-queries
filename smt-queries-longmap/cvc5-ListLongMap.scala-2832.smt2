; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40956 () Bool)

(assert start!40956)

(declare-fun b_free!10891 () Bool)

(declare-fun b_next!10891 () Bool)

(assert (=> start!40956 (= b_free!10891 (not b_next!10891))))

(declare-fun tp!38499 () Bool)

(declare-fun b_and!19033 () Bool)

(assert (=> start!40956 (= tp!38499 b_and!19033)))

(declare-fun b!455672 () Bool)

(declare-fun res!271763 () Bool)

(declare-fun e!266375 () Bool)

(assert (=> b!455672 (=> (not res!271763) (not e!266375))))

(declare-datatypes ((array!28261 0))(
  ( (array!28262 (arr!13574 (Array (_ BitVec 32) (_ BitVec 64))) (size!13926 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28261)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17411 0))(
  ( (V!17412 (val!6159 Int)) )
))
(declare-datatypes ((ValueCell!5771 0))(
  ( (ValueCellFull!5771 (v!8425 V!17411)) (EmptyCell!5771) )
))
(declare-datatypes ((array!28263 0))(
  ( (array!28264 (arr!13575 (Array (_ BitVec 32) ValueCell!5771)) (size!13927 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28263)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!455672 (= res!271763 (and (= (size!13927 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13926 _keys!709) (size!13927 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!271754 () Bool)

(assert (=> start!40956 (=> (not res!271754) (not e!266375))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40956 (= res!271754 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13926 _keys!709))))))

(assert (=> start!40956 e!266375))

(declare-fun tp_is_empty!12229 () Bool)

(assert (=> start!40956 tp_is_empty!12229))

(assert (=> start!40956 tp!38499))

(assert (=> start!40956 true))

(declare-fun e!266372 () Bool)

(declare-fun array_inv!9836 (array!28263) Bool)

(assert (=> start!40956 (and (array_inv!9836 _values!549) e!266372)))

(declare-fun array_inv!9837 (array!28261) Bool)

(assert (=> start!40956 (array_inv!9837 _keys!709)))

(declare-fun b!455673 () Bool)

(declare-fun res!271759 () Bool)

(declare-fun e!266376 () Bool)

(assert (=> b!455673 (=> (not res!271759) (not e!266376))))

(declare-fun lt!206382 () array!28261)

(declare-datatypes ((List!8182 0))(
  ( (Nil!8179) (Cons!8178 (h!9034 (_ BitVec 64)) (t!14010 List!8182)) )
))
(declare-fun arrayNoDuplicates!0 (array!28261 (_ BitVec 32) List!8182) Bool)

(assert (=> b!455673 (= res!271759 (arrayNoDuplicates!0 lt!206382 #b00000000000000000000000000000000 Nil!8179))))

(declare-fun b!455674 () Bool)

(assert (=> b!455674 (= e!266376 false)))

(declare-fun minValue!515 () V!17411)

(declare-fun defaultEntry!557 () Int)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!17411)

(declare-datatypes ((tuple2!8114 0))(
  ( (tuple2!8115 (_1!4068 (_ BitVec 64)) (_2!4068 V!17411)) )
))
(declare-datatypes ((List!8183 0))(
  ( (Nil!8180) (Cons!8179 (h!9035 tuple2!8114) (t!14011 List!8183)) )
))
(declare-datatypes ((ListLongMap!7027 0))(
  ( (ListLongMap!7028 (toList!3529 List!8183)) )
))
(declare-fun lt!206383 () ListLongMap!7027)

(declare-fun zeroValue!515 () V!17411)

(declare-fun getCurrentListMapNoExtraKeys!1712 (array!28261 array!28263 (_ BitVec 32) (_ BitVec 32) V!17411 V!17411 (_ BitVec 32) Int) ListLongMap!7027)

(assert (=> b!455674 (= lt!206383 (getCurrentListMapNoExtraKeys!1712 lt!206382 (array!28264 (store (arr!13575 _values!549) i!563 (ValueCellFull!5771 v!412)) (size!13927 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206384 () ListLongMap!7027)

(assert (=> b!455674 (= lt!206384 (getCurrentListMapNoExtraKeys!1712 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!455675 () Bool)

(declare-fun res!271758 () Bool)

(assert (=> b!455675 (=> (not res!271758) (not e!266375))))

(assert (=> b!455675 (= res!271758 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13926 _keys!709))))))

(declare-fun b!455676 () Bool)

(assert (=> b!455676 (= e!266375 e!266376)))

(declare-fun res!271761 () Bool)

(assert (=> b!455676 (=> (not res!271761) (not e!266376))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28261 (_ BitVec 32)) Bool)

(assert (=> b!455676 (= res!271761 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206382 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!455676 (= lt!206382 (array!28262 (store (arr!13574 _keys!709) i!563 k!794) (size!13926 _keys!709)))))

(declare-fun mapNonEmpty!19984 () Bool)

(declare-fun mapRes!19984 () Bool)

(declare-fun tp!38500 () Bool)

(declare-fun e!266373 () Bool)

(assert (=> mapNonEmpty!19984 (= mapRes!19984 (and tp!38500 e!266373))))

(declare-fun mapKey!19984 () (_ BitVec 32))

(declare-fun mapValue!19984 () ValueCell!5771)

(declare-fun mapRest!19984 () (Array (_ BitVec 32) ValueCell!5771))

(assert (=> mapNonEmpty!19984 (= (arr!13575 _values!549) (store mapRest!19984 mapKey!19984 mapValue!19984))))

(declare-fun b!455677 () Bool)

(declare-fun e!266374 () Bool)

(assert (=> b!455677 (= e!266372 (and e!266374 mapRes!19984))))

(declare-fun condMapEmpty!19984 () Bool)

(declare-fun mapDefault!19984 () ValueCell!5771)

