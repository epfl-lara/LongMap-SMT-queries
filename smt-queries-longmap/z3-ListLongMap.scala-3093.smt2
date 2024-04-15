; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43484 () Bool)

(assert start!43484)

(declare-fun b_free!12277 () Bool)

(declare-fun b_next!12277 () Bool)

(assert (=> start!43484 (= b_free!12277 (not b_next!12277))))

(declare-fun tp!43113 () Bool)

(declare-fun b_and!21011 () Bool)

(assert (=> start!43484 (= tp!43113 b_and!21011)))

(declare-fun b!481693 () Bool)

(declare-fun res!287186 () Bool)

(declare-fun e!283406 () Bool)

(assert (=> b!481693 (=> (not res!287186) (not e!283406))))

(declare-datatypes ((array!31235 0))(
  ( (array!31236 (arr!15020 (Array (_ BitVec 32) (_ BitVec 64))) (size!15379 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31235)

(declare-datatypes ((List!9225 0))(
  ( (Nil!9222) (Cons!9221 (h!10077 (_ BitVec 64)) (t!15430 List!9225)) )
))
(declare-fun arrayNoDuplicates!0 (array!31235 (_ BitVec 32) List!9225) Bool)

(assert (=> b!481693 (= res!287186 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9222))))

(declare-fun b!481695 () Bool)

(declare-fun res!287188 () Bool)

(assert (=> b!481695 (=> (not res!287188) (not e!283406))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19457 0))(
  ( (V!19458 (val!6942 Int)) )
))
(declare-datatypes ((ValueCell!6533 0))(
  ( (ValueCellFull!6533 (v!9229 V!19457)) (EmptyCell!6533) )
))
(declare-datatypes ((array!31237 0))(
  ( (array!31238 (arr!15021 (Array (_ BitVec 32) ValueCell!6533)) (size!15380 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31237)

(assert (=> b!481695 (= res!287188 (and (= (size!15380 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15379 _keys!1874) (size!15380 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!22393 () Bool)

(declare-fun mapRes!22393 () Bool)

(assert (=> mapIsEmpty!22393 mapRes!22393))

(declare-fun mapNonEmpty!22393 () Bool)

(declare-fun tp!43114 () Bool)

(declare-fun e!283409 () Bool)

(assert (=> mapNonEmpty!22393 (= mapRes!22393 (and tp!43114 e!283409))))

(declare-fun mapValue!22393 () ValueCell!6533)

(declare-fun mapKey!22393 () (_ BitVec 32))

(declare-fun mapRest!22393 () (Array (_ BitVec 32) ValueCell!6533))

(assert (=> mapNonEmpty!22393 (= (arr!15021 _values!1516) (store mapRest!22393 mapKey!22393 mapValue!22393))))

(declare-fun b!481696 () Bool)

(declare-fun e!283407 () Bool)

(declare-fun tp_is_empty!13789 () Bool)

(assert (=> b!481696 (= e!283407 tp_is_empty!13789)))

(declare-fun b!481697 () Bool)

(declare-fun e!283408 () Bool)

(assert (=> b!481697 (= e!283408 (and e!283407 mapRes!22393))))

(declare-fun condMapEmpty!22393 () Bool)

(declare-fun mapDefault!22393 () ValueCell!6533)

(assert (=> b!481697 (= condMapEmpty!22393 (= (arr!15021 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6533)) mapDefault!22393)))))

(declare-fun b!481694 () Bool)

(assert (=> b!481694 (= e!283406 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun minValue!1458 () V!19457)

(declare-fun lt!218419 () Bool)

(declare-fun defaultEntry!1519 () Int)

(declare-fun zeroValue!1458 () V!19457)

(declare-datatypes ((tuple2!9160 0))(
  ( (tuple2!9161 (_1!4591 (_ BitVec 64)) (_2!4591 V!19457)) )
))
(declare-datatypes ((List!9226 0))(
  ( (Nil!9223) (Cons!9222 (h!10078 tuple2!9160) (t!15431 List!9226)) )
))
(declare-datatypes ((ListLongMap!8063 0))(
  ( (ListLongMap!8064 (toList!4047 List!9226)) )
))
(declare-fun contains!2626 (ListLongMap!8063 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2300 (array!31235 array!31237 (_ BitVec 32) (_ BitVec 32) V!19457 V!19457 (_ BitVec 32) Int) ListLongMap!8063)

(assert (=> b!481694 (= lt!218419 (contains!2626 (getCurrentListMap!2300 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun res!287185 () Bool)

(assert (=> start!43484 (=> (not res!287185) (not e!283406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43484 (= res!287185 (validMask!0 mask!2352))))

(assert (=> start!43484 e!283406))

(assert (=> start!43484 true))

(assert (=> start!43484 tp_is_empty!13789))

(declare-fun array_inv!10922 (array!31237) Bool)

(assert (=> start!43484 (and (array_inv!10922 _values!1516) e!283408)))

(assert (=> start!43484 tp!43113))

(declare-fun array_inv!10923 (array!31235) Bool)

(assert (=> start!43484 (array_inv!10923 _keys!1874)))

(declare-fun b!481698 () Bool)

(assert (=> b!481698 (= e!283409 tp_is_empty!13789)))

(declare-fun b!481699 () Bool)

(declare-fun res!287187 () Bool)

(assert (=> b!481699 (=> (not res!287187) (not e!283406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31235 (_ BitVec 32)) Bool)

(assert (=> b!481699 (= res!287187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(assert (= (and start!43484 res!287185) b!481695))

(assert (= (and b!481695 res!287188) b!481699))

(assert (= (and b!481699 res!287187) b!481693))

(assert (= (and b!481693 res!287186) b!481694))

(assert (= (and b!481697 condMapEmpty!22393) mapIsEmpty!22393))

(assert (= (and b!481697 (not condMapEmpty!22393)) mapNonEmpty!22393))

(get-info :version)

(assert (= (and mapNonEmpty!22393 ((_ is ValueCellFull!6533) mapValue!22393)) b!481698))

(assert (= (and b!481697 ((_ is ValueCellFull!6533) mapDefault!22393)) b!481696))

(assert (= start!43484 b!481697))

(declare-fun m!462597 () Bool)

(assert (=> b!481699 m!462597))

(declare-fun m!462599 () Bool)

(assert (=> b!481694 m!462599))

(assert (=> b!481694 m!462599))

(declare-fun m!462601 () Bool)

(assert (=> b!481694 m!462601))

(declare-fun m!462603 () Bool)

(assert (=> start!43484 m!462603))

(declare-fun m!462605 () Bool)

(assert (=> start!43484 m!462605))

(declare-fun m!462607 () Bool)

(assert (=> start!43484 m!462607))

(declare-fun m!462609 () Bool)

(assert (=> b!481693 m!462609))

(declare-fun m!462611 () Bool)

(assert (=> mapNonEmpty!22393 m!462611))

(check-sat (not start!43484) (not b!481699) (not b!481694) (not b!481693) (not b_next!12277) tp_is_empty!13789 (not mapNonEmpty!22393) b_and!21011)
(check-sat b_and!21011 (not b_next!12277))
