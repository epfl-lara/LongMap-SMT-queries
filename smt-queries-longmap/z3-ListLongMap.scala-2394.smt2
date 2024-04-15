; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37878 () Bool)

(assert start!37878)

(declare-fun b_free!8929 () Bool)

(declare-fun b_next!8929 () Bool)

(assert (=> start!37878 (= b_free!8929 (not b_next!8929))))

(declare-fun tp!31547 () Bool)

(declare-fun b_and!16181 () Bool)

(assert (=> start!37878 (= tp!31547 b_and!16181)))

(declare-fun mapNonEmpty!15975 () Bool)

(declare-fun mapRes!15975 () Bool)

(declare-fun tp!31548 () Bool)

(declare-fun e!235810 () Bool)

(assert (=> mapNonEmpty!15975 (= mapRes!15975 (and tp!31548 e!235810))))

(declare-datatypes ((V!13907 0))(
  ( (V!13908 (val!4845 Int)) )
))
(declare-datatypes ((ValueCell!4457 0))(
  ( (ValueCellFull!4457 (v!7048 V!13907)) (EmptyCell!4457) )
))
(declare-fun mapValue!15975 () ValueCell!4457)

(declare-datatypes ((array!23087 0))(
  ( (array!23088 (arr!11009 (Array (_ BitVec 32) ValueCell!4457)) (size!11362 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23087)

(declare-fun mapKey!15975 () (_ BitVec 32))

(declare-fun mapRest!15975 () (Array (_ BitVec 32) ValueCell!4457))

(assert (=> mapNonEmpty!15975 (= (arr!11009 _values!506) (store mapRest!15975 mapKey!15975 mapValue!15975))))

(declare-fun b!389235 () Bool)

(declare-fun e!235812 () Bool)

(declare-fun e!235811 () Bool)

(assert (=> b!389235 (= e!235812 (and e!235811 mapRes!15975))))

(declare-fun condMapEmpty!15975 () Bool)

(declare-fun mapDefault!15975 () ValueCell!4457)

(assert (=> b!389235 (= condMapEmpty!15975 (= (arr!11009 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4457)) mapDefault!15975)))))

(declare-fun b!389236 () Bool)

(declare-fun res!222660 () Bool)

(declare-fun e!235808 () Bool)

(assert (=> b!389236 (=> (not res!222660) (not e!235808))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!23089 0))(
  ( (array!23090 (arr!11010 (Array (_ BitVec 32) (_ BitVec 64))) (size!11363 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23089)

(assert (=> b!389236 (= res!222660 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11363 _keys!658))))))

(declare-fun b!389237 () Bool)

(declare-fun res!222659 () Bool)

(declare-fun e!235814 () Bool)

(assert (=> b!389237 (=> (not res!222659) (not e!235814))))

(declare-fun lt!182913 () array!23089)

(declare-datatypes ((List!6338 0))(
  ( (Nil!6335) (Cons!6334 (h!7190 (_ BitVec 64)) (t!11485 List!6338)) )
))
(declare-fun arrayNoDuplicates!0 (array!23089 (_ BitVec 32) List!6338) Bool)

(assert (=> b!389237 (= res!222659 (arrayNoDuplicates!0 lt!182913 #b00000000000000000000000000000000 Nil!6335))))

(declare-fun b!389238 () Bool)

(declare-fun res!222666 () Bool)

(assert (=> b!389238 (=> (not res!222666) (not e!235808))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23089 (_ BitVec 32)) Bool)

(assert (=> b!389238 (= res!222666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!389239 () Bool)

(declare-fun res!222661 () Bool)

(assert (=> b!389239 (=> (not res!222661) (not e!235808))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!389239 (= res!222661 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!389240 () Bool)

(declare-fun tp_is_empty!9601 () Bool)

(assert (=> b!389240 (= e!235811 tp_is_empty!9601)))

(declare-fun b!389241 () Bool)

(declare-fun res!222662 () Bool)

(assert (=> b!389241 (=> (not res!222662) (not e!235808))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!389241 (= res!222662 (and (= (size!11362 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11363 _keys!658) (size!11362 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!222668 () Bool)

(assert (=> start!37878 (=> (not res!222668) (not e!235808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37878 (= res!222668 (validMask!0 mask!970))))

(assert (=> start!37878 e!235808))

(declare-fun array_inv!8094 (array!23087) Bool)

(assert (=> start!37878 (and (array_inv!8094 _values!506) e!235812)))

(assert (=> start!37878 tp!31547))

(assert (=> start!37878 true))

(assert (=> start!37878 tp_is_empty!9601))

(declare-fun array_inv!8095 (array!23089) Bool)

(assert (=> start!37878 (array_inv!8095 _keys!658)))

(declare-fun b!389242 () Bool)

(assert (=> b!389242 (= e!235810 tp_is_empty!9601)))

(declare-fun b!389243 () Bool)

(assert (=> b!389243 (= e!235808 e!235814)))

(declare-fun res!222663 () Bool)

(assert (=> b!389243 (=> (not res!222663) (not e!235814))))

(assert (=> b!389243 (= res!222663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182913 mask!970))))

(assert (=> b!389243 (= lt!182913 (array!23090 (store (arr!11010 _keys!658) i!548 k0!778) (size!11363 _keys!658)))))

(declare-fun mapIsEmpty!15975 () Bool)

(assert (=> mapIsEmpty!15975 mapRes!15975))

(declare-fun b!389244 () Bool)

(declare-fun res!222664 () Bool)

(assert (=> b!389244 (=> (not res!222664) (not e!235808))))

(assert (=> b!389244 (= res!222664 (or (= (select (arr!11010 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11010 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!389245 () Bool)

(declare-fun e!235809 () Bool)

(assert (=> b!389245 (= e!235814 (not e!235809))))

(declare-fun res!222658 () Bool)

(assert (=> b!389245 (=> res!222658 e!235809)))

(assert (=> b!389245 (= res!222658 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13907)

(declare-datatypes ((tuple2!6494 0))(
  ( (tuple2!6495 (_1!3258 (_ BitVec 64)) (_2!3258 V!13907)) )
))
(declare-datatypes ((List!6339 0))(
  ( (Nil!6336) (Cons!6335 (h!7191 tuple2!6494) (t!11486 List!6339)) )
))
(declare-datatypes ((ListLongMap!5397 0))(
  ( (ListLongMap!5398 (toList!2714 List!6339)) )
))
(declare-fun lt!182922 () ListLongMap!5397)

(declare-fun minValue!472 () V!13907)

(declare-fun getCurrentListMap!2041 (array!23089 array!23087 (_ BitVec 32) (_ BitVec 32) V!13907 V!13907 (_ BitVec 32) Int) ListLongMap!5397)

(assert (=> b!389245 (= lt!182922 (getCurrentListMap!2041 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182919 () ListLongMap!5397)

(declare-fun lt!182915 () array!23087)

(assert (=> b!389245 (= lt!182919 (getCurrentListMap!2041 lt!182913 lt!182915 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182911 () ListLongMap!5397)

(declare-fun lt!182921 () ListLongMap!5397)

(assert (=> b!389245 (and (= lt!182911 lt!182921) (= lt!182921 lt!182911))))

(declare-fun lt!182918 () ListLongMap!5397)

(declare-fun lt!182912 () tuple2!6494)

(declare-fun +!1034 (ListLongMap!5397 tuple2!6494) ListLongMap!5397)

(assert (=> b!389245 (= lt!182921 (+!1034 lt!182918 lt!182912))))

(declare-fun v!373 () V!13907)

(assert (=> b!389245 (= lt!182912 (tuple2!6495 k0!778 v!373))))

(declare-datatypes ((Unit!11910 0))(
  ( (Unit!11911) )
))
(declare-fun lt!182909 () Unit!11910)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!242 (array!23089 array!23087 (_ BitVec 32) (_ BitVec 32) V!13907 V!13907 (_ BitVec 32) (_ BitVec 64) V!13907 (_ BitVec 32) Int) Unit!11910)

(assert (=> b!389245 (= lt!182909 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!242 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!951 (array!23089 array!23087 (_ BitVec 32) (_ BitVec 32) V!13907 V!13907 (_ BitVec 32) Int) ListLongMap!5397)

(assert (=> b!389245 (= lt!182911 (getCurrentListMapNoExtraKeys!951 lt!182913 lt!182915 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!389245 (= lt!182915 (array!23088 (store (arr!11009 _values!506) i!548 (ValueCellFull!4457 v!373)) (size!11362 _values!506)))))

(assert (=> b!389245 (= lt!182918 (getCurrentListMapNoExtraKeys!951 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!389246 () Bool)

(declare-fun res!222665 () Bool)

(assert (=> b!389246 (=> (not res!222665) (not e!235808))))

(assert (=> b!389246 (= res!222665 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6335))))

(declare-fun b!389247 () Bool)

(declare-fun res!222667 () Bool)

(assert (=> b!389247 (=> (not res!222667) (not e!235808))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!389247 (= res!222667 (validKeyInArray!0 k0!778))))

(declare-fun b!389248 () Bool)

(assert (=> b!389248 (= e!235809 (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!182920 () ListLongMap!5397)

(declare-fun lt!182910 () ListLongMap!5397)

(assert (=> b!389248 (= lt!182920 (+!1034 lt!182910 lt!182912))))

(declare-fun lt!182917 () Unit!11910)

(declare-fun addCommutativeForDiffKeys!324 (ListLongMap!5397 (_ BitVec 64) V!13907 (_ BitVec 64) V!13907) Unit!11910)

(assert (=> b!389248 (= lt!182917 (addCommutativeForDiffKeys!324 lt!182918 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!182914 () tuple2!6494)

(assert (=> b!389248 (= lt!182919 (+!1034 lt!182920 lt!182914))))

(declare-fun lt!182916 () tuple2!6494)

(assert (=> b!389248 (= lt!182920 (+!1034 lt!182921 lt!182916))))

(assert (=> b!389248 (= lt!182922 (+!1034 lt!182910 lt!182914))))

(assert (=> b!389248 (= lt!182910 (+!1034 lt!182918 lt!182916))))

(assert (=> b!389248 (= lt!182919 (+!1034 (+!1034 lt!182911 lt!182916) lt!182914))))

(assert (=> b!389248 (= lt!182914 (tuple2!6495 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!389248 (= lt!182916 (tuple2!6495 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (= (and start!37878 res!222668) b!389241))

(assert (= (and b!389241 res!222662) b!389238))

(assert (= (and b!389238 res!222666) b!389246))

(assert (= (and b!389246 res!222665) b!389236))

(assert (= (and b!389236 res!222660) b!389247))

(assert (= (and b!389247 res!222667) b!389244))

(assert (= (and b!389244 res!222664) b!389239))

(assert (= (and b!389239 res!222661) b!389243))

(assert (= (and b!389243 res!222663) b!389237))

(assert (= (and b!389237 res!222659) b!389245))

(assert (= (and b!389245 (not res!222658)) b!389248))

(assert (= (and b!389235 condMapEmpty!15975) mapIsEmpty!15975))

(assert (= (and b!389235 (not condMapEmpty!15975)) mapNonEmpty!15975))

(get-info :version)

(assert (= (and mapNonEmpty!15975 ((_ is ValueCellFull!4457) mapValue!15975)) b!389242))

(assert (= (and b!389235 ((_ is ValueCellFull!4457) mapDefault!15975)) b!389240))

(assert (= start!37878 b!389235))

(declare-fun m!384863 () Bool)

(assert (=> b!389239 m!384863))

(declare-fun m!384865 () Bool)

(assert (=> b!389246 m!384865))

(declare-fun m!384867 () Bool)

(assert (=> b!389238 m!384867))

(declare-fun m!384869 () Bool)

(assert (=> b!389243 m!384869))

(declare-fun m!384871 () Bool)

(assert (=> b!389243 m!384871))

(declare-fun m!384873 () Bool)

(assert (=> b!389248 m!384873))

(declare-fun m!384875 () Bool)

(assert (=> b!389248 m!384875))

(declare-fun m!384877 () Bool)

(assert (=> b!389248 m!384877))

(declare-fun m!384879 () Bool)

(assert (=> b!389248 m!384879))

(declare-fun m!384881 () Bool)

(assert (=> b!389248 m!384881))

(declare-fun m!384883 () Bool)

(assert (=> b!389248 m!384883))

(assert (=> b!389248 m!384879))

(declare-fun m!384885 () Bool)

(assert (=> b!389248 m!384885))

(declare-fun m!384887 () Bool)

(assert (=> b!389248 m!384887))

(declare-fun m!384889 () Bool)

(assert (=> mapNonEmpty!15975 m!384889))

(declare-fun m!384891 () Bool)

(assert (=> start!37878 m!384891))

(declare-fun m!384893 () Bool)

(assert (=> start!37878 m!384893))

(declare-fun m!384895 () Bool)

(assert (=> start!37878 m!384895))

(declare-fun m!384897 () Bool)

(assert (=> b!389245 m!384897))

(declare-fun m!384899 () Bool)

(assert (=> b!389245 m!384899))

(declare-fun m!384901 () Bool)

(assert (=> b!389245 m!384901))

(declare-fun m!384903 () Bool)

(assert (=> b!389245 m!384903))

(declare-fun m!384905 () Bool)

(assert (=> b!389245 m!384905))

(declare-fun m!384907 () Bool)

(assert (=> b!389245 m!384907))

(declare-fun m!384909 () Bool)

(assert (=> b!389245 m!384909))

(declare-fun m!384911 () Bool)

(assert (=> b!389244 m!384911))

(declare-fun m!384913 () Bool)

(assert (=> b!389237 m!384913))

(declare-fun m!384915 () Bool)

(assert (=> b!389247 m!384915))

(check-sat (not b_next!8929) (not start!37878) (not b!389239) (not b!389248) (not b!389247) (not b!389245) tp_is_empty!9601 (not b!389237) (not b!389243) (not b!389238) b_and!16181 (not b!389246) (not mapNonEmpty!15975))
(check-sat b_and!16181 (not b_next!8929))
(get-model)

(declare-fun d!72717 () Bool)

(declare-fun e!235859 () Bool)

(assert (=> d!72717 e!235859))

(declare-fun res!222740 () Bool)

(assert (=> d!72717 (=> (not res!222740) (not e!235859))))

(declare-fun lt!183016 () ListLongMap!5397)

(declare-fun contains!2439 (ListLongMap!5397 (_ BitVec 64)) Bool)

(assert (=> d!72717 (= res!222740 (contains!2439 lt!183016 (_1!3258 lt!182916)))))

(declare-fun lt!183015 () List!6339)

(assert (=> d!72717 (= lt!183016 (ListLongMap!5398 lt!183015))))

(declare-fun lt!183018 () Unit!11910)

(declare-fun lt!183017 () Unit!11910)

(assert (=> d!72717 (= lt!183018 lt!183017)))

(declare-datatypes ((Option!362 0))(
  ( (Some!361 (v!7054 V!13907)) (None!360) )
))
(declare-fun getValueByKey!356 (List!6339 (_ BitVec 64)) Option!362)

(assert (=> d!72717 (= (getValueByKey!356 lt!183015 (_1!3258 lt!182916)) (Some!361 (_2!3258 lt!182916)))))

(declare-fun lemmaContainsTupThenGetReturnValue!181 (List!6339 (_ BitVec 64) V!13907) Unit!11910)

(assert (=> d!72717 (= lt!183017 (lemmaContainsTupThenGetReturnValue!181 lt!183015 (_1!3258 lt!182916) (_2!3258 lt!182916)))))

(declare-fun insertStrictlySorted!184 (List!6339 (_ BitVec 64) V!13907) List!6339)

(assert (=> d!72717 (= lt!183015 (insertStrictlySorted!184 (toList!2714 lt!182921) (_1!3258 lt!182916) (_2!3258 lt!182916)))))

(assert (=> d!72717 (= (+!1034 lt!182921 lt!182916) lt!183016)))

(declare-fun b!389337 () Bool)

(declare-fun res!222739 () Bool)

(assert (=> b!389337 (=> (not res!222739) (not e!235859))))

(assert (=> b!389337 (= res!222739 (= (getValueByKey!356 (toList!2714 lt!183016) (_1!3258 lt!182916)) (Some!361 (_2!3258 lt!182916))))))

(declare-fun b!389338 () Bool)

(declare-fun contains!2440 (List!6339 tuple2!6494) Bool)

(assert (=> b!389338 (= e!235859 (contains!2440 (toList!2714 lt!183016) lt!182916))))

(assert (= (and d!72717 res!222740) b!389337))

(assert (= (and b!389337 res!222739) b!389338))

(declare-fun m!385025 () Bool)

(assert (=> d!72717 m!385025))

(declare-fun m!385027 () Bool)

(assert (=> d!72717 m!385027))

(declare-fun m!385029 () Bool)

(assert (=> d!72717 m!385029))

(declare-fun m!385031 () Bool)

(assert (=> d!72717 m!385031))

(declare-fun m!385033 () Bool)

(assert (=> b!389337 m!385033))

(declare-fun m!385035 () Bool)

(assert (=> b!389338 m!385035))

(assert (=> b!389248 d!72717))

(declare-fun d!72719 () Bool)

(declare-fun e!235860 () Bool)

(assert (=> d!72719 e!235860))

(declare-fun res!222742 () Bool)

(assert (=> d!72719 (=> (not res!222742) (not e!235860))))

(declare-fun lt!183020 () ListLongMap!5397)

(assert (=> d!72719 (= res!222742 (contains!2439 lt!183020 (_1!3258 lt!182914)))))

(declare-fun lt!183019 () List!6339)

(assert (=> d!72719 (= lt!183020 (ListLongMap!5398 lt!183019))))

(declare-fun lt!183022 () Unit!11910)

(declare-fun lt!183021 () Unit!11910)

(assert (=> d!72719 (= lt!183022 lt!183021)))

(assert (=> d!72719 (= (getValueByKey!356 lt!183019 (_1!3258 lt!182914)) (Some!361 (_2!3258 lt!182914)))))

(assert (=> d!72719 (= lt!183021 (lemmaContainsTupThenGetReturnValue!181 lt!183019 (_1!3258 lt!182914) (_2!3258 lt!182914)))))

(assert (=> d!72719 (= lt!183019 (insertStrictlySorted!184 (toList!2714 (+!1034 lt!182911 lt!182916)) (_1!3258 lt!182914) (_2!3258 lt!182914)))))

(assert (=> d!72719 (= (+!1034 (+!1034 lt!182911 lt!182916) lt!182914) lt!183020)))

(declare-fun b!389339 () Bool)

(declare-fun res!222741 () Bool)

(assert (=> b!389339 (=> (not res!222741) (not e!235860))))

(assert (=> b!389339 (= res!222741 (= (getValueByKey!356 (toList!2714 lt!183020) (_1!3258 lt!182914)) (Some!361 (_2!3258 lt!182914))))))

(declare-fun b!389340 () Bool)

(assert (=> b!389340 (= e!235860 (contains!2440 (toList!2714 lt!183020) lt!182914))))

(assert (= (and d!72719 res!222742) b!389339))

(assert (= (and b!389339 res!222741) b!389340))

(declare-fun m!385037 () Bool)

(assert (=> d!72719 m!385037))

(declare-fun m!385039 () Bool)

(assert (=> d!72719 m!385039))

(declare-fun m!385041 () Bool)

(assert (=> d!72719 m!385041))

(declare-fun m!385043 () Bool)

(assert (=> d!72719 m!385043))

(declare-fun m!385045 () Bool)

(assert (=> b!389339 m!385045))

(declare-fun m!385047 () Bool)

(assert (=> b!389340 m!385047))

(assert (=> b!389248 d!72719))

(declare-fun d!72721 () Bool)

(declare-fun e!235861 () Bool)

(assert (=> d!72721 e!235861))

(declare-fun res!222744 () Bool)

(assert (=> d!72721 (=> (not res!222744) (not e!235861))))

(declare-fun lt!183024 () ListLongMap!5397)

(assert (=> d!72721 (= res!222744 (contains!2439 lt!183024 (_1!3258 lt!182916)))))

(declare-fun lt!183023 () List!6339)

(assert (=> d!72721 (= lt!183024 (ListLongMap!5398 lt!183023))))

(declare-fun lt!183026 () Unit!11910)

(declare-fun lt!183025 () Unit!11910)

(assert (=> d!72721 (= lt!183026 lt!183025)))

(assert (=> d!72721 (= (getValueByKey!356 lt!183023 (_1!3258 lt!182916)) (Some!361 (_2!3258 lt!182916)))))

(assert (=> d!72721 (= lt!183025 (lemmaContainsTupThenGetReturnValue!181 lt!183023 (_1!3258 lt!182916) (_2!3258 lt!182916)))))

(assert (=> d!72721 (= lt!183023 (insertStrictlySorted!184 (toList!2714 lt!182918) (_1!3258 lt!182916) (_2!3258 lt!182916)))))

(assert (=> d!72721 (= (+!1034 lt!182918 lt!182916) lt!183024)))

(declare-fun b!389341 () Bool)

(declare-fun res!222743 () Bool)

(assert (=> b!389341 (=> (not res!222743) (not e!235861))))

(assert (=> b!389341 (= res!222743 (= (getValueByKey!356 (toList!2714 lt!183024) (_1!3258 lt!182916)) (Some!361 (_2!3258 lt!182916))))))

(declare-fun b!389342 () Bool)

(assert (=> b!389342 (= e!235861 (contains!2440 (toList!2714 lt!183024) lt!182916))))

(assert (= (and d!72721 res!222744) b!389341))

(assert (= (and b!389341 res!222743) b!389342))

(declare-fun m!385049 () Bool)

(assert (=> d!72721 m!385049))

(declare-fun m!385051 () Bool)

(assert (=> d!72721 m!385051))

(declare-fun m!385053 () Bool)

(assert (=> d!72721 m!385053))

(declare-fun m!385055 () Bool)

(assert (=> d!72721 m!385055))

(declare-fun m!385057 () Bool)

(assert (=> b!389341 m!385057))

(declare-fun m!385059 () Bool)

(assert (=> b!389342 m!385059))

(assert (=> b!389248 d!72721))

(declare-fun d!72723 () Bool)

(declare-fun e!235862 () Bool)

(assert (=> d!72723 e!235862))

(declare-fun res!222746 () Bool)

(assert (=> d!72723 (=> (not res!222746) (not e!235862))))

(declare-fun lt!183028 () ListLongMap!5397)

(assert (=> d!72723 (= res!222746 (contains!2439 lt!183028 (_1!3258 lt!182912)))))

(declare-fun lt!183027 () List!6339)

(assert (=> d!72723 (= lt!183028 (ListLongMap!5398 lt!183027))))

(declare-fun lt!183030 () Unit!11910)

(declare-fun lt!183029 () Unit!11910)

(assert (=> d!72723 (= lt!183030 lt!183029)))

(assert (=> d!72723 (= (getValueByKey!356 lt!183027 (_1!3258 lt!182912)) (Some!361 (_2!3258 lt!182912)))))

(assert (=> d!72723 (= lt!183029 (lemmaContainsTupThenGetReturnValue!181 lt!183027 (_1!3258 lt!182912) (_2!3258 lt!182912)))))

(assert (=> d!72723 (= lt!183027 (insertStrictlySorted!184 (toList!2714 lt!182910) (_1!3258 lt!182912) (_2!3258 lt!182912)))))

(assert (=> d!72723 (= (+!1034 lt!182910 lt!182912) lt!183028)))

(declare-fun b!389343 () Bool)

(declare-fun res!222745 () Bool)

(assert (=> b!389343 (=> (not res!222745) (not e!235862))))

(assert (=> b!389343 (= res!222745 (= (getValueByKey!356 (toList!2714 lt!183028) (_1!3258 lt!182912)) (Some!361 (_2!3258 lt!182912))))))

(declare-fun b!389344 () Bool)

(assert (=> b!389344 (= e!235862 (contains!2440 (toList!2714 lt!183028) lt!182912))))

(assert (= (and d!72723 res!222746) b!389343))

(assert (= (and b!389343 res!222745) b!389344))

(declare-fun m!385061 () Bool)

(assert (=> d!72723 m!385061))

(declare-fun m!385063 () Bool)

(assert (=> d!72723 m!385063))

(declare-fun m!385065 () Bool)

(assert (=> d!72723 m!385065))

(declare-fun m!385067 () Bool)

(assert (=> d!72723 m!385067))

(declare-fun m!385069 () Bool)

(assert (=> b!389343 m!385069))

(declare-fun m!385071 () Bool)

(assert (=> b!389344 m!385071))

(assert (=> b!389248 d!72723))

(declare-fun d!72725 () Bool)

(declare-fun e!235863 () Bool)

(assert (=> d!72725 e!235863))

(declare-fun res!222748 () Bool)

(assert (=> d!72725 (=> (not res!222748) (not e!235863))))

(declare-fun lt!183032 () ListLongMap!5397)

(assert (=> d!72725 (= res!222748 (contains!2439 lt!183032 (_1!3258 lt!182914)))))

(declare-fun lt!183031 () List!6339)

(assert (=> d!72725 (= lt!183032 (ListLongMap!5398 lt!183031))))

(declare-fun lt!183034 () Unit!11910)

(declare-fun lt!183033 () Unit!11910)

(assert (=> d!72725 (= lt!183034 lt!183033)))

(assert (=> d!72725 (= (getValueByKey!356 lt!183031 (_1!3258 lt!182914)) (Some!361 (_2!3258 lt!182914)))))

(assert (=> d!72725 (= lt!183033 (lemmaContainsTupThenGetReturnValue!181 lt!183031 (_1!3258 lt!182914) (_2!3258 lt!182914)))))

(assert (=> d!72725 (= lt!183031 (insertStrictlySorted!184 (toList!2714 lt!182920) (_1!3258 lt!182914) (_2!3258 lt!182914)))))

(assert (=> d!72725 (= (+!1034 lt!182920 lt!182914) lt!183032)))

(declare-fun b!389345 () Bool)

(declare-fun res!222747 () Bool)

(assert (=> b!389345 (=> (not res!222747) (not e!235863))))

(assert (=> b!389345 (= res!222747 (= (getValueByKey!356 (toList!2714 lt!183032) (_1!3258 lt!182914)) (Some!361 (_2!3258 lt!182914))))))

(declare-fun b!389346 () Bool)

(assert (=> b!389346 (= e!235863 (contains!2440 (toList!2714 lt!183032) lt!182914))))

(assert (= (and d!72725 res!222748) b!389345))

(assert (= (and b!389345 res!222747) b!389346))

(declare-fun m!385073 () Bool)

(assert (=> d!72725 m!385073))

(declare-fun m!385075 () Bool)

(assert (=> d!72725 m!385075))

(declare-fun m!385077 () Bool)

(assert (=> d!72725 m!385077))

(declare-fun m!385079 () Bool)

(assert (=> d!72725 m!385079))

(declare-fun m!385081 () Bool)

(assert (=> b!389345 m!385081))

(declare-fun m!385083 () Bool)

(assert (=> b!389346 m!385083))

(assert (=> b!389248 d!72725))

(declare-fun d!72727 () Bool)

(declare-fun e!235864 () Bool)

(assert (=> d!72727 e!235864))

(declare-fun res!222750 () Bool)

(assert (=> d!72727 (=> (not res!222750) (not e!235864))))

(declare-fun lt!183036 () ListLongMap!5397)

(assert (=> d!72727 (= res!222750 (contains!2439 lt!183036 (_1!3258 lt!182916)))))

(declare-fun lt!183035 () List!6339)

(assert (=> d!72727 (= lt!183036 (ListLongMap!5398 lt!183035))))

(declare-fun lt!183038 () Unit!11910)

(declare-fun lt!183037 () Unit!11910)

(assert (=> d!72727 (= lt!183038 lt!183037)))

(assert (=> d!72727 (= (getValueByKey!356 lt!183035 (_1!3258 lt!182916)) (Some!361 (_2!3258 lt!182916)))))

(assert (=> d!72727 (= lt!183037 (lemmaContainsTupThenGetReturnValue!181 lt!183035 (_1!3258 lt!182916) (_2!3258 lt!182916)))))

(assert (=> d!72727 (= lt!183035 (insertStrictlySorted!184 (toList!2714 lt!182911) (_1!3258 lt!182916) (_2!3258 lt!182916)))))

(assert (=> d!72727 (= (+!1034 lt!182911 lt!182916) lt!183036)))

(declare-fun b!389347 () Bool)

(declare-fun res!222749 () Bool)

(assert (=> b!389347 (=> (not res!222749) (not e!235864))))

(assert (=> b!389347 (= res!222749 (= (getValueByKey!356 (toList!2714 lt!183036) (_1!3258 lt!182916)) (Some!361 (_2!3258 lt!182916))))))

(declare-fun b!389348 () Bool)

(assert (=> b!389348 (= e!235864 (contains!2440 (toList!2714 lt!183036) lt!182916))))

(assert (= (and d!72727 res!222750) b!389347))

(assert (= (and b!389347 res!222749) b!389348))

(declare-fun m!385085 () Bool)

(assert (=> d!72727 m!385085))

(declare-fun m!385087 () Bool)

(assert (=> d!72727 m!385087))

(declare-fun m!385089 () Bool)

(assert (=> d!72727 m!385089))

(declare-fun m!385091 () Bool)

(assert (=> d!72727 m!385091))

(declare-fun m!385093 () Bool)

(assert (=> b!389347 m!385093))

(declare-fun m!385095 () Bool)

(assert (=> b!389348 m!385095))

(assert (=> b!389248 d!72727))

(declare-fun d!72729 () Bool)

(declare-fun e!235865 () Bool)

(assert (=> d!72729 e!235865))

(declare-fun res!222752 () Bool)

(assert (=> d!72729 (=> (not res!222752) (not e!235865))))

(declare-fun lt!183040 () ListLongMap!5397)

(assert (=> d!72729 (= res!222752 (contains!2439 lt!183040 (_1!3258 lt!182914)))))

(declare-fun lt!183039 () List!6339)

(assert (=> d!72729 (= lt!183040 (ListLongMap!5398 lt!183039))))

(declare-fun lt!183042 () Unit!11910)

(declare-fun lt!183041 () Unit!11910)

(assert (=> d!72729 (= lt!183042 lt!183041)))

(assert (=> d!72729 (= (getValueByKey!356 lt!183039 (_1!3258 lt!182914)) (Some!361 (_2!3258 lt!182914)))))

(assert (=> d!72729 (= lt!183041 (lemmaContainsTupThenGetReturnValue!181 lt!183039 (_1!3258 lt!182914) (_2!3258 lt!182914)))))

(assert (=> d!72729 (= lt!183039 (insertStrictlySorted!184 (toList!2714 lt!182910) (_1!3258 lt!182914) (_2!3258 lt!182914)))))

(assert (=> d!72729 (= (+!1034 lt!182910 lt!182914) lt!183040)))

(declare-fun b!389349 () Bool)

(declare-fun res!222751 () Bool)

(assert (=> b!389349 (=> (not res!222751) (not e!235865))))

(assert (=> b!389349 (= res!222751 (= (getValueByKey!356 (toList!2714 lt!183040) (_1!3258 lt!182914)) (Some!361 (_2!3258 lt!182914))))))

(declare-fun b!389350 () Bool)

(assert (=> b!389350 (= e!235865 (contains!2440 (toList!2714 lt!183040) lt!182914))))

(assert (= (and d!72729 res!222752) b!389349))

(assert (= (and b!389349 res!222751) b!389350))

(declare-fun m!385097 () Bool)

(assert (=> d!72729 m!385097))

(declare-fun m!385099 () Bool)

(assert (=> d!72729 m!385099))

(declare-fun m!385101 () Bool)

(assert (=> d!72729 m!385101))

(declare-fun m!385103 () Bool)

(assert (=> d!72729 m!385103))

(declare-fun m!385105 () Bool)

(assert (=> b!389349 m!385105))

(declare-fun m!385107 () Bool)

(assert (=> b!389350 m!385107))

(assert (=> b!389248 d!72729))

(declare-fun d!72731 () Bool)

(assert (=> d!72731 (= (+!1034 (+!1034 lt!182918 (tuple2!6495 k0!778 v!373)) (tuple2!6495 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) (+!1034 (+!1034 lt!182918 (tuple2!6495 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) (tuple2!6495 k0!778 v!373)))))

(declare-fun lt!183045 () Unit!11910)

(declare-fun choose!1321 (ListLongMap!5397 (_ BitVec 64) V!13907 (_ BitVec 64) V!13907) Unit!11910)

(assert (=> d!72731 (= lt!183045 (choose!1321 lt!182918 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (=> d!72731 (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!72731 (= (addCommutativeForDiffKeys!324 lt!182918 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) lt!183045)))

(declare-fun bs!13102 () Bool)

(assert (= bs!13102 d!72731))

(declare-fun m!385109 () Bool)

(assert (=> bs!13102 m!385109))

(declare-fun m!385111 () Bool)

(assert (=> bs!13102 m!385111))

(assert (=> bs!13102 m!385109))

(declare-fun m!385113 () Bool)

(assert (=> bs!13102 m!385113))

(declare-fun m!385115 () Bool)

(assert (=> bs!13102 m!385115))

(assert (=> bs!13102 m!385113))

(declare-fun m!385117 () Bool)

(assert (=> bs!13102 m!385117))

(assert (=> b!389248 d!72731))

(declare-fun b!389359 () Bool)

(declare-fun e!235873 () Bool)

(declare-fun e!235872 () Bool)

(assert (=> b!389359 (= e!235873 e!235872)))

(declare-fun c!54009 () Bool)

(assert (=> b!389359 (= c!54009 (validKeyInArray!0 (select (arr!11010 lt!182913) #b00000000000000000000000000000000)))))

(declare-fun bm!27421 () Bool)

(declare-fun call!27424 () Bool)

(assert (=> bm!27421 (= call!27424 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!182913 mask!970))))

(declare-fun b!389360 () Bool)

(declare-fun e!235874 () Bool)

(assert (=> b!389360 (= e!235872 e!235874)))

(declare-fun lt!183053 () (_ BitVec 64))

(assert (=> b!389360 (= lt!183053 (select (arr!11010 lt!182913) #b00000000000000000000000000000000))))

(declare-fun lt!183054 () Unit!11910)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23089 (_ BitVec 64) (_ BitVec 32)) Unit!11910)

(assert (=> b!389360 (= lt!183054 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!182913 lt!183053 #b00000000000000000000000000000000))))

(assert (=> b!389360 (arrayContainsKey!0 lt!182913 lt!183053 #b00000000000000000000000000000000)))

(declare-fun lt!183052 () Unit!11910)

(assert (=> b!389360 (= lt!183052 lt!183054)))

(declare-fun res!222758 () Bool)

(declare-datatypes ((SeekEntryResult!3506 0))(
  ( (MissingZero!3506 (index!16203 (_ BitVec 32))) (Found!3506 (index!16204 (_ BitVec 32))) (Intermediate!3506 (undefined!4318 Bool) (index!16205 (_ BitVec 32)) (x!38239 (_ BitVec 32))) (Undefined!3506) (MissingVacant!3506 (index!16206 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23089 (_ BitVec 32)) SeekEntryResult!3506)

(assert (=> b!389360 (= res!222758 (= (seekEntryOrOpen!0 (select (arr!11010 lt!182913) #b00000000000000000000000000000000) lt!182913 mask!970) (Found!3506 #b00000000000000000000000000000000)))))

(assert (=> b!389360 (=> (not res!222758) (not e!235874))))

(declare-fun b!389361 () Bool)

(assert (=> b!389361 (= e!235872 call!27424)))

(declare-fun b!389362 () Bool)

(assert (=> b!389362 (= e!235874 call!27424)))

(declare-fun d!72733 () Bool)

(declare-fun res!222757 () Bool)

(assert (=> d!72733 (=> res!222757 e!235873)))

(assert (=> d!72733 (= res!222757 (bvsge #b00000000000000000000000000000000 (size!11363 lt!182913)))))

(assert (=> d!72733 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182913 mask!970) e!235873)))

(assert (= (and d!72733 (not res!222757)) b!389359))

(assert (= (and b!389359 c!54009) b!389360))

(assert (= (and b!389359 (not c!54009)) b!389361))

(assert (= (and b!389360 res!222758) b!389362))

(assert (= (or b!389362 b!389361) bm!27421))

(declare-fun m!385119 () Bool)

(assert (=> b!389359 m!385119))

(assert (=> b!389359 m!385119))

(declare-fun m!385121 () Bool)

(assert (=> b!389359 m!385121))

(declare-fun m!385123 () Bool)

(assert (=> bm!27421 m!385123))

(assert (=> b!389360 m!385119))

(declare-fun m!385125 () Bool)

(assert (=> b!389360 m!385125))

(declare-fun m!385127 () Bool)

(assert (=> b!389360 m!385127))

(assert (=> b!389360 m!385119))

(declare-fun m!385129 () Bool)

(assert (=> b!389360 m!385129))

(assert (=> b!389243 d!72733))

(declare-fun b!389363 () Bool)

(declare-fun e!235876 () Bool)

(declare-fun e!235875 () Bool)

(assert (=> b!389363 (= e!235876 e!235875)))

(declare-fun c!54010 () Bool)

(assert (=> b!389363 (= c!54010 (validKeyInArray!0 (select (arr!11010 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27422 () Bool)

(declare-fun call!27425 () Bool)

(assert (=> bm!27422 (= call!27425 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!389364 () Bool)

(declare-fun e!235877 () Bool)

(assert (=> b!389364 (= e!235875 e!235877)))

(declare-fun lt!183056 () (_ BitVec 64))

(assert (=> b!389364 (= lt!183056 (select (arr!11010 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!183057 () Unit!11910)

(assert (=> b!389364 (= lt!183057 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!183056 #b00000000000000000000000000000000))))

(assert (=> b!389364 (arrayContainsKey!0 _keys!658 lt!183056 #b00000000000000000000000000000000)))

(declare-fun lt!183055 () Unit!11910)

(assert (=> b!389364 (= lt!183055 lt!183057)))

(declare-fun res!222760 () Bool)

(assert (=> b!389364 (= res!222760 (= (seekEntryOrOpen!0 (select (arr!11010 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3506 #b00000000000000000000000000000000)))))

(assert (=> b!389364 (=> (not res!222760) (not e!235877))))

(declare-fun b!389365 () Bool)

(assert (=> b!389365 (= e!235875 call!27425)))

(declare-fun b!389366 () Bool)

(assert (=> b!389366 (= e!235877 call!27425)))

(declare-fun d!72735 () Bool)

(declare-fun res!222759 () Bool)

(assert (=> d!72735 (=> res!222759 e!235876)))

(assert (=> d!72735 (= res!222759 (bvsge #b00000000000000000000000000000000 (size!11363 _keys!658)))))

(assert (=> d!72735 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!235876)))

(assert (= (and d!72735 (not res!222759)) b!389363))

(assert (= (and b!389363 c!54010) b!389364))

(assert (= (and b!389363 (not c!54010)) b!389365))

(assert (= (and b!389364 res!222760) b!389366))

(assert (= (or b!389366 b!389365) bm!27422))

(declare-fun m!385131 () Bool)

(assert (=> b!389363 m!385131))

(assert (=> b!389363 m!385131))

(declare-fun m!385133 () Bool)

(assert (=> b!389363 m!385133))

(declare-fun m!385135 () Bool)

(assert (=> bm!27422 m!385135))

(assert (=> b!389364 m!385131))

(declare-fun m!385137 () Bool)

(assert (=> b!389364 m!385137))

(declare-fun m!385139 () Bool)

(assert (=> b!389364 m!385139))

(assert (=> b!389364 m!385131))

(declare-fun m!385141 () Bool)

(assert (=> b!389364 m!385141))

(assert (=> b!389238 d!72735))

(declare-fun d!72737 () Bool)

(declare-fun res!222765 () Bool)

(declare-fun e!235882 () Bool)

(assert (=> d!72737 (=> res!222765 e!235882)))

(assert (=> d!72737 (= res!222765 (= (select (arr!11010 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!72737 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!235882)))

(declare-fun b!389371 () Bool)

(declare-fun e!235883 () Bool)

(assert (=> b!389371 (= e!235882 e!235883)))

(declare-fun res!222766 () Bool)

(assert (=> b!389371 (=> (not res!222766) (not e!235883))))

(assert (=> b!389371 (= res!222766 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11363 _keys!658)))))

(declare-fun b!389372 () Bool)

(assert (=> b!389372 (= e!235883 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!72737 (not res!222765)) b!389371))

(assert (= (and b!389371 res!222766) b!389372))

(assert (=> d!72737 m!385131))

(declare-fun m!385143 () Bool)

(assert (=> b!389372 m!385143))

(assert (=> b!389239 d!72737))

(declare-fun d!72739 () Bool)

(assert (=> d!72739 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!37878 d!72739))

(declare-fun d!72741 () Bool)

(assert (=> d!72741 (= (array_inv!8094 _values!506) (bvsge (size!11362 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!37878 d!72741))

(declare-fun d!72743 () Bool)

(assert (=> d!72743 (= (array_inv!8095 _keys!658) (bvsge (size!11363 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!37878 d!72743))

(declare-fun d!72745 () Bool)

(declare-fun e!235898 () Bool)

(assert (=> d!72745 e!235898))

(declare-fun res!222776 () Bool)

(assert (=> d!72745 (=> (not res!222776) (not e!235898))))

(declare-fun lt!183076 () ListLongMap!5397)

(assert (=> d!72745 (= res!222776 (not (contains!2439 lt!183076 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!235900 () ListLongMap!5397)

(assert (=> d!72745 (= lt!183076 e!235900)))

(declare-fun c!54022 () Bool)

(assert (=> d!72745 (= c!54022 (bvsge #b00000000000000000000000000000000 (size!11363 _keys!658)))))

(assert (=> d!72745 (validMask!0 mask!970)))

(assert (=> d!72745 (= (getCurrentListMapNoExtraKeys!951 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!183076)))

(declare-fun b!389397 () Bool)

(declare-fun e!235899 () ListLongMap!5397)

(assert (=> b!389397 (= e!235900 e!235899)))

(declare-fun c!54019 () Bool)

(assert (=> b!389397 (= c!54019 (validKeyInArray!0 (select (arr!11010 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!389398 () Bool)

(declare-fun res!222778 () Bool)

(assert (=> b!389398 (=> (not res!222778) (not e!235898))))

(assert (=> b!389398 (= res!222778 (not (contains!2439 lt!183076 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!389399 () Bool)

(declare-fun lt!183072 () Unit!11910)

(declare-fun lt!183074 () Unit!11910)

(assert (=> b!389399 (= lt!183072 lt!183074)))

(declare-fun lt!183077 () (_ BitVec 64))

(declare-fun lt!183075 () (_ BitVec 64))

(declare-fun lt!183078 () ListLongMap!5397)

(declare-fun lt!183073 () V!13907)

(assert (=> b!389399 (not (contains!2439 (+!1034 lt!183078 (tuple2!6495 lt!183077 lt!183073)) lt!183075))))

(declare-fun addStillNotContains!134 (ListLongMap!5397 (_ BitVec 64) V!13907 (_ BitVec 64)) Unit!11910)

(assert (=> b!389399 (= lt!183074 (addStillNotContains!134 lt!183078 lt!183077 lt!183073 lt!183075))))

(assert (=> b!389399 (= lt!183075 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!5568 (ValueCell!4457 V!13907) V!13907)

(declare-fun dynLambda!634 (Int (_ BitVec 64)) V!13907)

(assert (=> b!389399 (= lt!183073 (get!5568 (select (arr!11009 _values!506) #b00000000000000000000000000000000) (dynLambda!634 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!389399 (= lt!183077 (select (arr!11010 _keys!658) #b00000000000000000000000000000000))))

(declare-fun call!27428 () ListLongMap!5397)

(assert (=> b!389399 (= lt!183078 call!27428)))

(assert (=> b!389399 (= e!235899 (+!1034 call!27428 (tuple2!6495 (select (arr!11010 _keys!658) #b00000000000000000000000000000000) (get!5568 (select (arr!11009 _values!506) #b00000000000000000000000000000000) (dynLambda!634 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!389400 () Bool)

(declare-fun e!235902 () Bool)

(assert (=> b!389400 (= e!235902 (validKeyInArray!0 (select (arr!11010 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!389400 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!27425 () Bool)

(assert (=> bm!27425 (= call!27428 (getCurrentListMapNoExtraKeys!951 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!389401 () Bool)

(declare-fun e!235901 () Bool)

(assert (=> b!389401 (= e!235898 e!235901)))

(declare-fun c!54020 () Bool)

(assert (=> b!389401 (= c!54020 e!235902)))

(declare-fun res!222777 () Bool)

(assert (=> b!389401 (=> (not res!222777) (not e!235902))))

(assert (=> b!389401 (= res!222777 (bvslt #b00000000000000000000000000000000 (size!11363 _keys!658)))))

(declare-fun b!389402 () Bool)

(declare-fun e!235903 () Bool)

(assert (=> b!389402 (= e!235901 e!235903)))

(assert (=> b!389402 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11363 _keys!658)))))

(declare-fun res!222775 () Bool)

(assert (=> b!389402 (= res!222775 (contains!2439 lt!183076 (select (arr!11010 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!389402 (=> (not res!222775) (not e!235903))))

(declare-fun b!389403 () Bool)

(declare-fun e!235904 () Bool)

(declare-fun isEmpty!550 (ListLongMap!5397) Bool)

(assert (=> b!389403 (= e!235904 (isEmpty!550 lt!183076))))

(declare-fun b!389404 () Bool)

(assert (=> b!389404 (= e!235900 (ListLongMap!5398 Nil!6336))))

(declare-fun b!389405 () Bool)

(assert (=> b!389405 (= e!235899 call!27428)))

(declare-fun b!389406 () Bool)

(assert (=> b!389406 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11363 _keys!658)))))

(assert (=> b!389406 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11362 _values!506)))))

(declare-fun apply!300 (ListLongMap!5397 (_ BitVec 64)) V!13907)

(assert (=> b!389406 (= e!235903 (= (apply!300 lt!183076 (select (arr!11010 _keys!658) #b00000000000000000000000000000000)) (get!5568 (select (arr!11009 _values!506) #b00000000000000000000000000000000) (dynLambda!634 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!389407 () Bool)

(assert (=> b!389407 (= e!235901 e!235904)))

(declare-fun c!54021 () Bool)

(assert (=> b!389407 (= c!54021 (bvslt #b00000000000000000000000000000000 (size!11363 _keys!658)))))

(declare-fun b!389408 () Bool)

(assert (=> b!389408 (= e!235904 (= lt!183076 (getCurrentListMapNoExtraKeys!951 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(assert (= (and d!72745 c!54022) b!389404))

(assert (= (and d!72745 (not c!54022)) b!389397))

(assert (= (and b!389397 c!54019) b!389399))

(assert (= (and b!389397 (not c!54019)) b!389405))

(assert (= (or b!389399 b!389405) bm!27425))

(assert (= (and d!72745 res!222776) b!389398))

(assert (= (and b!389398 res!222778) b!389401))

(assert (= (and b!389401 res!222777) b!389400))

(assert (= (and b!389401 c!54020) b!389402))

(assert (= (and b!389401 (not c!54020)) b!389407))

(assert (= (and b!389402 res!222775) b!389406))

(assert (= (and b!389407 c!54021) b!389408))

(assert (= (and b!389407 (not c!54021)) b!389403))

(declare-fun b_lambda!8581 () Bool)

(assert (=> (not b_lambda!8581) (not b!389399)))

(declare-fun t!11489 () Bool)

(declare-fun tb!3107 () Bool)

(assert (=> (and start!37878 (= defaultEntry!514 defaultEntry!514) t!11489) tb!3107))

(declare-fun result!5717 () Bool)

(assert (=> tb!3107 (= result!5717 tp_is_empty!9601)))

(assert (=> b!389399 t!11489))

(declare-fun b_and!16187 () Bool)

(assert (= b_and!16181 (and (=> t!11489 result!5717) b_and!16187)))

(declare-fun b_lambda!8583 () Bool)

(assert (=> (not b_lambda!8583) (not b!389406)))

(assert (=> b!389406 t!11489))

(declare-fun b_and!16189 () Bool)

(assert (= b_and!16187 (and (=> t!11489 result!5717) b_and!16189)))

(declare-fun m!385145 () Bool)

(assert (=> b!389408 m!385145))

(assert (=> b!389397 m!385131))

(assert (=> b!389397 m!385131))

(assert (=> b!389397 m!385133))

(declare-fun m!385147 () Bool)

(assert (=> b!389398 m!385147))

(declare-fun m!385149 () Bool)

(assert (=> d!72745 m!385149))

(assert (=> d!72745 m!384891))

(assert (=> b!389402 m!385131))

(assert (=> b!389402 m!385131))

(declare-fun m!385151 () Bool)

(assert (=> b!389402 m!385151))

(declare-fun m!385153 () Bool)

(assert (=> b!389399 m!385153))

(declare-fun m!385155 () Bool)

(assert (=> b!389399 m!385155))

(assert (=> b!389399 m!385153))

(declare-fun m!385157 () Bool)

(assert (=> b!389399 m!385157))

(declare-fun m!385159 () Bool)

(assert (=> b!389399 m!385159))

(declare-fun m!385161 () Bool)

(assert (=> b!389399 m!385161))

(assert (=> b!389399 m!385161))

(assert (=> b!389399 m!385159))

(declare-fun m!385163 () Bool)

(assert (=> b!389399 m!385163))

(assert (=> b!389399 m!385131))

(declare-fun m!385165 () Bool)

(assert (=> b!389399 m!385165))

(assert (=> bm!27425 m!385145))

(declare-fun m!385167 () Bool)

(assert (=> b!389403 m!385167))

(assert (=> b!389406 m!385131))

(declare-fun m!385169 () Bool)

(assert (=> b!389406 m!385169))

(assert (=> b!389406 m!385131))

(assert (=> b!389406 m!385159))

(assert (=> b!389406 m!385161))

(assert (=> b!389406 m!385161))

(assert (=> b!389406 m!385159))

(assert (=> b!389406 m!385163))

(assert (=> b!389400 m!385131))

(assert (=> b!389400 m!385131))

(assert (=> b!389400 m!385133))

(assert (=> b!389245 d!72745))

(declare-fun b!389453 () Bool)

(declare-fun e!235937 () Bool)

(assert (=> b!389453 (= e!235937 (validKeyInArray!0 (select (arr!11010 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun e!235935 () Bool)

(declare-fun lt!183144 () ListLongMap!5397)

(declare-fun b!389454 () Bool)

(assert (=> b!389454 (= e!235935 (= (apply!300 lt!183144 (select (arr!11010 _keys!658) #b00000000000000000000000000000000)) (get!5568 (select (arr!11009 _values!506) #b00000000000000000000000000000000) (dynLambda!634 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!389454 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11362 _values!506)))))

(assert (=> b!389454 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11363 _keys!658)))))

(declare-fun b!389455 () Bool)

(declare-fun e!235932 () Unit!11910)

(declare-fun lt!183132 () Unit!11910)

(assert (=> b!389455 (= e!235932 lt!183132)))

(declare-fun lt!183127 () ListLongMap!5397)

(assert (=> b!389455 (= lt!183127 (getCurrentListMapNoExtraKeys!951 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183141 () (_ BitVec 64))

(assert (=> b!389455 (= lt!183141 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183135 () (_ BitVec 64))

(assert (=> b!389455 (= lt!183135 (select (arr!11010 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!183129 () Unit!11910)

(declare-fun addStillContains!276 (ListLongMap!5397 (_ BitVec 64) V!13907 (_ BitVec 64)) Unit!11910)

(assert (=> b!389455 (= lt!183129 (addStillContains!276 lt!183127 lt!183141 zeroValue!472 lt!183135))))

(assert (=> b!389455 (contains!2439 (+!1034 lt!183127 (tuple2!6495 lt!183141 zeroValue!472)) lt!183135)))

(declare-fun lt!183134 () Unit!11910)

(assert (=> b!389455 (= lt!183134 lt!183129)))

(declare-fun lt!183142 () ListLongMap!5397)

(assert (=> b!389455 (= lt!183142 (getCurrentListMapNoExtraKeys!951 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183128 () (_ BitVec 64))

(assert (=> b!389455 (= lt!183128 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183143 () (_ BitVec 64))

(assert (=> b!389455 (= lt!183143 (select (arr!11010 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!183126 () Unit!11910)

(declare-fun addApplyDifferent!276 (ListLongMap!5397 (_ BitVec 64) V!13907 (_ BitVec 64)) Unit!11910)

(assert (=> b!389455 (= lt!183126 (addApplyDifferent!276 lt!183142 lt!183128 minValue!472 lt!183143))))

(assert (=> b!389455 (= (apply!300 (+!1034 lt!183142 (tuple2!6495 lt!183128 minValue!472)) lt!183143) (apply!300 lt!183142 lt!183143))))

(declare-fun lt!183133 () Unit!11910)

(assert (=> b!389455 (= lt!183133 lt!183126)))

(declare-fun lt!183130 () ListLongMap!5397)

(assert (=> b!389455 (= lt!183130 (getCurrentListMapNoExtraKeys!951 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183124 () (_ BitVec 64))

(assert (=> b!389455 (= lt!183124 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183137 () (_ BitVec 64))

(assert (=> b!389455 (= lt!183137 (select (arr!11010 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!183139 () Unit!11910)

(assert (=> b!389455 (= lt!183139 (addApplyDifferent!276 lt!183130 lt!183124 zeroValue!472 lt!183137))))

(assert (=> b!389455 (= (apply!300 (+!1034 lt!183130 (tuple2!6495 lt!183124 zeroValue!472)) lt!183137) (apply!300 lt!183130 lt!183137))))

(declare-fun lt!183138 () Unit!11910)

(assert (=> b!389455 (= lt!183138 lt!183139)))

(declare-fun lt!183123 () ListLongMap!5397)

(assert (=> b!389455 (= lt!183123 (getCurrentListMapNoExtraKeys!951 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183131 () (_ BitVec 64))

(assert (=> b!389455 (= lt!183131 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183140 () (_ BitVec 64))

(assert (=> b!389455 (= lt!183140 (select (arr!11010 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!389455 (= lt!183132 (addApplyDifferent!276 lt!183123 lt!183131 minValue!472 lt!183140))))

(assert (=> b!389455 (= (apply!300 (+!1034 lt!183123 (tuple2!6495 lt!183131 minValue!472)) lt!183140) (apply!300 lt!183123 lt!183140))))

(declare-fun b!389456 () Bool)

(declare-fun e!235934 () Bool)

(declare-fun call!27443 () Bool)

(assert (=> b!389456 (= e!235934 (not call!27443))))

(declare-fun b!389457 () Bool)

(declare-fun res!222800 () Bool)

(declare-fun e!235933 () Bool)

(assert (=> b!389457 (=> (not res!222800) (not e!235933))))

(declare-fun e!235938 () Bool)

(assert (=> b!389457 (= res!222800 e!235938)))

(declare-fun res!222805 () Bool)

(assert (=> b!389457 (=> res!222805 e!235938)))

(assert (=> b!389457 (= res!222805 (not e!235937))))

(declare-fun res!222803 () Bool)

(assert (=> b!389457 (=> (not res!222803) (not e!235937))))

(assert (=> b!389457 (= res!222803 (bvslt #b00000000000000000000000000000000 (size!11363 _keys!658)))))

(declare-fun b!389458 () Bool)

(declare-fun e!235940 () ListLongMap!5397)

(declare-fun call!27448 () ListLongMap!5397)

(assert (=> b!389458 (= e!235940 call!27448)))

(declare-fun b!389459 () Bool)

(declare-fun e!235943 () ListLongMap!5397)

(declare-fun call!27447 () ListLongMap!5397)

(assert (=> b!389459 (= e!235943 call!27447)))

(declare-fun b!389460 () Bool)

(declare-fun e!235931 () Bool)

(declare-fun call!27445 () Bool)

(assert (=> b!389460 (= e!235931 (not call!27445))))

(declare-fun d!72747 () Bool)

(assert (=> d!72747 e!235933))

(declare-fun res!222802 () Bool)

(assert (=> d!72747 (=> (not res!222802) (not e!235933))))

(assert (=> d!72747 (= res!222802 (or (bvsge #b00000000000000000000000000000000 (size!11363 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11363 _keys!658)))))))

(declare-fun lt!183125 () ListLongMap!5397)

(assert (=> d!72747 (= lt!183144 lt!183125)))

(declare-fun lt!183136 () Unit!11910)

(assert (=> d!72747 (= lt!183136 e!235932)))

(declare-fun c!54035 () Bool)

(declare-fun e!235941 () Bool)

(assert (=> d!72747 (= c!54035 e!235941)))

(declare-fun res!222801 () Bool)

(assert (=> d!72747 (=> (not res!222801) (not e!235941))))

(assert (=> d!72747 (= res!222801 (bvslt #b00000000000000000000000000000000 (size!11363 _keys!658)))))

(declare-fun e!235939 () ListLongMap!5397)

(assert (=> d!72747 (= lt!183125 e!235939)))

(declare-fun c!54037 () Bool)

(assert (=> d!72747 (= c!54037 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72747 (validMask!0 mask!970)))

(assert (=> d!72747 (= (getCurrentListMap!2041 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!183144)))

(declare-fun b!389461 () Bool)

(assert (=> b!389461 (= e!235938 e!235935)))

(declare-fun res!222799 () Bool)

(assert (=> b!389461 (=> (not res!222799) (not e!235935))))

(assert (=> b!389461 (= res!222799 (contains!2439 lt!183144 (select (arr!11010 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!389461 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11363 _keys!658)))))

(declare-fun b!389462 () Bool)

(declare-fun e!235936 () Bool)

(assert (=> b!389462 (= e!235931 e!235936)))

(declare-fun res!222804 () Bool)

(assert (=> b!389462 (= res!222804 call!27445)))

(assert (=> b!389462 (=> (not res!222804) (not e!235936))))

(declare-fun b!389463 () Bool)

(declare-fun res!222797 () Bool)

(assert (=> b!389463 (=> (not res!222797) (not e!235933))))

(assert (=> b!389463 (= res!222797 e!235931)))

(declare-fun c!54040 () Bool)

(assert (=> b!389463 (= c!54040 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!389464 () Bool)

(assert (=> b!389464 (= e!235939 e!235943)))

(declare-fun c!54036 () Bool)

(assert (=> b!389464 (= c!54036 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!389465 () Bool)

(assert (=> b!389465 (= e!235933 e!235934)))

(declare-fun c!54038 () Bool)

(assert (=> b!389465 (= c!54038 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!27440 () Bool)

(declare-fun call!27444 () ListLongMap!5397)

(assert (=> bm!27440 (= call!27448 call!27444)))

(declare-fun bm!27441 () Bool)

(declare-fun call!27449 () ListLongMap!5397)

(declare-fun call!27446 () ListLongMap!5397)

(assert (=> bm!27441 (= call!27449 (+!1034 (ite c!54037 call!27446 (ite c!54036 call!27444 call!27448)) (ite (or c!54037 c!54036) (tuple2!6495 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6495 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!389466 () Bool)

(declare-fun c!54039 () Bool)

(assert (=> b!389466 (= c!54039 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!389466 (= e!235943 e!235940)))

(declare-fun b!389467 () Bool)

(assert (=> b!389467 (= e!235940 call!27447)))

(declare-fun bm!27442 () Bool)

(assert (=> bm!27442 (= call!27446 (getCurrentListMapNoExtraKeys!951 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!389468 () Bool)

(declare-fun e!235942 () Bool)

(assert (=> b!389468 (= e!235942 (= (apply!300 lt!183144 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!389469 () Bool)

(assert (=> b!389469 (= e!235936 (= (apply!300 lt!183144 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!389470 () Bool)

(assert (=> b!389470 (= e!235941 (validKeyInArray!0 (select (arr!11010 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27443 () Bool)

(assert (=> bm!27443 (= call!27447 call!27449)))

(declare-fun bm!27444 () Bool)

(assert (=> bm!27444 (= call!27444 call!27446)))

(declare-fun b!389471 () Bool)

(declare-fun Unit!11912 () Unit!11910)

(assert (=> b!389471 (= e!235932 Unit!11912)))

(declare-fun b!389472 () Bool)

(assert (=> b!389472 (= e!235934 e!235942)))

(declare-fun res!222798 () Bool)

(assert (=> b!389472 (= res!222798 call!27443)))

(assert (=> b!389472 (=> (not res!222798) (not e!235942))))

(declare-fun bm!27445 () Bool)

(assert (=> bm!27445 (= call!27443 (contains!2439 lt!183144 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27446 () Bool)

(assert (=> bm!27446 (= call!27445 (contains!2439 lt!183144 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!389473 () Bool)

(assert (=> b!389473 (= e!235939 (+!1034 call!27449 (tuple2!6495 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(assert (= (and d!72747 c!54037) b!389473))

(assert (= (and d!72747 (not c!54037)) b!389464))

(assert (= (and b!389464 c!54036) b!389459))

(assert (= (and b!389464 (not c!54036)) b!389466))

(assert (= (and b!389466 c!54039) b!389467))

(assert (= (and b!389466 (not c!54039)) b!389458))

(assert (= (or b!389467 b!389458) bm!27440))

(assert (= (or b!389459 bm!27440) bm!27444))

(assert (= (or b!389459 b!389467) bm!27443))

(assert (= (or b!389473 bm!27444) bm!27442))

(assert (= (or b!389473 bm!27443) bm!27441))

(assert (= (and d!72747 res!222801) b!389470))

(assert (= (and d!72747 c!54035) b!389455))

(assert (= (and d!72747 (not c!54035)) b!389471))

(assert (= (and d!72747 res!222802) b!389457))

(assert (= (and b!389457 res!222803) b!389453))

(assert (= (and b!389457 (not res!222805)) b!389461))

(assert (= (and b!389461 res!222799) b!389454))

(assert (= (and b!389457 res!222800) b!389463))

(assert (= (and b!389463 c!54040) b!389462))

(assert (= (and b!389463 (not c!54040)) b!389460))

(assert (= (and b!389462 res!222804) b!389469))

(assert (= (or b!389462 b!389460) bm!27446))

(assert (= (and b!389463 res!222797) b!389465))

(assert (= (and b!389465 c!54038) b!389472))

(assert (= (and b!389465 (not c!54038)) b!389456))

(assert (= (and b!389472 res!222798) b!389468))

(assert (= (or b!389472 b!389456) bm!27445))

(declare-fun b_lambda!8585 () Bool)

(assert (=> (not b_lambda!8585) (not b!389454)))

(assert (=> b!389454 t!11489))

(declare-fun b_and!16191 () Bool)

(assert (= b_and!16189 (and (=> t!11489 result!5717) b_and!16191)))

(declare-fun m!385171 () Bool)

(assert (=> bm!27446 m!385171))

(declare-fun m!385173 () Bool)

(assert (=> b!389473 m!385173))

(declare-fun m!385175 () Bool)

(assert (=> b!389455 m!385175))

(assert (=> b!389455 m!384897))

(declare-fun m!385177 () Bool)

(assert (=> b!389455 m!385177))

(declare-fun m!385179 () Bool)

(assert (=> b!389455 m!385179))

(declare-fun m!385181 () Bool)

(assert (=> b!389455 m!385181))

(assert (=> b!389455 m!385131))

(assert (=> b!389455 m!385179))

(declare-fun m!385183 () Bool)

(assert (=> b!389455 m!385183))

(declare-fun m!385185 () Bool)

(assert (=> b!389455 m!385185))

(declare-fun m!385187 () Bool)

(assert (=> b!389455 m!385187))

(declare-fun m!385189 () Bool)

(assert (=> b!389455 m!385189))

(declare-fun m!385191 () Bool)

(assert (=> b!389455 m!385191))

(declare-fun m!385193 () Bool)

(assert (=> b!389455 m!385193))

(assert (=> b!389455 m!385189))

(declare-fun m!385195 () Bool)

(assert (=> b!389455 m!385195))

(assert (=> b!389455 m!385191))

(declare-fun m!385197 () Bool)

(assert (=> b!389455 m!385197))

(declare-fun m!385199 () Bool)

(assert (=> b!389455 m!385199))

(declare-fun m!385201 () Bool)

(assert (=> b!389455 m!385201))

(assert (=> b!389455 m!385185))

(declare-fun m!385203 () Bool)

(assert (=> b!389455 m!385203))

(declare-fun m!385205 () Bool)

(assert (=> bm!27441 m!385205))

(assert (=> b!389461 m!385131))

(assert (=> b!389461 m!385131))

(declare-fun m!385207 () Bool)

(assert (=> b!389461 m!385207))

(declare-fun m!385209 () Bool)

(assert (=> b!389468 m!385209))

(declare-fun m!385211 () Bool)

(assert (=> bm!27445 m!385211))

(assert (=> b!389470 m!385131))

(assert (=> b!389470 m!385131))

(assert (=> b!389470 m!385133))

(assert (=> bm!27442 m!384897))

(assert (=> d!72747 m!384891))

(assert (=> b!389454 m!385161))

(assert (=> b!389454 m!385159))

(assert (=> b!389454 m!385131))

(declare-fun m!385213 () Bool)

(assert (=> b!389454 m!385213))

(assert (=> b!389454 m!385131))

(assert (=> b!389454 m!385161))

(assert (=> b!389454 m!385159))

(assert (=> b!389454 m!385163))

(assert (=> b!389453 m!385131))

(assert (=> b!389453 m!385131))

(assert (=> b!389453 m!385133))

(declare-fun m!385215 () Bool)

(assert (=> b!389469 m!385215))

(assert (=> b!389245 d!72747))

(declare-fun d!72749 () Bool)

(declare-fun e!235944 () Bool)

(assert (=> d!72749 e!235944))

(declare-fun res!222807 () Bool)

(assert (=> d!72749 (=> (not res!222807) (not e!235944))))

(declare-fun lt!183149 () ListLongMap!5397)

(assert (=> d!72749 (= res!222807 (not (contains!2439 lt!183149 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!235946 () ListLongMap!5397)

(assert (=> d!72749 (= lt!183149 e!235946)))

(declare-fun c!54044 () Bool)

(assert (=> d!72749 (= c!54044 (bvsge #b00000000000000000000000000000000 (size!11363 lt!182913)))))

(assert (=> d!72749 (validMask!0 mask!970)))

(assert (=> d!72749 (= (getCurrentListMapNoExtraKeys!951 lt!182913 lt!182915 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!183149)))

(declare-fun b!389474 () Bool)

(declare-fun e!235945 () ListLongMap!5397)

(assert (=> b!389474 (= e!235946 e!235945)))

(declare-fun c!54041 () Bool)

(assert (=> b!389474 (= c!54041 (validKeyInArray!0 (select (arr!11010 lt!182913) #b00000000000000000000000000000000)))))

(declare-fun b!389475 () Bool)

(declare-fun res!222809 () Bool)

(assert (=> b!389475 (=> (not res!222809) (not e!235944))))

(assert (=> b!389475 (= res!222809 (not (contains!2439 lt!183149 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!389476 () Bool)

(declare-fun lt!183145 () Unit!11910)

(declare-fun lt!183147 () Unit!11910)

(assert (=> b!389476 (= lt!183145 lt!183147)))

(declare-fun lt!183150 () (_ BitVec 64))

(declare-fun lt!183151 () ListLongMap!5397)

(declare-fun lt!183148 () (_ BitVec 64))

(declare-fun lt!183146 () V!13907)

(assert (=> b!389476 (not (contains!2439 (+!1034 lt!183151 (tuple2!6495 lt!183150 lt!183146)) lt!183148))))

(assert (=> b!389476 (= lt!183147 (addStillNotContains!134 lt!183151 lt!183150 lt!183146 lt!183148))))

(assert (=> b!389476 (= lt!183148 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!389476 (= lt!183146 (get!5568 (select (arr!11009 lt!182915) #b00000000000000000000000000000000) (dynLambda!634 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!389476 (= lt!183150 (select (arr!11010 lt!182913) #b00000000000000000000000000000000))))

(declare-fun call!27450 () ListLongMap!5397)

(assert (=> b!389476 (= lt!183151 call!27450)))

(assert (=> b!389476 (= e!235945 (+!1034 call!27450 (tuple2!6495 (select (arr!11010 lt!182913) #b00000000000000000000000000000000) (get!5568 (select (arr!11009 lt!182915) #b00000000000000000000000000000000) (dynLambda!634 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!389477 () Bool)

(declare-fun e!235948 () Bool)

(assert (=> b!389477 (= e!235948 (validKeyInArray!0 (select (arr!11010 lt!182913) #b00000000000000000000000000000000)))))

(assert (=> b!389477 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!27447 () Bool)

(assert (=> bm!27447 (= call!27450 (getCurrentListMapNoExtraKeys!951 lt!182913 lt!182915 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!389478 () Bool)

(declare-fun e!235947 () Bool)

(assert (=> b!389478 (= e!235944 e!235947)))

(declare-fun c!54042 () Bool)

(assert (=> b!389478 (= c!54042 e!235948)))

(declare-fun res!222808 () Bool)

(assert (=> b!389478 (=> (not res!222808) (not e!235948))))

(assert (=> b!389478 (= res!222808 (bvslt #b00000000000000000000000000000000 (size!11363 lt!182913)))))

(declare-fun b!389479 () Bool)

(declare-fun e!235949 () Bool)

(assert (=> b!389479 (= e!235947 e!235949)))

(assert (=> b!389479 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11363 lt!182913)))))

(declare-fun res!222806 () Bool)

(assert (=> b!389479 (= res!222806 (contains!2439 lt!183149 (select (arr!11010 lt!182913) #b00000000000000000000000000000000)))))

(assert (=> b!389479 (=> (not res!222806) (not e!235949))))

(declare-fun b!389480 () Bool)

(declare-fun e!235950 () Bool)

(assert (=> b!389480 (= e!235950 (isEmpty!550 lt!183149))))

(declare-fun b!389481 () Bool)

(assert (=> b!389481 (= e!235946 (ListLongMap!5398 Nil!6336))))

(declare-fun b!389482 () Bool)

(assert (=> b!389482 (= e!235945 call!27450)))

(declare-fun b!389483 () Bool)

(assert (=> b!389483 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11363 lt!182913)))))

(assert (=> b!389483 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11362 lt!182915)))))

(assert (=> b!389483 (= e!235949 (= (apply!300 lt!183149 (select (arr!11010 lt!182913) #b00000000000000000000000000000000)) (get!5568 (select (arr!11009 lt!182915) #b00000000000000000000000000000000) (dynLambda!634 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!389484 () Bool)

(assert (=> b!389484 (= e!235947 e!235950)))

(declare-fun c!54043 () Bool)

(assert (=> b!389484 (= c!54043 (bvslt #b00000000000000000000000000000000 (size!11363 lt!182913)))))

(declare-fun b!389485 () Bool)

(assert (=> b!389485 (= e!235950 (= lt!183149 (getCurrentListMapNoExtraKeys!951 lt!182913 lt!182915 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(assert (= (and d!72749 c!54044) b!389481))

(assert (= (and d!72749 (not c!54044)) b!389474))

(assert (= (and b!389474 c!54041) b!389476))

(assert (= (and b!389474 (not c!54041)) b!389482))

(assert (= (or b!389476 b!389482) bm!27447))

(assert (= (and d!72749 res!222807) b!389475))

(assert (= (and b!389475 res!222809) b!389478))

(assert (= (and b!389478 res!222808) b!389477))

(assert (= (and b!389478 c!54042) b!389479))

(assert (= (and b!389478 (not c!54042)) b!389484))

(assert (= (and b!389479 res!222806) b!389483))

(assert (= (and b!389484 c!54043) b!389485))

(assert (= (and b!389484 (not c!54043)) b!389480))

(declare-fun b_lambda!8587 () Bool)

(assert (=> (not b_lambda!8587) (not b!389476)))

(assert (=> b!389476 t!11489))

(declare-fun b_and!16193 () Bool)

(assert (= b_and!16191 (and (=> t!11489 result!5717) b_and!16193)))

(declare-fun b_lambda!8589 () Bool)

(assert (=> (not b_lambda!8589) (not b!389483)))

(assert (=> b!389483 t!11489))

(declare-fun b_and!16195 () Bool)

(assert (= b_and!16193 (and (=> t!11489 result!5717) b_and!16195)))

(declare-fun m!385217 () Bool)

(assert (=> b!389485 m!385217))

(assert (=> b!389474 m!385119))

(assert (=> b!389474 m!385119))

(assert (=> b!389474 m!385121))

(declare-fun m!385219 () Bool)

(assert (=> b!389475 m!385219))

(declare-fun m!385221 () Bool)

(assert (=> d!72749 m!385221))

(assert (=> d!72749 m!384891))

(assert (=> b!389479 m!385119))

(assert (=> b!389479 m!385119))

(declare-fun m!385223 () Bool)

(assert (=> b!389479 m!385223))

(declare-fun m!385225 () Bool)

(assert (=> b!389476 m!385225))

(declare-fun m!385227 () Bool)

(assert (=> b!389476 m!385227))

(assert (=> b!389476 m!385225))

(declare-fun m!385229 () Bool)

(assert (=> b!389476 m!385229))

(assert (=> b!389476 m!385159))

(declare-fun m!385231 () Bool)

(assert (=> b!389476 m!385231))

(assert (=> b!389476 m!385231))

(assert (=> b!389476 m!385159))

(declare-fun m!385233 () Bool)

(assert (=> b!389476 m!385233))

(assert (=> b!389476 m!385119))

(declare-fun m!385235 () Bool)

(assert (=> b!389476 m!385235))

(assert (=> bm!27447 m!385217))

(declare-fun m!385237 () Bool)

(assert (=> b!389480 m!385237))

(assert (=> b!389483 m!385119))

(declare-fun m!385239 () Bool)

(assert (=> b!389483 m!385239))

(assert (=> b!389483 m!385119))

(assert (=> b!389483 m!385159))

(assert (=> b!389483 m!385231))

(assert (=> b!389483 m!385231))

(assert (=> b!389483 m!385159))

(assert (=> b!389483 m!385233))

(assert (=> b!389477 m!385119))

(assert (=> b!389477 m!385119))

(assert (=> b!389477 m!385121))

(assert (=> b!389245 d!72749))

(declare-fun b!389486 () Bool)

(declare-fun e!235957 () Bool)

(assert (=> b!389486 (= e!235957 (validKeyInArray!0 (select (arr!11010 lt!182913) #b00000000000000000000000000000000)))))

(declare-fun e!235955 () Bool)

(declare-fun b!389487 () Bool)

(declare-fun lt!183173 () ListLongMap!5397)

(assert (=> b!389487 (= e!235955 (= (apply!300 lt!183173 (select (arr!11010 lt!182913) #b00000000000000000000000000000000)) (get!5568 (select (arr!11009 lt!182915) #b00000000000000000000000000000000) (dynLambda!634 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!389487 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11362 lt!182915)))))

(assert (=> b!389487 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11363 lt!182913)))))

(declare-fun b!389488 () Bool)

(declare-fun e!235952 () Unit!11910)

(declare-fun lt!183161 () Unit!11910)

(assert (=> b!389488 (= e!235952 lt!183161)))

(declare-fun lt!183156 () ListLongMap!5397)

(assert (=> b!389488 (= lt!183156 (getCurrentListMapNoExtraKeys!951 lt!182913 lt!182915 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183170 () (_ BitVec 64))

(assert (=> b!389488 (= lt!183170 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183164 () (_ BitVec 64))

(assert (=> b!389488 (= lt!183164 (select (arr!11010 lt!182913) #b00000000000000000000000000000000))))

(declare-fun lt!183158 () Unit!11910)

(assert (=> b!389488 (= lt!183158 (addStillContains!276 lt!183156 lt!183170 zeroValue!472 lt!183164))))

(assert (=> b!389488 (contains!2439 (+!1034 lt!183156 (tuple2!6495 lt!183170 zeroValue!472)) lt!183164)))

(declare-fun lt!183163 () Unit!11910)

(assert (=> b!389488 (= lt!183163 lt!183158)))

(declare-fun lt!183171 () ListLongMap!5397)

(assert (=> b!389488 (= lt!183171 (getCurrentListMapNoExtraKeys!951 lt!182913 lt!182915 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183157 () (_ BitVec 64))

(assert (=> b!389488 (= lt!183157 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183172 () (_ BitVec 64))

(assert (=> b!389488 (= lt!183172 (select (arr!11010 lt!182913) #b00000000000000000000000000000000))))

(declare-fun lt!183155 () Unit!11910)

(assert (=> b!389488 (= lt!183155 (addApplyDifferent!276 lt!183171 lt!183157 minValue!472 lt!183172))))

(assert (=> b!389488 (= (apply!300 (+!1034 lt!183171 (tuple2!6495 lt!183157 minValue!472)) lt!183172) (apply!300 lt!183171 lt!183172))))

(declare-fun lt!183162 () Unit!11910)

(assert (=> b!389488 (= lt!183162 lt!183155)))

(declare-fun lt!183159 () ListLongMap!5397)

(assert (=> b!389488 (= lt!183159 (getCurrentListMapNoExtraKeys!951 lt!182913 lt!182915 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183153 () (_ BitVec 64))

(assert (=> b!389488 (= lt!183153 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183166 () (_ BitVec 64))

(assert (=> b!389488 (= lt!183166 (select (arr!11010 lt!182913) #b00000000000000000000000000000000))))

(declare-fun lt!183168 () Unit!11910)

(assert (=> b!389488 (= lt!183168 (addApplyDifferent!276 lt!183159 lt!183153 zeroValue!472 lt!183166))))

(assert (=> b!389488 (= (apply!300 (+!1034 lt!183159 (tuple2!6495 lt!183153 zeroValue!472)) lt!183166) (apply!300 lt!183159 lt!183166))))

(declare-fun lt!183167 () Unit!11910)

(assert (=> b!389488 (= lt!183167 lt!183168)))

(declare-fun lt!183152 () ListLongMap!5397)

(assert (=> b!389488 (= lt!183152 (getCurrentListMapNoExtraKeys!951 lt!182913 lt!182915 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183160 () (_ BitVec 64))

(assert (=> b!389488 (= lt!183160 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183169 () (_ BitVec 64))

(assert (=> b!389488 (= lt!183169 (select (arr!11010 lt!182913) #b00000000000000000000000000000000))))

(assert (=> b!389488 (= lt!183161 (addApplyDifferent!276 lt!183152 lt!183160 minValue!472 lt!183169))))

(assert (=> b!389488 (= (apply!300 (+!1034 lt!183152 (tuple2!6495 lt!183160 minValue!472)) lt!183169) (apply!300 lt!183152 lt!183169))))

(declare-fun b!389489 () Bool)

(declare-fun e!235954 () Bool)

(declare-fun call!27451 () Bool)

(assert (=> b!389489 (= e!235954 (not call!27451))))

(declare-fun b!389490 () Bool)

(declare-fun res!222813 () Bool)

(declare-fun e!235953 () Bool)

(assert (=> b!389490 (=> (not res!222813) (not e!235953))))

(declare-fun e!235958 () Bool)

(assert (=> b!389490 (= res!222813 e!235958)))

(declare-fun res!222818 () Bool)

(assert (=> b!389490 (=> res!222818 e!235958)))

(assert (=> b!389490 (= res!222818 (not e!235957))))

(declare-fun res!222816 () Bool)

(assert (=> b!389490 (=> (not res!222816) (not e!235957))))

(assert (=> b!389490 (= res!222816 (bvslt #b00000000000000000000000000000000 (size!11363 lt!182913)))))

(declare-fun b!389491 () Bool)

(declare-fun e!235960 () ListLongMap!5397)

(declare-fun call!27456 () ListLongMap!5397)

(assert (=> b!389491 (= e!235960 call!27456)))

(declare-fun b!389492 () Bool)

(declare-fun e!235963 () ListLongMap!5397)

(declare-fun call!27455 () ListLongMap!5397)

(assert (=> b!389492 (= e!235963 call!27455)))

(declare-fun b!389493 () Bool)

(declare-fun e!235951 () Bool)

(declare-fun call!27453 () Bool)

(assert (=> b!389493 (= e!235951 (not call!27453))))

(declare-fun d!72751 () Bool)

(assert (=> d!72751 e!235953))

(declare-fun res!222815 () Bool)

(assert (=> d!72751 (=> (not res!222815) (not e!235953))))

(assert (=> d!72751 (= res!222815 (or (bvsge #b00000000000000000000000000000000 (size!11363 lt!182913)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11363 lt!182913)))))))

(declare-fun lt!183154 () ListLongMap!5397)

(assert (=> d!72751 (= lt!183173 lt!183154)))

(declare-fun lt!183165 () Unit!11910)

(assert (=> d!72751 (= lt!183165 e!235952)))

(declare-fun c!54045 () Bool)

(declare-fun e!235961 () Bool)

(assert (=> d!72751 (= c!54045 e!235961)))

(declare-fun res!222814 () Bool)

(assert (=> d!72751 (=> (not res!222814) (not e!235961))))

(assert (=> d!72751 (= res!222814 (bvslt #b00000000000000000000000000000000 (size!11363 lt!182913)))))

(declare-fun e!235959 () ListLongMap!5397)

(assert (=> d!72751 (= lt!183154 e!235959)))

(declare-fun c!54047 () Bool)

(assert (=> d!72751 (= c!54047 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72751 (validMask!0 mask!970)))

(assert (=> d!72751 (= (getCurrentListMap!2041 lt!182913 lt!182915 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!183173)))

(declare-fun b!389494 () Bool)

(assert (=> b!389494 (= e!235958 e!235955)))

(declare-fun res!222812 () Bool)

(assert (=> b!389494 (=> (not res!222812) (not e!235955))))

(assert (=> b!389494 (= res!222812 (contains!2439 lt!183173 (select (arr!11010 lt!182913) #b00000000000000000000000000000000)))))

(assert (=> b!389494 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11363 lt!182913)))))

(declare-fun b!389495 () Bool)

(declare-fun e!235956 () Bool)

(assert (=> b!389495 (= e!235951 e!235956)))

(declare-fun res!222817 () Bool)

(assert (=> b!389495 (= res!222817 call!27453)))

(assert (=> b!389495 (=> (not res!222817) (not e!235956))))

(declare-fun b!389496 () Bool)

(declare-fun res!222810 () Bool)

(assert (=> b!389496 (=> (not res!222810) (not e!235953))))

(assert (=> b!389496 (= res!222810 e!235951)))

(declare-fun c!54050 () Bool)

(assert (=> b!389496 (= c!54050 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!389497 () Bool)

(assert (=> b!389497 (= e!235959 e!235963)))

(declare-fun c!54046 () Bool)

(assert (=> b!389497 (= c!54046 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!389498 () Bool)

(assert (=> b!389498 (= e!235953 e!235954)))

(declare-fun c!54048 () Bool)

(assert (=> b!389498 (= c!54048 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!27448 () Bool)

(declare-fun call!27452 () ListLongMap!5397)

(assert (=> bm!27448 (= call!27456 call!27452)))

(declare-fun call!27454 () ListLongMap!5397)

(declare-fun call!27457 () ListLongMap!5397)

(declare-fun bm!27449 () Bool)

(assert (=> bm!27449 (= call!27457 (+!1034 (ite c!54047 call!27454 (ite c!54046 call!27452 call!27456)) (ite (or c!54047 c!54046) (tuple2!6495 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6495 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!389499 () Bool)

(declare-fun c!54049 () Bool)

(assert (=> b!389499 (= c!54049 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!389499 (= e!235963 e!235960)))

(declare-fun b!389500 () Bool)

(assert (=> b!389500 (= e!235960 call!27455)))

(declare-fun bm!27450 () Bool)

(assert (=> bm!27450 (= call!27454 (getCurrentListMapNoExtraKeys!951 lt!182913 lt!182915 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!389501 () Bool)

(declare-fun e!235962 () Bool)

(assert (=> b!389501 (= e!235962 (= (apply!300 lt!183173 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!389502 () Bool)

(assert (=> b!389502 (= e!235956 (= (apply!300 lt!183173 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!389503 () Bool)

(assert (=> b!389503 (= e!235961 (validKeyInArray!0 (select (arr!11010 lt!182913) #b00000000000000000000000000000000)))))

(declare-fun bm!27451 () Bool)

(assert (=> bm!27451 (= call!27455 call!27457)))

(declare-fun bm!27452 () Bool)

(assert (=> bm!27452 (= call!27452 call!27454)))

(declare-fun b!389504 () Bool)

(declare-fun Unit!11913 () Unit!11910)

(assert (=> b!389504 (= e!235952 Unit!11913)))

(declare-fun b!389505 () Bool)

(assert (=> b!389505 (= e!235954 e!235962)))

(declare-fun res!222811 () Bool)

(assert (=> b!389505 (= res!222811 call!27451)))

(assert (=> b!389505 (=> (not res!222811) (not e!235962))))

(declare-fun bm!27453 () Bool)

(assert (=> bm!27453 (= call!27451 (contains!2439 lt!183173 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27454 () Bool)

(assert (=> bm!27454 (= call!27453 (contains!2439 lt!183173 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!389506 () Bool)

(assert (=> b!389506 (= e!235959 (+!1034 call!27457 (tuple2!6495 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(assert (= (and d!72751 c!54047) b!389506))

(assert (= (and d!72751 (not c!54047)) b!389497))

(assert (= (and b!389497 c!54046) b!389492))

(assert (= (and b!389497 (not c!54046)) b!389499))

(assert (= (and b!389499 c!54049) b!389500))

(assert (= (and b!389499 (not c!54049)) b!389491))

(assert (= (or b!389500 b!389491) bm!27448))

(assert (= (or b!389492 bm!27448) bm!27452))

(assert (= (or b!389492 b!389500) bm!27451))

(assert (= (or b!389506 bm!27452) bm!27450))

(assert (= (or b!389506 bm!27451) bm!27449))

(assert (= (and d!72751 res!222814) b!389503))

(assert (= (and d!72751 c!54045) b!389488))

(assert (= (and d!72751 (not c!54045)) b!389504))

(assert (= (and d!72751 res!222815) b!389490))

(assert (= (and b!389490 res!222816) b!389486))

(assert (= (and b!389490 (not res!222818)) b!389494))

(assert (= (and b!389494 res!222812) b!389487))

(assert (= (and b!389490 res!222813) b!389496))

(assert (= (and b!389496 c!54050) b!389495))

(assert (= (and b!389496 (not c!54050)) b!389493))

(assert (= (and b!389495 res!222817) b!389502))

(assert (= (or b!389495 b!389493) bm!27454))

(assert (= (and b!389496 res!222810) b!389498))

(assert (= (and b!389498 c!54048) b!389505))

(assert (= (and b!389498 (not c!54048)) b!389489))

(assert (= (and b!389505 res!222811) b!389501))

(assert (= (or b!389505 b!389489) bm!27453))

(declare-fun b_lambda!8591 () Bool)

(assert (=> (not b_lambda!8591) (not b!389487)))

(assert (=> b!389487 t!11489))

(declare-fun b_and!16197 () Bool)

(assert (= b_and!16195 (and (=> t!11489 result!5717) b_and!16197)))

(declare-fun m!385241 () Bool)

(assert (=> bm!27454 m!385241))

(declare-fun m!385243 () Bool)

(assert (=> b!389506 m!385243))

(declare-fun m!385245 () Bool)

(assert (=> b!389488 m!385245))

(assert (=> b!389488 m!384903))

(declare-fun m!385247 () Bool)

(assert (=> b!389488 m!385247))

(declare-fun m!385249 () Bool)

(assert (=> b!389488 m!385249))

(declare-fun m!385251 () Bool)

(assert (=> b!389488 m!385251))

(assert (=> b!389488 m!385119))

(assert (=> b!389488 m!385249))

(declare-fun m!385253 () Bool)

(assert (=> b!389488 m!385253))

(declare-fun m!385255 () Bool)

(assert (=> b!389488 m!385255))

(declare-fun m!385257 () Bool)

(assert (=> b!389488 m!385257))

(declare-fun m!385259 () Bool)

(assert (=> b!389488 m!385259))

(declare-fun m!385261 () Bool)

(assert (=> b!389488 m!385261))

(declare-fun m!385263 () Bool)

(assert (=> b!389488 m!385263))

(assert (=> b!389488 m!385259))

(declare-fun m!385265 () Bool)

(assert (=> b!389488 m!385265))

(assert (=> b!389488 m!385261))

(declare-fun m!385267 () Bool)

(assert (=> b!389488 m!385267))

(declare-fun m!385269 () Bool)

(assert (=> b!389488 m!385269))

(declare-fun m!385271 () Bool)

(assert (=> b!389488 m!385271))

(assert (=> b!389488 m!385255))

(declare-fun m!385273 () Bool)

(assert (=> b!389488 m!385273))

(declare-fun m!385275 () Bool)

(assert (=> bm!27449 m!385275))

(assert (=> b!389494 m!385119))

(assert (=> b!389494 m!385119))

(declare-fun m!385277 () Bool)

(assert (=> b!389494 m!385277))

(declare-fun m!385279 () Bool)

(assert (=> b!389501 m!385279))

(declare-fun m!385281 () Bool)

(assert (=> bm!27453 m!385281))

(assert (=> b!389503 m!385119))

(assert (=> b!389503 m!385119))

(assert (=> b!389503 m!385121))

(assert (=> bm!27450 m!384903))

(assert (=> d!72751 m!384891))

(assert (=> b!389487 m!385231))

(assert (=> b!389487 m!385159))

(assert (=> b!389487 m!385119))

(declare-fun m!385283 () Bool)

(assert (=> b!389487 m!385283))

(assert (=> b!389487 m!385119))

(assert (=> b!389487 m!385231))

(assert (=> b!389487 m!385159))

(assert (=> b!389487 m!385233))

(assert (=> b!389486 m!385119))

(assert (=> b!389486 m!385119))

(assert (=> b!389486 m!385121))

(declare-fun m!385285 () Bool)

(assert (=> b!389502 m!385285))

(assert (=> b!389245 d!72751))

(declare-fun b!389513 () Bool)

(declare-fun e!235969 () Bool)

(declare-fun e!235968 () Bool)

(assert (=> b!389513 (= e!235969 e!235968)))

(declare-fun c!54053 () Bool)

(assert (=> b!389513 (= c!54053 (bvsle #b00000000000000000000000000000000 i!548))))

(declare-fun d!72753 () Bool)

(assert (=> d!72753 e!235969))

(declare-fun res!222821 () Bool)

(assert (=> d!72753 (=> (not res!222821) (not e!235969))))

(assert (=> d!72753 (= res!222821 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11363 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11362 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11363 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11362 _values!506))))))))

(declare-fun lt!183176 () Unit!11910)

(declare-fun choose!1322 (array!23089 array!23087 (_ BitVec 32) (_ BitVec 32) V!13907 V!13907 (_ BitVec 32) (_ BitVec 64) V!13907 (_ BitVec 32) Int) Unit!11910)

(assert (=> d!72753 (= lt!183176 (choose!1322 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!72753 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11363 _keys!658)))))

(assert (=> d!72753 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!242 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!183176)))

(declare-fun call!27462 () ListLongMap!5397)

(declare-fun bm!27459 () Bool)

(assert (=> bm!27459 (= call!27462 (getCurrentListMapNoExtraKeys!951 (array!23090 (store (arr!11010 _keys!658) i!548 k0!778) (size!11363 _keys!658)) (array!23088 (store (arr!11009 _values!506) i!548 (ValueCellFull!4457 v!373)) (size!11362 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!389514 () Bool)

(declare-fun call!27463 () ListLongMap!5397)

(assert (=> b!389514 (= e!235968 (= call!27462 call!27463))))

(declare-fun bm!27460 () Bool)

(assert (=> bm!27460 (= call!27463 (getCurrentListMapNoExtraKeys!951 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!389515 () Bool)

(assert (=> b!389515 (= e!235968 (= call!27462 (+!1034 call!27463 (tuple2!6495 k0!778 v!373))))))

(assert (= (and d!72753 res!222821) b!389513))

(assert (= (and b!389513 c!54053) b!389515))

(assert (= (and b!389513 (not c!54053)) b!389514))

(assert (= (or b!389515 b!389514) bm!27460))

(assert (= (or b!389515 b!389514) bm!27459))

(declare-fun m!385287 () Bool)

(assert (=> d!72753 m!385287))

(assert (=> bm!27459 m!384871))

(assert (=> bm!27459 m!384909))

(declare-fun m!385289 () Bool)

(assert (=> bm!27459 m!385289))

(assert (=> bm!27460 m!384897))

(declare-fun m!385291 () Bool)

(assert (=> b!389515 m!385291))

(assert (=> b!389245 d!72753))

(declare-fun d!72755 () Bool)

(declare-fun e!235970 () Bool)

(assert (=> d!72755 e!235970))

(declare-fun res!222823 () Bool)

(assert (=> d!72755 (=> (not res!222823) (not e!235970))))

(declare-fun lt!183178 () ListLongMap!5397)

(assert (=> d!72755 (= res!222823 (contains!2439 lt!183178 (_1!3258 lt!182912)))))

(declare-fun lt!183177 () List!6339)

(assert (=> d!72755 (= lt!183178 (ListLongMap!5398 lt!183177))))

(declare-fun lt!183180 () Unit!11910)

(declare-fun lt!183179 () Unit!11910)

(assert (=> d!72755 (= lt!183180 lt!183179)))

(assert (=> d!72755 (= (getValueByKey!356 lt!183177 (_1!3258 lt!182912)) (Some!361 (_2!3258 lt!182912)))))

(assert (=> d!72755 (= lt!183179 (lemmaContainsTupThenGetReturnValue!181 lt!183177 (_1!3258 lt!182912) (_2!3258 lt!182912)))))

(assert (=> d!72755 (= lt!183177 (insertStrictlySorted!184 (toList!2714 lt!182918) (_1!3258 lt!182912) (_2!3258 lt!182912)))))

(assert (=> d!72755 (= (+!1034 lt!182918 lt!182912) lt!183178)))

(declare-fun b!389516 () Bool)

(declare-fun res!222822 () Bool)

(assert (=> b!389516 (=> (not res!222822) (not e!235970))))

(assert (=> b!389516 (= res!222822 (= (getValueByKey!356 (toList!2714 lt!183178) (_1!3258 lt!182912)) (Some!361 (_2!3258 lt!182912))))))

(declare-fun b!389517 () Bool)

(assert (=> b!389517 (= e!235970 (contains!2440 (toList!2714 lt!183178) lt!182912))))

(assert (= (and d!72755 res!222823) b!389516))

(assert (= (and b!389516 res!222822) b!389517))

(declare-fun m!385293 () Bool)

(assert (=> d!72755 m!385293))

(declare-fun m!385295 () Bool)

(assert (=> d!72755 m!385295))

(declare-fun m!385297 () Bool)

(assert (=> d!72755 m!385297))

(declare-fun m!385299 () Bool)

(assert (=> d!72755 m!385299))

(declare-fun m!385301 () Bool)

(assert (=> b!389516 m!385301))

(declare-fun m!385303 () Bool)

(assert (=> b!389517 m!385303))

(assert (=> b!389245 d!72755))

(declare-fun d!72757 () Bool)

(declare-fun res!222832 () Bool)

(declare-fun e!235981 () Bool)

(assert (=> d!72757 (=> res!222832 e!235981)))

(assert (=> d!72757 (= res!222832 (bvsge #b00000000000000000000000000000000 (size!11363 lt!182913)))))

(assert (=> d!72757 (= (arrayNoDuplicates!0 lt!182913 #b00000000000000000000000000000000 Nil!6335) e!235981)))

(declare-fun bm!27463 () Bool)

(declare-fun call!27466 () Bool)

(declare-fun c!54056 () Bool)

(assert (=> bm!27463 (= call!27466 (arrayNoDuplicates!0 lt!182913 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54056 (Cons!6334 (select (arr!11010 lt!182913) #b00000000000000000000000000000000) Nil!6335) Nil!6335)))))

(declare-fun b!389528 () Bool)

(declare-fun e!235982 () Bool)

(declare-fun contains!2441 (List!6338 (_ BitVec 64)) Bool)

(assert (=> b!389528 (= e!235982 (contains!2441 Nil!6335 (select (arr!11010 lt!182913) #b00000000000000000000000000000000)))))

(declare-fun b!389529 () Bool)

(declare-fun e!235980 () Bool)

(declare-fun e!235979 () Bool)

(assert (=> b!389529 (= e!235980 e!235979)))

(assert (=> b!389529 (= c!54056 (validKeyInArray!0 (select (arr!11010 lt!182913) #b00000000000000000000000000000000)))))

(declare-fun b!389530 () Bool)

(assert (=> b!389530 (= e!235979 call!27466)))

(declare-fun b!389531 () Bool)

(assert (=> b!389531 (= e!235981 e!235980)))

(declare-fun res!222830 () Bool)

(assert (=> b!389531 (=> (not res!222830) (not e!235980))))

(assert (=> b!389531 (= res!222830 (not e!235982))))

(declare-fun res!222831 () Bool)

(assert (=> b!389531 (=> (not res!222831) (not e!235982))))

(assert (=> b!389531 (= res!222831 (validKeyInArray!0 (select (arr!11010 lt!182913) #b00000000000000000000000000000000)))))

(declare-fun b!389532 () Bool)

(assert (=> b!389532 (= e!235979 call!27466)))

(assert (= (and d!72757 (not res!222832)) b!389531))

(assert (= (and b!389531 res!222831) b!389528))

(assert (= (and b!389531 res!222830) b!389529))

(assert (= (and b!389529 c!54056) b!389530))

(assert (= (and b!389529 (not c!54056)) b!389532))

(assert (= (or b!389530 b!389532) bm!27463))

(assert (=> bm!27463 m!385119))

(declare-fun m!385305 () Bool)

(assert (=> bm!27463 m!385305))

(assert (=> b!389528 m!385119))

(assert (=> b!389528 m!385119))

(declare-fun m!385307 () Bool)

(assert (=> b!389528 m!385307))

(assert (=> b!389529 m!385119))

(assert (=> b!389529 m!385119))

(assert (=> b!389529 m!385121))

(assert (=> b!389531 m!385119))

(assert (=> b!389531 m!385119))

(assert (=> b!389531 m!385121))

(assert (=> b!389237 d!72757))

(declare-fun d!72759 () Bool)

(assert (=> d!72759 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!389247 d!72759))

(declare-fun d!72761 () Bool)

(declare-fun res!222835 () Bool)

(declare-fun e!235985 () Bool)

(assert (=> d!72761 (=> res!222835 e!235985)))

(assert (=> d!72761 (= res!222835 (bvsge #b00000000000000000000000000000000 (size!11363 _keys!658)))))

(assert (=> d!72761 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6335) e!235985)))

(declare-fun bm!27464 () Bool)

(declare-fun call!27467 () Bool)

(declare-fun c!54057 () Bool)

(assert (=> bm!27464 (= call!27467 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54057 (Cons!6334 (select (arr!11010 _keys!658) #b00000000000000000000000000000000) Nil!6335) Nil!6335)))))

(declare-fun b!389533 () Bool)

(declare-fun e!235986 () Bool)

(assert (=> b!389533 (= e!235986 (contains!2441 Nil!6335 (select (arr!11010 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!389534 () Bool)

(declare-fun e!235984 () Bool)

(declare-fun e!235983 () Bool)

(assert (=> b!389534 (= e!235984 e!235983)))

(assert (=> b!389534 (= c!54057 (validKeyInArray!0 (select (arr!11010 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!389535 () Bool)

(assert (=> b!389535 (= e!235983 call!27467)))

(declare-fun b!389536 () Bool)

(assert (=> b!389536 (= e!235985 e!235984)))

(declare-fun res!222833 () Bool)

(assert (=> b!389536 (=> (not res!222833) (not e!235984))))

(assert (=> b!389536 (= res!222833 (not e!235986))))

(declare-fun res!222834 () Bool)

(assert (=> b!389536 (=> (not res!222834) (not e!235986))))

(assert (=> b!389536 (= res!222834 (validKeyInArray!0 (select (arr!11010 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!389537 () Bool)

(assert (=> b!389537 (= e!235983 call!27467)))

(assert (= (and d!72761 (not res!222835)) b!389536))

(assert (= (and b!389536 res!222834) b!389533))

(assert (= (and b!389536 res!222833) b!389534))

(assert (= (and b!389534 c!54057) b!389535))

(assert (= (and b!389534 (not c!54057)) b!389537))

(assert (= (or b!389535 b!389537) bm!27464))

(assert (=> bm!27464 m!385131))

(declare-fun m!385309 () Bool)

(assert (=> bm!27464 m!385309))

(assert (=> b!389533 m!385131))

(assert (=> b!389533 m!385131))

(declare-fun m!385311 () Bool)

(assert (=> b!389533 m!385311))

(assert (=> b!389534 m!385131))

(assert (=> b!389534 m!385131))

(assert (=> b!389534 m!385133))

(assert (=> b!389536 m!385131))

(assert (=> b!389536 m!385131))

(assert (=> b!389536 m!385133))

(assert (=> b!389246 d!72761))

(declare-fun condMapEmpty!15984 () Bool)

(declare-fun mapDefault!15984 () ValueCell!4457)

(assert (=> mapNonEmpty!15975 (= condMapEmpty!15984 (= mapRest!15975 ((as const (Array (_ BitVec 32) ValueCell!4457)) mapDefault!15984)))))

(declare-fun e!235991 () Bool)

(declare-fun mapRes!15984 () Bool)

(assert (=> mapNonEmpty!15975 (= tp!31548 (and e!235991 mapRes!15984))))

(declare-fun b!389545 () Bool)

(assert (=> b!389545 (= e!235991 tp_is_empty!9601)))

(declare-fun mapIsEmpty!15984 () Bool)

(assert (=> mapIsEmpty!15984 mapRes!15984))

(declare-fun mapNonEmpty!15984 () Bool)

(declare-fun tp!31563 () Bool)

(declare-fun e!235992 () Bool)

(assert (=> mapNonEmpty!15984 (= mapRes!15984 (and tp!31563 e!235992))))

(declare-fun mapValue!15984 () ValueCell!4457)

(declare-fun mapRest!15984 () (Array (_ BitVec 32) ValueCell!4457))

(declare-fun mapKey!15984 () (_ BitVec 32))

(assert (=> mapNonEmpty!15984 (= mapRest!15975 (store mapRest!15984 mapKey!15984 mapValue!15984))))

(declare-fun b!389544 () Bool)

(assert (=> b!389544 (= e!235992 tp_is_empty!9601)))

(assert (= (and mapNonEmpty!15975 condMapEmpty!15984) mapIsEmpty!15984))

(assert (= (and mapNonEmpty!15975 (not condMapEmpty!15984)) mapNonEmpty!15984))

(assert (= (and mapNonEmpty!15984 ((_ is ValueCellFull!4457) mapValue!15984)) b!389544))

(assert (= (and mapNonEmpty!15975 ((_ is ValueCellFull!4457) mapDefault!15984)) b!389545))

(declare-fun m!385313 () Bool)

(assert (=> mapNonEmpty!15984 m!385313))

(declare-fun b_lambda!8593 () Bool)

(assert (= b_lambda!8581 (or (and start!37878 b_free!8929) b_lambda!8593)))

(declare-fun b_lambda!8595 () Bool)

(assert (= b_lambda!8591 (or (and start!37878 b_free!8929) b_lambda!8595)))

(declare-fun b_lambda!8597 () Bool)

(assert (= b_lambda!8589 (or (and start!37878 b_free!8929) b_lambda!8597)))

(declare-fun b_lambda!8599 () Bool)

(assert (= b_lambda!8587 (or (and start!37878 b_free!8929) b_lambda!8599)))

(declare-fun b_lambda!8601 () Bool)

(assert (= b_lambda!8585 (or (and start!37878 b_free!8929) b_lambda!8601)))

(declare-fun b_lambda!8603 () Bool)

(assert (= b_lambda!8583 (or (and start!37878 b_free!8929) b_lambda!8603)))

(check-sat tp_is_empty!9601 (not b!389344) (not b!389476) (not bm!27453) (not b!389372) (not b!389479) (not b!389345) (not d!72717) (not b!389461) (not b!389398) (not b!389533) (not d!72723) (not bm!27421) (not b_next!8929) (not d!72727) (not b!389363) (not b!389347) (not bm!27459) (not b!389350) (not bm!27422) (not b!389359) (not d!72749) (not b!389503) (not b!389528) (not b!389487) (not b!389517) (not bm!27460) (not b!389406) (not d!72753) (not b!389399) (not b_lambda!8597) (not b!389470) (not b!389346) (not b!389408) (not bm!27441) b_and!16197 (not b!389397) (not b!389455) (not b_lambda!8599) (not b!389474) (not b!389403) (not mapNonEmpty!15984) (not b!389454) (not b!389534) (not b!389485) (not d!72751) (not b!389337) (not d!72721) (not b!389468) (not bm!27450) (not bm!27463) (not b!389488) (not b!389342) (not bm!27442) (not bm!27447) (not b!389494) (not bm!27449) (not b!389360) (not b!389536) (not b!389483) (not b!389516) (not d!72725) (not d!72745) (not b!389486) (not b!389340) (not b!389515) (not d!72731) (not bm!27425) (not d!72755) (not b!389473) (not b!389475) (not d!72729) (not b!389338) (not b!389402) (not b!389341) (not b_lambda!8603) (not b!389453) (not b_lambda!8601) (not bm!27446) (not d!72747) (not b!389477) (not b!389343) (not bm!27454) (not b!389400) (not b!389480) (not b!389506) (not b_lambda!8593) (not b!389502) (not b!389529) (not b!389364) (not b!389349) (not bm!27464) (not d!72719) (not b!389348) (not b!389469) (not b!389339) (not b!389531) (not bm!27445) (not b!389501) (not b_lambda!8595))
(check-sat b_and!16197 (not b_next!8929))
