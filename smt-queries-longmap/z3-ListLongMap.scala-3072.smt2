; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43270 () Bool)

(assert start!43270)

(declare-fun b_free!12151 () Bool)

(declare-fun b_next!12151 () Bool)

(assert (=> start!43270 (= b_free!12151 (not b_next!12151))))

(declare-fun tp!42724 () Bool)

(declare-fun b_and!20877 () Bool)

(assert (=> start!43270 (= tp!42724 b_and!20877)))

(declare-fun mapIsEmpty!22192 () Bool)

(declare-fun mapRes!22192 () Bool)

(assert (=> mapIsEmpty!22192 mapRes!22192))

(declare-fun b!479281 () Bool)

(declare-fun res!285926 () Bool)

(declare-fun e!281973 () Bool)

(assert (=> b!479281 (=> (not res!285926) (not e!281973))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!30989 0))(
  ( (array!30990 (arr!14901 (Array (_ BitVec 32) (_ BitVec 64))) (size!15260 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30989)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19289 0))(
  ( (V!19290 (val!6879 Int)) )
))
(declare-datatypes ((ValueCell!6470 0))(
  ( (ValueCellFull!6470 (v!9162 V!19289)) (EmptyCell!6470) )
))
(declare-datatypes ((array!30991 0))(
  ( (array!30992 (arr!14902 (Array (_ BitVec 32) ValueCell!6470)) (size!15261 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30991)

(assert (=> b!479281 (= res!285926 (and (= (size!15261 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15260 _keys!1874) (size!15261 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!479282 () Bool)

(declare-fun res!285924 () Bool)

(assert (=> b!479282 (=> (not res!285924) (not e!281973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30989 (_ BitVec 32)) Bool)

(assert (=> b!479282 (= res!285924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun res!285927 () Bool)

(assert (=> start!43270 (=> (not res!285927) (not e!281973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43270 (= res!285927 (validMask!0 mask!2352))))

(assert (=> start!43270 e!281973))

(assert (=> start!43270 true))

(declare-fun tp_is_empty!13663 () Bool)

(assert (=> start!43270 tp_is_empty!13663))

(declare-fun e!281972 () Bool)

(declare-fun array_inv!10842 (array!30991) Bool)

(assert (=> start!43270 (and (array_inv!10842 _values!1516) e!281972)))

(assert (=> start!43270 tp!42724))

(declare-fun array_inv!10843 (array!30989) Bool)

(assert (=> start!43270 (array_inv!10843 _keys!1874)))

(declare-fun b!479283 () Bool)

(declare-fun e!281975 () Bool)

(assert (=> b!479283 (= e!281975 tp_is_empty!13663)))

(declare-fun mapNonEmpty!22192 () Bool)

(declare-fun tp!42723 () Bool)

(assert (=> mapNonEmpty!22192 (= mapRes!22192 (and tp!42723 e!281975))))

(declare-fun mapValue!22192 () ValueCell!6470)

(declare-fun mapRest!22192 () (Array (_ BitVec 32) ValueCell!6470))

(declare-fun mapKey!22192 () (_ BitVec 32))

(assert (=> mapNonEmpty!22192 (= (arr!14902 _values!1516) (store mapRest!22192 mapKey!22192 mapValue!22192))))

(declare-fun b!479284 () Bool)

(declare-fun res!285925 () Bool)

(assert (=> b!479284 (=> (not res!285925) (not e!281973))))

(declare-datatypes ((List!9147 0))(
  ( (Nil!9144) (Cons!9143 (h!9999 (_ BitVec 64)) (t!15344 List!9147)) )
))
(declare-fun arrayNoDuplicates!0 (array!30989 (_ BitVec 32) List!9147) Bool)

(assert (=> b!479284 (= res!285925 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9144))))

(declare-fun b!479285 () Bool)

(assert (=> b!479285 (= e!281973 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun lt!217645 () Bool)

(declare-fun zeroValue!1458 () V!19289)

(declare-fun minValue!1458 () V!19289)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9086 0))(
  ( (tuple2!9087 (_1!4554 (_ BitVec 64)) (_2!4554 V!19289)) )
))
(declare-datatypes ((List!9148 0))(
  ( (Nil!9145) (Cons!9144 (h!10000 tuple2!9086) (t!15345 List!9148)) )
))
(declare-datatypes ((ListLongMap!7989 0))(
  ( (ListLongMap!7990 (toList!4010 List!9148)) )
))
(declare-fun contains!2585 (ListLongMap!7989 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2263 (array!30989 array!30991 (_ BitVec 32) (_ BitVec 32) V!19289 V!19289 (_ BitVec 32) Int) ListLongMap!7989)

(assert (=> b!479285 (= lt!217645 (contains!2585 (getCurrentListMap!2263 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!479286 () Bool)

(declare-fun e!281974 () Bool)

(assert (=> b!479286 (= e!281974 tp_is_empty!13663)))

(declare-fun b!479287 () Bool)

(assert (=> b!479287 (= e!281972 (and e!281974 mapRes!22192))))

(declare-fun condMapEmpty!22192 () Bool)

(declare-fun mapDefault!22192 () ValueCell!6470)

(assert (=> b!479287 (= condMapEmpty!22192 (= (arr!14902 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6470)) mapDefault!22192)))))

(assert (= (and start!43270 res!285927) b!479281))

(assert (= (and b!479281 res!285926) b!479282))

(assert (= (and b!479282 res!285924) b!479284))

(assert (= (and b!479284 res!285925) b!479285))

(assert (= (and b!479287 condMapEmpty!22192) mapIsEmpty!22192))

(assert (= (and b!479287 (not condMapEmpty!22192)) mapNonEmpty!22192))

(get-info :version)

(assert (= (and mapNonEmpty!22192 ((_ is ValueCellFull!6470) mapValue!22192)) b!479283))

(assert (= (and b!479287 ((_ is ValueCellFull!6470) mapDefault!22192)) b!479286))

(assert (= start!43270 b!479287))

(declare-fun m!460737 () Bool)

(assert (=> mapNonEmpty!22192 m!460737))

(declare-fun m!460739 () Bool)

(assert (=> start!43270 m!460739))

(declare-fun m!460741 () Bool)

(assert (=> start!43270 m!460741))

(declare-fun m!460743 () Bool)

(assert (=> start!43270 m!460743))

(declare-fun m!460745 () Bool)

(assert (=> b!479282 m!460745))

(declare-fun m!460747 () Bool)

(assert (=> b!479284 m!460747))

(declare-fun m!460749 () Bool)

(assert (=> b!479285 m!460749))

(assert (=> b!479285 m!460749))

(declare-fun m!460751 () Bool)

(assert (=> b!479285 m!460751))

(check-sat (not start!43270) (not b!479282) (not b_next!12151) b_and!20877 (not b!479285) tp_is_empty!13663 (not b!479284) (not mapNonEmpty!22192))
(check-sat b_and!20877 (not b_next!12151))
