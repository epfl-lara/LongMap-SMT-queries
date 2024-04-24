; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39056 () Bool)

(assert start!39056)

(declare-fun b_free!9337 () Bool)

(declare-fun b_next!9337 () Bool)

(assert (=> start!39056 (= b_free!9337 (not b_next!9337))))

(declare-fun tp!33540 () Bool)

(declare-fun b_and!16737 () Bool)

(assert (=> start!39056 (= tp!33540 b_and!16737)))

(declare-fun b!410138 () Bool)

(declare-fun e!245874 () Bool)

(declare-fun e!245875 () Bool)

(assert (=> b!410138 (= e!245874 e!245875)))

(declare-fun res!237692 () Bool)

(assert (=> b!410138 (=> (not res!237692) (not e!245875))))

(declare-datatypes ((array!24844 0))(
  ( (array!24845 (arr!11871 (Array (_ BitVec 32) (_ BitVec 64))) (size!12223 (_ BitVec 32))) )
))
(declare-fun lt!189065 () array!24844)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24844 (_ BitVec 32)) Bool)

(assert (=> b!410138 (= res!237692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189065 mask!1025))))

(declare-fun _keys!709 () array!24844)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!410138 (= lt!189065 (array!24845 (store (arr!11871 _keys!709) i!563 k0!794) (size!12223 _keys!709)))))

(declare-fun mapIsEmpty!17355 () Bool)

(declare-fun mapRes!17355 () Bool)

(assert (=> mapIsEmpty!17355 mapRes!17355))

(declare-fun b!410139 () Bool)

(declare-fun e!245877 () Bool)

(declare-fun e!245873 () Bool)

(assert (=> b!410139 (= e!245877 (and e!245873 mapRes!17355))))

(declare-fun condMapEmpty!17355 () Bool)

(declare-datatypes ((V!15091 0))(
  ( (V!15092 (val!5289 Int)) )
))
(declare-datatypes ((ValueCell!4901 0))(
  ( (ValueCellFull!4901 (v!7537 V!15091)) (EmptyCell!4901) )
))
(declare-datatypes ((array!24846 0))(
  ( (array!24847 (arr!11872 (Array (_ BitVec 32) ValueCell!4901)) (size!12224 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24846)

(declare-fun mapDefault!17355 () ValueCell!4901)

(assert (=> b!410139 (= condMapEmpty!17355 (= (arr!11872 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4901)) mapDefault!17355)))))

(declare-fun b!410140 () Bool)

(assert (=> b!410140 (= e!245875 false)))

(declare-fun minValue!515 () V!15091)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15091)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!6734 0))(
  ( (tuple2!6735 (_1!3378 (_ BitVec 64)) (_2!3378 V!15091)) )
))
(declare-datatypes ((List!6751 0))(
  ( (Nil!6748) (Cons!6747 (h!7603 tuple2!6734) (t!11917 List!6751)) )
))
(declare-datatypes ((ListLongMap!5649 0))(
  ( (ListLongMap!5650 (toList!2840 List!6751)) )
))
(declare-fun lt!189066 () ListLongMap!5649)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1092 (array!24844 array!24846 (_ BitVec 32) (_ BitVec 32) V!15091 V!15091 (_ BitVec 32) Int) ListLongMap!5649)

