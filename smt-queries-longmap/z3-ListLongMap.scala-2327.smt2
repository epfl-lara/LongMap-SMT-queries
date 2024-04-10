; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37426 () Bool)

(assert start!37426)

(declare-fun b_free!8553 () Bool)

(declare-fun b_next!8553 () Bool)

(assert (=> start!37426 (= b_free!8553 (not b_next!8553))))

(declare-fun tp!30374 () Bool)

(declare-fun b_and!15795 () Bool)

(assert (=> start!37426 (= tp!30374 b_and!15795)))

(declare-fun b!380890 () Bool)

(declare-fun res!216313 () Bool)

(declare-fun e!231627 () Bool)

(assert (=> b!380890 (=> (not res!216313) (not e!231627))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!380890 (= res!216313 (validKeyInArray!0 k0!778))))

(declare-fun b!380891 () Bool)

(declare-fun res!216307 () Bool)

(assert (=> b!380891 (=> (not res!216307) (not e!231627))))

(declare-datatypes ((array!22321 0))(
  ( (array!22322 (arr!10629 (Array (_ BitVec 32) (_ BitVec 64))) (size!10981 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22321)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22321 (_ BitVec 32)) Bool)

(assert (=> b!380891 (= res!216307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15366 () Bool)

(declare-fun mapRes!15366 () Bool)

(assert (=> mapIsEmpty!15366 mapRes!15366))

(declare-fun b!380893 () Bool)

(declare-fun e!231626 () Bool)

(declare-fun e!231630 () Bool)

(assert (=> b!380893 (= e!231626 (and e!231630 mapRes!15366))))

(declare-fun condMapEmpty!15366 () Bool)

(declare-datatypes ((V!13373 0))(
  ( (V!13374 (val!4645 Int)) )
))
(declare-datatypes ((ValueCell!4257 0))(
  ( (ValueCellFull!4257 (v!6842 V!13373)) (EmptyCell!4257) )
))
(declare-datatypes ((array!22323 0))(
  ( (array!22324 (arr!10630 (Array (_ BitVec 32) ValueCell!4257)) (size!10982 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22323)

(declare-fun mapDefault!15366 () ValueCell!4257)

(assert (=> b!380893 (= condMapEmpty!15366 (= (arr!10630 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4257)) mapDefault!15366)))))

(declare-fun b!380894 () Bool)

(declare-fun e!231632 () Bool)

(declare-fun e!231629 () Bool)

(assert (=> b!380894 (= e!231632 (not e!231629))))

(declare-fun res!216312 () Bool)

(assert (=> b!380894 (=> res!216312 e!231629)))

(declare-fun lt!178430 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!380894 (= res!216312 (or (and (not lt!178430) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178430) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178430)))))

(assert (=> b!380894 (= lt!178430 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6232 0))(
  ( (tuple2!6233 (_1!3127 (_ BitVec 64)) (_2!3127 V!13373)) )
))
(declare-datatypes ((List!6066 0))(
  ( (Nil!6063) (Cons!6062 (h!6918 tuple2!6232) (t!11216 List!6066)) )
))
(declare-datatypes ((ListLongMap!5145 0))(
  ( (ListLongMap!5146 (toList!2588 List!6066)) )
))
(declare-fun lt!178429 () ListLongMap!5145)

(declare-fun zeroValue!472 () V!13373)

(declare-fun minValue!472 () V!13373)

(declare-fun getCurrentListMap!2004 (array!22321 array!22323 (_ BitVec 32) (_ BitVec 32) V!13373 V!13373 (_ BitVec 32) Int) ListLongMap!5145)

(assert (=> b!380894 (= lt!178429 (getCurrentListMap!2004 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178426 () array!22321)

(declare-fun lt!178431 () array!22323)

(declare-fun lt!178428 () ListLongMap!5145)

(assert (=> b!380894 (= lt!178428 (getCurrentListMap!2004 lt!178426 lt!178431 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178427 () ListLongMap!5145)

(declare-fun lt!178432 () ListLongMap!5145)

(assert (=> b!380894 (and (= lt!178427 lt!178432) (= lt!178432 lt!178427))))

(declare-fun lt!178434 () ListLongMap!5145)

(declare-fun v!373 () V!13373)

(declare-fun +!934 (ListLongMap!5145 tuple2!6232) ListLongMap!5145)

(assert (=> b!380894 (= lt!178432 (+!934 lt!178434 (tuple2!6233 k0!778 v!373)))))

(declare-datatypes ((Unit!11762 0))(
  ( (Unit!11763) )
))
(declare-fun lt!178433 () Unit!11762)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!162 (array!22321 array!22323 (_ BitVec 32) (_ BitVec 32) V!13373 V!13373 (_ BitVec 32) (_ BitVec 64) V!13373 (_ BitVec 32) Int) Unit!11762)

(assert (=> b!380894 (= lt!178433 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!162 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!838 (array!22321 array!22323 (_ BitVec 32) (_ BitVec 32) V!13373 V!13373 (_ BitVec 32) Int) ListLongMap!5145)

(assert (=> b!380894 (= lt!178427 (getCurrentListMapNoExtraKeys!838 lt!178426 lt!178431 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380894 (= lt!178431 (array!22324 (store (arr!10630 _values!506) i!548 (ValueCellFull!4257 v!373)) (size!10982 _values!506)))))

(assert (=> b!380894 (= lt!178434 (getCurrentListMapNoExtraKeys!838 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!380895 () Bool)

(assert (=> b!380895 (= e!231629 true)))

(assert (=> b!380895 (= lt!178428 lt!178427)))

(declare-fun b!380892 () Bool)

(declare-fun res!216310 () Bool)

(assert (=> b!380892 (=> (not res!216310) (not e!231627))))

(declare-datatypes ((List!6067 0))(
  ( (Nil!6064) (Cons!6063 (h!6919 (_ BitVec 64)) (t!11217 List!6067)) )
))
(declare-fun arrayNoDuplicates!0 (array!22321 (_ BitVec 32) List!6067) Bool)

(assert (=> b!380892 (= res!216310 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6064))))

(declare-fun res!216311 () Bool)

(assert (=> start!37426 (=> (not res!216311) (not e!231627))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37426 (= res!216311 (validMask!0 mask!970))))

(assert (=> start!37426 e!231627))

(declare-fun array_inv!7826 (array!22323) Bool)

(assert (=> start!37426 (and (array_inv!7826 _values!506) e!231626)))

(assert (=> start!37426 tp!30374))

(assert (=> start!37426 true))

(declare-fun tp_is_empty!9201 () Bool)

(assert (=> start!37426 tp_is_empty!9201))

(declare-fun array_inv!7827 (array!22321) Bool)

(assert (=> start!37426 (array_inv!7827 _keys!658)))

(declare-fun b!380896 () Bool)

(declare-fun res!216317 () Bool)

(assert (=> b!380896 (=> (not res!216317) (not e!231632))))

(assert (=> b!380896 (= res!216317 (arrayNoDuplicates!0 lt!178426 #b00000000000000000000000000000000 Nil!6064))))

(declare-fun b!380897 () Bool)

(declare-fun res!216314 () Bool)

(assert (=> b!380897 (=> (not res!216314) (not e!231627))))

(declare-fun arrayContainsKey!0 (array!22321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380897 (= res!216314 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!380898 () Bool)

(assert (=> b!380898 (= e!231627 e!231632)))

(declare-fun res!216309 () Bool)

(assert (=> b!380898 (=> (not res!216309) (not e!231632))))

(assert (=> b!380898 (= res!216309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178426 mask!970))))

(assert (=> b!380898 (= lt!178426 (array!22322 (store (arr!10629 _keys!658) i!548 k0!778) (size!10981 _keys!658)))))

(declare-fun b!380899 () Bool)

(declare-fun res!216308 () Bool)

(assert (=> b!380899 (=> (not res!216308) (not e!231627))))

(assert (=> b!380899 (= res!216308 (and (= (size!10982 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10981 _keys!658) (size!10982 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!380900 () Bool)

(declare-fun res!216316 () Bool)

(assert (=> b!380900 (=> (not res!216316) (not e!231627))))

(assert (=> b!380900 (= res!216316 (or (= (select (arr!10629 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10629 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!380901 () Bool)

(declare-fun res!216315 () Bool)

(assert (=> b!380901 (=> (not res!216315) (not e!231627))))

(assert (=> b!380901 (= res!216315 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10981 _keys!658))))))

(declare-fun mapNonEmpty!15366 () Bool)

(declare-fun tp!30375 () Bool)

(declare-fun e!231631 () Bool)

(assert (=> mapNonEmpty!15366 (= mapRes!15366 (and tp!30375 e!231631))))

(declare-fun mapKey!15366 () (_ BitVec 32))

(declare-fun mapRest!15366 () (Array (_ BitVec 32) ValueCell!4257))

(declare-fun mapValue!15366 () ValueCell!4257)

(assert (=> mapNonEmpty!15366 (= (arr!10630 _values!506) (store mapRest!15366 mapKey!15366 mapValue!15366))))

(declare-fun b!380902 () Bool)

(assert (=> b!380902 (= e!231631 tp_is_empty!9201)))

(declare-fun b!380903 () Bool)

(assert (=> b!380903 (= e!231630 tp_is_empty!9201)))

(assert (= (and start!37426 res!216311) b!380899))

(assert (= (and b!380899 res!216308) b!380891))

(assert (= (and b!380891 res!216307) b!380892))

(assert (= (and b!380892 res!216310) b!380901))

(assert (= (and b!380901 res!216315) b!380890))

(assert (= (and b!380890 res!216313) b!380900))

(assert (= (and b!380900 res!216316) b!380897))

(assert (= (and b!380897 res!216314) b!380898))

(assert (= (and b!380898 res!216309) b!380896))

(assert (= (and b!380896 res!216317) b!380894))

(assert (= (and b!380894 (not res!216312)) b!380895))

(assert (= (and b!380893 condMapEmpty!15366) mapIsEmpty!15366))

(assert (= (and b!380893 (not condMapEmpty!15366)) mapNonEmpty!15366))

(get-info :version)

(assert (= (and mapNonEmpty!15366 ((_ is ValueCellFull!4257) mapValue!15366)) b!380902))

(assert (= (and b!380893 ((_ is ValueCellFull!4257) mapDefault!15366)) b!380903))

(assert (= start!37426 b!380893))

(declare-fun m!377861 () Bool)

(assert (=> b!380896 m!377861))

(declare-fun m!377863 () Bool)

(assert (=> b!380891 m!377863))

(declare-fun m!377865 () Bool)

(assert (=> b!380897 m!377865))

(declare-fun m!377867 () Bool)

(assert (=> start!37426 m!377867))

(declare-fun m!377869 () Bool)

(assert (=> start!37426 m!377869))

(declare-fun m!377871 () Bool)

(assert (=> start!37426 m!377871))

(declare-fun m!377873 () Bool)

(assert (=> b!380898 m!377873))

(declare-fun m!377875 () Bool)

(assert (=> b!380898 m!377875))

(declare-fun m!377877 () Bool)

(assert (=> b!380892 m!377877))

(declare-fun m!377879 () Bool)

(assert (=> mapNonEmpty!15366 m!377879))

(declare-fun m!377881 () Bool)

(assert (=> b!380900 m!377881))

(declare-fun m!377883 () Bool)

(assert (=> b!380890 m!377883))

(declare-fun m!377885 () Bool)

(assert (=> b!380894 m!377885))

(declare-fun m!377887 () Bool)

(assert (=> b!380894 m!377887))

(declare-fun m!377889 () Bool)

(assert (=> b!380894 m!377889))

(declare-fun m!377891 () Bool)

(assert (=> b!380894 m!377891))

(declare-fun m!377893 () Bool)

(assert (=> b!380894 m!377893))

(declare-fun m!377895 () Bool)

(assert (=> b!380894 m!377895))

(declare-fun m!377897 () Bool)

(assert (=> b!380894 m!377897))

(check-sat (not mapNonEmpty!15366) tp_is_empty!9201 (not b!380891) (not b!380890) (not b!380898) (not b!380896) (not b_next!8553) (not b!380892) (not b!380894) b_and!15795 (not b!380897) (not start!37426))
(check-sat b_and!15795 (not b_next!8553))
