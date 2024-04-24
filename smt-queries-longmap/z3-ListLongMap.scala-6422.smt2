; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82496 () Bool)

(assert start!82496)

(declare-fun b_free!18595 () Bool)

(declare-fun b_next!18595 () Bool)

(assert (=> start!82496 (= b_free!18595 (not b_next!18595))))

(declare-fun tp!64756 () Bool)

(declare-fun b_and!30093 () Bool)

(assert (=> start!82496 (= tp!64756 b_and!30093)))

(declare-fun b!960758 () Bool)

(declare-fun e!541660 () Bool)

(declare-fun e!541662 () Bool)

(declare-fun mapRes!33940 () Bool)

(assert (=> b!960758 (= e!541660 (and e!541662 mapRes!33940))))

(declare-fun condMapEmpty!33940 () Bool)

(declare-datatypes ((V!33393 0))(
  ( (V!33394 (val!10704 Int)) )
))
(declare-datatypes ((ValueCell!10172 0))(
  ( (ValueCellFull!10172 (v!13258 V!33393)) (EmptyCell!10172) )
))
(declare-datatypes ((array!58738 0))(
  ( (array!58739 (arr!28238 (Array (_ BitVec 32) ValueCell!10172)) (size!28718 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58738)

(declare-fun mapDefault!33940 () ValueCell!10172)

(assert (=> b!960758 (= condMapEmpty!33940 (= (arr!28238 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10172)) mapDefault!33940)))))

(declare-fun b!960759 () Bool)

(declare-fun e!541658 () Bool)

(declare-fun tp_is_empty!21307 () Bool)

(assert (=> b!960759 (= e!541658 tp_is_empty!21307)))

(declare-fun b!960760 () Bool)

(declare-fun res!642857 () Bool)

(declare-fun e!541659 () Bool)

(assert (=> b!960760 (=> (not res!642857) (not e!541659))))

(declare-datatypes ((array!58740 0))(
  ( (array!58741 (arr!28239 (Array (_ BitVec 32) (_ BitVec 64))) (size!28719 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58740)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960760 (= res!642857 (validKeyInArray!0 (select (arr!28239 _keys!1668) i!793)))))

(declare-fun res!642856 () Bool)

(assert (=> start!82496 (=> (not res!642856) (not e!541659))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82496 (= res!642856 (validMask!0 mask!2088))))

(assert (=> start!82496 e!541659))

(assert (=> start!82496 true))

(assert (=> start!82496 tp_is_empty!21307))

(declare-fun array_inv!21969 (array!58740) Bool)

(assert (=> start!82496 (array_inv!21969 _keys!1668)))

(declare-fun array_inv!21970 (array!58738) Bool)

(assert (=> start!82496 (and (array_inv!21970 _values!1386) e!541660)))

(assert (=> start!82496 tp!64756))

(declare-fun b!960761 () Bool)

(declare-fun res!642859 () Bool)

(assert (=> b!960761 (=> (not res!642859) (not e!541659))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!960761 (= res!642859 (and (= (size!28718 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28719 _keys!1668) (size!28718 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!960762 () Bool)

(declare-fun res!642854 () Bool)

(assert (=> b!960762 (=> (not res!642854) (not e!541659))))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!960762 (= res!642854 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28719 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28719 _keys!1668))))))

(declare-fun mapIsEmpty!33940 () Bool)

(assert (=> mapIsEmpty!33940 mapRes!33940))

(declare-fun b!960763 () Bool)

(declare-fun res!642858 () Bool)

(assert (=> b!960763 (=> (not res!642858) (not e!541659))))

(declare-datatypes ((List!19619 0))(
  ( (Nil!19616) (Cons!19615 (h!20783 (_ BitVec 64)) (t!27974 List!19619)) )
))
(declare-fun arrayNoDuplicates!0 (array!58740 (_ BitVec 32) List!19619) Bool)

(assert (=> b!960763 (= res!642858 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19616))))

(declare-fun b!960764 () Bool)

(assert (=> b!960764 (= e!541662 tp_is_empty!21307)))

(declare-fun mapNonEmpty!33940 () Bool)

(declare-fun tp!64755 () Bool)

(assert (=> mapNonEmpty!33940 (= mapRes!33940 (and tp!64755 e!541658))))

(declare-fun mapRest!33940 () (Array (_ BitVec 32) ValueCell!10172))

(declare-fun mapValue!33940 () ValueCell!10172)

(declare-fun mapKey!33940 () (_ BitVec 32))

(assert (=> mapNonEmpty!33940 (= (arr!28238 _values!1386) (store mapRest!33940 mapKey!33940 mapValue!33940))))

(declare-fun b!960765 () Bool)

(declare-fun res!642855 () Bool)

(assert (=> b!960765 (=> (not res!642855) (not e!541659))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58740 (_ BitVec 32)) Bool)

(assert (=> b!960765 (= res!642855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!960766 () Bool)

(assert (=> b!960766 (= e!541659 false)))

(declare-fun minValue!1328 () V!33393)

(declare-fun lt!430945 () Bool)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33393)

(declare-datatypes ((tuple2!13788 0))(
  ( (tuple2!13789 (_1!6905 (_ BitVec 64)) (_2!6905 V!33393)) )
))
(declare-datatypes ((List!19620 0))(
  ( (Nil!19617) (Cons!19616 (h!20784 tuple2!13788) (t!27975 List!19620)) )
))
(declare-datatypes ((ListLongMap!12487 0))(
  ( (ListLongMap!12488 (toList!6259 List!19620)) )
))
(declare-fun contains!5371 (ListLongMap!12487 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3492 (array!58740 array!58738 (_ BitVec 32) (_ BitVec 32) V!33393 V!33393 (_ BitVec 32) Int) ListLongMap!12487)

(assert (=> b!960766 (= lt!430945 (contains!5371 (getCurrentListMap!3492 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28239 _keys!1668) i!793)))))

(assert (= (and start!82496 res!642856) b!960761))

(assert (= (and b!960761 res!642859) b!960765))

(assert (= (and b!960765 res!642855) b!960763))

(assert (= (and b!960763 res!642858) b!960762))

(assert (= (and b!960762 res!642854) b!960760))

(assert (= (and b!960760 res!642857) b!960766))

(assert (= (and b!960758 condMapEmpty!33940) mapIsEmpty!33940))

(assert (= (and b!960758 (not condMapEmpty!33940)) mapNonEmpty!33940))

(get-info :version)

(assert (= (and mapNonEmpty!33940 ((_ is ValueCellFull!10172) mapValue!33940)) b!960759))

(assert (= (and b!960758 ((_ is ValueCellFull!10172) mapDefault!33940)) b!960764))

(assert (= start!82496 b!960758))

(declare-fun m!891543 () Bool)

(assert (=> mapNonEmpty!33940 m!891543))

(declare-fun m!891545 () Bool)

(assert (=> b!960760 m!891545))

(assert (=> b!960760 m!891545))

(declare-fun m!891547 () Bool)

(assert (=> b!960760 m!891547))

(declare-fun m!891549 () Bool)

(assert (=> b!960765 m!891549))

(declare-fun m!891551 () Bool)

(assert (=> b!960763 m!891551))

(declare-fun m!891553 () Bool)

(assert (=> b!960766 m!891553))

(assert (=> b!960766 m!891545))

(assert (=> b!960766 m!891553))

(assert (=> b!960766 m!891545))

(declare-fun m!891555 () Bool)

(assert (=> b!960766 m!891555))

(declare-fun m!891557 () Bool)

(assert (=> start!82496 m!891557))

(declare-fun m!891559 () Bool)

(assert (=> start!82496 m!891559))

(declare-fun m!891561 () Bool)

(assert (=> start!82496 m!891561))

(check-sat (not b!960766) (not b!960765) (not b!960763) tp_is_empty!21307 (not b!960760) (not start!82496) (not mapNonEmpty!33940) b_and!30093 (not b_next!18595))
(check-sat b_and!30093 (not b_next!18595))
