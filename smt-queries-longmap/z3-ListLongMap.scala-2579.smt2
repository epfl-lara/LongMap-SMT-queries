; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39278 () Bool)

(assert start!39278)

(declare-fun b_free!9559 () Bool)

(declare-fun b_next!9559 () Bool)

(assert (=> start!39278 (= b_free!9559 (not b_next!9559))))

(declare-fun tp!34205 () Bool)

(declare-fun b_and!16967 () Bool)

(assert (=> start!39278 (= tp!34205 b_and!16967)))

(declare-fun b!415507 () Bool)

(declare-fun e!248124 () Bool)

(declare-fun e!248123 () Bool)

(assert (=> b!415507 (= e!248124 e!248123)))

(declare-fun res!241801 () Bool)

(assert (=> b!415507 (=> (not res!241801) (not e!248123))))

(declare-datatypes ((array!25269 0))(
  ( (array!25270 (arr!12084 (Array (_ BitVec 32) (_ BitVec 64))) (size!12437 (_ BitVec 32))) )
))
(declare-fun lt!190105 () array!25269)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25269 (_ BitVec 32)) Bool)

(assert (=> b!415507 (= res!241801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190105 mask!1025))))

(declare-fun _keys!709 () array!25269)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!415507 (= lt!190105 (array!25270 (store (arr!12084 _keys!709) i!563 k0!794) (size!12437 _keys!709)))))

(declare-fun b!415508 () Bool)

(declare-fun res!241799 () Bool)

(assert (=> b!415508 (=> (not res!241799) (not e!248124))))

(declare-datatypes ((List!7029 0))(
  ( (Nil!7026) (Cons!7025 (h!7881 (_ BitVec 64)) (t!12244 List!7029)) )
))
(declare-fun arrayNoDuplicates!0 (array!25269 (_ BitVec 32) List!7029) Bool)

(assert (=> b!415508 (= res!241799 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7026))))

(declare-fun b!415509 () Bool)

(declare-fun e!248130 () Bool)

(declare-datatypes ((V!15387 0))(
  ( (V!15388 (val!5400 Int)) )
))
(declare-datatypes ((tuple2!7020 0))(
  ( (tuple2!7021 (_1!3521 (_ BitVec 64)) (_2!3521 V!15387)) )
))
(declare-datatypes ((List!7030 0))(
  ( (Nil!7027) (Cons!7026 (h!7882 tuple2!7020) (t!12245 List!7030)) )
))
(declare-datatypes ((ListLongMap!5923 0))(
  ( (ListLongMap!5924 (toList!2977 List!7030)) )
))
(declare-fun call!28830 () ListLongMap!5923)

(declare-fun call!28831 () ListLongMap!5923)

(assert (=> b!415509 (= e!248130 (= call!28830 call!28831))))

(declare-fun res!241803 () Bool)

(assert (=> start!39278 (=> (not res!241803) (not e!248124))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39278 (= res!241803 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12437 _keys!709))))))

(assert (=> start!39278 e!248124))

(declare-fun tp_is_empty!10711 () Bool)

(assert (=> start!39278 tp_is_empty!10711))

(assert (=> start!39278 tp!34205))

(assert (=> start!39278 true))

