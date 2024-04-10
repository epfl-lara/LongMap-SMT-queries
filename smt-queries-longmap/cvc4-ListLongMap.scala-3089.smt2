; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43478 () Bool)

(assert start!43478)

(declare-fun b_free!12257 () Bool)

(declare-fun b_next!12257 () Bool)

(assert (=> start!43478 (= b_free!12257 (not b_next!12257))))

(declare-fun tp!43053 () Bool)

(declare-fun b_and!21017 () Bool)

(assert (=> start!43478 (= tp!43053 b_and!21017)))

(declare-fun b!481714 () Bool)

(declare-fun res!287176 () Bool)

(declare-fun e!283424 () Bool)

(assert (=> b!481714 (=> (not res!287176) (not e!283424))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!31201 0))(
  ( (array!31202 (arr!15003 (Array (_ BitVec 32) (_ BitVec 64))) (size!15361 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31201)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19429 0))(
  ( (V!19430 (val!6932 Int)) )
))
(declare-datatypes ((ValueCell!6523 0))(
  ( (ValueCellFull!6523 (v!9225 V!19429)) (EmptyCell!6523) )
))
(declare-datatypes ((array!31203 0))(
  ( (array!31204 (arr!15004 (Array (_ BitVec 32) ValueCell!6523)) (size!15362 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31203)

(assert (=> b!481714 (= res!287176 (and (= (size!15362 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15361 _keys!1874) (size!15362 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun res!287175 () Bool)

(assert (=> start!43478 (=> (not res!287175) (not e!283424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43478 (= res!287175 (validMask!0 mask!2352))))

(assert (=> start!43478 e!283424))

(assert (=> start!43478 true))

(declare-fun tp_is_empty!13769 () Bool)

(assert (=> start!43478 tp_is_empty!13769))

(declare-fun e!283422 () Bool)

(declare-fun array_inv!10820 (array!31203) Bool)

(assert (=> start!43478 (and (array_inv!10820 _values!1516) e!283422)))

(assert (=> start!43478 tp!43053))

(declare-fun array_inv!10821 (array!31201) Bool)

(assert (=> start!43478 (array_inv!10821 _keys!1874)))

(declare-fun b!481715 () Bool)

(declare-fun e!283420 () Bool)

(declare-fun k!1332 () (_ BitVec 64))

(assert (=> b!481715 (= e!283420 (ite (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!22363 () Bool)

(declare-fun mapRes!22363 () Bool)

(assert (=> mapIsEmpty!22363 mapRes!22363))

(declare-fun b!481716 () Bool)

(declare-fun res!287174 () Bool)

(assert (=> b!481716 (=> (not res!287174) (not e!283424))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!481716 (= res!287174 (validKeyInArray!0 k!1332))))

(declare-fun mapNonEmpty!22363 () Bool)

(declare-fun tp!43054 () Bool)

(declare-fun e!283421 () Bool)

(assert (=> mapNonEmpty!22363 (= mapRes!22363 (and tp!43054 e!283421))))

(declare-fun mapKey!22363 () (_ BitVec 32))

(declare-fun mapRest!22363 () (Array (_ BitVec 32) ValueCell!6523))

(declare-fun mapValue!22363 () ValueCell!6523)

(assert (=> mapNonEmpty!22363 (= (arr!15004 _values!1516) (store mapRest!22363 mapKey!22363 mapValue!22363))))

(declare-fun b!481717 () Bool)

(declare-fun res!287179 () Bool)

(assert (=> b!481717 (=> (not res!287179) (not e!283424))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31201 (_ BitVec 32)) Bool)

(assert (=> b!481717 (= res!287179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!481718 () Bool)

(declare-fun arrayContainsKey!0 (array!31201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!481718 (= e!283420 (arrayContainsKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun b!481719 () Bool)

(declare-fun res!287177 () Bool)

(assert (=> b!481719 (=> (not res!287177) (not e!283424))))

(declare-datatypes ((List!9176 0))(
  ( (Nil!9173) (Cons!9172 (h!10028 (_ BitVec 64)) (t!15390 List!9176)) )
))
(declare-fun arrayNoDuplicates!0 (array!31201 (_ BitVec 32) List!9176) Bool)

(assert (=> b!481719 (= res!287177 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9173))))

(declare-fun b!481720 () Bool)

(assert (=> b!481720 (= e!283424 (not true))))

(declare-fun lt!218604 () (_ BitVec 32))

(assert (=> b!481720 (arrayForallSeekEntryOrOpenFound!0 lt!218604 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14134 0))(
  ( (Unit!14135) )
))
(declare-fun lt!218605 () Unit!14134)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31201 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14134)

(assert (=> b!481720 (= lt!218605 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218604))))

(declare-fun arrayScanForKey!0 (array!31201 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!481720 (= lt!218604 (arrayScanForKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(assert (=> b!481720 e!283420))

(declare-fun c!57939 () Bool)

(assert (=> b!481720 (= c!57939 (and (not (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun minValue!1458 () V!19429)

(declare-fun zeroValue!1458 () V!19429)

(declare-fun lt!218603 () Unit!14134)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!138 (array!31201 array!31203 (_ BitVec 32) (_ BitVec 32) V!19429 V!19429 (_ BitVec 64) Int) Unit!14134)

(assert (=> b!481720 (= lt!218603 (lemmaKeyInListMapIsInArray!138 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k!1332 defaultEntry!1519))))

(declare-fun b!481721 () Bool)

(assert (=> b!481721 (= e!283421 tp_is_empty!13769)))

(declare-fun b!481722 () Bool)

(declare-fun e!283423 () Bool)

(assert (=> b!481722 (= e!283423 tp_is_empty!13769)))

(declare-fun b!481723 () Bool)

(assert (=> b!481723 (= e!283422 (and e!283423 mapRes!22363))))

(declare-fun condMapEmpty!22363 () Bool)

(declare-fun mapDefault!22363 () ValueCell!6523)

