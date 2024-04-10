; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39220 () Bool)

(assert start!39220)

(declare-fun b_free!9487 () Bool)

(declare-fun b_next!9487 () Bool)

(assert (=> start!39220 (= b_free!9487 (not b_next!9487))))

(declare-fun tp!33989 () Bool)

(declare-fun b_and!16873 () Bool)

(assert (=> start!39220 (= tp!33989 b_and!16873)))

(declare-fun b!413703 () Bool)

(declare-fun e!247350 () Bool)

(declare-fun e!247355 () Bool)

(assert (=> b!413703 (= e!247350 e!247355)))

(declare-fun res!240435 () Bool)

(assert (=> b!413703 (=> (not res!240435) (not e!247355))))

(declare-datatypes ((array!25135 0))(
  ( (array!25136 (arr!12017 (Array (_ BitVec 32) (_ BitVec 64))) (size!12369 (_ BitVec 32))) )
))
(declare-fun lt!189801 () array!25135)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25135 (_ BitVec 32)) Bool)

(assert (=> b!413703 (= res!240435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189801 mask!1025))))

(declare-fun _keys!709 () array!25135)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!413703 (= lt!189801 (array!25136 (store (arr!12017 _keys!709) i!563 k!794) (size!12369 _keys!709)))))

(declare-fun b!413704 () Bool)

(declare-fun res!240442 () Bool)

(assert (=> b!413704 (=> (not res!240442) (not e!247350))))

(declare-fun arrayContainsKey!0 (array!25135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!413704 (= res!240442 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!413705 () Bool)

(declare-fun res!240443 () Bool)

(assert (=> b!413705 (=> (not res!240443) (not e!247355))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!413705 (= res!240443 (bvsle from!863 i!563))))

(declare-fun b!413706 () Bool)

(declare-fun res!240447 () Bool)

(assert (=> b!413706 (=> (not res!240447) (not e!247350))))

(declare-datatypes ((V!15291 0))(
  ( (V!15292 (val!5364 Int)) )
))
(declare-datatypes ((ValueCell!4976 0))(
  ( (ValueCellFull!4976 (v!7611 V!15291)) (EmptyCell!4976) )
))
(declare-datatypes ((array!25137 0))(
  ( (array!25138 (arr!12018 (Array (_ BitVec 32) ValueCell!4976)) (size!12370 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25137)

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!413706 (= res!240447 (and (= (size!12370 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12369 _keys!709) (size!12370 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!413707 () Bool)

(declare-fun e!247354 () Bool)

(declare-fun tp_is_empty!10639 () Bool)

(assert (=> b!413707 (= e!247354 tp_is_empty!10639)))

(declare-fun b!413708 () Bool)

(declare-fun e!247351 () Bool)

(assert (=> b!413708 (= e!247355 e!247351)))

(declare-fun res!240441 () Bool)

(assert (=> b!413708 (=> (not res!240441) (not e!247351))))

(assert (=> b!413708 (= res!240441 (= from!863 i!563))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!6972 0))(
  ( (tuple2!6973 (_1!3497 (_ BitVec 64)) (_2!3497 V!15291)) )
))
(declare-datatypes ((List!6996 0))(
  ( (Nil!6993) (Cons!6992 (h!7848 tuple2!6972) (t!12170 List!6996)) )
))
(declare-datatypes ((ListLongMap!5885 0))(
  ( (ListLongMap!5886 (toList!2958 List!6996)) )
))
(declare-fun lt!189803 () ListLongMap!5885)

(declare-fun zeroValue!515 () V!15291)

(declare-fun lt!189802 () array!25137)

(declare-fun minValue!515 () V!15291)

(declare-fun getCurrentListMapNoExtraKeys!1165 (array!25135 array!25137 (_ BitVec 32) (_ BitVec 32) V!15291 V!15291 (_ BitVec 32) Int) ListLongMap!5885)

(assert (=> b!413708 (= lt!189803 (getCurrentListMapNoExtraKeys!1165 lt!189801 lt!189802 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15291)

(assert (=> b!413708 (= lt!189802 (array!25138 (store (arr!12018 _values!549) i!563 (ValueCellFull!4976 v!412)) (size!12370 _values!549)))))

(declare-fun lt!189800 () ListLongMap!5885)

(assert (=> b!413708 (= lt!189800 (getCurrentListMapNoExtraKeys!1165 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun call!28639 () ListLongMap!5885)

(declare-fun bm!28636 () Bool)

(declare-fun c!54944 () Bool)

(assert (=> bm!28636 (= call!28639 (getCurrentListMapNoExtraKeys!1165 (ite c!54944 lt!189801 _keys!709) (ite c!54944 lt!189802 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!240436 () Bool)

(assert (=> start!39220 (=> (not res!240436) (not e!247350))))

(assert (=> start!39220 (= res!240436 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12369 _keys!709))))))

(assert (=> start!39220 e!247350))

(assert (=> start!39220 tp_is_empty!10639))

(assert (=> start!39220 tp!33989))

(assert (=> start!39220 true))

(declare-fun e!247349 () Bool)

(declare-fun array_inv!8764 (array!25137) Bool)

(assert (=> start!39220 (and (array_inv!8764 _values!549) e!247349)))

(declare-fun array_inv!8765 (array!25135) Bool)

(assert (=> start!39220 (array_inv!8765 _keys!709)))

(declare-fun b!413709 () Bool)

(declare-fun res!240446 () Bool)

(assert (=> b!413709 (=> (not res!240446) (not e!247350))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!413709 (= res!240446 (validKeyInArray!0 k!794))))

(declare-fun b!413710 () Bool)

(declare-fun res!240439 () Bool)

(assert (=> b!413710 (=> (not res!240439) (not e!247350))))

(assert (=> b!413710 (= res!240439 (or (= (select (arr!12017 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12017 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17580 () Bool)

(declare-fun mapRes!17580 () Bool)

(assert (=> mapIsEmpty!17580 mapRes!17580))

(declare-fun b!413711 () Bool)

(declare-fun res!240444 () Bool)

(assert (=> b!413711 (=> (not res!240444) (not e!247350))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!413711 (= res!240444 (validMask!0 mask!1025))))

(declare-fun b!413712 () Bool)

(declare-fun res!240437 () Bool)

(assert (=> b!413712 (=> (not res!240437) (not e!247350))))

(assert (=> b!413712 (= res!240437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!413713 () Bool)

(assert (=> b!413713 (= e!247351 (not true))))

(declare-fun e!247356 () Bool)

(assert (=> b!413713 e!247356))

(assert (=> b!413713 (= c!54944 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12240 0))(
  ( (Unit!12241) )
))
(declare-fun lt!189799 () Unit!12240)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!378 (array!25135 array!25137 (_ BitVec 32) (_ BitVec 32) V!15291 V!15291 (_ BitVec 32) (_ BitVec 64) V!15291 (_ BitVec 32) Int) Unit!12240)

(assert (=> b!413713 (= lt!189799 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!378 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413714 () Bool)

(declare-fun e!247353 () Bool)

(assert (=> b!413714 (= e!247349 (and e!247353 mapRes!17580))))

(declare-fun condMapEmpty!17580 () Bool)

(declare-fun mapDefault!17580 () ValueCell!4976)

