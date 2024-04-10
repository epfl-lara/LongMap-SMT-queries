; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43494 () Bool)

(assert start!43494)

(declare-fun b_free!12273 () Bool)

(declare-fun b_next!12273 () Bool)

(assert (=> start!43494 (= b_free!12273 (not b_next!12273))))

(declare-fun tp!43101 () Bool)

(declare-fun b_and!21033 () Bool)

(assert (=> start!43494 (= tp!43101 b_and!21033)))

(declare-fun b!481922 () Bool)

(declare-fun e!283550 () Bool)

(declare-fun tp_is_empty!13785 () Bool)

(assert (=> b!481922 (= e!283550 tp_is_empty!13785)))

(declare-fun b!481923 () Bool)

(declare-fun res!287292 () Bool)

(declare-fun e!283552 () Bool)

(assert (=> b!481923 (=> (not res!287292) (not e!283552))))

(declare-datatypes ((array!31229 0))(
  ( (array!31230 (arr!15017 (Array (_ BitVec 32) (_ BitVec 64))) (size!15375 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31229)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31229 (_ BitVec 32)) Bool)

(assert (=> b!481923 (= res!287292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun res!287290 () Bool)

(assert (=> start!43494 (=> (not res!287290) (not e!283552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43494 (= res!287290 (validMask!0 mask!2352))))

(assert (=> start!43494 e!283552))

(assert (=> start!43494 true))

(assert (=> start!43494 tp_is_empty!13785))

(declare-datatypes ((V!19451 0))(
  ( (V!19452 (val!6940 Int)) )
))
(declare-datatypes ((ValueCell!6531 0))(
  ( (ValueCellFull!6531 (v!9233 V!19451)) (EmptyCell!6531) )
))
(declare-datatypes ((array!31231 0))(
  ( (array!31232 (arr!15018 (Array (_ BitVec 32) ValueCell!6531)) (size!15376 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31231)

(declare-fun e!283553 () Bool)

(declare-fun array_inv!10830 (array!31231) Bool)

(assert (=> start!43494 (and (array_inv!10830 _values!1516) e!283553)))

(assert (=> start!43494 tp!43101))

(declare-fun array_inv!10831 (array!31229) Bool)

(assert (=> start!43494 (array_inv!10831 _keys!1874)))

(declare-fun b!481924 () Bool)

(declare-fun res!287291 () Bool)

(assert (=> b!481924 (=> (not res!287291) (not e!283552))))

(declare-datatypes ((List!9184 0))(
  ( (Nil!9181) (Cons!9180 (h!10036 (_ BitVec 64)) (t!15398 List!9184)) )
))
(declare-fun arrayNoDuplicates!0 (array!31229 (_ BitVec 32) List!9184) Bool)

(assert (=> b!481924 (= res!287291 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9181))))

(declare-fun mapIsEmpty!22387 () Bool)

(declare-fun mapRes!22387 () Bool)

(assert (=> mapIsEmpty!22387 mapRes!22387))

(declare-fun b!481925 () Bool)

(assert (=> b!481925 (= e!283552 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun minValue!1458 () V!19451)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun lt!218647 () Bool)

(declare-fun zeroValue!1458 () V!19451)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9104 0))(
  ( (tuple2!9105 (_1!4563 (_ BitVec 64)) (_2!4563 V!19451)) )
))
(declare-datatypes ((List!9185 0))(
  ( (Nil!9182) (Cons!9181 (h!10037 tuple2!9104) (t!15399 List!9185)) )
))
(declare-datatypes ((ListLongMap!8017 0))(
  ( (ListLongMap!8018 (toList!4024 List!9185)) )
))
(declare-fun contains!2638 (ListLongMap!8017 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2343 (array!31229 array!31231 (_ BitVec 32) (_ BitVec 32) V!19451 V!19451 (_ BitVec 32) Int) ListLongMap!8017)

(assert (=> b!481925 (= lt!218647 (contains!2638 (getCurrentListMap!2343 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!481926 () Bool)

(declare-fun e!283551 () Bool)

(assert (=> b!481926 (= e!283551 tp_is_empty!13785)))

(declare-fun b!481927 () Bool)

(declare-fun res!287293 () Bool)

(assert (=> b!481927 (=> (not res!287293) (not e!283552))))

(assert (=> b!481927 (= res!287293 (and (= (size!15376 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15375 _keys!1874) (size!15376 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!22387 () Bool)

(declare-fun tp!43102 () Bool)

(assert (=> mapNonEmpty!22387 (= mapRes!22387 (and tp!43102 e!283551))))

(declare-fun mapRest!22387 () (Array (_ BitVec 32) ValueCell!6531))

(declare-fun mapValue!22387 () ValueCell!6531)

(declare-fun mapKey!22387 () (_ BitVec 32))

(assert (=> mapNonEmpty!22387 (= (arr!15018 _values!1516) (store mapRest!22387 mapKey!22387 mapValue!22387))))

(declare-fun b!481928 () Bool)

(assert (=> b!481928 (= e!283553 (and e!283550 mapRes!22387))))

(declare-fun condMapEmpty!22387 () Bool)

(declare-fun mapDefault!22387 () ValueCell!6531)

(assert (=> b!481928 (= condMapEmpty!22387 (= (arr!15018 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6531)) mapDefault!22387)))))

(assert (= (and start!43494 res!287290) b!481927))

(assert (= (and b!481927 res!287293) b!481923))

(assert (= (and b!481923 res!287292) b!481924))

(assert (= (and b!481924 res!287291) b!481925))

(assert (= (and b!481928 condMapEmpty!22387) mapIsEmpty!22387))

(assert (= (and b!481928 (not condMapEmpty!22387)) mapNonEmpty!22387))

(get-info :version)

(assert (= (and mapNonEmpty!22387 ((_ is ValueCellFull!6531) mapValue!22387)) b!481926))

(assert (= (and b!481928 ((_ is ValueCellFull!6531) mapDefault!22387)) b!481922))

(assert (= start!43494 b!481928))

(declare-fun m!463299 () Bool)

(assert (=> b!481925 m!463299))

(assert (=> b!481925 m!463299))

(declare-fun m!463301 () Bool)

(assert (=> b!481925 m!463301))

(declare-fun m!463303 () Bool)

(assert (=> mapNonEmpty!22387 m!463303))

(declare-fun m!463305 () Bool)

(assert (=> b!481923 m!463305))

(declare-fun m!463307 () Bool)

(assert (=> b!481924 m!463307))

(declare-fun m!463309 () Bool)

(assert (=> start!43494 m!463309))

(declare-fun m!463311 () Bool)

(assert (=> start!43494 m!463311))

(declare-fun m!463313 () Bool)

(assert (=> start!43494 m!463313))

(check-sat (not b!481925) tp_is_empty!13785 (not start!43494) (not b!481923) (not mapNonEmpty!22387) b_and!21033 (not b!481924) (not b_next!12273))
(check-sat b_and!21033 (not b_next!12273))
