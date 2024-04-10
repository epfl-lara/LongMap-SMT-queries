; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39264 () Bool)

(assert start!39264)

(declare-fun b_free!9531 () Bool)

(declare-fun b_next!9531 () Bool)

(assert (=> start!39264 (= b_free!9531 (not b_next!9531))))

(declare-fun tp!34122 () Bool)

(declare-fun b_and!16937 () Bool)

(assert (=> start!39264 (= tp!34122 b_and!16937)))

(declare-fun mapIsEmpty!17646 () Bool)

(declare-fun mapRes!17646 () Bool)

(assert (=> mapIsEmpty!17646 mapRes!17646))

(declare-fun b!414952 () Bool)

(declare-fun e!247922 () Bool)

(assert (=> b!414952 (= e!247922 true)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15349 0))(
  ( (V!15350 (val!5386 Int)) )
))
(declare-datatypes ((ValueCell!4998 0))(
  ( (ValueCellFull!4998 (v!7633 V!15349)) (EmptyCell!4998) )
))
(declare-datatypes ((array!25223 0))(
  ( (array!25224 (arr!12061 (Array (_ BitVec 32) ValueCell!4998)) (size!12413 (_ BitVec 32))) )
))
(declare-fun lt!190133 () array!25223)

(declare-fun zeroValue!515 () V!15349)

(declare-datatypes ((tuple2!7012 0))(
  ( (tuple2!7013 (_1!3517 (_ BitVec 64)) (_2!3517 V!15349)) )
))
(declare-datatypes ((List!7034 0))(
  ( (Nil!7031) (Cons!7030 (h!7886 tuple2!7012) (t!12230 List!7034)) )
))
(declare-datatypes ((ListLongMap!5925 0))(
  ( (ListLongMap!5926 (toList!2978 List!7034)) )
))
(declare-fun lt!190132 () ListLongMap!5925)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun minValue!515 () V!15349)

(declare-datatypes ((array!25225 0))(
  ( (array!25226 (arr!12062 (Array (_ BitVec 32) (_ BitVec 64))) (size!12414 (_ BitVec 32))) )
))
(declare-fun lt!190131 () array!25225)

(declare-fun +!1183 (ListLongMap!5925 tuple2!7012) ListLongMap!5925)

(declare-fun getCurrentListMapNoExtraKeys!1184 (array!25225 array!25223 (_ BitVec 32) (_ BitVec 32) V!15349 V!15349 (_ BitVec 32) Int) ListLongMap!5925)

(declare-fun get!5951 (ValueCell!4998 V!15349) V!15349)

(declare-fun dynLambda!660 (Int (_ BitVec 64)) V!15349)

