; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77528 () Bool)

(assert start!77528)

(declare-fun b_free!16113 () Bool)

(declare-fun b_next!16113 () Bool)

(assert (=> start!77528 (= b_free!16113 (not b_next!16113))))

(declare-fun tp!56600 () Bool)

(declare-fun b_and!26479 () Bool)

(assert (=> start!77528 (= tp!56600 b_and!26479)))

(declare-fun b!903320 () Bool)

(declare-fun e!506100 () Bool)

(declare-fun tp_is_empty!18531 () Bool)

(assert (=> b!903320 (= e!506100 tp_is_empty!18531)))

(declare-fun b!903321 () Bool)

(declare-fun e!506098 () Bool)

(assert (=> b!903321 (= e!506098 false)))

(declare-datatypes ((V!29673 0))(
  ( (V!29674 (val!9316 Int)) )
))
(declare-datatypes ((ValueCell!8784 0))(
  ( (ValueCellFull!8784 (v!11821 V!29673)) (EmptyCell!8784) )
))
(declare-datatypes ((array!53118 0))(
  ( (array!53119 (arr!25518 (Array (_ BitVec 32) ValueCell!8784)) (size!25977 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53118)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun lt!407991 () Bool)

(declare-fun zeroValue!1094 () V!29673)

(declare-datatypes ((array!53120 0))(
  ( (array!53121 (arr!25519 (Array (_ BitVec 32) (_ BitVec 64))) (size!25978 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53120)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29673)

(declare-datatypes ((tuple2!12096 0))(
  ( (tuple2!12097 (_1!6059 (_ BitVec 64)) (_2!6059 V!29673)) )
))
(declare-datatypes ((List!17917 0))(
  ( (Nil!17914) (Cons!17913 (h!19059 tuple2!12096) (t!25300 List!17917)) )
))
(declare-datatypes ((ListLongMap!10793 0))(
  ( (ListLongMap!10794 (toList!5412 List!17917)) )
))
(declare-fun contains!4460 (ListLongMap!10793 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2681 (array!53120 array!53118 (_ BitVec 32) (_ BitVec 32) V!29673 V!29673 (_ BitVec 32) Int) ListLongMap!10793)

(assert (=> b!903321 (= lt!407991 (contains!4460 (getCurrentListMap!2681 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!903322 () Bool)

(declare-fun e!506096 () Bool)

(assert (=> b!903322 (= e!506096 tp_is_empty!18531)))

(declare-fun b!903323 () Bool)

(declare-fun res!609475 () Bool)

(assert (=> b!903323 (=> (not res!609475) (not e!506098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53120 (_ BitVec 32)) Bool)

(assert (=> b!903323 (= res!609475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!29509 () Bool)

(declare-fun mapRes!29509 () Bool)

(declare-fun tp!56601 () Bool)

(assert (=> mapNonEmpty!29509 (= mapRes!29509 (and tp!56601 e!506100))))

(declare-fun mapRest!29509 () (Array (_ BitVec 32) ValueCell!8784))

(declare-fun mapKey!29509 () (_ BitVec 32))

(declare-fun mapValue!29509 () ValueCell!8784)

(assert (=> mapNonEmpty!29509 (= (arr!25518 _values!1152) (store mapRest!29509 mapKey!29509 mapValue!29509))))

(declare-fun b!903324 () Bool)

(declare-fun res!609476 () Bool)

(assert (=> b!903324 (=> (not res!609476) (not e!506098))))

(declare-datatypes ((List!17918 0))(
  ( (Nil!17915) (Cons!17914 (h!19060 (_ BitVec 64)) (t!25301 List!17918)) )
))
(declare-fun arrayNoDuplicates!0 (array!53120 (_ BitVec 32) List!17918) Bool)

(assert (=> b!903324 (= res!609476 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17915))))

(declare-fun b!903325 () Bool)

(declare-fun e!506097 () Bool)

(assert (=> b!903325 (= e!506097 (and e!506096 mapRes!29509))))

(declare-fun condMapEmpty!29509 () Bool)

(declare-fun mapDefault!29509 () ValueCell!8784)

(assert (=> b!903325 (= condMapEmpty!29509 (= (arr!25518 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8784)) mapDefault!29509)))))

(declare-fun b!903326 () Bool)

(declare-fun res!609473 () Bool)

(assert (=> b!903326 (=> (not res!609473) (not e!506098))))

(assert (=> b!903326 (= res!609473 (and (= (size!25977 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25978 _keys!1386) (size!25977 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!29509 () Bool)

(assert (=> mapIsEmpty!29509 mapRes!29509))

(declare-fun res!609474 () Bool)

(assert (=> start!77528 (=> (not res!609474) (not e!506098))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77528 (= res!609474 (validMask!0 mask!1756))))

(assert (=> start!77528 e!506098))

(declare-fun array_inv!20000 (array!53118) Bool)

(assert (=> start!77528 (and (array_inv!20000 _values!1152) e!506097)))

(assert (=> start!77528 tp!56600))

(assert (=> start!77528 true))

(assert (=> start!77528 tp_is_empty!18531))

(declare-fun array_inv!20001 (array!53120) Bool)

(assert (=> start!77528 (array_inv!20001 _keys!1386)))

(assert (= (and start!77528 res!609474) b!903326))

(assert (= (and b!903326 res!609473) b!903323))

(assert (= (and b!903323 res!609475) b!903324))

(assert (= (and b!903324 res!609476) b!903321))

(assert (= (and b!903325 condMapEmpty!29509) mapIsEmpty!29509))

(assert (= (and b!903325 (not condMapEmpty!29509)) mapNonEmpty!29509))

(get-info :version)

(assert (= (and mapNonEmpty!29509 ((_ is ValueCellFull!8784) mapValue!29509)) b!903320))

(assert (= (and b!903325 ((_ is ValueCellFull!8784) mapDefault!29509)) b!903322))

(assert (= start!77528 b!903325))

(declare-fun m!839033 () Bool)

(assert (=> b!903323 m!839033))

(declare-fun m!839035 () Bool)

(assert (=> mapNonEmpty!29509 m!839035))

(declare-fun m!839037 () Bool)

(assert (=> start!77528 m!839037))

(declare-fun m!839039 () Bool)

(assert (=> start!77528 m!839039))

(declare-fun m!839041 () Bool)

(assert (=> start!77528 m!839041))

(declare-fun m!839043 () Bool)

(assert (=> b!903324 m!839043))

(declare-fun m!839045 () Bool)

(assert (=> b!903321 m!839045))

(assert (=> b!903321 m!839045))

(declare-fun m!839047 () Bool)

(assert (=> b!903321 m!839047))

(check-sat tp_is_empty!18531 (not mapNonEmpty!29509) b_and!26479 (not b!903323) (not b_next!16113) (not start!77528) (not b!903324) (not b!903321))
(check-sat b_and!26479 (not b_next!16113))
