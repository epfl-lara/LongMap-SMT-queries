; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82346 () Bool)

(assert start!82346)

(declare-fun b_free!18631 () Bool)

(declare-fun b_next!18631 () Bool)

(assert (=> start!82346 (= b_free!18631 (not b_next!18631))))

(declare-fun tp!64863 () Bool)

(declare-fun b_and!30093 () Bool)

(assert (=> start!82346 (= tp!64863 b_and!30093)))

(declare-fun b!960102 () Bool)

(declare-fun e!541198 () Bool)

(assert (=> b!960102 (= e!541198 false)))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33441 0))(
  ( (V!33442 (val!10722 Int)) )
))
(declare-fun minValue!1328 () V!33441)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun lt!430402 () Bool)

(declare-datatypes ((array!58712 0))(
  ( (array!58713 (arr!28230 (Array (_ BitVec 32) (_ BitVec 64))) (size!28711 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58712)

(declare-datatypes ((ValueCell!10190 0))(
  ( (ValueCellFull!10190 (v!13278 V!33441)) (EmptyCell!10190) )
))
(declare-datatypes ((array!58714 0))(
  ( (array!58715 (arr!28231 (Array (_ BitVec 32) ValueCell!10190)) (size!28712 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58714)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33441)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13884 0))(
  ( (tuple2!13885 (_1!6953 (_ BitVec 64)) (_2!6953 V!33441)) )
))
(declare-datatypes ((List!19668 0))(
  ( (Nil!19665) (Cons!19664 (h!20826 tuple2!13884) (t!28022 List!19668)) )
))
(declare-datatypes ((ListLongMap!12571 0))(
  ( (ListLongMap!12572 (toList!6301 List!19668)) )
))
(declare-fun contains!5344 (ListLongMap!12571 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3463 (array!58712 array!58714 (_ BitVec 32) (_ BitVec 32) V!33441 V!33441 (_ BitVec 32) Int) ListLongMap!12571)

(assert (=> b!960102 (= lt!430402 (contains!5344 (getCurrentListMap!3463 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28230 _keys!1668) i!793)))))

(declare-fun b!960103 () Bool)

(declare-fun res!642726 () Bool)

(assert (=> b!960103 (=> (not res!642726) (not e!541198))))

(assert (=> b!960103 (= res!642726 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28711 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28711 _keys!1668))))))

(declare-fun b!960104 () Bool)

(declare-fun e!541202 () Bool)

(declare-fun tp_is_empty!21343 () Bool)

(assert (=> b!960104 (= e!541202 tp_is_empty!21343)))

(declare-fun b!960106 () Bool)

(declare-fun res!642727 () Bool)

(assert (=> b!960106 (=> (not res!642727) (not e!541198))))

(declare-datatypes ((List!19669 0))(
  ( (Nil!19666) (Cons!19665 (h!20827 (_ BitVec 64)) (t!28023 List!19669)) )
))
(declare-fun arrayNoDuplicates!0 (array!58712 (_ BitVec 32) List!19669) Bool)

(assert (=> b!960106 (= res!642727 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19666))))

(declare-fun mapIsEmpty!33994 () Bool)

(declare-fun mapRes!33994 () Bool)

(assert (=> mapIsEmpty!33994 mapRes!33994))

(declare-fun b!960107 () Bool)

(declare-fun res!642725 () Bool)

(assert (=> b!960107 (=> (not res!642725) (not e!541198))))

