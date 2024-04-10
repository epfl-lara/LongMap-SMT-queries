; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39880 () Bool)

(assert start!39880)

(declare-fun b_free!10147 () Bool)

(declare-fun b_next!10147 () Bool)

(assert (=> start!39880 (= b_free!10147 (not b_next!10147))))

(declare-fun tp!35969 () Bool)

(declare-fun b_and!17953 () Bool)

(assert (=> start!39880 (= tp!35969 b_and!17953)))

(declare-fun b!431759 () Bool)

(declare-fun e!255470 () Bool)

(declare-fun e!255465 () Bool)

(assert (=> b!431759 (= e!255470 e!255465)))

(declare-fun res!253882 () Bool)

(assert (=> b!431759 (=> (not res!253882) (not e!255465))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!431759 (= res!253882 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16171 0))(
  ( (V!16172 (val!5694 Int)) )
))
(declare-fun minValue!515 () V!16171)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16171)

(declare-datatypes ((tuple2!7512 0))(
  ( (tuple2!7513 (_1!3767 (_ BitVec 64)) (_2!3767 V!16171)) )
))
(declare-datatypes ((List!7526 0))(
  ( (Nil!7523) (Cons!7522 (h!8378 tuple2!7512) (t!13122 List!7526)) )
))
(declare-datatypes ((ListLongMap!6425 0))(
  ( (ListLongMap!6426 (toList!3228 List!7526)) )
))
(declare-fun lt!197817 () ListLongMap!6425)

(declare-datatypes ((ValueCell!5306 0))(
  ( (ValueCellFull!5306 (v!7941 V!16171)) (EmptyCell!5306) )
))
(declare-datatypes ((array!26433 0))(
  ( (array!26434 (arr!12666 (Array (_ BitVec 32) ValueCell!5306)) (size!13018 (_ BitVec 32))) )
))
(declare-fun lt!197824 () array!26433)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!26435 0))(
  ( (array!26436 (arr!12667 (Array (_ BitVec 32) (_ BitVec 64))) (size!13019 (_ BitVec 32))) )
))
(declare-fun lt!197813 () array!26435)

(declare-fun getCurrentListMapNoExtraKeys!1426 (array!26435 array!26433 (_ BitVec 32) (_ BitVec 32) V!16171 V!16171 (_ BitVec 32) Int) ListLongMap!6425)

