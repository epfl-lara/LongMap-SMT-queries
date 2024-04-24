; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34120 () Bool)

(assert start!34120)

(declare-fun b_free!7177 () Bool)

(declare-fun b_next!7177 () Bool)

(assert (=> start!34120 (= b_free!7177 (not b_next!7177))))

(declare-fun tp!25062 () Bool)

(declare-fun b_and!14389 () Bool)

(assert (=> start!34120 (= tp!25062 b_and!14389)))

(declare-fun b!340096 () Bool)

(declare-fun e!208644 () Bool)

(declare-fun e!208642 () Bool)

(assert (=> b!340096 (= e!208644 e!208642)))

(declare-fun res!187866 () Bool)

(assert (=> b!340096 (=> (not res!187866) (not e!208642))))

(declare-datatypes ((SeekEntryResult!3219 0))(
  ( (MissingZero!3219 (index!15055 (_ BitVec 32))) (Found!3219 (index!15056 (_ BitVec 32))) (Intermediate!3219 (undefined!4031 Bool) (index!15057 (_ BitVec 32)) (x!33832 (_ BitVec 32))) (Undefined!3219) (MissingVacant!3219 (index!15058 (_ BitVec 32))) )
))
(declare-fun lt!161494 () SeekEntryResult!3219)

(get-info :version)

