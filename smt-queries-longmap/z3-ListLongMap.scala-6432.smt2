; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82370 () Bool)

(assert start!82370)

(declare-fun b_free!18655 () Bool)

(declare-fun b_next!18655 () Bool)

(assert (=> start!82370 (= b_free!18655 (not b_next!18655))))

(declare-fun tp!64936 () Bool)

(declare-fun b_and!30117 () Bool)

(assert (=> start!82370 (= tp!64936 b_and!30117)))

(declare-fun b!960426 () Bool)

(declare-fun res!642940 () Bool)

(declare-fun e!541382 () Bool)

(assert (=> b!960426 (=> (not res!642940) (not e!541382))))

(declare-datatypes ((array!58760 0))(
  ( (array!58761 (arr!28254 (Array (_ BitVec 32) (_ BitVec 64))) (size!28735 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58760)

(declare-datatypes ((List!19684 0))(
  ( (Nil!19681) (Cons!19680 (h!20842 (_ BitVec 64)) (t!28038 List!19684)) )
))
(declare-fun arrayNoDuplicates!0 (array!58760 (_ BitVec 32) List!19684) Bool)

(assert (=> b!960426 (= res!642940 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19681))))

(declare-fun b!960427 () Bool)

(declare-fun e!541379 () Bool)

(declare-fun tp_is_empty!21367 () Bool)

(assert (=> b!960427 (= e!541379 tp_is_empty!21367)))

(declare-fun b!960428 () Bool)

(declare-fun e!541381 () Bool)

(declare-fun mapRes!34030 () Bool)

(assert (=> b!960428 (= e!541381 (and e!541379 mapRes!34030))))

(declare-fun condMapEmpty!34030 () Bool)

(declare-datatypes ((V!33473 0))(
  ( (V!33474 (val!10734 Int)) )
))
(declare-datatypes ((ValueCell!10202 0))(
  ( (ValueCellFull!10202 (v!13290 V!33473)) (EmptyCell!10202) )
))
(declare-datatypes ((array!58762 0))(
  ( (array!58763 (arr!28255 (Array (_ BitVec 32) ValueCell!10202)) (size!28736 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58762)

(declare-fun mapDefault!34030 () ValueCell!10202)

(assert (=> b!960428 (= condMapEmpty!34030 (= (arr!28255 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10202)) mapDefault!34030)))))

(declare-fun b!960430 () Bool)

(assert (=> b!960430 (= e!541382 false)))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun minValue!1328 () V!33473)

(declare-fun lt!430438 () Bool)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33473)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13900 0))(
  ( (tuple2!13901 (_1!6961 (_ BitVec 64)) (_2!6961 V!33473)) )
))
(declare-datatypes ((List!19685 0))(
  ( (Nil!19682) (Cons!19681 (h!20843 tuple2!13900) (t!28039 List!19685)) )
))
(declare-datatypes ((ListLongMap!12587 0))(
  ( (ListLongMap!12588 (toList!6309 List!19685)) )
))
(declare-fun contains!5352 (ListLongMap!12587 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3471 (array!58760 array!58762 (_ BitVec 32) (_ BitVec 32) V!33473 V!33473 (_ BitVec 32) Int) ListLongMap!12587)

(assert (=> b!960430 (= lt!430438 (contains!5352 (getCurrentListMap!3471 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28254 _keys!1668) i!793)))))

(declare-fun b!960431 () Bool)

(declare-fun res!642945 () Bool)

(assert (=> b!960431 (=> (not res!642945) (not e!541382))))

(assert (=> b!960431 (= res!642945 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28735 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28735 _keys!1668))))))

(declare-fun mapNonEmpty!34030 () Bool)

(declare-fun tp!64935 () Bool)

(declare-fun e!541380 () Bool)

(assert (=> mapNonEmpty!34030 (= mapRes!34030 (and tp!64935 e!541380))))

(declare-fun mapRest!34030 () (Array (_ BitVec 32) ValueCell!10202))

(declare-fun mapValue!34030 () ValueCell!10202)

