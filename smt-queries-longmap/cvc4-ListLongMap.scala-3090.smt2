; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43484 () Bool)

(assert start!43484)

(declare-fun b_free!12263 () Bool)

(declare-fun b_next!12263 () Bool)

(assert (=> start!43484 (= b_free!12263 (not b_next!12263))))

(declare-fun tp!43072 () Bool)

(declare-fun b_and!21023 () Bool)

(assert (=> start!43484 (= tp!43072 b_and!21023)))

(declare-fun b!481813 () Bool)

(declare-fun e!283477 () Bool)

(assert (=> b!481813 (= e!283477 (not true))))

(declare-fun lt!218631 () (_ BitVec 32))

(declare-datatypes ((array!31211 0))(
  ( (array!31212 (arr!15008 (Array (_ BitVec 32) (_ BitVec 64))) (size!15366 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31211)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31211 (_ BitVec 32)) Bool)

(assert (=> b!481813 (arrayForallSeekEntryOrOpenFound!0 lt!218631 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14138 0))(
  ( (Unit!14139) )
))
(declare-fun lt!218632 () Unit!14138)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31211 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14138)

(assert (=> b!481813 (= lt!218632 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218631))))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!31211 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!481813 (= lt!218631 (arrayScanForKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun e!283476 () Bool)

(assert (=> b!481813 e!283476))

(declare-fun c!57948 () Bool)

(assert (=> b!481813 (= c!57948 (and (not (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218630 () Unit!14138)

(declare-datatypes ((V!19437 0))(
  ( (V!19438 (val!6935 Int)) )
))
(declare-fun minValue!1458 () V!19437)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19437)

(declare-datatypes ((ValueCell!6526 0))(
  ( (ValueCellFull!6526 (v!9228 V!19437)) (EmptyCell!6526) )
))
(declare-datatypes ((array!31213 0))(
  ( (array!31214 (arr!15009 (Array (_ BitVec 32) ValueCell!6526)) (size!15367 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31213)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!140 (array!31211 array!31213 (_ BitVec 32) (_ BitVec 32) V!19437 V!19437 (_ BitVec 64) Int) Unit!14138)

(assert (=> b!481813 (= lt!218630 (lemmaKeyInListMapIsInArray!140 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k!1332 defaultEntry!1519))))

(declare-fun b!481814 () Bool)

(declare-fun e!283475 () Bool)

(declare-fun tp_is_empty!13775 () Bool)

(assert (=> b!481814 (= e!283475 tp_is_empty!13775)))

(declare-fun b!481815 () Bool)

(declare-fun res!287228 () Bool)

(assert (=> b!481815 (=> (not res!287228) (not e!283477))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!481815 (= res!287228 (validKeyInArray!0 k!1332))))

(declare-fun b!481816 () Bool)

(declare-fun e!283479 () Bool)

(declare-fun e!283478 () Bool)

(declare-fun mapRes!22372 () Bool)

(assert (=> b!481816 (= e!283479 (and e!283478 mapRes!22372))))

(declare-fun condMapEmpty!22372 () Bool)

(declare-fun mapDefault!22372 () ValueCell!6526)

