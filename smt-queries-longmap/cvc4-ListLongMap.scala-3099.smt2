; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43538 () Bool)

(assert start!43538)

(declare-fun b_free!12317 () Bool)

(declare-fun b_next!12317 () Bool)

(assert (=> start!43538 (= b_free!12317 (not b_next!12317))))

(declare-fun tp!43234 () Bool)

(declare-fun b_and!21077 () Bool)

(assert (=> start!43538 (= tp!43234 b_and!21077)))

(declare-fun b!482384 () Bool)

(declare-fun res!287555 () Bool)

(declare-fun e!283880 () Bool)

(assert (=> b!482384 (=> (not res!287555) (not e!283880))))

(declare-datatypes ((array!31315 0))(
  ( (array!31316 (arr!15060 (Array (_ BitVec 32) (_ BitVec 64))) (size!15418 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31315)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31315 (_ BitVec 32)) Bool)

(assert (=> b!482384 (= res!287555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!482386 () Bool)

(assert (=> b!482386 (= e!283880 false)))

(declare-fun k!1332 () (_ BitVec 64))

(declare-datatypes ((V!19509 0))(
  ( (V!19510 (val!6962 Int)) )
))
(declare-fun minValue!1458 () V!19509)

(declare-fun lt!218713 () Bool)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19509)

(declare-datatypes ((ValueCell!6553 0))(
  ( (ValueCellFull!6553 (v!9255 V!19509)) (EmptyCell!6553) )
))
(declare-datatypes ((array!31317 0))(
  ( (array!31318 (arr!15061 (Array (_ BitVec 32) ValueCell!6553)) (size!15419 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31317)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9138 0))(
  ( (tuple2!9139 (_1!4580 (_ BitVec 64)) (_2!4580 V!19509)) )
))
(declare-datatypes ((List!9217 0))(
  ( (Nil!9214) (Cons!9213 (h!10069 tuple2!9138) (t!15431 List!9217)) )
))
(declare-datatypes ((ListLongMap!8051 0))(
  ( (ListLongMap!8052 (toList!4041 List!9217)) )
))
(declare-fun contains!2655 (ListLongMap!8051 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2360 (array!31315 array!31317 (_ BitVec 32) (_ BitVec 32) V!19509 V!19509 (_ BitVec 32) Int) ListLongMap!8051)

(assert (=> b!482386 (= lt!218713 (contains!2655 (getCurrentListMap!2360 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun mapNonEmpty!22453 () Bool)

(declare-fun mapRes!22453 () Bool)

(declare-fun tp!43233 () Bool)

(declare-fun e!283882 () Bool)

(assert (=> mapNonEmpty!22453 (= mapRes!22453 (and tp!43233 e!283882))))

(declare-fun mapValue!22453 () ValueCell!6553)

(declare-fun mapKey!22453 () (_ BitVec 32))

(declare-fun mapRest!22453 () (Array (_ BitVec 32) ValueCell!6553))

(assert (=> mapNonEmpty!22453 (= (arr!15061 _values!1516) (store mapRest!22453 mapKey!22453 mapValue!22453))))

(declare-fun mapIsEmpty!22453 () Bool)

(assert (=> mapIsEmpty!22453 mapRes!22453))

(declare-fun b!482387 () Bool)

(declare-fun res!287556 () Bool)

(assert (=> b!482387 (=> (not res!287556) (not e!283880))))

(assert (=> b!482387 (= res!287556 (and (= (size!15419 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15418 _keys!1874) (size!15419 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!482388 () Bool)

(declare-fun res!287554 () Bool)

(assert (=> b!482388 (=> (not res!287554) (not e!283880))))

(declare-datatypes ((List!9218 0))(
  ( (Nil!9215) (Cons!9214 (h!10070 (_ BitVec 64)) (t!15432 List!9218)) )
))
(declare-fun arrayNoDuplicates!0 (array!31315 (_ BitVec 32) List!9218) Bool)

(assert (=> b!482388 (= res!287554 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9215))))

(declare-fun res!287557 () Bool)

(assert (=> start!43538 (=> (not res!287557) (not e!283880))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43538 (= res!287557 (validMask!0 mask!2352))))

(assert (=> start!43538 e!283880))

(assert (=> start!43538 true))

(declare-fun tp_is_empty!13829 () Bool)

(assert (=> start!43538 tp_is_empty!13829))

(declare-fun e!283881 () Bool)

(declare-fun array_inv!10866 (array!31317) Bool)

(assert (=> start!43538 (and (array_inv!10866 _values!1516) e!283881)))

(assert (=> start!43538 tp!43234))

(declare-fun array_inv!10867 (array!31315) Bool)

(assert (=> start!43538 (array_inv!10867 _keys!1874)))

(declare-fun b!482385 () Bool)

(declare-fun e!283883 () Bool)

(assert (=> b!482385 (= e!283883 tp_is_empty!13829)))

(declare-fun b!482389 () Bool)

(assert (=> b!482389 (= e!283882 tp_is_empty!13829)))

(declare-fun b!482390 () Bool)

(assert (=> b!482390 (= e!283881 (and e!283883 mapRes!22453))))

(declare-fun condMapEmpty!22453 () Bool)

(declare-fun mapDefault!22453 () ValueCell!6553)

