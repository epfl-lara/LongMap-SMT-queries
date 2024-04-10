; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39412 () Bool)

(assert start!39412)

(declare-fun b_free!9679 () Bool)

(declare-fun b_next!9679 () Bool)

(assert (=> start!39412 (= b_free!9679 (not b_next!9679))))

(declare-fun tp!34565 () Bool)

(declare-fun b_and!17233 () Bool)

(assert (=> start!39412 (= tp!34565 b_and!17233)))

(declare-fun b!419318 () Bool)

(declare-fun e!249921 () Bool)

(declare-fun e!249916 () Bool)

(assert (=> b!419318 (= e!249921 (not e!249916))))

(declare-fun res!244442 () Bool)

(assert (=> b!419318 (=> res!244442 e!249916)))

(declare-datatypes ((array!25511 0))(
  ( (array!25512 (arr!12205 (Array (_ BitVec 32) (_ BitVec 64))) (size!12557 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25511)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!419318 (= res!244442 (validKeyInArray!0 (select (arr!12205 _keys!709) from!863)))))

(declare-fun e!249917 () Bool)

(assert (=> b!419318 e!249917))

(declare-fun c!55232 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!419318 (= c!55232 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!15547 0))(
  ( (V!15548 (val!5460 Int)) )
))
(declare-fun minValue!515 () V!15547)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5072 0))(
  ( (ValueCellFull!5072 (v!7707 V!15547)) (EmptyCell!5072) )
))
(declare-datatypes ((array!25513 0))(
  ( (array!25514 (arr!12206 (Array (_ BitVec 32) ValueCell!5072)) (size!12558 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25513)

(declare-fun zeroValue!515 () V!15547)

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12392 0))(
  ( (Unit!12393) )
))
(declare-fun lt!192287 () Unit!12392)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun v!412 () V!15547)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!446 (array!25511 array!25513 (_ BitVec 32) (_ BitVec 32) V!15547 V!15547 (_ BitVec 32) (_ BitVec 64) V!15547 (_ BitVec 32) Int) Unit!12392)

(assert (=> b!419318 (= lt!192287 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!446 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!192283 () array!25513)

(declare-datatypes ((tuple2!7146 0))(
  ( (tuple2!7147 (_1!3584 (_ BitVec 64)) (_2!3584 V!15547)) )
))
(declare-datatypes ((List!7155 0))(
  ( (Nil!7152) (Cons!7151 (h!8007 tuple2!7146) (t!12499 List!7155)) )
))
(declare-datatypes ((ListLongMap!6059 0))(
  ( (ListLongMap!6060 (toList!3045 List!7155)) )
))
(declare-fun call!29215 () ListLongMap!6059)

(declare-fun lt!192281 () array!25511)

(declare-fun bm!29212 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1250 (array!25511 array!25513 (_ BitVec 32) (_ BitVec 32) V!15547 V!15547 (_ BitVec 32) Int) ListLongMap!6059)

(assert (=> bm!29212 (= call!29215 (getCurrentListMapNoExtraKeys!1250 (ite c!55232 _keys!709 lt!192281) (ite c!55232 _values!549 lt!192283) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!244449 () Bool)

(declare-fun e!249923 () Bool)

(assert (=> start!39412 (=> (not res!244449) (not e!249923))))

(assert (=> start!39412 (= res!244449 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12557 _keys!709))))))

(assert (=> start!39412 e!249923))

(declare-fun tp_is_empty!10831 () Bool)

(assert (=> start!39412 tp_is_empty!10831))

(assert (=> start!39412 tp!34565))

(assert (=> start!39412 true))

(declare-fun e!249918 () Bool)

(declare-fun array_inv!8900 (array!25513) Bool)

(assert (=> start!39412 (and (array_inv!8900 _values!549) e!249918)))

(declare-fun array_inv!8901 (array!25511) Bool)

(assert (=> start!39412 (array_inv!8901 _keys!709)))

(declare-fun b!419319 () Bool)

(declare-fun res!244448 () Bool)

(declare-fun e!249922 () Bool)

(assert (=> b!419319 (=> (not res!244448) (not e!249922))))

(declare-datatypes ((List!7156 0))(
  ( (Nil!7153) (Cons!7152 (h!8008 (_ BitVec 64)) (t!12500 List!7156)) )
))
(declare-fun arrayNoDuplicates!0 (array!25511 (_ BitVec 32) List!7156) Bool)

(assert (=> b!419319 (= res!244448 (arrayNoDuplicates!0 lt!192281 #b00000000000000000000000000000000 Nil!7153))))

(declare-fun b!419320 () Bool)

(assert (=> b!419320 (= e!249922 e!249921)))

(declare-fun res!244447 () Bool)

(assert (=> b!419320 (=> (not res!244447) (not e!249921))))

(assert (=> b!419320 (= res!244447 (= from!863 i!563))))

(declare-fun lt!192277 () ListLongMap!6059)

(assert (=> b!419320 (= lt!192277 (getCurrentListMapNoExtraKeys!1250 lt!192281 lt!192283 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!419320 (= lt!192283 (array!25514 (store (arr!12206 _values!549) i!563 (ValueCellFull!5072 v!412)) (size!12558 _values!549)))))

(declare-fun lt!192278 () ListLongMap!6059)

(assert (=> b!419320 (= lt!192278 (getCurrentListMapNoExtraKeys!1250 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!419321 () Bool)

(declare-fun e!249919 () Bool)

(declare-fun mapRes!17868 () Bool)

(assert (=> b!419321 (= e!249918 (and e!249919 mapRes!17868))))

(declare-fun condMapEmpty!17868 () Bool)

(declare-fun mapDefault!17868 () ValueCell!5072)

