; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39260 () Bool)

(assert start!39260)

(declare-fun b_free!9541 () Bool)

(declare-fun b_next!9541 () Bool)

(assert (=> start!39260 (= b_free!9541 (not b_next!9541))))

(declare-fun tp!34152 () Bool)

(declare-fun b_and!16971 () Bool)

(assert (=> start!39260 (= tp!34152 b_and!16971)))

(declare-datatypes ((V!15363 0))(
  ( (V!15364 (val!5391 Int)) )
))
(declare-fun minValue!515 () V!15363)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun c!55002 () Bool)

(declare-datatypes ((ValueCell!5003 0))(
  ( (ValueCellFull!5003 (v!7639 V!15363)) (EmptyCell!5003) )
))
(declare-datatypes ((array!25246 0))(
  ( (array!25247 (arr!12072 (Array (_ BitVec 32) ValueCell!5003)) (size!12424 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25246)

(declare-fun lt!190227 () array!25246)

(declare-fun zeroValue!515 () V!15363)

(declare-datatypes ((tuple2!6892 0))(
  ( (tuple2!6893 (_1!3457 (_ BitVec 64)) (_2!3457 V!15363)) )
))
(declare-datatypes ((List!6912 0))(
  ( (Nil!6909) (Cons!6908 (h!7764 tuple2!6892) (t!12110 List!6912)) )
))
(declare-datatypes ((ListLongMap!5807 0))(
  ( (ListLongMap!5808 (toList!2919 List!6912)) )
))
(declare-fun call!28788 () ListLongMap!5807)

(declare-fun bm!28785 () Bool)

(declare-datatypes ((array!25248 0))(
  ( (array!25249 (arr!12073 (Array (_ BitVec 32) (_ BitVec 64))) (size!12425 (_ BitVec 32))) )
))
(declare-fun lt!190224 () array!25248)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!25248)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1168 (array!25248 array!25246 (_ BitVec 32) (_ BitVec 32) V!15363 V!15363 (_ BitVec 32) Int) ListLongMap!5807)

(assert (=> bm!28785 (= call!28788 (getCurrentListMapNoExtraKeys!1168 (ite c!55002 lt!190224 _keys!709) (ite c!55002 lt!190227 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415198 () Bool)

(declare-fun res!241545 () Bool)

(declare-fun e!248027 () Bool)

(assert (=> b!415198 (=> (not res!241545) (not e!248027))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25248 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!415198 (= res!241545 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!415199 () Bool)

(declare-fun e!248024 () Bool)

(declare-fun e!248026 () Bool)

(assert (=> b!415199 (= e!248024 (not e!248026))))

(declare-fun res!241553 () Bool)

(assert (=> b!415199 (=> res!241553 e!248026)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!415199 (= res!241553 (validKeyInArray!0 (select (arr!12073 _keys!709) from!863)))))

(declare-fun e!248022 () Bool)

(assert (=> b!415199 e!248022))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!415199 (= c!55002 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12271 0))(
  ( (Unit!12272) )
))
(declare-fun lt!190226 () Unit!12271)

(declare-fun v!412 () V!15363)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!403 (array!25248 array!25246 (_ BitVec 32) (_ BitVec 32) V!15363 V!15363 (_ BitVec 32) (_ BitVec 64) V!15363 (_ BitVec 32) Int) Unit!12271)

(assert (=> b!415199 (= lt!190226 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!403 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415201 () Bool)

(declare-fun res!241551 () Bool)

(assert (=> b!415201 (=> (not res!241551) (not e!248027))))

(declare-datatypes ((List!6913 0))(
  ( (Nil!6910) (Cons!6909 (h!7765 (_ BitVec 64)) (t!12111 List!6913)) )
))
(declare-fun arrayNoDuplicates!0 (array!25248 (_ BitVec 32) List!6913) Bool)

(assert (=> b!415201 (= res!241551 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6910))))

(declare-fun b!415202 () Bool)

(declare-fun res!241544 () Bool)

(assert (=> b!415202 (=> (not res!241544) (not e!248027))))

(assert (=> b!415202 (= res!241544 (or (= (select (arr!12073 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12073 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!415203 () Bool)

(declare-fun e!248029 () Bool)

(declare-fun e!248021 () Bool)

(declare-fun mapRes!17661 () Bool)

(assert (=> b!415203 (= e!248029 (and e!248021 mapRes!17661))))

(declare-fun condMapEmpty!17661 () Bool)

(declare-fun mapDefault!17661 () ValueCell!5003)

(assert (=> b!415203 (= condMapEmpty!17661 (= (arr!12072 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5003)) mapDefault!17661)))))

(declare-fun b!415204 () Bool)

(declare-fun call!28789 () ListLongMap!5807)

(declare-fun +!1194 (ListLongMap!5807 tuple2!6892) ListLongMap!5807)

(assert (=> b!415204 (= e!248022 (= call!28788 (+!1194 call!28789 (tuple2!6893 k0!794 v!412))))))

(declare-fun b!415205 () Bool)

(declare-fun tp_is_empty!10693 () Bool)

(assert (=> b!415205 (= e!248021 tp_is_empty!10693)))

(declare-fun bm!28786 () Bool)

(assert (=> bm!28786 (= call!28789 (getCurrentListMapNoExtraKeys!1168 (ite c!55002 _keys!709 lt!190224) (ite c!55002 _values!549 lt!190227) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415206 () Bool)

(declare-fun res!241542 () Bool)

(assert (=> b!415206 (=> (not res!241542) (not e!248027))))

(assert (=> b!415206 (= res!241542 (validKeyInArray!0 k0!794))))

(declare-fun b!415207 () Bool)

(declare-fun res!241549 () Bool)

(assert (=> b!415207 (=> (not res!241549) (not e!248027))))

(assert (=> b!415207 (= res!241549 (and (= (size!12424 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12425 _keys!709) (size!12424 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!415208 () Bool)

(assert (=> b!415208 (= e!248022 (= call!28789 call!28788))))

(declare-fun res!241554 () Bool)

(assert (=> start!39260 (=> (not res!241554) (not e!248027))))

(assert (=> start!39260 (= res!241554 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12425 _keys!709))))))

(assert (=> start!39260 e!248027))

(assert (=> start!39260 tp_is_empty!10693))

(assert (=> start!39260 tp!34152))

(assert (=> start!39260 true))

(declare-fun array_inv!8884 (array!25246) Bool)

(assert (=> start!39260 (and (array_inv!8884 _values!549) e!248029)))

(declare-fun array_inv!8885 (array!25248) Bool)

(assert (=> start!39260 (array_inv!8885 _keys!709)))

(declare-fun b!415200 () Bool)

(declare-fun res!241543 () Bool)

(declare-fun e!248028 () Bool)

(assert (=> b!415200 (=> (not res!241543) (not e!248028))))

(assert (=> b!415200 (= res!241543 (arrayNoDuplicates!0 lt!190224 #b00000000000000000000000000000000 Nil!6910))))

(declare-fun b!415209 () Bool)

(declare-fun res!241541 () Bool)

(assert (=> b!415209 (=> (not res!241541) (not e!248027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25248 (_ BitVec 32)) Bool)

(assert (=> b!415209 (= res!241541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!415210 () Bool)

(declare-fun e!248023 () Bool)

(assert (=> b!415210 (= e!248023 tp_is_empty!10693)))

(declare-fun b!415211 () Bool)

(assert (=> b!415211 (= e!248026 true)))

(declare-fun lt!190223 () ListLongMap!5807)

(declare-fun get!5961 (ValueCell!5003 V!15363) V!15363)

(declare-fun dynLambda!660 (Int (_ BitVec 64)) V!15363)

(assert (=> b!415211 (= lt!190223 (+!1194 (getCurrentListMapNoExtraKeys!1168 lt!190224 lt!190227 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!6893 (select (arr!12073 lt!190224) from!863) (get!5961 (select (arr!12072 lt!190227) from!863) (dynLambda!660 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!415212 () Bool)

(assert (=> b!415212 (= e!248028 e!248024)))

(declare-fun res!241548 () Bool)

(assert (=> b!415212 (=> (not res!241548) (not e!248024))))

(assert (=> b!415212 (= res!241548 (= from!863 i!563))))

(assert (=> b!415212 (= lt!190223 (getCurrentListMapNoExtraKeys!1168 lt!190224 lt!190227 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!415212 (= lt!190227 (array!25247 (store (arr!12072 _values!549) i!563 (ValueCellFull!5003 v!412)) (size!12424 _values!549)))))

(declare-fun lt!190225 () ListLongMap!5807)

(assert (=> b!415212 (= lt!190225 (getCurrentListMapNoExtraKeys!1168 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!17661 () Bool)

(assert (=> mapIsEmpty!17661 mapRes!17661))

(declare-fun b!415213 () Bool)

(declare-fun res!241552 () Bool)

(assert (=> b!415213 (=> (not res!241552) (not e!248027))))

(assert (=> b!415213 (= res!241552 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12425 _keys!709))))))

(declare-fun mapNonEmpty!17661 () Bool)

(declare-fun tp!34151 () Bool)

(assert (=> mapNonEmpty!17661 (= mapRes!17661 (and tp!34151 e!248023))))

(declare-fun mapKey!17661 () (_ BitVec 32))

(declare-fun mapValue!17661 () ValueCell!5003)

(declare-fun mapRest!17661 () (Array (_ BitVec 32) ValueCell!5003))

(assert (=> mapNonEmpty!17661 (= (arr!12072 _values!549) (store mapRest!17661 mapKey!17661 mapValue!17661))))

(declare-fun b!415214 () Bool)

(declare-fun res!241546 () Bool)

(assert (=> b!415214 (=> (not res!241546) (not e!248028))))

(assert (=> b!415214 (= res!241546 (bvsle from!863 i!563))))

(declare-fun b!415215 () Bool)

(assert (=> b!415215 (= e!248027 e!248028)))

(declare-fun res!241547 () Bool)

(assert (=> b!415215 (=> (not res!241547) (not e!248028))))

(assert (=> b!415215 (= res!241547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190224 mask!1025))))

(assert (=> b!415215 (= lt!190224 (array!25249 (store (arr!12073 _keys!709) i!563 k0!794) (size!12425 _keys!709)))))

(declare-fun b!415216 () Bool)

(declare-fun res!241550 () Bool)

(assert (=> b!415216 (=> (not res!241550) (not e!248027))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!415216 (= res!241550 (validMask!0 mask!1025))))

(assert (= (and start!39260 res!241554) b!415216))

(assert (= (and b!415216 res!241550) b!415207))

(assert (= (and b!415207 res!241549) b!415209))

(assert (= (and b!415209 res!241541) b!415201))

(assert (= (and b!415201 res!241551) b!415213))

(assert (= (and b!415213 res!241552) b!415206))

(assert (= (and b!415206 res!241542) b!415202))

(assert (= (and b!415202 res!241544) b!415198))

(assert (= (and b!415198 res!241545) b!415215))

(assert (= (and b!415215 res!241547) b!415200))

(assert (= (and b!415200 res!241543) b!415214))

(assert (= (and b!415214 res!241546) b!415212))

(assert (= (and b!415212 res!241548) b!415199))

(assert (= (and b!415199 c!55002) b!415204))

(assert (= (and b!415199 (not c!55002)) b!415208))

(assert (= (or b!415204 b!415208) bm!28785))

(assert (= (or b!415204 b!415208) bm!28786))

(assert (= (and b!415199 (not res!241553)) b!415211))

(assert (= (and b!415203 condMapEmpty!17661) mapIsEmpty!17661))

(assert (= (and b!415203 (not condMapEmpty!17661)) mapNonEmpty!17661))

(get-info :version)

(assert (= (and mapNonEmpty!17661 ((_ is ValueCellFull!5003) mapValue!17661)) b!415210))

(assert (= (and b!415203 ((_ is ValueCellFull!5003) mapDefault!17661)) b!415205))

(assert (= start!39260 b!415203))

(declare-fun b_lambda!8867 () Bool)

(assert (=> (not b_lambda!8867) (not b!415211)))

(declare-fun t!12109 () Bool)

(declare-fun tb!3155 () Bool)

(assert (=> (and start!39260 (= defaultEntry!557 defaultEntry!557) t!12109) tb!3155))

(declare-fun result!5845 () Bool)

(assert (=> tb!3155 (= result!5845 tp_is_empty!10693)))

(assert (=> b!415211 t!12109))

(declare-fun b_and!16973 () Bool)

(assert (= b_and!16971 (and (=> t!12109 result!5845) b_and!16973)))

(declare-fun m!404631 () Bool)

(assert (=> b!415199 m!404631))

(assert (=> b!415199 m!404631))

(declare-fun m!404633 () Bool)

(assert (=> b!415199 m!404633))

(declare-fun m!404635 () Bool)

(assert (=> b!415199 m!404635))

(declare-fun m!404637 () Bool)

(assert (=> b!415212 m!404637))

(declare-fun m!404639 () Bool)

(assert (=> b!415212 m!404639))

(declare-fun m!404641 () Bool)

(assert (=> b!415212 m!404641))

(declare-fun m!404643 () Bool)

(assert (=> b!415200 m!404643))

(declare-fun m!404645 () Bool)

(assert (=> b!415216 m!404645))

(declare-fun m!404647 () Bool)

(assert (=> b!415204 m!404647))

(declare-fun m!404649 () Bool)

(assert (=> start!39260 m!404649))

(declare-fun m!404651 () Bool)

(assert (=> start!39260 m!404651))

(declare-fun m!404653 () Bool)

(assert (=> b!415209 m!404653))

(declare-fun m!404655 () Bool)

(assert (=> b!415215 m!404655))

(declare-fun m!404657 () Bool)

(assert (=> b!415215 m!404657))

(declare-fun m!404659 () Bool)

(assert (=> bm!28785 m!404659))

(declare-fun m!404661 () Bool)

(assert (=> bm!28786 m!404661))

(declare-fun m!404663 () Bool)

(assert (=> b!415198 m!404663))

(declare-fun m!404665 () Bool)

(assert (=> b!415201 m!404665))

(declare-fun m!404667 () Bool)

(assert (=> mapNonEmpty!17661 m!404667))

(declare-fun m!404669 () Bool)

(assert (=> b!415202 m!404669))

(declare-fun m!404671 () Bool)

(assert (=> b!415206 m!404671))

(declare-fun m!404673 () Bool)

(assert (=> b!415211 m!404673))

(declare-fun m!404675 () Bool)

(assert (=> b!415211 m!404675))

(declare-fun m!404677 () Bool)

(assert (=> b!415211 m!404677))

(declare-fun m!404679 () Bool)

(assert (=> b!415211 m!404679))

(assert (=> b!415211 m!404673))

(declare-fun m!404681 () Bool)

(assert (=> b!415211 m!404681))

(assert (=> b!415211 m!404679))

(declare-fun m!404683 () Bool)

(assert (=> b!415211 m!404683))

(assert (=> b!415211 m!404675))

(check-sat tp_is_empty!10693 (not b!415199) (not bm!28785) (not bm!28786) (not mapNonEmpty!17661) b_and!16973 (not b!415204) (not b!415215) (not b!415201) (not b_lambda!8867) (not b!415211) (not b!415212) (not b_next!9541) (not b!415200) (not b!415209) (not b!415206) (not b!415216) (not b!415198) (not start!39260))
(check-sat b_and!16973 (not b_next!9541))
