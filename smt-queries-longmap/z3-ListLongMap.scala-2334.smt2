; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37452 () Bool)

(assert start!37452)

(declare-fun b_free!8593 () Bool)

(declare-fun b_next!8593 () Bool)

(assert (=> start!37452 (= b_free!8593 (not b_next!8593))))

(declare-fun tp!30494 () Bool)

(declare-fun b_and!15809 () Bool)

(assert (=> start!37452 (= tp!30494 b_and!15809)))

(declare-fun b!381460 () Bool)

(declare-fun res!216838 () Bool)

(declare-fun e!231877 () Bool)

(assert (=> b!381460 (=> (not res!216838) (not e!231877))))

(declare-datatypes ((array!22377 0))(
  ( (array!22378 (arr!10657 (Array (_ BitVec 32) (_ BitVec 64))) (size!11010 (_ BitVec 32))) )
))
(declare-fun lt!178732 () array!22377)

(declare-datatypes ((List!6065 0))(
  ( (Nil!6062) (Cons!6061 (h!6917 (_ BitVec 64)) (t!11206 List!6065)) )
))
(declare-fun arrayNoDuplicates!0 (array!22377 (_ BitVec 32) List!6065) Bool)

(assert (=> b!381460 (= res!216838 (arrayNoDuplicates!0 lt!178732 #b00000000000000000000000000000000 Nil!6062))))

(declare-fun b!381461 () Bool)

(declare-fun res!216840 () Bool)

(declare-fun e!231875 () Bool)

(assert (=> b!381461 (=> (not res!216840) (not e!231875))))

(declare-fun _keys!658 () array!22377)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!381461 (= res!216840 (or (= (select (arr!10657 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10657 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!381462 () Bool)

(assert (=> b!381462 (= e!231875 e!231877)))

(declare-fun res!216842 () Bool)

(assert (=> b!381462 (=> (not res!216842) (not e!231877))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22377 (_ BitVec 32)) Bool)

(assert (=> b!381462 (= res!216842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178732 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!381462 (= lt!178732 (array!22378 (store (arr!10657 _keys!658) i!548 k0!778) (size!11010 _keys!658)))))

(declare-fun mapIsEmpty!15426 () Bool)

(declare-fun mapRes!15426 () Bool)

(assert (=> mapIsEmpty!15426 mapRes!15426))

(declare-fun b!381463 () Bool)

(declare-fun e!231872 () Bool)

(assert (=> b!381463 (= e!231877 (not e!231872))))

(declare-fun res!216845 () Bool)

(assert (=> b!381463 (=> res!216845 e!231872)))

(declare-fun lt!178736 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!381463 (= res!216845 (or (and (not lt!178736) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178736) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178736)))))

(assert (=> b!381463 (= lt!178736 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!13427 0))(
  ( (V!13428 (val!4665 Int)) )
))
(declare-datatypes ((ValueCell!4277 0))(
  ( (ValueCellFull!4277 (v!6856 V!13427)) (EmptyCell!4277) )
))
(declare-datatypes ((array!22379 0))(
  ( (array!22380 (arr!10658 (Array (_ BitVec 32) ValueCell!4277)) (size!11011 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22379)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6238 0))(
  ( (tuple2!6239 (_1!3130 (_ BitVec 64)) (_2!3130 V!13427)) )
))
(declare-datatypes ((List!6066 0))(
  ( (Nil!6063) (Cons!6062 (h!6918 tuple2!6238) (t!11207 List!6066)) )
))
(declare-datatypes ((ListLongMap!5141 0))(
  ( (ListLongMap!5142 (toList!2586 List!6066)) )
))
(declare-fun lt!178735 () ListLongMap!5141)

(declare-fun zeroValue!472 () V!13427)

(declare-fun minValue!472 () V!13427)

(declare-fun getCurrentListMap!1975 (array!22377 array!22379 (_ BitVec 32) (_ BitVec 32) V!13427 V!13427 (_ BitVec 32) Int) ListLongMap!5141)

(assert (=> b!381463 (= lt!178735 (getCurrentListMap!1975 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178740 () array!22379)

(declare-fun lt!178737 () ListLongMap!5141)

(assert (=> b!381463 (= lt!178737 (getCurrentListMap!1975 lt!178732 lt!178740 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178733 () ListLongMap!5141)

(declare-fun lt!178738 () ListLongMap!5141)

(assert (=> b!381463 (and (= lt!178733 lt!178738) (= lt!178738 lt!178733))))

(declare-fun v!373 () V!13427)

(declare-fun lt!178739 () ListLongMap!5141)

(declare-fun +!949 (ListLongMap!5141 tuple2!6238) ListLongMap!5141)

(assert (=> b!381463 (= lt!178738 (+!949 lt!178739 (tuple2!6239 k0!778 v!373)))))

(declare-datatypes ((Unit!11756 0))(
  ( (Unit!11757) )
))
(declare-fun lt!178734 () Unit!11756)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!168 (array!22377 array!22379 (_ BitVec 32) (_ BitVec 32) V!13427 V!13427 (_ BitVec 32) (_ BitVec 64) V!13427 (_ BitVec 32) Int) Unit!11756)

(assert (=> b!381463 (= lt!178734 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!168 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!840 (array!22377 array!22379 (_ BitVec 32) (_ BitVec 32) V!13427 V!13427 (_ BitVec 32) Int) ListLongMap!5141)

(assert (=> b!381463 (= lt!178733 (getCurrentListMapNoExtraKeys!840 lt!178732 lt!178740 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!381463 (= lt!178740 (array!22380 (store (arr!10658 _values!506) i!548 (ValueCellFull!4277 v!373)) (size!11011 _values!506)))))

(assert (=> b!381463 (= lt!178739 (getCurrentListMapNoExtraKeys!840 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!381464 () Bool)

(declare-fun res!216846 () Bool)

(assert (=> b!381464 (=> (not res!216846) (not e!231875))))

(assert (=> b!381464 (= res!216846 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6062))))

(declare-fun b!381465 () Bool)

(declare-fun res!216847 () Bool)

(assert (=> b!381465 (=> (not res!216847) (not e!231875))))

(assert (=> b!381465 (= res!216847 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11010 _keys!658))))))

(declare-fun b!381466 () Bool)

(declare-fun e!231874 () Bool)

(declare-fun e!231873 () Bool)

(assert (=> b!381466 (= e!231874 (and e!231873 mapRes!15426))))

(declare-fun condMapEmpty!15426 () Bool)

(declare-fun mapDefault!15426 () ValueCell!4277)

(assert (=> b!381466 (= condMapEmpty!15426 (= (arr!10658 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4277)) mapDefault!15426)))))

(declare-fun b!381467 () Bool)

(declare-fun res!216841 () Bool)

(assert (=> b!381467 (=> (not res!216841) (not e!231875))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!381467 (= res!216841 (validKeyInArray!0 k0!778))))

(declare-fun b!381468 () Bool)

(declare-fun res!216839 () Bool)

(assert (=> b!381468 (=> (not res!216839) (not e!231875))))

(assert (=> b!381468 (= res!216839 (and (= (size!11011 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11010 _keys!658) (size!11011 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!381469 () Bool)

(declare-fun e!231876 () Bool)

(declare-fun tp_is_empty!9241 () Bool)

(assert (=> b!381469 (= e!231876 tp_is_empty!9241)))

(declare-fun res!216848 () Bool)

(assert (=> start!37452 (=> (not res!216848) (not e!231875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37452 (= res!216848 (validMask!0 mask!970))))

(assert (=> start!37452 e!231875))

(declare-fun array_inv!7848 (array!22379) Bool)

(assert (=> start!37452 (and (array_inv!7848 _values!506) e!231874)))

(assert (=> start!37452 tp!30494))

(assert (=> start!37452 true))

(assert (=> start!37452 tp_is_empty!9241))

(declare-fun array_inv!7849 (array!22377) Bool)

(assert (=> start!37452 (array_inv!7849 _keys!658)))

(declare-fun b!381459 () Bool)

(declare-fun res!216844 () Bool)

(assert (=> b!381459 (=> (not res!216844) (not e!231875))))

(assert (=> b!381459 (= res!216844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!15426 () Bool)

(declare-fun tp!30495 () Bool)

(assert (=> mapNonEmpty!15426 (= mapRes!15426 (and tp!30495 e!231876))))

(declare-fun mapValue!15426 () ValueCell!4277)

(declare-fun mapKey!15426 () (_ BitVec 32))

(declare-fun mapRest!15426 () (Array (_ BitVec 32) ValueCell!4277))

(assert (=> mapNonEmpty!15426 (= (arr!10658 _values!506) (store mapRest!15426 mapKey!15426 mapValue!15426))))

(declare-fun b!381470 () Bool)

(declare-fun res!216843 () Bool)

(assert (=> b!381470 (=> (not res!216843) (not e!231875))))

(declare-fun arrayContainsKey!0 (array!22377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381470 (= res!216843 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!381471 () Bool)

(assert (=> b!381471 (= e!231872 true)))

(assert (=> b!381471 (= lt!178737 lt!178733)))

(declare-fun b!381472 () Bool)

(assert (=> b!381472 (= e!231873 tp_is_empty!9241)))

(assert (= (and start!37452 res!216848) b!381468))

(assert (= (and b!381468 res!216839) b!381459))

(assert (= (and b!381459 res!216844) b!381464))

(assert (= (and b!381464 res!216846) b!381465))

(assert (= (and b!381465 res!216847) b!381467))

(assert (= (and b!381467 res!216841) b!381461))

(assert (= (and b!381461 res!216840) b!381470))

(assert (= (and b!381470 res!216843) b!381462))

(assert (= (and b!381462 res!216842) b!381460))

(assert (= (and b!381460 res!216838) b!381463))

(assert (= (and b!381463 (not res!216845)) b!381471))

(assert (= (and b!381466 condMapEmpty!15426) mapIsEmpty!15426))

(assert (= (and b!381466 (not condMapEmpty!15426)) mapNonEmpty!15426))

(get-info :version)

(assert (= (and mapNonEmpty!15426 ((_ is ValueCellFull!4277) mapValue!15426)) b!381469))

(assert (= (and b!381466 ((_ is ValueCellFull!4277) mapDefault!15426)) b!381472))

(assert (= start!37452 b!381466))

(declare-fun m!377897 () Bool)

(assert (=> b!381464 m!377897))

(declare-fun m!377899 () Bool)

(assert (=> b!381460 m!377899))

(declare-fun m!377901 () Bool)

(assert (=> start!37452 m!377901))

(declare-fun m!377903 () Bool)

(assert (=> start!37452 m!377903))

(declare-fun m!377905 () Bool)

(assert (=> start!37452 m!377905))

(declare-fun m!377907 () Bool)

(assert (=> b!381463 m!377907))

(declare-fun m!377909 () Bool)

(assert (=> b!381463 m!377909))

(declare-fun m!377911 () Bool)

(assert (=> b!381463 m!377911))

(declare-fun m!377913 () Bool)

(assert (=> b!381463 m!377913))

(declare-fun m!377915 () Bool)

(assert (=> b!381463 m!377915))

(declare-fun m!377917 () Bool)

(assert (=> b!381463 m!377917))

(declare-fun m!377919 () Bool)

(assert (=> b!381463 m!377919))

(declare-fun m!377921 () Bool)

(assert (=> b!381470 m!377921))

(declare-fun m!377923 () Bool)

(assert (=> b!381467 m!377923))

(declare-fun m!377925 () Bool)

(assert (=> b!381459 m!377925))

(declare-fun m!377927 () Bool)

(assert (=> mapNonEmpty!15426 m!377927))

(declare-fun m!377929 () Bool)

(assert (=> b!381462 m!377929))

(declare-fun m!377931 () Bool)

(assert (=> b!381462 m!377931))

(declare-fun m!377933 () Bool)

(assert (=> b!381461 m!377933))

(check-sat (not b_next!8593) (not b!381464) (not b!381459) (not b!381470) (not b!381460) tp_is_empty!9241 (not b!381462) b_and!15809 (not mapNonEmpty!15426) (not b!381463) (not b!381467) (not start!37452))
(check-sat b_and!15809 (not b_next!8593))
