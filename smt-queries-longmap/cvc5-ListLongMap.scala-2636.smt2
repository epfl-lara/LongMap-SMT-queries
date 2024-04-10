; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39634 () Bool)

(assert start!39634)

(declare-fun b_free!9901 () Bool)

(declare-fun b_next!9901 () Bool)

(assert (=> start!39634 (= b_free!9901 (not b_next!9901))))

(declare-fun tp!35231 () Bool)

(declare-fun b_and!17557 () Bool)

(assert (=> start!39634 (= tp!35231 b_and!17557)))

(declare-fun mapNonEmpty!18201 () Bool)

(declare-fun mapRes!18201 () Bool)

(declare-fun tp!35232 () Bool)

(declare-fun e!252393 () Bool)

(assert (=> mapNonEmpty!18201 (= mapRes!18201 (and tp!35232 e!252393))))

(declare-datatypes ((V!15843 0))(
  ( (V!15844 (val!5571 Int)) )
))
(declare-datatypes ((ValueCell!5183 0))(
  ( (ValueCellFull!5183 (v!7818 V!15843)) (EmptyCell!5183) )
))
(declare-fun mapRest!18201 () (Array (_ BitVec 32) ValueCell!5183))

(declare-datatypes ((array!25945 0))(
  ( (array!25946 (arr!12422 (Array (_ BitVec 32) ValueCell!5183)) (size!12774 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25945)

(declare-fun mapValue!18201 () ValueCell!5183)

(declare-fun mapKey!18201 () (_ BitVec 32))

(assert (=> mapNonEmpty!18201 (= (arr!12422 _values!549) (store mapRest!18201 mapKey!18201 mapValue!18201))))

(declare-fun b!425039 () Bool)

(declare-fun res!248769 () Bool)

(declare-fun e!252391 () Bool)

(assert (=> b!425039 (=> (not res!248769) (not e!252391))))

(declare-datatypes ((array!25947 0))(
  ( (array!25948 (arr!12423 (Array (_ BitVec 32) (_ BitVec 64))) (size!12775 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25947)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!425039 (= res!248769 (and (= (size!12774 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12775 _keys!709) (size!12774 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!425040 () Bool)

(declare-fun res!248762 () Bool)

(assert (=> b!425040 (=> (not res!248762) (not e!252391))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!425040 (= res!248762 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!425041 () Bool)

(declare-fun e!252387 () Bool)

(declare-fun tp_is_empty!11053 () Bool)

(assert (=> b!425041 (= e!252387 tp_is_empty!11053)))

(declare-fun b!425042 () Bool)

(declare-fun e!252389 () Bool)

(assert (=> b!425042 (= e!252391 e!252389)))

(declare-fun res!248767 () Bool)

(assert (=> b!425042 (=> (not res!248767) (not e!252389))))

(declare-fun lt!194525 () array!25947)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25947 (_ BitVec 32)) Bool)

(assert (=> b!425042 (= res!248767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194525 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!425042 (= lt!194525 (array!25948 (store (arr!12423 _keys!709) i!563 k!794) (size!12775 _keys!709)))))

(declare-fun b!425043 () Bool)

(declare-fun res!248766 () Bool)

(assert (=> b!425043 (=> (not res!248766) (not e!252391))))

(assert (=> b!425043 (= res!248766 (or (= (select (arr!12423 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12423 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!248764 () Bool)

(assert (=> start!39634 (=> (not res!248764) (not e!252391))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39634 (= res!248764 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12775 _keys!709))))))

(assert (=> start!39634 e!252391))

(assert (=> start!39634 tp_is_empty!11053))

(assert (=> start!39634 tp!35231))

(assert (=> start!39634 true))

(declare-fun e!252392 () Bool)

(declare-fun array_inv!9052 (array!25945) Bool)

(assert (=> start!39634 (and (array_inv!9052 _values!549) e!252392)))

(declare-fun array_inv!9053 (array!25947) Bool)

(assert (=> start!39634 (array_inv!9053 _keys!709)))

(declare-fun b!425044 () Bool)

(declare-fun res!248760 () Bool)

(assert (=> b!425044 (=> (not res!248760) (not e!252389))))

(declare-datatypes ((List!7328 0))(
  ( (Nil!7325) (Cons!7324 (h!8180 (_ BitVec 64)) (t!12772 List!7328)) )
))
(declare-fun arrayNoDuplicates!0 (array!25947 (_ BitVec 32) List!7328) Bool)

(assert (=> b!425044 (= res!248760 (arrayNoDuplicates!0 lt!194525 #b00000000000000000000000000000000 Nil!7325))))

(declare-fun b!425045 () Bool)

(declare-fun res!248770 () Bool)

(assert (=> b!425045 (=> (not res!248770) (not e!252391))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!425045 (= res!248770 (validMask!0 mask!1025))))

(declare-fun b!425046 () Bool)

(declare-fun res!248763 () Bool)

(assert (=> b!425046 (=> (not res!248763) (not e!252389))))

(assert (=> b!425046 (= res!248763 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!18201 () Bool)

(assert (=> mapIsEmpty!18201 mapRes!18201))

(declare-fun b!425047 () Bool)

(declare-fun res!248771 () Bool)

(assert (=> b!425047 (=> (not res!248771) (not e!252391))))

(assert (=> b!425047 (= res!248771 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12775 _keys!709))))))

(declare-fun b!425048 () Bool)

(assert (=> b!425048 (= e!252392 (and e!252387 mapRes!18201))))

(declare-fun condMapEmpty!18201 () Bool)

(declare-fun mapDefault!18201 () ValueCell!5183)

