; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43522 () Bool)

(assert start!43522)

(declare-fun b_free!12301 () Bool)

(declare-fun b_next!12301 () Bool)

(assert (=> start!43522 (= b_free!12301 (not b_next!12301))))

(declare-fun tp!43186 () Bool)

(declare-fun b_and!21061 () Bool)

(assert (=> start!43522 (= tp!43186 b_and!21061)))

(declare-fun res!287459 () Bool)

(declare-fun e!283761 () Bool)

(assert (=> start!43522 (=> (not res!287459) (not e!283761))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43522 (= res!287459 (validMask!0 mask!2352))))

(assert (=> start!43522 e!283761))

(assert (=> start!43522 true))

(declare-fun tp_is_empty!13813 () Bool)

(assert (=> start!43522 tp_is_empty!13813))

(declare-datatypes ((V!19489 0))(
  ( (V!19490 (val!6954 Int)) )
))
(declare-datatypes ((ValueCell!6545 0))(
  ( (ValueCellFull!6545 (v!9247 V!19489)) (EmptyCell!6545) )
))
(declare-datatypes ((array!31285 0))(
  ( (array!31286 (arr!15045 (Array (_ BitVec 32) ValueCell!6545)) (size!15403 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31285)

(declare-fun e!283763 () Bool)

(declare-fun array_inv!10854 (array!31285) Bool)

(assert (=> start!43522 (and (array_inv!10854 _values!1516) e!283763)))

(assert (=> start!43522 tp!43186))

(declare-datatypes ((array!31287 0))(
  ( (array!31288 (arr!15046 (Array (_ BitVec 32) (_ BitVec 64))) (size!15404 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31287)

(declare-fun array_inv!10855 (array!31287) Bool)

(assert (=> start!43522 (array_inv!10855 _keys!1874)))

(declare-fun b!482216 () Bool)

(declare-fun e!283762 () Bool)

(assert (=> b!482216 (= e!283762 tp_is_empty!13813)))

(declare-fun b!482217 () Bool)

(declare-fun res!287461 () Bool)

(assert (=> b!482217 (=> (not res!287461) (not e!283761))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31287 (_ BitVec 32)) Bool)

(assert (=> b!482217 (= res!287461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!482218 () Bool)

(declare-fun e!283764 () Bool)

(assert (=> b!482218 (= e!283764 tp_is_empty!13813)))

(declare-fun mapIsEmpty!22429 () Bool)

(declare-fun mapRes!22429 () Bool)

(assert (=> mapIsEmpty!22429 mapRes!22429))

(declare-fun b!482219 () Bool)

(declare-fun res!287460 () Bool)

(assert (=> b!482219 (=> (not res!287460) (not e!283761))))

(declare-datatypes ((List!9207 0))(
  ( (Nil!9204) (Cons!9203 (h!10059 (_ BitVec 64)) (t!15421 List!9207)) )
))
(declare-fun arrayNoDuplicates!0 (array!31287 (_ BitVec 32) List!9207) Bool)

(assert (=> b!482219 (= res!287460 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9204))))

(declare-fun b!482220 () Bool)

(declare-fun res!287458 () Bool)

(assert (=> b!482220 (=> (not res!287458) (not e!283761))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!482220 (= res!287458 (and (= (size!15403 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15404 _keys!1874) (size!15403 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!482221 () Bool)

(assert (=> b!482221 (= e!283763 (and e!283762 mapRes!22429))))

(declare-fun condMapEmpty!22429 () Bool)

(declare-fun mapDefault!22429 () ValueCell!6545)

