; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34582 () Bool)

(assert start!34582)

(declare-fun b_free!7467 () Bool)

(declare-fun b_next!7467 () Bool)

(assert (=> start!34582 (= b_free!7467 (not b_next!7467))))

(declare-fun tp!25952 () Bool)

(declare-fun b_and!14679 () Bool)

(assert (=> start!34582 (= tp!25952 b_and!14679)))

(declare-fun b!345621 () Bool)

(declare-fun res!191200 () Bool)

(declare-fun e!211836 () Bool)

(assert (=> b!345621 (=> (not res!191200) (not e!211836))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10869 0))(
  ( (V!10870 (val!3754 Int)) )
))
(declare-fun zeroValue!1467 () V!10869)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3366 0))(
  ( (ValueCellFull!3366 (v!5932 V!10869)) (EmptyCell!3366) )
))
(declare-datatypes ((array!18425 0))(
  ( (array!18426 (arr!8727 (Array (_ BitVec 32) ValueCell!3366)) (size!9079 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18425)

(declare-datatypes ((array!18427 0))(
  ( (array!18428 (arr!8728 (Array (_ BitVec 32) (_ BitVec 64))) (size!9080 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18427)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10869)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((tuple2!5428 0))(
  ( (tuple2!5429 (_1!2725 (_ BitVec 64)) (_2!2725 V!10869)) )
))
(declare-datatypes ((List!5052 0))(
  ( (Nil!5049) (Cons!5048 (h!5904 tuple2!5428) (t!10172 List!5052)) )
))
(declare-datatypes ((ListLongMap!4341 0))(
  ( (ListLongMap!4342 (toList!2186 List!5052)) )
))
(declare-fun contains!2246 (ListLongMap!4341 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1707 (array!18427 array!18425 (_ BitVec 32) (_ BitVec 32) V!10869 V!10869 (_ BitVec 32) Int) ListLongMap!4341)

(assert (=> b!345621 (= res!191200 (not (contains!2246 (getCurrentListMap!1707 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!12573 () Bool)

(declare-fun mapRes!12573 () Bool)

(declare-fun tp!25953 () Bool)

(declare-fun e!211833 () Bool)

(assert (=> mapNonEmpty!12573 (= mapRes!12573 (and tp!25953 e!211833))))

(declare-fun mapValue!12573 () ValueCell!3366)

(declare-fun mapRest!12573 () (Array (_ BitVec 32) ValueCell!3366))

(declare-fun mapKey!12573 () (_ BitVec 32))

(assert (=> mapNonEmpty!12573 (= (arr!8727 _values!1525) (store mapRest!12573 mapKey!12573 mapValue!12573))))

(declare-fun b!345622 () Bool)

(declare-fun e!211835 () Bool)

(declare-fun tp_is_empty!7419 () Bool)

(assert (=> b!345622 (= e!211835 tp_is_empty!7419)))

(declare-fun b!345623 () Bool)

(declare-fun res!191201 () Bool)

(assert (=> b!345623 (=> (not res!191201) (not e!211836))))

(assert (=> b!345623 (= res!191201 (and (= (size!9079 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9080 _keys!1895) (size!9079 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!345625 () Bool)

(declare-fun e!211834 () Bool)

(assert (=> b!345625 (= e!211834 (and e!211835 mapRes!12573))))

(declare-fun condMapEmpty!12573 () Bool)

(declare-fun mapDefault!12573 () ValueCell!3366)

(assert (=> b!345625 (= condMapEmpty!12573 (= (arr!8727 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3366)) mapDefault!12573)))))

(declare-fun mapIsEmpty!12573 () Bool)

(assert (=> mapIsEmpty!12573 mapRes!12573))

(declare-fun b!345624 () Bool)

(declare-fun res!191199 () Bool)

(assert (=> b!345624 (=> (not res!191199) (not e!211836))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18427 (_ BitVec 32)) Bool)

(assert (=> b!345624 (= res!191199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!191203 () Bool)

(assert (=> start!34582 (=> (not res!191203) (not e!211836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34582 (= res!191203 (validMask!0 mask!2385))))

(assert (=> start!34582 e!211836))

(assert (=> start!34582 true))

(assert (=> start!34582 tp_is_empty!7419))

(assert (=> start!34582 tp!25952))

(declare-fun array_inv!6460 (array!18425) Bool)

(assert (=> start!34582 (and (array_inv!6460 _values!1525) e!211834)))

(declare-fun array_inv!6461 (array!18427) Bool)

(assert (=> start!34582 (array_inv!6461 _keys!1895)))

(declare-fun b!345626 () Bool)

(declare-fun res!191204 () Bool)

(assert (=> b!345626 (=> (not res!191204) (not e!211836))))

(declare-datatypes ((List!5053 0))(
  ( (Nil!5050) (Cons!5049 (h!5905 (_ BitVec 64)) (t!10173 List!5053)) )
))
(declare-fun arrayNoDuplicates!0 (array!18427 (_ BitVec 32) List!5053) Bool)

(assert (=> b!345626 (= res!191204 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5050))))

(declare-fun b!345627 () Bool)

(declare-datatypes ((SeekEntryResult!3364 0))(
  ( (MissingZero!3364 (index!15635 (_ BitVec 32))) (Found!3364 (index!15636 (_ BitVec 32))) (Intermediate!3364 (undefined!4176 Bool) (index!15637 (_ BitVec 32)) (x!34434 (_ BitVec 32))) (Undefined!3364) (MissingVacant!3364 (index!15638 (_ BitVec 32))) )
))
(declare-fun lt!162967 () SeekEntryResult!3364)

(get-info :version)

(assert (=> b!345627 (= e!211836 (and ((_ is Found!3364) lt!162967) (or (bvslt (index!15636 lt!162967) #b00000000000000000000000000000000) (bvsge (index!15636 lt!162967) (size!9080 _keys!1895)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18427 (_ BitVec 32)) SeekEntryResult!3364)

(assert (=> b!345627 (= lt!162967 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!345628 () Bool)

(assert (=> b!345628 (= e!211833 tp_is_empty!7419)))

(declare-fun b!345629 () Bool)

(declare-fun res!191202 () Bool)

(assert (=> b!345629 (=> (not res!191202) (not e!211836))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!345629 (= res!191202 (validKeyInArray!0 k0!1348))))

(assert (= (and start!34582 res!191203) b!345623))

(assert (= (and b!345623 res!191201) b!345624))

(assert (= (and b!345624 res!191199) b!345626))

(assert (= (and b!345626 res!191204) b!345629))

(assert (= (and b!345629 res!191202) b!345621))

(assert (= (and b!345621 res!191200) b!345627))

(assert (= (and b!345625 condMapEmpty!12573) mapIsEmpty!12573))

(assert (= (and b!345625 (not condMapEmpty!12573)) mapNonEmpty!12573))

(assert (= (and mapNonEmpty!12573 ((_ is ValueCellFull!3366) mapValue!12573)) b!345628))

(assert (= (and b!345625 ((_ is ValueCellFull!3366) mapDefault!12573)) b!345622))

(assert (= start!34582 b!345625))

(declare-fun m!346945 () Bool)

(assert (=> start!34582 m!346945))

(declare-fun m!346947 () Bool)

(assert (=> start!34582 m!346947))

(declare-fun m!346949 () Bool)

(assert (=> start!34582 m!346949))

(declare-fun m!346951 () Bool)

(assert (=> b!345621 m!346951))

(assert (=> b!345621 m!346951))

(declare-fun m!346953 () Bool)

(assert (=> b!345621 m!346953))

(declare-fun m!346955 () Bool)

(assert (=> b!345629 m!346955))

(declare-fun m!346957 () Bool)

(assert (=> b!345624 m!346957))

(declare-fun m!346959 () Bool)

(assert (=> b!345627 m!346959))

(declare-fun m!346961 () Bool)

(assert (=> b!345626 m!346961))

(declare-fun m!346963 () Bool)

(assert (=> mapNonEmpty!12573 m!346963))

(check-sat (not b!345627) (not mapNonEmpty!12573) b_and!14679 (not b!345629) (not b!345626) (not b!345624) (not b!345621) tp_is_empty!7419 (not b_next!7467) (not start!34582))
(check-sat b_and!14679 (not b_next!7467))
(get-model)

(declare-fun b!345670 () Bool)

(declare-fun e!211860 () SeekEntryResult!3364)

(declare-fun lt!162979 () SeekEntryResult!3364)

(assert (=> b!345670 (= e!211860 (Found!3364 (index!15637 lt!162979)))))

(declare-fun b!345671 () Bool)

(declare-fun c!53036 () Bool)

(declare-fun lt!162978 () (_ BitVec 64))

(assert (=> b!345671 (= c!53036 (= lt!162978 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!211859 () SeekEntryResult!3364)

(assert (=> b!345671 (= e!211860 e!211859)))

(declare-fun b!345672 () Bool)

(assert (=> b!345672 (= e!211859 (MissingZero!3364 (index!15637 lt!162979)))))

(declare-fun b!345673 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18427 (_ BitVec 32)) SeekEntryResult!3364)

(assert (=> b!345673 (= e!211859 (seekKeyOrZeroReturnVacant!0 (x!34434 lt!162979) (index!15637 lt!162979) (index!15637 lt!162979) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!345674 () Bool)

(declare-fun e!211858 () SeekEntryResult!3364)

(assert (=> b!345674 (= e!211858 Undefined!3364)))

(declare-fun d!71161 () Bool)

(declare-fun lt!162977 () SeekEntryResult!3364)

(assert (=> d!71161 (and (or ((_ is Undefined!3364) lt!162977) (not ((_ is Found!3364) lt!162977)) (and (bvsge (index!15636 lt!162977) #b00000000000000000000000000000000) (bvslt (index!15636 lt!162977) (size!9080 _keys!1895)))) (or ((_ is Undefined!3364) lt!162977) ((_ is Found!3364) lt!162977) (not ((_ is MissingZero!3364) lt!162977)) (and (bvsge (index!15635 lt!162977) #b00000000000000000000000000000000) (bvslt (index!15635 lt!162977) (size!9080 _keys!1895)))) (or ((_ is Undefined!3364) lt!162977) ((_ is Found!3364) lt!162977) ((_ is MissingZero!3364) lt!162977) (not ((_ is MissingVacant!3364) lt!162977)) (and (bvsge (index!15638 lt!162977) #b00000000000000000000000000000000) (bvslt (index!15638 lt!162977) (size!9080 _keys!1895)))) (or ((_ is Undefined!3364) lt!162977) (ite ((_ is Found!3364) lt!162977) (= (select (arr!8728 _keys!1895) (index!15636 lt!162977)) k0!1348) (ite ((_ is MissingZero!3364) lt!162977) (= (select (arr!8728 _keys!1895) (index!15635 lt!162977)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3364) lt!162977) (= (select (arr!8728 _keys!1895) (index!15638 lt!162977)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71161 (= lt!162977 e!211858)))

(declare-fun c!53035 () Bool)

(assert (=> d!71161 (= c!53035 (and ((_ is Intermediate!3364) lt!162979) (undefined!4176 lt!162979)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18427 (_ BitVec 32)) SeekEntryResult!3364)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71161 (= lt!162979 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71161 (validMask!0 mask!2385)))

(assert (=> d!71161 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!162977)))

(declare-fun b!345669 () Bool)

(assert (=> b!345669 (= e!211858 e!211860)))

(assert (=> b!345669 (= lt!162978 (select (arr!8728 _keys!1895) (index!15637 lt!162979)))))

(declare-fun c!53037 () Bool)

(assert (=> b!345669 (= c!53037 (= lt!162978 k0!1348))))

(assert (= (and d!71161 c!53035) b!345674))

(assert (= (and d!71161 (not c!53035)) b!345669))

(assert (= (and b!345669 c!53037) b!345670))

(assert (= (and b!345669 (not c!53037)) b!345671))

(assert (= (and b!345671 c!53036) b!345672))

(assert (= (and b!345671 (not c!53036)) b!345673))

(declare-fun m!346985 () Bool)

(assert (=> b!345673 m!346985))

(assert (=> d!71161 m!346945))

(declare-fun m!346987 () Bool)

(assert (=> d!71161 m!346987))

(declare-fun m!346989 () Bool)

(assert (=> d!71161 m!346989))

(declare-fun m!346991 () Bool)

(assert (=> d!71161 m!346991))

(declare-fun m!346993 () Bool)

(assert (=> d!71161 m!346993))

(assert (=> d!71161 m!346991))

(declare-fun m!346995 () Bool)

(assert (=> d!71161 m!346995))

(declare-fun m!346997 () Bool)

(assert (=> b!345669 m!346997))

(assert (=> b!345627 d!71161))

(declare-fun b!345683 () Bool)

(declare-fun e!211867 () Bool)

(declare-fun call!26731 () Bool)

(assert (=> b!345683 (= e!211867 call!26731)))

(declare-fun d!71163 () Bool)

(declare-fun res!191228 () Bool)

(declare-fun e!211869 () Bool)

(assert (=> d!71163 (=> res!191228 e!211869)))

(assert (=> d!71163 (= res!191228 (bvsge #b00000000000000000000000000000000 (size!9080 _keys!1895)))))

(assert (=> d!71163 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!211869)))

(declare-fun b!345684 () Bool)

(declare-fun e!211868 () Bool)

(assert (=> b!345684 (= e!211868 e!211867)))

(declare-fun lt!162987 () (_ BitVec 64))

(assert (=> b!345684 (= lt!162987 (select (arr!8728 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10737 0))(
  ( (Unit!10738) )
))
(declare-fun lt!162988 () Unit!10737)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18427 (_ BitVec 64) (_ BitVec 32)) Unit!10737)

(assert (=> b!345684 (= lt!162988 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!162987 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!18427 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!345684 (arrayContainsKey!0 _keys!1895 lt!162987 #b00000000000000000000000000000000)))

(declare-fun lt!162986 () Unit!10737)

(assert (=> b!345684 (= lt!162986 lt!162988)))

(declare-fun res!191227 () Bool)

(assert (=> b!345684 (= res!191227 (= (seekEntryOrOpen!0 (select (arr!8728 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3364 #b00000000000000000000000000000000)))))

(assert (=> b!345684 (=> (not res!191227) (not e!211867))))

(declare-fun b!345685 () Bool)

(assert (=> b!345685 (= e!211868 call!26731)))

(declare-fun b!345686 () Bool)

(assert (=> b!345686 (= e!211869 e!211868)))

(declare-fun c!53040 () Bool)

(assert (=> b!345686 (= c!53040 (validKeyInArray!0 (select (arr!8728 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26728 () Bool)

(assert (=> bm!26728 (= call!26731 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(assert (= (and d!71163 (not res!191228)) b!345686))

(assert (= (and b!345686 c!53040) b!345684))

(assert (= (and b!345686 (not c!53040)) b!345685))

(assert (= (and b!345684 res!191227) b!345683))

(assert (= (or b!345683 b!345685) bm!26728))

(declare-fun m!346999 () Bool)

(assert (=> b!345684 m!346999))

(declare-fun m!347001 () Bool)

(assert (=> b!345684 m!347001))

(declare-fun m!347003 () Bool)

(assert (=> b!345684 m!347003))

(assert (=> b!345684 m!346999))

(declare-fun m!347005 () Bool)

(assert (=> b!345684 m!347005))

(assert (=> b!345686 m!346999))

(assert (=> b!345686 m!346999))

(declare-fun m!347007 () Bool)

(assert (=> b!345686 m!347007))

(declare-fun m!347009 () Bool)

(assert (=> bm!26728 m!347009))

(assert (=> b!345624 d!71163))

(declare-fun d!71165 () Bool)

(assert (=> d!71165 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!345629 d!71165))

(declare-fun d!71167 () Bool)

(declare-fun e!211875 () Bool)

(assert (=> d!71167 e!211875))

(declare-fun res!191231 () Bool)

(assert (=> d!71167 (=> res!191231 e!211875)))

(declare-fun lt!162999 () Bool)

(assert (=> d!71167 (= res!191231 (not lt!162999))))

(declare-fun lt!163000 () Bool)

(assert (=> d!71167 (= lt!162999 lt!163000)))

(declare-fun lt!162998 () Unit!10737)

(declare-fun e!211874 () Unit!10737)

(assert (=> d!71167 (= lt!162998 e!211874)))

(declare-fun c!53043 () Bool)

(assert (=> d!71167 (= c!53043 lt!163000)))

(declare-fun containsKey!332 (List!5052 (_ BitVec 64)) Bool)

(assert (=> d!71167 (= lt!163000 (containsKey!332 (toList!2186 (getCurrentListMap!1707 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71167 (= (contains!2246 (getCurrentListMap!1707 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!162999)))

(declare-fun b!345693 () Bool)

(declare-fun lt!162997 () Unit!10737)

(assert (=> b!345693 (= e!211874 lt!162997)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!280 (List!5052 (_ BitVec 64)) Unit!10737)

(assert (=> b!345693 (= lt!162997 (lemmaContainsKeyImpliesGetValueByKeyDefined!280 (toList!2186 (getCurrentListMap!1707 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!346 0))(
  ( (Some!345 (v!5934 V!10869)) (None!344) )
))
(declare-fun isDefined!281 (Option!346) Bool)

(declare-fun getValueByKey!340 (List!5052 (_ BitVec 64)) Option!346)

(assert (=> b!345693 (isDefined!281 (getValueByKey!340 (toList!2186 (getCurrentListMap!1707 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!345694 () Bool)

(declare-fun Unit!10739 () Unit!10737)

(assert (=> b!345694 (= e!211874 Unit!10739)))

(declare-fun b!345695 () Bool)

(assert (=> b!345695 (= e!211875 (isDefined!281 (getValueByKey!340 (toList!2186 (getCurrentListMap!1707 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71167 c!53043) b!345693))

(assert (= (and d!71167 (not c!53043)) b!345694))

(assert (= (and d!71167 (not res!191231)) b!345695))

(declare-fun m!347011 () Bool)

(assert (=> d!71167 m!347011))

(declare-fun m!347013 () Bool)

(assert (=> b!345693 m!347013))

(declare-fun m!347015 () Bool)

(assert (=> b!345693 m!347015))

(assert (=> b!345693 m!347015))

(declare-fun m!347017 () Bool)

(assert (=> b!345693 m!347017))

(assert (=> b!345695 m!347015))

(assert (=> b!345695 m!347015))

(assert (=> b!345695 m!347017))

(assert (=> b!345621 d!71167))

(declare-fun b!345738 () Bool)

(declare-fun e!211910 () Bool)

(assert (=> b!345738 (= e!211910 (validKeyInArray!0 (select (arr!8728 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345739 () Bool)

(declare-fun lt!163055 () ListLongMap!4341)

(declare-fun e!211911 () Bool)

(declare-fun apply!282 (ListLongMap!4341 (_ BitVec 64)) V!10869)

(declare-fun get!4700 (ValueCell!3366 V!10869) V!10869)

(declare-fun dynLambda!625 (Int (_ BitVec 64)) V!10869)

(assert (=> b!345739 (= e!211911 (= (apply!282 lt!163055 (select (arr!8728 _keys!1895) #b00000000000000000000000000000000)) (get!4700 (select (arr!8727 _values!1525) #b00000000000000000000000000000000) (dynLambda!625 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!345739 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9079 _values!1525)))))

(assert (=> b!345739 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9080 _keys!1895)))))

(declare-fun bm!26743 () Bool)

(declare-fun call!26752 () ListLongMap!4341)

(declare-fun call!26751 () ListLongMap!4341)

(assert (=> bm!26743 (= call!26752 call!26751)))

(declare-fun bm!26744 () Bool)

(declare-fun call!26747 () Bool)

(assert (=> bm!26744 (= call!26747 (contains!2246 lt!163055 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!345740 () Bool)

(declare-fun e!211902 () ListLongMap!4341)

(assert (=> b!345740 (= e!211902 call!26752)))

(declare-fun bm!26745 () Bool)

(declare-fun call!26746 () ListLongMap!4341)

(declare-fun getCurrentListMapNoExtraKeys!604 (array!18427 array!18425 (_ BitVec 32) (_ BitVec 32) V!10869 V!10869 (_ BitVec 32) Int) ListLongMap!4341)

(assert (=> bm!26745 (= call!26746 (getCurrentListMapNoExtraKeys!604 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!345742 () Bool)

(declare-fun e!211904 () Bool)

(assert (=> b!345742 (= e!211904 (validKeyInArray!0 (select (arr!8728 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26746 () Bool)

(declare-fun call!26748 () ListLongMap!4341)

(assert (=> bm!26746 (= call!26748 call!26746)))

(declare-fun b!345743 () Bool)

(declare-fun c!53058 () Bool)

(assert (=> b!345743 (= c!53058 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!211909 () ListLongMap!4341)

(assert (=> b!345743 (= e!211909 e!211902)))

(declare-fun b!345744 () Bool)

(assert (=> b!345744 (= e!211909 call!26752)))

(declare-fun b!345745 () Bool)

(declare-fun e!211913 () Bool)

(assert (=> b!345745 (= e!211913 (not call!26747))))

(declare-fun bm!26747 () Bool)

(declare-fun call!26750 () Bool)

(assert (=> bm!26747 (= call!26750 (contains!2246 lt!163055 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!345746 () Bool)

(declare-fun res!191257 () Bool)

(declare-fun e!211907 () Bool)

(assert (=> b!345746 (=> (not res!191257) (not e!211907))))

(declare-fun e!211905 () Bool)

(assert (=> b!345746 (= res!191257 e!211905)))

(declare-fun c!53057 () Bool)

(assert (=> b!345746 (= c!53057 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!345747 () Bool)

(declare-fun call!26749 () ListLongMap!4341)

(assert (=> b!345747 (= e!211902 call!26749)))

(declare-fun c!53059 () Bool)

(declare-fun c!53060 () Bool)

(declare-fun bm!26748 () Bool)

(declare-fun +!731 (ListLongMap!4341 tuple2!5428) ListLongMap!4341)

(assert (=> bm!26748 (= call!26751 (+!731 (ite c!53060 call!26746 (ite c!53059 call!26748 call!26749)) (ite (or c!53060 c!53059) (tuple2!5429 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5429 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!345748 () Bool)

(declare-fun e!211903 () Bool)

(assert (=> b!345748 (= e!211903 (= (apply!282 lt!163055 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun bm!26749 () Bool)

(assert (=> bm!26749 (= call!26749 call!26748)))

(declare-fun b!345749 () Bool)

(declare-fun e!211912 () Bool)

(assert (=> b!345749 (= e!211912 (= (apply!282 lt!163055 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!345750 () Bool)

(assert (=> b!345750 (= e!211905 (not call!26750))))

(declare-fun b!345751 () Bool)

(declare-fun e!211908 () ListLongMap!4341)

(assert (=> b!345751 (= e!211908 e!211909)))

(assert (=> b!345751 (= c!53059 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!345752 () Bool)

(assert (=> b!345752 (= e!211905 e!211903)))

(declare-fun res!191250 () Bool)

(assert (=> b!345752 (= res!191250 call!26750)))

(assert (=> b!345752 (=> (not res!191250) (not e!211903))))

(declare-fun b!345741 () Bool)

(declare-fun res!191255 () Bool)

(assert (=> b!345741 (=> (not res!191255) (not e!211907))))

(declare-fun e!211906 () Bool)

(assert (=> b!345741 (= res!191255 e!211906)))

(declare-fun res!191256 () Bool)

(assert (=> b!345741 (=> res!191256 e!211906)))

(assert (=> b!345741 (= res!191256 (not e!211910))))

(declare-fun res!191254 () Bool)

(assert (=> b!345741 (=> (not res!191254) (not e!211910))))

(assert (=> b!345741 (= res!191254 (bvslt #b00000000000000000000000000000000 (size!9080 _keys!1895)))))

(declare-fun d!71169 () Bool)

(assert (=> d!71169 e!211907))

(declare-fun res!191252 () Bool)

(assert (=> d!71169 (=> (not res!191252) (not e!211907))))

(assert (=> d!71169 (= res!191252 (or (bvsge #b00000000000000000000000000000000 (size!9080 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9080 _keys!1895)))))))

(declare-fun lt!163052 () ListLongMap!4341)

(assert (=> d!71169 (= lt!163055 lt!163052)))

(declare-fun lt!163046 () Unit!10737)

(declare-fun e!211914 () Unit!10737)

(assert (=> d!71169 (= lt!163046 e!211914)))

(declare-fun c!53061 () Bool)

(assert (=> d!71169 (= c!53061 e!211904)))

(declare-fun res!191258 () Bool)

(assert (=> d!71169 (=> (not res!191258) (not e!211904))))

(assert (=> d!71169 (= res!191258 (bvslt #b00000000000000000000000000000000 (size!9080 _keys!1895)))))

(assert (=> d!71169 (= lt!163052 e!211908)))

(assert (=> d!71169 (= c!53060 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71169 (validMask!0 mask!2385)))

(assert (=> d!71169 (= (getCurrentListMap!1707 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!163055)))

(declare-fun b!345753 () Bool)

(declare-fun Unit!10740 () Unit!10737)

(assert (=> b!345753 (= e!211914 Unit!10740)))

(declare-fun b!345754 () Bool)

(assert (=> b!345754 (= e!211913 e!211912)))

(declare-fun res!191251 () Bool)

(assert (=> b!345754 (= res!191251 call!26747)))

(assert (=> b!345754 (=> (not res!191251) (not e!211912))))

(declare-fun b!345755 () Bool)

(declare-fun lt!163053 () Unit!10737)

(assert (=> b!345755 (= e!211914 lt!163053)))

(declare-fun lt!163062 () ListLongMap!4341)

(assert (=> b!345755 (= lt!163062 (getCurrentListMapNoExtraKeys!604 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163064 () (_ BitVec 64))

(assert (=> b!345755 (= lt!163064 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163063 () (_ BitVec 64))

(assert (=> b!345755 (= lt!163063 (select (arr!8728 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163066 () Unit!10737)

(declare-fun addStillContains!258 (ListLongMap!4341 (_ BitVec 64) V!10869 (_ BitVec 64)) Unit!10737)

(assert (=> b!345755 (= lt!163066 (addStillContains!258 lt!163062 lt!163064 zeroValue!1467 lt!163063))))

(assert (=> b!345755 (contains!2246 (+!731 lt!163062 (tuple2!5429 lt!163064 zeroValue!1467)) lt!163063)))

(declare-fun lt!163061 () Unit!10737)

(assert (=> b!345755 (= lt!163061 lt!163066)))

(declare-fun lt!163057 () ListLongMap!4341)

(assert (=> b!345755 (= lt!163057 (getCurrentListMapNoExtraKeys!604 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163051 () (_ BitVec 64))

(assert (=> b!345755 (= lt!163051 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163058 () (_ BitVec 64))

(assert (=> b!345755 (= lt!163058 (select (arr!8728 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163060 () Unit!10737)

(declare-fun addApplyDifferent!258 (ListLongMap!4341 (_ BitVec 64) V!10869 (_ BitVec 64)) Unit!10737)

(assert (=> b!345755 (= lt!163060 (addApplyDifferent!258 lt!163057 lt!163051 minValue!1467 lt!163058))))

(assert (=> b!345755 (= (apply!282 (+!731 lt!163057 (tuple2!5429 lt!163051 minValue!1467)) lt!163058) (apply!282 lt!163057 lt!163058))))

(declare-fun lt!163054 () Unit!10737)

(assert (=> b!345755 (= lt!163054 lt!163060)))

(declare-fun lt!163049 () ListLongMap!4341)

(assert (=> b!345755 (= lt!163049 (getCurrentListMapNoExtraKeys!604 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163059 () (_ BitVec 64))

(assert (=> b!345755 (= lt!163059 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163065 () (_ BitVec 64))

(assert (=> b!345755 (= lt!163065 (select (arr!8728 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163048 () Unit!10737)

(assert (=> b!345755 (= lt!163048 (addApplyDifferent!258 lt!163049 lt!163059 zeroValue!1467 lt!163065))))

(assert (=> b!345755 (= (apply!282 (+!731 lt!163049 (tuple2!5429 lt!163059 zeroValue!1467)) lt!163065) (apply!282 lt!163049 lt!163065))))

(declare-fun lt!163047 () Unit!10737)

(assert (=> b!345755 (= lt!163047 lt!163048)))

(declare-fun lt!163050 () ListLongMap!4341)

(assert (=> b!345755 (= lt!163050 (getCurrentListMapNoExtraKeys!604 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163045 () (_ BitVec 64))

(assert (=> b!345755 (= lt!163045 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163056 () (_ BitVec 64))

(assert (=> b!345755 (= lt!163056 (select (arr!8728 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!345755 (= lt!163053 (addApplyDifferent!258 lt!163050 lt!163045 minValue!1467 lt!163056))))

(assert (=> b!345755 (= (apply!282 (+!731 lt!163050 (tuple2!5429 lt!163045 minValue!1467)) lt!163056) (apply!282 lt!163050 lt!163056))))

(declare-fun b!345756 () Bool)

(assert (=> b!345756 (= e!211907 e!211913)))

(declare-fun c!53056 () Bool)

(assert (=> b!345756 (= c!53056 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!345757 () Bool)

(assert (=> b!345757 (= e!211908 (+!731 call!26751 (tuple2!5429 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!345758 () Bool)

(assert (=> b!345758 (= e!211906 e!211911)))

(declare-fun res!191253 () Bool)

(assert (=> b!345758 (=> (not res!191253) (not e!211911))))

(assert (=> b!345758 (= res!191253 (contains!2246 lt!163055 (select (arr!8728 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!345758 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9080 _keys!1895)))))

(assert (= (and d!71169 c!53060) b!345757))

(assert (= (and d!71169 (not c!53060)) b!345751))

(assert (= (and b!345751 c!53059) b!345744))

(assert (= (and b!345751 (not c!53059)) b!345743))

(assert (= (and b!345743 c!53058) b!345740))

(assert (= (and b!345743 (not c!53058)) b!345747))

(assert (= (or b!345740 b!345747) bm!26749))

(assert (= (or b!345744 bm!26749) bm!26746))

(assert (= (or b!345744 b!345740) bm!26743))

(assert (= (or b!345757 bm!26746) bm!26745))

(assert (= (or b!345757 bm!26743) bm!26748))

(assert (= (and d!71169 res!191258) b!345742))

(assert (= (and d!71169 c!53061) b!345755))

(assert (= (and d!71169 (not c!53061)) b!345753))

(assert (= (and d!71169 res!191252) b!345741))

(assert (= (and b!345741 res!191254) b!345738))

(assert (= (and b!345741 (not res!191256)) b!345758))

(assert (= (and b!345758 res!191253) b!345739))

(assert (= (and b!345741 res!191255) b!345746))

(assert (= (and b!345746 c!53057) b!345752))

(assert (= (and b!345746 (not c!53057)) b!345750))

(assert (= (and b!345752 res!191250) b!345748))

(assert (= (or b!345752 b!345750) bm!26747))

(assert (= (and b!345746 res!191257) b!345756))

(assert (= (and b!345756 c!53056) b!345754))

(assert (= (and b!345756 (not c!53056)) b!345745))

(assert (= (and b!345754 res!191251) b!345749))

(assert (= (or b!345754 b!345745) bm!26744))

(declare-fun b_lambda!8467 () Bool)

(assert (=> (not b_lambda!8467) (not b!345739)))

(declare-fun t!10175 () Bool)

(declare-fun tb!3079 () Bool)

(assert (=> (and start!34582 (= defaultEntry!1528 defaultEntry!1528) t!10175) tb!3079))

(declare-fun result!5567 () Bool)

(assert (=> tb!3079 (= result!5567 tp_is_empty!7419)))

(assert (=> b!345739 t!10175))

(declare-fun b_and!14683 () Bool)

(assert (= b_and!14679 (and (=> t!10175 result!5567) b_and!14683)))

(declare-fun m!347019 () Bool)

(assert (=> bm!26744 m!347019))

(assert (=> b!345742 m!346999))

(assert (=> b!345742 m!346999))

(assert (=> b!345742 m!347007))

(declare-fun m!347021 () Bool)

(assert (=> b!345739 m!347021))

(assert (=> b!345739 m!346999))

(declare-fun m!347023 () Bool)

(assert (=> b!345739 m!347023))

(assert (=> b!345739 m!346999))

(assert (=> b!345739 m!347021))

(declare-fun m!347025 () Bool)

(assert (=> b!345739 m!347025))

(declare-fun m!347027 () Bool)

(assert (=> b!345739 m!347027))

(assert (=> b!345739 m!347025))

(declare-fun m!347029 () Bool)

(assert (=> b!345748 m!347029))

(assert (=> d!71169 m!346945))

(assert (=> b!345758 m!346999))

(assert (=> b!345758 m!346999))

(declare-fun m!347031 () Bool)

(assert (=> b!345758 m!347031))

(assert (=> b!345738 m!346999))

(assert (=> b!345738 m!346999))

(assert (=> b!345738 m!347007))

(declare-fun m!347033 () Bool)

(assert (=> b!345749 m!347033))

(declare-fun m!347035 () Bool)

(assert (=> b!345757 m!347035))

(declare-fun m!347037 () Bool)

(assert (=> b!345755 m!347037))

(declare-fun m!347039 () Bool)

(assert (=> b!345755 m!347039))

(declare-fun m!347041 () Bool)

(assert (=> b!345755 m!347041))

(assert (=> b!345755 m!347041))

(declare-fun m!347043 () Bool)

(assert (=> b!345755 m!347043))

(declare-fun m!347045 () Bool)

(assert (=> b!345755 m!347045))

(declare-fun m!347047 () Bool)

(assert (=> b!345755 m!347047))

(declare-fun m!347049 () Bool)

(assert (=> b!345755 m!347049))

(declare-fun m!347051 () Bool)

(assert (=> b!345755 m!347051))

(declare-fun m!347053 () Bool)

(assert (=> b!345755 m!347053))

(declare-fun m!347055 () Bool)

(assert (=> b!345755 m!347055))

(declare-fun m!347057 () Bool)

(assert (=> b!345755 m!347057))

(assert (=> b!345755 m!346999))

(declare-fun m!347059 () Bool)

(assert (=> b!345755 m!347059))

(declare-fun m!347061 () Bool)

(assert (=> b!345755 m!347061))

(declare-fun m!347063 () Bool)

(assert (=> b!345755 m!347063))

(assert (=> b!345755 m!347053))

(assert (=> b!345755 m!347037))

(declare-fun m!347065 () Bool)

(assert (=> b!345755 m!347065))

(assert (=> b!345755 m!347045))

(declare-fun m!347067 () Bool)

(assert (=> b!345755 m!347067))

(assert (=> bm!26745 m!347067))

(declare-fun m!347069 () Bool)

(assert (=> bm!26747 m!347069))

(declare-fun m!347071 () Bool)

(assert (=> bm!26748 m!347071))

(assert (=> b!345621 d!71169))

(declare-fun d!71171 () Bool)

(assert (=> d!71171 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34582 d!71171))

(declare-fun d!71173 () Bool)

(assert (=> d!71173 (= (array_inv!6460 _values!1525) (bvsge (size!9079 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34582 d!71173))

(declare-fun d!71175 () Bool)

(assert (=> d!71175 (= (array_inv!6461 _keys!1895) (bvsge (size!9080 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34582 d!71175))

(declare-fun bm!26752 () Bool)

(declare-fun call!26755 () Bool)

(declare-fun c!53064 () Bool)

(assert (=> bm!26752 (= call!26755 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53064 (Cons!5049 (select (arr!8728 _keys!1895) #b00000000000000000000000000000000) Nil!5050) Nil!5050)))))

(declare-fun b!345772 () Bool)

(declare-fun e!211925 () Bool)

(declare-fun contains!2247 (List!5053 (_ BitVec 64)) Bool)

(assert (=> b!345772 (= e!211925 (contains!2247 Nil!5050 (select (arr!8728 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345773 () Bool)

(declare-fun e!211923 () Bool)

(declare-fun e!211926 () Bool)

(assert (=> b!345773 (= e!211923 e!211926)))

(declare-fun res!191266 () Bool)

(assert (=> b!345773 (=> (not res!191266) (not e!211926))))

(assert (=> b!345773 (= res!191266 (not e!211925))))

(declare-fun res!191265 () Bool)

(assert (=> b!345773 (=> (not res!191265) (not e!211925))))

(assert (=> b!345773 (= res!191265 (validKeyInArray!0 (select (arr!8728 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345774 () Bool)

(declare-fun e!211924 () Bool)

(assert (=> b!345774 (= e!211926 e!211924)))

(assert (=> b!345774 (= c!53064 (validKeyInArray!0 (select (arr!8728 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345775 () Bool)

(assert (=> b!345775 (= e!211924 call!26755)))

(declare-fun d!71177 () Bool)

(declare-fun res!191267 () Bool)

(assert (=> d!71177 (=> res!191267 e!211923)))

(assert (=> d!71177 (= res!191267 (bvsge #b00000000000000000000000000000000 (size!9080 _keys!1895)))))

(assert (=> d!71177 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5050) e!211923)))

(declare-fun b!345771 () Bool)

(assert (=> b!345771 (= e!211924 call!26755)))

(assert (= (and d!71177 (not res!191267)) b!345773))

(assert (= (and b!345773 res!191265) b!345772))

(assert (= (and b!345773 res!191266) b!345774))

(assert (= (and b!345774 c!53064) b!345775))

(assert (= (and b!345774 (not c!53064)) b!345771))

(assert (= (or b!345775 b!345771) bm!26752))

(assert (=> bm!26752 m!346999))

(declare-fun m!347073 () Bool)

(assert (=> bm!26752 m!347073))

(assert (=> b!345772 m!346999))

(assert (=> b!345772 m!346999))

(declare-fun m!347075 () Bool)

(assert (=> b!345772 m!347075))

(assert (=> b!345773 m!346999))

(assert (=> b!345773 m!346999))

(assert (=> b!345773 m!347007))

(assert (=> b!345774 m!346999))

(assert (=> b!345774 m!346999))

(assert (=> b!345774 m!347007))

(assert (=> b!345626 d!71177))

(declare-fun b!345783 () Bool)

(declare-fun e!211932 () Bool)

(assert (=> b!345783 (= e!211932 tp_is_empty!7419)))

(declare-fun b!345782 () Bool)

(declare-fun e!211931 () Bool)

(assert (=> b!345782 (= e!211931 tp_is_empty!7419)))

(declare-fun mapIsEmpty!12579 () Bool)

(declare-fun mapRes!12579 () Bool)

(assert (=> mapIsEmpty!12579 mapRes!12579))

(declare-fun mapNonEmpty!12579 () Bool)

(declare-fun tp!25962 () Bool)

(assert (=> mapNonEmpty!12579 (= mapRes!12579 (and tp!25962 e!211931))))

(declare-fun mapKey!12579 () (_ BitVec 32))

(declare-fun mapValue!12579 () ValueCell!3366)

(declare-fun mapRest!12579 () (Array (_ BitVec 32) ValueCell!3366))

(assert (=> mapNonEmpty!12579 (= mapRest!12573 (store mapRest!12579 mapKey!12579 mapValue!12579))))

(declare-fun condMapEmpty!12579 () Bool)

(declare-fun mapDefault!12579 () ValueCell!3366)

(assert (=> mapNonEmpty!12573 (= condMapEmpty!12579 (= mapRest!12573 ((as const (Array (_ BitVec 32) ValueCell!3366)) mapDefault!12579)))))

(assert (=> mapNonEmpty!12573 (= tp!25953 (and e!211932 mapRes!12579))))

(assert (= (and mapNonEmpty!12573 condMapEmpty!12579) mapIsEmpty!12579))

(assert (= (and mapNonEmpty!12573 (not condMapEmpty!12579)) mapNonEmpty!12579))

(assert (= (and mapNonEmpty!12579 ((_ is ValueCellFull!3366) mapValue!12579)) b!345782))

(assert (= (and mapNonEmpty!12573 ((_ is ValueCellFull!3366) mapDefault!12579)) b!345783))

(declare-fun m!347077 () Bool)

(assert (=> mapNonEmpty!12579 m!347077))

(declare-fun b_lambda!8469 () Bool)

(assert (= b_lambda!8467 (or (and start!34582 b_free!7467) b_lambda!8469)))

(check-sat (not d!71161) (not b!345757) (not mapNonEmpty!12579) (not b_next!7467) (not b!345684) (not bm!26744) (not bm!26728) (not d!71167) (not bm!26745) (not b!345774) (not b!345749) (not b!345755) (not b!345738) (not b!345772) (not bm!26748) b_and!14683 (not bm!26752) (not b!345686) (not b!345695) (not b!345748) (not b!345673) (not b!345773) (not b!345693) (not b!345739) (not bm!26747) (not b!345758) (not b!345742) (not b_lambda!8469) (not d!71169) tp_is_empty!7419)
(check-sat b_and!14683 (not b_next!7467))
