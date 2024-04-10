; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83078 () Bool)

(assert start!83078)

(declare-fun b!969146 () Bool)

(declare-fun e!546330 () Bool)

(declare-fun tp_is_empty!21969 () Bool)

(assert (=> b!969146 (= e!546330 tp_is_empty!21969)))

(declare-fun b!969147 () Bool)

(declare-fun e!546332 () Bool)

(declare-fun e!546333 () Bool)

(declare-fun mapRes!34963 () Bool)

(assert (=> b!969147 (= e!546332 (and e!546333 mapRes!34963))))

(declare-fun condMapEmpty!34963 () Bool)

(declare-datatypes ((V!34275 0))(
  ( (V!34276 (val!11035 Int)) )
))
(declare-datatypes ((ValueCell!10503 0))(
  ( (ValueCellFull!10503 (v!13594 V!34275)) (EmptyCell!10503) )
))
(declare-datatypes ((array!60009 0))(
  ( (array!60010 (arr!28868 (Array (_ BitVec 32) ValueCell!10503)) (size!29347 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60009)

(declare-fun mapDefault!34963 () ValueCell!10503)

(assert (=> b!969147 (= condMapEmpty!34963 (= (arr!28868 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10503)) mapDefault!34963)))))

(declare-fun b!969149 () Bool)

(declare-fun res!648696 () Bool)

(declare-fun e!546334 () Bool)

(assert (=> b!969149 (=> (not res!648696) (not e!546334))))

(declare-datatypes ((array!60011 0))(
  ( (array!60012 (arr!28869 (Array (_ BitVec 32) (_ BitVec 64))) (size!29348 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60011)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60011 (_ BitVec 32)) Bool)

(assert (=> b!969149 (= res!648696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!34963 () Bool)

(assert (=> mapIsEmpty!34963 mapRes!34963))

(declare-fun b!969150 () Bool)

(declare-fun res!648694 () Bool)

(assert (=> b!969150 (=> (not res!648694) (not e!546334))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969150 (= res!648694 (and (= (size!29347 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29348 _keys!1717) (size!29347 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969151 () Bool)

(assert (=> b!969151 (= e!546333 tp_is_empty!21969)))

(declare-fun mapNonEmpty!34963 () Bool)

(declare-fun tp!66531 () Bool)

(assert (=> mapNonEmpty!34963 (= mapRes!34963 (and tp!66531 e!546330))))

(declare-fun mapValue!34963 () ValueCell!10503)

(declare-fun mapKey!34963 () (_ BitVec 32))

(declare-fun mapRest!34963 () (Array (_ BitVec 32) ValueCell!10503))

(assert (=> mapNonEmpty!34963 (= (arr!28868 _values!1425) (store mapRest!34963 mapKey!34963 mapValue!34963))))

(declare-fun b!969148 () Bool)

(assert (=> b!969148 (= e!546334 false)))

(declare-fun lt!431603 () Bool)

(declare-datatypes ((List!20017 0))(
  ( (Nil!20014) (Cons!20013 (h!21175 (_ BitVec 64)) (t!28380 List!20017)) )
))
(declare-fun arrayNoDuplicates!0 (array!60011 (_ BitVec 32) List!20017) Bool)

(assert (=> b!969148 (= lt!431603 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20014))))

(declare-fun res!648695 () Bool)

(assert (=> start!83078 (=> (not res!648695) (not e!546334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83078 (= res!648695 (validMask!0 mask!2147))))

(assert (=> start!83078 e!546334))

(assert (=> start!83078 true))

(declare-fun array_inv!22349 (array!60009) Bool)

(assert (=> start!83078 (and (array_inv!22349 _values!1425) e!546332)))

(declare-fun array_inv!22350 (array!60011) Bool)

(assert (=> start!83078 (array_inv!22350 _keys!1717)))

(assert (= (and start!83078 res!648695) b!969150))

(assert (= (and b!969150 res!648694) b!969149))

(assert (= (and b!969149 res!648696) b!969148))

(assert (= (and b!969147 condMapEmpty!34963) mapIsEmpty!34963))

(assert (= (and b!969147 (not condMapEmpty!34963)) mapNonEmpty!34963))

(get-info :version)

(assert (= (and mapNonEmpty!34963 ((_ is ValueCellFull!10503) mapValue!34963)) b!969146))

(assert (= (and b!969147 ((_ is ValueCellFull!10503) mapDefault!34963)) b!969151))

(assert (= start!83078 b!969147))

(declare-fun m!897247 () Bool)

(assert (=> b!969149 m!897247))

(declare-fun m!897249 () Bool)

(assert (=> mapNonEmpty!34963 m!897249))

(declare-fun m!897251 () Bool)

(assert (=> b!969148 m!897251))

(declare-fun m!897253 () Bool)

(assert (=> start!83078 m!897253))

(declare-fun m!897255 () Bool)

(assert (=> start!83078 m!897255))

(declare-fun m!897257 () Bool)

(assert (=> start!83078 m!897257))

(check-sat tp_is_empty!21969 (not b!969149) (not b!969148) (not mapNonEmpty!34963) (not start!83078))
(check-sat)
