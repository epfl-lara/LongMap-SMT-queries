; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40792 () Bool)

(assert start!40792)

(declare-fun b_free!10781 () Bool)

(declare-fun b_next!10781 () Bool)

(assert (=> start!40792 (= b_free!10781 (not b_next!10781))))

(declare-fun tp!38165 () Bool)

(declare-fun b_and!18849 () Bool)

(assert (=> start!40792 (= tp!38165 b_and!18849)))

(declare-datatypes ((V!17263 0))(
  ( (V!17264 (val!6104 Int)) )
))
(declare-fun minValue!515 () V!17263)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun c!56120 () Bool)

(declare-datatypes ((tuple2!8034 0))(
  ( (tuple2!8035 (_1!4028 (_ BitVec 64)) (_2!4028 V!17263)) )
))
(declare-datatypes ((List!8092 0))(
  ( (Nil!8089) (Cons!8088 (h!8944 tuple2!8034) (t!13896 List!8092)) )
))
(declare-datatypes ((ListLongMap!6947 0))(
  ( (ListLongMap!6948 (toList!3489 List!8092)) )
))
(declare-fun call!29957 () ListLongMap!6947)

(declare-datatypes ((ValueCell!5716 0))(
  ( (ValueCellFull!5716 (v!8363 V!17263)) (EmptyCell!5716) )
))
(declare-datatypes ((array!28045 0))(
  ( (array!28046 (arr!13467 (Array (_ BitVec 32) ValueCell!5716)) (size!13819 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28045)

(declare-fun zeroValue!515 () V!17263)

(declare-fun lt!205223 () array!28045)

(declare-datatypes ((array!28047 0))(
  ( (array!28048 (arr!13468 (Array (_ BitVec 32) (_ BitVec 64))) (size!13820 (_ BitVec 32))) )
))
(declare-fun lt!205222 () array!28047)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!28047)

(declare-fun bm!29953 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1673 (array!28047 array!28045 (_ BitVec 32) (_ BitVec 32) V!17263 V!17263 (_ BitVec 32) Int) ListLongMap!6947)

(assert (=> bm!29953 (= call!29957 (getCurrentListMapNoExtraKeys!1673 (ite c!56120 lt!205222 _keys!709) (ite c!56120 lt!205223 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!269474 () Bool)

(declare-fun e!264905 () Bool)

(assert (=> start!40792 (=> (not res!269474) (not e!264905))))

(assert (=> start!40792 (= res!269474 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13820 _keys!709))))))

(assert (=> start!40792 e!264905))

(declare-fun tp_is_empty!12119 () Bool)

(assert (=> start!40792 tp_is_empty!12119))

(assert (=> start!40792 tp!38165))

(assert (=> start!40792 true))

(declare-fun e!264898 () Bool)

(declare-fun array_inv!9752 (array!28045) Bool)

(assert (=> start!40792 (and (array_inv!9752 _values!549) e!264898)))

(declare-fun array_inv!9753 (array!28047) Bool)

(assert (=> start!40792 (array_inv!9753 _keys!709)))

(declare-fun b!452412 () Bool)

(declare-fun e!264903 () Bool)

(assert (=> b!452412 (= e!264905 e!264903)))

(declare-fun res!269475 () Bool)

(assert (=> b!452412 (=> (not res!269475) (not e!264903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28047 (_ BitVec 32)) Bool)

(assert (=> b!452412 (= res!269475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205222 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!452412 (= lt!205222 (array!28048 (store (arr!13468 _keys!709) i!563 k!794) (size!13820 _keys!709)))))

(declare-fun b!452413 () Bool)

(declare-fun res!269467 () Bool)

(assert (=> b!452413 (=> (not res!269467) (not e!264905))))

(assert (=> b!452413 (= res!269467 (and (= (size!13819 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13820 _keys!709) (size!13819 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!452414 () Bool)

(declare-fun res!269472 () Bool)

(assert (=> b!452414 (=> (not res!269472) (not e!264905))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!452414 (= res!269472 (validMask!0 mask!1025))))

(declare-fun b!452415 () Bool)

(declare-fun res!269477 () Bool)

(assert (=> b!452415 (=> (not res!269477) (not e!264905))))

(assert (=> b!452415 (= res!269477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!19815 () Bool)

(declare-fun mapRes!19815 () Bool)

(declare-fun tp!38166 () Bool)

(declare-fun e!264899 () Bool)

(assert (=> mapNonEmpty!19815 (= mapRes!19815 (and tp!38166 e!264899))))

(declare-fun mapRest!19815 () (Array (_ BitVec 32) ValueCell!5716))

(declare-fun mapKey!19815 () (_ BitVec 32))

(declare-fun mapValue!19815 () ValueCell!5716)

(assert (=> mapNonEmpty!19815 (= (arr!13467 _values!549) (store mapRest!19815 mapKey!19815 mapValue!19815))))

(declare-fun b!452416 () Bool)

(declare-fun res!269473 () Bool)

(assert (=> b!452416 (=> (not res!269473) (not e!264903))))

(assert (=> b!452416 (= res!269473 (bvsle from!863 i!563))))

(declare-fun call!29956 () ListLongMap!6947)

(declare-fun bm!29954 () Bool)

(assert (=> bm!29954 (= call!29956 (getCurrentListMapNoExtraKeys!1673 (ite c!56120 _keys!709 lt!205222) (ite c!56120 _values!549 lt!205223) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452417 () Bool)

(declare-fun res!269469 () Bool)

(assert (=> b!452417 (=> (not res!269469) (not e!264905))))

(assert (=> b!452417 (= res!269469 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13820 _keys!709))))))

(declare-fun b!452418 () Bool)

(declare-fun res!269464 () Bool)

(assert (=> b!452418 (=> (not res!269464) (not e!264903))))

(declare-datatypes ((List!8093 0))(
  ( (Nil!8090) (Cons!8089 (h!8945 (_ BitVec 64)) (t!13897 List!8093)) )
))
(declare-fun arrayNoDuplicates!0 (array!28047 (_ BitVec 32) List!8093) Bool)

(assert (=> b!452418 (= res!269464 (arrayNoDuplicates!0 lt!205222 #b00000000000000000000000000000000 Nil!8090))))

(declare-fun b!452419 () Bool)

(declare-fun e!264900 () Bool)

(assert (=> b!452419 (= e!264900 tp_is_empty!12119)))

(declare-fun b!452420 () Bool)

(declare-fun e!264897 () Bool)

(declare-fun e!264902 () Bool)

(assert (=> b!452420 (= e!264897 (not e!264902))))

(declare-fun res!269476 () Bool)

(assert (=> b!452420 (=> res!269476 e!264902)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!452420 (= res!269476 (validKeyInArray!0 (select (arr!13468 _keys!709) from!863)))))

(declare-fun e!264904 () Bool)

(assert (=> b!452420 e!264904))

(assert (=> b!452420 (= c!56120 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun v!412 () V!17263)

(declare-datatypes ((Unit!13228 0))(
  ( (Unit!13229) )
))
(declare-fun lt!205224 () Unit!13228)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!728 (array!28047 array!28045 (_ BitVec 32) (_ BitVec 32) V!17263 V!17263 (_ BitVec 32) (_ BitVec 64) V!17263 (_ BitVec 32) Int) Unit!13228)

(assert (=> b!452420 (= lt!205224 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!728 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!19815 () Bool)

(assert (=> mapIsEmpty!19815 mapRes!19815))

(declare-fun b!452421 () Bool)

(declare-fun +!1566 (ListLongMap!6947 tuple2!8034) ListLongMap!6947)

(assert (=> b!452421 (= e!264904 (= call!29957 (+!1566 call!29956 (tuple2!8035 k!794 v!412))))))

(declare-fun b!452422 () Bool)

(assert (=> b!452422 (= e!264898 (and e!264900 mapRes!19815))))

(declare-fun condMapEmpty!19815 () Bool)

(declare-fun mapDefault!19815 () ValueCell!5716)

