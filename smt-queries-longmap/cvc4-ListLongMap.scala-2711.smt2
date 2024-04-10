; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40088 () Bool)

(assert start!40088)

(declare-fun b_free!10355 () Bool)

(declare-fun b_next!10355 () Bool)

(assert (=> start!40088 (= b_free!10355 (not b_next!10355))))

(declare-fun tp!36593 () Bool)

(declare-fun b_and!18323 () Bool)

(assert (=> start!40088 (= tp!36593 b_and!18323)))

(declare-fun b!437876 () Bool)

(declare-fun e!258372 () Bool)

(declare-fun tp_is_empty!11507 () Bool)

(assert (=> b!437876 (= e!258372 tp_is_empty!11507)))

(declare-fun b!437877 () Bool)

(declare-fun e!258371 () Bool)

(assert (=> b!437877 (= e!258371 (not true))))

(declare-datatypes ((V!16447 0))(
  ( (V!16448 (val!5798 Int)) )
))
(declare-fun minValue!515 () V!16447)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5410 0))(
  ( (ValueCellFull!5410 (v!8045 V!16447)) (EmptyCell!5410) )
))
(declare-datatypes ((array!26831 0))(
  ( (array!26832 (arr!12865 (Array (_ BitVec 32) ValueCell!5410)) (size!13217 (_ BitVec 32))) )
))
(declare-fun lt!201782 () array!26831)

(declare-fun zeroValue!515 () V!16447)

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((array!26833 0))(
  ( (array!26834 (arr!12866 (Array (_ BitVec 32) (_ BitVec 64))) (size!13218 (_ BitVec 32))) )
))
(declare-fun lt!201781 () array!26833)

(declare-fun v!412 () V!16447)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!26833)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun _values!549 () array!26831)

(declare-datatypes ((tuple2!7682 0))(
  ( (tuple2!7683 (_1!3852 (_ BitVec 64)) (_2!3852 V!16447)) )
))
(declare-datatypes ((List!7682 0))(
  ( (Nil!7679) (Cons!7678 (h!8534 tuple2!7682) (t!13438 List!7682)) )
))
(declare-datatypes ((ListLongMap!6595 0))(
  ( (ListLongMap!6596 (toList!3313 List!7682)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1502 (array!26833 array!26831 (_ BitVec 32) (_ BitVec 32) V!16447 V!16447 (_ BitVec 32) Int) ListLongMap!6595)

(declare-fun +!1457 (ListLongMap!6595 tuple2!7682) ListLongMap!6595)

(assert (=> b!437877 (= (getCurrentListMapNoExtraKeys!1502 lt!201781 lt!201782 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1457 (getCurrentListMapNoExtraKeys!1502 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7683 k!794 v!412)))))

(declare-datatypes ((Unit!13018 0))(
  ( (Unit!13019) )
))
(declare-fun lt!201784 () Unit!13018)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!626 (array!26833 array!26831 (_ BitVec 32) (_ BitVec 32) V!16447 V!16447 (_ BitVec 32) (_ BitVec 64) V!16447 (_ BitVec 32) Int) Unit!13018)

(assert (=> b!437877 (= lt!201784 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!626 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!258415 () Bool)

(declare-fun e!258374 () Bool)

(assert (=> start!40088 (=> (not res!258415) (not e!258374))))

(assert (=> start!40088 (= res!258415 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13218 _keys!709))))))

(assert (=> start!40088 e!258374))

(assert (=> start!40088 tp_is_empty!11507))

(assert (=> start!40088 tp!36593))

(assert (=> start!40088 true))

(declare-fun e!258369 () Bool)

(declare-fun array_inv!9344 (array!26831) Bool)

(assert (=> start!40088 (and (array_inv!9344 _values!549) e!258369)))

(declare-fun array_inv!9345 (array!26833) Bool)

(assert (=> start!40088 (array_inv!9345 _keys!709)))

(declare-fun b!437878 () Bool)

(declare-fun e!258370 () Bool)

(assert (=> b!437878 (= e!258374 e!258370)))

(declare-fun res!258421 () Bool)

(assert (=> b!437878 (=> (not res!258421) (not e!258370))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26833 (_ BitVec 32)) Bool)

(assert (=> b!437878 (= res!258421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201781 mask!1025))))

(assert (=> b!437878 (= lt!201781 (array!26834 (store (arr!12866 _keys!709) i!563 k!794) (size!13218 _keys!709)))))

(declare-fun b!437879 () Bool)

(declare-fun e!258375 () Bool)

(assert (=> b!437879 (= e!258375 tp_is_empty!11507)))

(declare-fun b!437880 () Bool)

(declare-fun res!258423 () Bool)

(assert (=> b!437880 (=> (not res!258423) (not e!258374))))

(assert (=> b!437880 (= res!258423 (and (= (size!13217 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13218 _keys!709) (size!13217 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!437881 () Bool)

(declare-fun res!258422 () Bool)

(assert (=> b!437881 (=> (not res!258422) (not e!258374))))

(declare-datatypes ((List!7683 0))(
  ( (Nil!7680) (Cons!7679 (h!8535 (_ BitVec 64)) (t!13439 List!7683)) )
))
(declare-fun arrayNoDuplicates!0 (array!26833 (_ BitVec 32) List!7683) Bool)

(assert (=> b!437881 (= res!258422 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7680))))

(declare-fun b!437882 () Bool)

(declare-fun res!258426 () Bool)

(assert (=> b!437882 (=> (not res!258426) (not e!258374))))

(assert (=> b!437882 (= res!258426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!18882 () Bool)

(declare-fun mapRes!18882 () Bool)

(assert (=> mapIsEmpty!18882 mapRes!18882))

(declare-fun b!437883 () Bool)

(assert (=> b!437883 (= e!258369 (and e!258372 mapRes!18882))))

(declare-fun condMapEmpty!18882 () Bool)

(declare-fun mapDefault!18882 () ValueCell!5410)

