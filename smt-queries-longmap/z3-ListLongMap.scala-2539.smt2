; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39054 () Bool)

(assert start!39054)

(declare-fun b_free!9321 () Bool)

(declare-fun b_next!9321 () Bool)

(assert (=> start!39054 (= b_free!9321 (not b_next!9321))))

(declare-fun tp!33492 () Bool)

(declare-fun b_and!16707 () Bool)

(assert (=> start!39054 (= tp!33492 b_and!16707)))

(declare-fun b!409827 () Bool)

(declare-fun res!237406 () Bool)

(declare-fun e!245763 () Bool)

(assert (=> b!409827 (=> (not res!237406) (not e!245763))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409827 (= res!237406 (validKeyInArray!0 k0!794))))

(declare-fun b!409828 () Bool)

(declare-fun res!237402 () Bool)

(assert (=> b!409828 (=> (not res!237402) (not e!245763))))

(declare-datatypes ((array!24819 0))(
  ( (array!24820 (arr!11859 (Array (_ BitVec 32) (_ BitVec 64))) (size!12211 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24819)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!409828 (= res!237402 (or (= (select (arr!11859 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11859 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!409829 () Bool)

(declare-fun e!245766 () Bool)

(assert (=> b!409829 (= e!245766 false)))

(declare-datatypes ((V!15069 0))(
  ( (V!15070 (val!5281 Int)) )
))
(declare-fun minValue!515 () V!15069)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4893 0))(
  ( (ValueCellFull!4893 (v!7528 V!15069)) (EmptyCell!4893) )
))
(declare-datatypes ((array!24821 0))(
  ( (array!24822 (arr!11860 (Array (_ BitVec 32) ValueCell!4893)) (size!12212 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24821)

(declare-fun zeroValue!515 () V!15069)

(declare-datatypes ((tuple2!6846 0))(
  ( (tuple2!6847 (_1!3434 (_ BitVec 64)) (_2!3434 V!15069)) )
))
(declare-datatypes ((List!6869 0))(
  ( (Nil!6866) (Cons!6865 (h!7721 tuple2!6846) (t!12043 List!6869)) )
))
(declare-datatypes ((ListLongMap!5759 0))(
  ( (ListLongMap!5760 (toList!2895 List!6869)) )
))
(declare-fun lt!188999 () ListLongMap!5759)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1103 (array!24819 array!24821 (_ BitVec 32) (_ BitVec 32) V!15069 V!15069 (_ BitVec 32) Int) ListLongMap!5759)

(assert (=> b!409829 (= lt!188999 (getCurrentListMapNoExtraKeys!1103 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!409830 () Bool)

(declare-fun res!237405 () Bool)

(assert (=> b!409830 (=> (not res!237405) (not e!245763))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409830 (= res!237405 (validMask!0 mask!1025))))

(declare-fun b!409831 () Bool)

(declare-fun e!245765 () Bool)

(declare-fun e!245762 () Bool)

(declare-fun mapRes!17331 () Bool)

(assert (=> b!409831 (= e!245765 (and e!245762 mapRes!17331))))

(declare-fun condMapEmpty!17331 () Bool)

(declare-fun mapDefault!17331 () ValueCell!4893)

(assert (=> b!409831 (= condMapEmpty!17331 (= (arr!11860 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4893)) mapDefault!17331)))))

(declare-fun mapIsEmpty!17331 () Bool)

(assert (=> mapIsEmpty!17331 mapRes!17331))

(declare-fun b!409833 () Bool)

(declare-fun res!237403 () Bool)

(assert (=> b!409833 (=> (not res!237403) (not e!245766))))

(assert (=> b!409833 (= res!237403 (bvsle from!863 i!563))))

(declare-fun b!409834 () Bool)

(declare-fun res!237411 () Bool)

(assert (=> b!409834 (=> (not res!237411) (not e!245763))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24819 (_ BitVec 32)) Bool)

(assert (=> b!409834 (= res!237411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!409835 () Bool)

(declare-fun res!237408 () Bool)

(assert (=> b!409835 (=> (not res!237408) (not e!245766))))

(declare-fun lt!188998 () array!24819)

(declare-datatypes ((List!6870 0))(
  ( (Nil!6867) (Cons!6866 (h!7722 (_ BitVec 64)) (t!12044 List!6870)) )
))
(declare-fun arrayNoDuplicates!0 (array!24819 (_ BitVec 32) List!6870) Bool)

(assert (=> b!409835 (= res!237408 (arrayNoDuplicates!0 lt!188998 #b00000000000000000000000000000000 Nil!6867))))

(declare-fun b!409836 () Bool)

(declare-fun tp_is_empty!10473 () Bool)

(assert (=> b!409836 (= e!245762 tp_is_empty!10473)))

(declare-fun b!409837 () Bool)

(declare-fun res!237400 () Bool)

(assert (=> b!409837 (=> (not res!237400) (not e!245763))))

(assert (=> b!409837 (= res!237400 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12211 _keys!709))))))

(declare-fun b!409838 () Bool)

(declare-fun e!245761 () Bool)

(assert (=> b!409838 (= e!245761 tp_is_empty!10473)))

(declare-fun b!409839 () Bool)

(declare-fun res!237407 () Bool)

(assert (=> b!409839 (=> (not res!237407) (not e!245763))))

(assert (=> b!409839 (= res!237407 (and (= (size!12212 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12211 _keys!709) (size!12212 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!409840 () Bool)

(assert (=> b!409840 (= e!245763 e!245766)))

(declare-fun res!237410 () Bool)

(assert (=> b!409840 (=> (not res!237410) (not e!245766))))

(assert (=> b!409840 (= res!237410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188998 mask!1025))))

(assert (=> b!409840 (= lt!188998 (array!24820 (store (arr!11859 _keys!709) i!563 k0!794) (size!12211 _keys!709)))))

(declare-fun b!409841 () Bool)

(declare-fun res!237409 () Bool)

(assert (=> b!409841 (=> (not res!237409) (not e!245763))))

(assert (=> b!409841 (= res!237409 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6867))))

(declare-fun mapNonEmpty!17331 () Bool)

(declare-fun tp!33491 () Bool)

(assert (=> mapNonEmpty!17331 (= mapRes!17331 (and tp!33491 e!245761))))

(declare-fun mapRest!17331 () (Array (_ BitVec 32) ValueCell!4893))

(declare-fun mapValue!17331 () ValueCell!4893)

(declare-fun mapKey!17331 () (_ BitVec 32))

(assert (=> mapNonEmpty!17331 (= (arr!11860 _values!549) (store mapRest!17331 mapKey!17331 mapValue!17331))))

(declare-fun res!237404 () Bool)

(assert (=> start!39054 (=> (not res!237404) (not e!245763))))

(assert (=> start!39054 (= res!237404 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12211 _keys!709))))))

(assert (=> start!39054 e!245763))

(assert (=> start!39054 tp_is_empty!10473))

(assert (=> start!39054 tp!33492))

(assert (=> start!39054 true))

(declare-fun array_inv!8656 (array!24821) Bool)

(assert (=> start!39054 (and (array_inv!8656 _values!549) e!245765)))

(declare-fun array_inv!8657 (array!24819) Bool)

(assert (=> start!39054 (array_inv!8657 _keys!709)))

(declare-fun b!409832 () Bool)

(declare-fun res!237401 () Bool)

(assert (=> b!409832 (=> (not res!237401) (not e!245763))))

(declare-fun arrayContainsKey!0 (array!24819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!409832 (= res!237401 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!39054 res!237404) b!409830))

(assert (= (and b!409830 res!237405) b!409839))

(assert (= (and b!409839 res!237407) b!409834))

(assert (= (and b!409834 res!237411) b!409841))

(assert (= (and b!409841 res!237409) b!409837))

(assert (= (and b!409837 res!237400) b!409827))

(assert (= (and b!409827 res!237406) b!409828))

(assert (= (and b!409828 res!237402) b!409832))

(assert (= (and b!409832 res!237401) b!409840))

(assert (= (and b!409840 res!237410) b!409835))

(assert (= (and b!409835 res!237408) b!409833))

(assert (= (and b!409833 res!237403) b!409829))

(assert (= (and b!409831 condMapEmpty!17331) mapIsEmpty!17331))

(assert (= (and b!409831 (not condMapEmpty!17331)) mapNonEmpty!17331))

(get-info :version)

(assert (= (and mapNonEmpty!17331 ((_ is ValueCellFull!4893) mapValue!17331)) b!409838))

(assert (= (and b!409831 ((_ is ValueCellFull!4893) mapDefault!17331)) b!409836))

(assert (= start!39054 b!409831))

(declare-fun m!400569 () Bool)

(assert (=> b!409828 m!400569))

(declare-fun m!400571 () Bool)

(assert (=> b!409827 m!400571))

(declare-fun m!400573 () Bool)

(assert (=> b!409840 m!400573))

(declare-fun m!400575 () Bool)

(assert (=> b!409840 m!400575))

(declare-fun m!400577 () Bool)

(assert (=> start!39054 m!400577))

(declare-fun m!400579 () Bool)

(assert (=> start!39054 m!400579))

(declare-fun m!400581 () Bool)

(assert (=> b!409834 m!400581))

(declare-fun m!400583 () Bool)

(assert (=> mapNonEmpty!17331 m!400583))

(declare-fun m!400585 () Bool)

(assert (=> b!409832 m!400585))

(declare-fun m!400587 () Bool)

(assert (=> b!409841 m!400587))

(declare-fun m!400589 () Bool)

(assert (=> b!409835 m!400589))

(declare-fun m!400591 () Bool)

(assert (=> b!409830 m!400591))

(declare-fun m!400593 () Bool)

(assert (=> b!409829 m!400593))

(check-sat (not b!409830) (not start!39054) (not b!409829) (not b!409840) tp_is_empty!10473 (not b!409832) (not b_next!9321) b_and!16707 (not b!409835) (not b!409841) (not mapNonEmpty!17331) (not b!409834) (not b!409827))
(check-sat b_and!16707 (not b_next!9321))
