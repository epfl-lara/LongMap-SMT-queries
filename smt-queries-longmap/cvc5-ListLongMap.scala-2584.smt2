; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39322 () Bool)

(assert start!39322)

(declare-fun b_free!9589 () Bool)

(declare-fun b_next!9589 () Bool)

(assert (=> start!39322 (= b_free!9589 (not b_next!9589))))

(declare-fun tp!34295 () Bool)

(declare-fun b_and!17053 () Bool)

(assert (=> start!39322 (= tp!34295 b_and!17053)))

(declare-fun b!416663 () Bool)

(declare-fun e!248701 () Bool)

(declare-fun e!248705 () Bool)

(assert (=> b!416663 (= e!248701 e!248705)))

(declare-fun res!242564 () Bool)

(assert (=> b!416663 (=> (not res!242564) (not e!248705))))

(declare-datatypes ((array!25337 0))(
  ( (array!25338 (arr!12118 (Array (_ BitVec 32) (_ BitVec 64))) (size!12470 (_ BitVec 32))) )
))
(declare-fun lt!190799 () array!25337)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25337 (_ BitVec 32)) Bool)

(assert (=> b!416663 (= res!242564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190799 mask!1025))))

(declare-fun _keys!709 () array!25337)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!416663 (= lt!190799 (array!25338 (store (arr!12118 _keys!709) i!563 k!794) (size!12470 _keys!709)))))

(declare-fun b!416664 () Bool)

(declare-fun res!242563 () Bool)

(assert (=> b!416664 (=> (not res!242563) (not e!248705))))

(declare-datatypes ((List!7082 0))(
  ( (Nil!7079) (Cons!7078 (h!7934 (_ BitVec 64)) (t!12336 List!7082)) )
))
(declare-fun arrayNoDuplicates!0 (array!25337 (_ BitVec 32) List!7082) Bool)

