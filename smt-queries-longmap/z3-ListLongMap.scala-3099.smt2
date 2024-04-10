; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43536 () Bool)

(assert start!43536)

(declare-fun b_free!12315 () Bool)

(declare-fun b_next!12315 () Bool)

(assert (=> start!43536 (= b_free!12315 (not b_next!12315))))

(declare-fun tp!43227 () Bool)

(declare-fun b_and!21075 () Bool)

(assert (=> start!43536 (= tp!43227 b_and!21075)))

(declare-fun b!482363 () Bool)

(declare-fun e!283868 () Bool)

(declare-fun tp_is_empty!13827 () Bool)

(assert (=> b!482363 (= e!283868 tp_is_empty!13827)))

(declare-fun b!482364 () Bool)

(declare-fun res!287544 () Bool)

(declare-fun e!283865 () Bool)

(assert (=> b!482364 (=> (not res!287544) (not e!283865))))

(declare-datatypes ((array!31311 0))(
  ( (array!31312 (arr!15058 (Array (_ BitVec 32) (_ BitVec 64))) (size!15416 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31311)

(declare-datatypes ((List!9215 0))(
  ( (Nil!9212) (Cons!9211 (h!10067 (_ BitVec 64)) (t!15429 List!9215)) )
))
(declare-fun arrayNoDuplicates!0 (array!31311 (_ BitVec 32) List!9215) Bool)

(assert (=> b!482364 (= res!287544 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9212))))

(declare-fun b!482365 () Bool)

(assert (=> b!482365 (= e!283865 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun lt!218710 () Bool)

(declare-datatypes ((V!19507 0))(
  ( (V!19508 (val!6961 Int)) )
))
(declare-fun minValue!1458 () V!19507)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19507)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((ValueCell!6552 0))(
  ( (ValueCellFull!6552 (v!9254 V!19507)) (EmptyCell!6552) )
))
(declare-datatypes ((array!31313 0))(
  ( (array!31314 (arr!15059 (Array (_ BitVec 32) ValueCell!6552)) (size!15417 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31313)

(declare-datatypes ((tuple2!9136 0))(
  ( (tuple2!9137 (_1!4579 (_ BitVec 64)) (_2!4579 V!19507)) )
))
(declare-datatypes ((List!9216 0))(
  ( (Nil!9213) (Cons!9212 (h!10068 tuple2!9136) (t!15430 List!9216)) )
))
(declare-datatypes ((ListLongMap!8049 0))(
  ( (ListLongMap!8050 (toList!4040 List!9216)) )
))
(declare-fun contains!2654 (ListLongMap!8049 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2359 (array!31311 array!31313 (_ BitVec 32) (_ BitVec 32) V!19507 V!19507 (_ BitVec 32) Int) ListLongMap!8049)

(assert (=> b!482365 (= lt!218710 (contains!2654 (getCurrentListMap!2359 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!482366 () Bool)

(declare-fun e!283869 () Bool)

(declare-fun e!283867 () Bool)

(declare-fun mapRes!22450 () Bool)

(assert (=> b!482366 (= e!283869 (and e!283867 mapRes!22450))))

(declare-fun condMapEmpty!22450 () Bool)

(declare-fun mapDefault!22450 () ValueCell!6552)

(assert (=> b!482366 (= condMapEmpty!22450 (= (arr!15059 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6552)) mapDefault!22450)))))

(declare-fun res!287542 () Bool)

(assert (=> start!43536 (=> (not res!287542) (not e!283865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43536 (= res!287542 (validMask!0 mask!2352))))

(assert (=> start!43536 e!283865))

(assert (=> start!43536 true))

(assert (=> start!43536 tp_is_empty!13827))

(declare-fun array_inv!10864 (array!31313) Bool)

(assert (=> start!43536 (and (array_inv!10864 _values!1516) e!283869)))

(assert (=> start!43536 tp!43227))

(declare-fun array_inv!10865 (array!31311) Bool)

(assert (=> start!43536 (array_inv!10865 _keys!1874)))

(declare-fun mapNonEmpty!22450 () Bool)

(declare-fun tp!43228 () Bool)

(assert (=> mapNonEmpty!22450 (= mapRes!22450 (and tp!43228 e!283868))))

(declare-fun mapRest!22450 () (Array (_ BitVec 32) ValueCell!6552))

(declare-fun mapValue!22450 () ValueCell!6552)

(declare-fun mapKey!22450 () (_ BitVec 32))

(assert (=> mapNonEmpty!22450 (= (arr!15059 _values!1516) (store mapRest!22450 mapKey!22450 mapValue!22450))))

(declare-fun b!482367 () Bool)

(declare-fun res!287543 () Bool)

(assert (=> b!482367 (=> (not res!287543) (not e!283865))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31311 (_ BitVec 32)) Bool)

(assert (=> b!482367 (= res!287543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!482368 () Bool)

(declare-fun res!287545 () Bool)

(assert (=> b!482368 (=> (not res!287545) (not e!283865))))

(assert (=> b!482368 (= res!287545 (and (= (size!15417 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15416 _keys!1874) (size!15417 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!482369 () Bool)

(assert (=> b!482369 (= e!283867 tp_is_empty!13827)))

(declare-fun mapIsEmpty!22450 () Bool)

(assert (=> mapIsEmpty!22450 mapRes!22450))

(assert (= (and start!43536 res!287542) b!482368))

(assert (= (and b!482368 res!287545) b!482367))

(assert (= (and b!482367 res!287543) b!482364))

(assert (= (and b!482364 res!287544) b!482365))

(assert (= (and b!482366 condMapEmpty!22450) mapIsEmpty!22450))

(assert (= (and b!482366 (not condMapEmpty!22450)) mapNonEmpty!22450))

(get-info :version)

(assert (= (and mapNonEmpty!22450 ((_ is ValueCellFull!6552) mapValue!22450)) b!482363))

(assert (= (and b!482366 ((_ is ValueCellFull!6552) mapDefault!22450)) b!482369))

(assert (= start!43536 b!482366))

(declare-fun m!463635 () Bool)

(assert (=> mapNonEmpty!22450 m!463635))

(declare-fun m!463637 () Bool)

(assert (=> b!482367 m!463637))

(declare-fun m!463639 () Bool)

(assert (=> b!482364 m!463639))

(declare-fun m!463641 () Bool)

(assert (=> b!482365 m!463641))

(assert (=> b!482365 m!463641))

(declare-fun m!463643 () Bool)

(assert (=> b!482365 m!463643))

(declare-fun m!463645 () Bool)

(assert (=> start!43536 m!463645))

(declare-fun m!463647 () Bool)

(assert (=> start!43536 m!463647))

(declare-fun m!463649 () Bool)

(assert (=> start!43536 m!463649))

(check-sat (not mapNonEmpty!22450) (not b!482364) (not b!482367) (not b!482365) tp_is_empty!13827 (not start!43536) (not b_next!12315) b_and!21075)
(check-sat b_and!21075 (not b_next!12315))
