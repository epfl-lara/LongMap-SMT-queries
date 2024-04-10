; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39266 () Bool)

(assert start!39266)

(declare-fun b_free!9533 () Bool)

(declare-fun b_next!9533 () Bool)

(assert (=> start!39266 (= b_free!9533 (not b_next!9533))))

(declare-fun tp!34127 () Bool)

(declare-fun b_and!16941 () Bool)

(assert (=> start!39266 (= tp!34127 b_and!16941)))

(declare-fun b!415011 () Bool)

(declare-fun res!241384 () Bool)

(declare-fun e!247953 () Bool)

(assert (=> b!415011 (=> (not res!241384) (not e!247953))))

(declare-datatypes ((array!25227 0))(
  ( (array!25228 (arr!12063 (Array (_ BitVec 32) (_ BitVec 64))) (size!12415 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25227)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25227 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!415011 (= res!241384 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!415012 () Bool)

(declare-fun res!241387 () Bool)

(assert (=> b!415012 (=> (not res!241387) (not e!247953))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25227 (_ BitVec 32)) Bool)

(assert (=> b!415012 (= res!241387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!415013 () Bool)

(declare-fun e!247950 () Bool)

(declare-fun e!247946 () Bool)

(assert (=> b!415013 (= e!247950 e!247946)))

(declare-fun res!241376 () Bool)

(assert (=> b!415013 (=> (not res!241376) (not e!247946))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!415013 (= res!241376 (= from!863 i!563))))

(declare-datatypes ((V!15351 0))(
  ( (V!15352 (val!5387 Int)) )
))
(declare-fun minValue!515 () V!15351)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!190148 () array!25227)

(declare-fun zeroValue!515 () V!15351)

(declare-datatypes ((ValueCell!4999 0))(
  ( (ValueCellFull!4999 (v!7634 V!15351)) (EmptyCell!4999) )
))
(declare-datatypes ((array!25229 0))(
  ( (array!25230 (arr!12064 (Array (_ BitVec 32) ValueCell!4999)) (size!12416 (_ BitVec 32))) )
))
(declare-fun lt!190144 () array!25229)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7014 0))(
  ( (tuple2!7015 (_1!3518 (_ BitVec 64)) (_2!3518 V!15351)) )
))
(declare-datatypes ((List!7036 0))(
  ( (Nil!7033) (Cons!7032 (h!7888 tuple2!7014) (t!12234 List!7036)) )
))
(declare-datatypes ((ListLongMap!5927 0))(
  ( (ListLongMap!5928 (toList!2979 List!7036)) )
))
(declare-fun lt!190147 () ListLongMap!5927)

(declare-fun getCurrentListMapNoExtraKeys!1185 (array!25227 array!25229 (_ BitVec 32) (_ BitVec 32) V!15351 V!15351 (_ BitVec 32) Int) ListLongMap!5927)

(assert (=> b!415013 (= lt!190147 (getCurrentListMapNoExtraKeys!1185 lt!190148 lt!190144 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25229)

(declare-fun v!412 () V!15351)

(assert (=> b!415013 (= lt!190144 (array!25230 (store (arr!12064 _values!549) i!563 (ValueCellFull!4999 v!412)) (size!12416 _values!549)))))

(declare-fun lt!190145 () ListLongMap!5927)

(assert (=> b!415013 (= lt!190145 (getCurrentListMapNoExtraKeys!1185 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!415014 () Bool)

(declare-fun res!241385 () Bool)

(assert (=> b!415014 (=> (not res!241385) (not e!247953))))

(assert (=> b!415014 (= res!241385 (or (= (select (arr!12063 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12063 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!415015 () Bool)

(declare-fun res!241386 () Bool)

(assert (=> b!415015 (=> (not res!241386) (not e!247950))))

(declare-datatypes ((List!7037 0))(
  ( (Nil!7034) (Cons!7033 (h!7889 (_ BitVec 64)) (t!12235 List!7037)) )
))
(declare-fun arrayNoDuplicates!0 (array!25227 (_ BitVec 32) List!7037) Bool)

(assert (=> b!415015 (= res!241386 (arrayNoDuplicates!0 lt!190148 #b00000000000000000000000000000000 Nil!7034))))

(declare-fun b!415016 () Bool)

(declare-fun res!241378 () Bool)

(assert (=> b!415016 (=> (not res!241378) (not e!247950))))

(assert (=> b!415016 (= res!241378 (bvsle from!863 i!563))))

(declare-fun b!415017 () Bool)

(assert (=> b!415017 (= e!247953 e!247950)))

(declare-fun res!241379 () Bool)

(assert (=> b!415017 (=> (not res!241379) (not e!247950))))

(assert (=> b!415017 (= res!241379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190148 mask!1025))))

(assert (=> b!415017 (= lt!190148 (array!25228 (store (arr!12063 _keys!709) i!563 k!794) (size!12415 _keys!709)))))

(declare-fun b!415018 () Bool)

(declare-fun res!241389 () Bool)

(assert (=> b!415018 (=> (not res!241389) (not e!247953))))

(assert (=> b!415018 (= res!241389 (and (= (size!12416 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12415 _keys!709) (size!12416 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!415019 () Bool)

(declare-fun e!247949 () Bool)

(assert (=> b!415019 (= e!247949 true)))

(declare-fun +!1184 (ListLongMap!5927 tuple2!7014) ListLongMap!5927)

(declare-fun get!5952 (ValueCell!4999 V!15351) V!15351)

(declare-fun dynLambda!661 (Int (_ BitVec 64)) V!15351)

(assert (=> b!415019 (= lt!190147 (+!1184 (getCurrentListMapNoExtraKeys!1185 lt!190148 lt!190144 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7015 (select (arr!12063 lt!190148) from!863) (get!5952 (select (arr!12064 lt!190144) from!863) (dynLambda!661 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!28774 () Bool)

(declare-fun call!28778 () ListLongMap!5927)

(declare-fun c!55013 () Bool)

(assert (=> bm!28774 (= call!28778 (getCurrentListMapNoExtraKeys!1185 (ite c!55013 lt!190148 _keys!709) (ite c!55013 lt!190144 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415020 () Bool)

(assert (=> b!415020 (= e!247946 (not e!247949))))

(declare-fun res!241382 () Bool)

(assert (=> b!415020 (=> res!241382 e!247949)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!415020 (= res!241382 (validKeyInArray!0 (select (arr!12063 _keys!709) from!863)))))

(declare-fun e!247951 () Bool)

(assert (=> b!415020 e!247951))

(assert (=> b!415020 (= c!55013 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12272 0))(
  ( (Unit!12273) )
))
(declare-fun lt!190146 () Unit!12272)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!394 (array!25227 array!25229 (_ BitVec 32) (_ BitVec 32) V!15351 V!15351 (_ BitVec 32) (_ BitVec 64) V!15351 (_ BitVec 32) Int) Unit!12272)

(assert (=> b!415020 (= lt!190146 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!394 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415021 () Bool)

(declare-fun e!247945 () Bool)

(declare-fun tp_is_empty!10685 () Bool)

(assert (=> b!415021 (= e!247945 tp_is_empty!10685)))

(declare-fun call!28777 () ListLongMap!5927)

(declare-fun bm!28775 () Bool)

(assert (=> bm!28775 (= call!28777 (getCurrentListMapNoExtraKeys!1185 (ite c!55013 _keys!709 lt!190148) (ite c!55013 _values!549 lt!190144) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17649 () Bool)

(declare-fun mapRes!17649 () Bool)

(declare-fun tp!34128 () Bool)

(assert (=> mapNonEmpty!17649 (= mapRes!17649 (and tp!34128 e!247945))))

(declare-fun mapRest!17649 () (Array (_ BitVec 32) ValueCell!4999))

(declare-fun mapValue!17649 () ValueCell!4999)

(declare-fun mapKey!17649 () (_ BitVec 32))

(assert (=> mapNonEmpty!17649 (= (arr!12064 _values!549) (store mapRest!17649 mapKey!17649 mapValue!17649))))

(declare-fun b!415022 () Bool)

(assert (=> b!415022 (= e!247951 (= call!28777 call!28778))))

(declare-fun mapIsEmpty!17649 () Bool)

(assert (=> mapIsEmpty!17649 mapRes!17649))

(declare-fun res!241381 () Bool)

(assert (=> start!39266 (=> (not res!241381) (not e!247953))))

(assert (=> start!39266 (= res!241381 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12415 _keys!709))))))

(assert (=> start!39266 e!247953))

(assert (=> start!39266 tp_is_empty!10685))

(assert (=> start!39266 tp!34127))

(assert (=> start!39266 true))

(declare-fun e!247947 () Bool)

(declare-fun array_inv!8800 (array!25229) Bool)

(assert (=> start!39266 (and (array_inv!8800 _values!549) e!247947)))

(declare-fun array_inv!8801 (array!25227) Bool)

(assert (=> start!39266 (array_inv!8801 _keys!709)))

(declare-fun b!415023 () Bool)

(declare-fun res!241380 () Bool)

(assert (=> b!415023 (=> (not res!241380) (not e!247953))))

(assert (=> b!415023 (= res!241380 (validKeyInArray!0 k!794))))

(declare-fun b!415024 () Bool)

(declare-fun e!247948 () Bool)

(assert (=> b!415024 (= e!247947 (and e!247948 mapRes!17649))))

(declare-fun condMapEmpty!17649 () Bool)

(declare-fun mapDefault!17649 () ValueCell!4999)

