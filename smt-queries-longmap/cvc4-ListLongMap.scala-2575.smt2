; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39272 () Bool)

(assert start!39272)

(declare-fun b_free!9539 () Bool)

(declare-fun b_next!9539 () Bool)

(assert (=> start!39272 (= b_free!9539 (not b_next!9539))))

(declare-fun tp!34146 () Bool)

(declare-fun b_and!16953 () Bool)

(assert (=> start!39272 (= tp!34146 b_and!16953)))

(declare-fun b!415188 () Bool)

(declare-fun e!248028 () Bool)

(declare-fun e!248031 () Bool)

(assert (=> b!415188 (= e!248028 e!248031)))

(declare-fun res!241503 () Bool)

(assert (=> b!415188 (=> (not res!241503) (not e!248031))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!415188 (= res!241503 (= from!863 i!563))))

(declare-datatypes ((V!15359 0))(
  ( (V!15360 (val!5390 Int)) )
))
(declare-fun minValue!515 () V!15359)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7020 0))(
  ( (tuple2!7021 (_1!3521 (_ BitVec 64)) (_2!3521 V!15359)) )
))
(declare-datatypes ((List!7042 0))(
  ( (Nil!7039) (Cons!7038 (h!7894 tuple2!7020) (t!12246 List!7042)) )
))
(declare-datatypes ((ListLongMap!5933 0))(
  ( (ListLongMap!5934 (toList!2982 List!7042)) )
))
(declare-fun lt!190192 () ListLongMap!5933)

(declare-fun zeroValue!515 () V!15359)

(declare-datatypes ((ValueCell!5002 0))(
  ( (ValueCellFull!5002 (v!7637 V!15359)) (EmptyCell!5002) )
))
(declare-datatypes ((array!25239 0))(
  ( (array!25240 (arr!12069 (Array (_ BitVec 32) ValueCell!5002)) (size!12421 (_ BitVec 32))) )
))
(declare-fun lt!190191 () array!25239)

(declare-datatypes ((array!25241 0))(
  ( (array!25242 (arr!12070 (Array (_ BitVec 32) (_ BitVec 64))) (size!12422 (_ BitVec 32))) )
))
(declare-fun lt!190189 () array!25241)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1188 (array!25241 array!25239 (_ BitVec 32) (_ BitVec 32) V!15359 V!15359 (_ BitVec 32) Int) ListLongMap!5933)

(assert (=> b!415188 (= lt!190192 (getCurrentListMapNoExtraKeys!1188 lt!190189 lt!190191 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25239)

(declare-fun v!412 () V!15359)

(assert (=> b!415188 (= lt!190191 (array!25240 (store (arr!12069 _values!549) i!563 (ValueCellFull!5002 v!412)) (size!12421 _values!549)))))

(declare-fun lt!190190 () ListLongMap!5933)

(declare-fun _keys!709 () array!25241)

(assert (=> b!415188 (= lt!190190 (getCurrentListMapNoExtraKeys!1188 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!415189 () Bool)

(declare-fun e!248026 () Bool)

(assert (=> b!415189 (= e!248031 (not e!248026))))

(declare-fun res!241510 () Bool)

(assert (=> b!415189 (=> res!241510 e!248026)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!415189 (= res!241510 (validKeyInArray!0 (select (arr!12070 _keys!709) from!863)))))

(declare-fun e!248034 () Bool)

(assert (=> b!415189 e!248034))

(declare-fun c!55022 () Bool)

(assert (=> b!415189 (= c!55022 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12276 0))(
  ( (Unit!12277) )
))
(declare-fun lt!190193 () Unit!12276)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!396 (array!25241 array!25239 (_ BitVec 32) (_ BitVec 32) V!15359 V!15359 (_ BitVec 32) (_ BitVec 64) V!15359 (_ BitVec 32) Int) Unit!12276)

(assert (=> b!415189 (= lt!190193 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!396 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415190 () Bool)

(declare-fun res!241502 () Bool)

(declare-fun e!248033 () Bool)

(assert (=> b!415190 (=> (not res!241502) (not e!248033))))

(assert (=> b!415190 (= res!241502 (validKeyInArray!0 k!794))))

(declare-fun mapNonEmpty!17658 () Bool)

(declare-fun mapRes!17658 () Bool)

(declare-fun tp!34145 () Bool)

(declare-fun e!248027 () Bool)

(assert (=> mapNonEmpty!17658 (= mapRes!17658 (and tp!34145 e!248027))))

(declare-fun mapRest!17658 () (Array (_ BitVec 32) ValueCell!5002))

(declare-fun mapKey!17658 () (_ BitVec 32))

(declare-fun mapValue!17658 () ValueCell!5002)

(assert (=> mapNonEmpty!17658 (= (arr!12069 _values!549) (store mapRest!17658 mapKey!17658 mapValue!17658))))

(declare-fun b!415191 () Bool)

(declare-fun tp_is_empty!10691 () Bool)

(assert (=> b!415191 (= e!248027 tp_is_empty!10691)))

(declare-fun b!415192 () Bool)

(declare-fun res!241506 () Bool)

(assert (=> b!415192 (=> (not res!241506) (not e!248028))))

(assert (=> b!415192 (= res!241506 (bvsle from!863 i!563))))

(declare-fun b!415194 () Bool)

(declare-fun res!241511 () Bool)

(assert (=> b!415194 (=> (not res!241511) (not e!248033))))

(assert (=> b!415194 (= res!241511 (and (= (size!12421 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12422 _keys!709) (size!12421 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!415195 () Bool)

(declare-fun call!28796 () ListLongMap!5933)

(declare-fun call!28795 () ListLongMap!5933)

(declare-fun +!1186 (ListLongMap!5933 tuple2!7020) ListLongMap!5933)

(assert (=> b!415195 (= e!248034 (= call!28796 (+!1186 call!28795 (tuple2!7021 k!794 v!412))))))

(declare-fun b!415196 () Bool)

(declare-fun res!241505 () Bool)

(assert (=> b!415196 (=> (not res!241505) (not e!248033))))

(declare-fun arrayContainsKey!0 (array!25241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!415196 (= res!241505 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!415197 () Bool)

(assert (=> b!415197 (= e!248026 true)))

(declare-fun get!5956 (ValueCell!5002 V!15359) V!15359)

(declare-fun dynLambda!663 (Int (_ BitVec 64)) V!15359)

(assert (=> b!415197 (= lt!190192 (+!1186 (getCurrentListMapNoExtraKeys!1188 lt!190189 lt!190191 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7021 (select (arr!12070 lt!190189) from!863) (get!5956 (select (arr!12069 lt!190191) from!863) (dynLambda!663 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!415198 () Bool)

(declare-fun e!248032 () Bool)

(assert (=> b!415198 (= e!248032 tp_is_empty!10691)))

(declare-fun bm!28792 () Bool)

(assert (=> bm!28792 (= call!28796 (getCurrentListMapNoExtraKeys!1188 (ite c!55022 lt!190189 _keys!709) (ite c!55022 lt!190191 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415199 () Bool)

(declare-fun e!248030 () Bool)

(assert (=> b!415199 (= e!248030 (and e!248032 mapRes!17658))))

(declare-fun condMapEmpty!17658 () Bool)

(declare-fun mapDefault!17658 () ValueCell!5002)

