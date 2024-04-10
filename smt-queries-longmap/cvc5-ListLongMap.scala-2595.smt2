; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39388 () Bool)

(assert start!39388)

(declare-fun b_free!9655 () Bool)

(declare-fun b_next!9655 () Bool)

(assert (=> start!39388 (= b_free!9655 (not b_next!9655))))

(declare-fun tp!34494 () Bool)

(declare-fun b_and!17185 () Bool)

(assert (=> start!39388 (= tp!34494 b_and!17185)))

(declare-fun b!418610 () Bool)

(declare-fun res!243942 () Bool)

(declare-fun e!249597 () Bool)

(assert (=> b!418610 (=> (not res!243942) (not e!249597))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!25465 0))(
  ( (array!25466 (arr!12182 (Array (_ BitVec 32) (_ BitVec 64))) (size!12534 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25465)

(assert (=> b!418610 (= res!243942 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12534 _keys!709))))))

(declare-fun mapIsEmpty!17832 () Bool)

(declare-fun mapRes!17832 () Bool)

(assert (=> mapIsEmpty!17832 mapRes!17832))

(declare-fun res!243941 () Bool)

(assert (=> start!39388 (=> (not res!243941) (not e!249597))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39388 (= res!243941 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12534 _keys!709))))))

(assert (=> start!39388 e!249597))

(declare-fun tp_is_empty!10807 () Bool)

(assert (=> start!39388 tp_is_empty!10807))

(assert (=> start!39388 tp!34494))

(assert (=> start!39388 true))

