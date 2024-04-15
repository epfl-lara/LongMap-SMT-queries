; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37056 () Bool)

(assert start!37056)

(declare-fun b_free!8197 () Bool)

(declare-fun b_next!8197 () Bool)

(assert (=> start!37056 (= b_free!8197 (not b_next!8197))))

(declare-fun tp!29307 () Bool)

(declare-fun b_and!15413 () Bool)

(assert (=> start!37056 (= tp!29307 b_and!15413)))

(declare-fun b!372610 () Bool)

(declare-fun res!209777 () Bool)

(declare-fun e!227209 () Bool)

(assert (=> b!372610 (=> (not res!209777) (not e!227209))))

(declare-datatypes ((array!21613 0))(
  ( (array!21614 (arr!10275 (Array (_ BitVec 32) (_ BitVec 64))) (size!10628 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21613)

(declare-datatypes ((List!5736 0))(
  ( (Nil!5733) (Cons!5732 (h!6588 (_ BitVec 64)) (t!10877 List!5736)) )
))
(declare-fun arrayNoDuplicates!0 (array!21613 (_ BitVec 32) List!5736) Bool)

(assert (=> b!372610 (= res!209777 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5733))))

(declare-fun mapNonEmpty!14832 () Bool)

(declare-fun mapRes!14832 () Bool)

(declare-fun tp!29306 () Bool)

(declare-fun e!227208 () Bool)

(assert (=> mapNonEmpty!14832 (= mapRes!14832 (and tp!29306 e!227208))))

(declare-datatypes ((V!12899 0))(
  ( (V!12900 (val!4467 Int)) )
))
(declare-datatypes ((ValueCell!4079 0))(
  ( (ValueCellFull!4079 (v!6658 V!12899)) (EmptyCell!4079) )
))
(declare-datatypes ((array!21615 0))(
  ( (array!21616 (arr!10276 (Array (_ BitVec 32) ValueCell!4079)) (size!10629 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21615)

(declare-fun mapRest!14832 () (Array (_ BitVec 32) ValueCell!4079))

(declare-fun mapValue!14832 () ValueCell!4079)

(declare-fun mapKey!14832 () (_ BitVec 32))

(assert (=> mapNonEmpty!14832 (= (arr!10276 _values!506) (store mapRest!14832 mapKey!14832 mapValue!14832))))

(declare-fun b!372611 () Bool)

(declare-fun tp_is_empty!8845 () Bool)

(assert (=> b!372611 (= e!227208 tp_is_empty!8845)))

(declare-fun mapIsEmpty!14832 () Bool)

(assert (=> mapIsEmpty!14832 mapRes!14832))

(declare-fun res!209780 () Bool)

(assert (=> start!37056 (=> (not res!209780) (not e!227209))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37056 (= res!209780 (validMask!0 mask!970))))

(assert (=> start!37056 e!227209))

(declare-fun e!227211 () Bool)

(declare-fun array_inv!7586 (array!21615) Bool)

(assert (=> start!37056 (and (array_inv!7586 _values!506) e!227211)))

(assert (=> start!37056 tp!29307))

(assert (=> start!37056 true))

(assert (=> start!37056 tp_is_empty!8845))

(declare-fun array_inv!7587 (array!21613) Bool)

(assert (=> start!37056 (array_inv!7587 _keys!658)))

(declare-fun b!372612 () Bool)

(declare-fun e!227213 () Bool)

(assert (=> b!372612 (= e!227211 (and e!227213 mapRes!14832))))

(declare-fun condMapEmpty!14832 () Bool)

(declare-fun mapDefault!14832 () ValueCell!4079)

(assert (=> b!372612 (= condMapEmpty!14832 (= (arr!10276 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4079)) mapDefault!14832)))))

(declare-fun b!372613 () Bool)

(declare-fun res!209778 () Bool)

(assert (=> b!372613 (=> (not res!209778) (not e!227209))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372613 (= res!209778 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!372614 () Bool)

(declare-fun res!209779 () Bool)

(declare-fun e!227210 () Bool)

(assert (=> b!372614 (=> (not res!209779) (not e!227210))))

(declare-fun lt!170754 () array!21613)

(assert (=> b!372614 (= res!209779 (arrayNoDuplicates!0 lt!170754 #b00000000000000000000000000000000 Nil!5733))))

(declare-fun b!372615 () Bool)

(declare-fun res!209774 () Bool)

(assert (=> b!372615 (=> (not res!209774) (not e!227209))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!372615 (= res!209774 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10628 _keys!658))))))

(declare-fun b!372616 () Bool)

(assert (=> b!372616 (= e!227210 (not (bvsle #b00000000000000000000000000000000 (size!10628 _keys!658))))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun lt!170758 () array!21615)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12899)

(declare-datatypes ((tuple2!5898 0))(
  ( (tuple2!5899 (_1!2960 (_ BitVec 64)) (_2!2960 V!12899)) )
))
(declare-datatypes ((List!5737 0))(
  ( (Nil!5734) (Cons!5733 (h!6589 tuple2!5898) (t!10878 List!5737)) )
))
(declare-datatypes ((ListLongMap!4801 0))(
  ( (ListLongMap!4802 (toList!2416 List!5737)) )
))
(declare-fun lt!170759 () ListLongMap!4801)

(declare-fun minValue!472 () V!12899)

(declare-fun getCurrentListMap!1842 (array!21613 array!21615 (_ BitVec 32) (_ BitVec 32) V!12899 V!12899 (_ BitVec 32) Int) ListLongMap!4801)

(assert (=> b!372616 (= lt!170759 (getCurrentListMap!1842 lt!170754 lt!170758 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170757 () ListLongMap!4801)

(declare-fun lt!170755 () ListLongMap!4801)

(assert (=> b!372616 (and (= lt!170757 lt!170755) (= lt!170755 lt!170757))))

(declare-fun v!373 () V!12899)

(declare-fun lt!170756 () ListLongMap!4801)

(declare-fun +!784 (ListLongMap!4801 tuple2!5898) ListLongMap!4801)

(assert (=> b!372616 (= lt!170755 (+!784 lt!170756 (tuple2!5899 k0!778 v!373)))))

(declare-datatypes ((Unit!11444 0))(
  ( (Unit!11445) )
))
(declare-fun lt!170760 () Unit!11444)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!35 (array!21613 array!21615 (_ BitVec 32) (_ BitVec 32) V!12899 V!12899 (_ BitVec 32) (_ BitVec 64) V!12899 (_ BitVec 32) Int) Unit!11444)

(assert (=> b!372616 (= lt!170760 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!35 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!707 (array!21613 array!21615 (_ BitVec 32) (_ BitVec 32) V!12899 V!12899 (_ BitVec 32) Int) ListLongMap!4801)

(assert (=> b!372616 (= lt!170757 (getCurrentListMapNoExtraKeys!707 lt!170754 lt!170758 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372616 (= lt!170758 (array!21616 (store (arr!10276 _values!506) i!548 (ValueCellFull!4079 v!373)) (size!10629 _values!506)))))

(assert (=> b!372616 (= lt!170756 (getCurrentListMapNoExtraKeys!707 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!372617 () Bool)

(assert (=> b!372617 (= e!227209 e!227210)))

(declare-fun res!209773 () Bool)

(assert (=> b!372617 (=> (not res!209773) (not e!227210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21613 (_ BitVec 32)) Bool)

(assert (=> b!372617 (= res!209773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170754 mask!970))))

(assert (=> b!372617 (= lt!170754 (array!21614 (store (arr!10275 _keys!658) i!548 k0!778) (size!10628 _keys!658)))))

(declare-fun b!372618 () Bool)

(declare-fun res!209772 () Bool)

(assert (=> b!372618 (=> (not res!209772) (not e!227209))))

(assert (=> b!372618 (= res!209772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!372619 () Bool)

(declare-fun res!209771 () Bool)

(assert (=> b!372619 (=> (not res!209771) (not e!227209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372619 (= res!209771 (validKeyInArray!0 k0!778))))

(declare-fun b!372620 () Bool)

(declare-fun res!209776 () Bool)

(assert (=> b!372620 (=> (not res!209776) (not e!227209))))

(assert (=> b!372620 (= res!209776 (or (= (select (arr!10275 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10275 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!372621 () Bool)

(declare-fun res!209775 () Bool)

(assert (=> b!372621 (=> (not res!209775) (not e!227209))))

(assert (=> b!372621 (= res!209775 (and (= (size!10629 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10628 _keys!658) (size!10629 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!372622 () Bool)

(assert (=> b!372622 (= e!227213 tp_is_empty!8845)))

(assert (= (and start!37056 res!209780) b!372621))

(assert (= (and b!372621 res!209775) b!372618))

(assert (= (and b!372618 res!209772) b!372610))

(assert (= (and b!372610 res!209777) b!372615))

(assert (= (and b!372615 res!209774) b!372619))

(assert (= (and b!372619 res!209771) b!372620))

(assert (= (and b!372620 res!209776) b!372613))

(assert (= (and b!372613 res!209778) b!372617))

(assert (= (and b!372617 res!209773) b!372614))

(assert (= (and b!372614 res!209779) b!372616))

(assert (= (and b!372612 condMapEmpty!14832) mapIsEmpty!14832))

(assert (= (and b!372612 (not condMapEmpty!14832)) mapNonEmpty!14832))

(get-info :version)

(assert (= (and mapNonEmpty!14832 ((_ is ValueCellFull!4079) mapValue!14832)) b!372611))

(assert (= (and b!372612 ((_ is ValueCellFull!4079) mapDefault!14832)) b!372622))

(assert (= start!37056 b!372612))

(declare-fun m!367991 () Bool)

(assert (=> b!372610 m!367991))

(declare-fun m!367993 () Bool)

(assert (=> b!372619 m!367993))

(declare-fun m!367995 () Bool)

(assert (=> b!372614 m!367995))

(declare-fun m!367997 () Bool)

(assert (=> b!372618 m!367997))

(declare-fun m!367999 () Bool)

(assert (=> start!37056 m!367999))

(declare-fun m!368001 () Bool)

(assert (=> start!37056 m!368001))

(declare-fun m!368003 () Bool)

(assert (=> start!37056 m!368003))

(declare-fun m!368005 () Bool)

(assert (=> mapNonEmpty!14832 m!368005))

(declare-fun m!368007 () Bool)

(assert (=> b!372616 m!368007))

(declare-fun m!368009 () Bool)

(assert (=> b!372616 m!368009))

(declare-fun m!368011 () Bool)

(assert (=> b!372616 m!368011))

(declare-fun m!368013 () Bool)

(assert (=> b!372616 m!368013))

(declare-fun m!368015 () Bool)

(assert (=> b!372616 m!368015))

(declare-fun m!368017 () Bool)

(assert (=> b!372616 m!368017))

(declare-fun m!368019 () Bool)

(assert (=> b!372617 m!368019))

(declare-fun m!368021 () Bool)

(assert (=> b!372617 m!368021))

(declare-fun m!368023 () Bool)

(assert (=> b!372613 m!368023))

(declare-fun m!368025 () Bool)

(assert (=> b!372620 m!368025))

(check-sat tp_is_empty!8845 (not b_next!8197) (not b!372619) (not b!372617) (not b!372614) (not b!372618) (not mapNonEmpty!14832) b_and!15413 (not start!37056) (not b!372613) (not b!372616) (not b!372610))
(check-sat b_and!15413 (not b_next!8197))
