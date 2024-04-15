; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77514 () Bool)

(assert start!77514)

(declare-fun b_free!16117 () Bool)

(declare-fun b_next!16117 () Bool)

(assert (=> start!77514 (= b_free!16117 (not b_next!16117))))

(declare-fun tp!56614 () Bool)

(declare-fun b_and!26457 () Bool)

(assert (=> start!77514 (= tp!56614 b_and!26457)))

(declare-fun b!903123 () Bool)

(declare-fun e!505981 () Bool)

(declare-fun e!505978 () Bool)

(declare-fun mapRes!29515 () Bool)

(assert (=> b!903123 (= e!505981 (and e!505978 mapRes!29515))))

(declare-fun condMapEmpty!29515 () Bool)

(declare-datatypes ((V!29679 0))(
  ( (V!29680 (val!9318 Int)) )
))
(declare-datatypes ((ValueCell!8786 0))(
  ( (ValueCellFull!8786 (v!11822 V!29679)) (EmptyCell!8786) )
))
(declare-datatypes ((array!53109 0))(
  ( (array!53110 (arr!25514 (Array (_ BitVec 32) ValueCell!8786)) (size!25975 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53109)

(declare-fun mapDefault!29515 () ValueCell!8786)

(assert (=> b!903123 (= condMapEmpty!29515 (= (arr!25514 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8786)) mapDefault!29515)))))

(declare-fun res!609390 () Bool)

(declare-fun e!505979 () Bool)

(assert (=> start!77514 (=> (not res!609390) (not e!505979))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77514 (= res!609390 (validMask!0 mask!1756))))

(assert (=> start!77514 e!505979))

(declare-fun array_inv!20050 (array!53109) Bool)

(assert (=> start!77514 (and (array_inv!20050 _values!1152) e!505981)))

(assert (=> start!77514 tp!56614))

(assert (=> start!77514 true))

(declare-fun tp_is_empty!18535 () Bool)

(assert (=> start!77514 tp_is_empty!18535))

(declare-datatypes ((array!53111 0))(
  ( (array!53112 (arr!25515 (Array (_ BitVec 32) (_ BitVec 64))) (size!25976 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53111)

(declare-fun array_inv!20051 (array!53111) Bool)

(assert (=> start!77514 (array_inv!20051 _keys!1386)))

(declare-fun b!903124 () Bool)

(declare-fun res!609389 () Bool)

(assert (=> b!903124 (=> (not res!609389) (not e!505979))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53111 (_ BitVec 32)) Bool)

(assert (=> b!903124 (= res!609389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903125 () Bool)

(assert (=> b!903125 (= e!505978 tp_is_empty!18535)))

(declare-fun mapIsEmpty!29515 () Bool)

(assert (=> mapIsEmpty!29515 mapRes!29515))

(declare-fun mapNonEmpty!29515 () Bool)

(declare-fun tp!56613 () Bool)

(declare-fun e!505980 () Bool)

(assert (=> mapNonEmpty!29515 (= mapRes!29515 (and tp!56613 e!505980))))

(declare-fun mapRest!29515 () (Array (_ BitVec 32) ValueCell!8786))

(declare-fun mapKey!29515 () (_ BitVec 32))

(declare-fun mapValue!29515 () ValueCell!8786)

(assert (=> mapNonEmpty!29515 (= (arr!25514 _values!1152) (store mapRest!29515 mapKey!29515 mapValue!29515))))

(declare-fun b!903126 () Bool)

(assert (=> b!903126 (= e!505979 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29679)

(declare-fun lt!407761 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29679)

(declare-datatypes ((tuple2!12124 0))(
  ( (tuple2!12125 (_1!6073 (_ BitVec 64)) (_2!6073 V!29679)) )
))
(declare-datatypes ((List!17930 0))(
  ( (Nil!17927) (Cons!17926 (h!19072 tuple2!12124) (t!25304 List!17930)) )
))
(declare-datatypes ((ListLongMap!10811 0))(
  ( (ListLongMap!10812 (toList!5421 List!17930)) )
))
(declare-fun contains!4432 (ListLongMap!10811 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2636 (array!53111 array!53109 (_ BitVec 32) (_ BitVec 32) V!29679 V!29679 (_ BitVec 32) Int) ListLongMap!10811)

(assert (=> b!903126 (= lt!407761 (contains!4432 (getCurrentListMap!2636 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!903127 () Bool)

(declare-fun res!609387 () Bool)

(assert (=> b!903127 (=> (not res!609387) (not e!505979))))

(declare-datatypes ((List!17931 0))(
  ( (Nil!17928) (Cons!17927 (h!19073 (_ BitVec 64)) (t!25305 List!17931)) )
))
(declare-fun arrayNoDuplicates!0 (array!53111 (_ BitVec 32) List!17931) Bool)

(assert (=> b!903127 (= res!609387 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17928))))

(declare-fun b!903128 () Bool)

(assert (=> b!903128 (= e!505980 tp_is_empty!18535)))

(declare-fun b!903129 () Bool)

(declare-fun res!609388 () Bool)

(assert (=> b!903129 (=> (not res!609388) (not e!505979))))

(assert (=> b!903129 (= res!609388 (and (= (size!25975 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25976 _keys!1386) (size!25975 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(assert (= (and start!77514 res!609390) b!903129))

(assert (= (and b!903129 res!609388) b!903124))

(assert (= (and b!903124 res!609389) b!903127))

(assert (= (and b!903127 res!609387) b!903126))

(assert (= (and b!903123 condMapEmpty!29515) mapIsEmpty!29515))

(assert (= (and b!903123 (not condMapEmpty!29515)) mapNonEmpty!29515))

(get-info :version)

(assert (= (and mapNonEmpty!29515 ((_ is ValueCellFull!8786) mapValue!29515)) b!903128))

(assert (= (and b!903123 ((_ is ValueCellFull!8786) mapDefault!29515)) b!903125))

(assert (= start!77514 b!903123))

(declare-fun m!838307 () Bool)

(assert (=> mapNonEmpty!29515 m!838307))

(declare-fun m!838309 () Bool)

(assert (=> b!903124 m!838309))

(declare-fun m!838311 () Bool)

(assert (=> start!77514 m!838311))

(declare-fun m!838313 () Bool)

(assert (=> start!77514 m!838313))

(declare-fun m!838315 () Bool)

(assert (=> start!77514 m!838315))

(declare-fun m!838317 () Bool)

(assert (=> b!903127 m!838317))

(declare-fun m!838319 () Bool)

(assert (=> b!903126 m!838319))

(assert (=> b!903126 m!838319))

(declare-fun m!838321 () Bool)

(assert (=> b!903126 m!838321))

(check-sat tp_is_empty!18535 (not mapNonEmpty!29515) (not b!903126) b_and!26457 (not b!903124) (not b_next!16117) (not b!903127) (not start!77514))
(check-sat b_and!26457 (not b_next!16117))
