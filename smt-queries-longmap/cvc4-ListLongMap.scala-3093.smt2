; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43502 () Bool)

(assert start!43502)

(declare-fun b_free!12281 () Bool)

(declare-fun b_next!12281 () Bool)

(assert (=> start!43502 (= b_free!12281 (not b_next!12281))))

(declare-fun tp!43125 () Bool)

(declare-fun b_and!21041 () Bool)

(assert (=> start!43502 (= tp!43125 b_and!21041)))

(declare-fun b!482006 () Bool)

(declare-fun e!283612 () Bool)

(assert (=> b!482006 (= e!283612 false)))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun lt!218659 () Bool)

(declare-datatypes ((V!19461 0))(
  ( (V!19462 (val!6944 Int)) )
))
(declare-fun minValue!1458 () V!19461)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19461)

(declare-datatypes ((ValueCell!6535 0))(
  ( (ValueCellFull!6535 (v!9237 V!19461)) (EmptyCell!6535) )
))
(declare-datatypes ((array!31245 0))(
  ( (array!31246 (arr!15025 (Array (_ BitVec 32) ValueCell!6535)) (size!15383 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31245)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31247 0))(
  ( (array!31248 (arr!15026 (Array (_ BitVec 32) (_ BitVec 64))) (size!15384 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31247)

(declare-datatypes ((tuple2!9110 0))(
  ( (tuple2!9111 (_1!4566 (_ BitVec 64)) (_2!4566 V!19461)) )
))
(declare-datatypes ((List!9190 0))(
  ( (Nil!9187) (Cons!9186 (h!10042 tuple2!9110) (t!15404 List!9190)) )
))
(declare-datatypes ((ListLongMap!8023 0))(
  ( (ListLongMap!8024 (toList!4027 List!9190)) )
))
(declare-fun contains!2641 (ListLongMap!8023 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2346 (array!31247 array!31245 (_ BitVec 32) (_ BitVec 32) V!19461 V!19461 (_ BitVec 32) Int) ListLongMap!8023)

(assert (=> b!482006 (= lt!218659 (contains!2641 (getCurrentListMap!2346 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun res!287341 () Bool)

(assert (=> start!43502 (=> (not res!287341) (not e!283612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43502 (= res!287341 (validMask!0 mask!2352))))

(assert (=> start!43502 e!283612))

(assert (=> start!43502 true))

(declare-fun tp_is_empty!13793 () Bool)

(assert (=> start!43502 tp_is_empty!13793))

(declare-fun e!283614 () Bool)

(declare-fun array_inv!10836 (array!31245) Bool)

(assert (=> start!43502 (and (array_inv!10836 _values!1516) e!283614)))

(assert (=> start!43502 tp!43125))

(declare-fun array_inv!10837 (array!31247) Bool)

(assert (=> start!43502 (array_inv!10837 _keys!1874)))

(declare-fun b!482007 () Bool)

(declare-fun res!287340 () Bool)

(assert (=> b!482007 (=> (not res!287340) (not e!283612))))

(declare-datatypes ((List!9191 0))(
  ( (Nil!9188) (Cons!9187 (h!10043 (_ BitVec 64)) (t!15405 List!9191)) )
))
(declare-fun arrayNoDuplicates!0 (array!31247 (_ BitVec 32) List!9191) Bool)

(assert (=> b!482007 (= res!287340 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9188))))

(declare-fun mapIsEmpty!22399 () Bool)

(declare-fun mapRes!22399 () Bool)

(assert (=> mapIsEmpty!22399 mapRes!22399))

(declare-fun b!482008 () Bool)

(declare-fun res!287338 () Bool)

(assert (=> b!482008 (=> (not res!287338) (not e!283612))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31247 (_ BitVec 32)) Bool)

(assert (=> b!482008 (= res!287338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!482009 () Bool)

(declare-fun e!283610 () Bool)

(assert (=> b!482009 (= e!283614 (and e!283610 mapRes!22399))))

(declare-fun condMapEmpty!22399 () Bool)

(declare-fun mapDefault!22399 () ValueCell!6535)

