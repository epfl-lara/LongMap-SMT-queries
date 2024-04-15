; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39140 () Bool)

(assert start!39140)

(declare-fun b_free!9421 () Bool)

(declare-fun b_next!9421 () Bool)

(assert (=> start!39140 (= b_free!9421 (not b_next!9421))))

(declare-fun tp!33792 () Bool)

(declare-fun b_and!16781 () Bool)

(assert (=> start!39140 (= tp!33792 b_and!16781)))

(declare-fun b!411806 () Bool)

(declare-fun res!239081 () Bool)

(declare-fun e!246488 () Bool)

(assert (=> b!411806 (=> (not res!239081) (not e!246488))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!411806 (= res!239081 (bvsle from!863 i!563))))

(declare-fun b!411807 () Bool)

(declare-fun res!239076 () Bool)

(declare-fun e!246490 () Bool)

(assert (=> b!411807 (=> (not res!239076) (not e!246490))))

(declare-datatypes ((array!24999 0))(
  ( (array!25000 (arr!11949 (Array (_ BitVec 32) (_ BitVec 64))) (size!12302 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24999)

(declare-datatypes ((List!6915 0))(
  ( (Nil!6912) (Cons!6911 (h!7767 (_ BitVec 64)) (t!12080 List!6915)) )
))
(declare-fun arrayNoDuplicates!0 (array!24999 (_ BitVec 32) List!6915) Bool)

(assert (=> b!411807 (= res!239076 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6912))))

(declare-fun b!411808 () Bool)

(declare-fun res!239082 () Bool)

(assert (=> b!411808 (=> (not res!239082) (not e!246490))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24999 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!411808 (= res!239082 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!411809 () Bool)

(declare-fun e!246489 () Bool)

(declare-fun e!246487 () Bool)

(declare-fun mapRes!17481 () Bool)

(assert (=> b!411809 (= e!246489 (and e!246487 mapRes!17481))))

(declare-fun condMapEmpty!17481 () Bool)

(declare-datatypes ((V!15203 0))(
  ( (V!15204 (val!5331 Int)) )
))
(declare-datatypes ((ValueCell!4943 0))(
  ( (ValueCellFull!4943 (v!7572 V!15203)) (EmptyCell!4943) )
))
(declare-datatypes ((array!25001 0))(
  ( (array!25002 (arr!11950 (Array (_ BitVec 32) ValueCell!4943)) (size!12303 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25001)

(declare-fun mapDefault!17481 () ValueCell!4943)

(assert (=> b!411809 (= condMapEmpty!17481 (= (arr!11950 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4943)) mapDefault!17481)))))

(declare-fun b!411810 () Bool)

(declare-fun res!239077 () Bool)

(assert (=> b!411810 (=> (not res!239077) (not e!246490))))

(assert (=> b!411810 (= res!239077 (or (= (select (arr!11949 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11949 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!411811 () Bool)

(assert (=> b!411811 (= e!246490 e!246488)))

(declare-fun res!239078 () Bool)

(assert (=> b!411811 (=> (not res!239078) (not e!246488))))

(declare-fun lt!189174 () array!24999)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24999 (_ BitVec 32)) Bool)

(assert (=> b!411811 (= res!239078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189174 mask!1025))))

(assert (=> b!411811 (= lt!189174 (array!25000 (store (arr!11949 _keys!709) i!563 k0!794) (size!12302 _keys!709)))))

(declare-fun b!411812 () Bool)

(declare-fun res!239079 () Bool)

(assert (=> b!411812 (=> (not res!239079) (not e!246490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!411812 (= res!239079 (validMask!0 mask!1025))))

(declare-fun b!411813 () Bool)

(declare-fun tp_is_empty!10573 () Bool)

(assert (=> b!411813 (= e!246487 tp_is_empty!10573)))

(declare-fun b!411815 () Bool)

(declare-fun res!239080 () Bool)

(assert (=> b!411815 (=> (not res!239080) (not e!246490))))

(assert (=> b!411815 (= res!239080 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12302 _keys!709))))))

(declare-fun mapNonEmpty!17481 () Bool)

(declare-fun tp!33791 () Bool)

(declare-fun e!246492 () Bool)

(assert (=> mapNonEmpty!17481 (= mapRes!17481 (and tp!33791 e!246492))))

(declare-fun mapRest!17481 () (Array (_ BitVec 32) ValueCell!4943))

(declare-fun mapKey!17481 () (_ BitVec 32))

(declare-fun mapValue!17481 () ValueCell!4943)

(assert (=> mapNonEmpty!17481 (= (arr!11950 _values!549) (store mapRest!17481 mapKey!17481 mapValue!17481))))

(declare-fun b!411816 () Bool)

(assert (=> b!411816 (= e!246492 tp_is_empty!10573)))

(declare-fun b!411817 () Bool)

(assert (=> b!411817 (= e!246488 false)))

(declare-fun minValue!515 () V!15203)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15203)

(declare-fun v!412 () V!15203)

(declare-datatypes ((tuple2!6902 0))(
  ( (tuple2!6903 (_1!3462 (_ BitVec 64)) (_2!3462 V!15203)) )
))
(declare-datatypes ((List!6916 0))(
  ( (Nil!6913) (Cons!6912 (h!7768 tuple2!6902) (t!12081 List!6916)) )
))
(declare-datatypes ((ListLongMap!5805 0))(
  ( (ListLongMap!5806 (toList!2918 List!6916)) )
))
(declare-fun lt!189176 () ListLongMap!5805)

(declare-fun getCurrentListMapNoExtraKeys!1132 (array!24999 array!25001 (_ BitVec 32) (_ BitVec 32) V!15203 V!15203 (_ BitVec 32) Int) ListLongMap!5805)

(assert (=> b!411817 (= lt!189176 (getCurrentListMapNoExtraKeys!1132 lt!189174 (array!25002 (store (arr!11950 _values!549) i!563 (ValueCellFull!4943 v!412)) (size!12303 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189175 () ListLongMap!5805)

(assert (=> b!411817 (= lt!189175 (getCurrentListMapNoExtraKeys!1132 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!17481 () Bool)

(assert (=> mapIsEmpty!17481 mapRes!17481))

(declare-fun b!411818 () Bool)

(declare-fun res!239073 () Bool)

(assert (=> b!411818 (=> (not res!239073) (not e!246490))))

(assert (=> b!411818 (= res!239073 (and (= (size!12303 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12302 _keys!709) (size!12303 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!411819 () Bool)

(declare-fun res!239072 () Bool)

(assert (=> b!411819 (=> (not res!239072) (not e!246488))))

(assert (=> b!411819 (= res!239072 (arrayNoDuplicates!0 lt!189174 #b00000000000000000000000000000000 Nil!6912))))

(declare-fun b!411820 () Bool)

(declare-fun res!239074 () Bool)

(assert (=> b!411820 (=> (not res!239074) (not e!246490))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!411820 (= res!239074 (validKeyInArray!0 k0!794))))

(declare-fun b!411814 () Bool)

(declare-fun res!239075 () Bool)

(assert (=> b!411814 (=> (not res!239075) (not e!246490))))

(assert (=> b!411814 (= res!239075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!239071 () Bool)

(assert (=> start!39140 (=> (not res!239071) (not e!246490))))

(assert (=> start!39140 (= res!239071 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12302 _keys!709))))))

(assert (=> start!39140 e!246490))

(assert (=> start!39140 tp_is_empty!10573))

(assert (=> start!39140 tp!33792))

(assert (=> start!39140 true))

(declare-fun array_inv!8768 (array!25001) Bool)

(assert (=> start!39140 (and (array_inv!8768 _values!549) e!246489)))

(declare-fun array_inv!8769 (array!24999) Bool)

(assert (=> start!39140 (array_inv!8769 _keys!709)))

(assert (= (and start!39140 res!239071) b!411812))

(assert (= (and b!411812 res!239079) b!411818))

(assert (= (and b!411818 res!239073) b!411814))

(assert (= (and b!411814 res!239075) b!411807))

(assert (= (and b!411807 res!239076) b!411815))

(assert (= (and b!411815 res!239080) b!411820))

(assert (= (and b!411820 res!239074) b!411810))

(assert (= (and b!411810 res!239077) b!411808))

(assert (= (and b!411808 res!239082) b!411811))

(assert (= (and b!411811 res!239078) b!411819))

(assert (= (and b!411819 res!239072) b!411806))

(assert (= (and b!411806 res!239081) b!411817))

(assert (= (and b!411809 condMapEmpty!17481) mapIsEmpty!17481))

(assert (= (and b!411809 (not condMapEmpty!17481)) mapNonEmpty!17481))

(get-info :version)

(assert (= (and mapNonEmpty!17481 ((_ is ValueCellFull!4943) mapValue!17481)) b!411816))

(assert (= (and b!411809 ((_ is ValueCellFull!4943) mapDefault!17481)) b!411813))

(assert (= start!39140 b!411809))

(declare-fun m!401289 () Bool)

(assert (=> b!411808 m!401289))

(declare-fun m!401291 () Bool)

(assert (=> b!411810 m!401291))

(declare-fun m!401293 () Bool)

(assert (=> b!411812 m!401293))

(declare-fun m!401295 () Bool)

(assert (=> b!411817 m!401295))

(declare-fun m!401297 () Bool)

(assert (=> b!411817 m!401297))

(declare-fun m!401299 () Bool)

(assert (=> b!411817 m!401299))

(declare-fun m!401301 () Bool)

(assert (=> b!411820 m!401301))

(declare-fun m!401303 () Bool)

(assert (=> mapNonEmpty!17481 m!401303))

(declare-fun m!401305 () Bool)

(assert (=> start!39140 m!401305))

(declare-fun m!401307 () Bool)

(assert (=> start!39140 m!401307))

(declare-fun m!401309 () Bool)

(assert (=> b!411814 m!401309))

(declare-fun m!401311 () Bool)

(assert (=> b!411819 m!401311))

(declare-fun m!401313 () Bool)

(assert (=> b!411811 m!401313))

(declare-fun m!401315 () Bool)

(assert (=> b!411811 m!401315))

(declare-fun m!401317 () Bool)

(assert (=> b!411807 m!401317))

(check-sat (not b!411817) (not b!411814) (not b!411820) (not b!411812) (not b!411808) b_and!16781 (not b!411819) (not b!411807) (not b_next!9421) (not start!39140) tp_is_empty!10573 (not mapNonEmpty!17481) (not b!411811))
(check-sat b_and!16781 (not b_next!9421))
