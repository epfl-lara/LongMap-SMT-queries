; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37056 () Bool)

(assert start!37056)

(declare-fun b_free!8197 () Bool)

(declare-fun b_next!8197 () Bool)

(assert (=> start!37056 (= b_free!8197 (not b_next!8197))))

(declare-fun tp!29306 () Bool)

(declare-fun b_and!15453 () Bool)

(assert (=> start!37056 (= tp!29306 b_and!15453)))

(declare-fun mapNonEmpty!14832 () Bool)

(declare-fun mapRes!14832 () Bool)

(declare-fun tp!29307 () Bool)

(declare-fun e!227355 () Bool)

(assert (=> mapNonEmpty!14832 (= mapRes!14832 (and tp!29307 e!227355))))

(declare-datatypes ((V!12899 0))(
  ( (V!12900 (val!4467 Int)) )
))
(declare-datatypes ((ValueCell!4079 0))(
  ( (ValueCellFull!4079 (v!6665 V!12899)) (EmptyCell!4079) )
))
(declare-datatypes ((array!21612 0))(
  ( (array!21613 (arr!10274 (Array (_ BitVec 32) ValueCell!4079)) (size!10626 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21612)

(declare-fun mapValue!14832 () ValueCell!4079)

(declare-fun mapKey!14832 () (_ BitVec 32))

(declare-fun mapRest!14832 () (Array (_ BitVec 32) ValueCell!4079))

(assert (=> mapNonEmpty!14832 (= (arr!10274 _values!506) (store mapRest!14832 mapKey!14832 mapValue!14832))))

(declare-fun b!372832 () Bool)

(declare-fun e!227351 () Bool)

(declare-datatypes ((array!21614 0))(
  ( (array!21615 (arr!10275 (Array (_ BitVec 32) (_ BitVec 64))) (size!10627 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21614)

(assert (=> b!372832 (= e!227351 (not (bvsle #b00000000000000000000000000000000 (size!10627 _keys!658))))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun lt!171012 () array!21612)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5826 0))(
  ( (tuple2!5827 (_1!2924 (_ BitVec 64)) (_2!2924 V!12899)) )
))
(declare-datatypes ((List!5671 0))(
  ( (Nil!5668) (Cons!5667 (h!6523 tuple2!5826) (t!10813 List!5671)) )
))
(declare-datatypes ((ListLongMap!4741 0))(
  ( (ListLongMap!4742 (toList!2386 List!5671)) )
))
(declare-fun lt!171007 () ListLongMap!4741)

(declare-fun zeroValue!472 () V!12899)

(declare-fun lt!171010 () array!21614)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!12899)

(declare-fun getCurrentListMap!1848 (array!21614 array!21612 (_ BitVec 32) (_ BitVec 32) V!12899 V!12899 (_ BitVec 32) Int) ListLongMap!4741)

(assert (=> b!372832 (= lt!171007 (getCurrentListMap!1848 lt!171010 lt!171012 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171013 () ListLongMap!4741)

(declare-fun lt!171008 () ListLongMap!4741)

(assert (=> b!372832 (and (= lt!171013 lt!171008) (= lt!171008 lt!171013))))

(declare-fun v!373 () V!12899)

(declare-fun lt!171011 () ListLongMap!4741)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun +!782 (ListLongMap!4741 tuple2!5826) ListLongMap!4741)

(assert (=> b!372832 (= lt!171008 (+!782 lt!171011 (tuple2!5827 k0!778 v!373)))))

(declare-datatypes ((Unit!11455 0))(
  ( (Unit!11456) )
))
(declare-fun lt!171009 () Unit!11455)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!35 (array!21614 array!21612 (_ BitVec 32) (_ BitVec 32) V!12899 V!12899 (_ BitVec 32) (_ BitVec 64) V!12899 (_ BitVec 32) Int) Unit!11455)

(assert (=> b!372832 (= lt!171009 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!35 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!695 (array!21614 array!21612 (_ BitVec 32) (_ BitVec 32) V!12899 V!12899 (_ BitVec 32) Int) ListLongMap!4741)

(assert (=> b!372832 (= lt!171013 (getCurrentListMapNoExtraKeys!695 lt!171010 lt!171012 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372832 (= lt!171012 (array!21613 (store (arr!10274 _values!506) i!548 (ValueCellFull!4079 v!373)) (size!10626 _values!506)))))

(assert (=> b!372832 (= lt!171011 (getCurrentListMapNoExtraKeys!695 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!372833 () Bool)

(declare-fun res!209901 () Bool)

(assert (=> b!372833 (=> (not res!209901) (not e!227351))))

(declare-datatypes ((List!5672 0))(
  ( (Nil!5669) (Cons!5668 (h!6524 (_ BitVec 64)) (t!10814 List!5672)) )
))
(declare-fun arrayNoDuplicates!0 (array!21614 (_ BitVec 32) List!5672) Bool)

(assert (=> b!372833 (= res!209901 (arrayNoDuplicates!0 lt!171010 #b00000000000000000000000000000000 Nil!5669))))

(declare-fun b!372834 () Bool)

(declare-fun res!209900 () Bool)

(declare-fun e!227354 () Bool)

(assert (=> b!372834 (=> (not res!209900) (not e!227354))))

(assert (=> b!372834 (= res!209900 (or (= (select (arr!10275 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10275 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!372835 () Bool)

(declare-fun res!209897 () Bool)

(assert (=> b!372835 (=> (not res!209897) (not e!227354))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372835 (= res!209897 (validKeyInArray!0 k0!778))))

(declare-fun b!372836 () Bool)

(declare-fun e!227350 () Bool)

(declare-fun tp_is_empty!8845 () Bool)

(assert (=> b!372836 (= e!227350 tp_is_empty!8845)))

(declare-fun b!372837 () Bool)

(declare-fun res!209898 () Bool)

(assert (=> b!372837 (=> (not res!209898) (not e!227354))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21614 (_ BitVec 32)) Bool)

(assert (=> b!372837 (= res!209898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!372838 () Bool)

(declare-fun res!209902 () Bool)

(assert (=> b!372838 (=> (not res!209902) (not e!227354))))

(assert (=> b!372838 (= res!209902 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10627 _keys!658))))))

(declare-fun b!372839 () Bool)

(declare-fun res!209904 () Bool)

(assert (=> b!372839 (=> (not res!209904) (not e!227354))))

(declare-fun arrayContainsKey!0 (array!21614 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372839 (= res!209904 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!372840 () Bool)

(assert (=> b!372840 (= e!227355 tp_is_empty!8845)))

(declare-fun b!372841 () Bool)

(declare-fun res!209899 () Bool)

(assert (=> b!372841 (=> (not res!209899) (not e!227354))))

(assert (=> b!372841 (= res!209899 (and (= (size!10626 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10627 _keys!658) (size!10626 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!372842 () Bool)

(assert (=> b!372842 (= e!227354 e!227351)))

(declare-fun res!209903 () Bool)

(assert (=> b!372842 (=> (not res!209903) (not e!227351))))

(assert (=> b!372842 (= res!209903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171010 mask!970))))

(assert (=> b!372842 (= lt!171010 (array!21615 (store (arr!10275 _keys!658) i!548 k0!778) (size!10627 _keys!658)))))

(declare-fun res!209905 () Bool)

(assert (=> start!37056 (=> (not res!209905) (not e!227354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37056 (= res!209905 (validMask!0 mask!970))))

(assert (=> start!37056 e!227354))

(declare-fun e!227353 () Bool)

(declare-fun array_inv!7622 (array!21612) Bool)

(assert (=> start!37056 (and (array_inv!7622 _values!506) e!227353)))

(assert (=> start!37056 tp!29306))

(assert (=> start!37056 true))

(assert (=> start!37056 tp_is_empty!8845))

(declare-fun array_inv!7623 (array!21614) Bool)

(assert (=> start!37056 (array_inv!7623 _keys!658)))

(declare-fun b!372843 () Bool)

(assert (=> b!372843 (= e!227353 (and e!227350 mapRes!14832))))

(declare-fun condMapEmpty!14832 () Bool)

(declare-fun mapDefault!14832 () ValueCell!4079)

(assert (=> b!372843 (= condMapEmpty!14832 (= (arr!10274 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4079)) mapDefault!14832)))))

(declare-fun b!372844 () Bool)

(declare-fun res!209906 () Bool)

(assert (=> b!372844 (=> (not res!209906) (not e!227354))))

(assert (=> b!372844 (= res!209906 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5669))))

(declare-fun mapIsEmpty!14832 () Bool)

(assert (=> mapIsEmpty!14832 mapRes!14832))

(assert (= (and start!37056 res!209905) b!372841))

(assert (= (and b!372841 res!209899) b!372837))

(assert (= (and b!372837 res!209898) b!372844))

(assert (= (and b!372844 res!209906) b!372838))

(assert (= (and b!372838 res!209902) b!372835))

(assert (= (and b!372835 res!209897) b!372834))

(assert (= (and b!372834 res!209900) b!372839))

(assert (= (and b!372839 res!209904) b!372842))

(assert (= (and b!372842 res!209903) b!372833))

(assert (= (and b!372833 res!209901) b!372832))

(assert (= (and b!372843 condMapEmpty!14832) mapIsEmpty!14832))

(assert (= (and b!372843 (not condMapEmpty!14832)) mapNonEmpty!14832))

(get-info :version)

(assert (= (and mapNonEmpty!14832 ((_ is ValueCellFull!4079) mapValue!14832)) b!372840))

(assert (= (and b!372843 ((_ is ValueCellFull!4079) mapDefault!14832)) b!372836))

(assert (= start!37056 b!372843))

(declare-fun m!368945 () Bool)

(assert (=> b!372832 m!368945))

(declare-fun m!368947 () Bool)

(assert (=> b!372832 m!368947))

(declare-fun m!368949 () Bool)

(assert (=> b!372832 m!368949))

(declare-fun m!368951 () Bool)

(assert (=> b!372832 m!368951))

(declare-fun m!368953 () Bool)

(assert (=> b!372832 m!368953))

(declare-fun m!368955 () Bool)

(assert (=> b!372832 m!368955))

(declare-fun m!368957 () Bool)

(assert (=> b!372842 m!368957))

(declare-fun m!368959 () Bool)

(assert (=> b!372842 m!368959))

(declare-fun m!368961 () Bool)

(assert (=> b!372837 m!368961))

(declare-fun m!368963 () Bool)

(assert (=> b!372835 m!368963))

(declare-fun m!368965 () Bool)

(assert (=> b!372844 m!368965))

(declare-fun m!368967 () Bool)

(assert (=> start!37056 m!368967))

(declare-fun m!368969 () Bool)

(assert (=> start!37056 m!368969))

(declare-fun m!368971 () Bool)

(assert (=> start!37056 m!368971))

(declare-fun m!368973 () Bool)

(assert (=> b!372839 m!368973))

(declare-fun m!368975 () Bool)

(assert (=> mapNonEmpty!14832 m!368975))

(declare-fun m!368977 () Bool)

(assert (=> b!372833 m!368977))

(declare-fun m!368979 () Bool)

(assert (=> b!372834 m!368979))

(check-sat (not b!372833) (not start!37056) (not b_next!8197) (not b!372832) (not b!372844) (not b!372835) (not b!372842) (not b!372837) tp_is_empty!8845 (not mapNonEmpty!14832) b_and!15453 (not b!372839))
(check-sat b_and!15453 (not b_next!8197))
