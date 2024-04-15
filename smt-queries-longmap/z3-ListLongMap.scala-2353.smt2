; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37566 () Bool)

(assert start!37566)

(declare-fun b_free!8707 () Bool)

(declare-fun b_next!8707 () Bool)

(assert (=> start!37566 (= b_free!8707 (not b_next!8707))))

(declare-fun tp!30837 () Bool)

(declare-fun b_and!15923 () Bool)

(assert (=> start!37566 (= tp!30837 b_and!15923)))

(declare-fun b!383855 () Bool)

(declare-fun e!233075 () Bool)

(declare-fun e!233076 () Bool)

(declare-fun mapRes!15597 () Bool)

(assert (=> b!383855 (= e!233075 (and e!233076 mapRes!15597))))

(declare-fun condMapEmpty!15597 () Bool)

(declare-datatypes ((V!13579 0))(
  ( (V!13580 (val!4722 Int)) )
))
(declare-datatypes ((ValueCell!4334 0))(
  ( (ValueCellFull!4334 (v!6913 V!13579)) (EmptyCell!4334) )
))
(declare-datatypes ((array!22599 0))(
  ( (array!22600 (arr!10768 (Array (_ BitVec 32) ValueCell!4334)) (size!11121 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22599)

(declare-fun mapDefault!15597 () ValueCell!4334)

(assert (=> b!383855 (= condMapEmpty!15597 (= (arr!10768 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4334)) mapDefault!15597)))))

(declare-fun b!383856 () Bool)

(declare-fun e!233078 () Bool)

(declare-fun e!233072 () Bool)

(assert (=> b!383856 (= e!233078 e!233072)))

(declare-fun res!218730 () Bool)

(assert (=> b!383856 (=> res!218730 e!233072)))

(declare-datatypes ((tuple2!6338 0))(
  ( (tuple2!6339 (_1!3180 (_ BitVec 64)) (_2!3180 V!13579)) )
))
(declare-datatypes ((List!6160 0))(
  ( (Nil!6157) (Cons!6156 (h!7012 tuple2!6338) (t!11301 List!6160)) )
))
(declare-datatypes ((ListLongMap!5241 0))(
  ( (ListLongMap!5242 (toList!2636 List!6160)) )
))
(declare-fun lt!180417 () ListLongMap!5241)

(declare-fun lt!180421 () tuple2!6338)

(declare-fun lt!180425 () ListLongMap!5241)

(declare-fun +!993 (ListLongMap!5241 tuple2!6338) ListLongMap!5241)

(assert (=> b!383856 (= res!218730 (not (= (+!993 lt!180417 lt!180421) lt!180425)))))

(declare-fun lt!180422 () ListLongMap!5241)

(assert (=> b!383856 (= lt!180425 lt!180422)))

(declare-fun b!383857 () Bool)

(declare-fun res!218727 () Bool)

(declare-fun e!233074 () Bool)

(assert (=> b!383857 (=> (not res!218727) (not e!233074))))

(declare-datatypes ((array!22601 0))(
  ( (array!22602 (arr!10769 (Array (_ BitVec 32) (_ BitVec 64))) (size!11122 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22601)

(declare-datatypes ((List!6161 0))(
  ( (Nil!6158) (Cons!6157 (h!7013 (_ BitVec 64)) (t!11302 List!6161)) )
))
(declare-fun arrayNoDuplicates!0 (array!22601 (_ BitVec 32) List!6161) Bool)

(assert (=> b!383857 (= res!218727 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6158))))

(declare-fun b!383858 () Bool)

(declare-fun res!218723 () Bool)

(assert (=> b!383858 (=> (not res!218723) (not e!233074))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22601 (_ BitVec 32)) Bool)

(assert (=> b!383858 (= res!218723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15597 () Bool)

(assert (=> mapIsEmpty!15597 mapRes!15597))

(declare-fun b!383859 () Bool)

(declare-fun res!218729 () Bool)

(assert (=> b!383859 (=> (not res!218729) (not e!233074))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383859 (= res!218729 (validKeyInArray!0 k0!778))))

(declare-fun b!383860 () Bool)

(declare-fun res!218732 () Bool)

(assert (=> b!383860 (=> (not res!218732) (not e!233074))))

(declare-fun arrayContainsKey!0 (array!22601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383860 (= res!218732 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!383861 () Bool)

(declare-fun res!218726 () Bool)

(declare-fun e!233077 () Bool)

(assert (=> b!383861 (=> (not res!218726) (not e!233077))))

(declare-fun lt!180420 () array!22601)

(assert (=> b!383861 (= res!218726 (arrayNoDuplicates!0 lt!180420 #b00000000000000000000000000000000 Nil!6158))))

(declare-fun b!383862 () Bool)

(declare-fun e!233073 () Bool)

(declare-fun tp_is_empty!9355 () Bool)

(assert (=> b!383862 (= e!233073 tp_is_empty!9355)))

(declare-fun b!383863 () Bool)

(assert (=> b!383863 (= e!233072 (bvsle #b00000000000000000000000000000000 (size!11122 _keys!658)))))

(declare-fun res!218731 () Bool)

(assert (=> start!37566 (=> (not res!218731) (not e!233074))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37566 (= res!218731 (validMask!0 mask!970))))

(assert (=> start!37566 e!233074))

(declare-fun array_inv!7928 (array!22599) Bool)

(assert (=> start!37566 (and (array_inv!7928 _values!506) e!233075)))

(assert (=> start!37566 tp!30837))

(assert (=> start!37566 true))

(assert (=> start!37566 tp_is_empty!9355))

(declare-fun array_inv!7929 (array!22601) Bool)

(assert (=> start!37566 (array_inv!7929 _keys!658)))

(declare-fun b!383864 () Bool)

(assert (=> b!383864 (= e!233074 e!233077)))

(declare-fun res!218725 () Bool)

(assert (=> b!383864 (=> (not res!218725) (not e!233077))))

(assert (=> b!383864 (= res!218725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180420 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!383864 (= lt!180420 (array!22602 (store (arr!10769 _keys!658) i!548 k0!778) (size!11122 _keys!658)))))

(declare-fun b!383865 () Bool)

(declare-fun res!218721 () Bool)

(assert (=> b!383865 (=> (not res!218721) (not e!233074))))

(assert (=> b!383865 (= res!218721 (or (= (select (arr!10769 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10769 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!383866 () Bool)

(assert (=> b!383866 (= e!233076 tp_is_empty!9355)))

(declare-fun b!383867 () Bool)

(declare-fun res!218724 () Bool)

(assert (=> b!383867 (=> (not res!218724) (not e!233074))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!383867 (= res!218724 (and (= (size!11121 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11122 _keys!658) (size!11121 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!383868 () Bool)

(declare-fun res!218722 () Bool)

(assert (=> b!383868 (=> (not res!218722) (not e!233074))))

(assert (=> b!383868 (= res!218722 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11122 _keys!658))))))

(declare-fun mapNonEmpty!15597 () Bool)

(declare-fun tp!30836 () Bool)

(assert (=> mapNonEmpty!15597 (= mapRes!15597 (and tp!30836 e!233073))))

(declare-fun mapKey!15597 () (_ BitVec 32))

(declare-fun mapValue!15597 () ValueCell!4334)

(declare-fun mapRest!15597 () (Array (_ BitVec 32) ValueCell!4334))

(assert (=> mapNonEmpty!15597 (= (arr!10768 _values!506) (store mapRest!15597 mapKey!15597 mapValue!15597))))

(declare-fun b!383869 () Bool)

(assert (=> b!383869 (= e!233077 (not e!233078))))

(declare-fun res!218728 () Bool)

(assert (=> b!383869 (=> res!218728 e!233078)))

(declare-fun lt!180426 () Bool)

(assert (=> b!383869 (= res!218728 (or (and (not lt!180426) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180426) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180426)))))

(assert (=> b!383869 (= lt!180426 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13579)

(declare-fun minValue!472 () V!13579)

(declare-fun getCurrentListMap!2014 (array!22601 array!22599 (_ BitVec 32) (_ BitVec 32) V!13579 V!13579 (_ BitVec 32) Int) ListLongMap!5241)

(assert (=> b!383869 (= lt!180417 (getCurrentListMap!2014 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180424 () array!22599)

(assert (=> b!383869 (= lt!180425 (getCurrentListMap!2014 lt!180420 lt!180424 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180418 () ListLongMap!5241)

(assert (=> b!383869 (and (= lt!180422 lt!180418) (= lt!180418 lt!180422))))

(declare-fun lt!180419 () ListLongMap!5241)

(assert (=> b!383869 (= lt!180418 (+!993 lt!180419 lt!180421))))

(declare-fun v!373 () V!13579)

(assert (=> b!383869 (= lt!180421 (tuple2!6339 k0!778 v!373))))

(declare-datatypes ((Unit!11834 0))(
  ( (Unit!11835) )
))
(declare-fun lt!180423 () Unit!11834)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!207 (array!22601 array!22599 (_ BitVec 32) (_ BitVec 32) V!13579 V!13579 (_ BitVec 32) (_ BitVec 64) V!13579 (_ BitVec 32) Int) Unit!11834)

(assert (=> b!383869 (= lt!180423 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!207 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!879 (array!22601 array!22599 (_ BitVec 32) (_ BitVec 32) V!13579 V!13579 (_ BitVec 32) Int) ListLongMap!5241)

(assert (=> b!383869 (= lt!180422 (getCurrentListMapNoExtraKeys!879 lt!180420 lt!180424 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383869 (= lt!180424 (array!22600 (store (arr!10768 _values!506) i!548 (ValueCellFull!4334 v!373)) (size!11121 _values!506)))))

(assert (=> b!383869 (= lt!180419 (getCurrentListMapNoExtraKeys!879 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!37566 res!218731) b!383867))

(assert (= (and b!383867 res!218724) b!383858))

(assert (= (and b!383858 res!218723) b!383857))

(assert (= (and b!383857 res!218727) b!383868))

(assert (= (and b!383868 res!218722) b!383859))

(assert (= (and b!383859 res!218729) b!383865))

(assert (= (and b!383865 res!218721) b!383860))

(assert (= (and b!383860 res!218732) b!383864))

(assert (= (and b!383864 res!218725) b!383861))

(assert (= (and b!383861 res!218726) b!383869))

(assert (= (and b!383869 (not res!218728)) b!383856))

(assert (= (and b!383856 (not res!218730)) b!383863))

(assert (= (and b!383855 condMapEmpty!15597) mapIsEmpty!15597))

(assert (= (and b!383855 (not condMapEmpty!15597)) mapNonEmpty!15597))

(get-info :version)

(assert (= (and mapNonEmpty!15597 ((_ is ValueCellFull!4334) mapValue!15597)) b!383862))

(assert (= (and b!383855 ((_ is ValueCellFull!4334) mapDefault!15597)) b!383866))

(assert (= start!37566 b!383855))

(declare-fun m!380111 () Bool)

(assert (=> b!383861 m!380111))

(declare-fun m!380113 () Bool)

(assert (=> start!37566 m!380113))

(declare-fun m!380115 () Bool)

(assert (=> start!37566 m!380115))

(declare-fun m!380117 () Bool)

(assert (=> start!37566 m!380117))

(declare-fun m!380119 () Bool)

(assert (=> b!383860 m!380119))

(declare-fun m!380121 () Bool)

(assert (=> b!383857 m!380121))

(declare-fun m!380123 () Bool)

(assert (=> b!383856 m!380123))

(declare-fun m!380125 () Bool)

(assert (=> b!383864 m!380125))

(declare-fun m!380127 () Bool)

(assert (=> b!383864 m!380127))

(declare-fun m!380129 () Bool)

(assert (=> b!383865 m!380129))

(declare-fun m!380131 () Bool)

(assert (=> b!383859 m!380131))

(declare-fun m!380133 () Bool)

(assert (=> b!383858 m!380133))

(declare-fun m!380135 () Bool)

(assert (=> mapNonEmpty!15597 m!380135))

(declare-fun m!380137 () Bool)

(assert (=> b!383869 m!380137))

(declare-fun m!380139 () Bool)

(assert (=> b!383869 m!380139))

(declare-fun m!380141 () Bool)

(assert (=> b!383869 m!380141))

(declare-fun m!380143 () Bool)

(assert (=> b!383869 m!380143))

(declare-fun m!380145 () Bool)

(assert (=> b!383869 m!380145))

(declare-fun m!380147 () Bool)

(assert (=> b!383869 m!380147))

(declare-fun m!380149 () Bool)

(assert (=> b!383869 m!380149))

(check-sat (not b!383857) (not b!383869) b_and!15923 (not b!383861) (not b!383858) (not start!37566) (not mapNonEmpty!15597) (not b!383856) tp_is_empty!9355 (not b!383864) (not b_next!8707) (not b!383859) (not b!383860))
(check-sat b_and!15923 (not b_next!8707))
