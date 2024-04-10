; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39688 () Bool)

(assert start!39688)

(declare-fun b_free!9955 () Bool)

(declare-fun b_next!9955 () Bool)

(assert (=> start!39688 (= b_free!9955 (not b_next!9955))))

(declare-fun tp!35394 () Bool)

(declare-fun b_and!17611 () Bool)

(assert (=> start!39688 (= tp!35394 b_and!17611)))

(declare-fun b!426335 () Bool)

(declare-fun res!249821 () Bool)

(declare-fun e!252955 () Bool)

(assert (=> b!426335 (=> (not res!249821) (not e!252955))))

(declare-datatypes ((array!26053 0))(
  ( (array!26054 (arr!12476 (Array (_ BitVec 32) (_ BitVec 64))) (size!12828 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26053)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26053 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!426335 (= res!249821 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!426336 () Bool)

(declare-fun e!252957 () Bool)

(assert (=> b!426336 (= e!252955 e!252957)))

(declare-fun res!249817 () Bool)

(assert (=> b!426336 (=> (not res!249817) (not e!252957))))

(declare-fun lt!194933 () array!26053)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26053 (_ BitVec 32)) Bool)

(assert (=> b!426336 (= res!249817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194933 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!426336 (= lt!194933 (array!26054 (store (arr!12476 _keys!709) i!563 k!794) (size!12828 _keys!709)))))

(declare-fun res!249815 () Bool)

(assert (=> start!39688 (=> (not res!249815) (not e!252955))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39688 (= res!249815 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12828 _keys!709))))))

(assert (=> start!39688 e!252955))

(declare-fun tp_is_empty!11107 () Bool)

(assert (=> start!39688 tp_is_empty!11107))

(assert (=> start!39688 tp!35394))

(assert (=> start!39688 true))

