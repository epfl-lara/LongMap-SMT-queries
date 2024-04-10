; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43390 () Bool)

(assert start!43390)

(declare-fun b_free!12217 () Bool)

(declare-fun b_next!12217 () Bool)

(assert (=> start!43390 (= b_free!12217 (not b_next!12217))))

(declare-fun tp!42927 () Bool)

(declare-fun b_and!20973 () Bool)

(assert (=> start!43390 (= tp!42927 b_and!20973)))

(declare-fun mapIsEmpty!22297 () Bool)

(declare-fun mapRes!22297 () Bool)

(assert (=> mapIsEmpty!22297 mapRes!22297))

(declare-fun res!286711 () Bool)

(declare-fun e!282891 () Bool)

(assert (=> start!43390 (=> (not res!286711) (not e!282891))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43390 (= res!286711 (validMask!0 mask!2352))))

(assert (=> start!43390 e!282891))

(assert (=> start!43390 true))

(declare-fun tp_is_empty!13729 () Bool)

(assert (=> start!43390 tp_is_empty!13729))

(declare-datatypes ((V!19377 0))(
  ( (V!19378 (val!6912 Int)) )
))
(declare-datatypes ((ValueCell!6503 0))(
  ( (ValueCellFull!6503 (v!9203 V!19377)) (EmptyCell!6503) )
))
(declare-datatypes ((array!31123 0))(
  ( (array!31124 (arr!14966 (Array (_ BitVec 32) ValueCell!6503)) (size!15324 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31123)

(declare-fun e!282889 () Bool)

(declare-fun array_inv!10794 (array!31123) Bool)

(assert (=> start!43390 (and (array_inv!10794 _values!1516) e!282889)))

(assert (=> start!43390 tp!42927))

(declare-datatypes ((array!31125 0))(
  ( (array!31126 (arr!14967 (Array (_ BitVec 32) (_ BitVec 64))) (size!15325 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31125)

(declare-fun array_inv!10795 (array!31125) Bool)

(assert (=> start!43390 (array_inv!10795 _keys!1874)))

(declare-fun b!480792 () Bool)

(declare-fun e!282887 () Bool)

(assert (=> b!480792 (= e!282887 tp_is_empty!13729)))

(declare-fun b!480793 () Bool)

(assert (=> b!480793 (= e!282891 (not (= (size!15325 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352))))))

(declare-fun lt!218226 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31125 (_ BitVec 32)) Bool)

(assert (=> b!480793 (arrayForallSeekEntryOrOpenFound!0 lt!218226 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14100 0))(
  ( (Unit!14101) )
))
(declare-fun lt!218227 () Unit!14100)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31125 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14100)

(assert (=> b!480793 (= lt!218227 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218226))))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!31125 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!480793 (= lt!218226 (arrayScanForKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun e!282886 () Bool)

(assert (=> b!480793 e!282886))

(declare-fun c!57811 () Bool)

(assert (=> b!480793 (= c!57811 (and (not (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218225 () Unit!14100)

(declare-fun minValue!1458 () V!19377)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19377)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!123 (array!31125 array!31123 (_ BitVec 32) (_ BitVec 32) V!19377 V!19377 (_ BitVec 64) Int) Unit!14100)

(assert (=> b!480793 (= lt!218225 (lemmaKeyInListMapIsInArray!123 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k!1332 defaultEntry!1519))))

(declare-fun b!480794 () Bool)

(declare-fun res!286710 () Bool)

(assert (=> b!480794 (=> (not res!286710) (not e!282891))))

(assert (=> b!480794 (= res!286710 (and (= (size!15324 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15325 _keys!1874) (size!15324 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!480795 () Bool)

(declare-fun res!286708 () Bool)

(assert (=> b!480795 (=> (not res!286708) (not e!282891))))

(declare-datatypes ((List!9149 0))(
  ( (Nil!9146) (Cons!9145 (h!10001 (_ BitVec 64)) (t!15359 List!9149)) )
))
(declare-fun arrayNoDuplicates!0 (array!31125 (_ BitVec 32) List!9149) Bool)

(assert (=> b!480795 (= res!286708 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9146))))

(declare-fun b!480796 () Bool)

(declare-fun res!286709 () Bool)

(assert (=> b!480796 (=> (not res!286709) (not e!282891))))

(assert (=> b!480796 (= res!286709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!480797 () Bool)

(declare-fun e!282888 () Bool)

(assert (=> b!480797 (= e!282888 tp_is_empty!13729)))

(declare-fun b!480798 () Bool)

(assert (=> b!480798 (= e!282886 (ite (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!480799 () Bool)

(declare-fun res!286713 () Bool)

(assert (=> b!480799 (=> (not res!286713) (not e!282891))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480799 (= res!286713 (validKeyInArray!0 k!1332))))

(declare-fun b!480800 () Bool)

(assert (=> b!480800 (= e!282889 (and e!282887 mapRes!22297))))

(declare-fun condMapEmpty!22297 () Bool)

(declare-fun mapDefault!22297 () ValueCell!6503)

