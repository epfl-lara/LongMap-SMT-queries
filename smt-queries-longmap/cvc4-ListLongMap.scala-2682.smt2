; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39914 () Bool)

(assert start!39914)

(declare-fun b_free!10181 () Bool)

(declare-fun b_next!10181 () Bool)

(assert (=> start!39914 (= b_free!10181 (not b_next!10181))))

(declare-fun tp!36072 () Bool)

(declare-fun b_and!18021 () Bool)

(assert (=> start!39914 (= tp!36072 b_and!18021)))

(declare-fun b!432812 () Bool)

(declare-fun res!254653 () Bool)

(declare-fun e!255978 () Bool)

(assert (=> b!432812 (=> (not res!254653) (not e!255978))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!432812 (= res!254653 (bvsle from!863 i!563))))

(declare-fun b!432813 () Bool)

(declare-fun e!255977 () Bool)

(declare-fun tp_is_empty!11333 () Bool)

(assert (=> b!432813 (= e!255977 tp_is_empty!11333)))

(declare-fun mapIsEmpty!18621 () Bool)

(declare-fun mapRes!18621 () Bool)

(assert (=> mapIsEmpty!18621 mapRes!18621))

(declare-fun b!432814 () Bool)

(declare-fun e!255974 () Bool)

(assert (=> b!432814 (= e!255974 true)))

(declare-datatypes ((V!16215 0))(
  ( (V!16216 (val!5711 Int)) )
))
(declare-datatypes ((tuple2!7540 0))(
  ( (tuple2!7541 (_1!3781 (_ BitVec 64)) (_2!3781 V!16215)) )
))
(declare-fun lt!198581 () tuple2!7540)

(declare-fun lt!198584 () tuple2!7540)

(declare-datatypes ((List!7554 0))(
  ( (Nil!7551) (Cons!7550 (h!8406 tuple2!7540) (t!13184 List!7554)) )
))
(declare-datatypes ((ListLongMap!6453 0))(
  ( (ListLongMap!6454 (toList!3242 List!7554)) )
))
(declare-fun lt!198583 () ListLongMap!6453)

(declare-fun lt!198587 () ListLongMap!6453)

(declare-fun +!1390 (ListLongMap!6453 tuple2!7540) ListLongMap!6453)

(assert (=> b!432814 (= lt!198587 (+!1390 (+!1390 lt!198583 lt!198584) lt!198581))))

(declare-fun lt!198580 () V!16215)

(declare-datatypes ((Unit!12794 0))(
  ( (Unit!12795) )
))
(declare-fun lt!198582 () Unit!12794)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!16215)

(declare-datatypes ((array!26499 0))(
  ( (array!26500 (arr!12699 (Array (_ BitVec 32) (_ BitVec 64))) (size!13051 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26499)

(declare-fun addCommutativeForDiffKeys!379 (ListLongMap!6453 (_ BitVec 64) V!16215 (_ BitVec 64) V!16215) Unit!12794)

(assert (=> b!432814 (= lt!198582 (addCommutativeForDiffKeys!379 lt!198583 k!794 v!412 (select (arr!12699 _keys!709) from!863) lt!198580))))

(declare-fun mapNonEmpty!18621 () Bool)

(declare-fun tp!36071 () Bool)

(declare-fun e!255973 () Bool)

(assert (=> mapNonEmpty!18621 (= mapRes!18621 (and tp!36071 e!255973))))

(declare-datatypes ((ValueCell!5323 0))(
  ( (ValueCellFull!5323 (v!7958 V!16215)) (EmptyCell!5323) )
))
(declare-fun mapValue!18621 () ValueCell!5323)

(declare-datatypes ((array!26501 0))(
  ( (array!26502 (arr!12700 (Array (_ BitVec 32) ValueCell!5323)) (size!13052 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26501)

(declare-fun mapKey!18621 () (_ BitVec 32))

(declare-fun mapRest!18621 () (Array (_ BitVec 32) ValueCell!5323))

(assert (=> mapNonEmpty!18621 (= (arr!12700 _values!549) (store mapRest!18621 mapKey!18621 mapValue!18621))))

(declare-fun b!432815 () Bool)

(declare-fun e!255980 () Bool)

(declare-fun e!255981 () Bool)

(assert (=> b!432815 (= e!255980 (not e!255981))))

(declare-fun res!254645 () Bool)

(assert (=> b!432815 (=> res!254645 e!255981)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!432815 (= res!254645 (not (validKeyInArray!0 (select (arr!12699 _keys!709) from!863))))))

(declare-fun lt!198585 () ListLongMap!6453)

(declare-fun lt!198586 () ListLongMap!6453)

(assert (=> b!432815 (= lt!198585 lt!198586)))

(assert (=> b!432815 (= lt!198586 (+!1390 lt!198583 lt!198581))))

(declare-fun lt!198579 () array!26499)

(declare-fun minValue!515 () V!16215)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16215)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!198590 () array!26501)

(declare-fun getCurrentListMapNoExtraKeys!1440 (array!26499 array!26501 (_ BitVec 32) (_ BitVec 32) V!16215 V!16215 (_ BitVec 32) Int) ListLongMap!6453)

(assert (=> b!432815 (= lt!198585 (getCurrentListMapNoExtraKeys!1440 lt!198579 lt!198590 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!432815 (= lt!198581 (tuple2!7541 k!794 v!412))))

(assert (=> b!432815 (= lt!198583 (getCurrentListMapNoExtraKeys!1440 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!198576 () Unit!12794)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!573 (array!26499 array!26501 (_ BitVec 32) (_ BitVec 32) V!16215 V!16215 (_ BitVec 32) (_ BitVec 64) V!16215 (_ BitVec 32) Int) Unit!12794)

(assert (=> b!432815 (= lt!198576 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!573 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!254649 () Bool)

(declare-fun e!255976 () Bool)

(assert (=> start!39914 (=> (not res!254649) (not e!255976))))

(assert (=> start!39914 (= res!254649 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13051 _keys!709))))))

(assert (=> start!39914 e!255976))

(assert (=> start!39914 tp_is_empty!11333))

(assert (=> start!39914 tp!36072))

(assert (=> start!39914 true))

(declare-fun e!255975 () Bool)

(declare-fun array_inv!9238 (array!26501) Bool)

(assert (=> start!39914 (and (array_inv!9238 _values!549) e!255975)))

(declare-fun array_inv!9239 (array!26499) Bool)

(assert (=> start!39914 (array_inv!9239 _keys!709)))

(declare-fun b!432816 () Bool)

(assert (=> b!432816 (= e!255976 e!255978)))

(declare-fun res!254651 () Bool)

(assert (=> b!432816 (=> (not res!254651) (not e!255978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26499 (_ BitVec 32)) Bool)

(assert (=> b!432816 (= res!254651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!198579 mask!1025))))

(assert (=> b!432816 (= lt!198579 (array!26500 (store (arr!12699 _keys!709) i!563 k!794) (size!13051 _keys!709)))))

(declare-fun b!432817 () Bool)

(assert (=> b!432817 (= e!255975 (and e!255977 mapRes!18621))))

(declare-fun condMapEmpty!18621 () Bool)

(declare-fun mapDefault!18621 () ValueCell!5323)

