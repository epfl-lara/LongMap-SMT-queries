; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95756 () Bool)

(assert start!95756)

(declare-fun b!1080194 () Bool)

(declare-fun res!719450 () Bool)

(declare-fun e!617696 () Bool)

(assert (=> b!1080194 (=> (not res!719450) (not e!617696))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69373 0))(
  ( (array!69374 (arr!33355 (Array (_ BitVec 32) (_ BitVec 64))) (size!33892 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69373)

(declare-datatypes ((V!40049 0))(
  ( (V!40050 (val!13152 Int)) )
))
(declare-datatypes ((ValueCell!12386 0))(
  ( (ValueCellFull!12386 (v!15769 V!40049)) (EmptyCell!12386) )
))
(declare-datatypes ((array!69375 0))(
  ( (array!69376 (arr!33356 (Array (_ BitVec 32) ValueCell!12386)) (size!33893 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69375)

(assert (=> b!1080194 (= res!719450 (and (= (size!33893 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33892 _keys!1070) (size!33893 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!41038 () Bool)

(declare-fun mapRes!41038 () Bool)

(assert (=> mapIsEmpty!41038 mapRes!41038))

(declare-fun mapNonEmpty!41038 () Bool)

(declare-fun tp!78500 () Bool)

(declare-fun e!617698 () Bool)

(assert (=> mapNonEmpty!41038 (= mapRes!41038 (and tp!78500 e!617698))))

(declare-fun mapRest!41038 () (Array (_ BitVec 32) ValueCell!12386))

(declare-fun mapKey!41038 () (_ BitVec 32))

(declare-fun mapValue!41038 () ValueCell!12386)

(assert (=> mapNonEmpty!41038 (= (arr!33356 _values!874) (store mapRest!41038 mapKey!41038 mapValue!41038))))

(declare-fun b!1080195 () Bool)

(declare-fun e!617697 () Bool)

(declare-fun e!617694 () Bool)

(assert (=> b!1080195 (= e!617697 (and e!617694 mapRes!41038))))

(declare-fun condMapEmpty!41038 () Bool)

(declare-fun mapDefault!41038 () ValueCell!12386)

(assert (=> b!1080195 (= condMapEmpty!41038 (= (arr!33356 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12386)) mapDefault!41038)))))

(declare-fun b!1080196 () Bool)

(declare-fun res!719451 () Bool)

(assert (=> b!1080196 (=> (not res!719451) (not e!617696))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69373 (_ BitVec 32)) Bool)

(assert (=> b!1080196 (= res!719451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080197 () Bool)

(declare-fun res!719444 () Bool)

(assert (=> b!1080197 (=> (not res!719444) (not e!617696))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1080197 (= res!719444 (= (select (arr!33355 _keys!1070) i!650) k0!904))))

(declare-fun b!1080198 () Bool)

(declare-fun res!719449 () Bool)

(assert (=> b!1080198 (=> (not res!719449) (not e!617696))))

(assert (=> b!1080198 (= res!719449 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33892 _keys!1070))))))

(declare-fun b!1080199 () Bool)

(declare-fun res!719447 () Bool)

(assert (=> b!1080199 (=> (not res!719447) (not e!617696))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080199 (= res!719447 (validKeyInArray!0 k0!904))))

(declare-fun b!1080200 () Bool)

(declare-fun tp_is_empty!26191 () Bool)

(assert (=> b!1080200 (= e!617698 tp_is_empty!26191)))

(declare-fun b!1080201 () Bool)

(declare-fun e!617693 () Bool)

(assert (=> b!1080201 (= e!617696 e!617693)))

(declare-fun res!719446 () Bool)

(assert (=> b!1080201 (=> (not res!719446) (not e!617693))))

(declare-fun lt!479225 () array!69373)

(assert (=> b!1080201 (= res!719446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479225 mask!1414))))

(assert (=> b!1080201 (= lt!479225 (array!69374 (store (arr!33355 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33892 _keys!1070)))))

(declare-fun b!1080202 () Bool)

(assert (=> b!1080202 (= e!617694 tp_is_empty!26191)))

(declare-fun b!1080203 () Bool)

(assert (=> b!1080203 (= e!617693 (not (or (bvsge #b00000000000000000000000000000000 (size!33892 _keys!1070)) (bvslt (size!33892 _keys!1070) #b01111111111111111111111111111111))))))

(declare-fun arrayContainsKey!0 (array!69373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080203 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35449 0))(
  ( (Unit!35450) )
))
(declare-fun lt!479226 () Unit!35449)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69373 (_ BitVec 64) (_ BitVec 32)) Unit!35449)

(assert (=> b!1080203 (= lt!479226 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1080204 () Bool)

(declare-fun res!719452 () Bool)

(assert (=> b!1080204 (=> (not res!719452) (not e!617696))))

(declare-datatypes ((List!23258 0))(
  ( (Nil!23255) (Cons!23254 (h!24472 (_ BitVec 64)) (t!32609 List!23258)) )
))
(declare-fun arrayNoDuplicates!0 (array!69373 (_ BitVec 32) List!23258) Bool)

(assert (=> b!1080204 (= res!719452 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23255))))

(declare-fun b!1080205 () Bool)

(declare-fun res!719445 () Bool)

(assert (=> b!1080205 (=> (not res!719445) (not e!617693))))

(assert (=> b!1080205 (= res!719445 (arrayNoDuplicates!0 lt!479225 #b00000000000000000000000000000000 Nil!23255))))

(declare-fun res!719448 () Bool)

(assert (=> start!95756 (=> (not res!719448) (not e!617696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95756 (= res!719448 (validMask!0 mask!1414))))

(assert (=> start!95756 e!617696))

(assert (=> start!95756 true))

(declare-fun array_inv!25798 (array!69373) Bool)

(assert (=> start!95756 (array_inv!25798 _keys!1070)))

(declare-fun array_inv!25799 (array!69375) Bool)

(assert (=> start!95756 (and (array_inv!25799 _values!874) e!617697)))

(assert (= (and start!95756 res!719448) b!1080194))

(assert (= (and b!1080194 res!719450) b!1080196))

(assert (= (and b!1080196 res!719451) b!1080204))

(assert (= (and b!1080204 res!719452) b!1080198))

(assert (= (and b!1080198 res!719449) b!1080199))

(assert (= (and b!1080199 res!719447) b!1080197))

(assert (= (and b!1080197 res!719444) b!1080201))

(assert (= (and b!1080201 res!719446) b!1080205))

(assert (= (and b!1080205 res!719445) b!1080203))

(assert (= (and b!1080195 condMapEmpty!41038) mapIsEmpty!41038))

(assert (= (and b!1080195 (not condMapEmpty!41038)) mapNonEmpty!41038))

(get-info :version)

(assert (= (and mapNonEmpty!41038 ((_ is ValueCellFull!12386) mapValue!41038)) b!1080200))

(assert (= (and b!1080195 ((_ is ValueCellFull!12386) mapDefault!41038)) b!1080202))

(assert (= start!95756 b!1080195))

(declare-fun m!998907 () Bool)

(assert (=> b!1080199 m!998907))

(declare-fun m!998909 () Bool)

(assert (=> b!1080197 m!998909))

(declare-fun m!998911 () Bool)

(assert (=> b!1080205 m!998911))

(declare-fun m!998913 () Bool)

(assert (=> b!1080204 m!998913))

(declare-fun m!998915 () Bool)

(assert (=> mapNonEmpty!41038 m!998915))

(declare-fun m!998917 () Bool)

(assert (=> b!1080203 m!998917))

(declare-fun m!998919 () Bool)

(assert (=> b!1080203 m!998919))

(declare-fun m!998921 () Bool)

(assert (=> start!95756 m!998921))

(declare-fun m!998923 () Bool)

(assert (=> start!95756 m!998923))

(declare-fun m!998925 () Bool)

(assert (=> start!95756 m!998925))

(declare-fun m!998927 () Bool)

(assert (=> b!1080196 m!998927))

(declare-fun m!998929 () Bool)

(assert (=> b!1080201 m!998929))

(declare-fun m!998931 () Bool)

(assert (=> b!1080201 m!998931))

(check-sat (not b!1080196) (not mapNonEmpty!41038) (not b!1080199) tp_is_empty!26191 (not start!95756) (not b!1080201) (not b!1080205) (not b!1080203) (not b!1080204))
(check-sat)
(get-model)

(declare-fun d!130395 () Bool)

(assert (=> d!130395 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1080199 d!130395))

(declare-fun bm!45807 () Bool)

(declare-fun call!45810 () Bool)

(declare-fun c!108747 () Bool)

(assert (=> bm!45807 (= call!45810 (arrayNoDuplicates!0 lt!479225 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108747 (Cons!23254 (select (arr!33355 lt!479225) #b00000000000000000000000000000000) Nil!23255) Nil!23255)))))

(declare-fun b!1080289 () Bool)

(declare-fun e!617745 () Bool)

(assert (=> b!1080289 (= e!617745 call!45810)))

(declare-fun b!1080290 () Bool)

(declare-fun e!617743 () Bool)

(assert (=> b!1080290 (= e!617743 e!617745)))

(assert (=> b!1080290 (= c!108747 (validKeyInArray!0 (select (arr!33355 lt!479225) #b00000000000000000000000000000000)))))

(declare-fun b!1080291 () Bool)

(declare-fun e!617744 () Bool)

(declare-fun contains!6398 (List!23258 (_ BitVec 64)) Bool)

(assert (=> b!1080291 (= e!617744 (contains!6398 Nil!23255 (select (arr!33355 lt!479225) #b00000000000000000000000000000000)))))

(declare-fun b!1080292 () Bool)

(declare-fun e!617746 () Bool)

(assert (=> b!1080292 (= e!617746 e!617743)))

(declare-fun res!719515 () Bool)

(assert (=> b!1080292 (=> (not res!719515) (not e!617743))))

(assert (=> b!1080292 (= res!719515 (not e!617744))))

(declare-fun res!719514 () Bool)

(assert (=> b!1080292 (=> (not res!719514) (not e!617744))))

(assert (=> b!1080292 (= res!719514 (validKeyInArray!0 (select (arr!33355 lt!479225) #b00000000000000000000000000000000)))))

(declare-fun b!1080288 () Bool)

(assert (=> b!1080288 (= e!617745 call!45810)))

(declare-fun d!130397 () Bool)

(declare-fun res!719513 () Bool)

(assert (=> d!130397 (=> res!719513 e!617746)))

(assert (=> d!130397 (= res!719513 (bvsge #b00000000000000000000000000000000 (size!33892 lt!479225)))))

(assert (=> d!130397 (= (arrayNoDuplicates!0 lt!479225 #b00000000000000000000000000000000 Nil!23255) e!617746)))

(assert (= (and d!130397 (not res!719513)) b!1080292))

(assert (= (and b!1080292 res!719514) b!1080291))

(assert (= (and b!1080292 res!719515) b!1080290))

(assert (= (and b!1080290 c!108747) b!1080288))

(assert (= (and b!1080290 (not c!108747)) b!1080289))

(assert (= (or b!1080288 b!1080289) bm!45807))

(declare-fun m!998985 () Bool)

(assert (=> bm!45807 m!998985))

(declare-fun m!998987 () Bool)

(assert (=> bm!45807 m!998987))

(assert (=> b!1080290 m!998985))

(assert (=> b!1080290 m!998985))

(declare-fun m!998989 () Bool)

(assert (=> b!1080290 m!998989))

(assert (=> b!1080291 m!998985))

(assert (=> b!1080291 m!998985))

(declare-fun m!998991 () Bool)

(assert (=> b!1080291 m!998991))

(assert (=> b!1080292 m!998985))

(assert (=> b!1080292 m!998985))

(assert (=> b!1080292 m!998989))

(assert (=> b!1080205 d!130397))

(declare-fun b!1080301 () Bool)

(declare-fun e!617753 () Bool)

(declare-fun call!45813 () Bool)

(assert (=> b!1080301 (= e!617753 call!45813)))

(declare-fun bm!45810 () Bool)

(assert (=> bm!45810 (= call!45813 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1080302 () Bool)

(declare-fun e!617754 () Bool)

(assert (=> b!1080302 (= e!617754 call!45813)))

(declare-fun d!130399 () Bool)

(declare-fun res!719521 () Bool)

(declare-fun e!617755 () Bool)

(assert (=> d!130399 (=> res!719521 e!617755)))

(assert (=> d!130399 (= res!719521 (bvsge #b00000000000000000000000000000000 (size!33892 _keys!1070)))))

(assert (=> d!130399 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!617755)))

(declare-fun b!1080303 () Bool)

(assert (=> b!1080303 (= e!617755 e!617753)))

(declare-fun c!108750 () Bool)

(assert (=> b!1080303 (= c!108750 (validKeyInArray!0 (select (arr!33355 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1080304 () Bool)

(assert (=> b!1080304 (= e!617753 e!617754)))

(declare-fun lt!479245 () (_ BitVec 64))

(assert (=> b!1080304 (= lt!479245 (select (arr!33355 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!479247 () Unit!35449)

(assert (=> b!1080304 (= lt!479247 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!479245 #b00000000000000000000000000000000))))

(assert (=> b!1080304 (arrayContainsKey!0 _keys!1070 lt!479245 #b00000000000000000000000000000000)))

(declare-fun lt!479246 () Unit!35449)

(assert (=> b!1080304 (= lt!479246 lt!479247)))

(declare-fun res!719520 () Bool)

(declare-datatypes ((SeekEntryResult!9859 0))(
  ( (MissingZero!9859 (index!41807 (_ BitVec 32))) (Found!9859 (index!41808 (_ BitVec 32))) (Intermediate!9859 (undefined!10671 Bool) (index!41809 (_ BitVec 32)) (x!96682 (_ BitVec 32))) (Undefined!9859) (MissingVacant!9859 (index!41810 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69373 (_ BitVec 32)) SeekEntryResult!9859)

(assert (=> b!1080304 (= res!719520 (= (seekEntryOrOpen!0 (select (arr!33355 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9859 #b00000000000000000000000000000000)))))

(assert (=> b!1080304 (=> (not res!719520) (not e!617754))))

(assert (= (and d!130399 (not res!719521)) b!1080303))

(assert (= (and b!1080303 c!108750) b!1080304))

(assert (= (and b!1080303 (not c!108750)) b!1080301))

(assert (= (and b!1080304 res!719520) b!1080302))

(assert (= (or b!1080302 b!1080301) bm!45810))

(declare-fun m!998993 () Bool)

(assert (=> bm!45810 m!998993))

(declare-fun m!998995 () Bool)

(assert (=> b!1080303 m!998995))

(assert (=> b!1080303 m!998995))

(declare-fun m!998997 () Bool)

(assert (=> b!1080303 m!998997))

(assert (=> b!1080304 m!998995))

(declare-fun m!998999 () Bool)

(assert (=> b!1080304 m!998999))

(declare-fun m!999001 () Bool)

(assert (=> b!1080304 m!999001))

(assert (=> b!1080304 m!998995))

(declare-fun m!999003 () Bool)

(assert (=> b!1080304 m!999003))

(assert (=> b!1080196 d!130399))

(declare-fun d!130401 () Bool)

(assert (=> d!130401 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!95756 d!130401))

(declare-fun d!130403 () Bool)

(assert (=> d!130403 (= (array_inv!25798 _keys!1070) (bvsge (size!33892 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!95756 d!130403))

(declare-fun d!130405 () Bool)

(assert (=> d!130405 (= (array_inv!25799 _values!874) (bvsge (size!33893 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!95756 d!130405))

(declare-fun b!1080305 () Bool)

(declare-fun e!617756 () Bool)

(declare-fun call!45814 () Bool)

(assert (=> b!1080305 (= e!617756 call!45814)))

(declare-fun bm!45811 () Bool)

(assert (=> bm!45811 (= call!45814 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!479225 mask!1414))))

(declare-fun b!1080306 () Bool)

(declare-fun e!617757 () Bool)

(assert (=> b!1080306 (= e!617757 call!45814)))

(declare-fun d!130407 () Bool)

(declare-fun res!719523 () Bool)

(declare-fun e!617758 () Bool)

(assert (=> d!130407 (=> res!719523 e!617758)))

(assert (=> d!130407 (= res!719523 (bvsge #b00000000000000000000000000000000 (size!33892 lt!479225)))))

(assert (=> d!130407 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479225 mask!1414) e!617758)))

(declare-fun b!1080307 () Bool)

(assert (=> b!1080307 (= e!617758 e!617756)))

(declare-fun c!108751 () Bool)

(assert (=> b!1080307 (= c!108751 (validKeyInArray!0 (select (arr!33355 lt!479225) #b00000000000000000000000000000000)))))

(declare-fun b!1080308 () Bool)

(assert (=> b!1080308 (= e!617756 e!617757)))

(declare-fun lt!479248 () (_ BitVec 64))

(assert (=> b!1080308 (= lt!479248 (select (arr!33355 lt!479225) #b00000000000000000000000000000000))))

(declare-fun lt!479250 () Unit!35449)

(assert (=> b!1080308 (= lt!479250 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!479225 lt!479248 #b00000000000000000000000000000000))))

(assert (=> b!1080308 (arrayContainsKey!0 lt!479225 lt!479248 #b00000000000000000000000000000000)))

(declare-fun lt!479249 () Unit!35449)

(assert (=> b!1080308 (= lt!479249 lt!479250)))

(declare-fun res!719522 () Bool)

(assert (=> b!1080308 (= res!719522 (= (seekEntryOrOpen!0 (select (arr!33355 lt!479225) #b00000000000000000000000000000000) lt!479225 mask!1414) (Found!9859 #b00000000000000000000000000000000)))))

(assert (=> b!1080308 (=> (not res!719522) (not e!617757))))

(assert (= (and d!130407 (not res!719523)) b!1080307))

(assert (= (and b!1080307 c!108751) b!1080308))

(assert (= (and b!1080307 (not c!108751)) b!1080305))

(assert (= (and b!1080308 res!719522) b!1080306))

(assert (= (or b!1080306 b!1080305) bm!45811))

(declare-fun m!999005 () Bool)

(assert (=> bm!45811 m!999005))

(assert (=> b!1080307 m!998985))

(assert (=> b!1080307 m!998985))

(assert (=> b!1080307 m!998989))

(assert (=> b!1080308 m!998985))

(declare-fun m!999007 () Bool)

(assert (=> b!1080308 m!999007))

(declare-fun m!999009 () Bool)

(assert (=> b!1080308 m!999009))

(assert (=> b!1080308 m!998985))

(declare-fun m!999011 () Bool)

(assert (=> b!1080308 m!999011))

(assert (=> b!1080201 d!130407))

(declare-fun d!130409 () Bool)

(declare-fun res!719528 () Bool)

(declare-fun e!617763 () Bool)

(assert (=> d!130409 (=> res!719528 e!617763)))

(assert (=> d!130409 (= res!719528 (= (select (arr!33355 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130409 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!617763)))

(declare-fun b!1080313 () Bool)

(declare-fun e!617764 () Bool)

(assert (=> b!1080313 (= e!617763 e!617764)))

(declare-fun res!719529 () Bool)

(assert (=> b!1080313 (=> (not res!719529) (not e!617764))))

(assert (=> b!1080313 (= res!719529 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!33892 _keys!1070)))))

(declare-fun b!1080314 () Bool)

(assert (=> b!1080314 (= e!617764 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130409 (not res!719528)) b!1080313))

(assert (= (and b!1080313 res!719529) b!1080314))

(assert (=> d!130409 m!998995))

(declare-fun m!999013 () Bool)

(assert (=> b!1080314 m!999013))

(assert (=> b!1080203 d!130409))

(declare-fun d!130411 () Bool)

(assert (=> d!130411 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!479253 () Unit!35449)

(declare-fun choose!13 (array!69373 (_ BitVec 64) (_ BitVec 32)) Unit!35449)

(assert (=> d!130411 (= lt!479253 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130411 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130411 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!479253)))

(declare-fun bs!31811 () Bool)

(assert (= bs!31811 d!130411))

(assert (=> bs!31811 m!998917))

(declare-fun m!999015 () Bool)

(assert (=> bs!31811 m!999015))

(assert (=> b!1080203 d!130411))

(declare-fun bm!45812 () Bool)

(declare-fun call!45815 () Bool)

(declare-fun c!108752 () Bool)

(assert (=> bm!45812 (= call!45815 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108752 (Cons!23254 (select (arr!33355 _keys!1070) #b00000000000000000000000000000000) Nil!23255) Nil!23255)))))

(declare-fun b!1080316 () Bool)

(declare-fun e!617767 () Bool)

(assert (=> b!1080316 (= e!617767 call!45815)))

(declare-fun b!1080317 () Bool)

(declare-fun e!617765 () Bool)

(assert (=> b!1080317 (= e!617765 e!617767)))

(assert (=> b!1080317 (= c!108752 (validKeyInArray!0 (select (arr!33355 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1080318 () Bool)

(declare-fun e!617766 () Bool)

(assert (=> b!1080318 (= e!617766 (contains!6398 Nil!23255 (select (arr!33355 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1080319 () Bool)

(declare-fun e!617768 () Bool)

(assert (=> b!1080319 (= e!617768 e!617765)))

(declare-fun res!719532 () Bool)

(assert (=> b!1080319 (=> (not res!719532) (not e!617765))))

(assert (=> b!1080319 (= res!719532 (not e!617766))))

(declare-fun res!719531 () Bool)

(assert (=> b!1080319 (=> (not res!719531) (not e!617766))))

(assert (=> b!1080319 (= res!719531 (validKeyInArray!0 (select (arr!33355 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1080315 () Bool)

(assert (=> b!1080315 (= e!617767 call!45815)))

(declare-fun d!130413 () Bool)

(declare-fun res!719530 () Bool)

(assert (=> d!130413 (=> res!719530 e!617768)))

(assert (=> d!130413 (= res!719530 (bvsge #b00000000000000000000000000000000 (size!33892 _keys!1070)))))

(assert (=> d!130413 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23255) e!617768)))

(assert (= (and d!130413 (not res!719530)) b!1080319))

(assert (= (and b!1080319 res!719531) b!1080318))

(assert (= (and b!1080319 res!719532) b!1080317))

(assert (= (and b!1080317 c!108752) b!1080315))

(assert (= (and b!1080317 (not c!108752)) b!1080316))

(assert (= (or b!1080315 b!1080316) bm!45812))

(assert (=> bm!45812 m!998995))

(declare-fun m!999017 () Bool)

(assert (=> bm!45812 m!999017))

(assert (=> b!1080317 m!998995))

(assert (=> b!1080317 m!998995))

(assert (=> b!1080317 m!998997))

(assert (=> b!1080318 m!998995))

(assert (=> b!1080318 m!998995))

(declare-fun m!999019 () Bool)

(assert (=> b!1080318 m!999019))

(assert (=> b!1080319 m!998995))

(assert (=> b!1080319 m!998995))

(assert (=> b!1080319 m!998997))

(assert (=> b!1080204 d!130413))

(declare-fun b!1080327 () Bool)

(declare-fun e!617773 () Bool)

(assert (=> b!1080327 (= e!617773 tp_is_empty!26191)))

(declare-fun b!1080326 () Bool)

(declare-fun e!617774 () Bool)

(assert (=> b!1080326 (= e!617774 tp_is_empty!26191)))

(declare-fun condMapEmpty!41047 () Bool)

(declare-fun mapDefault!41047 () ValueCell!12386)

(assert (=> mapNonEmpty!41038 (= condMapEmpty!41047 (= mapRest!41038 ((as const (Array (_ BitVec 32) ValueCell!12386)) mapDefault!41047)))))

(declare-fun mapRes!41047 () Bool)

(assert (=> mapNonEmpty!41038 (= tp!78500 (and e!617773 mapRes!41047))))

(declare-fun mapNonEmpty!41047 () Bool)

(declare-fun tp!78509 () Bool)

(assert (=> mapNonEmpty!41047 (= mapRes!41047 (and tp!78509 e!617774))))

(declare-fun mapKey!41047 () (_ BitVec 32))

(declare-fun mapRest!41047 () (Array (_ BitVec 32) ValueCell!12386))

(declare-fun mapValue!41047 () ValueCell!12386)

(assert (=> mapNonEmpty!41047 (= mapRest!41038 (store mapRest!41047 mapKey!41047 mapValue!41047))))

(declare-fun mapIsEmpty!41047 () Bool)

(assert (=> mapIsEmpty!41047 mapRes!41047))

(assert (= (and mapNonEmpty!41038 condMapEmpty!41047) mapIsEmpty!41047))

(assert (= (and mapNonEmpty!41038 (not condMapEmpty!41047)) mapNonEmpty!41047))

(assert (= (and mapNonEmpty!41047 ((_ is ValueCellFull!12386) mapValue!41047)) b!1080326))

(assert (= (and mapNonEmpty!41038 ((_ is ValueCellFull!12386) mapDefault!41047)) b!1080327))

(declare-fun m!999021 () Bool)

(assert (=> mapNonEmpty!41047 m!999021))

(check-sat (not b!1080317) (not b!1080314) tp_is_empty!26191 (not mapNonEmpty!41047) (not b!1080318) (not b!1080291) (not b!1080319) (not b!1080303) (not b!1080307) (not d!130411) (not b!1080290) (not b!1080292) (not bm!45811) (not bm!45807) (not b!1080304) (not bm!45810) (not bm!45812) (not b!1080308))
(check-sat)
