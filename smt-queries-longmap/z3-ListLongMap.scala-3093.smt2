; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43484 () Bool)

(assert start!43484)

(declare-fun b_free!12277 () Bool)

(declare-fun b_next!12277 () Bool)

(assert (=> start!43484 (= b_free!12277 (not b_next!12277))))

(declare-fun tp!43113 () Bool)

(declare-fun b_and!21047 () Bool)

(assert (=> start!43484 (= tp!43113 b_and!21047)))

(declare-fun mapNonEmpty!22393 () Bool)

(declare-fun mapRes!22393 () Bool)

(declare-fun tp!43114 () Bool)

(declare-fun e!283541 () Bool)

(assert (=> mapNonEmpty!22393 (= mapRes!22393 (and tp!43114 e!283541))))

(declare-datatypes ((V!19457 0))(
  ( (V!19458 (val!6942 Int)) )
))
(declare-datatypes ((ValueCell!6533 0))(
  ( (ValueCellFull!6533 (v!9236 V!19457)) (EmptyCell!6533) )
))
(declare-fun mapRest!22393 () (Array (_ BitVec 32) ValueCell!6533))

(declare-fun mapKey!22393 () (_ BitVec 32))

(declare-fun mapValue!22393 () ValueCell!6533)

(declare-datatypes ((array!31224 0))(
  ( (array!31225 (arr!15014 (Array (_ BitVec 32) ValueCell!6533)) (size!15372 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31224)

(assert (=> mapNonEmpty!22393 (= (arr!15014 _values!1516) (store mapRest!22393 mapKey!22393 mapValue!22393))))

(declare-fun b!481903 () Bool)

(declare-fun e!283545 () Bool)

(assert (=> b!481903 (= e!283545 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun minValue!1458 () V!19457)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun lt!218665 () Bool)

(declare-fun zeroValue!1458 () V!19457)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31226 0))(
  ( (array!31227 (arr!15015 (Array (_ BitVec 32) (_ BitVec 64))) (size!15373 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31226)

(declare-datatypes ((tuple2!9028 0))(
  ( (tuple2!9029 (_1!4525 (_ BitVec 64)) (_2!4525 V!19457)) )
))
(declare-datatypes ((List!9092 0))(
  ( (Nil!9089) (Cons!9088 (h!9944 tuple2!9028) (t!15298 List!9092)) )
))
(declare-datatypes ((ListLongMap!7943 0))(
  ( (ListLongMap!7944 (toList!3987 List!9092)) )
))
(declare-fun contains!2619 (ListLongMap!7943 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2301 (array!31226 array!31224 (_ BitVec 32) (_ BitVec 32) V!19457 V!19457 (_ BitVec 32) Int) ListLongMap!7943)

(assert (=> b!481903 (= lt!218665 (contains!2619 (getCurrentListMap!2301 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun res!287310 () Bool)

(assert (=> start!43484 (=> (not res!287310) (not e!283545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43484 (= res!287310 (validMask!0 mask!2352))))

(assert (=> start!43484 e!283545))

(assert (=> start!43484 true))

(declare-fun tp_is_empty!13789 () Bool)

(assert (=> start!43484 tp_is_empty!13789))

(declare-fun e!283543 () Bool)

(declare-fun array_inv!10904 (array!31224) Bool)

(assert (=> start!43484 (and (array_inv!10904 _values!1516) e!283543)))

(assert (=> start!43484 tp!43113))

(declare-fun array_inv!10905 (array!31226) Bool)

(assert (=> start!43484 (array_inv!10905 _keys!1874)))

(declare-fun b!481904 () Bool)

(declare-fun e!283542 () Bool)

(assert (=> b!481904 (= e!283542 tp_is_empty!13789)))

(declare-fun b!481905 () Bool)

(assert (=> b!481905 (= e!283543 (and e!283542 mapRes!22393))))

(declare-fun condMapEmpty!22393 () Bool)

(declare-fun mapDefault!22393 () ValueCell!6533)

(assert (=> b!481905 (= condMapEmpty!22393 (= (arr!15014 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6533)) mapDefault!22393)))))

(declare-fun b!481906 () Bool)

(assert (=> b!481906 (= e!283541 tp_is_empty!13789)))

(declare-fun mapIsEmpty!22393 () Bool)

(assert (=> mapIsEmpty!22393 mapRes!22393))

(declare-fun b!481907 () Bool)

(declare-fun res!287307 () Bool)

(assert (=> b!481907 (=> (not res!287307) (not e!283545))))

(declare-datatypes ((List!9093 0))(
  ( (Nil!9090) (Cons!9089 (h!9945 (_ BitVec 64)) (t!15299 List!9093)) )
))
(declare-fun arrayNoDuplicates!0 (array!31226 (_ BitVec 32) List!9093) Bool)

(assert (=> b!481907 (= res!287307 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9090))))

(declare-fun b!481908 () Bool)

(declare-fun res!287309 () Bool)

(assert (=> b!481908 (=> (not res!287309) (not e!283545))))

(assert (=> b!481908 (= res!287309 (and (= (size!15372 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15373 _keys!1874) (size!15372 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!481909 () Bool)

(declare-fun res!287308 () Bool)

(assert (=> b!481909 (=> (not res!287308) (not e!283545))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31226 (_ BitVec 32)) Bool)

(assert (=> b!481909 (= res!287308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(assert (= (and start!43484 res!287310) b!481908))

(assert (= (and b!481908 res!287309) b!481909))

(assert (= (and b!481909 res!287308) b!481907))

(assert (= (and b!481907 res!287307) b!481903))

(assert (= (and b!481905 condMapEmpty!22393) mapIsEmpty!22393))

(assert (= (and b!481905 (not condMapEmpty!22393)) mapNonEmpty!22393))

(get-info :version)

(assert (= (and mapNonEmpty!22393 ((_ is ValueCellFull!6533) mapValue!22393)) b!481906))

(assert (= (and b!481905 ((_ is ValueCellFull!6533) mapDefault!22393)) b!481904))

(assert (= start!43484 b!481905))

(declare-fun m!463513 () Bool)

(assert (=> b!481903 m!463513))

(assert (=> b!481903 m!463513))

(declare-fun m!463515 () Bool)

(assert (=> b!481903 m!463515))

(declare-fun m!463517 () Bool)

(assert (=> b!481909 m!463517))

(declare-fun m!463519 () Bool)

(assert (=> start!43484 m!463519))

(declare-fun m!463521 () Bool)

(assert (=> start!43484 m!463521))

(declare-fun m!463523 () Bool)

(assert (=> start!43484 m!463523))

(declare-fun m!463525 () Bool)

(assert (=> mapNonEmpty!22393 m!463525))

(declare-fun m!463527 () Bool)

(assert (=> b!481907 m!463527))

(check-sat (not start!43484) tp_is_empty!13789 (not b!481903) (not b!481909) (not b_next!12277) (not mapNonEmpty!22393) (not b!481907) b_and!21047)
(check-sat b_and!21047 (not b_next!12277))
