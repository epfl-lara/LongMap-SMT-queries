; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40208 () Bool)

(assert start!40208)

(declare-fun b_free!10475 () Bool)

(declare-fun b_next!10475 () Bool)

(assert (=> start!40208 (= b_free!10475 (not b_next!10475))))

(declare-fun tp!36953 () Bool)

(declare-fun b_and!18443 () Bool)

(assert (=> start!40208 (= tp!36953 b_and!18443)))

(declare-fun b!440756 () Bool)

(declare-fun e!259633 () Bool)

(assert (=> b!440756 (= e!259633 (not true))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16607 0))(
  ( (V!16608 (val!5858 Int)) )
))
(declare-datatypes ((ValueCell!5470 0))(
  ( (ValueCellFull!5470 (v!8105 V!16607)) (EmptyCell!5470) )
))
(declare-datatypes ((array!27067 0))(
  ( (array!27068 (arr!12983 (Array (_ BitVec 32) ValueCell!5470)) (size!13335 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27067)

(declare-fun zeroValue!515 () V!16607)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!27069 0))(
  ( (array!27070 (arr!12984 (Array (_ BitVec 32) (_ BitVec 64))) (size!13336 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27069)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!202683 () array!27069)

(declare-fun minValue!515 () V!16607)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!202682 () array!27067)

(declare-fun v!412 () V!16607)

(declare-datatypes ((tuple2!7788 0))(
  ( (tuple2!7789 (_1!3905 (_ BitVec 64)) (_2!3905 V!16607)) )
))
(declare-datatypes ((List!7785 0))(
  ( (Nil!7782) (Cons!7781 (h!8637 tuple2!7788) (t!13541 List!7785)) )
))
(declare-datatypes ((ListLongMap!6701 0))(
  ( (ListLongMap!6702 (toList!3366 List!7785)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1555 (array!27069 array!27067 (_ BitVec 32) (_ BitVec 32) V!16607 V!16607 (_ BitVec 32) Int) ListLongMap!6701)

(declare-fun +!1502 (ListLongMap!6701 tuple2!7788) ListLongMap!6701)

(assert (=> b!440756 (= (getCurrentListMapNoExtraKeys!1555 lt!202683 lt!202682 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1502 (getCurrentListMapNoExtraKeys!1555 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7789 k!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13108 0))(
  ( (Unit!13109) )
))
(declare-fun lt!202684 () Unit!13108)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!671 (array!27069 array!27067 (_ BitVec 32) (_ BitVec 32) V!16607 V!16607 (_ BitVec 32) (_ BitVec 64) V!16607 (_ BitVec 32) Int) Unit!13108)

(assert (=> b!440756 (= lt!202684 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!671 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!440757 () Bool)

(declare-fun res!260761 () Bool)

(declare-fun e!259632 () Bool)

(assert (=> b!440757 (=> (not res!260761) (not e!259632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!440757 (= res!260761 (validMask!0 mask!1025))))

(declare-fun b!440758 () Bool)

(declare-fun res!260766 () Bool)

(assert (=> b!440758 (=> (not res!260766) (not e!259632))))

(assert (=> b!440758 (= res!260766 (and (= (size!13335 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13336 _keys!709) (size!13335 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!440759 () Bool)

(declare-fun e!259629 () Bool)

(declare-fun tp_is_empty!11627 () Bool)

(assert (=> b!440759 (= e!259629 tp_is_empty!11627)))

(declare-fun b!440760 () Bool)

(declare-fun e!259631 () Bool)

(assert (=> b!440760 (= e!259631 tp_is_empty!11627)))

(declare-fun mapIsEmpty!19062 () Bool)

(declare-fun mapRes!19062 () Bool)

(assert (=> mapIsEmpty!19062 mapRes!19062))

(declare-fun b!440761 () Bool)

(declare-fun res!260757 () Bool)

(assert (=> b!440761 (=> (not res!260757) (not e!259632))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27069 (_ BitVec 32)) Bool)

(assert (=> b!440761 (= res!260757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!440762 () Bool)

(declare-fun e!259634 () Bool)

(assert (=> b!440762 (= e!259634 e!259633)))

(declare-fun res!260759 () Bool)

(assert (=> b!440762 (=> (not res!260759) (not e!259633))))

(assert (=> b!440762 (= res!260759 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202681 () ListLongMap!6701)

(assert (=> b!440762 (= lt!202681 (getCurrentListMapNoExtraKeys!1555 lt!202683 lt!202682 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!440762 (= lt!202682 (array!27068 (store (arr!12983 _values!549) i!563 (ValueCellFull!5470 v!412)) (size!13335 _values!549)))))

(declare-fun lt!202685 () ListLongMap!6701)

(assert (=> b!440762 (= lt!202685 (getCurrentListMapNoExtraKeys!1555 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!440763 () Bool)

(declare-fun res!260755 () Bool)

(assert (=> b!440763 (=> (not res!260755) (not e!259634))))

(assert (=> b!440763 (= res!260755 (bvsle from!863 i!563))))

(declare-fun res!260764 () Bool)

(assert (=> start!40208 (=> (not res!260764) (not e!259632))))

(assert (=> start!40208 (= res!260764 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13336 _keys!709))))))

(assert (=> start!40208 e!259632))

(assert (=> start!40208 tp_is_empty!11627))

(assert (=> start!40208 tp!36953))

(assert (=> start!40208 true))

(declare-fun e!259635 () Bool)

(declare-fun array_inv!9422 (array!27067) Bool)

(assert (=> start!40208 (and (array_inv!9422 _values!549) e!259635)))

(declare-fun array_inv!9423 (array!27069) Bool)

(assert (=> start!40208 (array_inv!9423 _keys!709)))

(declare-fun b!440764 () Bool)

(assert (=> b!440764 (= e!259635 (and e!259629 mapRes!19062))))

(declare-fun condMapEmpty!19062 () Bool)

(declare-fun mapDefault!19062 () ValueCell!5470)

