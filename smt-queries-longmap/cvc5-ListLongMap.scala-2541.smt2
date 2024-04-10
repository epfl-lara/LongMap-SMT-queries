; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39064 () Bool)

(assert start!39064)

(declare-fun b_free!9331 () Bool)

(declare-fun b_next!9331 () Bool)

(assert (=> start!39064 (= b_free!9331 (not b_next!9331))))

(declare-fun tp!33522 () Bool)

(declare-fun b_and!16717 () Bool)

(assert (=> start!39064 (= tp!33522 b_and!16717)))

(declare-fun b!410052 () Bool)

(declare-fun res!237581 () Bool)

(declare-fun e!245853 () Bool)

(assert (=> b!410052 (=> (not res!237581) (not e!245853))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!410052 (= res!237581 (validKeyInArray!0 k!794))))

(declare-fun b!410053 () Bool)

(declare-fun res!237582 () Bool)

(assert (=> b!410053 (=> (not res!237582) (not e!245853))))

(declare-datatypes ((array!24837 0))(
  ( (array!24838 (arr!11868 (Array (_ BitVec 32) (_ BitVec 64))) (size!12220 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24837)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24837 (_ BitVec 32)) Bool)

(assert (=> b!410053 (= res!237582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!410054 () Bool)

(declare-fun e!245854 () Bool)

(declare-fun tp_is_empty!10483 () Bool)

(assert (=> b!410054 (= e!245854 tp_is_empty!10483)))

(declare-fun b!410055 () Bool)

(declare-fun res!237584 () Bool)

(declare-fun e!245852 () Bool)

(assert (=> b!410055 (=> (not res!237584) (not e!245852))))

(declare-fun lt!189028 () array!24837)

(declare-datatypes ((List!6877 0))(
  ( (Nil!6874) (Cons!6873 (h!7729 (_ BitVec 64)) (t!12051 List!6877)) )
))
(declare-fun arrayNoDuplicates!0 (array!24837 (_ BitVec 32) List!6877) Bool)

(assert (=> b!410055 (= res!237584 (arrayNoDuplicates!0 lt!189028 #b00000000000000000000000000000000 Nil!6874))))

(declare-fun b!410056 () Bool)

(declare-fun e!245856 () Bool)

(assert (=> b!410056 (= e!245856 tp_is_empty!10483)))

(declare-fun b!410057 () Bool)

(declare-fun res!237589 () Bool)

(assert (=> b!410057 (=> (not res!237589) (not e!245853))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!410057 (= res!237589 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12220 _keys!709))))))

(declare-fun mapIsEmpty!17346 () Bool)

(declare-fun mapRes!17346 () Bool)

(assert (=> mapIsEmpty!17346 mapRes!17346))

(declare-fun b!410058 () Bool)

(assert (=> b!410058 (= e!245852 false)))

(declare-datatypes ((V!15083 0))(
  ( (V!15084 (val!5286 Int)) )
))
(declare-fun minValue!515 () V!15083)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4898 0))(
  ( (ValueCellFull!4898 (v!7533 V!15083)) (EmptyCell!4898) )
))
(declare-datatypes ((array!24839 0))(
  ( (array!24840 (arr!11869 (Array (_ BitVec 32) ValueCell!4898)) (size!12221 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24839)

(declare-fun zeroValue!515 () V!15083)

(declare-datatypes ((tuple2!6854 0))(
  ( (tuple2!6855 (_1!3438 (_ BitVec 64)) (_2!3438 V!15083)) )
))
(declare-datatypes ((List!6878 0))(
  ( (Nil!6875) (Cons!6874 (h!7730 tuple2!6854) (t!12052 List!6878)) )
))
(declare-datatypes ((ListLongMap!5767 0))(
  ( (ListLongMap!5768 (toList!2899 List!6878)) )
))
(declare-fun lt!189029 () ListLongMap!5767)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1107 (array!24837 array!24839 (_ BitVec 32) (_ BitVec 32) V!15083 V!15083 (_ BitVec 32) Int) ListLongMap!5767)

(assert (=> b!410058 (= lt!189029 (getCurrentListMapNoExtraKeys!1107 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!410059 () Bool)

(declare-fun res!237583 () Bool)

(assert (=> b!410059 (=> (not res!237583) (not e!245853))))

(assert (=> b!410059 (= res!237583 (or (= (select (arr!11868 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11868 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!410060 () Bool)

(declare-fun res!237588 () Bool)

(assert (=> b!410060 (=> (not res!237588) (not e!245853))))

(assert (=> b!410060 (= res!237588 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6874))))

(declare-fun mapNonEmpty!17346 () Bool)

(declare-fun tp!33521 () Bool)

(assert (=> mapNonEmpty!17346 (= mapRes!17346 (and tp!33521 e!245854))))

(declare-fun mapKey!17346 () (_ BitVec 32))

(declare-fun mapValue!17346 () ValueCell!4898)

(declare-fun mapRest!17346 () (Array (_ BitVec 32) ValueCell!4898))

(assert (=> mapNonEmpty!17346 (= (arr!11869 _values!549) (store mapRest!17346 mapKey!17346 mapValue!17346))))

(declare-fun b!410061 () Bool)

(declare-fun res!237587 () Bool)

(assert (=> b!410061 (=> (not res!237587) (not e!245853))))

(declare-fun arrayContainsKey!0 (array!24837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410061 (= res!237587 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!410062 () Bool)

(declare-fun res!237590 () Bool)

(assert (=> b!410062 (=> (not res!237590) (not e!245852))))

(assert (=> b!410062 (= res!237590 (bvsle from!863 i!563))))

(declare-fun b!410063 () Bool)

(declare-fun res!237586 () Bool)

(assert (=> b!410063 (=> (not res!237586) (not e!245853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410063 (= res!237586 (validMask!0 mask!1025))))

(declare-fun b!410064 () Bool)

(assert (=> b!410064 (= e!245853 e!245852)))

(declare-fun res!237585 () Bool)

(assert (=> b!410064 (=> (not res!237585) (not e!245852))))

(assert (=> b!410064 (= res!237585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189028 mask!1025))))

(assert (=> b!410064 (= lt!189028 (array!24838 (store (arr!11868 _keys!709) i!563 k!794) (size!12220 _keys!709)))))

(declare-fun b!410065 () Bool)

(declare-fun e!245851 () Bool)

(assert (=> b!410065 (= e!245851 (and e!245856 mapRes!17346))))

(declare-fun condMapEmpty!17346 () Bool)

(declare-fun mapDefault!17346 () ValueCell!4898)

