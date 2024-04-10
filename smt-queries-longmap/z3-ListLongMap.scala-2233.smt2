; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36862 () Bool)

(assert start!36862)

(declare-fun b_free!7989 () Bool)

(declare-fun b_next!7989 () Bool)

(assert (=> start!36862 (= b_free!7989 (not b_next!7989))))

(declare-fun tp!28683 () Bool)

(declare-fun b_and!15231 () Bool)

(assert (=> start!36862 (= tp!28683 b_and!15231)))

(declare-fun mapIsEmpty!14520 () Bool)

(declare-fun mapRes!14520 () Bool)

(assert (=> mapIsEmpty!14520 mapRes!14520))

(declare-fun b!368826 () Bool)

(declare-fun res!206783 () Bool)

(declare-fun e!225512 () Bool)

(assert (=> b!368826 (=> (not res!206783) (not e!225512))))

(declare-datatypes ((array!21229 0))(
  ( (array!21230 (arr!10083 (Array (_ BitVec 32) (_ BitVec 64))) (size!10435 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21229)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21229 (_ BitVec 32)) Bool)

(assert (=> b!368826 (= res!206783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!368827 () Bool)

(declare-fun res!206780 () Bool)

(assert (=> b!368827 (=> (not res!206780) (not e!225512))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368827 (= res!206780 (validKeyInArray!0 k0!778))))

(declare-fun b!368828 () Bool)

(declare-fun e!225514 () Bool)

(assert (=> b!368828 (= e!225514 false)))

(declare-datatypes ((V!12621 0))(
  ( (V!12622 (val!4363 Int)) )
))
(declare-datatypes ((ValueCell!3975 0))(
  ( (ValueCellFull!3975 (v!6560 V!12621)) (EmptyCell!3975) )
))
(declare-datatypes ((array!21231 0))(
  ( (array!21232 (arr!10084 (Array (_ BitVec 32) ValueCell!3975)) (size!10436 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21231)

(declare-fun lt!169594 () array!21229)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12621)

(declare-datatypes ((tuple2!5786 0))(
  ( (tuple2!5787 (_1!2904 (_ BitVec 64)) (_2!2904 V!12621)) )
))
(declare-datatypes ((List!5618 0))(
  ( (Nil!5615) (Cons!5614 (h!6470 tuple2!5786) (t!10768 List!5618)) )
))
(declare-datatypes ((ListLongMap!4699 0))(
  ( (ListLongMap!4700 (toList!2365 List!5618)) )
))
(declare-fun lt!169595 () ListLongMap!4699)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12621)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12621)

(declare-fun getCurrentListMapNoExtraKeys!642 (array!21229 array!21231 (_ BitVec 32) (_ BitVec 32) V!12621 V!12621 (_ BitVec 32) Int) ListLongMap!4699)

(assert (=> b!368828 (= lt!169595 (getCurrentListMapNoExtraKeys!642 lt!169594 (array!21232 (store (arr!10084 _values!506) i!548 (ValueCellFull!3975 v!373)) (size!10436 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169596 () ListLongMap!4699)

(assert (=> b!368828 (= lt!169596 (getCurrentListMapNoExtraKeys!642 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368829 () Bool)

(declare-fun res!206788 () Bool)

(assert (=> b!368829 (=> (not res!206788) (not e!225512))))

(assert (=> b!368829 (= res!206788 (and (= (size!10436 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10435 _keys!658) (size!10436 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368830 () Bool)

(assert (=> b!368830 (= e!225512 e!225514)))

(declare-fun res!206786 () Bool)

(assert (=> b!368830 (=> (not res!206786) (not e!225514))))

(assert (=> b!368830 (= res!206786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169594 mask!970))))

(assert (=> b!368830 (= lt!169594 (array!21230 (store (arr!10083 _keys!658) i!548 k0!778) (size!10435 _keys!658)))))

(declare-fun mapNonEmpty!14520 () Bool)

(declare-fun tp!28682 () Bool)

(declare-fun e!225515 () Bool)

(assert (=> mapNonEmpty!14520 (= mapRes!14520 (and tp!28682 e!225515))))

(declare-fun mapValue!14520 () ValueCell!3975)

(declare-fun mapRest!14520 () (Array (_ BitVec 32) ValueCell!3975))

(declare-fun mapKey!14520 () (_ BitVec 32))

(assert (=> mapNonEmpty!14520 (= (arr!10084 _values!506) (store mapRest!14520 mapKey!14520 mapValue!14520))))

(declare-fun res!206789 () Bool)

(assert (=> start!36862 (=> (not res!206789) (not e!225512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36862 (= res!206789 (validMask!0 mask!970))))

(assert (=> start!36862 e!225512))

(declare-fun e!225513 () Bool)

(declare-fun array_inv!7452 (array!21231) Bool)

(assert (=> start!36862 (and (array_inv!7452 _values!506) e!225513)))

(assert (=> start!36862 tp!28683))

(assert (=> start!36862 true))

(declare-fun tp_is_empty!8637 () Bool)

(assert (=> start!36862 tp_is_empty!8637))

(declare-fun array_inv!7453 (array!21229) Bool)

(assert (=> start!36862 (array_inv!7453 _keys!658)))

(declare-fun b!368825 () Bool)

(declare-fun res!206787 () Bool)

(assert (=> b!368825 (=> (not res!206787) (not e!225512))))

(declare-datatypes ((List!5619 0))(
  ( (Nil!5616) (Cons!5615 (h!6471 (_ BitVec 64)) (t!10769 List!5619)) )
))
(declare-fun arrayNoDuplicates!0 (array!21229 (_ BitVec 32) List!5619) Bool)

(assert (=> b!368825 (= res!206787 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5616))))

(declare-fun b!368831 () Bool)

(declare-fun res!206781 () Bool)

(assert (=> b!368831 (=> (not res!206781) (not e!225514))))

(assert (=> b!368831 (= res!206781 (arrayNoDuplicates!0 lt!169594 #b00000000000000000000000000000000 Nil!5616))))

(declare-fun b!368832 () Bool)

(declare-fun res!206784 () Bool)

(assert (=> b!368832 (=> (not res!206784) (not e!225512))))

(declare-fun arrayContainsKey!0 (array!21229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368832 (= res!206784 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!368833 () Bool)

(assert (=> b!368833 (= e!225515 tp_is_empty!8637)))

(declare-fun b!368834 () Bool)

(declare-fun e!225510 () Bool)

(assert (=> b!368834 (= e!225510 tp_is_empty!8637)))

(declare-fun b!368835 () Bool)

(assert (=> b!368835 (= e!225513 (and e!225510 mapRes!14520))))

(declare-fun condMapEmpty!14520 () Bool)

(declare-fun mapDefault!14520 () ValueCell!3975)

(assert (=> b!368835 (= condMapEmpty!14520 (= (arr!10084 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3975)) mapDefault!14520)))))

(declare-fun b!368836 () Bool)

(declare-fun res!206785 () Bool)

(assert (=> b!368836 (=> (not res!206785) (not e!225512))))

(assert (=> b!368836 (= res!206785 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10435 _keys!658))))))

(declare-fun b!368837 () Bool)

(declare-fun res!206782 () Bool)

(assert (=> b!368837 (=> (not res!206782) (not e!225512))))

(assert (=> b!368837 (= res!206782 (or (= (select (arr!10083 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10083 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!36862 res!206789) b!368829))

(assert (= (and b!368829 res!206788) b!368826))

(assert (= (and b!368826 res!206783) b!368825))

(assert (= (and b!368825 res!206787) b!368836))

(assert (= (and b!368836 res!206785) b!368827))

(assert (= (and b!368827 res!206780) b!368837))

(assert (= (and b!368837 res!206782) b!368832))

(assert (= (and b!368832 res!206784) b!368830))

(assert (= (and b!368830 res!206786) b!368831))

(assert (= (and b!368831 res!206781) b!368828))

(assert (= (and b!368835 condMapEmpty!14520) mapIsEmpty!14520))

(assert (= (and b!368835 (not condMapEmpty!14520)) mapNonEmpty!14520))

(get-info :version)

(assert (= (and mapNonEmpty!14520 ((_ is ValueCellFull!3975) mapValue!14520)) b!368833))

(assert (= (and b!368835 ((_ is ValueCellFull!3975) mapDefault!14520)) b!368834))

(assert (= start!36862 b!368835))

(declare-fun m!365343 () Bool)

(assert (=> start!36862 m!365343))

(declare-fun m!365345 () Bool)

(assert (=> start!36862 m!365345))

(declare-fun m!365347 () Bool)

(assert (=> start!36862 m!365347))

(declare-fun m!365349 () Bool)

(assert (=> b!368837 m!365349))

(declare-fun m!365351 () Bool)

(assert (=> b!368826 m!365351))

(declare-fun m!365353 () Bool)

(assert (=> b!368825 m!365353))

(declare-fun m!365355 () Bool)

(assert (=> b!368828 m!365355))

(declare-fun m!365357 () Bool)

(assert (=> b!368828 m!365357))

(declare-fun m!365359 () Bool)

(assert (=> b!368828 m!365359))

(declare-fun m!365361 () Bool)

(assert (=> mapNonEmpty!14520 m!365361))

(declare-fun m!365363 () Bool)

(assert (=> b!368831 m!365363))

(declare-fun m!365365 () Bool)

(assert (=> b!368827 m!365365))

(declare-fun m!365367 () Bool)

(assert (=> b!368830 m!365367))

(declare-fun m!365369 () Bool)

(assert (=> b!368830 m!365369))

(declare-fun m!365371 () Bool)

(assert (=> b!368832 m!365371))

(check-sat (not b!368831) (not mapNonEmpty!14520) (not b!368827) (not start!36862) tp_is_empty!8637 (not b!368826) (not b!368830) b_and!15231 (not b!368828) (not b!368825) (not b!368832) (not b_next!7989))
(check-sat b_and!15231 (not b_next!7989))
