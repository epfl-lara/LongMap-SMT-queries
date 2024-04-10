; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!854 () Bool)

(assert start!854)

(declare-fun b_free!247 () Bool)

(declare-fun b_next!247 () Bool)

(assert (=> start!854 (= b_free!247 (not b_next!247))))

(declare-fun tp!971 () Bool)

(declare-fun b_and!393 () Bool)

(assert (=> start!854 (= tp!971 b_and!393)))

(declare-fun mapNonEmpty!458 () Bool)

(declare-fun mapRes!458 () Bool)

(declare-fun tp!970 () Bool)

(declare-fun e!3874 () Bool)

(assert (=> mapNonEmpty!458 (= mapRes!458 (and tp!970 e!3874))))

(declare-datatypes ((V!611 0))(
  ( (V!612 (val!168 Int)) )
))
(declare-datatypes ((ValueCell!146 0))(
  ( (ValueCellFull!146 (v!1259 V!611)) (EmptyCell!146) )
))
(declare-fun mapValue!458 () ValueCell!146)

(declare-fun mapKey!458 () (_ BitVec 32))

(declare-fun mapRest!458 () (Array (_ BitVec 32) ValueCell!146))

(declare-datatypes ((array!581 0))(
  ( (array!582 (arr!279 (Array (_ BitVec 32) ValueCell!146)) (size!341 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!581)

(assert (=> mapNonEmpty!458 (= (arr!279 _values!1492) (store mapRest!458 mapKey!458 mapValue!458))))

(declare-fun b!6997 () Bool)

(declare-fun e!3870 () Bool)

(declare-datatypes ((array!583 0))(
  ( (array!584 (arr!280 (Array (_ BitVec 32) (_ BitVec 64))) (size!342 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!583)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!6997 (= e!3870 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!6998 () Bool)

(declare-fun res!7173 () Bool)

(declare-fun e!3868 () Bool)

(assert (=> b!6998 (=> (not res!7173) (not e!3868))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!6998 (= res!7173 (validKeyInArray!0 k!1278))))

(declare-fun b!6999 () Bool)

(declare-fun res!7174 () Bool)

(assert (=> b!6999 (=> (not res!7174) (not e!3868))))

(declare-datatypes ((List!187 0))(
  ( (Nil!184) (Cons!183 (h!749 (_ BitVec 64)) (t!2322 List!187)) )
))
(declare-fun arrayNoDuplicates!0 (array!583 (_ BitVec 32) List!187) Bool)

(assert (=> b!6999 (= res!7174 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!184))))

(declare-fun b!7000 () Bool)

(declare-fun e!3871 () Bool)

(assert (=> b!7000 (= e!3868 (not e!3871))))

(declare-fun res!7171 () Bool)

(assert (=> b!7000 (=> res!7171 e!3871)))

(assert (=> b!7000 (= res!7171 (not (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000)))))

(assert (=> b!7000 e!3870))

(declare-fun c!503 () Bool)

(assert (=> b!7000 (= c!503 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun minValue!1434 () V!611)

(declare-datatypes ((Unit!129 0))(
  ( (Unit!130) )
))
(declare-fun lt!1394 () Unit!129)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!611)

(declare-fun lemmaKeyInListMapIsInArray!46 (array!583 array!581 (_ BitVec 32) (_ BitVec 32) V!611 V!611 (_ BitVec 64) Int) Unit!129)

(assert (=> b!7000 (= lt!1394 (lemmaKeyInListMapIsInArray!46 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun mapIsEmpty!458 () Bool)

(assert (=> mapIsEmpty!458 mapRes!458))

(declare-fun b!7001 () Bool)

(declare-fun e!3872 () Bool)

(declare-fun e!3875 () Bool)

(assert (=> b!7001 (= e!3872 (and e!3875 mapRes!458))))

(declare-fun condMapEmpty!458 () Bool)

(declare-fun mapDefault!458 () ValueCell!146)

