; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78020 () Bool)

(assert start!78020)

(declare-fun b_free!16411 () Bool)

(declare-fun b_next!16411 () Bool)

(assert (=> start!78020 (= b_free!16411 (not b_next!16411))))

(declare-fun tp!57499 () Bool)

(declare-fun b_and!26989 () Bool)

(assert (=> start!78020 (= tp!57499 b_and!26989)))

(declare-fun b!909979 () Bool)

(declare-fun e!510108 () Bool)

(declare-fun tp_is_empty!18829 () Bool)

(assert (=> b!909979 (= e!510108 tp_is_empty!18829)))

(declare-fun mapIsEmpty!29959 () Bool)

(declare-fun mapRes!29959 () Bool)

(assert (=> mapIsEmpty!29959 mapRes!29959))

(declare-fun b!909980 () Bool)

(declare-fun res!613949 () Bool)

(declare-fun e!510106 () Bool)

(assert (=> b!909980 (=> (not res!613949) (not e!510106))))

(declare-datatypes ((array!53733 0))(
  ( (array!53734 (arr!25820 (Array (_ BitVec 32) (_ BitVec 64))) (size!26280 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53733)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53733 (_ BitVec 32)) Bool)

(assert (=> b!909980 (= res!613949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909981 () Bool)

(declare-fun res!613947 () Bool)

(assert (=> b!909981 (=> (not res!613947) (not e!510106))))

(declare-datatypes ((V!30071 0))(
  ( (V!30072 (val!9465 Int)) )
))
(declare-datatypes ((ValueCell!8933 0))(
  ( (ValueCellFull!8933 (v!11969 V!30071)) (EmptyCell!8933) )
))
(declare-datatypes ((array!53735 0))(
  ( (array!53736 (arr!25821 (Array (_ BitVec 32) ValueCell!8933)) (size!26281 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53735)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!909981 (= res!613947 (and (= (size!26281 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26280 _keys!1386) (size!26281 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909982 () Bool)

(declare-fun e!510105 () Bool)

(assert (=> b!909982 (= e!510105 tp_is_empty!18829)))

(declare-fun b!909983 () Bool)

(declare-fun res!613948 () Bool)

(assert (=> b!909983 (=> (not res!613948) (not e!510106))))

(declare-datatypes ((List!18105 0))(
  ( (Nil!18102) (Cons!18101 (h!19253 (_ BitVec 64)) (t!25678 List!18105)) )
))
(declare-fun arrayNoDuplicates!0 (array!53733 (_ BitVec 32) List!18105) Bool)

(assert (=> b!909983 (= res!613948 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18102))))

(declare-fun mapNonEmpty!29959 () Bool)

(declare-fun tp!57498 () Bool)

(assert (=> mapNonEmpty!29959 (= mapRes!29959 (and tp!57498 e!510105))))

(declare-fun mapKey!29959 () (_ BitVec 32))

(declare-fun mapRest!29959 () (Array (_ BitVec 32) ValueCell!8933))

(declare-fun mapValue!29959 () ValueCell!8933)

(assert (=> mapNonEmpty!29959 (= (arr!25821 _values!1152) (store mapRest!29959 mapKey!29959 mapValue!29959))))

(declare-fun res!613946 () Bool)

(assert (=> start!78020 (=> (not res!613946) (not e!510106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78020 (= res!613946 (validMask!0 mask!1756))))

(assert (=> start!78020 e!510106))

(declare-fun e!510107 () Bool)

(declare-fun array_inv!20270 (array!53735) Bool)

(assert (=> start!78020 (and (array_inv!20270 _values!1152) e!510107)))

(assert (=> start!78020 tp!57499))

(assert (=> start!78020 true))

(assert (=> start!78020 tp_is_empty!18829))

(declare-fun array_inv!20271 (array!53733) Bool)

(assert (=> start!78020 (array_inv!20271 _keys!1386)))

(declare-fun b!909984 () Bool)

(assert (=> b!909984 (= e!510106 false)))

(declare-fun zeroValue!1094 () V!30071)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!410304 () Bool)

(declare-fun minValue!1094 () V!30071)

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((tuple2!12284 0))(
  ( (tuple2!12285 (_1!6153 (_ BitVec 64)) (_2!6153 V!30071)) )
))
(declare-datatypes ((List!18106 0))(
  ( (Nil!18103) (Cons!18102 (h!19254 tuple2!12284) (t!25679 List!18106)) )
))
(declare-datatypes ((ListLongMap!10983 0))(
  ( (ListLongMap!10984 (toList!5507 List!18106)) )
))
(declare-fun contains!4558 (ListLongMap!10983 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2768 (array!53733 array!53735 (_ BitVec 32) (_ BitVec 32) V!30071 V!30071 (_ BitVec 32) Int) ListLongMap!10983)

(assert (=> b!909984 (= lt!410304 (contains!4558 (getCurrentListMap!2768 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!909985 () Bool)

(assert (=> b!909985 (= e!510107 (and e!510108 mapRes!29959))))

(declare-fun condMapEmpty!29959 () Bool)

(declare-fun mapDefault!29959 () ValueCell!8933)

(assert (=> b!909985 (= condMapEmpty!29959 (= (arr!25821 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8933)) mapDefault!29959)))))

(assert (= (and start!78020 res!613946) b!909981))

(assert (= (and b!909981 res!613947) b!909980))

(assert (= (and b!909980 res!613949) b!909983))

(assert (= (and b!909983 res!613948) b!909984))

(assert (= (and b!909985 condMapEmpty!29959) mapIsEmpty!29959))

(assert (= (and b!909985 (not condMapEmpty!29959)) mapNonEmpty!29959))

(get-info :version)

(assert (= (and mapNonEmpty!29959 ((_ is ValueCellFull!8933) mapValue!29959)) b!909982))

(assert (= (and b!909985 ((_ is ValueCellFull!8933) mapDefault!29959)) b!909979))

(assert (= start!78020 b!909985))

(declare-fun m!845703 () Bool)

(assert (=> mapNonEmpty!29959 m!845703))

(declare-fun m!845705 () Bool)

(assert (=> b!909980 m!845705))

(declare-fun m!845707 () Bool)

(assert (=> b!909983 m!845707))

(declare-fun m!845709 () Bool)

(assert (=> start!78020 m!845709))

(declare-fun m!845711 () Bool)

(assert (=> start!78020 m!845711))

(declare-fun m!845713 () Bool)

(assert (=> start!78020 m!845713))

(declare-fun m!845715 () Bool)

(assert (=> b!909984 m!845715))

(assert (=> b!909984 m!845715))

(declare-fun m!845717 () Bool)

(assert (=> b!909984 m!845717))

(check-sat (not b_next!16411) (not b!909983) (not b!909984) (not b!909980) b_and!26989 (not mapNonEmpty!29959) tp_is_empty!18829 (not start!78020))
(check-sat b_and!26989 (not b_next!16411))
