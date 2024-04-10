; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82782 () Bool)

(assert start!82782)

(declare-fun b_free!18915 () Bool)

(declare-fun b_next!18915 () Bool)

(assert (=> start!82782 (= b_free!18915 (not b_next!18915))))

(declare-fun tp!65864 () Bool)

(declare-fun b_and!30403 () Bool)

(assert (=> start!82782 (= tp!65864 b_and!30403)))

(declare-fun mapIsEmpty!34570 () Bool)

(declare-fun mapRes!34570 () Bool)

(assert (=> mapIsEmpty!34570 mapRes!34570))

(declare-fun b!965602 () Bool)

(declare-fun e!544331 () Bool)

(declare-fun e!544328 () Bool)

(assert (=> b!965602 (= e!544331 (and e!544328 mapRes!34570))))

(declare-fun condMapEmpty!34570 () Bool)

(declare-datatypes ((V!33939 0))(
  ( (V!33940 (val!10909 Int)) )
))
(declare-datatypes ((ValueCell!10377 0))(
  ( (ValueCellFull!10377 (v!13467 V!33939)) (EmptyCell!10377) )
))
(declare-datatypes ((array!59519 0))(
  ( (array!59520 (arr!28628 (Array (_ BitVec 32) ValueCell!10377)) (size!29107 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59519)

(declare-fun mapDefault!34570 () ValueCell!10377)

(assert (=> b!965602 (= condMapEmpty!34570 (= (arr!28628 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10377)) mapDefault!34570)))))

(declare-fun b!965603 () Bool)

(declare-fun res!646353 () Bool)

(declare-fun e!544327 () Bool)

(assert (=> b!965603 (=> (not res!646353) (not e!544327))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((array!59521 0))(
  ( (array!59522 (arr!28629 (Array (_ BitVec 32) (_ BitVec 64))) (size!29108 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59521)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!965603 (= res!646353 (and (= (size!29107 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29108 _keys!1686) (size!29107 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun b!965604 () Bool)

(assert (=> b!965604 (= e!544327 (and (bvsle from!2084 newFrom!159) (bvsgt newFrom!159 (size!29108 _keys!1686))))))

(declare-fun b!965605 () Bool)

(declare-fun res!646351 () Bool)

(assert (=> b!965605 (=> (not res!646351) (not e!544327))))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!965605 (= res!646351 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29108 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29108 _keys!1686))))))

(declare-fun b!965606 () Bool)

(declare-fun res!646350 () Bool)

(assert (=> b!965606 (=> (not res!646350) (not e!544327))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965606 (= res!646350 (validKeyInArray!0 (select (arr!28629 _keys!1686) i!803)))))

(declare-fun b!965607 () Bool)

(declare-fun res!646349 () Bool)

(assert (=> b!965607 (=> (not res!646349) (not e!544327))))

(declare-datatypes ((List!19874 0))(
  ( (Nil!19871) (Cons!19870 (h!21032 (_ BitVec 64)) (t!28237 List!19874)) )
))
(declare-fun arrayNoDuplicates!0 (array!59521 (_ BitVec 32) List!19874) Bool)

(assert (=> b!965607 (= res!646349 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19871))))

(declare-fun mapNonEmpty!34570 () Bool)

(declare-fun tp!65865 () Bool)

(declare-fun e!544330 () Bool)

(assert (=> mapNonEmpty!34570 (= mapRes!34570 (and tp!65865 e!544330))))

(declare-fun mapKey!34570 () (_ BitVec 32))

(declare-fun mapValue!34570 () ValueCell!10377)

(declare-fun mapRest!34570 () (Array (_ BitVec 32) ValueCell!10377))

(assert (=> mapNonEmpty!34570 (= (arr!28628 _values!1400) (store mapRest!34570 mapKey!34570 mapValue!34570))))

(declare-fun b!965609 () Bool)

(declare-fun tp_is_empty!21717 () Bool)

(assert (=> b!965609 (= e!544330 tp_is_empty!21717)))

(declare-fun b!965610 () Bool)

(declare-fun res!646348 () Bool)

(assert (=> b!965610 (=> (not res!646348) (not e!544327))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59521 (_ BitVec 32)) Bool)

(assert (=> b!965610 (= res!646348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965611 () Bool)

(declare-fun res!646354 () Bool)

(assert (=> b!965611 (=> (not res!646354) (not e!544327))))

(declare-fun minValue!1342 () V!33939)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33939)

(declare-datatypes ((tuple2!14032 0))(
  ( (tuple2!14033 (_1!7027 (_ BitVec 64)) (_2!7027 V!33939)) )
))
(declare-datatypes ((List!19875 0))(
  ( (Nil!19872) (Cons!19871 (h!21033 tuple2!14032) (t!28238 List!19875)) )
))
(declare-datatypes ((ListLongMap!12729 0))(
  ( (ListLongMap!12730 (toList!6380 List!19875)) )
))
(declare-fun contains!5483 (ListLongMap!12729 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3613 (array!59521 array!59519 (_ BitVec 32) (_ BitVec 32) V!33939 V!33939 (_ BitVec 32) Int) ListLongMap!12729)

(assert (=> b!965611 (= res!646354 (contains!5483 (getCurrentListMap!3613 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28629 _keys!1686) i!803)))))

(declare-fun res!646352 () Bool)

(assert (=> start!82782 (=> (not res!646352) (not e!544327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82782 (= res!646352 (validMask!0 mask!2110))))

(assert (=> start!82782 e!544327))

(assert (=> start!82782 true))

(declare-fun array_inv!22171 (array!59519) Bool)

(assert (=> start!82782 (and (array_inv!22171 _values!1400) e!544331)))

(declare-fun array_inv!22172 (array!59521) Bool)

(assert (=> start!82782 (array_inv!22172 _keys!1686)))

(assert (=> start!82782 tp!65864))

(assert (=> start!82782 tp_is_empty!21717))

(declare-fun b!965608 () Bool)

(assert (=> b!965608 (= e!544328 tp_is_empty!21717)))

(assert (= (and start!82782 res!646352) b!965603))

(assert (= (and b!965603 res!646353) b!965610))

(assert (= (and b!965610 res!646348) b!965607))

(assert (= (and b!965607 res!646349) b!965605))

(assert (= (and b!965605 res!646351) b!965606))

(assert (= (and b!965606 res!646350) b!965611))

(assert (= (and b!965611 res!646354) b!965604))

(assert (= (and b!965602 condMapEmpty!34570) mapIsEmpty!34570))

(assert (= (and b!965602 (not condMapEmpty!34570)) mapNonEmpty!34570))

(get-info :version)

(assert (= (and mapNonEmpty!34570 ((_ is ValueCellFull!10377) mapValue!34570)) b!965609))

(assert (= (and b!965602 ((_ is ValueCellFull!10377) mapDefault!34570)) b!965608))

(assert (= start!82782 b!965602))

(declare-fun m!894629 () Bool)

(assert (=> b!965607 m!894629))

(declare-fun m!894631 () Bool)

(assert (=> start!82782 m!894631))

(declare-fun m!894633 () Bool)

(assert (=> start!82782 m!894633))

(declare-fun m!894635 () Bool)

(assert (=> start!82782 m!894635))

(declare-fun m!894637 () Bool)

(assert (=> b!965606 m!894637))

(assert (=> b!965606 m!894637))

(declare-fun m!894639 () Bool)

(assert (=> b!965606 m!894639))

(declare-fun m!894641 () Bool)

(assert (=> b!965610 m!894641))

(declare-fun m!894643 () Bool)

(assert (=> b!965611 m!894643))

(assert (=> b!965611 m!894637))

(assert (=> b!965611 m!894643))

(assert (=> b!965611 m!894637))

(declare-fun m!894645 () Bool)

(assert (=> b!965611 m!894645))

(declare-fun m!894647 () Bool)

(assert (=> mapNonEmpty!34570 m!894647))

(check-sat b_and!30403 tp_is_empty!21717 (not b!965607) (not b!965611) (not b_next!18915) (not start!82782) (not b!965606) (not mapNonEmpty!34570) (not b!965610))
(check-sat b_and!30403 (not b_next!18915))
