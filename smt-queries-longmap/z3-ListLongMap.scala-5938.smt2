; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77426 () Bool)

(assert start!77426)

(declare-fun res!608975 () Bool)

(declare-fun e!505369 () Bool)

(assert (=> start!77426 (=> (not res!608975) (not e!505369))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77426 (= res!608975 (validMask!0 mask!1756))))

(assert (=> start!77426 e!505369))

(assert (=> start!77426 true))

(declare-datatypes ((V!29575 0))(
  ( (V!29576 (val!9279 Int)) )
))
(declare-datatypes ((ValueCell!8747 0))(
  ( (ValueCellFull!8747 (v!11783 V!29575)) (EmptyCell!8747) )
))
(declare-datatypes ((array!52961 0))(
  ( (array!52962 (arr!25441 (Array (_ BitVec 32) ValueCell!8747)) (size!25902 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52961)

(declare-fun e!505370 () Bool)

(declare-fun array_inv!20006 (array!52961) Bool)

(assert (=> start!77426 (and (array_inv!20006 _values!1152) e!505370)))

(declare-datatypes ((array!52963 0))(
  ( (array!52964 (arr!25442 (Array (_ BitVec 32) (_ BitVec 64))) (size!25903 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52963)

(declare-fun array_inv!20007 (array!52963) Bool)

(assert (=> start!77426 (array_inv!20007 _keys!1386)))

(declare-fun mapIsEmpty!29395 () Bool)

(declare-fun mapRes!29395 () Bool)

(assert (=> mapIsEmpty!29395 mapRes!29395))

(declare-fun b!902339 () Bool)

(declare-fun e!505368 () Bool)

(declare-fun tp_is_empty!18457 () Bool)

(assert (=> b!902339 (= e!505368 tp_is_empty!18457)))

(declare-fun b!902340 () Bool)

(assert (=> b!902340 (= e!505370 (and e!505368 mapRes!29395))))

(declare-fun condMapEmpty!29395 () Bool)

(declare-fun mapDefault!29395 () ValueCell!8747)

(assert (=> b!902340 (= condMapEmpty!29395 (= (arr!25441 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8747)) mapDefault!29395)))))

(declare-fun b!902341 () Bool)

(declare-fun e!505367 () Bool)

(assert (=> b!902341 (= e!505367 tp_is_empty!18457)))

(declare-fun b!902342 () Bool)

(declare-fun res!608976 () Bool)

(assert (=> b!902342 (=> (not res!608976) (not e!505369))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!902342 (= res!608976 (and (= (size!25902 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25903 _keys!1386) (size!25902 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!29395 () Bool)

(declare-fun tp!56455 () Bool)

(assert (=> mapNonEmpty!29395 (= mapRes!29395 (and tp!56455 e!505367))))

(declare-fun mapKey!29395 () (_ BitVec 32))

(declare-fun mapValue!29395 () ValueCell!8747)

(declare-fun mapRest!29395 () (Array (_ BitVec 32) ValueCell!8747))

(assert (=> mapNonEmpty!29395 (= (arr!25441 _values!1152) (store mapRest!29395 mapKey!29395 mapValue!29395))))

(declare-fun b!902343 () Bool)

(assert (=> b!902343 (= e!505369 false)))

(declare-fun lt!407644 () Bool)

(declare-datatypes ((List!17899 0))(
  ( (Nil!17896) (Cons!17895 (h!19041 (_ BitVec 64)) (t!25273 List!17899)) )
))
(declare-fun arrayNoDuplicates!0 (array!52963 (_ BitVec 32) List!17899) Bool)

(assert (=> b!902343 (= lt!407644 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17896))))

(declare-fun b!902344 () Bool)

(declare-fun res!608974 () Bool)

(assert (=> b!902344 (=> (not res!608974) (not e!505369))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52963 (_ BitVec 32)) Bool)

(assert (=> b!902344 (= res!608974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!77426 res!608975) b!902342))

(assert (= (and b!902342 res!608976) b!902344))

(assert (= (and b!902344 res!608974) b!902343))

(assert (= (and b!902340 condMapEmpty!29395) mapIsEmpty!29395))

(assert (= (and b!902340 (not condMapEmpty!29395)) mapNonEmpty!29395))

(get-info :version)

(assert (= (and mapNonEmpty!29395 ((_ is ValueCellFull!8747) mapValue!29395)) b!902341))

(assert (= (and b!902340 ((_ is ValueCellFull!8747) mapDefault!29395)) b!902339))

(assert (= start!77426 b!902340))

(declare-fun m!837773 () Bool)

(assert (=> start!77426 m!837773))

(declare-fun m!837775 () Bool)

(assert (=> start!77426 m!837775))

(declare-fun m!837777 () Bool)

(assert (=> start!77426 m!837777))

(declare-fun m!837779 () Bool)

(assert (=> mapNonEmpty!29395 m!837779))

(declare-fun m!837781 () Bool)

(assert (=> b!902343 m!837781))

(declare-fun m!837783 () Bool)

(assert (=> b!902344 m!837783))

(check-sat tp_is_empty!18457 (not mapNonEmpty!29395) (not start!77426) (not b!902343) (not b!902344))
(check-sat)
