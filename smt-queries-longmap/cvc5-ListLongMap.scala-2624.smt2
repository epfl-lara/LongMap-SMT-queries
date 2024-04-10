; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39562 () Bool)

(assert start!39562)

(declare-fun b_free!9829 () Bool)

(declare-fun b_next!9829 () Bool)

(assert (=> start!39562 (= b_free!9829 (not b_next!9829))))

(declare-fun tp!35016 () Bool)

(declare-fun b_and!17485 () Bool)

(assert (=> start!39562 (= tp!35016 b_and!17485)))

(declare-fun b!423399 () Bool)

(declare-fun e!251724 () Bool)

(declare-fun e!251720 () Bool)

(assert (=> b!423399 (= e!251724 e!251720)))

(declare-fun res!247455 () Bool)

(assert (=> b!423399 (=> (not res!247455) (not e!251720))))

(declare-datatypes ((array!25807 0))(
  ( (array!25808 (arr!12353 (Array (_ BitVec 32) (_ BitVec 64))) (size!12705 (_ BitVec 32))) )
))
(declare-fun lt!194162 () array!25807)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25807 (_ BitVec 32)) Bool)

(assert (=> b!423399 (= res!247455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194162 mask!1025))))

(declare-fun _keys!709 () array!25807)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!423399 (= lt!194162 (array!25808 (store (arr!12353 _keys!709) i!563 k!794) (size!12705 _keys!709)))))

(declare-fun b!423400 () Bool)

(declare-fun res!247452 () Bool)

(assert (=> b!423400 (=> (not res!247452) (not e!251724))))

(declare-fun arrayContainsKey!0 (array!25807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423400 (= res!247452 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!423401 () Bool)

(declare-fun res!247454 () Bool)

(assert (=> b!423401 (=> (not res!247454) (not e!251724))))

(assert (=> b!423401 (= res!247454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!423402 () Bool)

(declare-fun res!247447 () Bool)

(assert (=> b!423402 (=> (not res!247447) (not e!251720))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!423402 (= res!247447 (bvsle from!863 i!563))))

(declare-fun b!423403 () Bool)

(declare-fun res!247448 () Bool)

(assert (=> b!423403 (=> (not res!247448) (not e!251724))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423403 (= res!247448 (validKeyInArray!0 k!794))))

(declare-fun res!247453 () Bool)

(assert (=> start!39562 (=> (not res!247453) (not e!251724))))

(assert (=> start!39562 (= res!247453 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12705 _keys!709))))))

(assert (=> start!39562 e!251724))

(declare-fun tp_is_empty!10981 () Bool)

(assert (=> start!39562 tp_is_empty!10981))

(assert (=> start!39562 tp!35016))

(assert (=> start!39562 true))

(declare-datatypes ((V!15747 0))(
  ( (V!15748 (val!5535 Int)) )
))
(declare-datatypes ((ValueCell!5147 0))(
  ( (ValueCellFull!5147 (v!7782 V!15747)) (EmptyCell!5147) )
))
(declare-datatypes ((array!25809 0))(
  ( (array!25810 (arr!12354 (Array (_ BitVec 32) ValueCell!5147)) (size!12706 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25809)

(declare-fun e!251721 () Bool)

(declare-fun array_inv!9000 (array!25809) Bool)

(assert (=> start!39562 (and (array_inv!9000 _values!549) e!251721)))

(declare-fun array_inv!9001 (array!25807) Bool)

(assert (=> start!39562 (array_inv!9001 _keys!709)))

(declare-fun b!423404 () Bool)

(declare-fun res!247445 () Bool)

(assert (=> b!423404 (=> (not res!247445) (not e!251720))))

(declare-datatypes ((List!7277 0))(
  ( (Nil!7274) (Cons!7273 (h!8129 (_ BitVec 64)) (t!12721 List!7277)) )
))
(declare-fun arrayNoDuplicates!0 (array!25807 (_ BitVec 32) List!7277) Bool)

(assert (=> b!423404 (= res!247445 (arrayNoDuplicates!0 lt!194162 #b00000000000000000000000000000000 Nil!7274))))

(declare-fun b!423405 () Bool)

(assert (=> b!423405 (= e!251720 false)))

(declare-fun minValue!515 () V!15747)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15747)

(declare-datatypes ((tuple2!7270 0))(
  ( (tuple2!7271 (_1!3646 (_ BitVec 64)) (_2!3646 V!15747)) )
))
(declare-datatypes ((List!7278 0))(
  ( (Nil!7275) (Cons!7274 (h!8130 tuple2!7270) (t!12722 List!7278)) )
))
(declare-datatypes ((ListLongMap!6183 0))(
  ( (ListLongMap!6184 (toList!3107 List!7278)) )
))
(declare-fun lt!194161 () ListLongMap!6183)

(declare-fun v!412 () V!15747)

(declare-fun getCurrentListMapNoExtraKeys!1311 (array!25807 array!25809 (_ BitVec 32) (_ BitVec 32) V!15747 V!15747 (_ BitVec 32) Int) ListLongMap!6183)

(assert (=> b!423405 (= lt!194161 (getCurrentListMapNoExtraKeys!1311 lt!194162 (array!25810 (store (arr!12354 _values!549) i!563 (ValueCellFull!5147 v!412)) (size!12706 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194160 () ListLongMap!6183)

(assert (=> b!423405 (= lt!194160 (getCurrentListMapNoExtraKeys!1311 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!423406 () Bool)

(declare-fun e!251723 () Bool)

(assert (=> b!423406 (= e!251723 tp_is_empty!10981)))

(declare-fun b!423407 () Bool)

(declare-fun res!247444 () Bool)

(assert (=> b!423407 (=> (not res!247444) (not e!251724))))

(assert (=> b!423407 (= res!247444 (and (= (size!12706 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12705 _keys!709) (size!12706 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!18093 () Bool)

(declare-fun mapRes!18093 () Bool)

(declare-fun tp!35015 () Bool)

(assert (=> mapNonEmpty!18093 (= mapRes!18093 (and tp!35015 e!251723))))

(declare-fun mapKey!18093 () (_ BitVec 32))

(declare-fun mapRest!18093 () (Array (_ BitVec 32) ValueCell!5147))

(declare-fun mapValue!18093 () ValueCell!5147)

(assert (=> mapNonEmpty!18093 (= (arr!12354 _values!549) (store mapRest!18093 mapKey!18093 mapValue!18093))))

(declare-fun b!423408 () Bool)

(declare-fun e!251722 () Bool)

(assert (=> b!423408 (= e!251722 tp_is_empty!10981)))

(declare-fun b!423409 () Bool)

(declare-fun res!247446 () Bool)

(assert (=> b!423409 (=> (not res!247446) (not e!251724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423409 (= res!247446 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!18093 () Bool)

(assert (=> mapIsEmpty!18093 mapRes!18093))

(declare-fun b!423410 () Bool)

(declare-fun res!247451 () Bool)

(assert (=> b!423410 (=> (not res!247451) (not e!251724))))

(assert (=> b!423410 (= res!247451 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7274))))

(declare-fun b!423411 () Bool)

(declare-fun res!247449 () Bool)

(assert (=> b!423411 (=> (not res!247449) (not e!251724))))

(assert (=> b!423411 (= res!247449 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12705 _keys!709))))))

(declare-fun b!423412 () Bool)

(assert (=> b!423412 (= e!251721 (and e!251722 mapRes!18093))))

(declare-fun condMapEmpty!18093 () Bool)

(declare-fun mapDefault!18093 () ValueCell!5147)

