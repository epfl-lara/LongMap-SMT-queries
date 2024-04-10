; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39604 () Bool)

(assert start!39604)

(declare-fun b_free!9871 () Bool)

(declare-fun b_next!9871 () Bool)

(assert (=> start!39604 (= b_free!9871 (not b_next!9871))))

(declare-fun tp!35141 () Bool)

(declare-fun b_and!17527 () Bool)

(assert (=> start!39604 (= tp!35141 b_and!17527)))

(declare-fun mapNonEmpty!18156 () Bool)

(declare-fun mapRes!18156 () Bool)

(declare-fun tp!35142 () Bool)

(declare-fun e!252102 () Bool)

(assert (=> mapNonEmpty!18156 (= mapRes!18156 (and tp!35142 e!252102))))

(declare-datatypes ((V!15803 0))(
  ( (V!15804 (val!5556 Int)) )
))
(declare-datatypes ((ValueCell!5168 0))(
  ( (ValueCellFull!5168 (v!7803 V!15803)) (EmptyCell!5168) )
))
(declare-fun mapRest!18156 () (Array (_ BitVec 32) ValueCell!5168))

(declare-datatypes ((array!25885 0))(
  ( (array!25886 (arr!12392 (Array (_ BitVec 32) ValueCell!5168)) (size!12744 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25885)

(declare-fun mapKey!18156 () (_ BitVec 32))

(declare-fun mapValue!18156 () ValueCell!5168)

(assert (=> mapNonEmpty!18156 (= (arr!12392 _values!549) (store mapRest!18156 mapKey!18156 mapValue!18156))))

(declare-fun b!424344 () Bool)

(declare-fun e!252100 () Bool)

(declare-fun e!252101 () Bool)

(assert (=> b!424344 (= e!252100 e!252101)))

(declare-fun res!248203 () Bool)

(assert (=> b!424344 (=> (not res!248203) (not e!252101))))

(declare-datatypes ((array!25887 0))(
  ( (array!25888 (arr!12393 (Array (_ BitVec 32) (_ BitVec 64))) (size!12745 (_ BitVec 32))) )
))
(declare-fun lt!194350 () array!25887)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25887 (_ BitVec 32)) Bool)

(assert (=> b!424344 (= res!248203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194350 mask!1025))))

(declare-fun _keys!709 () array!25887)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!424344 (= lt!194350 (array!25888 (store (arr!12393 _keys!709) i!563 k!794) (size!12745 _keys!709)))))

(declare-fun b!424345 () Bool)

(declare-fun e!252098 () Bool)

(declare-fun tp_is_empty!11023 () Bool)

(assert (=> b!424345 (= e!252098 tp_is_empty!11023)))

(declare-fun b!424346 () Bool)

(declare-fun res!248211 () Bool)

(assert (=> b!424346 (=> (not res!248211) (not e!252101))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!424346 (= res!248211 (bvsle from!863 i!563))))

(declare-fun b!424347 () Bool)

(declare-fun res!248210 () Bool)

(assert (=> b!424347 (=> (not res!248210) (not e!252100))))

(declare-fun arrayContainsKey!0 (array!25887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424347 (= res!248210 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!424349 () Bool)

(declare-fun res!248205 () Bool)

(assert (=> b!424349 (=> (not res!248205) (not e!252100))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424349 (= res!248205 (validKeyInArray!0 k!794))))

(declare-fun b!424350 () Bool)

(declare-fun res!248204 () Bool)

(assert (=> b!424350 (=> (not res!248204) (not e!252100))))

(assert (=> b!424350 (= res!248204 (or (= (select (arr!12393 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12393 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!424351 () Bool)

(declare-fun res!248208 () Bool)

(assert (=> b!424351 (=> (not res!248208) (not e!252100))))

(assert (=> b!424351 (= res!248208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!424352 () Bool)

(declare-fun res!248200 () Bool)

(assert (=> b!424352 (=> (not res!248200) (not e!252100))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!424352 (= res!248200 (and (= (size!12744 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12745 _keys!709) (size!12744 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!424353 () Bool)

(assert (=> b!424353 (= e!252101 false)))

(declare-fun minValue!515 () V!15803)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15803)

(declare-fun v!412 () V!15803)

(declare-datatypes ((tuple2!7294 0))(
  ( (tuple2!7295 (_1!3658 (_ BitVec 64)) (_2!3658 V!15803)) )
))
(declare-datatypes ((List!7304 0))(
  ( (Nil!7301) (Cons!7300 (h!8156 tuple2!7294) (t!12748 List!7304)) )
))
(declare-datatypes ((ListLongMap!6207 0))(
  ( (ListLongMap!6208 (toList!3119 List!7304)) )
))
(declare-fun lt!194351 () ListLongMap!6207)

(declare-fun getCurrentListMapNoExtraKeys!1323 (array!25887 array!25885 (_ BitVec 32) (_ BitVec 32) V!15803 V!15803 (_ BitVec 32) Int) ListLongMap!6207)

(assert (=> b!424353 (= lt!194351 (getCurrentListMapNoExtraKeys!1323 lt!194350 (array!25886 (store (arr!12392 _values!549) i!563 (ValueCellFull!5168 v!412)) (size!12744 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194349 () ListLongMap!6207)

(assert (=> b!424353 (= lt!194349 (getCurrentListMapNoExtraKeys!1323 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!424354 () Bool)

(declare-fun e!252099 () Bool)

(assert (=> b!424354 (= e!252099 (and e!252098 mapRes!18156))))

(declare-fun condMapEmpty!18156 () Bool)

(declare-fun mapDefault!18156 () ValueCell!5168)

