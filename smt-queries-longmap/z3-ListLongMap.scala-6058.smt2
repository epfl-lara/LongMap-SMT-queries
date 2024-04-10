; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78396 () Bool)

(assert start!78396)

(declare-fun b_free!16761 () Bool)

(declare-fun b_next!16761 () Bool)

(assert (=> start!78396 (= b_free!16761 (not b_next!16761))))

(declare-fun tp!58570 () Bool)

(declare-fun b_and!27381 () Bool)

(assert (=> start!78396 (= tp!58570 b_and!27381)))

(declare-fun b!914561 () Bool)

(declare-fun res!616782 () Bool)

(declare-fun e!513066 () Bool)

(assert (=> b!914561 (=> (not res!616782) (not e!513066))))

(declare-datatypes ((V!30537 0))(
  ( (V!30538 (val!9640 Int)) )
))
(declare-datatypes ((ValueCell!9108 0))(
  ( (ValueCellFull!9108 (v!12156 V!30537)) (EmptyCell!9108) )
))
(declare-datatypes ((array!54348 0))(
  ( (array!54349 (arr!26125 (Array (_ BitVec 32) ValueCell!9108)) (size!26584 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54348)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!54350 0))(
  ( (array!54351 (arr!26126 (Array (_ BitVec 32) (_ BitVec 64))) (size!26585 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54350)

(assert (=> b!914561 (= res!616782 (and (= (size!26584 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26585 _keys!1386) (size!26584 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!914562 () Bool)

(declare-fun e!513065 () Bool)

(declare-fun call!40507 () V!30537)

(declare-fun minValue!1094 () V!30537)

(assert (=> b!914562 (= e!513065 (not (= call!40507 minValue!1094)))))

(declare-fun b!914563 () Bool)

(declare-fun e!513071 () Bool)

(assert (=> b!914563 (= e!513066 e!513071)))

(declare-fun res!616783 () Bool)

(assert (=> b!914563 (=> (not res!616783) (not e!513071))))

(declare-datatypes ((tuple2!12568 0))(
  ( (tuple2!12569 (_1!6295 (_ BitVec 64)) (_2!6295 V!30537)) )
))
(declare-datatypes ((List!18355 0))(
  ( (Nil!18352) (Cons!18351 (h!19497 tuple2!12568) (t!25966 List!18355)) )
))
(declare-datatypes ((ListLongMap!11265 0))(
  ( (ListLongMap!11266 (toList!5648 List!18355)) )
))
(declare-fun lt!411495 () ListLongMap!11265)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4698 (ListLongMap!11265 (_ BitVec 64)) Bool)

(assert (=> b!914563 (= res!616783 (contains!4698 lt!411495 k0!1033))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30537)

(declare-fun getCurrentListMap!2909 (array!54350 array!54348 (_ BitVec 32) (_ BitVec 32) V!30537 V!30537 (_ BitVec 32) Int) ListLongMap!11265)

(assert (=> b!914563 (= lt!411495 (getCurrentListMap!2909 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!914564 () Bool)

(declare-fun res!616779 () Bool)

(assert (=> b!914564 (=> (not res!616779) (not e!513066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54350 (_ BitVec 32)) Bool)

(assert (=> b!914564 (= res!616779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun bm!40504 () Bool)

(declare-fun apply!524 (ListLongMap!11265 (_ BitVec 64)) V!30537)

(assert (=> bm!40504 (= call!40507 (apply!524 lt!411495 k0!1033))))

(declare-fun b!914565 () Bool)

(declare-fun e!513074 () Bool)

(declare-fun e!513067 () Bool)

(declare-fun mapRes!30507 () Bool)

(assert (=> b!914565 (= e!513074 (and e!513067 mapRes!30507))))

(declare-fun condMapEmpty!30507 () Bool)

(declare-fun mapDefault!30507 () ValueCell!9108)

(assert (=> b!914565 (= condMapEmpty!30507 (= (arr!26125 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9108)) mapDefault!30507)))))

(declare-fun b!914566 () Bool)

(declare-fun e!513068 () Bool)

(assert (=> b!914566 (= e!513071 e!513068)))

(declare-fun c!96009 () Bool)

(assert (=> b!914566 (= c!96009 (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!914567 () Bool)

(declare-fun res!616781 () Bool)

(assert (=> b!914567 (=> (not res!616781) (not e!513071))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!914567 (= res!616781 (and (= (select (arr!26126 _keys!1386) i!717) k0!1033) (or (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000) (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!914568 () Bool)

(declare-fun res!616778 () Bool)

(assert (=> b!914568 (=> (not res!616778) (not e!513071))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!914568 (= res!616778 (inRange!0 i!717 mask!1756))))

(declare-fun b!914570 () Bool)

(declare-fun res!616786 () Bool)

(assert (=> b!914570 (=> (not res!616786) (not e!513066))))

(declare-datatypes ((List!18356 0))(
  ( (Nil!18353) (Cons!18352 (h!19498 (_ BitVec 64)) (t!25967 List!18356)) )
))
(declare-fun arrayNoDuplicates!0 (array!54350 (_ BitVec 32) List!18356) Bool)

(assert (=> b!914570 (= res!616786 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18353))))

(declare-fun b!914571 () Bool)

(declare-fun tp_is_empty!19179 () Bool)

(assert (=> b!914571 (= e!513067 tp_is_empty!19179)))

(declare-fun b!914572 () Bool)

(declare-fun e!513070 () Bool)

(assert (=> b!914572 (= e!513070 (not (= call!40507 zeroValue!1094)))))

(declare-fun mapIsEmpty!30507 () Bool)

(assert (=> mapIsEmpty!30507 mapRes!30507))

(declare-fun b!914573 () Bool)

(declare-fun res!616785 () Bool)

(assert (=> b!914573 (= res!616785 (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(assert (=> b!914573 (=> res!616785 e!513065)))

(declare-fun e!513073 () Bool)

(assert (=> b!914573 (= e!513073 e!513065)))

(declare-fun b!914574 () Bool)

(assert (=> b!914574 (= e!513068 e!513070)))

(declare-fun res!616780 () Bool)

(assert (=> b!914574 (= res!616780 (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!914574 (=> res!616780 e!513070)))

(declare-fun b!914569 () Bool)

(assert (=> b!914569 (= e!513068 e!513073)))

(declare-fun res!616787 () Bool)

(assert (=> b!914569 (= res!616787 (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!914569 (=> (not res!616787) (not e!513073))))

(declare-fun res!616784 () Bool)

(assert (=> start!78396 (=> (not res!616784) (not e!513066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78396 (= res!616784 (validMask!0 mask!1756))))

(assert (=> start!78396 e!513066))

(declare-fun array_inv!20402 (array!54348) Bool)

(assert (=> start!78396 (and (array_inv!20402 _values!1152) e!513074)))

(assert (=> start!78396 tp!58570))

(assert (=> start!78396 true))

(assert (=> start!78396 tp_is_empty!19179))

(declare-fun array_inv!20403 (array!54350) Bool)

(assert (=> start!78396 (array_inv!20403 _keys!1386)))

(declare-fun mapNonEmpty!30507 () Bool)

(declare-fun tp!58571 () Bool)

(declare-fun e!513069 () Bool)

(assert (=> mapNonEmpty!30507 (= mapRes!30507 (and tp!58571 e!513069))))

(declare-fun mapKey!30507 () (_ BitVec 32))

(declare-fun mapRest!30507 () (Array (_ BitVec 32) ValueCell!9108))

(declare-fun mapValue!30507 () ValueCell!9108)

(assert (=> mapNonEmpty!30507 (= (arr!26125 _values!1152) (store mapRest!30507 mapKey!30507 mapValue!30507))))

(declare-fun b!914575 () Bool)

(assert (=> b!914575 (= e!513069 tp_is_empty!19179)))

(assert (= (and start!78396 res!616784) b!914561))

(assert (= (and b!914561 res!616782) b!914564))

(assert (= (and b!914564 res!616779) b!914570))

(assert (= (and b!914570 res!616786) b!914563))

(assert (= (and b!914563 res!616783) b!914568))

(assert (= (and b!914568 res!616778) b!914567))

(assert (= (and b!914567 res!616781) b!914566))

(assert (= (and b!914566 c!96009) b!914574))

(assert (= (and b!914566 (not c!96009)) b!914569))

(assert (= (and b!914574 (not res!616780)) b!914572))

(assert (= (and b!914569 res!616787) b!914573))

(assert (= (and b!914573 (not res!616785)) b!914562))

(assert (= (or b!914572 b!914562) bm!40504))

(assert (= (and b!914565 condMapEmpty!30507) mapIsEmpty!30507))

(assert (= (and b!914565 (not condMapEmpty!30507)) mapNonEmpty!30507))

(get-info :version)

(assert (= (and mapNonEmpty!30507 ((_ is ValueCellFull!9108) mapValue!30507)) b!914575))

(assert (= (and b!914565 ((_ is ValueCellFull!9108) mapDefault!30507)) b!914571))

(assert (= start!78396 b!914565))

(declare-fun m!849245 () Bool)

(assert (=> start!78396 m!849245))

(declare-fun m!849247 () Bool)

(assert (=> start!78396 m!849247))

(declare-fun m!849249 () Bool)

(assert (=> start!78396 m!849249))

(declare-fun m!849251 () Bool)

(assert (=> b!914570 m!849251))

(declare-fun m!849253 () Bool)

(assert (=> mapNonEmpty!30507 m!849253))

(declare-fun m!849255 () Bool)

(assert (=> b!914563 m!849255))

(declare-fun m!849257 () Bool)

(assert (=> b!914563 m!849257))

(declare-fun m!849259 () Bool)

(assert (=> b!914564 m!849259))

(declare-fun m!849261 () Bool)

(assert (=> bm!40504 m!849261))

(declare-fun m!849263 () Bool)

(assert (=> b!914568 m!849263))

(declare-fun m!849265 () Bool)

(assert (=> b!914567 m!849265))

(check-sat b_and!27381 (not mapNonEmpty!30507) (not start!78396) (not bm!40504) (not b!914564) tp_is_empty!19179 (not b!914570) (not b!914568) (not b_next!16761) (not b!914563))
(check-sat b_and!27381 (not b_next!16761))
(get-model)

(declare-fun d!112675 () Bool)

(declare-datatypes ((Option!483 0))(
  ( (Some!482 (v!12158 V!30537)) (None!481) )
))
(declare-fun get!13722 (Option!483) V!30537)

(declare-fun getValueByKey!477 (List!18355 (_ BitVec 64)) Option!483)

(assert (=> d!112675 (= (apply!524 lt!411495 k0!1033) (get!13722 (getValueByKey!477 (toList!5648 lt!411495) k0!1033)))))

(declare-fun bs!25747 () Bool)

(assert (= bs!25747 d!112675))

(declare-fun m!849289 () Bool)

(assert (=> bs!25747 m!849289))

(assert (=> bs!25747 m!849289))

(declare-fun m!849291 () Bool)

(assert (=> bs!25747 m!849291))

(assert (=> bm!40504 d!112675))

(declare-fun b!914629 () Bool)

(declare-fun e!513113 () Bool)

(declare-fun e!513112 () Bool)

(assert (=> b!914629 (= e!513113 e!513112)))

(declare-fun c!96015 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!914629 (= c!96015 (validKeyInArray!0 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!914630 () Bool)

(declare-fun e!513111 () Bool)

(declare-fun call!40513 () Bool)

(assert (=> b!914630 (= e!513111 call!40513)))

(declare-fun b!914631 () Bool)

(assert (=> b!914631 (= e!513112 e!513111)))

(declare-fun lt!411505 () (_ BitVec 64))

(assert (=> b!914631 (= lt!411505 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30958 0))(
  ( (Unit!30959) )
))
(declare-fun lt!411506 () Unit!30958)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!54350 (_ BitVec 64) (_ BitVec 32)) Unit!30958)

(assert (=> b!914631 (= lt!411506 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!411505 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!54350 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!914631 (arrayContainsKey!0 _keys!1386 lt!411505 #b00000000000000000000000000000000)))

(declare-fun lt!411507 () Unit!30958)

(assert (=> b!914631 (= lt!411507 lt!411506)))

(declare-fun res!616822 () Bool)

(declare-datatypes ((SeekEntryResult!8971 0))(
  ( (MissingZero!8971 (index!38255 (_ BitVec 32))) (Found!8971 (index!38256 (_ BitVec 32))) (Intermediate!8971 (undefined!9783 Bool) (index!38257 (_ BitVec 32)) (x!78228 (_ BitVec 32))) (Undefined!8971) (MissingVacant!8971 (index!38258 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!54350 (_ BitVec 32)) SeekEntryResult!8971)

(assert (=> b!914631 (= res!616822 (= (seekEntryOrOpen!0 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8971 #b00000000000000000000000000000000)))))

(assert (=> b!914631 (=> (not res!616822) (not e!513111))))

(declare-fun d!112677 () Bool)

(declare-fun res!616823 () Bool)

(assert (=> d!112677 (=> res!616823 e!513113)))

(assert (=> d!112677 (= res!616823 (bvsge #b00000000000000000000000000000000 (size!26585 _keys!1386)))))

(assert (=> d!112677 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!513113)))

(declare-fun b!914632 () Bool)

(assert (=> b!914632 (= e!513112 call!40513)))

(declare-fun bm!40510 () Bool)

(assert (=> bm!40510 (= call!40513 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(assert (= (and d!112677 (not res!616823)) b!914629))

(assert (= (and b!914629 c!96015) b!914631))

(assert (= (and b!914629 (not c!96015)) b!914632))

(assert (= (and b!914631 res!616822) b!914630))

(assert (= (or b!914630 b!914632) bm!40510))

(declare-fun m!849293 () Bool)

(assert (=> b!914629 m!849293))

(assert (=> b!914629 m!849293))

(declare-fun m!849295 () Bool)

(assert (=> b!914629 m!849295))

(assert (=> b!914631 m!849293))

(declare-fun m!849297 () Bool)

(assert (=> b!914631 m!849297))

(declare-fun m!849299 () Bool)

(assert (=> b!914631 m!849299))

(assert (=> b!914631 m!849293))

(declare-fun m!849301 () Bool)

(assert (=> b!914631 m!849301))

(declare-fun m!849303 () Bool)

(assert (=> bm!40510 m!849303))

(assert (=> b!914564 d!112677))

(declare-fun d!112679 () Bool)

(assert (=> d!112679 (= (inRange!0 i!717 mask!1756) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (bvadd mask!1756 #b00000000000000000000000000000001))))))

(assert (=> b!914568 d!112679))

(declare-fun d!112681 () Bool)

(declare-fun e!513118 () Bool)

(assert (=> d!112681 e!513118))

(declare-fun res!616826 () Bool)

(assert (=> d!112681 (=> res!616826 e!513118)))

(declare-fun lt!411517 () Bool)

(assert (=> d!112681 (= res!616826 (not lt!411517))))

(declare-fun lt!411516 () Bool)

(assert (=> d!112681 (= lt!411517 lt!411516)))

(declare-fun lt!411519 () Unit!30958)

(declare-fun e!513119 () Unit!30958)

(assert (=> d!112681 (= lt!411519 e!513119)))

(declare-fun c!96018 () Bool)

(assert (=> d!112681 (= c!96018 lt!411516)))

(declare-fun containsKey!444 (List!18355 (_ BitVec 64)) Bool)

(assert (=> d!112681 (= lt!411516 (containsKey!444 (toList!5648 lt!411495) k0!1033))))

(assert (=> d!112681 (= (contains!4698 lt!411495 k0!1033) lt!411517)))

(declare-fun b!914639 () Bool)

(declare-fun lt!411518 () Unit!30958)

(assert (=> b!914639 (= e!513119 lt!411518)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!340 (List!18355 (_ BitVec 64)) Unit!30958)

(assert (=> b!914639 (= lt!411518 (lemmaContainsKeyImpliesGetValueByKeyDefined!340 (toList!5648 lt!411495) k0!1033))))

(declare-fun isDefined!349 (Option!483) Bool)

(assert (=> b!914639 (isDefined!349 (getValueByKey!477 (toList!5648 lt!411495) k0!1033))))

(declare-fun b!914640 () Bool)

(declare-fun Unit!30960 () Unit!30958)

(assert (=> b!914640 (= e!513119 Unit!30960)))

(declare-fun b!914641 () Bool)

(assert (=> b!914641 (= e!513118 (isDefined!349 (getValueByKey!477 (toList!5648 lt!411495) k0!1033)))))

(assert (= (and d!112681 c!96018) b!914639))

(assert (= (and d!112681 (not c!96018)) b!914640))

(assert (= (and d!112681 (not res!616826)) b!914641))

(declare-fun m!849305 () Bool)

(assert (=> d!112681 m!849305))

(declare-fun m!849307 () Bool)

(assert (=> b!914639 m!849307))

(assert (=> b!914639 m!849289))

(assert (=> b!914639 m!849289))

(declare-fun m!849309 () Bool)

(assert (=> b!914639 m!849309))

(assert (=> b!914641 m!849289))

(assert (=> b!914641 m!849289))

(assert (=> b!914641 m!849309))

(assert (=> b!914563 d!112681))

(declare-fun b!914684 () Bool)

(declare-fun res!616851 () Bool)

(declare-fun e!513158 () Bool)

(assert (=> b!914684 (=> (not res!616851) (not e!513158))))

(declare-fun e!513155 () Bool)

(assert (=> b!914684 (= res!616851 e!513155)))

(declare-fun res!616849 () Bool)

(assert (=> b!914684 (=> res!616849 e!513155)))

(declare-fun e!513147 () Bool)

(assert (=> b!914684 (= res!616849 (not e!513147))))

(declare-fun res!616845 () Bool)

(assert (=> b!914684 (=> (not res!616845) (not e!513147))))

(assert (=> b!914684 (= res!616845 (bvslt #b00000000000000000000000000000000 (size!26585 _keys!1386)))))

(declare-fun b!914685 () Bool)

(declare-fun e!513154 () Bool)

(assert (=> b!914685 (= e!513155 e!513154)))

(declare-fun res!616850 () Bool)

(assert (=> b!914685 (=> (not res!616850) (not e!513154))))

(declare-fun lt!411569 () ListLongMap!11265)

(assert (=> b!914685 (= res!616850 (contains!4698 lt!411569 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!914685 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26585 _keys!1386)))))

(declare-fun b!914686 () Bool)

(declare-fun e!513153 () Bool)

(declare-fun e!513157 () Bool)

(assert (=> b!914686 (= e!513153 e!513157)))

(declare-fun res!616848 () Bool)

(declare-fun call!40533 () Bool)

(assert (=> b!914686 (= res!616848 call!40533)))

(assert (=> b!914686 (=> (not res!616848) (not e!513157))))

(declare-fun c!96033 () Bool)

(declare-fun call!40532 () ListLongMap!11265)

(declare-fun bm!40525 () Bool)

(declare-fun c!96031 () Bool)

(declare-fun call!40530 () ListLongMap!11265)

(declare-fun call!40534 () ListLongMap!11265)

(declare-fun call!40531 () ListLongMap!11265)

(declare-fun +!2610 (ListLongMap!11265 tuple2!12568) ListLongMap!11265)

(assert (=> bm!40525 (= call!40531 (+!2610 (ite c!96031 call!40532 (ite c!96033 call!40530 call!40534)) (ite (or c!96031 c!96033) (tuple2!12569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun b!914687 () Bool)

(assert (=> b!914687 (= e!513153 (not call!40533))))

(declare-fun b!914688 () Bool)

(declare-fun e!513150 () Bool)

(assert (=> b!914688 (= e!513150 (validKeyInArray!0 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!914689 () Bool)

(declare-fun get!13723 (ValueCell!9108 V!30537) V!30537)

(declare-fun dynLambda!1399 (Int (_ BitVec 64)) V!30537)

(assert (=> b!914689 (= e!513154 (= (apply!524 lt!411569 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)) (get!13723 (select (arr!26125 _values!1152) #b00000000000000000000000000000000) (dynLambda!1399 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!914689 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26584 _values!1152)))))

(assert (=> b!914689 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26585 _keys!1386)))))

(declare-fun bm!40526 () Bool)

(assert (=> bm!40526 (= call!40530 call!40532)))

(declare-fun b!914690 () Bool)

(declare-fun res!616853 () Bool)

(assert (=> b!914690 (=> (not res!616853) (not e!513158))))

(declare-fun e!513148 () Bool)

(assert (=> b!914690 (= res!616853 e!513148)))

(declare-fun c!96032 () Bool)

(assert (=> b!914690 (= c!96032 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40527 () Bool)

(assert (=> bm!40527 (= call!40533 (contains!4698 lt!411569 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!914691 () Bool)

(assert (=> b!914691 (= e!513147 (validKeyInArray!0 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!914692 () Bool)

(declare-fun e!513156 () Bool)

(assert (=> b!914692 (= e!513156 (= (apply!524 lt!411569 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun bm!40528 () Bool)

(declare-fun call!40529 () ListLongMap!11265)

(assert (=> bm!40528 (= call!40529 call!40531)))

(declare-fun b!914693 () Bool)

(assert (=> b!914693 (= e!513148 e!513156)))

(declare-fun res!616852 () Bool)

(declare-fun call!40528 () Bool)

(assert (=> b!914693 (= res!616852 call!40528)))

(assert (=> b!914693 (=> (not res!616852) (not e!513156))))

(declare-fun b!914694 () Bool)

(assert (=> b!914694 (= e!513157 (= (apply!524 lt!411569 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun b!914695 () Bool)

(declare-fun e!513149 () ListLongMap!11265)

(assert (=> b!914695 (= e!513149 call!40534)))

(declare-fun b!914696 () Bool)

(assert (=> b!914696 (= e!513149 call!40529)))

(declare-fun b!914697 () Bool)

(declare-fun e!513152 () Unit!30958)

(declare-fun lt!411567 () Unit!30958)

(assert (=> b!914697 (= e!513152 lt!411567)))

(declare-fun lt!411578 () ListLongMap!11265)

(declare-fun getCurrentListMapNoExtraKeys!3297 (array!54350 array!54348 (_ BitVec 32) (_ BitVec 32) V!30537 V!30537 (_ BitVec 32) Int) ListLongMap!11265)

(assert (=> b!914697 (= lt!411578 (getCurrentListMapNoExtraKeys!3297 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411571 () (_ BitVec 64))

(assert (=> b!914697 (= lt!411571 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411585 () (_ BitVec 64))

(assert (=> b!914697 (= lt!411585 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!411565 () Unit!30958)

(declare-fun addStillContains!351 (ListLongMap!11265 (_ BitVec 64) V!30537 (_ BitVec 64)) Unit!30958)

(assert (=> b!914697 (= lt!411565 (addStillContains!351 lt!411578 lt!411571 zeroValue!1094 lt!411585))))

(assert (=> b!914697 (contains!4698 (+!2610 lt!411578 (tuple2!12569 lt!411571 zeroValue!1094)) lt!411585)))

(declare-fun lt!411568 () Unit!30958)

(assert (=> b!914697 (= lt!411568 lt!411565)))

(declare-fun lt!411576 () ListLongMap!11265)

(assert (=> b!914697 (= lt!411576 (getCurrentListMapNoExtraKeys!3297 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411584 () (_ BitVec 64))

(assert (=> b!914697 (= lt!411584 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411574 () (_ BitVec 64))

(assert (=> b!914697 (= lt!411574 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!411566 () Unit!30958)

(declare-fun addApplyDifferent!351 (ListLongMap!11265 (_ BitVec 64) V!30537 (_ BitVec 64)) Unit!30958)

(assert (=> b!914697 (= lt!411566 (addApplyDifferent!351 lt!411576 lt!411584 minValue!1094 lt!411574))))

(assert (=> b!914697 (= (apply!524 (+!2610 lt!411576 (tuple2!12569 lt!411584 minValue!1094)) lt!411574) (apply!524 lt!411576 lt!411574))))

(declare-fun lt!411580 () Unit!30958)

(assert (=> b!914697 (= lt!411580 lt!411566)))

(declare-fun lt!411573 () ListLongMap!11265)

(assert (=> b!914697 (= lt!411573 (getCurrentListMapNoExtraKeys!3297 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411575 () (_ BitVec 64))

(assert (=> b!914697 (= lt!411575 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411579 () (_ BitVec 64))

(assert (=> b!914697 (= lt!411579 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!411583 () Unit!30958)

(assert (=> b!914697 (= lt!411583 (addApplyDifferent!351 lt!411573 lt!411575 zeroValue!1094 lt!411579))))

(assert (=> b!914697 (= (apply!524 (+!2610 lt!411573 (tuple2!12569 lt!411575 zeroValue!1094)) lt!411579) (apply!524 lt!411573 lt!411579))))

(declare-fun lt!411572 () Unit!30958)

(assert (=> b!914697 (= lt!411572 lt!411583)))

(declare-fun lt!411570 () ListLongMap!11265)

(assert (=> b!914697 (= lt!411570 (getCurrentListMapNoExtraKeys!3297 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411577 () (_ BitVec 64))

(assert (=> b!914697 (= lt!411577 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411564 () (_ BitVec 64))

(assert (=> b!914697 (= lt!411564 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!914697 (= lt!411567 (addApplyDifferent!351 lt!411570 lt!411577 minValue!1094 lt!411564))))

(assert (=> b!914697 (= (apply!524 (+!2610 lt!411570 (tuple2!12569 lt!411577 minValue!1094)) lt!411564) (apply!524 lt!411570 lt!411564))))

(declare-fun b!914698 () Bool)

(declare-fun e!513151 () ListLongMap!11265)

(assert (=> b!914698 (= e!513151 (+!2610 call!40531 (tuple2!12569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun b!914699 () Bool)

(assert (=> b!914699 (= e!513158 e!513153)))

(declare-fun c!96034 () Bool)

(assert (=> b!914699 (= c!96034 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40529 () Bool)

(assert (=> bm!40529 (= call!40532 (getCurrentListMapNoExtraKeys!3297 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun bm!40530 () Bool)

(assert (=> bm!40530 (= call!40528 (contains!4698 lt!411569 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!914700 () Bool)

(assert (=> b!914700 (= e!513148 (not call!40528))))

(declare-fun b!914701 () Bool)

(declare-fun Unit!30961 () Unit!30958)

(assert (=> b!914701 (= e!513152 Unit!30961)))

(declare-fun d!112683 () Bool)

(assert (=> d!112683 e!513158))

(declare-fun res!616847 () Bool)

(assert (=> d!112683 (=> (not res!616847) (not e!513158))))

(assert (=> d!112683 (= res!616847 (or (bvsge #b00000000000000000000000000000000 (size!26585 _keys!1386)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26585 _keys!1386)))))))

(declare-fun lt!411582 () ListLongMap!11265)

(assert (=> d!112683 (= lt!411569 lt!411582)))

(declare-fun lt!411581 () Unit!30958)

(assert (=> d!112683 (= lt!411581 e!513152)))

(declare-fun c!96035 () Bool)

(assert (=> d!112683 (= c!96035 e!513150)))

(declare-fun res!616846 () Bool)

(assert (=> d!112683 (=> (not res!616846) (not e!513150))))

(assert (=> d!112683 (= res!616846 (bvslt #b00000000000000000000000000000000 (size!26585 _keys!1386)))))

(assert (=> d!112683 (= lt!411582 e!513151)))

(assert (=> d!112683 (= c!96031 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112683 (validMask!0 mask!1756)))

(assert (=> d!112683 (= (getCurrentListMap!2909 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!411569)))

(declare-fun b!914702 () Bool)

(declare-fun e!513146 () ListLongMap!11265)

(assert (=> b!914702 (= e!513151 e!513146)))

(assert (=> b!914702 (= c!96033 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40531 () Bool)

(assert (=> bm!40531 (= call!40534 call!40530)))

(declare-fun b!914703 () Bool)

(assert (=> b!914703 (= e!513146 call!40529)))

(declare-fun b!914704 () Bool)

(declare-fun c!96036 () Bool)

(assert (=> b!914704 (= c!96036 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!914704 (= e!513146 e!513149)))

(assert (= (and d!112683 c!96031) b!914698))

(assert (= (and d!112683 (not c!96031)) b!914702))

(assert (= (and b!914702 c!96033) b!914703))

(assert (= (and b!914702 (not c!96033)) b!914704))

(assert (= (and b!914704 c!96036) b!914696))

(assert (= (and b!914704 (not c!96036)) b!914695))

(assert (= (or b!914696 b!914695) bm!40531))

(assert (= (or b!914703 bm!40531) bm!40526))

(assert (= (or b!914703 b!914696) bm!40528))

(assert (= (or b!914698 bm!40526) bm!40529))

(assert (= (or b!914698 bm!40528) bm!40525))

(assert (= (and d!112683 res!616846) b!914688))

(assert (= (and d!112683 c!96035) b!914697))

(assert (= (and d!112683 (not c!96035)) b!914701))

(assert (= (and d!112683 res!616847) b!914684))

(assert (= (and b!914684 res!616845) b!914691))

(assert (= (and b!914684 (not res!616849)) b!914685))

(assert (= (and b!914685 res!616850) b!914689))

(assert (= (and b!914684 res!616851) b!914690))

(assert (= (and b!914690 c!96032) b!914693))

(assert (= (and b!914690 (not c!96032)) b!914700))

(assert (= (and b!914693 res!616852) b!914692))

(assert (= (or b!914693 b!914700) bm!40530))

(assert (= (and b!914690 res!616853) b!914699))

(assert (= (and b!914699 c!96034) b!914686))

(assert (= (and b!914699 (not c!96034)) b!914687))

(assert (= (and b!914686 res!616848) b!914694))

(assert (= (or b!914686 b!914687) bm!40527))

(declare-fun b_lambda!13383 () Bool)

(assert (=> (not b_lambda!13383) (not b!914689)))

(declare-fun t!25971 () Bool)

(declare-fun tb!5463 () Bool)

(assert (=> (and start!78396 (= defaultEntry!1160 defaultEntry!1160) t!25971) tb!5463))

(declare-fun result!10737 () Bool)

(assert (=> tb!5463 (= result!10737 tp_is_empty!19179)))

(assert (=> b!914689 t!25971))

(declare-fun b_and!27385 () Bool)

(assert (= b_and!27381 (and (=> t!25971 result!10737) b_and!27385)))

(declare-fun m!849311 () Bool)

(assert (=> b!914689 m!849311))

(declare-fun m!849313 () Bool)

(assert (=> b!914689 m!849313))

(declare-fun m!849315 () Bool)

(assert (=> b!914689 m!849315))

(assert (=> b!914689 m!849313))

(assert (=> b!914689 m!849311))

(assert (=> b!914689 m!849293))

(assert (=> b!914689 m!849293))

(declare-fun m!849317 () Bool)

(assert (=> b!914689 m!849317))

(declare-fun m!849319 () Bool)

(assert (=> bm!40525 m!849319))

(declare-fun m!849321 () Bool)

(assert (=> bm!40527 m!849321))

(assert (=> b!914685 m!849293))

(assert (=> b!914685 m!849293))

(declare-fun m!849323 () Bool)

(assert (=> b!914685 m!849323))

(declare-fun m!849325 () Bool)

(assert (=> bm!40530 m!849325))

(declare-fun m!849327 () Bool)

(assert (=> bm!40529 m!849327))

(declare-fun m!849329 () Bool)

(assert (=> b!914698 m!849329))

(declare-fun m!849331 () Bool)

(assert (=> b!914692 m!849331))

(assert (=> b!914688 m!849293))

(assert (=> b!914688 m!849293))

(assert (=> b!914688 m!849295))

(declare-fun m!849333 () Bool)

(assert (=> b!914697 m!849333))

(declare-fun m!849335 () Bool)

(assert (=> b!914697 m!849335))

(assert (=> b!914697 m!849293))

(declare-fun m!849337 () Bool)

(assert (=> b!914697 m!849337))

(declare-fun m!849339 () Bool)

(assert (=> b!914697 m!849339))

(declare-fun m!849341 () Bool)

(assert (=> b!914697 m!849341))

(assert (=> b!914697 m!849327))

(declare-fun m!849343 () Bool)

(assert (=> b!914697 m!849343))

(assert (=> b!914697 m!849335))

(declare-fun m!849345 () Bool)

(assert (=> b!914697 m!849345))

(declare-fun m!849347 () Bool)

(assert (=> b!914697 m!849347))

(declare-fun m!849349 () Bool)

(assert (=> b!914697 m!849349))

(declare-fun m!849351 () Bool)

(assert (=> b!914697 m!849351))

(declare-fun m!849353 () Bool)

(assert (=> b!914697 m!849353))

(declare-fun m!849355 () Bool)

(assert (=> b!914697 m!849355))

(declare-fun m!849357 () Bool)

(assert (=> b!914697 m!849357))

(assert (=> b!914697 m!849355))

(assert (=> b!914697 m!849347))

(declare-fun m!849359 () Bool)

(assert (=> b!914697 m!849359))

(assert (=> b!914697 m!849339))

(declare-fun m!849361 () Bool)

(assert (=> b!914697 m!849361))

(assert (=> b!914691 m!849293))

(assert (=> b!914691 m!849293))

(assert (=> b!914691 m!849295))

(assert (=> d!112683 m!849245))

(declare-fun m!849363 () Bool)

(assert (=> b!914694 m!849363))

(assert (=> b!914563 d!112683))

(declare-fun d!112685 () Bool)

(assert (=> d!112685 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!78396 d!112685))

(declare-fun d!112687 () Bool)

(assert (=> d!112687 (= (array_inv!20402 _values!1152) (bvsge (size!26584 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!78396 d!112687))

(declare-fun d!112689 () Bool)

(assert (=> d!112689 (= (array_inv!20403 _keys!1386) (bvsge (size!26585 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!78396 d!112689))

(declare-fun b!914717 () Bool)

(declare-fun e!513168 () Bool)

(declare-fun contains!4700 (List!18356 (_ BitVec 64)) Bool)

(assert (=> b!914717 (= e!513168 (contains!4700 Nil!18353 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!914718 () Bool)

(declare-fun e!513167 () Bool)

(declare-fun e!513169 () Bool)

(assert (=> b!914718 (= e!513167 e!513169)))

(declare-fun c!96039 () Bool)

(assert (=> b!914718 (= c!96039 (validKeyInArray!0 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!914719 () Bool)

(declare-fun call!40537 () Bool)

(assert (=> b!914719 (= e!513169 call!40537)))

(declare-fun b!914720 () Bool)

(assert (=> b!914720 (= e!513169 call!40537)))

(declare-fun bm!40534 () Bool)

(assert (=> bm!40534 (= call!40537 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!96039 (Cons!18352 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000) Nil!18353) Nil!18353)))))

(declare-fun b!914721 () Bool)

(declare-fun e!513170 () Bool)

(assert (=> b!914721 (= e!513170 e!513167)))

(declare-fun res!616862 () Bool)

(assert (=> b!914721 (=> (not res!616862) (not e!513167))))

(assert (=> b!914721 (= res!616862 (not e!513168))))

(declare-fun res!616860 () Bool)

(assert (=> b!914721 (=> (not res!616860) (not e!513168))))

(assert (=> b!914721 (= res!616860 (validKeyInArray!0 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun d!112691 () Bool)

(declare-fun res!616861 () Bool)

(assert (=> d!112691 (=> res!616861 e!513170)))

(assert (=> d!112691 (= res!616861 (bvsge #b00000000000000000000000000000000 (size!26585 _keys!1386)))))

(assert (=> d!112691 (= (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18353) e!513170)))

(assert (= (and d!112691 (not res!616861)) b!914721))

(assert (= (and b!914721 res!616860) b!914717))

(assert (= (and b!914721 res!616862) b!914718))

(assert (= (and b!914718 c!96039) b!914719))

(assert (= (and b!914718 (not c!96039)) b!914720))

(assert (= (or b!914719 b!914720) bm!40534))

(assert (=> b!914717 m!849293))

(assert (=> b!914717 m!849293))

(declare-fun m!849365 () Bool)

(assert (=> b!914717 m!849365))

(assert (=> b!914718 m!849293))

(assert (=> b!914718 m!849293))

(assert (=> b!914718 m!849295))

(assert (=> bm!40534 m!849293))

(declare-fun m!849367 () Bool)

(assert (=> bm!40534 m!849367))

(assert (=> b!914721 m!849293))

(assert (=> b!914721 m!849293))

(assert (=> b!914721 m!849295))

(assert (=> b!914570 d!112691))

(declare-fun mapIsEmpty!30513 () Bool)

(declare-fun mapRes!30513 () Bool)

(assert (=> mapIsEmpty!30513 mapRes!30513))

(declare-fun b!914729 () Bool)

(declare-fun e!513175 () Bool)

(assert (=> b!914729 (= e!513175 tp_is_empty!19179)))

(declare-fun b!914728 () Bool)

(declare-fun e!513176 () Bool)

(assert (=> b!914728 (= e!513176 tp_is_empty!19179)))

(declare-fun condMapEmpty!30513 () Bool)

(declare-fun mapDefault!30513 () ValueCell!9108)

(assert (=> mapNonEmpty!30507 (= condMapEmpty!30513 (= mapRest!30507 ((as const (Array (_ BitVec 32) ValueCell!9108)) mapDefault!30513)))))

(assert (=> mapNonEmpty!30507 (= tp!58571 (and e!513175 mapRes!30513))))

(declare-fun mapNonEmpty!30513 () Bool)

(declare-fun tp!58580 () Bool)

(assert (=> mapNonEmpty!30513 (= mapRes!30513 (and tp!58580 e!513176))))

(declare-fun mapValue!30513 () ValueCell!9108)

(declare-fun mapRest!30513 () (Array (_ BitVec 32) ValueCell!9108))

(declare-fun mapKey!30513 () (_ BitVec 32))

(assert (=> mapNonEmpty!30513 (= mapRest!30507 (store mapRest!30513 mapKey!30513 mapValue!30513))))

(assert (= (and mapNonEmpty!30507 condMapEmpty!30513) mapIsEmpty!30513))

(assert (= (and mapNonEmpty!30507 (not condMapEmpty!30513)) mapNonEmpty!30513))

(assert (= (and mapNonEmpty!30513 ((_ is ValueCellFull!9108) mapValue!30513)) b!914728))

(assert (= (and mapNonEmpty!30507 ((_ is ValueCellFull!9108) mapDefault!30513)) b!914729))

(declare-fun m!849369 () Bool)

(assert (=> mapNonEmpty!30513 m!849369))

(declare-fun b_lambda!13385 () Bool)

(assert (= b_lambda!13383 (or (and start!78396 b_free!16761) b_lambda!13385)))

(check-sat (not b!914694) (not b!914721) (not b_next!16761) (not b!914717) (not bm!40525) (not b_lambda!13385) (not b!914685) (not b!914718) (not b!914698) (not b!914631) (not b!914639) (not mapNonEmpty!30513) (not d!112681) (not bm!40529) (not b!914641) (not d!112675) tp_is_empty!19179 (not bm!40534) (not bm!40530) (not b!914689) (not d!112683) (not bm!40510) (not b!914697) (not b!914688) (not bm!40527) b_and!27385 (not b!914691) (not b!914692) (not b!914629))
(check-sat b_and!27385 (not b_next!16761))
