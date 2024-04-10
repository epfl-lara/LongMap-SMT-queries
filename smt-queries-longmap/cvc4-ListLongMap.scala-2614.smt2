; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39506 () Bool)

(assert start!39506)

(declare-fun b_free!9773 () Bool)

(declare-fun b_next!9773 () Bool)

(assert (=> start!39506 (= b_free!9773 (not b_next!9773))))

(declare-fun tp!34848 () Bool)

(declare-fun b_and!17421 () Bool)

(assert (=> start!39506 (= tp!34848 b_and!17421)))

(declare-fun c!55373 () Bool)

(declare-datatypes ((V!15671 0))(
  ( (V!15672 (val!5507 Int)) )
))
(declare-fun minValue!515 () V!15671)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!29494 () Bool)

(declare-datatypes ((ValueCell!5119 0))(
  ( (ValueCellFull!5119 (v!7754 V!15671)) (EmptyCell!5119) )
))
(declare-datatypes ((array!25697 0))(
  ( (array!25698 (arr!12298 (Array (_ BitVec 32) ValueCell!5119)) (size!12650 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25697)

(declare-datatypes ((array!25699 0))(
  ( (array!25700 (arr!12299 (Array (_ BitVec 32) (_ BitVec 64))) (size!12651 (_ BitVec 32))) )
))
(declare-fun lt!193835 () array!25699)

(declare-datatypes ((tuple2!7228 0))(
  ( (tuple2!7229 (_1!3625 (_ BitVec 64)) (_2!3625 V!15671)) )
))
(declare-datatypes ((List!7233 0))(
  ( (Nil!7230) (Cons!7229 (h!8085 tuple2!7228) (t!12671 List!7233)) )
))
(declare-datatypes ((ListLongMap!6141 0))(
  ( (ListLongMap!6142 (toList!3086 List!7233)) )
))
(declare-fun call!29497 () ListLongMap!6141)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!25699)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!193838 () array!25697)

(declare-fun zeroValue!515 () V!15671)

(declare-fun getCurrentListMapNoExtraKeys!1290 (array!25699 array!25697 (_ BitVec 32) (_ BitVec 32) V!15671 V!15671 (_ BitVec 32) Int) ListLongMap!6141)

(assert (=> bm!29494 (= call!29497 (getCurrentListMapNoExtraKeys!1290 (ite c!55373 _keys!709 lt!193835) (ite c!55373 _values!549 lt!193838) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!422091 () Bool)

(declare-fun res!246417 () Bool)

(declare-fun e!251190 () Bool)

(assert (=> b!422091 (=> (not res!246417) (not e!251190))))

(declare-datatypes ((List!7234 0))(
  ( (Nil!7231) (Cons!7230 (h!8086 (_ BitVec 64)) (t!12672 List!7234)) )
))
(declare-fun arrayNoDuplicates!0 (array!25699 (_ BitVec 32) List!7234) Bool)

(assert (=> b!422091 (= res!246417 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7231))))

(declare-fun b!422092 () Bool)

(declare-fun res!246423 () Bool)

(declare-fun e!251185 () Bool)

(assert (=> b!422092 (=> (not res!246423) (not e!251185))))

(assert (=> b!422092 (= res!246423 (arrayNoDuplicates!0 lt!193835 #b00000000000000000000000000000000 Nil!7231))))

(declare-fun b!422093 () Bool)

(declare-fun e!251193 () Bool)

(assert (=> b!422093 (= e!251193 true)))

(declare-fun lt!193828 () tuple2!7228)

(declare-fun lt!193836 () V!15671)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!193831 () ListLongMap!6141)

(declare-fun +!1281 (ListLongMap!6141 tuple2!7228) ListLongMap!6141)

(assert (=> b!422093 (= (+!1281 lt!193831 lt!193828) (+!1281 (+!1281 lt!193831 (tuple2!7229 k!794 lt!193836)) lt!193828))))

(declare-fun lt!193837 () V!15671)

(assert (=> b!422093 (= lt!193828 (tuple2!7229 k!794 lt!193837))))

(declare-datatypes ((Unit!12464 0))(
  ( (Unit!12465) )
))
(declare-fun lt!193832 () Unit!12464)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!74 (ListLongMap!6141 (_ BitVec 64) V!15671 V!15671) Unit!12464)

(assert (=> b!422093 (= lt!193832 (addSameAsAddTwiceSameKeyDiffValues!74 lt!193831 k!794 lt!193836 lt!193837))))

(declare-fun lt!193834 () V!15671)

(declare-fun get!6116 (ValueCell!5119 V!15671) V!15671)

(assert (=> b!422093 (= lt!193836 (get!6116 (select (arr!12298 _values!549) from!863) lt!193834))))

(declare-fun lt!193829 () ListLongMap!6141)

(assert (=> b!422093 (= lt!193829 (+!1281 lt!193831 (tuple2!7229 (select (arr!12299 lt!193835) from!863) lt!193837)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15671)

(assert (=> b!422093 (= lt!193837 (get!6116 (select (store (arr!12298 _values!549) i!563 (ValueCellFull!5119 v!412)) from!863) lt!193834))))

(declare-fun dynLambda!745 (Int (_ BitVec 64)) V!15671)

(assert (=> b!422093 (= lt!193834 (dynLambda!745 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!422093 (= lt!193831 (getCurrentListMapNoExtraKeys!1290 lt!193835 lt!193838 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!422094 () Bool)

(declare-fun res!246421 () Bool)

(assert (=> b!422094 (=> (not res!246421) (not e!251190))))

(assert (=> b!422094 (= res!246421 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12651 _keys!709))))))

(declare-fun b!422095 () Bool)

(declare-fun e!251189 () Bool)

(assert (=> b!422095 (= e!251185 e!251189)))

(declare-fun res!246426 () Bool)

(assert (=> b!422095 (=> (not res!246426) (not e!251189))))

(assert (=> b!422095 (= res!246426 (= from!863 i!563))))

(assert (=> b!422095 (= lt!193829 (getCurrentListMapNoExtraKeys!1290 lt!193835 lt!193838 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!422095 (= lt!193838 (array!25698 (store (arr!12298 _values!549) i!563 (ValueCellFull!5119 v!412)) (size!12650 _values!549)))))

(declare-fun lt!193830 () ListLongMap!6141)

(assert (=> b!422095 (= lt!193830 (getCurrentListMapNoExtraKeys!1290 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun call!29498 () ListLongMap!6141)

(declare-fun e!251187 () Bool)

(declare-fun b!422096 () Bool)

(assert (=> b!422096 (= e!251187 (= call!29498 (+!1281 call!29497 (tuple2!7229 k!794 v!412))))))

(declare-fun bm!29495 () Bool)

(assert (=> bm!29495 (= call!29498 (getCurrentListMapNoExtraKeys!1290 (ite c!55373 lt!193835 _keys!709) (ite c!55373 lt!193838 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!422097 () Bool)

(declare-fun res!246429 () Bool)

(assert (=> b!422097 (=> (not res!246429) (not e!251190))))

(assert (=> b!422097 (= res!246429 (or (= (select (arr!12299 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12299 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!246420 () Bool)

(assert (=> start!39506 (=> (not res!246420) (not e!251190))))

(assert (=> start!39506 (= res!246420 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12651 _keys!709))))))

(assert (=> start!39506 e!251190))

(declare-fun tp_is_empty!10925 () Bool)

(assert (=> start!39506 tp_is_empty!10925))

(assert (=> start!39506 tp!34848))

(assert (=> start!39506 true))

(declare-fun e!251192 () Bool)

(declare-fun array_inv!8960 (array!25697) Bool)

(assert (=> start!39506 (and (array_inv!8960 _values!549) e!251192)))

(declare-fun array_inv!8961 (array!25699) Bool)

(assert (=> start!39506 (array_inv!8961 _keys!709)))

(declare-fun b!422098 () Bool)

(assert (=> b!422098 (= e!251187 (= call!29497 call!29498))))

(declare-fun mapIsEmpty!18009 () Bool)

(declare-fun mapRes!18009 () Bool)

(assert (=> mapIsEmpty!18009 mapRes!18009))

(declare-fun b!422099 () Bool)

(declare-fun e!251186 () Bool)

(assert (=> b!422099 (= e!251192 (and e!251186 mapRes!18009))))

(declare-fun condMapEmpty!18009 () Bool)

(declare-fun mapDefault!18009 () ValueCell!5119)

