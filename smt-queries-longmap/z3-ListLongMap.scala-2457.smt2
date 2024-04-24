; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38546 () Bool)

(assert start!38546)

(declare-fun b_free!9097 () Bool)

(declare-fun b_next!9097 () Bool)

(assert (=> start!38546 (= b_free!9097 (not b_next!9097))))

(declare-fun tp!32414 () Bool)

(declare-fun b_and!16497 () Bool)

(assert (=> start!38546 (= tp!32414 b_and!16497)))

(declare-datatypes ((V!14411 0))(
  ( (V!14412 (val!5034 Int)) )
))
(declare-fun minValue!515 () V!14411)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!27939 () Bool)

(declare-datatypes ((ValueCell!4646 0))(
  ( (ValueCellFull!4646 (v!7282 V!14411)) (EmptyCell!4646) )
))
(declare-datatypes ((array!23848 0))(
  ( (array!23849 (arr!11373 (Array (_ BitVec 32) ValueCell!4646)) (size!11725 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23848)

(declare-fun zeroValue!515 () V!14411)

(declare-datatypes ((array!23850 0))(
  ( (array!23851 (arr!11374 (Array (_ BitVec 32) (_ BitVec 64))) (size!11726 (_ BitVec 32))) )
))
(declare-fun lt!187536 () array!23850)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun c!54579 () Bool)

(declare-datatypes ((tuple2!6526 0))(
  ( (tuple2!6527 (_1!3274 (_ BitVec 64)) (_2!3274 V!14411)) )
))
(declare-datatypes ((List!6446 0))(
  ( (Nil!6443) (Cons!6442 (h!7298 tuple2!6526) (t!11612 List!6446)) )
))
(declare-datatypes ((ListLongMap!5441 0))(
  ( (ListLongMap!5442 (toList!2736 List!6446)) )
))
(declare-fun call!27943 () ListLongMap!5441)

(declare-fun v!412 () V!14411)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!23850)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!996 (array!23850 array!23848 (_ BitVec 32) (_ BitVec 32) V!14411 V!14411 (_ BitVec 32) Int) ListLongMap!5441)

(assert (=> bm!27939 (= call!27943 (getCurrentListMapNoExtraKeys!996 (ite c!54579 lt!187536 _keys!709) (ite c!54579 (array!23849 (store (arr!11373 _values!549) i!563 (ValueCellFull!4646 v!412)) (size!11725 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!16590 () Bool)

(declare-fun mapRes!16590 () Bool)

(assert (=> mapIsEmpty!16590 mapRes!16590))

(declare-fun b!398883 () Bool)

(declare-fun res!229321 () Bool)

(declare-fun e!240991 () Bool)

(assert (=> b!398883 (=> (not res!229321) (not e!240991))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!398883 (= res!229321 (validKeyInArray!0 k0!794))))

(declare-fun res!229320 () Bool)

(assert (=> start!38546 (=> (not res!229320) (not e!240991))))

(assert (=> start!38546 (= res!229320 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11726 _keys!709))))))

(assert (=> start!38546 e!240991))

(declare-fun tp_is_empty!9979 () Bool)

(assert (=> start!38546 tp_is_empty!9979))

(assert (=> start!38546 tp!32414))

(assert (=> start!38546 true))

(declare-fun e!240993 () Bool)

(declare-fun array_inv!8398 (array!23848) Bool)

(assert (=> start!38546 (and (array_inv!8398 _values!549) e!240993)))

(declare-fun array_inv!8399 (array!23850) Bool)

(assert (=> start!38546 (array_inv!8399 _keys!709)))

(declare-fun b!398884 () Bool)

(declare-fun res!229324 () Bool)

(assert (=> b!398884 (=> (not res!229324) (not e!240991))))

(declare-datatypes ((List!6447 0))(
  ( (Nil!6444) (Cons!6443 (h!7299 (_ BitVec 64)) (t!11613 List!6447)) )
))
(declare-fun arrayNoDuplicates!0 (array!23850 (_ BitVec 32) List!6447) Bool)

(assert (=> b!398884 (= res!229324 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6444))))

(declare-fun b!398885 () Bool)

(declare-fun e!240990 () Bool)

(assert (=> b!398885 (= e!240993 (and e!240990 mapRes!16590))))

(declare-fun condMapEmpty!16590 () Bool)

(declare-fun mapDefault!16590 () ValueCell!4646)

(assert (=> b!398885 (= condMapEmpty!16590 (= (arr!11373 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4646)) mapDefault!16590)))))

(declare-fun b!398886 () Bool)

(assert (=> b!398886 (= e!240990 tp_is_empty!9979)))

(declare-fun b!398887 () Bool)

(declare-fun e!240988 () Bool)

(assert (=> b!398887 (= e!240988 tp_is_empty!9979)))

(declare-fun b!398888 () Bool)

(declare-fun res!229315 () Bool)

(assert (=> b!398888 (=> (not res!229315) (not e!240991))))

(assert (=> b!398888 (= res!229315 (or (= (select (arr!11374 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11374 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!398889 () Bool)

(declare-fun e!240994 () Bool)

(assert (=> b!398889 (= e!240994 (not true))))

(declare-fun e!240992 () Bool)

(assert (=> b!398889 e!240992))

(assert (=> b!398889 (= c!54579 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12061 0))(
  ( (Unit!12062) )
))
(declare-fun lt!187535 () Unit!12061)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!298 (array!23850 array!23848 (_ BitVec 32) (_ BitVec 32) V!14411 V!14411 (_ BitVec 32) (_ BitVec 64) V!14411 (_ BitVec 32) Int) Unit!12061)

(assert (=> b!398889 (= lt!187535 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!298 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398890 () Bool)

(assert (=> b!398890 (= e!240991 e!240994)))

(declare-fun res!229316 () Bool)

(assert (=> b!398890 (=> (not res!229316) (not e!240994))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23850 (_ BitVec 32)) Bool)

(assert (=> b!398890 (= res!229316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187536 mask!1025))))

(assert (=> b!398890 (= lt!187536 (array!23851 (store (arr!11374 _keys!709) i!563 k0!794) (size!11726 _keys!709)))))

(declare-fun b!398891 () Bool)

(declare-fun res!229318 () Bool)

(assert (=> b!398891 (=> (not res!229318) (not e!240991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398891 (= res!229318 (validMask!0 mask!1025))))

(declare-fun call!27942 () ListLongMap!5441)

(declare-fun bm!27940 () Bool)

(assert (=> bm!27940 (= call!27942 (getCurrentListMapNoExtraKeys!996 (ite c!54579 _keys!709 lt!187536) (ite c!54579 _values!549 (array!23849 (store (arr!11373 _values!549) i!563 (ValueCellFull!4646 v!412)) (size!11725 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398892 () Bool)

(declare-fun res!229325 () Bool)

(assert (=> b!398892 (=> (not res!229325) (not e!240991))))

(assert (=> b!398892 (= res!229325 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11726 _keys!709))))))

(declare-fun b!398893 () Bool)

(assert (=> b!398893 (= e!240992 (= call!27942 call!27943))))

(declare-fun b!398894 () Bool)

(declare-fun res!229322 () Bool)

(assert (=> b!398894 (=> (not res!229322) (not e!240991))))

(assert (=> b!398894 (= res!229322 (and (= (size!11725 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11726 _keys!709) (size!11725 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!16590 () Bool)

(declare-fun tp!32415 () Bool)

(assert (=> mapNonEmpty!16590 (= mapRes!16590 (and tp!32415 e!240988))))

(declare-fun mapRest!16590 () (Array (_ BitVec 32) ValueCell!4646))

(declare-fun mapValue!16590 () ValueCell!4646)

(declare-fun mapKey!16590 () (_ BitVec 32))

(assert (=> mapNonEmpty!16590 (= (arr!11373 _values!549) (store mapRest!16590 mapKey!16590 mapValue!16590))))

(declare-fun b!398895 () Bool)

(declare-fun +!1087 (ListLongMap!5441 tuple2!6526) ListLongMap!5441)

(assert (=> b!398895 (= e!240992 (= call!27943 (+!1087 call!27942 (tuple2!6527 k0!794 v!412))))))

(declare-fun b!398896 () Bool)

(declare-fun res!229317 () Bool)

(assert (=> b!398896 (=> (not res!229317) (not e!240991))))

(declare-fun arrayContainsKey!0 (array!23850 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!398896 (= res!229317 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!398897 () Bool)

(declare-fun res!229323 () Bool)

(assert (=> b!398897 (=> (not res!229323) (not e!240994))))

(assert (=> b!398897 (= res!229323 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11726 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!398898 () Bool)

(declare-fun res!229319 () Bool)

(assert (=> b!398898 (=> (not res!229319) (not e!240994))))

(assert (=> b!398898 (= res!229319 (arrayNoDuplicates!0 lt!187536 #b00000000000000000000000000000000 Nil!6444))))

(declare-fun b!398899 () Bool)

(declare-fun res!229326 () Bool)

(assert (=> b!398899 (=> (not res!229326) (not e!240991))))

(assert (=> b!398899 (= res!229326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!38546 res!229320) b!398891))

(assert (= (and b!398891 res!229318) b!398894))

(assert (= (and b!398894 res!229322) b!398899))

(assert (= (and b!398899 res!229326) b!398884))

(assert (= (and b!398884 res!229324) b!398892))

(assert (= (and b!398892 res!229325) b!398883))

(assert (= (and b!398883 res!229321) b!398888))

(assert (= (and b!398888 res!229315) b!398896))

(assert (= (and b!398896 res!229317) b!398890))

(assert (= (and b!398890 res!229316) b!398898))

(assert (= (and b!398898 res!229319) b!398897))

(assert (= (and b!398897 res!229323) b!398889))

(assert (= (and b!398889 c!54579) b!398895))

(assert (= (and b!398889 (not c!54579)) b!398893))

(assert (= (or b!398895 b!398893) bm!27939))

(assert (= (or b!398895 b!398893) bm!27940))

(assert (= (and b!398885 condMapEmpty!16590) mapIsEmpty!16590))

(assert (= (and b!398885 (not condMapEmpty!16590)) mapNonEmpty!16590))

(get-info :version)

(assert (= (and mapNonEmpty!16590 ((_ is ValueCellFull!4646) mapValue!16590)) b!398887))

(assert (= (and b!398885 ((_ is ValueCellFull!4646) mapDefault!16590)) b!398886))

(assert (= start!38546 b!398885))

(declare-fun m!393855 () Bool)

(assert (=> bm!27940 m!393855))

(declare-fun m!393857 () Bool)

(assert (=> bm!27940 m!393857))

(declare-fun m!393859 () Bool)

(assert (=> b!398898 m!393859))

(declare-fun m!393861 () Bool)

(assert (=> b!398888 m!393861))

(declare-fun m!393863 () Bool)

(assert (=> b!398899 m!393863))

(declare-fun m!393865 () Bool)

(assert (=> start!38546 m!393865))

(declare-fun m!393867 () Bool)

(assert (=> start!38546 m!393867))

(declare-fun m!393869 () Bool)

(assert (=> b!398895 m!393869))

(declare-fun m!393871 () Bool)

(assert (=> b!398896 m!393871))

(declare-fun m!393873 () Bool)

(assert (=> b!398883 m!393873))

(declare-fun m!393875 () Bool)

(assert (=> b!398890 m!393875))

(declare-fun m!393877 () Bool)

(assert (=> b!398890 m!393877))

(declare-fun m!393879 () Bool)

(assert (=> b!398891 m!393879))

(declare-fun m!393881 () Bool)

(assert (=> b!398884 m!393881))

(declare-fun m!393883 () Bool)

(assert (=> b!398889 m!393883))

(assert (=> bm!27939 m!393855))

(declare-fun m!393885 () Bool)

(assert (=> bm!27939 m!393885))

(declare-fun m!393887 () Bool)

(assert (=> mapNonEmpty!16590 m!393887))

(check-sat (not b!398891) (not b!398896) (not b!398895) (not b!398899) (not b!398883) (not b_next!9097) (not start!38546) (not b!398884) (not b!398890) (not mapNonEmpty!16590) (not b!398889) (not bm!27940) b_and!16497 (not bm!27939) (not b!398898) tp_is_empty!9979)
(check-sat b_and!16497 (not b_next!9097))
