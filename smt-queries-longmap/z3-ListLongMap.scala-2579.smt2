; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39278 () Bool)

(assert start!39278)

(declare-fun b_free!9559 () Bool)

(declare-fun b_next!9559 () Bool)

(assert (=> start!39278 (= b_free!9559 (not b_next!9559))))

(declare-fun tp!34205 () Bool)

(declare-fun b_and!17007 () Bool)

(assert (=> start!39278 (= tp!34205 b_and!17007)))

(declare-fun b!415729 () Bool)

(declare-fun res!241926 () Bool)

(declare-fun e!248264 () Bool)

(assert (=> b!415729 (=> (not res!241926) (not e!248264))))

(declare-datatypes ((array!25282 0))(
  ( (array!25283 (arr!12090 (Array (_ BitVec 32) (_ BitVec 64))) (size!12442 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25282)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25282 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!415729 (= res!241926 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17688 () Bool)

(declare-fun mapRes!17688 () Bool)

(assert (=> mapIsEmpty!17688 mapRes!17688))

(declare-fun b!415730 () Bool)

(declare-fun e!248270 () Bool)

(assert (=> b!415730 (= e!248264 e!248270)))

(declare-fun res!241929 () Bool)

(assert (=> b!415730 (=> (not res!241929) (not e!248270))))

(declare-fun lt!190361 () array!25282)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25282 (_ BitVec 32)) Bool)

(assert (=> b!415730 (= res!241929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190361 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!415730 (= lt!190361 (array!25283 (store (arr!12090 _keys!709) i!563 k0!794) (size!12442 _keys!709)))))

(declare-fun b!415731 () Bool)

(declare-fun e!248265 () Bool)

(declare-datatypes ((V!15387 0))(
  ( (V!15388 (val!5400 Int)) )
))
(declare-datatypes ((tuple2!6910 0))(
  ( (tuple2!6911 (_1!3466 (_ BitVec 64)) (_2!3466 V!15387)) )
))
(declare-datatypes ((List!6930 0))(
  ( (Nil!6927) (Cons!6926 (h!7782 tuple2!6910) (t!12146 List!6930)) )
))
(declare-datatypes ((ListLongMap!5825 0))(
  ( (ListLongMap!5826 (toList!2928 List!6930)) )
))
(declare-fun call!28843 () ListLongMap!5825)

(declare-fun call!28842 () ListLongMap!5825)

(assert (=> b!415731 (= e!248265 (= call!28843 call!28842))))

(declare-fun minValue!515 () V!15387)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!28839 () Bool)

(declare-fun c!55029 () Bool)

(declare-datatypes ((ValueCell!5012 0))(
  ( (ValueCellFull!5012 (v!7648 V!15387)) (EmptyCell!5012) )
))
(declare-datatypes ((array!25284 0))(
  ( (array!25285 (arr!12091 (Array (_ BitVec 32) ValueCell!5012)) (size!12443 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25284)

(declare-fun zeroValue!515 () V!15387)

(declare-fun lt!190360 () array!25284)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1176 (array!25282 array!25284 (_ BitVec 32) (_ BitVec 32) V!15387 V!15387 (_ BitVec 32) Int) ListLongMap!5825)

(assert (=> bm!28839 (= call!28843 (getCurrentListMapNoExtraKeys!1176 (ite c!55029 _keys!709 lt!190361) (ite c!55029 _values!549 lt!190360) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415732 () Bool)

(declare-fun res!241919 () Bool)

(assert (=> b!415732 (=> (not res!241919) (not e!248264))))

(assert (=> b!415732 (= res!241919 (or (= (select (arr!12090 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12090 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!241924 () Bool)

(assert (=> start!39278 (=> (not res!241924) (not e!248264))))

(assert (=> start!39278 (= res!241924 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12442 _keys!709))))))

(assert (=> start!39278 e!248264))

(declare-fun tp_is_empty!10711 () Bool)

(assert (=> start!39278 tp_is_empty!10711))

(assert (=> start!39278 tp!34205))

(assert (=> start!39278 true))

(declare-fun e!248269 () Bool)

(declare-fun array_inv!8898 (array!25284) Bool)

(assert (=> start!39278 (and (array_inv!8898 _values!549) e!248269)))

(declare-fun array_inv!8899 (array!25282) Bool)

(assert (=> start!39278 (array_inv!8899 _keys!709)))

(declare-fun b!415733 () Bool)

(declare-fun e!248266 () Bool)

(assert (=> b!415733 (= e!248269 (and e!248266 mapRes!17688))))

(declare-fun condMapEmpty!17688 () Bool)

(declare-fun mapDefault!17688 () ValueCell!5012)

(assert (=> b!415733 (= condMapEmpty!17688 (= (arr!12091 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5012)) mapDefault!17688)))))

(declare-fun b!415734 () Bool)

(declare-fun res!241928 () Bool)

(assert (=> b!415734 (=> (not res!241928) (not e!248264))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!415734 (= res!241928 (validKeyInArray!0 k0!794))))

(declare-fun b!415735 () Bool)

(declare-fun res!241932 () Bool)

(assert (=> b!415735 (=> (not res!241932) (not e!248264))))

(assert (=> b!415735 (= res!241932 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12442 _keys!709))))))

(declare-fun b!415736 () Bool)

(declare-fun res!241925 () Bool)

(assert (=> b!415736 (=> (not res!241925) (not e!248264))))

(declare-datatypes ((List!6931 0))(
  ( (Nil!6928) (Cons!6927 (h!7783 (_ BitVec 64)) (t!12147 List!6931)) )
))
(declare-fun arrayNoDuplicates!0 (array!25282 (_ BitVec 32) List!6931) Bool)

(assert (=> b!415736 (= res!241925 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6928))))

(declare-fun b!415737 () Bool)

(declare-fun e!248268 () Bool)

(assert (=> b!415737 (= e!248270 e!248268)))

(declare-fun res!241923 () Bool)

(assert (=> b!415737 (=> (not res!241923) (not e!248268))))

(assert (=> b!415737 (= res!241923 (= from!863 i!563))))

(declare-fun lt!190362 () ListLongMap!5825)

(assert (=> b!415737 (= lt!190362 (getCurrentListMapNoExtraKeys!1176 lt!190361 lt!190360 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15387)

(assert (=> b!415737 (= lt!190360 (array!25285 (store (arr!12091 _values!549) i!563 (ValueCellFull!5012 v!412)) (size!12443 _values!549)))))

(declare-fun lt!190359 () ListLongMap!5825)

(assert (=> b!415737 (= lt!190359 (getCurrentListMapNoExtraKeys!1176 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!415738 () Bool)

(declare-fun res!241921 () Bool)

(assert (=> b!415738 (=> (not res!241921) (not e!248264))))

(assert (=> b!415738 (= res!241921 (and (= (size!12443 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12442 _keys!709) (size!12443 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!415739 () Bool)

(declare-fun res!241920 () Bool)

(assert (=> b!415739 (=> (not res!241920) (not e!248264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!415739 (= res!241920 (validMask!0 mask!1025))))

(declare-fun b!415740 () Bool)

(declare-fun e!248271 () Bool)

(assert (=> b!415740 (= e!248271 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!12442 _keys!709))))))

(declare-fun +!1201 (ListLongMap!5825 tuple2!6910) ListLongMap!5825)

(declare-fun get!5973 (ValueCell!5012 V!15387) V!15387)

(declare-fun dynLambda!666 (Int (_ BitVec 64)) V!15387)

(assert (=> b!415740 (= lt!190362 (+!1201 (getCurrentListMapNoExtraKeys!1176 lt!190361 lt!190360 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!6911 (select (arr!12090 lt!190361) from!863) (get!5973 (select (arr!12091 lt!190360) from!863) (dynLambda!666 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!415741 () Bool)

(assert (=> b!415741 (= e!248266 tp_is_empty!10711)))

(declare-fun b!415742 () Bool)

(declare-fun res!241931 () Bool)

(assert (=> b!415742 (=> (not res!241931) (not e!248270))))

(assert (=> b!415742 (= res!241931 (bvsle from!863 i!563))))

(declare-fun b!415743 () Bool)

(assert (=> b!415743 (= e!248268 (not e!248271))))

(declare-fun res!241927 () Bool)

(assert (=> b!415743 (=> res!241927 e!248271)))

(assert (=> b!415743 (= res!241927 (validKeyInArray!0 (select (arr!12090 _keys!709) from!863)))))

(assert (=> b!415743 e!248265))

(assert (=> b!415743 (= c!55029 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12283 0))(
  ( (Unit!12284) )
))
(declare-fun lt!190358 () Unit!12283)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!409 (array!25282 array!25284 (_ BitVec 32) (_ BitVec 32) V!15387 V!15387 (_ BitVec 32) (_ BitVec 64) V!15387 (_ BitVec 32) Int) Unit!12283)

(assert (=> b!415743 (= lt!190358 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!409 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415744 () Bool)

(declare-fun res!241930 () Bool)

(assert (=> b!415744 (=> (not res!241930) (not e!248270))))

(assert (=> b!415744 (= res!241930 (arrayNoDuplicates!0 lt!190361 #b00000000000000000000000000000000 Nil!6928))))

(declare-fun bm!28840 () Bool)

(assert (=> bm!28840 (= call!28842 (getCurrentListMapNoExtraKeys!1176 (ite c!55029 lt!190361 _keys!709) (ite c!55029 lt!190360 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415745 () Bool)

(declare-fun res!241922 () Bool)

(assert (=> b!415745 (=> (not res!241922) (not e!248264))))

(assert (=> b!415745 (= res!241922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!415746 () Bool)

(declare-fun e!248267 () Bool)

(assert (=> b!415746 (= e!248267 tp_is_empty!10711)))

(declare-fun mapNonEmpty!17688 () Bool)

(declare-fun tp!34206 () Bool)

(assert (=> mapNonEmpty!17688 (= mapRes!17688 (and tp!34206 e!248267))))

(declare-fun mapRest!17688 () (Array (_ BitVec 32) ValueCell!5012))

(declare-fun mapKey!17688 () (_ BitVec 32))

(declare-fun mapValue!17688 () ValueCell!5012)

(assert (=> mapNonEmpty!17688 (= (arr!12091 _values!549) (store mapRest!17688 mapKey!17688 mapValue!17688))))

(declare-fun b!415747 () Bool)

(assert (=> b!415747 (= e!248265 (= call!28842 (+!1201 call!28843 (tuple2!6911 k0!794 v!412))))))

(assert (= (and start!39278 res!241924) b!415739))

(assert (= (and b!415739 res!241920) b!415738))

(assert (= (and b!415738 res!241921) b!415745))

(assert (= (and b!415745 res!241922) b!415736))

(assert (= (and b!415736 res!241925) b!415735))

(assert (= (and b!415735 res!241932) b!415734))

(assert (= (and b!415734 res!241928) b!415732))

(assert (= (and b!415732 res!241919) b!415729))

(assert (= (and b!415729 res!241926) b!415730))

(assert (= (and b!415730 res!241929) b!415744))

(assert (= (and b!415744 res!241930) b!415742))

(assert (= (and b!415742 res!241931) b!415737))

(assert (= (and b!415737 res!241923) b!415743))

(assert (= (and b!415743 c!55029) b!415747))

(assert (= (and b!415743 (not c!55029)) b!415731))

(assert (= (or b!415747 b!415731) bm!28840))

(assert (= (or b!415747 b!415731) bm!28839))

(assert (= (and b!415743 (not res!241927)) b!415740))

(assert (= (and b!415733 condMapEmpty!17688) mapIsEmpty!17688))

(assert (= (and b!415733 (not condMapEmpty!17688)) mapNonEmpty!17688))

(get-info :version)

(assert (= (and mapNonEmpty!17688 ((_ is ValueCellFull!5012) mapValue!17688)) b!415746))

(assert (= (and b!415733 ((_ is ValueCellFull!5012) mapDefault!17688)) b!415741))

(assert (= start!39278 b!415733))

(declare-fun b_lambda!8885 () Bool)

(assert (=> (not b_lambda!8885) (not b!415740)))

(declare-fun t!12145 () Bool)

(declare-fun tb!3173 () Bool)

(assert (=> (and start!39278 (= defaultEntry!557 defaultEntry!557) t!12145) tb!3173))

(declare-fun result!5881 () Bool)

(assert (=> tb!3173 (= result!5881 tp_is_empty!10711)))

(assert (=> b!415740 t!12145))

(declare-fun b_and!17009 () Bool)

(assert (= b_and!17007 (and (=> t!12145 result!5881) b_and!17009)))

(declare-fun m!405117 () Bool)

(assert (=> b!415747 m!405117))

(declare-fun m!405119 () Bool)

(assert (=> mapNonEmpty!17688 m!405119))

(declare-fun m!405121 () Bool)

(assert (=> b!415745 m!405121))

(declare-fun m!405123 () Bool)

(assert (=> b!415730 m!405123))

(declare-fun m!405125 () Bool)

(assert (=> b!415730 m!405125))

(declare-fun m!405127 () Bool)

(assert (=> start!39278 m!405127))

(declare-fun m!405129 () Bool)

(assert (=> start!39278 m!405129))

(declare-fun m!405131 () Bool)

(assert (=> b!415739 m!405131))

(declare-fun m!405133 () Bool)

(assert (=> b!415744 m!405133))

(declare-fun m!405135 () Bool)

(assert (=> b!415729 m!405135))

(declare-fun m!405137 () Bool)

(assert (=> bm!28840 m!405137))

(declare-fun m!405139 () Bool)

(assert (=> b!415743 m!405139))

(assert (=> b!415743 m!405139))

(declare-fun m!405141 () Bool)

(assert (=> b!415743 m!405141))

(declare-fun m!405143 () Bool)

(assert (=> b!415743 m!405143))

(declare-fun m!405145 () Bool)

(assert (=> bm!28839 m!405145))

(declare-fun m!405147 () Bool)

(assert (=> b!415732 m!405147))

(declare-fun m!405149 () Bool)

(assert (=> b!415734 m!405149))

(declare-fun m!405151 () Bool)

(assert (=> b!415737 m!405151))

(declare-fun m!405153 () Bool)

(assert (=> b!415737 m!405153))

(declare-fun m!405155 () Bool)

(assert (=> b!415737 m!405155))

(declare-fun m!405157 () Bool)

(assert (=> b!415740 m!405157))

(declare-fun m!405159 () Bool)

(assert (=> b!415740 m!405159))

(declare-fun m!405161 () Bool)

(assert (=> b!415740 m!405161))

(declare-fun m!405163 () Bool)

(assert (=> b!415740 m!405163))

(declare-fun m!405165 () Bool)

(assert (=> b!415740 m!405165))

(assert (=> b!415740 m!405163))

(declare-fun m!405167 () Bool)

(assert (=> b!415740 m!405167))

(assert (=> b!415740 m!405161))

(assert (=> b!415740 m!405157))

(declare-fun m!405169 () Bool)

(assert (=> b!415736 m!405169))

(check-sat (not start!39278) (not b!415734) (not b!415730) (not mapNonEmpty!17688) (not b!415743) tp_is_empty!10711 (not b!415736) (not b!415744) (not bm!28840) (not b!415745) b_and!17009 (not b!415729) (not b!415740) (not b!415737) (not b_next!9559) (not b_lambda!8885) (not bm!28839) (not b!415747) (not b!415739))
(check-sat b_and!17009 (not b_next!9559))
