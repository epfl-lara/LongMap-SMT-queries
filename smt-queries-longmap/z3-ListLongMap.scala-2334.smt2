; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37452 () Bool)

(assert start!37452)

(declare-fun b_free!8593 () Bool)

(declare-fun b_next!8593 () Bool)

(assert (=> start!37452 (= b_free!8593 (not b_next!8593))))

(declare-fun tp!30495 () Bool)

(declare-fun b_and!15849 () Bool)

(assert (=> start!37452 (= tp!30495 b_and!15849)))

(declare-fun mapIsEmpty!15426 () Bool)

(declare-fun mapRes!15426 () Bool)

(assert (=> mapIsEmpty!15426 mapRes!15426))

(declare-fun b!381681 () Bool)

(declare-fun res!216972 () Bool)

(declare-fun e!232019 () Bool)

(assert (=> b!381681 (=> (not res!216972) (not e!232019))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!381681 (= res!216972 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!15426 () Bool)

(declare-fun tp!30494 () Bool)

(declare-fun e!232015 () Bool)

(assert (=> mapNonEmpty!15426 (= mapRes!15426 (and tp!30494 e!232015))))

(declare-datatypes ((V!13427 0))(
  ( (V!13428 (val!4665 Int)) )
))
(declare-datatypes ((ValueCell!4277 0))(
  ( (ValueCellFull!4277 (v!6863 V!13427)) (EmptyCell!4277) )
))
(declare-datatypes ((array!22382 0))(
  ( (array!22383 (arr!10659 (Array (_ BitVec 32) ValueCell!4277)) (size!11011 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22382)

(declare-fun mapValue!15426 () ValueCell!4277)

(declare-fun mapRest!15426 () (Array (_ BitVec 32) ValueCell!4277))

(declare-fun mapKey!15426 () (_ BitVec 32))

(assert (=> mapNonEmpty!15426 (= (arr!10659 _values!506) (store mapRest!15426 mapKey!15426 mapValue!15426))))

(declare-fun b!381682 () Bool)

(declare-fun res!216971 () Bool)

(assert (=> b!381682 (=> (not res!216971) (not e!232019))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((array!22384 0))(
  ( (array!22385 (arr!10660 (Array (_ BitVec 32) (_ BitVec 64))) (size!11012 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22384)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!381682 (= res!216971 (and (= (size!11011 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11012 _keys!658) (size!11011 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!381683 () Bool)

(declare-fun res!216970 () Bool)

(assert (=> b!381683 (=> (not res!216970) (not e!232019))))

(declare-datatypes ((List!5980 0))(
  ( (Nil!5977) (Cons!5976 (h!6832 (_ BitVec 64)) (t!11122 List!5980)) )
))
(declare-fun arrayNoDuplicates!0 (array!22384 (_ BitVec 32) List!5980) Bool)

(assert (=> b!381683 (= res!216970 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5977))))

(declare-fun res!216969 () Bool)

(assert (=> start!37452 (=> (not res!216969) (not e!232019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37452 (= res!216969 (validMask!0 mask!970))))

(assert (=> start!37452 e!232019))

(declare-fun e!232018 () Bool)

(declare-fun array_inv!7892 (array!22382) Bool)

(assert (=> start!37452 (and (array_inv!7892 _values!506) e!232018)))

(assert (=> start!37452 tp!30495))

(assert (=> start!37452 true))

(declare-fun tp_is_empty!9241 () Bool)

(assert (=> start!37452 tp_is_empty!9241))

(declare-fun array_inv!7893 (array!22384) Bool)

(assert (=> start!37452 (array_inv!7893 _keys!658)))

(declare-fun b!381684 () Bool)

(declare-fun e!232020 () Bool)

(assert (=> b!381684 (= e!232018 (and e!232020 mapRes!15426))))

(declare-fun condMapEmpty!15426 () Bool)

(declare-fun mapDefault!15426 () ValueCell!4277)

(assert (=> b!381684 (= condMapEmpty!15426 (= (arr!10659 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4277)) mapDefault!15426)))))

(declare-fun b!381685 () Bool)

(declare-fun res!216966 () Bool)

(assert (=> b!381685 (=> (not res!216966) (not e!232019))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!381685 (= res!216966 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11012 _keys!658))))))

(declare-fun b!381686 () Bool)

(declare-fun res!216973 () Bool)

(assert (=> b!381686 (=> (not res!216973) (not e!232019))))

(declare-fun arrayContainsKey!0 (array!22384 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381686 (= res!216973 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!381687 () Bool)

(assert (=> b!381687 (= e!232015 tp_is_empty!9241)))

(declare-fun b!381688 () Bool)

(declare-fun e!232014 () Bool)

(assert (=> b!381688 (= e!232014 true)))

(declare-datatypes ((tuple2!6144 0))(
  ( (tuple2!6145 (_1!3083 (_ BitVec 64)) (_2!3083 V!13427)) )
))
(declare-datatypes ((List!5981 0))(
  ( (Nil!5978) (Cons!5977 (h!6833 tuple2!6144) (t!11123 List!5981)) )
))
(declare-datatypes ((ListLongMap!5059 0))(
  ( (ListLongMap!5060 (toList!2545 List!5981)) )
))
(declare-fun lt!178993 () ListLongMap!5059)

(declare-fun lt!178986 () ListLongMap!5059)

(assert (=> b!381688 (= lt!178993 lt!178986)))

(declare-fun b!381689 () Bool)

(declare-fun res!216964 () Bool)

(declare-fun e!232016 () Bool)

(assert (=> b!381689 (=> (not res!216964) (not e!232016))))

(declare-fun lt!178985 () array!22384)

(assert (=> b!381689 (= res!216964 (arrayNoDuplicates!0 lt!178985 #b00000000000000000000000000000000 Nil!5977))))

(declare-fun b!381690 () Bool)

(assert (=> b!381690 (= e!232020 tp_is_empty!9241)))

(declare-fun b!381691 () Bool)

(assert (=> b!381691 (= e!232016 (not e!232014))))

(declare-fun res!216965 () Bool)

(assert (=> b!381691 (=> res!216965 e!232014)))

(declare-fun lt!178987 () Bool)

(assert (=> b!381691 (= res!216965 (or (and (not lt!178987) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178987) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178987)))))

(assert (=> b!381691 (= lt!178987 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!178991 () ListLongMap!5059)

(declare-fun zeroValue!472 () V!13427)

(declare-fun minValue!472 () V!13427)

(declare-fun getCurrentListMap!1982 (array!22384 array!22382 (_ BitVec 32) (_ BitVec 32) V!13427 V!13427 (_ BitVec 32) Int) ListLongMap!5059)

(assert (=> b!381691 (= lt!178991 (getCurrentListMap!1982 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178990 () array!22382)

(assert (=> b!381691 (= lt!178993 (getCurrentListMap!1982 lt!178985 lt!178990 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178989 () ListLongMap!5059)

(assert (=> b!381691 (and (= lt!178986 lt!178989) (= lt!178989 lt!178986))))

(declare-fun lt!178988 () ListLongMap!5059)

(declare-fun v!373 () V!13427)

(declare-fun +!940 (ListLongMap!5059 tuple2!6144) ListLongMap!5059)

(assert (=> b!381691 (= lt!178989 (+!940 lt!178988 (tuple2!6145 k0!778 v!373)))))

(declare-datatypes ((Unit!11759 0))(
  ( (Unit!11760) )
))
(declare-fun lt!178992 () Unit!11759)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!169 (array!22384 array!22382 (_ BitVec 32) (_ BitVec 32) V!13427 V!13427 (_ BitVec 32) (_ BitVec 64) V!13427 (_ BitVec 32) Int) Unit!11759)

(assert (=> b!381691 (= lt!178992 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!169 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!829 (array!22384 array!22382 (_ BitVec 32) (_ BitVec 32) V!13427 V!13427 (_ BitVec 32) Int) ListLongMap!5059)

(assert (=> b!381691 (= lt!178986 (getCurrentListMapNoExtraKeys!829 lt!178985 lt!178990 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!381691 (= lt!178990 (array!22383 (store (arr!10659 _values!506) i!548 (ValueCellFull!4277 v!373)) (size!11011 _values!506)))))

(assert (=> b!381691 (= lt!178988 (getCurrentListMapNoExtraKeys!829 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!381692 () Bool)

(declare-fun res!216967 () Bool)

(assert (=> b!381692 (=> (not res!216967) (not e!232019))))

(assert (=> b!381692 (= res!216967 (or (= (select (arr!10660 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10660 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!381693 () Bool)

(declare-fun res!216968 () Bool)

(assert (=> b!381693 (=> (not res!216968) (not e!232019))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22384 (_ BitVec 32)) Bool)

(assert (=> b!381693 (= res!216968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!381694 () Bool)

(assert (=> b!381694 (= e!232019 e!232016)))

(declare-fun res!216974 () Bool)

(assert (=> b!381694 (=> (not res!216974) (not e!232016))))

(assert (=> b!381694 (= res!216974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178985 mask!970))))

(assert (=> b!381694 (= lt!178985 (array!22385 (store (arr!10660 _keys!658) i!548 k0!778) (size!11012 _keys!658)))))

(assert (= (and start!37452 res!216969) b!381682))

(assert (= (and b!381682 res!216971) b!381693))

(assert (= (and b!381693 res!216968) b!381683))

(assert (= (and b!381683 res!216970) b!381685))

(assert (= (and b!381685 res!216966) b!381681))

(assert (= (and b!381681 res!216972) b!381692))

(assert (= (and b!381692 res!216967) b!381686))

(assert (= (and b!381686 res!216973) b!381694))

(assert (= (and b!381694 res!216974) b!381689))

(assert (= (and b!381689 res!216964) b!381691))

(assert (= (and b!381691 (not res!216965)) b!381688))

(assert (= (and b!381684 condMapEmpty!15426) mapIsEmpty!15426))

(assert (= (and b!381684 (not condMapEmpty!15426)) mapNonEmpty!15426))

(get-info :version)

(assert (= (and mapNonEmpty!15426 ((_ is ValueCellFull!4277) mapValue!15426)) b!381687))

(assert (= (and b!381684 ((_ is ValueCellFull!4277) mapDefault!15426)) b!381690))

(assert (= start!37452 b!381684))

(declare-fun m!378851 () Bool)

(assert (=> mapNonEmpty!15426 m!378851))

(declare-fun m!378853 () Bool)

(assert (=> b!381693 m!378853))

(declare-fun m!378855 () Bool)

(assert (=> b!381694 m!378855))

(declare-fun m!378857 () Bool)

(assert (=> b!381694 m!378857))

(declare-fun m!378859 () Bool)

(assert (=> b!381681 m!378859))

(declare-fun m!378861 () Bool)

(assert (=> b!381692 m!378861))

(declare-fun m!378863 () Bool)

(assert (=> b!381691 m!378863))

(declare-fun m!378865 () Bool)

(assert (=> b!381691 m!378865))

(declare-fun m!378867 () Bool)

(assert (=> b!381691 m!378867))

(declare-fun m!378869 () Bool)

(assert (=> b!381691 m!378869))

(declare-fun m!378871 () Bool)

(assert (=> b!381691 m!378871))

(declare-fun m!378873 () Bool)

(assert (=> b!381691 m!378873))

(declare-fun m!378875 () Bool)

(assert (=> b!381691 m!378875))

(declare-fun m!378877 () Bool)

(assert (=> b!381683 m!378877))

(declare-fun m!378879 () Bool)

(assert (=> b!381686 m!378879))

(declare-fun m!378881 () Bool)

(assert (=> b!381689 m!378881))

(declare-fun m!378883 () Bool)

(assert (=> start!37452 m!378883))

(declare-fun m!378885 () Bool)

(assert (=> start!37452 m!378885))

(declare-fun m!378887 () Bool)

(assert (=> start!37452 m!378887))

(check-sat (not b!381694) (not b!381691) (not mapNonEmpty!15426) (not b!381686) b_and!15849 (not b!381689) (not start!37452) tp_is_empty!9241 (not b!381681) (not b_next!8593) (not b!381683) (not b!381693))
(check-sat b_and!15849 (not b_next!8593))
