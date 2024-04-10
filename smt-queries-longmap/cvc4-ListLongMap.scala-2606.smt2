; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39458 () Bool)

(assert start!39458)

(declare-fun b_free!9725 () Bool)

(declare-fun b_next!9725 () Bool)

(assert (=> start!39458 (= b_free!9725 (not b_next!9725))))

(declare-fun tp!34703 () Bool)

(declare-fun b_and!17325 () Bool)

(assert (=> start!39458 (= tp!34703 b_and!17325)))

(declare-fun b!420675 () Bool)

(declare-fun e!250543 () Bool)

(declare-fun e!250544 () Bool)

(assert (=> b!420675 (= e!250543 e!250544)))

(declare-fun res!245410 () Bool)

(assert (=> b!420675 (=> (not res!245410) (not e!250544))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!420675 (= res!245410 (= from!863 i!563))))

(declare-datatypes ((array!25603 0))(
  ( (array!25604 (arr!12251 (Array (_ BitVec 32) (_ BitVec 64))) (size!12603 (_ BitVec 32))) )
))
(declare-fun lt!193042 () array!25603)

(declare-datatypes ((V!15607 0))(
  ( (V!15608 (val!5483 Int)) )
))
(declare-fun minValue!515 () V!15607)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15607)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5095 0))(
  ( (ValueCellFull!5095 (v!7730 V!15607)) (EmptyCell!5095) )
))
(declare-datatypes ((array!25605 0))(
  ( (array!25606 (arr!12252 (Array (_ BitVec 32) ValueCell!5095)) (size!12604 (_ BitVec 32))) )
))
(declare-fun lt!193044 () array!25605)

(declare-datatypes ((tuple2!7188 0))(
  ( (tuple2!7189 (_1!3605 (_ BitVec 64)) (_2!3605 V!15607)) )
))
(declare-datatypes ((List!7195 0))(
  ( (Nil!7192) (Cons!7191 (h!8047 tuple2!7188) (t!12585 List!7195)) )
))
(declare-datatypes ((ListLongMap!6101 0))(
  ( (ListLongMap!6102 (toList!3066 List!7195)) )
))
(declare-fun lt!193038 () ListLongMap!6101)

(declare-fun getCurrentListMapNoExtraKeys!1270 (array!25603 array!25605 (_ BitVec 32) (_ BitVec 32) V!15607 V!15607 (_ BitVec 32) Int) ListLongMap!6101)

(assert (=> b!420675 (= lt!193038 (getCurrentListMapNoExtraKeys!1270 lt!193042 lt!193044 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25605)

(declare-fun v!412 () V!15607)

(assert (=> b!420675 (= lt!193044 (array!25606 (store (arr!12252 _values!549) i!563 (ValueCellFull!5095 v!412)) (size!12604 _values!549)))))

(declare-fun lt!193043 () ListLongMap!6101)

(declare-fun _keys!709 () array!25603)

(assert (=> b!420675 (= lt!193043 (getCurrentListMapNoExtraKeys!1270 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!17937 () Bool)

(declare-fun mapRes!17937 () Bool)

(declare-fun tp!34704 () Bool)

(declare-fun e!250545 () Bool)

(assert (=> mapNonEmpty!17937 (= mapRes!17937 (and tp!34704 e!250545))))

(declare-fun mapKey!17937 () (_ BitVec 32))

(declare-fun mapValue!17937 () ValueCell!5095)

(declare-fun mapRest!17937 () (Array (_ BitVec 32) ValueCell!5095))

(assert (=> mapNonEmpty!17937 (= (arr!12252 _values!549) (store mapRest!17937 mapKey!17937 mapValue!17937))))

(declare-fun b!420676 () Bool)

(declare-fun e!250542 () Bool)

(assert (=> b!420676 (= e!250542 e!250543)))

(declare-fun res!245409 () Bool)

(assert (=> b!420676 (=> (not res!245409) (not e!250543))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25603 (_ BitVec 32)) Bool)

(assert (=> b!420676 (= res!245409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193042 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!420676 (= lt!193042 (array!25604 (store (arr!12251 _keys!709) i!563 k!794) (size!12603 _keys!709)))))

(declare-fun b!420677 () Bool)

(declare-fun e!250540 () Bool)

(assert (=> b!420677 (= e!250544 (not e!250540))))

(declare-fun res!245418 () Bool)

(assert (=> b!420677 (=> res!245418 e!250540)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!420677 (= res!245418 (validKeyInArray!0 (select (arr!12251 _keys!709) from!863)))))

(declare-fun e!250538 () Bool)

(assert (=> b!420677 e!250538))

(declare-fun c!55301 () Bool)

(assert (=> b!420677 (= c!55301 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12428 0))(
  ( (Unit!12429) )
))
(declare-fun lt!193041 () Unit!12428)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!461 (array!25603 array!25605 (_ BitVec 32) (_ BitVec 32) V!15607 V!15607 (_ BitVec 32) (_ BitVec 64) V!15607 (_ BitVec 32) Int) Unit!12428)

(assert (=> b!420677 (= lt!193041 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!461 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29350 () Bool)

(declare-fun call!29354 () ListLongMap!6101)

(assert (=> bm!29350 (= call!29354 (getCurrentListMapNoExtraKeys!1270 (ite c!55301 lt!193042 _keys!709) (ite c!55301 lt!193044 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420678 () Bool)

(declare-fun res!245417 () Bool)

(assert (=> b!420678 (=> (not res!245417) (not e!250542))))

(assert (=> b!420678 (= res!245417 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12603 _keys!709))))))

(declare-fun b!420679 () Bool)

(declare-fun tp_is_empty!10877 () Bool)

(assert (=> b!420679 (= e!250545 tp_is_empty!10877)))

(declare-fun mapIsEmpty!17937 () Bool)

(assert (=> mapIsEmpty!17937 mapRes!17937))

(declare-fun call!29353 () ListLongMap!6101)

(declare-fun b!420680 () Bool)

(declare-fun +!1263 (ListLongMap!6101 tuple2!7188) ListLongMap!6101)

(assert (=> b!420680 (= e!250538 (= call!29354 (+!1263 call!29353 (tuple2!7189 k!794 v!412))))))

(declare-fun b!420681 () Bool)

(declare-fun res!245412 () Bool)

(assert (=> b!420681 (=> (not res!245412) (not e!250543))))

(declare-datatypes ((List!7196 0))(
  ( (Nil!7193) (Cons!7192 (h!8048 (_ BitVec 64)) (t!12586 List!7196)) )
))
(declare-fun arrayNoDuplicates!0 (array!25603 (_ BitVec 32) List!7196) Bool)

(assert (=> b!420681 (= res!245412 (arrayNoDuplicates!0 lt!193042 #b00000000000000000000000000000000 Nil!7193))))

(declare-fun b!420682 () Bool)

(assert (=> b!420682 (= e!250538 (= call!29353 call!29354))))

(declare-fun b!420683 () Bool)

(declare-fun res!245421 () Bool)

(assert (=> b!420683 (=> (not res!245421) (not e!250542))))

(assert (=> b!420683 (= res!245421 (or (= (select (arr!12251 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12251 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!420684 () Bool)

(declare-fun e!250541 () Bool)

(declare-fun e!250539 () Bool)

(assert (=> b!420684 (= e!250541 (and e!250539 mapRes!17937))))

(declare-fun condMapEmpty!17937 () Bool)

(declare-fun mapDefault!17937 () ValueCell!5095)