(declare-datatypes ((ValueCell!5012 0))(
  ( (ValueCellFull!5012 (v!7641 V!15387)) (EmptyCell!5012) )
))
(declare-datatypes ((array!25271 0))(
  ( (array!25272 (arr!12085 (Array (_ BitVec 32) ValueCell!5012)) (size!12438 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25271)

(declare-fun e!248129 () Bool)

(declare-fun array_inv!8856 (array!25271) Bool)

(assert (=> start!39278 (and (array_inv!8856 _values!549) e!248129)))

(declare-fun array_inv!8857 (array!25269) Bool)

(assert (=> start!39278 (array_inv!8857 _keys!709)))

(declare-fun b!415510 () Bool)

(declare-fun res!241797 () Bool)

(assert (=> b!415510 (=> (not res!241797) (not e!248123))))

(assert (=> b!415510 (= res!241797 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!17688 () Bool)

(declare-fun mapRes!17688 () Bool)

(declare-fun tp!34206 () Bool)

(declare-fun e!248127 () Bool)

(assert (=> mapNonEmpty!17688 (= mapRes!17688 (and tp!34206 e!248127))))

(declare-fun mapKey!17688 () (_ BitVec 32))

(declare-fun mapRest!17688 () (Array (_ BitVec 32) ValueCell!5012))

(declare-fun mapValue!17688 () ValueCell!5012)

(assert (=> mapNonEmpty!17688 (= (arr!12085 _values!549) (store mapRest!17688 mapKey!17688 mapValue!17688))))

(declare-fun b!415511 () Bool)

(declare-fun res!241795 () Bool)

(assert (=> b!415511 (=> (not res!241795) (not e!248124))))

(assert (=> b!415511 (= res!241795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun bm!28827 () Bool)

(declare-fun minValue!515 () V!15387)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!190106 () array!25271)

(declare-fun zeroValue!515 () V!15387)

(declare-fun c!54981 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1188 (array!25269 array!25271 (_ BitVec 32) (_ BitVec 32) V!15387 V!15387 (_ BitVec 32) Int) ListLongMap!5923)

(assert (=> bm!28827 (= call!28831 (getCurrentListMapNoExtraKeys!1188 (ite c!54981 lt!190105 _keys!709) (ite c!54981 lt!190106 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415512 () Bool)

(declare-fun res!241806 () Bool)

(assert (=> b!415512 (=> (not res!241806) (not e!248124))))

(declare-fun arrayContainsKey!0 (array!25269 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!415512 (= res!241806 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!415513 () Bool)

(declare-fun e!248122 () Bool)

(assert (=> b!415513 (= e!248122 tp_is_empty!10711)))

(declare-fun bm!28828 () Bool)

(assert (=> bm!28828 (= call!28830 (getCurrentListMapNoExtraKeys!1188 (ite c!54981 _keys!709 lt!190105) (ite c!54981 _values!549 lt!190106) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415514 () Bool)

(declare-fun res!241804 () Bool)

(assert (=> b!415514 (=> (not res!241804) (not e!248124))))

(assert (=> b!415514 (= res!241804 (and (= (size!12438 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12437 _keys!709) (size!12438 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun v!412 () V!15387)

(declare-fun b!415515 () Bool)

(declare-fun +!1209 (ListLongMap!5923 tuple2!7020) ListLongMap!5923)

(assert (=> b!415515 (= e!248130 (= call!28831 (+!1209 call!28830 (tuple2!7021 k0!794 v!412))))))

(declare-fun mapIsEmpty!17688 () Bool)

(assert (=> mapIsEmpty!17688 mapRes!17688))

(declare-fun b!415516 () Bool)

(declare-fun res!241793 () Bool)

(assert (=> b!415516 (=> (not res!241793) (not e!248124))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!415516 (= res!241793 (validKeyInArray!0 k0!794))))

(declare-fun b!415517 () Bool)

(assert (=> b!415517 (= e!248129 (and e!248122 mapRes!17688))))

(declare-fun condMapEmpty!17688 () Bool)

(declare-fun mapDefault!17688 () ValueCell!5012)

(assert (=> b!415517 (= condMapEmpty!17688 (= (arr!12085 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5012)) mapDefault!17688)))))

(declare-fun b!415518 () Bool)

(declare-fun e!248126 () Bool)

(declare-fun e!248125 () Bool)

(assert (=> b!415518 (= e!248126 (not e!248125))))

(declare-fun res!241800 () Bool)

(assert (=> b!415518 (=> res!241800 e!248125)))

(assert (=> b!415518 (= res!241800 (validKeyInArray!0 (select (arr!12084 _keys!709) from!863)))))

(assert (=> b!415518 e!248130))

(assert (=> b!415518 (= c!54981 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12258 0))(
  ( (Unit!12259) )
))
(declare-fun lt!190108 () Unit!12258)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!392 (array!25269 array!25271 (_ BitVec 32) (_ BitVec 32) V!15387 V!15387 (_ BitVec 32) (_ BitVec 64) V!15387 (_ BitVec 32) Int) Unit!12258)

(assert (=> b!415518 (= lt!190108 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!392 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415519 () Bool)

(declare-fun res!241796 () Bool)

(assert (=> b!415519 (=> (not res!241796) (not e!248124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!415519 (= res!241796 (validMask!0 mask!1025))))

(declare-fun b!415520 () Bool)

(declare-fun res!241794 () Bool)

(assert (=> b!415520 (=> (not res!241794) (not e!248124))))

(assert (=> b!415520 (= res!241794 (or (= (select (arr!12084 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12084 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!415521 () Bool)

(assert (=> b!415521 (= e!248123 e!248126)))

(declare-fun res!241805 () Bool)

(assert (=> b!415521 (=> (not res!241805) (not e!248126))))

(assert (=> b!415521 (= res!241805 (= from!863 i!563))))

(declare-fun lt!190107 () ListLongMap!5923)

(assert (=> b!415521 (= lt!190107 (getCurrentListMapNoExtraKeys!1188 lt!190105 lt!190106 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!415521 (= lt!190106 (array!25272 (store (arr!12085 _values!549) i!563 (ValueCellFull!5012 v!412)) (size!12438 _values!549)))))

(declare-fun lt!190109 () ListLongMap!5923)

(assert (=> b!415521 (= lt!190109 (getCurrentListMapNoExtraKeys!1188 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!415522 () Bool)

(assert (=> b!415522 (= e!248127 tp_is_empty!10711)))

(declare-fun b!415523 () Bool)

(assert (=> b!415523 (= e!248125 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!12437 _keys!709))))))

(declare-fun get!5960 (ValueCell!5012 V!15387) V!15387)

(declare-fun dynLambda!656 (Int (_ BitVec 64)) V!15387)

(assert (=> b!415523 (= lt!190107 (+!1209 (getCurrentListMapNoExtraKeys!1188 lt!190105 lt!190106 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7021 (select (arr!12084 lt!190105) from!863) (get!5960 (select (arr!12085 lt!190106) from!863) (dynLambda!656 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!415524 () Bool)

(declare-fun res!241798 () Bool)

(assert (=> b!415524 (=> (not res!241798) (not e!248124))))

(assert (=> b!415524 (= res!241798 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12437 _keys!709))))))

(declare-fun b!415525 () Bool)

(declare-fun res!241802 () Bool)

(assert (=> b!415525 (=> (not res!241802) (not e!248123))))

(assert (=> b!415525 (= res!241802 (arrayNoDuplicates!0 lt!190105 #b00000000000000000000000000000000 Nil!7026))))

(assert (= (and start!39278 res!241803) b!415519))

(assert (= (and b!415519 res!241796) b!415514))

(assert (= (and b!415514 res!241804) b!415511))

(assert (= (and b!415511 res!241795) b!415508))

(assert (= (and b!415508 res!241799) b!415524))

(assert (= (and b!415524 res!241798) b!415516))

(assert (= (and b!415516 res!241793) b!415520))

(assert (= (and b!415520 res!241794) b!415512))

(assert (= (and b!415512 res!241806) b!415507))

(assert (= (and b!415507 res!241801) b!415525))

(assert (= (and b!415525 res!241802) b!415510))

(assert (= (and b!415510 res!241797) b!415521))

(assert (= (and b!415521 res!241805) b!415518))

(assert (= (and b!415518 c!54981) b!415515))

(assert (= (and b!415518 (not c!54981)) b!415509))

(assert (= (or b!415515 b!415509) bm!28827))

(assert (= (or b!415515 b!415509) bm!28828))

(assert (= (and b!415518 (not res!241800)) b!415523))

(assert (= (and b!415517 condMapEmpty!17688) mapIsEmpty!17688))

(assert (= (and b!415517 (not condMapEmpty!17688)) mapNonEmpty!17688))

(get-info :version)

(assert (= (and mapNonEmpty!17688 ((_ is ValueCellFull!5012) mapValue!17688)) b!415522))

(assert (= (and b!415517 ((_ is ValueCellFull!5012) mapDefault!17688)) b!415513))

(assert (= start!39278 b!415517))

(declare-fun b_lambda!8845 () Bool)

(assert (=> (not b_lambda!8845) (not b!415523)))

(declare-fun t!12243 () Bool)

(declare-fun tb!3173 () Bool)

(assert (=> (and start!39278 (= defaultEntry!557 defaultEntry!557) t!12243) tb!3173))

(declare-fun result!5881 () Bool)

(assert (=> tb!3173 (= result!5881 tp_is_empty!10711)))

(assert (=> b!415523 t!12243))

(declare-fun b_and!16969 () Bool)

(assert (= b_and!16967 (and (=> t!12243 result!5881) b_and!16969)))

(declare-fun m!404159 () Bool)

(assert (=> b!415507 m!404159))

(declare-fun m!404161 () Bool)

(assert (=> b!415507 m!404161))

(declare-fun m!404163 () Bool)

(assert (=> b!415515 m!404163))

(declare-fun m!404165 () Bool)

(assert (=> bm!28827 m!404165))

(declare-fun m!404167 () Bool)

(assert (=> b!415518 m!404167))

(assert (=> b!415518 m!404167))

(declare-fun m!404169 () Bool)

(assert (=> b!415518 m!404169))

(declare-fun m!404171 () Bool)

(assert (=> b!415518 m!404171))

(declare-fun m!404173 () Bool)

(assert (=> b!415520 m!404173))

(declare-fun m!404175 () Bool)

(assert (=> b!415521 m!404175))

(declare-fun m!404177 () Bool)

(assert (=> b!415521 m!404177))

(declare-fun m!404179 () Bool)

(assert (=> b!415521 m!404179))

(declare-fun m!404181 () Bool)

(assert (=> b!415508 m!404181))

(declare-fun m!404183 () Bool)

(assert (=> b!415516 m!404183))

(declare-fun m!404185 () Bool)

(assert (=> b!415519 m!404185))

(declare-fun m!404187 () Bool)

(assert (=> b!415523 m!404187))

(declare-fun m!404189 () Bool)

(assert (=> b!415523 m!404189))

(declare-fun m!404191 () Bool)

(assert (=> b!415523 m!404191))

(assert (=> b!415523 m!404189))

(declare-fun m!404193 () Bool)

(assert (=> b!415523 m!404193))

(declare-fun m!404195 () Bool)

(assert (=> b!415523 m!404195))

(declare-fun m!404197 () Bool)

(assert (=> b!415523 m!404197))

(assert (=> b!415523 m!404195))

(assert (=> b!415523 m!404187))

(declare-fun m!404199 () Bool)

(assert (=> b!415525 m!404199))

(declare-fun m!404201 () Bool)

(assert (=> b!415511 m!404201))

(declare-fun m!404203 () Bool)

(assert (=> mapNonEmpty!17688 m!404203))

(declare-fun m!404205 () Bool)

(assert (=> bm!28828 m!404205))

(declare-fun m!404207 () Bool)

(assert (=> start!39278 m!404207))

(declare-fun m!404209 () Bool)

(assert (=> start!39278 m!404209))

(declare-fun m!404211 () Bool)

(assert (=> b!415512 m!404211))

(check-sat (not b!415507) (not bm!28827) (not start!39278) (not bm!28828) (not b!415516) (not b_next!9559) (not b!415518) (not b!415508) (not b!415511) (not b!415521) b_and!16969 (not mapNonEmpty!17688) (not b_lambda!8845) tp_is_empty!10711 (not b!415519) (not b!415523) (not b!415515) (not b!415525) (not b!415512))
(check-sat b_and!16969 (not b_next!9559))
