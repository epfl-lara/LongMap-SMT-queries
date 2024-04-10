; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43426 () Bool)

(assert start!43426)

(declare-fun b_free!12229 () Bool)

(declare-fun b_next!12229 () Bool)

(assert (=> start!43426 (= b_free!12229 (not b_next!12229))))

(declare-fun tp!42967 () Bool)

(declare-fun b_and!20987 () Bool)

(assert (=> start!43426 (= tp!42967 b_and!20987)))

(declare-fun lt!218379 () (_ BitVec 32))

(declare-fun b!481121 () Bool)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun e!283086 () Bool)

(declare-datatypes ((array!31143 0))(
  ( (array!31144 (arr!14975 (Array (_ BitVec 32) (_ BitVec 64))) (size!15333 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31143)

(assert (=> b!481121 (= e!283086 (not (or (not (= (size!15333 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352))) (bvslt lt!218379 #b00000000000000000000000000000000) (bvsle lt!218379 (size!15333 _keys!1874)))))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31143 (_ BitVec 32)) Bool)

(assert (=> b!481121 (arrayForallSeekEntryOrOpenFound!0 lt!218379 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14108 0))(
  ( (Unit!14109) )
))
(declare-fun lt!218378 () Unit!14108)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31143 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14108)

(assert (=> b!481121 (= lt!218378 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218379))))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!31143 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!481121 (= lt!218379 (arrayScanForKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun e!283081 () Bool)

(assert (=> b!481121 e!283081))

(declare-fun c!57863 () Bool)

(assert (=> b!481121 (= c!57863 (and (not (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((V!19393 0))(
  ( (V!19394 (val!6918 Int)) )
))
(declare-fun minValue!1458 () V!19393)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun lt!218380 () Unit!14108)

(declare-fun zeroValue!1458 () V!19393)

(declare-datatypes ((ValueCell!6509 0))(
  ( (ValueCellFull!6509 (v!9210 V!19393)) (EmptyCell!6509) )
))
(declare-datatypes ((array!31145 0))(
  ( (array!31146 (arr!14976 (Array (_ BitVec 32) ValueCell!6509)) (size!15334 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31145)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!126 (array!31143 array!31145 (_ BitVec 32) (_ BitVec 32) V!19393 V!19393 (_ BitVec 64) Int) Unit!14108)

(assert (=> b!481121 (= lt!218380 (lemmaKeyInListMapIsInArray!126 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k!1332 defaultEntry!1519))))

(declare-fun b!481122 () Bool)

(declare-fun arrayContainsKey!0 (array!31143 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!481122 (= e!283081 (arrayContainsKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun b!481123 () Bool)

(declare-fun res!286874 () Bool)

(assert (=> b!481123 (=> (not res!286874) (not e!283086))))

(assert (=> b!481123 (= res!286874 (and (= (size!15334 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15333 _keys!1874) (size!15334 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!481124 () Bool)

(declare-fun res!286873 () Bool)

(assert (=> b!481124 (=> (not res!286873) (not e!283086))))

(assert (=> b!481124 (= res!286873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!481125 () Bool)

(declare-fun e!283085 () Bool)

(declare-fun e!283084 () Bool)

(declare-fun mapRes!22318 () Bool)

(assert (=> b!481125 (= e!283085 (and e!283084 mapRes!22318))))

(declare-fun condMapEmpty!22318 () Bool)

(declare-fun mapDefault!22318 () ValueCell!6509)

