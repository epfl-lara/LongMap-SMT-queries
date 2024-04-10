; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40084 () Bool)

(assert start!40084)

(declare-fun b_free!10351 () Bool)

(declare-fun b_next!10351 () Bool)

(assert (=> start!40084 (= b_free!10351 (not b_next!10351))))

(declare-fun tp!36581 () Bool)

(declare-fun b_and!18319 () Bool)

(assert (=> start!40084 (= tp!36581 b_and!18319)))

(declare-fun b!437780 () Bool)

(declare-fun res!258341 () Bool)

(declare-fun e!258329 () Bool)

(assert (=> b!437780 (=> (not res!258341) (not e!258329))))

(declare-datatypes ((array!26823 0))(
  ( (array!26824 (arr!12861 (Array (_ BitVec 32) (_ BitVec 64))) (size!13213 (_ BitVec 32))) )
))
(declare-fun lt!201751 () array!26823)

(declare-datatypes ((List!7678 0))(
  ( (Nil!7675) (Cons!7674 (h!8530 (_ BitVec 64)) (t!13434 List!7678)) )
))
(declare-fun arrayNoDuplicates!0 (array!26823 (_ BitVec 32) List!7678) Bool)

(assert (=> b!437780 (= res!258341 (arrayNoDuplicates!0 lt!201751 #b00000000000000000000000000000000 Nil!7675))))

(declare-fun b!437781 () Bool)

(declare-fun res!258342 () Bool)

(declare-fun e!258331 () Bool)

(assert (=> b!437781 (=> (not res!258342) (not e!258331))))

(declare-fun _keys!709 () array!26823)

(assert (=> b!437781 (= res!258342 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7675))))

(declare-fun b!437782 () Bool)

(declare-fun res!258339 () Bool)

(assert (=> b!437782 (=> (not res!258339) (not e!258331))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!437782 (= res!258339 (validKeyInArray!0 k!794))))

(declare-fun b!437783 () Bool)

(declare-fun e!258328 () Bool)

(declare-fun tp_is_empty!11503 () Bool)

(assert (=> b!437783 (= e!258328 tp_is_empty!11503)))

(declare-fun res!258340 () Bool)

(assert (=> start!40084 (=> (not res!258340) (not e!258331))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40084 (= res!258340 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13213 _keys!709))))))

(assert (=> start!40084 e!258331))

(assert (=> start!40084 tp_is_empty!11503))

(assert (=> start!40084 tp!36581))

(assert (=> start!40084 true))

(declare-datatypes ((V!16443 0))(
  ( (V!16444 (val!5796 Int)) )
))
(declare-datatypes ((ValueCell!5408 0))(
  ( (ValueCellFull!5408 (v!8043 V!16443)) (EmptyCell!5408) )
))
(declare-datatypes ((array!26825 0))(
  ( (array!26826 (arr!12862 (Array (_ BitVec 32) ValueCell!5408)) (size!13214 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26825)

(declare-fun e!258327 () Bool)

(declare-fun array_inv!9340 (array!26825) Bool)

(assert (=> start!40084 (and (array_inv!9340 _values!549) e!258327)))

(declare-fun array_inv!9341 (array!26823) Bool)

(assert (=> start!40084 (array_inv!9341 _keys!709)))

(declare-fun b!437784 () Bool)

(declare-fun e!258330 () Bool)

(assert (=> b!437784 (= e!258330 (not true))))

(declare-fun minValue!515 () V!16443)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16443)

(declare-fun lt!201755 () array!26825)

(declare-fun v!412 () V!16443)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7678 0))(
  ( (tuple2!7679 (_1!3850 (_ BitVec 64)) (_2!3850 V!16443)) )
))
(declare-datatypes ((List!7679 0))(
  ( (Nil!7676) (Cons!7675 (h!8531 tuple2!7678) (t!13435 List!7679)) )
))
(declare-datatypes ((ListLongMap!6591 0))(
  ( (ListLongMap!6592 (toList!3311 List!7679)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1500 (array!26823 array!26825 (_ BitVec 32) (_ BitVec 32) V!16443 V!16443 (_ BitVec 32) Int) ListLongMap!6591)

(declare-fun +!1455 (ListLongMap!6591 tuple2!7678) ListLongMap!6591)

(assert (=> b!437784 (= (getCurrentListMapNoExtraKeys!1500 lt!201751 lt!201755 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1455 (getCurrentListMapNoExtraKeys!1500 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7679 k!794 v!412)))))

(declare-datatypes ((Unit!13014 0))(
  ( (Unit!13015) )
))
(declare-fun lt!201753 () Unit!13014)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!624 (array!26823 array!26825 (_ BitVec 32) (_ BitVec 32) V!16443 V!16443 (_ BitVec 32) (_ BitVec 64) V!16443 (_ BitVec 32) Int) Unit!13014)

(assert (=> b!437784 (= lt!201753 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!624 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!437785 () Bool)

(declare-fun res!258347 () Bool)

(assert (=> b!437785 (=> (not res!258347) (not e!258329))))

(assert (=> b!437785 (= res!258347 (bvsle from!863 i!563))))

(declare-fun b!437786 () Bool)

(declare-fun res!258343 () Bool)

(assert (=> b!437786 (=> (not res!258343) (not e!258331))))

(assert (=> b!437786 (= res!258343 (or (= (select (arr!12861 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12861 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!437787 () Bool)

(declare-fun res!258336 () Bool)

(assert (=> b!437787 (=> (not res!258336) (not e!258331))))

(declare-fun arrayContainsKey!0 (array!26823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!437787 (= res!258336 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!437788 () Bool)

(declare-fun e!258333 () Bool)

(declare-fun mapRes!18876 () Bool)

(assert (=> b!437788 (= e!258327 (and e!258333 mapRes!18876))))

(declare-fun condMapEmpty!18876 () Bool)

(declare-fun mapDefault!18876 () ValueCell!5408)