(declare-fun mapKey!34030 () (_ BitVec 32))

(assert (=> mapNonEmpty!34030 (= (arr!28255 _values!1386) (store mapRest!34030 mapKey!34030 mapValue!34030))))

(declare-fun b!960432 () Bool)

(assert (=> b!960432 (= e!541380 tp_is_empty!21367)))

(declare-fun mapIsEmpty!34030 () Bool)

(assert (=> mapIsEmpty!34030 mapRes!34030))

(declare-fun b!960433 () Bool)

(declare-fun res!642943 () Bool)

(assert (=> b!960433 (=> (not res!642943) (not e!541382))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960433 (= res!642943 (validKeyInArray!0 (select (arr!28254 _keys!1668) i!793)))))

(declare-fun b!960434 () Bool)

(declare-fun res!642941 () Bool)

(assert (=> b!960434 (=> (not res!642941) (not e!541382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58760 (_ BitVec 32)) Bool)

(assert (=> b!960434 (= res!642941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!960429 () Bool)

(declare-fun res!642942 () Bool)

(assert (=> b!960429 (=> (not res!642942) (not e!541382))))

(assert (=> b!960429 (= res!642942 (and (= (size!28736 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28735 _keys!1668) (size!28736 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun res!642944 () Bool)

(assert (=> start!82370 (=> (not res!642944) (not e!541382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82370 (= res!642944 (validMask!0 mask!2088))))

(assert (=> start!82370 e!541382))

(assert (=> start!82370 true))

(assert (=> start!82370 tp_is_empty!21367))

(declare-fun array_inv!21953 (array!58760) Bool)

(assert (=> start!82370 (array_inv!21953 _keys!1668)))

(declare-fun array_inv!21954 (array!58762) Bool)

(assert (=> start!82370 (and (array_inv!21954 _values!1386) e!541381)))

(assert (=> start!82370 tp!64936))

(assert (= (and start!82370 res!642944) b!960429))

(assert (= (and b!960429 res!642942) b!960434))

(assert (= (and b!960434 res!642941) b!960426))

(assert (= (and b!960426 res!642940) b!960431))

(assert (= (and b!960431 res!642945) b!960433))

(assert (= (and b!960433 res!642943) b!960430))

(assert (= (and b!960428 condMapEmpty!34030) mapIsEmpty!34030))

(assert (= (and b!960428 (not condMapEmpty!34030)) mapNonEmpty!34030))

(get-info :version)

(assert (= (and mapNonEmpty!34030 ((_ is ValueCellFull!10202) mapValue!34030)) b!960432))

(assert (= (and b!960428 ((_ is ValueCellFull!10202) mapDefault!34030)) b!960427))

(assert (= start!82370 b!960428))

(declare-fun m!890091 () Bool)

(assert (=> b!960426 m!890091))

(declare-fun m!890093 () Bool)

(assert (=> b!960430 m!890093))

(declare-fun m!890095 () Bool)

(assert (=> b!960430 m!890095))

(assert (=> b!960430 m!890093))

(assert (=> b!960430 m!890095))

(declare-fun m!890097 () Bool)

(assert (=> b!960430 m!890097))

(assert (=> b!960433 m!890095))

(assert (=> b!960433 m!890095))

(declare-fun m!890099 () Bool)

(assert (=> b!960433 m!890099))

(declare-fun m!890101 () Bool)

(assert (=> start!82370 m!890101))

(declare-fun m!890103 () Bool)

(assert (=> start!82370 m!890103))

(declare-fun m!890105 () Bool)

(assert (=> start!82370 m!890105))

(declare-fun m!890107 () Bool)

(assert (=> b!960434 m!890107))

(declare-fun m!890109 () Bool)

(assert (=> mapNonEmpty!34030 m!890109))

(check-sat (not b!960426) (not b_next!18655) (not b!960430) tp_is_empty!21367 b_and!30117 (not b!960433) (not b!960434) (not mapNonEmpty!34030) (not start!82370))
(check-sat b_and!30117 (not b_next!18655))
