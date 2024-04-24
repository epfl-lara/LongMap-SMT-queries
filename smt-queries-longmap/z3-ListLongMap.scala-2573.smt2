; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39242 () Bool)

(assert start!39242)

(declare-fun b_free!9523 () Bool)

(declare-fun b_next!9523 () Bool)

(assert (=> start!39242 (= b_free!9523 (not b_next!9523))))

(declare-fun tp!34098 () Bool)

(declare-fun b_and!16935 () Bool)

(assert (=> start!39242 (= tp!34098 b_and!16935)))

(declare-fun b!414667 () Bool)

(declare-fun e!247783 () Bool)

(declare-fun e!247779 () Bool)

(assert (=> b!414667 (= e!247783 e!247779)))

(declare-fun res!241164 () Bool)

(assert (=> b!414667 (=> (not res!241164) (not e!247779))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!414667 (= res!241164 (= from!863 i!563))))

(declare-datatypes ((V!15339 0))(
  ( (V!15340 (val!5382 Int)) )
))
(declare-fun minValue!515 () V!15339)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4994 0))(
  ( (ValueCellFull!4994 (v!7630 V!15339)) (EmptyCell!4994) )
))
(declare-datatypes ((array!25212 0))(
  ( (array!25213 (arr!12055 (Array (_ BitVec 32) ValueCell!4994)) (size!12407 (_ BitVec 32))) )
))
(declare-fun lt!190089 () array!25212)

(declare-datatypes ((array!25214 0))(
  ( (array!25215 (arr!12056 (Array (_ BitVec 32) (_ BitVec 64))) (size!12408 (_ BitVec 32))) )
))
(declare-fun lt!190092 () array!25214)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15339)

(declare-datatypes ((tuple2!6878 0))(
  ( (tuple2!6879 (_1!3450 (_ BitVec 64)) (_2!3450 V!15339)) )
))
(declare-datatypes ((List!6898 0))(
  ( (Nil!6895) (Cons!6894 (h!7750 tuple2!6878) (t!12078 List!6898)) )
))
(declare-datatypes ((ListLongMap!5793 0))(
  ( (ListLongMap!5794 (toList!2912 List!6898)) )
))
(declare-fun lt!190091 () ListLongMap!5793)

(declare-fun getCurrentListMapNoExtraKeys!1161 (array!25214 array!25212 (_ BitVec 32) (_ BitVec 32) V!15339 V!15339 (_ BitVec 32) Int) ListLongMap!5793)

