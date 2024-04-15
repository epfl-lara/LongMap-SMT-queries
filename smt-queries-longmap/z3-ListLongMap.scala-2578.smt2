; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39272 () Bool)

(assert start!39272)

(declare-fun b_free!9553 () Bool)

(declare-fun b_next!9553 () Bool)

(assert (=> start!39272 (= b_free!9553 (not b_next!9553))))

(declare-fun tp!34187 () Bool)

(declare-fun b_and!16955 () Bool)

(assert (=> start!39272 (= tp!34187 b_and!16955)))

(declare-fun b!415330 () Bool)

(declare-fun res!241676 () Bool)

(declare-fun e!248041 () Bool)

(assert (=> b!415330 (=> (not res!241676) (not e!248041))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!415330 (= res!241676 (bvsle from!863 i!563))))

(declare-fun b!415331 () Bool)

(declare-fun e!248047 () Bool)

(declare-fun tp_is_empty!10705 () Bool)

(assert (=> b!415331 (= e!248047 tp_is_empty!10705)))

(declare-fun b!415332 () Bool)

(declare-fun res!241675 () Bool)

(declare-fun e!248043 () Bool)

(assert (=> b!415332 (=> (not res!241675) (not e!248043))))

(declare-datatypes ((array!25257 0))(
  ( (array!25258 (arr!12078 (Array (_ BitVec 32) (_ BitVec 64))) (size!12431 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25257)

(assert (=> b!415332 (= res!241675 (or (= (select (arr!12078 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12078 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!415333 () Bool)

(declare-fun res!241680 () Bool)

(assert (=> b!415333 (=> (not res!241680) (not e!248043))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!415333 (= res!241680 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!415334 () Bool)

(declare-fun res!241677 () Bool)

(assert (=> b!415334 (=> (not res!241677) (not e!248043))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!415334 (= res!241677 (validKeyInArray!0 k0!794))))

(declare-datatypes ((V!15379 0))(
  ( (V!15380 (val!5397 Int)) )
))
(declare-datatypes ((tuple2!7014 0))(
  ( (tuple2!7015 (_1!3518 (_ BitVec 64)) (_2!3518 V!15379)) )
))
(declare-datatypes ((List!7024 0))(
  ( (Nil!7021) (Cons!7020 (h!7876 tuple2!7014) (t!12233 List!7024)) )
))
(declare-datatypes ((ListLongMap!5917 0))(
  ( (ListLongMap!5918 (toList!2974 List!7024)) )
))
(declare-fun call!28813 () ListLongMap!5917)

(declare-fun minValue!515 () V!15379)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5009 0))(
  ( (ValueCellFull!5009 (v!7638 V!15379)) (EmptyCell!5009) )
))
(declare-datatypes ((array!25259 0))(
  ( (array!25260 (arr!12079 (Array (_ BitVec 32) ValueCell!5009)) (size!12432 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25259)

(declare-fun zeroValue!515 () V!15379)

(declare-fun bm!28809 () Bool)

(declare-fun lt!190062 () array!25257)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun c!54972 () Bool)

(declare-fun lt!190061 () array!25259)

(declare-fun getCurrentListMapNoExtraKeys!1185 (array!25257 array!25259 (_ BitVec 32) (_ BitVec 32) V!15379 V!15379 (_ BitVec 32) Int) ListLongMap!5917)

(assert (=> bm!28809 (= call!28813 (getCurrentListMapNoExtraKeys!1185 (ite c!54972 lt!190062 _keys!709) (ite c!54972 lt!190061 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415335 () Bool)

(declare-fun e!248042 () Bool)

(declare-fun e!248049 () Bool)

(declare-fun mapRes!17679 () Bool)

(assert (=> b!415335 (= e!248042 (and e!248049 mapRes!17679))))

(declare-fun condMapEmpty!17679 () Bool)

(declare-fun mapDefault!17679 () ValueCell!5009)

(assert (=> b!415335 (= condMapEmpty!17679 (= (arr!12079 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5009)) mapDefault!17679)))))

(declare-fun b!415336 () Bool)

(declare-fun res!241670 () Bool)

(assert (=> b!415336 (=> (not res!241670) (not e!248043))))

(assert (=> b!415336 (= res!241670 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12431 _keys!709))))))

(declare-fun b!415338 () Bool)

(declare-fun res!241673 () Bool)

(assert (=> b!415338 (=> (not res!241673) (not e!248043))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25257 (_ BitVec 32)) Bool)

(assert (=> b!415338 (= res!241673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!17679 () Bool)

(declare-fun tp!34188 () Bool)

(assert (=> mapNonEmpty!17679 (= mapRes!17679 (and tp!34188 e!248047))))

(declare-fun mapValue!17679 () ValueCell!5009)

(declare-fun mapKey!17679 () (_ BitVec 32))

(declare-fun mapRest!17679 () (Array (_ BitVec 32) ValueCell!5009))

(assert (=> mapNonEmpty!17679 (= (arr!12079 _values!549) (store mapRest!17679 mapKey!17679 mapValue!17679))))

(declare-fun b!415339 () Bool)

(declare-fun e!248046 () Bool)

(assert (=> b!415339 (= e!248046 true)))

(declare-fun lt!190060 () ListLongMap!5917)

(declare-fun +!1207 (ListLongMap!5917 tuple2!7014) ListLongMap!5917)

(declare-fun get!5957 (ValueCell!5009 V!15379) V!15379)

(declare-fun dynLambda!655 (Int (_ BitVec 64)) V!15379)

(assert (=> b!415339 (= lt!190060 (+!1207 (getCurrentListMapNoExtraKeys!1185 lt!190062 lt!190061 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7015 (select (arr!12078 lt!190062) from!863) (get!5957 (select (arr!12079 lt!190061) from!863) (dynLambda!655 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!415340 () Bool)

(declare-fun e!248045 () Bool)

(assert (=> b!415340 (= e!248045 (not e!248046))))

(declare-fun res!241667 () Bool)

(assert (=> b!415340 (=> res!241667 e!248046)))

(assert (=> b!415340 (= res!241667 (validKeyInArray!0 (select (arr!12078 _keys!709) from!863)))))

(declare-fun e!248044 () Bool)

(assert (=> b!415340 e!248044))

(assert (=> b!415340 (= c!54972 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12256 0))(
  ( (Unit!12257) )
))
(declare-fun lt!190063 () Unit!12256)

(declare-fun v!412 () V!15379)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!391 (array!25257 array!25259 (_ BitVec 32) (_ BitVec 32) V!15379 V!15379 (_ BitVec 32) (_ BitVec 64) V!15379 (_ BitVec 32) Int) Unit!12256)

(assert (=> b!415340 (= lt!190063 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!391 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415341 () Bool)

(declare-fun res!241669 () Bool)

(assert (=> b!415341 (=> (not res!241669) (not e!248043))))

(assert (=> b!415341 (= res!241669 (and (= (size!12432 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12431 _keys!709) (size!12432 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!415342 () Bool)

(declare-fun call!28812 () ListLongMap!5917)

(assert (=> b!415342 (= e!248044 (= call!28812 call!28813))))

(declare-fun b!415343 () Bool)

(declare-fun res!241678 () Bool)

(assert (=> b!415343 (=> (not res!241678) (not e!248043))))

(declare-datatypes ((List!7025 0))(
  ( (Nil!7022) (Cons!7021 (h!7877 (_ BitVec 64)) (t!12234 List!7025)) )
))
(declare-fun arrayNoDuplicates!0 (array!25257 (_ BitVec 32) List!7025) Bool)

(assert (=> b!415343 (= res!241678 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7022))))

(declare-fun b!415344 () Bool)

(declare-fun res!241672 () Bool)

(assert (=> b!415344 (=> (not res!241672) (not e!248043))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!415344 (= res!241672 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!17679 () Bool)

(assert (=> mapIsEmpty!17679 mapRes!17679))

(declare-fun res!241679 () Bool)

(assert (=> start!39272 (=> (not res!241679) (not e!248043))))

(assert (=> start!39272 (= res!241679 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12431 _keys!709))))))

(assert (=> start!39272 e!248043))

(assert (=> start!39272 tp_is_empty!10705))

(assert (=> start!39272 tp!34187))

(assert (=> start!39272 true))

(declare-fun array_inv!8854 (array!25259) Bool)

(assert (=> start!39272 (and (array_inv!8854 _values!549) e!248042)))

(declare-fun array_inv!8855 (array!25257) Bool)

(assert (=> start!39272 (array_inv!8855 _keys!709)))

(declare-fun b!415337 () Bool)

(assert (=> b!415337 (= e!248043 e!248041)))

(declare-fun res!241674 () Bool)

(assert (=> b!415337 (=> (not res!241674) (not e!248041))))

(assert (=> b!415337 (= res!241674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190062 mask!1025))))

(assert (=> b!415337 (= lt!190062 (array!25258 (store (arr!12078 _keys!709) i!563 k0!794) (size!12431 _keys!709)))))

(declare-fun b!415345 () Bool)

(assert (=> b!415345 (= e!248041 e!248045)))

(declare-fun res!241668 () Bool)

(assert (=> b!415345 (=> (not res!241668) (not e!248045))))

(assert (=> b!415345 (= res!241668 (= from!863 i!563))))

(assert (=> b!415345 (= lt!190060 (getCurrentListMapNoExtraKeys!1185 lt!190062 lt!190061 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!415345 (= lt!190061 (array!25260 (store (arr!12079 _values!549) i!563 (ValueCellFull!5009 v!412)) (size!12432 _values!549)))))

(declare-fun lt!190064 () ListLongMap!5917)

(assert (=> b!415345 (= lt!190064 (getCurrentListMapNoExtraKeys!1185 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun bm!28810 () Bool)

(assert (=> bm!28810 (= call!28812 (getCurrentListMapNoExtraKeys!1185 (ite c!54972 _keys!709 lt!190062) (ite c!54972 _values!549 lt!190061) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415346 () Bool)

(assert (=> b!415346 (= e!248044 (= call!28813 (+!1207 call!28812 (tuple2!7015 k0!794 v!412))))))

(declare-fun b!415347 () Bool)

(assert (=> b!415347 (= e!248049 tp_is_empty!10705)))

(declare-fun b!415348 () Bool)

(declare-fun res!241671 () Bool)

(assert (=> b!415348 (=> (not res!241671) (not e!248041))))

(assert (=> b!415348 (= res!241671 (arrayNoDuplicates!0 lt!190062 #b00000000000000000000000000000000 Nil!7022))))

(assert (= (and start!39272 res!241679) b!415344))

(assert (= (and b!415344 res!241672) b!415341))

(assert (= (and b!415341 res!241669) b!415338))

(assert (= (and b!415338 res!241673) b!415343))

(assert (= (and b!415343 res!241678) b!415336))

(assert (= (and b!415336 res!241670) b!415334))

(assert (= (and b!415334 res!241677) b!415332))

(assert (= (and b!415332 res!241675) b!415333))

(assert (= (and b!415333 res!241680) b!415337))

(assert (= (and b!415337 res!241674) b!415348))

(assert (= (and b!415348 res!241671) b!415330))

(assert (= (and b!415330 res!241676) b!415345))

(assert (= (and b!415345 res!241668) b!415340))

(assert (= (and b!415340 c!54972) b!415346))

(assert (= (and b!415340 (not c!54972)) b!415342))

(assert (= (or b!415346 b!415342) bm!28809))

(assert (= (or b!415346 b!415342) bm!28810))

(assert (= (and b!415340 (not res!241667)) b!415339))

(assert (= (and b!415335 condMapEmpty!17679) mapIsEmpty!17679))

(assert (= (and b!415335 (not condMapEmpty!17679)) mapNonEmpty!17679))

(get-info :version)

(assert (= (and mapNonEmpty!17679 ((_ is ValueCellFull!5009) mapValue!17679)) b!415331))

(assert (= (and b!415335 ((_ is ValueCellFull!5009) mapDefault!17679)) b!415347))

(assert (= start!39272 b!415335))

(declare-fun b_lambda!8839 () Bool)

(assert (=> (not b_lambda!8839) (not b!415339)))

(declare-fun t!12232 () Bool)

(declare-fun tb!3167 () Bool)

(assert (=> (and start!39272 (= defaultEntry!557 defaultEntry!557) t!12232) tb!3167))

(declare-fun result!5869 () Bool)

(assert (=> tb!3167 (= result!5869 tp_is_empty!10705)))

(assert (=> b!415339 t!12232))

(declare-fun b_and!16957 () Bool)

(assert (= b_and!16955 (and (=> t!12232 result!5869) b_and!16957)))

(declare-fun m!403997 () Bool)

(assert (=> b!415343 m!403997))

(declare-fun m!403999 () Bool)

(assert (=> b!415345 m!403999))

(declare-fun m!404001 () Bool)

(assert (=> b!415345 m!404001))

(declare-fun m!404003 () Bool)

(assert (=> b!415345 m!404003))

(declare-fun m!404005 () Bool)

(assert (=> b!415333 m!404005))

(declare-fun m!404007 () Bool)

(assert (=> start!39272 m!404007))

(declare-fun m!404009 () Bool)

(assert (=> start!39272 m!404009))

(declare-fun m!404011 () Bool)

(assert (=> b!415348 m!404011))

(declare-fun m!404013 () Bool)

(assert (=> b!415340 m!404013))

(assert (=> b!415340 m!404013))

(declare-fun m!404015 () Bool)

(assert (=> b!415340 m!404015))

(declare-fun m!404017 () Bool)

(assert (=> b!415340 m!404017))

(declare-fun m!404019 () Bool)

(assert (=> b!415334 m!404019))

(declare-fun m!404021 () Bool)

(assert (=> b!415344 m!404021))

(declare-fun m!404023 () Bool)

(assert (=> b!415338 m!404023))

(declare-fun m!404025 () Bool)

(assert (=> b!415339 m!404025))

(declare-fun m!404027 () Bool)

(assert (=> b!415339 m!404027))

(declare-fun m!404029 () Bool)

(assert (=> b!415339 m!404029))

(declare-fun m!404031 () Bool)

(assert (=> b!415339 m!404031))

(declare-fun m!404033 () Bool)

(assert (=> b!415339 m!404033))

(assert (=> b!415339 m!404031))

(assert (=> b!415339 m!404027))

(declare-fun m!404035 () Bool)

(assert (=> b!415339 m!404035))

(assert (=> b!415339 m!404029))

(declare-fun m!404037 () Bool)

(assert (=> bm!28809 m!404037))

(declare-fun m!404039 () Bool)

(assert (=> b!415337 m!404039))

(declare-fun m!404041 () Bool)

(assert (=> b!415337 m!404041))

(declare-fun m!404043 () Bool)

(assert (=> b!415332 m!404043))

(declare-fun m!404045 () Bool)

(assert (=> mapNonEmpty!17679 m!404045))

(declare-fun m!404047 () Bool)

(assert (=> bm!28810 m!404047))

(declare-fun m!404049 () Bool)

(assert (=> b!415346 m!404049))

(check-sat (not b!415344) (not b!415334) (not b!415337) (not mapNonEmpty!17679) (not bm!28809) (not b!415343) (not b!415338) (not b!415348) (not b!415340) (not bm!28810) (not b_lambda!8839) (not b!415333) (not start!39272) (not b_next!9553) tp_is_empty!10705 (not b!415339) b_and!16957 (not b!415346) (not b!415345))
(check-sat b_and!16957 (not b_next!9553))
