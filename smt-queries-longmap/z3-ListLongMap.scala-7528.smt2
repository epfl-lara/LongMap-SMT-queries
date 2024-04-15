; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95436 () Bool)

(assert start!95436)

(declare-fun res!718173 () Bool)

(declare-fun e!616241 () Bool)

(assert (=> start!95436 (=> (not res!718173) (not e!616241))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95436 (= res!718173 (validMask!0 mask!1414))))

(assert (=> start!95436 e!616241))

(assert (=> start!95436 true))

(declare-datatypes ((array!69168 0))(
  ( (array!69169 (arr!33261 (Array (_ BitVec 32) (_ BitVec 64))) (size!33799 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69168)

(declare-fun array_inv!25720 (array!69168) Bool)

(assert (=> start!95436 (array_inv!25720 _keys!1070)))

(declare-datatypes ((V!39985 0))(
  ( (V!39986 (val!13128 Int)) )
))
(declare-datatypes ((ValueCell!12362 0))(
  ( (ValueCellFull!12362 (v!15747 V!39985)) (EmptyCell!12362) )
))
(declare-datatypes ((array!69170 0))(
  ( (array!69171 (arr!33262 (Array (_ BitVec 32) ValueCell!12362)) (size!33800 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69170)

(declare-fun e!616243 () Bool)

(declare-fun array_inv!25721 (array!69170) Bool)

(assert (=> start!95436 (and (array_inv!25721 _values!874) e!616243)))

(declare-fun b!1077770 () Bool)

(declare-fun res!718169 () Bool)

(assert (=> b!1077770 (=> (not res!718169) (not e!616241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69168 (_ BitVec 32)) Bool)

(assert (=> b!1077770 (= res!718169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1077771 () Bool)

(declare-fun res!718172 () Bool)

(assert (=> b!1077771 (=> (not res!718172) (not e!616241))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1077771 (= res!718172 (validKeyInArray!0 k0!904))))

(declare-fun b!1077772 () Bool)

(declare-fun res!718171 () Bool)

(assert (=> b!1077772 (=> (not res!718171) (not e!616241))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1077772 (= res!718171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!69169 (store (arr!33261 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33799 _keys!1070)) mask!1414))))

(declare-fun b!1077773 () Bool)

(declare-fun e!616244 () Bool)

(declare-fun tp_is_empty!26143 () Bool)

(assert (=> b!1077773 (= e!616244 tp_is_empty!26143)))

(declare-fun b!1077774 () Bool)

(declare-fun res!718176 () Bool)

(assert (=> b!1077774 (=> (not res!718176) (not e!616241))))

(declare-datatypes ((List!23281 0))(
  ( (Nil!23278) (Cons!23277 (h!24486 (_ BitVec 64)) (t!32631 List!23281)) )
))
(declare-fun arrayNoDuplicates!0 (array!69168 (_ BitVec 32) List!23281) Bool)

(assert (=> b!1077774 (= res!718176 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23278))))

(declare-fun b!1077775 () Bool)

(declare-fun noDuplicate!1589 (List!23281) Bool)

(assert (=> b!1077775 (= e!616241 (not (noDuplicate!1589 Nil!23278)))))

(declare-fun mapNonEmpty!40960 () Bool)

(declare-fun mapRes!40960 () Bool)

(declare-fun tp!78422 () Bool)

(assert (=> mapNonEmpty!40960 (= mapRes!40960 (and tp!78422 e!616244))))

(declare-fun mapRest!40960 () (Array (_ BitVec 32) ValueCell!12362))

(declare-fun mapKey!40960 () (_ BitVec 32))

(declare-fun mapValue!40960 () ValueCell!12362)

(assert (=> mapNonEmpty!40960 (= (arr!33262 _values!874) (store mapRest!40960 mapKey!40960 mapValue!40960))))

(declare-fun b!1077776 () Bool)

(declare-fun res!718175 () Bool)

(assert (=> b!1077776 (=> (not res!718175) (not e!616241))))

(assert (=> b!1077776 (= res!718175 (= (select (arr!33261 _keys!1070) i!650) k0!904))))

(declare-fun b!1077777 () Bool)

(declare-fun res!718170 () Bool)

(assert (=> b!1077777 (=> (not res!718170) (not e!616241))))

(assert (=> b!1077777 (= res!718170 (and (bvsle #b00000000000000000000000000000000 (size!33799 _keys!1070)) (bvslt (size!33799 _keys!1070) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!40960 () Bool)

(assert (=> mapIsEmpty!40960 mapRes!40960))

(declare-fun b!1077778 () Bool)

(declare-fun e!616240 () Bool)

(assert (=> b!1077778 (= e!616240 tp_is_empty!26143)))

(declare-fun b!1077779 () Bool)

(declare-fun res!718174 () Bool)

(assert (=> b!1077779 (=> (not res!718174) (not e!616241))))

(assert (=> b!1077779 (= res!718174 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33799 _keys!1070))))))

(declare-fun b!1077780 () Bool)

(declare-fun res!718177 () Bool)

(assert (=> b!1077780 (=> (not res!718177) (not e!616241))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1077780 (= res!718177 (and (= (size!33800 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33799 _keys!1070) (size!33800 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1077781 () Bool)

(assert (=> b!1077781 (= e!616243 (and e!616240 mapRes!40960))))

(declare-fun condMapEmpty!40960 () Bool)

(declare-fun mapDefault!40960 () ValueCell!12362)

(assert (=> b!1077781 (= condMapEmpty!40960 (= (arr!33262 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12362)) mapDefault!40960)))))

(assert (= (and start!95436 res!718173) b!1077780))

(assert (= (and b!1077780 res!718177) b!1077770))

(assert (= (and b!1077770 res!718169) b!1077774))

(assert (= (and b!1077774 res!718176) b!1077779))

(assert (= (and b!1077779 res!718174) b!1077771))

(assert (= (and b!1077771 res!718172) b!1077776))

(assert (= (and b!1077776 res!718175) b!1077772))

(assert (= (and b!1077772 res!718171) b!1077777))

(assert (= (and b!1077777 res!718170) b!1077775))

(assert (= (and b!1077781 condMapEmpty!40960) mapIsEmpty!40960))

(assert (= (and b!1077781 (not condMapEmpty!40960)) mapNonEmpty!40960))

(get-info :version)

(assert (= (and mapNonEmpty!40960 ((_ is ValueCellFull!12362) mapValue!40960)) b!1077773))

(assert (= (and b!1077781 ((_ is ValueCellFull!12362) mapDefault!40960)) b!1077778))

(assert (= start!95436 b!1077781))

(declare-fun m!995967 () Bool)

(assert (=> b!1077774 m!995967))

(declare-fun m!995969 () Bool)

(assert (=> b!1077770 m!995969))

(declare-fun m!995971 () Bool)

(assert (=> b!1077775 m!995971))

(declare-fun m!995973 () Bool)

(assert (=> start!95436 m!995973))

(declare-fun m!995975 () Bool)

(assert (=> start!95436 m!995975))

(declare-fun m!995977 () Bool)

(assert (=> start!95436 m!995977))

(declare-fun m!995979 () Bool)

(assert (=> b!1077772 m!995979))

(declare-fun m!995981 () Bool)

(assert (=> b!1077772 m!995981))

(declare-fun m!995983 () Bool)

(assert (=> mapNonEmpty!40960 m!995983))

(declare-fun m!995985 () Bool)

(assert (=> b!1077776 m!995985))

(declare-fun m!995987 () Bool)

(assert (=> b!1077771 m!995987))

(check-sat (not b!1077770) (not b!1077774) (not b!1077772) (not start!95436) (not mapNonEmpty!40960) tp_is_empty!26143 (not b!1077771) (not b!1077775))
(check-sat)
(get-model)

(declare-fun d!129723 () Bool)

(assert (=> d!129723 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!95436 d!129723))

(declare-fun d!129725 () Bool)

(assert (=> d!129725 (= (array_inv!25720 _keys!1070) (bvsge (size!33799 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!95436 d!129725))

(declare-fun d!129727 () Bool)

(assert (=> d!129727 (= (array_inv!25721 _values!874) (bvsge (size!33800 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!95436 d!129727))

(declare-fun b!1077862 () Bool)

(declare-fun e!616281 () Bool)

(declare-fun call!45706 () Bool)

(assert (=> b!1077862 (= e!616281 call!45706)))

(declare-fun b!1077863 () Bool)

(declare-fun e!616282 () Bool)

(assert (=> b!1077863 (= e!616282 call!45706)))

(declare-fun b!1077864 () Bool)

(declare-fun e!616283 () Bool)

(assert (=> b!1077864 (= e!616283 e!616282)))

(declare-fun c!108284 () Bool)

(assert (=> b!1077864 (= c!108284 (validKeyInArray!0 (select (arr!33261 (array!69169 (store (arr!33261 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33799 _keys!1070))) #b00000000000000000000000000000000)))))

(declare-fun bm!45703 () Bool)

(assert (=> bm!45703 (= call!45706 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!69169 (store (arr!33261 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33799 _keys!1070)) mask!1414))))

(declare-fun b!1077865 () Bool)

(assert (=> b!1077865 (= e!616282 e!616281)))

(declare-fun lt!478377 () (_ BitVec 64))

(assert (=> b!1077865 (= lt!478377 (select (arr!33261 (array!69169 (store (arr!33261 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33799 _keys!1070))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!35305 0))(
  ( (Unit!35306) )
))
(declare-fun lt!478376 () Unit!35305)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69168 (_ BitVec 64) (_ BitVec 32)) Unit!35305)

(assert (=> b!1077865 (= lt!478376 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69169 (store (arr!33261 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33799 _keys!1070)) lt!478377 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!69168 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1077865 (arrayContainsKey!0 (array!69169 (store (arr!33261 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33799 _keys!1070)) lt!478377 #b00000000000000000000000000000000)))

(declare-fun lt!478378 () Unit!35305)

(assert (=> b!1077865 (= lt!478378 lt!478376)))

(declare-fun res!718237 () Bool)

(declare-datatypes ((SeekEntryResult!9900 0))(
  ( (MissingZero!9900 (index!41971 (_ BitVec 32))) (Found!9900 (index!41972 (_ BitVec 32))) (Intermediate!9900 (undefined!10712 Bool) (index!41973 (_ BitVec 32)) (x!96630 (_ BitVec 32))) (Undefined!9900) (MissingVacant!9900 (index!41974 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69168 (_ BitVec 32)) SeekEntryResult!9900)

(assert (=> b!1077865 (= res!718237 (= (seekEntryOrOpen!0 (select (arr!33261 (array!69169 (store (arr!33261 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33799 _keys!1070))) #b00000000000000000000000000000000) (array!69169 (store (arr!33261 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33799 _keys!1070)) mask!1414) (Found!9900 #b00000000000000000000000000000000)))))

(assert (=> b!1077865 (=> (not res!718237) (not e!616281))))

(declare-fun d!129729 () Bool)

(declare-fun res!718236 () Bool)

(assert (=> d!129729 (=> res!718236 e!616283)))

(assert (=> d!129729 (= res!718236 (bvsge #b00000000000000000000000000000000 (size!33799 (array!69169 (store (arr!33261 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33799 _keys!1070)))))))

(assert (=> d!129729 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!69169 (store (arr!33261 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33799 _keys!1070)) mask!1414) e!616283)))

(assert (= (and d!129729 (not res!718236)) b!1077864))

(assert (= (and b!1077864 c!108284) b!1077865))

(assert (= (and b!1077864 (not c!108284)) b!1077863))

(assert (= (and b!1077865 res!718237) b!1077862))

(assert (= (or b!1077862 b!1077863) bm!45703))

(declare-fun m!996033 () Bool)

(assert (=> b!1077864 m!996033))

(assert (=> b!1077864 m!996033))

(declare-fun m!996035 () Bool)

(assert (=> b!1077864 m!996035))

(declare-fun m!996037 () Bool)

(assert (=> bm!45703 m!996037))

(assert (=> b!1077865 m!996033))

(declare-fun m!996039 () Bool)

(assert (=> b!1077865 m!996039))

(declare-fun m!996041 () Bool)

(assert (=> b!1077865 m!996041))

(assert (=> b!1077865 m!996033))

(declare-fun m!996043 () Bool)

(assert (=> b!1077865 m!996043))

(assert (=> b!1077772 d!129729))

(declare-fun b!1077866 () Bool)

(declare-fun e!616284 () Bool)

(declare-fun call!45707 () Bool)

(assert (=> b!1077866 (= e!616284 call!45707)))

(declare-fun b!1077867 () Bool)

(declare-fun e!616285 () Bool)

(assert (=> b!1077867 (= e!616285 call!45707)))

(declare-fun b!1077868 () Bool)

(declare-fun e!616286 () Bool)

(assert (=> b!1077868 (= e!616286 e!616285)))

(declare-fun c!108285 () Bool)

(assert (=> b!1077868 (= c!108285 (validKeyInArray!0 (select (arr!33261 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!45704 () Bool)

(assert (=> bm!45704 (= call!45707 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1077869 () Bool)

(assert (=> b!1077869 (= e!616285 e!616284)))

(declare-fun lt!478380 () (_ BitVec 64))

(assert (=> b!1077869 (= lt!478380 (select (arr!33261 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!478379 () Unit!35305)

(assert (=> b!1077869 (= lt!478379 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!478380 #b00000000000000000000000000000000))))

(assert (=> b!1077869 (arrayContainsKey!0 _keys!1070 lt!478380 #b00000000000000000000000000000000)))

(declare-fun lt!478381 () Unit!35305)

(assert (=> b!1077869 (= lt!478381 lt!478379)))

(declare-fun res!718239 () Bool)

(assert (=> b!1077869 (= res!718239 (= (seekEntryOrOpen!0 (select (arr!33261 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9900 #b00000000000000000000000000000000)))))

(assert (=> b!1077869 (=> (not res!718239) (not e!616284))))

(declare-fun d!129731 () Bool)

(declare-fun res!718238 () Bool)

(assert (=> d!129731 (=> res!718238 e!616286)))

(assert (=> d!129731 (= res!718238 (bvsge #b00000000000000000000000000000000 (size!33799 _keys!1070)))))

(assert (=> d!129731 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!616286)))

(assert (= (and d!129731 (not res!718238)) b!1077868))

(assert (= (and b!1077868 c!108285) b!1077869))

(assert (= (and b!1077868 (not c!108285)) b!1077867))

(assert (= (and b!1077869 res!718239) b!1077866))

(assert (= (or b!1077866 b!1077867) bm!45704))

(declare-fun m!996045 () Bool)

(assert (=> b!1077868 m!996045))

(assert (=> b!1077868 m!996045))

(declare-fun m!996047 () Bool)

(assert (=> b!1077868 m!996047))

(declare-fun m!996049 () Bool)

(assert (=> bm!45704 m!996049))

(assert (=> b!1077869 m!996045))

(declare-fun m!996051 () Bool)

(assert (=> b!1077869 m!996051))

(declare-fun m!996053 () Bool)

(assert (=> b!1077869 m!996053))

(assert (=> b!1077869 m!996045))

(declare-fun m!996055 () Bool)

(assert (=> b!1077869 m!996055))

(assert (=> b!1077770 d!129731))

(declare-fun d!129733 () Bool)

(assert (=> d!129733 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1077771 d!129733))

(declare-fun d!129735 () Bool)

(declare-fun res!718248 () Bool)

(declare-fun e!616298 () Bool)

(assert (=> d!129735 (=> res!718248 e!616298)))

(assert (=> d!129735 (= res!718248 (bvsge #b00000000000000000000000000000000 (size!33799 _keys!1070)))))

(assert (=> d!129735 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23278) e!616298)))

(declare-fun b!1077880 () Bool)

(declare-fun e!616297 () Bool)

(declare-fun call!45710 () Bool)

(assert (=> b!1077880 (= e!616297 call!45710)))

(declare-fun b!1077881 () Bool)

(declare-fun e!616295 () Bool)

(assert (=> b!1077881 (= e!616298 e!616295)))

(declare-fun res!718246 () Bool)

(assert (=> b!1077881 (=> (not res!718246) (not e!616295))))

(declare-fun e!616296 () Bool)

(assert (=> b!1077881 (= res!718246 (not e!616296))))

(declare-fun res!718247 () Bool)

(assert (=> b!1077881 (=> (not res!718247) (not e!616296))))

(assert (=> b!1077881 (= res!718247 (validKeyInArray!0 (select (arr!33261 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1077882 () Bool)

(assert (=> b!1077882 (= e!616295 e!616297)))

(declare-fun c!108288 () Bool)

(assert (=> b!1077882 (= c!108288 (validKeyInArray!0 (select (arr!33261 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1077883 () Bool)

(assert (=> b!1077883 (= e!616297 call!45710)))

(declare-fun b!1077884 () Bool)

(declare-fun contains!6340 (List!23281 (_ BitVec 64)) Bool)

(assert (=> b!1077884 (= e!616296 (contains!6340 Nil!23278 (select (arr!33261 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!45707 () Bool)

(assert (=> bm!45707 (= call!45710 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108288 (Cons!23277 (select (arr!33261 _keys!1070) #b00000000000000000000000000000000) Nil!23278) Nil!23278)))))

(assert (= (and d!129735 (not res!718248)) b!1077881))

(assert (= (and b!1077881 res!718247) b!1077884))

(assert (= (and b!1077881 res!718246) b!1077882))

(assert (= (and b!1077882 c!108288) b!1077880))

(assert (= (and b!1077882 (not c!108288)) b!1077883))

(assert (= (or b!1077880 b!1077883) bm!45707))

(assert (=> b!1077881 m!996045))

(assert (=> b!1077881 m!996045))

(assert (=> b!1077881 m!996047))

(assert (=> b!1077882 m!996045))

(assert (=> b!1077882 m!996045))

(assert (=> b!1077882 m!996047))

(assert (=> b!1077884 m!996045))

(assert (=> b!1077884 m!996045))

(declare-fun m!996057 () Bool)

(assert (=> b!1077884 m!996057))

(assert (=> bm!45707 m!996045))

(declare-fun m!996059 () Bool)

(assert (=> bm!45707 m!996059))

(assert (=> b!1077774 d!129735))

(declare-fun d!129737 () Bool)

(declare-fun res!718253 () Bool)

(declare-fun e!616303 () Bool)

(assert (=> d!129737 (=> res!718253 e!616303)))

(assert (=> d!129737 (= res!718253 ((_ is Nil!23278) Nil!23278))))

(assert (=> d!129737 (= (noDuplicate!1589 Nil!23278) e!616303)))

(declare-fun b!1077889 () Bool)

(declare-fun e!616304 () Bool)

(assert (=> b!1077889 (= e!616303 e!616304)))

(declare-fun res!718254 () Bool)

(assert (=> b!1077889 (=> (not res!718254) (not e!616304))))

(assert (=> b!1077889 (= res!718254 (not (contains!6340 (t!32631 Nil!23278) (h!24486 Nil!23278))))))

(declare-fun b!1077890 () Bool)

(assert (=> b!1077890 (= e!616304 (noDuplicate!1589 (t!32631 Nil!23278)))))

(assert (= (and d!129737 (not res!718253)) b!1077889))

(assert (= (and b!1077889 res!718254) b!1077890))

(declare-fun m!996061 () Bool)

(assert (=> b!1077889 m!996061))

(declare-fun m!996063 () Bool)

(assert (=> b!1077890 m!996063))

(assert (=> b!1077775 d!129737))

(declare-fun mapNonEmpty!40969 () Bool)

(declare-fun mapRes!40969 () Bool)

(declare-fun tp!78431 () Bool)

(declare-fun e!616309 () Bool)

(assert (=> mapNonEmpty!40969 (= mapRes!40969 (and tp!78431 e!616309))))

(declare-fun mapValue!40969 () ValueCell!12362)

(declare-fun mapKey!40969 () (_ BitVec 32))

(declare-fun mapRest!40969 () (Array (_ BitVec 32) ValueCell!12362))

(assert (=> mapNonEmpty!40969 (= mapRest!40960 (store mapRest!40969 mapKey!40969 mapValue!40969))))

(declare-fun mapIsEmpty!40969 () Bool)

(assert (=> mapIsEmpty!40969 mapRes!40969))

(declare-fun condMapEmpty!40969 () Bool)

(declare-fun mapDefault!40969 () ValueCell!12362)

(assert (=> mapNonEmpty!40960 (= condMapEmpty!40969 (= mapRest!40960 ((as const (Array (_ BitVec 32) ValueCell!12362)) mapDefault!40969)))))

(declare-fun e!616310 () Bool)

(assert (=> mapNonEmpty!40960 (= tp!78422 (and e!616310 mapRes!40969))))

(declare-fun b!1077897 () Bool)

(assert (=> b!1077897 (= e!616309 tp_is_empty!26143)))

(declare-fun b!1077898 () Bool)

(assert (=> b!1077898 (= e!616310 tp_is_empty!26143)))

(assert (= (and mapNonEmpty!40960 condMapEmpty!40969) mapIsEmpty!40969))

(assert (= (and mapNonEmpty!40960 (not condMapEmpty!40969)) mapNonEmpty!40969))

(assert (= (and mapNonEmpty!40969 ((_ is ValueCellFull!12362) mapValue!40969)) b!1077897))

(assert (= (and mapNonEmpty!40960 ((_ is ValueCellFull!12362) mapDefault!40969)) b!1077898))

(declare-fun m!996065 () Bool)

(assert (=> mapNonEmpty!40969 m!996065))

(check-sat (not b!1077881) (not b!1077869) (not bm!45703) (not bm!45707) (not b!1077868) (not b!1077865) (not b!1077889) tp_is_empty!26143 (not b!1077890) (not b!1077882) (not bm!45704) (not b!1077884) (not b!1077864) (not mapNonEmpty!40969))
(check-sat)
