; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78214 () Bool)

(assert start!78214)

(declare-fun b_free!16723 () Bool)

(declare-fun b_next!16723 () Bool)

(assert (=> start!78214 (= b_free!16723 (not b_next!16723))))

(declare-fun tp!58447 () Bool)

(declare-fun b_and!27273 () Bool)

(assert (=> start!78214 (= tp!58447 b_and!27273)))

(declare-fun b!912864 () Bool)

(declare-fun res!615857 () Bool)

(declare-fun e!512015 () Bool)

(assert (=> b!912864 (=> (not res!615857) (not e!512015))))

(declare-datatypes ((array!54275 0))(
  ( (array!54276 (arr!26092 (Array (_ BitVec 32) (_ BitVec 64))) (size!26553 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54275)

(declare-datatypes ((List!18364 0))(
  ( (Nil!18361) (Cons!18360 (h!19506 (_ BitVec 64)) (t!25944 List!18364)) )
))
(declare-fun arrayNoDuplicates!0 (array!54275 (_ BitVec 32) List!18364) Bool)

(assert (=> b!912864 (= res!615857 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18361))))

(declare-fun b!912865 () Bool)

(declare-fun res!615858 () Bool)

(assert (=> b!912865 (=> (not res!615858) (not e!512015))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!912865 (= res!615858 (and (= (select (arr!26092 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!912866 () Bool)

(declare-fun res!615854 () Bool)

(assert (=> b!912866 (=> (not res!615854) (not e!512015))))

(declare-datatypes ((V!30487 0))(
  ( (V!30488 (val!9621 Int)) )
))
(declare-datatypes ((ValueCell!9089 0))(
  ( (ValueCellFull!9089 (v!12131 V!30487)) (EmptyCell!9089) )
))
(declare-datatypes ((array!54277 0))(
  ( (array!54278 (arr!26093 (Array (_ BitVec 32) ValueCell!9089)) (size!26554 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54277)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!912866 (= res!615854 (and (= (size!26554 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26553 _keys!1386) (size!26554 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912867 () Bool)

(declare-fun e!512014 () Bool)

(declare-fun tp_is_empty!19141 () Bool)

(assert (=> b!912867 (= e!512014 tp_is_empty!19141)))

(declare-fun b!912868 () Bool)

(declare-fun res!615855 () Bool)

(assert (=> b!912868 (=> (not res!615855) (not e!512015))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30487)

(declare-fun minValue!1094 () V!30487)

(declare-datatypes ((tuple2!12584 0))(
  ( (tuple2!12585 (_1!6303 (_ BitVec 64)) (_2!6303 V!30487)) )
))
(declare-datatypes ((List!18365 0))(
  ( (Nil!18362) (Cons!18361 (h!19507 tuple2!12584) (t!25945 List!18365)) )
))
(declare-datatypes ((ListLongMap!11271 0))(
  ( (ListLongMap!11272 (toList!5651 List!18365)) )
))
(declare-fun contains!4654 (ListLongMap!11271 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2853 (array!54275 array!54277 (_ BitVec 32) (_ BitVec 32) V!30487 V!30487 (_ BitVec 32) Int) ListLongMap!11271)

(assert (=> b!912868 (= res!615855 (contains!4654 (getCurrentListMap!2853 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!912869 () Bool)

(declare-fun res!615856 () Bool)

(assert (=> b!912869 (=> (not res!615856) (not e!512015))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!912869 (= res!615856 (inRange!0 i!717 mask!1756))))

(declare-fun b!912870 () Bool)

(assert (=> b!912870 (= e!512015 (not (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26553 _keys!1386)))))))

(declare-fun arrayContainsKey!0 (array!54275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!912870 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30830 0))(
  ( (Unit!30831) )
))
(declare-fun lt!410499 () Unit!30830)

(declare-fun lemmaKeyInListMapIsInArray!272 (array!54275 array!54277 (_ BitVec 32) (_ BitVec 32) V!30487 V!30487 (_ BitVec 64) Int) Unit!30830)

(assert (=> b!912870 (= lt!410499 (lemmaKeyInListMapIsInArray!272 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun mapIsEmpty!30439 () Bool)

(declare-fun mapRes!30439 () Bool)

(assert (=> mapIsEmpty!30439 mapRes!30439))

(declare-fun b!912871 () Bool)

(declare-fun e!512013 () Bool)

(declare-fun e!512011 () Bool)

(assert (=> b!912871 (= e!512013 (and e!512011 mapRes!30439))))

(declare-fun condMapEmpty!30439 () Bool)

(declare-fun mapDefault!30439 () ValueCell!9089)

(assert (=> b!912871 (= condMapEmpty!30439 (= (arr!26093 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9089)) mapDefault!30439)))))

(declare-fun b!912873 () Bool)

(assert (=> b!912873 (= e!512011 tp_is_empty!19141)))

(declare-fun mapNonEmpty!30439 () Bool)

(declare-fun tp!58446 () Bool)

(assert (=> mapNonEmpty!30439 (= mapRes!30439 (and tp!58446 e!512014))))

(declare-fun mapRest!30439 () (Array (_ BitVec 32) ValueCell!9089))

(declare-fun mapKey!30439 () (_ BitVec 32))

(declare-fun mapValue!30439 () ValueCell!9089)

(assert (=> mapNonEmpty!30439 (= (arr!26093 _values!1152) (store mapRest!30439 mapKey!30439 mapValue!30439))))

(declare-fun res!615853 () Bool)

(assert (=> start!78214 (=> (not res!615853) (not e!512015))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78214 (= res!615853 (validMask!0 mask!1756))))

(assert (=> start!78214 e!512015))

(declare-fun array_inv!20456 (array!54277) Bool)

(assert (=> start!78214 (and (array_inv!20456 _values!1152) e!512013)))

(assert (=> start!78214 tp!58447))

(assert (=> start!78214 true))

(assert (=> start!78214 tp_is_empty!19141))

(declare-fun array_inv!20457 (array!54275) Bool)

(assert (=> start!78214 (array_inv!20457 _keys!1386)))

(declare-fun b!912872 () Bool)

(declare-fun res!615859 () Bool)

(assert (=> b!912872 (=> (not res!615859) (not e!512015))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54275 (_ BitVec 32)) Bool)

(assert (=> b!912872 (= res!615859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!78214 res!615853) b!912866))

(assert (= (and b!912866 res!615854) b!912872))

(assert (= (and b!912872 res!615859) b!912864))

(assert (= (and b!912864 res!615857) b!912868))

(assert (= (and b!912868 res!615855) b!912869))

(assert (= (and b!912869 res!615856) b!912865))

(assert (= (and b!912865 res!615858) b!912870))

(assert (= (and b!912871 condMapEmpty!30439) mapIsEmpty!30439))

(assert (= (and b!912871 (not condMapEmpty!30439)) mapNonEmpty!30439))

(get-info :version)

(assert (= (and mapNonEmpty!30439 ((_ is ValueCellFull!9089) mapValue!30439)) b!912867))

(assert (= (and b!912871 ((_ is ValueCellFull!9089) mapDefault!30439)) b!912873))

(assert (= start!78214 b!912871))

(declare-fun m!846717 () Bool)

(assert (=> b!912868 m!846717))

(assert (=> b!912868 m!846717))

(declare-fun m!846719 () Bool)

(assert (=> b!912868 m!846719))

(declare-fun m!846721 () Bool)

(assert (=> b!912869 m!846721))

(declare-fun m!846723 () Bool)

(assert (=> start!78214 m!846723))

(declare-fun m!846725 () Bool)

(assert (=> start!78214 m!846725))

(declare-fun m!846727 () Bool)

(assert (=> start!78214 m!846727))

(declare-fun m!846729 () Bool)

(assert (=> mapNonEmpty!30439 m!846729))

(declare-fun m!846731 () Bool)

(assert (=> b!912872 m!846731))

(declare-fun m!846733 () Bool)

(assert (=> b!912865 m!846733))

(declare-fun m!846735 () Bool)

(assert (=> b!912870 m!846735))

(declare-fun m!846737 () Bool)

(assert (=> b!912870 m!846737))

(declare-fun m!846739 () Bool)

(assert (=> b!912864 m!846739))

(check-sat (not b!912869) (not b!912872) b_and!27273 (not b_next!16723) (not b!912868) tp_is_empty!19141 (not start!78214) (not mapNonEmpty!30439) (not b!912864) (not b!912870))
(check-sat b_and!27273 (not b_next!16723))
(get-model)

(declare-fun d!112117 () Bool)

(declare-fun res!615906 () Bool)

(declare-fun e!512053 () Bool)

(assert (=> d!112117 (=> res!615906 e!512053)))

(assert (=> d!112117 (= res!615906 (bvsge #b00000000000000000000000000000000 (size!26553 _keys!1386)))))

(assert (=> d!112117 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!512053)))

(declare-fun b!912942 () Bool)

(declare-fun e!512052 () Bool)

(declare-fun e!512054 () Bool)

(assert (=> b!912942 (= e!512052 e!512054)))

(declare-fun lt!410513 () (_ BitVec 64))

(assert (=> b!912942 (= lt!410513 (select (arr!26092 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410512 () Unit!30830)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!54275 (_ BitVec 64) (_ BitVec 32)) Unit!30830)

(assert (=> b!912942 (= lt!410512 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!410513 #b00000000000000000000000000000000))))

(assert (=> b!912942 (arrayContainsKey!0 _keys!1386 lt!410513 #b00000000000000000000000000000000)))

(declare-fun lt!410514 () Unit!30830)

(assert (=> b!912942 (= lt!410514 lt!410512)))

(declare-fun res!615907 () Bool)

(declare-datatypes ((SeekEntryResult!8968 0))(
  ( (MissingZero!8968 (index!38243 (_ BitVec 32))) (Found!8968 (index!38244 (_ BitVec 32))) (Intermediate!8968 (undefined!9780 Bool) (index!38245 (_ BitVec 32)) (x!78114 (_ BitVec 32))) (Undefined!8968) (MissingVacant!8968 (index!38246 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!54275 (_ BitVec 32)) SeekEntryResult!8968)

(assert (=> b!912942 (= res!615907 (= (seekEntryOrOpen!0 (select (arr!26092 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8968 #b00000000000000000000000000000000)))))

(assert (=> b!912942 (=> (not res!615907) (not e!512054))))

(declare-fun bm!40368 () Bool)

(declare-fun call!40371 () Bool)

(assert (=> bm!40368 (= call!40371 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!912943 () Bool)

(assert (=> b!912943 (= e!512052 call!40371)))

(declare-fun b!912944 () Bool)

(assert (=> b!912944 (= e!512054 call!40371)))

(declare-fun b!912945 () Bool)

(assert (=> b!912945 (= e!512053 e!512052)))

(declare-fun c!95737 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!912945 (= c!95737 (validKeyInArray!0 (select (arr!26092 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!112117 (not res!615906)) b!912945))

(assert (= (and b!912945 c!95737) b!912942))

(assert (= (and b!912945 (not c!95737)) b!912943))

(assert (= (and b!912942 res!615907) b!912944))

(assert (= (or b!912944 b!912943) bm!40368))

(declare-fun m!846789 () Bool)

(assert (=> b!912942 m!846789))

(declare-fun m!846791 () Bool)

(assert (=> b!912942 m!846791))

(declare-fun m!846793 () Bool)

(assert (=> b!912942 m!846793))

(assert (=> b!912942 m!846789))

(declare-fun m!846795 () Bool)

(assert (=> b!912942 m!846795))

(declare-fun m!846797 () Bool)

(assert (=> bm!40368 m!846797))

(assert (=> b!912945 m!846789))

(assert (=> b!912945 m!846789))

(declare-fun m!846799 () Bool)

(assert (=> b!912945 m!846799))

(assert (=> b!912872 d!112117))

(declare-fun d!112119 () Bool)

(declare-fun e!512060 () Bool)

(assert (=> d!112119 e!512060))

(declare-fun res!615910 () Bool)

(assert (=> d!112119 (=> res!615910 e!512060)))

(declare-fun lt!410525 () Bool)

(assert (=> d!112119 (= res!615910 (not lt!410525))))

(declare-fun lt!410523 () Bool)

(assert (=> d!112119 (= lt!410525 lt!410523)))

(declare-fun lt!410524 () Unit!30830)

(declare-fun e!512059 () Unit!30830)

(assert (=> d!112119 (= lt!410524 e!512059)))

(declare-fun c!95740 () Bool)

(assert (=> d!112119 (= c!95740 lt!410523)))

(declare-fun containsKey!441 (List!18365 (_ BitVec 64)) Bool)

(assert (=> d!112119 (= lt!410523 (containsKey!441 (toList!5651 (getCurrentListMap!2853 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(assert (=> d!112119 (= (contains!4654 (getCurrentListMap!2853 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033) lt!410525)))

(declare-fun b!912952 () Bool)

(declare-fun lt!410526 () Unit!30830)

(assert (=> b!912952 (= e!512059 lt!410526)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!336 (List!18365 (_ BitVec 64)) Unit!30830)

(assert (=> b!912952 (= lt!410526 (lemmaContainsKeyImpliesGetValueByKeyDefined!336 (toList!5651 (getCurrentListMap!2853 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-datatypes ((Option!483 0))(
  ( (Some!482 (v!12134 V!30487)) (None!481) )
))
(declare-fun isDefined!349 (Option!483) Bool)

(declare-fun getValueByKey!477 (List!18365 (_ BitVec 64)) Option!483)

(assert (=> b!912952 (isDefined!349 (getValueByKey!477 (toList!5651 (getCurrentListMap!2853 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun b!912953 () Bool)

(declare-fun Unit!30832 () Unit!30830)

(assert (=> b!912953 (= e!512059 Unit!30832)))

(declare-fun b!912954 () Bool)

(assert (=> b!912954 (= e!512060 (isDefined!349 (getValueByKey!477 (toList!5651 (getCurrentListMap!2853 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033)))))

(assert (= (and d!112119 c!95740) b!912952))

(assert (= (and d!112119 (not c!95740)) b!912953))

(assert (= (and d!112119 (not res!615910)) b!912954))

(declare-fun m!846801 () Bool)

(assert (=> d!112119 m!846801))

(declare-fun m!846803 () Bool)

(assert (=> b!912952 m!846803))

(declare-fun m!846805 () Bool)

(assert (=> b!912952 m!846805))

(assert (=> b!912952 m!846805))

(declare-fun m!846807 () Bool)

(assert (=> b!912952 m!846807))

(assert (=> b!912954 m!846805))

(assert (=> b!912954 m!846805))

(assert (=> b!912954 m!846807))

(assert (=> b!912868 d!112119))

(declare-fun bm!40383 () Bool)

(declare-fun call!40391 () ListLongMap!11271)

(declare-fun call!40386 () ListLongMap!11271)

(assert (=> bm!40383 (= call!40391 call!40386)))

(declare-fun b!912997 () Bool)

(declare-fun e!512098 () Bool)

(assert (=> b!912997 (= e!512098 (validKeyInArray!0 (select (arr!26092 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!912999 () Bool)

(declare-fun e!512091 () ListLongMap!11271)

(declare-fun call!40390 () ListLongMap!11271)

(assert (=> b!912999 (= e!512091 call!40390)))

(declare-fun lt!410573 () ListLongMap!11271)

(declare-fun b!913000 () Bool)

(declare-fun e!512093 () Bool)

(declare-fun apply!519 (ListLongMap!11271 (_ BitVec 64)) V!30487)

(declare-fun get!13694 (ValueCell!9089 V!30487) V!30487)

(declare-fun dynLambda!1384 (Int (_ BitVec 64)) V!30487)

(assert (=> b!913000 (= e!512093 (= (apply!519 lt!410573 (select (arr!26092 _keys!1386) #b00000000000000000000000000000000)) (get!13694 (select (arr!26093 _values!1152) #b00000000000000000000000000000000) (dynLambda!1384 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!913000 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26554 _values!1152)))))

(assert (=> b!913000 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26553 _keys!1386)))))

(declare-fun b!913001 () Bool)

(declare-fun res!615933 () Bool)

(declare-fun e!512099 () Bool)

(assert (=> b!913001 (=> (not res!615933) (not e!512099))))

(declare-fun e!512089 () Bool)

(assert (=> b!913001 (= res!615933 e!512089)))

(declare-fun c!95753 () Bool)

(assert (=> b!913001 (= c!95753 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!913002 () Bool)

(declare-fun c!95756 () Bool)

(assert (=> b!913002 (= c!95756 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!512097 () ListLongMap!11271)

(assert (=> b!913002 (= e!512091 e!512097)))

(declare-fun bm!40384 () Bool)

(declare-fun call!40387 () Bool)

(assert (=> bm!40384 (= call!40387 (contains!4654 lt!410573 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!913003 () Bool)

(declare-fun e!512087 () Bool)

(declare-fun call!40389 () Bool)

(assert (=> b!913003 (= e!512087 (not call!40389))))

(declare-fun b!913004 () Bool)

(declare-fun e!512090 () Bool)

(assert (=> b!913004 (= e!512090 (= (apply!519 lt!410573 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun b!913005 () Bool)

(declare-fun e!512096 () ListLongMap!11271)

(declare-fun call!40392 () ListLongMap!11271)

(declare-fun +!2633 (ListLongMap!11271 tuple2!12584) ListLongMap!11271)

(assert (=> b!913005 (= e!512096 (+!2633 call!40392 (tuple2!12585 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun b!913006 () Bool)

(declare-fun e!512094 () Bool)

(assert (=> b!913006 (= e!512094 (validKeyInArray!0 (select (arr!26092 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun bm!40385 () Bool)

(declare-fun c!95757 () Bool)

(declare-fun call!40388 () ListLongMap!11271)

(declare-fun c!95754 () Bool)

(assert (=> bm!40385 (= call!40392 (+!2633 (ite c!95754 call!40388 (ite c!95757 call!40386 call!40391)) (ite (or c!95754 c!95757) (tuple2!12585 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12585 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun b!913007 () Bool)

(assert (=> b!913007 (= e!512096 e!512091)))

(assert (=> b!913007 (= c!95757 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!913008 () Bool)

(declare-fun e!512092 () Bool)

(assert (=> b!913008 (= e!512087 e!512092)))

(declare-fun res!615936 () Bool)

(assert (=> b!913008 (= res!615936 call!40389)))

(assert (=> b!913008 (=> (not res!615936) (not e!512092))))

(declare-fun b!913009 () Bool)

(declare-fun e!512095 () Bool)

(assert (=> b!913009 (= e!512095 e!512093)))

(declare-fun res!615937 () Bool)

(assert (=> b!913009 (=> (not res!615937) (not e!512093))))

(assert (=> b!913009 (= res!615937 (contains!4654 lt!410573 (select (arr!26092 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!913009 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26553 _keys!1386)))))

(declare-fun b!913010 () Bool)

(declare-fun res!615932 () Bool)

(assert (=> b!913010 (=> (not res!615932) (not e!512099))))

(assert (=> b!913010 (= res!615932 e!512095)))

(declare-fun res!615929 () Bool)

(assert (=> b!913010 (=> res!615929 e!512095)))

(assert (=> b!913010 (= res!615929 (not e!512098))))

(declare-fun res!615935 () Bool)

(assert (=> b!913010 (=> (not res!615935) (not e!512098))))

(assert (=> b!913010 (= res!615935 (bvslt #b00000000000000000000000000000000 (size!26553 _keys!1386)))))

(declare-fun b!913011 () Bool)

(assert (=> b!913011 (= e!512097 call!40390)))

(declare-fun b!913012 () Bool)

(assert (=> b!913012 (= e!512099 e!512087)))

(declare-fun c!95758 () Bool)

(assert (=> b!913012 (= c!95758 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40386 () Bool)

(assert (=> bm!40386 (= call!40390 call!40392)))

(declare-fun bm!40387 () Bool)

(assert (=> bm!40387 (= call!40386 call!40388)))

(declare-fun bm!40388 () Bool)

(assert (=> bm!40388 (= call!40389 (contains!4654 lt!410573 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!913013 () Bool)

(declare-fun e!512088 () Unit!30830)

(declare-fun lt!410584 () Unit!30830)

(assert (=> b!913013 (= e!512088 lt!410584)))

(declare-fun lt!410571 () ListLongMap!11271)

(declare-fun getCurrentListMapNoExtraKeys!3330 (array!54275 array!54277 (_ BitVec 32) (_ BitVec 32) V!30487 V!30487 (_ BitVec 32) Int) ListLongMap!11271)

(assert (=> b!913013 (= lt!410571 (getCurrentListMapNoExtraKeys!3330 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410583 () (_ BitVec 64))

(assert (=> b!913013 (= lt!410583 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410578 () (_ BitVec 64))

(assert (=> b!913013 (= lt!410578 (select (arr!26092 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410589 () Unit!30830)

(declare-fun addStillContains!348 (ListLongMap!11271 (_ BitVec 64) V!30487 (_ BitVec 64)) Unit!30830)

(assert (=> b!913013 (= lt!410589 (addStillContains!348 lt!410571 lt!410583 zeroValue!1094 lt!410578))))

(assert (=> b!913013 (contains!4654 (+!2633 lt!410571 (tuple2!12585 lt!410583 zeroValue!1094)) lt!410578)))

(declare-fun lt!410572 () Unit!30830)

(assert (=> b!913013 (= lt!410572 lt!410589)))

(declare-fun lt!410590 () ListLongMap!11271)

(assert (=> b!913013 (= lt!410590 (getCurrentListMapNoExtraKeys!3330 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410580 () (_ BitVec 64))

(assert (=> b!913013 (= lt!410580 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410586 () (_ BitVec 64))

(assert (=> b!913013 (= lt!410586 (select (arr!26092 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410577 () Unit!30830)

(declare-fun addApplyDifferent!348 (ListLongMap!11271 (_ BitVec 64) V!30487 (_ BitVec 64)) Unit!30830)

(assert (=> b!913013 (= lt!410577 (addApplyDifferent!348 lt!410590 lt!410580 minValue!1094 lt!410586))))

(assert (=> b!913013 (= (apply!519 (+!2633 lt!410590 (tuple2!12585 lt!410580 minValue!1094)) lt!410586) (apply!519 lt!410590 lt!410586))))

(declare-fun lt!410576 () Unit!30830)

(assert (=> b!913013 (= lt!410576 lt!410577)))

(declare-fun lt!410588 () ListLongMap!11271)

(assert (=> b!913013 (= lt!410588 (getCurrentListMapNoExtraKeys!3330 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410587 () (_ BitVec 64))

(assert (=> b!913013 (= lt!410587 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410585 () (_ BitVec 64))

(assert (=> b!913013 (= lt!410585 (select (arr!26092 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410581 () Unit!30830)

(assert (=> b!913013 (= lt!410581 (addApplyDifferent!348 lt!410588 lt!410587 zeroValue!1094 lt!410585))))

(assert (=> b!913013 (= (apply!519 (+!2633 lt!410588 (tuple2!12585 lt!410587 zeroValue!1094)) lt!410585) (apply!519 lt!410588 lt!410585))))

(declare-fun lt!410575 () Unit!30830)

(assert (=> b!913013 (= lt!410575 lt!410581)))

(declare-fun lt!410579 () ListLongMap!11271)

(assert (=> b!913013 (= lt!410579 (getCurrentListMapNoExtraKeys!3330 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410591 () (_ BitVec 64))

(assert (=> b!913013 (= lt!410591 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410574 () (_ BitVec 64))

(assert (=> b!913013 (= lt!410574 (select (arr!26092 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!913013 (= lt!410584 (addApplyDifferent!348 lt!410579 lt!410591 minValue!1094 lt!410574))))

(assert (=> b!913013 (= (apply!519 (+!2633 lt!410579 (tuple2!12585 lt!410591 minValue!1094)) lt!410574) (apply!519 lt!410579 lt!410574))))

(declare-fun b!913014 () Bool)

(assert (=> b!913014 (= e!512089 (not call!40387))))

(declare-fun b!912998 () Bool)

(assert (=> b!912998 (= e!512097 call!40391)))

(declare-fun d!112121 () Bool)

(assert (=> d!112121 e!512099))

(declare-fun res!615930 () Bool)

(assert (=> d!112121 (=> (not res!615930) (not e!512099))))

(assert (=> d!112121 (= res!615930 (or (bvsge #b00000000000000000000000000000000 (size!26553 _keys!1386)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26553 _keys!1386)))))))

(declare-fun lt!410582 () ListLongMap!11271)

(assert (=> d!112121 (= lt!410573 lt!410582)))

(declare-fun lt!410592 () Unit!30830)

(assert (=> d!112121 (= lt!410592 e!512088)))

(declare-fun c!95755 () Bool)

(assert (=> d!112121 (= c!95755 e!512094)))

(declare-fun res!615934 () Bool)

(assert (=> d!112121 (=> (not res!615934) (not e!512094))))

(assert (=> d!112121 (= res!615934 (bvslt #b00000000000000000000000000000000 (size!26553 _keys!1386)))))

(assert (=> d!112121 (= lt!410582 e!512096)))

(assert (=> d!112121 (= c!95754 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112121 (validMask!0 mask!1756)))

(assert (=> d!112121 (= (getCurrentListMap!2853 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!410573)))

(declare-fun b!913015 () Bool)

(assert (=> b!913015 (= e!512092 (= (apply!519 lt!410573 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun bm!40389 () Bool)

(assert (=> bm!40389 (= call!40388 (getCurrentListMapNoExtraKeys!3330 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!913016 () Bool)

(declare-fun Unit!30833 () Unit!30830)

(assert (=> b!913016 (= e!512088 Unit!30833)))

(declare-fun b!913017 () Bool)

(assert (=> b!913017 (= e!512089 e!512090)))

(declare-fun res!615931 () Bool)

(assert (=> b!913017 (= res!615931 call!40387)))

(assert (=> b!913017 (=> (not res!615931) (not e!512090))))

(assert (= (and d!112121 c!95754) b!913005))

(assert (= (and d!112121 (not c!95754)) b!913007))

(assert (= (and b!913007 c!95757) b!912999))

(assert (= (and b!913007 (not c!95757)) b!913002))

(assert (= (and b!913002 c!95756) b!913011))

(assert (= (and b!913002 (not c!95756)) b!912998))

(assert (= (or b!913011 b!912998) bm!40383))

(assert (= (or b!912999 bm!40383) bm!40387))

(assert (= (or b!912999 b!913011) bm!40386))

(assert (= (or b!913005 bm!40387) bm!40389))

(assert (= (or b!913005 bm!40386) bm!40385))

(assert (= (and d!112121 res!615934) b!913006))

(assert (= (and d!112121 c!95755) b!913013))

(assert (= (and d!112121 (not c!95755)) b!913016))

(assert (= (and d!112121 res!615930) b!913010))

(assert (= (and b!913010 res!615935) b!912997))

(assert (= (and b!913010 (not res!615929)) b!913009))

(assert (= (and b!913009 res!615937) b!913000))

(assert (= (and b!913010 res!615932) b!913001))

(assert (= (and b!913001 c!95753) b!913017))

(assert (= (and b!913001 (not c!95753)) b!913014))

(assert (= (and b!913017 res!615931) b!913004))

(assert (= (or b!913017 b!913014) bm!40384))

(assert (= (and b!913001 res!615933) b!913012))

(assert (= (and b!913012 c!95758) b!913008))

(assert (= (and b!913012 (not c!95758)) b!913003))

(assert (= (and b!913008 res!615936) b!913015))

(assert (= (or b!913008 b!913003) bm!40388))

(declare-fun b_lambda!13293 () Bool)

(assert (=> (not b_lambda!13293) (not b!913000)))

(declare-fun t!25949 () Bool)

(declare-fun tb!5433 () Bool)

(assert (=> (and start!78214 (= defaultEntry!1160 defaultEntry!1160) t!25949) tb!5433))

(declare-fun result!10679 () Bool)

(assert (=> tb!5433 (= result!10679 tp_is_empty!19141)))

(assert (=> b!913000 t!25949))

(declare-fun b_and!27279 () Bool)

(assert (= b_and!27273 (and (=> t!25949 result!10679) b_and!27279)))

(declare-fun m!846809 () Bool)

(assert (=> b!913004 m!846809))

(declare-fun m!846811 () Bool)

(assert (=> bm!40385 m!846811))

(declare-fun m!846813 () Bool)

(assert (=> b!913015 m!846813))

(assert (=> b!913000 m!846789))

(declare-fun m!846815 () Bool)

(assert (=> b!913000 m!846815))

(declare-fun m!846817 () Bool)

(assert (=> b!913000 m!846817))

(declare-fun m!846819 () Bool)

(assert (=> b!913000 m!846819))

(assert (=> b!913000 m!846789))

(declare-fun m!846821 () Bool)

(assert (=> b!913000 m!846821))

(assert (=> b!913000 m!846817))

(assert (=> b!913000 m!846815))

(declare-fun m!846823 () Bool)

(assert (=> bm!40384 m!846823))

(declare-fun m!846825 () Bool)

(assert (=> b!913005 m!846825))

(declare-fun m!846827 () Bool)

(assert (=> bm!40388 m!846827))

(assert (=> b!913006 m!846789))

(assert (=> b!913006 m!846789))

(assert (=> b!913006 m!846799))

(declare-fun m!846829 () Bool)

(assert (=> bm!40389 m!846829))

(assert (=> b!912997 m!846789))

(assert (=> b!912997 m!846789))

(assert (=> b!912997 m!846799))

(declare-fun m!846831 () Bool)

(assert (=> b!913013 m!846831))

(declare-fun m!846833 () Bool)

(assert (=> b!913013 m!846833))

(declare-fun m!846835 () Bool)

(assert (=> b!913013 m!846835))

(declare-fun m!846837 () Bool)

(assert (=> b!913013 m!846837))

(declare-fun m!846839 () Bool)

(assert (=> b!913013 m!846839))

(assert (=> b!913013 m!846831))

(declare-fun m!846841 () Bool)

(assert (=> b!913013 m!846841))

(declare-fun m!846843 () Bool)

(assert (=> b!913013 m!846843))

(assert (=> b!913013 m!846835))

(declare-fun m!846845 () Bool)

(assert (=> b!913013 m!846845))

(assert (=> b!913013 m!846829))

(declare-fun m!846847 () Bool)

(assert (=> b!913013 m!846847))

(declare-fun m!846849 () Bool)

(assert (=> b!913013 m!846849))

(declare-fun m!846851 () Bool)

(assert (=> b!913013 m!846851))

(declare-fun m!846853 () Bool)

(assert (=> b!913013 m!846853))

(declare-fun m!846855 () Bool)

(assert (=> b!913013 m!846855))

(assert (=> b!913013 m!846789))

(assert (=> b!913013 m!846849))

(declare-fun m!846857 () Bool)

(assert (=> b!913013 m!846857))

(declare-fun m!846859 () Bool)

(assert (=> b!913013 m!846859))

(assert (=> b!913013 m!846851))

(assert (=> b!913009 m!846789))

(assert (=> b!913009 m!846789))

(declare-fun m!846861 () Bool)

(assert (=> b!913009 m!846861))

(assert (=> d!112121 m!846723))

(assert (=> b!912868 d!112121))

(declare-fun d!112123 () Bool)

(assert (=> d!112123 (= (inRange!0 i!717 mask!1756) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (bvadd mask!1756 #b00000000000000000000000000000001))))))

(assert (=> b!912869 d!112123))

(declare-fun b!913030 () Bool)

(declare-fun e!512110 () Bool)

(declare-fun e!512109 () Bool)

(assert (=> b!913030 (= e!512110 e!512109)))

(declare-fun c!95761 () Bool)

(assert (=> b!913030 (= c!95761 (validKeyInArray!0 (select (arr!26092 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun d!112125 () Bool)

(declare-fun res!615944 () Bool)

(declare-fun e!512111 () Bool)

(assert (=> d!112125 (=> res!615944 e!512111)))

(assert (=> d!112125 (= res!615944 (bvsge #b00000000000000000000000000000000 (size!26553 _keys!1386)))))

(assert (=> d!112125 (= (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18361) e!512111)))

(declare-fun b!913031 () Bool)

(declare-fun call!40395 () Bool)

(assert (=> b!913031 (= e!512109 call!40395)))

(declare-fun bm!40392 () Bool)

(assert (=> bm!40392 (= call!40395 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95761 (Cons!18360 (select (arr!26092 _keys!1386) #b00000000000000000000000000000000) Nil!18361) Nil!18361)))))

(declare-fun b!913032 () Bool)

(assert (=> b!913032 (= e!512111 e!512110)))

(declare-fun res!615945 () Bool)

(assert (=> b!913032 (=> (not res!615945) (not e!512110))))

(declare-fun e!512108 () Bool)

(assert (=> b!913032 (= res!615945 (not e!512108))))

(declare-fun res!615946 () Bool)

(assert (=> b!913032 (=> (not res!615946) (not e!512108))))

(assert (=> b!913032 (= res!615946 (validKeyInArray!0 (select (arr!26092 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913033 () Bool)

(declare-fun contains!4656 (List!18364 (_ BitVec 64)) Bool)

(assert (=> b!913033 (= e!512108 (contains!4656 Nil!18361 (select (arr!26092 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913034 () Bool)

(assert (=> b!913034 (= e!512109 call!40395)))

(assert (= (and d!112125 (not res!615944)) b!913032))

(assert (= (and b!913032 res!615946) b!913033))

(assert (= (and b!913032 res!615945) b!913030))

(assert (= (and b!913030 c!95761) b!913034))

(assert (= (and b!913030 (not c!95761)) b!913031))

(assert (= (or b!913034 b!913031) bm!40392))

(assert (=> b!913030 m!846789))

(assert (=> b!913030 m!846789))

(assert (=> b!913030 m!846799))

(assert (=> bm!40392 m!846789))

(declare-fun m!846863 () Bool)

(assert (=> bm!40392 m!846863))

(assert (=> b!913032 m!846789))

(assert (=> b!913032 m!846789))

(assert (=> b!913032 m!846799))

(assert (=> b!913033 m!846789))

(assert (=> b!913033 m!846789))

(declare-fun m!846865 () Bool)

(assert (=> b!913033 m!846865))

(assert (=> b!912864 d!112125))

(declare-fun d!112127 () Bool)

(declare-fun res!615951 () Bool)

(declare-fun e!512116 () Bool)

(assert (=> d!112127 (=> res!615951 e!512116)))

(assert (=> d!112127 (= res!615951 (= (select (arr!26092 _keys!1386) #b00000000000000000000000000000000) k0!1033))))

(assert (=> d!112127 (= (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000) e!512116)))

(declare-fun b!913039 () Bool)

(declare-fun e!512117 () Bool)

(assert (=> b!913039 (= e!512116 e!512117)))

(declare-fun res!615952 () Bool)

(assert (=> b!913039 (=> (not res!615952) (not e!512117))))

(assert (=> b!913039 (= res!615952 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26553 _keys!1386)))))

(declare-fun b!913040 () Bool)

(assert (=> b!913040 (= e!512117 (arrayContainsKey!0 _keys!1386 k0!1033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!112127 (not res!615951)) b!913039))

(assert (= (and b!913039 res!615952) b!913040))

(assert (=> d!112127 m!846789))

(declare-fun m!846867 () Bool)

(assert (=> b!913040 m!846867))

(assert (=> b!912870 d!112127))

(declare-fun d!112129 () Bool)

(declare-fun e!512120 () Bool)

(assert (=> d!112129 e!512120))

(declare-fun c!95764 () Bool)

(assert (=> d!112129 (= c!95764 (and (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!410595 () Unit!30830)

(declare-fun choose!1539 (array!54275 array!54277 (_ BitVec 32) (_ BitVec 32) V!30487 V!30487 (_ BitVec 64) Int) Unit!30830)

(assert (=> d!112129 (= lt!410595 (choose!1539 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(assert (=> d!112129 (validMask!0 mask!1756)))

(assert (=> d!112129 (= (lemmaKeyInListMapIsInArray!272 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160) lt!410595)))

(declare-fun b!913045 () Bool)

(assert (=> b!913045 (= e!512120 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000))))

(declare-fun b!913046 () Bool)

(assert (=> b!913046 (= e!512120 (ite (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!112129 c!95764) b!913045))

(assert (= (and d!112129 (not c!95764)) b!913046))

(declare-fun m!846869 () Bool)

(assert (=> d!112129 m!846869))

(assert (=> d!112129 m!846723))

(assert (=> b!913045 m!846735))

(assert (=> b!912870 d!112129))

(declare-fun d!112131 () Bool)

(assert (=> d!112131 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!78214 d!112131))

(declare-fun d!112133 () Bool)

(assert (=> d!112133 (= (array_inv!20456 _values!1152) (bvsge (size!26554 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!78214 d!112133))

(declare-fun d!112135 () Bool)

(assert (=> d!112135 (= (array_inv!20457 _keys!1386) (bvsge (size!26553 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!78214 d!112135))

(declare-fun mapIsEmpty!30448 () Bool)

(declare-fun mapRes!30448 () Bool)

(assert (=> mapIsEmpty!30448 mapRes!30448))

(declare-fun mapNonEmpty!30448 () Bool)

(declare-fun tp!58462 () Bool)

(declare-fun e!512126 () Bool)

(assert (=> mapNonEmpty!30448 (= mapRes!30448 (and tp!58462 e!512126))))

(declare-fun mapKey!30448 () (_ BitVec 32))

(declare-fun mapValue!30448 () ValueCell!9089)

(declare-fun mapRest!30448 () (Array (_ BitVec 32) ValueCell!9089))

(assert (=> mapNonEmpty!30448 (= mapRest!30439 (store mapRest!30448 mapKey!30448 mapValue!30448))))

(declare-fun condMapEmpty!30448 () Bool)

(declare-fun mapDefault!30448 () ValueCell!9089)

(assert (=> mapNonEmpty!30439 (= condMapEmpty!30448 (= mapRest!30439 ((as const (Array (_ BitVec 32) ValueCell!9089)) mapDefault!30448)))))

(declare-fun e!512125 () Bool)

(assert (=> mapNonEmpty!30439 (= tp!58446 (and e!512125 mapRes!30448))))

(declare-fun b!913053 () Bool)

(assert (=> b!913053 (= e!512126 tp_is_empty!19141)))

(declare-fun b!913054 () Bool)

(assert (=> b!913054 (= e!512125 tp_is_empty!19141)))

(assert (= (and mapNonEmpty!30439 condMapEmpty!30448) mapIsEmpty!30448))

(assert (= (and mapNonEmpty!30439 (not condMapEmpty!30448)) mapNonEmpty!30448))

(assert (= (and mapNonEmpty!30448 ((_ is ValueCellFull!9089) mapValue!30448)) b!913053))

(assert (= (and mapNonEmpty!30439 ((_ is ValueCellFull!9089) mapDefault!30448)) b!913054))

(declare-fun m!846871 () Bool)

(assert (=> mapNonEmpty!30448 m!846871))

(declare-fun b_lambda!13295 () Bool)

(assert (= b_lambda!13293 (or (and start!78214 b_free!16723) b_lambda!13295)))

(check-sat (not b!913015) (not d!112129) (not b!913009) (not bm!40368) (not b!912942) (not b!913006) (not b!913045) (not b!913032) (not bm!40392) (not b!912952) (not bm!40388) (not d!112121) tp_is_empty!19141 (not bm!40384) (not bm!40389) (not b!913000) (not b!912945) (not mapNonEmpty!30448) (not b!913005) (not b!912997) (not b!913004) (not b!912954) (not b!913030) (not b_next!16723) (not bm!40385) b_and!27279 (not b!913013) (not d!112119) (not b!913033) (not b!913040) (not b_lambda!13295))
(check-sat b_and!27279 (not b_next!16723))
