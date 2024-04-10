; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39850 () Bool)

(assert start!39850)

(declare-fun b_free!10117 () Bool)

(declare-fun b_next!10117 () Bool)

(assert (=> start!39850 (= b_free!10117 (not b_next!10117))))

(declare-fun tp!35880 () Bool)

(declare-fun b_and!17893 () Bool)

(assert (=> start!39850 (= tp!35880 b_and!17893)))

(declare-fun b!430828 () Bool)

(declare-fun e!255016 () Bool)

(declare-fun e!255017 () Bool)

(assert (=> b!430828 (= e!255016 e!255017)))

(declare-fun res!253209 () Bool)

(assert (=> b!430828 (=> (not res!253209) (not e!255017))))

(declare-datatypes ((array!26373 0))(
  ( (array!26374 (arr!12636 (Array (_ BitVec 32) (_ BitVec 64))) (size!12988 (_ BitVec 32))) )
))
(declare-fun lt!197137 () array!26373)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26373 (_ BitVec 32)) Bool)

(assert (=> b!430828 (= res!253209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197137 mask!1025))))

(declare-fun _keys!709 () array!26373)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!430828 (= lt!197137 (array!26374 (store (arr!12636 _keys!709) i!563 k!794) (size!12988 _keys!709)))))

(declare-fun b!430829 () Bool)

(declare-fun res!253207 () Bool)

(assert (=> b!430829 (=> (not res!253207) (not e!255016))))

(declare-fun arrayContainsKey!0 (array!26373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!430829 (= res!253207 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!430830 () Bool)

(declare-fun res!253202 () Bool)

(assert (=> b!430830 (=> (not res!253202) (not e!255016))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16131 0))(
  ( (V!16132 (val!5679 Int)) )
))
(declare-datatypes ((ValueCell!5291 0))(
  ( (ValueCellFull!5291 (v!7926 V!16131)) (EmptyCell!5291) )
))
(declare-datatypes ((array!26375 0))(
  ( (array!26376 (arr!12637 (Array (_ BitVec 32) ValueCell!5291)) (size!12989 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26375)

(assert (=> b!430830 (= res!253202 (and (= (size!12989 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12988 _keys!709) (size!12989 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!430831 () Bool)

(declare-fun e!255019 () Bool)

(assert (=> b!430831 (= e!255019 true)))

(declare-datatypes ((tuple2!7482 0))(
  ( (tuple2!7483 (_1!3752 (_ BitVec 64)) (_2!3752 V!16131)) )
))
(declare-fun lt!197145 () tuple2!7482)

(declare-datatypes ((List!7500 0))(
  ( (Nil!7497) (Cons!7496 (h!8352 tuple2!7482) (t!13066 List!7500)) )
))
(declare-datatypes ((ListLongMap!6395 0))(
  ( (ListLongMap!6396 (toList!3213 List!7500)) )
))
(declare-fun lt!197140 () ListLongMap!6395)

(declare-fun lt!197141 () tuple2!7482)

(declare-fun lt!197143 () ListLongMap!6395)

(declare-fun +!1362 (ListLongMap!6395 tuple2!7482) ListLongMap!6395)

(assert (=> b!430831 (= lt!197143 (+!1362 (+!1362 lt!197140 lt!197141) lt!197145))))

(declare-fun lt!197146 () V!16131)

(declare-datatypes ((Unit!12687 0))(
  ( (Unit!12688) )
))
(declare-fun lt!197147 () Unit!12687)

(declare-fun v!412 () V!16131)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!357 (ListLongMap!6395 (_ BitVec 64) V!16131 (_ BitVec 64) V!16131) Unit!12687)

(assert (=> b!430831 (= lt!197147 (addCommutativeForDiffKeys!357 lt!197140 k!794 v!412 (select (arr!12636 _keys!709) from!863) lt!197146))))

(declare-fun b!430832 () Bool)

(declare-fun res!253212 () Bool)

(assert (=> b!430832 (=> (not res!253212) (not e!255016))))

(assert (=> b!430832 (= res!253212 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12988 _keys!709))))))

(declare-fun b!430833 () Bool)

(declare-fun res!253215 () Bool)

(assert (=> b!430833 (=> (not res!253215) (not e!255017))))

(assert (=> b!430833 (= res!253215 (bvsle from!863 i!563))))

(declare-fun b!430834 () Bool)

(declare-fun e!255014 () Unit!12687)

(declare-fun Unit!12689 () Unit!12687)

(assert (=> b!430834 (= e!255014 Unit!12689)))

(declare-fun lt!197139 () Unit!12687)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26373 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12687)

(assert (=> b!430834 (= lt!197139 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!430834 false))

(declare-fun b!430835 () Bool)

(declare-fun e!255013 () Bool)

(declare-fun e!255021 () Bool)

(assert (=> b!430835 (= e!255013 (not e!255021))))

(declare-fun res!253201 () Bool)

(assert (=> b!430835 (=> res!253201 e!255021)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!430835 (= res!253201 (not (validKeyInArray!0 (select (arr!12636 _keys!709) from!863))))))

(declare-fun lt!197136 () ListLongMap!6395)

(declare-fun lt!197150 () ListLongMap!6395)

(assert (=> b!430835 (= lt!197136 lt!197150)))

(assert (=> b!430835 (= lt!197150 (+!1362 lt!197140 lt!197145))))

(declare-fun minValue!515 () V!16131)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!197149 () array!26375)

(declare-fun zeroValue!515 () V!16131)

(declare-fun getCurrentListMapNoExtraKeys!1414 (array!26373 array!26375 (_ BitVec 32) (_ BitVec 32) V!16131 V!16131 (_ BitVec 32) Int) ListLongMap!6395)

(assert (=> b!430835 (= lt!197136 (getCurrentListMapNoExtraKeys!1414 lt!197137 lt!197149 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!430835 (= lt!197145 (tuple2!7483 k!794 v!412))))

(assert (=> b!430835 (= lt!197140 (getCurrentListMapNoExtraKeys!1414 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!197138 () Unit!12687)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!550 (array!26373 array!26375 (_ BitVec 32) (_ BitVec 32) V!16131 V!16131 (_ BitVec 32) (_ BitVec 64) V!16131 (_ BitVec 32) Int) Unit!12687)

(assert (=> b!430835 (= lt!197138 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!550 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!430836 () Bool)

(declare-fun e!255012 () Bool)

(declare-fun e!255018 () Bool)

(declare-fun mapRes!18525 () Bool)

(assert (=> b!430836 (= e!255012 (and e!255018 mapRes!18525))))

(declare-fun condMapEmpty!18525 () Bool)

(declare-fun mapDefault!18525 () ValueCell!5291)

