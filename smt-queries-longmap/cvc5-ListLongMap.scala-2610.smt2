; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39478 () Bool)

(assert start!39478)

(declare-fun b_free!9745 () Bool)

(declare-fun b_next!9745 () Bool)

(assert (=> start!39478 (= b_free!9745 (not b_next!9745))))

(declare-fun tp!34763 () Bool)

(declare-fun b_and!17365 () Bool)

(assert (=> start!39478 (= tp!34763 b_and!17365)))

(declare-fun b!421265 () Bool)

(declare-fun e!250809 () Bool)

(declare-fun tp_is_empty!10897 () Bool)

(assert (=> b!421265 (= e!250809 tp_is_empty!10897)))

(declare-fun b!421266 () Bool)

(declare-fun res!245837 () Bool)

(declare-fun e!250807 () Bool)

(assert (=> b!421266 (=> (not res!245837) (not e!250807))))

(declare-datatypes ((array!25643 0))(
  ( (array!25644 (arr!12271 (Array (_ BitVec 32) (_ BitVec 64))) (size!12623 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25643)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!421266 (= res!245837 (or (= (select (arr!12271 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12271 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((V!15635 0))(
  ( (V!15636 (val!5493 Int)) )
))
(declare-fun minValue!515 () V!15635)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5105 0))(
  ( (ValueCellFull!5105 (v!7740 V!15635)) (EmptyCell!5105) )
))
(declare-datatypes ((array!25645 0))(
  ( (array!25646 (arr!12272 (Array (_ BitVec 32) ValueCell!5105)) (size!12624 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25645)

(declare-fun zeroValue!515 () V!15635)

(declare-fun lt!193372 () array!25643)

(declare-fun c!55331 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!193373 () array!25645)

(declare-fun bm!29410 () Bool)

(declare-datatypes ((tuple2!7202 0))(
  ( (tuple2!7203 (_1!3612 (_ BitVec 64)) (_2!3612 V!15635)) )
))
(declare-datatypes ((List!7208 0))(
  ( (Nil!7205) (Cons!7204 (h!8060 tuple2!7202) (t!12618 List!7208)) )
))
(declare-datatypes ((ListLongMap!6115 0))(
  ( (ListLongMap!6116 (toList!3073 List!7208)) )
))
(declare-fun call!29414 () ListLongMap!6115)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1277 (array!25643 array!25645 (_ BitVec 32) (_ BitVec 32) V!15635 V!15635 (_ BitVec 32) Int) ListLongMap!6115)

(assert (=> bm!29410 (= call!29414 (getCurrentListMapNoExtraKeys!1277 (ite c!55331 _keys!709 lt!193372) (ite c!55331 _values!549 lt!193373) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421267 () Bool)

(declare-fun e!250808 () Bool)

(assert (=> b!421267 (= e!250808 tp_is_empty!10897)))

(declare-fun b!421268 () Bool)

(declare-fun res!245833 () Bool)

(assert (=> b!421268 (=> (not res!245833) (not e!250807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25643 (_ BitVec 32)) Bool)

(assert (=> b!421268 (= res!245833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!421269 () Bool)

(declare-fun res!245828 () Bool)

(assert (=> b!421269 (=> (not res!245828) (not e!250807))))

(declare-datatypes ((List!7209 0))(
  ( (Nil!7206) (Cons!7205 (h!8061 (_ BitVec 64)) (t!12619 List!7209)) )
))
(declare-fun arrayNoDuplicates!0 (array!25643 (_ BitVec 32) List!7209) Bool)

(assert (=> b!421269 (= res!245828 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7206))))

(declare-fun b!421270 () Bool)

(declare-fun e!250813 () Bool)

(declare-fun call!29413 () ListLongMap!6115)

(assert (=> b!421270 (= e!250813 (= call!29414 call!29413))))

(declare-fun mapIsEmpty!17967 () Bool)

(declare-fun mapRes!17967 () Bool)

(assert (=> mapIsEmpty!17967 mapRes!17967))

(declare-fun b!421271 () Bool)

(declare-fun res!245831 () Bool)

(assert (=> b!421271 (=> (not res!245831) (not e!250807))))

(assert (=> b!421271 (= res!245831 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12623 _keys!709))))))

(declare-fun res!245840 () Bool)

(assert (=> start!39478 (=> (not res!245840) (not e!250807))))

(assert (=> start!39478 (= res!245840 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12623 _keys!709))))))

(assert (=> start!39478 e!250807))

(assert (=> start!39478 tp_is_empty!10897))

(assert (=> start!39478 tp!34763))

(assert (=> start!39478 true))

(declare-fun e!250811 () Bool)

(declare-fun array_inv!8940 (array!25645) Bool)

(assert (=> start!39478 (and (array_inv!8940 _values!549) e!250811)))

(declare-fun array_inv!8941 (array!25643) Bool)

(assert (=> start!39478 (array_inv!8941 _keys!709)))

(declare-fun b!421272 () Bool)

(declare-fun e!250812 () Bool)

(declare-fun e!250815 () Bool)

(assert (=> b!421272 (= e!250812 (not e!250815))))

(declare-fun res!245834 () Bool)

(assert (=> b!421272 (=> res!245834 e!250815)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!421272 (= res!245834 (validKeyInArray!0 (select (arr!12271 _keys!709) from!863)))))

(assert (=> b!421272 e!250813))

(assert (=> b!421272 (= c!55331 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12440 0))(
  ( (Unit!12441) )
))
(declare-fun lt!193376 () Unit!12440)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!15635)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!466 (array!25643 array!25645 (_ BitVec 32) (_ BitVec 32) V!15635 V!15635 (_ BitVec 32) (_ BitVec 64) V!15635 (_ BitVec 32) Int) Unit!12440)

(assert (=> b!421272 (= lt!193376 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!466 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421273 () Bool)

(declare-fun res!245839 () Bool)

(assert (=> b!421273 (=> (not res!245839) (not e!250807))))

(declare-fun arrayContainsKey!0 (array!25643 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!421273 (= res!245839 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17967 () Bool)

(declare-fun tp!34764 () Bool)

(assert (=> mapNonEmpty!17967 (= mapRes!17967 (and tp!34764 e!250808))))

(declare-fun mapValue!17967 () ValueCell!5105)

(declare-fun mapKey!17967 () (_ BitVec 32))

(declare-fun mapRest!17967 () (Array (_ BitVec 32) ValueCell!5105))

(assert (=> mapNonEmpty!17967 (= (arr!12272 _values!549) (store mapRest!17967 mapKey!17967 mapValue!17967))))

(declare-fun b!421274 () Bool)

(declare-fun res!245830 () Bool)

(assert (=> b!421274 (=> (not res!245830) (not e!250807))))

(assert (=> b!421274 (= res!245830 (and (= (size!12624 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12623 _keys!709) (size!12624 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!421275 () Bool)

(declare-fun res!245835 () Bool)

(declare-fun e!250814 () Bool)

(assert (=> b!421275 (=> (not res!245835) (not e!250814))))

(assert (=> b!421275 (= res!245835 (arrayNoDuplicates!0 lt!193372 #b00000000000000000000000000000000 Nil!7206))))

(declare-fun b!421276 () Bool)

(assert (=> b!421276 (= e!250807 e!250814)))

(declare-fun res!245838 () Bool)

(assert (=> b!421276 (=> (not res!245838) (not e!250814))))

(assert (=> b!421276 (= res!245838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193372 mask!1025))))

(assert (=> b!421276 (= lt!193372 (array!25644 (store (arr!12271 _keys!709) i!563 k!794) (size!12623 _keys!709)))))

(declare-fun bm!29411 () Bool)

(assert (=> bm!29411 (= call!29413 (getCurrentListMapNoExtraKeys!1277 (ite c!55331 lt!193372 _keys!709) (ite c!55331 lt!193373 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421277 () Bool)

(declare-fun res!245832 () Bool)

(assert (=> b!421277 (=> (not res!245832) (not e!250814))))

(assert (=> b!421277 (= res!245832 (bvsle from!863 i!563))))

(declare-fun b!421278 () Bool)

(declare-fun res!245836 () Bool)

(assert (=> b!421278 (=> (not res!245836) (not e!250807))))

(assert (=> b!421278 (= res!245836 (validKeyInArray!0 k!794))))

(declare-fun b!421279 () Bool)

(assert (=> b!421279 (= e!250814 e!250812)))

(declare-fun res!245829 () Bool)

(assert (=> b!421279 (=> (not res!245829) (not e!250812))))

(assert (=> b!421279 (= res!245829 (= from!863 i!563))))

(declare-fun lt!193374 () ListLongMap!6115)

(assert (=> b!421279 (= lt!193374 (getCurrentListMapNoExtraKeys!1277 lt!193372 lt!193373 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!421279 (= lt!193373 (array!25646 (store (arr!12272 _values!549) i!563 (ValueCellFull!5105 v!412)) (size!12624 _values!549)))))

(declare-fun lt!193370 () ListLongMap!6115)

(assert (=> b!421279 (= lt!193370 (getCurrentListMapNoExtraKeys!1277 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!421280 () Bool)

(assert (=> b!421280 (= e!250811 (and e!250809 mapRes!17967))))

(declare-fun condMapEmpty!17967 () Bool)

(declare-fun mapDefault!17967 () ValueCell!5105)

