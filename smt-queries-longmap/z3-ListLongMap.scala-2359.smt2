; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37602 () Bool)

(assert start!37602)

(declare-fun b_free!8743 () Bool)

(declare-fun b_next!8743 () Bool)

(assert (=> start!37602 (= b_free!8743 (not b_next!8743))))

(declare-fun tp!30945 () Bool)

(declare-fun b_and!15959 () Bool)

(assert (=> start!37602 (= tp!30945 b_and!15959)))

(declare-fun b!384618 () Bool)

(declare-fun e!233460 () Bool)

(assert (=> b!384618 (= e!233460 true)))

(declare-datatypes ((V!13627 0))(
  ( (V!13628 (val!4740 Int)) )
))
(declare-datatypes ((tuple2!6366 0))(
  ( (tuple2!6367 (_1!3194 (_ BitVec 64)) (_2!3194 V!13627)) )
))
(declare-datatypes ((List!6189 0))(
  ( (Nil!6186) (Cons!6185 (h!7041 tuple2!6366) (t!11330 List!6189)) )
))
(declare-datatypes ((ListLongMap!5269 0))(
  ( (ListLongMap!5270 (toList!2650 List!6189)) )
))
(declare-fun lt!181006 () ListLongMap!5269)

(declare-fun lt!181011 () ListLongMap!5269)

(declare-fun lt!181005 () tuple2!6366)

(declare-fun +!1007 (ListLongMap!5269 tuple2!6366) ListLongMap!5269)

(assert (=> b!384618 (= lt!181006 (+!1007 lt!181011 lt!181005))))

(declare-fun lt!181009 () ListLongMap!5269)

(declare-fun lt!181014 () ListLongMap!5269)

(assert (=> b!384618 (= lt!181009 lt!181014)))

(declare-fun b!384619 () Bool)

(declare-fun res!219328 () Bool)

(declare-fun e!233462 () Bool)

(assert (=> b!384619 (=> (not res!219328) (not e!233462))))

