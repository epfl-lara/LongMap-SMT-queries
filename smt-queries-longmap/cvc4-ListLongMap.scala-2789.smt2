; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40626 () Bool)

(assert start!40626)

(declare-fun b_free!10637 () Bool)

(declare-fun b_next!10637 () Bool)

(assert (=> start!40626 (= b_free!10637 (not b_next!10637))))

(declare-fun tp!37730 () Bool)

(declare-fun b_and!18645 () Bool)

(assert (=> start!40626 (= tp!37730 b_and!18645)))

(declare-fun res!266590 () Bool)

(declare-fun e!263153 () Bool)

(assert (=> start!40626 (=> (not res!266590) (not e!263153))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27757 0))(
  ( (array!27758 (arr!13324 (Array (_ BitVec 32) (_ BitVec 64))) (size!13676 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27757)

(assert (=> start!40626 (= res!266590 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13676 _keys!709))))))

(assert (=> start!40626 e!263153))

(declare-fun tp_is_empty!11975 () Bool)

(assert (=> start!40626 tp_is_empty!11975))

(assert (=> start!40626 tp!37730))

(assert (=> start!40626 true))

(declare-datatypes ((V!17071 0))(
  ( (V!17072 (val!6032 Int)) )
))
(declare-datatypes ((ValueCell!5644 0))(
  ( (ValueCellFull!5644 (v!8287 V!17071)) (EmptyCell!5644) )
))
(declare-datatypes ((array!27759 0))(
  ( (array!27760 (arr!13325 (Array (_ BitVec 32) ValueCell!5644)) (size!13677 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27759)

(declare-fun e!263151 () Bool)

(declare-fun array_inv!9654 (array!27759) Bool)

(assert (=> start!40626 (and (array_inv!9654 _values!549) e!263151)))

(declare-fun array_inv!9655 (array!27757) Bool)

(assert (=> start!40626 (array_inv!9655 _keys!709)))

(declare-fun b!448502 () Bool)

(declare-fun e!263155 () Bool)

(assert (=> b!448502 (= e!263155 false)))

(declare-fun minValue!515 () V!17071)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!204178 () array!27757)

(declare-fun zeroValue!515 () V!17071)

(declare-datatypes ((tuple2!7914 0))(
  ( (tuple2!7915 (_1!3968 (_ BitVec 64)) (_2!3968 V!17071)) )
))
(declare-datatypes ((List!7978 0))(
  ( (Nil!7975) (Cons!7974 (h!8830 tuple2!7914) (t!13740 List!7978)) )
))
(declare-datatypes ((ListLongMap!6827 0))(
  ( (ListLongMap!6828 (toList!3429 List!7978)) )
))
(declare-fun lt!204180 () ListLongMap!6827)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!17071)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1615 (array!27757 array!27759 (_ BitVec 32) (_ BitVec 32) V!17071 V!17071 (_ BitVec 32) Int) ListLongMap!6827)

(assert (=> b!448502 (= lt!204180 (getCurrentListMapNoExtraKeys!1615 lt!204178 (array!27760 (store (arr!13325 _values!549) i!563 (ValueCellFull!5644 v!412)) (size!13677 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204179 () ListLongMap!6827)

(assert (=> b!448502 (= lt!204179 (getCurrentListMapNoExtraKeys!1615 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!448503 () Bool)

(declare-fun res!266591 () Bool)

(assert (=> b!448503 (=> (not res!266591) (not e!263153))))

(assert (=> b!448503 (= res!266591 (and (= (size!13677 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13676 _keys!709) (size!13677 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!448504 () Bool)

(assert (=> b!448504 (= e!263153 e!263155)))

(declare-fun res!266594 () Bool)

(assert (=> b!448504 (=> (not res!266594) (not e!263155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27757 (_ BitVec 32)) Bool)

(assert (=> b!448504 (= res!266594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204178 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!448504 (= lt!204178 (array!27758 (store (arr!13324 _keys!709) i!563 k!794) (size!13676 _keys!709)))))

(declare-fun b!448505 () Bool)

(declare-fun res!266588 () Bool)

(assert (=> b!448505 (=> (not res!266588) (not e!263155))))

(declare-datatypes ((List!7979 0))(
  ( (Nil!7976) (Cons!7975 (h!8831 (_ BitVec 64)) (t!13741 List!7979)) )
))
(declare-fun arrayNoDuplicates!0 (array!27757 (_ BitVec 32) List!7979) Bool)

(assert (=> b!448505 (= res!266588 (arrayNoDuplicates!0 lt!204178 #b00000000000000000000000000000000 Nil!7976))))

(declare-fun b!448506 () Bool)

(declare-fun res!266593 () Bool)

(assert (=> b!448506 (=> (not res!266593) (not e!263153))))

(assert (=> b!448506 (= res!266593 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13676 _keys!709))))))

(declare-fun mapIsEmpty!19596 () Bool)

(declare-fun mapRes!19596 () Bool)

(assert (=> mapIsEmpty!19596 mapRes!19596))

(declare-fun b!448507 () Bool)

(declare-fun e!263152 () Bool)

(assert (=> b!448507 (= e!263152 tp_is_empty!11975)))

(declare-fun b!448508 () Bool)

(declare-fun res!266586 () Bool)

(assert (=> b!448508 (=> (not res!266586) (not e!263155))))

(assert (=> b!448508 (= res!266586 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!19596 () Bool)

(declare-fun tp!37731 () Bool)

(declare-fun e!263156 () Bool)

(assert (=> mapNonEmpty!19596 (= mapRes!19596 (and tp!37731 e!263156))))

(declare-fun mapRest!19596 () (Array (_ BitVec 32) ValueCell!5644))

(declare-fun mapValue!19596 () ValueCell!5644)

(declare-fun mapKey!19596 () (_ BitVec 32))

(assert (=> mapNonEmpty!19596 (= (arr!13325 _values!549) (store mapRest!19596 mapKey!19596 mapValue!19596))))

(declare-fun b!448509 () Bool)

(declare-fun res!266584 () Bool)

(assert (=> b!448509 (=> (not res!266584) (not e!263153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!448509 (= res!266584 (validMask!0 mask!1025))))

(declare-fun b!448510 () Bool)

(assert (=> b!448510 (= e!263156 tp_is_empty!11975)))

(declare-fun b!448511 () Bool)

(assert (=> b!448511 (= e!263151 (and e!263152 mapRes!19596))))

(declare-fun condMapEmpty!19596 () Bool)

(declare-fun mapDefault!19596 () ValueCell!5644)

