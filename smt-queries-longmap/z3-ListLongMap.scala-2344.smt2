; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37528 () Bool)

(assert start!37528)

(declare-fun b_free!8655 () Bool)

(declare-fun b_next!8655 () Bool)

(assert (=> start!37528 (= b_free!8655 (not b_next!8655))))

(declare-fun tp!30681 () Bool)

(declare-fun b_and!15897 () Bool)

(assert (=> start!37528 (= tp!30681 b_and!15897)))

(declare-fun b!383032 () Bool)

(declare-fun res!217998 () Bool)

(declare-fun e!232703 () Bool)

(assert (=> b!383032 (=> (not res!217998) (not e!232703))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13509 0))(
  ( (V!13510 (val!4696 Int)) )
))
(declare-datatypes ((ValueCell!4308 0))(
  ( (ValueCellFull!4308 (v!6893 V!13509)) (EmptyCell!4308) )
))
(declare-datatypes ((array!22513 0))(
  ( (array!22514 (arr!10725 (Array (_ BitVec 32) ValueCell!4308)) (size!11077 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22513)

(declare-datatypes ((array!22515 0))(
  ( (array!22516 (arr!10726 (Array (_ BitVec 32) (_ BitVec 64))) (size!11078 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22515)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!383032 (= res!217998 (and (= (size!11077 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11078 _keys!658) (size!11077 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!383033 () Bool)

(declare-fun e!232699 () Bool)

(assert (=> b!383033 (= e!232703 e!232699)))

(declare-fun res!217993 () Bool)

(assert (=> b!383033 (=> (not res!217993) (not e!232699))))

(declare-fun lt!179809 () array!22515)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22515 (_ BitVec 32)) Bool)

(assert (=> b!383033 (= res!217993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179809 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!383033 (= lt!179809 (array!22516 (store (arr!10726 _keys!658) i!548 k0!778) (size!11078 _keys!658)))))

(declare-fun res!217994 () Bool)

(assert (=> start!37528 (=> (not res!217994) (not e!232703))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37528 (= res!217994 (validMask!0 mask!970))))

(assert (=> start!37528 e!232703))

(declare-fun e!232701 () Bool)

(declare-fun array_inv!7896 (array!22513) Bool)

(assert (=> start!37528 (and (array_inv!7896 _values!506) e!232701)))

(assert (=> start!37528 tp!30681))

(assert (=> start!37528 true))

(declare-fun tp_is_empty!9303 () Bool)

(assert (=> start!37528 tp_is_empty!9303))

(declare-fun array_inv!7897 (array!22515) Bool)

(assert (=> start!37528 (array_inv!7897 _keys!658)))

(declare-fun b!383034 () Bool)

(declare-fun res!217996 () Bool)

(assert (=> b!383034 (=> (not res!217996) (not e!232703))))

(assert (=> b!383034 (= res!217996 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11078 _keys!658))))))

(declare-fun b!383035 () Bool)

(declare-fun e!232698 () Bool)

(assert (=> b!383035 (= e!232698 tp_is_empty!9303)))

(declare-fun b!383036 () Bool)

(declare-fun res!217999 () Bool)

(assert (=> b!383036 (=> (not res!217999) (not e!232703))))

(assert (=> b!383036 (= res!217999 (or (= (select (arr!10726 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10726 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!383037 () Bool)

(declare-fun res!217997 () Bool)

(assert (=> b!383037 (=> (not res!217997) (not e!232699))))

(declare-datatypes ((List!6148 0))(
  ( (Nil!6145) (Cons!6144 (h!7000 (_ BitVec 64)) (t!11298 List!6148)) )
))
(declare-fun arrayNoDuplicates!0 (array!22515 (_ BitVec 32) List!6148) Bool)

(assert (=> b!383037 (= res!217997 (arrayNoDuplicates!0 lt!179809 #b00000000000000000000000000000000 Nil!6145))))

(declare-fun mapIsEmpty!15519 () Bool)

(declare-fun mapRes!15519 () Bool)

(assert (=> mapIsEmpty!15519 mapRes!15519))

(declare-fun b!383038 () Bool)

(declare-fun res!217990 () Bool)

(assert (=> b!383038 (=> (not res!217990) (not e!232703))))

(declare-fun arrayContainsKey!0 (array!22515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383038 (= res!217990 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!383039 () Bool)

(declare-fun e!232702 () Bool)

(assert (=> b!383039 (= e!232699 (not e!232702))))

(declare-fun res!217992 () Bool)

(assert (=> b!383039 (=> res!217992 e!232702)))

(declare-fun lt!179804 () Bool)

(assert (=> b!383039 (= res!217992 (or (and (not lt!179804) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179804) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179804)))))

(assert (=> b!383039 (= lt!179804 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13509)

(declare-datatypes ((tuple2!6316 0))(
  ( (tuple2!6317 (_1!3169 (_ BitVec 64)) (_2!3169 V!13509)) )
))
(declare-datatypes ((List!6149 0))(
  ( (Nil!6146) (Cons!6145 (h!7001 tuple2!6316) (t!11299 List!6149)) )
))
(declare-datatypes ((ListLongMap!5229 0))(
  ( (ListLongMap!5230 (toList!2630 List!6149)) )
))
(declare-fun lt!179810 () ListLongMap!5229)

(declare-fun minValue!472 () V!13509)

(declare-fun getCurrentListMap!2035 (array!22515 array!22513 (_ BitVec 32) (_ BitVec 32) V!13509 V!13509 (_ BitVec 32) Int) ListLongMap!5229)

(assert (=> b!383039 (= lt!179810 (getCurrentListMap!2035 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179811 () ListLongMap!5229)

(declare-fun lt!179806 () array!22513)

(assert (=> b!383039 (= lt!179811 (getCurrentListMap!2035 lt!179809 lt!179806 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179807 () ListLongMap!5229)

(declare-fun lt!179805 () ListLongMap!5229)

(assert (=> b!383039 (and (= lt!179807 lt!179805) (= lt!179805 lt!179807))))

(declare-fun v!373 () V!13509)

(declare-fun lt!179808 () ListLongMap!5229)

(declare-fun +!965 (ListLongMap!5229 tuple2!6316) ListLongMap!5229)

(assert (=> b!383039 (= lt!179805 (+!965 lt!179808 (tuple2!6317 k0!778 v!373)))))

(declare-datatypes ((Unit!11824 0))(
  ( (Unit!11825) )
))
(declare-fun lt!179803 () Unit!11824)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!193 (array!22515 array!22513 (_ BitVec 32) (_ BitVec 32) V!13509 V!13509 (_ BitVec 32) (_ BitVec 64) V!13509 (_ BitVec 32) Int) Unit!11824)

(assert (=> b!383039 (= lt!179803 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!193 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!869 (array!22515 array!22513 (_ BitVec 32) (_ BitVec 32) V!13509 V!13509 (_ BitVec 32) Int) ListLongMap!5229)

(assert (=> b!383039 (= lt!179807 (getCurrentListMapNoExtraKeys!869 lt!179809 lt!179806 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383039 (= lt!179806 (array!22514 (store (arr!10725 _values!506) i!548 (ValueCellFull!4308 v!373)) (size!11077 _values!506)))))

(assert (=> b!383039 (= lt!179808 (getCurrentListMapNoExtraKeys!869 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!383040 () Bool)

(declare-fun e!232697 () Bool)

(assert (=> b!383040 (= e!232701 (and e!232697 mapRes!15519))))

(declare-fun condMapEmpty!15519 () Bool)

(declare-fun mapDefault!15519 () ValueCell!4308)

(assert (=> b!383040 (= condMapEmpty!15519 (= (arr!10725 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4308)) mapDefault!15519)))))

(declare-fun b!383041 () Bool)

(declare-fun res!218000 () Bool)

(assert (=> b!383041 (=> (not res!218000) (not e!232703))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383041 (= res!218000 (validKeyInArray!0 k0!778))))

(declare-fun b!383042 () Bool)

(assert (=> b!383042 (= e!232697 tp_is_empty!9303)))

(declare-fun b!383043 () Bool)

(assert (=> b!383043 (= e!232702 (bvsle #b00000000000000000000000000000000 (size!11078 _keys!658)))))

(assert (=> b!383043 (= lt!179811 lt!179807)))

(declare-fun b!383044 () Bool)

(declare-fun res!217995 () Bool)

(assert (=> b!383044 (=> (not res!217995) (not e!232703))))

(assert (=> b!383044 (= res!217995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!15519 () Bool)

(declare-fun tp!30680 () Bool)

(assert (=> mapNonEmpty!15519 (= mapRes!15519 (and tp!30680 e!232698))))

(declare-fun mapValue!15519 () ValueCell!4308)

(declare-fun mapRest!15519 () (Array (_ BitVec 32) ValueCell!4308))

(declare-fun mapKey!15519 () (_ BitVec 32))

(assert (=> mapNonEmpty!15519 (= (arr!10725 _values!506) (store mapRest!15519 mapKey!15519 mapValue!15519))))

(declare-fun b!383045 () Bool)

(declare-fun res!217991 () Bool)

(assert (=> b!383045 (=> (not res!217991) (not e!232703))))

(assert (=> b!383045 (= res!217991 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6145))))

(assert (= (and start!37528 res!217994) b!383032))

(assert (= (and b!383032 res!217998) b!383044))

(assert (= (and b!383044 res!217995) b!383045))

(assert (= (and b!383045 res!217991) b!383034))

(assert (= (and b!383034 res!217996) b!383041))

(assert (= (and b!383041 res!218000) b!383036))

(assert (= (and b!383036 res!217999) b!383038))

(assert (= (and b!383038 res!217990) b!383033))

(assert (= (and b!383033 res!217993) b!383037))

(assert (= (and b!383037 res!217997) b!383039))

(assert (= (and b!383039 (not res!217992)) b!383043))

(assert (= (and b!383040 condMapEmpty!15519) mapIsEmpty!15519))

(assert (= (and b!383040 (not condMapEmpty!15519)) mapNonEmpty!15519))

(get-info :version)

(assert (= (and mapNonEmpty!15519 ((_ is ValueCellFull!4308) mapValue!15519)) b!383035))

(assert (= (and b!383040 ((_ is ValueCellFull!4308) mapDefault!15519)) b!383042))

(assert (= start!37528 b!383040))

(declare-fun m!379799 () Bool)

(assert (=> b!383037 m!379799))

(declare-fun m!379801 () Bool)

(assert (=> b!383045 m!379801))

(declare-fun m!379803 () Bool)

(assert (=> b!383041 m!379803))

(declare-fun m!379805 () Bool)

(assert (=> b!383044 m!379805))

(declare-fun m!379807 () Bool)

(assert (=> mapNonEmpty!15519 m!379807))

(declare-fun m!379809 () Bool)

(assert (=> b!383039 m!379809))

(declare-fun m!379811 () Bool)

(assert (=> b!383039 m!379811))

(declare-fun m!379813 () Bool)

(assert (=> b!383039 m!379813))

(declare-fun m!379815 () Bool)

(assert (=> b!383039 m!379815))

(declare-fun m!379817 () Bool)

(assert (=> b!383039 m!379817))

(declare-fun m!379819 () Bool)

(assert (=> b!383039 m!379819))

(declare-fun m!379821 () Bool)

(assert (=> b!383039 m!379821))

(declare-fun m!379823 () Bool)

(assert (=> b!383033 m!379823))

(declare-fun m!379825 () Bool)

(assert (=> b!383033 m!379825))

(declare-fun m!379827 () Bool)

(assert (=> b!383038 m!379827))

(declare-fun m!379829 () Bool)

(assert (=> b!383036 m!379829))

(declare-fun m!379831 () Bool)

(assert (=> start!37528 m!379831))

(declare-fun m!379833 () Bool)

(assert (=> start!37528 m!379833))

(declare-fun m!379835 () Bool)

(assert (=> start!37528 m!379835))

(check-sat (not mapNonEmpty!15519) (not b!383038) b_and!15897 (not b_next!8655) (not b!383045) (not b!383039) tp_is_empty!9303 (not b!383041) (not b!383033) (not b!383044) (not start!37528) (not b!383037))
(check-sat b_and!15897 (not b_next!8655))
