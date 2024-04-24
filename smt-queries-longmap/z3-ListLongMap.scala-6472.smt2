; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82840 () Bool)

(assert start!82840)

(declare-fun b_free!18805 () Bool)

(declare-fun b_next!18805 () Bool)

(assert (=> start!82840 (= b_free!18805 (not b_next!18805))))

(declare-fun tp!65536 () Bool)

(declare-fun b_and!30303 () Bool)

(assert (=> start!82840 (= tp!65536 b_and!30303)))

(declare-fun b!964758 () Bool)

(declare-fun e!544007 () Bool)

(declare-fun tp_is_empty!21607 () Bool)

(assert (=> b!964758 (= e!544007 tp_is_empty!21607)))

(declare-fun b!964759 () Bool)

(declare-fun e!544005 () Bool)

(assert (=> b!964759 (= e!544005 tp_is_empty!21607)))

(declare-fun b!964760 () Bool)

(declare-fun e!544004 () Bool)

(declare-fun mapRes!34405 () Bool)

(assert (=> b!964760 (= e!544004 (and e!544007 mapRes!34405))))

(declare-fun condMapEmpty!34405 () Bool)

(declare-datatypes ((V!33793 0))(
  ( (V!33794 (val!10854 Int)) )
))
(declare-datatypes ((ValueCell!10322 0))(
  ( (ValueCellFull!10322 (v!13409 V!33793)) (EmptyCell!10322) )
))
(declare-datatypes ((array!59324 0))(
  ( (array!59325 (arr!28526 (Array (_ BitVec 32) ValueCell!10322)) (size!29006 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59324)

(declare-fun mapDefault!34405 () ValueCell!10322)

(assert (=> b!964760 (= condMapEmpty!34405 (= (arr!28526 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10322)) mapDefault!34405)))))

(declare-fun b!964761 () Bool)

(declare-fun res!645446 () Bool)

(declare-fun e!544006 () Bool)

(assert (=> b!964761 (=> (not res!645446) (not e!544006))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((array!59326 0))(
  ( (array!59327 (arr!28527 (Array (_ BitVec 32) (_ BitVec 64))) (size!29007 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59326)

(declare-fun minValue!1342 () V!33793)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33793)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13932 0))(
  ( (tuple2!13933 (_1!6977 (_ BitVec 64)) (_2!6977 V!33793)) )
))
(declare-datatypes ((List!19779 0))(
  ( (Nil!19776) (Cons!19775 (h!20943 tuple2!13932) (t!28134 List!19779)) )
))
(declare-datatypes ((ListLongMap!12631 0))(
  ( (ListLongMap!12632 (toList!6331 List!19779)) )
))
(declare-fun contains!5446 (ListLongMap!12631 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3564 (array!59326 array!59324 (_ BitVec 32) (_ BitVec 32) V!33793 V!33793 (_ BitVec 32) Int) ListLongMap!12631)

(assert (=> b!964761 (= res!645446 (contains!5446 (getCurrentListMap!3564 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28527 _keys!1686) i!803)))))

(declare-fun b!964762 () Bool)

(assert (=> b!964762 (= e!544006 (not true))))

(assert (=> b!964762 (contains!5446 (getCurrentListMap!3564 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28527 _keys!1686) i!803))))

(declare-datatypes ((Unit!32218 0))(
  ( (Unit!32219) )
))
(declare-fun lt!431372 () Unit!32218)

(declare-fun lemmaInListMapFromThenInFromMinusOne!23 (array!59326 array!59324 (_ BitVec 32) (_ BitVec 32) V!33793 V!33793 (_ BitVec 32) (_ BitVec 32) Int) Unit!32218)

(assert (=> b!964762 (= lt!431372 (lemmaInListMapFromThenInFromMinusOne!23 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!964763 () Bool)

(declare-fun res!645443 () Bool)

(assert (=> b!964763 (=> (not res!645443) (not e!544006))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59326 (_ BitVec 32)) Bool)

(assert (=> b!964763 (= res!645443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun res!645441 () Bool)

(assert (=> start!82840 (=> (not res!645441) (not e!544006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82840 (= res!645441 (validMask!0 mask!2110))))

(assert (=> start!82840 e!544006))

(assert (=> start!82840 true))

(declare-fun array_inv!22163 (array!59324) Bool)

(assert (=> start!82840 (and (array_inv!22163 _values!1400) e!544004)))

(declare-fun array_inv!22164 (array!59326) Bool)

(assert (=> start!82840 (array_inv!22164 _keys!1686)))

(assert (=> start!82840 tp!65536))

(assert (=> start!82840 tp_is_empty!21607))

(declare-fun mapIsEmpty!34405 () Bool)

(assert (=> mapIsEmpty!34405 mapRes!34405))

(declare-fun b!964764 () Bool)

(declare-fun res!645447 () Bool)

(assert (=> b!964764 (=> (not res!645447) (not e!544006))))

(assert (=> b!964764 (= res!645447 (and (= (size!29006 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29007 _keys!1686) (size!29006 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!964765 () Bool)

(declare-fun res!645444 () Bool)

(assert (=> b!964765 (=> (not res!645444) (not e!544006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964765 (= res!645444 (validKeyInArray!0 (select (arr!28527 _keys!1686) i!803)))))

(declare-fun b!964766 () Bool)

(declare-fun res!645445 () Bool)

(assert (=> b!964766 (=> (not res!645445) (not e!544006))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964766 (= res!645445 (bvsgt from!2084 newFrom!159))))

(declare-fun b!964767 () Bool)

(declare-fun res!645442 () Bool)

(assert (=> b!964767 (=> (not res!645442) (not e!544006))))

(declare-datatypes ((List!19780 0))(
  ( (Nil!19777) (Cons!19776 (h!20944 (_ BitVec 64)) (t!28135 List!19780)) )
))
(declare-fun arrayNoDuplicates!0 (array!59326 (_ BitVec 32) List!19780) Bool)

(assert (=> b!964767 (= res!645442 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19777))))

(declare-fun mapNonEmpty!34405 () Bool)

(declare-fun tp!65535 () Bool)

(assert (=> mapNonEmpty!34405 (= mapRes!34405 (and tp!65535 e!544005))))

(declare-fun mapRest!34405 () (Array (_ BitVec 32) ValueCell!10322))

(declare-fun mapValue!34405 () ValueCell!10322)

(declare-fun mapKey!34405 () (_ BitVec 32))

(assert (=> mapNonEmpty!34405 (= (arr!28526 _values!1400) (store mapRest!34405 mapKey!34405 mapValue!34405))))

(declare-fun b!964768 () Bool)

(declare-fun res!645440 () Bool)

(assert (=> b!964768 (=> (not res!645440) (not e!544006))))

(assert (=> b!964768 (= res!645440 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29007 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29007 _keys!1686))))))

(assert (= (and start!82840 res!645441) b!964764))

(assert (= (and b!964764 res!645447) b!964763))

(assert (= (and b!964763 res!645443) b!964767))

(assert (= (and b!964767 res!645442) b!964768))

(assert (= (and b!964768 res!645440) b!964765))

(assert (= (and b!964765 res!645444) b!964761))

(assert (= (and b!964761 res!645446) b!964766))

(assert (= (and b!964766 res!645445) b!964762))

(assert (= (and b!964760 condMapEmpty!34405) mapIsEmpty!34405))

(assert (= (and b!964760 (not condMapEmpty!34405)) mapNonEmpty!34405))

(get-info :version)

(assert (= (and mapNonEmpty!34405 ((_ is ValueCellFull!10322) mapValue!34405)) b!964759))

(assert (= (and b!964760 ((_ is ValueCellFull!10322) mapDefault!34405)) b!964758))

(assert (= start!82840 b!964760))

(declare-fun m!894481 () Bool)

(assert (=> b!964765 m!894481))

(assert (=> b!964765 m!894481))

(declare-fun m!894483 () Bool)

(assert (=> b!964765 m!894483))

(declare-fun m!894485 () Bool)

(assert (=> mapNonEmpty!34405 m!894485))

(declare-fun m!894487 () Bool)

(assert (=> b!964763 m!894487))

(declare-fun m!894489 () Bool)

(assert (=> b!964761 m!894489))

(assert (=> b!964761 m!894481))

(assert (=> b!964761 m!894489))

(assert (=> b!964761 m!894481))

(declare-fun m!894491 () Bool)

(assert (=> b!964761 m!894491))

(declare-fun m!894493 () Bool)

(assert (=> b!964762 m!894493))

(assert (=> b!964762 m!894481))

(assert (=> b!964762 m!894493))

(assert (=> b!964762 m!894481))

(declare-fun m!894495 () Bool)

(assert (=> b!964762 m!894495))

(declare-fun m!894497 () Bool)

(assert (=> b!964762 m!894497))

(declare-fun m!894499 () Bool)

(assert (=> b!964767 m!894499))

(declare-fun m!894501 () Bool)

(assert (=> start!82840 m!894501))

(declare-fun m!894503 () Bool)

(assert (=> start!82840 m!894503))

(declare-fun m!894505 () Bool)

(assert (=> start!82840 m!894505))

(check-sat (not mapNonEmpty!34405) b_and!30303 (not b_next!18805) (not b!964761) (not b!964765) (not start!82840) tp_is_empty!21607 (not b!964767) (not b!964762) (not b!964763))
(check-sat b_and!30303 (not b_next!18805))
