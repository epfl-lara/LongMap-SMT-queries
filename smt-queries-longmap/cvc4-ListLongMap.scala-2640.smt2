; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39662 () Bool)

(assert start!39662)

(declare-fun b_free!9929 () Bool)

(declare-fun b_next!9929 () Bool)

(assert (=> start!39662 (= b_free!9929 (not b_next!9929))))

(declare-fun tp!35316 () Bool)

(declare-fun b_and!17585 () Bool)

(assert (=> start!39662 (= tp!35316 b_and!17585)))

(declare-fun b!425711 () Bool)

(declare-fun e!252686 () Bool)

(assert (=> b!425711 (= e!252686 (not true))))

(declare-datatypes ((V!15879 0))(
  ( (V!15880 (val!5585 Int)) )
))
(declare-fun minValue!515 () V!15879)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15879)

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((array!26001 0))(
  ( (array!26002 (arr!12450 (Array (_ BitVec 32) (_ BitVec 64))) (size!12802 (_ BitVec 32))) )
))
(declare-fun lt!194738 () array!26001)

(declare-fun v!412 () V!15879)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!26001)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5197 0))(
  ( (ValueCellFull!5197 (v!7832 V!15879)) (EmptyCell!5197) )
))
(declare-datatypes ((array!26003 0))(
  ( (array!26004 (arr!12451 (Array (_ BitVec 32) ValueCell!5197)) (size!12803 (_ BitVec 32))) )
))
(declare-fun lt!194736 () array!26003)

(declare-fun _values!549 () array!26003)

(declare-datatypes ((tuple2!7334 0))(
  ( (tuple2!7335 (_1!3678 (_ BitVec 64)) (_2!3678 V!15879)) )
))
(declare-datatypes ((List!7347 0))(
  ( (Nil!7344) (Cons!7343 (h!8199 tuple2!7334) (t!12791 List!7347)) )
))
(declare-datatypes ((ListLongMap!6247 0))(
  ( (ListLongMap!6248 (toList!3139 List!7347)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1343 (array!26001 array!26003 (_ BitVec 32) (_ BitVec 32) V!15879 V!15879 (_ BitVec 32) Int) ListLongMap!6247)

(declare-fun +!1297 (ListLongMap!6247 tuple2!7334) ListLongMap!6247)

(assert (=> b!425711 (= (getCurrentListMapNoExtraKeys!1343 lt!194738 lt!194736 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1297 (getCurrentListMapNoExtraKeys!1343 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7335 k!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!12496 0))(
  ( (Unit!12497) )
))
(declare-fun lt!194734 () Unit!12496)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!492 (array!26001 array!26003 (_ BitVec 32) (_ BitVec 32) V!15879 V!15879 (_ BitVec 32) (_ BitVec 64) V!15879 (_ BitVec 32) Int) Unit!12496)

(assert (=> b!425711 (= lt!194734 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!492 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!425712 () Bool)

(declare-fun e!252683 () Bool)

(declare-fun tp_is_empty!11081 () Bool)

(assert (=> b!425712 (= e!252683 tp_is_empty!11081)))

(declare-fun b!425713 () Bool)

(declare-fun res!249310 () Bool)

(declare-fun e!252684 () Bool)

(assert (=> b!425713 (=> (not res!249310) (not e!252684))))

(declare-datatypes ((List!7348 0))(
  ( (Nil!7345) (Cons!7344 (h!8200 (_ BitVec 64)) (t!12792 List!7348)) )
))
(declare-fun arrayNoDuplicates!0 (array!26001 (_ BitVec 32) List!7348) Bool)

(assert (=> b!425713 (= res!249310 (arrayNoDuplicates!0 lt!194738 #b00000000000000000000000000000000 Nil!7345))))

(declare-fun mapNonEmpty!18243 () Bool)

(declare-fun mapRes!18243 () Bool)

(declare-fun tp!35315 () Bool)

(assert (=> mapNonEmpty!18243 (= mapRes!18243 (and tp!35315 e!252683))))

(declare-fun mapKey!18243 () (_ BitVec 32))

(declare-fun mapRest!18243 () (Array (_ BitVec 32) ValueCell!5197))

(declare-fun mapValue!18243 () ValueCell!5197)

(assert (=> mapNonEmpty!18243 (= (arr!12451 _values!549) (store mapRest!18243 mapKey!18243 mapValue!18243))))

(declare-fun b!425714 () Bool)

(declare-fun res!249316 () Bool)

(declare-fun e!252685 () Bool)

(assert (=> b!425714 (=> (not res!249316) (not e!252685))))

(declare-fun arrayContainsKey!0 (array!26001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!425714 (= res!249316 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!425715 () Bool)

(declare-fun e!252682 () Bool)

(assert (=> b!425715 (= e!252682 tp_is_empty!11081)))

(declare-fun b!425716 () Bool)

(declare-fun res!249314 () Bool)

(assert (=> b!425716 (=> (not res!249314) (not e!252685))))

(assert (=> b!425716 (= res!249314 (and (= (size!12803 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12802 _keys!709) (size!12803 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!425717 () Bool)

(declare-fun res!249306 () Bool)

(assert (=> b!425717 (=> (not res!249306) (not e!252685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26001 (_ BitVec 32)) Bool)

(assert (=> b!425717 (= res!249306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!425718 () Bool)

(declare-fun e!252687 () Bool)

(assert (=> b!425718 (= e!252687 (and e!252682 mapRes!18243))))

(declare-fun condMapEmpty!18243 () Bool)

(declare-fun mapDefault!18243 () ValueCell!5197)

