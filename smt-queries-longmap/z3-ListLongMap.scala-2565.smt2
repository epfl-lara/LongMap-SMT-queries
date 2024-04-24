; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39194 () Bool)

(assert start!39194)

(declare-fun b_free!9475 () Bool)

(declare-fun b_next!9475 () Bool)

(assert (=> start!39194 (= b_free!9475 (not b_next!9475))))

(declare-fun tp!33954 () Bool)

(declare-fun b_and!16875 () Bool)

(assert (=> start!39194 (= tp!33954 b_and!16875)))

(declare-datatypes ((V!15275 0))(
  ( (V!15276 (val!5358 Int)) )
))
(declare-datatypes ((tuple2!6832 0))(
  ( (tuple2!6833 (_1!3427 (_ BitVec 64)) (_2!3427 V!15275)) )
))
(declare-datatypes ((List!6851 0))(
  ( (Nil!6848) (Cons!6847 (h!7703 tuple2!6832) (t!12017 List!6851)) )
))
(declare-datatypes ((ListLongMap!5747 0))(
  ( (ListLongMap!5748 (toList!2889 List!6851)) )
))
(declare-fun call!28590 () ListLongMap!5747)

(declare-fun minValue!515 () V!15275)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4970 0))(
  ( (ValueCellFull!4970 (v!7606 V!15275)) (EmptyCell!4970) )
))
(declare-datatypes ((array!25116 0))(
  ( (array!25117 (arr!12007 (Array (_ BitVec 32) ValueCell!4970)) (size!12359 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25116)

(declare-fun zeroValue!515 () V!15275)

(declare-datatypes ((array!25118 0))(
  ( (array!25119 (arr!12008 (Array (_ BitVec 32) (_ BitVec 64))) (size!12360 (_ BitVec 32))) )
))
(declare-fun lt!189728 () array!25118)

(declare-fun bm!28587 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!25118)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun c!54903 () Bool)

(declare-fun lt!189732 () array!25116)

(declare-fun getCurrentListMapNoExtraKeys!1139 (array!25118 array!25116 (_ BitVec 32) (_ BitVec 32) V!15275 V!15275 (_ BitVec 32) Int) ListLongMap!5747)

(assert (=> bm!28587 (= call!28590 (getCurrentListMapNoExtraKeys!1139 (ite c!54903 _keys!709 lt!189728) (ite c!54903 _values!549 lt!189732) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!240203 () Bool)

(declare-fun e!247178 () Bool)

(assert (=> start!39194 (=> (not res!240203) (not e!247178))))

(assert (=> start!39194 (= res!240203 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12360 _keys!709))))))

(assert (=> start!39194 e!247178))

(declare-fun tp_is_empty!10627 () Bool)

(assert (=> start!39194 tp_is_empty!10627))

(assert (=> start!39194 tp!33954))

(assert (=> start!39194 true))

(declare-fun e!247173 () Bool)

(declare-fun array_inv!8834 (array!25116) Bool)

(assert (=> start!39194 (and (array_inv!8834 _values!549) e!247173)))

(declare-fun array_inv!8835 (array!25118) Bool)

(assert (=> start!39194 (array_inv!8835 _keys!709)))

(declare-fun b!413330 () Bool)

(declare-fun e!247176 () Bool)

(assert (=> b!413330 (= e!247178 e!247176)))

(declare-fun res!240210 () Bool)

(assert (=> b!413330 (=> (not res!240210) (not e!247176))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25118 (_ BitVec 32)) Bool)

(assert (=> b!413330 (= res!240210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189728 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!413330 (= lt!189728 (array!25119 (store (arr!12008 _keys!709) i!563 k0!794) (size!12360 _keys!709)))))

(declare-fun b!413331 () Bool)

(declare-fun res!240199 () Bool)

(assert (=> b!413331 (=> (not res!240199) (not e!247178))))

(assert (=> b!413331 (= res!240199 (and (= (size!12359 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12360 _keys!709) (size!12359 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!413332 () Bool)

(declare-fun e!247180 () Bool)

(declare-fun v!412 () V!15275)

(declare-fun call!28591 () ListLongMap!5747)

(declare-fun +!1168 (ListLongMap!5747 tuple2!6832) ListLongMap!5747)

(assert (=> b!413332 (= e!247180 (= call!28591 (+!1168 call!28590 (tuple2!6833 k0!794 v!412))))))

(declare-fun b!413333 () Bool)

(declare-fun res!240200 () Bool)

(assert (=> b!413333 (=> (not res!240200) (not e!247178))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!413333 (= res!240200 (validMask!0 mask!1025))))

(declare-fun b!413334 () Bool)

(declare-fun e!247177 () Bool)

(assert (=> b!413334 (= e!247177 (not true))))

(assert (=> b!413334 e!247180))

(assert (=> b!413334 (= c!54903 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12227 0))(
  ( (Unit!12228) )
))
(declare-fun lt!189729 () Unit!12227)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!381 (array!25118 array!25116 (_ BitVec 32) (_ BitVec 32) V!15275 V!15275 (_ BitVec 32) (_ BitVec 64) V!15275 (_ BitVec 32) Int) Unit!12227)

(assert (=> b!413334 (= lt!189729 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!381 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413335 () Bool)

(assert (=> b!413335 (= e!247180 (= call!28590 call!28591))))

(declare-fun b!413336 () Bool)

(declare-fun res!240205 () Bool)

(assert (=> b!413336 (=> (not res!240205) (not e!247178))))

(declare-fun arrayContainsKey!0 (array!25118 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!413336 (= res!240205 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!413337 () Bool)

(assert (=> b!413337 (= e!247176 e!247177)))

(declare-fun res!240202 () Bool)

(assert (=> b!413337 (=> (not res!240202) (not e!247177))))

(assert (=> b!413337 (= res!240202 (= from!863 i!563))))

(declare-fun lt!189731 () ListLongMap!5747)

(assert (=> b!413337 (= lt!189731 (getCurrentListMapNoExtraKeys!1139 lt!189728 lt!189732 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!413337 (= lt!189732 (array!25117 (store (arr!12007 _values!549) i!563 (ValueCellFull!4970 v!412)) (size!12359 _values!549)))))

(declare-fun lt!189730 () ListLongMap!5747)

(assert (=> b!413337 (= lt!189730 (getCurrentListMapNoExtraKeys!1139 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!17562 () Bool)

(declare-fun mapRes!17562 () Bool)

(declare-fun tp!33953 () Bool)

(declare-fun e!247175 () Bool)

(assert (=> mapNonEmpty!17562 (= mapRes!17562 (and tp!33953 e!247175))))

(declare-fun mapValue!17562 () ValueCell!4970)

(declare-fun mapRest!17562 () (Array (_ BitVec 32) ValueCell!4970))

(declare-fun mapKey!17562 () (_ BitVec 32))

(assert (=> mapNonEmpty!17562 (= (arr!12007 _values!549) (store mapRest!17562 mapKey!17562 mapValue!17562))))

(declare-fun b!413338 () Bool)

(declare-fun res!240208 () Bool)

(assert (=> b!413338 (=> (not res!240208) (not e!247178))))

(declare-datatypes ((List!6852 0))(
  ( (Nil!6849) (Cons!6848 (h!7704 (_ BitVec 64)) (t!12018 List!6852)) )
))
(declare-fun arrayNoDuplicates!0 (array!25118 (_ BitVec 32) List!6852) Bool)

(assert (=> b!413338 (= res!240208 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6849))))

(declare-fun bm!28588 () Bool)

(assert (=> bm!28588 (= call!28591 (getCurrentListMapNoExtraKeys!1139 (ite c!54903 lt!189728 _keys!709) (ite c!54903 lt!189732 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413339 () Bool)

(declare-fun res!240198 () Bool)

(assert (=> b!413339 (=> (not res!240198) (not e!247178))))

(assert (=> b!413339 (= res!240198 (or (= (select (arr!12008 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12008 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!413340 () Bool)

(declare-fun res!240204 () Bool)

(assert (=> b!413340 (=> (not res!240204) (not e!247178))))

(assert (=> b!413340 (= res!240204 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12360 _keys!709))))))

(declare-fun b!413341 () Bool)

(declare-fun res!240201 () Bool)

(assert (=> b!413341 (=> (not res!240201) (not e!247178))))

(assert (=> b!413341 (= res!240201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!17562 () Bool)

(assert (=> mapIsEmpty!17562 mapRes!17562))

(declare-fun b!413342 () Bool)

(declare-fun e!247179 () Bool)

(assert (=> b!413342 (= e!247179 tp_is_empty!10627)))

(declare-fun b!413343 () Bool)

(declare-fun res!240209 () Bool)

(assert (=> b!413343 (=> (not res!240209) (not e!247176))))

(assert (=> b!413343 (= res!240209 (bvsle from!863 i!563))))

(declare-fun b!413344 () Bool)

(assert (=> b!413344 (= e!247175 tp_is_empty!10627)))

(declare-fun b!413345 () Bool)

(declare-fun res!240207 () Bool)

(assert (=> b!413345 (=> (not res!240207) (not e!247178))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!413345 (= res!240207 (validKeyInArray!0 k0!794))))

(declare-fun b!413346 () Bool)

(assert (=> b!413346 (= e!247173 (and e!247179 mapRes!17562))))

(declare-fun condMapEmpty!17562 () Bool)

(declare-fun mapDefault!17562 () ValueCell!4970)

(assert (=> b!413346 (= condMapEmpty!17562 (= (arr!12007 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4970)) mapDefault!17562)))))

(declare-fun b!413347 () Bool)

(declare-fun res!240206 () Bool)

(assert (=> b!413347 (=> (not res!240206) (not e!247176))))

(assert (=> b!413347 (= res!240206 (arrayNoDuplicates!0 lt!189728 #b00000000000000000000000000000000 Nil!6849))))

(assert (= (and start!39194 res!240203) b!413333))

(assert (= (and b!413333 res!240200) b!413331))

(assert (= (and b!413331 res!240199) b!413341))

(assert (= (and b!413341 res!240201) b!413338))

(assert (= (and b!413338 res!240208) b!413340))

(assert (= (and b!413340 res!240204) b!413345))

(assert (= (and b!413345 res!240207) b!413339))

(assert (= (and b!413339 res!240198) b!413336))

(assert (= (and b!413336 res!240205) b!413330))

(assert (= (and b!413330 res!240210) b!413347))

(assert (= (and b!413347 res!240206) b!413343))

(assert (= (and b!413343 res!240209) b!413337))

(assert (= (and b!413337 res!240202) b!413334))

(assert (= (and b!413334 c!54903) b!413332))

(assert (= (and b!413334 (not c!54903)) b!413335))

(assert (= (or b!413332 b!413335) bm!28588))

(assert (= (or b!413332 b!413335) bm!28587))

(assert (= (and b!413346 condMapEmpty!17562) mapIsEmpty!17562))

(assert (= (and b!413346 (not condMapEmpty!17562)) mapNonEmpty!17562))

(get-info :version)

(assert (= (and mapNonEmpty!17562 ((_ is ValueCellFull!4970) mapValue!17562)) b!413344))

(assert (= (and b!413346 ((_ is ValueCellFull!4970) mapDefault!17562)) b!413342))

(assert (= start!39194 b!413346))

(declare-fun m!403125 () Bool)

(assert (=> start!39194 m!403125))

(declare-fun m!403127 () Bool)

(assert (=> start!39194 m!403127))

(declare-fun m!403129 () Bool)

(assert (=> b!413333 m!403129))

(declare-fun m!403131 () Bool)

(assert (=> b!413337 m!403131))

(declare-fun m!403133 () Bool)

(assert (=> b!413337 m!403133))

(declare-fun m!403135 () Bool)

(assert (=> b!413337 m!403135))

(declare-fun m!403137 () Bool)

(assert (=> b!413345 m!403137))

(declare-fun m!403139 () Bool)

(assert (=> bm!28587 m!403139))

(declare-fun m!403141 () Bool)

(assert (=> b!413347 m!403141))

(declare-fun m!403143 () Bool)

(assert (=> b!413341 m!403143))

(declare-fun m!403145 () Bool)

(assert (=> b!413336 m!403145))

(declare-fun m!403147 () Bool)

(assert (=> b!413330 m!403147))

(declare-fun m!403149 () Bool)

(assert (=> b!413330 m!403149))

(declare-fun m!403151 () Bool)

(assert (=> b!413338 m!403151))

(declare-fun m!403153 () Bool)

(assert (=> b!413332 m!403153))

(declare-fun m!403155 () Bool)

(assert (=> mapNonEmpty!17562 m!403155))

(declare-fun m!403157 () Bool)

(assert (=> b!413339 m!403157))

(declare-fun m!403159 () Bool)

(assert (=> bm!28588 m!403159))

(declare-fun m!403161 () Bool)

(assert (=> b!413334 m!403161))

(check-sat (not b!413332) b_and!16875 tp_is_empty!10627 (not b!413333) (not b!413337) (not b!413336) (not b!413345) (not b!413341) (not bm!28587) (not start!39194) (not bm!28588) (not b!413338) (not b_next!9475) (not b!413347) (not b!413330) (not mapNonEmpty!17562) (not b!413334))
(check-sat b_and!16875 (not b_next!9475))
