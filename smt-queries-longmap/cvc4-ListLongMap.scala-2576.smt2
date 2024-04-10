; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39278 () Bool)

(assert start!39278)

(declare-fun b_free!9545 () Bool)

(declare-fun b_next!9545 () Bool)

(assert (=> start!39278 (= b_free!9545 (not b_next!9545))))

(declare-fun tp!34164 () Bool)

(declare-fun b_and!16965 () Bool)

(assert (=> start!39278 (= tp!34164 b_and!16965)))

(declare-fun b!415365 () Bool)

(declare-fun res!241639 () Bool)

(declare-fun e!248109 () Bool)

(assert (=> b!415365 (=> (not res!241639) (not e!248109))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!25251 0))(
  ( (array!25252 (arr!12075 (Array (_ BitVec 32) (_ BitVec 64))) (size!12427 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25251)

(assert (=> b!415365 (= res!241639 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12427 _keys!709))))))

(declare-fun b!415366 () Bool)

(declare-fun e!248112 () Bool)

(declare-fun tp_is_empty!10697 () Bool)

(assert (=> b!415366 (= e!248112 tp_is_empty!10697)))

(declare-fun mapNonEmpty!17667 () Bool)

(declare-fun mapRes!17667 () Bool)

(declare-fun tp!34163 () Bool)

(assert (=> mapNonEmpty!17667 (= mapRes!17667 (and tp!34163 e!248112))))

(declare-datatypes ((V!15367 0))(
  ( (V!15368 (val!5393 Int)) )
))
(declare-datatypes ((ValueCell!5005 0))(
  ( (ValueCellFull!5005 (v!7640 V!15367)) (EmptyCell!5005) )
))
(declare-fun mapRest!17667 () (Array (_ BitVec 32) ValueCell!5005))

