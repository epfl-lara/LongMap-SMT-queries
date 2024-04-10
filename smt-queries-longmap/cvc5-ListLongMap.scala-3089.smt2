; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43474 () Bool)

(assert start!43474)

(declare-fun b_free!12253 () Bool)

(declare-fun b_next!12253 () Bool)

(assert (=> start!43474 (= b_free!12253 (not b_next!12253))))

(declare-fun tp!43042 () Bool)

(declare-fun b_and!21013 () Bool)

(assert (=> start!43474 (= tp!43042 b_and!21013)))

(declare-fun b!481648 () Bool)

(declare-fun res!287139 () Bool)

(declare-fun e!283386 () Bool)

(assert (=> b!481648 (=> (not res!287139) (not e!283386))))

(declare-datatypes ((array!31193 0))(
  ( (array!31194 (arr!14999 (Array (_ BitVec 32) (_ BitVec 64))) (size!15357 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31193)

(declare-datatypes ((List!9172 0))(
  ( (Nil!9169) (Cons!9168 (h!10024 (_ BitVec 64)) (t!15386 List!9172)) )
))
(declare-fun arrayNoDuplicates!0 (array!31193 (_ BitVec 32) List!9172) Bool)

(assert (=> b!481648 (= res!287139 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9169))))

(declare-fun mapIsEmpty!22357 () Bool)

(declare-fun mapRes!22357 () Bool)

(assert (=> mapIsEmpty!22357 mapRes!22357))

(declare-fun b!481649 () Bool)

(declare-fun res!287140 () Bool)

(assert (=> b!481649 (=> (not res!287140) (not e!283386))))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19425 0))(
  ( (V!19426 (val!6930 Int)) )
))
(declare-fun minValue!1458 () V!19425)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19425)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((ValueCell!6521 0))(
  ( (ValueCellFull!6521 (v!9223 V!19425)) (EmptyCell!6521) )
))
(declare-datatypes ((array!31195 0))(
  ( (array!31196 (arr!15000 (Array (_ BitVec 32) ValueCell!6521)) (size!15358 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31195)

(declare-datatypes ((tuple2!9094 0))(
  ( (tuple2!9095 (_1!4558 (_ BitVec 64)) (_2!4558 V!19425)) )
))
(declare-datatypes ((List!9173 0))(
  ( (Nil!9170) (Cons!9169 (h!10025 tuple2!9094) (t!15387 List!9173)) )
))
(declare-datatypes ((ListLongMap!8007 0))(
  ( (ListLongMap!8008 (toList!4019 List!9173)) )
))
(declare-fun contains!2633 (ListLongMap!8007 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2338 (array!31193 array!31195 (_ BitVec 32) (_ BitVec 32) V!19425 V!19425 (_ BitVec 32) Int) ListLongMap!8007)

(assert (=> b!481649 (= res!287140 (contains!2633 (getCurrentListMap!2338 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun b!481650 () Bool)

(declare-fun e!283385 () Bool)

(declare-fun tp_is_empty!13765 () Bool)

(assert (=> b!481650 (= e!283385 tp_is_empty!13765)))

(declare-fun b!481652 () Bool)

(declare-fun res!287142 () Bool)

(assert (=> b!481652 (=> (not res!287142) (not e!283386))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!481652 (= res!287142 (validKeyInArray!0 k!1332))))

(declare-fun b!481653 () Bool)

(declare-fun res!287143 () Bool)

(assert (=> b!481653 (=> (not res!287143) (not e!283386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31193 (_ BitVec 32)) Bool)

(assert (=> b!481653 (= res!287143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!481654 () Bool)

(declare-fun e!283387 () Bool)

(declare-fun arrayContainsKey!0 (array!31193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!481654 (= e!283387 (arrayContainsKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun b!481655 () Bool)

(declare-fun e!283389 () Bool)

(assert (=> b!481655 (= e!283389 tp_is_empty!13765)))

(declare-fun res!287141 () Bool)

(assert (=> start!43474 (=> (not res!287141) (not e!283386))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43474 (= res!287141 (validMask!0 mask!2352))))

(assert (=> start!43474 e!283386))

(assert (=> start!43474 true))

(assert (=> start!43474 tp_is_empty!13765))

(declare-fun e!283388 () Bool)

(declare-fun array_inv!10816 (array!31195) Bool)

(assert (=> start!43474 (and (array_inv!10816 _values!1516) e!283388)))

(assert (=> start!43474 tp!43042))

(declare-fun array_inv!10817 (array!31193) Bool)

(assert (=> start!43474 (array_inv!10817 _keys!1874)))

(declare-fun b!481651 () Bool)

(declare-fun res!287138 () Bool)

(assert (=> b!481651 (=> (not res!287138) (not e!283386))))

(assert (=> b!481651 (= res!287138 (and (= (size!15358 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15357 _keys!1874) (size!15358 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!481656 () Bool)

(assert (=> b!481656 (= e!283386 (not true))))

(declare-fun lt!218586 () (_ BitVec 32))

(assert (=> b!481656 (arrayForallSeekEntryOrOpenFound!0 lt!218586 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14130 0))(
  ( (Unit!14131) )
))
(declare-fun lt!218585 () Unit!14130)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31193 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14130)

(assert (=> b!481656 (= lt!218585 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218586))))

(declare-fun arrayScanForKey!0 (array!31193 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!481656 (= lt!218586 (arrayScanForKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(assert (=> b!481656 e!283387))

(declare-fun c!57933 () Bool)

(assert (=> b!481656 (= c!57933 (and (not (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218587 () Unit!14130)

(declare-fun lemmaKeyInListMapIsInArray!136 (array!31193 array!31195 (_ BitVec 32) (_ BitVec 32) V!19425 V!19425 (_ BitVec 64) Int) Unit!14130)

(assert (=> b!481656 (= lt!218587 (lemmaKeyInListMapIsInArray!136 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k!1332 defaultEntry!1519))))

(declare-fun b!481657 () Bool)

(assert (=> b!481657 (= e!283388 (and e!283389 mapRes!22357))))

(declare-fun condMapEmpty!22357 () Bool)

(declare-fun mapDefault!22357 () ValueCell!6521)

