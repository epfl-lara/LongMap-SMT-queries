; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39416 () Bool)

(assert start!39416)

(declare-fun b_free!9683 () Bool)

(declare-fun b_next!9683 () Bool)

(assert (=> start!39416 (= b_free!9683 (not b_next!9683))))

(declare-fun tp!34578 () Bool)

(declare-fun b_and!17241 () Bool)

(assert (=> start!39416 (= tp!34578 b_and!17241)))

(declare-fun b!419436 () Bool)

(declare-fun e!249978 () Bool)

(declare-fun e!249970 () Bool)

(assert (=> b!419436 (= e!249978 e!249970)))

(declare-fun res!244526 () Bool)

(assert (=> b!419436 (=> (not res!244526) (not e!249970))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!419436 (= res!244526 (= from!863 i!563))))

(declare-datatypes ((V!15551 0))(
  ( (V!15552 (val!5462 Int)) )
))
(declare-fun minValue!515 () V!15551)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5074 0))(
  ( (ValueCellFull!5074 (v!7709 V!15551)) (EmptyCell!5074) )
))
(declare-datatypes ((array!25519 0))(
  ( (array!25520 (arr!12209 (Array (_ BitVec 32) ValueCell!5074)) (size!12561 (_ BitVec 32))) )
))
(declare-fun lt!192345 () array!25519)

(declare-fun zeroValue!515 () V!15551)

(declare-datatypes ((array!25521 0))(
  ( (array!25522 (arr!12210 (Array (_ BitVec 32) (_ BitVec 64))) (size!12562 (_ BitVec 32))) )
))
(declare-fun lt!192344 () array!25521)

(declare-datatypes ((tuple2!7150 0))(
  ( (tuple2!7151 (_1!3586 (_ BitVec 64)) (_2!3586 V!15551)) )
))
(declare-datatypes ((List!7159 0))(
  ( (Nil!7156) (Cons!7155 (h!8011 tuple2!7150) (t!12507 List!7159)) )
))
(declare-datatypes ((ListLongMap!6063 0))(
  ( (ListLongMap!6064 (toList!3047 List!7159)) )
))
(declare-fun lt!192350 () ListLongMap!6063)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1252 (array!25521 array!25519 (_ BitVec 32) (_ BitVec 32) V!15551 V!15551 (_ BitVec 32) Int) ListLongMap!6063)

