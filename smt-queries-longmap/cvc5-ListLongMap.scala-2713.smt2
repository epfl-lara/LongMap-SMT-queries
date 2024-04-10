; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40096 () Bool)

(assert start!40096)

(declare-fun b_free!10363 () Bool)

(declare-fun b_next!10363 () Bool)

(assert (=> start!40096 (= b_free!10363 (not b_next!10363))))

(declare-fun tp!36618 () Bool)

(declare-fun b_and!18331 () Bool)

(assert (=> start!40096 (= tp!36618 b_and!18331)))

(declare-fun b!438068 () Bool)

(declare-fun e!258455 () Bool)

(declare-fun tp_is_empty!11515 () Bool)

(assert (=> b!438068 (= e!258455 tp_is_empty!11515)))

(declare-fun b!438069 () Bool)

(declare-fun e!258453 () Bool)

(declare-fun e!258454 () Bool)

(assert (=> b!438069 (= e!258453 e!258454)))

(declare-fun res!258570 () Bool)

(assert (=> b!438069 (=> (not res!258570) (not e!258454))))

(declare-datatypes ((array!26847 0))(
  ( (array!26848 (arr!12873 (Array (_ BitVec 32) (_ BitVec 64))) (size!13225 (_ BitVec 32))) )
))
(declare-fun lt!201843 () array!26847)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26847 (_ BitVec 32)) Bool)

(assert (=> b!438069 (= res!258570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201843 mask!1025))))

(declare-fun _keys!709 () array!26847)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!438069 (= lt!201843 (array!26848 (store (arr!12873 _keys!709) i!563 k!794) (size!13225 _keys!709)))))

(declare-fun mapIsEmpty!18894 () Bool)

(declare-fun mapRes!18894 () Bool)

(assert (=> mapIsEmpty!18894 mapRes!18894))

(declare-fun b!438070 () Bool)

(declare-fun res!258571 () Bool)

(assert (=> b!438070 (=> (not res!258571) (not e!258453))))

