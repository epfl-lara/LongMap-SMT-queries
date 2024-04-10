; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79322 () Bool)

(assert start!79322)

(declare-fun b_free!17535 () Bool)

(declare-fun b_next!17535 () Bool)

(assert (=> start!79322 (= b_free!17535 (not b_next!17535))))

(declare-fun tp!61046 () Bool)

(declare-fun b_and!28621 () Bool)

(assert (=> start!79322 (= tp!61046 b_and!28621)))

(declare-fun b!931783 () Bool)

(declare-fun res!627557 () Bool)

(declare-fun e!523272 () Bool)

(assert (=> b!931783 (=> (not res!627557) (not e!523272))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!31689 0))(
  ( (V!31690 (val!10072 Int)) )
))
(declare-fun v!791 () V!31689)

(declare-datatypes ((tuple2!13190 0))(
  ( (tuple2!13191 (_1!6606 (_ BitVec 64)) (_2!6606 V!31689)) )
))
(declare-datatypes ((List!18976 0))(
  ( (Nil!18973) (Cons!18972 (h!20118 tuple2!13190) (t!27055 List!18976)) )
))
(declare-datatypes ((ListLongMap!11887 0))(
  ( (ListLongMap!11888 (toList!5959 List!18976)) )
))
(declare-fun lt!419523 () ListLongMap!11887)

(declare-fun apply!776 (ListLongMap!11887 (_ BitVec 64)) V!31689)

(assert (=> b!931783 (= res!627557 (= (apply!776 lt!419523 k0!1099) v!791))))

(declare-fun b!931784 () Bool)

(declare-fun res!627553 () Bool)

(declare-fun e!523276 () Bool)

(assert (=> b!931784 (=> (not res!627553) (not e!523276))))

