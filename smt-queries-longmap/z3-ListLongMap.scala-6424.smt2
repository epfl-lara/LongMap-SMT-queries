; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82322 () Bool)

(assert start!82322)

(declare-fun b_free!18607 () Bool)

(declare-fun b_next!18607 () Bool)

(assert (=> start!82322 (= b_free!18607 (not b_next!18607))))

(declare-fun tp!64792 () Bool)

(declare-fun b_and!30069 () Bool)

(assert (=> start!82322 (= tp!64792 b_and!30069)))

(declare-fun b!959778 () Bool)

(declare-fun res!642509 () Bool)

(declare-fun e!541019 () Bool)

(assert (=> b!959778 (=> (not res!642509) (not e!541019))))

(declare-datatypes ((array!58666 0))(
  ( (array!58667 (arr!28207 (Array (_ BitVec 32) (_ BitVec 64))) (size!28688 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58666)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!959778 (= res!642509 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28688 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28688 _keys!1668))))))

(declare-fun b!959779 () Bool)

(declare-fun e!541018 () Bool)

(declare-fun tp_is_empty!21319 () Bool)

(assert (=> b!959779 (= e!541018 tp_is_empty!21319)))

(declare-fun b!959780 () Bool)

(declare-fun res!642511 () Bool)

(assert (=> b!959780 (=> (not res!642511) (not e!541019))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58666 (_ BitVec 32)) Bool)

