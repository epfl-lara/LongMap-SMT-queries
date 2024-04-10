; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39210 () Bool)

(assert start!39210)

(declare-fun b_free!9477 () Bool)

(declare-fun b_next!9477 () Bool)

(assert (=> start!39210 (= b_free!9477 (not b_next!9477))))

(declare-fun tp!33959 () Bool)

(declare-fun b_and!16863 () Bool)

(assert (=> start!39210 (= tp!33959 b_and!16863)))

(declare-fun mapNonEmpty!17565 () Bool)

(declare-fun mapRes!17565 () Bool)

(declare-fun tp!33960 () Bool)

(declare-fun e!247229 () Bool)

(assert (=> mapNonEmpty!17565 (= mapRes!17565 (and tp!33960 e!247229))))

(declare-datatypes ((V!15277 0))(
  ( (V!15278 (val!5359 Int)) )
))
(declare-datatypes ((ValueCell!4971 0))(
  ( (ValueCellFull!4971 (v!7606 V!15277)) (EmptyCell!4971) )
))
(declare-fun mapRest!17565 () (Array (_ BitVec 32) ValueCell!4971))

(declare-datatypes ((array!25115 0))(
  ( (array!25116 (arr!12007 (Array (_ BitVec 32) ValueCell!4971)) (size!12359 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25115)

(declare-fun mapKey!17565 () (_ BitVec 32))

(declare-fun mapValue!17565 () ValueCell!4971)

(assert (=> mapNonEmpty!17565 (= (arr!12007 _values!549) (store mapRest!17565 mapKey!17565 mapValue!17565))))

(declare-fun b!413433 () Bool)

(declare-fun res!240243 () Bool)

(declare-fun e!247230 () Bool)

(assert (=> b!413433 (=> (not res!240243) (not e!247230))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!25117 0))(
  ( (array!25118 (arr!12008 (Array (_ BitVec 32) (_ BitVec 64))) (size!12360 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25117)

(assert (=> b!413433 (= res!240243 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12360 _keys!709))))))

(declare-fun b!413434 () Bool)

(declare-fun res!240244 () Bool)

(declare-fun e!247234 () Bool)

(assert (=> b!413434 (=> (not res!240244) (not e!247234))))

(declare-fun lt!189725 () array!25117)

(declare-datatypes ((List!6987 0))(
  ( (Nil!6984) (Cons!6983 (h!7839 (_ BitVec 64)) (t!12161 List!6987)) )
))
(declare-fun arrayNoDuplicates!0 (array!25117 (_ BitVec 32) List!6987) Bool)

(assert (=> b!413434 (= res!240244 (arrayNoDuplicates!0 lt!189725 #b00000000000000000000000000000000 Nil!6984))))

(declare-fun minValue!515 () V!15277)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15277)

(declare-fun lt!189727 () array!25115)

(declare-fun bm!28606 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!6962 0))(
  ( (tuple2!6963 (_1!3492 (_ BitVec 64)) (_2!3492 V!15277)) )
))
(declare-datatypes ((List!6988 0))(
  ( (Nil!6985) (Cons!6984 (h!7840 tuple2!6962) (t!12162 List!6988)) )
))
(declare-datatypes ((ListLongMap!5875 0))(
  ( (ListLongMap!5876 (toList!2953 List!6988)) )
))
(declare-fun call!28610 () ListLongMap!5875)

(declare-fun c!54929 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1161 (array!25117 array!25115 (_ BitVec 32) (_ BitVec 32) V!15277 V!15277 (_ BitVec 32) Int) ListLongMap!5875)

(assert (=> bm!28606 (= call!28610 (getCurrentListMapNoExtraKeys!1161 (ite c!54929 lt!189725 _keys!709) (ite c!54929 lt!189727 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413436 () Bool)

(assert (=> b!413436 (= e!247230 e!247234)))

(declare-fun res!240252 () Bool)

(assert (=> b!413436 (=> (not res!240252) (not e!247234))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25117 (_ BitVec 32)) Bool)

(assert (=> b!413436 (= res!240252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189725 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!413436 (= lt!189725 (array!25118 (store (arr!12008 _keys!709) i!563 k0!794) (size!12360 _keys!709)))))

(declare-fun b!413437 () Bool)

(declare-fun res!240245 () Bool)

(assert (=> b!413437 (=> (not res!240245) (not e!247230))))

(assert (=> b!413437 (= res!240245 (or (= (select (arr!12008 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12008 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!28607 () Bool)

(declare-fun call!28609 () ListLongMap!5875)

(assert (=> bm!28607 (= call!28609 (getCurrentListMapNoExtraKeys!1161 (ite c!54929 _keys!709 lt!189725) (ite c!54929 _values!549 lt!189727) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413438 () Bool)

(declare-fun res!240246 () Bool)

(assert (=> b!413438 (=> (not res!240246) (not e!247230))))

(declare-fun arrayContainsKey!0 (array!25117 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!413438 (= res!240246 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!413439 () Bool)

(declare-fun res!240251 () Bool)

(assert (=> b!413439 (=> (not res!240251) (not e!247230))))

(assert (=> b!413439 (= res!240251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!413440 () Bool)

(declare-fun res!240241 () Bool)

(assert (=> b!413440 (=> (not res!240241) (not e!247230))))

(assert (=> b!413440 (= res!240241 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6984))))

(declare-fun b!413441 () Bool)

(declare-fun e!247236 () Bool)

(declare-fun v!412 () V!15277)

(declare-fun +!1164 (ListLongMap!5875 tuple2!6962) ListLongMap!5875)

(assert (=> b!413441 (= e!247236 (= call!28610 (+!1164 call!28609 (tuple2!6963 k0!794 v!412))))))

(declare-fun b!413442 () Bool)

(declare-fun e!247232 () Bool)

(declare-fun tp_is_empty!10629 () Bool)

(assert (=> b!413442 (= e!247232 tp_is_empty!10629)))

(declare-fun b!413443 () Bool)

(declare-fun e!247233 () Bool)

(assert (=> b!413443 (= e!247233 (not true))))

(assert (=> b!413443 e!247236))

(assert (=> b!413443 (= c!54929 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12234 0))(
  ( (Unit!12235) )
))
(declare-fun lt!189724 () Unit!12234)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!375 (array!25117 array!25115 (_ BitVec 32) (_ BitVec 32) V!15277 V!15277 (_ BitVec 32) (_ BitVec 64) V!15277 (_ BitVec 32) Int) Unit!12234)

(assert (=> b!413443 (= lt!189724 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!375 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413444 () Bool)

(declare-fun res!240249 () Bool)

(assert (=> b!413444 (=> (not res!240249) (not e!247230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!413444 (= res!240249 (validMask!0 mask!1025))))

(declare-fun b!413435 () Bool)

(assert (=> b!413435 (= e!247234 e!247233)))

(declare-fun res!240248 () Bool)

(assert (=> b!413435 (=> (not res!240248) (not e!247233))))

(assert (=> b!413435 (= res!240248 (= from!863 i!563))))

(declare-fun lt!189726 () ListLongMap!5875)

(assert (=> b!413435 (= lt!189726 (getCurrentListMapNoExtraKeys!1161 lt!189725 lt!189727 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!413435 (= lt!189727 (array!25116 (store (arr!12007 _values!549) i!563 (ValueCellFull!4971 v!412)) (size!12359 _values!549)))))

(declare-fun lt!189728 () ListLongMap!5875)

(assert (=> b!413435 (= lt!189728 (getCurrentListMapNoExtraKeys!1161 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!240247 () Bool)

(assert (=> start!39210 (=> (not res!240247) (not e!247230))))

(assert (=> start!39210 (= res!240247 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12360 _keys!709))))))

(assert (=> start!39210 e!247230))

(assert (=> start!39210 tp_is_empty!10629))

(assert (=> start!39210 tp!33959))

(assert (=> start!39210 true))

(declare-fun e!247231 () Bool)

(declare-fun array_inv!8758 (array!25115) Bool)

(assert (=> start!39210 (and (array_inv!8758 _values!549) e!247231)))

(declare-fun array_inv!8759 (array!25117) Bool)

(assert (=> start!39210 (array_inv!8759 _keys!709)))

(declare-fun b!413445 () Bool)

(assert (=> b!413445 (= e!247236 (= call!28609 call!28610))))

(declare-fun b!413446 () Bool)

(assert (=> b!413446 (= e!247231 (and e!247232 mapRes!17565))))

(declare-fun condMapEmpty!17565 () Bool)

(declare-fun mapDefault!17565 () ValueCell!4971)

(assert (=> b!413446 (= condMapEmpty!17565 (= (arr!12007 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4971)) mapDefault!17565)))))

(declare-fun b!413447 () Bool)

(declare-fun res!240250 () Bool)

(assert (=> b!413447 (=> (not res!240250) (not e!247230))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!413447 (= res!240250 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!17565 () Bool)

(assert (=> mapIsEmpty!17565 mapRes!17565))

(declare-fun b!413448 () Bool)

(declare-fun res!240240 () Bool)

(assert (=> b!413448 (=> (not res!240240) (not e!247234))))

(assert (=> b!413448 (= res!240240 (bvsle from!863 i!563))))

(declare-fun b!413449 () Bool)

(declare-fun res!240242 () Bool)

(assert (=> b!413449 (=> (not res!240242) (not e!247230))))

(assert (=> b!413449 (= res!240242 (and (= (size!12359 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12360 _keys!709) (size!12359 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!413450 () Bool)

(assert (=> b!413450 (= e!247229 tp_is_empty!10629)))

(assert (= (and start!39210 res!240247) b!413444))

(assert (= (and b!413444 res!240249) b!413449))

(assert (= (and b!413449 res!240242) b!413439))

(assert (= (and b!413439 res!240251) b!413440))

(assert (= (and b!413440 res!240241) b!413433))

(assert (= (and b!413433 res!240243) b!413447))

(assert (= (and b!413447 res!240250) b!413437))

(assert (= (and b!413437 res!240245) b!413438))

(assert (= (and b!413438 res!240246) b!413436))

(assert (= (and b!413436 res!240252) b!413434))

(assert (= (and b!413434 res!240244) b!413448))

(assert (= (and b!413448 res!240240) b!413435))

(assert (= (and b!413435 res!240248) b!413443))

(assert (= (and b!413443 c!54929) b!413441))

(assert (= (and b!413443 (not c!54929)) b!413445))

(assert (= (or b!413441 b!413445) bm!28606))

(assert (= (or b!413441 b!413445) bm!28607))

(assert (= (and b!413446 condMapEmpty!17565) mapIsEmpty!17565))

(assert (= (and b!413446 (not condMapEmpty!17565)) mapNonEmpty!17565))

(get-info :version)

(assert (= (and mapNonEmpty!17565 ((_ is ValueCellFull!4971) mapValue!17565)) b!413450))

(assert (= (and b!413446 ((_ is ValueCellFull!4971) mapDefault!17565)) b!413442))

(assert (= start!39210 b!413446))

(declare-fun m!402933 () Bool)

(assert (=> b!413447 m!402933))

(declare-fun m!402935 () Bool)

(assert (=> b!413440 m!402935))

(declare-fun m!402937 () Bool)

(assert (=> b!413444 m!402937))

(declare-fun m!402939 () Bool)

(assert (=> b!413443 m!402939))

(declare-fun m!402941 () Bool)

(assert (=> mapNonEmpty!17565 m!402941))

(declare-fun m!402943 () Bool)

(assert (=> b!413441 m!402943))

(declare-fun m!402945 () Bool)

(assert (=> bm!28606 m!402945))

(declare-fun m!402947 () Bool)

(assert (=> b!413438 m!402947))

(declare-fun m!402949 () Bool)

(assert (=> b!413437 m!402949))

(declare-fun m!402951 () Bool)

(assert (=> b!413435 m!402951))

(declare-fun m!402953 () Bool)

(assert (=> b!413435 m!402953))

(declare-fun m!402955 () Bool)

(assert (=> b!413435 m!402955))

(declare-fun m!402957 () Bool)

(assert (=> start!39210 m!402957))

(declare-fun m!402959 () Bool)

(assert (=> start!39210 m!402959))

(declare-fun m!402961 () Bool)

(assert (=> b!413436 m!402961))

(declare-fun m!402963 () Bool)

(assert (=> b!413436 m!402963))

(declare-fun m!402965 () Bool)

(assert (=> bm!28607 m!402965))

(declare-fun m!402967 () Bool)

(assert (=> b!413434 m!402967))

(declare-fun m!402969 () Bool)

(assert (=> b!413439 m!402969))

(check-sat (not b!413444) b_and!16863 (not b!413436) (not b!413439) (not b!413434) (not b!413438) (not b!413441) (not b_next!9477) (not b!413447) (not bm!28607) (not b!413435) tp_is_empty!10629 (not bm!28606) (not b!413443) (not mapNonEmpty!17565) (not start!39210) (not b!413440))
(check-sat b_and!16863 (not b_next!9477))