(declare-datatypes ((array!56024 0))(
  ( (array!56025 (arr!26957 (Array (_ BitVec 32) (_ BitVec 64))) (size!27416 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56024)

(declare-datatypes ((List!18977 0))(
  ( (Nil!18974) (Cons!18973 (h!20119 (_ BitVec 64)) (t!27056 List!18977)) )
))
(declare-fun arrayNoDuplicates!0 (array!56024 (_ BitVec 32) List!18977) Bool)

(assert (=> b!931784 (= res!627553 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18974))))

(declare-fun b!931785 () Bool)

(declare-fun res!627552 () Bool)

(assert (=> b!931785 (=> (not res!627552) (not e!523276))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9540 0))(
  ( (ValueCellFull!9540 (v!12590 V!31689)) (EmptyCell!9540) )
))
(declare-datatypes ((array!56026 0))(
  ( (array!56027 (arr!26958 (Array (_ BitVec 32) ValueCell!9540)) (size!27417 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56026)

(assert (=> b!931785 (= res!627552 (and (= (size!27417 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27416 _keys!1487) (size!27417 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!931786 () Bool)

(declare-fun e!523273 () Bool)

(declare-fun tp_is_empty!20043 () Bool)

(assert (=> b!931786 (= e!523273 tp_is_empty!20043)))

(declare-fun mapNonEmpty!31821 () Bool)

(declare-fun mapRes!31821 () Bool)

(declare-fun tp!61045 () Bool)

(declare-fun e!523274 () Bool)

(assert (=> mapNonEmpty!31821 (= mapRes!31821 (and tp!61045 e!523274))))

(declare-fun mapRest!31821 () (Array (_ BitVec 32) ValueCell!9540))

(declare-fun mapKey!31821 () (_ BitVec 32))

(declare-fun mapValue!31821 () ValueCell!9540)

(assert (=> mapNonEmpty!31821 (= (arr!26958 _values!1231) (store mapRest!31821 mapKey!31821 mapValue!31821))))

(declare-fun b!931787 () Bool)

(assert (=> b!931787 (= e!523274 tp_is_empty!20043)))

(declare-fun b!931788 () Bool)

(declare-fun e!523275 () Bool)

(assert (=> b!931788 (= e!523275 (and e!523273 mapRes!31821))))

(declare-fun condMapEmpty!31821 () Bool)

(declare-fun mapDefault!31821 () ValueCell!9540)

(assert (=> b!931788 (= condMapEmpty!31821 (= (arr!26958 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9540)) mapDefault!31821)))))

(declare-fun mapIsEmpty!31821 () Bool)

(assert (=> mapIsEmpty!31821 mapRes!31821))

(declare-fun b!931789 () Bool)

(assert (=> b!931789 (= e!523276 e!523272)))

(declare-fun res!627550 () Bool)

(assert (=> b!931789 (=> (not res!627550) (not e!523272))))

(declare-fun contains!5006 (ListLongMap!11887 (_ BitVec 64)) Bool)

(assert (=> b!931789 (= res!627550 (contains!5006 lt!419523 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31689)

(declare-fun minValue!1173 () V!31689)

(declare-fun getCurrentListMap!3197 (array!56024 array!56026 (_ BitVec 32) (_ BitVec 32) V!31689 V!31689 (_ BitVec 32) Int) ListLongMap!11887)

(assert (=> b!931789 (= lt!419523 (getCurrentListMap!3197 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!931790 () Bool)

(declare-fun e!523271 () Bool)

(assert (=> b!931790 (= e!523272 e!523271)))

(declare-fun res!627556 () Bool)

(assert (=> b!931790 (=> (not res!627556) (not e!523271))))

(declare-fun lt!419527 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!931790 (= res!627556 (validKeyInArray!0 lt!419527))))

(assert (=> b!931790 (= lt!419527 (select (arr!26957 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun res!627559 () Bool)

(assert (=> start!79322 (=> (not res!627559) (not e!523276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79322 (= res!627559 (validMask!0 mask!1881))))

(assert (=> start!79322 e!523276))

(assert (=> start!79322 true))

(assert (=> start!79322 tp_is_empty!20043))

(declare-fun array_inv!20982 (array!56026) Bool)

(assert (=> start!79322 (and (array_inv!20982 _values!1231) e!523275)))

(assert (=> start!79322 tp!61046))

(declare-fun array_inv!20983 (array!56024) Bool)

(assert (=> start!79322 (array_inv!20983 _keys!1487)))

(declare-fun b!931791 () Bool)

(declare-fun res!627551 () Bool)

(assert (=> b!931791 (=> (not res!627551) (not e!523276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56024 (_ BitVec 32)) Bool)

(assert (=> b!931791 (= res!627551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!931792 () Bool)

(declare-fun res!627554 () Bool)

(assert (=> b!931792 (=> (not res!627554) (not e!523272))))

(assert (=> b!931792 (= res!627554 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!931793 () Bool)

(assert (=> b!931793 (= e!523271 (not (bvslt (size!27416 _keys!1487) #b01111111111111111111111111111111)))))

(declare-fun lt!419525 () tuple2!13190)

(declare-fun +!2766 (ListLongMap!11887 tuple2!13190) ListLongMap!11887)

(assert (=> b!931793 (contains!5006 (+!2766 lt!419523 lt!419525) k0!1099)))

(declare-fun lt!419526 () V!31689)

(declare-datatypes ((Unit!31442 0))(
  ( (Unit!31443) )
))
(declare-fun lt!419524 () Unit!31442)

(declare-fun addStillContains!485 (ListLongMap!11887 (_ BitVec 64) V!31689 (_ BitVec 64)) Unit!31442)

(assert (=> b!931793 (= lt!419524 (addStillContains!485 lt!419523 lt!419527 lt!419526 k0!1099))))

(assert (=> b!931793 (= (getCurrentListMap!3197 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2766 (getCurrentListMap!3197 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419525))))

(assert (=> b!931793 (= lt!419525 (tuple2!13191 lt!419527 lt!419526))))

(declare-fun get!14167 (ValueCell!9540 V!31689) V!31689)

(declare-fun dynLambda!1555 (Int (_ BitVec 64)) V!31689)

(assert (=> b!931793 (= lt!419526 (get!14167 (select (arr!26958 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1555 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!419522 () Unit!31442)

(declare-fun lemmaListMapRecursiveValidKeyArray!156 (array!56024 array!56026 (_ BitVec 32) (_ BitVec 32) V!31689 V!31689 (_ BitVec 32) Int) Unit!31442)

(assert (=> b!931793 (= lt!419522 (lemmaListMapRecursiveValidKeyArray!156 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!931794 () Bool)

(declare-fun res!627555 () Bool)

(assert (=> b!931794 (=> (not res!627555) (not e!523272))))

(assert (=> b!931794 (= res!627555 (validKeyInArray!0 k0!1099))))

(declare-fun b!931795 () Bool)

(declare-fun res!627558 () Bool)

(assert (=> b!931795 (=> (not res!627558) (not e!523276))))

(assert (=> b!931795 (= res!627558 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27416 _keys!1487))))))

(assert (= (and start!79322 res!627559) b!931785))

(assert (= (and b!931785 res!627552) b!931791))

(assert (= (and b!931791 res!627551) b!931784))

(assert (= (and b!931784 res!627553) b!931795))

(assert (= (and b!931795 res!627558) b!931789))

(assert (= (and b!931789 res!627550) b!931783))

(assert (= (and b!931783 res!627557) b!931792))

(assert (= (and b!931792 res!627554) b!931794))

(assert (= (and b!931794 res!627555) b!931790))

(assert (= (and b!931790 res!627556) b!931793))

(assert (= (and b!931788 condMapEmpty!31821) mapIsEmpty!31821))

(assert (= (and b!931788 (not condMapEmpty!31821)) mapNonEmpty!31821))

(get-info :version)

(assert (= (and mapNonEmpty!31821 ((_ is ValueCellFull!9540) mapValue!31821)) b!931787))

(assert (= (and b!931788 ((_ is ValueCellFull!9540) mapDefault!31821)) b!931786))

(assert (= start!79322 b!931788))

(declare-fun b_lambda!13851 () Bool)

(assert (=> (not b_lambda!13851) (not b!931793)))

(declare-fun t!27054 () Bool)

(declare-fun tb!5929 () Bool)

(assert (=> (and start!79322 (= defaultEntry!1235 defaultEntry!1235) t!27054) tb!5929))

(declare-fun result!11681 () Bool)

(assert (=> tb!5929 (= result!11681 tp_is_empty!20043)))

(assert (=> b!931793 t!27054))

(declare-fun b_and!28623 () Bool)

(assert (= b_and!28621 (and (=> t!27054 result!11681) b_and!28623)))

(declare-fun m!865649 () Bool)

(assert (=> b!931791 m!865649))

(declare-fun m!865651 () Bool)

(assert (=> b!931783 m!865651))

(declare-fun m!865653 () Bool)

(assert (=> b!931790 m!865653))

(declare-fun m!865655 () Bool)

(assert (=> b!931790 m!865655))

(declare-fun m!865657 () Bool)

(assert (=> b!931789 m!865657))

(declare-fun m!865659 () Bool)

(assert (=> b!931789 m!865659))

(declare-fun m!865661 () Bool)

(assert (=> b!931793 m!865661))

(declare-fun m!865663 () Bool)

(assert (=> b!931793 m!865663))

(declare-fun m!865665 () Bool)

(assert (=> b!931793 m!865665))

(declare-fun m!865667 () Bool)

(assert (=> b!931793 m!865667))

(declare-fun m!865669 () Bool)

(assert (=> b!931793 m!865669))

(assert (=> b!931793 m!865667))

(assert (=> b!931793 m!865669))

(declare-fun m!865671 () Bool)

(assert (=> b!931793 m!865671))

(declare-fun m!865673 () Bool)

(assert (=> b!931793 m!865673))

(declare-fun m!865675 () Bool)

(assert (=> b!931793 m!865675))

(declare-fun m!865677 () Bool)

(assert (=> b!931793 m!865677))

(assert (=> b!931793 m!865675))

(declare-fun m!865679 () Bool)

(assert (=> b!931793 m!865679))

(assert (=> b!931793 m!865661))

(declare-fun m!865681 () Bool)

(assert (=> b!931794 m!865681))

(declare-fun m!865683 () Bool)

(assert (=> b!931784 m!865683))

(declare-fun m!865685 () Bool)

(assert (=> mapNonEmpty!31821 m!865685))

(declare-fun m!865687 () Bool)

(assert (=> start!79322 m!865687))

(declare-fun m!865689 () Bool)

(assert (=> start!79322 m!865689))

(declare-fun m!865691 () Bool)

(assert (=> start!79322 m!865691))

(check-sat (not start!79322) (not b!931783) (not mapNonEmpty!31821) (not b!931790) (not b!931794) (not b!931789) (not b!931793) (not b!931784) (not b_next!17535) (not b!931791) tp_is_empty!20043 b_and!28623 (not b_lambda!13851))
(check-sat b_and!28623 (not b_next!17535))
(get-model)

(declare-fun b_lambda!13855 () Bool)

(assert (= b_lambda!13851 (or (and start!79322 b_free!17535) b_lambda!13855)))

(check-sat (not start!79322) (not b_lambda!13855) (not b!931783) (not mapNonEmpty!31821) (not b!931790) (not b!931794) (not b!931789) (not b!931793) (not b!931784) (not b_next!17535) (not b!931791) tp_is_empty!20043 b_and!28623)
(check-sat b_and!28623 (not b_next!17535))
(get-model)

(declare-fun d!113027 () Bool)

(declare-datatypes ((Option!484 0))(
  ( (Some!483 (v!12592 V!31689)) (None!482) )
))
(declare-fun get!14169 (Option!484) V!31689)

(declare-fun getValueByKey!478 (List!18976 (_ BitVec 64)) Option!484)

(assert (=> d!113027 (= (apply!776 lt!419523 k0!1099) (get!14169 (getValueByKey!478 (toList!5959 lt!419523) k0!1099)))))

(declare-fun bs!26180 () Bool)

(assert (= bs!26180 d!113027))

(declare-fun m!865737 () Bool)

(assert (=> bs!26180 m!865737))

(assert (=> bs!26180 m!865737))

(declare-fun m!865739 () Bool)

(assert (=> bs!26180 m!865739))

(assert (=> b!931783 d!113027))

(declare-fun b!931847 () Bool)

(declare-fun e!523305 () Bool)

(declare-fun e!523304 () Bool)

(assert (=> b!931847 (= e!523305 e!523304)))

(declare-fun lt!419552 () (_ BitVec 64))

(assert (=> b!931847 (= lt!419552 (select (arr!26957 _keys!1487) #b00000000000000000000000000000000))))

(declare-fun lt!419553 () Unit!31442)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56024 (_ BitVec 64) (_ BitVec 32)) Unit!31442)

(assert (=> b!931847 (= lt!419553 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!419552 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!56024 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!931847 (arrayContainsKey!0 _keys!1487 lt!419552 #b00000000000000000000000000000000)))

(declare-fun lt!419554 () Unit!31442)

(assert (=> b!931847 (= lt!419554 lt!419553)))

(declare-fun res!627595 () Bool)

(declare-datatypes ((SeekEntryResult!8976 0))(
  ( (MissingZero!8976 (index!38275 (_ BitVec 32))) (Found!8976 (index!38276 (_ BitVec 32))) (Intermediate!8976 (undefined!9788 Bool) (index!38277 (_ BitVec 32)) (x!79873 (_ BitVec 32))) (Undefined!8976) (MissingVacant!8976 (index!38278 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56024 (_ BitVec 32)) SeekEntryResult!8976)

(assert (=> b!931847 (= res!627595 (= (seekEntryOrOpen!0 (select (arr!26957 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8976 #b00000000000000000000000000000000)))))

(assert (=> b!931847 (=> (not res!627595) (not e!523304))))

(declare-fun b!931848 () Bool)

(declare-fun e!523306 () Bool)

(assert (=> b!931848 (= e!523306 e!523305)))

(declare-fun c!97035 () Bool)

(assert (=> b!931848 (= c!97035 (validKeyInArray!0 (select (arr!26957 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun bm!40549 () Bool)

(declare-fun call!40552 () Bool)

(assert (=> bm!40549 (= call!40552 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(declare-fun b!931849 () Bool)

(assert (=> b!931849 (= e!523304 call!40552)))

(declare-fun d!113029 () Bool)

(declare-fun res!627594 () Bool)

(assert (=> d!113029 (=> res!627594 e!523306)))

(assert (=> d!113029 (= res!627594 (bvsge #b00000000000000000000000000000000 (size!27416 _keys!1487)))))

(assert (=> d!113029 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!523306)))

(declare-fun b!931850 () Bool)

(assert (=> b!931850 (= e!523305 call!40552)))

(assert (= (and d!113029 (not res!627594)) b!931848))

(assert (= (and b!931848 c!97035) b!931847))

(assert (= (and b!931848 (not c!97035)) b!931850))

(assert (= (and b!931847 res!627595) b!931849))

(assert (= (or b!931849 b!931850) bm!40549))

(declare-fun m!865741 () Bool)

(assert (=> b!931847 m!865741))

(declare-fun m!865743 () Bool)

(assert (=> b!931847 m!865743))

(declare-fun m!865745 () Bool)

(assert (=> b!931847 m!865745))

(assert (=> b!931847 m!865741))

(declare-fun m!865747 () Bool)

(assert (=> b!931847 m!865747))

(assert (=> b!931848 m!865741))

(assert (=> b!931848 m!865741))

(declare-fun m!865749 () Bool)

(assert (=> b!931848 m!865749))

(declare-fun m!865751 () Bool)

(assert (=> bm!40549 m!865751))

(assert (=> b!931791 d!113029))

(declare-fun d!113031 () Bool)

(assert (=> d!113031 (= (validKeyInArray!0 lt!419527) (and (not (= lt!419527 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!419527 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!931790 d!113031))

(declare-fun d!113033 () Bool)

(declare-fun e!523312 () Bool)

(assert (=> d!113033 e!523312))

(declare-fun res!627598 () Bool)

(assert (=> d!113033 (=> res!627598 e!523312)))

(declare-fun lt!419563 () Bool)

(assert (=> d!113033 (= res!627598 (not lt!419563))))

(declare-fun lt!419565 () Bool)

(assert (=> d!113033 (= lt!419563 lt!419565)))

(declare-fun lt!419566 () Unit!31442)

(declare-fun e!523311 () Unit!31442)

(assert (=> d!113033 (= lt!419566 e!523311)))

(declare-fun c!97038 () Bool)

(assert (=> d!113033 (= c!97038 lt!419565)))

(declare-fun containsKey!445 (List!18976 (_ BitVec 64)) Bool)

(assert (=> d!113033 (= lt!419565 (containsKey!445 (toList!5959 lt!419523) k0!1099))))

(assert (=> d!113033 (= (contains!5006 lt!419523 k0!1099) lt!419563)))

(declare-fun b!931857 () Bool)

(declare-fun lt!419564 () Unit!31442)

(assert (=> b!931857 (= e!523311 lt!419564)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!341 (List!18976 (_ BitVec 64)) Unit!31442)

(assert (=> b!931857 (= lt!419564 (lemmaContainsKeyImpliesGetValueByKeyDefined!341 (toList!5959 lt!419523) k0!1099))))

(declare-fun isDefined!350 (Option!484) Bool)

(assert (=> b!931857 (isDefined!350 (getValueByKey!478 (toList!5959 lt!419523) k0!1099))))

(declare-fun b!931858 () Bool)

(declare-fun Unit!31446 () Unit!31442)

(assert (=> b!931858 (= e!523311 Unit!31446)))

(declare-fun b!931859 () Bool)

(assert (=> b!931859 (= e!523312 (isDefined!350 (getValueByKey!478 (toList!5959 lt!419523) k0!1099)))))

(assert (= (and d!113033 c!97038) b!931857))

(assert (= (and d!113033 (not c!97038)) b!931858))

(assert (= (and d!113033 (not res!627598)) b!931859))

(declare-fun m!865753 () Bool)

(assert (=> d!113033 m!865753))

(declare-fun m!865755 () Bool)

(assert (=> b!931857 m!865755))

(assert (=> b!931857 m!865737))

(assert (=> b!931857 m!865737))

(declare-fun m!865757 () Bool)

(assert (=> b!931857 m!865757))

(assert (=> b!931859 m!865737))

(assert (=> b!931859 m!865737))

(assert (=> b!931859 m!865757))

(assert (=> b!931789 d!113033))

(declare-fun b!931902 () Bool)

(declare-fun e!523350 () Bool)

(declare-fun lt!419630 () ListLongMap!11887)

(assert (=> b!931902 (= e!523350 (= (apply!776 lt!419630 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun b!931903 () Bool)

(declare-fun e!523348 () Bool)

(assert (=> b!931903 (= e!523348 (= (apply!776 lt!419630 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!931904 () Bool)

(declare-fun res!627617 () Bool)

(declare-fun e!523340 () Bool)

(assert (=> b!931904 (=> (not res!627617) (not e!523340))))

(declare-fun e!523351 () Bool)

(assert (=> b!931904 (= res!627617 e!523351)))

(declare-fun res!627625 () Bool)

(assert (=> b!931904 (=> res!627625 e!523351)))

(declare-fun e!523347 () Bool)

(assert (=> b!931904 (= res!627625 (not e!523347))))

(declare-fun res!627618 () Bool)

(assert (=> b!931904 (=> (not res!627618) (not e!523347))))

(assert (=> b!931904 (= res!627618 (bvslt from!1844 (size!27416 _keys!1487)))))

(declare-fun bm!40564 () Bool)

(declare-fun call!40567 () ListLongMap!11887)

(declare-fun call!40571 () ListLongMap!11887)

(assert (=> bm!40564 (= call!40567 call!40571)))

(declare-fun call!40570 () ListLongMap!11887)

(declare-fun bm!40565 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3298 (array!56024 array!56026 (_ BitVec 32) (_ BitVec 32) V!31689 V!31689 (_ BitVec 32) Int) ListLongMap!11887)

(assert (=> bm!40565 (= call!40570 (getCurrentListMapNoExtraKeys!3298 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun d!113035 () Bool)

(assert (=> d!113035 e!523340))

(declare-fun res!627623 () Bool)

(assert (=> d!113035 (=> (not res!627623) (not e!523340))))

(assert (=> d!113035 (= res!627623 (or (bvsge from!1844 (size!27416 _keys!1487)) (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27416 _keys!1487)))))))

(declare-fun lt!419621 () ListLongMap!11887)

(assert (=> d!113035 (= lt!419630 lt!419621)))

(declare-fun lt!419622 () Unit!31442)

(declare-fun e!523344 () Unit!31442)

(assert (=> d!113035 (= lt!419622 e!523344)))

(declare-fun c!97051 () Bool)

(declare-fun e!523342 () Bool)

(assert (=> d!113035 (= c!97051 e!523342)))

(declare-fun res!627622 () Bool)

(assert (=> d!113035 (=> (not res!627622) (not e!523342))))

(assert (=> d!113035 (= res!627622 (bvslt from!1844 (size!27416 _keys!1487)))))

(declare-fun e!523341 () ListLongMap!11887)

(assert (=> d!113035 (= lt!419621 e!523341)))

(declare-fun c!97055 () Bool)

(assert (=> d!113035 (= c!97055 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113035 (validMask!0 mask!1881)))

(assert (=> d!113035 (= (getCurrentListMap!3197 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) lt!419630)))

(declare-fun b!931905 () Bool)

(declare-fun e!523343 () Bool)

(assert (=> b!931905 (= e!523343 (= (apply!776 lt!419630 (select (arr!26957 _keys!1487) from!1844)) (get!14167 (select (arr!26958 _values!1231) from!1844) (dynLambda!1555 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!931905 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27417 _values!1231)))))

(assert (=> b!931905 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27416 _keys!1487)))))

(declare-fun b!931906 () Bool)

(declare-fun e!523346 () Bool)

(assert (=> b!931906 (= e!523340 e!523346)))

(declare-fun c!97053 () Bool)

(assert (=> b!931906 (= c!97053 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!931907 () Bool)

(declare-fun e!523345 () ListLongMap!11887)

(declare-fun call!40572 () ListLongMap!11887)

(assert (=> b!931907 (= e!523345 call!40572)))

(declare-fun b!931908 () Bool)

(declare-fun lt!419616 () Unit!31442)

(assert (=> b!931908 (= e!523344 lt!419616)))

(declare-fun lt!419615 () ListLongMap!11887)

(assert (=> b!931908 (= lt!419615 (getCurrentListMapNoExtraKeys!3298 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!419620 () (_ BitVec 64))

(assert (=> b!931908 (= lt!419620 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419613 () (_ BitVec 64))

(assert (=> b!931908 (= lt!419613 (select (arr!26957 _keys!1487) from!1844))))

(declare-fun lt!419632 () Unit!31442)

(assert (=> b!931908 (= lt!419632 (addStillContains!485 lt!419615 lt!419620 zeroValue!1173 lt!419613))))

(assert (=> b!931908 (contains!5006 (+!2766 lt!419615 (tuple2!13191 lt!419620 zeroValue!1173)) lt!419613)))

(declare-fun lt!419623 () Unit!31442)

(assert (=> b!931908 (= lt!419623 lt!419632)))

(declare-fun lt!419629 () ListLongMap!11887)

(assert (=> b!931908 (= lt!419629 (getCurrentListMapNoExtraKeys!3298 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!419611 () (_ BitVec 64))

(assert (=> b!931908 (= lt!419611 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419624 () (_ BitVec 64))

(assert (=> b!931908 (= lt!419624 (select (arr!26957 _keys!1487) from!1844))))

(declare-fun lt!419619 () Unit!31442)

(declare-fun addApplyDifferent!417 (ListLongMap!11887 (_ BitVec 64) V!31689 (_ BitVec 64)) Unit!31442)

(assert (=> b!931908 (= lt!419619 (addApplyDifferent!417 lt!419629 lt!419611 minValue!1173 lt!419624))))

(assert (=> b!931908 (= (apply!776 (+!2766 lt!419629 (tuple2!13191 lt!419611 minValue!1173)) lt!419624) (apply!776 lt!419629 lt!419624))))

(declare-fun lt!419626 () Unit!31442)

(assert (=> b!931908 (= lt!419626 lt!419619)))

(declare-fun lt!419631 () ListLongMap!11887)

(assert (=> b!931908 (= lt!419631 (getCurrentListMapNoExtraKeys!3298 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!419614 () (_ BitVec 64))

(assert (=> b!931908 (= lt!419614 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419612 () (_ BitVec 64))

(assert (=> b!931908 (= lt!419612 (select (arr!26957 _keys!1487) from!1844))))

(declare-fun lt!419627 () Unit!31442)

(assert (=> b!931908 (= lt!419627 (addApplyDifferent!417 lt!419631 lt!419614 zeroValue!1173 lt!419612))))

(assert (=> b!931908 (= (apply!776 (+!2766 lt!419631 (tuple2!13191 lt!419614 zeroValue!1173)) lt!419612) (apply!776 lt!419631 lt!419612))))

(declare-fun lt!419625 () Unit!31442)

(assert (=> b!931908 (= lt!419625 lt!419627)))

(declare-fun lt!419618 () ListLongMap!11887)

(assert (=> b!931908 (= lt!419618 (getCurrentListMapNoExtraKeys!3298 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!419617 () (_ BitVec 64))

(assert (=> b!931908 (= lt!419617 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419628 () (_ BitVec 64))

(assert (=> b!931908 (= lt!419628 (select (arr!26957 _keys!1487) from!1844))))

(assert (=> b!931908 (= lt!419616 (addApplyDifferent!417 lt!419618 lt!419617 minValue!1173 lt!419628))))

(assert (=> b!931908 (= (apply!776 (+!2766 lt!419618 (tuple2!13191 lt!419617 minValue!1173)) lt!419628) (apply!776 lt!419618 lt!419628))))

(declare-fun b!931909 () Bool)

(declare-fun Unit!31447 () Unit!31442)

(assert (=> b!931909 (= e!523344 Unit!31447)))

(declare-fun b!931910 () Bool)

(declare-fun e!523339 () ListLongMap!11887)

(assert (=> b!931910 (= e!523339 call!40572)))

(declare-fun b!931911 () Bool)

(declare-fun call!40573 () ListLongMap!11887)

(assert (=> b!931911 (= e!523341 (+!2766 call!40573 (tuple2!13191 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!931912 () Bool)

(declare-fun res!627621 () Bool)

(assert (=> b!931912 (=> (not res!627621) (not e!523340))))

(declare-fun e!523349 () Bool)

(assert (=> b!931912 (= res!627621 e!523349)))

(declare-fun c!97052 () Bool)

(assert (=> b!931912 (= c!97052 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40566 () Bool)

(declare-fun call!40569 () Bool)

(assert (=> bm!40566 (= call!40569 (contains!5006 lt!419630 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!931913 () Bool)

(assert (=> b!931913 (= e!523342 (validKeyInArray!0 (select (arr!26957 _keys!1487) from!1844)))))

(declare-fun b!931914 () Bool)

(assert (=> b!931914 (= e!523339 call!40567)))

(declare-fun b!931915 () Bool)

(assert (=> b!931915 (= e!523346 e!523350)))

(declare-fun res!627620 () Bool)

(declare-fun call!40568 () Bool)

(assert (=> b!931915 (= res!627620 call!40568)))

(assert (=> b!931915 (=> (not res!627620) (not e!523350))))

(declare-fun b!931916 () Bool)

(assert (=> b!931916 (= e!523346 (not call!40568))))

(declare-fun b!931917 () Bool)

(declare-fun c!97054 () Bool)

(assert (=> b!931917 (= c!97054 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!931917 (= e!523345 e!523339)))

(declare-fun bm!40567 () Bool)

(assert (=> bm!40567 (= call!40571 call!40570)))

(declare-fun c!97056 () Bool)

(declare-fun bm!40568 () Bool)

(assert (=> bm!40568 (= call!40573 (+!2766 (ite c!97055 call!40570 (ite c!97056 call!40571 call!40567)) (ite (or c!97055 c!97056) (tuple2!13191 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13191 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!931918 () Bool)

(assert (=> b!931918 (= e!523347 (validKeyInArray!0 (select (arr!26957 _keys!1487) from!1844)))))

(declare-fun b!931919 () Bool)

(assert (=> b!931919 (= e!523349 (not call!40569))))

(declare-fun b!931920 () Bool)

(assert (=> b!931920 (= e!523351 e!523343)))

(declare-fun res!627619 () Bool)

(assert (=> b!931920 (=> (not res!627619) (not e!523343))))

(assert (=> b!931920 (= res!627619 (contains!5006 lt!419630 (select (arr!26957 _keys!1487) from!1844)))))

(assert (=> b!931920 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27416 _keys!1487)))))

(declare-fun b!931921 () Bool)

(assert (=> b!931921 (= e!523341 e!523345)))

(assert (=> b!931921 (= c!97056 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40569 () Bool)

(assert (=> bm!40569 (= call!40568 (contains!5006 lt!419630 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!931922 () Bool)

(assert (=> b!931922 (= e!523349 e!523348)))

(declare-fun res!627624 () Bool)

(assert (=> b!931922 (= res!627624 call!40569)))

(assert (=> b!931922 (=> (not res!627624) (not e!523348))))

(declare-fun bm!40570 () Bool)

(assert (=> bm!40570 (= call!40572 call!40573)))

(assert (= (and d!113035 c!97055) b!931911))

(assert (= (and d!113035 (not c!97055)) b!931921))

(assert (= (and b!931921 c!97056) b!931907))

(assert (= (and b!931921 (not c!97056)) b!931917))

(assert (= (and b!931917 c!97054) b!931910))

(assert (= (and b!931917 (not c!97054)) b!931914))

(assert (= (or b!931910 b!931914) bm!40564))

(assert (= (or b!931907 bm!40564) bm!40567))

(assert (= (or b!931907 b!931910) bm!40570))

(assert (= (or b!931911 bm!40567) bm!40565))

(assert (= (or b!931911 bm!40570) bm!40568))

(assert (= (and d!113035 res!627622) b!931913))

(assert (= (and d!113035 c!97051) b!931908))

(assert (= (and d!113035 (not c!97051)) b!931909))

(assert (= (and d!113035 res!627623) b!931904))

(assert (= (and b!931904 res!627618) b!931918))

(assert (= (and b!931904 (not res!627625)) b!931920))

(assert (= (and b!931920 res!627619) b!931905))

(assert (= (and b!931904 res!627617) b!931912))

(assert (= (and b!931912 c!97052) b!931922))

(assert (= (and b!931912 (not c!97052)) b!931919))

(assert (= (and b!931922 res!627624) b!931903))

(assert (= (or b!931922 b!931919) bm!40566))

(assert (= (and b!931912 res!627621) b!931906))

(assert (= (and b!931906 c!97053) b!931915))

(assert (= (and b!931906 (not c!97053)) b!931916))

(assert (= (and b!931915 res!627620) b!931902))

(assert (= (or b!931915 b!931916) bm!40569))

(declare-fun b_lambda!13857 () Bool)

(assert (=> (not b_lambda!13857) (not b!931905)))

(assert (=> b!931905 t!27054))

(declare-fun b_and!28629 () Bool)

(assert (= b_and!28623 (and (=> t!27054 result!11681) b_and!28629)))

(declare-fun m!865759 () Bool)

(assert (=> b!931903 m!865759))

(declare-fun m!865761 () Bool)

(assert (=> b!931913 m!865761))

(assert (=> b!931913 m!865761))

(declare-fun m!865763 () Bool)

(assert (=> b!931913 m!865763))

(declare-fun m!865765 () Bool)

(assert (=> bm!40566 m!865765))

(assert (=> b!931920 m!865761))

(assert (=> b!931920 m!865761))

(declare-fun m!865767 () Bool)

(assert (=> b!931920 m!865767))

(declare-fun m!865769 () Bool)

(assert (=> bm!40569 m!865769))

(assert (=> b!931918 m!865761))

(assert (=> b!931918 m!865761))

(assert (=> b!931918 m!865763))

(assert (=> b!931905 m!865761))

(declare-fun m!865771 () Bool)

(assert (=> b!931905 m!865771))

(assert (=> b!931905 m!865669))

(assert (=> b!931905 m!865761))

(declare-fun m!865773 () Bool)

(assert (=> b!931905 m!865773))

(assert (=> b!931905 m!865669))

(declare-fun m!865775 () Bool)

(assert (=> b!931905 m!865775))

(assert (=> b!931905 m!865773))

(declare-fun m!865777 () Bool)

(assert (=> b!931908 m!865777))

(declare-fun m!865779 () Bool)

(assert (=> b!931908 m!865779))

(declare-fun m!865781 () Bool)

(assert (=> b!931908 m!865781))

(declare-fun m!865783 () Bool)

(assert (=> b!931908 m!865783))

(declare-fun m!865785 () Bool)

(assert (=> b!931908 m!865785))

(declare-fun m!865787 () Bool)

(assert (=> b!931908 m!865787))

(declare-fun m!865789 () Bool)

(assert (=> b!931908 m!865789))

(assert (=> b!931908 m!865781))

(declare-fun m!865791 () Bool)

(assert (=> b!931908 m!865791))

(declare-fun m!865793 () Bool)

(assert (=> b!931908 m!865793))

(declare-fun m!865795 () Bool)

(assert (=> b!931908 m!865795))

(declare-fun m!865797 () Bool)

(assert (=> b!931908 m!865797))

(declare-fun m!865799 () Bool)

(assert (=> b!931908 m!865799))

(declare-fun m!865801 () Bool)

(assert (=> b!931908 m!865801))

(declare-fun m!865803 () Bool)

(assert (=> b!931908 m!865803))

(assert (=> b!931908 m!865761))

(assert (=> b!931908 m!865801))

(declare-fun m!865805 () Bool)

(assert (=> b!931908 m!865805))

(declare-fun m!865807 () Bool)

(assert (=> b!931908 m!865807))

(assert (=> b!931908 m!865785))

(assert (=> b!931908 m!865777))

(assert (=> bm!40565 m!865791))

(declare-fun m!865809 () Bool)

(assert (=> b!931902 m!865809))

(declare-fun m!865811 () Bool)

(assert (=> bm!40568 m!865811))

(declare-fun m!865813 () Bool)

(assert (=> b!931911 m!865813))

(assert (=> d!113035 m!865687))

(assert (=> b!931789 d!113035))

(declare-fun d!113037 () Bool)

(assert (=> d!113037 (= (validKeyInArray!0 k0!1099) (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!931794 d!113037))

(declare-fun d!113039 () Bool)

(assert (=> d!113039 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!79322 d!113039))

(declare-fun d!113041 () Bool)

(assert (=> d!113041 (= (array_inv!20982 _values!1231) (bvsge (size!27417 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!79322 d!113041))

(declare-fun d!113043 () Bool)

(assert (=> d!113043 (= (array_inv!20983 _keys!1487) (bvsge (size!27416 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!79322 d!113043))

(declare-fun d!113045 () Bool)

(declare-fun e!523354 () Bool)

(assert (=> d!113045 e!523354))

(declare-fun res!627630 () Bool)

(assert (=> d!113045 (=> (not res!627630) (not e!523354))))

(declare-fun lt!419641 () ListLongMap!11887)

(assert (=> d!113045 (= res!627630 (contains!5006 lt!419641 (_1!6606 lt!419525)))))

(declare-fun lt!419644 () List!18976)

(assert (=> d!113045 (= lt!419641 (ListLongMap!11888 lt!419644))))

(declare-fun lt!419643 () Unit!31442)

(declare-fun lt!419642 () Unit!31442)

(assert (=> d!113045 (= lt!419643 lt!419642)))

(assert (=> d!113045 (= (getValueByKey!478 lt!419644 (_1!6606 lt!419525)) (Some!483 (_2!6606 lt!419525)))))

(declare-fun lemmaContainsTupThenGetReturnValue!254 (List!18976 (_ BitVec 64) V!31689) Unit!31442)

(assert (=> d!113045 (= lt!419642 (lemmaContainsTupThenGetReturnValue!254 lt!419644 (_1!6606 lt!419525) (_2!6606 lt!419525)))))

(declare-fun insertStrictlySorted!311 (List!18976 (_ BitVec 64) V!31689) List!18976)

(assert (=> d!113045 (= lt!419644 (insertStrictlySorted!311 (toList!5959 (getCurrentListMap!3197 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)) (_1!6606 lt!419525) (_2!6606 lt!419525)))))

(assert (=> d!113045 (= (+!2766 (getCurrentListMap!3197 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419525) lt!419641)))

(declare-fun b!931927 () Bool)

(declare-fun res!627631 () Bool)

(assert (=> b!931927 (=> (not res!627631) (not e!523354))))

(assert (=> b!931927 (= res!627631 (= (getValueByKey!478 (toList!5959 lt!419641) (_1!6606 lt!419525)) (Some!483 (_2!6606 lt!419525))))))

(declare-fun b!931928 () Bool)

(declare-fun contains!5008 (List!18976 tuple2!13190) Bool)

(assert (=> b!931928 (= e!523354 (contains!5008 (toList!5959 lt!419641) lt!419525))))

(assert (= (and d!113045 res!627630) b!931927))

(assert (= (and b!931927 res!627631) b!931928))

(declare-fun m!865815 () Bool)

(assert (=> d!113045 m!865815))

(declare-fun m!865817 () Bool)

(assert (=> d!113045 m!865817))

(declare-fun m!865819 () Bool)

(assert (=> d!113045 m!865819))

(declare-fun m!865821 () Bool)

(assert (=> d!113045 m!865821))

(declare-fun m!865823 () Bool)

(assert (=> b!931927 m!865823))

(declare-fun m!865825 () Bool)

(assert (=> b!931928 m!865825))

(assert (=> b!931793 d!113045))

(declare-fun b!931929 () Bool)

(declare-fun e!523366 () Bool)

(declare-fun lt!419664 () ListLongMap!11887)

(assert (=> b!931929 (= e!523366 (= (apply!776 lt!419664 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun b!931930 () Bool)

(declare-fun e!523364 () Bool)

(assert (=> b!931930 (= e!523364 (= (apply!776 lt!419664 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!931931 () Bool)

(declare-fun res!627632 () Bool)

(declare-fun e!523356 () Bool)

(assert (=> b!931931 (=> (not res!627632) (not e!523356))))

(declare-fun e!523367 () Bool)

(assert (=> b!931931 (= res!627632 e!523367)))

(declare-fun res!627640 () Bool)

(assert (=> b!931931 (=> res!627640 e!523367)))

(declare-fun e!523363 () Bool)

(assert (=> b!931931 (= res!627640 (not e!523363))))

(declare-fun res!627633 () Bool)

(assert (=> b!931931 (=> (not res!627633) (not e!523363))))

(assert (=> b!931931 (= res!627633 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27416 _keys!1487)))))

(declare-fun bm!40571 () Bool)

(declare-fun call!40574 () ListLongMap!11887)

(declare-fun call!40578 () ListLongMap!11887)

(assert (=> bm!40571 (= call!40574 call!40578)))

(declare-fun bm!40572 () Bool)

(declare-fun call!40577 () ListLongMap!11887)

(assert (=> bm!40572 (= call!40577 (getCurrentListMapNoExtraKeys!3298 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun d!113047 () Bool)

(assert (=> d!113047 e!523356))

(declare-fun res!627638 () Bool)

(assert (=> d!113047 (=> (not res!627638) (not e!523356))))

(assert (=> d!113047 (= res!627638 (or (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27416 _keys!1487)) (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27416 _keys!1487)))))))

(declare-fun lt!419655 () ListLongMap!11887)

(assert (=> d!113047 (= lt!419664 lt!419655)))

(declare-fun lt!419656 () Unit!31442)

(declare-fun e!523360 () Unit!31442)

(assert (=> d!113047 (= lt!419656 e!523360)))

(declare-fun c!97057 () Bool)

(declare-fun e!523358 () Bool)

(assert (=> d!113047 (= c!97057 e!523358)))

(declare-fun res!627637 () Bool)

(assert (=> d!113047 (=> (not res!627637) (not e!523358))))

(assert (=> d!113047 (= res!627637 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27416 _keys!1487)))))

(declare-fun e!523357 () ListLongMap!11887)

(assert (=> d!113047 (= lt!419655 e!523357)))

(declare-fun c!97061 () Bool)

(assert (=> d!113047 (= c!97061 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113047 (validMask!0 mask!1881)))

(assert (=> d!113047 (= (getCurrentListMap!3197 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419664)))

(declare-fun e!523359 () Bool)

(declare-fun b!931932 () Bool)

(assert (=> b!931932 (= e!523359 (= (apply!776 lt!419664 (select (arr!26957 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (get!14167 (select (arr!26958 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1555 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!931932 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27417 _values!1231)))))

(assert (=> b!931932 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27416 _keys!1487)))))

(declare-fun b!931933 () Bool)

(declare-fun e!523362 () Bool)

(assert (=> b!931933 (= e!523356 e!523362)))

(declare-fun c!97059 () Bool)

(assert (=> b!931933 (= c!97059 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!931934 () Bool)

(declare-fun e!523361 () ListLongMap!11887)

(declare-fun call!40579 () ListLongMap!11887)

(assert (=> b!931934 (= e!523361 call!40579)))

(declare-fun b!931935 () Bool)

(declare-fun lt!419650 () Unit!31442)

(assert (=> b!931935 (= e!523360 lt!419650)))

(declare-fun lt!419649 () ListLongMap!11887)

(assert (=> b!931935 (= lt!419649 (getCurrentListMapNoExtraKeys!3298 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!419654 () (_ BitVec 64))

(assert (=> b!931935 (= lt!419654 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419647 () (_ BitVec 64))

(assert (=> b!931935 (= lt!419647 (select (arr!26957 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!419666 () Unit!31442)

(assert (=> b!931935 (= lt!419666 (addStillContains!485 lt!419649 lt!419654 zeroValue!1173 lt!419647))))

(assert (=> b!931935 (contains!5006 (+!2766 lt!419649 (tuple2!13191 lt!419654 zeroValue!1173)) lt!419647)))

(declare-fun lt!419657 () Unit!31442)

(assert (=> b!931935 (= lt!419657 lt!419666)))

(declare-fun lt!419663 () ListLongMap!11887)

(assert (=> b!931935 (= lt!419663 (getCurrentListMapNoExtraKeys!3298 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!419645 () (_ BitVec 64))

(assert (=> b!931935 (= lt!419645 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419658 () (_ BitVec 64))

(assert (=> b!931935 (= lt!419658 (select (arr!26957 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!419653 () Unit!31442)

(assert (=> b!931935 (= lt!419653 (addApplyDifferent!417 lt!419663 lt!419645 minValue!1173 lt!419658))))

(assert (=> b!931935 (= (apply!776 (+!2766 lt!419663 (tuple2!13191 lt!419645 minValue!1173)) lt!419658) (apply!776 lt!419663 lt!419658))))

(declare-fun lt!419660 () Unit!31442)

(assert (=> b!931935 (= lt!419660 lt!419653)))

(declare-fun lt!419665 () ListLongMap!11887)

(assert (=> b!931935 (= lt!419665 (getCurrentListMapNoExtraKeys!3298 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!419648 () (_ BitVec 64))

(assert (=> b!931935 (= lt!419648 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419646 () (_ BitVec 64))

(assert (=> b!931935 (= lt!419646 (select (arr!26957 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!419661 () Unit!31442)

(assert (=> b!931935 (= lt!419661 (addApplyDifferent!417 lt!419665 lt!419648 zeroValue!1173 lt!419646))))

(assert (=> b!931935 (= (apply!776 (+!2766 lt!419665 (tuple2!13191 lt!419648 zeroValue!1173)) lt!419646) (apply!776 lt!419665 lt!419646))))

(declare-fun lt!419659 () Unit!31442)

(assert (=> b!931935 (= lt!419659 lt!419661)))

(declare-fun lt!419652 () ListLongMap!11887)

(assert (=> b!931935 (= lt!419652 (getCurrentListMapNoExtraKeys!3298 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!419651 () (_ BitVec 64))

(assert (=> b!931935 (= lt!419651 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419662 () (_ BitVec 64))

(assert (=> b!931935 (= lt!419662 (select (arr!26957 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!931935 (= lt!419650 (addApplyDifferent!417 lt!419652 lt!419651 minValue!1173 lt!419662))))

(assert (=> b!931935 (= (apply!776 (+!2766 lt!419652 (tuple2!13191 lt!419651 minValue!1173)) lt!419662) (apply!776 lt!419652 lt!419662))))

(declare-fun b!931936 () Bool)

(declare-fun Unit!31448 () Unit!31442)

(assert (=> b!931936 (= e!523360 Unit!31448)))

(declare-fun b!931937 () Bool)

(declare-fun e!523355 () ListLongMap!11887)

(assert (=> b!931937 (= e!523355 call!40579)))

(declare-fun b!931938 () Bool)

(declare-fun call!40580 () ListLongMap!11887)

(assert (=> b!931938 (= e!523357 (+!2766 call!40580 (tuple2!13191 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!931939 () Bool)

(declare-fun res!627636 () Bool)

(assert (=> b!931939 (=> (not res!627636) (not e!523356))))

(declare-fun e!523365 () Bool)

(assert (=> b!931939 (= res!627636 e!523365)))

(declare-fun c!97058 () Bool)

(assert (=> b!931939 (= c!97058 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40573 () Bool)

(declare-fun call!40576 () Bool)

(assert (=> bm!40573 (= call!40576 (contains!5006 lt!419664 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!931940 () Bool)

(assert (=> b!931940 (= e!523358 (validKeyInArray!0 (select (arr!26957 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!931941 () Bool)

(assert (=> b!931941 (= e!523355 call!40574)))

(declare-fun b!931942 () Bool)

(assert (=> b!931942 (= e!523362 e!523366)))

(declare-fun res!627635 () Bool)

(declare-fun call!40575 () Bool)

(assert (=> b!931942 (= res!627635 call!40575)))

(assert (=> b!931942 (=> (not res!627635) (not e!523366))))

(declare-fun b!931943 () Bool)

(assert (=> b!931943 (= e!523362 (not call!40575))))

(declare-fun b!931944 () Bool)

(declare-fun c!97060 () Bool)

(assert (=> b!931944 (= c!97060 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!931944 (= e!523361 e!523355)))

(declare-fun bm!40574 () Bool)

(assert (=> bm!40574 (= call!40578 call!40577)))

(declare-fun bm!40575 () Bool)

(declare-fun c!97062 () Bool)

(assert (=> bm!40575 (= call!40580 (+!2766 (ite c!97061 call!40577 (ite c!97062 call!40578 call!40574)) (ite (or c!97061 c!97062) (tuple2!13191 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13191 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!931945 () Bool)

(assert (=> b!931945 (= e!523363 (validKeyInArray!0 (select (arr!26957 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!931946 () Bool)

(assert (=> b!931946 (= e!523365 (not call!40576))))

(declare-fun b!931947 () Bool)

(assert (=> b!931947 (= e!523367 e!523359)))

(declare-fun res!627634 () Bool)

(assert (=> b!931947 (=> (not res!627634) (not e!523359))))

(assert (=> b!931947 (= res!627634 (contains!5006 lt!419664 (select (arr!26957 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!931947 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27416 _keys!1487)))))

(declare-fun b!931948 () Bool)

(assert (=> b!931948 (= e!523357 e!523361)))

(assert (=> b!931948 (= c!97062 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40576 () Bool)

(assert (=> bm!40576 (= call!40575 (contains!5006 lt!419664 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!931949 () Bool)

(assert (=> b!931949 (= e!523365 e!523364)))

(declare-fun res!627639 () Bool)

(assert (=> b!931949 (= res!627639 call!40576)))

(assert (=> b!931949 (=> (not res!627639) (not e!523364))))

(declare-fun bm!40577 () Bool)

(assert (=> bm!40577 (= call!40579 call!40580)))

(assert (= (and d!113047 c!97061) b!931938))

(assert (= (and d!113047 (not c!97061)) b!931948))

(assert (= (and b!931948 c!97062) b!931934))

(assert (= (and b!931948 (not c!97062)) b!931944))

(assert (= (and b!931944 c!97060) b!931937))

(assert (= (and b!931944 (not c!97060)) b!931941))

(assert (= (or b!931937 b!931941) bm!40571))

(assert (= (or b!931934 bm!40571) bm!40574))

(assert (= (or b!931934 b!931937) bm!40577))

(assert (= (or b!931938 bm!40574) bm!40572))

(assert (= (or b!931938 bm!40577) bm!40575))

(assert (= (and d!113047 res!627637) b!931940))

(assert (= (and d!113047 c!97057) b!931935))

(assert (= (and d!113047 (not c!97057)) b!931936))

(assert (= (and d!113047 res!627638) b!931931))

(assert (= (and b!931931 res!627633) b!931945))

(assert (= (and b!931931 (not res!627640)) b!931947))

(assert (= (and b!931947 res!627634) b!931932))

(assert (= (and b!931931 res!627632) b!931939))

(assert (= (and b!931939 c!97058) b!931949))

(assert (= (and b!931939 (not c!97058)) b!931946))

(assert (= (and b!931949 res!627639) b!931930))

(assert (= (or b!931949 b!931946) bm!40573))

(assert (= (and b!931939 res!627636) b!931933))

(assert (= (and b!931933 c!97059) b!931942))

(assert (= (and b!931933 (not c!97059)) b!931943))

(assert (= (and b!931942 res!627635) b!931929))

(assert (= (or b!931942 b!931943) bm!40576))

(declare-fun b_lambda!13859 () Bool)

(assert (=> (not b_lambda!13859) (not b!931932)))

(assert (=> b!931932 t!27054))

(declare-fun b_and!28631 () Bool)

(assert (= b_and!28629 (and (=> t!27054 result!11681) b_and!28631)))

(declare-fun m!865827 () Bool)

(assert (=> b!931930 m!865827))

(declare-fun m!865829 () Bool)

(assert (=> b!931940 m!865829))

(assert (=> b!931940 m!865829))

(declare-fun m!865831 () Bool)

(assert (=> b!931940 m!865831))

(declare-fun m!865833 () Bool)

(assert (=> bm!40573 m!865833))

(assert (=> b!931947 m!865829))

(assert (=> b!931947 m!865829))

(declare-fun m!865835 () Bool)

(assert (=> b!931947 m!865835))

(declare-fun m!865837 () Bool)

(assert (=> bm!40576 m!865837))

(assert (=> b!931945 m!865829))

(assert (=> b!931945 m!865829))

(assert (=> b!931945 m!865831))

(assert (=> b!931932 m!865829))

(declare-fun m!865839 () Bool)

(assert (=> b!931932 m!865839))

(assert (=> b!931932 m!865669))

(assert (=> b!931932 m!865829))

(declare-fun m!865841 () Bool)

(assert (=> b!931932 m!865841))

(assert (=> b!931932 m!865669))

(declare-fun m!865843 () Bool)

(assert (=> b!931932 m!865843))

(assert (=> b!931932 m!865841))

(declare-fun m!865845 () Bool)

(assert (=> b!931935 m!865845))

(declare-fun m!865847 () Bool)

(assert (=> b!931935 m!865847))

(declare-fun m!865849 () Bool)

(assert (=> b!931935 m!865849))

(declare-fun m!865851 () Bool)

(assert (=> b!931935 m!865851))

(declare-fun m!865853 () Bool)

(assert (=> b!931935 m!865853))

(declare-fun m!865855 () Bool)

(assert (=> b!931935 m!865855))

(declare-fun m!865857 () Bool)

(assert (=> b!931935 m!865857))

(assert (=> b!931935 m!865849))

(declare-fun m!865859 () Bool)

(assert (=> b!931935 m!865859))

(declare-fun m!865861 () Bool)

(assert (=> b!931935 m!865861))

(declare-fun m!865863 () Bool)

(assert (=> b!931935 m!865863))

(declare-fun m!865865 () Bool)

(assert (=> b!931935 m!865865))

(declare-fun m!865867 () Bool)

(assert (=> b!931935 m!865867))

(declare-fun m!865869 () Bool)

(assert (=> b!931935 m!865869))

(declare-fun m!865871 () Bool)

(assert (=> b!931935 m!865871))

(assert (=> b!931935 m!865829))

(assert (=> b!931935 m!865869))

(declare-fun m!865873 () Bool)

(assert (=> b!931935 m!865873))

(declare-fun m!865875 () Bool)

(assert (=> b!931935 m!865875))

(assert (=> b!931935 m!865853))

(assert (=> b!931935 m!865845))

(assert (=> bm!40572 m!865859))

(declare-fun m!865877 () Bool)

(assert (=> b!931929 m!865877))

(declare-fun m!865879 () Bool)

(assert (=> bm!40575 m!865879))

(declare-fun m!865881 () Bool)

(assert (=> b!931938 m!865881))

(assert (=> d!113047 m!865687))

(assert (=> b!931793 d!113047))

(declare-fun d!113049 () Bool)

(declare-fun e!523370 () Bool)

(assert (=> d!113049 e!523370))

(declare-fun res!627643 () Bool)

(assert (=> d!113049 (=> (not res!627643) (not e!523370))))

(assert (=> d!113049 (= res!627643 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27416 _keys!1487)) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27417 _values!1231))))))

(declare-fun lt!419669 () Unit!31442)

(declare-fun choose!1539 (array!56024 array!56026 (_ BitVec 32) (_ BitVec 32) V!31689 V!31689 (_ BitVec 32) Int) Unit!31442)

(assert (=> d!113049 (= lt!419669 (choose!1539 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> d!113049 (validMask!0 mask!1881)))

(assert (=> d!113049 (= (lemmaListMapRecursiveValidKeyArray!156 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!419669)))

(declare-fun b!931952 () Bool)

(assert (=> b!931952 (= e!523370 (= (getCurrentListMap!3197 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2766 (getCurrentListMap!3197 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13191 (select (arr!26957 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14167 (select (arr!26958 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1555 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!113049 res!627643) b!931952))

(declare-fun b_lambda!13861 () Bool)

(assert (=> (not b_lambda!13861) (not b!931952)))

(assert (=> b!931952 t!27054))

(declare-fun b_and!28633 () Bool)

(assert (= b_and!28631 (and (=> t!27054 result!11681) b_and!28633)))

(declare-fun m!865883 () Bool)

(assert (=> d!113049 m!865883))

(assert (=> d!113049 m!865687))

(assert (=> b!931952 m!865673))

(assert (=> b!931952 m!865655))

(assert (=> b!931952 m!865667))

(assert (=> b!931952 m!865669))

(assert (=> b!931952 m!865671))

(assert (=> b!931952 m!865667))

(declare-fun m!865885 () Bool)

(assert (=> b!931952 m!865885))

(declare-fun m!865887 () Bool)

(assert (=> b!931952 m!865887))

(assert (=> b!931952 m!865669))

(assert (=> b!931952 m!865885))

(assert (=> b!931793 d!113049))

(declare-fun d!113051 () Bool)

(assert (=> d!113051 (contains!5006 (+!2766 lt!419523 (tuple2!13191 lt!419527 lt!419526)) k0!1099)))

(declare-fun lt!419672 () Unit!31442)

(declare-fun choose!1540 (ListLongMap!11887 (_ BitVec 64) V!31689 (_ BitVec 64)) Unit!31442)

(assert (=> d!113051 (= lt!419672 (choose!1540 lt!419523 lt!419527 lt!419526 k0!1099))))

(assert (=> d!113051 (contains!5006 lt!419523 k0!1099)))

(assert (=> d!113051 (= (addStillContains!485 lt!419523 lt!419527 lt!419526 k0!1099) lt!419672)))

(declare-fun bs!26181 () Bool)

(assert (= bs!26181 d!113051))

(declare-fun m!865889 () Bool)

(assert (=> bs!26181 m!865889))

(assert (=> bs!26181 m!865889))

(declare-fun m!865891 () Bool)

(assert (=> bs!26181 m!865891))

(declare-fun m!865893 () Bool)

(assert (=> bs!26181 m!865893))

(assert (=> bs!26181 m!865657))

(assert (=> b!931793 d!113051))

(declare-fun d!113053 () Bool)

(declare-fun e!523371 () Bool)

(assert (=> d!113053 e!523371))

(declare-fun res!627644 () Bool)

(assert (=> d!113053 (=> (not res!627644) (not e!523371))))

(declare-fun lt!419673 () ListLongMap!11887)

(assert (=> d!113053 (= res!627644 (contains!5006 lt!419673 (_1!6606 lt!419525)))))

(declare-fun lt!419676 () List!18976)

(assert (=> d!113053 (= lt!419673 (ListLongMap!11888 lt!419676))))

(declare-fun lt!419675 () Unit!31442)

(declare-fun lt!419674 () Unit!31442)

(assert (=> d!113053 (= lt!419675 lt!419674)))

(assert (=> d!113053 (= (getValueByKey!478 lt!419676 (_1!6606 lt!419525)) (Some!483 (_2!6606 lt!419525)))))

(assert (=> d!113053 (= lt!419674 (lemmaContainsTupThenGetReturnValue!254 lt!419676 (_1!6606 lt!419525) (_2!6606 lt!419525)))))

(assert (=> d!113053 (= lt!419676 (insertStrictlySorted!311 (toList!5959 lt!419523) (_1!6606 lt!419525) (_2!6606 lt!419525)))))

(assert (=> d!113053 (= (+!2766 lt!419523 lt!419525) lt!419673)))

(declare-fun b!931954 () Bool)

(declare-fun res!627645 () Bool)

(assert (=> b!931954 (=> (not res!627645) (not e!523371))))

(assert (=> b!931954 (= res!627645 (= (getValueByKey!478 (toList!5959 lt!419673) (_1!6606 lt!419525)) (Some!483 (_2!6606 lt!419525))))))

(declare-fun b!931955 () Bool)

(assert (=> b!931955 (= e!523371 (contains!5008 (toList!5959 lt!419673) lt!419525))))

(assert (= (and d!113053 res!627644) b!931954))

(assert (= (and b!931954 res!627645) b!931955))

(declare-fun m!865895 () Bool)

(assert (=> d!113053 m!865895))

(declare-fun m!865897 () Bool)

(assert (=> d!113053 m!865897))

(declare-fun m!865899 () Bool)

(assert (=> d!113053 m!865899))

(declare-fun m!865901 () Bool)

(assert (=> d!113053 m!865901))

(declare-fun m!865903 () Bool)

(assert (=> b!931954 m!865903))

(declare-fun m!865905 () Bool)

(assert (=> b!931955 m!865905))

(assert (=> b!931793 d!113053))

(declare-fun d!113055 () Bool)

(declare-fun c!97065 () Bool)

(assert (=> d!113055 (= c!97065 ((_ is ValueCellFull!9540) (select (arr!26958 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun e!523374 () V!31689)

(assert (=> d!113055 (= (get!14167 (select (arr!26958 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1555 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!523374)))

(declare-fun b!931960 () Bool)

(declare-fun get!14170 (ValueCell!9540 V!31689) V!31689)

(assert (=> b!931960 (= e!523374 (get!14170 (select (arr!26958 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1555 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!931961 () Bool)

(declare-fun get!14171 (ValueCell!9540 V!31689) V!31689)

(assert (=> b!931961 (= e!523374 (get!14171 (select (arr!26958 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1555 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113055 c!97065) b!931960))

(assert (= (and d!113055 (not c!97065)) b!931961))

(assert (=> b!931960 m!865667))

(assert (=> b!931960 m!865669))

(declare-fun m!865907 () Bool)

(assert (=> b!931960 m!865907))

(assert (=> b!931961 m!865667))

(assert (=> b!931961 m!865669))

(declare-fun m!865909 () Bool)

(assert (=> b!931961 m!865909))

(assert (=> b!931793 d!113055))

(declare-fun d!113057 () Bool)

(declare-fun e!523376 () Bool)

(assert (=> d!113057 e!523376))

(declare-fun res!627646 () Bool)

(assert (=> d!113057 (=> res!627646 e!523376)))

(declare-fun lt!419677 () Bool)

(assert (=> d!113057 (= res!627646 (not lt!419677))))

(declare-fun lt!419679 () Bool)

(assert (=> d!113057 (= lt!419677 lt!419679)))

(declare-fun lt!419680 () Unit!31442)

(declare-fun e!523375 () Unit!31442)

(assert (=> d!113057 (= lt!419680 e!523375)))

(declare-fun c!97066 () Bool)

(assert (=> d!113057 (= c!97066 lt!419679)))

(assert (=> d!113057 (= lt!419679 (containsKey!445 (toList!5959 (+!2766 lt!419523 lt!419525)) k0!1099))))

(assert (=> d!113057 (= (contains!5006 (+!2766 lt!419523 lt!419525) k0!1099) lt!419677)))

(declare-fun b!931962 () Bool)

(declare-fun lt!419678 () Unit!31442)

(assert (=> b!931962 (= e!523375 lt!419678)))

(assert (=> b!931962 (= lt!419678 (lemmaContainsKeyImpliesGetValueByKeyDefined!341 (toList!5959 (+!2766 lt!419523 lt!419525)) k0!1099))))

(assert (=> b!931962 (isDefined!350 (getValueByKey!478 (toList!5959 (+!2766 lt!419523 lt!419525)) k0!1099))))

(declare-fun b!931963 () Bool)

(declare-fun Unit!31449 () Unit!31442)

(assert (=> b!931963 (= e!523375 Unit!31449)))

(declare-fun b!931964 () Bool)

(assert (=> b!931964 (= e!523376 (isDefined!350 (getValueByKey!478 (toList!5959 (+!2766 lt!419523 lt!419525)) k0!1099)))))

(assert (= (and d!113057 c!97066) b!931962))

(assert (= (and d!113057 (not c!97066)) b!931963))

(assert (= (and d!113057 (not res!627646)) b!931964))

(declare-fun m!865911 () Bool)

(assert (=> d!113057 m!865911))

(declare-fun m!865913 () Bool)

(assert (=> b!931962 m!865913))

(declare-fun m!865915 () Bool)

(assert (=> b!931962 m!865915))

(assert (=> b!931962 m!865915))

(declare-fun m!865917 () Bool)

(assert (=> b!931962 m!865917))

(assert (=> b!931964 m!865915))

(assert (=> b!931964 m!865915))

(assert (=> b!931964 m!865917))

(assert (=> b!931793 d!113057))

(declare-fun b!931965 () Bool)

(declare-fun e!523388 () Bool)

(declare-fun lt!419700 () ListLongMap!11887)

(assert (=> b!931965 (= e!523388 (= (apply!776 lt!419700 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun b!931966 () Bool)

(declare-fun e!523386 () Bool)

(assert (=> b!931966 (= e!523386 (= (apply!776 lt!419700 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!931967 () Bool)

(declare-fun res!627647 () Bool)

(declare-fun e!523378 () Bool)

(assert (=> b!931967 (=> (not res!627647) (not e!523378))))

(declare-fun e!523389 () Bool)

(assert (=> b!931967 (= res!627647 e!523389)))

(declare-fun res!627655 () Bool)

(assert (=> b!931967 (=> res!627655 e!523389)))

(declare-fun e!523385 () Bool)

(assert (=> b!931967 (= res!627655 (not e!523385))))

(declare-fun res!627648 () Bool)

(assert (=> b!931967 (=> (not res!627648) (not e!523385))))

(assert (=> b!931967 (= res!627648 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27416 _keys!1487)))))

(declare-fun bm!40578 () Bool)

(declare-fun call!40581 () ListLongMap!11887)

(declare-fun call!40585 () ListLongMap!11887)

(assert (=> bm!40578 (= call!40581 call!40585)))

(declare-fun bm!40579 () Bool)

(declare-fun call!40584 () ListLongMap!11887)

(assert (=> bm!40579 (= call!40584 (getCurrentListMapNoExtraKeys!3298 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun d!113059 () Bool)

(assert (=> d!113059 e!523378))

(declare-fun res!627653 () Bool)

(assert (=> d!113059 (=> (not res!627653) (not e!523378))))

(assert (=> d!113059 (= res!627653 (or (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27416 _keys!1487)) (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27416 _keys!1487)))))))

(declare-fun lt!419691 () ListLongMap!11887)

(assert (=> d!113059 (= lt!419700 lt!419691)))

(declare-fun lt!419692 () Unit!31442)

(declare-fun e!523382 () Unit!31442)

(assert (=> d!113059 (= lt!419692 e!523382)))

(declare-fun c!97067 () Bool)

(declare-fun e!523380 () Bool)

(assert (=> d!113059 (= c!97067 e!523380)))

(declare-fun res!627652 () Bool)

(assert (=> d!113059 (=> (not res!627652) (not e!523380))))

(assert (=> d!113059 (= res!627652 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27416 _keys!1487)))))

(declare-fun e!523379 () ListLongMap!11887)

(assert (=> d!113059 (= lt!419691 e!523379)))

(declare-fun c!97071 () Bool)

(assert (=> d!113059 (= c!97071 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113059 (validMask!0 mask!1881)))

(assert (=> d!113059 (= (getCurrentListMap!3197 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!419700)))

(declare-fun b!931968 () Bool)

(declare-fun e!523381 () Bool)

(assert (=> b!931968 (= e!523381 (= (apply!776 lt!419700 (select (arr!26957 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14167 (select (arr!26958 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1555 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!931968 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27417 _values!1231)))))

(assert (=> b!931968 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27416 _keys!1487)))))

(declare-fun b!931969 () Bool)

(declare-fun e!523384 () Bool)

(assert (=> b!931969 (= e!523378 e!523384)))

(declare-fun c!97069 () Bool)

(assert (=> b!931969 (= c!97069 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!931970 () Bool)

(declare-fun e!523383 () ListLongMap!11887)

(declare-fun call!40586 () ListLongMap!11887)

(assert (=> b!931970 (= e!523383 call!40586)))

(declare-fun b!931971 () Bool)

(declare-fun lt!419686 () Unit!31442)

(assert (=> b!931971 (= e!523382 lt!419686)))

(declare-fun lt!419685 () ListLongMap!11887)

(assert (=> b!931971 (= lt!419685 (getCurrentListMapNoExtraKeys!3298 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!419690 () (_ BitVec 64))

(assert (=> b!931971 (= lt!419690 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419683 () (_ BitVec 64))

(assert (=> b!931971 (= lt!419683 (select (arr!26957 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!419702 () Unit!31442)

(assert (=> b!931971 (= lt!419702 (addStillContains!485 lt!419685 lt!419690 zeroValue!1173 lt!419683))))

(assert (=> b!931971 (contains!5006 (+!2766 lt!419685 (tuple2!13191 lt!419690 zeroValue!1173)) lt!419683)))

(declare-fun lt!419693 () Unit!31442)

(assert (=> b!931971 (= lt!419693 lt!419702)))

(declare-fun lt!419699 () ListLongMap!11887)

(assert (=> b!931971 (= lt!419699 (getCurrentListMapNoExtraKeys!3298 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!419681 () (_ BitVec 64))

(assert (=> b!931971 (= lt!419681 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419694 () (_ BitVec 64))

(assert (=> b!931971 (= lt!419694 (select (arr!26957 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!419689 () Unit!31442)

(assert (=> b!931971 (= lt!419689 (addApplyDifferent!417 lt!419699 lt!419681 minValue!1173 lt!419694))))

(assert (=> b!931971 (= (apply!776 (+!2766 lt!419699 (tuple2!13191 lt!419681 minValue!1173)) lt!419694) (apply!776 lt!419699 lt!419694))))

(declare-fun lt!419696 () Unit!31442)

(assert (=> b!931971 (= lt!419696 lt!419689)))

(declare-fun lt!419701 () ListLongMap!11887)

(assert (=> b!931971 (= lt!419701 (getCurrentListMapNoExtraKeys!3298 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!419684 () (_ BitVec 64))

(assert (=> b!931971 (= lt!419684 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419682 () (_ BitVec 64))

(assert (=> b!931971 (= lt!419682 (select (arr!26957 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!419697 () Unit!31442)

(assert (=> b!931971 (= lt!419697 (addApplyDifferent!417 lt!419701 lt!419684 zeroValue!1173 lt!419682))))

(assert (=> b!931971 (= (apply!776 (+!2766 lt!419701 (tuple2!13191 lt!419684 zeroValue!1173)) lt!419682) (apply!776 lt!419701 lt!419682))))

(declare-fun lt!419695 () Unit!31442)

(assert (=> b!931971 (= lt!419695 lt!419697)))

(declare-fun lt!419688 () ListLongMap!11887)

(assert (=> b!931971 (= lt!419688 (getCurrentListMapNoExtraKeys!3298 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!419687 () (_ BitVec 64))

(assert (=> b!931971 (= lt!419687 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419698 () (_ BitVec 64))

(assert (=> b!931971 (= lt!419698 (select (arr!26957 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!931971 (= lt!419686 (addApplyDifferent!417 lt!419688 lt!419687 minValue!1173 lt!419698))))

(assert (=> b!931971 (= (apply!776 (+!2766 lt!419688 (tuple2!13191 lt!419687 minValue!1173)) lt!419698) (apply!776 lt!419688 lt!419698))))

(declare-fun b!931972 () Bool)

(declare-fun Unit!31450 () Unit!31442)

(assert (=> b!931972 (= e!523382 Unit!31450)))

(declare-fun b!931973 () Bool)

(declare-fun e!523377 () ListLongMap!11887)

(assert (=> b!931973 (= e!523377 call!40586)))

(declare-fun b!931974 () Bool)

(declare-fun call!40587 () ListLongMap!11887)

(assert (=> b!931974 (= e!523379 (+!2766 call!40587 (tuple2!13191 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!931975 () Bool)

(declare-fun res!627651 () Bool)

(assert (=> b!931975 (=> (not res!627651) (not e!523378))))

(declare-fun e!523387 () Bool)

(assert (=> b!931975 (= res!627651 e!523387)))

(declare-fun c!97068 () Bool)

(assert (=> b!931975 (= c!97068 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40580 () Bool)

(declare-fun call!40583 () Bool)

(assert (=> bm!40580 (= call!40583 (contains!5006 lt!419700 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!931976 () Bool)

(assert (=> b!931976 (= e!523380 (validKeyInArray!0 (select (arr!26957 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!931977 () Bool)

(assert (=> b!931977 (= e!523377 call!40581)))

(declare-fun b!931978 () Bool)

(assert (=> b!931978 (= e!523384 e!523388)))

(declare-fun res!627650 () Bool)

(declare-fun call!40582 () Bool)

(assert (=> b!931978 (= res!627650 call!40582)))

(assert (=> b!931978 (=> (not res!627650) (not e!523388))))

(declare-fun b!931979 () Bool)

(assert (=> b!931979 (= e!523384 (not call!40582))))

(declare-fun b!931980 () Bool)

(declare-fun c!97070 () Bool)

(assert (=> b!931980 (= c!97070 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!931980 (= e!523383 e!523377)))

(declare-fun bm!40581 () Bool)

(assert (=> bm!40581 (= call!40585 call!40584)))

(declare-fun c!97072 () Bool)

(declare-fun bm!40582 () Bool)

(assert (=> bm!40582 (= call!40587 (+!2766 (ite c!97071 call!40584 (ite c!97072 call!40585 call!40581)) (ite (or c!97071 c!97072) (tuple2!13191 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13191 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!931981 () Bool)

(assert (=> b!931981 (= e!523385 (validKeyInArray!0 (select (arr!26957 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!931982 () Bool)

(assert (=> b!931982 (= e!523387 (not call!40583))))

(declare-fun b!931983 () Bool)

(assert (=> b!931983 (= e!523389 e!523381)))

(declare-fun res!627649 () Bool)

(assert (=> b!931983 (=> (not res!627649) (not e!523381))))

(assert (=> b!931983 (= res!627649 (contains!5006 lt!419700 (select (arr!26957 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!931983 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27416 _keys!1487)))))

(declare-fun b!931984 () Bool)

(assert (=> b!931984 (= e!523379 e!523383)))

(assert (=> b!931984 (= c!97072 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40583 () Bool)

(assert (=> bm!40583 (= call!40582 (contains!5006 lt!419700 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!931985 () Bool)

(assert (=> b!931985 (= e!523387 e!523386)))

(declare-fun res!627654 () Bool)

(assert (=> b!931985 (= res!627654 call!40583)))

(assert (=> b!931985 (=> (not res!627654) (not e!523386))))

(declare-fun bm!40584 () Bool)

(assert (=> bm!40584 (= call!40586 call!40587)))

(assert (= (and d!113059 c!97071) b!931974))

(assert (= (and d!113059 (not c!97071)) b!931984))

(assert (= (and b!931984 c!97072) b!931970))

(assert (= (and b!931984 (not c!97072)) b!931980))

(assert (= (and b!931980 c!97070) b!931973))

(assert (= (and b!931980 (not c!97070)) b!931977))

(assert (= (or b!931973 b!931977) bm!40578))

(assert (= (or b!931970 bm!40578) bm!40581))

(assert (= (or b!931970 b!931973) bm!40584))

(assert (= (or b!931974 bm!40581) bm!40579))

(assert (= (or b!931974 bm!40584) bm!40582))

(assert (= (and d!113059 res!627652) b!931976))

(assert (= (and d!113059 c!97067) b!931971))

(assert (= (and d!113059 (not c!97067)) b!931972))

(assert (= (and d!113059 res!627653) b!931967))

(assert (= (and b!931967 res!627648) b!931981))

(assert (= (and b!931967 (not res!627655)) b!931983))

(assert (= (and b!931983 res!627649) b!931968))

(assert (= (and b!931967 res!627647) b!931975))

(assert (= (and b!931975 c!97068) b!931985))

(assert (= (and b!931975 (not c!97068)) b!931982))

(assert (= (and b!931985 res!627654) b!931966))

(assert (= (or b!931985 b!931982) bm!40580))

(assert (= (and b!931975 res!627651) b!931969))

(assert (= (and b!931969 c!97069) b!931978))

(assert (= (and b!931969 (not c!97069)) b!931979))

(assert (= (and b!931978 res!627650) b!931965))

(assert (= (or b!931978 b!931979) bm!40583))

(declare-fun b_lambda!13863 () Bool)

(assert (=> (not b_lambda!13863) (not b!931968)))

(assert (=> b!931968 t!27054))

(declare-fun b_and!28635 () Bool)

(assert (= b_and!28633 (and (=> t!27054 result!11681) b_and!28635)))

(declare-fun m!865919 () Bool)

(assert (=> b!931966 m!865919))

(assert (=> b!931976 m!865655))

(assert (=> b!931976 m!865655))

(declare-fun m!865921 () Bool)

(assert (=> b!931976 m!865921))

(declare-fun m!865923 () Bool)

(assert (=> bm!40580 m!865923))

(assert (=> b!931983 m!865655))

(assert (=> b!931983 m!865655))

(declare-fun m!865925 () Bool)

(assert (=> b!931983 m!865925))

(declare-fun m!865927 () Bool)

(assert (=> bm!40583 m!865927))

(assert (=> b!931981 m!865655))

(assert (=> b!931981 m!865655))

(assert (=> b!931981 m!865921))

(assert (=> b!931968 m!865655))

(declare-fun m!865929 () Bool)

(assert (=> b!931968 m!865929))

(assert (=> b!931968 m!865669))

(assert (=> b!931968 m!865655))

(assert (=> b!931968 m!865667))

(assert (=> b!931968 m!865669))

(assert (=> b!931968 m!865671))

(assert (=> b!931968 m!865667))

(declare-fun m!865931 () Bool)

(assert (=> b!931971 m!865931))

(declare-fun m!865933 () Bool)

(assert (=> b!931971 m!865933))

(declare-fun m!865935 () Bool)

(assert (=> b!931971 m!865935))

(declare-fun m!865937 () Bool)

(assert (=> b!931971 m!865937))

(declare-fun m!865939 () Bool)

(assert (=> b!931971 m!865939))

(declare-fun m!865941 () Bool)

(assert (=> b!931971 m!865941))

(declare-fun m!865943 () Bool)

(assert (=> b!931971 m!865943))

(assert (=> b!931971 m!865935))

(declare-fun m!865945 () Bool)

(assert (=> b!931971 m!865945))

(declare-fun m!865947 () Bool)

(assert (=> b!931971 m!865947))

(declare-fun m!865949 () Bool)

(assert (=> b!931971 m!865949))

(declare-fun m!865951 () Bool)

(assert (=> b!931971 m!865951))

(declare-fun m!865953 () Bool)

(assert (=> b!931971 m!865953))

(declare-fun m!865955 () Bool)

(assert (=> b!931971 m!865955))

(declare-fun m!865957 () Bool)

(assert (=> b!931971 m!865957))

(assert (=> b!931971 m!865655))

(assert (=> b!931971 m!865955))

(declare-fun m!865959 () Bool)

(assert (=> b!931971 m!865959))

(declare-fun m!865961 () Bool)

(assert (=> b!931971 m!865961))

(assert (=> b!931971 m!865939))

(assert (=> b!931971 m!865931))

(assert (=> bm!40579 m!865945))

(declare-fun m!865963 () Bool)

(assert (=> b!931965 m!865963))

(declare-fun m!865965 () Bool)

(assert (=> bm!40582 m!865965))

(declare-fun m!865967 () Bool)

(assert (=> b!931974 m!865967))

(assert (=> d!113059 m!865687))

(assert (=> b!931793 d!113059))

(declare-fun b!931996 () Bool)

(declare-fun e!523401 () Bool)

(declare-fun e!523399 () Bool)

(assert (=> b!931996 (= e!523401 e!523399)))

(declare-fun c!97075 () Bool)

(assert (=> b!931996 (= c!97075 (validKeyInArray!0 (select (arr!26957 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun bm!40587 () Bool)

(declare-fun call!40590 () Bool)

(assert (=> bm!40587 (= call!40590 (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!97075 (Cons!18973 (select (arr!26957 _keys!1487) #b00000000000000000000000000000000) Nil!18974) Nil!18974)))))

(declare-fun d!113061 () Bool)

(declare-fun res!627662 () Bool)

(declare-fun e!523400 () Bool)

(assert (=> d!113061 (=> res!627662 e!523400)))

(assert (=> d!113061 (= res!627662 (bvsge #b00000000000000000000000000000000 (size!27416 _keys!1487)))))

(assert (=> d!113061 (= (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18974) e!523400)))

(declare-fun b!931997 () Bool)

(declare-fun e!523398 () Bool)

(declare-fun contains!5009 (List!18977 (_ BitVec 64)) Bool)

(assert (=> b!931997 (= e!523398 (contains!5009 Nil!18974 (select (arr!26957 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!931998 () Bool)

(assert (=> b!931998 (= e!523399 call!40590)))

(declare-fun b!931999 () Bool)

(assert (=> b!931999 (= e!523399 call!40590)))

(declare-fun b!932000 () Bool)

(assert (=> b!932000 (= e!523400 e!523401)))

(declare-fun res!627663 () Bool)

(assert (=> b!932000 (=> (not res!627663) (not e!523401))))

(assert (=> b!932000 (= res!627663 (not e!523398))))

(declare-fun res!627664 () Bool)

(assert (=> b!932000 (=> (not res!627664) (not e!523398))))

(assert (=> b!932000 (= res!627664 (validKeyInArray!0 (select (arr!26957 _keys!1487) #b00000000000000000000000000000000)))))

(assert (= (and d!113061 (not res!627662)) b!932000))

(assert (= (and b!932000 res!627664) b!931997))

(assert (= (and b!932000 res!627663) b!931996))

(assert (= (and b!931996 c!97075) b!931998))

(assert (= (and b!931996 (not c!97075)) b!931999))

(assert (= (or b!931998 b!931999) bm!40587))

(assert (=> b!931996 m!865741))

(assert (=> b!931996 m!865741))

(assert (=> b!931996 m!865749))

(assert (=> bm!40587 m!865741))

(declare-fun m!865969 () Bool)

(assert (=> bm!40587 m!865969))

(assert (=> b!931997 m!865741))

(assert (=> b!931997 m!865741))

(declare-fun m!865971 () Bool)

(assert (=> b!931997 m!865971))

(assert (=> b!932000 m!865741))

(assert (=> b!932000 m!865741))

(assert (=> b!932000 m!865749))

(assert (=> b!931784 d!113061))

(declare-fun b!932007 () Bool)

(declare-fun e!523407 () Bool)

(assert (=> b!932007 (= e!523407 tp_is_empty!20043)))

(declare-fun b!932008 () Bool)

(declare-fun e!523406 () Bool)

(assert (=> b!932008 (= e!523406 tp_is_empty!20043)))

(declare-fun mapNonEmpty!31827 () Bool)

(declare-fun mapRes!31827 () Bool)

(declare-fun tp!61055 () Bool)

(assert (=> mapNonEmpty!31827 (= mapRes!31827 (and tp!61055 e!523407))))

(declare-fun mapValue!31827 () ValueCell!9540)

(declare-fun mapKey!31827 () (_ BitVec 32))

(declare-fun mapRest!31827 () (Array (_ BitVec 32) ValueCell!9540))

(assert (=> mapNonEmpty!31827 (= mapRest!31821 (store mapRest!31827 mapKey!31827 mapValue!31827))))

(declare-fun mapIsEmpty!31827 () Bool)

(assert (=> mapIsEmpty!31827 mapRes!31827))

(declare-fun condMapEmpty!31827 () Bool)

(declare-fun mapDefault!31827 () ValueCell!9540)

(assert (=> mapNonEmpty!31821 (= condMapEmpty!31827 (= mapRest!31821 ((as const (Array (_ BitVec 32) ValueCell!9540)) mapDefault!31827)))))

(assert (=> mapNonEmpty!31821 (= tp!61045 (and e!523406 mapRes!31827))))

(assert (= (and mapNonEmpty!31821 condMapEmpty!31827) mapIsEmpty!31827))

(assert (= (and mapNonEmpty!31821 (not condMapEmpty!31827)) mapNonEmpty!31827))

(assert (= (and mapNonEmpty!31827 ((_ is ValueCellFull!9540) mapValue!31827)) b!932007))

(assert (= (and mapNonEmpty!31821 ((_ is ValueCellFull!9540) mapDefault!31827)) b!932008))

(declare-fun m!865973 () Bool)

(assert (=> mapNonEmpty!31827 m!865973))

(declare-fun b_lambda!13865 () Bool)

(assert (= b_lambda!13857 (or (and start!79322 b_free!17535) b_lambda!13865)))

(declare-fun b_lambda!13867 () Bool)

(assert (= b_lambda!13861 (or (and start!79322 b_free!17535) b_lambda!13867)))

(declare-fun b_lambda!13869 () Bool)

(assert (= b_lambda!13863 (or (and start!79322 b_free!17535) b_lambda!13869)))

(declare-fun b_lambda!13871 () Bool)

(assert (= b_lambda!13859 (or (and start!79322 b_free!17535) b_lambda!13871)))

(check-sat (not b!931938) (not b_lambda!13865) (not d!113045) (not b!931932) (not b!931962) (not b!931968) (not b!931965) (not b!931981) (not bm!40575) (not b_lambda!13871) (not bm!40583) (not bm!40587) (not b!931848) (not bm!40549) (not b_lambda!13855) (not d!113059) (not b!932000) (not b!931902) (not b_lambda!13867) (not d!113051) (not d!113057) b_and!28635 (not d!113049) (not b!931929) (not b!931859) (not b!931964) (not b_lambda!13869) (not b!931954) (not d!113033) (not d!113053) (not bm!40569) (not b!931908) (not b!931930) (not b!931983) (not b!931857) (not b!931961) (not b!931966) (not b!931996) (not b!931920) (not b!931903) (not bm!40573) (not b!931940) (not b!931997) tp_is_empty!20043 (not bm!40566) (not bm!40579) (not b!931927) (not b!931971) (not b!931928) (not bm!40568) (not b!931974) (not b!931945) (not bm!40576) (not b!931847) (not b!931955) (not b!931918) (not d!113035) (not d!113027) (not b_next!17535) (not b!931913) (not mapNonEmpty!31827) (not bm!40580) (not b!931911) (not b!931952) (not b!931976) (not b!931947) (not b!931935) (not b!931960) (not bm!40582) (not d!113047) (not bm!40565) (not b!931905) (not bm!40572))
(check-sat b_and!28635 (not b_next!17535))
