; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39266 () Bool)

(assert start!39266)

(declare-fun b_free!9547 () Bool)

(declare-fun b_next!9547 () Bool)

(assert (=> start!39266 (= b_free!9547 (not b_next!9547))))

(declare-fun tp!34170 () Bool)

(declare-fun b_and!16943 () Bool)

(assert (=> start!39266 (= tp!34170 b_and!16943)))

(declare-datatypes ((V!15371 0))(
  ( (V!15372 (val!5394 Int)) )
))
(declare-fun minValue!515 () V!15371)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15371)

(declare-fun bm!28791 () Bool)

(declare-fun c!54963 () Bool)

(declare-datatypes ((tuple2!7008 0))(
  ( (tuple2!7009 (_1!3515 (_ BitVec 64)) (_2!3515 V!15371)) )
))
(declare-datatypes ((List!7018 0))(
  ( (Nil!7015) (Cons!7014 (h!7870 tuple2!7008) (t!12221 List!7018)) )
))
(declare-datatypes ((ListLongMap!5911 0))(
  ( (ListLongMap!5912 (toList!2971 List!7018)) )
))
(declare-fun call!28794 () ListLongMap!5911)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!25245 0))(
  ( (array!25246 (arr!12072 (Array (_ BitVec 32) (_ BitVec 64))) (size!12425 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25245)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5006 0))(
  ( (ValueCellFull!5006 (v!7635 V!15371)) (EmptyCell!5006) )
))
(declare-datatypes ((array!25247 0))(
  ( (array!25248 (arr!12073 (Array (_ BitVec 32) ValueCell!5006)) (size!12426 (_ BitVec 32))) )
))
(declare-fun lt!190016 () array!25247)

(declare-fun _values!549 () array!25247)

(declare-fun lt!190019 () array!25245)

(declare-fun getCurrentListMapNoExtraKeys!1182 (array!25245 array!25247 (_ BitVec 32) (_ BitVec 32) V!15371 V!15371 (_ BitVec 32) Int) ListLongMap!5911)

