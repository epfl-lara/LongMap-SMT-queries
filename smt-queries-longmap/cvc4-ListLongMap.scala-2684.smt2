; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39926 () Bool)

(assert start!39926)

(declare-fun b_free!10193 () Bool)

(declare-fun b_next!10193 () Bool)

(assert (=> start!39926 (= b_free!10193 (not b_next!10193))))

(declare-fun tp!36107 () Bool)

(declare-fun b_and!18045 () Bool)

(assert (=> start!39926 (= tp!36107 b_and!18045)))

(declare-fun b!433184 () Bool)

(declare-fun res!254925 () Bool)

(declare-fun e!256160 () Bool)

(assert (=> b!433184 (=> (not res!254925) (not e!256160))))

(declare-datatypes ((array!26523 0))(
  ( (array!26524 (arr!12711 (Array (_ BitVec 32) (_ BitVec 64))) (size!13063 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26523)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26523 (_ BitVec 32)) Bool)

(assert (=> b!433184 (= res!254925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!433185 () Bool)

(declare-fun res!254920 () Bool)

(assert (=> b!433185 (=> (not res!254920) (not e!256160))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26523 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!433185 (= res!254920 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun res!254923 () Bool)

(assert (=> start!39926 (=> (not res!254923) (not e!256160))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39926 (= res!254923 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13063 _keys!709))))))

(assert (=> start!39926 e!256160))

(declare-fun tp_is_empty!11345 () Bool)

(assert (=> start!39926 tp_is_empty!11345))

(assert (=> start!39926 tp!36107))

(assert (=> start!39926 true))

(declare-datatypes ((V!16231 0))(
  ( (V!16232 (val!5717 Int)) )
))
(declare-datatypes ((ValueCell!5329 0))(
  ( (ValueCellFull!5329 (v!7964 V!16231)) (EmptyCell!5329) )
))
(declare-datatypes ((array!26525 0))(
  ( (array!26526 (arr!12712 (Array (_ BitVec 32) ValueCell!5329)) (size!13064 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26525)

(declare-fun e!256152 () Bool)

(declare-fun array_inv!9248 (array!26525) Bool)

(assert (=> start!39926 (and (array_inv!9248 _values!549) e!256152)))

(declare-fun array_inv!9249 (array!26523) Bool)

(assert (=> start!39926 (array_inv!9249 _keys!709)))

(declare-fun b!433186 () Bool)

(declare-fun res!254921 () Bool)

(assert (=> b!433186 (=> (not res!254921) (not e!256160))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!433186 (= res!254921 (validKeyInArray!0 k!794))))

(declare-fun b!433187 () Bool)

(declare-fun e!256153 () Bool)

(declare-fun e!256154 () Bool)

(assert (=> b!433187 (= e!256153 e!256154)))

(declare-fun res!254922 () Bool)

(assert (=> b!433187 (=> (not res!254922) (not e!256154))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!433187 (= res!254922 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16231)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16231)

(declare-datatypes ((tuple2!7552 0))(
  ( (tuple2!7553 (_1!3787 (_ BitVec 64)) (_2!3787 V!16231)) )
))
(declare-datatypes ((List!7562 0))(
  ( (Nil!7559) (Cons!7558 (h!8414 tuple2!7552) (t!13204 List!7562)) )
))
(declare-datatypes ((ListLongMap!6465 0))(
  ( (ListLongMap!6466 (toList!3248 List!7562)) )
))
(declare-fun lt!198854 () ListLongMap!6465)

(declare-fun lt!198860 () array!26525)

(declare-fun lt!198857 () array!26523)

(declare-fun getCurrentListMapNoExtraKeys!1444 (array!26523 array!26525 (_ BitVec 32) (_ BitVec 32) V!16231 V!16231 (_ BitVec 32) Int) ListLongMap!6465)

(assert (=> b!433187 (= lt!198854 (getCurrentListMapNoExtraKeys!1444 lt!198857 lt!198860 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16231)

(assert (=> b!433187 (= lt!198860 (array!26526 (store (arr!12712 _values!549) i!563 (ValueCellFull!5329 v!412)) (size!13064 _values!549)))))

(declare-fun lt!198848 () ListLongMap!6465)

(assert (=> b!433187 (= lt!198848 (getCurrentListMapNoExtraKeys!1444 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!433188 () Bool)

(declare-fun res!254918 () Bool)

(assert (=> b!433188 (=> (not res!254918) (not e!256160))))

(assert (=> b!433188 (= res!254918 (and (= (size!13064 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13063 _keys!709) (size!13064 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!433189 () Bool)

(declare-fun e!256161 () Bool)

(assert (=> b!433189 (= e!256154 (not e!256161))))

(declare-fun res!254919 () Bool)

(assert (=> b!433189 (=> res!254919 e!256161)))

(assert (=> b!433189 (= res!254919 (not (validKeyInArray!0 (select (arr!12711 _keys!709) from!863))))))

(declare-fun lt!198859 () ListLongMap!6465)

(declare-fun lt!198846 () ListLongMap!6465)

(assert (=> b!433189 (= lt!198859 lt!198846)))

(declare-fun lt!198847 () ListLongMap!6465)

(declare-fun lt!198858 () tuple2!7552)

(declare-fun +!1396 (ListLongMap!6465 tuple2!7552) ListLongMap!6465)

(assert (=> b!433189 (= lt!198846 (+!1396 lt!198847 lt!198858))))

(assert (=> b!433189 (= lt!198859 (getCurrentListMapNoExtraKeys!1444 lt!198857 lt!198860 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!433189 (= lt!198858 (tuple2!7553 k!794 v!412))))

(assert (=> b!433189 (= lt!198847 (getCurrentListMapNoExtraKeys!1444 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12813 0))(
  ( (Unit!12814) )
))
(declare-fun lt!198852 () Unit!12813)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!577 (array!26523 array!26525 (_ BitVec 32) (_ BitVec 32) V!16231 V!16231 (_ BitVec 32) (_ BitVec 64) V!16231 (_ BitVec 32) Int) Unit!12813)

(assert (=> b!433189 (= lt!198852 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!577 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!433190 () Bool)

(declare-fun e!256156 () Bool)

(assert (=> b!433190 (= e!256156 true)))

(declare-fun lt!198851 () ListLongMap!6465)

(declare-fun lt!198853 () tuple2!7552)

(assert (=> b!433190 (= lt!198851 (+!1396 (+!1396 lt!198847 lt!198853) lt!198858))))

(declare-fun lt!198850 () Unit!12813)

(declare-fun lt!198849 () V!16231)

(declare-fun addCommutativeForDiffKeys!385 (ListLongMap!6465 (_ BitVec 64) V!16231 (_ BitVec 64) V!16231) Unit!12813)

(assert (=> b!433190 (= lt!198850 (addCommutativeForDiffKeys!385 lt!198847 k!794 v!412 (select (arr!12711 _keys!709) from!863) lt!198849))))

(declare-fun b!433191 () Bool)

(declare-fun res!254917 () Bool)

(assert (=> b!433191 (=> (not res!254917) (not e!256160))))

(assert (=> b!433191 (= res!254917 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13063 _keys!709))))))

(declare-fun mapIsEmpty!18639 () Bool)

(declare-fun mapRes!18639 () Bool)

(assert (=> mapIsEmpty!18639 mapRes!18639))

(declare-fun b!433192 () Bool)

(declare-fun e!256158 () Unit!12813)

(declare-fun Unit!12815 () Unit!12813)

(assert (=> b!433192 (= e!256158 Unit!12815)))

(declare-fun lt!198856 () Unit!12813)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26523 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12813)

(assert (=> b!433192 (= lt!198856 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!433192 false))

(declare-fun b!433193 () Bool)

(declare-fun e!256157 () Bool)

(assert (=> b!433193 (= e!256157 tp_is_empty!11345)))

(declare-fun b!433194 () Bool)

(assert (=> b!433194 (= e!256152 (and e!256157 mapRes!18639))))

(declare-fun condMapEmpty!18639 () Bool)

(declare-fun mapDefault!18639 () ValueCell!5329)

