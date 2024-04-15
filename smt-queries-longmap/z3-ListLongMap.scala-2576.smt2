; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39260 () Bool)

(assert start!39260)

(declare-fun b_free!9541 () Bool)

(declare-fun b_next!9541 () Bool)

(assert (=> start!39260 (= b_free!9541 (not b_next!9541))))

(declare-fun tp!34152 () Bool)

(declare-fun b_and!16931 () Bool)

(assert (=> start!39260 (= tp!34152 b_and!16931)))

(declare-fun b!414976 () Bool)

(declare-fun e!247880 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((V!15363 0))(
  ( (V!15364 (val!5391 Int)) )
))
(declare-datatypes ((tuple2!7002 0))(
  ( (tuple2!7003 (_1!3512 (_ BitVec 64)) (_2!3512 V!15363)) )
))
(declare-datatypes ((List!7013 0))(
  ( (Nil!7010) (Cons!7009 (h!7865 tuple2!7002) (t!12210 List!7013)) )
))
(declare-datatypes ((ListLongMap!5905 0))(
  ( (ListLongMap!5906 (toList!2968 List!7013)) )
))
(declare-fun call!28776 () ListLongMap!5905)

(declare-fun call!28777 () ListLongMap!5905)

(declare-fun v!412 () V!15363)

(declare-fun +!1201 (ListLongMap!5905 tuple2!7002) ListLongMap!5905)

(assert (=> b!414976 (= e!247880 (= call!28777 (+!1201 call!28776 (tuple2!7003 k0!794 v!412))))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!15363)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!25233 0))(
  ( (array!25234 (arr!12066 (Array (_ BitVec 32) (_ BitVec 64))) (size!12419 (_ BitVec 32))) )
))
(declare-fun lt!189972 () array!25233)

(declare-fun bm!28773 () Bool)

(declare-fun zeroValue!515 () V!15363)

(declare-datatypes ((ValueCell!5003 0))(
  ( (ValueCellFull!5003 (v!7632 V!15363)) (EmptyCell!5003) )
))
(declare-datatypes ((array!25235 0))(
  ( (array!25236 (arr!12067 (Array (_ BitVec 32) ValueCell!5003)) (size!12420 (_ BitVec 32))) )
))
(declare-fun lt!189974 () array!25235)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1180 (array!25233 array!25235 (_ BitVec 32) (_ BitVec 32) V!15363 V!15363 (_ BitVec 32) Int) ListLongMap!5905)