(assert (=> b!410140 (= lt!189066 (getCurrentListMapNoExtraKeys!1092 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!410141 () Bool)

(declare-fun res!237695 () Bool)

(assert (=> b!410141 (=> (not res!237695) (not e!245874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410141 (= res!237695 (validMask!0 mask!1025))))

(declare-fun b!410142 () Bool)

(declare-fun res!237691 () Bool)

(assert (=> b!410142 (=> (not res!237691) (not e!245874))))

(declare-fun arrayContainsKey!0 (array!24844 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410142 (= res!237691 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!410143 () Bool)

(declare-fun res!237693 () Bool)

(assert (=> b!410143 (=> (not res!237693) (not e!245875))))

(assert (=> b!410143 (= res!237693 (bvsle from!863 i!563))))

(declare-fun b!410144 () Bool)

(declare-fun res!237687 () Bool)

(assert (=> b!410144 (=> (not res!237687) (not e!245874))))

(declare-datatypes ((List!6752 0))(
  ( (Nil!6749) (Cons!6748 (h!7604 (_ BitVec 64)) (t!11918 List!6752)) )
))
(declare-fun arrayNoDuplicates!0 (array!24844 (_ BitVec 32) List!6752) Bool)

(assert (=> b!410144 (= res!237687 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6749))))

(declare-fun b!410145 () Bool)

(declare-fun res!237688 () Bool)

(assert (=> b!410145 (=> (not res!237688) (not e!245874))))

(assert (=> b!410145 (= res!237688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!410147 () Bool)

(declare-fun tp_is_empty!10489 () Bool)

(assert (=> b!410147 (= e!245873 tp_is_empty!10489)))

(declare-fun b!410148 () Bool)

(declare-fun res!237696 () Bool)

(assert (=> b!410148 (=> (not res!237696) (not e!245875))))

(assert (=> b!410148 (= res!237696 (arrayNoDuplicates!0 lt!189065 #b00000000000000000000000000000000 Nil!6749))))

(declare-fun mapNonEmpty!17355 () Bool)

(declare-fun tp!33539 () Bool)

(declare-fun e!245876 () Bool)

(assert (=> mapNonEmpty!17355 (= mapRes!17355 (and tp!33539 e!245876))))

(declare-fun mapValue!17355 () ValueCell!4901)

(declare-fun mapKey!17355 () (_ BitVec 32))

(declare-fun mapRest!17355 () (Array (_ BitVec 32) ValueCell!4901))

(assert (=> mapNonEmpty!17355 (= (arr!11872 _values!549) (store mapRest!17355 mapKey!17355 mapValue!17355))))

(declare-fun b!410149 () Bool)

(declare-fun res!237694 () Bool)

(assert (=> b!410149 (=> (not res!237694) (not e!245874))))

(assert (=> b!410149 (= res!237694 (or (= (select (arr!11871 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11871 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!410150 () Bool)

(declare-fun res!237686 () Bool)

(assert (=> b!410150 (=> (not res!237686) (not e!245874))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!410150 (= res!237686 (validKeyInArray!0 k0!794))))

(declare-fun b!410151 () Bool)

(declare-fun res!237685 () Bool)

(assert (=> b!410151 (=> (not res!237685) (not e!245874))))

(assert (=> b!410151 (= res!237685 (and (= (size!12224 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12223 _keys!709) (size!12224 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!410152 () Bool)

(declare-fun res!237690 () Bool)

(assert (=> b!410152 (=> (not res!237690) (not e!245874))))

(assert (=> b!410152 (= res!237690 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12223 _keys!709))))))

(declare-fun b!410146 () Bool)

(assert (=> b!410146 (= e!245876 tp_is_empty!10489)))

(declare-fun res!237689 () Bool)

(assert (=> start!39056 (=> (not res!237689) (not e!245874))))

(assert (=> start!39056 (= res!237689 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12223 _keys!709))))))

(assert (=> start!39056 e!245874))

(assert (=> start!39056 tp_is_empty!10489))

(assert (=> start!39056 tp!33540))

(assert (=> start!39056 true))

(declare-fun array_inv!8746 (array!24846) Bool)

(assert (=> start!39056 (and (array_inv!8746 _values!549) e!245877)))

(declare-fun array_inv!8747 (array!24844) Bool)

(assert (=> start!39056 (array_inv!8747 _keys!709)))

(assert (= (and start!39056 res!237689) b!410141))

(assert (= (and b!410141 res!237695) b!410151))

(assert (= (and b!410151 res!237685) b!410145))

(assert (= (and b!410145 res!237688) b!410144))

(assert (= (and b!410144 res!237687) b!410152))

(assert (= (and b!410152 res!237690) b!410150))

(assert (= (and b!410150 res!237686) b!410149))

(assert (= (and b!410149 res!237694) b!410142))

(assert (= (and b!410142 res!237691) b!410138))

(assert (= (and b!410138 res!237692) b!410148))

(assert (= (and b!410148 res!237696) b!410143))

(assert (= (and b!410143 res!237693) b!410140))

(assert (= (and b!410139 condMapEmpty!17355) mapIsEmpty!17355))

(assert (= (and b!410139 (not condMapEmpty!17355)) mapNonEmpty!17355))

(get-info :version)

(assert (= (and mapNonEmpty!17355 ((_ is ValueCellFull!4901) mapValue!17355)) b!410146))

(assert (= (and b!410139 ((_ is ValueCellFull!4901) mapDefault!17355)) b!410147))

(assert (= start!39056 b!410139))

(declare-fun m!401007 () Bool)

(assert (=> b!410140 m!401007))

(declare-fun m!401009 () Bool)

(assert (=> b!410145 m!401009))

(declare-fun m!401011 () Bool)

(assert (=> b!410142 m!401011))

(declare-fun m!401013 () Bool)

(assert (=> b!410149 m!401013))

(declare-fun m!401015 () Bool)

(assert (=> mapNonEmpty!17355 m!401015))

(declare-fun m!401017 () Bool)

(assert (=> start!39056 m!401017))

(declare-fun m!401019 () Bool)

(assert (=> start!39056 m!401019))

(declare-fun m!401021 () Bool)

(assert (=> b!410144 m!401021))

(declare-fun m!401023 () Bool)

(assert (=> b!410150 m!401023))

(declare-fun m!401025 () Bool)

(assert (=> b!410138 m!401025))

(declare-fun m!401027 () Bool)

(assert (=> b!410138 m!401027))

(declare-fun m!401029 () Bool)

(assert (=> b!410148 m!401029))

(declare-fun m!401031 () Bool)

(assert (=> b!410141 m!401031))

(check-sat (not b!410148) (not b!410150) tp_is_empty!10489 (not b!410140) (not mapNonEmpty!17355) (not b!410138) (not b!410142) (not b!410141) (not b_next!9337) (not b!410144) b_and!16737 (not b!410145) (not start!39056))
(check-sat b_and!16737 (not b_next!9337))
