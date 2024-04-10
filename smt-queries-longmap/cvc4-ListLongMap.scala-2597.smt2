; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39404 () Bool)

(assert start!39404)

(declare-fun b_free!9671 () Bool)

(declare-fun b_next!9671 () Bool)

(assert (=> start!39404 (= b_free!9671 (not b_next!9671))))

(declare-fun tp!34542 () Bool)

(declare-fun b_and!17217 () Bool)

(assert (=> start!39404 (= tp!34542 b_and!17217)))

(declare-fun b!419082 () Bool)

(declare-fun e!249809 () Bool)

(declare-fun tp_is_empty!10823 () Bool)

(assert (=> b!419082 (= e!249809 tp_is_empty!10823)))

(declare-fun b!419083 () Bool)

(declare-datatypes ((V!15535 0))(
  ( (V!15536 (val!5456 Int)) )
))
(declare-datatypes ((tuple2!7138 0))(
  ( (tuple2!7139 (_1!3580 (_ BitVec 64)) (_2!3580 V!15535)) )
))
(declare-datatypes ((List!7149 0))(
  ( (Nil!7146) (Cons!7145 (h!8001 tuple2!7138) (t!12485 List!7149)) )
))
(declare-datatypes ((ListLongMap!6051 0))(
  ( (ListLongMap!6052 (toList!3041 List!7149)) )
))
(declare-fun call!29191 () ListLongMap!6051)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun e!249812 () Bool)

(declare-fun call!29192 () ListLongMap!6051)

(declare-fun v!412 () V!15535)

(declare-fun +!1239 (ListLongMap!6051 tuple2!7138) ListLongMap!6051)

(assert (=> b!419083 (= e!249812 (= call!29192 (+!1239 call!29191 (tuple2!7139 k!794 v!412))))))

(declare-fun b!419084 () Bool)

(declare-fun e!249808 () Bool)

(declare-fun e!249816 () Bool)

(assert (=> b!419084 (= e!249808 (not e!249816))))

(declare-fun res!244275 () Bool)

(assert (=> b!419084 (=> res!244275 e!249816)))

