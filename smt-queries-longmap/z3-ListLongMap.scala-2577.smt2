; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39266 () Bool)

(assert start!39266)

(declare-fun b_free!9547 () Bool)

(declare-fun b_next!9547 () Bool)

(assert (=> start!39266 (= b_free!9547 (not b_next!9547))))

(declare-fun tp!34169 () Bool)

(declare-fun b_and!16983 () Bool)

(assert (=> start!39266 (= tp!34169 b_and!16983)))

(declare-fun b!415375 () Bool)

(declare-fun e!248110 () Bool)

(declare-fun tp_is_empty!10699 () Bool)

(assert (=> b!415375 (= e!248110 tp_is_empty!10699)))

(declare-fun b!415376 () Bool)

(declare-fun e!248103 () Bool)

(assert (=> b!415376 (= e!248103 tp_is_empty!10699)))

(declare-fun b!415377 () Bool)

(declare-fun e!248107 () Bool)

(declare-fun e!248102 () Bool)

(assert (=> b!415377 (= e!248107 e!248102)))

(declare-fun res!241677 () Bool)

(assert (=> b!415377 (=> (not res!241677) (not e!248102))))

(declare-datatypes ((array!25258 0))(
  ( (array!25259 (arr!12078 (Array (_ BitVec 32) (_ BitVec 64))) (size!12430 (_ BitVec 32))) )
))
(declare-fun lt!190272 () array!25258)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25258 (_ BitVec 32)) Bool)

(assert (=> b!415377 (= res!241677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190272 mask!1025))))

(declare-fun _keys!709 () array!25258)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!415377 (= lt!190272 (array!25259 (store (arr!12078 _keys!709) i!563 k0!794) (size!12430 _keys!709)))))

(declare-fun mapIsEmpty!17670 () Bool)

(declare-fun mapRes!17670 () Bool)

(assert (=> mapIsEmpty!17670 mapRes!17670))

(declare-fun b!415378 () Bool)

(declare-fun res!241675 () Bool)

(assert (=> b!415378 (=> (not res!241675) (not e!248107))))

