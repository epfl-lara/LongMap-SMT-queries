; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39838 () Bool)

(assert start!39838)

(declare-fun b_free!10105 () Bool)

(declare-fun b_next!10105 () Bool)

(assert (=> start!39838 (= b_free!10105 (not b_next!10105))))

(declare-fun tp!35844 () Bool)

(declare-fun b_and!17869 () Bool)

(assert (=> start!39838 (= tp!35844 b_and!17869)))

(declare-fun b!430456 () Bool)

(declare-fun res!252934 () Bool)

(declare-fun e!254841 () Bool)

(assert (=> b!430456 (=> (not res!252934) (not e!254841))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!430456 (= res!252934 (validMask!0 mask!1025))))

(declare-fun b!430457 () Bool)

(declare-fun res!252939 () Bool)

(assert (=> b!430457 (=> (not res!252939) (not e!254841))))

(declare-datatypes ((array!26349 0))(
  ( (array!26350 (arr!12624 (Array (_ BitVec 32) (_ BitVec 64))) (size!12976 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26349)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16115 0))(
  ( (V!16116 (val!5673 Int)) )
))
(declare-datatypes ((ValueCell!5285 0))(
  ( (ValueCellFull!5285 (v!7920 V!16115)) (EmptyCell!5285) )
))
(declare-datatypes ((array!26351 0))(
  ( (array!26352 (arr!12625 (Array (_ BitVec 32) ValueCell!5285)) (size!12977 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26351)

(assert (=> b!430457 (= res!252939 (and (= (size!12977 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12976 _keys!709) (size!12977 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!430458 () Bool)

(declare-fun res!252945 () Bool)

(assert (=> b!430458 (=> (not res!252945) (not e!254841))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!430458 (= res!252945 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12976 _keys!709))))))

(declare-fun b!430459 () Bool)

(declare-fun res!252933 () Bool)

(assert (=> b!430459 (=> (not res!252933) (not e!254841))))

(assert (=> b!430459 (= res!252933 (or (= (select (arr!12624 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12624 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430460 () Bool)

(declare-fun e!254839 () Bool)

(declare-fun tp_is_empty!11257 () Bool)

(assert (=> b!430460 (= e!254839 tp_is_empty!11257)))

(declare-fun res!252940 () Bool)

(assert (=> start!39838 (=> (not res!252940) (not e!254841))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39838 (= res!252940 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12976 _keys!709))))))

(assert (=> start!39838 e!254841))

(assert (=> start!39838 tp_is_empty!11257))

(assert (=> start!39838 tp!35844))

(assert (=> start!39838 true))

(declare-fun e!254837 () Bool)

(declare-fun array_inv!9192 (array!26351) Bool)

(assert (=> start!39838 (and (array_inv!9192 _values!549) e!254837)))

(declare-fun array_inv!9193 (array!26349) Bool)

(assert (=> start!39838 (array_inv!9193 _keys!709)))

(declare-fun b!430461 () Bool)

(declare-fun res!252944 () Bool)

(declare-fun e!254840 () Bool)

(assert (=> b!430461 (=> (not res!252944) (not e!254840))))

(assert (=> b!430461 (= res!252944 (bvsle from!863 i!563))))

(declare-fun b!430462 () Bool)

(declare-fun e!254833 () Bool)

(declare-fun e!254832 () Bool)

(assert (=> b!430462 (= e!254833 (not e!254832))))

(declare-fun res!252937 () Bool)

(assert (=> b!430462 (=> res!252937 e!254832)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!430462 (= res!252937 (not (validKeyInArray!0 (select (arr!12624 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7472 0))(
  ( (tuple2!7473 (_1!3747 (_ BitVec 64)) (_2!3747 V!16115)) )
))
(declare-datatypes ((List!7491 0))(
  ( (Nil!7488) (Cons!7487 (h!8343 tuple2!7472) (t!13045 List!7491)) )
))
(declare-datatypes ((ListLongMap!6385 0))(
  ( (ListLongMap!6386 (toList!3208 List!7491)) )
))
(declare-fun lt!196876 () ListLongMap!6385)

(declare-fun lt!196867 () ListLongMap!6385)

(assert (=> b!430462 (= lt!196876 lt!196867)))

(declare-fun lt!196875 () ListLongMap!6385)

(declare-fun lt!196868 () tuple2!7472)

(declare-fun +!1357 (ListLongMap!6385 tuple2!7472) ListLongMap!6385)

(assert (=> b!430462 (= lt!196867 (+!1357 lt!196875 lt!196868))))

(declare-fun minValue!515 () V!16115)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16115)

(declare-fun lt!196870 () array!26349)

(declare-fun lt!196872 () array!26351)

(declare-fun getCurrentListMapNoExtraKeys!1410 (array!26349 array!26351 (_ BitVec 32) (_ BitVec 32) V!16115 V!16115 (_ BitVec 32) Int) ListLongMap!6385)

(assert (=> b!430462 (= lt!196876 (getCurrentListMapNoExtraKeys!1410 lt!196870 lt!196872 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!16115)

(assert (=> b!430462 (= lt!196868 (tuple2!7473 k!794 v!412))))

(assert (=> b!430462 (= lt!196875 (getCurrentListMapNoExtraKeys!1410 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12670 0))(
  ( (Unit!12671) )
))
(declare-fun lt!196879 () Unit!12670)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!546 (array!26349 array!26351 (_ BitVec 32) (_ BitVec 32) V!16115 V!16115 (_ BitVec 32) (_ BitVec 64) V!16115 (_ BitVec 32) Int) Unit!12670)

(assert (=> b!430462 (= lt!196879 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!546 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!430463 () Bool)

(declare-fun e!254838 () Bool)

(assert (=> b!430463 (= e!254838 true)))

(declare-fun lt!196880 () tuple2!7472)

(declare-fun lt!196869 () ListLongMap!6385)

(assert (=> b!430463 (= lt!196869 (+!1357 (+!1357 lt!196875 lt!196880) lt!196868))))

(declare-fun lt!196874 () Unit!12670)

(declare-fun lt!196873 () V!16115)

(declare-fun addCommutativeForDiffKeys!353 (ListLongMap!6385 (_ BitVec 64) V!16115 (_ BitVec 64) V!16115) Unit!12670)

(assert (=> b!430463 (= lt!196874 (addCommutativeForDiffKeys!353 lt!196875 k!794 v!412 (select (arr!12624 _keys!709) from!863) lt!196873))))

(declare-fun b!430464 () Bool)

(assert (=> b!430464 (= e!254840 e!254833)))

(declare-fun res!252941 () Bool)

(assert (=> b!430464 (=> (not res!252941) (not e!254833))))

(assert (=> b!430464 (= res!252941 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!196878 () ListLongMap!6385)

(assert (=> b!430464 (= lt!196878 (getCurrentListMapNoExtraKeys!1410 lt!196870 lt!196872 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!430464 (= lt!196872 (array!26352 (store (arr!12625 _values!549) i!563 (ValueCellFull!5285 v!412)) (size!12977 _values!549)))))

(declare-fun lt!196871 () ListLongMap!6385)

(assert (=> b!430464 (= lt!196871 (getCurrentListMapNoExtraKeys!1410 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!430465 () Bool)

(declare-fun res!252943 () Bool)

(assert (=> b!430465 (=> (not res!252943) (not e!254841))))

(declare-datatypes ((List!7492 0))(
  ( (Nil!7489) (Cons!7488 (h!8344 (_ BitVec 64)) (t!13046 List!7492)) )
))
(declare-fun arrayNoDuplicates!0 (array!26349 (_ BitVec 32) List!7492) Bool)

(assert (=> b!430465 (= res!252943 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7489))))

(declare-fun b!430466 () Bool)

(declare-fun res!252942 () Bool)

(assert (=> b!430466 (=> (not res!252942) (not e!254841))))

(assert (=> b!430466 (= res!252942 (validKeyInArray!0 k!794))))

(declare-fun mapIsEmpty!18507 () Bool)

(declare-fun mapRes!18507 () Bool)

(assert (=> mapIsEmpty!18507 mapRes!18507))

(declare-fun b!430467 () Bool)

(declare-fun res!252938 () Bool)

(assert (=> b!430467 (=> (not res!252938) (not e!254840))))

(assert (=> b!430467 (= res!252938 (arrayNoDuplicates!0 lt!196870 #b00000000000000000000000000000000 Nil!7489))))

(declare-fun b!430468 () Bool)

(declare-fun e!254836 () Bool)

(assert (=> b!430468 (= e!254836 tp_is_empty!11257)))

(declare-fun b!430469 () Bool)

(declare-fun e!254835 () Unit!12670)

(declare-fun Unit!12672 () Unit!12670)

(assert (=> b!430469 (= e!254835 Unit!12672)))

(declare-fun lt!196877 () Unit!12670)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26349 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12670)

(assert (=> b!430469 (= lt!196877 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!430469 false))

(declare-fun mapNonEmpty!18507 () Bool)

(declare-fun tp!35843 () Bool)

(assert (=> mapNonEmpty!18507 (= mapRes!18507 (and tp!35843 e!254836))))

(declare-fun mapValue!18507 () ValueCell!5285)

(declare-fun mapKey!18507 () (_ BitVec 32))

(declare-fun mapRest!18507 () (Array (_ BitVec 32) ValueCell!5285))

(assert (=> mapNonEmpty!18507 (= (arr!12625 _values!549) (store mapRest!18507 mapKey!18507 mapValue!18507))))

(declare-fun b!430470 () Bool)

(declare-fun Unit!12673 () Unit!12670)

(assert (=> b!430470 (= e!254835 Unit!12673)))

(declare-fun b!430471 () Bool)

(assert (=> b!430471 (= e!254841 e!254840)))

(declare-fun res!252935 () Bool)

(assert (=> b!430471 (=> (not res!252935) (not e!254840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26349 (_ BitVec 32)) Bool)

(assert (=> b!430471 (= res!252935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196870 mask!1025))))

(assert (=> b!430471 (= lt!196870 (array!26350 (store (arr!12624 _keys!709) i!563 k!794) (size!12976 _keys!709)))))

(declare-fun b!430472 () Bool)

(assert (=> b!430472 (= e!254837 (and e!254839 mapRes!18507))))

(declare-fun condMapEmpty!18507 () Bool)

(declare-fun mapDefault!18507 () ValueCell!5285)

