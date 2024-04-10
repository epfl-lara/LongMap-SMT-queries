; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43514 () Bool)

(assert start!43514)

(declare-fun b_free!12293 () Bool)

(declare-fun b_next!12293 () Bool)

(assert (=> start!43514 (= b_free!12293 (not b_next!12293))))

(declare-fun tp!43162 () Bool)

(declare-fun b_and!21053 () Bool)

(assert (=> start!43514 (= tp!43162 b_and!21053)))

(declare-fun b!482132 () Bool)

(declare-fun e!283702 () Bool)

(declare-fun tp_is_empty!13805 () Bool)

(assert (=> b!482132 (= e!283702 tp_is_empty!13805)))

(declare-fun b!482133 () Bool)

(declare-fun res!287410 () Bool)

(declare-fun e!283701 () Bool)

(assert (=> b!482133 (=> (not res!287410) (not e!283701))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!31269 0))(
  ( (array!31270 (arr!15037 (Array (_ BitVec 32) (_ BitVec 64))) (size!15395 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31269)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19477 0))(
  ( (V!19478 (val!6950 Int)) )
))
(declare-datatypes ((ValueCell!6541 0))(
  ( (ValueCellFull!6541 (v!9243 V!19477)) (EmptyCell!6541) )
))
(declare-datatypes ((array!31271 0))(
  ( (array!31272 (arr!15038 (Array (_ BitVec 32) ValueCell!6541)) (size!15396 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31271)

(assert (=> b!482133 (= res!287410 (and (= (size!15396 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15395 _keys!1874) (size!15396 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!22417 () Bool)

(declare-fun mapRes!22417 () Bool)

(declare-fun tp!43161 () Bool)

(declare-fun e!283700 () Bool)

(assert (=> mapNonEmpty!22417 (= mapRes!22417 (and tp!43161 e!283700))))

(declare-fun mapKey!22417 () (_ BitVec 32))

(declare-fun mapValue!22417 () ValueCell!6541)

(declare-fun mapRest!22417 () (Array (_ BitVec 32) ValueCell!6541))

(assert (=> mapNonEmpty!22417 (= (arr!15038 _values!1516) (store mapRest!22417 mapKey!22417 mapValue!22417))))

(declare-fun res!287411 () Bool)

(assert (=> start!43514 (=> (not res!287411) (not e!283701))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43514 (= res!287411 (validMask!0 mask!2352))))

(assert (=> start!43514 e!283701))

(assert (=> start!43514 true))

(assert (=> start!43514 tp_is_empty!13805))

(declare-fun e!283703 () Bool)

(declare-fun array_inv!10846 (array!31271) Bool)

(assert (=> start!43514 (and (array_inv!10846 _values!1516) e!283703)))

(assert (=> start!43514 tp!43162))

(declare-fun array_inv!10847 (array!31269) Bool)

(assert (=> start!43514 (array_inv!10847 _keys!1874)))

(declare-fun b!482134 () Bool)

(declare-fun res!287413 () Bool)

(assert (=> b!482134 (=> (not res!287413) (not e!283701))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31269 (_ BitVec 32)) Bool)

(assert (=> b!482134 (= res!287413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapIsEmpty!22417 () Bool)

(assert (=> mapIsEmpty!22417 mapRes!22417))

(declare-fun b!482135 () Bool)

(assert (=> b!482135 (= e!283703 (and e!283702 mapRes!22417))))

(declare-fun condMapEmpty!22417 () Bool)

(declare-fun mapDefault!22417 () ValueCell!6541)