(declare-fun arrayContainsKey!0 (array!25258 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!415378 (= res!241675 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-datatypes ((V!15371 0))(
  ( (V!15372 (val!5394 Int)) )
))
(declare-fun minValue!515 () V!15371)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun c!55011 () Bool)

(declare-datatypes ((ValueCell!5006 0))(
  ( (ValueCellFull!5006 (v!7642 V!15371)) (EmptyCell!5006) )
))
(declare-datatypes ((array!25260 0))(
  ( (array!25261 (arr!12079 (Array (_ BitVec 32) ValueCell!5006)) (size!12431 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25260)

(declare-fun zeroValue!515 () V!15371)

(declare-datatypes ((tuple2!6898 0))(
  ( (tuple2!6899 (_1!3460 (_ BitVec 64)) (_2!3460 V!15371)) )
))
(declare-datatypes ((List!6918 0))(
  ( (Nil!6915) (Cons!6914 (h!7770 tuple2!6898) (t!12122 List!6918)) )
))
(declare-datatypes ((ListLongMap!5813 0))(
  ( (ListLongMap!5814 (toList!2922 List!6918)) )
))
(declare-fun call!28807 () ListLongMap!5813)

(declare-fun lt!190268 () array!25260)

(declare-fun bm!28803 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1171 (array!25258 array!25260 (_ BitVec 32) (_ BitVec 32) V!15371 V!15371 (_ BitVec 32) Int) ListLongMap!5813)

(assert (=> bm!28803 (= call!28807 (getCurrentListMapNoExtraKeys!1171 (ite c!55011 _keys!709 lt!190272) (ite c!55011 _values!549 lt!190268) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415379 () Bool)

(declare-fun e!248105 () Bool)

(declare-fun e!248108 () Bool)

(assert (=> b!415379 (= e!248105 (not e!248108))))

(declare-fun res!241676 () Bool)

(assert (=> b!415379 (=> res!241676 e!248108)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!415379 (= res!241676 (validKeyInArray!0 (select (arr!12078 _keys!709) from!863)))))

(declare-fun e!248106 () Bool)

(assert (=> b!415379 e!248106))

(assert (=> b!415379 (= c!55011 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun v!412 () V!15371)

(declare-datatypes ((Unit!12273 0))(
  ( (Unit!12274) )
))
(declare-fun lt!190269 () Unit!12273)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!404 (array!25258 array!25260 (_ BitVec 32) (_ BitVec 32) V!15371 V!15371 (_ BitVec 32) (_ BitVec 64) V!15371 (_ BitVec 32) Int) Unit!12273)

(assert (=> b!415379 (= lt!190269 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!404 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415380 () Bool)

(declare-fun res!241678 () Bool)

(assert (=> b!415380 (=> (not res!241678) (not e!248107))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!415380 (= res!241678 (validMask!0 mask!1025))))

(declare-fun b!415381 () Bool)

(declare-fun res!241679 () Bool)

(assert (=> b!415381 (=> (not res!241679) (not e!248107))))

(assert (=> b!415381 (= res!241679 (and (= (size!12431 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12430 _keys!709) (size!12431 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!415382 () Bool)

(assert (=> b!415382 (= e!248102 e!248105)))

(declare-fun res!241674 () Bool)

(assert (=> b!415382 (=> (not res!241674) (not e!248105))))

(assert (=> b!415382 (= res!241674 (= from!863 i!563))))

(declare-fun lt!190270 () ListLongMap!5813)

(assert (=> b!415382 (= lt!190270 (getCurrentListMapNoExtraKeys!1171 lt!190272 lt!190268 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!415382 (= lt!190268 (array!25261 (store (arr!12079 _values!549) i!563 (ValueCellFull!5006 v!412)) (size!12431 _values!549)))))

(declare-fun lt!190271 () ListLongMap!5813)

(assert (=> b!415382 (= lt!190271 (getCurrentListMapNoExtraKeys!1171 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!415383 () Bool)

(declare-fun res!241680 () Bool)

(assert (=> b!415383 (=> (not res!241680) (not e!248102))))

(declare-datatypes ((List!6919 0))(
  ( (Nil!6916) (Cons!6915 (h!7771 (_ BitVec 64)) (t!12123 List!6919)) )
))
(declare-fun arrayNoDuplicates!0 (array!25258 (_ BitVec 32) List!6919) Bool)

(assert (=> b!415383 (= res!241680 (arrayNoDuplicates!0 lt!190272 #b00000000000000000000000000000000 Nil!6916))))

(declare-fun b!415384 () Bool)

(declare-fun res!241668 () Bool)

(assert (=> b!415384 (=> (not res!241668) (not e!248107))))

(assert (=> b!415384 (= res!241668 (validKeyInArray!0 k0!794))))

(declare-fun b!415385 () Bool)

(assert (=> b!415385 (= e!248108 true)))

(declare-fun +!1197 (ListLongMap!5813 tuple2!6898) ListLongMap!5813)

(declare-fun get!5966 (ValueCell!5006 V!15371) V!15371)

(declare-fun dynLambda!663 (Int (_ BitVec 64)) V!15371)

(assert (=> b!415385 (= lt!190270 (+!1197 (getCurrentListMapNoExtraKeys!1171 lt!190272 lt!190268 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!6899 (select (arr!12078 lt!190272) from!863) (get!5966 (select (arr!12079 lt!190268) from!863) (dynLambda!663 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!415386 () Bool)

(declare-fun res!241669 () Bool)

(assert (=> b!415386 (=> (not res!241669) (not e!248102))))

(assert (=> b!415386 (= res!241669 (bvsle from!863 i!563))))

(declare-fun call!28806 () ListLongMap!5813)

(declare-fun bm!28804 () Bool)

(assert (=> bm!28804 (= call!28806 (getCurrentListMapNoExtraKeys!1171 (ite c!55011 lt!190272 _keys!709) (ite c!55011 lt!190268 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415387 () Bool)

(declare-fun res!241670 () Bool)

(assert (=> b!415387 (=> (not res!241670) (not e!248107))))

(assert (=> b!415387 (= res!241670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!415388 () Bool)

(declare-fun e!248109 () Bool)

(assert (=> b!415388 (= e!248109 (and e!248110 mapRes!17670))))

(declare-fun condMapEmpty!17670 () Bool)

(declare-fun mapDefault!17670 () ValueCell!5006)

(assert (=> b!415388 (= condMapEmpty!17670 (= (arr!12079 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5006)) mapDefault!17670)))))

(declare-fun res!241667 () Bool)

(assert (=> start!39266 (=> (not res!241667) (not e!248107))))

(assert (=> start!39266 (= res!241667 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12430 _keys!709))))))

(assert (=> start!39266 e!248107))

(assert (=> start!39266 tp_is_empty!10699))

(assert (=> start!39266 tp!34169))

(assert (=> start!39266 true))

(declare-fun array_inv!8890 (array!25260) Bool)

(assert (=> start!39266 (and (array_inv!8890 _values!549) e!248109)))

(declare-fun array_inv!8891 (array!25258) Bool)

(assert (=> start!39266 (array_inv!8891 _keys!709)))

(declare-fun b!415389 () Bool)

(assert (=> b!415389 (= e!248106 (= call!28807 call!28806))))

(declare-fun mapNonEmpty!17670 () Bool)

(declare-fun tp!34170 () Bool)

(assert (=> mapNonEmpty!17670 (= mapRes!17670 (and tp!34170 e!248103))))

(declare-fun mapRest!17670 () (Array (_ BitVec 32) ValueCell!5006))

(declare-fun mapValue!17670 () ValueCell!5006)

(declare-fun mapKey!17670 () (_ BitVec 32))

(assert (=> mapNonEmpty!17670 (= (arr!12079 _values!549) (store mapRest!17670 mapKey!17670 mapValue!17670))))

(declare-fun b!415390 () Bool)

(declare-fun res!241673 () Bool)

(assert (=> b!415390 (=> (not res!241673) (not e!248107))))

(assert (=> b!415390 (= res!241673 (or (= (select (arr!12078 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12078 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!415391 () Bool)

(declare-fun res!241671 () Bool)

(assert (=> b!415391 (=> (not res!241671) (not e!248107))))

(assert (=> b!415391 (= res!241671 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6916))))

(declare-fun b!415392 () Bool)

(assert (=> b!415392 (= e!248106 (= call!28806 (+!1197 call!28807 (tuple2!6899 k0!794 v!412))))))

(declare-fun b!415393 () Bool)

(declare-fun res!241672 () Bool)

(assert (=> b!415393 (=> (not res!241672) (not e!248107))))

(assert (=> b!415393 (= res!241672 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12430 _keys!709))))))

(assert (= (and start!39266 res!241667) b!415380))

(assert (= (and b!415380 res!241678) b!415381))

(assert (= (and b!415381 res!241679) b!415387))

(assert (= (and b!415387 res!241670) b!415391))

(assert (= (and b!415391 res!241671) b!415393))

(assert (= (and b!415393 res!241672) b!415384))

(assert (= (and b!415384 res!241668) b!415390))

(assert (= (and b!415390 res!241673) b!415378))

(assert (= (and b!415378 res!241675) b!415377))

(assert (= (and b!415377 res!241677) b!415383))

(assert (= (and b!415383 res!241680) b!415386))

(assert (= (and b!415386 res!241669) b!415382))

(assert (= (and b!415382 res!241674) b!415379))

(assert (= (and b!415379 c!55011) b!415392))

(assert (= (and b!415379 (not c!55011)) b!415389))

(assert (= (or b!415392 b!415389) bm!28804))

(assert (= (or b!415392 b!415389) bm!28803))

(assert (= (and b!415379 (not res!241676)) b!415385))

(assert (= (and b!415388 condMapEmpty!17670) mapIsEmpty!17670))

(assert (= (and b!415388 (not condMapEmpty!17670)) mapNonEmpty!17670))

(get-info :version)

(assert (= (and mapNonEmpty!17670 ((_ is ValueCellFull!5006) mapValue!17670)) b!415376))

(assert (= (and b!415388 ((_ is ValueCellFull!5006) mapDefault!17670)) b!415375))

(assert (= start!39266 b!415388))

(declare-fun b_lambda!8873 () Bool)

(assert (=> (not b_lambda!8873) (not b!415385)))

(declare-fun t!12121 () Bool)

(declare-fun tb!3161 () Bool)

(assert (=> (and start!39266 (= defaultEntry!557 defaultEntry!557) t!12121) tb!3161))

(declare-fun result!5857 () Bool)

(assert (=> tb!3161 (= result!5857 tp_is_empty!10699)))

(assert (=> b!415385 t!12121))

(declare-fun b_and!16985 () Bool)

(assert (= b_and!16983 (and (=> t!12121 result!5857) b_and!16985)))

(declare-fun m!404793 () Bool)

(assert (=> b!415390 m!404793))

(declare-fun m!404795 () Bool)

(assert (=> bm!28803 m!404795))

(declare-fun m!404797 () Bool)

(assert (=> b!415392 m!404797))

(declare-fun m!404799 () Bool)

(assert (=> b!415391 m!404799))

(declare-fun m!404801 () Bool)

(assert (=> b!415379 m!404801))

(assert (=> b!415379 m!404801))

(declare-fun m!404803 () Bool)

(assert (=> b!415379 m!404803))

(declare-fun m!404805 () Bool)

(assert (=> b!415379 m!404805))

(declare-fun m!404807 () Bool)

(assert (=> b!415383 m!404807))

(declare-fun m!404809 () Bool)

(assert (=> b!415384 m!404809))

(declare-fun m!404811 () Bool)

(assert (=> b!415378 m!404811))

(declare-fun m!404813 () Bool)

(assert (=> b!415380 m!404813))

(declare-fun m!404815 () Bool)

(assert (=> mapNonEmpty!17670 m!404815))

(declare-fun m!404817 () Bool)

(assert (=> b!415377 m!404817))

(declare-fun m!404819 () Bool)

(assert (=> b!415377 m!404819))

(declare-fun m!404821 () Bool)

(assert (=> b!415387 m!404821))

(declare-fun m!404823 () Bool)

(assert (=> bm!28804 m!404823))

(declare-fun m!404825 () Bool)

(assert (=> b!415382 m!404825))

(declare-fun m!404827 () Bool)

(assert (=> b!415382 m!404827))

(declare-fun m!404829 () Bool)

(assert (=> b!415382 m!404829))

(declare-fun m!404831 () Bool)

(assert (=> b!415385 m!404831))

(declare-fun m!404833 () Bool)

(assert (=> b!415385 m!404833))

(declare-fun m!404835 () Bool)

(assert (=> b!415385 m!404835))

(declare-fun m!404837 () Bool)

(assert (=> b!415385 m!404837))

(assert (=> b!415385 m!404835))

(declare-fun m!404839 () Bool)

(assert (=> b!415385 m!404839))

(assert (=> b!415385 m!404831))

(declare-fun m!404841 () Bool)

(assert (=> b!415385 m!404841))

(assert (=> b!415385 m!404837))

(declare-fun m!404843 () Bool)

(assert (=> start!39266 m!404843))

(declare-fun m!404845 () Bool)

(assert (=> start!39266 m!404845))

(check-sat (not b!415380) (not b_next!9547) (not b!415384) (not b!415382) (not b!415392) (not mapNonEmpty!17670) (not b!415377) (not b!415383) (not b!415391) (not bm!28803) tp_is_empty!10699 (not bm!28804) (not b!415387) (not b!415378) (not b!415379) (not b_lambda!8873) b_and!16985 (not start!39266) (not b!415385))
(check-sat b_and!16985 (not b_next!9547))