(declare-datatypes ((V!15515 0))(
  ( (V!15516 (val!5448 Int)) )
))
(declare-datatypes ((ValueCell!5060 0))(
  ( (ValueCellFull!5060 (v!7695 V!15515)) (EmptyCell!5060) )
))
(declare-datatypes ((array!25467 0))(
  ( (array!25468 (arr!12183 (Array (_ BitVec 32) ValueCell!5060)) (size!12535 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25467)

(declare-fun e!249593 () Bool)

(declare-fun array_inv!8882 (array!25467) Bool)

(assert (=> start!39388 (and (array_inv!8882 _values!549) e!249593)))

(declare-fun array_inv!8883 (array!25465) Bool)

(assert (=> start!39388 (array_inv!8883 _keys!709)))

(declare-fun b!418611 () Bool)

(declare-fun e!249594 () Bool)

(assert (=> b!418611 (= e!249597 e!249594)))

(declare-fun res!243947 () Bool)

(assert (=> b!418611 (=> (not res!243947) (not e!249594))))

(declare-fun lt!191891 () array!25465)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25465 (_ BitVec 32)) Bool)

(assert (=> b!418611 (= res!243947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191891 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!418611 (= lt!191891 (array!25466 (store (arr!12182 _keys!709) i!563 k!794) (size!12534 _keys!709)))))

(declare-fun b!418612 () Bool)

(declare-fun e!249592 () Bool)

(assert (=> b!418612 (= e!249594 e!249592)))

(declare-fun res!243938 () Bool)

(assert (=> b!418612 (=> (not res!243938) (not e!249592))))

(assert (=> b!418612 (= res!243938 (= from!863 i!563))))

(declare-fun minValue!515 () V!15515)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15515)

(declare-datatypes ((tuple2!7126 0))(
  ( (tuple2!7127 (_1!3574 (_ BitVec 64)) (_2!3574 V!15515)) )
))
(declare-datatypes ((List!7139 0))(
  ( (Nil!7136) (Cons!7135 (h!7991 tuple2!7126) (t!12459 List!7139)) )
))
(declare-datatypes ((ListLongMap!6039 0))(
  ( (ListLongMap!6040 (toList!3035 List!7139)) )
))
(declare-fun lt!191882 () ListLongMap!6039)

(declare-fun lt!191886 () array!25467)

(declare-fun getCurrentListMapNoExtraKeys!1240 (array!25465 array!25467 (_ BitVec 32) (_ BitVec 32) V!15515 V!15515 (_ BitVec 32) Int) ListLongMap!6039)

(assert (=> b!418612 (= lt!191882 (getCurrentListMapNoExtraKeys!1240 lt!191891 lt!191886 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15515)

(assert (=> b!418612 (= lt!191886 (array!25468 (store (arr!12183 _values!549) i!563 (ValueCellFull!5060 v!412)) (size!12535 _values!549)))))

(declare-fun lt!191885 () ListLongMap!6039)

(assert (=> b!418612 (= lt!191885 (getCurrentListMapNoExtraKeys!1240 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!418613 () Bool)

(declare-fun res!243950 () Bool)

(assert (=> b!418613 (=> (not res!243950) (not e!249597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!418613 (= res!243950 (validMask!0 mask!1025))))

(declare-fun b!418614 () Bool)

(declare-fun res!243948 () Bool)

(assert (=> b!418614 (=> (not res!243948) (not e!249597))))

(declare-datatypes ((List!7140 0))(
  ( (Nil!7137) (Cons!7136 (h!7992 (_ BitVec 64)) (t!12460 List!7140)) )
))
(declare-fun arrayNoDuplicates!0 (array!25465 (_ BitVec 32) List!7140) Bool)

(assert (=> b!418614 (= res!243948 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7137))))

(declare-fun b!418615 () Bool)

(declare-fun res!243946 () Bool)

(assert (=> b!418615 (=> (not res!243946) (not e!249597))))

(assert (=> b!418615 (= res!243946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!418616 () Bool)

(declare-fun res!243945 () Bool)

(assert (=> b!418616 (=> (not res!243945) (not e!249594))))

(assert (=> b!418616 (= res!243945 (bvsle from!863 i!563))))

(declare-fun b!418617 () Bool)

(declare-fun res!243943 () Bool)

(assert (=> b!418617 (=> (not res!243943) (not e!249597))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!418617 (= res!243943 (validKeyInArray!0 k!794))))

(declare-fun b!418618 () Bool)

(declare-fun res!243944 () Bool)

(assert (=> b!418618 (=> (not res!243944) (not e!249597))))

(declare-fun arrayContainsKey!0 (array!25465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!418618 (= res!243944 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!418619 () Bool)

(declare-fun res!243951 () Bool)

(assert (=> b!418619 (=> (not res!243951) (not e!249597))))

(assert (=> b!418619 (= res!243951 (or (= (select (arr!12182 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12182 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!418620 () Bool)

(declare-fun e!249599 () Bool)

(assert (=> b!418620 (= e!249599 true)))

(declare-fun lt!191889 () V!15515)

(declare-fun lt!191883 () tuple2!7126)

(declare-fun lt!191888 () ListLongMap!6039)

(declare-fun +!1234 (ListLongMap!6039 tuple2!7126) ListLongMap!6039)

(assert (=> b!418620 (= (+!1234 lt!191888 lt!191883) (+!1234 (+!1234 lt!191888 (tuple2!7127 k!794 lt!191889)) lt!191883))))

(declare-fun lt!191887 () V!15515)

(assert (=> b!418620 (= lt!191883 (tuple2!7127 k!794 lt!191887))))

(declare-datatypes ((Unit!12372 0))(
  ( (Unit!12373) )
))
(declare-fun lt!191890 () Unit!12372)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!34 (ListLongMap!6039 (_ BitVec 64) V!15515 V!15515) Unit!12372)

(assert (=> b!418620 (= lt!191890 (addSameAsAddTwiceSameKeyDiffValues!34 lt!191888 k!794 lt!191889 lt!191887))))

(declare-fun lt!191884 () V!15515)

(declare-fun get!6038 (ValueCell!5060 V!15515) V!15515)

(assert (=> b!418620 (= lt!191889 (get!6038 (select (arr!12183 _values!549) from!863) lt!191884))))

(assert (=> b!418620 (= lt!191882 (+!1234 lt!191888 (tuple2!7127 (select (arr!12182 lt!191891) from!863) lt!191887)))))

(assert (=> b!418620 (= lt!191887 (get!6038 (select (store (arr!12183 _values!549) i!563 (ValueCellFull!5060 v!412)) from!863) lt!191884))))

(declare-fun dynLambda!705 (Int (_ BitVec 64)) V!15515)

(assert (=> b!418620 (= lt!191884 (dynLambda!705 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!418620 (= lt!191888 (getCurrentListMapNoExtraKeys!1240 lt!191891 lt!191886 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418621 () Bool)

(declare-fun res!243949 () Bool)

(assert (=> b!418621 (=> (not res!243949) (not e!249597))))

(assert (=> b!418621 (= res!243949 (and (= (size!12535 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12534 _keys!709) (size!12535 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!418622 () Bool)

(assert (=> b!418622 (= e!249592 (not e!249599))))

(declare-fun res!243939 () Bool)

(assert (=> b!418622 (=> res!243939 e!249599)))

(assert (=> b!418622 (= res!243939 (validKeyInArray!0 (select (arr!12182 _keys!709) from!863)))))

(declare-fun e!249598 () Bool)

(assert (=> b!418622 e!249598))

(declare-fun c!55196 () Bool)

(assert (=> b!418622 (= c!55196 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!191881 () Unit!12372)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!437 (array!25465 array!25467 (_ BitVec 32) (_ BitVec 32) V!15515 V!15515 (_ BitVec 32) (_ BitVec 64) V!15515 (_ BitVec 32) Int) Unit!12372)

(assert (=> b!418622 (= lt!191881 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!437 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418623 () Bool)

(declare-fun e!249596 () Bool)

(assert (=> b!418623 (= e!249596 tp_is_empty!10807)))

(declare-fun bm!29140 () Bool)

(declare-fun call!29143 () ListLongMap!6039)

(assert (=> bm!29140 (= call!29143 (getCurrentListMapNoExtraKeys!1240 (ite c!55196 _keys!709 lt!191891) (ite c!55196 _values!549 lt!191886) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17832 () Bool)

(declare-fun tp!34493 () Bool)

(assert (=> mapNonEmpty!17832 (= mapRes!17832 (and tp!34493 e!249596))))

(declare-fun mapRest!17832 () (Array (_ BitVec 32) ValueCell!5060))

(declare-fun mapKey!17832 () (_ BitVec 32))

(declare-fun mapValue!17832 () ValueCell!5060)

(assert (=> mapNonEmpty!17832 (= (arr!12183 _values!549) (store mapRest!17832 mapKey!17832 mapValue!17832))))

(declare-fun call!29144 () ListLongMap!6039)

(declare-fun bm!29141 () Bool)

(assert (=> bm!29141 (= call!29144 (getCurrentListMapNoExtraKeys!1240 (ite c!55196 lt!191891 _keys!709) (ite c!55196 lt!191886 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418624 () Bool)

(assert (=> b!418624 (= e!249598 (= call!29143 call!29144))))

(declare-fun b!418625 () Bool)

(declare-fun e!249595 () Bool)

(assert (=> b!418625 (= e!249593 (and e!249595 mapRes!17832))))

(declare-fun condMapEmpty!17832 () Bool)

(declare-fun mapDefault!17832 () ValueCell!5060)