(assert (=> b!414952 (= lt!190132 (+!1183 (getCurrentListMapNoExtraKeys!1184 lt!190131 lt!190133 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7013 (select (arr!12062 lt!190131) from!863) (get!5951 (select (arr!12061 lt!190133) from!863) (dynLambda!660 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!28768 () Bool)

(declare-fun c!55010 () Bool)

(declare-fun _values!549 () array!25223)

(declare-fun _keys!709 () array!25225)

(declare-fun call!28771 () ListLongMap!5925)

(assert (=> bm!28768 (= call!28771 (getCurrentListMapNoExtraKeys!1184 (ite c!55010 lt!190131 _keys!709) (ite c!55010 lt!190133 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414953 () Bool)

(declare-fun res!241340 () Bool)

(declare-fun e!247924 () Bool)

(assert (=> b!414953 (=> (not res!241340) (not e!247924))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!414953 (= res!241340 (or (= (select (arr!12062 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12062 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!247925 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!15349)

(declare-fun call!28772 () ListLongMap!5925)

(declare-fun b!414954 () Bool)

(assert (=> b!414954 (= e!247925 (= call!28771 (+!1183 call!28772 (tuple2!7013 k0!794 v!412))))))

(declare-fun res!241335 () Bool)

(assert (=> start!39264 (=> (not res!241335) (not e!247924))))

(assert (=> start!39264 (= res!241335 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12414 _keys!709))))))

(assert (=> start!39264 e!247924))

(declare-fun tp_is_empty!10683 () Bool)

(assert (=> start!39264 tp_is_empty!10683))

(assert (=> start!39264 tp!34122))

(assert (=> start!39264 true))

(declare-fun e!247919 () Bool)

(declare-fun array_inv!8798 (array!25223) Bool)

(assert (=> start!39264 (and (array_inv!8798 _values!549) e!247919)))

(declare-fun array_inv!8799 (array!25225) Bool)

(assert (=> start!39264 (array_inv!8799 _keys!709)))

(declare-fun b!414955 () Bool)

(declare-fun res!241344 () Bool)

(assert (=> b!414955 (=> (not res!241344) (not e!247924))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25225 (_ BitVec 32)) Bool)

(assert (=> b!414955 (= res!241344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!414956 () Bool)

(declare-fun e!247921 () Bool)

(declare-fun e!247923 () Bool)

(assert (=> b!414956 (= e!247921 e!247923)))

(declare-fun res!241338 () Bool)

(assert (=> b!414956 (=> (not res!241338) (not e!247923))))

(assert (=> b!414956 (= res!241338 (= from!863 i!563))))

(assert (=> b!414956 (= lt!190132 (getCurrentListMapNoExtraKeys!1184 lt!190131 lt!190133 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!414956 (= lt!190133 (array!25224 (store (arr!12061 _values!549) i!563 (ValueCellFull!4998 v!412)) (size!12413 _values!549)))))

(declare-fun lt!190129 () ListLongMap!5925)

(assert (=> b!414956 (= lt!190129 (getCurrentListMapNoExtraKeys!1184 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!414957 () Bool)

(declare-fun e!247920 () Bool)

(assert (=> b!414957 (= e!247920 tp_is_empty!10683)))

(declare-fun b!414958 () Bool)

(declare-fun res!241342 () Bool)

(assert (=> b!414958 (=> (not res!241342) (not e!247924))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!414958 (= res!241342 (validKeyInArray!0 k0!794))))

(declare-fun b!414959 () Bool)

(declare-fun res!241341 () Bool)

(assert (=> b!414959 (=> (not res!241341) (not e!247924))))

(declare-fun arrayContainsKey!0 (array!25225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!414959 (= res!241341 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!414960 () Bool)

(declare-fun e!247918 () Bool)

(assert (=> b!414960 (= e!247919 (and e!247918 mapRes!17646))))

(declare-fun condMapEmpty!17646 () Bool)

(declare-fun mapDefault!17646 () ValueCell!4998)

(assert (=> b!414960 (= condMapEmpty!17646 (= (arr!12061 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4998)) mapDefault!17646)))))

(declare-fun bm!28769 () Bool)

(assert (=> bm!28769 (= call!28772 (getCurrentListMapNoExtraKeys!1184 (ite c!55010 _keys!709 lt!190131) (ite c!55010 _values!549 lt!190133) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17646 () Bool)

(declare-fun tp!34121 () Bool)

(assert (=> mapNonEmpty!17646 (= mapRes!17646 (and tp!34121 e!247920))))

(declare-fun mapKey!17646 () (_ BitVec 32))

(declare-fun mapRest!17646 () (Array (_ BitVec 32) ValueCell!4998))

(declare-fun mapValue!17646 () ValueCell!4998)

(assert (=> mapNonEmpty!17646 (= (arr!12061 _values!549) (store mapRest!17646 mapKey!17646 mapValue!17646))))

(declare-fun b!414961 () Bool)

(declare-fun res!241346 () Bool)

(assert (=> b!414961 (=> (not res!241346) (not e!247924))))

(assert (=> b!414961 (= res!241346 (and (= (size!12413 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12414 _keys!709) (size!12413 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!414962 () Bool)

(assert (=> b!414962 (= e!247918 tp_is_empty!10683)))

(declare-fun b!414963 () Bool)

(assert (=> b!414963 (= e!247924 e!247921)))

(declare-fun res!241343 () Bool)

(assert (=> b!414963 (=> (not res!241343) (not e!247921))))

(assert (=> b!414963 (= res!241343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190131 mask!1025))))

(assert (=> b!414963 (= lt!190131 (array!25226 (store (arr!12062 _keys!709) i!563 k0!794) (size!12414 _keys!709)))))

(declare-fun b!414964 () Bool)

(declare-fun res!241345 () Bool)

(assert (=> b!414964 (=> (not res!241345) (not e!247924))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!414964 (= res!241345 (validMask!0 mask!1025))))

(declare-fun b!414965 () Bool)

(assert (=> b!414965 (= e!247923 (not e!247922))))

(declare-fun res!241347 () Bool)

(assert (=> b!414965 (=> res!241347 e!247922)))

(assert (=> b!414965 (= res!241347 (validKeyInArray!0 (select (arr!12062 _keys!709) from!863)))))

(assert (=> b!414965 e!247925))

(assert (=> b!414965 (= c!55010 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12270 0))(
  ( (Unit!12271) )
))
(declare-fun lt!190130 () Unit!12270)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!393 (array!25225 array!25223 (_ BitVec 32) (_ BitVec 32) V!15349 V!15349 (_ BitVec 32) (_ BitVec 64) V!15349 (_ BitVec 32) Int) Unit!12270)

(assert (=> b!414965 (= lt!190130 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!393 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414966 () Bool)

(declare-fun res!241336 () Bool)

(assert (=> b!414966 (=> (not res!241336) (not e!247924))))

(assert (=> b!414966 (= res!241336 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12414 _keys!709))))))

(declare-fun b!414967 () Bool)

(declare-fun res!241339 () Bool)

(assert (=> b!414967 (=> (not res!241339) (not e!247924))))

(declare-datatypes ((List!7035 0))(
  ( (Nil!7032) (Cons!7031 (h!7887 (_ BitVec 64)) (t!12231 List!7035)) )
))
(declare-fun arrayNoDuplicates!0 (array!25225 (_ BitVec 32) List!7035) Bool)

(assert (=> b!414967 (= res!241339 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7032))))

(declare-fun b!414968 () Bool)

(assert (=> b!414968 (= e!247925 (= call!28772 call!28771))))

(declare-fun b!414969 () Bool)

(declare-fun res!241337 () Bool)

(assert (=> b!414969 (=> (not res!241337) (not e!247921))))

(assert (=> b!414969 (= res!241337 (arrayNoDuplicates!0 lt!190131 #b00000000000000000000000000000000 Nil!7032))))

(declare-fun b!414970 () Bool)

(declare-fun res!241334 () Bool)

(assert (=> b!414970 (=> (not res!241334) (not e!247921))))

(assert (=> b!414970 (= res!241334 (bvsle from!863 i!563))))

(assert (= (and start!39264 res!241335) b!414964))

(assert (= (and b!414964 res!241345) b!414961))

(assert (= (and b!414961 res!241346) b!414955))

(assert (= (and b!414955 res!241344) b!414967))

(assert (= (and b!414967 res!241339) b!414966))

(assert (= (and b!414966 res!241336) b!414958))

(assert (= (and b!414958 res!241342) b!414953))

(assert (= (and b!414953 res!241340) b!414959))

(assert (= (and b!414959 res!241341) b!414963))

(assert (= (and b!414963 res!241343) b!414969))

(assert (= (and b!414969 res!241337) b!414970))

(assert (= (and b!414970 res!241334) b!414956))

(assert (= (and b!414956 res!241338) b!414965))

(assert (= (and b!414965 c!55010) b!414954))

(assert (= (and b!414965 (not c!55010)) b!414968))

(assert (= (or b!414954 b!414968) bm!28768))

(assert (= (or b!414954 b!414968) bm!28769))

(assert (= (and b!414965 (not res!241347)) b!414952))

(assert (= (and b!414960 condMapEmpty!17646) mapIsEmpty!17646))

(assert (= (and b!414960 (not condMapEmpty!17646)) mapNonEmpty!17646))

(get-info :version)

(assert (= (and mapNonEmpty!17646 ((_ is ValueCellFull!4998) mapValue!17646)) b!414957))

(assert (= (and b!414960 ((_ is ValueCellFull!4998) mapDefault!17646)) b!414962))

(assert (= start!39264 b!414960))

(declare-fun b_lambda!8835 () Bool)

(assert (=> (not b_lambda!8835) (not b!414952)))

(declare-fun t!12229 () Bool)

(declare-fun tb!3153 () Bool)

(assert (=> (and start!39264 (= defaultEntry!557 defaultEntry!557) t!12229) tb!3153))

(declare-fun result!5833 () Bool)

(assert (=> tb!3153 (= result!5833 tp_is_empty!10683)))

(assert (=> b!414952 t!12229))

(declare-fun b_and!16939 () Bool)

(assert (= b_and!16937 (and (=> t!12229 result!5833) b_and!16939)))

(declare-fun m!404129 () Bool)

(assert (=> b!414952 m!404129))

(declare-fun m!404131 () Bool)

(assert (=> b!414952 m!404131))

(declare-fun m!404133 () Bool)

(assert (=> b!414952 m!404133))

(declare-fun m!404135 () Bool)

(assert (=> b!414952 m!404135))

(declare-fun m!404137 () Bool)

(assert (=> b!414952 m!404137))

(assert (=> b!414952 m!404131))

(assert (=> b!414952 m!404129))

(assert (=> b!414952 m!404135))

(declare-fun m!404139 () Bool)

(assert (=> b!414952 m!404139))

(declare-fun m!404141 () Bool)

(assert (=> b!414955 m!404141))

(declare-fun m!404143 () Bool)

(assert (=> b!414954 m!404143))

(declare-fun m!404145 () Bool)

(assert (=> mapNonEmpty!17646 m!404145))

(declare-fun m!404147 () Bool)

(assert (=> b!414953 m!404147))

(declare-fun m!404149 () Bool)

(assert (=> b!414956 m!404149))

(declare-fun m!404151 () Bool)

(assert (=> b!414956 m!404151))

(declare-fun m!404153 () Bool)

(assert (=> b!414956 m!404153))

(declare-fun m!404155 () Bool)

(assert (=> start!39264 m!404155))

(declare-fun m!404157 () Bool)

(assert (=> start!39264 m!404157))

(declare-fun m!404159 () Bool)

(assert (=> b!414964 m!404159))

(declare-fun m!404161 () Bool)

(assert (=> b!414969 m!404161))

(declare-fun m!404163 () Bool)

(assert (=> bm!28768 m!404163))

(declare-fun m!404165 () Bool)

(assert (=> b!414963 m!404165))

(declare-fun m!404167 () Bool)

(assert (=> b!414963 m!404167))

(declare-fun m!404169 () Bool)

(assert (=> b!414958 m!404169))

(declare-fun m!404171 () Bool)

(assert (=> b!414967 m!404171))

(declare-fun m!404173 () Bool)

(assert (=> bm!28769 m!404173))

(declare-fun m!404175 () Bool)

(assert (=> b!414959 m!404175))

(declare-fun m!404177 () Bool)

(assert (=> b!414965 m!404177))

(assert (=> b!414965 m!404177))

(declare-fun m!404179 () Bool)

(assert (=> b!414965 m!404179))

(declare-fun m!404181 () Bool)

(assert (=> b!414965 m!404181))

(check-sat tp_is_empty!10683 (not start!39264) (not bm!28768) (not b_lambda!8835) (not b!414964) (not b!414955) (not b!414956) (not b!414952) (not b!414954) (not bm!28769) (not b!414963) b_and!16939 (not b!414969) (not b_next!9531) (not b!414965) (not b!414967) (not b!414959) (not b!414958) (not mapNonEmpty!17646))
(check-sat b_and!16939 (not b_next!9531))
