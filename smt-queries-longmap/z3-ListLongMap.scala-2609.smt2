; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39474 () Bool)

(assert start!39474)

(declare-fun b_free!9741 () Bool)

(declare-fun b_next!9741 () Bool)

(assert (=> start!39474 (= b_free!9741 (not b_next!9741))))

(declare-fun tp!34751 () Bool)

(declare-fun b_and!17357 () Bool)

(assert (=> start!39474 (= tp!34751 b_and!17357)))

(declare-fun b!421147 () Bool)

(declare-fun e!250758 () Bool)

(declare-fun e!250761 () Bool)

(assert (=> b!421147 (= e!250758 e!250761)))

(declare-fun res!245746 () Bool)

(assert (=> b!421147 (=> (not res!245746) (not e!250761))))

(declare-datatypes ((array!25635 0))(
  ( (array!25636 (arr!12267 (Array (_ BitVec 32) (_ BitVec 64))) (size!12619 (_ BitVec 32))) )
))
(declare-fun lt!193303 () array!25635)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25635 (_ BitVec 32)) Bool)

(assert (=> b!421147 (= res!245746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193303 mask!1025))))

(declare-fun _keys!709 () array!25635)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!421147 (= lt!193303 (array!25636 (store (arr!12267 _keys!709) i!563 k0!794) (size!12619 _keys!709)))))

(declare-fun b!421148 () Bool)

(declare-fun res!245749 () Bool)

(assert (=> b!421148 (=> (not res!245749) (not e!250758))))

