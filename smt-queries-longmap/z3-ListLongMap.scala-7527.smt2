; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95418 () Bool)

(assert start!95418)

(declare-fun b!1077630 () Bool)

(declare-fun res!718079 () Bool)

(declare-fun e!616166 () Bool)

(assert (=> b!1077630 (=> (not res!718079) (not e!616166))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1077630 (= res!718079 (validKeyInArray!0 k0!904))))

(declare-fun b!1077632 () Bool)

(declare-fun res!718081 () Bool)

(assert (=> b!1077632 (=> (not res!718081) (not e!616166))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((array!69154 0))(
  ( (array!69155 (arr!33255 (Array (_ BitVec 32) (_ BitVec 64))) (size!33793 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69154)

(declare-datatypes ((V!39977 0))(
  ( (V!39978 (val!13125 Int)) )
))
(declare-datatypes ((ValueCell!12359 0))(
  ( (ValueCellFull!12359 (v!15744 V!39977)) (EmptyCell!12359) )
))
(declare-datatypes ((array!69156 0))(
  ( (array!69157 (arr!33256 (Array (_ BitVec 32) ValueCell!12359)) (size!33794 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69156)

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1077632 (= res!718081 (and (= (size!33794 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33793 _keys!1070) (size!33794 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1077633 () Bool)

(declare-fun res!718082 () Bool)

(assert (=> b!1077633 (=> (not res!718082) (not e!616166))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1077633 (= res!718082 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33793 _keys!1070))))))

(declare-fun b!1077634 () Bool)

(declare-fun e!616167 () Bool)

(declare-fun tp_is_empty!26137 () Bool)

(assert (=> b!1077634 (= e!616167 tp_is_empty!26137)))

(declare-fun mapNonEmpty!40948 () Bool)

(declare-fun mapRes!40948 () Bool)

(declare-fun tp!78410 () Bool)

(assert (=> mapNonEmpty!40948 (= mapRes!40948 (and tp!78410 e!616167))))

(declare-fun mapRest!40948 () (Array (_ BitVec 32) ValueCell!12359))

(declare-fun mapKey!40948 () (_ BitVec 32))

(declare-fun mapValue!40948 () ValueCell!12359)

(assert (=> mapNonEmpty!40948 (= (arr!33256 _values!874) (store mapRest!40948 mapKey!40948 mapValue!40948))))

(declare-fun b!1077635 () Bool)

(declare-fun e!616169 () Bool)

(declare-fun e!616165 () Bool)

(assert (=> b!1077635 (= e!616169 (and e!616165 mapRes!40948))))

(declare-fun condMapEmpty!40948 () Bool)

(declare-fun mapDefault!40948 () ValueCell!12359)

(assert (=> b!1077635 (= condMapEmpty!40948 (= (arr!33256 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12359)) mapDefault!40948)))))

(declare-fun b!1077636 () Bool)

(declare-fun res!718078 () Bool)

(assert (=> b!1077636 (=> (not res!718078) (not e!616166))))

(declare-datatypes ((List!23278 0))(
  ( (Nil!23275) (Cons!23274 (h!24483 (_ BitVec 64)) (t!32628 List!23278)) )
))
(declare-fun arrayNoDuplicates!0 (array!69154 (_ BitVec 32) List!23278) Bool)

(assert (=> b!1077636 (= res!718078 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23275))))

(declare-fun mapIsEmpty!40948 () Bool)

(assert (=> mapIsEmpty!40948 mapRes!40948))

(declare-fun b!1077631 () Bool)

(declare-fun res!718084 () Bool)

(assert (=> b!1077631 (=> (not res!718084) (not e!616166))))

(assert (=> b!1077631 (= res!718084 (= (select (arr!33255 _keys!1070) i!650) k0!904))))

(declare-fun res!718085 () Bool)

(assert (=> start!95418 (=> (not res!718085) (not e!616166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95418 (= res!718085 (validMask!0 mask!1414))))

(assert (=> start!95418 e!616166))

(assert (=> start!95418 true))

(declare-fun array_inv!25716 (array!69154) Bool)

(assert (=> start!95418 (array_inv!25716 _keys!1070)))

(declare-fun array_inv!25717 (array!69156) Bool)

(assert (=> start!95418 (and (array_inv!25717 _values!874) e!616169)))

(declare-fun b!1077637 () Bool)

(assert (=> b!1077637 (= e!616166 (and (bvsle #b00000000000000000000000000000000 (size!33793 _keys!1070)) (bvsge (size!33793 _keys!1070) #b01111111111111111111111111111111)))))

(declare-fun b!1077638 () Bool)

(declare-fun res!718083 () Bool)

(assert (=> b!1077638 (=> (not res!718083) (not e!616166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69154 (_ BitVec 32)) Bool)

(assert (=> b!1077638 (= res!718083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!69155 (store (arr!33255 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33793 _keys!1070)) mask!1414))))

(declare-fun b!1077639 () Bool)

(declare-fun res!718080 () Bool)

(assert (=> b!1077639 (=> (not res!718080) (not e!616166))))

(assert (=> b!1077639 (= res!718080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1077640 () Bool)

(assert (=> b!1077640 (= e!616165 tp_is_empty!26137)))

(assert (= (and start!95418 res!718085) b!1077632))

(assert (= (and b!1077632 res!718081) b!1077639))

(assert (= (and b!1077639 res!718080) b!1077636))

(assert (= (and b!1077636 res!718078) b!1077633))

(assert (= (and b!1077633 res!718082) b!1077630))

(assert (= (and b!1077630 res!718079) b!1077631))

(assert (= (and b!1077631 res!718084) b!1077638))

(assert (= (and b!1077638 res!718083) b!1077637))

(assert (= (and b!1077635 condMapEmpty!40948) mapIsEmpty!40948))

(assert (= (and b!1077635 (not condMapEmpty!40948)) mapNonEmpty!40948))

(get-info :version)

(assert (= (and mapNonEmpty!40948 ((_ is ValueCellFull!12359) mapValue!40948)) b!1077634))

(assert (= (and b!1077635 ((_ is ValueCellFull!12359) mapDefault!40948)) b!1077640))

(assert (= start!95418 b!1077635))

(declare-fun m!995877 () Bool)

(assert (=> b!1077638 m!995877))

(declare-fun m!995879 () Bool)

(assert (=> b!1077638 m!995879))

(declare-fun m!995881 () Bool)

(assert (=> b!1077630 m!995881))

(declare-fun m!995883 () Bool)

(assert (=> start!95418 m!995883))

(declare-fun m!995885 () Bool)

(assert (=> start!95418 m!995885))

(declare-fun m!995887 () Bool)

(assert (=> start!95418 m!995887))

(declare-fun m!995889 () Bool)

(assert (=> b!1077631 m!995889))

(declare-fun m!995891 () Bool)

(assert (=> mapNonEmpty!40948 m!995891))

(declare-fun m!995893 () Bool)

(assert (=> b!1077639 m!995893))

(declare-fun m!995895 () Bool)

(assert (=> b!1077636 m!995895))

(check-sat (not mapNonEmpty!40948) (not b!1077630) tp_is_empty!26137 (not b!1077636) (not start!95418) (not b!1077639) (not b!1077638))
(check-sat)
(get-model)

(declare-fun d!129707 () Bool)

(assert (=> d!129707 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!95418 d!129707))

(declare-fun d!129709 () Bool)

(assert (=> d!129709 (= (array_inv!25716 _keys!1070) (bvsge (size!33793 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!95418 d!129709))

(declare-fun d!129711 () Bool)

(assert (=> d!129711 (= (array_inv!25717 _values!874) (bvsge (size!33794 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!95418 d!129711))

(declare-fun d!129713 () Bool)

(declare-fun res!718142 () Bool)

(declare-fun e!616211 () Bool)

(assert (=> d!129713 (=> res!718142 e!616211)))

(assert (=> d!129713 (= res!718142 (bvsge #b00000000000000000000000000000000 (size!33793 _keys!1070)))))

(assert (=> d!129713 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23275) e!616211)))

(declare-fun bm!45696 () Bool)

(declare-fun call!45699 () Bool)

(declare-fun c!108277 () Bool)

(assert (=> bm!45696 (= call!45699 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108277 (Cons!23274 (select (arr!33255 _keys!1070) #b00000000000000000000000000000000) Nil!23275) Nil!23275)))))

(declare-fun b!1077717 () Bool)

(declare-fun e!616210 () Bool)

(declare-fun e!616209 () Bool)

(assert (=> b!1077717 (= e!616210 e!616209)))

(assert (=> b!1077717 (= c!108277 (validKeyInArray!0 (select (arr!33255 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1077718 () Bool)

(declare-fun e!616208 () Bool)

(declare-fun contains!6339 (List!23278 (_ BitVec 64)) Bool)

(assert (=> b!1077718 (= e!616208 (contains!6339 Nil!23275 (select (arr!33255 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1077719 () Bool)

(assert (=> b!1077719 (= e!616211 e!616210)))

(declare-fun res!718140 () Bool)

(assert (=> b!1077719 (=> (not res!718140) (not e!616210))))

(assert (=> b!1077719 (= res!718140 (not e!616208))))

(declare-fun res!718141 () Bool)

(assert (=> b!1077719 (=> (not res!718141) (not e!616208))))

(assert (=> b!1077719 (= res!718141 (validKeyInArray!0 (select (arr!33255 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1077720 () Bool)

(assert (=> b!1077720 (= e!616209 call!45699)))

(declare-fun b!1077721 () Bool)

(assert (=> b!1077721 (= e!616209 call!45699)))

(assert (= (and d!129713 (not res!718142)) b!1077719))

(assert (= (and b!1077719 res!718141) b!1077718))

(assert (= (and b!1077719 res!718140) b!1077717))

(assert (= (and b!1077717 c!108277) b!1077720))

(assert (= (and b!1077717 (not c!108277)) b!1077721))

(assert (= (or b!1077720 b!1077721) bm!45696))

(declare-fun m!995937 () Bool)

(assert (=> bm!45696 m!995937))

(declare-fun m!995939 () Bool)

(assert (=> bm!45696 m!995939))

(assert (=> b!1077717 m!995937))

(assert (=> b!1077717 m!995937))

(declare-fun m!995941 () Bool)

(assert (=> b!1077717 m!995941))

(assert (=> b!1077718 m!995937))

(assert (=> b!1077718 m!995937))

(declare-fun m!995943 () Bool)

(assert (=> b!1077718 m!995943))

(assert (=> b!1077719 m!995937))

(assert (=> b!1077719 m!995937))

(assert (=> b!1077719 m!995941))

(assert (=> b!1077636 d!129713))

(declare-fun bm!45699 () Bool)

(declare-fun call!45702 () Bool)

(assert (=> bm!45699 (= call!45702 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1077730 () Bool)

(declare-fun e!616220 () Bool)

(declare-fun e!616218 () Bool)

(assert (=> b!1077730 (= e!616220 e!616218)))

(declare-fun lt!478364 () (_ BitVec 64))

(assert (=> b!1077730 (= lt!478364 (select (arr!33255 _keys!1070) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!35303 0))(
  ( (Unit!35304) )
))
(declare-fun lt!478366 () Unit!35303)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69154 (_ BitVec 64) (_ BitVec 32)) Unit!35303)

(assert (=> b!1077730 (= lt!478366 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!478364 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!69154 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1077730 (arrayContainsKey!0 _keys!1070 lt!478364 #b00000000000000000000000000000000)))

(declare-fun lt!478365 () Unit!35303)

(assert (=> b!1077730 (= lt!478365 lt!478366)))

(declare-fun res!718147 () Bool)

(declare-datatypes ((SeekEntryResult!9899 0))(
  ( (MissingZero!9899 (index!41967 (_ BitVec 32))) (Found!9899 (index!41968 (_ BitVec 32))) (Intermediate!9899 (undefined!10711 Bool) (index!41969 (_ BitVec 32)) (x!96619 (_ BitVec 32))) (Undefined!9899) (MissingVacant!9899 (index!41970 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69154 (_ BitVec 32)) SeekEntryResult!9899)

(assert (=> b!1077730 (= res!718147 (= (seekEntryOrOpen!0 (select (arr!33255 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9899 #b00000000000000000000000000000000)))))

(assert (=> b!1077730 (=> (not res!718147) (not e!616218))))

(declare-fun b!1077731 () Bool)

(declare-fun e!616219 () Bool)

(assert (=> b!1077731 (= e!616219 e!616220)))

(declare-fun c!108280 () Bool)

(assert (=> b!1077731 (= c!108280 (validKeyInArray!0 (select (arr!33255 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1077732 () Bool)

(assert (=> b!1077732 (= e!616218 call!45702)))

(declare-fun b!1077733 () Bool)

(assert (=> b!1077733 (= e!616220 call!45702)))

(declare-fun d!129715 () Bool)

(declare-fun res!718148 () Bool)

(assert (=> d!129715 (=> res!718148 e!616219)))

(assert (=> d!129715 (= res!718148 (bvsge #b00000000000000000000000000000000 (size!33793 _keys!1070)))))

(assert (=> d!129715 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!616219)))

(assert (= (and d!129715 (not res!718148)) b!1077731))

(assert (= (and b!1077731 c!108280) b!1077730))

(assert (= (and b!1077731 (not c!108280)) b!1077733))

(assert (= (and b!1077730 res!718147) b!1077732))

(assert (= (or b!1077732 b!1077733) bm!45699))

(declare-fun m!995945 () Bool)

(assert (=> bm!45699 m!995945))

(assert (=> b!1077730 m!995937))

(declare-fun m!995947 () Bool)

(assert (=> b!1077730 m!995947))

(declare-fun m!995949 () Bool)

(assert (=> b!1077730 m!995949))

(assert (=> b!1077730 m!995937))

(declare-fun m!995951 () Bool)

(assert (=> b!1077730 m!995951))

(assert (=> b!1077731 m!995937))

(assert (=> b!1077731 m!995937))

(assert (=> b!1077731 m!995941))

(assert (=> b!1077639 d!129715))

(declare-fun d!129717 () Bool)

(assert (=> d!129717 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1077630 d!129717))

(declare-fun call!45703 () Bool)

(declare-fun bm!45700 () Bool)

(assert (=> bm!45700 (= call!45703 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!69155 (store (arr!33255 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33793 _keys!1070)) mask!1414))))

(declare-fun b!1077734 () Bool)

(declare-fun e!616223 () Bool)

(declare-fun e!616221 () Bool)

(assert (=> b!1077734 (= e!616223 e!616221)))

(declare-fun lt!478367 () (_ BitVec 64))

(assert (=> b!1077734 (= lt!478367 (select (arr!33255 (array!69155 (store (arr!33255 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33793 _keys!1070))) #b00000000000000000000000000000000))))

(declare-fun lt!478369 () Unit!35303)

(assert (=> b!1077734 (= lt!478369 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69155 (store (arr!33255 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33793 _keys!1070)) lt!478367 #b00000000000000000000000000000000))))

(assert (=> b!1077734 (arrayContainsKey!0 (array!69155 (store (arr!33255 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33793 _keys!1070)) lt!478367 #b00000000000000000000000000000000)))

(declare-fun lt!478368 () Unit!35303)

(assert (=> b!1077734 (= lt!478368 lt!478369)))

(declare-fun res!718149 () Bool)

(assert (=> b!1077734 (= res!718149 (= (seekEntryOrOpen!0 (select (arr!33255 (array!69155 (store (arr!33255 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33793 _keys!1070))) #b00000000000000000000000000000000) (array!69155 (store (arr!33255 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33793 _keys!1070)) mask!1414) (Found!9899 #b00000000000000000000000000000000)))))

(assert (=> b!1077734 (=> (not res!718149) (not e!616221))))

(declare-fun b!1077735 () Bool)

(declare-fun e!616222 () Bool)

(assert (=> b!1077735 (= e!616222 e!616223)))

(declare-fun c!108281 () Bool)

(assert (=> b!1077735 (= c!108281 (validKeyInArray!0 (select (arr!33255 (array!69155 (store (arr!33255 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33793 _keys!1070))) #b00000000000000000000000000000000)))))

(declare-fun b!1077736 () Bool)

(assert (=> b!1077736 (= e!616221 call!45703)))

(declare-fun b!1077737 () Bool)

(assert (=> b!1077737 (= e!616223 call!45703)))

(declare-fun d!129719 () Bool)

(declare-fun res!718150 () Bool)

(assert (=> d!129719 (=> res!718150 e!616222)))

(assert (=> d!129719 (= res!718150 (bvsge #b00000000000000000000000000000000 (size!33793 (array!69155 (store (arr!33255 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33793 _keys!1070)))))))

(assert (=> d!129719 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!69155 (store (arr!33255 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33793 _keys!1070)) mask!1414) e!616222)))

(assert (= (and d!129719 (not res!718150)) b!1077735))

(assert (= (and b!1077735 c!108281) b!1077734))

(assert (= (and b!1077735 (not c!108281)) b!1077737))

(assert (= (and b!1077734 res!718149) b!1077736))

(assert (= (or b!1077736 b!1077737) bm!45700))

(declare-fun m!995953 () Bool)

(assert (=> bm!45700 m!995953))

(declare-fun m!995955 () Bool)

(assert (=> b!1077734 m!995955))

(declare-fun m!995957 () Bool)

(assert (=> b!1077734 m!995957))

(declare-fun m!995959 () Bool)

(assert (=> b!1077734 m!995959))

(assert (=> b!1077734 m!995955))

(declare-fun m!995961 () Bool)

(assert (=> b!1077734 m!995961))

(assert (=> b!1077735 m!995955))

(assert (=> b!1077735 m!995955))

(declare-fun m!995963 () Bool)

(assert (=> b!1077735 m!995963))

(assert (=> b!1077638 d!129719))

(declare-fun b!1077744 () Bool)

(declare-fun e!616229 () Bool)

(assert (=> b!1077744 (= e!616229 tp_is_empty!26137)))

(declare-fun mapIsEmpty!40957 () Bool)

(declare-fun mapRes!40957 () Bool)

(assert (=> mapIsEmpty!40957 mapRes!40957))

(declare-fun condMapEmpty!40957 () Bool)

(declare-fun mapDefault!40957 () ValueCell!12359)

(assert (=> mapNonEmpty!40948 (= condMapEmpty!40957 (= mapRest!40948 ((as const (Array (_ BitVec 32) ValueCell!12359)) mapDefault!40957)))))

(declare-fun e!616228 () Bool)

(assert (=> mapNonEmpty!40948 (= tp!78410 (and e!616228 mapRes!40957))))

(declare-fun b!1077745 () Bool)

(assert (=> b!1077745 (= e!616228 tp_is_empty!26137)))

(declare-fun mapNonEmpty!40957 () Bool)

(declare-fun tp!78419 () Bool)

(assert (=> mapNonEmpty!40957 (= mapRes!40957 (and tp!78419 e!616229))))

(declare-fun mapKey!40957 () (_ BitVec 32))

(declare-fun mapValue!40957 () ValueCell!12359)

(declare-fun mapRest!40957 () (Array (_ BitVec 32) ValueCell!12359))

(assert (=> mapNonEmpty!40957 (= mapRest!40948 (store mapRest!40957 mapKey!40957 mapValue!40957))))

(assert (= (and mapNonEmpty!40948 condMapEmpty!40957) mapIsEmpty!40957))

(assert (= (and mapNonEmpty!40948 (not condMapEmpty!40957)) mapNonEmpty!40957))

(assert (= (and mapNonEmpty!40957 ((_ is ValueCellFull!12359) mapValue!40957)) b!1077744))

(assert (= (and mapNonEmpty!40948 ((_ is ValueCellFull!12359) mapDefault!40957)) b!1077745))

(declare-fun m!995965 () Bool)

(assert (=> mapNonEmpty!40957 m!995965))

(check-sat (not mapNonEmpty!40957) (not bm!45699) (not b!1077719) tp_is_empty!26137 (not b!1077717) (not bm!45696) (not b!1077718) (not bm!45700) (not b!1077735) (not b!1077731) (not b!1077730) (not b!1077734))
(check-sat)