(assert (=> b!419436 (= lt!192350 (getCurrentListMapNoExtraKeys!1252 lt!192344 lt!192345 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15551)

(declare-fun _values!549 () array!25519)

(assert (=> b!419436 (= lt!192345 (array!25520 (store (arr!12209 _values!549) i!563 (ValueCellFull!5074 v!412)) (size!12561 _values!549)))))

(declare-fun lt!192349 () ListLongMap!6063)

(declare-fun _keys!709 () array!25521)

(assert (=> b!419436 (= lt!192349 (getCurrentListMapNoExtraKeys!1252 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!244536 () Bool)

(declare-fun e!249971 () Bool)

(assert (=> start!39416 (=> (not res!244536) (not e!249971))))

(assert (=> start!39416 (= res!244536 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12562 _keys!709))))))

(assert (=> start!39416 e!249971))

(declare-fun tp_is_empty!10835 () Bool)

(assert (=> start!39416 tp_is_empty!10835))

(assert (=> start!39416 tp!34578))

(assert (=> start!39416 true))

(declare-fun e!249977 () Bool)

(declare-fun array_inv!8904 (array!25519) Bool)

(assert (=> start!39416 (and (array_inv!8904 _values!549) e!249977)))

(declare-fun array_inv!8905 (array!25521) Bool)

(assert (=> start!39416 (array_inv!8905 _keys!709)))

(declare-fun b!419437 () Bool)

(declare-fun e!249975 () Bool)

(declare-fun call!29228 () ListLongMap!6063)

(declare-fun call!29227 () ListLongMap!6063)

(assert (=> b!419437 (= e!249975 (= call!29228 call!29227))))

(declare-fun mapIsEmpty!17874 () Bool)

(declare-fun mapRes!17874 () Bool)

(assert (=> mapIsEmpty!17874 mapRes!17874))

(declare-fun b!419438 () Bool)

(declare-fun e!249974 () Bool)

(assert (=> b!419438 (= e!249970 (not e!249974))))

(declare-fun res!244535 () Bool)

(assert (=> b!419438 (=> res!244535 e!249974)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!419438 (= res!244535 (validKeyInArray!0 (select (arr!12210 _keys!709) from!863)))))

(assert (=> b!419438 e!249975))

(declare-fun c!55238 () Bool)

(assert (=> b!419438 (= c!55238 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12396 0))(
  ( (Unit!12397) )
))
(declare-fun lt!192346 () Unit!12396)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!448 (array!25521 array!25519 (_ BitVec 32) (_ BitVec 32) V!15551 V!15551 (_ BitVec 32) (_ BitVec 64) V!15551 (_ BitVec 32) Int) Unit!12396)

(assert (=> b!419438 (= lt!192346 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!448 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419439 () Bool)

(declare-fun e!249972 () Bool)

(assert (=> b!419439 (= e!249972 tp_is_empty!10835)))

(declare-fun b!419440 () Bool)

(declare-fun res!244539 () Bool)

(assert (=> b!419440 (=> (not res!244539) (not e!249971))))

(declare-fun arrayContainsKey!0 (array!25521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!419440 (= res!244539 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!419441 () Bool)

(declare-fun e!249976 () Bool)

(assert (=> b!419441 (= e!249976 tp_is_empty!10835)))

(declare-fun mapNonEmpty!17874 () Bool)

(declare-fun tp!34577 () Bool)

(assert (=> mapNonEmpty!17874 (= mapRes!17874 (and tp!34577 e!249976))))

(declare-fun mapValue!17874 () ValueCell!5074)

(declare-fun mapRest!17874 () (Array (_ BitVec 32) ValueCell!5074))

(declare-fun mapKey!17874 () (_ BitVec 32))

(assert (=> mapNonEmpty!17874 (= (arr!12209 _values!549) (store mapRest!17874 mapKey!17874 mapValue!17874))))

(declare-fun b!419442 () Bool)

(declare-fun res!244533 () Bool)

(assert (=> b!419442 (=> (not res!244533) (not e!249971))))

(assert (=> b!419442 (= res!244533 (validKeyInArray!0 k!794))))

(declare-fun b!419443 () Bool)

(declare-fun res!244529 () Bool)

(assert (=> b!419443 (=> (not res!244529) (not e!249978))))

(declare-datatypes ((List!7160 0))(
  ( (Nil!7157) (Cons!7156 (h!8012 (_ BitVec 64)) (t!12508 List!7160)) )
))
(declare-fun arrayNoDuplicates!0 (array!25521 (_ BitVec 32) List!7160) Bool)

(assert (=> b!419443 (= res!244529 (arrayNoDuplicates!0 lt!192344 #b00000000000000000000000000000000 Nil!7157))))

(declare-fun b!419444 () Bool)

(declare-fun res!244538 () Bool)

(assert (=> b!419444 (=> (not res!244538) (not e!249971))))

(assert (=> b!419444 (= res!244538 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7157))))

(declare-fun b!419445 () Bool)

(assert (=> b!419445 (= e!249974 true)))

(declare-fun lt!192348 () V!15551)

(declare-fun lt!192351 () tuple2!7150)

(declare-fun lt!192352 () ListLongMap!6063)

(declare-fun +!1244 (ListLongMap!6063 tuple2!7150) ListLongMap!6063)

(assert (=> b!419445 (= (+!1244 lt!192352 lt!192351) (+!1244 (+!1244 lt!192352 (tuple2!7151 k!794 lt!192348)) lt!192351))))

(declare-fun lt!192353 () V!15551)

(assert (=> b!419445 (= lt!192351 (tuple2!7151 k!794 lt!192353))))

(declare-fun lt!192343 () Unit!12396)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!43 (ListLongMap!6063 (_ BitVec 64) V!15551 V!15551) Unit!12396)

(assert (=> b!419445 (= lt!192343 (addSameAsAddTwiceSameKeyDiffValues!43 lt!192352 k!794 lt!192348 lt!192353))))

(declare-fun lt!192347 () V!15551)

(declare-fun get!6055 (ValueCell!5074 V!15551) V!15551)

(assert (=> b!419445 (= lt!192348 (get!6055 (select (arr!12209 _values!549) from!863) lt!192347))))

(assert (=> b!419445 (= lt!192350 (+!1244 lt!192352 (tuple2!7151 (select (arr!12210 lt!192344) from!863) lt!192353)))))

(assert (=> b!419445 (= lt!192353 (get!6055 (select (store (arr!12209 _values!549) i!563 (ValueCellFull!5074 v!412)) from!863) lt!192347))))

(declare-fun dynLambda!714 (Int (_ BitVec 64)) V!15551)

(assert (=> b!419445 (= lt!192347 (dynLambda!714 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!419445 (= lt!192352 (getCurrentListMapNoExtraKeys!1252 lt!192344 lt!192345 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419446 () Bool)

(declare-fun res!244528 () Bool)

(assert (=> b!419446 (=> (not res!244528) (not e!249971))))

(assert (=> b!419446 (= res!244528 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12562 _keys!709))))))

(declare-fun b!419447 () Bool)

(assert (=> b!419447 (= e!249977 (and e!249972 mapRes!17874))))

(declare-fun condMapEmpty!17874 () Bool)

(declare-fun mapDefault!17874 () ValueCell!5074)

