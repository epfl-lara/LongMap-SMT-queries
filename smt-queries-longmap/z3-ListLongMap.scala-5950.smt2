; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77508 () Bool)

(assert start!77508)

(declare-fun b_free!16111 () Bool)

(declare-fun b_next!16111 () Bool)

(assert (=> start!77508 (= b_free!16111 (not b_next!16111))))

(declare-fun tp!56596 () Bool)

(declare-fun b_and!26451 () Bool)

(assert (=> start!77508 (= tp!56596 b_and!26451)))

(declare-fun b!903060 () Bool)

(declare-fun e!505935 () Bool)

(declare-fun tp_is_empty!18529 () Bool)

(assert (=> b!903060 (= e!505935 tp_is_empty!18529)))

(declare-fun b!903061 () Bool)

(declare-fun e!505933 () Bool)

(assert (=> b!903061 (= e!505933 tp_is_empty!18529)))

(declare-fun b!903062 () Bool)

(declare-fun e!505936 () Bool)

(declare-fun mapRes!29506 () Bool)

(assert (=> b!903062 (= e!505936 (and e!505933 mapRes!29506))))

(declare-fun condMapEmpty!29506 () Bool)

(declare-datatypes ((V!29671 0))(
  ( (V!29672 (val!9315 Int)) )
))
(declare-datatypes ((ValueCell!8783 0))(
  ( (ValueCellFull!8783 (v!11819 V!29671)) (EmptyCell!8783) )
))
(declare-datatypes ((array!53097 0))(
  ( (array!53098 (arr!25508 (Array (_ BitVec 32) ValueCell!8783)) (size!25969 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53097)

(declare-fun mapDefault!29506 () ValueCell!8783)

(assert (=> b!903062 (= condMapEmpty!29506 (= (arr!25508 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8783)) mapDefault!29506)))))

(declare-fun mapNonEmpty!29506 () Bool)

(declare-fun tp!56595 () Bool)

(assert (=> mapNonEmpty!29506 (= mapRes!29506 (and tp!56595 e!505935))))

(declare-fun mapRest!29506 () (Array (_ BitVec 32) ValueCell!8783))

(declare-fun mapKey!29506 () (_ BitVec 32))

(declare-fun mapValue!29506 () ValueCell!8783)

(assert (=> mapNonEmpty!29506 (= (arr!25508 _values!1152) (store mapRest!29506 mapKey!29506 mapValue!29506))))

(declare-fun b!903063 () Bool)

(declare-fun res!609351 () Bool)

(declare-fun e!505934 () Bool)

(assert (=> b!903063 (=> (not res!609351) (not e!505934))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53099 0))(
  ( (array!53100 (arr!25509 (Array (_ BitVec 32) (_ BitVec 64))) (size!25970 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53099)

(assert (=> b!903063 (= res!609351 (and (= (size!25969 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25970 _keys!1386) (size!25969 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903064 () Bool)

(declare-fun res!609354 () Bool)

(assert (=> b!903064 (=> (not res!609354) (not e!505934))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53099 (_ BitVec 32)) Bool)

(assert (=> b!903064 (= res!609354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903065 () Bool)

(assert (=> b!903065 (= e!505934 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!407752 () Bool)

(declare-fun zeroValue!1094 () V!29671)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!29671)

(declare-datatypes ((tuple2!12122 0))(
  ( (tuple2!12123 (_1!6072 (_ BitVec 64)) (_2!6072 V!29671)) )
))
(declare-datatypes ((List!17928 0))(
  ( (Nil!17925) (Cons!17924 (h!19070 tuple2!12122) (t!25302 List!17928)) )
))
(declare-datatypes ((ListLongMap!10809 0))(
  ( (ListLongMap!10810 (toList!5420 List!17928)) )
))
(declare-fun contains!4431 (ListLongMap!10809 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2635 (array!53099 array!53097 (_ BitVec 32) (_ BitVec 32) V!29671 V!29671 (_ BitVec 32) Int) ListLongMap!10809)

(assert (=> b!903065 (= lt!407752 (contains!4431 (getCurrentListMap!2635 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!903066 () Bool)

(declare-fun res!609353 () Bool)

(assert (=> b!903066 (=> (not res!609353) (not e!505934))))

(declare-datatypes ((List!17929 0))(
  ( (Nil!17926) (Cons!17925 (h!19071 (_ BitVec 64)) (t!25303 List!17929)) )
))
(declare-fun arrayNoDuplicates!0 (array!53099 (_ BitVec 32) List!17929) Bool)

(assert (=> b!903066 (= res!609353 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17926))))

(declare-fun res!609352 () Bool)

(assert (=> start!77508 (=> (not res!609352) (not e!505934))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77508 (= res!609352 (validMask!0 mask!1756))))

(assert (=> start!77508 e!505934))

(declare-fun array_inv!20046 (array!53097) Bool)

(assert (=> start!77508 (and (array_inv!20046 _values!1152) e!505936)))

(assert (=> start!77508 tp!56596))

(assert (=> start!77508 true))

(assert (=> start!77508 tp_is_empty!18529))

(declare-fun array_inv!20047 (array!53099) Bool)

(assert (=> start!77508 (array_inv!20047 _keys!1386)))

(declare-fun mapIsEmpty!29506 () Bool)

(assert (=> mapIsEmpty!29506 mapRes!29506))

(assert (= (and start!77508 res!609352) b!903063))

(assert (= (and b!903063 res!609351) b!903064))

(assert (= (and b!903064 res!609354) b!903066))

(assert (= (and b!903066 res!609353) b!903065))

(assert (= (and b!903062 condMapEmpty!29506) mapIsEmpty!29506))

(assert (= (and b!903062 (not condMapEmpty!29506)) mapNonEmpty!29506))

(get-info :version)

(assert (= (and mapNonEmpty!29506 ((_ is ValueCellFull!8783) mapValue!29506)) b!903060))

(assert (= (and b!903062 ((_ is ValueCellFull!8783) mapDefault!29506)) b!903061))

(assert (= start!77508 b!903062))

(declare-fun m!838259 () Bool)

(assert (=> b!903066 m!838259))

(declare-fun m!838261 () Bool)

(assert (=> b!903065 m!838261))

(assert (=> b!903065 m!838261))

(declare-fun m!838263 () Bool)

(assert (=> b!903065 m!838263))

(declare-fun m!838265 () Bool)

(assert (=> b!903064 m!838265))

(declare-fun m!838267 () Bool)

(assert (=> mapNonEmpty!29506 m!838267))

(declare-fun m!838269 () Bool)

(assert (=> start!77508 m!838269))

(declare-fun m!838271 () Bool)

(assert (=> start!77508 m!838271))

(declare-fun m!838273 () Bool)

(assert (=> start!77508 m!838273))

(check-sat (not mapNonEmpty!29506) tp_is_empty!18529 (not b!903065) (not b_next!16111) b_and!26451 (not b!903064) (not b!903066) (not start!77508))
(check-sat b_and!26451 (not b_next!16111))