(assert (=> b!960107 (= res!642725 (and (= (size!28712 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28711 _keys!1668) (size!28712 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33994 () Bool)

(declare-fun tp!64864 () Bool)

(assert (=> mapNonEmpty!33994 (= mapRes!33994 (and tp!64864 e!541202))))

(declare-fun mapValue!33994 () ValueCell!10190)

(declare-fun mapKey!33994 () (_ BitVec 32))

(declare-fun mapRest!33994 () (Array (_ BitVec 32) ValueCell!10190))

(assert (=> mapNonEmpty!33994 (= (arr!28231 _values!1386) (store mapRest!33994 mapKey!33994 mapValue!33994))))

(declare-fun b!960108 () Bool)

(declare-fun res!642729 () Bool)

(assert (=> b!960108 (=> (not res!642729) (not e!541198))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960108 (= res!642729 (validKeyInArray!0 (select (arr!28230 _keys!1668) i!793)))))

(declare-fun b!960109 () Bool)

(declare-fun e!541200 () Bool)

(assert (=> b!960109 (= e!541200 tp_is_empty!21343)))

(declare-fun b!960110 () Bool)

(declare-fun e!541199 () Bool)

(assert (=> b!960110 (= e!541199 (and e!541200 mapRes!33994))))

(declare-fun condMapEmpty!33994 () Bool)

(declare-fun mapDefault!33994 () ValueCell!10190)

(assert (=> b!960110 (= condMapEmpty!33994 (= (arr!28231 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10190)) mapDefault!33994)))))

(declare-fun b!960105 () Bool)

(declare-fun res!642728 () Bool)

(assert (=> b!960105 (=> (not res!642728) (not e!541198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58712 (_ BitVec 32)) Bool)

(assert (=> b!960105 (= res!642728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun res!642724 () Bool)

(assert (=> start!82346 (=> (not res!642724) (not e!541198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82346 (= res!642724 (validMask!0 mask!2088))))

(assert (=> start!82346 e!541198))

(assert (=> start!82346 true))

(assert (=> start!82346 tp_is_empty!21343))

(declare-fun array_inv!21941 (array!58712) Bool)

(assert (=> start!82346 (array_inv!21941 _keys!1668)))

(declare-fun array_inv!21942 (array!58714) Bool)

(assert (=> start!82346 (and (array_inv!21942 _values!1386) e!541199)))

(assert (=> start!82346 tp!64863))

(assert (= (and start!82346 res!642724) b!960107))

(assert (= (and b!960107 res!642725) b!960105))

(assert (= (and b!960105 res!642728) b!960106))

(assert (= (and b!960106 res!642727) b!960103))

(assert (= (and b!960103 res!642726) b!960108))

(assert (= (and b!960108 res!642729) b!960102))

(assert (= (and b!960110 condMapEmpty!33994) mapIsEmpty!33994))

(assert (= (and b!960110 (not condMapEmpty!33994)) mapNonEmpty!33994))

(get-info :version)

(assert (= (and mapNonEmpty!33994 ((_ is ValueCellFull!10190) mapValue!33994)) b!960104))

(assert (= (and b!960110 ((_ is ValueCellFull!10190) mapDefault!33994)) b!960109))

(assert (= start!82346 b!960110))

(declare-fun m!889851 () Bool)

(assert (=> b!960108 m!889851))

(assert (=> b!960108 m!889851))

(declare-fun m!889853 () Bool)

(assert (=> b!960108 m!889853))

(declare-fun m!889855 () Bool)

(assert (=> b!960106 m!889855))

(declare-fun m!889857 () Bool)

(assert (=> b!960102 m!889857))

(assert (=> b!960102 m!889851))

(assert (=> b!960102 m!889857))

(assert (=> b!960102 m!889851))

(declare-fun m!889859 () Bool)

(assert (=> b!960102 m!889859))

(declare-fun m!889861 () Bool)

(assert (=> mapNonEmpty!33994 m!889861))

(declare-fun m!889863 () Bool)

(assert (=> start!82346 m!889863))

(declare-fun m!889865 () Bool)

(assert (=> start!82346 m!889865))

(declare-fun m!889867 () Bool)

(assert (=> start!82346 m!889867))

(declare-fun m!889869 () Bool)

(assert (=> b!960105 m!889869))

(check-sat (not b_next!18631) (not b!960102) (not b!960106) (not start!82346) (not b!960108) tp_is_empty!21343 (not mapNonEmpty!33994) b_and!30093 (not b!960105))
(check-sat b_and!30093 (not b_next!18631))
