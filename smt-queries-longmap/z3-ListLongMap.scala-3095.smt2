; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43496 () Bool)

(assert start!43496)

(declare-fun b_free!12289 () Bool)

(declare-fun b_next!12289 () Bool)

(assert (=> start!43496 (= b_free!12289 (not b_next!12289))))

(declare-fun tp!43149 () Bool)

(declare-fun b_and!21059 () Bool)

(assert (=> start!43496 (= tp!43149 b_and!21059)))

(declare-fun b!482029 () Bool)

(declare-fun e!283631 () Bool)

(assert (=> b!482029 (= e!283631 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19473 0))(
  ( (V!19474 (val!6948 Int)) )
))
(declare-fun minValue!1458 () V!19473)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19473)

(declare-datatypes ((ValueCell!6539 0))(
  ( (ValueCellFull!6539 (v!9242 V!19473)) (EmptyCell!6539) )
))
(declare-datatypes ((array!31248 0))(
  ( (array!31249 (arr!15026 (Array (_ BitVec 32) ValueCell!6539)) (size!15384 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31248)

(declare-fun lt!218683 () Bool)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31250 0))(
  ( (array!31251 (arr!15027 (Array (_ BitVec 32) (_ BitVec 64))) (size!15385 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31250)

(declare-datatypes ((tuple2!9038 0))(
  ( (tuple2!9039 (_1!4530 (_ BitVec 64)) (_2!4530 V!19473)) )
))
(declare-datatypes ((List!9103 0))(
  ( (Nil!9100) (Cons!9099 (h!9955 tuple2!9038) (t!15309 List!9103)) )
))
(declare-datatypes ((ListLongMap!7953 0))(
  ( (ListLongMap!7954 (toList!3992 List!9103)) )
))
(declare-fun contains!2624 (ListLongMap!7953 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2306 (array!31250 array!31248 (_ BitVec 32) (_ BitVec 32) V!19473 V!19473 (_ BitVec 32) Int) ListLongMap!7953)

(assert (=> b!482029 (= lt!218683 (contains!2624 (getCurrentListMap!2306 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun res!287380 () Bool)

(assert (=> start!43496 (=> (not res!287380) (not e!283631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43496 (= res!287380 (validMask!0 mask!2352))))

(assert (=> start!43496 e!283631))

(assert (=> start!43496 true))

(declare-fun tp_is_empty!13801 () Bool)

(assert (=> start!43496 tp_is_empty!13801))

(declare-fun e!283635 () Bool)

(declare-fun array_inv!10914 (array!31248) Bool)

(assert (=> start!43496 (and (array_inv!10914 _values!1516) e!283635)))

(assert (=> start!43496 tp!43149))

(declare-fun array_inv!10915 (array!31250) Bool)

(assert (=> start!43496 (array_inv!10915 _keys!1874)))

(declare-fun b!482030 () Bool)

(declare-fun res!287382 () Bool)

(assert (=> b!482030 (=> (not res!287382) (not e!283631))))

(declare-datatypes ((List!9104 0))(
  ( (Nil!9101) (Cons!9100 (h!9956 (_ BitVec 64)) (t!15310 List!9104)) )
))
(declare-fun arrayNoDuplicates!0 (array!31250 (_ BitVec 32) List!9104) Bool)

(assert (=> b!482030 (= res!287382 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9101))))

(declare-fun b!482031 () Bool)

(declare-fun res!287379 () Bool)

(assert (=> b!482031 (=> (not res!287379) (not e!283631))))

(assert (=> b!482031 (= res!287379 (and (= (size!15384 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15385 _keys!1874) (size!15384 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!482032 () Bool)

(declare-fun res!287381 () Bool)

(assert (=> b!482032 (=> (not res!287381) (not e!283631))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31250 (_ BitVec 32)) Bool)

(assert (=> b!482032 (= res!287381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!482033 () Bool)

(declare-fun e!283634 () Bool)

(assert (=> b!482033 (= e!283634 tp_is_empty!13801)))

(declare-fun b!482034 () Bool)

(declare-fun mapRes!22411 () Bool)

(assert (=> b!482034 (= e!283635 (and e!283634 mapRes!22411))))

(declare-fun condMapEmpty!22411 () Bool)

(declare-fun mapDefault!22411 () ValueCell!6539)

(assert (=> b!482034 (= condMapEmpty!22411 (= (arr!15026 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6539)) mapDefault!22411)))))

(declare-fun mapNonEmpty!22411 () Bool)

(declare-fun tp!43150 () Bool)

(declare-fun e!283632 () Bool)

(assert (=> mapNonEmpty!22411 (= mapRes!22411 (and tp!43150 e!283632))))

(declare-fun mapKey!22411 () (_ BitVec 32))

(declare-fun mapValue!22411 () ValueCell!6539)

(declare-fun mapRest!22411 () (Array (_ BitVec 32) ValueCell!6539))

(assert (=> mapNonEmpty!22411 (= (arr!15026 _values!1516) (store mapRest!22411 mapKey!22411 mapValue!22411))))

(declare-fun b!482035 () Bool)

(assert (=> b!482035 (= e!283632 tp_is_empty!13801)))

(declare-fun mapIsEmpty!22411 () Bool)

(assert (=> mapIsEmpty!22411 mapRes!22411))

(assert (= (and start!43496 res!287380) b!482031))

(assert (= (and b!482031 res!287379) b!482032))

(assert (= (and b!482032 res!287381) b!482030))

(assert (= (and b!482030 res!287382) b!482029))

(assert (= (and b!482034 condMapEmpty!22411) mapIsEmpty!22411))

(assert (= (and b!482034 (not condMapEmpty!22411)) mapNonEmpty!22411))

(get-info :version)

(assert (= (and mapNonEmpty!22411 ((_ is ValueCellFull!6539) mapValue!22411)) b!482035))

(assert (= (and b!482034 ((_ is ValueCellFull!6539) mapDefault!22411)) b!482033))

(assert (= start!43496 b!482034))

(declare-fun m!463609 () Bool)

(assert (=> mapNonEmpty!22411 m!463609))

(declare-fun m!463611 () Bool)

(assert (=> b!482032 m!463611))

(declare-fun m!463613 () Bool)

(assert (=> start!43496 m!463613))

(declare-fun m!463615 () Bool)

(assert (=> start!43496 m!463615))

(declare-fun m!463617 () Bool)

(assert (=> start!43496 m!463617))

(declare-fun m!463619 () Bool)

(assert (=> b!482030 m!463619))

(declare-fun m!463621 () Bool)

(assert (=> b!482029 m!463621))

(assert (=> b!482029 m!463621))

(declare-fun m!463623 () Bool)

(assert (=> b!482029 m!463623))

(check-sat (not mapNonEmpty!22411) (not b!482032) (not b!482030) tp_is_empty!13801 (not b_next!12289) (not start!43496) (not b!482029) b_and!21059)
(check-sat b_and!21059 (not b_next!12289))
