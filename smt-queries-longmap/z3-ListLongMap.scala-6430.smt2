; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82378 () Bool)

(assert start!82378)

(declare-fun b_free!18645 () Bool)

(declare-fun b_next!18645 () Bool)

(assert (=> start!82378 (= b_free!18645 (not b_next!18645))))

(declare-fun tp!64905 () Bool)

(declare-fun b_and!30133 () Bool)

(assert (=> start!82378 (= tp!64905 b_and!30133)))

(declare-fun b!960530 () Bool)

(declare-fun res!642963 () Bool)

(declare-fun e!541455 () Bool)

(assert (=> b!960530 (=> (not res!642963) (not e!541455))))

(declare-datatypes ((array!58803 0))(
  ( (array!58804 (arr!28275 (Array (_ BitVec 32) (_ BitVec 64))) (size!28754 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58803)

(declare-datatypes ((List!19661 0))(
  ( (Nil!19658) (Cons!19657 (h!20819 (_ BitVec 64)) (t!28024 List!19661)) )
))
(declare-fun arrayNoDuplicates!0 (array!58803 (_ BitVec 32) List!19661) Bool)

(assert (=> b!960530 (= res!642963 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19658))))

(declare-fun b!960531 () Bool)

(declare-fun e!541454 () Bool)

(declare-fun tp_is_empty!21357 () Bool)

(assert (=> b!960531 (= e!541454 tp_is_empty!21357)))

(declare-fun b!960532 () Bool)

(assert (=> b!960532 (= e!541455 false)))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33459 0))(
  ( (V!33460 (val!10729 Int)) )
))
(declare-fun minValue!1328 () V!33459)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10197 0))(
  ( (ValueCellFull!10197 (v!13286 V!33459)) (EmptyCell!10197) )
))
(declare-datatypes ((array!58805 0))(
  ( (array!58806 (arr!28276 (Array (_ BitVec 32) ValueCell!10197)) (size!28755 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58805)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33459)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun lt!430659 () Bool)

(declare-datatypes ((tuple2!13840 0))(
  ( (tuple2!13841 (_1!6931 (_ BitVec 64)) (_2!6931 V!33459)) )
))
(declare-datatypes ((List!19662 0))(
  ( (Nil!19659) (Cons!19658 (h!20820 tuple2!13840) (t!28025 List!19662)) )
))
(declare-datatypes ((ListLongMap!12537 0))(
  ( (ListLongMap!12538 (toList!6284 List!19662)) )
))
(declare-fun contains!5383 (ListLongMap!12537 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3517 (array!58803 array!58805 (_ BitVec 32) (_ BitVec 32) V!33459 V!33459 (_ BitVec 32) Int) ListLongMap!12537)

(assert (=> b!960532 (= lt!430659 (contains!5383 (getCurrentListMap!3517 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28275 _keys!1668) i!793)))))

(declare-fun mapNonEmpty!34015 () Bool)

(declare-fun mapRes!34015 () Bool)

(declare-fun tp!64904 () Bool)

(declare-fun e!541451 () Bool)

(assert (=> mapNonEmpty!34015 (= mapRes!34015 (and tp!64904 e!541451))))

(declare-fun mapKey!34015 () (_ BitVec 32))

(declare-fun mapValue!34015 () ValueCell!10197)

(declare-fun mapRest!34015 () (Array (_ BitVec 32) ValueCell!10197))

(assert (=> mapNonEmpty!34015 (= (arr!28276 _values!1386) (store mapRest!34015 mapKey!34015 mapValue!34015))))

(declare-fun b!960533 () Bool)

(declare-fun res!642965 () Bool)

(assert (=> b!960533 (=> (not res!642965) (not e!541455))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960533 (= res!642965 (validKeyInArray!0 (select (arr!28275 _keys!1668) i!793)))))

(declare-fun mapIsEmpty!34015 () Bool)

(assert (=> mapIsEmpty!34015 mapRes!34015))

(declare-fun b!960534 () Bool)

(assert (=> b!960534 (= e!541451 tp_is_empty!21357)))

(declare-fun b!960535 () Bool)

(declare-fun res!642962 () Bool)

(assert (=> b!960535 (=> (not res!642962) (not e!541455))))

(assert (=> b!960535 (= res!642962 (and (= (size!28755 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28754 _keys!1668) (size!28755 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!960536 () Bool)

(declare-fun res!642964 () Bool)

(assert (=> b!960536 (=> (not res!642964) (not e!541455))))

(assert (=> b!960536 (= res!642964 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28754 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28754 _keys!1668))))))

(declare-fun res!642960 () Bool)

(assert (=> start!82378 (=> (not res!642960) (not e!541455))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82378 (= res!642960 (validMask!0 mask!2088))))

(assert (=> start!82378 e!541455))

(assert (=> start!82378 true))

(assert (=> start!82378 tp_is_empty!21357))

(declare-fun array_inv!21911 (array!58803) Bool)

(assert (=> start!82378 (array_inv!21911 _keys!1668)))

(declare-fun e!541453 () Bool)

(declare-fun array_inv!21912 (array!58805) Bool)

(assert (=> start!82378 (and (array_inv!21912 _values!1386) e!541453)))

(assert (=> start!82378 tp!64905))

(declare-fun b!960537 () Bool)

(assert (=> b!960537 (= e!541453 (and e!541454 mapRes!34015))))

(declare-fun condMapEmpty!34015 () Bool)

(declare-fun mapDefault!34015 () ValueCell!10197)

(assert (=> b!960537 (= condMapEmpty!34015 (= (arr!28276 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10197)) mapDefault!34015)))))

(declare-fun b!960538 () Bool)

(declare-fun res!642961 () Bool)

(assert (=> b!960538 (=> (not res!642961) (not e!541455))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58803 (_ BitVec 32)) Bool)

(assert (=> b!960538 (= res!642961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(assert (= (and start!82378 res!642960) b!960535))

(assert (= (and b!960535 res!642962) b!960538))

(assert (= (and b!960538 res!642961) b!960530))

(assert (= (and b!960530 res!642963) b!960536))

(assert (= (and b!960536 res!642964) b!960533))

(assert (= (and b!960533 res!642965) b!960532))

(assert (= (and b!960537 condMapEmpty!34015) mapIsEmpty!34015))

(assert (= (and b!960537 (not condMapEmpty!34015)) mapNonEmpty!34015))

(get-info :version)

(assert (= (and mapNonEmpty!34015 ((_ is ValueCellFull!10197) mapValue!34015)) b!960534))

(assert (= (and b!960537 ((_ is ValueCellFull!10197) mapDefault!34015)) b!960531))

(assert (= start!82378 b!960537))

(declare-fun m!890749 () Bool)

(assert (=> mapNonEmpty!34015 m!890749))

(declare-fun m!890751 () Bool)

(assert (=> b!960530 m!890751))

(declare-fun m!890753 () Bool)

(assert (=> start!82378 m!890753))

(declare-fun m!890755 () Bool)

(assert (=> start!82378 m!890755))

(declare-fun m!890757 () Bool)

(assert (=> start!82378 m!890757))

(declare-fun m!890759 () Bool)

(assert (=> b!960533 m!890759))

(assert (=> b!960533 m!890759))

(declare-fun m!890761 () Bool)

(assert (=> b!960533 m!890761))

(declare-fun m!890763 () Bool)

(assert (=> b!960538 m!890763))

(declare-fun m!890765 () Bool)

(assert (=> b!960532 m!890765))

(assert (=> b!960532 m!890759))

(assert (=> b!960532 m!890765))

(assert (=> b!960532 m!890759))

(declare-fun m!890767 () Bool)

(assert (=> b!960532 m!890767))

(check-sat b_and!30133 (not b!960530) tp_is_empty!21357 (not b!960533) (not mapNonEmpty!34015) (not b!960538) (not start!82378) (not b!960532) (not b_next!18645))
(check-sat b_and!30133 (not b_next!18645))
