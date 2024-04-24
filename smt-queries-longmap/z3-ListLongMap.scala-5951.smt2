; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77700 () Bool)

(assert start!77700)

(declare-fun b_free!16117 () Bool)

(declare-fun b_next!16117 () Bool)

(assert (=> start!77700 (= b_free!16117 (not b_next!16117))))

(declare-fun tp!56613 () Bool)

(declare-fun b_and!26493 () Bool)

(assert (=> start!77700 (= tp!56613 b_and!26493)))

(declare-fun mapNonEmpty!29515 () Bool)

(declare-fun mapRes!29515 () Bool)

(declare-fun tp!56614 () Bool)

(declare-fun e!506712 () Bool)

(assert (=> mapNonEmpty!29515 (= mapRes!29515 (and tp!56614 e!506712))))

(declare-datatypes ((V!29679 0))(
  ( (V!29680 (val!9318 Int)) )
))
(declare-datatypes ((ValueCell!8786 0))(
  ( (ValueCellFull!8786 (v!11820 V!29679)) (EmptyCell!8786) )
))
(declare-datatypes ((array!53165 0))(
  ( (array!53166 (arr!25537 (Array (_ BitVec 32) ValueCell!8786)) (size!25997 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53165)

(declare-fun mapRest!29515 () (Array (_ BitVec 32) ValueCell!8786))

(declare-fun mapKey!29515 () (_ BitVec 32))

(declare-fun mapValue!29515 () ValueCell!8786)

(assert (=> mapNonEmpty!29515 (= (arr!25537 _values!1152) (store mapRest!29515 mapKey!29515 mapValue!29515))))

(declare-fun b!904265 () Bool)

(declare-fun e!506710 () Bool)

(assert (=> b!904265 (= e!506710 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun lt!408358 () Bool)

(declare-fun zeroValue!1094 () V!29679)

(declare-datatypes ((array!53167 0))(
  ( (array!53168 (arr!25538 (Array (_ BitVec 32) (_ BitVec 64))) (size!25998 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53167)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29679)

(declare-datatypes ((tuple2!12032 0))(
  ( (tuple2!12033 (_1!6027 (_ BitVec 64)) (_2!6027 V!29679)) )
))
(declare-datatypes ((List!17883 0))(
  ( (Nil!17880) (Cons!17879 (h!19031 tuple2!12032) (t!25258 List!17883)) )
))
(declare-datatypes ((ListLongMap!10731 0))(
  ( (ListLongMap!10732 (toList!5381 List!17883)) )
))
(declare-fun contains!4439 (ListLongMap!10731 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2650 (array!53167 array!53165 (_ BitVec 32) (_ BitVec 32) V!29679 V!29679 (_ BitVec 32) Int) ListLongMap!10731)

(assert (=> b!904265 (= lt!408358 (contains!4439 (getCurrentListMap!2650 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!904266 () Bool)

(declare-fun res!609844 () Bool)

(assert (=> b!904266 (=> (not res!609844) (not e!506710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53167 (_ BitVec 32)) Bool)

(assert (=> b!904266 (= res!609844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!904267 () Bool)

(declare-fun e!506711 () Bool)

(declare-fun tp_is_empty!18535 () Bool)

(assert (=> b!904267 (= e!506711 tp_is_empty!18535)))

(declare-fun b!904268 () Bool)

(declare-fun res!609842 () Bool)

(assert (=> b!904268 (=> (not res!609842) (not e!506710))))

(declare-datatypes ((List!17884 0))(
  ( (Nil!17881) (Cons!17880 (h!19032 (_ BitVec 64)) (t!25259 List!17884)) )
))
(declare-fun arrayNoDuplicates!0 (array!53167 (_ BitVec 32) List!17884) Bool)

(assert (=> b!904268 (= res!609842 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17881))))

(declare-fun b!904269 () Bool)

(declare-fun e!506709 () Bool)

(assert (=> b!904269 (= e!506709 (and e!506711 mapRes!29515))))

(declare-fun condMapEmpty!29515 () Bool)

(declare-fun mapDefault!29515 () ValueCell!8786)

(assert (=> b!904269 (= condMapEmpty!29515 (= (arr!25537 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8786)) mapDefault!29515)))))

(declare-fun b!904270 () Bool)

(declare-fun res!609843 () Bool)

(assert (=> b!904270 (=> (not res!609843) (not e!506710))))

(assert (=> b!904270 (= res!609843 (and (= (size!25997 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25998 _keys!1386) (size!25997 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!609841 () Bool)

(assert (=> start!77700 (=> (not res!609841) (not e!506710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77700 (= res!609841 (validMask!0 mask!1756))))

(assert (=> start!77700 e!506710))

(declare-fun array_inv!20082 (array!53165) Bool)

(assert (=> start!77700 (and (array_inv!20082 _values!1152) e!506709)))

(assert (=> start!77700 tp!56613))

(assert (=> start!77700 true))

(assert (=> start!77700 tp_is_empty!18535))

(declare-fun array_inv!20083 (array!53167) Bool)

(assert (=> start!77700 (array_inv!20083 _keys!1386)))

(declare-fun b!904271 () Bool)

(assert (=> b!904271 (= e!506712 tp_is_empty!18535)))

(declare-fun mapIsEmpty!29515 () Bool)

(assert (=> mapIsEmpty!29515 mapRes!29515))

(assert (= (and start!77700 res!609841) b!904270))

(assert (= (and b!904270 res!609843) b!904266))

(assert (= (and b!904266 res!609844) b!904268))

(assert (= (and b!904268 res!609842) b!904265))

(assert (= (and b!904269 condMapEmpty!29515) mapIsEmpty!29515))

(assert (= (and b!904269 (not condMapEmpty!29515)) mapNonEmpty!29515))

(get-info :version)

(assert (= (and mapNonEmpty!29515 ((_ is ValueCellFull!8786) mapValue!29515)) b!904271))

(assert (= (and b!904269 ((_ is ValueCellFull!8786) mapDefault!29515)) b!904267))

(assert (= start!77700 b!904269))

(declare-fun m!840359 () Bool)

(assert (=> b!904265 m!840359))

(assert (=> b!904265 m!840359))

(declare-fun m!840361 () Bool)

(assert (=> b!904265 m!840361))

(declare-fun m!840363 () Bool)

(assert (=> start!77700 m!840363))

(declare-fun m!840365 () Bool)

(assert (=> start!77700 m!840365))

(declare-fun m!840367 () Bool)

(assert (=> start!77700 m!840367))

(declare-fun m!840369 () Bool)

(assert (=> b!904266 m!840369))

(declare-fun m!840371 () Bool)

(assert (=> mapNonEmpty!29515 m!840371))

(declare-fun m!840373 () Bool)

(assert (=> b!904268 m!840373))

(check-sat (not b!904266) tp_is_empty!18535 (not b!904268) (not start!77700) b_and!26493 (not b_next!16117) (not mapNonEmpty!29515) (not b!904265))
(check-sat b_and!26493 (not b_next!16117))