(declare-datatypes ((array!25253 0))(
  ( (array!25254 (arr!12076 (Array (_ BitVec 32) ValueCell!5005)) (size!12428 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25253)

(declare-fun mapKey!17667 () (_ BitVec 32))

(declare-fun mapValue!17667 () ValueCell!5005)

(assert (=> mapNonEmpty!17667 (= (arr!12076 _values!549) (store mapRest!17667 mapKey!17667 mapValue!17667))))

(declare-fun b!415367 () Bool)

(declare-fun e!248113 () Bool)

(assert (=> b!415367 (= e!248113 true)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!190235 () array!25251)

(declare-fun minValue!515 () V!15367)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15367)

(declare-datatypes ((tuple2!7026 0))(
  ( (tuple2!7027 (_1!3524 (_ BitVec 64)) (_2!3524 V!15367)) )
))
(declare-datatypes ((List!7047 0))(
  ( (Nil!7044) (Cons!7043 (h!7899 tuple2!7026) (t!12257 List!7047)) )
))
(declare-datatypes ((ListLongMap!5939 0))(
  ( (ListLongMap!5940 (toList!2985 List!7047)) )
))
(declare-fun lt!190236 () ListLongMap!5939)

(declare-fun lt!190238 () array!25253)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun +!1189 (ListLongMap!5939 tuple2!7026) ListLongMap!5939)

(declare-fun getCurrentListMapNoExtraKeys!1191 (array!25251 array!25253 (_ BitVec 32) (_ BitVec 32) V!15367 V!15367 (_ BitVec 32) Int) ListLongMap!5939)

(declare-fun get!5961 (ValueCell!5005 V!15367) V!15367)

(declare-fun dynLambda!666 (Int (_ BitVec 64)) V!15367)

(assert (=> b!415367 (= lt!190236 (+!1189 (getCurrentListMapNoExtraKeys!1191 lt!190235 lt!190238 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7027 (select (arr!12075 lt!190235) from!863) (get!5961 (select (arr!12076 lt!190238) from!863) (dynLambda!666 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!415368 () Bool)

(declare-fun res!241628 () Bool)

(declare-fun e!248107 () Bool)

(assert (=> b!415368 (=> (not res!241628) (not e!248107))))

(assert (=> b!415368 (= res!241628 (bvsle from!863 i!563))))

(declare-fun b!415369 () Bool)

(declare-fun e!248115 () Bool)

(assert (=> b!415369 (= e!248115 (not e!248113))))

(declare-fun res!241641 () Bool)

(assert (=> b!415369 (=> res!241641 e!248113)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!415369 (= res!241641 (validKeyInArray!0 (select (arr!12075 _keys!709) from!863)))))

(declare-fun e!248110 () Bool)

(assert (=> b!415369 e!248110))

(declare-fun c!55031 () Bool)

(assert (=> b!415369 (= c!55031 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!15367)

(declare-datatypes ((Unit!12280 0))(
  ( (Unit!12281) )
))
(declare-fun lt!190237 () Unit!12280)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!398 (array!25251 array!25253 (_ BitVec 32) (_ BitVec 32) V!15367 V!15367 (_ BitVec 32) (_ BitVec 64) V!15367 (_ BitVec 32) Int) Unit!12280)

(assert (=> b!415369 (= lt!190237 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!398 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!28814 () ListLongMap!5939)

(declare-fun bm!28810 () Bool)

(assert (=> bm!28810 (= call!28814 (getCurrentListMapNoExtraKeys!1191 (ite c!55031 lt!190235 _keys!709) (ite c!55031 lt!190238 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415370 () Bool)

(declare-fun res!241638 () Bool)

(assert (=> b!415370 (=> (not res!241638) (not e!248109))))

(assert (=> b!415370 (= res!241638 (and (= (size!12428 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12427 _keys!709) (size!12428 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!241636 () Bool)

(assert (=> start!39278 (=> (not res!241636) (not e!248109))))

(assert (=> start!39278 (= res!241636 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12427 _keys!709))))))

(assert (=> start!39278 e!248109))

(assert (=> start!39278 tp_is_empty!10697))

(assert (=> start!39278 tp!34164))

(assert (=> start!39278 true))

(declare-fun e!248114 () Bool)

(declare-fun array_inv!8806 (array!25253) Bool)

(assert (=> start!39278 (and (array_inv!8806 _values!549) e!248114)))

(declare-fun array_inv!8807 (array!25251) Bool)

(assert (=> start!39278 (array_inv!8807 _keys!709)))

(declare-fun b!415371 () Bool)

(declare-fun res!241635 () Bool)

(assert (=> b!415371 (=> (not res!241635) (not e!248109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!415371 (= res!241635 (validMask!0 mask!1025))))

(declare-fun b!415372 () Bool)

(declare-fun res!241637 () Bool)

(assert (=> b!415372 (=> (not res!241637) (not e!248109))))

(declare-datatypes ((List!7048 0))(
  ( (Nil!7045) (Cons!7044 (h!7900 (_ BitVec 64)) (t!12258 List!7048)) )
))
(declare-fun arrayNoDuplicates!0 (array!25251 (_ BitVec 32) List!7048) Bool)

(assert (=> b!415372 (= res!241637 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7045))))

(declare-fun b!415373 () Bool)

(declare-fun res!241640 () Bool)

(assert (=> b!415373 (=> (not res!241640) (not e!248109))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25251 (_ BitVec 32)) Bool)

(assert (=> b!415373 (= res!241640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!17667 () Bool)

(assert (=> mapIsEmpty!17667 mapRes!17667))

(declare-fun b!415374 () Bool)

(declare-fun res!241632 () Bool)

(assert (=> b!415374 (=> (not res!241632) (not e!248109))))

(assert (=> b!415374 (= res!241632 (or (= (select (arr!12075 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12075 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!415375 () Bool)

(declare-fun call!28813 () ListLongMap!5939)

(assert (=> b!415375 (= e!248110 (= call!28813 call!28814))))

(declare-fun b!415376 () Bool)

(declare-fun e!248108 () Bool)

(assert (=> b!415376 (= e!248108 tp_is_empty!10697)))

(declare-fun bm!28811 () Bool)

(assert (=> bm!28811 (= call!28813 (getCurrentListMapNoExtraKeys!1191 (ite c!55031 _keys!709 lt!190235) (ite c!55031 _values!549 lt!190238) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415377 () Bool)

(declare-fun res!241633 () Bool)

(assert (=> b!415377 (=> (not res!241633) (not e!248107))))

(assert (=> b!415377 (= res!241633 (arrayNoDuplicates!0 lt!190235 #b00000000000000000000000000000000 Nil!7045))))

(declare-fun b!415378 () Bool)

(declare-fun res!241631 () Bool)

(assert (=> b!415378 (=> (not res!241631) (not e!248109))))

(declare-fun arrayContainsKey!0 (array!25251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!415378 (= res!241631 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!415379 () Bool)

(assert (=> b!415379 (= e!248110 (= call!28814 (+!1189 call!28813 (tuple2!7027 k!794 v!412))))))

(declare-fun b!415380 () Bool)

(assert (=> b!415380 (= e!248114 (and e!248108 mapRes!17667))))

(declare-fun condMapEmpty!17667 () Bool)

(declare-fun mapDefault!17667 () ValueCell!5005)

