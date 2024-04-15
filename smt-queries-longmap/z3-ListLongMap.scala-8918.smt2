; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108176 () Bool)

(assert start!108176)

(declare-fun b_free!27871 () Bool)

(declare-fun b_next!27871 () Bool)

(assert (=> start!108176 (= b_free!27871 (not b_next!27871))))

(declare-fun tp!98570 () Bool)

(declare-fun b_and!45911 () Bool)

(assert (=> start!108176 (= tp!98570 b_and!45911)))

(declare-fun b!1277381 () Bool)

(declare-fun e!729519 () Bool)

(assert (=> b!1277381 (= e!729519 false)))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun lt!575520 () Bool)

(declare-fun defaultEntry!1195 () Int)

(declare-datatypes ((V!49665 0))(
  ( (V!49666 (val!16785 Int)) )
))
(declare-fun minValue!1129 () V!49665)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-datatypes ((ValueCell!15812 0))(
  ( (ValueCellFull!15812 (v!19382 V!49665)) (EmptyCell!15812) )
))
(declare-datatypes ((array!83833 0))(
  ( (array!83834 (arr!40427 (Array (_ BitVec 32) ValueCell!15812)) (size!40979 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83833)

(declare-fun zeroValue!1129 () V!49665)

(declare-datatypes ((array!83835 0))(
  ( (array!83836 (arr!40428 (Array (_ BitVec 32) (_ BitVec 64))) (size!40980 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83835)

(declare-datatypes ((tuple2!21610 0))(
  ( (tuple2!21611 (_1!10816 (_ BitVec 64)) (_2!10816 V!49665)) )
))
(declare-datatypes ((List!28780 0))(
  ( (Nil!28777) (Cons!28776 (h!29985 tuple2!21610) (t!42310 List!28780)) )
))
(declare-datatypes ((ListLongMap!19267 0))(
  ( (ListLongMap!19268 (toList!9649 List!28780)) )
))
(declare-fun contains!7690 (ListLongMap!19267 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4623 (array!83835 array!83833 (_ BitVec 32) (_ BitVec 32) V!49665 V!49665 (_ BitVec 32) Int) ListLongMap!19267)

(assert (=> b!1277381 (= lt!575520 (contains!7690 (getCurrentListMap!4623 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun res!848808 () Bool)

(assert (=> start!108176 (=> (not res!848808) (not e!729519))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108176 (= res!848808 (validMask!0 mask!1805))))

(assert (=> start!108176 e!729519))

(assert (=> start!108176 true))

(assert (=> start!108176 tp!98570))

(declare-fun tp_is_empty!33421 () Bool)

(assert (=> start!108176 tp_is_empty!33421))

(declare-fun e!729520 () Bool)

(declare-fun array_inv!30873 (array!83833) Bool)

(assert (=> start!108176 (and (array_inv!30873 _values!1187) e!729520)))

(declare-fun array_inv!30874 (array!83835) Bool)

(assert (=> start!108176 (array_inv!30874 _keys!1427)))

(declare-fun b!1277382 () Bool)

(declare-fun e!729518 () Bool)

(assert (=> b!1277382 (= e!729518 tp_is_empty!33421)))

(declare-fun b!1277383 () Bool)

(declare-fun res!848806 () Bool)

(assert (=> b!1277383 (=> (not res!848806) (not e!729519))))

(assert (=> b!1277383 (= res!848806 (and (= (size!40979 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40980 _keys!1427) (size!40979 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277384 () Bool)

(declare-fun res!848805 () Bool)

(assert (=> b!1277384 (=> (not res!848805) (not e!729519))))

(declare-datatypes ((List!28781 0))(
  ( (Nil!28778) (Cons!28777 (h!29986 (_ BitVec 64)) (t!42311 List!28781)) )
))
(declare-fun arrayNoDuplicates!0 (array!83835 (_ BitVec 32) List!28781) Bool)

(assert (=> b!1277384 (= res!848805 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28778))))

(declare-fun b!1277385 () Bool)

(declare-fun mapRes!51665 () Bool)

(assert (=> b!1277385 (= e!729520 (and e!729518 mapRes!51665))))

(declare-fun condMapEmpty!51665 () Bool)

(declare-fun mapDefault!51665 () ValueCell!15812)

(assert (=> b!1277385 (= condMapEmpty!51665 (= (arr!40427 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15812)) mapDefault!51665)))))

(declare-fun mapIsEmpty!51665 () Bool)

(assert (=> mapIsEmpty!51665 mapRes!51665))

(declare-fun b!1277386 () Bool)

(declare-fun res!848807 () Bool)

(assert (=> b!1277386 (=> (not res!848807) (not e!729519))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83835 (_ BitVec 32)) Bool)

(assert (=> b!1277386 (= res!848807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1277387 () Bool)

(declare-fun e!729516 () Bool)

(assert (=> b!1277387 (= e!729516 tp_is_empty!33421)))

(declare-fun mapNonEmpty!51665 () Bool)

(declare-fun tp!98571 () Bool)

(assert (=> mapNonEmpty!51665 (= mapRes!51665 (and tp!98571 e!729516))))

(declare-fun mapRest!51665 () (Array (_ BitVec 32) ValueCell!15812))

(declare-fun mapKey!51665 () (_ BitVec 32))

(declare-fun mapValue!51665 () ValueCell!15812)

(assert (=> mapNonEmpty!51665 (= (arr!40427 _values!1187) (store mapRest!51665 mapKey!51665 mapValue!51665))))

(assert (= (and start!108176 res!848808) b!1277383))

(assert (= (and b!1277383 res!848806) b!1277386))

(assert (= (and b!1277386 res!848807) b!1277384))

(assert (= (and b!1277384 res!848805) b!1277381))

(assert (= (and b!1277385 condMapEmpty!51665) mapIsEmpty!51665))

(assert (= (and b!1277385 (not condMapEmpty!51665)) mapNonEmpty!51665))

(get-info :version)

(assert (= (and mapNonEmpty!51665 ((_ is ValueCellFull!15812) mapValue!51665)) b!1277387))

(assert (= (and b!1277385 ((_ is ValueCellFull!15812) mapDefault!51665)) b!1277382))

(assert (= start!108176 b!1277385))

(declare-fun m!1172565 () Bool)

(assert (=> start!108176 m!1172565))

(declare-fun m!1172567 () Bool)

(assert (=> start!108176 m!1172567))

(declare-fun m!1172569 () Bool)

(assert (=> start!108176 m!1172569))

(declare-fun m!1172571 () Bool)

(assert (=> b!1277381 m!1172571))

(assert (=> b!1277381 m!1172571))

(declare-fun m!1172573 () Bool)

(assert (=> b!1277381 m!1172573))

(declare-fun m!1172575 () Bool)

(assert (=> mapNonEmpty!51665 m!1172575))

(declare-fun m!1172577 () Bool)

(assert (=> b!1277386 m!1172577))

(declare-fun m!1172579 () Bool)

(assert (=> b!1277384 m!1172579))

(check-sat (not b!1277381) (not b!1277384) (not b_next!27871) tp_is_empty!33421 b_and!45911 (not start!108176) (not mapNonEmpty!51665) (not b!1277386))
(check-sat b_and!45911 (not b_next!27871))
