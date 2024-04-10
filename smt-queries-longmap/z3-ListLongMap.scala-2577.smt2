; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39282 () Bool)

(assert start!39282)

(declare-fun b_free!9549 () Bool)

(declare-fun b_next!9549 () Bool)

(assert (=> start!39282 (= b_free!9549 (not b_next!9549))))

(declare-fun tp!34175 () Bool)

(declare-fun b_and!16973 () Bool)

(assert (=> start!39282 (= tp!34175 b_and!16973)))

(declare-fun b!415483 () Bool)

(declare-fun res!241713 () Bool)

(declare-fun e!248166 () Bool)

(assert (=> b!415483 (=> (not res!241713) (not e!248166))))

(declare-datatypes ((array!25259 0))(
  ( (array!25260 (arr!12079 (Array (_ BitVec 32) (_ BitVec 64))) (size!12431 (_ BitVec 32))) )
))
(declare-fun lt!190267 () array!25259)

(declare-datatypes ((List!7049 0))(
  ( (Nil!7046) (Cons!7045 (h!7901 (_ BitVec 64)) (t!12263 List!7049)) )
))
(declare-fun arrayNoDuplicates!0 (array!25259 (_ BitVec 32) List!7049) Bool)

(assert (=> b!415483 (= res!241713 (arrayNoDuplicates!0 lt!190267 #b00000000000000000000000000000000 Nil!7046))))

(declare-fun b!415484 () Bool)

(declare-fun res!241716 () Bool)

(declare-fun e!248162 () Bool)

(assert (=> b!415484 (=> (not res!241716) (not e!248162))))

(declare-fun _keys!709 () array!25259)

(assert (=> b!415484 (= res!241716 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7046))))

(declare-fun b!415485 () Bool)

(declare-fun e!248163 () Bool)

(declare-fun e!248161 () Bool)

(declare-fun mapRes!17673 () Bool)

(assert (=> b!415485 (= e!248163 (and e!248161 mapRes!17673))))

(declare-fun condMapEmpty!17673 () Bool)

(declare-datatypes ((V!15373 0))(
  ( (V!15374 (val!5395 Int)) )
))
(declare-datatypes ((ValueCell!5007 0))(
  ( (ValueCellFull!5007 (v!7642 V!15373)) (EmptyCell!5007) )
))
(declare-datatypes ((array!25261 0))(
  ( (array!25262 (arr!12080 (Array (_ BitVec 32) ValueCell!5007)) (size!12432 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25261)

(declare-fun mapDefault!17673 () ValueCell!5007)

(assert (=> b!415485 (= condMapEmpty!17673 (= (arr!12080 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5007)) mapDefault!17673)))))

(declare-fun b!415486 () Bool)

(declare-fun e!248168 () Bool)

(declare-fun e!248169 () Bool)

(assert (=> b!415486 (= e!248168 (not e!248169))))

(declare-fun res!241725 () Bool)

(assert (=> b!415486 (=> res!241725 e!248169)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!415486 (= res!241725 (validKeyInArray!0 (select (arr!12079 _keys!709) from!863)))))

(declare-fun e!248164 () Bool)

(assert (=> b!415486 e!248164))

(declare-fun c!55037 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!415486 (= c!55037 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15373)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((Unit!12282 0))(
  ( (Unit!12283) )
))
(declare-fun lt!190264 () Unit!12282)

(declare-fun zeroValue!515 () V!15373)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!15373)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!399 (array!25259 array!25261 (_ BitVec 32) (_ BitVec 32) V!15373 V!15373 (_ BitVec 32) (_ BitVec 64) V!15373 (_ BitVec 32) Int) Unit!12282)

(assert (=> b!415486 (= lt!190264 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!399 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415487 () Bool)

(declare-fun res!241719 () Bool)

(assert (=> b!415487 (=> (not res!241719) (not e!248162))))

(assert (=> b!415487 (= res!241719 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12431 _keys!709))))))

(declare-fun b!415488 () Bool)

(declare-fun res!241722 () Bool)

(assert (=> b!415488 (=> (not res!241722) (not e!248162))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!415488 (= res!241722 (validMask!0 mask!1025))))

(declare-fun b!415489 () Bool)

(declare-fun res!241720 () Bool)

(assert (=> b!415489 (=> (not res!241720) (not e!248162))))

(assert (=> b!415489 (= res!241720 (and (= (size!12432 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12431 _keys!709) (size!12432 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17673 () Bool)

(assert (=> mapIsEmpty!17673 mapRes!17673))

(declare-fun b!415490 () Bool)

(declare-fun res!241723 () Bool)

(assert (=> b!415490 (=> (not res!241723) (not e!248162))))

(declare-fun arrayContainsKey!0 (array!25259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!415490 (= res!241723 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!415491 () Bool)

(declare-fun res!241715 () Bool)

(assert (=> b!415491 (=> (not res!241715) (not e!248162))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25259 (_ BitVec 32)) Bool)

(assert (=> b!415491 (= res!241715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!241712 () Bool)

(assert (=> start!39282 (=> (not res!241712) (not e!248162))))

(assert (=> start!39282 (= res!241712 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12431 _keys!709))))))

(assert (=> start!39282 e!248162))

(declare-fun tp_is_empty!10701 () Bool)

(assert (=> start!39282 tp_is_empty!10701))

(assert (=> start!39282 tp!34175))

(assert (=> start!39282 true))

(declare-fun array_inv!8808 (array!25261) Bool)

(assert (=> start!39282 (and (array_inv!8808 _values!549) e!248163)))

(declare-fun array_inv!8809 (array!25259) Bool)

(assert (=> start!39282 (array_inv!8809 _keys!709)))

(declare-fun b!415492 () Bool)

(declare-fun e!248165 () Bool)

(assert (=> b!415492 (= e!248165 tp_is_empty!10701)))

(declare-fun b!415493 () Bool)

(declare-fun res!241721 () Bool)

(assert (=> b!415493 (=> (not res!241721) (not e!248162))))

(assert (=> b!415493 (= res!241721 (validKeyInArray!0 k0!794))))

(declare-fun b!415494 () Bool)

(declare-fun res!241714 () Bool)

(assert (=> b!415494 (=> (not res!241714) (not e!248162))))

(assert (=> b!415494 (= res!241714 (or (= (select (arr!12079 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12079 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!415495 () Bool)

(assert (=> b!415495 (= e!248169 true)))

(declare-fun lt!190265 () array!25261)

(declare-datatypes ((tuple2!7028 0))(
  ( (tuple2!7029 (_1!3525 (_ BitVec 64)) (_2!3525 V!15373)) )
))
(declare-datatypes ((List!7050 0))(
  ( (Nil!7047) (Cons!7046 (h!7902 tuple2!7028) (t!12264 List!7050)) )
))
(declare-datatypes ((ListLongMap!5941 0))(
  ( (ListLongMap!5942 (toList!2986 List!7050)) )
))
(declare-fun lt!190266 () ListLongMap!5941)

(declare-fun +!1190 (ListLongMap!5941 tuple2!7028) ListLongMap!5941)

(declare-fun getCurrentListMapNoExtraKeys!1192 (array!25259 array!25261 (_ BitVec 32) (_ BitVec 32) V!15373 V!15373 (_ BitVec 32) Int) ListLongMap!5941)

(declare-fun get!5964 (ValueCell!5007 V!15373) V!15373)

(declare-fun dynLambda!667 (Int (_ BitVec 64)) V!15373)

(assert (=> b!415495 (= lt!190266 (+!1190 (getCurrentListMapNoExtraKeys!1192 lt!190267 lt!190265 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7029 (select (arr!12079 lt!190267) from!863) (get!5964 (select (arr!12080 lt!190265) from!863) (dynLambda!667 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!415496 () Bool)

(assert (=> b!415496 (= e!248162 e!248166)))

(declare-fun res!241717 () Bool)

(assert (=> b!415496 (=> (not res!241717) (not e!248166))))

(assert (=> b!415496 (= res!241717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190267 mask!1025))))

(assert (=> b!415496 (= lt!190267 (array!25260 (store (arr!12079 _keys!709) i!563 k0!794) (size!12431 _keys!709)))))

(declare-fun b!415497 () Bool)

(assert (=> b!415497 (= e!248161 tp_is_empty!10701)))

(declare-fun bm!28822 () Bool)

(declare-fun call!28826 () ListLongMap!5941)

(assert (=> bm!28822 (= call!28826 (getCurrentListMapNoExtraKeys!1192 (ite c!55037 _keys!709 lt!190267) (ite c!55037 _values!549 lt!190265) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17673 () Bool)

(declare-fun tp!34176 () Bool)

(assert (=> mapNonEmpty!17673 (= mapRes!17673 (and tp!34176 e!248165))))

(declare-fun mapKey!17673 () (_ BitVec 32))

(declare-fun mapRest!17673 () (Array (_ BitVec 32) ValueCell!5007))

(declare-fun mapValue!17673 () ValueCell!5007)

(assert (=> mapNonEmpty!17673 (= (arr!12080 _values!549) (store mapRest!17673 mapKey!17673 mapValue!17673))))

(declare-fun b!415498 () Bool)

(declare-fun res!241718 () Bool)

(assert (=> b!415498 (=> (not res!241718) (not e!248166))))

(assert (=> b!415498 (= res!241718 (bvsle from!863 i!563))))

(declare-fun b!415499 () Bool)

(assert (=> b!415499 (= e!248166 e!248168)))

(declare-fun res!241724 () Bool)

(assert (=> b!415499 (=> (not res!241724) (not e!248168))))

(assert (=> b!415499 (= res!241724 (= from!863 i!563))))

(assert (=> b!415499 (= lt!190266 (getCurrentListMapNoExtraKeys!1192 lt!190267 lt!190265 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!415499 (= lt!190265 (array!25262 (store (arr!12080 _values!549) i!563 (ValueCellFull!5007 v!412)) (size!12432 _values!549)))))

(declare-fun lt!190268 () ListLongMap!5941)

(assert (=> b!415499 (= lt!190268 (getCurrentListMapNoExtraKeys!1192 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun call!28825 () ListLongMap!5941)

(declare-fun bm!28823 () Bool)

(assert (=> bm!28823 (= call!28825 (getCurrentListMapNoExtraKeys!1192 (ite c!55037 lt!190267 _keys!709) (ite c!55037 lt!190265 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415500 () Bool)

(assert (=> b!415500 (= e!248164 (= call!28825 (+!1190 call!28826 (tuple2!7029 k0!794 v!412))))))

(declare-fun b!415501 () Bool)

(assert (=> b!415501 (= e!248164 (= call!28826 call!28825))))

(assert (= (and start!39282 res!241712) b!415488))

(assert (= (and b!415488 res!241722) b!415489))

(assert (= (and b!415489 res!241720) b!415491))

(assert (= (and b!415491 res!241715) b!415484))

(assert (= (and b!415484 res!241716) b!415487))

(assert (= (and b!415487 res!241719) b!415493))

(assert (= (and b!415493 res!241721) b!415494))

(assert (= (and b!415494 res!241714) b!415490))

(assert (= (and b!415490 res!241723) b!415496))

(assert (= (and b!415496 res!241717) b!415483))

(assert (= (and b!415483 res!241713) b!415498))

(assert (= (and b!415498 res!241718) b!415499))

(assert (= (and b!415499 res!241724) b!415486))

(assert (= (and b!415486 c!55037) b!415500))

(assert (= (and b!415486 (not c!55037)) b!415501))

(assert (= (or b!415500 b!415501) bm!28823))

(assert (= (or b!415500 b!415501) bm!28822))

(assert (= (and b!415486 (not res!241725)) b!415495))

(assert (= (and b!415485 condMapEmpty!17673) mapIsEmpty!17673))

(assert (= (and b!415485 (not condMapEmpty!17673)) mapNonEmpty!17673))

(get-info :version)

(assert (= (and mapNonEmpty!17673 ((_ is ValueCellFull!5007) mapValue!17673)) b!415492))

(assert (= (and b!415485 ((_ is ValueCellFull!5007) mapDefault!17673)) b!415497))

(assert (= start!39282 b!415485))

(declare-fun b_lambda!8853 () Bool)

(assert (=> (not b_lambda!8853) (not b!415495)))

(declare-fun t!12262 () Bool)

(declare-fun tb!3171 () Bool)

(assert (=> (and start!39282 (= defaultEntry!557 defaultEntry!557) t!12262) tb!3171))

(declare-fun result!5869 () Bool)

(assert (=> tb!3171 (= result!5869 tp_is_empty!10701)))

(assert (=> b!415495 t!12262))

(declare-fun b_and!16975 () Bool)

(assert (= b_and!16973 (and (=> t!12262 result!5869) b_and!16975)))

(declare-fun m!404615 () Bool)

(assert (=> b!415500 m!404615))

(declare-fun m!404617 () Bool)

(assert (=> b!415486 m!404617))

(assert (=> b!415486 m!404617))

(declare-fun m!404619 () Bool)

(assert (=> b!415486 m!404619))

(declare-fun m!404621 () Bool)

(assert (=> b!415486 m!404621))

(declare-fun m!404623 () Bool)

(assert (=> b!415483 m!404623))

(declare-fun m!404625 () Bool)

(assert (=> b!415495 m!404625))

(declare-fun m!404627 () Bool)

(assert (=> b!415495 m!404627))

(declare-fun m!404629 () Bool)

(assert (=> b!415495 m!404629))

(declare-fun m!404631 () Bool)

(assert (=> b!415495 m!404631))

(declare-fun m!404633 () Bool)

(assert (=> b!415495 m!404633))

(assert (=> b!415495 m!404625))

(assert (=> b!415495 m!404633))

(declare-fun m!404635 () Bool)

(assert (=> b!415495 m!404635))

(assert (=> b!415495 m!404629))

(declare-fun m!404637 () Bool)

(assert (=> b!415488 m!404637))

(declare-fun m!404639 () Bool)

(assert (=> b!415496 m!404639))

(declare-fun m!404641 () Bool)

(assert (=> b!415496 m!404641))

(declare-fun m!404643 () Bool)

(assert (=> b!415493 m!404643))

(declare-fun m!404645 () Bool)

(assert (=> b!415491 m!404645))

(declare-fun m!404647 () Bool)

(assert (=> start!39282 m!404647))

(declare-fun m!404649 () Bool)

(assert (=> start!39282 m!404649))

(declare-fun m!404651 () Bool)

(assert (=> b!415499 m!404651))

(declare-fun m!404653 () Bool)

(assert (=> b!415499 m!404653))

(declare-fun m!404655 () Bool)

(assert (=> b!415499 m!404655))

(declare-fun m!404657 () Bool)

(assert (=> b!415490 m!404657))

(declare-fun m!404659 () Bool)

(assert (=> mapNonEmpty!17673 m!404659))

(declare-fun m!404661 () Bool)

(assert (=> bm!28822 m!404661))

(declare-fun m!404663 () Bool)

(assert (=> b!415494 m!404663))

(declare-fun m!404665 () Bool)

(assert (=> b!415484 m!404665))

(declare-fun m!404667 () Bool)

(assert (=> bm!28823 m!404667))

(check-sat (not bm!28823) (not mapNonEmpty!17673) (not start!39282) (not b!415499) (not b!415495) (not b!415496) tp_is_empty!10701 (not b_lambda!8853) (not b_next!9549) (not b!415483) (not b!415486) (not b!415500) (not b!415491) b_and!16975 (not b!415490) (not b!415484) (not b!415493) (not bm!28822) (not b!415488))
(check-sat b_and!16975 (not b_next!9549))
