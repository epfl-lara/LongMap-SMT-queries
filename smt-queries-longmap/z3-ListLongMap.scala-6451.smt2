; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82548 () Bool)

(assert start!82548)

(declare-fun b_free!18681 () Bool)

(declare-fun b_next!18681 () Bool)

(assert (=> start!82548 (= b_free!18681 (not b_next!18681))))

(declare-fun tp!65162 () Bool)

(declare-fun b_and!30169 () Bool)

(assert (=> start!82548 (= tp!65162 b_and!30169)))

(declare-fun b!961979 () Bool)

(declare-fun e!542494 () Bool)

(declare-fun tp_is_empty!21483 () Bool)

(assert (=> b!961979 (= e!542494 tp_is_empty!21483)))

(declare-fun b!961980 () Bool)

(declare-fun res!643782 () Bool)

(declare-fun e!542491 () Bool)

(assert (=> b!961980 (=> (not res!643782) (not e!542491))))

(declare-datatypes ((array!59063 0))(
  ( (array!59064 (arr!28400 (Array (_ BitVec 32) (_ BitVec 64))) (size!28879 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59063)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59063 (_ BitVec 32)) Bool)

(assert (=> b!961980 (= res!643782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961981 () Bool)

(declare-fun res!643783 () Bool)

(assert (=> b!961981 (=> (not res!643783) (not e!542491))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!961981 (= res!643783 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28879 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28879 _keys!1686))))))

(declare-fun res!643780 () Bool)

(assert (=> start!82548 (=> (not res!643780) (not e!542491))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82548 (= res!643780 (validMask!0 mask!2110))))

(assert (=> start!82548 e!542491))

(assert (=> start!82548 true))

(declare-datatypes ((V!33627 0))(
  ( (V!33628 (val!10792 Int)) )
))
(declare-datatypes ((ValueCell!10260 0))(
  ( (ValueCellFull!10260 (v!13350 V!33627)) (EmptyCell!10260) )
))
(declare-datatypes ((array!59065 0))(
  ( (array!59066 (arr!28401 (Array (_ BitVec 32) ValueCell!10260)) (size!28880 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59065)

(declare-fun e!542493 () Bool)

(declare-fun array_inv!22009 (array!59065) Bool)

(assert (=> start!82548 (and (array_inv!22009 _values!1400) e!542493)))

(declare-fun array_inv!22010 (array!59063) Bool)

(assert (=> start!82548 (array_inv!22010 _keys!1686)))

(assert (=> start!82548 tp!65162))

(assert (=> start!82548 tp_is_empty!21483))

(declare-fun b!961982 () Bool)

(declare-fun mapRes!34219 () Bool)

(assert (=> b!961982 (= e!542493 (and e!542494 mapRes!34219))))

(declare-fun condMapEmpty!34219 () Bool)

(declare-fun mapDefault!34219 () ValueCell!10260)

(assert (=> b!961982 (= condMapEmpty!34219 (= (arr!28401 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10260)) mapDefault!34219)))))

(declare-fun b!961983 () Bool)

(assert (=> b!961983 (= e!542491 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33627)

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!430825 () Bool)

(declare-fun zeroValue!1342 () V!33627)

(declare-datatypes ((tuple2!13862 0))(
  ( (tuple2!13863 (_1!6942 (_ BitVec 64)) (_2!6942 V!33627)) )
))
(declare-datatypes ((List!19710 0))(
  ( (Nil!19707) (Cons!19706 (h!20868 tuple2!13862) (t!28073 List!19710)) )
))
(declare-datatypes ((ListLongMap!12559 0))(
  ( (ListLongMap!12560 (toList!6295 List!19710)) )
))
(declare-fun contains!5398 (ListLongMap!12559 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3528 (array!59063 array!59065 (_ BitVec 32) (_ BitVec 32) V!33627 V!33627 (_ BitVec 32) Int) ListLongMap!12559)

(assert (=> b!961983 (= lt!430825 (contains!5398 (getCurrentListMap!3528 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28400 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34219 () Bool)

(assert (=> mapIsEmpty!34219 mapRes!34219))

(declare-fun b!961984 () Bool)

(declare-fun res!643781 () Bool)

(assert (=> b!961984 (=> (not res!643781) (not e!542491))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!961984 (= res!643781 (validKeyInArray!0 (select (arr!28400 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34219 () Bool)

(declare-fun tp!65163 () Bool)

(declare-fun e!542495 () Bool)

(assert (=> mapNonEmpty!34219 (= mapRes!34219 (and tp!65163 e!542495))))

(declare-fun mapKey!34219 () (_ BitVec 32))

(declare-fun mapRest!34219 () (Array (_ BitVec 32) ValueCell!10260))

(declare-fun mapValue!34219 () ValueCell!10260)

(assert (=> mapNonEmpty!34219 (= (arr!28401 _values!1400) (store mapRest!34219 mapKey!34219 mapValue!34219))))

(declare-fun b!961985 () Bool)

(declare-fun res!643778 () Bool)

(assert (=> b!961985 (=> (not res!643778) (not e!542491))))

(assert (=> b!961985 (= res!643778 (and (= (size!28880 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28879 _keys!1686) (size!28880 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!961986 () Bool)

(assert (=> b!961986 (= e!542495 tp_is_empty!21483)))

(declare-fun b!961987 () Bool)

(declare-fun res!643779 () Bool)

(assert (=> b!961987 (=> (not res!643779) (not e!542491))))

(declare-datatypes ((List!19711 0))(
  ( (Nil!19708) (Cons!19707 (h!20869 (_ BitVec 64)) (t!28074 List!19711)) )
))
(declare-fun arrayNoDuplicates!0 (array!59063 (_ BitVec 32) List!19711) Bool)

(assert (=> b!961987 (= res!643779 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19708))))

(assert (= (and start!82548 res!643780) b!961985))

(assert (= (and b!961985 res!643778) b!961980))

(assert (= (and b!961980 res!643782) b!961987))

(assert (= (and b!961987 res!643779) b!961981))

(assert (= (and b!961981 res!643783) b!961984))

(assert (= (and b!961984 res!643781) b!961983))

(assert (= (and b!961982 condMapEmpty!34219) mapIsEmpty!34219))

(assert (= (and b!961982 (not condMapEmpty!34219)) mapNonEmpty!34219))

(get-info :version)

(assert (= (and mapNonEmpty!34219 ((_ is ValueCellFull!10260) mapValue!34219)) b!961986))

(assert (= (and b!961982 ((_ is ValueCellFull!10260) mapDefault!34219)) b!961979))

(assert (= start!82548 b!961982))

(declare-fun m!891749 () Bool)

(assert (=> b!961987 m!891749))

(declare-fun m!891751 () Bool)

(assert (=> b!961984 m!891751))

(assert (=> b!961984 m!891751))

(declare-fun m!891753 () Bool)

(assert (=> b!961984 m!891753))

(declare-fun m!891755 () Bool)

(assert (=> mapNonEmpty!34219 m!891755))

(declare-fun m!891757 () Bool)

(assert (=> start!82548 m!891757))

(declare-fun m!891759 () Bool)

(assert (=> start!82548 m!891759))

(declare-fun m!891761 () Bool)

(assert (=> start!82548 m!891761))

(declare-fun m!891763 () Bool)

(assert (=> b!961983 m!891763))

(assert (=> b!961983 m!891751))

(assert (=> b!961983 m!891763))

(assert (=> b!961983 m!891751))

(declare-fun m!891765 () Bool)

(assert (=> b!961983 m!891765))

(declare-fun m!891767 () Bool)

(assert (=> b!961980 m!891767))

(check-sat tp_is_empty!21483 (not b!961984) (not b!961980) (not start!82548) (not b!961987) (not mapNonEmpty!34219) b_and!30169 (not b!961983) (not b_next!18681))
(check-sat b_and!30169 (not b_next!18681))
