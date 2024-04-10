; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34000 () Bool)

(assert start!34000)

(declare-fun b_free!7131 () Bool)

(declare-fun b_next!7131 () Bool)

(assert (=> start!34000 (= b_free!7131 (not b_next!7131))))

(declare-fun tp!24912 () Bool)

(declare-fun b_and!14321 () Bool)

(assert (=> start!34000 (= tp!24912 b_and!14321)))

(declare-fun b!338846 () Bool)

(declare-fun e!207896 () Bool)

(declare-fun e!207898 () Bool)

(declare-fun mapRes!12036 () Bool)

(assert (=> b!338846 (= e!207896 (and e!207898 mapRes!12036))))

(declare-fun condMapEmpty!12036 () Bool)

(declare-datatypes ((V!10421 0))(
  ( (V!10422 (val!3586 Int)) )
))
(declare-datatypes ((ValueCell!3198 0))(
  ( (ValueCellFull!3198 (v!5753 V!10421)) (EmptyCell!3198) )
))
(declare-datatypes ((array!17761 0))(
  ( (array!17762 (arr!8406 (Array (_ BitVec 32) ValueCell!3198)) (size!8758 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17761)

(declare-fun mapDefault!12036 () ValueCell!3198)

(assert (=> b!338846 (= condMapEmpty!12036 (= (arr!8406 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3198)) mapDefault!12036)))))

(declare-fun b!338847 () Bool)

(declare-fun res!187194 () Bool)

(declare-fun e!207894 () Bool)

(assert (=> b!338847 (=> (not res!187194) (not e!207894))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10421)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10421)

(declare-datatypes ((array!17763 0))(
  ( (array!17764 (arr!8407 (Array (_ BitVec 32) (_ BitVec 64))) (size!8759 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17763)

(declare-datatypes ((tuple2!5208 0))(
  ( (tuple2!5209 (_1!2615 (_ BitVec 64)) (_2!2615 V!10421)) )
))
(declare-datatypes ((List!4824 0))(
  ( (Nil!4821) (Cons!4820 (h!5676 tuple2!5208) (t!9922 List!4824)) )
))
(declare-datatypes ((ListLongMap!4121 0))(
  ( (ListLongMap!4122 (toList!2076 List!4824)) )
))
(declare-fun contains!2125 (ListLongMap!4121 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1597 (array!17763 array!17761 (_ BitVec 32) (_ BitVec 32) V!10421 V!10421 (_ BitVec 32) Int) ListLongMap!4121)

(assert (=> b!338847 (= res!187194 (not (contains!2125 (getCurrentListMap!1597 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!338848 () Bool)

(declare-fun res!187190 () Bool)

(assert (=> b!338848 (=> (not res!187190) (not e!207894))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17763 (_ BitVec 32)) Bool)

(assert (=> b!338848 (= res!187190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!338849 () Bool)

(declare-fun res!187191 () Bool)

(assert (=> b!338849 (=> (not res!187191) (not e!207894))))

(declare-datatypes ((List!4825 0))(
  ( (Nil!4822) (Cons!4821 (h!5677 (_ BitVec 64)) (t!9923 List!4825)) )
))
(declare-fun arrayNoDuplicates!0 (array!17763 (_ BitVec 32) List!4825) Bool)

(assert (=> b!338849 (= res!187191 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4822))))

(declare-fun mapNonEmpty!12036 () Bool)

(declare-fun tp!24911 () Bool)

(declare-fun e!207893 () Bool)

(assert (=> mapNonEmpty!12036 (= mapRes!12036 (and tp!24911 e!207893))))

(declare-fun mapRest!12036 () (Array (_ BitVec 32) ValueCell!3198))

(declare-fun mapValue!12036 () ValueCell!3198)

(declare-fun mapKey!12036 () (_ BitVec 32))

(assert (=> mapNonEmpty!12036 (= (arr!8406 _values!1525) (store mapRest!12036 mapKey!12036 mapValue!12036))))

(declare-fun b!338850 () Bool)

(declare-fun e!207899 () Bool)

(declare-fun e!207895 () Bool)

(assert (=> b!338850 (= e!207899 e!207895)))

(declare-fun res!187192 () Bool)

(assert (=> b!338850 (=> (not res!187192) (not e!207895))))

(declare-fun lt!160920 () Bool)

(assert (=> b!338850 (= res!187192 (not lt!160920))))

(declare-datatypes ((Unit!10541 0))(
  ( (Unit!10542) )
))
(declare-fun lt!160921 () Unit!10541)

(declare-fun e!207897 () Unit!10541)

(assert (=> b!338850 (= lt!160921 e!207897)))

(declare-fun c!52458 () Bool)

(assert (=> b!338850 (= c!52458 lt!160920)))

(declare-fun arrayContainsKey!0 (array!17763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!338850 (= lt!160920 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun res!187188 () Bool)

(assert (=> start!34000 (=> (not res!187188) (not e!207894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34000 (= res!187188 (validMask!0 mask!2385))))

(assert (=> start!34000 e!207894))

(assert (=> start!34000 true))

(declare-fun tp_is_empty!7083 () Bool)

(assert (=> start!34000 tp_is_empty!7083))

(assert (=> start!34000 tp!24912))

(declare-fun array_inv!6232 (array!17761) Bool)

(assert (=> start!34000 (and (array_inv!6232 _values!1525) e!207896)))

(declare-fun array_inv!6233 (array!17763) Bool)

(assert (=> start!34000 (array_inv!6233 _keys!1895)))

(declare-fun b!338851 () Bool)

(declare-fun res!187196 () Bool)

(assert (=> b!338851 (=> (not res!187196) (not e!207894))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!338851 (= res!187196 (validKeyInArray!0 k0!1348))))

(declare-fun b!338852 () Bool)

(assert (=> b!338852 (= e!207894 e!207899)))

(declare-fun res!187189 () Bool)

(assert (=> b!338852 (=> (not res!187189) (not e!207899))))

(declare-datatypes ((SeekEntryResult!3247 0))(
  ( (MissingZero!3247 (index!15167 (_ BitVec 32))) (Found!3247 (index!15168 (_ BitVec 32))) (Intermediate!3247 (undefined!4059 Bool) (index!15169 (_ BitVec 32)) (x!33759 (_ BitVec 32))) (Undefined!3247) (MissingVacant!3247 (index!15170 (_ BitVec 32))) )
))
(declare-fun lt!160919 () SeekEntryResult!3247)

(get-info :version)

(assert (=> b!338852 (= res!187189 (and (not ((_ is Found!3247) lt!160919)) ((_ is MissingZero!3247) lt!160919)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17763 (_ BitVec 32)) SeekEntryResult!3247)

(assert (=> b!338852 (= lt!160919 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!338853 () Bool)

(assert (=> b!338853 (= e!207898 tp_is_empty!7083)))

(declare-fun mapIsEmpty!12036 () Bool)

(assert (=> mapIsEmpty!12036 mapRes!12036))

(declare-fun b!338854 () Bool)

(declare-fun res!187195 () Bool)

(assert (=> b!338854 (=> (not res!187195) (not e!207894))))

(assert (=> b!338854 (= res!187195 (and (= (size!8758 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8759 _keys!1895) (size!8758 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!338855 () Bool)

(declare-fun Unit!10543 () Unit!10541)

(assert (=> b!338855 (= e!207897 Unit!10543)))

(declare-fun b!338856 () Bool)

(assert (=> b!338856 (= e!207895 (and (= (select (arr!8407 _keys!1895) (index!15167 lt!160919)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge #b00000000000000000000000000000000 (size!8759 _keys!1895))))))

(declare-fun b!338857 () Bool)

(declare-fun Unit!10544 () Unit!10541)

(assert (=> b!338857 (= e!207897 Unit!10544)))

(declare-fun lt!160918 () Unit!10541)

(declare-fun lemmaArrayContainsKeyThenInListMap!279 (array!17763 array!17761 (_ BitVec 32) (_ BitVec 32) V!10421 V!10421 (_ BitVec 64) (_ BitVec 32) Int) Unit!10541)

(declare-fun arrayScanForKey!0 (array!17763 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!338857 (= lt!160918 (lemmaArrayContainsKeyThenInListMap!279 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!338857 false))

(declare-fun b!338858 () Bool)

(assert (=> b!338858 (= e!207893 tp_is_empty!7083)))

(declare-fun b!338859 () Bool)

(declare-fun res!187193 () Bool)

(assert (=> b!338859 (=> (not res!187193) (not e!207895))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!338859 (= res!187193 (inRange!0 (index!15167 lt!160919) mask!2385))))

(assert (= (and start!34000 res!187188) b!338854))

(assert (= (and b!338854 res!187195) b!338848))

(assert (= (and b!338848 res!187190) b!338849))

(assert (= (and b!338849 res!187191) b!338851))

(assert (= (and b!338851 res!187196) b!338847))

(assert (= (and b!338847 res!187194) b!338852))

(assert (= (and b!338852 res!187189) b!338850))

(assert (= (and b!338850 c!52458) b!338857))

(assert (= (and b!338850 (not c!52458)) b!338855))

(assert (= (and b!338850 res!187192) b!338859))

(assert (= (and b!338859 res!187193) b!338856))

(assert (= (and b!338846 condMapEmpty!12036) mapIsEmpty!12036))

(assert (= (and b!338846 (not condMapEmpty!12036)) mapNonEmpty!12036))

(assert (= (and mapNonEmpty!12036 ((_ is ValueCellFull!3198) mapValue!12036)) b!338858))

(assert (= (and b!338846 ((_ is ValueCellFull!3198) mapDefault!12036)) b!338853))

(assert (= start!34000 b!338846))

(declare-fun m!341981 () Bool)

(assert (=> b!338859 m!341981))

(declare-fun m!341983 () Bool)

(assert (=> b!338857 m!341983))

(assert (=> b!338857 m!341983))

(declare-fun m!341985 () Bool)

(assert (=> b!338857 m!341985))

(declare-fun m!341987 () Bool)

(assert (=> b!338856 m!341987))

(declare-fun m!341989 () Bool)

(assert (=> b!338852 m!341989))

(declare-fun m!341991 () Bool)

(assert (=> b!338851 m!341991))

(declare-fun m!341993 () Bool)

(assert (=> b!338847 m!341993))

(assert (=> b!338847 m!341993))

(declare-fun m!341995 () Bool)

(assert (=> b!338847 m!341995))

(declare-fun m!341997 () Bool)

(assert (=> mapNonEmpty!12036 m!341997))

(declare-fun m!341999 () Bool)

(assert (=> b!338848 m!341999))

(declare-fun m!342001 () Bool)

(assert (=> b!338849 m!342001))

(declare-fun m!342003 () Bool)

(assert (=> start!34000 m!342003))

(declare-fun m!342005 () Bool)

(assert (=> start!34000 m!342005))

(declare-fun m!342007 () Bool)

(assert (=> start!34000 m!342007))

(declare-fun m!342009 () Bool)

(assert (=> b!338850 m!342009))

(check-sat (not b!338847) (not b!338852) b_and!14321 (not b_next!7131) tp_is_empty!7083 (not b!338850) (not b!338848) (not start!34000) (not b!338849) (not b!338851) (not b!338857) (not mapNonEmpty!12036) (not b!338859))
(check-sat b_and!14321 (not b_next!7131))
(get-model)

(declare-fun d!70803 () Bool)

(assert (=> d!70803 (contains!2125 (getCurrentListMap!1597 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!160936 () Unit!10541)

(declare-fun choose!1300 (array!17763 array!17761 (_ BitVec 32) (_ BitVec 32) V!10421 V!10421 (_ BitVec 64) (_ BitVec 32) Int) Unit!10541)

(assert (=> d!70803 (= lt!160936 (choose!1300 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!70803 (validMask!0 mask!2385)))

(assert (=> d!70803 (= (lemmaArrayContainsKeyThenInListMap!279 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!160936)))

(declare-fun bs!11662 () Bool)

(assert (= bs!11662 d!70803))

(assert (=> bs!11662 m!341993))

(assert (=> bs!11662 m!341993))

(assert (=> bs!11662 m!341995))

(assert (=> bs!11662 m!341983))

(declare-fun m!342041 () Bool)

(assert (=> bs!11662 m!342041))

(assert (=> bs!11662 m!342003))

(assert (=> b!338857 d!70803))

(declare-fun d!70805 () Bool)

(declare-fun lt!160939 () (_ BitVec 32))

(assert (=> d!70805 (and (or (bvslt lt!160939 #b00000000000000000000000000000000) (bvsge lt!160939 (size!8759 _keys!1895)) (and (bvsge lt!160939 #b00000000000000000000000000000000) (bvslt lt!160939 (size!8759 _keys!1895)))) (bvsge lt!160939 #b00000000000000000000000000000000) (bvslt lt!160939 (size!8759 _keys!1895)) (= (select (arr!8407 _keys!1895) lt!160939) k0!1348))))

(declare-fun e!207927 () (_ BitVec 32))

(assert (=> d!70805 (= lt!160939 e!207927)))

(declare-fun c!52464 () Bool)

(assert (=> d!70805 (= c!52464 (= (select (arr!8407 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70805 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8759 _keys!1895)) (bvslt (size!8759 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!70805 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!160939)))

(declare-fun b!338906 () Bool)

(assert (=> b!338906 (= e!207927 #b00000000000000000000000000000000)))

(declare-fun b!338907 () Bool)

(assert (=> b!338907 (= e!207927 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70805 c!52464) b!338906))

(assert (= (and d!70805 (not c!52464)) b!338907))

(declare-fun m!342043 () Bool)

(assert (=> d!70805 m!342043))

(declare-fun m!342045 () Bool)

(assert (=> d!70805 m!342045))

(declare-fun m!342047 () Bool)

(assert (=> b!338907 m!342047))

(assert (=> b!338857 d!70805))

(declare-fun bm!26431 () Bool)

(declare-fun call!26434 () Bool)

(assert (=> bm!26431 (= call!26434 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun d!70807 () Bool)

(declare-fun res!187228 () Bool)

(declare-fun e!207934 () Bool)

(assert (=> d!70807 (=> res!187228 e!207934)))

(assert (=> d!70807 (= res!187228 (bvsge #b00000000000000000000000000000000 (size!8759 _keys!1895)))))

(assert (=> d!70807 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!207934)))

(declare-fun b!338916 () Bool)

(declare-fun e!207935 () Bool)

(declare-fun e!207936 () Bool)

(assert (=> b!338916 (= e!207935 e!207936)))

(declare-fun lt!160947 () (_ BitVec 64))

(assert (=> b!338916 (= lt!160947 (select (arr!8407 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160946 () Unit!10541)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17763 (_ BitVec 64) (_ BitVec 32)) Unit!10541)

(assert (=> b!338916 (= lt!160946 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!160947 #b00000000000000000000000000000000))))

(assert (=> b!338916 (arrayContainsKey!0 _keys!1895 lt!160947 #b00000000000000000000000000000000)))

(declare-fun lt!160948 () Unit!10541)

(assert (=> b!338916 (= lt!160948 lt!160946)))

(declare-fun res!187229 () Bool)

(assert (=> b!338916 (= res!187229 (= (seekEntryOrOpen!0 (select (arr!8407 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3247 #b00000000000000000000000000000000)))))

(assert (=> b!338916 (=> (not res!187229) (not e!207936))))

(declare-fun b!338917 () Bool)

(assert (=> b!338917 (= e!207935 call!26434)))

(declare-fun b!338918 () Bool)

(assert (=> b!338918 (= e!207936 call!26434)))

(declare-fun b!338919 () Bool)

(assert (=> b!338919 (= e!207934 e!207935)))

(declare-fun c!52467 () Bool)

(assert (=> b!338919 (= c!52467 (validKeyInArray!0 (select (arr!8407 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70807 (not res!187228)) b!338919))

(assert (= (and b!338919 c!52467) b!338916))

(assert (= (and b!338919 (not c!52467)) b!338917))

(assert (= (and b!338916 res!187229) b!338918))

(assert (= (or b!338918 b!338917) bm!26431))

(declare-fun m!342049 () Bool)

(assert (=> bm!26431 m!342049))

(assert (=> b!338916 m!342045))

(declare-fun m!342051 () Bool)

(assert (=> b!338916 m!342051))

(declare-fun m!342053 () Bool)

(assert (=> b!338916 m!342053))

(assert (=> b!338916 m!342045))

(declare-fun m!342055 () Bool)

(assert (=> b!338916 m!342055))

(assert (=> b!338919 m!342045))

(assert (=> b!338919 m!342045))

(declare-fun m!342057 () Bool)

(assert (=> b!338919 m!342057))

(assert (=> b!338848 d!70807))

(declare-fun b!338932 () Bool)

(declare-fun e!207945 () SeekEntryResult!3247)

(declare-fun lt!160956 () SeekEntryResult!3247)

(assert (=> b!338932 (= e!207945 (Found!3247 (index!15169 lt!160956)))))

(declare-fun b!338933 () Bool)

(declare-fun e!207944 () SeekEntryResult!3247)

(assert (=> b!338933 (= e!207944 Undefined!3247)))

(declare-fun b!338934 () Bool)

(declare-fun c!52474 () Bool)

(declare-fun lt!160955 () (_ BitVec 64))

(assert (=> b!338934 (= c!52474 (= lt!160955 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!207943 () SeekEntryResult!3247)

(assert (=> b!338934 (= e!207945 e!207943)))

(declare-fun b!338935 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17763 (_ BitVec 32)) SeekEntryResult!3247)

(assert (=> b!338935 (= e!207943 (seekKeyOrZeroReturnVacant!0 (x!33759 lt!160956) (index!15169 lt!160956) (index!15169 lt!160956) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!338936 () Bool)

(assert (=> b!338936 (= e!207944 e!207945)))

(assert (=> b!338936 (= lt!160955 (select (arr!8407 _keys!1895) (index!15169 lt!160956)))))

(declare-fun c!52476 () Bool)

(assert (=> b!338936 (= c!52476 (= lt!160955 k0!1348))))

(declare-fun d!70809 () Bool)

(declare-fun lt!160957 () SeekEntryResult!3247)

(assert (=> d!70809 (and (or ((_ is Undefined!3247) lt!160957) (not ((_ is Found!3247) lt!160957)) (and (bvsge (index!15168 lt!160957) #b00000000000000000000000000000000) (bvslt (index!15168 lt!160957) (size!8759 _keys!1895)))) (or ((_ is Undefined!3247) lt!160957) ((_ is Found!3247) lt!160957) (not ((_ is MissingZero!3247) lt!160957)) (and (bvsge (index!15167 lt!160957) #b00000000000000000000000000000000) (bvslt (index!15167 lt!160957) (size!8759 _keys!1895)))) (or ((_ is Undefined!3247) lt!160957) ((_ is Found!3247) lt!160957) ((_ is MissingZero!3247) lt!160957) (not ((_ is MissingVacant!3247) lt!160957)) (and (bvsge (index!15170 lt!160957) #b00000000000000000000000000000000) (bvslt (index!15170 lt!160957) (size!8759 _keys!1895)))) (or ((_ is Undefined!3247) lt!160957) (ite ((_ is Found!3247) lt!160957) (= (select (arr!8407 _keys!1895) (index!15168 lt!160957)) k0!1348) (ite ((_ is MissingZero!3247) lt!160957) (= (select (arr!8407 _keys!1895) (index!15167 lt!160957)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3247) lt!160957) (= (select (arr!8407 _keys!1895) (index!15170 lt!160957)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70809 (= lt!160957 e!207944)))

(declare-fun c!52475 () Bool)

(assert (=> d!70809 (= c!52475 (and ((_ is Intermediate!3247) lt!160956) (undefined!4059 lt!160956)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17763 (_ BitVec 32)) SeekEntryResult!3247)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70809 (= lt!160956 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70809 (validMask!0 mask!2385)))

(assert (=> d!70809 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!160957)))

(declare-fun b!338937 () Bool)

(assert (=> b!338937 (= e!207943 (MissingZero!3247 (index!15169 lt!160956)))))

(assert (= (and d!70809 c!52475) b!338933))

(assert (= (and d!70809 (not c!52475)) b!338936))

(assert (= (and b!338936 c!52476) b!338932))

(assert (= (and b!338936 (not c!52476)) b!338934))

(assert (= (and b!338934 c!52474) b!338937))

(assert (= (and b!338934 (not c!52474)) b!338935))

(declare-fun m!342059 () Bool)

(assert (=> b!338935 m!342059))

(declare-fun m!342061 () Bool)

(assert (=> b!338936 m!342061))

(declare-fun m!342063 () Bool)

(assert (=> d!70809 m!342063))

(assert (=> d!70809 m!342063))

(declare-fun m!342065 () Bool)

(assert (=> d!70809 m!342065))

(declare-fun m!342067 () Bool)

(assert (=> d!70809 m!342067))

(declare-fun m!342069 () Bool)

(assert (=> d!70809 m!342069))

(declare-fun m!342071 () Bool)

(assert (=> d!70809 m!342071))

(assert (=> d!70809 m!342003))

(assert (=> b!338852 d!70809))

(declare-fun b!338948 () Bool)

(declare-fun e!207957 () Bool)

(declare-fun call!26437 () Bool)

(assert (=> b!338948 (= e!207957 call!26437)))

(declare-fun b!338949 () Bool)

(assert (=> b!338949 (= e!207957 call!26437)))

(declare-fun b!338950 () Bool)

(declare-fun e!207954 () Bool)

(declare-fun e!207955 () Bool)

(assert (=> b!338950 (= e!207954 e!207955)))

(declare-fun res!187236 () Bool)

(assert (=> b!338950 (=> (not res!187236) (not e!207955))))

(declare-fun e!207956 () Bool)

(assert (=> b!338950 (= res!187236 (not e!207956))))

(declare-fun res!187237 () Bool)

(assert (=> b!338950 (=> (not res!187237) (not e!207956))))

(assert (=> b!338950 (= res!187237 (validKeyInArray!0 (select (arr!8407 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26434 () Bool)

(declare-fun c!52479 () Bool)

(assert (=> bm!26434 (= call!26437 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52479 (Cons!4821 (select (arr!8407 _keys!1895) #b00000000000000000000000000000000) Nil!4822) Nil!4822)))))

(declare-fun b!338952 () Bool)

(assert (=> b!338952 (= e!207955 e!207957)))

(assert (=> b!338952 (= c!52479 (validKeyInArray!0 (select (arr!8407 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!338951 () Bool)

(declare-fun contains!2126 (List!4825 (_ BitVec 64)) Bool)

(assert (=> b!338951 (= e!207956 (contains!2126 Nil!4822 (select (arr!8407 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70811 () Bool)

(declare-fun res!187238 () Bool)

(assert (=> d!70811 (=> res!187238 e!207954)))

(assert (=> d!70811 (= res!187238 (bvsge #b00000000000000000000000000000000 (size!8759 _keys!1895)))))

(assert (=> d!70811 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4822) e!207954)))

(assert (= (and d!70811 (not res!187238)) b!338950))

(assert (= (and b!338950 res!187237) b!338951))

(assert (= (and b!338950 res!187236) b!338952))

(assert (= (and b!338952 c!52479) b!338949))

(assert (= (and b!338952 (not c!52479)) b!338948))

(assert (= (or b!338949 b!338948) bm!26434))

(assert (=> b!338950 m!342045))

(assert (=> b!338950 m!342045))

(assert (=> b!338950 m!342057))

(assert (=> bm!26434 m!342045))

(declare-fun m!342073 () Bool)

(assert (=> bm!26434 m!342073))

(assert (=> b!338952 m!342045))

(assert (=> b!338952 m!342045))

(assert (=> b!338952 m!342057))

(assert (=> b!338951 m!342045))

(assert (=> b!338951 m!342045))

(declare-fun m!342075 () Bool)

(assert (=> b!338951 m!342075))

(assert (=> b!338849 d!70811))

(declare-fun d!70813 () Bool)

(assert (=> d!70813 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34000 d!70813))

(declare-fun d!70815 () Bool)

(assert (=> d!70815 (= (array_inv!6232 _values!1525) (bvsge (size!8758 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34000 d!70815))

(declare-fun d!70817 () Bool)

(assert (=> d!70817 (= (array_inv!6233 _keys!1895) (bvsge (size!8759 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34000 d!70817))

(declare-fun d!70819 () Bool)

(declare-fun res!187243 () Bool)

(declare-fun e!207962 () Bool)

(assert (=> d!70819 (=> res!187243 e!207962)))

(assert (=> d!70819 (= res!187243 (= (select (arr!8407 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70819 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!207962)))

(declare-fun b!338957 () Bool)

(declare-fun e!207963 () Bool)

(assert (=> b!338957 (= e!207962 e!207963)))

(declare-fun res!187244 () Bool)

(assert (=> b!338957 (=> (not res!187244) (not e!207963))))

(assert (=> b!338957 (= res!187244 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8759 _keys!1895)))))

(declare-fun b!338958 () Bool)

(assert (=> b!338958 (= e!207963 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70819 (not res!187243)) b!338957))

(assert (= (and b!338957 res!187244) b!338958))

(assert (=> d!70819 m!342045))

(declare-fun m!342077 () Bool)

(assert (=> b!338958 m!342077))

(assert (=> b!338850 d!70819))

(declare-fun d!70821 () Bool)

(assert (=> d!70821 (= (inRange!0 (index!15167 lt!160919) mask!2385) (and (bvsge (index!15167 lt!160919) #b00000000000000000000000000000000) (bvslt (index!15167 lt!160919) (bvadd mask!2385 #b00000000000000000000000000000001))))))

(assert (=> b!338859 d!70821))

(declare-fun d!70823 () Bool)

(declare-fun e!207969 () Bool)

(assert (=> d!70823 e!207969))

(declare-fun res!187247 () Bool)

(assert (=> d!70823 (=> res!187247 e!207969)))

(declare-fun lt!160968 () Bool)

(assert (=> d!70823 (= res!187247 (not lt!160968))))

(declare-fun lt!160969 () Bool)

(assert (=> d!70823 (= lt!160968 lt!160969)))

(declare-fun lt!160967 () Unit!10541)

(declare-fun e!207968 () Unit!10541)

(assert (=> d!70823 (= lt!160967 e!207968)))

(declare-fun c!52482 () Bool)

(assert (=> d!70823 (= c!52482 lt!160969)))

(declare-fun containsKey!321 (List!4824 (_ BitVec 64)) Bool)

(assert (=> d!70823 (= lt!160969 (containsKey!321 (toList!2076 (getCurrentListMap!1597 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70823 (= (contains!2125 (getCurrentListMap!1597 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!160968)))

(declare-fun b!338965 () Bool)

(declare-fun lt!160966 () Unit!10541)

(assert (=> b!338965 (= e!207968 lt!160966)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!269 (List!4824 (_ BitVec 64)) Unit!10541)

(assert (=> b!338965 (= lt!160966 (lemmaContainsKeyImpliesGetValueByKeyDefined!269 (toList!2076 (getCurrentListMap!1597 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!335 0))(
  ( (Some!334 (v!5755 V!10421)) (None!333) )
))
(declare-fun isDefined!270 (Option!335) Bool)

(declare-fun getValueByKey!329 (List!4824 (_ BitVec 64)) Option!335)

(assert (=> b!338965 (isDefined!270 (getValueByKey!329 (toList!2076 (getCurrentListMap!1597 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!338966 () Bool)

(declare-fun Unit!10548 () Unit!10541)

(assert (=> b!338966 (= e!207968 Unit!10548)))

(declare-fun b!338967 () Bool)

(assert (=> b!338967 (= e!207969 (isDefined!270 (getValueByKey!329 (toList!2076 (getCurrentListMap!1597 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70823 c!52482) b!338965))

(assert (= (and d!70823 (not c!52482)) b!338966))

(assert (= (and d!70823 (not res!187247)) b!338967))

(declare-fun m!342079 () Bool)

(assert (=> d!70823 m!342079))

(declare-fun m!342081 () Bool)

(assert (=> b!338965 m!342081))

(declare-fun m!342083 () Bool)

(assert (=> b!338965 m!342083))

(assert (=> b!338965 m!342083))

(declare-fun m!342085 () Bool)

(assert (=> b!338965 m!342085))

(assert (=> b!338967 m!342083))

(assert (=> b!338967 m!342083))

(assert (=> b!338967 m!342085))

(assert (=> b!338847 d!70823))

(declare-fun b!339010 () Bool)

(declare-fun res!187269 () Bool)

(declare-fun e!208001 () Bool)

(assert (=> b!339010 (=> (not res!187269) (not e!208001))))

(declare-fun e!208005 () Bool)

(assert (=> b!339010 (= res!187269 e!208005)))

(declare-fun c!52495 () Bool)

(assert (=> b!339010 (= c!52495 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!339011 () Bool)

(declare-fun e!207996 () ListLongMap!4121)

(declare-fun call!26455 () ListLongMap!4121)

(assert (=> b!339011 (= e!207996 call!26455)))

(declare-fun b!339012 () Bool)

(declare-fun call!26456 () Bool)

(assert (=> b!339012 (= e!208005 (not call!26456))))

(declare-fun call!26457 () ListLongMap!4121)

(declare-fun bm!26449 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!593 (array!17763 array!17761 (_ BitVec 32) (_ BitVec 32) V!10421 V!10421 (_ BitVec 32) Int) ListLongMap!4121)

(assert (=> bm!26449 (= call!26457 (getCurrentListMapNoExtraKeys!593 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!339013 () Bool)

(declare-fun e!208007 () Bool)

(assert (=> b!339013 (= e!208005 e!208007)))

(declare-fun res!187267 () Bool)

(assert (=> b!339013 (= res!187267 call!26456)))

(assert (=> b!339013 (=> (not res!187267) (not e!208007))))

(declare-fun b!339014 () Bool)

(declare-fun e!207997 () Bool)

(declare-fun lt!161015 () ListLongMap!4121)

(declare-fun apply!271 (ListLongMap!4121 (_ BitVec 64)) V!10421)

(assert (=> b!339014 (= e!207997 (= (apply!271 lt!161015 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!339015 () Bool)

(declare-fun e!208004 () Bool)

(declare-fun call!26454 () Bool)

(assert (=> b!339015 (= e!208004 (not call!26454))))

(declare-fun bm!26450 () Bool)

(assert (=> bm!26450 (= call!26456 (contains!2125 lt!161015 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!339016 () Bool)

(declare-fun c!52497 () Bool)

(assert (=> b!339016 (= c!52497 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!207999 () ListLongMap!4121)

(assert (=> b!339016 (= e!207996 e!207999)))

(declare-fun b!339017 () Bool)

(assert (=> b!339017 (= e!208007 (= (apply!271 lt!161015 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!339018 () Bool)

(declare-fun call!26458 () ListLongMap!4121)

(assert (=> b!339018 (= e!207999 call!26458)))

(declare-fun b!339019 () Bool)

(declare-fun e!208000 () Unit!10541)

(declare-fun lt!161020 () Unit!10541)

(assert (=> b!339019 (= e!208000 lt!161020)))

(declare-fun lt!161027 () ListLongMap!4121)

(assert (=> b!339019 (= lt!161027 (getCurrentListMapNoExtraKeys!593 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161032 () (_ BitVec 64))

(assert (=> b!339019 (= lt!161032 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161028 () (_ BitVec 64))

(assert (=> b!339019 (= lt!161028 (select (arr!8407 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161033 () Unit!10541)

(declare-fun addStillContains!247 (ListLongMap!4121 (_ BitVec 64) V!10421 (_ BitVec 64)) Unit!10541)

(assert (=> b!339019 (= lt!161033 (addStillContains!247 lt!161027 lt!161032 zeroValue!1467 lt!161028))))

(declare-fun +!720 (ListLongMap!4121 tuple2!5208) ListLongMap!4121)

(assert (=> b!339019 (contains!2125 (+!720 lt!161027 (tuple2!5209 lt!161032 zeroValue!1467)) lt!161028)))

(declare-fun lt!161034 () Unit!10541)

(assert (=> b!339019 (= lt!161034 lt!161033)))

(declare-fun lt!161021 () ListLongMap!4121)

(assert (=> b!339019 (= lt!161021 (getCurrentListMapNoExtraKeys!593 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161024 () (_ BitVec 64))

(assert (=> b!339019 (= lt!161024 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161031 () (_ BitVec 64))

(assert (=> b!339019 (= lt!161031 (select (arr!8407 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161022 () Unit!10541)

(declare-fun addApplyDifferent!247 (ListLongMap!4121 (_ BitVec 64) V!10421 (_ BitVec 64)) Unit!10541)

(assert (=> b!339019 (= lt!161022 (addApplyDifferent!247 lt!161021 lt!161024 minValue!1467 lt!161031))))

(assert (=> b!339019 (= (apply!271 (+!720 lt!161021 (tuple2!5209 lt!161024 minValue!1467)) lt!161031) (apply!271 lt!161021 lt!161031))))

(declare-fun lt!161025 () Unit!10541)

(assert (=> b!339019 (= lt!161025 lt!161022)))

(declare-fun lt!161023 () ListLongMap!4121)

(assert (=> b!339019 (= lt!161023 (getCurrentListMapNoExtraKeys!593 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161019 () (_ BitVec 64))

(assert (=> b!339019 (= lt!161019 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161017 () (_ BitVec 64))

(assert (=> b!339019 (= lt!161017 (select (arr!8407 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161018 () Unit!10541)

(assert (=> b!339019 (= lt!161018 (addApplyDifferent!247 lt!161023 lt!161019 zeroValue!1467 lt!161017))))

(assert (=> b!339019 (= (apply!271 (+!720 lt!161023 (tuple2!5209 lt!161019 zeroValue!1467)) lt!161017) (apply!271 lt!161023 lt!161017))))

(declare-fun lt!161014 () Unit!10541)

(assert (=> b!339019 (= lt!161014 lt!161018)))

(declare-fun lt!161016 () ListLongMap!4121)

(assert (=> b!339019 (= lt!161016 (getCurrentListMapNoExtraKeys!593 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161030 () (_ BitVec 64))

(assert (=> b!339019 (= lt!161030 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161029 () (_ BitVec 64))

(assert (=> b!339019 (= lt!161029 (select (arr!8407 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!339019 (= lt!161020 (addApplyDifferent!247 lt!161016 lt!161030 minValue!1467 lt!161029))))

(assert (=> b!339019 (= (apply!271 (+!720 lt!161016 (tuple2!5209 lt!161030 minValue!1467)) lt!161029) (apply!271 lt!161016 lt!161029))))

(declare-fun b!339020 () Bool)

(assert (=> b!339020 (= e!208001 e!208004)))

(declare-fun c!52499 () Bool)

(assert (=> b!339020 (= c!52499 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!339021 () Bool)

(declare-fun Unit!10549 () Unit!10541)

(assert (=> b!339021 (= e!208000 Unit!10549)))

(declare-fun bm!26451 () Bool)

(declare-fun call!26453 () ListLongMap!4121)

(assert (=> bm!26451 (= call!26458 call!26453)))

(declare-fun b!339022 () Bool)

(declare-fun e!208006 () Bool)

(assert (=> b!339022 (= e!208006 (validKeyInArray!0 (select (arr!8407 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!339023 () Bool)

(assert (=> b!339023 (= e!208004 e!207997)))

(declare-fun res!187274 () Bool)

(assert (=> b!339023 (= res!187274 call!26454)))

(assert (=> b!339023 (=> (not res!187274) (not e!207997))))

(declare-fun b!339024 () Bool)

(declare-fun e!208003 () ListLongMap!4121)

(declare-fun call!26452 () ListLongMap!4121)

(assert (=> b!339024 (= e!208003 (+!720 call!26452 (tuple2!5209 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun bm!26452 () Bool)

(assert (=> bm!26452 (= call!26454 (contains!2125 lt!161015 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!339025 () Bool)

(assert (=> b!339025 (= e!208003 e!207996)))

(declare-fun c!52496 () Bool)

(assert (=> b!339025 (= c!52496 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26453 () Bool)

(assert (=> bm!26453 (= call!26453 call!26457)))

(declare-fun c!52500 () Bool)

(declare-fun bm!26454 () Bool)

(assert (=> bm!26454 (= call!26452 (+!720 (ite c!52500 call!26457 (ite c!52496 call!26453 call!26458)) (ite (or c!52500 c!52496) (tuple2!5209 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5209 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!339026 () Bool)

(declare-fun e!208008 () Bool)

(declare-fun e!208002 () Bool)

(assert (=> b!339026 (= e!208008 e!208002)))

(declare-fun res!187268 () Bool)

(assert (=> b!339026 (=> (not res!187268) (not e!208002))))

(assert (=> b!339026 (= res!187268 (contains!2125 lt!161015 (select (arr!8407 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!339026 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8759 _keys!1895)))))

(declare-fun b!339027 () Bool)

(assert (=> b!339027 (= e!207999 call!26455)))

(declare-fun b!339028 () Bool)

(declare-fun e!207998 () Bool)

(assert (=> b!339028 (= e!207998 (validKeyInArray!0 (select (arr!8407 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26455 () Bool)

(assert (=> bm!26455 (= call!26455 call!26452)))

(declare-fun b!339029 () Bool)

(declare-fun get!4577 (ValueCell!3198 V!10421) V!10421)

(declare-fun dynLambda!614 (Int (_ BitVec 64)) V!10421)

(assert (=> b!339029 (= e!208002 (= (apply!271 lt!161015 (select (arr!8407 _keys!1895) #b00000000000000000000000000000000)) (get!4577 (select (arr!8406 _values!1525) #b00000000000000000000000000000000) (dynLambda!614 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!339029 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8758 _values!1525)))))

(assert (=> b!339029 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8759 _keys!1895)))))

(declare-fun b!339030 () Bool)

(declare-fun res!187266 () Bool)

(assert (=> b!339030 (=> (not res!187266) (not e!208001))))

(assert (=> b!339030 (= res!187266 e!208008)))

(declare-fun res!187273 () Bool)

(assert (=> b!339030 (=> res!187273 e!208008)))

(assert (=> b!339030 (= res!187273 (not e!208006))))

(declare-fun res!187272 () Bool)

(assert (=> b!339030 (=> (not res!187272) (not e!208006))))

(assert (=> b!339030 (= res!187272 (bvslt #b00000000000000000000000000000000 (size!8759 _keys!1895)))))

(declare-fun d!70825 () Bool)

(assert (=> d!70825 e!208001))

(declare-fun res!187271 () Bool)

(assert (=> d!70825 (=> (not res!187271) (not e!208001))))

(assert (=> d!70825 (= res!187271 (or (bvsge #b00000000000000000000000000000000 (size!8759 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8759 _keys!1895)))))))

(declare-fun lt!161035 () ListLongMap!4121)

(assert (=> d!70825 (= lt!161015 lt!161035)))

(declare-fun lt!161026 () Unit!10541)

(assert (=> d!70825 (= lt!161026 e!208000)))

(declare-fun c!52498 () Bool)

(assert (=> d!70825 (= c!52498 e!207998)))

(declare-fun res!187270 () Bool)

(assert (=> d!70825 (=> (not res!187270) (not e!207998))))

(assert (=> d!70825 (= res!187270 (bvslt #b00000000000000000000000000000000 (size!8759 _keys!1895)))))

(assert (=> d!70825 (= lt!161035 e!208003)))

(assert (=> d!70825 (= c!52500 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70825 (validMask!0 mask!2385)))

(assert (=> d!70825 (= (getCurrentListMap!1597 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!161015)))

(assert (= (and d!70825 c!52500) b!339024))

(assert (= (and d!70825 (not c!52500)) b!339025))

(assert (= (and b!339025 c!52496) b!339011))

(assert (= (and b!339025 (not c!52496)) b!339016))

(assert (= (and b!339016 c!52497) b!339027))

(assert (= (and b!339016 (not c!52497)) b!339018))

(assert (= (or b!339027 b!339018) bm!26451))

(assert (= (or b!339011 bm!26451) bm!26453))

(assert (= (or b!339011 b!339027) bm!26455))

(assert (= (or b!339024 bm!26453) bm!26449))

(assert (= (or b!339024 bm!26455) bm!26454))

(assert (= (and d!70825 res!187270) b!339028))

(assert (= (and d!70825 c!52498) b!339019))

(assert (= (and d!70825 (not c!52498)) b!339021))

(assert (= (and d!70825 res!187271) b!339030))

(assert (= (and b!339030 res!187272) b!339022))

(assert (= (and b!339030 (not res!187273)) b!339026))

(assert (= (and b!339026 res!187268) b!339029))

(assert (= (and b!339030 res!187266) b!339010))

(assert (= (and b!339010 c!52495) b!339013))

(assert (= (and b!339010 (not c!52495)) b!339012))

(assert (= (and b!339013 res!187267) b!339017))

(assert (= (or b!339013 b!339012) bm!26450))

(assert (= (and b!339010 res!187269) b!339020))

(assert (= (and b!339020 c!52499) b!339023))

(assert (= (and b!339020 (not c!52499)) b!339015))

(assert (= (and b!339023 res!187274) b!339014))

(assert (= (or b!339023 b!339015) bm!26452))

(declare-fun b_lambda!8423 () Bool)

(assert (=> (not b_lambda!8423) (not b!339029)))

(declare-fun t!9926 () Bool)

(declare-fun tb!3057 () Bool)

(assert (=> (and start!34000 (= defaultEntry!1528 defaultEntry!1528) t!9926) tb!3057))

(declare-fun result!5501 () Bool)

(assert (=> tb!3057 (= result!5501 tp_is_empty!7083)))

(assert (=> b!339029 t!9926))

(declare-fun b_and!14325 () Bool)

(assert (= b_and!14321 (and (=> t!9926 result!5501) b_and!14325)))

(declare-fun m!342087 () Bool)

(assert (=> bm!26452 m!342087))

(assert (=> b!339028 m!342045))

(assert (=> b!339028 m!342045))

(assert (=> b!339028 m!342057))

(assert (=> b!339022 m!342045))

(assert (=> b!339022 m!342045))

(assert (=> b!339022 m!342057))

(declare-fun m!342089 () Bool)

(assert (=> bm!26449 m!342089))

(declare-fun m!342091 () Bool)

(assert (=> b!339017 m!342091))

(declare-fun m!342093 () Bool)

(assert (=> b!339024 m!342093))

(declare-fun m!342095 () Bool)

(assert (=> b!339019 m!342095))

(declare-fun m!342097 () Bool)

(assert (=> b!339019 m!342097))

(declare-fun m!342099 () Bool)

(assert (=> b!339019 m!342099))

(declare-fun m!342101 () Bool)

(assert (=> b!339019 m!342101))

(declare-fun m!342103 () Bool)

(assert (=> b!339019 m!342103))

(declare-fun m!342105 () Bool)

(assert (=> b!339019 m!342105))

(assert (=> b!339019 m!342099))

(declare-fun m!342107 () Bool)

(assert (=> b!339019 m!342107))

(declare-fun m!342109 () Bool)

(assert (=> b!339019 m!342109))

(declare-fun m!342111 () Bool)

(assert (=> b!339019 m!342111))

(assert (=> b!339019 m!342095))

(assert (=> b!339019 m!342103))

(declare-fun m!342113 () Bool)

(assert (=> b!339019 m!342113))

(declare-fun m!342115 () Bool)

(assert (=> b!339019 m!342115))

(declare-fun m!342117 () Bool)

(assert (=> b!339019 m!342117))

(declare-fun m!342119 () Bool)

(assert (=> b!339019 m!342119))

(assert (=> b!339019 m!342089))

(declare-fun m!342121 () Bool)

(assert (=> b!339019 m!342121))

(assert (=> b!339019 m!342045))

(declare-fun m!342123 () Bool)

(assert (=> b!339019 m!342123))

(assert (=> b!339019 m!342115))

(assert (=> d!70825 m!342003))

(declare-fun m!342125 () Bool)

(assert (=> bm!26454 m!342125))

(declare-fun m!342127 () Bool)

(assert (=> bm!26450 m!342127))

(declare-fun m!342129 () Bool)

(assert (=> b!339029 m!342129))

(declare-fun m!342131 () Bool)

(assert (=> b!339029 m!342131))

(declare-fun m!342133 () Bool)

(assert (=> b!339029 m!342133))

(assert (=> b!339029 m!342129))

(assert (=> b!339029 m!342045))

(declare-fun m!342135 () Bool)

(assert (=> b!339029 m!342135))

(assert (=> b!339029 m!342131))

(assert (=> b!339029 m!342045))

(assert (=> b!339026 m!342045))

(assert (=> b!339026 m!342045))

(declare-fun m!342137 () Bool)

(assert (=> b!339026 m!342137))

(declare-fun m!342139 () Bool)

(assert (=> b!339014 m!342139))

(assert (=> b!338847 d!70825))

(declare-fun d!70827 () Bool)

(assert (=> d!70827 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!338851 d!70827))

(declare-fun mapNonEmpty!12042 () Bool)

(declare-fun mapRes!12042 () Bool)

(declare-fun tp!24921 () Bool)

(declare-fun e!208013 () Bool)

(assert (=> mapNonEmpty!12042 (= mapRes!12042 (and tp!24921 e!208013))))

(declare-fun mapKey!12042 () (_ BitVec 32))

(declare-fun mapRest!12042 () (Array (_ BitVec 32) ValueCell!3198))

(declare-fun mapValue!12042 () ValueCell!3198)

(assert (=> mapNonEmpty!12042 (= mapRest!12036 (store mapRest!12042 mapKey!12042 mapValue!12042))))

(declare-fun b!339040 () Bool)

(declare-fun e!208014 () Bool)

(assert (=> b!339040 (= e!208014 tp_is_empty!7083)))

(declare-fun mapIsEmpty!12042 () Bool)

(assert (=> mapIsEmpty!12042 mapRes!12042))

(declare-fun condMapEmpty!12042 () Bool)

(declare-fun mapDefault!12042 () ValueCell!3198)

(assert (=> mapNonEmpty!12036 (= condMapEmpty!12042 (= mapRest!12036 ((as const (Array (_ BitVec 32) ValueCell!3198)) mapDefault!12042)))))

(assert (=> mapNonEmpty!12036 (= tp!24911 (and e!208014 mapRes!12042))))

(declare-fun b!339039 () Bool)

(assert (=> b!339039 (= e!208013 tp_is_empty!7083)))

(assert (= (and mapNonEmpty!12036 condMapEmpty!12042) mapIsEmpty!12042))

(assert (= (and mapNonEmpty!12036 (not condMapEmpty!12042)) mapNonEmpty!12042))

(assert (= (and mapNonEmpty!12042 ((_ is ValueCellFull!3198) mapValue!12042)) b!339039))

(assert (= (and mapNonEmpty!12036 ((_ is ValueCellFull!3198) mapDefault!12042)) b!339040))

(declare-fun m!342141 () Bool)

(assert (=> mapNonEmpty!12042 m!342141))

(declare-fun b_lambda!8425 () Bool)

(assert (= b_lambda!8423 (or (and start!34000 b_free!7131) b_lambda!8425)))

(check-sat (not b!338935) (not b!339019) (not b!339029) (not b!339026) (not bm!26431) (not b_next!7131) (not b!339022) (not bm!26454) (not b!339014) (not b!338919) (not mapNonEmpty!12042) (not b!338967) (not b!339024) (not bm!26449) (not bm!26450) (not b!338950) (not b!338916) (not b!339028) (not d!70825) (not bm!26434) (not b!339017) (not b!338965) (not b!338958) (not b!338951) (not b!338952) (not d!70803) (not b!338907) tp_is_empty!7083 (not bm!26452) (not b_lambda!8425) (not d!70809) b_and!14325 (not d!70823))
(check-sat b_and!14325 (not b_next!7131))
