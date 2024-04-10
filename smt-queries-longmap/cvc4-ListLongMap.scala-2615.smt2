; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39512 () Bool)

(assert start!39512)

(declare-fun b_free!9779 () Bool)

(declare-fun b_next!9779 () Bool)

(assert (=> start!39512 (= b_free!9779 (not b_next!9779))))

(declare-fun tp!34866 () Bool)

(declare-fun b_and!17433 () Bool)

(assert (=> start!39512 (= tp!34866 b_and!17433)))

(declare-fun b!422268 () Bool)

(declare-fun res!246544 () Bool)

(declare-fun e!251268 () Bool)

(assert (=> b!422268 (=> (not res!246544) (not e!251268))))

(declare-datatypes ((array!25709 0))(
  ( (array!25710 (arr!12304 (Array (_ BitVec 32) (_ BitVec 64))) (size!12656 (_ BitVec 32))) )
))
(declare-fun lt!193933 () array!25709)

(declare-datatypes ((List!7239 0))(
  ( (Nil!7236) (Cons!7235 (h!8091 (_ BitVec 64)) (t!12683 List!7239)) )
))
(declare-fun arrayNoDuplicates!0 (array!25709 (_ BitVec 32) List!7239) Bool)

(assert (=> b!422268 (= res!246544 (arrayNoDuplicates!0 lt!193933 #b00000000000000000000000000000000 Nil!7236))))

(declare-datatypes ((V!15679 0))(
  ( (V!15680 (val!5510 Int)) )
))
(declare-datatypes ((tuple2!7234 0))(
  ( (tuple2!7235 (_1!3628 (_ BitVec 64)) (_2!3628 V!15679)) )
))
(declare-datatypes ((List!7240 0))(
  ( (Nil!7237) (Cons!7236 (h!8092 tuple2!7234) (t!12684 List!7240)) )
))
(declare-datatypes ((ListLongMap!6147 0))(
  ( (ListLongMap!6148 (toList!3089 List!7240)) )
))
(declare-fun call!29515 () ListLongMap!6147)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun b!422269 () Bool)

(declare-fun e!251273 () Bool)

(declare-fun v!412 () V!15679)

(declare-fun call!29516 () ListLongMap!6147)

(declare-fun +!1284 (ListLongMap!6147 tuple2!7234) ListLongMap!6147)

(assert (=> b!422269 (= e!251273 (= call!29515 (+!1284 call!29516 (tuple2!7235 k!794 v!412))))))

(declare-fun b!422270 () Bool)

(declare-fun res!246554 () Bool)

(declare-fun e!251272 () Bool)

(assert (=> b!422270 (=> (not res!246554) (not e!251272))))

(declare-fun _keys!709 () array!25709)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5122 0))(
  ( (ValueCellFull!5122 (v!7757 V!15679)) (EmptyCell!5122) )
))
(declare-datatypes ((array!25711 0))(
  ( (array!25712 (arr!12305 (Array (_ BitVec 32) ValueCell!5122)) (size!12657 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25711)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!422270 (= res!246554 (and (= (size!12657 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12656 _keys!709) (size!12657 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!246546 () Bool)

(assert (=> start!39512 (=> (not res!246546) (not e!251272))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39512 (= res!246546 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12656 _keys!709))))))

(assert (=> start!39512 e!251272))

(declare-fun tp_is_empty!10931 () Bool)

(assert (=> start!39512 tp_is_empty!10931))

(assert (=> start!39512 tp!34866))

(assert (=> start!39512 true))

(declare-fun e!251267 () Bool)

(declare-fun array_inv!8964 (array!25711) Bool)

(assert (=> start!39512 (and (array_inv!8964 _values!549) e!251267)))

(declare-fun array_inv!8965 (array!25709) Bool)

(assert (=> start!39512 (array_inv!8965 _keys!709)))

(declare-fun b!422271 () Bool)

(declare-fun res!246545 () Bool)

(assert (=> b!422271 (=> (not res!246545) (not e!251268))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!422271 (= res!246545 (bvsle from!863 i!563))))

(declare-fun b!422272 () Bool)

(declare-fun res!246543 () Bool)

(assert (=> b!422272 (=> (not res!246543) (not e!251272))))

(declare-fun arrayContainsKey!0 (array!25709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!422272 (= res!246543 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!422273 () Bool)

(declare-fun e!251271 () Bool)

(assert (=> b!422273 (= e!251271 true)))

(declare-fun lt!193934 () ListLongMap!6147)

(declare-fun lt!193927 () V!15679)

(declare-fun lt!193935 () tuple2!7234)

(assert (=> b!422273 (= (+!1284 lt!193934 lt!193935) (+!1284 (+!1284 lt!193934 (tuple2!7235 k!794 lt!193927)) lt!193935))))

(declare-fun lt!193928 () V!15679)

(assert (=> b!422273 (= lt!193935 (tuple2!7235 k!794 lt!193928))))

(declare-datatypes ((Unit!12470 0))(
  ( (Unit!12471) )
))
(declare-fun lt!193930 () Unit!12470)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!76 (ListLongMap!6147 (_ BitVec 64) V!15679 V!15679) Unit!12470)

(assert (=> b!422273 (= lt!193930 (addSameAsAddTwiceSameKeyDiffValues!76 lt!193934 k!794 lt!193927 lt!193928))))

(declare-fun lt!193937 () V!15679)

(declare-fun get!6120 (ValueCell!5122 V!15679) V!15679)

(assert (=> b!422273 (= lt!193927 (get!6120 (select (arr!12305 _values!549) from!863) lt!193937))))

(declare-fun lt!193936 () ListLongMap!6147)

(assert (=> b!422273 (= lt!193936 (+!1284 lt!193934 (tuple2!7235 (select (arr!12304 lt!193933) from!863) lt!193928)))))

(assert (=> b!422273 (= lt!193928 (get!6120 (select (store (arr!12305 _values!549) i!563 (ValueCellFull!5122 v!412)) from!863) lt!193937))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!747 (Int (_ BitVec 64)) V!15679)

(assert (=> b!422273 (= lt!193937 (dynLambda!747 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15679)

(declare-fun zeroValue!515 () V!15679)

(declare-fun lt!193932 () array!25711)

(declare-fun getCurrentListMapNoExtraKeys!1293 (array!25709 array!25711 (_ BitVec 32) (_ BitVec 32) V!15679 V!15679 (_ BitVec 32) Int) ListLongMap!6147)

(assert (=> b!422273 (= lt!193934 (getCurrentListMapNoExtraKeys!1293 lt!193933 lt!193932 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!422274 () Bool)

(declare-fun res!246542 () Bool)

(assert (=> b!422274 (=> (not res!246542) (not e!251272))))

(assert (=> b!422274 (= res!246542 (or (= (select (arr!12304 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12304 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!422275 () Bool)

(assert (=> b!422275 (= e!251273 (= call!29516 call!29515))))

(declare-fun b!422276 () Bool)

(assert (=> b!422276 (= e!251272 e!251268)))

(declare-fun res!246552 () Bool)

(assert (=> b!422276 (=> (not res!246552) (not e!251268))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25709 (_ BitVec 32)) Bool)

(assert (=> b!422276 (= res!246552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193933 mask!1025))))

(assert (=> b!422276 (= lt!193933 (array!25710 (store (arr!12304 _keys!709) i!563 k!794) (size!12656 _keys!709)))))

(declare-fun mapIsEmpty!18018 () Bool)

(declare-fun mapRes!18018 () Bool)

(assert (=> mapIsEmpty!18018 mapRes!18018))

(declare-fun b!422277 () Bool)

(declare-fun res!246547 () Bool)

(assert (=> b!422277 (=> (not res!246547) (not e!251272))))

(assert (=> b!422277 (= res!246547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!422278 () Bool)

(declare-fun e!251274 () Bool)

(assert (=> b!422278 (= e!251274 tp_is_empty!10931)))

(declare-fun b!422279 () Bool)

(declare-fun res!246553 () Bool)

(assert (=> b!422279 (=> (not res!246553) (not e!251272))))

(assert (=> b!422279 (= res!246553 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12656 _keys!709))))))

(declare-fun b!422280 () Bool)

(declare-fun res!246551 () Bool)

(assert (=> b!422280 (=> (not res!246551) (not e!251272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!422280 (= res!246551 (validMask!0 mask!1025))))

(declare-fun bm!29512 () Bool)

(declare-fun c!55382 () Bool)

(assert (=> bm!29512 (= call!29516 (getCurrentListMapNoExtraKeys!1293 (ite c!55382 _keys!709 lt!193933) (ite c!55382 _values!549 lt!193932) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!422281 () Bool)

(declare-fun e!251270 () Bool)

(assert (=> b!422281 (= e!251268 e!251270)))

(declare-fun res!246548 () Bool)

(assert (=> b!422281 (=> (not res!246548) (not e!251270))))

(assert (=> b!422281 (= res!246548 (= from!863 i!563))))

(assert (=> b!422281 (= lt!193936 (getCurrentListMapNoExtraKeys!1293 lt!193933 lt!193932 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!422281 (= lt!193932 (array!25712 (store (arr!12305 _values!549) i!563 (ValueCellFull!5122 v!412)) (size!12657 _values!549)))))

(declare-fun lt!193929 () ListLongMap!6147)

(assert (=> b!422281 (= lt!193929 (getCurrentListMapNoExtraKeys!1293 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!422282 () Bool)

(declare-fun res!246550 () Bool)

(assert (=> b!422282 (=> (not res!246550) (not e!251272))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!422282 (= res!246550 (validKeyInArray!0 k!794))))

(declare-fun bm!29513 () Bool)

(assert (=> bm!29513 (= call!29515 (getCurrentListMapNoExtraKeys!1293 (ite c!55382 lt!193933 _keys!709) (ite c!55382 lt!193932 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!422283 () Bool)

(declare-fun e!251266 () Bool)

(assert (=> b!422283 (= e!251266 tp_is_empty!10931)))

(declare-fun b!422284 () Bool)

(assert (=> b!422284 (= e!251270 (not e!251271))))

(declare-fun res!246555 () Bool)

(assert (=> b!422284 (=> res!246555 e!251271)))

(assert (=> b!422284 (= res!246555 (validKeyInArray!0 (select (arr!12304 _keys!709) from!863)))))

(assert (=> b!422284 e!251273))

(assert (=> b!422284 (= c!55382 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!193931 () Unit!12470)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!479 (array!25709 array!25711 (_ BitVec 32) (_ BitVec 32) V!15679 V!15679 (_ BitVec 32) (_ BitVec 64) V!15679 (_ BitVec 32) Int) Unit!12470)

(assert (=> b!422284 (= lt!193931 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!479 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!422285 () Bool)

(declare-fun res!246549 () Bool)

(assert (=> b!422285 (=> (not res!246549) (not e!251272))))

(assert (=> b!422285 (= res!246549 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7236))))

(declare-fun mapNonEmpty!18018 () Bool)

(declare-fun tp!34865 () Bool)

(assert (=> mapNonEmpty!18018 (= mapRes!18018 (and tp!34865 e!251274))))

(declare-fun mapValue!18018 () ValueCell!5122)

(declare-fun mapRest!18018 () (Array (_ BitVec 32) ValueCell!5122))

(declare-fun mapKey!18018 () (_ BitVec 32))

(assert (=> mapNonEmpty!18018 (= (arr!12305 _values!549) (store mapRest!18018 mapKey!18018 mapValue!18018))))

(declare-fun b!422286 () Bool)

(assert (=> b!422286 (= e!251267 (and e!251266 mapRes!18018))))

(declare-fun condMapEmpty!18018 () Bool)

(declare-fun mapDefault!18018 () ValueCell!5122)

