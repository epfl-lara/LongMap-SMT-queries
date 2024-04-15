; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36966 () Bool)

(assert start!36966)

(declare-fun b_free!8107 () Bool)

(declare-fun b_next!8107 () Bool)

(assert (=> start!36966 (= b_free!8107 (not b_next!8107))))

(declare-fun tp!29036 () Bool)

(declare-fun b_and!15323 () Bool)

(assert (=> start!36966 (= tp!29036 b_and!15323)))

(declare-fun mapIsEmpty!14697 () Bool)

(declare-fun mapRes!14697 () Bool)

(assert (=> mapIsEmpty!14697 mapRes!14697))

(declare-fun b!370855 () Bool)

(declare-fun res!208422 () Bool)

(declare-fun e!226398 () Bool)

(assert (=> b!370855 (=> (not res!208422) (not e!226398))))

(declare-datatypes ((array!21435 0))(
  ( (array!21436 (arr!10186 (Array (_ BitVec 32) (_ BitVec 64))) (size!10539 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21435)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370855 (= res!208422 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!14697 () Bool)

(declare-fun tp!29037 () Bool)

(declare-fun e!226399 () Bool)

(assert (=> mapNonEmpty!14697 (= mapRes!14697 (and tp!29037 e!226399))))

(declare-datatypes ((V!12779 0))(
  ( (V!12780 (val!4422 Int)) )
))
(declare-datatypes ((ValueCell!4034 0))(
  ( (ValueCellFull!4034 (v!6613 V!12779)) (EmptyCell!4034) )
))
(declare-fun mapValue!14697 () ValueCell!4034)

(declare-datatypes ((array!21437 0))(
  ( (array!21438 (arr!10187 (Array (_ BitVec 32) ValueCell!4034)) (size!10540 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21437)

(declare-fun mapKey!14697 () (_ BitVec 32))

(declare-fun mapRest!14697 () (Array (_ BitVec 32) ValueCell!4034))

(assert (=> mapNonEmpty!14697 (= (arr!10187 _values!506) (store mapRest!14697 mapKey!14697 mapValue!14697))))

(declare-fun b!370857 () Bool)

(declare-fun res!208421 () Bool)

(assert (=> b!370857 (=> (not res!208421) (not e!226398))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!370857 (= res!208421 (or (= (select (arr!10186 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10186 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370858 () Bool)

(declare-fun res!208424 () Bool)

(assert (=> b!370858 (=> (not res!208424) (not e!226398))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!370858 (= res!208424 (and (= (size!10540 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10539 _keys!658) (size!10540 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!370859 () Bool)

(declare-fun tp_is_empty!8755 () Bool)

(assert (=> b!370859 (= e!226399 tp_is_empty!8755)))

(declare-fun b!370860 () Bool)

(declare-fun res!208429 () Bool)

(declare-fun e!226402 () Bool)

(assert (=> b!370860 (=> (not res!208429) (not e!226402))))

(declare-fun lt!169933 () array!21435)

(declare-datatypes ((List!5671 0))(
  ( (Nil!5668) (Cons!5667 (h!6523 (_ BitVec 64)) (t!10812 List!5671)) )
))
(declare-fun arrayNoDuplicates!0 (array!21435 (_ BitVec 32) List!5671) Bool)

(assert (=> b!370860 (= res!208429 (arrayNoDuplicates!0 lt!169933 #b00000000000000000000000000000000 Nil!5668))))

(declare-fun b!370861 () Bool)

(declare-fun res!208427 () Bool)

(assert (=> b!370861 (=> (not res!208427) (not e!226398))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370861 (= res!208427 (validKeyInArray!0 k0!778))))

(declare-fun res!208423 () Bool)

(assert (=> start!36966 (=> (not res!208423) (not e!226398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36966 (= res!208423 (validMask!0 mask!970))))

(assert (=> start!36966 e!226398))

(declare-fun e!226401 () Bool)

(declare-fun array_inv!7534 (array!21437) Bool)

(assert (=> start!36966 (and (array_inv!7534 _values!506) e!226401)))

(assert (=> start!36966 tp!29036))

(assert (=> start!36966 true))

(assert (=> start!36966 tp_is_empty!8755))

(declare-fun array_inv!7535 (array!21435) Bool)

(assert (=> start!36966 (array_inv!7535 _keys!658)))

(declare-fun b!370856 () Bool)

(declare-fun res!208428 () Bool)

(assert (=> b!370856 (=> (not res!208428) (not e!226398))))

(assert (=> b!370856 (= res!208428 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10539 _keys!658))))))

(declare-fun b!370862 () Bool)

(declare-fun e!226403 () Bool)

(assert (=> b!370862 (= e!226401 (and e!226403 mapRes!14697))))

(declare-fun condMapEmpty!14697 () Bool)

(declare-fun mapDefault!14697 () ValueCell!4034)

(assert (=> b!370862 (= condMapEmpty!14697 (= (arr!10187 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4034)) mapDefault!14697)))))

(declare-fun b!370863 () Bool)

(assert (=> b!370863 (= e!226402 (not true))))

(declare-datatypes ((tuple2!5838 0))(
  ( (tuple2!5839 (_1!2930 (_ BitVec 64)) (_2!2930 V!12779)) )
))
(declare-datatypes ((List!5672 0))(
  ( (Nil!5669) (Cons!5668 (h!6524 tuple2!5838) (t!10813 List!5672)) )
))
(declare-datatypes ((ListLongMap!4741 0))(
  ( (ListLongMap!4742 (toList!2386 List!5672)) )
))
(declare-fun lt!169931 () ListLongMap!4741)

(declare-fun lt!169935 () ListLongMap!4741)

(assert (=> b!370863 (and (= lt!169931 lt!169935) (= lt!169935 lt!169931))))

(declare-fun lt!169934 () ListLongMap!4741)

(declare-fun v!373 () V!12779)

(declare-fun +!754 (ListLongMap!4741 tuple2!5838) ListLongMap!4741)

(assert (=> b!370863 (= lt!169935 (+!754 lt!169934 (tuple2!5839 k0!778 v!373)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12779)

(declare-datatypes ((Unit!11384 0))(
  ( (Unit!11385) )
))
(declare-fun lt!169932 () Unit!11384)

(declare-fun minValue!472 () V!12779)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!5 (array!21435 array!21437 (_ BitVec 32) (_ BitVec 32) V!12779 V!12779 (_ BitVec 32) (_ BitVec 64) V!12779 (_ BitVec 32) Int) Unit!11384)

(assert (=> b!370863 (= lt!169932 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!5 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!677 (array!21435 array!21437 (_ BitVec 32) (_ BitVec 32) V!12779 V!12779 (_ BitVec 32) Int) ListLongMap!4741)

(assert (=> b!370863 (= lt!169931 (getCurrentListMapNoExtraKeys!677 lt!169933 (array!21438 (store (arr!10187 _values!506) i!548 (ValueCellFull!4034 v!373)) (size!10540 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!370863 (= lt!169934 (getCurrentListMapNoExtraKeys!677 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!370864 () Bool)

(declare-fun res!208430 () Bool)

(assert (=> b!370864 (=> (not res!208430) (not e!226398))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21435 (_ BitVec 32)) Bool)

(assert (=> b!370864 (= res!208430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!370865 () Bool)

(declare-fun res!208425 () Bool)

(assert (=> b!370865 (=> (not res!208425) (not e!226398))))

(assert (=> b!370865 (= res!208425 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5668))))

(declare-fun b!370866 () Bool)

(assert (=> b!370866 (= e!226403 tp_is_empty!8755)))

(declare-fun b!370867 () Bool)

(assert (=> b!370867 (= e!226398 e!226402)))

(declare-fun res!208426 () Bool)

(assert (=> b!370867 (=> (not res!208426) (not e!226402))))

(assert (=> b!370867 (= res!208426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169933 mask!970))))

(assert (=> b!370867 (= lt!169933 (array!21436 (store (arr!10186 _keys!658) i!548 k0!778) (size!10539 _keys!658)))))

(assert (= (and start!36966 res!208423) b!370858))

(assert (= (and b!370858 res!208424) b!370864))

(assert (= (and b!370864 res!208430) b!370865))

(assert (= (and b!370865 res!208425) b!370856))

(assert (= (and b!370856 res!208428) b!370861))

(assert (= (and b!370861 res!208427) b!370857))

(assert (= (and b!370857 res!208421) b!370855))

(assert (= (and b!370855 res!208422) b!370867))

(assert (= (and b!370867 res!208426) b!370860))

(assert (= (and b!370860 res!208429) b!370863))

(assert (= (and b!370862 condMapEmpty!14697) mapIsEmpty!14697))

(assert (= (and b!370862 (not condMapEmpty!14697)) mapNonEmpty!14697))

(get-info :version)

(assert (= (and mapNonEmpty!14697 ((_ is ValueCellFull!4034) mapValue!14697)) b!370859))

(assert (= (and b!370862 ((_ is ValueCellFull!4034) mapDefault!14697)) b!370866))

(assert (= start!36966 b!370862))

(declare-fun m!366413 () Bool)

(assert (=> b!370863 m!366413))

(declare-fun m!366415 () Bool)

(assert (=> b!370863 m!366415))

(declare-fun m!366417 () Bool)

(assert (=> b!370863 m!366417))

(declare-fun m!366419 () Bool)

(assert (=> b!370863 m!366419))

(declare-fun m!366421 () Bool)

(assert (=> b!370863 m!366421))

(declare-fun m!366423 () Bool)

(assert (=> start!36966 m!366423))

(declare-fun m!366425 () Bool)

(assert (=> start!36966 m!366425))

(declare-fun m!366427 () Bool)

(assert (=> start!36966 m!366427))

(declare-fun m!366429 () Bool)

(assert (=> b!370864 m!366429))

(declare-fun m!366431 () Bool)

(assert (=> b!370865 m!366431))

(declare-fun m!366433 () Bool)

(assert (=> b!370857 m!366433))

(declare-fun m!366435 () Bool)

(assert (=> b!370867 m!366435))

(declare-fun m!366437 () Bool)

(assert (=> b!370867 m!366437))

(declare-fun m!366439 () Bool)

(assert (=> b!370861 m!366439))

(declare-fun m!366441 () Bool)

(assert (=> b!370855 m!366441))

(declare-fun m!366443 () Bool)

(assert (=> b!370860 m!366443))

(declare-fun m!366445 () Bool)

(assert (=> mapNonEmpty!14697 m!366445))

(check-sat b_and!15323 (not b!370861) (not b!370863) (not b_next!8107) (not b!370860) (not mapNonEmpty!14697) (not b!370864) (not b!370855) (not b!370865) tp_is_empty!8755 (not b!370867) (not start!36966))
(check-sat b_and!15323 (not b_next!8107))
