; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39646 () Bool)

(assert start!39646)

(declare-fun b_free!9913 () Bool)

(declare-fun b_next!9913 () Bool)

(assert (=> start!39646 (= b_free!9913 (not b_next!9913))))

(declare-fun tp!35268 () Bool)

(declare-fun b_and!17569 () Bool)

(assert (=> start!39646 (= tp!35268 b_and!17569)))

(declare-fun b!425327 () Bool)

(declare-fun res!249000 () Bool)

(declare-fun e!252514 () Bool)

(assert (=> b!425327 (=> (not res!249000) (not e!252514))))

(declare-datatypes ((array!25969 0))(
  ( (array!25970 (arr!12434 (Array (_ BitVec 32) (_ BitVec 64))) (size!12786 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25969)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25969 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!425327 (= res!249000 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!425328 () Bool)

(declare-fun res!248996 () Bool)

(assert (=> b!425328 (=> (not res!248996) (not e!252514))))

(declare-datatypes ((List!7334 0))(
  ( (Nil!7331) (Cons!7330 (h!8186 (_ BitVec 64)) (t!12778 List!7334)) )
))
(declare-fun arrayNoDuplicates!0 (array!25969 (_ BitVec 32) List!7334) Bool)

(assert (=> b!425328 (= res!248996 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7331))))

(declare-fun b!425329 () Bool)

(declare-fun e!252513 () Bool)

(declare-fun e!252515 () Bool)

(assert (=> b!425329 (= e!252513 e!252515)))

(declare-fun res!248999 () Bool)

(assert (=> b!425329 (=> (not res!248999) (not e!252515))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!425329 (= res!248999 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!15859 0))(
  ( (V!15860 (val!5577 Int)) )
))
(declare-fun minValue!515 () V!15859)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!194616 () array!25969)

(declare-datatypes ((ValueCell!5189 0))(
  ( (ValueCellFull!5189 (v!7824 V!15859)) (EmptyCell!5189) )
))
(declare-datatypes ((array!25971 0))(
  ( (array!25972 (arr!12435 (Array (_ BitVec 32) ValueCell!5189)) (size!12787 (_ BitVec 32))) )
))
(declare-fun lt!194615 () array!25971)

(declare-fun zeroValue!515 () V!15859)

(declare-datatypes ((tuple2!7322 0))(
  ( (tuple2!7323 (_1!3672 (_ BitVec 64)) (_2!3672 V!15859)) )
))
(declare-datatypes ((List!7335 0))(
  ( (Nil!7332) (Cons!7331 (h!8187 tuple2!7322) (t!12779 List!7335)) )
))
(declare-datatypes ((ListLongMap!6235 0))(
  ( (ListLongMap!6236 (toList!3133 List!7335)) )
))
(declare-fun lt!194618 () ListLongMap!6235)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1337 (array!25969 array!25971 (_ BitVec 32) (_ BitVec 32) V!15859 V!15859 (_ BitVec 32) Int) ListLongMap!6235)

(assert (=> b!425329 (= lt!194618 (getCurrentListMapNoExtraKeys!1337 lt!194616 lt!194615 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25971)

(declare-fun v!412 () V!15859)

(assert (=> b!425329 (= lt!194615 (array!25972 (store (arr!12435 _values!549) i!563 (ValueCellFull!5189 v!412)) (size!12787 _values!549)))))

(declare-fun lt!194614 () ListLongMap!6235)

(assert (=> b!425329 (= lt!194614 (getCurrentListMapNoExtraKeys!1337 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!18219 () Bool)

(declare-fun mapRes!18219 () Bool)

(assert (=> mapIsEmpty!18219 mapRes!18219))

(declare-fun b!425331 () Bool)

(declare-fun res!249001 () Bool)

(assert (=> b!425331 (=> (not res!249001) (not e!252514))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!425331 (= res!249001 (validMask!0 mask!1025))))

(declare-fun b!425332 () Bool)

(declare-fun e!252519 () Bool)

(declare-fun tp_is_empty!11065 () Bool)

(assert (=> b!425332 (= e!252519 tp_is_empty!11065)))

(declare-fun b!425330 () Bool)

(declare-fun res!249002 () Bool)

(assert (=> b!425330 (=> (not res!249002) (not e!252513))))

(assert (=> b!425330 (= res!249002 (arrayNoDuplicates!0 lt!194616 #b00000000000000000000000000000000 Nil!7331))))

(declare-fun res!248994 () Bool)

(assert (=> start!39646 (=> (not res!248994) (not e!252514))))

(assert (=> start!39646 (= res!248994 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12786 _keys!709))))))

(assert (=> start!39646 e!252514))

(assert (=> start!39646 tp_is_empty!11065))

(assert (=> start!39646 tp!35268))

(assert (=> start!39646 true))

(declare-fun e!252517 () Bool)

(declare-fun array_inv!9060 (array!25971) Bool)

(assert (=> start!39646 (and (array_inv!9060 _values!549) e!252517)))

(declare-fun array_inv!9061 (array!25969) Bool)

(assert (=> start!39646 (array_inv!9061 _keys!709)))

(declare-fun b!425333 () Bool)

(declare-fun e!252516 () Bool)

(assert (=> b!425333 (= e!252516 tp_is_empty!11065)))

(declare-fun b!425334 () Bool)

(declare-fun res!249004 () Bool)

(assert (=> b!425334 (=> (not res!249004) (not e!252514))))

(assert (=> b!425334 (= res!249004 (and (= (size!12787 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12786 _keys!709) (size!12787 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!425335 () Bool)

(assert (=> b!425335 (= e!252515 (not true))))

(declare-fun +!1291 (ListLongMap!6235 tuple2!7322) ListLongMap!6235)

(assert (=> b!425335 (= (getCurrentListMapNoExtraKeys!1337 lt!194616 lt!194615 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1291 (getCurrentListMapNoExtraKeys!1337 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7323 k!794 v!412)))))

(declare-datatypes ((Unit!12484 0))(
  ( (Unit!12485) )
))
(declare-fun lt!194617 () Unit!12484)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!486 (array!25969 array!25971 (_ BitVec 32) (_ BitVec 32) V!15859 V!15859 (_ BitVec 32) (_ BitVec 64) V!15859 (_ BitVec 32) Int) Unit!12484)

(assert (=> b!425335 (= lt!194617 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!486 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!425336 () Bool)

(declare-fun res!248997 () Bool)

(assert (=> b!425336 (=> (not res!248997) (not e!252514))))

(assert (=> b!425336 (= res!248997 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12786 _keys!709))))))

(declare-fun b!425337 () Bool)

(declare-fun res!249003 () Bool)

(assert (=> b!425337 (=> (not res!249003) (not e!252513))))

(assert (=> b!425337 (= res!249003 (bvsle from!863 i!563))))

(declare-fun b!425338 () Bool)

(declare-fun res!249006 () Bool)

(assert (=> b!425338 (=> (not res!249006) (not e!252514))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25969 (_ BitVec 32)) Bool)

(assert (=> b!425338 (= res!249006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!425339 () Bool)

(declare-fun res!248995 () Bool)

(assert (=> b!425339 (=> (not res!248995) (not e!252514))))

(assert (=> b!425339 (= res!248995 (or (= (select (arr!12434 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12434 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!425340 () Bool)

(assert (=> b!425340 (= e!252514 e!252513)))

(declare-fun res!249005 () Bool)

(assert (=> b!425340 (=> (not res!249005) (not e!252513))))

(assert (=> b!425340 (= res!249005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194616 mask!1025))))

(assert (=> b!425340 (= lt!194616 (array!25970 (store (arr!12434 _keys!709) i!563 k!794) (size!12786 _keys!709)))))

(declare-fun b!425341 () Bool)

(assert (=> b!425341 (= e!252517 (and e!252516 mapRes!18219))))

(declare-fun condMapEmpty!18219 () Bool)

(declare-fun mapDefault!18219 () ValueCell!5189)

