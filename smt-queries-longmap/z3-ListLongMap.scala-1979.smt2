; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34722 () Bool)

(assert start!34722)

(declare-fun b_free!7543 () Bool)

(declare-fun b_next!7543 () Bool)

(assert (=> start!34722 (= b_free!7543 (not b_next!7543))))

(declare-fun tp!26193 () Bool)

(declare-fun b_and!14737 () Bool)

(assert (=> start!34722 (= tp!26193 b_and!14737)))

(declare-fun b!347100 () Bool)

(declare-fun res!192156 () Bool)

(declare-fun e!212669 () Bool)

(assert (=> b!347100 (=> (not res!192156) (not e!212669))))

(declare-datatypes ((array!18565 0))(
  ( (array!18566 (arr!8793 (Array (_ BitVec 32) (_ BitVec 64))) (size!9146 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18565)

(declare-datatypes ((List!5062 0))(
  ( (Nil!5059) (Cons!5058 (h!5914 (_ BitVec 64)) (t!10181 List!5062)) )
))
(declare-fun arrayNoDuplicates!0 (array!18565 (_ BitVec 32) List!5062) Bool)

(assert (=> b!347100 (= res!192156 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5059))))

(declare-fun b!347101 () Bool)

(declare-fun e!212673 () Bool)

(assert (=> b!347101 (= e!212669 e!212673)))

(declare-fun res!192160 () Bool)

(assert (=> b!347101 (=> (not res!192160) (not e!212673))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3388 0))(
  ( (MissingZero!3388 (index!15731 (_ BitVec 32))) (Found!3388 (index!15732 (_ BitVec 32))) (Intermediate!3388 (undefined!4200 Bool) (index!15733 (_ BitVec 32)) (x!34597 (_ BitVec 32))) (Undefined!3388) (MissingVacant!3388 (index!15734 (_ BitVec 32))) )
))
(declare-fun lt!163305 () SeekEntryResult!3388)

(get-info :version)

(assert (=> b!347101 (= res!192160 (and ((_ is Found!3388) lt!163305) (= (select (arr!8793 _keys!1895) (index!15732 lt!163305)) k0!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18565 (_ BitVec 32)) SeekEntryResult!3388)

(assert (=> b!347101 (= lt!163305 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12699 () Bool)

(declare-fun mapRes!12699 () Bool)

(assert (=> mapIsEmpty!12699 mapRes!12699))

(declare-fun b!347102 () Bool)

(assert (=> b!347102 (= e!212673 (not (and (bvsge (index!15732 lt!163305) #b00000000000000000000000000000000) (bvslt (index!15732 lt!163305) (size!9146 _keys!1895)))))))

(declare-fun arrayContainsKey!0 (array!18565 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347102 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10764 0))(
  ( (Unit!10765) )
))
(declare-fun lt!163304 () Unit!10764)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18565 (_ BitVec 64) (_ BitVec 32)) Unit!10764)

(assert (=> b!347102 (= lt!163304 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15732 lt!163305)))))

(declare-fun b!347103 () Bool)

(declare-fun res!192159 () Bool)

(assert (=> b!347103 (=> (not res!192159) (not e!212669))))

(declare-datatypes ((V!10971 0))(
  ( (V!10972 (val!3792 Int)) )
))
(declare-fun zeroValue!1467 () V!10971)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3404 0))(
  ( (ValueCellFull!3404 (v!5968 V!10971)) (EmptyCell!3404) )
))
(declare-datatypes ((array!18567 0))(
  ( (array!18568 (arr!8794 (Array (_ BitVec 32) ValueCell!3404)) (size!9147 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18567)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10971)

(declare-datatypes ((tuple2!5446 0))(
  ( (tuple2!5447 (_1!2734 (_ BitVec 64)) (_2!2734 V!10971)) )
))
(declare-datatypes ((List!5063 0))(
  ( (Nil!5060) (Cons!5059 (h!5915 tuple2!5446) (t!10182 List!5063)) )
))
(declare-datatypes ((ListLongMap!4349 0))(
  ( (ListLongMap!4350 (toList!2190 List!5063)) )
))
(declare-fun contains!2265 (ListLongMap!4349 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1696 (array!18565 array!18567 (_ BitVec 32) (_ BitVec 32) V!10971 V!10971 (_ BitVec 32) Int) ListLongMap!4349)

(assert (=> b!347103 (= res!192159 (not (contains!2265 (getCurrentListMap!1696 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!192158 () Bool)

(assert (=> start!34722 (=> (not res!192158) (not e!212669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34722 (= res!192158 (validMask!0 mask!2385))))

(assert (=> start!34722 e!212669))

(assert (=> start!34722 true))

(declare-fun tp_is_empty!7495 () Bool)

(assert (=> start!34722 tp_is_empty!7495))

(assert (=> start!34722 tp!26193))

(declare-fun e!212670 () Bool)

(declare-fun array_inv!6528 (array!18567) Bool)

(assert (=> start!34722 (and (array_inv!6528 _values!1525) e!212670)))

(declare-fun array_inv!6529 (array!18565) Bool)

(assert (=> start!34722 (array_inv!6529 _keys!1895)))

(declare-fun b!347104 () Bool)

(declare-fun res!192155 () Bool)

(assert (=> b!347104 (=> (not res!192155) (not e!212669))))

(assert (=> b!347104 (= res!192155 (and (= (size!9147 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9146 _keys!1895) (size!9147 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!347105 () Bool)

(declare-fun e!212671 () Bool)

(assert (=> b!347105 (= e!212671 tp_is_empty!7495)))

(declare-fun b!347106 () Bool)

(declare-fun res!192161 () Bool)

(assert (=> b!347106 (=> (not res!192161) (not e!212669))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18565 (_ BitVec 32)) Bool)

(assert (=> b!347106 (= res!192161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!347107 () Bool)

(declare-fun res!192154 () Bool)

(assert (=> b!347107 (=> (not res!192154) (not e!212669))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347107 (= res!192154 (validKeyInArray!0 k0!1348))))

(declare-fun b!347108 () Bool)

(declare-fun res!192157 () Bool)

(assert (=> b!347108 (=> (not res!192157) (not e!212673))))

(assert (=> b!347108 (= res!192157 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15732 lt!163305)))))

(declare-fun mapNonEmpty!12699 () Bool)

(declare-fun tp!26192 () Bool)

(assert (=> mapNonEmpty!12699 (= mapRes!12699 (and tp!26192 e!212671))))

(declare-fun mapRest!12699 () (Array (_ BitVec 32) ValueCell!3404))

(declare-fun mapValue!12699 () ValueCell!3404)

(declare-fun mapKey!12699 () (_ BitVec 32))

(assert (=> mapNonEmpty!12699 (= (arr!8794 _values!1525) (store mapRest!12699 mapKey!12699 mapValue!12699))))

(declare-fun b!347109 () Bool)

(declare-fun e!212674 () Bool)

(assert (=> b!347109 (= e!212674 tp_is_empty!7495)))

(declare-fun b!347110 () Bool)

(assert (=> b!347110 (= e!212670 (and e!212674 mapRes!12699))))

(declare-fun condMapEmpty!12699 () Bool)

(declare-fun mapDefault!12699 () ValueCell!3404)

(assert (=> b!347110 (= condMapEmpty!12699 (= (arr!8794 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3404)) mapDefault!12699)))))

(assert (= (and start!34722 res!192158) b!347104))

(assert (= (and b!347104 res!192155) b!347106))

(assert (= (and b!347106 res!192161) b!347100))

(assert (= (and b!347100 res!192156) b!347107))

(assert (= (and b!347107 res!192154) b!347103))

(assert (= (and b!347103 res!192159) b!347101))

(assert (= (and b!347101 res!192160) b!347108))

(assert (= (and b!347108 res!192157) b!347102))

(assert (= (and b!347110 condMapEmpty!12699) mapIsEmpty!12699))

(assert (= (and b!347110 (not condMapEmpty!12699)) mapNonEmpty!12699))

(assert (= (and mapNonEmpty!12699 ((_ is ValueCellFull!3404) mapValue!12699)) b!347105))

(assert (= (and b!347110 ((_ is ValueCellFull!3404) mapDefault!12699)) b!347109))

(assert (= start!34722 b!347110))

(declare-fun m!347585 () Bool)

(assert (=> b!347108 m!347585))

(declare-fun m!347587 () Bool)

(assert (=> b!347107 m!347587))

(declare-fun m!347589 () Bool)

(assert (=> start!34722 m!347589))

(declare-fun m!347591 () Bool)

(assert (=> start!34722 m!347591))

(declare-fun m!347593 () Bool)

(assert (=> start!34722 m!347593))

(declare-fun m!347595 () Bool)

(assert (=> b!347100 m!347595))

(declare-fun m!347597 () Bool)

(assert (=> b!347101 m!347597))

(declare-fun m!347599 () Bool)

(assert (=> b!347101 m!347599))

(declare-fun m!347601 () Bool)

(assert (=> b!347103 m!347601))

(assert (=> b!347103 m!347601))

(declare-fun m!347603 () Bool)

(assert (=> b!347103 m!347603))

(declare-fun m!347605 () Bool)

(assert (=> b!347106 m!347605))

(declare-fun m!347607 () Bool)

(assert (=> mapNonEmpty!12699 m!347607))

(declare-fun m!347609 () Bool)

(assert (=> b!347102 m!347609))

(declare-fun m!347611 () Bool)

(assert (=> b!347102 m!347611))

(check-sat (not b!347103) tp_is_empty!7495 (not mapNonEmpty!12699) (not b!347108) (not b!347101) (not b!347106) (not b!347107) (not start!34722) (not b_next!7543) (not b!347100) b_and!14737 (not b!347102))
(check-sat b_and!14737 (not b_next!7543))
(get-model)

(declare-fun b!347189 () Bool)

(declare-fun e!212717 () SeekEntryResult!3388)

(declare-fun lt!163326 () SeekEntryResult!3388)

(assert (=> b!347189 (= e!212717 (MissingZero!3388 (index!15733 lt!163326)))))

(declare-fun d!71059 () Bool)

(declare-fun lt!163325 () SeekEntryResult!3388)

(assert (=> d!71059 (and (or ((_ is Undefined!3388) lt!163325) (not ((_ is Found!3388) lt!163325)) (and (bvsge (index!15732 lt!163325) #b00000000000000000000000000000000) (bvslt (index!15732 lt!163325) (size!9146 _keys!1895)))) (or ((_ is Undefined!3388) lt!163325) ((_ is Found!3388) lt!163325) (not ((_ is MissingZero!3388) lt!163325)) (and (bvsge (index!15731 lt!163325) #b00000000000000000000000000000000) (bvslt (index!15731 lt!163325) (size!9146 _keys!1895)))) (or ((_ is Undefined!3388) lt!163325) ((_ is Found!3388) lt!163325) ((_ is MissingZero!3388) lt!163325) (not ((_ is MissingVacant!3388) lt!163325)) (and (bvsge (index!15734 lt!163325) #b00000000000000000000000000000000) (bvslt (index!15734 lt!163325) (size!9146 _keys!1895)))) (or ((_ is Undefined!3388) lt!163325) (ite ((_ is Found!3388) lt!163325) (= (select (arr!8793 _keys!1895) (index!15732 lt!163325)) k0!1348) (ite ((_ is MissingZero!3388) lt!163325) (= (select (arr!8793 _keys!1895) (index!15731 lt!163325)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3388) lt!163325) (= (select (arr!8793 _keys!1895) (index!15734 lt!163325)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!212718 () SeekEntryResult!3388)

(assert (=> d!71059 (= lt!163325 e!212718)))

(declare-fun c!53106 () Bool)

(assert (=> d!71059 (= c!53106 (and ((_ is Intermediate!3388) lt!163326) (undefined!4200 lt!163326)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18565 (_ BitVec 32)) SeekEntryResult!3388)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71059 (= lt!163326 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71059 (validMask!0 mask!2385)))

(assert (=> d!71059 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!163325)))

(declare-fun b!347190 () Bool)

(declare-fun c!53108 () Bool)

(declare-fun lt!163324 () (_ BitVec 64))

(assert (=> b!347190 (= c!53108 (= lt!163324 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!212719 () SeekEntryResult!3388)

(assert (=> b!347190 (= e!212719 e!212717)))

(declare-fun b!347191 () Bool)

(assert (=> b!347191 (= e!212718 Undefined!3388)))

(declare-fun b!347192 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18565 (_ BitVec 32)) SeekEntryResult!3388)

(assert (=> b!347192 (= e!212717 (seekKeyOrZeroReturnVacant!0 (x!34597 lt!163326) (index!15733 lt!163326) (index!15733 lt!163326) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!347193 () Bool)

(assert (=> b!347193 (= e!212718 e!212719)))

(assert (=> b!347193 (= lt!163324 (select (arr!8793 _keys!1895) (index!15733 lt!163326)))))

(declare-fun c!53107 () Bool)

(assert (=> b!347193 (= c!53107 (= lt!163324 k0!1348))))

(declare-fun b!347194 () Bool)

(assert (=> b!347194 (= e!212719 (Found!3388 (index!15733 lt!163326)))))

(assert (= (and d!71059 c!53106) b!347191))

(assert (= (and d!71059 (not c!53106)) b!347193))

(assert (= (and b!347193 c!53107) b!347194))

(assert (= (and b!347193 (not c!53107)) b!347190))

(assert (= (and b!347190 c!53108) b!347189))

(assert (= (and b!347190 (not c!53108)) b!347192))

(declare-fun m!347669 () Bool)

(assert (=> d!71059 m!347669))

(declare-fun m!347671 () Bool)

(assert (=> d!71059 m!347671))

(declare-fun m!347673 () Bool)

(assert (=> d!71059 m!347673))

(assert (=> d!71059 m!347669))

(declare-fun m!347675 () Bool)

(assert (=> d!71059 m!347675))

(assert (=> d!71059 m!347589))

(declare-fun m!347677 () Bool)

(assert (=> d!71059 m!347677))

(declare-fun m!347679 () Bool)

(assert (=> b!347192 m!347679))

(declare-fun m!347681 () Bool)

(assert (=> b!347193 m!347681))

(assert (=> b!347101 d!71059))

(declare-fun d!71061 () Bool)

(declare-fun res!192215 () Bool)

(declare-fun e!212728 () Bool)

(assert (=> d!71061 (=> res!192215 e!212728)))

(assert (=> d!71061 (= res!192215 (bvsge #b00000000000000000000000000000000 (size!9146 _keys!1895)))))

(assert (=> d!71061 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!212728)))

(declare-fun b!347203 () Bool)

(declare-fun e!212727 () Bool)

(assert (=> b!347203 (= e!212728 e!212727)))

(declare-fun c!53111 () Bool)

(assert (=> b!347203 (= c!53111 (validKeyInArray!0 (select (arr!8793 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!347204 () Bool)

(declare-fun e!212726 () Bool)

(assert (=> b!347204 (= e!212727 e!212726)))

(declare-fun lt!163333 () (_ BitVec 64))

(assert (=> b!347204 (= lt!163333 (select (arr!8793 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163335 () Unit!10764)

(assert (=> b!347204 (= lt!163335 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!163333 #b00000000000000000000000000000000))))

(assert (=> b!347204 (arrayContainsKey!0 _keys!1895 lt!163333 #b00000000000000000000000000000000)))

(declare-fun lt!163334 () Unit!10764)

(assert (=> b!347204 (= lt!163334 lt!163335)))

(declare-fun res!192214 () Bool)

(assert (=> b!347204 (= res!192214 (= (seekEntryOrOpen!0 (select (arr!8793 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3388 #b00000000000000000000000000000000)))))

(assert (=> b!347204 (=> (not res!192214) (not e!212726))))

(declare-fun b!347205 () Bool)

(declare-fun call!26813 () Bool)

(assert (=> b!347205 (= e!212726 call!26813)))

(declare-fun bm!26810 () Bool)

(assert (=> bm!26810 (= call!26813 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!347206 () Bool)

(assert (=> b!347206 (= e!212727 call!26813)))

(assert (= (and d!71061 (not res!192215)) b!347203))

(assert (= (and b!347203 c!53111) b!347204))

(assert (= (and b!347203 (not c!53111)) b!347206))

(assert (= (and b!347204 res!192214) b!347205))

(assert (= (or b!347205 b!347206) bm!26810))

(declare-fun m!347683 () Bool)

(assert (=> b!347203 m!347683))

(assert (=> b!347203 m!347683))

(declare-fun m!347685 () Bool)

(assert (=> b!347203 m!347685))

(assert (=> b!347204 m!347683))

(declare-fun m!347687 () Bool)

(assert (=> b!347204 m!347687))

(declare-fun m!347689 () Bool)

(assert (=> b!347204 m!347689))

(assert (=> b!347204 m!347683))

(declare-fun m!347691 () Bool)

(assert (=> b!347204 m!347691))

(declare-fun m!347693 () Bool)

(assert (=> bm!26810 m!347693))

(assert (=> b!347106 d!71061))

(declare-fun d!71063 () Bool)

(assert (=> d!71063 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!347107 d!71063))

(declare-fun d!71065 () Bool)

(declare-fun res!192220 () Bool)

(declare-fun e!212733 () Bool)

(assert (=> d!71065 (=> res!192220 e!212733)))

(assert (=> d!71065 (= res!192220 (= (select (arr!8793 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71065 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!212733)))

(declare-fun b!347211 () Bool)

(declare-fun e!212734 () Bool)

(assert (=> b!347211 (= e!212733 e!212734)))

(declare-fun res!192221 () Bool)

(assert (=> b!347211 (=> (not res!192221) (not e!212734))))

(assert (=> b!347211 (= res!192221 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!9146 _keys!1895)))))

(declare-fun b!347212 () Bool)

(assert (=> b!347212 (= e!212734 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71065 (not res!192220)) b!347211))

(assert (= (and b!347211 res!192221) b!347212))

(assert (=> d!71065 m!347683))

(declare-fun m!347695 () Bool)

(assert (=> b!347212 m!347695))

(assert (=> b!347102 d!71065))

(declare-fun d!71067 () Bool)

(assert (=> d!71067 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!163338 () Unit!10764)

(declare-fun choose!13 (array!18565 (_ BitVec 64) (_ BitVec 32)) Unit!10764)

(assert (=> d!71067 (= lt!163338 (choose!13 _keys!1895 k0!1348 (index!15732 lt!163305)))))

(assert (=> d!71067 (bvsge (index!15732 lt!163305) #b00000000000000000000000000000000)))

(assert (=> d!71067 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15732 lt!163305)) lt!163338)))

(declare-fun bs!11845 () Bool)

(assert (= bs!11845 d!71067))

(assert (=> bs!11845 m!347609))

(declare-fun m!347697 () Bool)

(assert (=> bs!11845 m!347697))

(assert (=> b!347102 d!71067))

(declare-fun d!71069 () Bool)

(declare-fun res!192222 () Bool)

(declare-fun e!212735 () Bool)

(assert (=> d!71069 (=> res!192222 e!212735)))

(assert (=> d!71069 (= res!192222 (= (select (arr!8793 _keys!1895) (index!15732 lt!163305)) k0!1348))))

(assert (=> d!71069 (= (arrayContainsKey!0 _keys!1895 k0!1348 (index!15732 lt!163305)) e!212735)))

(declare-fun b!347213 () Bool)

(declare-fun e!212736 () Bool)

(assert (=> b!347213 (= e!212735 e!212736)))

(declare-fun res!192223 () Bool)

(assert (=> b!347213 (=> (not res!192223) (not e!212736))))

(assert (=> b!347213 (= res!192223 (bvslt (bvadd (index!15732 lt!163305) #b00000000000000000000000000000001) (size!9146 _keys!1895)))))

(declare-fun b!347214 () Bool)

(assert (=> b!347214 (= e!212736 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd (index!15732 lt!163305) #b00000000000000000000000000000001)))))

(assert (= (and d!71069 (not res!192222)) b!347213))

(assert (= (and b!347213 res!192223) b!347214))

(assert (=> d!71069 m!347597))

(declare-fun m!347699 () Bool)

(assert (=> b!347214 m!347699))

(assert (=> b!347108 d!71069))

(declare-fun d!71071 () Bool)

(declare-fun e!212742 () Bool)

(assert (=> d!71071 e!212742))

(declare-fun res!192226 () Bool)

(assert (=> d!71071 (=> res!192226 e!212742)))

(declare-fun lt!163350 () Bool)

(assert (=> d!71071 (= res!192226 (not lt!163350))))

(declare-fun lt!163347 () Bool)

(assert (=> d!71071 (= lt!163350 lt!163347)))

(declare-fun lt!163348 () Unit!10764)

(declare-fun e!212741 () Unit!10764)

(assert (=> d!71071 (= lt!163348 e!212741)))

(declare-fun c!53114 () Bool)

(assert (=> d!71071 (= c!53114 lt!163347)))

(declare-fun containsKey!334 (List!5063 (_ BitVec 64)) Bool)

(assert (=> d!71071 (= lt!163347 (containsKey!334 (toList!2190 (getCurrentListMap!1696 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71071 (= (contains!2265 (getCurrentListMap!1696 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!163350)))

(declare-fun b!347221 () Bool)

(declare-fun lt!163349 () Unit!10764)

(assert (=> b!347221 (= e!212741 lt!163349)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!283 (List!5063 (_ BitVec 64)) Unit!10764)

(assert (=> b!347221 (= lt!163349 (lemmaContainsKeyImpliesGetValueByKeyDefined!283 (toList!2190 (getCurrentListMap!1696 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!348 0))(
  ( (Some!347 (v!5971 V!10971)) (None!346) )
))
(declare-fun isDefined!284 (Option!348) Bool)

(declare-fun getValueByKey!342 (List!5063 (_ BitVec 64)) Option!348)

(assert (=> b!347221 (isDefined!284 (getValueByKey!342 (toList!2190 (getCurrentListMap!1696 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!347222 () Bool)

(declare-fun Unit!10770 () Unit!10764)

(assert (=> b!347222 (= e!212741 Unit!10770)))

(declare-fun b!347223 () Bool)

(assert (=> b!347223 (= e!212742 (isDefined!284 (getValueByKey!342 (toList!2190 (getCurrentListMap!1696 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71071 c!53114) b!347221))

(assert (= (and d!71071 (not c!53114)) b!347222))

(assert (= (and d!71071 (not res!192226)) b!347223))

(declare-fun m!347701 () Bool)

(assert (=> d!71071 m!347701))

(declare-fun m!347703 () Bool)

(assert (=> b!347221 m!347703))

(declare-fun m!347705 () Bool)

(assert (=> b!347221 m!347705))

(assert (=> b!347221 m!347705))

(declare-fun m!347707 () Bool)

(assert (=> b!347221 m!347707))

(assert (=> b!347223 m!347705))

(assert (=> b!347223 m!347705))

(assert (=> b!347223 m!347707))

(assert (=> b!347103 d!71071))

(declare-fun b!347266 () Bool)

(declare-fun e!212779 () Bool)

(assert (=> b!347266 (= e!212779 (validKeyInArray!0 (select (arr!8793 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26825 () Bool)

(declare-fun call!26830 () ListLongMap!4349)

(declare-fun call!26831 () ListLongMap!4349)

(assert (=> bm!26825 (= call!26830 call!26831)))

(declare-fun b!347267 () Bool)

(declare-fun e!212774 () Unit!10764)

(declare-fun Unit!10771 () Unit!10764)

(assert (=> b!347267 (= e!212774 Unit!10771)))

(declare-fun b!347268 () Bool)

(declare-fun e!212773 () Bool)

(declare-fun e!212781 () Bool)

(assert (=> b!347268 (= e!212773 e!212781)))

(declare-fun res!192245 () Bool)

(assert (=> b!347268 (=> (not res!192245) (not e!212781))))

(declare-fun lt!163412 () ListLongMap!4349)

(assert (=> b!347268 (= res!192245 (contains!2265 lt!163412 (select (arr!8793 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!347268 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9146 _keys!1895)))))

(declare-fun b!347269 () Bool)

(declare-fun e!212775 () ListLongMap!4349)

(declare-fun call!26828 () ListLongMap!4349)

(assert (=> b!347269 (= e!212775 call!26828)))

(declare-fun b!347270 () Bool)

(declare-fun e!212770 () ListLongMap!4349)

(assert (=> b!347270 (= e!212770 call!26828)))

(declare-fun bm!26826 () Bool)

(declare-fun call!26829 () Bool)

(assert (=> bm!26826 (= call!26829 (contains!2265 lt!163412 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!347272 () Bool)

(declare-fun e!212777 () ListLongMap!4349)

(assert (=> b!347272 (= e!212777 e!212775)))

(declare-fun c!53127 () Bool)

(assert (=> b!347272 (= c!53127 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!347273 () Bool)

(declare-fun e!212780 () Bool)

(assert (=> b!347273 (= e!212780 (validKeyInArray!0 (select (arr!8793 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!347274 () Bool)

(declare-fun e!212769 () Bool)

(declare-fun call!26834 () Bool)

(assert (=> b!347274 (= e!212769 (not call!26834))))

(declare-fun b!347275 () Bool)

(declare-fun res!192253 () Bool)

(declare-fun e!212772 () Bool)

(assert (=> b!347275 (=> (not res!192253) (not e!212772))))

(assert (=> b!347275 (= res!192253 e!212773)))

(declare-fun res!192250 () Bool)

(assert (=> b!347275 (=> res!192250 e!212773)))

(assert (=> b!347275 (= res!192250 (not e!212779))))

(declare-fun res!192252 () Bool)

(assert (=> b!347275 (=> (not res!192252) (not e!212779))))

(assert (=> b!347275 (= res!192252 (bvslt #b00000000000000000000000000000000 (size!9146 _keys!1895)))))

(declare-fun call!26832 () ListLongMap!4349)

(declare-fun c!53132 () Bool)

(declare-fun bm!26827 () Bool)

(declare-fun call!26833 () ListLongMap!4349)

(declare-fun +!739 (ListLongMap!4349 tuple2!5446) ListLongMap!4349)

(assert (=> bm!26827 (= call!26833 (+!739 (ite c!53132 call!26831 (ite c!53127 call!26830 call!26832)) (ite (or c!53132 c!53127) (tuple2!5447 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5447 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun bm!26828 () Bool)

(assert (=> bm!26828 (= call!26834 (contains!2265 lt!163412 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!347276 () Bool)

(declare-fun apply!286 (ListLongMap!4349 (_ BitVec 64)) V!10971)

(declare-fun get!4724 (ValueCell!3404 V!10971) V!10971)

(declare-fun dynLambda!620 (Int (_ BitVec 64)) V!10971)

(assert (=> b!347276 (= e!212781 (= (apply!286 lt!163412 (select (arr!8793 _keys!1895) #b00000000000000000000000000000000)) (get!4724 (select (arr!8794 _values!1525) #b00000000000000000000000000000000) (dynLambda!620 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!347276 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9147 _values!1525)))))

(assert (=> b!347276 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9146 _keys!1895)))))

(declare-fun b!347277 () Bool)

(declare-fun e!212778 () Bool)

(assert (=> b!347277 (= e!212778 (= (apply!286 lt!163412 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!347278 () Bool)

(declare-fun res!192251 () Bool)

(assert (=> b!347278 (=> (not res!192251) (not e!212772))))

(assert (=> b!347278 (= res!192251 e!212769)))

(declare-fun c!53131 () Bool)

(assert (=> b!347278 (= c!53131 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!26829 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!602 (array!18565 array!18567 (_ BitVec 32) (_ BitVec 32) V!10971 V!10971 (_ BitVec 32) Int) ListLongMap!4349)

(assert (=> bm!26829 (= call!26831 (getCurrentListMapNoExtraKeys!602 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun bm!26830 () Bool)

(assert (=> bm!26830 (= call!26828 call!26833)))

(declare-fun b!347279 () Bool)

(declare-fun lt!163405 () Unit!10764)

(assert (=> b!347279 (= e!212774 lt!163405)))

(declare-fun lt!163398 () ListLongMap!4349)

(assert (=> b!347279 (= lt!163398 (getCurrentListMapNoExtraKeys!602 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163406 () (_ BitVec 64))

(assert (=> b!347279 (= lt!163406 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163414 () (_ BitVec 64))

(assert (=> b!347279 (= lt!163414 (select (arr!8793 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163403 () Unit!10764)

(declare-fun addStillContains!262 (ListLongMap!4349 (_ BitVec 64) V!10971 (_ BitVec 64)) Unit!10764)

(assert (=> b!347279 (= lt!163403 (addStillContains!262 lt!163398 lt!163406 zeroValue!1467 lt!163414))))

(assert (=> b!347279 (contains!2265 (+!739 lt!163398 (tuple2!5447 lt!163406 zeroValue!1467)) lt!163414)))

(declare-fun lt!163409 () Unit!10764)

(assert (=> b!347279 (= lt!163409 lt!163403)))

(declare-fun lt!163411 () ListLongMap!4349)

(assert (=> b!347279 (= lt!163411 (getCurrentListMapNoExtraKeys!602 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163415 () (_ BitVec 64))

(assert (=> b!347279 (= lt!163415 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163402 () (_ BitVec 64))

(assert (=> b!347279 (= lt!163402 (select (arr!8793 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163410 () Unit!10764)

(declare-fun addApplyDifferent!262 (ListLongMap!4349 (_ BitVec 64) V!10971 (_ BitVec 64)) Unit!10764)

(assert (=> b!347279 (= lt!163410 (addApplyDifferent!262 lt!163411 lt!163415 minValue!1467 lt!163402))))

(assert (=> b!347279 (= (apply!286 (+!739 lt!163411 (tuple2!5447 lt!163415 minValue!1467)) lt!163402) (apply!286 lt!163411 lt!163402))))

(declare-fun lt!163397 () Unit!10764)

(assert (=> b!347279 (= lt!163397 lt!163410)))

(declare-fun lt!163399 () ListLongMap!4349)

(assert (=> b!347279 (= lt!163399 (getCurrentListMapNoExtraKeys!602 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163413 () (_ BitVec 64))

(assert (=> b!347279 (= lt!163413 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163400 () (_ BitVec 64))

(assert (=> b!347279 (= lt!163400 (select (arr!8793 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163407 () Unit!10764)

(assert (=> b!347279 (= lt!163407 (addApplyDifferent!262 lt!163399 lt!163413 zeroValue!1467 lt!163400))))

(assert (=> b!347279 (= (apply!286 (+!739 lt!163399 (tuple2!5447 lt!163413 zeroValue!1467)) lt!163400) (apply!286 lt!163399 lt!163400))))

(declare-fun lt!163404 () Unit!10764)

(assert (=> b!347279 (= lt!163404 lt!163407)))

(declare-fun lt!163416 () ListLongMap!4349)

(assert (=> b!347279 (= lt!163416 (getCurrentListMapNoExtraKeys!602 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163395 () (_ BitVec 64))

(assert (=> b!347279 (= lt!163395 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163408 () (_ BitVec 64))

(assert (=> b!347279 (= lt!163408 (select (arr!8793 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!347279 (= lt!163405 (addApplyDifferent!262 lt!163416 lt!163395 minValue!1467 lt!163408))))

(assert (=> b!347279 (= (apply!286 (+!739 lt!163416 (tuple2!5447 lt!163395 minValue!1467)) lt!163408) (apply!286 lt!163416 lt!163408))))

(declare-fun b!347280 () Bool)

(declare-fun e!212771 () Bool)

(assert (=> b!347280 (= e!212769 e!212771)))

(declare-fun res!192248 () Bool)

(assert (=> b!347280 (= res!192248 call!26834)))

(assert (=> b!347280 (=> (not res!192248) (not e!212771))))

(declare-fun b!347281 () Bool)

(declare-fun e!212776 () Bool)

(assert (=> b!347281 (= e!212776 (not call!26829))))

(declare-fun b!347282 () Bool)

(assert (=> b!347282 (= e!212770 call!26832)))

(declare-fun b!347283 () Bool)

(assert (=> b!347283 (= e!212771 (= (apply!286 lt!163412 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!347284 () Bool)

(assert (=> b!347284 (= e!212776 e!212778)))

(declare-fun res!192246 () Bool)

(assert (=> b!347284 (= res!192246 call!26829)))

(assert (=> b!347284 (=> (not res!192246) (not e!212778))))

(declare-fun b!347285 () Bool)

(assert (=> b!347285 (= e!212772 e!212776)))

(declare-fun c!53128 () Bool)

(assert (=> b!347285 (= c!53128 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!347271 () Bool)

(assert (=> b!347271 (= e!212777 (+!739 call!26833 (tuple2!5447 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun d!71073 () Bool)

(assert (=> d!71073 e!212772))

(declare-fun res!192249 () Bool)

(assert (=> d!71073 (=> (not res!192249) (not e!212772))))

(assert (=> d!71073 (= res!192249 (or (bvsge #b00000000000000000000000000000000 (size!9146 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9146 _keys!1895)))))))

(declare-fun lt!163401 () ListLongMap!4349)

(assert (=> d!71073 (= lt!163412 lt!163401)))

(declare-fun lt!163396 () Unit!10764)

(assert (=> d!71073 (= lt!163396 e!212774)))

(declare-fun c!53130 () Bool)

(assert (=> d!71073 (= c!53130 e!212780)))

(declare-fun res!192247 () Bool)

(assert (=> d!71073 (=> (not res!192247) (not e!212780))))

(assert (=> d!71073 (= res!192247 (bvslt #b00000000000000000000000000000000 (size!9146 _keys!1895)))))

(assert (=> d!71073 (= lt!163401 e!212777)))

(assert (=> d!71073 (= c!53132 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71073 (validMask!0 mask!2385)))

(assert (=> d!71073 (= (getCurrentListMap!1696 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!163412)))

(declare-fun bm!26831 () Bool)

(assert (=> bm!26831 (= call!26832 call!26830)))

(declare-fun b!347286 () Bool)

(declare-fun c!53129 () Bool)

(assert (=> b!347286 (= c!53129 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!347286 (= e!212775 e!212770)))

(assert (= (and d!71073 c!53132) b!347271))

(assert (= (and d!71073 (not c!53132)) b!347272))

(assert (= (and b!347272 c!53127) b!347269))

(assert (= (and b!347272 (not c!53127)) b!347286))

(assert (= (and b!347286 c!53129) b!347270))

(assert (= (and b!347286 (not c!53129)) b!347282))

(assert (= (or b!347270 b!347282) bm!26831))

(assert (= (or b!347269 bm!26831) bm!26825))

(assert (= (or b!347269 b!347270) bm!26830))

(assert (= (or b!347271 bm!26825) bm!26829))

(assert (= (or b!347271 bm!26830) bm!26827))

(assert (= (and d!71073 res!192247) b!347273))

(assert (= (and d!71073 c!53130) b!347279))

(assert (= (and d!71073 (not c!53130)) b!347267))

(assert (= (and d!71073 res!192249) b!347275))

(assert (= (and b!347275 res!192252) b!347266))

(assert (= (and b!347275 (not res!192250)) b!347268))

(assert (= (and b!347268 res!192245) b!347276))

(assert (= (and b!347275 res!192253) b!347278))

(assert (= (and b!347278 c!53131) b!347280))

(assert (= (and b!347278 (not c!53131)) b!347274))

(assert (= (and b!347280 res!192248) b!347283))

(assert (= (or b!347280 b!347274) bm!26828))

(assert (= (and b!347278 res!192251) b!347285))

(assert (= (and b!347285 c!53128) b!347284))

(assert (= (and b!347285 (not c!53128)) b!347281))

(assert (= (and b!347284 res!192246) b!347277))

(assert (= (or b!347284 b!347281) bm!26826))

(declare-fun b_lambda!8465 () Bool)

(assert (=> (not b_lambda!8465) (not b!347276)))

(declare-fun t!10184 () Bool)

(declare-fun tb!3079 () Bool)

(assert (=> (and start!34722 (= defaultEntry!1528 defaultEntry!1528) t!10184) tb!3079))

(declare-fun result!5583 () Bool)

(assert (=> tb!3079 (= result!5583 tp_is_empty!7495)))

(assert (=> b!347276 t!10184))

(declare-fun b_and!14743 () Bool)

(assert (= b_and!14737 (and (=> t!10184 result!5583) b_and!14743)))

(declare-fun m!347709 () Bool)

(assert (=> bm!26827 m!347709))

(assert (=> b!347268 m!347683))

(assert (=> b!347268 m!347683))

(declare-fun m!347711 () Bool)

(assert (=> b!347268 m!347711))

(declare-fun m!347713 () Bool)

(assert (=> bm!26829 m!347713))

(assert (=> b!347266 m!347683))

(assert (=> b!347266 m!347683))

(assert (=> b!347266 m!347685))

(declare-fun m!347715 () Bool)

(assert (=> b!347283 m!347715))

(declare-fun m!347717 () Bool)

(assert (=> b!347271 m!347717))

(declare-fun m!347719 () Bool)

(assert (=> b!347279 m!347719))

(declare-fun m!347721 () Bool)

(assert (=> b!347279 m!347721))

(declare-fun m!347723 () Bool)

(assert (=> b!347279 m!347723))

(declare-fun m!347725 () Bool)

(assert (=> b!347279 m!347725))

(declare-fun m!347727 () Bool)

(assert (=> b!347279 m!347727))

(declare-fun m!347729 () Bool)

(assert (=> b!347279 m!347729))

(declare-fun m!347731 () Bool)

(assert (=> b!347279 m!347731))

(assert (=> b!347279 m!347727))

(declare-fun m!347733 () Bool)

(assert (=> b!347279 m!347733))

(assert (=> b!347279 m!347721))

(assert (=> b!347279 m!347713))

(declare-fun m!347735 () Bool)

(assert (=> b!347279 m!347735))

(assert (=> b!347279 m!347733))

(declare-fun m!347737 () Bool)

(assert (=> b!347279 m!347737))

(declare-fun m!347739 () Bool)

(assert (=> b!347279 m!347739))

(assert (=> b!347279 m!347683))

(declare-fun m!347741 () Bool)

(assert (=> b!347279 m!347741))

(declare-fun m!347743 () Bool)

(assert (=> b!347279 m!347743))

(declare-fun m!347745 () Bool)

(assert (=> b!347279 m!347745))

(assert (=> b!347279 m!347725))

(declare-fun m!347747 () Bool)

(assert (=> b!347279 m!347747))

(declare-fun m!347749 () Bool)

(assert (=> b!347277 m!347749))

(declare-fun m!347751 () Bool)

(assert (=> bm!26826 m!347751))

(assert (=> b!347276 m!347683))

(declare-fun m!347753 () Bool)

(assert (=> b!347276 m!347753))

(declare-fun m!347755 () Bool)

(assert (=> b!347276 m!347755))

(declare-fun m!347757 () Bool)

(assert (=> b!347276 m!347757))

(declare-fun m!347759 () Bool)

(assert (=> b!347276 m!347759))

(assert (=> b!347276 m!347757))

(assert (=> b!347276 m!347755))

(assert (=> b!347276 m!347683))

(assert (=> d!71073 m!347589))

(declare-fun m!347761 () Bool)

(assert (=> bm!26828 m!347761))

(assert (=> b!347273 m!347683))

(assert (=> b!347273 m!347683))

(assert (=> b!347273 m!347685))

(assert (=> b!347103 d!71073))

(declare-fun b!347299 () Bool)

(declare-fun e!212793 () Bool)

(declare-fun contains!2266 (List!5062 (_ BitVec 64)) Bool)

(assert (=> b!347299 (= e!212793 (contains!2266 Nil!5059 (select (arr!8793 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!347300 () Bool)

(declare-fun e!212791 () Bool)

(declare-fun call!26837 () Bool)

(assert (=> b!347300 (= e!212791 call!26837)))

(declare-fun b!347302 () Bool)

(declare-fun e!212792 () Bool)

(declare-fun e!212790 () Bool)

(assert (=> b!347302 (= e!212792 e!212790)))

(declare-fun res!192262 () Bool)

(assert (=> b!347302 (=> (not res!192262) (not e!212790))))

(assert (=> b!347302 (= res!192262 (not e!212793))))

(declare-fun res!192261 () Bool)

(assert (=> b!347302 (=> (not res!192261) (not e!212793))))

(assert (=> b!347302 (= res!192261 (validKeyInArray!0 (select (arr!8793 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26834 () Bool)

(declare-fun c!53135 () Bool)

(assert (=> bm!26834 (= call!26837 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53135 (Cons!5058 (select (arr!8793 _keys!1895) #b00000000000000000000000000000000) Nil!5059) Nil!5059)))))

(declare-fun b!347303 () Bool)

(assert (=> b!347303 (= e!212791 call!26837)))

(declare-fun b!347301 () Bool)

(assert (=> b!347301 (= e!212790 e!212791)))

(assert (=> b!347301 (= c!53135 (validKeyInArray!0 (select (arr!8793 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71075 () Bool)

(declare-fun res!192260 () Bool)

(assert (=> d!71075 (=> res!192260 e!212792)))

(assert (=> d!71075 (= res!192260 (bvsge #b00000000000000000000000000000000 (size!9146 _keys!1895)))))

(assert (=> d!71075 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5059) e!212792)))

(assert (= (and d!71075 (not res!192260)) b!347302))

(assert (= (and b!347302 res!192261) b!347299))

(assert (= (and b!347302 res!192262) b!347301))

(assert (= (and b!347301 c!53135) b!347303))

(assert (= (and b!347301 (not c!53135)) b!347300))

(assert (= (or b!347303 b!347300) bm!26834))

(assert (=> b!347299 m!347683))

(assert (=> b!347299 m!347683))

(declare-fun m!347763 () Bool)

(assert (=> b!347299 m!347763))

(assert (=> b!347302 m!347683))

(assert (=> b!347302 m!347683))

(assert (=> b!347302 m!347685))

(assert (=> bm!26834 m!347683))

(declare-fun m!347765 () Bool)

(assert (=> bm!26834 m!347765))

(assert (=> b!347301 m!347683))

(assert (=> b!347301 m!347683))

(assert (=> b!347301 m!347685))

(assert (=> b!347100 d!71075))

(declare-fun d!71077 () Bool)

(assert (=> d!71077 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34722 d!71077))

(declare-fun d!71079 () Bool)

(assert (=> d!71079 (= (array_inv!6528 _values!1525) (bvsge (size!9147 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34722 d!71079))

(declare-fun d!71081 () Bool)

(assert (=> d!71081 (= (array_inv!6529 _keys!1895) (bvsge (size!9146 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34722 d!71081))

(declare-fun condMapEmpty!12708 () Bool)

(declare-fun mapDefault!12708 () ValueCell!3404)

(assert (=> mapNonEmpty!12699 (= condMapEmpty!12708 (= mapRest!12699 ((as const (Array (_ BitVec 32) ValueCell!3404)) mapDefault!12708)))))

(declare-fun e!212799 () Bool)

(declare-fun mapRes!12708 () Bool)

(assert (=> mapNonEmpty!12699 (= tp!26192 (and e!212799 mapRes!12708))))

(declare-fun mapNonEmpty!12708 () Bool)

(declare-fun tp!26208 () Bool)

(declare-fun e!212798 () Bool)

(assert (=> mapNonEmpty!12708 (= mapRes!12708 (and tp!26208 e!212798))))

(declare-fun mapKey!12708 () (_ BitVec 32))

(declare-fun mapRest!12708 () (Array (_ BitVec 32) ValueCell!3404))

(declare-fun mapValue!12708 () ValueCell!3404)

(assert (=> mapNonEmpty!12708 (= mapRest!12699 (store mapRest!12708 mapKey!12708 mapValue!12708))))

(declare-fun mapIsEmpty!12708 () Bool)

(assert (=> mapIsEmpty!12708 mapRes!12708))

(declare-fun b!347311 () Bool)

(assert (=> b!347311 (= e!212799 tp_is_empty!7495)))

(declare-fun b!347310 () Bool)

(assert (=> b!347310 (= e!212798 tp_is_empty!7495)))

(assert (= (and mapNonEmpty!12699 condMapEmpty!12708) mapIsEmpty!12708))

(assert (= (and mapNonEmpty!12699 (not condMapEmpty!12708)) mapNonEmpty!12708))

(assert (= (and mapNonEmpty!12708 ((_ is ValueCellFull!3404) mapValue!12708)) b!347310))

(assert (= (and mapNonEmpty!12699 ((_ is ValueCellFull!3404) mapDefault!12708)) b!347311))

(declare-fun m!347767 () Bool)

(assert (=> mapNonEmpty!12708 m!347767))

(declare-fun b_lambda!8467 () Bool)

(assert (= b_lambda!8465 (or (and start!34722 b_free!7543) b_lambda!8467)))

(check-sat (not d!71067) (not bm!26826) (not bm!26834) (not d!71071) (not b!347223) (not b!347301) (not bm!26827) (not b!347204) (not d!71073) (not b_lambda!8467) (not bm!26828) (not b!347212) (not b!347277) (not b!347276) b_and!14743 (not b!347271) (not b!347299) tp_is_empty!7495 (not b!347192) (not b!347273) (not mapNonEmpty!12708) (not bm!26829) (not b_next!7543) (not b!347268) (not b!347279) (not b!347214) (not bm!26810) (not b!347302) (not b!347266) (not b!347221) (not b!347283) (not b!347203) (not d!71059))
(check-sat b_and!14743 (not b_next!7543))