(declare-datatypes ((array!25495 0))(
  ( (array!25496 (arr!12197 (Array (_ BitVec 32) (_ BitVec 64))) (size!12549 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25495)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!419084 (= res!244275 (validKeyInArray!0 (select (arr!12197 _keys!709) from!863)))))

(assert (=> b!419084 e!249812))

(declare-fun c!55220 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!419084 (= c!55220 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15535)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5068 0))(
  ( (ValueCellFull!5068 (v!7703 V!15535)) (EmptyCell!5068) )
))
(declare-datatypes ((array!25497 0))(
  ( (array!25498 (arr!12198 (Array (_ BitVec 32) ValueCell!5068)) (size!12550 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25497)

(declare-fun zeroValue!515 () V!15535)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((Unit!12384 0))(
  ( (Unit!12385) )
))
(declare-fun lt!192151 () Unit!12384)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!443 (array!25495 array!25497 (_ BitVec 32) (_ BitVec 32) V!15535 V!15535 (_ BitVec 32) (_ BitVec 64) V!15535 (_ BitVec 32) Int) Unit!12384)

(assert (=> b!419084 (= lt!192151 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!443 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17856 () Bool)

(declare-fun mapRes!17856 () Bool)

(declare-fun tp!34541 () Bool)

(assert (=> mapNonEmpty!17856 (= mapRes!17856 (and tp!34541 e!249809))))

(declare-fun mapKey!17856 () (_ BitVec 32))

(declare-fun mapRest!17856 () (Array (_ BitVec 32) ValueCell!5068))

(declare-fun mapValue!17856 () ValueCell!5068)

(assert (=> mapNonEmpty!17856 (= (arr!12198 _values!549) (store mapRest!17856 mapKey!17856 mapValue!17856))))

(declare-fun b!419085 () Bool)

(declare-fun e!249814 () Bool)

(declare-fun e!249810 () Bool)

(assert (=> b!419085 (= e!249814 e!249810)))

(declare-fun res!244282 () Bool)

(assert (=> b!419085 (=> (not res!244282) (not e!249810))))

(declare-fun lt!192150 () array!25495)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25495 (_ BitVec 32)) Bool)

(assert (=> b!419085 (= res!244282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192150 mask!1025))))

(assert (=> b!419085 (= lt!192150 (array!25496 (store (arr!12197 _keys!709) i!563 k!794) (size!12549 _keys!709)))))

(declare-fun b!419086 () Bool)

(declare-fun res!244281 () Bool)

(assert (=> b!419086 (=> (not res!244281) (not e!249814))))

(assert (=> b!419086 (= res!244281 (or (= (select (arr!12197 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12197 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!29188 () Bool)

(declare-fun lt!192148 () array!25497)

(declare-fun getCurrentListMapNoExtraKeys!1246 (array!25495 array!25497 (_ BitVec 32) (_ BitVec 32) V!15535 V!15535 (_ BitVec 32) Int) ListLongMap!6051)

(assert (=> bm!29188 (= call!29192 (getCurrentListMapNoExtraKeys!1246 (ite c!55220 lt!192150 _keys!709) (ite c!55220 lt!192148 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419087 () Bool)

(assert (=> b!419087 (= e!249810 e!249808)))

(declare-fun res!244277 () Bool)

(assert (=> b!419087 (=> (not res!244277) (not e!249808))))

(assert (=> b!419087 (= res!244277 (= from!863 i!563))))

(declare-fun lt!192146 () ListLongMap!6051)

(assert (=> b!419087 (= lt!192146 (getCurrentListMapNoExtraKeys!1246 lt!192150 lt!192148 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!419087 (= lt!192148 (array!25498 (store (arr!12198 _values!549) i!563 (ValueCellFull!5068 v!412)) (size!12550 _values!549)))))

(declare-fun lt!192153 () ListLongMap!6051)

(assert (=> b!419087 (= lt!192153 (getCurrentListMapNoExtraKeys!1246 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!419088 () Bool)

(assert (=> b!419088 (= e!249812 (= call!29191 call!29192))))

(declare-fun b!419089 () Bool)

(declare-fun res!244279 () Bool)

(assert (=> b!419089 (=> (not res!244279) (not e!249814))))

(assert (=> b!419089 (= res!244279 (and (= (size!12550 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12549 _keys!709) (size!12550 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!419090 () Bool)

(declare-fun res!244285 () Bool)

(assert (=> b!419090 (=> (not res!244285) (not e!249810))))

(declare-datatypes ((List!7150 0))(
  ( (Nil!7147) (Cons!7146 (h!8002 (_ BitVec 64)) (t!12486 List!7150)) )
))
(declare-fun arrayNoDuplicates!0 (array!25495 (_ BitVec 32) List!7150) Bool)

(assert (=> b!419090 (= res!244285 (arrayNoDuplicates!0 lt!192150 #b00000000000000000000000000000000 Nil!7147))))

(declare-fun bm!29189 () Bool)

(assert (=> bm!29189 (= call!29191 (getCurrentListMapNoExtraKeys!1246 (ite c!55220 _keys!709 lt!192150) (ite c!55220 _values!549 lt!192148) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419091 () Bool)

(declare-fun res!244276 () Bool)

(assert (=> b!419091 (=> (not res!244276) (not e!249814))))

(declare-fun arrayContainsKey!0 (array!25495 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!419091 (= res!244276 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!419092 () Bool)

(declare-fun res!244284 () Bool)

(assert (=> b!419092 (=> (not res!244284) (not e!249814))))

(assert (=> b!419092 (= res!244284 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12549 _keys!709))))))

(declare-fun b!419093 () Bool)

(declare-fun res!244286 () Bool)

(assert (=> b!419093 (=> (not res!244286) (not e!249814))))

(assert (=> b!419093 (= res!244286 (validKeyInArray!0 k!794))))

(declare-fun b!419094 () Bool)

(assert (=> b!419094 (= e!249816 true)))

(declare-fun lt!192152 () tuple2!7138)

(declare-fun lt!192147 () ListLongMap!6051)

(declare-fun lt!192154 () V!15535)

(assert (=> b!419094 (= (+!1239 lt!192147 lt!192152) (+!1239 (+!1239 lt!192147 (tuple2!7139 k!794 lt!192154)) lt!192152))))

(declare-fun lt!192155 () V!15535)

(assert (=> b!419094 (= lt!192152 (tuple2!7139 k!794 lt!192155))))

(declare-fun lt!192149 () Unit!12384)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!38 (ListLongMap!6051 (_ BitVec 64) V!15535 V!15535) Unit!12384)

(assert (=> b!419094 (= lt!192149 (addSameAsAddTwiceSameKeyDiffValues!38 lt!192147 k!794 lt!192154 lt!192155))))

(declare-fun lt!192145 () V!15535)

(declare-fun get!6046 (ValueCell!5068 V!15535) V!15535)

(assert (=> b!419094 (= lt!192154 (get!6046 (select (arr!12198 _values!549) from!863) lt!192145))))

(assert (=> b!419094 (= lt!192146 (+!1239 lt!192147 (tuple2!7139 (select (arr!12197 lt!192150) from!863) lt!192155)))))

(assert (=> b!419094 (= lt!192155 (get!6046 (select (store (arr!12198 _values!549) i!563 (ValueCellFull!5068 v!412)) from!863) lt!192145))))

(declare-fun dynLambda!709 (Int (_ BitVec 64)) V!15535)

(assert (=> b!419094 (= lt!192145 (dynLambda!709 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!419094 (= lt!192147 (getCurrentListMapNoExtraKeys!1246 lt!192150 lt!192148 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419095 () Bool)

(declare-fun res!244278 () Bool)

(assert (=> b!419095 (=> (not res!244278) (not e!249810))))

(assert (=> b!419095 (= res!244278 (bvsle from!863 i!563))))

(declare-fun b!419096 () Bool)

(declare-fun e!249811 () Bool)

(assert (=> b!419096 (= e!249811 tp_is_empty!10823)))

(declare-fun b!419097 () Bool)

(declare-fun res!244280 () Bool)

(assert (=> b!419097 (=> (not res!244280) (not e!249814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!419097 (= res!244280 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!17856 () Bool)

(assert (=> mapIsEmpty!17856 mapRes!17856))

(declare-fun b!419098 () Bool)

(declare-fun res!244274 () Bool)

(assert (=> b!419098 (=> (not res!244274) (not e!249814))))

(assert (=> b!419098 (= res!244274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!244283 () Bool)

(assert (=> start!39404 (=> (not res!244283) (not e!249814))))

(assert (=> start!39404 (= res!244283 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12549 _keys!709))))))

(assert (=> start!39404 e!249814))

(assert (=> start!39404 tp_is_empty!10823))

(assert (=> start!39404 tp!34542))

(assert (=> start!39404 true))

(declare-fun e!249813 () Bool)

(declare-fun array_inv!8894 (array!25497) Bool)

(assert (=> start!39404 (and (array_inv!8894 _values!549) e!249813)))

(declare-fun array_inv!8895 (array!25495) Bool)

(assert (=> start!39404 (array_inv!8895 _keys!709)))

(declare-fun b!419099 () Bool)

(declare-fun res!244287 () Bool)

(assert (=> b!419099 (=> (not res!244287) (not e!249814))))

(assert (=> b!419099 (= res!244287 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7147))))

(declare-fun b!419100 () Bool)

(assert (=> b!419100 (= e!249813 (and e!249811 mapRes!17856))))

(declare-fun condMapEmpty!17856 () Bool)

(declare-fun mapDefault!17856 () ValueCell!5068)

