; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39254 () Bool)

(assert start!39254)

(declare-fun b_free!9535 () Bool)

(declare-fun b_next!9535 () Bool)

(assert (=> start!39254 (= b_free!9535 (not b_next!9535))))

(declare-fun tp!34134 () Bool)

(declare-fun b_and!16959 () Bool)

(assert (=> start!39254 (= tp!34134 b_and!16959)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((V!15355 0))(
  ( (V!15356 (val!5388 Int)) )
))
(declare-datatypes ((tuple2!6888 0))(
  ( (tuple2!6889 (_1!3455 (_ BitVec 64)) (_2!3455 V!15355)) )
))
(declare-datatypes ((List!6908 0))(
  ( (Nil!6905) (Cons!6904 (h!7760 tuple2!6888) (t!12100 List!6908)) )
))
(declare-datatypes ((ListLongMap!5803 0))(
  ( (ListLongMap!5804 (toList!2917 List!6908)) )
))
(declare-fun call!28771 () ListLongMap!5803)

(declare-fun b!415021 () Bool)

(declare-fun e!247945 () Bool)

(declare-fun v!412 () V!15355)

(declare-fun call!28770 () ListLongMap!5803)

(declare-fun +!1192 (ListLongMap!5803 tuple2!6888) ListLongMap!5803)

(assert (=> b!415021 (= e!247945 (= call!28770 (+!1192 call!28771 (tuple2!6889 k0!794 v!412))))))

(declare-fun b!415022 () Bool)

(declare-fun e!247942 () Bool)

(declare-fun tp_is_empty!10687 () Bool)

(assert (=> b!415022 (= e!247942 tp_is_empty!10687)))

(declare-fun b!415023 () Bool)

(declare-fun res!241427 () Bool)

(declare-fun e!247943 () Bool)

(assert (=> b!415023 (=> (not res!241427) (not e!247943))))

(declare-datatypes ((array!25234 0))(
  ( (array!25235 (arr!12066 (Array (_ BitVec 32) (_ BitVec 64))) (size!12418 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25234)

(declare-fun arrayContainsKey!0 (array!25234 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!415023 (= res!241427 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!415024 () Bool)

(declare-fun e!247940 () Bool)

(assert (=> b!415024 (= e!247943 e!247940)))

(declare-fun res!241426 () Bool)

(assert (=> b!415024 (=> (not res!241426) (not e!247940))))

(declare-fun lt!190179 () array!25234)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25234 (_ BitVec 32)) Bool)

(assert (=> b!415024 (= res!241426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190179 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!415024 (= lt!190179 (array!25235 (store (arr!12066 _keys!709) i!563 k0!794) (size!12418 _keys!709)))))

(declare-fun b!415026 () Bool)

(declare-fun res!241424 () Bool)

(assert (=> b!415026 (=> (not res!241424) (not e!247940))))

(declare-datatypes ((List!6909 0))(
  ( (Nil!6906) (Cons!6905 (h!7761 (_ BitVec 64)) (t!12101 List!6909)) )
))
(declare-fun arrayNoDuplicates!0 (array!25234 (_ BitVec 32) List!6909) Bool)

(assert (=> b!415026 (= res!241424 (arrayNoDuplicates!0 lt!190179 #b00000000000000000000000000000000 Nil!6906))))

(declare-fun minValue!515 () V!15355)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15355)

(declare-fun bm!28767 () Bool)

(declare-datatypes ((ValueCell!5000 0))(
  ( (ValueCellFull!5000 (v!7636 V!15355)) (EmptyCell!5000) )
))
(declare-datatypes ((array!25236 0))(
  ( (array!25237 (arr!12067 (Array (_ BitVec 32) ValueCell!5000)) (size!12419 (_ BitVec 32))) )
))
(declare-fun lt!190182 () array!25236)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun _values!549 () array!25236)

(declare-fun c!54993 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1166 (array!25234 array!25236 (_ BitVec 32) (_ BitVec 32) V!15355 V!15355 (_ BitVec 32) Int) ListLongMap!5803)

(assert (=> bm!28767 (= call!28771 (getCurrentListMapNoExtraKeys!1166 (ite c!54993 _keys!709 lt!190179) (ite c!54993 _values!549 lt!190182) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415027 () Bool)

(assert (=> b!415027 (= e!247945 (= call!28771 call!28770))))

(declare-fun mapIsEmpty!17652 () Bool)

(declare-fun mapRes!17652 () Bool)

(assert (=> mapIsEmpty!17652 mapRes!17652))

(declare-fun b!415028 () Bool)

(declare-fun res!241423 () Bool)

(assert (=> b!415028 (=> (not res!241423) (not e!247943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!415028 (= res!241423 (validMask!0 mask!1025))))

(declare-fun b!415029 () Bool)

(declare-fun res!241419 () Bool)

(assert (=> b!415029 (=> (not res!241419) (not e!247943))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!415029 (= res!241419 (validKeyInArray!0 k0!794))))

(declare-fun b!415030 () Bool)

(declare-fun e!247941 () Bool)

(declare-fun e!247946 () Bool)

(assert (=> b!415030 (= e!247941 (and e!247946 mapRes!17652))))

(declare-fun condMapEmpty!17652 () Bool)

(declare-fun mapDefault!17652 () ValueCell!5000)

(assert (=> b!415030 (= condMapEmpty!17652 (= (arr!12067 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5000)) mapDefault!17652)))))

(declare-fun b!415031 () Bool)

(declare-fun res!241428 () Bool)

(assert (=> b!415031 (=> (not res!241428) (not e!247943))))

(assert (=> b!415031 (= res!241428 (and (= (size!12419 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12418 _keys!709) (size!12419 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!415032 () Bool)

(declare-fun e!247948 () Bool)

(declare-fun e!247944 () Bool)

(assert (=> b!415032 (= e!247948 (not e!247944))))

(declare-fun res!241417 () Bool)

(assert (=> b!415032 (=> res!241417 e!247944)))

(assert (=> b!415032 (= res!241417 (validKeyInArray!0 (select (arr!12066 _keys!709) from!863)))))

(assert (=> b!415032 e!247945))

(assert (=> b!415032 (= c!54993 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12267 0))(
  ( (Unit!12268) )
))
(declare-fun lt!190178 () Unit!12267)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!401 (array!25234 array!25236 (_ BitVec 32) (_ BitVec 32) V!15355 V!15355 (_ BitVec 32) (_ BitVec 64) V!15355 (_ BitVec 32) Int) Unit!12267)

(assert (=> b!415032 (= lt!190178 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!401 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415033 () Bool)

(assert (=> b!415033 (= e!247944 true)))

(declare-fun lt!190180 () ListLongMap!5803)

(declare-fun get!5958 (ValueCell!5000 V!15355) V!15355)

(declare-fun dynLambda!659 (Int (_ BitVec 64)) V!15355)

(assert (=> b!415033 (= lt!190180 (+!1192 (getCurrentListMapNoExtraKeys!1166 lt!190179 lt!190182 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!6889 (select (arr!12066 lt!190179) from!863) (get!5958 (select (arr!12067 lt!190182) from!863) (dynLambda!659 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!415034 () Bool)

(declare-fun res!241415 () Bool)

(assert (=> b!415034 (=> (not res!241415) (not e!247943))))

(assert (=> b!415034 (= res!241415 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6906))))

(declare-fun res!241420 () Bool)

(assert (=> start!39254 (=> (not res!241420) (not e!247943))))

(assert (=> start!39254 (= res!241420 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12418 _keys!709))))))

(assert (=> start!39254 e!247943))

(assert (=> start!39254 tp_is_empty!10687))

(assert (=> start!39254 tp!34134))

(assert (=> start!39254 true))

(declare-fun array_inv!8882 (array!25236) Bool)

(assert (=> start!39254 (and (array_inv!8882 _values!549) e!247941)))

(declare-fun array_inv!8883 (array!25234) Bool)

(assert (=> start!39254 (array_inv!8883 _keys!709)))

(declare-fun b!415025 () Bool)

(declare-fun res!241422 () Bool)

(assert (=> b!415025 (=> (not res!241422) (not e!247943))))

(assert (=> b!415025 (= res!241422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun bm!28768 () Bool)

(assert (=> bm!28768 (= call!28770 (getCurrentListMapNoExtraKeys!1166 (ite c!54993 lt!190179 _keys!709) (ite c!54993 lt!190182 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415035 () Bool)

(assert (=> b!415035 (= e!247946 tp_is_empty!10687)))

(declare-fun mapNonEmpty!17652 () Bool)

(declare-fun tp!34133 () Bool)

(assert (=> mapNonEmpty!17652 (= mapRes!17652 (and tp!34133 e!247942))))

(declare-fun mapRest!17652 () (Array (_ BitVec 32) ValueCell!5000))

(declare-fun mapValue!17652 () ValueCell!5000)

(declare-fun mapKey!17652 () (_ BitVec 32))

(assert (=> mapNonEmpty!17652 (= (arr!12067 _values!549) (store mapRest!17652 mapKey!17652 mapValue!17652))))

(declare-fun b!415036 () Bool)

(declare-fun res!241425 () Bool)

(assert (=> b!415036 (=> (not res!241425) (not e!247943))))

(assert (=> b!415036 (= res!241425 (or (= (select (arr!12066 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12066 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!415037 () Bool)

(assert (=> b!415037 (= e!247940 e!247948)))

(declare-fun res!241416 () Bool)

(assert (=> b!415037 (=> (not res!241416) (not e!247948))))

(assert (=> b!415037 (= res!241416 (= from!863 i!563))))

(assert (=> b!415037 (= lt!190180 (getCurrentListMapNoExtraKeys!1166 lt!190179 lt!190182 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!415037 (= lt!190182 (array!25237 (store (arr!12067 _values!549) i!563 (ValueCellFull!5000 v!412)) (size!12419 _values!549)))))

(declare-fun lt!190181 () ListLongMap!5803)

(assert (=> b!415037 (= lt!190181 (getCurrentListMapNoExtraKeys!1166 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!415038 () Bool)

(declare-fun res!241418 () Bool)

(assert (=> b!415038 (=> (not res!241418) (not e!247940))))

(assert (=> b!415038 (= res!241418 (bvsle from!863 i!563))))

(declare-fun b!415039 () Bool)

(declare-fun res!241421 () Bool)

(assert (=> b!415039 (=> (not res!241421) (not e!247943))))

(assert (=> b!415039 (= res!241421 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12418 _keys!709))))))

(assert (= (and start!39254 res!241420) b!415028))

(assert (= (and b!415028 res!241423) b!415031))

(assert (= (and b!415031 res!241428) b!415025))

(assert (= (and b!415025 res!241422) b!415034))

(assert (= (and b!415034 res!241415) b!415039))

(assert (= (and b!415039 res!241421) b!415029))

(assert (= (and b!415029 res!241419) b!415036))

(assert (= (and b!415036 res!241425) b!415023))

(assert (= (and b!415023 res!241427) b!415024))

(assert (= (and b!415024 res!241426) b!415026))

(assert (= (and b!415026 res!241424) b!415038))

(assert (= (and b!415038 res!241418) b!415037))

(assert (= (and b!415037 res!241416) b!415032))

(assert (= (and b!415032 c!54993) b!415021))

(assert (= (and b!415032 (not c!54993)) b!415027))

(assert (= (or b!415021 b!415027) bm!28768))

(assert (= (or b!415021 b!415027) bm!28767))

(assert (= (and b!415032 (not res!241417)) b!415033))

(assert (= (and b!415030 condMapEmpty!17652) mapIsEmpty!17652))

(assert (= (and b!415030 (not condMapEmpty!17652)) mapNonEmpty!17652))

(get-info :version)

(assert (= (and mapNonEmpty!17652 ((_ is ValueCellFull!5000) mapValue!17652)) b!415022))

(assert (= (and b!415030 ((_ is ValueCellFull!5000) mapDefault!17652)) b!415035))

(assert (= start!39254 b!415030))

(declare-fun b_lambda!8861 () Bool)

(assert (=> (not b_lambda!8861) (not b!415033)))

(declare-fun t!12099 () Bool)

(declare-fun tb!3149 () Bool)

(assert (=> (and start!39254 (= defaultEntry!557 defaultEntry!557) t!12099) tb!3149))

(declare-fun result!5833 () Bool)

(assert (=> tb!3149 (= result!5833 tp_is_empty!10687)))

(assert (=> b!415033 t!12099))

(declare-fun b_and!16961 () Bool)

(assert (= b_and!16959 (and (=> t!12099 result!5833) b_and!16961)))

(declare-fun m!404469 () Bool)

(assert (=> b!415023 m!404469))

(declare-fun m!404471 () Bool)

(assert (=> b!415024 m!404471))

(declare-fun m!404473 () Bool)

(assert (=> b!415024 m!404473))

(declare-fun m!404475 () Bool)

(assert (=> bm!28768 m!404475))

(declare-fun m!404477 () Bool)

(assert (=> bm!28767 m!404477))

(declare-fun m!404479 () Bool)

(assert (=> b!415021 m!404479))

(declare-fun m!404481 () Bool)

(assert (=> start!39254 m!404481))

(declare-fun m!404483 () Bool)

(assert (=> start!39254 m!404483))

(declare-fun m!404485 () Bool)

(assert (=> b!415028 m!404485))

(declare-fun m!404487 () Bool)

(assert (=> mapNonEmpty!17652 m!404487))

(declare-fun m!404489 () Bool)

(assert (=> b!415025 m!404489))

(declare-fun m!404491 () Bool)

(assert (=> b!415026 m!404491))

(declare-fun m!404493 () Bool)

(assert (=> b!415037 m!404493))

(declare-fun m!404495 () Bool)

(assert (=> b!415037 m!404495))

(declare-fun m!404497 () Bool)

(assert (=> b!415037 m!404497))

(declare-fun m!404499 () Bool)

(assert (=> b!415029 m!404499))

(declare-fun m!404501 () Bool)

(assert (=> b!415036 m!404501))

(declare-fun m!404503 () Bool)

(assert (=> b!415032 m!404503))

(assert (=> b!415032 m!404503))

(declare-fun m!404505 () Bool)

(assert (=> b!415032 m!404505))

(declare-fun m!404507 () Bool)

(assert (=> b!415032 m!404507))

(declare-fun m!404509 () Bool)

(assert (=> b!415033 m!404509))

(declare-fun m!404511 () Bool)

(assert (=> b!415033 m!404511))

(declare-fun m!404513 () Bool)

(assert (=> b!415033 m!404513))

(declare-fun m!404515 () Bool)

(assert (=> b!415033 m!404515))

(declare-fun m!404517 () Bool)

(assert (=> b!415033 m!404517))

(assert (=> b!415033 m!404511))

(declare-fun m!404519 () Bool)

(assert (=> b!415033 m!404519))

(assert (=> b!415033 m!404515))

(assert (=> b!415033 m!404509))

(declare-fun m!404521 () Bool)

(assert (=> b!415034 m!404521))

(check-sat (not b!415037) (not b!415028) (not b_next!9535) (not b!415034) (not b!415024) (not b!415033) (not mapNonEmpty!17652) (not start!39254) (not b_lambda!8861) (not b!415032) (not b!415029) tp_is_empty!10687 (not b!415026) b_and!16961 (not b!415025) (not b!415021) (not b!415023) (not bm!28767) (not bm!28768))
(check-sat b_and!16961 (not b_next!9535))