(assert (=> b!421148 (= res!245749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!421149 () Bool)

(declare-fun e!250753 () Bool)

(declare-fun tp_is_empty!10893 () Bool)

(assert (=> b!421149 (= e!250753 tp_is_empty!10893)))

(declare-fun b!421150 () Bool)

(declare-fun e!250760 () Bool)

(declare-fun e!250755 () Bool)

(declare-fun mapRes!17961 () Bool)

(assert (=> b!421150 (= e!250760 (and e!250755 mapRes!17961))))

(declare-fun condMapEmpty!17961 () Bool)

(declare-datatypes ((V!15629 0))(
  ( (V!15630 (val!5491 Int)) )
))
(declare-datatypes ((ValueCell!5103 0))(
  ( (ValueCellFull!5103 (v!7738 V!15629)) (EmptyCell!5103) )
))
(declare-datatypes ((array!25637 0))(
  ( (array!25638 (arr!12268 (Array (_ BitVec 32) ValueCell!5103)) (size!12620 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25637)

(declare-fun mapDefault!17961 () ValueCell!5103)

(assert (=> b!421150 (= condMapEmpty!17961 (= (arr!12268 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5103)) mapDefault!17961)))))

(declare-fun b!421151 () Bool)

(declare-fun res!245754 () Bool)

(assert (=> b!421151 (=> (not res!245754) (not e!250758))))

(declare-fun arrayContainsKey!0 (array!25635 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!421151 (= res!245754 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!421152 () Bool)

(declare-fun e!250759 () Bool)

(assert (=> b!421152 (= e!250759 true)))

(declare-datatypes ((tuple2!7200 0))(
  ( (tuple2!7201 (_1!3611 (_ BitVec 64)) (_2!3611 V!15629)) )
))
(declare-datatypes ((List!7206 0))(
  ( (Nil!7203) (Cons!7202 (h!8058 tuple2!7200) (t!12612 List!7206)) )
))
(declare-datatypes ((ListLongMap!6113 0))(
  ( (ListLongMap!6114 (toList!3072 List!7206)) )
))
(declare-fun lt!193302 () ListLongMap!6113)

(declare-fun lt!193305 () V!15629)

(declare-fun lt!193301 () tuple2!7200)

(declare-fun +!1268 (ListLongMap!6113 tuple2!7200) ListLongMap!6113)

(assert (=> b!421152 (= (+!1268 lt!193302 lt!193301) (+!1268 (+!1268 lt!193302 (tuple2!7201 k0!794 lt!193305)) lt!193301))))

(declare-fun lt!193304 () V!15629)

(assert (=> b!421152 (= lt!193301 (tuple2!7201 k0!794 lt!193304))))

(declare-datatypes ((Unit!12438 0))(
  ( (Unit!12439) )
))
(declare-fun lt!193309 () Unit!12438)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!63 (ListLongMap!6113 (_ BitVec 64) V!15629 V!15629) Unit!12438)

(assert (=> b!421152 (= lt!193309 (addSameAsAddTwiceSameKeyDiffValues!63 lt!193302 k0!794 lt!193305 lt!193304))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!193308 () V!15629)

(declare-fun get!6095 (ValueCell!5103 V!15629) V!15629)

(assert (=> b!421152 (= lt!193305 (get!6095 (select (arr!12268 _values!549) from!863) lt!193308))))

(declare-fun lt!193307 () ListLongMap!6113)

(assert (=> b!421152 (= lt!193307 (+!1268 lt!193302 (tuple2!7201 (select (arr!12267 lt!193303) from!863) lt!193304)))))

(declare-fun v!412 () V!15629)

(assert (=> b!421152 (= lt!193304 (get!6095 (select (store (arr!12268 _values!549) i!563 (ValueCellFull!5103 v!412)) from!863) lt!193308))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!734 (Int (_ BitVec 64)) V!15629)

(assert (=> b!421152 (= lt!193308 (dynLambda!734 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15629)

(declare-fun lt!193310 () array!25637)

(declare-fun minValue!515 () V!15629)

(declare-fun getCurrentListMapNoExtraKeys!1276 (array!25635 array!25637 (_ BitVec 32) (_ BitVec 32) V!15629 V!15629 (_ BitVec 32) Int) ListLongMap!6113)

(assert (=> b!421152 (= lt!193302 (getCurrentListMapNoExtraKeys!1276 lt!193303 lt!193310 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!245747 () Bool)

(assert (=> start!39474 (=> (not res!245747) (not e!250758))))

(assert (=> start!39474 (= res!245747 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12619 _keys!709))))))

(assert (=> start!39474 e!250758))

(assert (=> start!39474 tp_is_empty!10893))

(assert (=> start!39474 tp!34751))

(assert (=> start!39474 true))

(declare-fun array_inv!8938 (array!25637) Bool)

(assert (=> start!39474 (and (array_inv!8938 _values!549) e!250760)))

(declare-fun array_inv!8939 (array!25635) Bool)

(assert (=> start!39474 (array_inv!8939 _keys!709)))

(declare-fun b!421153 () Bool)

(declare-fun res!245744 () Bool)

(assert (=> b!421153 (=> (not res!245744) (not e!250758))))

(assert (=> b!421153 (= res!245744 (or (= (select (arr!12267 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12267 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!421154 () Bool)

(declare-fun res!245750 () Bool)

(assert (=> b!421154 (=> (not res!245750) (not e!250761))))

(assert (=> b!421154 (= res!245750 (bvsle from!863 i!563))))

(declare-fun b!421155 () Bool)

(declare-fun e!250757 () Bool)

(assert (=> b!421155 (= e!250757 (not e!250759))))

(declare-fun res!245753 () Bool)

(assert (=> b!421155 (=> res!245753 e!250759)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!421155 (= res!245753 (validKeyInArray!0 (select (arr!12267 _keys!709) from!863)))))

(declare-fun e!250754 () Bool)

(assert (=> b!421155 e!250754))

(declare-fun c!55325 () Bool)

(assert (=> b!421155 (= c!55325 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!193300 () Unit!12438)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!465 (array!25635 array!25637 (_ BitVec 32) (_ BitVec 32) V!15629 V!15629 (_ BitVec 32) (_ BitVec 64) V!15629 (_ BitVec 32) Int) Unit!12438)

(assert (=> b!421155 (= lt!193300 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!465 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421156 () Bool)

(assert (=> b!421156 (= e!250755 tp_is_empty!10893)))

(declare-fun bm!29398 () Bool)

(declare-fun call!29401 () ListLongMap!6113)

(assert (=> bm!29398 (= call!29401 (getCurrentListMapNoExtraKeys!1276 (ite c!55325 lt!193303 _keys!709) (ite c!55325 lt!193310 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421157 () Bool)

(assert (=> b!421157 (= e!250761 e!250757)))

(declare-fun res!245757 () Bool)

(assert (=> b!421157 (=> (not res!245757) (not e!250757))))

(assert (=> b!421157 (= res!245757 (= from!863 i!563))))

(assert (=> b!421157 (= lt!193307 (getCurrentListMapNoExtraKeys!1276 lt!193303 lt!193310 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!421157 (= lt!193310 (array!25638 (store (arr!12268 _values!549) i!563 (ValueCellFull!5103 v!412)) (size!12620 _values!549)))))

(declare-fun lt!193306 () ListLongMap!6113)

(assert (=> b!421157 (= lt!193306 (getCurrentListMapNoExtraKeys!1276 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!421158 () Bool)

(declare-fun res!245751 () Bool)

(assert (=> b!421158 (=> (not res!245751) (not e!250758))))

(assert (=> b!421158 (= res!245751 (validKeyInArray!0 k0!794))))

(declare-fun b!421159 () Bool)

(declare-fun res!245755 () Bool)

(assert (=> b!421159 (=> (not res!245755) (not e!250758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!421159 (= res!245755 (validMask!0 mask!1025))))

(declare-fun call!29402 () ListLongMap!6113)

(declare-fun b!421160 () Bool)

(assert (=> b!421160 (= e!250754 (= call!29401 (+!1268 call!29402 (tuple2!7201 k0!794 v!412))))))

(declare-fun b!421161 () Bool)

(declare-fun res!245748 () Bool)

(assert (=> b!421161 (=> (not res!245748) (not e!250758))))

(assert (=> b!421161 (= res!245748 (and (= (size!12620 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12619 _keys!709) (size!12620 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!17961 () Bool)

(declare-fun tp!34752 () Bool)

(assert (=> mapNonEmpty!17961 (= mapRes!17961 (and tp!34752 e!250753))))

(declare-fun mapValue!17961 () ValueCell!5103)

(declare-fun mapRest!17961 () (Array (_ BitVec 32) ValueCell!5103))

(declare-fun mapKey!17961 () (_ BitVec 32))

(assert (=> mapNonEmpty!17961 (= (arr!12268 _values!549) (store mapRest!17961 mapKey!17961 mapValue!17961))))

(declare-fun b!421162 () Bool)

(declare-fun res!245756 () Bool)

(assert (=> b!421162 (=> (not res!245756) (not e!250758))))

(declare-datatypes ((List!7207 0))(
  ( (Nil!7204) (Cons!7203 (h!8059 (_ BitVec 64)) (t!12613 List!7207)) )
))
(declare-fun arrayNoDuplicates!0 (array!25635 (_ BitVec 32) List!7207) Bool)

(assert (=> b!421162 (= res!245756 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7204))))

(declare-fun b!421163 () Bool)

(declare-fun res!245745 () Bool)

(assert (=> b!421163 (=> (not res!245745) (not e!250761))))

(assert (=> b!421163 (= res!245745 (arrayNoDuplicates!0 lt!193303 #b00000000000000000000000000000000 Nil!7204))))

(declare-fun b!421164 () Bool)

(declare-fun res!245752 () Bool)

(assert (=> b!421164 (=> (not res!245752) (not e!250758))))

(assert (=> b!421164 (= res!245752 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12619 _keys!709))))))

(declare-fun mapIsEmpty!17961 () Bool)

(assert (=> mapIsEmpty!17961 mapRes!17961))

(declare-fun b!421165 () Bool)

(assert (=> b!421165 (= e!250754 (= call!29402 call!29401))))

(declare-fun bm!29399 () Bool)

(assert (=> bm!29399 (= call!29402 (getCurrentListMapNoExtraKeys!1276 (ite c!55325 _keys!709 lt!193303) (ite c!55325 _values!549 lt!193310) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39474 res!245747) b!421159))

(assert (= (and b!421159 res!245755) b!421161))

(assert (= (and b!421161 res!245748) b!421148))

(assert (= (and b!421148 res!245749) b!421162))

(assert (= (and b!421162 res!245756) b!421164))

(assert (= (and b!421164 res!245752) b!421158))

(assert (= (and b!421158 res!245751) b!421153))

(assert (= (and b!421153 res!245744) b!421151))

(assert (= (and b!421151 res!245754) b!421147))

(assert (= (and b!421147 res!245746) b!421163))

(assert (= (and b!421163 res!245745) b!421154))

(assert (= (and b!421154 res!245750) b!421157))

(assert (= (and b!421157 res!245757) b!421155))

(assert (= (and b!421155 c!55325) b!421160))

(assert (= (and b!421155 (not c!55325)) b!421165))

(assert (= (or b!421160 b!421165) bm!29398))

(assert (= (or b!421160 b!421165) bm!29399))

(assert (= (and b!421155 (not res!245753)) b!421152))

(assert (= (and b!421150 condMapEmpty!17961) mapIsEmpty!17961))

(assert (= (and b!421150 (not condMapEmpty!17961)) mapNonEmpty!17961))

(get-info :version)

(assert (= (and mapNonEmpty!17961 ((_ is ValueCellFull!5103) mapValue!17961)) b!421149))

(assert (= (and b!421150 ((_ is ValueCellFull!5103) mapDefault!17961)) b!421156))

(assert (= start!39474 b!421150))

(declare-fun b_lambda!9045 () Bool)

(assert (=> (not b_lambda!9045) (not b!421152)))

(declare-fun t!12611 () Bool)

(declare-fun tb!3363 () Bool)

(assert (=> (and start!39474 (= defaultEntry!557 defaultEntry!557) t!12611) tb!3363))

(declare-fun result!6253 () Bool)

(assert (=> tb!3363 (= result!6253 tp_is_empty!10893)))

(assert (=> b!421152 t!12611))

(declare-fun b_and!17359 () Bool)

(assert (= b_and!17357 (and (=> t!12611 result!6253) b_and!17359)))

(declare-fun m!410855 () Bool)

(assert (=> b!421163 m!410855))

(declare-fun m!410857 () Bool)

(assert (=> b!421159 m!410857))

(declare-fun m!410859 () Bool)

(assert (=> b!421151 m!410859))

(declare-fun m!410861 () Bool)

(assert (=> start!39474 m!410861))

(declare-fun m!410863 () Bool)

(assert (=> start!39474 m!410863))

(declare-fun m!410865 () Bool)

(assert (=> b!421162 m!410865))

(declare-fun m!410867 () Bool)

(assert (=> bm!29398 m!410867))

(declare-fun m!410869 () Bool)

(assert (=> b!421152 m!410869))

(declare-fun m!410871 () Bool)

(assert (=> b!421152 m!410871))

(declare-fun m!410873 () Bool)

(assert (=> b!421152 m!410873))

(declare-fun m!410875 () Bool)

(assert (=> b!421152 m!410875))

(declare-fun m!410877 () Bool)

(assert (=> b!421152 m!410877))

(declare-fun m!410879 () Bool)

(assert (=> b!421152 m!410879))

(declare-fun m!410881 () Bool)

(assert (=> b!421152 m!410881))

(assert (=> b!421152 m!410869))

(declare-fun m!410883 () Bool)

(assert (=> b!421152 m!410883))

(declare-fun m!410885 () Bool)

(assert (=> b!421152 m!410885))

(declare-fun m!410887 () Bool)

(assert (=> b!421152 m!410887))

(assert (=> b!421152 m!410887))

(declare-fun m!410889 () Bool)

(assert (=> b!421152 m!410889))

(assert (=> b!421152 m!410883))

(declare-fun m!410891 () Bool)

(assert (=> b!421152 m!410891))

(declare-fun m!410893 () Bool)

(assert (=> b!421152 m!410893))

(declare-fun m!410895 () Bool)

(assert (=> bm!29399 m!410895))

(declare-fun m!410897 () Bool)

(assert (=> b!421148 m!410897))

(declare-fun m!410899 () Bool)

(assert (=> b!421157 m!410899))

(assert (=> b!421157 m!410877))

(declare-fun m!410901 () Bool)

(assert (=> b!421157 m!410901))

(declare-fun m!410903 () Bool)

(assert (=> mapNonEmpty!17961 m!410903))

(declare-fun m!410905 () Bool)

(assert (=> b!421153 m!410905))

(declare-fun m!410907 () Bool)

(assert (=> b!421147 m!410907))

(declare-fun m!410909 () Bool)

(assert (=> b!421147 m!410909))

(declare-fun m!410911 () Bool)

(assert (=> b!421158 m!410911))

(declare-fun m!410913 () Bool)

(assert (=> b!421160 m!410913))

(declare-fun m!410915 () Bool)

(assert (=> b!421155 m!410915))

(assert (=> b!421155 m!410915))

(declare-fun m!410917 () Bool)

(assert (=> b!421155 m!410917))

(declare-fun m!410919 () Bool)

(assert (=> b!421155 m!410919))

(check-sat (not b!421152) (not b!421148) (not b!421163) (not b!421147) (not bm!29398) (not b!421158) (not start!39474) (not b!421151) b_and!17359 tp_is_empty!10893 (not b!421160) (not b!421162) (not mapNonEmpty!17961) (not b_next!9741) (not bm!29399) (not b!421155) (not b!421157) (not b!421159) (not b_lambda!9045))
(check-sat b_and!17359 (not b_next!9741))