(assert (=> bm!28791 (= call!28794 (getCurrentListMapNoExtraKeys!1182 (ite c!54963 _keys!709 lt!190019) (ite c!54963 _values!549 lt!190016) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415153 () Bool)

(declare-fun res!241553 () Bool)

(declare-fun e!247967 () Bool)

(assert (=> b!415153 (=> (not res!241553) (not e!247967))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!415153 (= res!241553 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!415154 () Bool)

(declare-fun e!247961 () Bool)

(declare-fun call!28795 () ListLongMap!5911)

(assert (=> b!415154 (= e!247961 (= call!28794 call!28795))))

(declare-fun b!415155 () Bool)

(declare-fun res!241549 () Bool)

(assert (=> b!415155 (=> (not res!241549) (not e!247967))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!415155 (= res!241549 (or (= (select (arr!12072 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12072 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!415156 () Bool)

(declare-fun e!247965 () Bool)

(declare-fun e!247960 () Bool)

(assert (=> b!415156 (= e!247965 e!247960)))

(declare-fun res!241548 () Bool)

(assert (=> b!415156 (=> (not res!241548) (not e!247960))))

(assert (=> b!415156 (= res!241548 (= from!863 i!563))))

(declare-fun lt!190015 () ListLongMap!5911)

(assert (=> b!415156 (= lt!190015 (getCurrentListMapNoExtraKeys!1182 lt!190019 lt!190016 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15371)

(assert (=> b!415156 (= lt!190016 (array!25248 (store (arr!12073 _values!549) i!563 (ValueCellFull!5006 v!412)) (size!12426 _values!549)))))

(declare-fun lt!190018 () ListLongMap!5911)

(assert (=> b!415156 (= lt!190018 (getCurrentListMapNoExtraKeys!1182 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!415157 () Bool)

(declare-fun e!247964 () Bool)

(declare-fun e!247962 () Bool)

(declare-fun mapRes!17670 () Bool)

(assert (=> b!415157 (= e!247964 (and e!247962 mapRes!17670))))

(declare-fun condMapEmpty!17670 () Bool)

(declare-fun mapDefault!17670 () ValueCell!5006)

(assert (=> b!415157 (= condMapEmpty!17670 (= (arr!12073 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5006)) mapDefault!17670)))))

(declare-fun b!415158 () Bool)

(assert (=> b!415158 (= e!247967 e!247965)))

(declare-fun res!241545 () Bool)

(assert (=> b!415158 (=> (not res!241545) (not e!247965))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25245 (_ BitVec 32)) Bool)

(assert (=> b!415158 (= res!241545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190019 mask!1025))))

(assert (=> b!415158 (= lt!190019 (array!25246 (store (arr!12072 _keys!709) i!563 k0!794) (size!12425 _keys!709)))))

(declare-fun mapNonEmpty!17670 () Bool)

(declare-fun tp!34169 () Bool)

(declare-fun e!247966 () Bool)

(assert (=> mapNonEmpty!17670 (= mapRes!17670 (and tp!34169 e!247966))))

(declare-fun mapValue!17670 () ValueCell!5006)

(declare-fun mapKey!17670 () (_ BitVec 32))

(declare-fun mapRest!17670 () (Array (_ BitVec 32) ValueCell!5006))

(assert (=> mapNonEmpty!17670 (= (arr!12073 _values!549) (store mapRest!17670 mapKey!17670 mapValue!17670))))

(declare-fun b!415159 () Bool)

(declare-fun +!1204 (ListLongMap!5911 tuple2!7008) ListLongMap!5911)

(assert (=> b!415159 (= e!247961 (= call!28795 (+!1204 call!28794 (tuple2!7009 k0!794 v!412))))))

(declare-fun b!415160 () Bool)

(declare-fun res!241541 () Bool)

(assert (=> b!415160 (=> (not res!241541) (not e!247967))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!415160 (= res!241541 (validKeyInArray!0 k0!794))))

(declare-fun b!415161 () Bool)

(declare-fun res!241550 () Bool)

(assert (=> b!415161 (=> (not res!241550) (not e!247967))))

(declare-datatypes ((List!7019 0))(
  ( (Nil!7016) (Cons!7015 (h!7871 (_ BitVec 64)) (t!12222 List!7019)) )
))
(declare-fun arrayNoDuplicates!0 (array!25245 (_ BitVec 32) List!7019) Bool)

(assert (=> b!415161 (= res!241550 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7016))))

(declare-fun b!415162 () Bool)

(declare-fun tp_is_empty!10699 () Bool)

(assert (=> b!415162 (= e!247966 tp_is_empty!10699)))

(declare-fun b!415163 () Bool)

(declare-fun e!247963 () Bool)

(assert (=> b!415163 (= e!247960 (not e!247963))))

(declare-fun res!241552 () Bool)

(assert (=> b!415163 (=> res!241552 e!247963)))

(assert (=> b!415163 (= res!241552 (validKeyInArray!0 (select (arr!12072 _keys!709) from!863)))))

(assert (=> b!415163 e!247961))

(assert (=> b!415163 (= c!54963 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12250 0))(
  ( (Unit!12251) )
))
(declare-fun lt!190017 () Unit!12250)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!388 (array!25245 array!25247 (_ BitVec 32) (_ BitVec 32) V!15371 V!15371 (_ BitVec 32) (_ BitVec 64) V!15371 (_ BitVec 32) Int) Unit!12250)

(assert (=> b!415163 (= lt!190017 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!388 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415164 () Bool)

(declare-fun res!241543 () Bool)

(assert (=> b!415164 (=> (not res!241543) (not e!247967))))

(assert (=> b!415164 (= res!241543 (and (= (size!12426 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12425 _keys!709) (size!12426 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!415165 () Bool)

(assert (=> b!415165 (= e!247963 true)))

(declare-fun get!5952 (ValueCell!5006 V!15371) V!15371)

(declare-fun dynLambda!652 (Int (_ BitVec 64)) V!15371)

(assert (=> b!415165 (= lt!190015 (+!1204 (getCurrentListMapNoExtraKeys!1182 lt!190019 lt!190016 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7009 (select (arr!12072 lt!190019) from!863) (get!5952 (select (arr!12073 lt!190016) from!863) (dynLambda!652 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!415166 () Bool)

(declare-fun res!241547 () Bool)

(assert (=> b!415166 (=> (not res!241547) (not e!247967))))

(assert (=> b!415166 (= res!241547 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12425 _keys!709))))))

(declare-fun b!415167 () Bool)

(assert (=> b!415167 (= e!247962 tp_is_empty!10699)))

(declare-fun b!415168 () Bool)

(declare-fun res!241546 () Bool)

(assert (=> b!415168 (=> (not res!241546) (not e!247967))))

(assert (=> b!415168 (= res!241546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!415169 () Bool)

(declare-fun res!241542 () Bool)

(assert (=> b!415169 (=> (not res!241542) (not e!247965))))

(assert (=> b!415169 (= res!241542 (arrayNoDuplicates!0 lt!190019 #b00000000000000000000000000000000 Nil!7016))))

(declare-fun b!415170 () Bool)

(declare-fun res!241551 () Bool)

(assert (=> b!415170 (=> (not res!241551) (not e!247965))))

(assert (=> b!415170 (= res!241551 (bvsle from!863 i!563))))

(declare-fun res!241554 () Bool)

(assert (=> start!39266 (=> (not res!241554) (not e!247967))))

(assert (=> start!39266 (= res!241554 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12425 _keys!709))))))

(assert (=> start!39266 e!247967))

(assert (=> start!39266 tp_is_empty!10699))

(assert (=> start!39266 tp!34170))

(assert (=> start!39266 true))

(declare-fun array_inv!8850 (array!25247) Bool)

(assert (=> start!39266 (and (array_inv!8850 _values!549) e!247964)))

(declare-fun array_inv!8851 (array!25245) Bool)

(assert (=> start!39266 (array_inv!8851 _keys!709)))

(declare-fun bm!28792 () Bool)

(assert (=> bm!28792 (= call!28795 (getCurrentListMapNoExtraKeys!1182 (ite c!54963 lt!190019 _keys!709) (ite c!54963 lt!190016 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17670 () Bool)

(assert (=> mapIsEmpty!17670 mapRes!17670))

(declare-fun b!415171 () Bool)

(declare-fun res!241544 () Bool)

(assert (=> b!415171 (=> (not res!241544) (not e!247967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!415171 (= res!241544 (validMask!0 mask!1025))))

(assert (= (and start!39266 res!241554) b!415171))

(assert (= (and b!415171 res!241544) b!415164))

(assert (= (and b!415164 res!241543) b!415168))

(assert (= (and b!415168 res!241546) b!415161))

(assert (= (and b!415161 res!241550) b!415166))

(assert (= (and b!415166 res!241547) b!415160))

(assert (= (and b!415160 res!241541) b!415155))

(assert (= (and b!415155 res!241549) b!415153))

(assert (= (and b!415153 res!241553) b!415158))

(assert (= (and b!415158 res!241545) b!415169))

(assert (= (and b!415169 res!241542) b!415170))

(assert (= (and b!415170 res!241551) b!415156))

(assert (= (and b!415156 res!241548) b!415163))

(assert (= (and b!415163 c!54963) b!415159))

(assert (= (and b!415163 (not c!54963)) b!415154))

(assert (= (or b!415159 b!415154) bm!28792))

(assert (= (or b!415159 b!415154) bm!28791))

(assert (= (and b!415163 (not res!241552)) b!415165))

(assert (= (and b!415157 condMapEmpty!17670) mapIsEmpty!17670))

(assert (= (and b!415157 (not condMapEmpty!17670)) mapNonEmpty!17670))

(get-info :version)

(assert (= (and mapNonEmpty!17670 ((_ is ValueCellFull!5006) mapValue!17670)) b!415162))

(assert (= (and b!415157 ((_ is ValueCellFull!5006) mapDefault!17670)) b!415167))

(assert (= start!39266 b!415157))

(declare-fun b_lambda!8833 () Bool)

(assert (=> (not b_lambda!8833) (not b!415165)))

(declare-fun t!12220 () Bool)

(declare-fun tb!3161 () Bool)

(assert (=> (and start!39266 (= defaultEntry!557 defaultEntry!557) t!12220) tb!3161))

(declare-fun result!5857 () Bool)

(assert (=> tb!3161 (= result!5857 tp_is_empty!10699)))

(assert (=> b!415165 t!12220))

(declare-fun b_and!16945 () Bool)

(assert (= b_and!16943 (and (=> t!12220 result!5857) b_and!16945)))

(declare-fun m!403835 () Bool)

(assert (=> b!415159 m!403835))

(declare-fun m!403837 () Bool)

(assert (=> b!415160 m!403837))

(declare-fun m!403839 () Bool)

(assert (=> b!415171 m!403839))

(declare-fun m!403841 () Bool)

(assert (=> bm!28792 m!403841))

(declare-fun m!403843 () Bool)

(assert (=> b!415163 m!403843))

(assert (=> b!415163 m!403843))

(declare-fun m!403845 () Bool)

(assert (=> b!415163 m!403845))

(declare-fun m!403847 () Bool)

(assert (=> b!415163 m!403847))

(declare-fun m!403849 () Bool)

(assert (=> b!415161 m!403849))

(declare-fun m!403851 () Bool)

(assert (=> b!415168 m!403851))

(declare-fun m!403853 () Bool)

(assert (=> b!415165 m!403853))

(declare-fun m!403855 () Bool)

(assert (=> b!415165 m!403855))

(declare-fun m!403857 () Bool)

(assert (=> b!415165 m!403857))

(declare-fun m!403859 () Bool)

(assert (=> b!415165 m!403859))

(assert (=> b!415165 m!403857))

(assert (=> b!415165 m!403855))

(declare-fun m!403861 () Bool)

(assert (=> b!415165 m!403861))

(assert (=> b!415165 m!403853))

(declare-fun m!403863 () Bool)

(assert (=> b!415165 m!403863))

(declare-fun m!403865 () Bool)

(assert (=> b!415169 m!403865))

(declare-fun m!403867 () Bool)

(assert (=> mapNonEmpty!17670 m!403867))

(declare-fun m!403869 () Bool)

(assert (=> b!415155 m!403869))

(declare-fun m!403871 () Bool)

(assert (=> b!415156 m!403871))

(declare-fun m!403873 () Bool)

(assert (=> b!415156 m!403873))

(declare-fun m!403875 () Bool)

(assert (=> b!415156 m!403875))

(declare-fun m!403877 () Bool)

(assert (=> b!415153 m!403877))

(declare-fun m!403879 () Bool)

(assert (=> b!415158 m!403879))

(declare-fun m!403881 () Bool)

(assert (=> b!415158 m!403881))

(declare-fun m!403883 () Bool)

(assert (=> start!39266 m!403883))

(declare-fun m!403885 () Bool)

(assert (=> start!39266 m!403885))

(declare-fun m!403887 () Bool)

(assert (=> bm!28791 m!403887))

(check-sat (not b!415168) (not b!415161) (not start!39266) (not b!415156) (not b_lambda!8833) (not b!415160) (not mapNonEmpty!17670) (not b!415163) (not b!415153) (not b!415158) (not b!415171) b_and!16945 (not b!415159) (not b_next!9547) (not bm!28792) (not b!415165) (not b!415169) tp_is_empty!10699 (not bm!28791))
(check-sat b_and!16945 (not b_next!9547))
