; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81860 () Bool)

(assert start!81860)

(declare-fun b_free!18373 () Bool)

(declare-fun b_next!18373 () Bool)

(assert (=> start!81860 (= b_free!18373 (not b_next!18373))))

(declare-fun tp!63819 () Bool)

(declare-fun b_and!29833 () Bool)

(assert (=> start!81860 (= tp!63819 b_and!29833)))

(declare-fun b!954674 () Bool)

(declare-fun e!537840 () Bool)

(assert (=> b!954674 (= e!537840 false)))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32873 0))(
  ( (V!32874 (val!10509 Int)) )
))
(declare-fun zeroValue!1139 () V!32873)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun lt!429717 () Bool)

(declare-datatypes ((ValueCell!9977 0))(
  ( (ValueCellFull!9977 (v!13063 V!32873)) (EmptyCell!9977) )
))
(declare-datatypes ((array!57904 0))(
  ( (array!57905 (arr!27832 (Array (_ BitVec 32) ValueCell!9977)) (size!28313 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57904)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-datatypes ((array!57906 0))(
  ( (array!57907 (arr!27833 (Array (_ BitVec 32) (_ BitVec 64))) (size!28314 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57906)

(declare-fun minValue!1139 () V!32873)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13684 0))(
  ( (tuple2!13685 (_1!6853 (_ BitVec 64)) (_2!6853 V!32873)) )
))
(declare-datatypes ((List!19426 0))(
  ( (Nil!19423) (Cons!19422 (h!20584 tuple2!13684) (t!27778 List!19426)) )
))
(declare-datatypes ((ListLongMap!12371 0))(
  ( (ListLongMap!12372 (toList!6201 List!19426)) )
))
(declare-fun contains!5242 (ListLongMap!12371 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3363 (array!57906 array!57904 (_ BitVec 32) (_ BitVec 32) V!32873 V!32873 (_ BitVec 32) Int) ListLongMap!12371)

(assert (=> b!954674 (= lt!429717 (contains!5242 (getCurrentListMap!3363 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27833 _keys!1441) i!735)))))

(declare-fun res!639344 () Bool)

(assert (=> start!81860 (=> (not res!639344) (not e!537840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81860 (= res!639344 (validMask!0 mask!1823))))

(assert (=> start!81860 e!537840))

(assert (=> start!81860 true))

(declare-fun tp_is_empty!20917 () Bool)

(assert (=> start!81860 tp_is_empty!20917))

(declare-fun array_inv!21663 (array!57906) Bool)

(assert (=> start!81860 (array_inv!21663 _keys!1441)))

(declare-fun e!537836 () Bool)

(declare-fun array_inv!21664 (array!57904) Bool)

(assert (=> start!81860 (and (array_inv!21664 _values!1197) e!537836)))

(assert (=> start!81860 tp!63819))

(declare-fun b!954675 () Bool)

(declare-fun res!639346 () Bool)

(assert (=> b!954675 (=> (not res!639346) (not e!537840))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954675 (= res!639346 (validKeyInArray!0 (select (arr!27833 _keys!1441) i!735)))))

(declare-fun b!954676 () Bool)

(declare-fun res!639341 () Bool)

(assert (=> b!954676 (=> (not res!639341) (not e!537840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57906 (_ BitVec 32)) Bool)

(assert (=> b!954676 (= res!639341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!954677 () Bool)

(declare-fun e!537838 () Bool)

(assert (=> b!954677 (= e!537838 tp_is_empty!20917)))

(declare-fun b!954678 () Bool)

(declare-fun res!639342 () Bool)

(assert (=> b!954678 (=> (not res!639342) (not e!537840))))

(assert (=> b!954678 (= res!639342 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28314 _keys!1441))))))

(declare-fun mapIsEmpty!33337 () Bool)

(declare-fun mapRes!33337 () Bool)

(assert (=> mapIsEmpty!33337 mapRes!33337))

(declare-fun mapNonEmpty!33337 () Bool)

(declare-fun tp!63820 () Bool)

(declare-fun e!537837 () Bool)

(assert (=> mapNonEmpty!33337 (= mapRes!33337 (and tp!63820 e!537837))))

(declare-fun mapValue!33337 () ValueCell!9977)

(declare-fun mapKey!33337 () (_ BitVec 32))

(declare-fun mapRest!33337 () (Array (_ BitVec 32) ValueCell!9977))

(assert (=> mapNonEmpty!33337 (= (arr!27832 _values!1197) (store mapRest!33337 mapKey!33337 mapValue!33337))))

(declare-fun b!954679 () Bool)

(assert (=> b!954679 (= e!537836 (and e!537838 mapRes!33337))))

(declare-fun condMapEmpty!33337 () Bool)

(declare-fun mapDefault!33337 () ValueCell!9977)

(assert (=> b!954679 (= condMapEmpty!33337 (= (arr!27832 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9977)) mapDefault!33337)))))

(declare-fun b!954680 () Bool)

(assert (=> b!954680 (= e!537837 tp_is_empty!20917)))

(declare-fun b!954681 () Bool)

(declare-fun res!639345 () Bool)

(assert (=> b!954681 (=> (not res!639345) (not e!537840))))

(declare-datatypes ((List!19427 0))(
  ( (Nil!19424) (Cons!19423 (h!20585 (_ BitVec 64)) (t!27779 List!19427)) )
))
(declare-fun arrayNoDuplicates!0 (array!57906 (_ BitVec 32) List!19427) Bool)

(assert (=> b!954681 (= res!639345 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19424))))

(declare-fun b!954682 () Bool)

(declare-fun res!639343 () Bool)

(assert (=> b!954682 (=> (not res!639343) (not e!537840))))

(assert (=> b!954682 (= res!639343 (and (= (size!28313 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28314 _keys!1441) (size!28313 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(assert (= (and start!81860 res!639344) b!954682))

(assert (= (and b!954682 res!639343) b!954676))

(assert (= (and b!954676 res!639341) b!954681))

(assert (= (and b!954681 res!639345) b!954678))

(assert (= (and b!954678 res!639342) b!954675))

(assert (= (and b!954675 res!639346) b!954674))

(assert (= (and b!954679 condMapEmpty!33337) mapIsEmpty!33337))

(assert (= (and b!954679 (not condMapEmpty!33337)) mapNonEmpty!33337))

(get-info :version)

(assert (= (and mapNonEmpty!33337 ((_ is ValueCellFull!9977) mapValue!33337)) b!954680))

(assert (= (and b!954679 ((_ is ValueCellFull!9977) mapDefault!33337)) b!954677))

(assert (= start!81860 b!954679))

(declare-fun m!885765 () Bool)

(assert (=> b!954676 m!885765))

(declare-fun m!885767 () Bool)

(assert (=> b!954681 m!885767))

(declare-fun m!885769 () Bool)

(assert (=> mapNonEmpty!33337 m!885769))

(declare-fun m!885771 () Bool)

(assert (=> b!954674 m!885771))

(declare-fun m!885773 () Bool)

(assert (=> b!954674 m!885773))

(assert (=> b!954674 m!885771))

(assert (=> b!954674 m!885773))

(declare-fun m!885775 () Bool)

(assert (=> b!954674 m!885775))

(assert (=> b!954675 m!885773))

(assert (=> b!954675 m!885773))

(declare-fun m!885777 () Bool)

(assert (=> b!954675 m!885777))

(declare-fun m!885779 () Bool)

(assert (=> start!81860 m!885779))

(declare-fun m!885781 () Bool)

(assert (=> start!81860 m!885781))

(declare-fun m!885783 () Bool)

(assert (=> start!81860 m!885783))

(check-sat (not b_next!18373) (not b!954674) (not b!954681) (not start!81860) (not b!954675) tp_is_empty!20917 b_and!29833 (not b!954676) (not mapNonEmpty!33337))
(check-sat b_and!29833 (not b_next!18373))
