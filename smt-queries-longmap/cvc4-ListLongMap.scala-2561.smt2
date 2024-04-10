; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39188 () Bool)

(assert start!39188)

(declare-fun b_free!9455 () Bool)

(declare-fun b_next!9455 () Bool)

(assert (=> start!39188 (= b_free!9455 (not b_next!9455))))

(declare-fun tp!33893 () Bool)

(declare-fun b_and!16841 () Bool)

(assert (=> start!39188 (= tp!33893 b_and!16841)))

(declare-fun b!412842 () Bool)

(declare-fun res!239823 () Bool)

(declare-fun e!246970 () Bool)

(assert (=> b!412842 (=> (not res!239823) (not e!246970))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!412842 (= res!239823 (validKeyInArray!0 k!794))))

(declare-fun b!412843 () Bool)

(declare-fun e!246971 () Bool)

(assert (=> b!412843 (= e!246970 e!246971)))

(declare-fun res!239813 () Bool)

(assert (=> b!412843 (=> (not res!239813) (not e!246971))))

(declare-datatypes ((array!25073 0))(
  ( (array!25074 (arr!11986 (Array (_ BitVec 32) (_ BitVec 64))) (size!12338 (_ BitVec 32))) )
))
(declare-fun lt!189563 () array!25073)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25073 (_ BitVec 32)) Bool)

(assert (=> b!412843 (= res!239813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189563 mask!1025))))

(declare-fun _keys!709 () array!25073)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!412843 (= lt!189563 (array!25074 (store (arr!11986 _keys!709) i!563 k!794) (size!12338 _keys!709)))))

(declare-fun res!239822 () Bool)

(assert (=> start!39188 (=> (not res!239822) (not e!246970))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39188 (= res!239822 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12338 _keys!709))))))

(assert (=> start!39188 e!246970))

(declare-fun tp_is_empty!10607 () Bool)

(assert (=> start!39188 tp_is_empty!10607))

(assert (=> start!39188 tp!33893))

(assert (=> start!39188 true))

(declare-datatypes ((V!15247 0))(
  ( (V!15248 (val!5348 Int)) )
))
(declare-datatypes ((ValueCell!4960 0))(
  ( (ValueCellFull!4960 (v!7595 V!15247)) (EmptyCell!4960) )
))
(declare-datatypes ((array!25075 0))(
  ( (array!25076 (arr!11987 (Array (_ BitVec 32) ValueCell!4960)) (size!12339 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25075)

(declare-fun e!246968 () Bool)

(declare-fun array_inv!8740 (array!25075) Bool)

(assert (=> start!39188 (and (array_inv!8740 _values!549) e!246968)))

(declare-fun array_inv!8741 (array!25073) Bool)

(assert (=> start!39188 (array_inv!8741 _keys!709)))

(declare-fun b!412844 () Bool)

(declare-fun res!239814 () Bool)

(assert (=> b!412844 (=> (not res!239814) (not e!246970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!412844 (= res!239814 (validMask!0 mask!1025))))

(declare-fun b!412845 () Bool)

(declare-fun res!239812 () Bool)

(assert (=> b!412845 (=> (not res!239812) (not e!246970))))

(assert (=> b!412845 (= res!239812 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12338 _keys!709))))))

(declare-fun b!412846 () Bool)

(declare-fun e!246969 () Bool)

(assert (=> b!412846 (= e!246969 tp_is_empty!10607)))

(declare-fun b!412847 () Bool)

(declare-fun res!239820 () Bool)

(assert (=> b!412847 (=> (not res!239820) (not e!246970))))

(assert (=> b!412847 (= res!239820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!412848 () Bool)

(declare-fun res!239818 () Bool)

(assert (=> b!412848 (=> (not res!239818) (not e!246970))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!412848 (= res!239818 (and (= (size!12339 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12338 _keys!709) (size!12339 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!412849 () Bool)

(assert (=> b!412849 (= e!246971 false)))

(declare-fun minValue!515 () V!15247)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15247)

(declare-datatypes ((tuple2!6942 0))(
  ( (tuple2!6943 (_1!3482 (_ BitVec 64)) (_2!3482 V!15247)) )
))
(declare-datatypes ((List!6969 0))(
  ( (Nil!6966) (Cons!6965 (h!7821 tuple2!6942) (t!12143 List!6969)) )
))
(declare-datatypes ((ListLongMap!5855 0))(
  ( (ListLongMap!5856 (toList!2943 List!6969)) )
))
(declare-fun lt!189562 () ListLongMap!5855)

(declare-fun v!412 () V!15247)

(declare-fun getCurrentListMapNoExtraKeys!1151 (array!25073 array!25075 (_ BitVec 32) (_ BitVec 32) V!15247 V!15247 (_ BitVec 32) Int) ListLongMap!5855)

(assert (=> b!412849 (= lt!189562 (getCurrentListMapNoExtraKeys!1151 lt!189563 (array!25076 (store (arr!11987 _values!549) i!563 (ValueCellFull!4960 v!412)) (size!12339 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189561 () ListLongMap!5855)

(assert (=> b!412849 (= lt!189561 (getCurrentListMapNoExtraKeys!1151 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!17532 () Bool)

(declare-fun mapRes!17532 () Bool)

(declare-fun tp!33894 () Bool)

(declare-fun e!246967 () Bool)

(assert (=> mapNonEmpty!17532 (= mapRes!17532 (and tp!33894 e!246967))))

(declare-fun mapValue!17532 () ValueCell!4960)

(declare-fun mapKey!17532 () (_ BitVec 32))

(declare-fun mapRest!17532 () (Array (_ BitVec 32) ValueCell!4960))

(assert (=> mapNonEmpty!17532 (= (arr!11987 _values!549) (store mapRest!17532 mapKey!17532 mapValue!17532))))

(declare-fun b!412850 () Bool)

(declare-fun res!239821 () Bool)

(assert (=> b!412850 (=> (not res!239821) (not e!246970))))

(declare-fun arrayContainsKey!0 (array!25073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!412850 (= res!239821 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!412851 () Bool)

(assert (=> b!412851 (= e!246967 tp_is_empty!10607)))

(declare-fun b!412852 () Bool)

(assert (=> b!412852 (= e!246968 (and e!246969 mapRes!17532))))

(declare-fun condMapEmpty!17532 () Bool)

(declare-fun mapDefault!17532 () ValueCell!4960)