(assert (=> bm!28773 (= call!28777 (getCurrentListMapNoExtraKeys!1180 lt!189972 lt!189974 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414978 () Bool)

(declare-fun e!247882 () Bool)

(declare-fun tp_is_empty!10693 () Bool)

(assert (=> b!414978 (= e!247882 tp_is_empty!10693)))

(declare-fun b!414979 () Bool)

(assert (=> b!414979 (= e!247880 (= call!28777 call!28776))))

(declare-fun b!414980 () Bool)

(declare-fun res!241418 () Bool)

(declare-fun e!247885 () Bool)

(assert (=> b!414980 (=> (not res!241418) (not e!247885))))

(declare-fun _keys!709 () array!25233)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!414980 (= res!241418 (or (= (select (arr!12066 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12066 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!414981 () Bool)

(declare-fun e!247887 () Bool)

(assert (=> b!414981 (= e!247887 true)))

(declare-fun lt!189971 () ListLongMap!5905)

(declare-fun get!5948 (ValueCell!5003 V!15363) V!15363)

(declare-fun dynLambda!650 (Int (_ BitVec 64)) V!15363)

(assert (=> b!414981 (= lt!189971 (+!1201 (getCurrentListMapNoExtraKeys!1180 lt!189972 lt!189974 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7003 (select (arr!12066 lt!189972) from!863) (get!5948 (select (arr!12067 lt!189974) from!863) (dynLambda!650 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!414982 () Bool)

(declare-fun res!241424 () Bool)

(assert (=> b!414982 (=> (not res!241424) (not e!247885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!414982 (= res!241424 (validMask!0 mask!1025))))

(declare-fun b!414983 () Bool)

(declare-fun res!241419 () Bool)

(declare-fun e!247883 () Bool)

(assert (=> b!414983 (=> (not res!241419) (not e!247883))))

(declare-datatypes ((List!7014 0))(
  ( (Nil!7011) (Cons!7010 (h!7866 (_ BitVec 64)) (t!12211 List!7014)) )
))
(declare-fun arrayNoDuplicates!0 (array!25233 (_ BitVec 32) List!7014) Bool)

(assert (=> b!414983 (= res!241419 (arrayNoDuplicates!0 lt!189972 #b00000000000000000000000000000000 Nil!7011))))

(declare-fun b!414984 () Bool)

(declare-fun e!247881 () Bool)

(assert (=> b!414984 (= e!247881 (not e!247887))))

(declare-fun res!241415 () Bool)

(assert (=> b!414984 (=> res!241415 e!247887)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!414984 (= res!241415 (validKeyInArray!0 (select (arr!12066 _keys!709) from!863)))))

(assert (=> b!414984 e!247880))

(declare-fun c!54954 () Bool)

(assert (=> b!414984 (= c!54954 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12246 0))(
  ( (Unit!12247) )
))
(declare-fun lt!189973 () Unit!12246)

(declare-fun _values!549 () array!25235)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!386 (array!25233 array!25235 (_ BitVec 32) (_ BitVec 32) V!15363 V!15363 (_ BitVec 32) (_ BitVec 64) V!15363 (_ BitVec 32) Int) Unit!12246)

(assert (=> b!414984 (= lt!189973 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!386 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414985 () Bool)

(declare-fun res!241425 () Bool)

(assert (=> b!414985 (=> (not res!241425) (not e!247883))))

(assert (=> b!414985 (= res!241425 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!17661 () Bool)

(declare-fun mapRes!17661 () Bool)

(declare-fun tp!34151 () Bool)

(declare-fun e!247879 () Bool)

(assert (=> mapNonEmpty!17661 (= mapRes!17661 (and tp!34151 e!247879))))

(declare-fun mapValue!17661 () ValueCell!5003)

(declare-fun mapKey!17661 () (_ BitVec 32))

(declare-fun mapRest!17661 () (Array (_ BitVec 32) ValueCell!5003))

(assert (=> mapNonEmpty!17661 (= (arr!12067 _values!549) (store mapRest!17661 mapKey!17661 mapValue!17661))))

(declare-fun b!414986 () Bool)

(declare-fun res!241423 () Bool)

(assert (=> b!414986 (=> (not res!241423) (not e!247885))))

(assert (=> b!414986 (= res!241423 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7011))))

(declare-fun b!414977 () Bool)

(assert (=> b!414977 (= e!247879 tp_is_empty!10693)))

(declare-fun res!241427 () Bool)

(assert (=> start!39260 (=> (not res!241427) (not e!247885))))

(assert (=> start!39260 (= res!241427 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12419 _keys!709))))))

(assert (=> start!39260 e!247885))

(assert (=> start!39260 tp_is_empty!10693))

(assert (=> start!39260 tp!34152))

(assert (=> start!39260 true))

(declare-fun e!247884 () Bool)

(declare-fun array_inv!8844 (array!25235) Bool)

(assert (=> start!39260 (and (array_inv!8844 _values!549) e!247884)))

(declare-fun array_inv!8845 (array!25233) Bool)

(assert (=> start!39260 (array_inv!8845 _keys!709)))

(declare-fun b!414987 () Bool)

(declare-fun res!241417 () Bool)

(assert (=> b!414987 (=> (not res!241417) (not e!247885))))

(assert (=> b!414987 (= res!241417 (and (= (size!12420 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12419 _keys!709) (size!12420 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!414988 () Bool)

(declare-fun res!241421 () Bool)

(assert (=> b!414988 (=> (not res!241421) (not e!247885))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25233 (_ BitVec 32)) Bool)

(assert (=> b!414988 (= res!241421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!17661 () Bool)

(assert (=> mapIsEmpty!17661 mapRes!17661))

(declare-fun b!414989 () Bool)

(declare-fun res!241422 () Bool)

(assert (=> b!414989 (=> (not res!241422) (not e!247885))))

(assert (=> b!414989 (= res!241422 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12419 _keys!709))))))

(declare-fun bm!28774 () Bool)

(assert (=> bm!28774 (= call!28776 (getCurrentListMapNoExtraKeys!1180 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414990 () Bool)

(assert (=> b!414990 (= e!247885 e!247883)))

(declare-fun res!241426 () Bool)

(assert (=> b!414990 (=> (not res!241426) (not e!247883))))

(assert (=> b!414990 (= res!241426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189972 mask!1025))))

(assert (=> b!414990 (= lt!189972 (array!25234 (store (arr!12066 _keys!709) i!563 k0!794) (size!12419 _keys!709)))))

(declare-fun b!414991 () Bool)

(declare-fun res!241420 () Bool)

(assert (=> b!414991 (=> (not res!241420) (not e!247885))))

(assert (=> b!414991 (= res!241420 (validKeyInArray!0 k0!794))))

(declare-fun b!414992 () Bool)

(declare-fun res!241428 () Bool)

(assert (=> b!414992 (=> (not res!241428) (not e!247885))))

(declare-fun arrayContainsKey!0 (array!25233 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!414992 (= res!241428 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!414993 () Bool)

(assert (=> b!414993 (= e!247883 e!247881)))

(declare-fun res!241416 () Bool)

(assert (=> b!414993 (=> (not res!241416) (not e!247881))))

(assert (=> b!414993 (= res!241416 (= from!863 i!563))))

(assert (=> b!414993 (= lt!189971 (getCurrentListMapNoExtraKeys!1180 lt!189972 lt!189974 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!414993 (= lt!189974 (array!25236 (store (arr!12067 _values!549) i!563 (ValueCellFull!5003 v!412)) (size!12420 _values!549)))))

(declare-fun lt!189970 () ListLongMap!5905)

(assert (=> b!414993 (= lt!189970 (getCurrentListMapNoExtraKeys!1180 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!414994 () Bool)

(assert (=> b!414994 (= e!247884 (and e!247882 mapRes!17661))))

(declare-fun condMapEmpty!17661 () Bool)

(declare-fun mapDefault!17661 () ValueCell!5003)

(assert (=> b!414994 (= condMapEmpty!17661 (= (arr!12067 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5003)) mapDefault!17661)))))

(assert (= (and start!39260 res!241427) b!414982))

(assert (= (and b!414982 res!241424) b!414987))

(assert (= (and b!414987 res!241417) b!414988))

(assert (= (and b!414988 res!241421) b!414986))

(assert (= (and b!414986 res!241423) b!414989))

(assert (= (and b!414989 res!241422) b!414991))

(assert (= (and b!414991 res!241420) b!414980))

(assert (= (and b!414980 res!241418) b!414992))

(assert (= (and b!414992 res!241428) b!414990))

(assert (= (and b!414990 res!241426) b!414983))

(assert (= (and b!414983 res!241419) b!414985))

(assert (= (and b!414985 res!241425) b!414993))

(assert (= (and b!414993 res!241416) b!414984))

(assert (= (and b!414984 c!54954) b!414976))

(assert (= (and b!414984 (not c!54954)) b!414979))

(assert (= (or b!414976 b!414979) bm!28773))

(assert (= (or b!414976 b!414979) bm!28774))

(assert (= (and b!414984 (not res!241415)) b!414981))

(assert (= (and b!414994 condMapEmpty!17661) mapIsEmpty!17661))

(assert (= (and b!414994 (not condMapEmpty!17661)) mapNonEmpty!17661))

(get-info :version)

(assert (= (and mapNonEmpty!17661 ((_ is ValueCellFull!5003) mapValue!17661)) b!414977))

(assert (= (and b!414994 ((_ is ValueCellFull!5003) mapDefault!17661)) b!414978))

(assert (= start!39260 b!414994))

(declare-fun b_lambda!8827 () Bool)

(assert (=> (not b_lambda!8827) (not b!414981)))

(declare-fun t!12209 () Bool)

(declare-fun tb!3155 () Bool)

(assert (=> (and start!39260 (= defaultEntry!557 defaultEntry!557) t!12209) tb!3155))

(declare-fun result!5845 () Bool)

(assert (=> tb!3155 (= result!5845 tp_is_empty!10693)))

(assert (=> b!414981 t!12209))

(declare-fun b_and!16933 () Bool)

(assert (= b_and!16931 (and (=> t!12209 result!5845) b_and!16933)))

(declare-fun m!403675 () Bool)

(assert (=> start!39260 m!403675))

(declare-fun m!403677 () Bool)

(assert (=> start!39260 m!403677))

(declare-fun m!403679 () Bool)

(assert (=> b!414981 m!403679))

(declare-fun m!403681 () Bool)

(assert (=> b!414981 m!403681))

(declare-fun m!403683 () Bool)

(assert (=> b!414981 m!403683))

(declare-fun m!403685 () Bool)

(assert (=> b!414981 m!403685))

(declare-fun m!403687 () Bool)

(assert (=> b!414981 m!403687))

(assert (=> b!414981 m!403679))

(assert (=> b!414981 m!403687))

(assert (=> b!414981 m!403685))

(declare-fun m!403689 () Bool)

(assert (=> b!414981 m!403689))

(declare-fun m!403691 () Bool)

(assert (=> b!414984 m!403691))

(assert (=> b!414984 m!403691))

(declare-fun m!403693 () Bool)

(assert (=> b!414984 m!403693))

(declare-fun m!403695 () Bool)

(assert (=> b!414984 m!403695))

(declare-fun m!403697 () Bool)

(assert (=> b!414983 m!403697))

(declare-fun m!403699 () Bool)

(assert (=> b!414988 m!403699))

(declare-fun m!403701 () Bool)

(assert (=> b!414991 m!403701))

(declare-fun m!403703 () Bool)

(assert (=> b!414992 m!403703))

(declare-fun m!403705 () Bool)

(assert (=> b!414986 m!403705))

(declare-fun m!403707 () Bool)

(assert (=> b!414980 m!403707))

(declare-fun m!403709 () Bool)

(assert (=> bm!28774 m!403709))

(declare-fun m!403711 () Bool)

(assert (=> b!414990 m!403711))

(declare-fun m!403713 () Bool)

(assert (=> b!414990 m!403713))

(assert (=> bm!28773 m!403679))

(declare-fun m!403715 () Bool)

(assert (=> b!414976 m!403715))

(declare-fun m!403717 () Bool)

(assert (=> b!414982 m!403717))

(declare-fun m!403719 () Bool)

(assert (=> b!414993 m!403719))

(declare-fun m!403721 () Bool)

(assert (=> b!414993 m!403721))

(declare-fun m!403723 () Bool)

(assert (=> b!414993 m!403723))

(declare-fun m!403725 () Bool)

(assert (=> mapNonEmpty!17661 m!403725))

(check-sat (not b!414992) (not b!414990) (not b_next!9541) (not b!414986) (not bm!28773) (not b!414988) (not b!414984) (not b!414991) (not b!414981) tp_is_empty!10693 (not b!414982) b_and!16933 (not b!414976) (not start!39260) (not b!414993) (not bm!28774) (not b_lambda!8827) (not mapNonEmpty!17661) (not b!414983))
(check-sat b_and!16933 (not b_next!9541))
