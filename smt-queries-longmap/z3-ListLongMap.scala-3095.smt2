; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43512 () Bool)

(assert start!43512)

(declare-fun b_free!12291 () Bool)

(declare-fun b_next!12291 () Bool)

(assert (=> start!43512 (= b_free!12291 (not b_next!12291))))

(declare-fun tp!43156 () Bool)

(declare-fun b_and!21051 () Bool)

(assert (=> start!43512 (= tp!43156 b_and!21051)))

(declare-fun b!482112 () Bool)

(declare-fun res!287400 () Bool)

(declare-fun e!283688 () Bool)

(assert (=> b!482112 (=> (not res!287400) (not e!283688))))

(declare-datatypes ((array!31265 0))(
  ( (array!31266 (arr!15035 (Array (_ BitVec 32) (_ BitVec 64))) (size!15393 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31265)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19475 0))(
  ( (V!19476 (val!6949 Int)) )
))
(declare-datatypes ((ValueCell!6540 0))(
  ( (ValueCellFull!6540 (v!9242 V!19475)) (EmptyCell!6540) )
))
(declare-datatypes ((array!31267 0))(
  ( (array!31268 (arr!15036 (Array (_ BitVec 32) ValueCell!6540)) (size!15394 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31267)

(declare-fun mask!2352 () (_ BitVec 32))

(assert (=> b!482112 (= res!287400 (and (= (size!15394 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15393 _keys!1874) (size!15394 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!482113 () Bool)

(declare-fun res!287399 () Bool)

(assert (=> b!482113 (=> (not res!287399) (not e!283688))))

(declare-datatypes ((List!9199 0))(
  ( (Nil!9196) (Cons!9195 (h!10051 (_ BitVec 64)) (t!15413 List!9199)) )
))
(declare-fun arrayNoDuplicates!0 (array!31265 (_ BitVec 32) List!9199) Bool)

(assert (=> b!482113 (= res!287399 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9196))))

(declare-fun b!482114 () Bool)

(declare-fun e!283687 () Bool)

(declare-fun tp_is_empty!13803 () Bool)

(assert (=> b!482114 (= e!283687 tp_is_empty!13803)))

(declare-fun b!482115 () Bool)

(declare-fun e!283689 () Bool)

(declare-fun e!283685 () Bool)

(declare-fun mapRes!22414 () Bool)

(assert (=> b!482115 (= e!283689 (and e!283685 mapRes!22414))))

(declare-fun condMapEmpty!22414 () Bool)

(declare-fun mapDefault!22414 () ValueCell!6540)

(assert (=> b!482115 (= condMapEmpty!22414 (= (arr!15036 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6540)) mapDefault!22414)))))

(declare-fun b!482116 () Bool)

(assert (=> b!482116 (= e!283685 tp_is_empty!13803)))

(declare-fun b!482117 () Bool)

(assert (=> b!482117 (= e!283688 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun lt!218674 () Bool)

(declare-fun minValue!1458 () V!19475)

(declare-fun zeroValue!1458 () V!19475)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9120 0))(
  ( (tuple2!9121 (_1!4571 (_ BitVec 64)) (_2!4571 V!19475)) )
))
(declare-datatypes ((List!9200 0))(
  ( (Nil!9197) (Cons!9196 (h!10052 tuple2!9120) (t!15414 List!9200)) )
))
(declare-datatypes ((ListLongMap!8033 0))(
  ( (ListLongMap!8034 (toList!4032 List!9200)) )
))
(declare-fun contains!2646 (ListLongMap!8033 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2351 (array!31265 array!31267 (_ BitVec 32) (_ BitVec 32) V!19475 V!19475 (_ BitVec 32) Int) ListLongMap!8033)

(assert (=> b!482117 (= lt!218674 (contains!2646 (getCurrentListMap!2351 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun mapIsEmpty!22414 () Bool)

(assert (=> mapIsEmpty!22414 mapRes!22414))

(declare-fun mapNonEmpty!22414 () Bool)

(declare-fun tp!43155 () Bool)

(assert (=> mapNonEmpty!22414 (= mapRes!22414 (and tp!43155 e!283687))))

(declare-fun mapValue!22414 () ValueCell!6540)

(declare-fun mapKey!22414 () (_ BitVec 32))

(declare-fun mapRest!22414 () (Array (_ BitVec 32) ValueCell!6540))

(assert (=> mapNonEmpty!22414 (= (arr!15036 _values!1516) (store mapRest!22414 mapKey!22414 mapValue!22414))))

(declare-fun b!482111 () Bool)

(declare-fun res!287401 () Bool)

(assert (=> b!482111 (=> (not res!287401) (not e!283688))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31265 (_ BitVec 32)) Bool)

(assert (=> b!482111 (= res!287401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun res!287398 () Bool)

(assert (=> start!43512 (=> (not res!287398) (not e!283688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43512 (= res!287398 (validMask!0 mask!2352))))

(assert (=> start!43512 e!283688))

(assert (=> start!43512 true))

(assert (=> start!43512 tp_is_empty!13803))

(declare-fun array_inv!10844 (array!31267) Bool)

(assert (=> start!43512 (and (array_inv!10844 _values!1516) e!283689)))

(assert (=> start!43512 tp!43156))

(declare-fun array_inv!10845 (array!31265) Bool)

(assert (=> start!43512 (array_inv!10845 _keys!1874)))

(assert (= (and start!43512 res!287398) b!482112))

(assert (= (and b!482112 res!287400) b!482111))

(assert (= (and b!482111 res!287401) b!482113))

(assert (= (and b!482113 res!287399) b!482117))

(assert (= (and b!482115 condMapEmpty!22414) mapIsEmpty!22414))

(assert (= (and b!482115 (not condMapEmpty!22414)) mapNonEmpty!22414))

(get-info :version)

(assert (= (and mapNonEmpty!22414 ((_ is ValueCellFull!6540) mapValue!22414)) b!482114))

(assert (= (and b!482115 ((_ is ValueCellFull!6540) mapDefault!22414)) b!482116))

(assert (= start!43512 b!482115))

(declare-fun m!463443 () Bool)

(assert (=> b!482113 m!463443))

(declare-fun m!463445 () Bool)

(assert (=> b!482117 m!463445))

(assert (=> b!482117 m!463445))

(declare-fun m!463447 () Bool)

(assert (=> b!482117 m!463447))

(declare-fun m!463449 () Bool)

(assert (=> mapNonEmpty!22414 m!463449))

(declare-fun m!463451 () Bool)

(assert (=> start!43512 m!463451))

(declare-fun m!463453 () Bool)

(assert (=> start!43512 m!463453))

(declare-fun m!463455 () Bool)

(assert (=> start!43512 m!463455))

(declare-fun m!463457 () Bool)

(assert (=> b!482111 m!463457))

(check-sat tp_is_empty!13803 (not b_next!12291) (not b!482113) b_and!21051 (not mapNonEmpty!22414) (not start!43512) (not b!482111) (not b!482117))
(check-sat b_and!21051 (not b_next!12291))
