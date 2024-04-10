; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39050 () Bool)

(assert start!39050)

(declare-fun b_free!9317 () Bool)

(declare-fun b_next!9317 () Bool)

(assert (=> start!39050 (= b_free!9317 (not b_next!9317))))

(declare-fun tp!33480 () Bool)

(declare-fun b_and!16703 () Bool)

(assert (=> start!39050 (= tp!33480 b_and!16703)))

(declare-fun b!409737 () Bool)

(declare-fun res!237328 () Bool)

(declare-fun e!245729 () Bool)

(assert (=> b!409737 (=> (not res!237328) (not e!245729))))

(declare-datatypes ((array!24811 0))(
  ( (array!24812 (arr!11855 (Array (_ BitVec 32) (_ BitVec 64))) (size!12207 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24811)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15063 0))(
  ( (V!15064 (val!5279 Int)) )
))
(declare-datatypes ((ValueCell!4891 0))(
  ( (ValueCellFull!4891 (v!7526 V!15063)) (EmptyCell!4891) )
))
(declare-datatypes ((array!24813 0))(
  ( (array!24814 (arr!11856 (Array (_ BitVec 32) ValueCell!4891)) (size!12208 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24813)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!409737 (= res!237328 (and (= (size!12208 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12207 _keys!709) (size!12208 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!237330 () Bool)

(assert (=> start!39050 (=> (not res!237330) (not e!245729))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39050 (= res!237330 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12207 _keys!709))))))

(assert (=> start!39050 e!245729))

(declare-fun tp_is_empty!10469 () Bool)

(assert (=> start!39050 tp_is_empty!10469))

(assert (=> start!39050 tp!33480))

(assert (=> start!39050 true))

(declare-fun e!245730 () Bool)

(declare-fun array_inv!8654 (array!24813) Bool)

(assert (=> start!39050 (and (array_inv!8654 _values!549) e!245730)))

(declare-fun array_inv!8655 (array!24811) Bool)

(assert (=> start!39050 (array_inv!8655 _keys!709)))

(declare-fun b!409738 () Bool)

(declare-fun e!245728 () Bool)

(assert (=> b!409738 (= e!245729 e!245728)))

(declare-fun res!237335 () Bool)

(assert (=> b!409738 (=> (not res!237335) (not e!245728))))

(declare-fun lt!188986 () array!24811)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24811 (_ BitVec 32)) Bool)

(assert (=> b!409738 (= res!237335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188986 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!409738 (= lt!188986 (array!24812 (store (arr!11855 _keys!709) i!563 k!794) (size!12207 _keys!709)))))

(declare-fun b!409739 () Bool)

(declare-fun e!245725 () Bool)

(assert (=> b!409739 (= e!245725 tp_is_empty!10469)))

(declare-fun b!409740 () Bool)

(declare-fun res!237331 () Bool)

(assert (=> b!409740 (=> (not res!237331) (not e!245729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409740 (= res!237331 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!17325 () Bool)

(declare-fun mapRes!17325 () Bool)

(declare-fun tp!33479 () Bool)

(declare-fun e!245726 () Bool)

(assert (=> mapNonEmpty!17325 (= mapRes!17325 (and tp!33479 e!245726))))

(declare-fun mapRest!17325 () (Array (_ BitVec 32) ValueCell!4891))

(declare-fun mapValue!17325 () ValueCell!4891)

(declare-fun mapKey!17325 () (_ BitVec 32))

(assert (=> mapNonEmpty!17325 (= (arr!11856 _values!549) (store mapRest!17325 mapKey!17325 mapValue!17325))))

(declare-fun b!409741 () Bool)

(assert (=> b!409741 (= e!245728 false)))

(declare-datatypes ((tuple2!6844 0))(
  ( (tuple2!6845 (_1!3433 (_ BitVec 64)) (_2!3433 V!15063)) )
))
(declare-datatypes ((List!6867 0))(
  ( (Nil!6864) (Cons!6863 (h!7719 tuple2!6844) (t!12041 List!6867)) )
))
(declare-datatypes ((ListLongMap!5757 0))(
  ( (ListLongMap!5758 (toList!2894 List!6867)) )
))
(declare-fun lt!188987 () ListLongMap!5757)

(declare-fun minValue!515 () V!15063)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15063)

(declare-fun getCurrentListMapNoExtraKeys!1102 (array!24811 array!24813 (_ BitVec 32) (_ BitVec 32) V!15063 V!15063 (_ BitVec 32) Int) ListLongMap!5757)

(assert (=> b!409741 (= lt!188987 (getCurrentListMapNoExtraKeys!1102 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!409742 () Bool)

(declare-fun res!237338 () Bool)

(assert (=> b!409742 (=> (not res!237338) (not e!245729))))

(assert (=> b!409742 (= res!237338 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12207 _keys!709))))))

(declare-fun b!409743 () Bool)

(declare-fun res!237334 () Bool)

(assert (=> b!409743 (=> (not res!237334) (not e!245728))))

(assert (=> b!409743 (= res!237334 (bvsle from!863 i!563))))

(declare-fun b!409744 () Bool)

(declare-fun res!237333 () Bool)

(assert (=> b!409744 (=> (not res!237333) (not e!245729))))

(assert (=> b!409744 (= res!237333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!409745 () Bool)

(assert (=> b!409745 (= e!245730 (and e!245725 mapRes!17325))))

(declare-fun condMapEmpty!17325 () Bool)

(declare-fun mapDefault!17325 () ValueCell!4891)

