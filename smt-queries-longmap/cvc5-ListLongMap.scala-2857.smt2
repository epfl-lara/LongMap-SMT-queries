; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41172 () Bool)

(assert start!41172)

(declare-fun b_free!11041 () Bool)

(declare-fun b_next!11041 () Bool)

(assert (=> start!41172 (= b_free!11041 (not b_next!11041))))

(declare-fun tp!38959 () Bool)

(declare-fun b_and!19321 () Bool)

(assert (=> start!41172 (= tp!38959 b_and!19321)))

(declare-fun b!460061 () Bool)

(declare-fun e!268445 () Bool)

(declare-fun e!268440 () Bool)

(assert (=> b!460061 (= e!268445 (not e!268440))))

(declare-fun res!275026 () Bool)

(assert (=> b!460061 (=> res!275026 e!268440)))

(declare-datatypes ((array!28559 0))(
  ( (array!28560 (arr!13720 (Array (_ BitVec 32) (_ BitVec 64))) (size!14072 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28559)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!460061 (= res!275026 (not (validKeyInArray!0 (select (arr!13720 _keys!709) from!863))))))

(declare-datatypes ((V!17611 0))(
  ( (V!17612 (val!6234 Int)) )
))
(declare-datatypes ((tuple2!8220 0))(
  ( (tuple2!8221 (_1!4121 (_ BitVec 64)) (_2!4121 V!17611)) )
))
(declare-datatypes ((List!8293 0))(
  ( (Nil!8290) (Cons!8289 (h!9145 tuple2!8220) (t!14213 List!8293)) )
))
(declare-datatypes ((ListLongMap!7133 0))(
  ( (ListLongMap!7134 (toList!3582 List!8293)) )
))
(declare-fun lt!208237 () ListLongMap!7133)

(declare-fun lt!208240 () ListLongMap!7133)

(assert (=> b!460061 (= lt!208237 lt!208240)))

(declare-fun lt!208231 () ListLongMap!7133)

(declare-fun lt!208228 () tuple2!8220)

(declare-fun +!1618 (ListLongMap!7133 tuple2!8220) ListLongMap!7133)

(assert (=> b!460061 (= lt!208240 (+!1618 lt!208231 lt!208228))))

(declare-fun minValue!515 () V!17611)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17611)

(declare-fun lt!208227 () array!28559)

(declare-datatypes ((ValueCell!5846 0))(
  ( (ValueCellFull!5846 (v!8512 V!17611)) (EmptyCell!5846) )
))
(declare-datatypes ((array!28561 0))(
  ( (array!28562 (arr!13721 (Array (_ BitVec 32) ValueCell!5846)) (size!14073 (_ BitVec 32))) )
))
(declare-fun lt!208239 () array!28561)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1762 (array!28559 array!28561 (_ BitVec 32) (_ BitVec 32) V!17611 V!17611 (_ BitVec 32) Int) ListLongMap!7133)

(assert (=> b!460061 (= lt!208237 (getCurrentListMapNoExtraKeys!1762 lt!208227 lt!208239 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!17611)

(assert (=> b!460061 (= lt!208228 (tuple2!8221 k!794 v!412))))

(declare-fun _values!549 () array!28561)

(assert (=> b!460061 (= lt!208231 (getCurrentListMapNoExtraKeys!1762 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13384 0))(
  ( (Unit!13385) )
))
(declare-fun lt!208236 () Unit!13384)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!774 (array!28559 array!28561 (_ BitVec 32) (_ BitVec 32) V!17611 V!17611 (_ BitVec 32) (_ BitVec 64) V!17611 (_ BitVec 32) Int) Unit!13384)

(assert (=> b!460061 (= lt!208236 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!774 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!275012 () Bool)

(declare-fun e!268447 () Bool)

(assert (=> start!41172 (=> (not res!275012) (not e!268447))))

(assert (=> start!41172 (= res!275012 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14072 _keys!709))))))

(assert (=> start!41172 e!268447))

(declare-fun tp_is_empty!12379 () Bool)

(assert (=> start!41172 tp_is_empty!12379))

(assert (=> start!41172 tp!38959))

(assert (=> start!41172 true))

(declare-fun e!268444 () Bool)

(declare-fun array_inv!9922 (array!28561) Bool)

(assert (=> start!41172 (and (array_inv!9922 _values!549) e!268444)))

(declare-fun array_inv!9923 (array!28559) Bool)

(assert (=> start!41172 (array_inv!9923 _keys!709)))

(declare-fun b!460062 () Bool)

(declare-fun e!268446 () Unit!13384)

(declare-fun Unit!13386 () Unit!13384)

(assert (=> b!460062 (= e!268446 Unit!13386)))

(declare-fun lt!208238 () Unit!13384)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28559 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13384)

(assert (=> b!460062 (= lt!208238 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!460062 false))

(declare-fun mapNonEmpty!20218 () Bool)

(declare-fun mapRes!20218 () Bool)

(declare-fun tp!38958 () Bool)

(declare-fun e!268448 () Bool)

(assert (=> mapNonEmpty!20218 (= mapRes!20218 (and tp!38958 e!268448))))

(declare-fun mapKey!20218 () (_ BitVec 32))

(declare-fun mapValue!20218 () ValueCell!5846)

(declare-fun mapRest!20218 () (Array (_ BitVec 32) ValueCell!5846))

(assert (=> mapNonEmpty!20218 (= (arr!13721 _values!549) (store mapRest!20218 mapKey!20218 mapValue!20218))))

(declare-fun b!460063 () Bool)

(declare-fun res!275019 () Bool)

(assert (=> b!460063 (=> (not res!275019) (not e!268447))))

(declare-fun arrayContainsKey!0 (array!28559 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!460063 (= res!275019 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!460064 () Bool)

(declare-fun res!275023 () Bool)

(declare-fun e!268442 () Bool)

(assert (=> b!460064 (=> (not res!275023) (not e!268442))))

(assert (=> b!460064 (= res!275023 (bvsle from!863 i!563))))

(declare-fun b!460065 () Bool)

(declare-fun res!275025 () Bool)

(assert (=> b!460065 (=> (not res!275025) (not e!268447))))

(assert (=> b!460065 (= res!275025 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14072 _keys!709))))))

(declare-fun b!460066 () Bool)

(declare-fun res!275017 () Bool)

(assert (=> b!460066 (=> (not res!275017) (not e!268447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!460066 (= res!275017 (validMask!0 mask!1025))))

(declare-fun b!460067 () Bool)

(assert (=> b!460067 (= e!268447 e!268442)))

(declare-fun res!275016 () Bool)

(assert (=> b!460067 (=> (not res!275016) (not e!268442))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28559 (_ BitVec 32)) Bool)

(assert (=> b!460067 (= res!275016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208227 mask!1025))))

(assert (=> b!460067 (= lt!208227 (array!28560 (store (arr!13720 _keys!709) i!563 k!794) (size!14072 _keys!709)))))

(declare-fun b!460068 () Bool)

(declare-fun res!275020 () Bool)

(assert (=> b!460068 (=> (not res!275020) (not e!268447))))

(assert (=> b!460068 (= res!275020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!460069 () Bool)

(declare-fun e!268449 () Bool)

(assert (=> b!460069 (= e!268449 tp_is_empty!12379)))

(declare-fun b!460070 () Bool)

(assert (=> b!460070 (= e!268444 (and e!268449 mapRes!20218))))

(declare-fun condMapEmpty!20218 () Bool)

(declare-fun mapDefault!20218 () ValueCell!5846)