(assert (=> b!416664 (= res!242563 (arrayNoDuplicates!0 lt!190799 #b00000000000000000000000000000000 Nil!7079))))

(declare-fun b!416666 () Bool)

(declare-fun e!248702 () Bool)

(assert (=> b!416666 (= e!248705 e!248702)))

(declare-fun res!242553 () Bool)

(assert (=> b!416666 (=> (not res!242553) (not e!248702))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!416666 (= res!242553 (= from!863 i!563))))

(declare-datatypes ((V!15427 0))(
  ( (V!15428 (val!5415 Int)) )
))
(declare-fun minValue!515 () V!15427)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15427)

(declare-datatypes ((ValueCell!5027 0))(
  ( (ValueCellFull!5027 (v!7662 V!15427)) (EmptyCell!5027) )
))
(declare-datatypes ((array!25339 0))(
  ( (array!25340 (arr!12119 (Array (_ BitVec 32) ValueCell!5027)) (size!12471 (_ BitVec 32))) )
))
(declare-fun lt!190800 () array!25339)

(declare-datatypes ((tuple2!7064 0))(
  ( (tuple2!7065 (_1!3543 (_ BitVec 64)) (_2!3543 V!15427)) )
))
(declare-datatypes ((List!7083 0))(
  ( (Nil!7080) (Cons!7079 (h!7935 tuple2!7064) (t!12337 List!7083)) )
))
(declare-datatypes ((ListLongMap!5977 0))(
  ( (ListLongMap!5978 (toList!3004 List!7083)) )
))
(declare-fun lt!190801 () ListLongMap!5977)

(declare-fun getCurrentListMapNoExtraKeys!1209 (array!25337 array!25339 (_ BitVec 32) (_ BitVec 32) V!15427 V!15427 (_ BitVec 32) Int) ListLongMap!5977)

(assert (=> b!416666 (= lt!190801 (getCurrentListMapNoExtraKeys!1209 lt!190799 lt!190800 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25339)

(declare-fun v!412 () V!15427)

(assert (=> b!416666 (= lt!190800 (array!25340 (store (arr!12119 _values!549) i!563 (ValueCellFull!5027 v!412)) (size!12471 _values!549)))))

(declare-fun lt!190796 () ListLongMap!5977)

(assert (=> b!416666 (= lt!190796 (getCurrentListMapNoExtraKeys!1209 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun call!28946 () ListLongMap!5977)

(declare-fun bm!28942 () Bool)

(declare-fun c!55097 () Bool)

(assert (=> bm!28942 (= call!28946 (getCurrentListMapNoExtraKeys!1209 (ite c!55097 lt!190799 _keys!709) (ite c!55097 lt!190800 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416667 () Bool)

(declare-fun e!248709 () Bool)

(declare-fun call!28945 () ListLongMap!5977)

(assert (=> b!416667 (= e!248709 (= call!28945 call!28946))))

(declare-fun mapNonEmpty!17733 () Bool)

(declare-fun mapRes!17733 () Bool)

(declare-fun tp!34296 () Bool)

(declare-fun e!248708 () Bool)

(assert (=> mapNonEmpty!17733 (= mapRes!17733 (and tp!34296 e!248708))))

(declare-fun mapValue!17733 () ValueCell!5027)

(declare-fun mapKey!17733 () (_ BitVec 32))

(declare-fun mapRest!17733 () (Array (_ BitVec 32) ValueCell!5027))

(assert (=> mapNonEmpty!17733 (= (arr!12119 _values!549) (store mapRest!17733 mapKey!17733 mapValue!17733))))

(declare-fun bm!28943 () Bool)

(assert (=> bm!28943 (= call!28945 (getCurrentListMapNoExtraKeys!1209 (ite c!55097 _keys!709 lt!190799) (ite c!55097 _values!549 lt!190800) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416668 () Bool)

(declare-fun e!248707 () Bool)

(declare-fun tp_is_empty!10741 () Bool)

(assert (=> b!416668 (= e!248707 tp_is_empty!10741)))

(declare-fun res!242557 () Bool)

(assert (=> start!39322 (=> (not res!242557) (not e!248701))))

(assert (=> start!39322 (= res!242557 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12470 _keys!709))))))

(assert (=> start!39322 e!248701))

(assert (=> start!39322 tp_is_empty!10741))

(assert (=> start!39322 tp!34295))

(assert (=> start!39322 true))

(declare-fun e!248704 () Bool)

(declare-fun array_inv!8838 (array!25339) Bool)

(assert (=> start!39322 (and (array_inv!8838 _values!549) e!248704)))

(declare-fun array_inv!8839 (array!25337) Bool)

(assert (=> start!39322 (array_inv!8839 _keys!709)))

(declare-fun b!416665 () Bool)

(declare-fun res!242552 () Bool)

(assert (=> b!416665 (=> (not res!242552) (not e!248701))))

(assert (=> b!416665 (= res!242552 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12470 _keys!709))))))

(declare-fun b!416669 () Bool)

(declare-fun e!248703 () Bool)

(assert (=> b!416669 (= e!248702 (not e!248703))))

(declare-fun res!242560 () Bool)

(assert (=> b!416669 (=> res!242560 e!248703)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!416669 (= res!242560 (validKeyInArray!0 (select (arr!12118 _keys!709) from!863)))))

(assert (=> b!416669 e!248709))

(assert (=> b!416669 (= c!55097 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12316 0))(
  ( (Unit!12317) )
))
(declare-fun lt!190797 () Unit!12316)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!414 (array!25337 array!25339 (_ BitVec 32) (_ BitVec 32) V!15427 V!15427 (_ BitVec 32) (_ BitVec 64) V!15427 (_ BitVec 32) Int) Unit!12316)

(assert (=> b!416669 (= lt!190797 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!414 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416670 () Bool)

(assert (=> b!416670 (= e!248703 true)))

(declare-fun lt!190793 () tuple2!7064)

(declare-fun lt!190798 () V!15427)

(declare-fun lt!190802 () ListLongMap!5977)

(declare-fun +!1206 (ListLongMap!5977 tuple2!7064) ListLongMap!5977)

(assert (=> b!416670 (= (+!1206 lt!190802 lt!190793) (+!1206 (+!1206 lt!190802 (tuple2!7065 k!794 lt!190798)) lt!190793))))

(declare-fun lt!190794 () V!15427)

(assert (=> b!416670 (= lt!190793 (tuple2!7065 k!794 lt!190794))))

(declare-fun lt!190792 () Unit!12316)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!10 (ListLongMap!5977 (_ BitVec 64) V!15427 V!15427) Unit!12316)

(assert (=> b!416670 (= lt!190792 (addSameAsAddTwiceSameKeyDiffValues!10 lt!190802 k!794 lt!190798 lt!190794))))

(declare-fun lt!190795 () V!15427)

(declare-fun get!5992 (ValueCell!5027 V!15427) V!15427)

(assert (=> b!416670 (= lt!190798 (get!5992 (select (arr!12119 _values!549) from!863) lt!190795))))

(assert (=> b!416670 (= lt!190801 (+!1206 lt!190802 (tuple2!7065 (select (arr!12118 lt!190799) from!863) lt!190794)))))

(assert (=> b!416670 (= lt!190794 (get!5992 (select (store (arr!12119 _values!549) i!563 (ValueCellFull!5027 v!412)) from!863) lt!190795))))

(declare-fun dynLambda!681 (Int (_ BitVec 64)) V!15427)

(assert (=> b!416670 (= lt!190795 (dynLambda!681 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!416670 (= lt!190802 (getCurrentListMapNoExtraKeys!1209 lt!190799 lt!190800 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17733 () Bool)

(assert (=> mapIsEmpty!17733 mapRes!17733))

(declare-fun b!416671 () Bool)

(declare-fun res!242561 () Bool)

(assert (=> b!416671 (=> (not res!242561) (not e!248701))))

(assert (=> b!416671 (= res!242561 (and (= (size!12471 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12470 _keys!709) (size!12471 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!416672 () Bool)

(assert (=> b!416672 (= e!248709 (= call!28946 (+!1206 call!28945 (tuple2!7065 k!794 v!412))))))

(declare-fun b!416673 () Bool)

(declare-fun res!242559 () Bool)

(assert (=> b!416673 (=> (not res!242559) (not e!248701))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!416673 (= res!242559 (validMask!0 mask!1025))))

(declare-fun b!416674 () Bool)

(declare-fun res!242554 () Bool)

(assert (=> b!416674 (=> (not res!242554) (not e!248705))))

(assert (=> b!416674 (= res!242554 (bvsle from!863 i!563))))

(declare-fun b!416675 () Bool)

(assert (=> b!416675 (= e!248704 (and e!248707 mapRes!17733))))

(declare-fun condMapEmpty!17733 () Bool)

(declare-fun mapDefault!17733 () ValueCell!5027)