(assert (=> b!414667 (= lt!190091 (getCurrentListMapNoExtraKeys!1161 lt!190092 lt!190089 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25212)

(declare-fun v!412 () V!15339)

(assert (=> b!414667 (= lt!190089 (array!25213 (store (arr!12055 _values!549) i!563 (ValueCellFull!4994 v!412)) (size!12407 _values!549)))))

(declare-fun lt!190088 () ListLongMap!5793)

(declare-fun _keys!709 () array!25214)

(assert (=> b!414667 (= lt!190088 (getCurrentListMapNoExtraKeys!1161 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun call!28734 () ListLongMap!5793)

(declare-fun call!28735 () ListLongMap!5793)

(declare-fun b!414668 () Bool)

(declare-fun e!247778 () Bool)

(declare-fun +!1188 (ListLongMap!5793 tuple2!6878) ListLongMap!5793)

(assert (=> b!414668 (= e!247778 (= call!28735 (+!1188 call!28734 (tuple2!6879 k0!794 v!412))))))

(declare-fun b!414669 () Bool)

(assert (=> b!414669 (= e!247778 (= call!28734 call!28735))))

(declare-fun bm!28731 () Bool)

(declare-fun c!54975 () Bool)

(assert (=> bm!28731 (= call!28735 (getCurrentListMapNoExtraKeys!1161 (ite c!54975 lt!190092 _keys!709) (ite c!54975 lt!190089 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414670 () Bool)

(declare-fun res!241166 () Bool)

(declare-fun e!247782 () Bool)

(assert (=> b!414670 (=> (not res!241166) (not e!247782))))

(assert (=> b!414670 (= res!241166 (or (= (select (arr!12056 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12056 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!414671 () Bool)

(declare-fun res!241174 () Bool)

(assert (=> b!414671 (=> (not res!241174) (not e!247782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!414671 (= res!241174 (validMask!0 mask!1025))))

(declare-fun b!414672 () Bool)

(declare-fun res!241163 () Bool)

(assert (=> b!414672 (=> (not res!241163) (not e!247782))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!414672 (= res!241163 (validKeyInArray!0 k0!794))))

(declare-fun b!414673 () Bool)

(declare-fun e!247781 () Bool)

(declare-fun tp_is_empty!10675 () Bool)

(assert (=> b!414673 (= e!247781 tp_is_empty!10675)))

(declare-fun b!414674 () Bool)

(declare-fun res!241169 () Bool)

(assert (=> b!414674 (=> (not res!241169) (not e!247782))))

(assert (=> b!414674 (= res!241169 (and (= (size!12407 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12408 _keys!709) (size!12407 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!414675 () Bool)

(declare-fun e!247786 () Bool)

(assert (=> b!414675 (= e!247779 (not e!247786))))

(declare-fun res!241175 () Bool)

(assert (=> b!414675 (=> res!241175 e!247786)))

(assert (=> b!414675 (= res!241175 (validKeyInArray!0 (select (arr!12056 _keys!709) from!863)))))

(assert (=> b!414675 e!247778))

(assert (=> b!414675 (= c!54975 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12259 0))(
  ( (Unit!12260) )
))
(declare-fun lt!190090 () Unit!12259)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!397 (array!25214 array!25212 (_ BitVec 32) (_ BitVec 32) V!15339 V!15339 (_ BitVec 32) (_ BitVec 64) V!15339 (_ BitVec 32) Int) Unit!12259)

(assert (=> b!414675 (= lt!190090 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!397 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414676 () Bool)

(assert (=> b!414676 (= e!247782 e!247783)))

(declare-fun res!241176 () Bool)

(assert (=> b!414676 (=> (not res!241176) (not e!247783))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25214 (_ BitVec 32)) Bool)

(assert (=> b!414676 (= res!241176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190092 mask!1025))))

(assert (=> b!414676 (= lt!190092 (array!25215 (store (arr!12056 _keys!709) i!563 k0!794) (size!12408 _keys!709)))))

(declare-fun bm!28732 () Bool)

(assert (=> bm!28732 (= call!28734 (getCurrentListMapNoExtraKeys!1161 (ite c!54975 _keys!709 lt!190092) (ite c!54975 _values!549 lt!190089) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414677 () Bool)

(declare-fun res!241165 () Bool)

(assert (=> b!414677 (=> (not res!241165) (not e!247782))))

(assert (=> b!414677 (= res!241165 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12408 _keys!709))))))

(declare-fun b!414678 () Bool)

(declare-fun e!247780 () Bool)

(assert (=> b!414678 (= e!247780 tp_is_empty!10675)))

(declare-fun b!414679 () Bool)

(declare-fun res!241171 () Bool)

(assert (=> b!414679 (=> (not res!241171) (not e!247782))))

(declare-fun arrayContainsKey!0 (array!25214 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!414679 (= res!241171 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17634 () Bool)

(declare-fun mapRes!17634 () Bool)

(declare-fun tp!34097 () Bool)

(assert (=> mapNonEmpty!17634 (= mapRes!17634 (and tp!34097 e!247780))))

(declare-fun mapValue!17634 () ValueCell!4994)

(declare-fun mapRest!17634 () (Array (_ BitVec 32) ValueCell!4994))

(declare-fun mapKey!17634 () (_ BitVec 32))

(assert (=> mapNonEmpty!17634 (= (arr!12055 _values!549) (store mapRest!17634 mapKey!17634 mapValue!17634))))

(declare-fun b!414680 () Bool)

(declare-fun res!241173 () Bool)

(assert (=> b!414680 (=> (not res!241173) (not e!247783))))

(declare-datatypes ((List!6899 0))(
  ( (Nil!6896) (Cons!6895 (h!7751 (_ BitVec 64)) (t!12079 List!6899)) )
))
(declare-fun arrayNoDuplicates!0 (array!25214 (_ BitVec 32) List!6899) Bool)

(assert (=> b!414680 (= res!241173 (arrayNoDuplicates!0 lt!190092 #b00000000000000000000000000000000 Nil!6896))))

(declare-fun b!414681 () Bool)

(declare-fun e!247784 () Bool)

(assert (=> b!414681 (= e!247784 (and e!247781 mapRes!17634))))

(declare-fun condMapEmpty!17634 () Bool)

(declare-fun mapDefault!17634 () ValueCell!4994)

(assert (=> b!414681 (= condMapEmpty!17634 (= (arr!12055 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4994)) mapDefault!17634)))))

(declare-fun b!414682 () Bool)

(declare-fun res!241168 () Bool)

(assert (=> b!414682 (=> (not res!241168) (not e!247782))))

(assert (=> b!414682 (= res!241168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!17634 () Bool)

(assert (=> mapIsEmpty!17634 mapRes!17634))

(declare-fun res!241170 () Bool)

(assert (=> start!39242 (=> (not res!241170) (not e!247782))))

(assert (=> start!39242 (= res!241170 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12408 _keys!709))))))

(assert (=> start!39242 e!247782))

(assert (=> start!39242 tp_is_empty!10675))

(assert (=> start!39242 tp!34098))

(assert (=> start!39242 true))

(declare-fun array_inv!8874 (array!25212) Bool)

(assert (=> start!39242 (and (array_inv!8874 _values!549) e!247784)))

(declare-fun array_inv!8875 (array!25214) Bool)

(assert (=> start!39242 (array_inv!8875 _keys!709)))

(declare-fun b!414683 () Bool)

(assert (=> b!414683 (= e!247786 true)))

(declare-fun get!5952 (ValueCell!4994 V!15339) V!15339)

(declare-fun dynLambda!657 (Int (_ BitVec 64)) V!15339)

(assert (=> b!414683 (= lt!190091 (+!1188 (getCurrentListMapNoExtraKeys!1161 lt!190092 lt!190089 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!6879 (select (arr!12056 lt!190092) from!863) (get!5952 (select (arr!12055 lt!190089) from!863) (dynLambda!657 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!414684 () Bool)

(declare-fun res!241167 () Bool)

(assert (=> b!414684 (=> (not res!241167) (not e!247782))))

(assert (=> b!414684 (= res!241167 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6896))))

(declare-fun b!414685 () Bool)

(declare-fun res!241172 () Bool)

(assert (=> b!414685 (=> (not res!241172) (not e!247783))))

(assert (=> b!414685 (= res!241172 (bvsle from!863 i!563))))

(assert (= (and start!39242 res!241170) b!414671))

(assert (= (and b!414671 res!241174) b!414674))

(assert (= (and b!414674 res!241169) b!414682))

(assert (= (and b!414682 res!241168) b!414684))

(assert (= (and b!414684 res!241167) b!414677))

(assert (= (and b!414677 res!241165) b!414672))

(assert (= (and b!414672 res!241163) b!414670))

(assert (= (and b!414670 res!241166) b!414679))

(assert (= (and b!414679 res!241171) b!414676))

(assert (= (and b!414676 res!241176) b!414680))

(assert (= (and b!414680 res!241173) b!414685))

(assert (= (and b!414685 res!241172) b!414667))

(assert (= (and b!414667 res!241164) b!414675))

(assert (= (and b!414675 c!54975) b!414668))

(assert (= (and b!414675 (not c!54975)) b!414669))

(assert (= (or b!414668 b!414669) bm!28731))

(assert (= (or b!414668 b!414669) bm!28732))

(assert (= (and b!414675 (not res!241175)) b!414683))

(assert (= (and b!414681 condMapEmpty!17634) mapIsEmpty!17634))

(assert (= (and b!414681 (not condMapEmpty!17634)) mapNonEmpty!17634))

(get-info :version)

(assert (= (and mapNonEmpty!17634 ((_ is ValueCellFull!4994) mapValue!17634)) b!414678))

(assert (= (and b!414681 ((_ is ValueCellFull!4994) mapDefault!17634)) b!414673))

(assert (= start!39242 b!414681))

(declare-fun b_lambda!8849 () Bool)

(assert (=> (not b_lambda!8849) (not b!414683)))

(declare-fun t!12077 () Bool)

(declare-fun tb!3137 () Bool)

(assert (=> (and start!39242 (= defaultEntry!557 defaultEntry!557) t!12077) tb!3137))

(declare-fun result!5809 () Bool)

(assert (=> tb!3137 (= result!5809 tp_is_empty!10675)))

(assert (=> b!414683 t!12077))

(declare-fun b_and!16937 () Bool)

(assert (= b_and!16935 (and (=> t!12077 result!5809) b_and!16937)))

(declare-fun m!404145 () Bool)

(assert (=> b!414682 m!404145))

(declare-fun m!404147 () Bool)

(assert (=> b!414667 m!404147))

(declare-fun m!404149 () Bool)

(assert (=> b!414667 m!404149))

(declare-fun m!404151 () Bool)

(assert (=> b!414667 m!404151))

(declare-fun m!404153 () Bool)

(assert (=> start!39242 m!404153))

(declare-fun m!404155 () Bool)

(assert (=> start!39242 m!404155))

(declare-fun m!404157 () Bool)

(assert (=> b!414676 m!404157))

(declare-fun m!404159 () Bool)

(assert (=> b!414676 m!404159))

(declare-fun m!404161 () Bool)

(assert (=> b!414675 m!404161))

(assert (=> b!414675 m!404161))

(declare-fun m!404163 () Bool)

(assert (=> b!414675 m!404163))

(declare-fun m!404165 () Bool)

(assert (=> b!414675 m!404165))

(declare-fun m!404167 () Bool)

(assert (=> b!414680 m!404167))

(declare-fun m!404169 () Bool)

(assert (=> b!414668 m!404169))

(declare-fun m!404171 () Bool)

(assert (=> bm!28732 m!404171))

(declare-fun m!404173 () Bool)

(assert (=> mapNonEmpty!17634 m!404173))

(declare-fun m!404175 () Bool)

(assert (=> bm!28731 m!404175))

(declare-fun m!404177 () Bool)

(assert (=> b!414670 m!404177))

(declare-fun m!404179 () Bool)

(assert (=> b!414672 m!404179))

(declare-fun m!404181 () Bool)

(assert (=> b!414683 m!404181))

(declare-fun m!404183 () Bool)

(assert (=> b!414683 m!404183))

(declare-fun m!404185 () Bool)

(assert (=> b!414683 m!404185))

(declare-fun m!404187 () Bool)

(assert (=> b!414683 m!404187))

(assert (=> b!414683 m!404187))

(declare-fun m!404189 () Bool)

(assert (=> b!414683 m!404189))

(assert (=> b!414683 m!404183))

(assert (=> b!414683 m!404181))

(declare-fun m!404191 () Bool)

(assert (=> b!414683 m!404191))

(declare-fun m!404193 () Bool)

(assert (=> b!414671 m!404193))

(declare-fun m!404195 () Bool)

(assert (=> b!414679 m!404195))

(declare-fun m!404197 () Bool)

(assert (=> b!414684 m!404197))

(check-sat tp_is_empty!10675 (not b!414679) (not b!414680) (not b_lambda!8849) (not b!414672) (not b!414682) (not b!414683) (not bm!28732) (not start!39242) (not b!414676) (not bm!28731) (not mapNonEmpty!17634) (not b_next!9523) (not b!414667) (not b!414684) (not b!414668) (not b!414675) b_and!16937 (not b!414671))
(check-sat b_and!16937 (not b_next!9523))