(assert (=> b!959780 (= res!642511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959781 () Bool)

(declare-fun res!642508 () Bool)

(assert (=> b!959781 (=> (not res!642508) (not e!541019))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((V!33409 0))(
  ( (V!33410 (val!10710 Int)) )
))
(declare-datatypes ((ValueCell!10178 0))(
  ( (ValueCellFull!10178 (v!13266 V!33409)) (EmptyCell!10178) )
))
(declare-datatypes ((array!58668 0))(
  ( (array!58669 (arr!28208 (Array (_ BitVec 32) ValueCell!10178)) (size!28689 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58668)

(assert (=> b!959781 (= res!642508 (and (= (size!28689 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28688 _keys!1668) (size!28689 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33958 () Bool)

(declare-fun mapRes!33958 () Bool)

(declare-fun tp!64791 () Bool)

(assert (=> mapNonEmpty!33958 (= mapRes!33958 (and tp!64791 e!541018))))

(declare-fun mapRest!33958 () (Array (_ BitVec 32) ValueCell!10178))

(declare-fun mapValue!33958 () ValueCell!10178)

(declare-fun mapKey!33958 () (_ BitVec 32))

(assert (=> mapNonEmpty!33958 (= (arr!28208 _values!1386) (store mapRest!33958 mapKey!33958 mapValue!33958))))

(declare-fun b!959782 () Bool)

(declare-fun e!541022 () Bool)

(declare-fun e!541021 () Bool)

(assert (=> b!959782 (= e!541022 (and e!541021 mapRes!33958))))

(declare-fun condMapEmpty!33958 () Bool)

(declare-fun mapDefault!33958 () ValueCell!10178)

(assert (=> b!959782 (= condMapEmpty!33958 (= (arr!28208 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10178)) mapDefault!33958)))))

(declare-fun b!959783 () Bool)

(assert (=> b!959783 (= e!541019 false)))

(declare-fun minValue!1328 () V!33409)

(declare-fun lt!430366 () Bool)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33409)

(declare-datatypes ((tuple2!13866 0))(
  ( (tuple2!13867 (_1!6944 (_ BitVec 64)) (_2!6944 V!33409)) )
))
(declare-datatypes ((List!19649 0))(
  ( (Nil!19646) (Cons!19645 (h!20807 tuple2!13866) (t!28003 List!19649)) )
))
(declare-datatypes ((ListLongMap!12553 0))(
  ( (ListLongMap!12554 (toList!6292 List!19649)) )
))
(declare-fun contains!5335 (ListLongMap!12553 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3454 (array!58666 array!58668 (_ BitVec 32) (_ BitVec 32) V!33409 V!33409 (_ BitVec 32) Int) ListLongMap!12553)

(assert (=> b!959783 (= lt!430366 (contains!5335 (getCurrentListMap!3454 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28207 _keys!1668) i!793)))))

(declare-fun b!959784 () Bool)

(assert (=> b!959784 (= e!541021 tp_is_empty!21319)))

(declare-fun res!642510 () Bool)

(assert (=> start!82322 (=> (not res!642510) (not e!541019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82322 (= res!642510 (validMask!0 mask!2088))))

(assert (=> start!82322 e!541019))

(assert (=> start!82322 true))

(assert (=> start!82322 tp_is_empty!21319))

(declare-fun array_inv!21923 (array!58666) Bool)

(assert (=> start!82322 (array_inv!21923 _keys!1668)))

(declare-fun array_inv!21924 (array!58668) Bool)

(assert (=> start!82322 (and (array_inv!21924 _values!1386) e!541022)))

(assert (=> start!82322 tp!64792))

(declare-fun b!959785 () Bool)

(declare-fun res!642513 () Bool)

(assert (=> b!959785 (=> (not res!642513) (not e!541019))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959785 (= res!642513 (validKeyInArray!0 (select (arr!28207 _keys!1668) i!793)))))

(declare-fun mapIsEmpty!33958 () Bool)

(assert (=> mapIsEmpty!33958 mapRes!33958))

(declare-fun b!959786 () Bool)

(declare-fun res!642512 () Bool)

(assert (=> b!959786 (=> (not res!642512) (not e!541019))))

(declare-datatypes ((List!19650 0))(
  ( (Nil!19647) (Cons!19646 (h!20808 (_ BitVec 64)) (t!28004 List!19650)) )
))
(declare-fun arrayNoDuplicates!0 (array!58666 (_ BitVec 32) List!19650) Bool)

(assert (=> b!959786 (= res!642512 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19647))))

(assert (= (and start!82322 res!642510) b!959781))

(assert (= (and b!959781 res!642508) b!959780))

(assert (= (and b!959780 res!642511) b!959786))

(assert (= (and b!959786 res!642512) b!959778))

(assert (= (and b!959778 res!642509) b!959785))

(assert (= (and b!959785 res!642513) b!959783))

(assert (= (and b!959782 condMapEmpty!33958) mapIsEmpty!33958))

(assert (= (and b!959782 (not condMapEmpty!33958)) mapNonEmpty!33958))

(get-info :version)

(assert (= (and mapNonEmpty!33958 ((_ is ValueCellFull!10178) mapValue!33958)) b!959779))

(assert (= (and b!959782 ((_ is ValueCellFull!10178) mapDefault!33958)) b!959784))

(assert (= start!82322 b!959782))

(declare-fun m!889611 () Bool)

(assert (=> mapNonEmpty!33958 m!889611))

(declare-fun m!889613 () Bool)

(assert (=> b!959783 m!889613))

(declare-fun m!889615 () Bool)

(assert (=> b!959783 m!889615))

(assert (=> b!959783 m!889613))

(assert (=> b!959783 m!889615))

(declare-fun m!889617 () Bool)

(assert (=> b!959783 m!889617))

(declare-fun m!889619 () Bool)

(assert (=> b!959786 m!889619))

(assert (=> b!959785 m!889615))

(assert (=> b!959785 m!889615))

(declare-fun m!889621 () Bool)

(assert (=> b!959785 m!889621))

(declare-fun m!889623 () Bool)

(assert (=> b!959780 m!889623))

(declare-fun m!889625 () Bool)

(assert (=> start!82322 m!889625))

(declare-fun m!889627 () Bool)

(assert (=> start!82322 m!889627))

(declare-fun m!889629 () Bool)

(assert (=> start!82322 m!889629))

(check-sat (not b!959785) (not b_next!18607) (not b!959786) (not mapNonEmpty!33958) (not b!959780) (not b!959783) (not start!82322) tp_is_empty!21319 b_and!30069)
(check-sat b_and!30069 (not b_next!18607))
