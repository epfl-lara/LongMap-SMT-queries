; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39422 () Bool)

(assert start!39422)

(declare-fun b_free!9689 () Bool)

(declare-fun b_next!9689 () Bool)

(assert (=> start!39422 (= b_free!9689 (not b_next!9689))))

(declare-fun tp!34596 () Bool)

(declare-fun b_and!17253 () Bool)

(assert (=> start!39422 (= tp!34596 b_and!17253)))

(declare-fun mapNonEmpty!17883 () Bool)

(declare-fun mapRes!17883 () Bool)

(declare-fun tp!34595 () Bool)

(declare-fun e!250056 () Bool)

(assert (=> mapNonEmpty!17883 (= mapRes!17883 (and tp!34595 e!250056))))

(declare-datatypes ((V!15559 0))(
  ( (V!15560 (val!5465 Int)) )
))
(declare-datatypes ((ValueCell!5077 0))(
  ( (ValueCellFull!5077 (v!7712 V!15559)) (EmptyCell!5077) )
))
(declare-datatypes ((array!25531 0))(
  ( (array!25532 (arr!12215 (Array (_ BitVec 32) ValueCell!5077)) (size!12567 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25531)

(declare-fun mapRest!17883 () (Array (_ BitVec 32) ValueCell!5077))

(declare-fun mapKey!17883 () (_ BitVec 32))

(declare-fun mapValue!17883 () ValueCell!5077)

(assert (=> mapNonEmpty!17883 (= (arr!12215 _values!549) (store mapRest!17883 mapKey!17883 mapValue!17883))))

(declare-fun mapIsEmpty!17883 () Bool)

(assert (=> mapIsEmpty!17883 mapRes!17883))

(declare-fun b!419614 () Bool)

(declare-fun e!250057 () Bool)

(declare-fun tp_is_empty!10841 () Bool)

(assert (=> b!419614 (= e!250057 tp_is_empty!10841)))

(declare-fun b!419615 () Bool)

(declare-fun res!244665 () Bool)

(declare-fun e!250055 () Bool)

(assert (=> b!419615 (=> (not res!244665) (not e!250055))))

(declare-datatypes ((array!25533 0))(
  ( (array!25534 (arr!12216 (Array (_ BitVec 32) (_ BitVec 64))) (size!12568 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25533)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!419615 (= res!244665 (and (= (size!12567 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12568 _keys!709) (size!12567 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!419616 () Bool)

(declare-fun e!250052 () Bool)

(declare-fun e!250058 () Bool)

(assert (=> b!419616 (= e!250052 (not e!250058))))

(declare-fun res!244663 () Bool)

(assert (=> b!419616 (=> res!244663 e!250058)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!419616 (= res!244663 (validKeyInArray!0 (select (arr!12216 _keys!709) from!863)))))

(declare-fun e!250059 () Bool)

(assert (=> b!419616 e!250059))

(declare-fun c!55247 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!419616 (= c!55247 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15559)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((Unit!12400 0))(
  ( (Unit!12401) )
))
(declare-fun lt!192447 () Unit!12400)

(declare-fun zeroValue!515 () V!15559)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!15559)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!450 (array!25533 array!25531 (_ BitVec 32) (_ BitVec 32) V!15559 V!15559 (_ BitVec 32) (_ BitVec 64) V!15559 (_ BitVec 32) Int) Unit!12400)

(assert (=> b!419616 (= lt!192447 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!450 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419617 () Bool)

(declare-fun res!244655 () Bool)

(assert (=> b!419617 (=> (not res!244655) (not e!250055))))

(declare-fun arrayContainsKey!0 (array!25533 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!419617 (= res!244655 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!419618 () Bool)

(declare-fun e!250051 () Bool)

(assert (=> b!419618 (= e!250055 e!250051)))

(declare-fun res!244664 () Bool)

(assert (=> b!419618 (=> (not res!244664) (not e!250051))))

(declare-fun lt!192443 () array!25533)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25533 (_ BitVec 32)) Bool)

(assert (=> b!419618 (= res!244664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192443 mask!1025))))

(assert (=> b!419618 (= lt!192443 (array!25534 (store (arr!12216 _keys!709) i!563 k!794) (size!12568 _keys!709)))))

(declare-fun b!419619 () Bool)

(declare-fun res!244659 () Bool)

(assert (=> b!419619 (=> (not res!244659) (not e!250051))))

(assert (=> b!419619 (= res!244659 (bvsle from!863 i!563))))

(declare-fun lt!192450 () array!25531)

(declare-datatypes ((tuple2!7154 0))(
  ( (tuple2!7155 (_1!3588 (_ BitVec 64)) (_2!3588 V!15559)) )
))
(declare-datatypes ((List!7163 0))(
  ( (Nil!7160) (Cons!7159 (h!8015 tuple2!7154) (t!12517 List!7163)) )
))
(declare-datatypes ((ListLongMap!6067 0))(
  ( (ListLongMap!6068 (toList!3049 List!7163)) )
))
(declare-fun call!29245 () ListLongMap!6067)

(declare-fun bm!29242 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1254 (array!25533 array!25531 (_ BitVec 32) (_ BitVec 32) V!15559 V!15559 (_ BitVec 32) Int) ListLongMap!6067)

(assert (=> bm!29242 (= call!29245 (getCurrentListMapNoExtraKeys!1254 (ite c!55247 _keys!709 lt!192443) (ite c!55247 _values!549 lt!192450) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29243 () Bool)

(declare-fun call!29246 () ListLongMap!6067)

(assert (=> bm!29243 (= call!29246 (getCurrentListMapNoExtraKeys!1254 (ite c!55247 lt!192443 _keys!709) (ite c!55247 lt!192450 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419620 () Bool)

(assert (=> b!419620 (= e!250058 true)))

(declare-fun lt!192446 () V!15559)

(declare-fun lt!192451 () ListLongMap!6067)

(declare-fun lt!192449 () tuple2!7154)

(declare-fun +!1246 (ListLongMap!6067 tuple2!7154) ListLongMap!6067)

(assert (=> b!419620 (= (+!1246 lt!192451 lt!192449) (+!1246 (+!1246 lt!192451 (tuple2!7155 k!794 lt!192446)) lt!192449))))

(declare-fun lt!192448 () V!15559)

(assert (=> b!419620 (= lt!192449 (tuple2!7155 k!794 lt!192448))))

(declare-fun lt!192445 () Unit!12400)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!45 (ListLongMap!6067 (_ BitVec 64) V!15559 V!15559) Unit!12400)

(assert (=> b!419620 (= lt!192445 (addSameAsAddTwiceSameKeyDiffValues!45 lt!192451 k!794 lt!192446 lt!192448))))

(declare-fun lt!192452 () V!15559)

(declare-fun get!6059 (ValueCell!5077 V!15559) V!15559)

(assert (=> b!419620 (= lt!192446 (get!6059 (select (arr!12215 _values!549) from!863) lt!192452))))

(declare-fun lt!192442 () ListLongMap!6067)

(assert (=> b!419620 (= lt!192442 (+!1246 lt!192451 (tuple2!7155 (select (arr!12216 lt!192443) from!863) lt!192448)))))

(assert (=> b!419620 (= lt!192448 (get!6059 (select (store (arr!12215 _values!549) i!563 (ValueCellFull!5077 v!412)) from!863) lt!192452))))

(declare-fun dynLambda!716 (Int (_ BitVec 64)) V!15559)

(assert (=> b!419620 (= lt!192452 (dynLambda!716 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!419620 (= lt!192451 (getCurrentListMapNoExtraKeys!1254 lt!192443 lt!192450 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419621 () Bool)

(assert (=> b!419621 (= e!250056 tp_is_empty!10841)))

(declare-fun b!419622 () Bool)

(declare-fun res!244661 () Bool)

(assert (=> b!419622 (=> (not res!244661) (not e!250055))))

(assert (=> b!419622 (= res!244661 (or (= (select (arr!12216 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12216 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!419623 () Bool)

(declare-fun res!244658 () Bool)

(assert (=> b!419623 (=> (not res!244658) (not e!250055))))

(assert (=> b!419623 (= res!244658 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12568 _keys!709))))))

(declare-fun b!419613 () Bool)

(declare-fun res!244662 () Bool)

(assert (=> b!419613 (=> (not res!244662) (not e!250055))))

(assert (=> b!419613 (= res!244662 (validKeyInArray!0 k!794))))

(declare-fun res!244656 () Bool)

(assert (=> start!39422 (=> (not res!244656) (not e!250055))))

(assert (=> start!39422 (= res!244656 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12568 _keys!709))))))

(assert (=> start!39422 e!250055))

(assert (=> start!39422 tp_is_empty!10841))

(assert (=> start!39422 tp!34596))

(assert (=> start!39422 true))

(declare-fun e!250054 () Bool)

(declare-fun array_inv!8908 (array!25531) Bool)

(assert (=> start!39422 (and (array_inv!8908 _values!549) e!250054)))

(declare-fun array_inv!8909 (array!25533) Bool)

(assert (=> start!39422 (array_inv!8909 _keys!709)))

(declare-fun b!419624 () Bool)

(assert (=> b!419624 (= e!250059 (= call!29246 (+!1246 call!29245 (tuple2!7155 k!794 v!412))))))

(declare-fun b!419625 () Bool)

(declare-fun res!244654 () Bool)

(assert (=> b!419625 (=> (not res!244654) (not e!250055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!419625 (= res!244654 (validMask!0 mask!1025))))

(declare-fun b!419626 () Bool)

(assert (=> b!419626 (= e!250051 e!250052)))

(declare-fun res!244652 () Bool)

(assert (=> b!419626 (=> (not res!244652) (not e!250052))))

(assert (=> b!419626 (= res!244652 (= from!863 i!563))))

(assert (=> b!419626 (= lt!192442 (getCurrentListMapNoExtraKeys!1254 lt!192443 lt!192450 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!419626 (= lt!192450 (array!25532 (store (arr!12215 _values!549) i!563 (ValueCellFull!5077 v!412)) (size!12567 _values!549)))))

(declare-fun lt!192444 () ListLongMap!6067)

(assert (=> b!419626 (= lt!192444 (getCurrentListMapNoExtraKeys!1254 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!419627 () Bool)

(declare-fun res!244660 () Bool)

(assert (=> b!419627 (=> (not res!244660) (not e!250055))))

(declare-datatypes ((List!7164 0))(
  ( (Nil!7161) (Cons!7160 (h!8016 (_ BitVec 64)) (t!12518 List!7164)) )
))
(declare-fun arrayNoDuplicates!0 (array!25533 (_ BitVec 32) List!7164) Bool)

(assert (=> b!419627 (= res!244660 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7161))))

(declare-fun b!419628 () Bool)

(assert (=> b!419628 (= e!250054 (and e!250057 mapRes!17883))))

(declare-fun condMapEmpty!17883 () Bool)

(declare-fun mapDefault!17883 () ValueCell!5077)

