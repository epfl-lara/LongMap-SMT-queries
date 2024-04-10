; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43306 () Bool)

(assert start!43306)

(declare-fun b_free!12173 () Bool)

(declare-fun b_next!12173 () Bool)

(assert (=> start!43306 (= b_free!12173 (not b_next!12173))))

(declare-fun tp!42790 () Bool)

(declare-fun b_and!20925 () Bool)

(assert (=> start!43306 (= tp!42790 b_and!20925)))

(declare-fun b!479815 () Bool)

(declare-fun res!286202 () Bool)

(declare-fun e!282324 () Bool)

(assert (=> b!479815 (=> (not res!286202) (not e!282324))))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!479815 (= res!286202 (validKeyInArray!0 k!1332))))

(declare-fun b!479816 () Bool)

(declare-fun res!286204 () Bool)

(assert (=> b!479816 (=> (not res!286204) (not e!282324))))

(declare-datatypes ((array!31037 0))(
  ( (array!31038 (arr!14925 (Array (_ BitVec 32) (_ BitVec 64))) (size!15283 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31037)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31037 (_ BitVec 32)) Bool)

(assert (=> b!479816 (= res!286204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479817 () Bool)

(declare-fun e!282321 () Bool)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!479817 (= e!282321 (ite (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!479818 () Bool)

(declare-fun res!286203 () Bool)

(assert (=> b!479818 (=> (not res!286203) (not e!282324))))

(declare-datatypes ((V!19317 0))(
  ( (V!19318 (val!6890 Int)) )
))
(declare-datatypes ((ValueCell!6481 0))(
  ( (ValueCellFull!6481 (v!9179 V!19317)) (EmptyCell!6481) )
))
(declare-datatypes ((array!31039 0))(
  ( (array!31040 (arr!14926 (Array (_ BitVec 32) ValueCell!6481)) (size!15284 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31039)

(assert (=> b!479818 (= res!286203 (and (= (size!15284 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15283 _keys!1874) (size!15284 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!22225 () Bool)

(declare-fun mapRes!22225 () Bool)

(declare-fun tp!42789 () Bool)

(declare-fun e!282322 () Bool)

(assert (=> mapNonEmpty!22225 (= mapRes!22225 (and tp!42789 e!282322))))

(declare-fun mapRest!22225 () (Array (_ BitVec 32) ValueCell!6481))

(declare-fun mapValue!22225 () ValueCell!6481)

(declare-fun mapKey!22225 () (_ BitVec 32))

(assert (=> mapNonEmpty!22225 (= (arr!14926 _values!1516) (store mapRest!22225 mapKey!22225 mapValue!22225))))

(declare-fun mapIsEmpty!22225 () Bool)

(assert (=> mapIsEmpty!22225 mapRes!22225))

(declare-fun b!479820 () Bool)

(assert (=> b!479820 (= e!282324 (not (and (bvslt #b00000000000000000000000000000000 (size!15283 _keys!1874)) (bvslt (size!15283 _keys!1874) #b01111111111111111111111111111111))))))

(assert (=> b!479820 e!282321))

(declare-fun c!57685 () Bool)

(assert (=> b!479820 (= c!57685 (and (not (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun minValue!1458 () V!19317)

(declare-datatypes ((Unit!14070 0))(
  ( (Unit!14071) )
))
(declare-fun lt!217912 () Unit!14070)

(declare-fun zeroValue!1458 () V!19317)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!110 (array!31037 array!31039 (_ BitVec 32) (_ BitVec 32) V!19317 V!19317 (_ BitVec 64) Int) Unit!14070)

(assert (=> b!479820 (= lt!217912 (lemmaKeyInListMapIsInArray!110 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k!1332 defaultEntry!1519))))

(declare-fun b!479821 () Bool)

(declare-fun res!286206 () Bool)

(assert (=> b!479821 (=> (not res!286206) (not e!282324))))

(declare-datatypes ((List!9124 0))(
  ( (Nil!9121) (Cons!9120 (h!9976 (_ BitVec 64)) (t!15330 List!9124)) )
))
(declare-fun arrayNoDuplicates!0 (array!31037 (_ BitVec 32) List!9124) Bool)

(assert (=> b!479821 (= res!286206 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9121))))

(declare-fun b!479822 () Bool)

(declare-fun arrayContainsKey!0 (array!31037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!479822 (= e!282321 (arrayContainsKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun b!479823 () Bool)

(declare-fun e!282319 () Bool)

(declare-fun e!282320 () Bool)

(assert (=> b!479823 (= e!282319 (and e!282320 mapRes!22225))))

(declare-fun condMapEmpty!22225 () Bool)

(declare-fun mapDefault!22225 () ValueCell!6481)