(assert (=> b!431759 (= lt!197817 (getCurrentListMapNoExtraKeys!1426 lt!197813 lt!197824 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26433)

(declare-fun v!412 () V!16171)

(assert (=> b!431759 (= lt!197824 (array!26434 (store (arr!12666 _values!549) i!563 (ValueCellFull!5306 v!412)) (size!13018 _values!549)))))

(declare-fun lt!197814 () ListLongMap!6425)

(declare-fun _keys!709 () array!26435)

(assert (=> b!431759 (= lt!197814 (getCurrentListMapNoExtraKeys!1426 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!431760 () Bool)

(declare-fun e!255464 () Bool)

(declare-fun e!255466 () Bool)

(assert (=> b!431760 (= e!255464 e!255466)))

(declare-fun res!253879 () Bool)

(assert (=> b!431760 (=> res!253879 e!255466)))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!431760 (= res!253879 (= k!794 (select (arr!12667 _keys!709) from!863)))))

(assert (=> b!431760 (not (= (select (arr!12667 _keys!709) from!863) k!794))))

(declare-datatypes ((Unit!12736 0))(
  ( (Unit!12737) )
))
(declare-fun lt!197812 () Unit!12736)

(declare-fun e!255471 () Unit!12736)

(assert (=> b!431760 (= lt!197812 e!255471)))

(declare-fun c!55556 () Bool)

(assert (=> b!431760 (= c!55556 (= (select (arr!12667 _keys!709) from!863) k!794))))

(declare-fun lt!197821 () ListLongMap!6425)

(assert (=> b!431760 (= lt!197817 lt!197821)))

(declare-fun lt!197818 () ListLongMap!6425)

(declare-fun lt!197823 () tuple2!7512)

(declare-fun +!1376 (ListLongMap!6425 tuple2!7512) ListLongMap!6425)

(assert (=> b!431760 (= lt!197821 (+!1376 lt!197818 lt!197823))))

(declare-fun lt!197820 () V!16171)

(assert (=> b!431760 (= lt!197823 (tuple2!7513 (select (arr!12667 _keys!709) from!863) lt!197820))))

(declare-fun get!6294 (ValueCell!5306 V!16171) V!16171)

(declare-fun dynLambda!797 (Int (_ BitVec 64)) V!16171)

(assert (=> b!431760 (= lt!197820 (get!6294 (select (arr!12666 _values!549) from!863) (dynLambda!797 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431761 () Bool)

(declare-fun res!253880 () Bool)

(declare-fun e!255463 () Bool)

(assert (=> b!431761 (=> (not res!253880) (not e!255463))))

(assert (=> b!431761 (= res!253880 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13019 _keys!709))))))

(declare-fun b!431762 () Bool)

(assert (=> b!431762 (= e!255463 e!255470)))

(declare-fun res!253888 () Bool)

(assert (=> b!431762 (=> (not res!253888) (not e!255470))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26435 (_ BitVec 32)) Bool)

(assert (=> b!431762 (= res!253888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197813 mask!1025))))

(assert (=> b!431762 (= lt!197813 (array!26436 (store (arr!12667 _keys!709) i!563 k!794) (size!13019 _keys!709)))))

(declare-fun b!431763 () Bool)

(declare-fun Unit!12738 () Unit!12736)

(assert (=> b!431763 (= e!255471 Unit!12738)))

(declare-fun b!431764 () Bool)

(declare-fun res!253886 () Bool)

(assert (=> b!431764 (=> (not res!253886) (not e!255463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!431764 (= res!253886 (validMask!0 mask!1025))))

(declare-fun b!431765 () Bool)

(declare-fun res!253883 () Bool)

(assert (=> b!431765 (=> (not res!253883) (not e!255463))))

(declare-datatypes ((List!7527 0))(
  ( (Nil!7524) (Cons!7523 (h!8379 (_ BitVec 64)) (t!13123 List!7527)) )
))
(declare-fun arrayNoDuplicates!0 (array!26435 (_ BitVec 32) List!7527) Bool)

(assert (=> b!431765 (= res!253883 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7524))))

(declare-fun mapIsEmpty!18570 () Bool)

(declare-fun mapRes!18570 () Bool)

(assert (=> mapIsEmpty!18570 mapRes!18570))

(declare-fun b!431766 () Bool)

(assert (=> b!431766 (= e!255465 (not e!255464))))

(declare-fun res!253887 () Bool)

(assert (=> b!431766 (=> res!253887 e!255464)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!431766 (= res!253887 (not (validKeyInArray!0 (select (arr!12667 _keys!709) from!863))))))

(declare-fun lt!197811 () ListLongMap!6425)

(assert (=> b!431766 (= lt!197811 lt!197818)))

(declare-fun lt!197825 () ListLongMap!6425)

(declare-fun lt!197819 () tuple2!7512)

(assert (=> b!431766 (= lt!197818 (+!1376 lt!197825 lt!197819))))

(assert (=> b!431766 (= lt!197811 (getCurrentListMapNoExtraKeys!1426 lt!197813 lt!197824 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!431766 (= lt!197819 (tuple2!7513 k!794 v!412))))

(assert (=> b!431766 (= lt!197825 (getCurrentListMapNoExtraKeys!1426 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!197815 () Unit!12736)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!561 (array!26435 array!26433 (_ BitVec 32) (_ BitVec 32) V!16171 V!16171 (_ BitVec 32) (_ BitVec 64) V!16171 (_ BitVec 32) Int) Unit!12736)

(assert (=> b!431766 (= lt!197815 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!561 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!431758 () Bool)

(declare-fun res!253876 () Bool)

(assert (=> b!431758 (=> (not res!253876) (not e!255463))))

(assert (=> b!431758 (= res!253876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!253890 () Bool)

(assert (=> start!39880 (=> (not res!253890) (not e!255463))))

(assert (=> start!39880 (= res!253890 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13019 _keys!709))))))

(assert (=> start!39880 e!255463))

(declare-fun tp_is_empty!11299 () Bool)

(assert (=> start!39880 tp_is_empty!11299))

(assert (=> start!39880 tp!35969))

(assert (=> start!39880 true))

(declare-fun e!255462 () Bool)

(declare-fun array_inv!9216 (array!26433) Bool)

(assert (=> start!39880 (and (array_inv!9216 _values!549) e!255462)))

(declare-fun array_inv!9217 (array!26435) Bool)

(assert (=> start!39880 (array_inv!9217 _keys!709)))

(declare-fun mapNonEmpty!18570 () Bool)

(declare-fun tp!35970 () Bool)

(declare-fun e!255468 () Bool)

(assert (=> mapNonEmpty!18570 (= mapRes!18570 (and tp!35970 e!255468))))

(declare-fun mapRest!18570 () (Array (_ BitVec 32) ValueCell!5306))

(declare-fun mapKey!18570 () (_ BitVec 32))

(declare-fun mapValue!18570 () ValueCell!5306)

(assert (=> mapNonEmpty!18570 (= (arr!12666 _values!549) (store mapRest!18570 mapKey!18570 mapValue!18570))))

(declare-fun b!431767 () Bool)

(declare-fun res!253878 () Bool)

(assert (=> b!431767 (=> (not res!253878) (not e!255463))))

(assert (=> b!431767 (= res!253878 (validKeyInArray!0 k!794))))

(declare-fun b!431768 () Bool)

(declare-fun res!253889 () Bool)

(assert (=> b!431768 (=> (not res!253889) (not e!255463))))

(assert (=> b!431768 (= res!253889 (or (= (select (arr!12667 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12667 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431769 () Bool)

(declare-fun e!255467 () Bool)

(assert (=> b!431769 (= e!255462 (and e!255467 mapRes!18570))))

(declare-fun condMapEmpty!18570 () Bool)

(declare-fun mapDefault!18570 () ValueCell!5306)

