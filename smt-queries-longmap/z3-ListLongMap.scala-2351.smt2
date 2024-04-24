; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37554 () Bool)

(assert start!37554)

(declare-fun b_free!8695 () Bool)

(declare-fun b_next!8695 () Bool)

(assert (=> start!37554 (= b_free!8695 (not b_next!8695))))

(declare-fun tp!30800 () Bool)

(declare-fun b_and!15951 () Bool)

(assert (=> start!37554 (= tp!30800 b_and!15951)))

(declare-fun b!383823 () Bool)

(declare-fun res!218647 () Bool)

(declare-fun e!233088 () Bool)

(assert (=> b!383823 (=> (not res!218647) (not e!233088))))

(declare-datatypes ((V!13563 0))(
  ( (V!13564 (val!4716 Int)) )
))
(declare-datatypes ((ValueCell!4328 0))(
  ( (ValueCellFull!4328 (v!6914 V!13563)) (EmptyCell!4328) )
))
(declare-datatypes ((array!22580 0))(
  ( (array!22581 (arr!10758 (Array (_ BitVec 32) ValueCell!4328)) (size!11110 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22580)

(declare-datatypes ((array!22582 0))(
  ( (array!22583 (arr!10759 (Array (_ BitVec 32) (_ BitVec 64))) (size!11111 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22582)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!383823 (= res!218647 (and (= (size!11110 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11111 _keys!658) (size!11110 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!383824 () Bool)

(declare-fun res!218657 () Bool)

(assert (=> b!383824 (=> (not res!218657) (not e!233088))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!383824 (= res!218657 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11111 _keys!658))))))

(declare-fun b!383825 () Bool)

(declare-fun res!218651 () Bool)

(assert (=> b!383825 (=> (not res!218651) (not e!233088))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22582 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383825 (= res!218651 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!383826 () Bool)

(declare-fun e!233085 () Bool)

(declare-fun e!233086 () Bool)

(assert (=> b!383826 (= e!233085 (not e!233086))))

(declare-fun res!218648 () Bool)

(assert (=> b!383826 (=> res!218648 e!233086)))

(declare-fun lt!180474 () Bool)

(assert (=> b!383826 (= res!218648 (or (and (not lt!180474) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180474) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180474)))))

(assert (=> b!383826 (= lt!180474 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((tuple2!6222 0))(
  ( (tuple2!6223 (_1!3122 (_ BitVec 64)) (_2!3122 V!13563)) )
))
(declare-datatypes ((List!6060 0))(
  ( (Nil!6057) (Cons!6056 (h!6912 tuple2!6222) (t!11202 List!6060)) )
))
(declare-datatypes ((ListLongMap!5137 0))(
  ( (ListLongMap!5138 (toList!2584 List!6060)) )
))
(declare-fun lt!180482 () ListLongMap!5137)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13563)

(declare-fun minValue!472 () V!13563)

(declare-fun getCurrentListMap!2016 (array!22582 array!22580 (_ BitVec 32) (_ BitVec 32) V!13563 V!13563 (_ BitVec 32) Int) ListLongMap!5137)

(assert (=> b!383826 (= lt!180482 (getCurrentListMap!2016 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180480 () array!22582)

(declare-fun lt!180483 () ListLongMap!5137)

(declare-fun lt!180477 () array!22580)

(assert (=> b!383826 (= lt!180483 (getCurrentListMap!2016 lt!180480 lt!180477 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180479 () ListLongMap!5137)

(declare-fun lt!180481 () ListLongMap!5137)

(assert (=> b!383826 (and (= lt!180479 lt!180481) (= lt!180481 lt!180479))))

(declare-fun lt!180478 () ListLongMap!5137)

(declare-fun lt!180484 () tuple2!6222)

(declare-fun +!976 (ListLongMap!5137 tuple2!6222) ListLongMap!5137)

(assert (=> b!383826 (= lt!180481 (+!976 lt!180478 lt!180484))))

(declare-fun v!373 () V!13563)

(assert (=> b!383826 (= lt!180484 (tuple2!6223 k0!778 v!373))))

(declare-datatypes ((Unit!11827 0))(
  ( (Unit!11828) )
))
(declare-fun lt!180476 () Unit!11827)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!203 (array!22582 array!22580 (_ BitVec 32) (_ BitVec 32) V!13563 V!13563 (_ BitVec 32) (_ BitVec 64) V!13563 (_ BitVec 32) Int) Unit!11827)

(assert (=> b!383826 (= lt!180476 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!203 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!863 (array!22582 array!22580 (_ BitVec 32) (_ BitVec 32) V!13563 V!13563 (_ BitVec 32) Int) ListLongMap!5137)

(assert (=> b!383826 (= lt!180479 (getCurrentListMapNoExtraKeys!863 lt!180480 lt!180477 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383826 (= lt!180477 (array!22581 (store (arr!10758 _values!506) i!548 (ValueCellFull!4328 v!373)) (size!11110 _values!506)))))

(assert (=> b!383826 (= lt!180478 (getCurrentListMapNoExtraKeys!863 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!218649 () Bool)

(assert (=> start!37554 (=> (not res!218649) (not e!233088))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37554 (= res!218649 (validMask!0 mask!970))))

(assert (=> start!37554 e!233088))

(declare-fun e!233087 () Bool)

(declare-fun array_inv!7960 (array!22580) Bool)

(assert (=> start!37554 (and (array_inv!7960 _values!506) e!233087)))

(assert (=> start!37554 tp!30800))

(assert (=> start!37554 true))

(declare-fun tp_is_empty!9343 () Bool)

(assert (=> start!37554 tp_is_empty!9343))

(declare-fun array_inv!7961 (array!22582) Bool)

(assert (=> start!37554 (array_inv!7961 _keys!658)))

(declare-fun b!383827 () Bool)

(assert (=> b!383827 (= e!233088 e!233085)))

(declare-fun res!218654 () Bool)

(assert (=> b!383827 (=> (not res!218654) (not e!233085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22582 (_ BitVec 32)) Bool)

(assert (=> b!383827 (= res!218654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180480 mask!970))))

(assert (=> b!383827 (= lt!180480 (array!22583 (store (arr!10759 _keys!658) i!548 k0!778) (size!11111 _keys!658)))))

(declare-fun b!383828 () Bool)

(declare-fun e!233090 () Bool)

(assert (=> b!383828 (= e!233090 tp_is_empty!9343)))

(declare-fun b!383829 () Bool)

(declare-fun res!218650 () Bool)

(assert (=> b!383829 (=> (not res!218650) (not e!233085))))

(declare-datatypes ((List!6061 0))(
  ( (Nil!6058) (Cons!6057 (h!6913 (_ BitVec 64)) (t!11203 List!6061)) )
))
(declare-fun arrayNoDuplicates!0 (array!22582 (_ BitVec 32) List!6061) Bool)

(assert (=> b!383829 (= res!218650 (arrayNoDuplicates!0 lt!180480 #b00000000000000000000000000000000 Nil!6058))))

(declare-fun b!383830 () Bool)

(declare-fun res!218655 () Bool)

(assert (=> b!383830 (=> (not res!218655) (not e!233088))))

(assert (=> b!383830 (= res!218655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!383831 () Bool)

(declare-fun e!233089 () Bool)

(assert (=> b!383831 (= e!233089 tp_is_empty!9343)))

(declare-fun mapNonEmpty!15579 () Bool)

(declare-fun mapRes!15579 () Bool)

(declare-fun tp!30801 () Bool)

(assert (=> mapNonEmpty!15579 (= mapRes!15579 (and tp!30801 e!233089))))

(declare-fun mapKey!15579 () (_ BitVec 32))

(declare-fun mapValue!15579 () ValueCell!4328)

(declare-fun mapRest!15579 () (Array (_ BitVec 32) ValueCell!4328))

(assert (=> mapNonEmpty!15579 (= (arr!10758 _values!506) (store mapRest!15579 mapKey!15579 mapValue!15579))))

(declare-fun b!383832 () Bool)

(assert (=> b!383832 (= e!233086 true)))

(declare-fun lt!180475 () ListLongMap!5137)

(assert (=> b!383832 (= lt!180475 (+!976 lt!180482 lt!180484))))

(assert (=> b!383832 (= lt!180483 lt!180479)))

(declare-fun b!383833 () Bool)

(declare-fun res!218652 () Bool)

(assert (=> b!383833 (=> (not res!218652) (not e!233088))))

(assert (=> b!383833 (= res!218652 (or (= (select (arr!10759 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10759 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!383834 () Bool)

(assert (=> b!383834 (= e!233087 (and e!233090 mapRes!15579))))

(declare-fun condMapEmpty!15579 () Bool)

(declare-fun mapDefault!15579 () ValueCell!4328)

(assert (=> b!383834 (= condMapEmpty!15579 (= (arr!10758 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4328)) mapDefault!15579)))))

(declare-fun b!383835 () Bool)

(declare-fun res!218656 () Bool)

(assert (=> b!383835 (=> (not res!218656) (not e!233088))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383835 (= res!218656 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!15579 () Bool)

(assert (=> mapIsEmpty!15579 mapRes!15579))

(declare-fun b!383836 () Bool)

(declare-fun res!218653 () Bool)

(assert (=> b!383836 (=> (not res!218653) (not e!233088))))

(assert (=> b!383836 (= res!218653 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6058))))

(assert (= (and start!37554 res!218649) b!383823))

(assert (= (and b!383823 res!218647) b!383830))

(assert (= (and b!383830 res!218655) b!383836))

(assert (= (and b!383836 res!218653) b!383824))

(assert (= (and b!383824 res!218657) b!383835))

(assert (= (and b!383835 res!218656) b!383833))

(assert (= (and b!383833 res!218652) b!383825))

(assert (= (and b!383825 res!218651) b!383827))

(assert (= (and b!383827 res!218654) b!383829))

(assert (= (and b!383829 res!218650) b!383826))

(assert (= (and b!383826 (not res!218648)) b!383832))

(assert (= (and b!383834 condMapEmpty!15579) mapIsEmpty!15579))

(assert (= (and b!383834 (not condMapEmpty!15579)) mapNonEmpty!15579))

(get-info :version)

(assert (= (and mapNonEmpty!15579 ((_ is ValueCellFull!4328) mapValue!15579)) b!383831))

(assert (= (and b!383834 ((_ is ValueCellFull!4328) mapDefault!15579)) b!383828))

(assert (= start!37554 b!383834))

(declare-fun m!380825 () Bool)

(assert (=> b!383836 m!380825))

(declare-fun m!380827 () Bool)

(assert (=> b!383830 m!380827))

(declare-fun m!380829 () Bool)

(assert (=> b!383829 m!380829))

(declare-fun m!380831 () Bool)

(assert (=> start!37554 m!380831))

(declare-fun m!380833 () Bool)

(assert (=> start!37554 m!380833))

(declare-fun m!380835 () Bool)

(assert (=> start!37554 m!380835))

(declare-fun m!380837 () Bool)

(assert (=> b!383826 m!380837))

(declare-fun m!380839 () Bool)

(assert (=> b!383826 m!380839))

(declare-fun m!380841 () Bool)

(assert (=> b!383826 m!380841))

(declare-fun m!380843 () Bool)

(assert (=> b!383826 m!380843))

(declare-fun m!380845 () Bool)

(assert (=> b!383826 m!380845))

(declare-fun m!380847 () Bool)

(assert (=> b!383826 m!380847))

(declare-fun m!380849 () Bool)

(assert (=> b!383826 m!380849))

(declare-fun m!380851 () Bool)

(assert (=> b!383825 m!380851))

(declare-fun m!380853 () Bool)

(assert (=> b!383827 m!380853))

(declare-fun m!380855 () Bool)

(assert (=> b!383827 m!380855))

(declare-fun m!380857 () Bool)

(assert (=> b!383835 m!380857))

(declare-fun m!380859 () Bool)

(assert (=> mapNonEmpty!15579 m!380859))

(declare-fun m!380861 () Bool)

(assert (=> b!383832 m!380861))

(declare-fun m!380863 () Bool)

(assert (=> b!383833 m!380863))

(check-sat (not b_next!8695) b_and!15951 (not b!383829) (not b!383825) (not b!383827) (not b!383830) (not b!383826) (not start!37554) (not mapNonEmpty!15579) (not b!383835) (not b!383832) tp_is_empty!9343 (not b!383836))
(check-sat b_and!15951 (not b_next!8695))
