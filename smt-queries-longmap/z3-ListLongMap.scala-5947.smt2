; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77490 () Bool)

(assert start!77490)

(declare-fun b_free!16093 () Bool)

(declare-fun b_next!16093 () Bool)

(assert (=> start!77490 (= b_free!16093 (not b_next!16093))))

(declare-fun tp!56542 () Bool)

(declare-fun b_and!26433 () Bool)

(assert (=> start!77490 (= tp!56542 b_and!26433)))

(declare-fun mapIsEmpty!29479 () Bool)

(declare-fun mapRes!29479 () Bool)

(assert (=> mapIsEmpty!29479 mapRes!29479))

(declare-fun b!902871 () Bool)

(declare-fun res!609243 () Bool)

(declare-fun e!505801 () Bool)

(assert (=> b!902871 (=> (not res!609243) (not e!505801))))

(declare-datatypes ((array!53065 0))(
  ( (array!53066 (arr!25492 (Array (_ BitVec 32) (_ BitVec 64))) (size!25953 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53065)

(declare-datatypes ((List!17917 0))(
  ( (Nil!17914) (Cons!17913 (h!19059 (_ BitVec 64)) (t!25291 List!17917)) )
))
(declare-fun arrayNoDuplicates!0 (array!53065 (_ BitVec 32) List!17917) Bool)

(assert (=> b!902871 (= res!609243 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17914))))

(declare-fun b!902872 () Bool)

(declare-fun e!505799 () Bool)

(declare-fun tp_is_empty!18511 () Bool)

(assert (=> b!902872 (= e!505799 tp_is_empty!18511)))

(declare-fun res!609246 () Bool)

(assert (=> start!77490 (=> (not res!609246) (not e!505801))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77490 (= res!609246 (validMask!0 mask!1756))))

(assert (=> start!77490 e!505801))

(declare-datatypes ((V!29647 0))(
  ( (V!29648 (val!9306 Int)) )
))
(declare-datatypes ((ValueCell!8774 0))(
  ( (ValueCellFull!8774 (v!11810 V!29647)) (EmptyCell!8774) )
))
(declare-datatypes ((array!53067 0))(
  ( (array!53068 (arr!25493 (Array (_ BitVec 32) ValueCell!8774)) (size!25954 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53067)

(declare-fun e!505798 () Bool)

(declare-fun array_inv!20038 (array!53067) Bool)

(assert (=> start!77490 (and (array_inv!20038 _values!1152) e!505798)))

(assert (=> start!77490 tp!56542))

(assert (=> start!77490 true))

(assert (=> start!77490 tp_is_empty!18511))

(declare-fun array_inv!20039 (array!53065) Bool)

(assert (=> start!77490 (array_inv!20039 _keys!1386)))

(declare-fun b!902873 () Bool)

(declare-fun res!609245 () Bool)

(assert (=> b!902873 (=> (not res!609245) (not e!505801))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53065 (_ BitVec 32)) Bool)

(assert (=> b!902873 (= res!609245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!902874 () Bool)

(declare-fun e!505800 () Bool)

(assert (=> b!902874 (= e!505800 tp_is_empty!18511)))

(declare-fun b!902875 () Bool)

(assert (=> b!902875 (= e!505798 (and e!505799 mapRes!29479))))

(declare-fun condMapEmpty!29479 () Bool)

(declare-fun mapDefault!29479 () ValueCell!8774)

(assert (=> b!902875 (= condMapEmpty!29479 (= (arr!25493 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8774)) mapDefault!29479)))))

(declare-fun b!902876 () Bool)

(assert (=> b!902876 (= e!505801 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29647)

(declare-fun lt!407725 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29647)

(declare-datatypes ((tuple2!12110 0))(
  ( (tuple2!12111 (_1!6066 (_ BitVec 64)) (_2!6066 V!29647)) )
))
(declare-datatypes ((List!17918 0))(
  ( (Nil!17915) (Cons!17914 (h!19060 tuple2!12110) (t!25292 List!17918)) )
))
(declare-datatypes ((ListLongMap!10797 0))(
  ( (ListLongMap!10798 (toList!5414 List!17918)) )
))
(declare-fun contains!4425 (ListLongMap!10797 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2629 (array!53065 array!53067 (_ BitVec 32) (_ BitVec 32) V!29647 V!29647 (_ BitVec 32) Int) ListLongMap!10797)

(assert (=> b!902876 (= lt!407725 (contains!4425 (getCurrentListMap!2629 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapNonEmpty!29479 () Bool)

(declare-fun tp!56541 () Bool)

(assert (=> mapNonEmpty!29479 (= mapRes!29479 (and tp!56541 e!505800))))

(declare-fun mapRest!29479 () (Array (_ BitVec 32) ValueCell!8774))

(declare-fun mapValue!29479 () ValueCell!8774)

(declare-fun mapKey!29479 () (_ BitVec 32))

(assert (=> mapNonEmpty!29479 (= (arr!25493 _values!1152) (store mapRest!29479 mapKey!29479 mapValue!29479))))

(declare-fun b!902877 () Bool)

(declare-fun res!609244 () Bool)

(assert (=> b!902877 (=> (not res!609244) (not e!505801))))

(assert (=> b!902877 (= res!609244 (and (= (size!25954 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25953 _keys!1386) (size!25954 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(assert (= (and start!77490 res!609246) b!902877))

(assert (= (and b!902877 res!609244) b!902873))

(assert (= (and b!902873 res!609245) b!902871))

(assert (= (and b!902871 res!609243) b!902876))

(assert (= (and b!902875 condMapEmpty!29479) mapIsEmpty!29479))

(assert (= (and b!902875 (not condMapEmpty!29479)) mapNonEmpty!29479))

(get-info :version)

(assert (= (and mapNonEmpty!29479 ((_ is ValueCellFull!8774) mapValue!29479)) b!902874))

(assert (= (and b!902875 ((_ is ValueCellFull!8774) mapDefault!29479)) b!902872))

(assert (= start!77490 b!902875))

(declare-fun m!838115 () Bool)

(assert (=> b!902871 m!838115))

(declare-fun m!838117 () Bool)

(assert (=> b!902876 m!838117))

(assert (=> b!902876 m!838117))

(declare-fun m!838119 () Bool)

(assert (=> b!902876 m!838119))

(declare-fun m!838121 () Bool)

(assert (=> start!77490 m!838121))

(declare-fun m!838123 () Bool)

(assert (=> start!77490 m!838123))

(declare-fun m!838125 () Bool)

(assert (=> start!77490 m!838125))

(declare-fun m!838127 () Bool)

(assert (=> mapNonEmpty!29479 m!838127))

(declare-fun m!838129 () Bool)

(assert (=> b!902873 m!838129))

(check-sat (not b_next!16093) (not start!77490) tp_is_empty!18511 (not b!902873) b_and!26433 (not b!902876) (not b!902871) (not mapNonEmpty!29479))
(check-sat b_and!26433 (not b_next!16093))
