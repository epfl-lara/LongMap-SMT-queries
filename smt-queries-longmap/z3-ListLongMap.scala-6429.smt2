; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82372 () Bool)

(assert start!82372)

(declare-fun b_free!18639 () Bool)

(declare-fun b_next!18639 () Bool)

(assert (=> start!82372 (= b_free!18639 (not b_next!18639))))

(declare-fun tp!64886 () Bool)

(declare-fun b_and!30127 () Bool)

(assert (=> start!82372 (= tp!64886 b_and!30127)))

(declare-fun b!960449 () Bool)

(declare-fun res!642907 () Bool)

(declare-fun e!541409 () Bool)

(assert (=> b!960449 (=> (not res!642907) (not e!541409))))

(declare-datatypes ((array!58791 0))(
  ( (array!58792 (arr!28269 (Array (_ BitVec 32) (_ BitVec 64))) (size!28748 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58791)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58791 (_ BitVec 32)) Bool)

(assert (=> b!960449 (= res!642907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapNonEmpty!34006 () Bool)

(declare-fun mapRes!34006 () Bool)

(declare-fun tp!64887 () Bool)

(declare-fun e!541410 () Bool)

(assert (=> mapNonEmpty!34006 (= mapRes!34006 (and tp!64887 e!541410))))

(declare-fun mapKey!34006 () (_ BitVec 32))

(declare-datatypes ((V!33451 0))(
  ( (V!33452 (val!10726 Int)) )
))
(declare-datatypes ((ValueCell!10194 0))(
  ( (ValueCellFull!10194 (v!13283 V!33451)) (EmptyCell!10194) )
))
(declare-fun mapRest!34006 () (Array (_ BitVec 32) ValueCell!10194))

(declare-fun mapValue!34006 () ValueCell!10194)

(declare-datatypes ((array!58793 0))(
  ( (array!58794 (arr!28270 (Array (_ BitVec 32) ValueCell!10194)) (size!28749 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58793)

(assert (=> mapNonEmpty!34006 (= (arr!28270 _values!1386) (store mapRest!34006 mapKey!34006 mapValue!34006))))

(declare-fun b!960450 () Bool)

(declare-fun res!642910 () Bool)

(assert (=> b!960450 (=> (not res!642910) (not e!541409))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!960450 (= res!642910 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28748 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28748 _keys!1668))))))

(declare-fun b!960451 () Bool)

(declare-fun e!541407 () Bool)

(declare-fun e!541408 () Bool)

(assert (=> b!960451 (= e!541407 (and e!541408 mapRes!34006))))

(declare-fun condMapEmpty!34006 () Bool)

(declare-fun mapDefault!34006 () ValueCell!10194)

(assert (=> b!960451 (= condMapEmpty!34006 (= (arr!28270 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10194)) mapDefault!34006)))))

(declare-fun b!960452 () Bool)

(assert (=> b!960452 (= e!541409 false)))

(declare-fun minValue!1328 () V!33451)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun lt!430650 () Bool)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33451)

(declare-datatypes ((tuple2!13838 0))(
  ( (tuple2!13839 (_1!6930 (_ BitVec 64)) (_2!6930 V!33451)) )
))
(declare-datatypes ((List!19658 0))(
  ( (Nil!19655) (Cons!19654 (h!20816 tuple2!13838) (t!28021 List!19658)) )
))
(declare-datatypes ((ListLongMap!12535 0))(
  ( (ListLongMap!12536 (toList!6283 List!19658)) )
))
(declare-fun contains!5382 (ListLongMap!12535 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3516 (array!58791 array!58793 (_ BitVec 32) (_ BitVec 32) V!33451 V!33451 (_ BitVec 32) Int) ListLongMap!12535)

(assert (=> b!960452 (= lt!430650 (contains!5382 (getCurrentListMap!3516 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28269 _keys!1668) i!793)))))

(declare-fun b!960453 () Bool)

(declare-fun res!642908 () Bool)

(assert (=> b!960453 (=> (not res!642908) (not e!541409))))

(assert (=> b!960453 (= res!642908 (and (= (size!28749 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28748 _keys!1668) (size!28749 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!960454 () Bool)

(declare-fun res!642909 () Bool)

(assert (=> b!960454 (=> (not res!642909) (not e!541409))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960454 (= res!642909 (validKeyInArray!0 (select (arr!28269 _keys!1668) i!793)))))

(declare-fun b!960455 () Bool)

(declare-fun res!642906 () Bool)

(assert (=> b!960455 (=> (not res!642906) (not e!541409))))

(declare-datatypes ((List!19659 0))(
  ( (Nil!19656) (Cons!19655 (h!20817 (_ BitVec 64)) (t!28022 List!19659)) )
))
(declare-fun arrayNoDuplicates!0 (array!58791 (_ BitVec 32) List!19659) Bool)

(assert (=> b!960455 (= res!642906 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19656))))

(declare-fun mapIsEmpty!34006 () Bool)

(assert (=> mapIsEmpty!34006 mapRes!34006))

(declare-fun res!642911 () Bool)

(assert (=> start!82372 (=> (not res!642911) (not e!541409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82372 (= res!642911 (validMask!0 mask!2088))))

(assert (=> start!82372 e!541409))

(assert (=> start!82372 true))

(declare-fun tp_is_empty!21351 () Bool)

(assert (=> start!82372 tp_is_empty!21351))

(declare-fun array_inv!21905 (array!58791) Bool)

(assert (=> start!82372 (array_inv!21905 _keys!1668)))

(declare-fun array_inv!21906 (array!58793) Bool)

(assert (=> start!82372 (and (array_inv!21906 _values!1386) e!541407)))

(assert (=> start!82372 tp!64886))

(declare-fun b!960456 () Bool)

(assert (=> b!960456 (= e!541410 tp_is_empty!21351)))

(declare-fun b!960457 () Bool)

(assert (=> b!960457 (= e!541408 tp_is_empty!21351)))

(assert (= (and start!82372 res!642911) b!960453))

(assert (= (and b!960453 res!642908) b!960449))

(assert (= (and b!960449 res!642907) b!960455))

(assert (= (and b!960455 res!642906) b!960450))

(assert (= (and b!960450 res!642910) b!960454))

(assert (= (and b!960454 res!642909) b!960452))

(assert (= (and b!960451 condMapEmpty!34006) mapIsEmpty!34006))

(assert (= (and b!960451 (not condMapEmpty!34006)) mapNonEmpty!34006))

(get-info :version)

(assert (= (and mapNonEmpty!34006 ((_ is ValueCellFull!10194) mapValue!34006)) b!960456))

(assert (= (and b!960451 ((_ is ValueCellFull!10194) mapDefault!34006)) b!960457))

(assert (= start!82372 b!960451))

(declare-fun m!890689 () Bool)

(assert (=> b!960449 m!890689))

(declare-fun m!890691 () Bool)

(assert (=> b!960455 m!890691))

(declare-fun m!890693 () Bool)

(assert (=> b!960452 m!890693))

(declare-fun m!890695 () Bool)

(assert (=> b!960452 m!890695))

(assert (=> b!960452 m!890693))

(assert (=> b!960452 m!890695))

(declare-fun m!890697 () Bool)

(assert (=> b!960452 m!890697))

(assert (=> b!960454 m!890695))

(assert (=> b!960454 m!890695))

(declare-fun m!890699 () Bool)

(assert (=> b!960454 m!890699))

(declare-fun m!890701 () Bool)

(assert (=> mapNonEmpty!34006 m!890701))

(declare-fun m!890703 () Bool)

(assert (=> start!82372 m!890703))

(declare-fun m!890705 () Bool)

(assert (=> start!82372 m!890705))

(declare-fun m!890707 () Bool)

(assert (=> start!82372 m!890707))

(check-sat (not b!960455) (not start!82372) tp_is_empty!21351 (not b!960449) b_and!30127 (not mapNonEmpty!34006) (not b_next!18639) (not b!960452) (not b!960454))
(check-sat b_and!30127 (not b_next!18639))