(declare-datatypes ((V!15915 0))(
  ( (V!15916 (val!5598 Int)) )
))
(declare-datatypes ((ValueCell!5210 0))(
  ( (ValueCellFull!5210 (v!7845 V!15915)) (EmptyCell!5210) )
))
(declare-datatypes ((array!26055 0))(
  ( (array!26056 (arr!12477 (Array (_ BitVec 32) ValueCell!5210)) (size!12829 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26055)

(declare-fun e!252954 () Bool)

(declare-fun array_inv!9094 (array!26055) Bool)

(assert (=> start!39688 (and (array_inv!9094 _values!549) e!252954)))

(declare-fun array_inv!9095 (array!26053) Bool)

(assert (=> start!39688 (array_inv!9095 _keys!709)))

(declare-fun mapNonEmpty!18282 () Bool)

(declare-fun mapRes!18282 () Bool)

(declare-fun tp!35393 () Bool)

(declare-fun e!252956 () Bool)

(assert (=> mapNonEmpty!18282 (= mapRes!18282 (and tp!35393 e!252956))))

(declare-fun mapKey!18282 () (_ BitVec 32))

(declare-fun mapValue!18282 () ValueCell!5210)

(declare-fun mapRest!18282 () (Array (_ BitVec 32) ValueCell!5210))

(assert (=> mapNonEmpty!18282 (= (arr!12477 _values!549) (store mapRest!18282 mapKey!18282 mapValue!18282))))

(declare-fun b!426337 () Bool)

(declare-fun res!249813 () Bool)

(assert (=> b!426337 (=> (not res!249813) (not e!252955))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!426337 (= res!249813 (validMask!0 mask!1025))))

(declare-fun b!426338 () Bool)

(declare-fun res!249822 () Bool)

(assert (=> b!426338 (=> (not res!249822) (not e!252955))))

(assert (=> b!426338 (= res!249822 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12828 _keys!709))))))

(declare-fun b!426339 () Bool)

(declare-fun res!249825 () Bool)

(assert (=> b!426339 (=> (not res!249825) (not e!252955))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!426339 (= res!249825 (and (= (size!12829 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12828 _keys!709) (size!12829 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!426340 () Bool)

(declare-fun e!252959 () Bool)

(assert (=> b!426340 (= e!252957 e!252959)))

(declare-fun res!249816 () Bool)

(assert (=> b!426340 (=> (not res!249816) (not e!252959))))

(assert (=> b!426340 (= res!249816 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!15915)

(declare-datatypes ((tuple2!7354 0))(
  ( (tuple2!7355 (_1!3688 (_ BitVec 64)) (_2!3688 V!15915)) )
))
(declare-datatypes ((List!7368 0))(
  ( (Nil!7365) (Cons!7364 (h!8220 tuple2!7354) (t!12812 List!7368)) )
))
(declare-datatypes ((ListLongMap!6267 0))(
  ( (ListLongMap!6268 (toList!3149 List!7368)) )
))
(declare-fun lt!194932 () ListLongMap!6267)

(declare-fun zeroValue!515 () V!15915)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!194930 () array!26055)

(declare-fun getCurrentListMapNoExtraKeys!1353 (array!26053 array!26055 (_ BitVec 32) (_ BitVec 32) V!15915 V!15915 (_ BitVec 32) Int) ListLongMap!6267)

(assert (=> b!426340 (= lt!194932 (getCurrentListMapNoExtraKeys!1353 lt!194933 lt!194930 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15915)

(assert (=> b!426340 (= lt!194930 (array!26056 (store (arr!12477 _values!549) i!563 (ValueCellFull!5210 v!412)) (size!12829 _values!549)))))

(declare-fun lt!194929 () ListLongMap!6267)

(assert (=> b!426340 (= lt!194929 (getCurrentListMapNoExtraKeys!1353 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!426341 () Bool)

(declare-fun res!249820 () Bool)

(assert (=> b!426341 (=> (not res!249820) (not e!252955))))

(assert (=> b!426341 (= res!249820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!426342 () Bool)

(declare-fun res!249814 () Bool)

(assert (=> b!426342 (=> (not res!249814) (not e!252957))))

(declare-datatypes ((List!7369 0))(
  ( (Nil!7366) (Cons!7365 (h!8221 (_ BitVec 64)) (t!12813 List!7369)) )
))
(declare-fun arrayNoDuplicates!0 (array!26053 (_ BitVec 32) List!7369) Bool)

(assert (=> b!426342 (= res!249814 (arrayNoDuplicates!0 lt!194933 #b00000000000000000000000000000000 Nil!7366))))

(declare-fun b!426343 () Bool)

(assert (=> b!426343 (= e!252959 (not true))))

(declare-fun +!1307 (ListLongMap!6267 tuple2!7354) ListLongMap!6267)

(assert (=> b!426343 (= (getCurrentListMapNoExtraKeys!1353 lt!194933 lt!194930 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1307 (getCurrentListMapNoExtraKeys!1353 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7355 k!794 v!412)))))

(declare-datatypes ((Unit!12516 0))(
  ( (Unit!12517) )
))
(declare-fun lt!194931 () Unit!12516)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!502 (array!26053 array!26055 (_ BitVec 32) (_ BitVec 32) V!15915 V!15915 (_ BitVec 32) (_ BitVec 64) V!15915 (_ BitVec 32) Int) Unit!12516)

(assert (=> b!426343 (= lt!194931 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!502 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!426344 () Bool)

(assert (=> b!426344 (= e!252956 tp_is_empty!11107)))

(declare-fun b!426345 () Bool)

(declare-fun e!252960 () Bool)

(assert (=> b!426345 (= e!252960 tp_is_empty!11107)))

(declare-fun b!426346 () Bool)

(declare-fun res!249824 () Bool)

(assert (=> b!426346 (=> (not res!249824) (not e!252955))))

(assert (=> b!426346 (= res!249824 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7366))))

(declare-fun b!426347 () Bool)

(declare-fun res!249823 () Bool)

(assert (=> b!426347 (=> (not res!249823) (not e!252957))))

(assert (=> b!426347 (= res!249823 (bvsle from!863 i!563))))

(declare-fun b!426348 () Bool)

(declare-fun res!249818 () Bool)

(assert (=> b!426348 (=> (not res!249818) (not e!252955))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!426348 (= res!249818 (validKeyInArray!0 k!794))))

(declare-fun mapIsEmpty!18282 () Bool)

(assert (=> mapIsEmpty!18282 mapRes!18282))

(declare-fun b!426349 () Bool)

(declare-fun res!249819 () Bool)

(assert (=> b!426349 (=> (not res!249819) (not e!252955))))

(assert (=> b!426349 (= res!249819 (or (= (select (arr!12476 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12476 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!426350 () Bool)

(assert (=> b!426350 (= e!252954 (and e!252960 mapRes!18282))))

(declare-fun condMapEmpty!18282 () Bool)

(declare-fun mapDefault!18282 () ValueCell!5210)

