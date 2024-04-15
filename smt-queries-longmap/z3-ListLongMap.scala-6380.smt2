; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81998 () Bool)

(assert start!81998)

(declare-fun b_free!18439 () Bool)

(declare-fun b_next!18439 () Bool)

(assert (=> start!81998 (= b_free!18439 (not b_next!18439))))

(declare-fun tp!64125 () Bool)

(declare-fun b_and!29899 () Bool)

(assert (=> start!81998 (= tp!64125 b_and!29899)))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((V!33057 0))(
  ( (V!33058 (val!10578 Int)) )
))
(declare-datatypes ((ValueCell!10046 0))(
  ( (ValueCellFull!10046 (v!13132 V!33057)) (EmptyCell!10046) )
))
(declare-datatypes ((array!58152 0))(
  ( (array!58153 (arr!27956 (Array (_ BitVec 32) ValueCell!10046)) (size!28437 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58152)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun e!538875 () Bool)

(declare-fun zeroValue!1139 () V!33057)

(declare-datatypes ((array!58154 0))(
  ( (array!58155 (arr!27957 (Array (_ BitVec 32) (_ BitVec 64))) (size!28438 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58154)

(declare-fun b!956294 () Bool)

(declare-fun minValue!1139 () V!33057)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13738 0))(
  ( (tuple2!13739 (_1!6880 (_ BitVec 64)) (_2!6880 V!33057)) )
))
(declare-datatypes ((List!19497 0))(
  ( (Nil!19494) (Cons!19493 (h!20655 tuple2!13738) (t!27849 List!19497)) )
))
(declare-datatypes ((ListLongMap!12425 0))(
  ( (ListLongMap!12426 (toList!6228 List!19497)) )
))
(declare-fun contains!5269 (ListLongMap!12425 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3390 (array!58154 array!58152 (_ BitVec 32) (_ BitVec 32) V!33057 V!33057 (_ BitVec 32) Int) ListLongMap!12425)

(assert (=> b!956294 (= e!538875 (not (contains!5269 (getCurrentListMap!3390 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27957 _keys!1441) i!735))))))

(declare-fun b!956295 () Bool)

(declare-fun res!640345 () Bool)

(assert (=> b!956295 (=> (not res!640345) (not e!538875))))

(assert (=> b!956295 (= res!640345 (and (= (size!28437 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28438 _keys!1441) (size!28437 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!956296 () Bool)

(declare-fun res!640341 () Bool)

(assert (=> b!956296 (=> (not res!640341) (not e!538875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58154 (_ BitVec 32)) Bool)

(assert (=> b!956296 (= res!640341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!956297 () Bool)

(declare-fun e!538871 () Bool)

(declare-fun e!538874 () Bool)

(declare-fun mapRes!33544 () Bool)

(assert (=> b!956297 (= e!538871 (and e!538874 mapRes!33544))))

(declare-fun condMapEmpty!33544 () Bool)

(declare-fun mapDefault!33544 () ValueCell!10046)

(assert (=> b!956297 (= condMapEmpty!33544 (= (arr!27956 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10046)) mapDefault!33544)))))

(declare-fun res!640344 () Bool)

(assert (=> start!81998 (=> (not res!640344) (not e!538875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81998 (= res!640344 (validMask!0 mask!1823))))

(assert (=> start!81998 e!538875))

(assert (=> start!81998 true))

(declare-fun tp_is_empty!21055 () Bool)

(assert (=> start!81998 tp_is_empty!21055))

(declare-fun array_inv!21751 (array!58154) Bool)

(assert (=> start!81998 (array_inv!21751 _keys!1441)))

(declare-fun array_inv!21752 (array!58152) Bool)

(assert (=> start!81998 (and (array_inv!21752 _values!1197) e!538871)))

(assert (=> start!81998 tp!64125))

(declare-fun b!956298 () Bool)

(declare-fun res!640342 () Bool)

(assert (=> b!956298 (=> (not res!640342) (not e!538875))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!956298 (= res!640342 (validKeyInArray!0 (select (arr!27957 _keys!1441) i!735)))))

(declare-fun b!956299 () Bool)

(declare-fun e!538873 () Bool)

(assert (=> b!956299 (= e!538873 tp_is_empty!21055)))

(declare-fun b!956300 () Bool)

(assert (=> b!956300 (= e!538874 tp_is_empty!21055)))

(declare-fun b!956301 () Bool)

(declare-fun res!640343 () Bool)

(assert (=> b!956301 (=> (not res!640343) (not e!538875))))

(declare-datatypes ((List!19498 0))(
  ( (Nil!19495) (Cons!19494 (h!20656 (_ BitVec 64)) (t!27850 List!19498)) )
))
(declare-fun arrayNoDuplicates!0 (array!58154 (_ BitVec 32) List!19498) Bool)

(assert (=> b!956301 (= res!640343 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19495))))

(declare-fun mapNonEmpty!33544 () Bool)

(declare-fun tp!64126 () Bool)

(assert (=> mapNonEmpty!33544 (= mapRes!33544 (and tp!64126 e!538873))))

(declare-fun mapKey!33544 () (_ BitVec 32))

(declare-fun mapRest!33544 () (Array (_ BitVec 32) ValueCell!10046))

(declare-fun mapValue!33544 () ValueCell!10046)

(assert (=> mapNonEmpty!33544 (= (arr!27956 _values!1197) (store mapRest!33544 mapKey!33544 mapValue!33544))))

(declare-fun mapIsEmpty!33544 () Bool)

(assert (=> mapIsEmpty!33544 mapRes!33544))

(declare-fun b!956302 () Bool)

(declare-fun res!640340 () Bool)

(assert (=> b!956302 (=> (not res!640340) (not e!538875))))

(assert (=> b!956302 (= res!640340 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28438 _keys!1441))))))

(assert (= (and start!81998 res!640344) b!956295))

(assert (= (and b!956295 res!640345) b!956296))

(assert (= (and b!956296 res!640341) b!956301))

(assert (= (and b!956301 res!640343) b!956302))

(assert (= (and b!956302 res!640340) b!956298))

(assert (= (and b!956298 res!640342) b!956294))

(assert (= (and b!956297 condMapEmpty!33544) mapIsEmpty!33544))

(assert (= (and b!956297 (not condMapEmpty!33544)) mapNonEmpty!33544))

(get-info :version)

(assert (= (and mapNonEmpty!33544 ((_ is ValueCellFull!10046) mapValue!33544)) b!956299))

(assert (= (and b!956297 ((_ is ValueCellFull!10046) mapDefault!33544)) b!956300))

(assert (= start!81998 b!956297))

(declare-fun m!887019 () Bool)

(assert (=> b!956298 m!887019))

(assert (=> b!956298 m!887019))

(declare-fun m!887021 () Bool)

(assert (=> b!956298 m!887021))

(declare-fun m!887023 () Bool)

(assert (=> mapNonEmpty!33544 m!887023))

(declare-fun m!887025 () Bool)

(assert (=> start!81998 m!887025))

(declare-fun m!887027 () Bool)

(assert (=> start!81998 m!887027))

(declare-fun m!887029 () Bool)

(assert (=> start!81998 m!887029))

(declare-fun m!887031 () Bool)

(assert (=> b!956294 m!887031))

(assert (=> b!956294 m!887019))

(assert (=> b!956294 m!887031))

(assert (=> b!956294 m!887019))

(declare-fun m!887033 () Bool)

(assert (=> b!956294 m!887033))

(declare-fun m!887035 () Bool)

(assert (=> b!956301 m!887035))

(declare-fun m!887037 () Bool)

(assert (=> b!956296 m!887037))

(check-sat (not b!956296) (not b_next!18439) (not b!956301) (not mapNonEmpty!33544) (not b!956294) tp_is_empty!21055 (not start!81998) (not b!956298) b_and!29899)
(check-sat b_and!29899 (not b_next!18439))
(get-model)

(declare-fun d!115641 () Bool)

(declare-fun e!538911 () Bool)

(assert (=> d!115641 e!538911))

(declare-fun res!640384 () Bool)

(assert (=> d!115641 (=> res!640384 e!538911)))

(declare-fun lt!429930 () Bool)

(assert (=> d!115641 (= res!640384 (not lt!429930))))

(declare-fun lt!429932 () Bool)

(assert (=> d!115641 (= lt!429930 lt!429932)))

(declare-datatypes ((Unit!32002 0))(
  ( (Unit!32003) )
))
(declare-fun lt!429933 () Unit!32002)

(declare-fun e!538910 () Unit!32002)

(assert (=> d!115641 (= lt!429933 e!538910)))

(declare-fun c!99804 () Bool)

(assert (=> d!115641 (= c!99804 lt!429932)))

(declare-fun containsKey!475 (List!19497 (_ BitVec 64)) Bool)

(assert (=> d!115641 (= lt!429932 (containsKey!475 (toList!6228 (getCurrentListMap!3390 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205)) (select (arr!27957 _keys!1441) i!735)))))

(assert (=> d!115641 (= (contains!5269 (getCurrentListMap!3390 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27957 _keys!1441) i!735)) lt!429930)))

(declare-fun b!956363 () Bool)

(declare-fun lt!429931 () Unit!32002)

(assert (=> b!956363 (= e!538910 lt!429931)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!370 (List!19497 (_ BitVec 64)) Unit!32002)

(assert (=> b!956363 (= lt!429931 (lemmaContainsKeyImpliesGetValueByKeyDefined!370 (toList!6228 (getCurrentListMap!3390 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205)) (select (arr!27957 _keys!1441) i!735)))))

(declare-datatypes ((Option!517 0))(
  ( (Some!516 (v!13135 V!33057)) (None!515) )
))
(declare-fun isDefined!383 (Option!517) Bool)

(declare-fun getValueByKey!511 (List!19497 (_ BitVec 64)) Option!517)

(assert (=> b!956363 (isDefined!383 (getValueByKey!511 (toList!6228 (getCurrentListMap!3390 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205)) (select (arr!27957 _keys!1441) i!735)))))

(declare-fun b!956364 () Bool)

(declare-fun Unit!32004 () Unit!32002)

(assert (=> b!956364 (= e!538910 Unit!32004)))

(declare-fun b!956365 () Bool)

(assert (=> b!956365 (= e!538911 (isDefined!383 (getValueByKey!511 (toList!6228 (getCurrentListMap!3390 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205)) (select (arr!27957 _keys!1441) i!735))))))

(assert (= (and d!115641 c!99804) b!956363))

(assert (= (and d!115641 (not c!99804)) b!956364))

(assert (= (and d!115641 (not res!640384)) b!956365))

(assert (=> d!115641 m!887019))

(declare-fun m!887079 () Bool)

(assert (=> d!115641 m!887079))

(assert (=> b!956363 m!887019))

(declare-fun m!887081 () Bool)

(assert (=> b!956363 m!887081))

(assert (=> b!956363 m!887019))

(declare-fun m!887083 () Bool)

(assert (=> b!956363 m!887083))

(assert (=> b!956363 m!887083))

(declare-fun m!887085 () Bool)

(assert (=> b!956363 m!887085))

(assert (=> b!956365 m!887019))

(assert (=> b!956365 m!887083))

(assert (=> b!956365 m!887083))

(assert (=> b!956365 m!887085))

(assert (=> b!956294 d!115641))

(declare-fun bm!41664 () Bool)

(declare-fun call!41668 () ListLongMap!12425)

(declare-fun call!41669 () ListLongMap!12425)

(declare-fun call!41667 () ListLongMap!12425)

(declare-fun c!99821 () Bool)

(declare-fun c!99818 () Bool)

(declare-fun call!41673 () ListLongMap!12425)

(declare-fun +!2892 (ListLongMap!12425 tuple2!13738) ListLongMap!12425)

(assert (=> bm!41664 (= call!41667 (+!2892 (ite c!99818 call!41668 (ite c!99821 call!41673 call!41669)) (ite (or c!99818 c!99821) (tuple2!13739 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1139) (tuple2!13739 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1139))))))

(declare-fun bm!41665 () Bool)

(declare-fun call!41672 () Bool)

(declare-fun lt!429979 () ListLongMap!12425)

(assert (=> bm!41665 (= call!41672 (contains!5269 lt!429979 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!956408 () Bool)

(declare-fun e!538941 () ListLongMap!12425)

(assert (=> b!956408 (= e!538941 call!41669)))

(declare-fun b!956409 () Bool)

(declare-fun res!640406 () Bool)

(declare-fun e!538946 () Bool)

(assert (=> b!956409 (=> (not res!640406) (not e!538946))))

(declare-fun e!538944 () Bool)

(assert (=> b!956409 (= res!640406 e!538944)))

(declare-fun res!640404 () Bool)

(assert (=> b!956409 (=> res!640404 e!538944)))

(declare-fun e!538942 () Bool)

(assert (=> b!956409 (= res!640404 (not e!538942))))

(declare-fun res!640407 () Bool)

(assert (=> b!956409 (=> (not res!640407) (not e!538942))))

(assert (=> b!956409 (= res!640407 (bvslt i!735 (size!28438 _keys!1441)))))

(declare-fun b!956411 () Bool)

(declare-fun e!538949 () Bool)

(declare-fun apply!882 (ListLongMap!12425 (_ BitVec 64)) V!33057)

(assert (=> b!956411 (= e!538949 (= (apply!882 lt!429979 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1139))))

(declare-fun b!956412 () Bool)

(declare-fun e!538945 () Unit!32002)

(declare-fun Unit!32005 () Unit!32002)

(assert (=> b!956412 (= e!538945 Unit!32005)))

(declare-fun b!956413 () Bool)

(declare-fun e!538940 () Bool)

(assert (=> b!956413 (= e!538944 e!538940)))

(declare-fun res!640410 () Bool)

(assert (=> b!956413 (=> (not res!640410) (not e!538940))))

(assert (=> b!956413 (= res!640410 (contains!5269 lt!429979 (select (arr!27957 _keys!1441) i!735)))))

(assert (=> b!956413 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28438 _keys!1441)))))

(declare-fun b!956414 () Bool)

(assert (=> b!956414 (= e!538942 (validKeyInArray!0 (select (arr!27957 _keys!1441) i!735)))))

(declare-fun b!956415 () Bool)

(declare-fun e!538948 () Bool)

(assert (=> b!956415 (= e!538946 e!538948)))

(declare-fun c!99817 () Bool)

(assert (=> b!956415 (= c!99817 (not (= (bvand extraKeys!1118 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41666 () Bool)

(declare-fun call!41670 () Bool)

(assert (=> bm!41666 (= call!41670 (contains!5269 lt!429979 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!956416 () Bool)

(declare-fun lt!429985 () Unit!32002)

(assert (=> b!956416 (= e!538945 lt!429985)))

(declare-fun lt!429996 () ListLongMap!12425)

(declare-fun getCurrentListMapNoExtraKeys!3364 (array!58154 array!58152 (_ BitVec 32) (_ BitVec 32) V!33057 V!33057 (_ BitVec 32) Int) ListLongMap!12425)

(assert (=> b!956416 (= lt!429996 (getCurrentListMapNoExtraKeys!3364 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205))))

(declare-fun lt!429994 () (_ BitVec 64))

(assert (=> b!956416 (= lt!429994 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429984 () (_ BitVec 64))

(assert (=> b!956416 (= lt!429984 (select (arr!27957 _keys!1441) i!735))))

(declare-fun lt!429993 () Unit!32002)

(declare-fun addStillContains!581 (ListLongMap!12425 (_ BitVec 64) V!33057 (_ BitVec 64)) Unit!32002)

(assert (=> b!956416 (= lt!429993 (addStillContains!581 lt!429996 lt!429994 zeroValue!1139 lt!429984))))

(assert (=> b!956416 (contains!5269 (+!2892 lt!429996 (tuple2!13739 lt!429994 zeroValue!1139)) lt!429984)))

(declare-fun lt!429997 () Unit!32002)

(assert (=> b!956416 (= lt!429997 lt!429993)))

(declare-fun lt!429991 () ListLongMap!12425)

(assert (=> b!956416 (= lt!429991 (getCurrentListMapNoExtraKeys!3364 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205))))

(declare-fun lt!429998 () (_ BitVec 64))

(assert (=> b!956416 (= lt!429998 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429981 () (_ BitVec 64))

(assert (=> b!956416 (= lt!429981 (select (arr!27957 _keys!1441) i!735))))

(declare-fun lt!429978 () Unit!32002)

(declare-fun addApplyDifferent!461 (ListLongMap!12425 (_ BitVec 64) V!33057 (_ BitVec 64)) Unit!32002)

(assert (=> b!956416 (= lt!429978 (addApplyDifferent!461 lt!429991 lt!429998 minValue!1139 lt!429981))))

(assert (=> b!956416 (= (apply!882 (+!2892 lt!429991 (tuple2!13739 lt!429998 minValue!1139)) lt!429981) (apply!882 lt!429991 lt!429981))))

(declare-fun lt!429986 () Unit!32002)

(assert (=> b!956416 (= lt!429986 lt!429978)))

(declare-fun lt!429999 () ListLongMap!12425)

(assert (=> b!956416 (= lt!429999 (getCurrentListMapNoExtraKeys!3364 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205))))

(declare-fun lt!429987 () (_ BitVec 64))

(assert (=> b!956416 (= lt!429987 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429983 () (_ BitVec 64))

(assert (=> b!956416 (= lt!429983 (select (arr!27957 _keys!1441) i!735))))

(declare-fun lt!429982 () Unit!32002)

(assert (=> b!956416 (= lt!429982 (addApplyDifferent!461 lt!429999 lt!429987 zeroValue!1139 lt!429983))))

(assert (=> b!956416 (= (apply!882 (+!2892 lt!429999 (tuple2!13739 lt!429987 zeroValue!1139)) lt!429983) (apply!882 lt!429999 lt!429983))))

(declare-fun lt!429990 () Unit!32002)

(assert (=> b!956416 (= lt!429990 lt!429982)))

(declare-fun lt!429989 () ListLongMap!12425)

(assert (=> b!956416 (= lt!429989 (getCurrentListMapNoExtraKeys!3364 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205))))

(declare-fun lt!429995 () (_ BitVec 64))

(assert (=> b!956416 (= lt!429995 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429992 () (_ BitVec 64))

(assert (=> b!956416 (= lt!429992 (select (arr!27957 _keys!1441) i!735))))

(assert (=> b!956416 (= lt!429985 (addApplyDifferent!461 lt!429989 lt!429995 minValue!1139 lt!429992))))

(assert (=> b!956416 (= (apply!882 (+!2892 lt!429989 (tuple2!13739 lt!429995 minValue!1139)) lt!429992) (apply!882 lt!429989 lt!429992))))

(declare-fun d!115643 () Bool)

(assert (=> d!115643 e!538946))

(declare-fun res!640403 () Bool)

(assert (=> d!115643 (=> (not res!640403) (not e!538946))))

(assert (=> d!115643 (= res!640403 (or (bvsge i!735 (size!28438 _keys!1441)) (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28438 _keys!1441)))))))

(declare-fun lt!429988 () ListLongMap!12425)

(assert (=> d!115643 (= lt!429979 lt!429988)))

(declare-fun lt!429980 () Unit!32002)

(assert (=> d!115643 (= lt!429980 e!538945)))

(declare-fun c!99822 () Bool)

(declare-fun e!538950 () Bool)

(assert (=> d!115643 (= c!99822 e!538950)))

(declare-fun res!640408 () Bool)

(assert (=> d!115643 (=> (not res!640408) (not e!538950))))

(assert (=> d!115643 (= res!640408 (bvslt i!735 (size!28438 _keys!1441)))))

(declare-fun e!538947 () ListLongMap!12425)

(assert (=> d!115643 (= lt!429988 e!538947)))

(assert (=> d!115643 (= c!99818 (and (not (= (bvand extraKeys!1118 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1118 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115643 (validMask!0 mask!1823)))

(assert (=> d!115643 (= (getCurrentListMap!3390 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) lt!429979)))

(declare-fun b!956410 () Bool)

(declare-fun e!538938 () Bool)

(assert (=> b!956410 (= e!538938 (not call!41672))))

(declare-fun bm!41667 () Bool)

(declare-fun call!41671 () ListLongMap!12425)

(assert (=> bm!41667 (= call!41671 call!41667)))

(declare-fun b!956417 () Bool)

(assert (=> b!956417 (= e!538950 (validKeyInArray!0 (select (arr!27957 _keys!1441) i!735)))))

(declare-fun b!956418 () Bool)

(assert (=> b!956418 (= e!538948 e!538949)))

(declare-fun res!640409 () Bool)

(assert (=> b!956418 (= res!640409 call!41670)))

(assert (=> b!956418 (=> (not res!640409) (not e!538949))))

(declare-fun b!956419 () Bool)

(declare-fun e!538939 () Bool)

(assert (=> b!956419 (= e!538938 e!538939)))

(declare-fun res!640411 () Bool)

(assert (=> b!956419 (= res!640411 call!41672)))

(assert (=> b!956419 (=> (not res!640411) (not e!538939))))

(declare-fun b!956420 () Bool)

(declare-fun e!538943 () ListLongMap!12425)

(assert (=> b!956420 (= e!538947 e!538943)))

(assert (=> b!956420 (= c!99821 (and (not (= (bvand extraKeys!1118 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1118 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41668 () Bool)

(assert (=> bm!41668 (= call!41673 call!41668)))

(declare-fun b!956421 () Bool)

(assert (=> b!956421 (= e!538948 (not call!41670))))

(declare-fun bm!41669 () Bool)

(assert (=> bm!41669 (= call!41669 call!41673)))

(declare-fun b!956422 () Bool)

(assert (=> b!956422 (= e!538947 (+!2892 call!41667 (tuple2!13739 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1139)))))

(declare-fun b!956423 () Bool)

(declare-fun c!99820 () Bool)

(assert (=> b!956423 (= c!99820 (and (not (= (bvand extraKeys!1118 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1118 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!956423 (= e!538943 e!538941)))

(declare-fun b!956424 () Bool)

(assert (=> b!956424 (= e!538943 call!41671)))

(declare-fun b!956425 () Bool)

(assert (=> b!956425 (= e!538941 call!41671)))

(declare-fun b!956426 () Bool)

(declare-fun get!14663 (ValueCell!10046 V!33057) V!33057)

(declare-fun dynLambda!1648 (Int (_ BitVec 64)) V!33057)

(assert (=> b!956426 (= e!538940 (= (apply!882 lt!429979 (select (arr!27957 _keys!1441) i!735)) (get!14663 (select (arr!27956 _values!1197) i!735) (dynLambda!1648 defaultEntry!1205 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!956426 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28437 _values!1197)))))

(assert (=> b!956426 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28438 _keys!1441)))))

(declare-fun bm!41670 () Bool)

(assert (=> bm!41670 (= call!41668 (getCurrentListMapNoExtraKeys!3364 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205))))

(declare-fun b!956427 () Bool)

(assert (=> b!956427 (= e!538939 (= (apply!882 lt!429979 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1139))))

(declare-fun b!956428 () Bool)

(declare-fun res!640405 () Bool)

(assert (=> b!956428 (=> (not res!640405) (not e!538946))))

(assert (=> b!956428 (= res!640405 e!538938)))

(declare-fun c!99819 () Bool)

(assert (=> b!956428 (= c!99819 (not (= (bvand extraKeys!1118 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!115643 c!99818) b!956422))

(assert (= (and d!115643 (not c!99818)) b!956420))

(assert (= (and b!956420 c!99821) b!956424))

(assert (= (and b!956420 (not c!99821)) b!956423))

(assert (= (and b!956423 c!99820) b!956425))

(assert (= (and b!956423 (not c!99820)) b!956408))

(assert (= (or b!956425 b!956408) bm!41669))

(assert (= (or b!956424 bm!41669) bm!41668))

(assert (= (or b!956424 b!956425) bm!41667))

(assert (= (or b!956422 bm!41668) bm!41670))

(assert (= (or b!956422 bm!41667) bm!41664))

(assert (= (and d!115643 res!640408) b!956417))

(assert (= (and d!115643 c!99822) b!956416))

(assert (= (and d!115643 (not c!99822)) b!956412))

(assert (= (and d!115643 res!640403) b!956409))

(assert (= (and b!956409 res!640407) b!956414))

(assert (= (and b!956409 (not res!640404)) b!956413))

(assert (= (and b!956413 res!640410) b!956426))

(assert (= (and b!956409 res!640406) b!956428))

(assert (= (and b!956428 c!99819) b!956419))

(assert (= (and b!956428 (not c!99819)) b!956410))

(assert (= (and b!956419 res!640411) b!956427))

(assert (= (or b!956419 b!956410) bm!41665))

(assert (= (and b!956428 res!640405) b!956415))

(assert (= (and b!956415 c!99817) b!956418))

(assert (= (and b!956415 (not c!99817)) b!956421))

(assert (= (and b!956418 res!640409) b!956411))

(assert (= (or b!956418 b!956421) bm!41666))

(declare-fun b_lambda!14409 () Bool)

(assert (=> (not b_lambda!14409) (not b!956426)))

(declare-fun t!27856 () Bool)

(declare-fun tb!6205 () Bool)

(assert (=> (and start!81998 (= defaultEntry!1205 defaultEntry!1205) t!27856) tb!6205))

(declare-fun result!12363 () Bool)

(assert (=> tb!6205 (= result!12363 tp_is_empty!21055)))

(assert (=> b!956426 t!27856))

(declare-fun b_and!29905 () Bool)

(assert (= b_and!29899 (and (=> t!27856 result!12363) b_and!29905)))

(declare-fun m!887087 () Bool)

(assert (=> bm!41666 m!887087))

(declare-fun m!887089 () Bool)

(assert (=> b!956416 m!887089))

(declare-fun m!887091 () Bool)

(assert (=> b!956416 m!887091))

(declare-fun m!887093 () Bool)

(assert (=> b!956416 m!887093))

(declare-fun m!887095 () Bool)

(assert (=> b!956416 m!887095))

(declare-fun m!887097 () Bool)

(assert (=> b!956416 m!887097))

(declare-fun m!887099 () Bool)

(assert (=> b!956416 m!887099))

(declare-fun m!887101 () Bool)

(assert (=> b!956416 m!887101))

(assert (=> b!956416 m!887093))

(declare-fun m!887103 () Bool)

(assert (=> b!956416 m!887103))

(declare-fun m!887105 () Bool)

(assert (=> b!956416 m!887105))

(declare-fun m!887107 () Bool)

(assert (=> b!956416 m!887107))

(declare-fun m!887109 () Bool)

(assert (=> b!956416 m!887109))

(assert (=> b!956416 m!887019))

(declare-fun m!887111 () Bool)

(assert (=> b!956416 m!887111))

(declare-fun m!887113 () Bool)

(assert (=> b!956416 m!887113))

(assert (=> b!956416 m!887101))

(declare-fun m!887115 () Bool)

(assert (=> b!956416 m!887115))

(assert (=> b!956416 m!887111))

(declare-fun m!887117 () Bool)

(assert (=> b!956416 m!887117))

(declare-fun m!887119 () Bool)

(assert (=> b!956416 m!887119))

(assert (=> b!956416 m!887097))

(declare-fun m!887121 () Bool)

(assert (=> b!956427 m!887121))

(assert (=> d!115643 m!887025))

(assert (=> b!956426 m!887019))

(declare-fun m!887123 () Bool)

(assert (=> b!956426 m!887123))

(declare-fun m!887125 () Bool)

(assert (=> b!956426 m!887125))

(declare-fun m!887127 () Bool)

(assert (=> b!956426 m!887127))

(declare-fun m!887129 () Bool)

(assert (=> b!956426 m!887129))

(assert (=> b!956426 m!887127))

(assert (=> b!956426 m!887019))

(assert (=> b!956426 m!887125))

(declare-fun m!887131 () Bool)

(assert (=> bm!41664 m!887131))

(declare-fun m!887133 () Bool)

(assert (=> b!956411 m!887133))

(declare-fun m!887135 () Bool)

(assert (=> b!956422 m!887135))

(assert (=> b!956417 m!887019))

(assert (=> b!956417 m!887019))

(assert (=> b!956417 m!887021))

(declare-fun m!887137 () Bool)

(assert (=> bm!41665 m!887137))

(assert (=> b!956414 m!887019))

(assert (=> b!956414 m!887019))

(assert (=> b!956414 m!887021))

(assert (=> bm!41670 m!887095))

(assert (=> b!956413 m!887019))

(assert (=> b!956413 m!887019))

(declare-fun m!887139 () Bool)

(assert (=> b!956413 m!887139))

(assert (=> b!956294 d!115643))

(declare-fun d!115645 () Bool)

(assert (=> d!115645 (= (validKeyInArray!0 (select (arr!27957 _keys!1441) i!735)) (and (not (= (select (arr!27957 _keys!1441) i!735) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27957 _keys!1441) i!735) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!956298 d!115645))

(declare-fun d!115647 () Bool)

(assert (=> d!115647 (= (validMask!0 mask!1823) (and (or (= mask!1823 #b00000000000000000000000000000111) (= mask!1823 #b00000000000000000000000000001111) (= mask!1823 #b00000000000000000000000000011111) (= mask!1823 #b00000000000000000000000000111111) (= mask!1823 #b00000000000000000000000001111111) (= mask!1823 #b00000000000000000000000011111111) (= mask!1823 #b00000000000000000000000111111111) (= mask!1823 #b00000000000000000000001111111111) (= mask!1823 #b00000000000000000000011111111111) (= mask!1823 #b00000000000000000000111111111111) (= mask!1823 #b00000000000000000001111111111111) (= mask!1823 #b00000000000000000011111111111111) (= mask!1823 #b00000000000000000111111111111111) (= mask!1823 #b00000000000000001111111111111111) (= mask!1823 #b00000000000000011111111111111111) (= mask!1823 #b00000000000000111111111111111111) (= mask!1823 #b00000000000001111111111111111111) (= mask!1823 #b00000000000011111111111111111111) (= mask!1823 #b00000000000111111111111111111111) (= mask!1823 #b00000000001111111111111111111111) (= mask!1823 #b00000000011111111111111111111111) (= mask!1823 #b00000000111111111111111111111111) (= mask!1823 #b00000001111111111111111111111111) (= mask!1823 #b00000011111111111111111111111111) (= mask!1823 #b00000111111111111111111111111111) (= mask!1823 #b00001111111111111111111111111111) (= mask!1823 #b00011111111111111111111111111111) (= mask!1823 #b00111111111111111111111111111111)) (bvsle mask!1823 #b00111111111111111111111111111111)))))

(assert (=> start!81998 d!115647))

(declare-fun d!115649 () Bool)

(assert (=> d!115649 (= (array_inv!21751 _keys!1441) (bvsge (size!28438 _keys!1441) #b00000000000000000000000000000000))))

(assert (=> start!81998 d!115649))

(declare-fun d!115651 () Bool)

(assert (=> d!115651 (= (array_inv!21752 _values!1197) (bvsge (size!28437 _values!1197) #b00000000000000000000000000000000))))

(assert (=> start!81998 d!115651))

(declare-fun d!115653 () Bool)

(declare-fun res!640419 () Bool)

(declare-fun e!538962 () Bool)

(assert (=> d!115653 (=> res!640419 e!538962)))

(assert (=> d!115653 (= res!640419 (bvsge #b00000000000000000000000000000000 (size!28438 _keys!1441)))))

(assert (=> d!115653 (= (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19495) e!538962)))

(declare-fun b!956441 () Bool)

(declare-fun e!538961 () Bool)

(assert (=> b!956441 (= e!538962 e!538961)))

(declare-fun res!640420 () Bool)

(assert (=> b!956441 (=> (not res!640420) (not e!538961))))

(declare-fun e!538959 () Bool)

(assert (=> b!956441 (= res!640420 (not e!538959))))

(declare-fun res!640418 () Bool)

(assert (=> b!956441 (=> (not res!640418) (not e!538959))))

(assert (=> b!956441 (= res!640418 (validKeyInArray!0 (select (arr!27957 _keys!1441) #b00000000000000000000000000000000)))))

(declare-fun b!956442 () Bool)

(declare-fun e!538960 () Bool)

(declare-fun call!41676 () Bool)

(assert (=> b!956442 (= e!538960 call!41676)))

(declare-fun b!956443 () Bool)

(assert (=> b!956443 (= e!538960 call!41676)))

(declare-fun b!956444 () Bool)

(assert (=> b!956444 (= e!538961 e!538960)))

(declare-fun c!99825 () Bool)

(assert (=> b!956444 (= c!99825 (validKeyInArray!0 (select (arr!27957 _keys!1441) #b00000000000000000000000000000000)))))

(declare-fun b!956445 () Bool)

(declare-fun contains!5272 (List!19498 (_ BitVec 64)) Bool)

(assert (=> b!956445 (= e!538959 (contains!5272 Nil!19495 (select (arr!27957 _keys!1441) #b00000000000000000000000000000000)))))

(declare-fun bm!41673 () Bool)

(assert (=> bm!41673 (= call!41676 (arrayNoDuplicates!0 _keys!1441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!99825 (Cons!19494 (select (arr!27957 _keys!1441) #b00000000000000000000000000000000) Nil!19495) Nil!19495)))))

(assert (= (and d!115653 (not res!640419)) b!956441))

(assert (= (and b!956441 res!640418) b!956445))

(assert (= (and b!956441 res!640420) b!956444))

(assert (= (and b!956444 c!99825) b!956442))

(assert (= (and b!956444 (not c!99825)) b!956443))

(assert (= (or b!956442 b!956443) bm!41673))

(declare-fun m!887141 () Bool)

(assert (=> b!956441 m!887141))

(assert (=> b!956441 m!887141))

(declare-fun m!887143 () Bool)

(assert (=> b!956441 m!887143))

(assert (=> b!956444 m!887141))

(assert (=> b!956444 m!887141))

(assert (=> b!956444 m!887143))

(assert (=> b!956445 m!887141))

(assert (=> b!956445 m!887141))

(declare-fun m!887145 () Bool)

(assert (=> b!956445 m!887145))

(assert (=> bm!41673 m!887141))

(declare-fun m!887147 () Bool)

(assert (=> bm!41673 m!887147))

(assert (=> b!956301 d!115653))

(declare-fun b!956454 () Bool)

(declare-fun e!538971 () Bool)

(declare-fun call!41679 () Bool)

(assert (=> b!956454 (= e!538971 call!41679)))

(declare-fun d!115655 () Bool)

(declare-fun res!640426 () Bool)

(declare-fun e!538969 () Bool)

(assert (=> d!115655 (=> res!640426 e!538969)))

(assert (=> d!115655 (= res!640426 (bvsge #b00000000000000000000000000000000 (size!28438 _keys!1441)))))

(assert (=> d!115655 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823) e!538969)))

(declare-fun b!956455 () Bool)

(declare-fun e!538970 () Bool)

(assert (=> b!956455 (= e!538970 call!41679)))

(declare-fun b!956456 () Bool)

(assert (=> b!956456 (= e!538969 e!538971)))

(declare-fun c!99828 () Bool)

(assert (=> b!956456 (= c!99828 (validKeyInArray!0 (select (arr!27957 _keys!1441) #b00000000000000000000000000000000)))))

(declare-fun b!956457 () Bool)

(assert (=> b!956457 (= e!538971 e!538970)))

(declare-fun lt!430008 () (_ BitVec 64))

(assert (=> b!956457 (= lt!430008 (select (arr!27957 _keys!1441) #b00000000000000000000000000000000))))

(declare-fun lt!430006 () Unit!32002)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!58154 (_ BitVec 64) (_ BitVec 32)) Unit!32002)

(assert (=> b!956457 (= lt!430006 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1441 lt!430008 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!58154 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!956457 (arrayContainsKey!0 _keys!1441 lt!430008 #b00000000000000000000000000000000)))

(declare-fun lt!430007 () Unit!32002)

(assert (=> b!956457 (= lt!430007 lt!430006)))

(declare-fun res!640425 () Bool)

(declare-datatypes ((SeekEntryResult!9183 0))(
  ( (MissingZero!9183 (index!39103 (_ BitVec 32))) (Found!9183 (index!39104 (_ BitVec 32))) (Intermediate!9183 (undefined!9995 Bool) (index!39105 (_ BitVec 32)) (x!82422 (_ BitVec 32))) (Undefined!9183) (MissingVacant!9183 (index!39106 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!58154 (_ BitVec 32)) SeekEntryResult!9183)

(assert (=> b!956457 (= res!640425 (= (seekEntryOrOpen!0 (select (arr!27957 _keys!1441) #b00000000000000000000000000000000) _keys!1441 mask!1823) (Found!9183 #b00000000000000000000000000000000)))))

(assert (=> b!956457 (=> (not res!640425) (not e!538970))))

(declare-fun bm!41676 () Bool)

(assert (=> bm!41676 (= call!41679 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1441 mask!1823))))

(assert (= (and d!115655 (not res!640426)) b!956456))

(assert (= (and b!956456 c!99828) b!956457))

(assert (= (and b!956456 (not c!99828)) b!956454))

(assert (= (and b!956457 res!640425) b!956455))

(assert (= (or b!956455 b!956454) bm!41676))

(assert (=> b!956456 m!887141))

(assert (=> b!956456 m!887141))

(assert (=> b!956456 m!887143))

(assert (=> b!956457 m!887141))

(declare-fun m!887149 () Bool)

(assert (=> b!956457 m!887149))

(declare-fun m!887151 () Bool)

(assert (=> b!956457 m!887151))

(assert (=> b!956457 m!887141))

(declare-fun m!887153 () Bool)

(assert (=> b!956457 m!887153))

(declare-fun m!887155 () Bool)

(assert (=> bm!41676 m!887155))

(assert (=> b!956296 d!115655))

(declare-fun mapIsEmpty!33553 () Bool)

(declare-fun mapRes!33553 () Bool)

(assert (=> mapIsEmpty!33553 mapRes!33553))

(declare-fun b!956465 () Bool)

(declare-fun e!538976 () Bool)

(assert (=> b!956465 (= e!538976 tp_is_empty!21055)))

(declare-fun mapNonEmpty!33553 () Bool)

(declare-fun tp!64141 () Bool)

(declare-fun e!538977 () Bool)

(assert (=> mapNonEmpty!33553 (= mapRes!33553 (and tp!64141 e!538977))))

(declare-fun mapValue!33553 () ValueCell!10046)

(declare-fun mapKey!33553 () (_ BitVec 32))

(declare-fun mapRest!33553 () (Array (_ BitVec 32) ValueCell!10046))

(assert (=> mapNonEmpty!33553 (= mapRest!33544 (store mapRest!33553 mapKey!33553 mapValue!33553))))

(declare-fun b!956464 () Bool)

(assert (=> b!956464 (= e!538977 tp_is_empty!21055)))

(declare-fun condMapEmpty!33553 () Bool)

(declare-fun mapDefault!33553 () ValueCell!10046)

(assert (=> mapNonEmpty!33544 (= condMapEmpty!33553 (= mapRest!33544 ((as const (Array (_ BitVec 32) ValueCell!10046)) mapDefault!33553)))))

(assert (=> mapNonEmpty!33544 (= tp!64126 (and e!538976 mapRes!33553))))

(assert (= (and mapNonEmpty!33544 condMapEmpty!33553) mapIsEmpty!33553))

(assert (= (and mapNonEmpty!33544 (not condMapEmpty!33553)) mapNonEmpty!33553))

(assert (= (and mapNonEmpty!33553 ((_ is ValueCellFull!10046) mapValue!33553)) b!956464))

(assert (= (and mapNonEmpty!33544 ((_ is ValueCellFull!10046) mapDefault!33553)) b!956465))

(declare-fun m!887157 () Bool)

(assert (=> mapNonEmpty!33553 m!887157))

(declare-fun b_lambda!14411 () Bool)

(assert (= b_lambda!14409 (or (and start!81998 b_free!18439) b_lambda!14411)))

(check-sat (not b!956363) (not b!956365) (not b!956411) b_and!29905 (not bm!41664) (not b!956422) (not d!115643) (not bm!41665) tp_is_empty!21055 (not mapNonEmpty!33553) (not b!956417) (not b!956445) (not b_next!18439) (not b!956427) (not b!956441) (not bm!41676) (not b_lambda!14411) (not b!956426) (not bm!41666) (not b!956413) (not b!956456) (not bm!41670) (not b!956457) (not b!956416) (not bm!41673) (not d!115641) (not b!956444) (not b!956414))
(check-sat b_and!29905 (not b_next!18439))