(assert (=> b!340096 (= res!187866 (and (not ((_ is Found!3219) lt!161494)) (not ((_ is MissingZero!3219) lt!161494)) ((_ is MissingVacant!3219) lt!161494)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!17842 0))(
  ( (array!17843 (arr!8442 (Array (_ BitVec 32) (_ BitVec 64))) (size!8794 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17842)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17842 (_ BitVec 32)) SeekEntryResult!3219)

(assert (=> b!340096 (= lt!161494 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!340097 () Bool)

(declare-fun res!187868 () Bool)

(assert (=> b!340097 (=> (not res!187868) (not e!208642))))

(declare-fun arrayContainsKey!0 (array!17842 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!340097 (= res!187868 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340098 () Bool)

(declare-fun e!208646 () Bool)

(declare-fun e!208641 () Bool)

(declare-fun mapRes!12117 () Bool)

(assert (=> b!340098 (= e!208646 (and e!208641 mapRes!12117))))

(declare-fun condMapEmpty!12117 () Bool)

(declare-datatypes ((V!10483 0))(
  ( (V!10484 (val!3609 Int)) )
))
(declare-datatypes ((ValueCell!3221 0))(
  ( (ValueCellFull!3221 (v!5781 V!10483)) (EmptyCell!3221) )
))
(declare-datatypes ((array!17844 0))(
  ( (array!17845 (arr!8443 (Array (_ BitVec 32) ValueCell!3221)) (size!8795 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17844)

(declare-fun mapDefault!12117 () ValueCell!3221)

(assert (=> b!340098 (= condMapEmpty!12117 (= (arr!8443 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3221)) mapDefault!12117)))))

(declare-fun b!340099 () Bool)

(assert (=> b!340099 (= e!208642 (or (bvsge #b00000000000000000000000000000000 (size!8794 _keys!1895)) (bvsge (size!8794 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun res!187867 () Bool)

(assert (=> start!34120 (=> (not res!187867) (not e!208644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34120 (= res!187867 (validMask!0 mask!2385))))

(assert (=> start!34120 e!208644))

(assert (=> start!34120 true))

(declare-fun tp_is_empty!7129 () Bool)

(assert (=> start!34120 tp_is_empty!7129))

(assert (=> start!34120 tp!25062))

(declare-fun array_inv!6258 (array!17844) Bool)

(assert (=> start!34120 (and (array_inv!6258 _values!1525) e!208646)))

(declare-fun array_inv!6259 (array!17842) Bool)

(assert (=> start!34120 (array_inv!6259 _keys!1895)))

(declare-fun b!340100 () Bool)

(assert (=> b!340100 (= e!208641 tp_is_empty!7129)))

(declare-fun b!340101 () Bool)

(declare-fun res!187862 () Bool)

(assert (=> b!340101 (=> (not res!187862) (not e!208644))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340101 (= res!187862 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!12117 () Bool)

(assert (=> mapIsEmpty!12117 mapRes!12117))

(declare-fun b!340102 () Bool)

(declare-fun res!187861 () Bool)

(assert (=> b!340102 (=> (not res!187861) (not e!208644))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!340102 (= res!187861 (and (= (size!8795 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8794 _keys!1895) (size!8795 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!340103 () Bool)

(declare-fun res!187864 () Bool)

(assert (=> b!340103 (=> (not res!187864) (not e!208644))))

(declare-datatypes ((List!4757 0))(
  ( (Nil!4754) (Cons!4753 (h!5609 (_ BitVec 64)) (t!9855 List!4757)) )
))
(declare-fun arrayNoDuplicates!0 (array!17842 (_ BitVec 32) List!4757) Bool)

(assert (=> b!340103 (= res!187864 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4754))))

(declare-fun b!340104 () Bool)

(declare-fun res!187863 () Bool)

(assert (=> b!340104 (=> (not res!187863) (not e!208644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17842 (_ BitVec 32)) Bool)

(assert (=> b!340104 (= res!187863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!340105 () Bool)

(declare-fun e!208645 () Bool)

(assert (=> b!340105 (= e!208645 tp_is_empty!7129)))

(declare-fun mapNonEmpty!12117 () Bool)

(declare-fun tp!25061 () Bool)

(assert (=> mapNonEmpty!12117 (= mapRes!12117 (and tp!25061 e!208645))))

(declare-fun mapValue!12117 () ValueCell!3221)

(declare-fun mapRest!12117 () (Array (_ BitVec 32) ValueCell!3221))

(declare-fun mapKey!12117 () (_ BitVec 32))

(assert (=> mapNonEmpty!12117 (= (arr!8443 _values!1525) (store mapRest!12117 mapKey!12117 mapValue!12117))))

(declare-fun b!340106 () Bool)

(declare-fun res!187865 () Bool)

(assert (=> b!340106 (=> (not res!187865) (not e!208644))))

(declare-fun zeroValue!1467 () V!10483)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10483)

(declare-datatypes ((tuple2!5148 0))(
  ( (tuple2!5149 (_1!2585 (_ BitVec 64)) (_2!2585 V!10483)) )
))
(declare-datatypes ((List!4758 0))(
  ( (Nil!4755) (Cons!4754 (h!5610 tuple2!5148) (t!9856 List!4758)) )
))
(declare-datatypes ((ListLongMap!4063 0))(
  ( (ListLongMap!4064 (toList!2047 List!4758)) )
))
(declare-fun contains!2119 (ListLongMap!4063 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1576 (array!17842 array!17844 (_ BitVec 32) (_ BitVec 32) V!10483 V!10483 (_ BitVec 32) Int) ListLongMap!4063)

(assert (=> b!340106 (= res!187865 (not (contains!2119 (getCurrentListMap!1576 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!34120 res!187867) b!340102))

(assert (= (and b!340102 res!187861) b!340104))

(assert (= (and b!340104 res!187863) b!340103))

(assert (= (and b!340103 res!187864) b!340101))

(assert (= (and b!340101 res!187862) b!340106))

(assert (= (and b!340106 res!187865) b!340096))

(assert (= (and b!340096 res!187866) b!340097))

(assert (= (and b!340097 res!187868) b!340099))

(assert (= (and b!340098 condMapEmpty!12117) mapIsEmpty!12117))

(assert (= (and b!340098 (not condMapEmpty!12117)) mapNonEmpty!12117))

(assert (= (and mapNonEmpty!12117 ((_ is ValueCellFull!3221) mapValue!12117)) b!340105))

(assert (= (and b!340098 ((_ is ValueCellFull!3221) mapDefault!12117)) b!340100))

(assert (= start!34120 b!340098))

(declare-fun m!343161 () Bool)

(assert (=> b!340103 m!343161))

(declare-fun m!343163 () Bool)

(assert (=> b!340106 m!343163))

(assert (=> b!340106 m!343163))

(declare-fun m!343165 () Bool)

(assert (=> b!340106 m!343165))

(declare-fun m!343167 () Bool)

(assert (=> b!340097 m!343167))

(declare-fun m!343169 () Bool)

(assert (=> b!340101 m!343169))

(declare-fun m!343171 () Bool)

(assert (=> b!340096 m!343171))

(declare-fun m!343173 () Bool)

(assert (=> mapNonEmpty!12117 m!343173))

(declare-fun m!343175 () Bool)

(assert (=> start!34120 m!343175))

(declare-fun m!343177 () Bool)

(assert (=> start!34120 m!343177))

(declare-fun m!343179 () Bool)

(assert (=> start!34120 m!343179))

(declare-fun m!343181 () Bool)

(assert (=> b!340104 m!343181))

(check-sat (not b!340103) b_and!14389 tp_is_empty!7129 (not b!340096) (not b!340106) (not b!340101) (not b!340104) (not b_next!7177) (not mapNonEmpty!12117) (not start!34120) (not b!340097))
(check-sat b_and!14389 (not b_next!7177))
(get-model)

(declare-fun d!70935 () Bool)

(declare-fun res!187921 () Bool)

(declare-fun e!208687 () Bool)

(assert (=> d!70935 (=> res!187921 e!208687)))

(assert (=> d!70935 (= res!187921 (= (select (arr!8442 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70935 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!208687)))

(declare-fun b!340177 () Bool)

(declare-fun e!208688 () Bool)

(assert (=> b!340177 (= e!208687 e!208688)))

(declare-fun res!187922 () Bool)

(assert (=> b!340177 (=> (not res!187922) (not e!208688))))

(assert (=> b!340177 (= res!187922 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8794 _keys!1895)))))

(declare-fun b!340178 () Bool)

(assert (=> b!340178 (= e!208688 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70935 (not res!187921)) b!340177))

(assert (= (and b!340177 res!187922) b!340178))

(declare-fun m!343227 () Bool)

(assert (=> d!70935 m!343227))

(declare-fun m!343229 () Bool)

(assert (=> b!340178 m!343229))

(assert (=> b!340097 d!70935))

(declare-fun d!70937 () Bool)

(declare-fun e!208693 () Bool)

(assert (=> d!70937 e!208693))

(declare-fun res!187925 () Bool)

(assert (=> d!70937 (=> res!187925 e!208693)))

(declare-fun lt!161510 () Bool)

(assert (=> d!70937 (= res!187925 (not lt!161510))))

(declare-fun lt!161509 () Bool)

(assert (=> d!70937 (= lt!161510 lt!161509)))

(declare-datatypes ((Unit!10568 0))(
  ( (Unit!10569) )
))
(declare-fun lt!161512 () Unit!10568)

(declare-fun e!208694 () Unit!10568)

(assert (=> d!70937 (= lt!161512 e!208694)))

(declare-fun c!52625 () Bool)

(assert (=> d!70937 (= c!52625 lt!161509)))

(declare-fun containsKey!325 (List!4758 (_ BitVec 64)) Bool)

(assert (=> d!70937 (= lt!161509 (containsKey!325 (toList!2047 (getCurrentListMap!1576 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70937 (= (contains!2119 (getCurrentListMap!1576 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!161510)))

(declare-fun b!340185 () Bool)

(declare-fun lt!161511 () Unit!10568)

(assert (=> b!340185 (= e!208694 lt!161511)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!273 (List!4758 (_ BitVec 64)) Unit!10568)

(assert (=> b!340185 (= lt!161511 (lemmaContainsKeyImpliesGetValueByKeyDefined!273 (toList!2047 (getCurrentListMap!1576 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!340 0))(
  ( (Some!339 (v!5784 V!10483)) (None!338) )
))
(declare-fun isDefined!274 (Option!340) Bool)

(declare-fun getValueByKey!334 (List!4758 (_ BitVec 64)) Option!340)

(assert (=> b!340185 (isDefined!274 (getValueByKey!334 (toList!2047 (getCurrentListMap!1576 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!340186 () Bool)

(declare-fun Unit!10570 () Unit!10568)

(assert (=> b!340186 (= e!208694 Unit!10570)))

(declare-fun b!340187 () Bool)

(assert (=> b!340187 (= e!208693 (isDefined!274 (getValueByKey!334 (toList!2047 (getCurrentListMap!1576 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70937 c!52625) b!340185))

(assert (= (and d!70937 (not c!52625)) b!340186))

(assert (= (and d!70937 (not res!187925)) b!340187))

(declare-fun m!343231 () Bool)

(assert (=> d!70937 m!343231))

(declare-fun m!343233 () Bool)

(assert (=> b!340185 m!343233))

(declare-fun m!343235 () Bool)

(assert (=> b!340185 m!343235))

(assert (=> b!340185 m!343235))

(declare-fun m!343237 () Bool)

(assert (=> b!340185 m!343237))

(assert (=> b!340187 m!343235))

(assert (=> b!340187 m!343235))

(assert (=> b!340187 m!343237))

(assert (=> b!340106 d!70937))

(declare-fun bm!26537 () Bool)

(declare-fun call!26546 () ListLongMap!4063)

(declare-fun call!26543 () ListLongMap!4063)

(assert (=> bm!26537 (= call!26546 call!26543)))

(declare-fun bm!26538 () Bool)

(declare-fun call!26545 () Bool)

(declare-fun lt!161563 () ListLongMap!4063)

(assert (=> bm!26538 (= call!26545 (contains!2119 lt!161563 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!340230 () Bool)

(declare-fun e!208721 () ListLongMap!4063)

(declare-fun call!26541 () ListLongMap!4063)

(assert (=> b!340230 (= e!208721 call!26541)))

(declare-fun b!340231 () Bool)

(declare-fun e!208733 () ListLongMap!4063)

(declare-fun call!26542 () ListLongMap!4063)

(assert (=> b!340231 (= e!208733 call!26542)))

(declare-fun b!340232 () Bool)

(assert (=> b!340232 (= e!208721 call!26542)))

(declare-fun d!70939 () Bool)

(declare-fun e!208729 () Bool)

(assert (=> d!70939 e!208729))

(declare-fun res!187947 () Bool)

(assert (=> d!70939 (=> (not res!187947) (not e!208729))))

(assert (=> d!70939 (= res!187947 (or (bvsge #b00000000000000000000000000000000 (size!8794 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8794 _keys!1895)))))))

(declare-fun lt!161567 () ListLongMap!4063)

(assert (=> d!70939 (= lt!161563 lt!161567)))

(declare-fun lt!161570 () Unit!10568)

(declare-fun e!208722 () Unit!10568)

(assert (=> d!70939 (= lt!161570 e!208722)))

(declare-fun c!52643 () Bool)

(declare-fun e!208732 () Bool)

(assert (=> d!70939 (= c!52643 e!208732)))

(declare-fun res!187952 () Bool)

(assert (=> d!70939 (=> (not res!187952) (not e!208732))))

(assert (=> d!70939 (= res!187952 (bvslt #b00000000000000000000000000000000 (size!8794 _keys!1895)))))

(declare-fun e!208728 () ListLongMap!4063)

(assert (=> d!70939 (= lt!161567 e!208728)))

(declare-fun c!52641 () Bool)

(assert (=> d!70939 (= c!52641 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70939 (validMask!0 mask!2385)))

(assert (=> d!70939 (= (getCurrentListMap!1576 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!161563)))

(declare-fun b!340233 () Bool)

(declare-fun e!208725 () Bool)

(assert (=> b!340233 (= e!208725 (validKeyInArray!0 (select (arr!8442 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun e!208726 () Bool)

(declare-fun b!340234 () Bool)

(declare-fun apply!275 (ListLongMap!4063 (_ BitVec 64)) V!10483)

(declare-fun get!4603 (ValueCell!3221 V!10483) V!10483)

(declare-fun dynLambda!618 (Int (_ BitVec 64)) V!10483)

(assert (=> b!340234 (= e!208726 (= (apply!275 lt!161563 (select (arr!8442 _keys!1895) #b00000000000000000000000000000000)) (get!4603 (select (arr!8443 _values!1525) #b00000000000000000000000000000000) (dynLambda!618 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!340234 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8795 _values!1525)))))

(assert (=> b!340234 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8794 _keys!1895)))))

(declare-fun b!340235 () Bool)

(declare-fun e!208727 () Bool)

(assert (=> b!340235 (= e!208727 e!208726)))

(declare-fun res!187949 () Bool)

(assert (=> b!340235 (=> (not res!187949) (not e!208726))))

(assert (=> b!340235 (= res!187949 (contains!2119 lt!161563 (select (arr!8442 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!340235 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8794 _keys!1895)))))

(declare-fun b!340236 () Bool)

(declare-fun e!208723 () Bool)

(assert (=> b!340236 (= e!208729 e!208723)))

(declare-fun c!52642 () Bool)

(assert (=> b!340236 (= c!52642 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!340237 () Bool)

(declare-fun e!208730 () Bool)

(assert (=> b!340237 (= e!208730 (= (apply!275 lt!161563 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!340238 () Bool)

(declare-fun lt!161561 () Unit!10568)

(assert (=> b!340238 (= e!208722 lt!161561)))

(declare-fun lt!161568 () ListLongMap!4063)

(declare-fun getCurrentListMapNoExtraKeys!591 (array!17842 array!17844 (_ BitVec 32) (_ BitVec 32) V!10483 V!10483 (_ BitVec 32) Int) ListLongMap!4063)

(assert (=> b!340238 (= lt!161568 (getCurrentListMapNoExtraKeys!591 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161558 () (_ BitVec 64))

(assert (=> b!340238 (= lt!161558 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161564 () (_ BitVec 64))

(assert (=> b!340238 (= lt!161564 (select (arr!8442 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161565 () Unit!10568)

(declare-fun addStillContains!251 (ListLongMap!4063 (_ BitVec 64) V!10483 (_ BitVec 64)) Unit!10568)

(assert (=> b!340238 (= lt!161565 (addStillContains!251 lt!161568 lt!161558 zeroValue!1467 lt!161564))))

(declare-fun +!726 (ListLongMap!4063 tuple2!5148) ListLongMap!4063)

(assert (=> b!340238 (contains!2119 (+!726 lt!161568 (tuple2!5149 lt!161558 zeroValue!1467)) lt!161564)))

(declare-fun lt!161574 () Unit!10568)

(assert (=> b!340238 (= lt!161574 lt!161565)))

(declare-fun lt!161562 () ListLongMap!4063)

(assert (=> b!340238 (= lt!161562 (getCurrentListMapNoExtraKeys!591 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161559 () (_ BitVec 64))

(assert (=> b!340238 (= lt!161559 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161575 () (_ BitVec 64))

(assert (=> b!340238 (= lt!161575 (select (arr!8442 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161576 () Unit!10568)

(declare-fun addApplyDifferent!251 (ListLongMap!4063 (_ BitVec 64) V!10483 (_ BitVec 64)) Unit!10568)

(assert (=> b!340238 (= lt!161576 (addApplyDifferent!251 lt!161562 lt!161559 minValue!1467 lt!161575))))

(assert (=> b!340238 (= (apply!275 (+!726 lt!161562 (tuple2!5149 lt!161559 minValue!1467)) lt!161575) (apply!275 lt!161562 lt!161575))))

(declare-fun lt!161560 () Unit!10568)

(assert (=> b!340238 (= lt!161560 lt!161576)))

(declare-fun lt!161569 () ListLongMap!4063)

(assert (=> b!340238 (= lt!161569 (getCurrentListMapNoExtraKeys!591 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161577 () (_ BitVec 64))

(assert (=> b!340238 (= lt!161577 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161557 () (_ BitVec 64))

(assert (=> b!340238 (= lt!161557 (select (arr!8442 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161573 () Unit!10568)

(assert (=> b!340238 (= lt!161573 (addApplyDifferent!251 lt!161569 lt!161577 zeroValue!1467 lt!161557))))

(assert (=> b!340238 (= (apply!275 (+!726 lt!161569 (tuple2!5149 lt!161577 zeroValue!1467)) lt!161557) (apply!275 lt!161569 lt!161557))))

(declare-fun lt!161578 () Unit!10568)

(assert (=> b!340238 (= lt!161578 lt!161573)))

(declare-fun lt!161572 () ListLongMap!4063)

(assert (=> b!340238 (= lt!161572 (getCurrentListMapNoExtraKeys!591 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161571 () (_ BitVec 64))

(assert (=> b!340238 (= lt!161571 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161566 () (_ BitVec 64))

(assert (=> b!340238 (= lt!161566 (select (arr!8442 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!340238 (= lt!161561 (addApplyDifferent!251 lt!161572 lt!161571 minValue!1467 lt!161566))))

(assert (=> b!340238 (= (apply!275 (+!726 lt!161572 (tuple2!5149 lt!161571 minValue!1467)) lt!161566) (apply!275 lt!161572 lt!161566))))

(declare-fun b!340239 () Bool)

(assert (=> b!340239 (= e!208723 e!208730)))

(declare-fun res!187951 () Bool)

(declare-fun call!26540 () Bool)

(assert (=> b!340239 (= res!187951 call!26540)))

(assert (=> b!340239 (=> (not res!187951) (not e!208730))))

(declare-fun bm!26539 () Bool)

(assert (=> bm!26539 (= call!26543 (getCurrentListMapNoExtraKeys!591 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!340240 () Bool)

(assert (=> b!340240 (= e!208732 (validKeyInArray!0 (select (arr!8442 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!340241 () Bool)

(declare-fun e!208731 () Bool)

(declare-fun e!208724 () Bool)

(assert (=> b!340241 (= e!208731 e!208724)))

(declare-fun res!187950 () Bool)

(assert (=> b!340241 (= res!187950 call!26545)))

(assert (=> b!340241 (=> (not res!187950) (not e!208724))))

(declare-fun b!340242 () Bool)

(assert (=> b!340242 (= e!208724 (= (apply!275 lt!161563 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!340243 () Bool)

(assert (=> b!340243 (= e!208728 e!208733)))

(declare-fun c!52640 () Bool)

(assert (=> b!340243 (= c!52640 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26540 () Bool)

(declare-fun call!26544 () ListLongMap!4063)

(assert (=> bm!26540 (= call!26542 call!26544)))

(declare-fun b!340244 () Bool)

(declare-fun res!187944 () Bool)

(assert (=> b!340244 (=> (not res!187944) (not e!208729))))

(assert (=> b!340244 (= res!187944 e!208731)))

(declare-fun c!52639 () Bool)

(assert (=> b!340244 (= c!52639 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!26541 () Bool)

(assert (=> bm!26541 (= call!26541 call!26546)))

(declare-fun b!340245 () Bool)

(assert (=> b!340245 (= e!208723 (not call!26540))))

(declare-fun bm!26542 () Bool)

(assert (=> bm!26542 (= call!26540 (contains!2119 lt!161563 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!340246 () Bool)

(declare-fun Unit!10571 () Unit!10568)

(assert (=> b!340246 (= e!208722 Unit!10571)))

(declare-fun b!340247 () Bool)

(assert (=> b!340247 (= e!208731 (not call!26545))))

(declare-fun bm!26543 () Bool)

(assert (=> bm!26543 (= call!26544 (+!726 (ite c!52641 call!26543 (ite c!52640 call!26546 call!26541)) (ite (or c!52641 c!52640) (tuple2!5149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!340248 () Bool)

(declare-fun res!187945 () Bool)

(assert (=> b!340248 (=> (not res!187945) (not e!208729))))

(assert (=> b!340248 (= res!187945 e!208727)))

(declare-fun res!187948 () Bool)

(assert (=> b!340248 (=> res!187948 e!208727)))

(assert (=> b!340248 (= res!187948 (not e!208725))))

(declare-fun res!187946 () Bool)

(assert (=> b!340248 (=> (not res!187946) (not e!208725))))

(assert (=> b!340248 (= res!187946 (bvslt #b00000000000000000000000000000000 (size!8794 _keys!1895)))))

(declare-fun b!340249 () Bool)

(declare-fun c!52638 () Bool)

(assert (=> b!340249 (= c!52638 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!340249 (= e!208733 e!208721)))

(declare-fun b!340250 () Bool)

(assert (=> b!340250 (= e!208728 (+!726 call!26544 (tuple2!5149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(assert (= (and d!70939 c!52641) b!340250))

(assert (= (and d!70939 (not c!52641)) b!340243))

(assert (= (and b!340243 c!52640) b!340231))

(assert (= (and b!340243 (not c!52640)) b!340249))

(assert (= (and b!340249 c!52638) b!340232))

(assert (= (and b!340249 (not c!52638)) b!340230))

(assert (= (or b!340232 b!340230) bm!26541))

(assert (= (or b!340231 bm!26541) bm!26537))

(assert (= (or b!340231 b!340232) bm!26540))

(assert (= (or b!340250 bm!26537) bm!26539))

(assert (= (or b!340250 bm!26540) bm!26543))

(assert (= (and d!70939 res!187952) b!340240))

(assert (= (and d!70939 c!52643) b!340238))

(assert (= (and d!70939 (not c!52643)) b!340246))

(assert (= (and d!70939 res!187947) b!340248))

(assert (= (and b!340248 res!187946) b!340233))

(assert (= (and b!340248 (not res!187948)) b!340235))

(assert (= (and b!340235 res!187949) b!340234))

(assert (= (and b!340248 res!187945) b!340244))

(assert (= (and b!340244 c!52639) b!340241))

(assert (= (and b!340244 (not c!52639)) b!340247))

(assert (= (and b!340241 res!187950) b!340242))

(assert (= (or b!340241 b!340247) bm!26538))

(assert (= (and b!340244 res!187944) b!340236))

(assert (= (and b!340236 c!52642) b!340239))

(assert (= (and b!340236 (not c!52642)) b!340245))

(assert (= (and b!340239 res!187951) b!340237))

(assert (= (or b!340239 b!340245) bm!26542))

(declare-fun b_lambda!8461 () Bool)

(assert (=> (not b_lambda!8461) (not b!340234)))

(declare-fun t!9858 () Bool)

(declare-fun tb!3057 () Bool)

(assert (=> (and start!34120 (= defaultEntry!1528 defaultEntry!1528) t!9858) tb!3057))

(declare-fun result!5517 () Bool)

(assert (=> tb!3057 (= result!5517 tp_is_empty!7129)))

(assert (=> b!340234 t!9858))

(declare-fun b_and!14395 () Bool)

(assert (= b_and!14389 (and (=> t!9858 result!5517) b_and!14395)))

(declare-fun m!343239 () Bool)

(assert (=> bm!26538 m!343239))

(declare-fun m!343241 () Bool)

(assert (=> b!340238 m!343241))

(declare-fun m!343243 () Bool)

(assert (=> b!340238 m!343243))

(assert (=> b!340238 m!343241))

(declare-fun m!343245 () Bool)

(assert (=> b!340238 m!343245))

(declare-fun m!343247 () Bool)

(assert (=> b!340238 m!343247))

(assert (=> b!340238 m!343245))

(declare-fun m!343249 () Bool)

(assert (=> b!340238 m!343249))

(declare-fun m!343251 () Bool)

(assert (=> b!340238 m!343251))

(declare-fun m!343253 () Bool)

(assert (=> b!340238 m!343253))

(declare-fun m!343255 () Bool)

(assert (=> b!340238 m!343255))

(declare-fun m!343257 () Bool)

(assert (=> b!340238 m!343257))

(declare-fun m!343259 () Bool)

(assert (=> b!340238 m!343259))

(declare-fun m!343261 () Bool)

(assert (=> b!340238 m!343261))

(assert (=> b!340238 m!343257))

(declare-fun m!343263 () Bool)

(assert (=> b!340238 m!343263))

(declare-fun m!343265 () Bool)

(assert (=> b!340238 m!343265))

(declare-fun m!343267 () Bool)

(assert (=> b!340238 m!343267))

(assert (=> b!340238 m!343227))

(assert (=> b!340238 m!343261))

(declare-fun m!343269 () Bool)

(assert (=> b!340238 m!343269))

(declare-fun m!343271 () Bool)

(assert (=> b!340238 m!343271))

(declare-fun m!343273 () Bool)

(assert (=> bm!26542 m!343273))

(assert (=> b!340233 m!343227))

(assert (=> b!340233 m!343227))

(declare-fun m!343275 () Bool)

(assert (=> b!340233 m!343275))

(declare-fun m!343277 () Bool)

(assert (=> bm!26543 m!343277))

(assert (=> bm!26539 m!343247))

(declare-fun m!343279 () Bool)

(assert (=> b!340242 m!343279))

(declare-fun m!343281 () Bool)

(assert (=> b!340234 m!343281))

(assert (=> b!340234 m!343281))

(declare-fun m!343283 () Bool)

(assert (=> b!340234 m!343283))

(declare-fun m!343285 () Bool)

(assert (=> b!340234 m!343285))

(assert (=> b!340234 m!343283))

(assert (=> b!340234 m!343227))

(declare-fun m!343287 () Bool)

(assert (=> b!340234 m!343287))

(assert (=> b!340234 m!343227))

(assert (=> b!340235 m!343227))

(assert (=> b!340235 m!343227))

(declare-fun m!343289 () Bool)

(assert (=> b!340235 m!343289))

(declare-fun m!343291 () Bool)

(assert (=> b!340250 m!343291))

(assert (=> d!70939 m!343175))

(declare-fun m!343293 () Bool)

(assert (=> b!340237 m!343293))

(assert (=> b!340240 m!343227))

(assert (=> b!340240 m!343227))

(assert (=> b!340240 m!343275))

(assert (=> b!340106 d!70939))

(declare-fun d!70941 () Bool)

(assert (=> d!70941 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!340101 d!70941))

(declare-fun b!340265 () Bool)

(declare-fun c!52650 () Bool)

(declare-fun lt!161585 () (_ BitVec 64))

(assert (=> b!340265 (= c!52650 (= lt!161585 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!208741 () SeekEntryResult!3219)

(declare-fun e!208740 () SeekEntryResult!3219)

(assert (=> b!340265 (= e!208741 e!208740)))

(declare-fun b!340266 () Bool)

(declare-fun lt!161587 () SeekEntryResult!3219)

(assert (=> b!340266 (= e!208740 (MissingZero!3219 (index!15057 lt!161587)))))

(declare-fun b!340268 () Bool)

(declare-fun e!208742 () SeekEntryResult!3219)

(assert (=> b!340268 (= e!208742 e!208741)))

(assert (=> b!340268 (= lt!161585 (select (arr!8442 _keys!1895) (index!15057 lt!161587)))))

(declare-fun c!52651 () Bool)

(assert (=> b!340268 (= c!52651 (= lt!161585 k0!1348))))

(declare-fun d!70943 () Bool)

(declare-fun lt!161586 () SeekEntryResult!3219)

(assert (=> d!70943 (and (or ((_ is Undefined!3219) lt!161586) (not ((_ is Found!3219) lt!161586)) (and (bvsge (index!15056 lt!161586) #b00000000000000000000000000000000) (bvslt (index!15056 lt!161586) (size!8794 _keys!1895)))) (or ((_ is Undefined!3219) lt!161586) ((_ is Found!3219) lt!161586) (not ((_ is MissingZero!3219) lt!161586)) (and (bvsge (index!15055 lt!161586) #b00000000000000000000000000000000) (bvslt (index!15055 lt!161586) (size!8794 _keys!1895)))) (or ((_ is Undefined!3219) lt!161586) ((_ is Found!3219) lt!161586) ((_ is MissingZero!3219) lt!161586) (not ((_ is MissingVacant!3219) lt!161586)) (and (bvsge (index!15058 lt!161586) #b00000000000000000000000000000000) (bvslt (index!15058 lt!161586) (size!8794 _keys!1895)))) (or ((_ is Undefined!3219) lt!161586) (ite ((_ is Found!3219) lt!161586) (= (select (arr!8442 _keys!1895) (index!15056 lt!161586)) k0!1348) (ite ((_ is MissingZero!3219) lt!161586) (= (select (arr!8442 _keys!1895) (index!15055 lt!161586)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3219) lt!161586) (= (select (arr!8442 _keys!1895) (index!15058 lt!161586)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70943 (= lt!161586 e!208742)))

(declare-fun c!52652 () Bool)

(assert (=> d!70943 (= c!52652 (and ((_ is Intermediate!3219) lt!161587) (undefined!4031 lt!161587)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17842 (_ BitVec 32)) SeekEntryResult!3219)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70943 (= lt!161587 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70943 (validMask!0 mask!2385)))

(assert (=> d!70943 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!161586)))

(declare-fun b!340267 () Bool)

(assert (=> b!340267 (= e!208741 (Found!3219 (index!15057 lt!161587)))))

(declare-fun b!340269 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17842 (_ BitVec 32)) SeekEntryResult!3219)

(assert (=> b!340269 (= e!208740 (seekKeyOrZeroReturnVacant!0 (x!33832 lt!161587) (index!15057 lt!161587) (index!15057 lt!161587) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!340270 () Bool)

(assert (=> b!340270 (= e!208742 Undefined!3219)))

(assert (= (and d!70943 c!52652) b!340270))

(assert (= (and d!70943 (not c!52652)) b!340268))

(assert (= (and b!340268 c!52651) b!340267))

(assert (= (and b!340268 (not c!52651)) b!340265))

(assert (= (and b!340265 c!52650) b!340266))

(assert (= (and b!340265 (not c!52650)) b!340269))

(declare-fun m!343295 () Bool)

(assert (=> b!340268 m!343295))

(assert (=> d!70943 m!343175))

(declare-fun m!343297 () Bool)

(assert (=> d!70943 m!343297))

(declare-fun m!343299 () Bool)

(assert (=> d!70943 m!343299))

(declare-fun m!343301 () Bool)

(assert (=> d!70943 m!343301))

(declare-fun m!343303 () Bool)

(assert (=> d!70943 m!343303))

(assert (=> d!70943 m!343299))

(declare-fun m!343305 () Bool)

(assert (=> d!70943 m!343305))

(declare-fun m!343307 () Bool)

(assert (=> b!340269 m!343307))

(assert (=> b!340096 d!70943))

(declare-fun d!70945 () Bool)

(assert (=> d!70945 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34120 d!70945))

(declare-fun d!70947 () Bool)

(assert (=> d!70947 (= (array_inv!6258 _values!1525) (bvsge (size!8795 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34120 d!70947))

(declare-fun d!70949 () Bool)

(assert (=> d!70949 (= (array_inv!6259 _keys!1895) (bvsge (size!8794 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34120 d!70949))

(declare-fun b!340279 () Bool)

(declare-fun e!208749 () Bool)

(declare-fun call!26549 () Bool)

(assert (=> b!340279 (= e!208749 call!26549)))

(declare-fun b!340280 () Bool)

(declare-fun e!208751 () Bool)

(assert (=> b!340280 (= e!208751 e!208749)))

(declare-fun lt!161595 () (_ BitVec 64))

(assert (=> b!340280 (= lt!161595 (select (arr!8442 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161594 () Unit!10568)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17842 (_ BitVec 64) (_ BitVec 32)) Unit!10568)

(assert (=> b!340280 (= lt!161594 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!161595 #b00000000000000000000000000000000))))

(assert (=> b!340280 (arrayContainsKey!0 _keys!1895 lt!161595 #b00000000000000000000000000000000)))

(declare-fun lt!161596 () Unit!10568)

(assert (=> b!340280 (= lt!161596 lt!161594)))

(declare-fun res!187957 () Bool)

(assert (=> b!340280 (= res!187957 (= (seekEntryOrOpen!0 (select (arr!8442 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3219 #b00000000000000000000000000000000)))))

(assert (=> b!340280 (=> (not res!187957) (not e!208749))))

(declare-fun d!70951 () Bool)

(declare-fun res!187958 () Bool)

(declare-fun e!208750 () Bool)

(assert (=> d!70951 (=> res!187958 e!208750)))

(assert (=> d!70951 (= res!187958 (bvsge #b00000000000000000000000000000000 (size!8794 _keys!1895)))))

(assert (=> d!70951 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!208750)))

(declare-fun b!340281 () Bool)

(assert (=> b!340281 (= e!208751 call!26549)))

(declare-fun b!340282 () Bool)

(assert (=> b!340282 (= e!208750 e!208751)))

(declare-fun c!52655 () Bool)

(assert (=> b!340282 (= c!52655 (validKeyInArray!0 (select (arr!8442 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26546 () Bool)

(assert (=> bm!26546 (= call!26549 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(assert (= (and d!70951 (not res!187958)) b!340282))

(assert (= (and b!340282 c!52655) b!340280))

(assert (= (and b!340282 (not c!52655)) b!340281))

(assert (= (and b!340280 res!187957) b!340279))

(assert (= (or b!340279 b!340281) bm!26546))

(assert (=> b!340280 m!343227))

(declare-fun m!343309 () Bool)

(assert (=> b!340280 m!343309))

(declare-fun m!343311 () Bool)

(assert (=> b!340280 m!343311))

(assert (=> b!340280 m!343227))

(declare-fun m!343313 () Bool)

(assert (=> b!340280 m!343313))

(assert (=> b!340282 m!343227))

(assert (=> b!340282 m!343227))

(assert (=> b!340282 m!343275))

(declare-fun m!343315 () Bool)

(assert (=> bm!26546 m!343315))

(assert (=> b!340104 d!70951))

(declare-fun d!70953 () Bool)

(declare-fun res!187967 () Bool)

(declare-fun e!208762 () Bool)

(assert (=> d!70953 (=> res!187967 e!208762)))

(assert (=> d!70953 (= res!187967 (bvsge #b00000000000000000000000000000000 (size!8794 _keys!1895)))))

(assert (=> d!70953 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4754) e!208762)))

(declare-fun bm!26549 () Bool)

(declare-fun call!26552 () Bool)

(declare-fun c!52658 () Bool)

(assert (=> bm!26549 (= call!26552 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52658 (Cons!4753 (select (arr!8442 _keys!1895) #b00000000000000000000000000000000) Nil!4754) Nil!4754)))))

(declare-fun b!340293 () Bool)

(declare-fun e!208761 () Bool)

(declare-fun contains!2120 (List!4757 (_ BitVec 64)) Bool)

(assert (=> b!340293 (= e!208761 (contains!2120 Nil!4754 (select (arr!8442 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!340294 () Bool)

(declare-fun e!208760 () Bool)

(assert (=> b!340294 (= e!208760 call!26552)))

(declare-fun b!340295 () Bool)

(declare-fun e!208763 () Bool)

(assert (=> b!340295 (= e!208763 e!208760)))

(assert (=> b!340295 (= c!52658 (validKeyInArray!0 (select (arr!8442 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!340296 () Bool)

(assert (=> b!340296 (= e!208762 e!208763)))

(declare-fun res!187965 () Bool)

(assert (=> b!340296 (=> (not res!187965) (not e!208763))))

(assert (=> b!340296 (= res!187965 (not e!208761))))

(declare-fun res!187966 () Bool)

(assert (=> b!340296 (=> (not res!187966) (not e!208761))))

(assert (=> b!340296 (= res!187966 (validKeyInArray!0 (select (arr!8442 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!340297 () Bool)

(assert (=> b!340297 (= e!208760 call!26552)))

(assert (= (and d!70953 (not res!187967)) b!340296))

(assert (= (and b!340296 res!187966) b!340293))

(assert (= (and b!340296 res!187965) b!340295))

(assert (= (and b!340295 c!52658) b!340294))

(assert (= (and b!340295 (not c!52658)) b!340297))

(assert (= (or b!340294 b!340297) bm!26549))

(assert (=> bm!26549 m!343227))

(declare-fun m!343317 () Bool)

(assert (=> bm!26549 m!343317))

(assert (=> b!340293 m!343227))

(assert (=> b!340293 m!343227))

(declare-fun m!343319 () Bool)

(assert (=> b!340293 m!343319))

(assert (=> b!340295 m!343227))

(assert (=> b!340295 m!343227))

(assert (=> b!340295 m!343275))

(assert (=> b!340296 m!343227))

(assert (=> b!340296 m!343227))

(assert (=> b!340296 m!343275))

(assert (=> b!340103 d!70953))

(declare-fun mapNonEmpty!12126 () Bool)

(declare-fun mapRes!12126 () Bool)

(declare-fun tp!25077 () Bool)

(declare-fun e!208768 () Bool)

(assert (=> mapNonEmpty!12126 (= mapRes!12126 (and tp!25077 e!208768))))

(declare-fun mapKey!12126 () (_ BitVec 32))

(declare-fun mapValue!12126 () ValueCell!3221)

(declare-fun mapRest!12126 () (Array (_ BitVec 32) ValueCell!3221))

(assert (=> mapNonEmpty!12126 (= mapRest!12117 (store mapRest!12126 mapKey!12126 mapValue!12126))))

(declare-fun b!340304 () Bool)

(assert (=> b!340304 (= e!208768 tp_is_empty!7129)))

(declare-fun b!340305 () Bool)

(declare-fun e!208769 () Bool)

(assert (=> b!340305 (= e!208769 tp_is_empty!7129)))

(declare-fun mapIsEmpty!12126 () Bool)

(assert (=> mapIsEmpty!12126 mapRes!12126))

(declare-fun condMapEmpty!12126 () Bool)

(declare-fun mapDefault!12126 () ValueCell!3221)

(assert (=> mapNonEmpty!12117 (= condMapEmpty!12126 (= mapRest!12117 ((as const (Array (_ BitVec 32) ValueCell!3221)) mapDefault!12126)))))

(assert (=> mapNonEmpty!12117 (= tp!25061 (and e!208769 mapRes!12126))))

(assert (= (and mapNonEmpty!12117 condMapEmpty!12126) mapIsEmpty!12126))

(assert (= (and mapNonEmpty!12117 (not condMapEmpty!12126)) mapNonEmpty!12126))

(assert (= (and mapNonEmpty!12126 ((_ is ValueCellFull!3221) mapValue!12126)) b!340304))

(assert (= (and mapNonEmpty!12117 ((_ is ValueCellFull!3221) mapDefault!12126)) b!340305))

(declare-fun m!343321 () Bool)

(assert (=> mapNonEmpty!12126 m!343321))

(declare-fun b_lambda!8463 () Bool)

(assert (= b_lambda!8461 (or (and start!34120 b_free!7177) b_lambda!8463)))

(check-sat (not b!340269) (not b!340235) (not b!340242) (not b!340233) (not bm!26543) (not bm!26538) (not bm!26542) (not d!70937) (not b_next!7177) (not mapNonEmpty!12126) (not b!340293) (not b!340296) (not b!340282) (not bm!26546) tp_is_empty!7129 (not b!340295) (not bm!26549) (not b!340240) (not b!340280) (not d!70939) (not b!340238) (not b!340250) (not b!340178) (not b!340237) (not bm!26539) (not b!340234) (not b!340185) (not b_lambda!8463) (not d!70943) b_and!14395 (not b!340187))
(check-sat b_and!14395 (not b_next!7177))