(declare-datatypes ((array!22671 0))(
  ( (array!22672 (arr!10804 (Array (_ BitVec 32) (_ BitVec 64))) (size!11157 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22671)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22671 (_ BitVec 32)) Bool)

(assert (=> b!384619 (= res!219328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!384620 () Bool)

(declare-fun e!233456 () Bool)

(declare-fun tp_is_empty!9391 () Bool)

(assert (=> b!384620 (= e!233456 tp_is_empty!9391)))

(declare-fun b!384621 () Bool)

(declare-fun res!219324 () Bool)

(assert (=> b!384621 (=> (not res!219324) (not e!233462))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!384621 (= res!219324 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11157 _keys!658))))))

(declare-fun b!384622 () Bool)

(declare-fun e!233458 () Bool)

(assert (=> b!384622 (= e!233458 tp_is_empty!9391)))

(declare-fun b!384623 () Bool)

(declare-fun res!219322 () Bool)

(assert (=> b!384623 (=> (not res!219322) (not e!233462))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4352 0))(
  ( (ValueCellFull!4352 (v!6931 V!13627)) (EmptyCell!4352) )
))
(declare-datatypes ((array!22673 0))(
  ( (array!22674 (arr!10805 (Array (_ BitVec 32) ValueCell!4352)) (size!11158 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22673)

(assert (=> b!384623 (= res!219322 (and (= (size!11158 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11157 _keys!658) (size!11158 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!384624 () Bool)

(declare-fun res!219327 () Bool)

(assert (=> b!384624 (=> (not res!219327) (not e!233462))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22671 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!384624 (= res!219327 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!219323 () Bool)

(assert (=> start!37602 (=> (not res!219323) (not e!233462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37602 (= res!219323 (validMask!0 mask!970))))

(assert (=> start!37602 e!233462))

(declare-fun e!233461 () Bool)

(declare-fun array_inv!7952 (array!22673) Bool)

(assert (=> start!37602 (and (array_inv!7952 _values!506) e!233461)))

(assert (=> start!37602 tp!30945))

(assert (=> start!37602 true))

(assert (=> start!37602 tp_is_empty!9391))

(declare-fun array_inv!7953 (array!22671) Bool)

(assert (=> start!37602 (array_inv!7953 _keys!658)))

(declare-fun b!384625 () Bool)

(declare-fun res!219331 () Bool)

(declare-fun e!233459 () Bool)

(assert (=> b!384625 (=> (not res!219331) (not e!233459))))

(declare-fun lt!181012 () array!22671)

(declare-datatypes ((List!6190 0))(
  ( (Nil!6187) (Cons!6186 (h!7042 (_ BitVec 64)) (t!11331 List!6190)) )
))
(declare-fun arrayNoDuplicates!0 (array!22671 (_ BitVec 32) List!6190) Bool)

(assert (=> b!384625 (= res!219331 (arrayNoDuplicates!0 lt!181012 #b00000000000000000000000000000000 Nil!6187))))

(declare-fun mapIsEmpty!15651 () Bool)

(declare-fun mapRes!15651 () Bool)

(assert (=> mapIsEmpty!15651 mapRes!15651))

(declare-fun b!384626 () Bool)

(assert (=> b!384626 (= e!233459 (not e!233460))))

(declare-fun res!219330 () Bool)

(assert (=> b!384626 (=> res!219330 e!233460)))

(declare-fun lt!181007 () Bool)

(assert (=> b!384626 (= res!219330 (or (and (not lt!181007) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!181007) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!181007)))))

(assert (=> b!384626 (= lt!181007 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13627)

(declare-fun minValue!472 () V!13627)

(declare-fun getCurrentListMap!2027 (array!22671 array!22673 (_ BitVec 32) (_ BitVec 32) V!13627 V!13627 (_ BitVec 32) Int) ListLongMap!5269)

(assert (=> b!384626 (= lt!181011 (getCurrentListMap!2027 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181008 () array!22673)

(assert (=> b!384626 (= lt!181009 (getCurrentListMap!2027 lt!181012 lt!181008 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181010 () ListLongMap!5269)

(assert (=> b!384626 (and (= lt!181014 lt!181010) (= lt!181010 lt!181014))))

(declare-fun lt!181004 () ListLongMap!5269)

(assert (=> b!384626 (= lt!181010 (+!1007 lt!181004 lt!181005))))

(declare-fun v!373 () V!13627)

(assert (=> b!384626 (= lt!181005 (tuple2!6367 k0!778 v!373))))

(declare-datatypes ((Unit!11860 0))(
  ( (Unit!11861) )
))
(declare-fun lt!181013 () Unit!11860)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!220 (array!22671 array!22673 (_ BitVec 32) (_ BitVec 32) V!13627 V!13627 (_ BitVec 32) (_ BitVec 64) V!13627 (_ BitVec 32) Int) Unit!11860)

(assert (=> b!384626 (= lt!181013 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!220 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!892 (array!22671 array!22673 (_ BitVec 32) (_ BitVec 32) V!13627 V!13627 (_ BitVec 32) Int) ListLongMap!5269)

(assert (=> b!384626 (= lt!181014 (getCurrentListMapNoExtraKeys!892 lt!181012 lt!181008 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!384626 (= lt!181008 (array!22674 (store (arr!10805 _values!506) i!548 (ValueCellFull!4352 v!373)) (size!11158 _values!506)))))

(assert (=> b!384626 (= lt!181004 (getCurrentListMapNoExtraKeys!892 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!384627 () Bool)

(declare-fun res!219326 () Bool)

(assert (=> b!384627 (=> (not res!219326) (not e!233462))))

(assert (=> b!384627 (= res!219326 (or (= (select (arr!10804 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10804 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!384628 () Bool)

(assert (=> b!384628 (= e!233462 e!233459)))

(declare-fun res!219325 () Bool)

(assert (=> b!384628 (=> (not res!219325) (not e!233459))))

(assert (=> b!384628 (= res!219325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181012 mask!970))))

(assert (=> b!384628 (= lt!181012 (array!22672 (store (arr!10804 _keys!658) i!548 k0!778) (size!11157 _keys!658)))))

(declare-fun mapNonEmpty!15651 () Bool)

(declare-fun tp!30944 () Bool)

(assert (=> mapNonEmpty!15651 (= mapRes!15651 (and tp!30944 e!233458))))

(declare-fun mapValue!15651 () ValueCell!4352)

(declare-fun mapKey!15651 () (_ BitVec 32))

(declare-fun mapRest!15651 () (Array (_ BitVec 32) ValueCell!4352))

(assert (=> mapNonEmpty!15651 (= (arr!10805 _values!506) (store mapRest!15651 mapKey!15651 mapValue!15651))))

(declare-fun b!384629 () Bool)

(declare-fun res!219332 () Bool)

(assert (=> b!384629 (=> (not res!219332) (not e!233462))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384629 (= res!219332 (validKeyInArray!0 k0!778))))

(declare-fun b!384630 () Bool)

(assert (=> b!384630 (= e!233461 (and e!233456 mapRes!15651))))

(declare-fun condMapEmpty!15651 () Bool)

(declare-fun mapDefault!15651 () ValueCell!4352)

(assert (=> b!384630 (= condMapEmpty!15651 (= (arr!10805 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4352)) mapDefault!15651)))))

(declare-fun b!384631 () Bool)

(declare-fun res!219329 () Bool)

(assert (=> b!384631 (=> (not res!219329) (not e!233462))))

(assert (=> b!384631 (= res!219329 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6187))))

(assert (= (and start!37602 res!219323) b!384623))

(assert (= (and b!384623 res!219322) b!384619))

(assert (= (and b!384619 res!219328) b!384631))

(assert (= (and b!384631 res!219329) b!384621))

(assert (= (and b!384621 res!219324) b!384629))

(assert (= (and b!384629 res!219332) b!384627))

(assert (= (and b!384627 res!219326) b!384624))

(assert (= (and b!384624 res!219327) b!384628))

(assert (= (and b!384628 res!219325) b!384625))

(assert (= (and b!384625 res!219331) b!384626))

(assert (= (and b!384626 (not res!219330)) b!384618))

(assert (= (and b!384630 condMapEmpty!15651) mapIsEmpty!15651))

(assert (= (and b!384630 (not condMapEmpty!15651)) mapNonEmpty!15651))

(get-info :version)

(assert (= (and mapNonEmpty!15651 ((_ is ValueCellFull!4352) mapValue!15651)) b!384622))

(assert (= (and b!384630 ((_ is ValueCellFull!4352) mapDefault!15651)) b!384620))

(assert (= start!37602 b!384630))

(declare-fun m!380831 () Bool)

(assert (=> start!37602 m!380831))

(declare-fun m!380833 () Bool)

(assert (=> start!37602 m!380833))

(declare-fun m!380835 () Bool)

(assert (=> start!37602 m!380835))

(declare-fun m!380837 () Bool)

(assert (=> b!384627 m!380837))

(declare-fun m!380839 () Bool)

(assert (=> mapNonEmpty!15651 m!380839))

(declare-fun m!380841 () Bool)

(assert (=> b!384626 m!380841))

(declare-fun m!380843 () Bool)

(assert (=> b!384626 m!380843))

(declare-fun m!380845 () Bool)

(assert (=> b!384626 m!380845))

(declare-fun m!380847 () Bool)

(assert (=> b!384626 m!380847))

(declare-fun m!380849 () Bool)

(assert (=> b!384626 m!380849))

(declare-fun m!380851 () Bool)

(assert (=> b!384626 m!380851))

(declare-fun m!380853 () Bool)

(assert (=> b!384626 m!380853))

(declare-fun m!380855 () Bool)

(assert (=> b!384628 m!380855))

(declare-fun m!380857 () Bool)

(assert (=> b!384628 m!380857))

(declare-fun m!380859 () Bool)

(assert (=> b!384619 m!380859))

(declare-fun m!380861 () Bool)

(assert (=> b!384625 m!380861))

(declare-fun m!380863 () Bool)

(assert (=> b!384631 m!380863))

(declare-fun m!380865 () Bool)

(assert (=> b!384624 m!380865))

(declare-fun m!380867 () Bool)

(assert (=> b!384618 m!380867))

(declare-fun m!380869 () Bool)

(assert (=> b!384629 m!380869))

(check-sat (not b!384628) (not b!384625) (not b_next!8743) (not b!384619) b_and!15959 (not b!384624) (not b!384629) (not mapNonEmpty!15651) (not b!384618) (not start!37602) tp_is_empty!9391 (not b!384626) (not b!384631))
(check-sat b_and!15959 (not b_next!8743))