(assert (=> b!438070 (= res!258571 (or (= (select (arr!12873 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12873 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!438071 () Bool)

(declare-fun res!258572 () Bool)

(assert (=> b!438071 (=> (not res!258572) (not e!258453))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16459 0))(
  ( (V!16460 (val!5802 Int)) )
))
(declare-datatypes ((ValueCell!5414 0))(
  ( (ValueCellFull!5414 (v!8049 V!16459)) (EmptyCell!5414) )
))
(declare-datatypes ((array!26849 0))(
  ( (array!26850 (arr!12874 (Array (_ BitVec 32) ValueCell!5414)) (size!13226 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26849)

(assert (=> b!438071 (= res!258572 (and (= (size!13226 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13225 _keys!709) (size!13226 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!438072 () Bool)

(declare-fun res!258575 () Bool)

(assert (=> b!438072 (=> (not res!258575) (not e!258453))))

(declare-fun arrayContainsKey!0 (array!26847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!438072 (= res!258575 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!438073 () Bool)

(declare-fun res!258577 () Bool)

(assert (=> b!438073 (=> (not res!258577) (not e!258453))))

(declare-datatypes ((List!7689 0))(
  ( (Nil!7686) (Cons!7685 (h!8541 (_ BitVec 64)) (t!13445 List!7689)) )
))
(declare-fun arrayNoDuplicates!0 (array!26847 (_ BitVec 32) List!7689) Bool)

(assert (=> b!438073 (= res!258577 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7686))))

(declare-fun b!438074 () Bool)

(declare-fun res!258576 () Bool)

(assert (=> b!438074 (=> (not res!258576) (not e!258454))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!438074 (= res!258576 (bvsle from!863 i!563))))

(declare-fun b!438075 () Bool)

(declare-fun e!258458 () Bool)

(assert (=> b!438075 (= e!258458 (not true))))

(declare-fun minValue!515 () V!16459)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16459)

(declare-fun lt!201841 () array!26849)

(declare-fun v!412 () V!16459)

(declare-datatypes ((tuple2!7690 0))(
  ( (tuple2!7691 (_1!3856 (_ BitVec 64)) (_2!3856 V!16459)) )
))
(declare-datatypes ((List!7690 0))(
  ( (Nil!7687) (Cons!7686 (h!8542 tuple2!7690) (t!13446 List!7690)) )
))
(declare-datatypes ((ListLongMap!6603 0))(
  ( (ListLongMap!6604 (toList!3317 List!7690)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1506 (array!26847 array!26849 (_ BitVec 32) (_ BitVec 32) V!16459 V!16459 (_ BitVec 32) Int) ListLongMap!6603)

(declare-fun +!1461 (ListLongMap!6603 tuple2!7690) ListLongMap!6603)

(assert (=> b!438075 (= (getCurrentListMapNoExtraKeys!1506 lt!201843 lt!201841 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1461 (getCurrentListMapNoExtraKeys!1506 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7691 k!794 v!412)))))

(declare-datatypes ((Unit!13026 0))(
  ( (Unit!13027) )
))
(declare-fun lt!201844 () Unit!13026)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!630 (array!26847 array!26849 (_ BitVec 32) (_ BitVec 32) V!16459 V!16459 (_ BitVec 32) (_ BitVec 64) V!16459 (_ BitVec 32) Int) Unit!13026)

(assert (=> b!438075 (= lt!201844 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!630 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!438076 () Bool)

(declare-fun res!258574 () Bool)

(assert (=> b!438076 (=> (not res!258574) (not e!258453))))

(assert (=> b!438076 (= res!258574 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13225 _keys!709))))))

(declare-fun b!438077 () Bool)

(declare-fun res!258582 () Bool)

(assert (=> b!438077 (=> (not res!258582) (not e!258453))))

(assert (=> b!438077 (= res!258582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!438078 () Bool)

(declare-fun res!258578 () Bool)

(assert (=> b!438078 (=> (not res!258578) (not e!258453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!438078 (= res!258578 (validKeyInArray!0 k!794))))

(declare-fun b!438079 () Bool)

(declare-fun res!258581 () Bool)

(assert (=> b!438079 (=> (not res!258581) (not e!258454))))

(assert (=> b!438079 (= res!258581 (arrayNoDuplicates!0 lt!201843 #b00000000000000000000000000000000 Nil!7686))))

(declare-fun b!438080 () Bool)

(declare-fun res!258573 () Bool)

(assert (=> b!438080 (=> (not res!258573) (not e!258453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!438080 (= res!258573 (validMask!0 mask!1025))))

(declare-fun b!438081 () Bool)

(assert (=> b!438081 (= e!258454 e!258458)))

(declare-fun res!258580 () Bool)

(assert (=> b!438081 (=> (not res!258580) (not e!258458))))

(assert (=> b!438081 (= res!258580 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!201842 () ListLongMap!6603)

(assert (=> b!438081 (= lt!201842 (getCurrentListMapNoExtraKeys!1506 lt!201843 lt!201841 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!438081 (= lt!201841 (array!26850 (store (arr!12874 _values!549) i!563 (ValueCellFull!5414 v!412)) (size!13226 _values!549)))))

(declare-fun lt!201845 () ListLongMap!6603)

(assert (=> b!438081 (= lt!201845 (getCurrentListMapNoExtraKeys!1506 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!258579 () Bool)

(assert (=> start!40096 (=> (not res!258579) (not e!258453))))

(assert (=> start!40096 (= res!258579 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13225 _keys!709))))))

(assert (=> start!40096 e!258453))

(assert (=> start!40096 tp_is_empty!11515))

(assert (=> start!40096 tp!36618))

(assert (=> start!40096 true))

(declare-fun e!258457 () Bool)

(declare-fun array_inv!9350 (array!26849) Bool)

(assert (=> start!40096 (and (array_inv!9350 _values!549) e!258457)))

(declare-fun array_inv!9351 (array!26847) Bool)

(assert (=> start!40096 (array_inv!9351 _keys!709)))

(declare-fun mapNonEmpty!18894 () Bool)

(declare-fun tp!36617 () Bool)

(declare-fun e!258456 () Bool)

(assert (=> mapNonEmpty!18894 (= mapRes!18894 (and tp!36617 e!258456))))

(declare-fun mapValue!18894 () ValueCell!5414)

(declare-fun mapRest!18894 () (Array (_ BitVec 32) ValueCell!5414))

(declare-fun mapKey!18894 () (_ BitVec 32))

(assert (=> mapNonEmpty!18894 (= (arr!12874 _values!549) (store mapRest!18894 mapKey!18894 mapValue!18894))))

(declare-fun b!438082 () Bool)

(assert (=> b!438082 (= e!258456 tp_is_empty!11515)))

(declare-fun b!438083 () Bool)

(assert (=> b!438083 (= e!258457 (and e!258455 mapRes!18894))))

(declare-fun condMapEmpty!18894 () Bool)

(declare-fun mapDefault!18894 () ValueCell!5414)

