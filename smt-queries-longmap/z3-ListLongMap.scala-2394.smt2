; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37878 () Bool)

(assert start!37878)

(declare-fun b_free!8929 () Bool)

(declare-fun b_next!8929 () Bool)

(assert (=> start!37878 (= b_free!8929 (not b_next!8929))))

(declare-fun tp!31547 () Bool)

(declare-fun b_and!16221 () Bool)

(assert (=> start!37878 (= tp!31547 b_and!16221)))

(declare-fun b!389457 () Bool)

(declare-fun res!222789 () Bool)

(declare-fun e!235956 () Bool)

(assert (=> b!389457 (=> (not res!222789) (not e!235956))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!389457 (= res!222789 (validKeyInArray!0 k0!778))))

(declare-fun b!389458 () Bool)

(declare-fun e!235954 () Bool)

(declare-fun tp_is_empty!9601 () Bool)

(assert (=> b!389458 (= e!235954 tp_is_empty!9601)))

(declare-fun b!389459 () Bool)

(declare-fun e!235950 () Bool)

(assert (=> b!389459 (= e!235950 (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((V!13907 0))(
  ( (V!13908 (val!4845 Int)) )
))
(declare-datatypes ((tuple2!6380 0))(
  ( (tuple2!6381 (_1!3201 (_ BitVec 64)) (_2!3201 V!13907)) )
))
(declare-datatypes ((List!6232 0))(
  ( (Nil!6229) (Cons!6228 (h!7084 tuple2!6380) (t!11380 List!6232)) )
))
(declare-datatypes ((ListLongMap!5295 0))(
  ( (ListLongMap!5296 (toList!2663 List!6232)) )
))
(declare-fun lt!183162 () ListLongMap!5295)

(declare-fun lt!183170 () ListLongMap!5295)

(declare-fun lt!183164 () tuple2!6380)

(declare-fun +!1017 (ListLongMap!5295 tuple2!6380) ListLongMap!5295)

(assert (=> b!389459 (= lt!183162 (+!1017 lt!183170 lt!183164))))

(declare-fun v!373 () V!13907)

(declare-datatypes ((Unit!11903 0))(
  ( (Unit!11904) )
))
(declare-fun lt!183172 () Unit!11903)

(declare-fun lt!183163 () ListLongMap!5295)

(declare-fun zeroValue!472 () V!13907)

(declare-fun addCommutativeForDiffKeys!331 (ListLongMap!5295 (_ BitVec 64) V!13907 (_ BitVec 64) V!13907) Unit!11903)

(assert (=> b!389459 (= lt!183172 (addCommutativeForDiffKeys!331 lt!183163 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!183165 () ListLongMap!5295)

(declare-fun lt!183166 () tuple2!6380)

(assert (=> b!389459 (= lt!183165 (+!1017 lt!183162 lt!183166))))

(declare-fun lt!183171 () ListLongMap!5295)

(declare-fun lt!183175 () tuple2!6380)

(assert (=> b!389459 (= lt!183162 (+!1017 lt!183171 lt!183175))))

(declare-fun lt!183174 () ListLongMap!5295)

(assert (=> b!389459 (= lt!183174 (+!1017 lt!183170 lt!183166))))

(assert (=> b!389459 (= lt!183170 (+!1017 lt!183163 lt!183175))))

(declare-fun lt!183167 () ListLongMap!5295)

(assert (=> b!389459 (= lt!183165 (+!1017 (+!1017 lt!183167 lt!183175) lt!183166))))

(declare-fun minValue!472 () V!13907)

(assert (=> b!389459 (= lt!183166 (tuple2!6381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!389459 (= lt!183175 (tuple2!6381 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!389460 () Bool)

(declare-fun res!222790 () Bool)

(assert (=> b!389460 (=> (not res!222790) (not e!235956))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4457 0))(
  ( (ValueCellFull!4457 (v!7055 V!13907)) (EmptyCell!4457) )
))
(declare-datatypes ((array!23084 0))(
  ( (array!23085 (arr!11007 (Array (_ BitVec 32) ValueCell!4457)) (size!11359 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23084)

(declare-datatypes ((array!23086 0))(
  ( (array!23087 (arr!11008 (Array (_ BitVec 32) (_ BitVec 64))) (size!11360 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23086)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!389460 (= res!222790 (and (= (size!11359 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11360 _keys!658) (size!11359 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!15975 () Bool)

(declare-fun mapRes!15975 () Bool)

(declare-fun tp!31548 () Bool)

(assert (=> mapNonEmpty!15975 (= mapRes!15975 (and tp!31548 e!235954))))

(declare-fun mapValue!15975 () ValueCell!4457)

(declare-fun mapKey!15975 () (_ BitVec 32))

(declare-fun mapRest!15975 () (Array (_ BitVec 32) ValueCell!4457))

(assert (=> mapNonEmpty!15975 (= (arr!11007 _values!506) (store mapRest!15975 mapKey!15975 mapValue!15975))))

(declare-fun res!222792 () Bool)

(assert (=> start!37878 (=> (not res!222792) (not e!235956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37878 (= res!222792 (validMask!0 mask!970))))

(assert (=> start!37878 e!235956))

(declare-fun e!235955 () Bool)

(declare-fun array_inv!8138 (array!23084) Bool)

(assert (=> start!37878 (and (array_inv!8138 _values!506) e!235955)))

(assert (=> start!37878 tp!31547))

(assert (=> start!37878 true))

(assert (=> start!37878 tp_is_empty!9601))

(declare-fun array_inv!8139 (array!23086) Bool)

(assert (=> start!37878 (array_inv!8139 _keys!658)))

(declare-fun b!389461 () Bool)

(declare-fun res!222793 () Bool)

(assert (=> b!389461 (=> (not res!222793) (not e!235956))))

(declare-fun arrayContainsKey!0 (array!23086 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!389461 (= res!222793 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!389462 () Bool)

(declare-fun res!222794 () Bool)

(assert (=> b!389462 (=> (not res!222794) (not e!235956))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!389462 (= res!222794 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11360 _keys!658))))))

(declare-fun b!389463 () Bool)

(declare-fun res!222786 () Bool)

(assert (=> b!389463 (=> (not res!222786) (not e!235956))))

(assert (=> b!389463 (= res!222786 (or (= (select (arr!11008 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11008 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!389464 () Bool)

(declare-fun e!235952 () Bool)

(assert (=> b!389464 (= e!235952 (not e!235950))))

(declare-fun res!222791 () Bool)

(assert (=> b!389464 (=> res!222791 e!235950)))

(assert (=> b!389464 (= res!222791 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!2047 (array!23086 array!23084 (_ BitVec 32) (_ BitVec 32) V!13907 V!13907 (_ BitVec 32) Int) ListLongMap!5295)

(assert (=> b!389464 (= lt!183174 (getCurrentListMap!2047 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183173 () array!23084)

(declare-fun lt!183168 () array!23086)

(assert (=> b!389464 (= lt!183165 (getCurrentListMap!2047 lt!183168 lt!183173 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!389464 (and (= lt!183167 lt!183171) (= lt!183171 lt!183167))))

(assert (=> b!389464 (= lt!183171 (+!1017 lt!183163 lt!183164))))

(assert (=> b!389464 (= lt!183164 (tuple2!6381 k0!778 v!373))))

(declare-fun lt!183169 () Unit!11903)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!238 (array!23086 array!23084 (_ BitVec 32) (_ BitVec 32) V!13907 V!13907 (_ BitVec 32) (_ BitVec 64) V!13907 (_ BitVec 32) Int) Unit!11903)

(assert (=> b!389464 (= lt!183169 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!238 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!936 (array!23086 array!23084 (_ BitVec 32) (_ BitVec 32) V!13907 V!13907 (_ BitVec 32) Int) ListLongMap!5295)

(assert (=> b!389464 (= lt!183167 (getCurrentListMapNoExtraKeys!936 lt!183168 lt!183173 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!389464 (= lt!183173 (array!23085 (store (arr!11007 _values!506) i!548 (ValueCellFull!4457 v!373)) (size!11359 _values!506)))))

(assert (=> b!389464 (= lt!183163 (getCurrentListMapNoExtraKeys!936 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!389465 () Bool)

(declare-fun res!222788 () Bool)

(assert (=> b!389465 (=> (not res!222788) (not e!235956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23086 (_ BitVec 32)) Bool)

(assert (=> b!389465 (= res!222788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!389466 () Bool)

(declare-fun e!235953 () Bool)

(assert (=> b!389466 (= e!235955 (and e!235953 mapRes!15975))))

(declare-fun condMapEmpty!15975 () Bool)

(declare-fun mapDefault!15975 () ValueCell!4457)

(assert (=> b!389466 (= condMapEmpty!15975 (= (arr!11007 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4457)) mapDefault!15975)))))

(declare-fun b!389467 () Bool)

(declare-fun res!222787 () Bool)

(assert (=> b!389467 (=> (not res!222787) (not e!235956))))

(declare-datatypes ((List!6233 0))(
  ( (Nil!6230) (Cons!6229 (h!7085 (_ BitVec 64)) (t!11381 List!6233)) )
))
(declare-fun arrayNoDuplicates!0 (array!23086 (_ BitVec 32) List!6233) Bool)

(assert (=> b!389467 (= res!222787 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6230))))

(declare-fun mapIsEmpty!15975 () Bool)

(assert (=> mapIsEmpty!15975 mapRes!15975))

(declare-fun b!389468 () Bool)

(declare-fun res!222784 () Bool)

(assert (=> b!389468 (=> (not res!222784) (not e!235952))))

(assert (=> b!389468 (= res!222784 (arrayNoDuplicates!0 lt!183168 #b00000000000000000000000000000000 Nil!6230))))

(declare-fun b!389469 () Bool)

(assert (=> b!389469 (= e!235953 tp_is_empty!9601)))

(declare-fun b!389470 () Bool)

(assert (=> b!389470 (= e!235956 e!235952)))

(declare-fun res!222785 () Bool)

(assert (=> b!389470 (=> (not res!222785) (not e!235952))))

(assert (=> b!389470 (= res!222785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!183168 mask!970))))

(assert (=> b!389470 (= lt!183168 (array!23087 (store (arr!11008 _keys!658) i!548 k0!778) (size!11360 _keys!658)))))

(assert (= (and start!37878 res!222792) b!389460))

(assert (= (and b!389460 res!222790) b!389465))

(assert (= (and b!389465 res!222788) b!389467))

(assert (= (and b!389467 res!222787) b!389462))

(assert (= (and b!389462 res!222794) b!389457))

(assert (= (and b!389457 res!222789) b!389463))

(assert (= (and b!389463 res!222786) b!389461))

(assert (= (and b!389461 res!222793) b!389470))

(assert (= (and b!389470 res!222785) b!389468))

(assert (= (and b!389468 res!222784) b!389464))

(assert (= (and b!389464 (not res!222791)) b!389459))

(assert (= (and b!389466 condMapEmpty!15975) mapIsEmpty!15975))

(assert (= (and b!389466 (not condMapEmpty!15975)) mapNonEmpty!15975))

(get-info :version)

(assert (= (and mapNonEmpty!15975 ((_ is ValueCellFull!4457) mapValue!15975)) b!389458))

(assert (= (and b!389466 ((_ is ValueCellFull!4457) mapDefault!15975)) b!389469))

(assert (= start!37878 b!389466))

(declare-fun m!385817 () Bool)

(assert (=> b!389463 m!385817))

(declare-fun m!385819 () Bool)

(assert (=> mapNonEmpty!15975 m!385819))

(declare-fun m!385821 () Bool)

(assert (=> b!389457 m!385821))

(declare-fun m!385823 () Bool)

(assert (=> b!389470 m!385823))

(declare-fun m!385825 () Bool)

(assert (=> b!389470 m!385825))

(declare-fun m!385827 () Bool)

(assert (=> b!389464 m!385827))

(declare-fun m!385829 () Bool)

(assert (=> b!389464 m!385829))

(declare-fun m!385831 () Bool)

(assert (=> b!389464 m!385831))

(declare-fun m!385833 () Bool)

(assert (=> b!389464 m!385833))

(declare-fun m!385835 () Bool)

(assert (=> b!389464 m!385835))

(declare-fun m!385837 () Bool)

(assert (=> b!389464 m!385837))

(declare-fun m!385839 () Bool)

(assert (=> b!389464 m!385839))

(declare-fun m!385841 () Bool)

(assert (=> b!389459 m!385841))

(declare-fun m!385843 () Bool)

(assert (=> b!389459 m!385843))

(declare-fun m!385845 () Bool)

(assert (=> b!389459 m!385845))

(declare-fun m!385847 () Bool)

(assert (=> b!389459 m!385847))

(assert (=> b!389459 m!385843))

(declare-fun m!385849 () Bool)

(assert (=> b!389459 m!385849))

(declare-fun m!385851 () Bool)

(assert (=> b!389459 m!385851))

(declare-fun m!385853 () Bool)

(assert (=> b!389459 m!385853))

(declare-fun m!385855 () Bool)

(assert (=> b!389459 m!385855))

(declare-fun m!385857 () Bool)

(assert (=> b!389461 m!385857))

(declare-fun m!385859 () Bool)

(assert (=> b!389465 m!385859))

(declare-fun m!385861 () Bool)

(assert (=> start!37878 m!385861))

(declare-fun m!385863 () Bool)

(assert (=> start!37878 m!385863))

(declare-fun m!385865 () Bool)

(assert (=> start!37878 m!385865))

(declare-fun m!385867 () Bool)

(assert (=> b!389467 m!385867))

(declare-fun m!385869 () Bool)

(assert (=> b!389468 m!385869))

(check-sat (not b!389461) (not start!37878) (not b!389459) (not b!389470) (not b_next!8929) (not b!389457) (not b!389467) b_and!16221 (not b!389465) (not b!389464) tp_is_empty!9601 (not mapNonEmpty!15975) (not b!389468))
(check-sat b_and!16221 (not b_next!8929))
(get-model)

(declare-fun d!72951 () Bool)

(assert (=> d!72951 (= (+!1017 (+!1017 lt!183163 (tuple2!6381 k0!778 v!373)) (tuple2!6381 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) (+!1017 (+!1017 lt!183163 (tuple2!6381 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) (tuple2!6381 k0!778 v!373)))))

(declare-fun lt!183262 () Unit!11903)

(declare-fun choose!1321 (ListLongMap!5295 (_ BitVec 64) V!13907 (_ BitVec 64) V!13907) Unit!11903)

(assert (=> d!72951 (= lt!183262 (choose!1321 lt!183163 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (=> d!72951 (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!72951 (= (addCommutativeForDiffKeys!331 lt!183163 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) lt!183262)))

(declare-fun bs!13148 () Bool)

(assert (= bs!13148 d!72951))

(declare-fun m!385979 () Bool)

(assert (=> bs!13148 m!385979))

(declare-fun m!385981 () Bool)

(assert (=> bs!13148 m!385981))

(declare-fun m!385983 () Bool)

(assert (=> bs!13148 m!385983))

(declare-fun m!385985 () Bool)

(assert (=> bs!13148 m!385985))

(declare-fun m!385987 () Bool)

(assert (=> bs!13148 m!385987))

(assert (=> bs!13148 m!385985))

(assert (=> bs!13148 m!385981))

(assert (=> b!389459 d!72951))

(declare-fun d!72953 () Bool)

(declare-fun e!236001 () Bool)

(assert (=> d!72953 e!236001))

(declare-fun res!222866 () Bool)

(assert (=> d!72953 (=> (not res!222866) (not e!236001))))

(declare-fun lt!183272 () ListLongMap!5295)

(declare-fun contains!2428 (ListLongMap!5295 (_ BitVec 64)) Bool)

(assert (=> d!72953 (= res!222866 (contains!2428 lt!183272 (_1!3201 lt!183175)))))

(declare-fun lt!183273 () List!6232)

(assert (=> d!72953 (= lt!183272 (ListLongMap!5296 lt!183273))))

(declare-fun lt!183274 () Unit!11903)

(declare-fun lt!183271 () Unit!11903)

(assert (=> d!72953 (= lt!183274 lt!183271)))

(declare-datatypes ((Option!365 0))(
  ( (Some!364 (v!7061 V!13907)) (None!363) )
))
(declare-fun getValueByKey!359 (List!6232 (_ BitVec 64)) Option!365)

(assert (=> d!72953 (= (getValueByKey!359 lt!183273 (_1!3201 lt!183175)) (Some!364 (_2!3201 lt!183175)))))

(declare-fun lemmaContainsTupThenGetReturnValue!181 (List!6232 (_ BitVec 64) V!13907) Unit!11903)

(assert (=> d!72953 (= lt!183271 (lemmaContainsTupThenGetReturnValue!181 lt!183273 (_1!3201 lt!183175) (_2!3201 lt!183175)))))

(declare-fun insertStrictlySorted!184 (List!6232 (_ BitVec 64) V!13907) List!6232)

(assert (=> d!72953 (= lt!183273 (insertStrictlySorted!184 (toList!2663 lt!183171) (_1!3201 lt!183175) (_2!3201 lt!183175)))))

(assert (=> d!72953 (= (+!1017 lt!183171 lt!183175) lt!183272)))

(declare-fun b!389559 () Bool)

(declare-fun res!222865 () Bool)

(assert (=> b!389559 (=> (not res!222865) (not e!236001))))

(assert (=> b!389559 (= res!222865 (= (getValueByKey!359 (toList!2663 lt!183272) (_1!3201 lt!183175)) (Some!364 (_2!3201 lt!183175))))))

(declare-fun b!389560 () Bool)

(declare-fun contains!2429 (List!6232 tuple2!6380) Bool)

(assert (=> b!389560 (= e!236001 (contains!2429 (toList!2663 lt!183272) lt!183175))))

(assert (= (and d!72953 res!222866) b!389559))

(assert (= (and b!389559 res!222865) b!389560))

(declare-fun m!385989 () Bool)

(assert (=> d!72953 m!385989))

(declare-fun m!385991 () Bool)

(assert (=> d!72953 m!385991))

(declare-fun m!385993 () Bool)

(assert (=> d!72953 m!385993))

(declare-fun m!385995 () Bool)

(assert (=> d!72953 m!385995))

(declare-fun m!385997 () Bool)

(assert (=> b!389559 m!385997))

(declare-fun m!385999 () Bool)

(assert (=> b!389560 m!385999))

(assert (=> b!389459 d!72953))

(declare-fun d!72955 () Bool)

(declare-fun e!236002 () Bool)

(assert (=> d!72955 e!236002))

(declare-fun res!222868 () Bool)

(assert (=> d!72955 (=> (not res!222868) (not e!236002))))

(declare-fun lt!183276 () ListLongMap!5295)

(assert (=> d!72955 (= res!222868 (contains!2428 lt!183276 (_1!3201 lt!183166)))))

(declare-fun lt!183277 () List!6232)

(assert (=> d!72955 (= lt!183276 (ListLongMap!5296 lt!183277))))

(declare-fun lt!183278 () Unit!11903)

(declare-fun lt!183275 () Unit!11903)

(assert (=> d!72955 (= lt!183278 lt!183275)))

(assert (=> d!72955 (= (getValueByKey!359 lt!183277 (_1!3201 lt!183166)) (Some!364 (_2!3201 lt!183166)))))

(assert (=> d!72955 (= lt!183275 (lemmaContainsTupThenGetReturnValue!181 lt!183277 (_1!3201 lt!183166) (_2!3201 lt!183166)))))

(assert (=> d!72955 (= lt!183277 (insertStrictlySorted!184 (toList!2663 (+!1017 lt!183167 lt!183175)) (_1!3201 lt!183166) (_2!3201 lt!183166)))))

(assert (=> d!72955 (= (+!1017 (+!1017 lt!183167 lt!183175) lt!183166) lt!183276)))

(declare-fun b!389561 () Bool)

(declare-fun res!222867 () Bool)

(assert (=> b!389561 (=> (not res!222867) (not e!236002))))

(assert (=> b!389561 (= res!222867 (= (getValueByKey!359 (toList!2663 lt!183276) (_1!3201 lt!183166)) (Some!364 (_2!3201 lt!183166))))))

(declare-fun b!389562 () Bool)

(assert (=> b!389562 (= e!236002 (contains!2429 (toList!2663 lt!183276) lt!183166))))

(assert (= (and d!72955 res!222868) b!389561))

(assert (= (and b!389561 res!222867) b!389562))

(declare-fun m!386001 () Bool)

(assert (=> d!72955 m!386001))

(declare-fun m!386003 () Bool)

(assert (=> d!72955 m!386003))

(declare-fun m!386005 () Bool)

(assert (=> d!72955 m!386005))

(declare-fun m!386007 () Bool)

(assert (=> d!72955 m!386007))

(declare-fun m!386009 () Bool)

(assert (=> b!389561 m!386009))

(declare-fun m!386011 () Bool)

(assert (=> b!389562 m!386011))

(assert (=> b!389459 d!72955))

(declare-fun d!72957 () Bool)

(declare-fun e!236003 () Bool)

(assert (=> d!72957 e!236003))

(declare-fun res!222870 () Bool)

(assert (=> d!72957 (=> (not res!222870) (not e!236003))))

(declare-fun lt!183280 () ListLongMap!5295)

(assert (=> d!72957 (= res!222870 (contains!2428 lt!183280 (_1!3201 lt!183175)))))

(declare-fun lt!183281 () List!6232)

(assert (=> d!72957 (= lt!183280 (ListLongMap!5296 lt!183281))))

(declare-fun lt!183282 () Unit!11903)

(declare-fun lt!183279 () Unit!11903)

(assert (=> d!72957 (= lt!183282 lt!183279)))

(assert (=> d!72957 (= (getValueByKey!359 lt!183281 (_1!3201 lt!183175)) (Some!364 (_2!3201 lt!183175)))))

(assert (=> d!72957 (= lt!183279 (lemmaContainsTupThenGetReturnValue!181 lt!183281 (_1!3201 lt!183175) (_2!3201 lt!183175)))))

(assert (=> d!72957 (= lt!183281 (insertStrictlySorted!184 (toList!2663 lt!183167) (_1!3201 lt!183175) (_2!3201 lt!183175)))))

(assert (=> d!72957 (= (+!1017 lt!183167 lt!183175) lt!183280)))

(declare-fun b!389563 () Bool)

(declare-fun res!222869 () Bool)

(assert (=> b!389563 (=> (not res!222869) (not e!236003))))

(assert (=> b!389563 (= res!222869 (= (getValueByKey!359 (toList!2663 lt!183280) (_1!3201 lt!183175)) (Some!364 (_2!3201 lt!183175))))))

(declare-fun b!389564 () Bool)

(assert (=> b!389564 (= e!236003 (contains!2429 (toList!2663 lt!183280) lt!183175))))

(assert (= (and d!72957 res!222870) b!389563))

(assert (= (and b!389563 res!222869) b!389564))

(declare-fun m!386013 () Bool)

(assert (=> d!72957 m!386013))

(declare-fun m!386015 () Bool)

(assert (=> d!72957 m!386015))

(declare-fun m!386017 () Bool)

(assert (=> d!72957 m!386017))

(declare-fun m!386019 () Bool)

(assert (=> d!72957 m!386019))

(declare-fun m!386021 () Bool)

(assert (=> b!389563 m!386021))

(declare-fun m!386023 () Bool)

(assert (=> b!389564 m!386023))

(assert (=> b!389459 d!72957))

(declare-fun d!72959 () Bool)

(declare-fun e!236004 () Bool)

(assert (=> d!72959 e!236004))

(declare-fun res!222872 () Bool)

(assert (=> d!72959 (=> (not res!222872) (not e!236004))))

(declare-fun lt!183284 () ListLongMap!5295)

(assert (=> d!72959 (= res!222872 (contains!2428 lt!183284 (_1!3201 lt!183175)))))

(declare-fun lt!183285 () List!6232)

(assert (=> d!72959 (= lt!183284 (ListLongMap!5296 lt!183285))))

(declare-fun lt!183286 () Unit!11903)

(declare-fun lt!183283 () Unit!11903)

(assert (=> d!72959 (= lt!183286 lt!183283)))

(assert (=> d!72959 (= (getValueByKey!359 lt!183285 (_1!3201 lt!183175)) (Some!364 (_2!3201 lt!183175)))))

(assert (=> d!72959 (= lt!183283 (lemmaContainsTupThenGetReturnValue!181 lt!183285 (_1!3201 lt!183175) (_2!3201 lt!183175)))))

(assert (=> d!72959 (= lt!183285 (insertStrictlySorted!184 (toList!2663 lt!183163) (_1!3201 lt!183175) (_2!3201 lt!183175)))))

(assert (=> d!72959 (= (+!1017 lt!183163 lt!183175) lt!183284)))

(declare-fun b!389565 () Bool)

(declare-fun res!222871 () Bool)

(assert (=> b!389565 (=> (not res!222871) (not e!236004))))

(assert (=> b!389565 (= res!222871 (= (getValueByKey!359 (toList!2663 lt!183284) (_1!3201 lt!183175)) (Some!364 (_2!3201 lt!183175))))))

(declare-fun b!389566 () Bool)

(assert (=> b!389566 (= e!236004 (contains!2429 (toList!2663 lt!183284) lt!183175))))

(assert (= (and d!72959 res!222872) b!389565))

(assert (= (and b!389565 res!222871) b!389566))

(declare-fun m!386025 () Bool)

(assert (=> d!72959 m!386025))

(declare-fun m!386027 () Bool)

(assert (=> d!72959 m!386027))

(declare-fun m!386029 () Bool)

(assert (=> d!72959 m!386029))

(declare-fun m!386031 () Bool)

(assert (=> d!72959 m!386031))

(declare-fun m!386033 () Bool)

(assert (=> b!389565 m!386033))

(declare-fun m!386035 () Bool)

(assert (=> b!389566 m!386035))

(assert (=> b!389459 d!72959))

(declare-fun d!72961 () Bool)

(declare-fun e!236005 () Bool)

(assert (=> d!72961 e!236005))

(declare-fun res!222874 () Bool)

(assert (=> d!72961 (=> (not res!222874) (not e!236005))))

(declare-fun lt!183288 () ListLongMap!5295)

(assert (=> d!72961 (= res!222874 (contains!2428 lt!183288 (_1!3201 lt!183164)))))

(declare-fun lt!183289 () List!6232)

(assert (=> d!72961 (= lt!183288 (ListLongMap!5296 lt!183289))))

(declare-fun lt!183290 () Unit!11903)

(declare-fun lt!183287 () Unit!11903)

(assert (=> d!72961 (= lt!183290 lt!183287)))

(assert (=> d!72961 (= (getValueByKey!359 lt!183289 (_1!3201 lt!183164)) (Some!364 (_2!3201 lt!183164)))))

(assert (=> d!72961 (= lt!183287 (lemmaContainsTupThenGetReturnValue!181 lt!183289 (_1!3201 lt!183164) (_2!3201 lt!183164)))))

(assert (=> d!72961 (= lt!183289 (insertStrictlySorted!184 (toList!2663 lt!183170) (_1!3201 lt!183164) (_2!3201 lt!183164)))))

(assert (=> d!72961 (= (+!1017 lt!183170 lt!183164) lt!183288)))

(declare-fun b!389567 () Bool)

(declare-fun res!222873 () Bool)

(assert (=> b!389567 (=> (not res!222873) (not e!236005))))

(assert (=> b!389567 (= res!222873 (= (getValueByKey!359 (toList!2663 lt!183288) (_1!3201 lt!183164)) (Some!364 (_2!3201 lt!183164))))))

(declare-fun b!389568 () Bool)

(assert (=> b!389568 (= e!236005 (contains!2429 (toList!2663 lt!183288) lt!183164))))

(assert (= (and d!72961 res!222874) b!389567))

(assert (= (and b!389567 res!222873) b!389568))

(declare-fun m!386037 () Bool)

(assert (=> d!72961 m!386037))

(declare-fun m!386039 () Bool)

(assert (=> d!72961 m!386039))

(declare-fun m!386041 () Bool)

(assert (=> d!72961 m!386041))

(declare-fun m!386043 () Bool)

(assert (=> d!72961 m!386043))

(declare-fun m!386045 () Bool)

(assert (=> b!389567 m!386045))

(declare-fun m!386047 () Bool)

(assert (=> b!389568 m!386047))

(assert (=> b!389459 d!72961))

(declare-fun d!72963 () Bool)

(declare-fun e!236006 () Bool)

(assert (=> d!72963 e!236006))

(declare-fun res!222876 () Bool)

(assert (=> d!72963 (=> (not res!222876) (not e!236006))))

(declare-fun lt!183292 () ListLongMap!5295)

(assert (=> d!72963 (= res!222876 (contains!2428 lt!183292 (_1!3201 lt!183166)))))

(declare-fun lt!183293 () List!6232)

(assert (=> d!72963 (= lt!183292 (ListLongMap!5296 lt!183293))))

(declare-fun lt!183294 () Unit!11903)

(declare-fun lt!183291 () Unit!11903)

(assert (=> d!72963 (= lt!183294 lt!183291)))

(assert (=> d!72963 (= (getValueByKey!359 lt!183293 (_1!3201 lt!183166)) (Some!364 (_2!3201 lt!183166)))))

(assert (=> d!72963 (= lt!183291 (lemmaContainsTupThenGetReturnValue!181 lt!183293 (_1!3201 lt!183166) (_2!3201 lt!183166)))))

(assert (=> d!72963 (= lt!183293 (insertStrictlySorted!184 (toList!2663 lt!183170) (_1!3201 lt!183166) (_2!3201 lt!183166)))))

(assert (=> d!72963 (= (+!1017 lt!183170 lt!183166) lt!183292)))

(declare-fun b!389569 () Bool)

(declare-fun res!222875 () Bool)

(assert (=> b!389569 (=> (not res!222875) (not e!236006))))

(assert (=> b!389569 (= res!222875 (= (getValueByKey!359 (toList!2663 lt!183292) (_1!3201 lt!183166)) (Some!364 (_2!3201 lt!183166))))))

(declare-fun b!389570 () Bool)

(assert (=> b!389570 (= e!236006 (contains!2429 (toList!2663 lt!183292) lt!183166))))

(assert (= (and d!72963 res!222876) b!389569))

(assert (= (and b!389569 res!222875) b!389570))

(declare-fun m!386049 () Bool)

(assert (=> d!72963 m!386049))

(declare-fun m!386051 () Bool)

(assert (=> d!72963 m!386051))

(declare-fun m!386053 () Bool)

(assert (=> d!72963 m!386053))

(declare-fun m!386055 () Bool)

(assert (=> d!72963 m!386055))

(declare-fun m!386057 () Bool)

(assert (=> b!389569 m!386057))

(declare-fun m!386059 () Bool)

(assert (=> b!389570 m!386059))

(assert (=> b!389459 d!72963))

(declare-fun d!72965 () Bool)

(declare-fun e!236007 () Bool)

(assert (=> d!72965 e!236007))

(declare-fun res!222878 () Bool)

(assert (=> d!72965 (=> (not res!222878) (not e!236007))))

(declare-fun lt!183296 () ListLongMap!5295)

(assert (=> d!72965 (= res!222878 (contains!2428 lt!183296 (_1!3201 lt!183166)))))

(declare-fun lt!183297 () List!6232)

(assert (=> d!72965 (= lt!183296 (ListLongMap!5296 lt!183297))))

(declare-fun lt!183298 () Unit!11903)

(declare-fun lt!183295 () Unit!11903)

(assert (=> d!72965 (= lt!183298 lt!183295)))

(assert (=> d!72965 (= (getValueByKey!359 lt!183297 (_1!3201 lt!183166)) (Some!364 (_2!3201 lt!183166)))))

(assert (=> d!72965 (= lt!183295 (lemmaContainsTupThenGetReturnValue!181 lt!183297 (_1!3201 lt!183166) (_2!3201 lt!183166)))))

(assert (=> d!72965 (= lt!183297 (insertStrictlySorted!184 (toList!2663 lt!183162) (_1!3201 lt!183166) (_2!3201 lt!183166)))))

(assert (=> d!72965 (= (+!1017 lt!183162 lt!183166) lt!183296)))

(declare-fun b!389571 () Bool)

(declare-fun res!222877 () Bool)

(assert (=> b!389571 (=> (not res!222877) (not e!236007))))

(assert (=> b!389571 (= res!222877 (= (getValueByKey!359 (toList!2663 lt!183296) (_1!3201 lt!183166)) (Some!364 (_2!3201 lt!183166))))))

(declare-fun b!389572 () Bool)

(assert (=> b!389572 (= e!236007 (contains!2429 (toList!2663 lt!183296) lt!183166))))

(assert (= (and d!72965 res!222878) b!389571))

(assert (= (and b!389571 res!222877) b!389572))

(declare-fun m!386061 () Bool)

(assert (=> d!72965 m!386061))

(declare-fun m!386063 () Bool)

(assert (=> d!72965 m!386063))

(declare-fun m!386065 () Bool)

(assert (=> d!72965 m!386065))

(declare-fun m!386067 () Bool)

(assert (=> d!72965 m!386067))

(declare-fun m!386069 () Bool)

(assert (=> b!389571 m!386069))

(declare-fun m!386071 () Bool)

(assert (=> b!389572 m!386071))

(assert (=> b!389459 d!72965))

(declare-fun d!72967 () Bool)

(declare-fun res!222885 () Bool)

(declare-fun e!236017 () Bool)

(assert (=> d!72967 (=> res!222885 e!236017)))

(assert (=> d!72967 (= res!222885 (bvsge #b00000000000000000000000000000000 (size!11360 lt!183168)))))

(assert (=> d!72967 (= (arrayNoDuplicates!0 lt!183168 #b00000000000000000000000000000000 Nil!6230) e!236017)))

(declare-fun b!389583 () Bool)

(declare-fun e!236016 () Bool)

(declare-fun contains!2430 (List!6233 (_ BitVec 64)) Bool)

(assert (=> b!389583 (= e!236016 (contains!2430 Nil!6230 (select (arr!11008 lt!183168) #b00000000000000000000000000000000)))))

(declare-fun bm!27433 () Bool)

(declare-fun call!27436 () Bool)

(declare-fun c!54057 () Bool)

(assert (=> bm!27433 (= call!27436 (arrayNoDuplicates!0 lt!183168 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54057 (Cons!6229 (select (arr!11008 lt!183168) #b00000000000000000000000000000000) Nil!6230) Nil!6230)))))

(declare-fun b!389584 () Bool)

(declare-fun e!236018 () Bool)

(assert (=> b!389584 (= e!236017 e!236018)))

(declare-fun res!222886 () Bool)

(assert (=> b!389584 (=> (not res!222886) (not e!236018))))

(assert (=> b!389584 (= res!222886 (not e!236016))))

(declare-fun res!222887 () Bool)

(assert (=> b!389584 (=> (not res!222887) (not e!236016))))

(assert (=> b!389584 (= res!222887 (validKeyInArray!0 (select (arr!11008 lt!183168) #b00000000000000000000000000000000)))))

(declare-fun b!389585 () Bool)

(declare-fun e!236019 () Bool)

(assert (=> b!389585 (= e!236018 e!236019)))

(assert (=> b!389585 (= c!54057 (validKeyInArray!0 (select (arr!11008 lt!183168) #b00000000000000000000000000000000)))))

(declare-fun b!389586 () Bool)

(assert (=> b!389586 (= e!236019 call!27436)))

(declare-fun b!389587 () Bool)

(assert (=> b!389587 (= e!236019 call!27436)))

(assert (= (and d!72967 (not res!222885)) b!389584))

(assert (= (and b!389584 res!222887) b!389583))

(assert (= (and b!389584 res!222886) b!389585))

(assert (= (and b!389585 c!54057) b!389586))

(assert (= (and b!389585 (not c!54057)) b!389587))

(assert (= (or b!389586 b!389587) bm!27433))

(declare-fun m!386073 () Bool)

(assert (=> b!389583 m!386073))

(assert (=> b!389583 m!386073))

(declare-fun m!386075 () Bool)

(assert (=> b!389583 m!386075))

(assert (=> bm!27433 m!386073))

(declare-fun m!386077 () Bool)

(assert (=> bm!27433 m!386077))

(assert (=> b!389584 m!386073))

(assert (=> b!389584 m!386073))

(declare-fun m!386079 () Bool)

(assert (=> b!389584 m!386079))

(assert (=> b!389585 m!386073))

(assert (=> b!389585 m!386073))

(assert (=> b!389585 m!386079))

(assert (=> b!389468 d!72967))

(declare-fun b!389612 () Bool)

(declare-fun e!236038 () Bool)

(declare-fun e!236037 () Bool)

(assert (=> b!389612 (= e!236038 e!236037)))

(assert (=> b!389612 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11360 _keys!658)))))

(declare-fun res!222897 () Bool)

(declare-fun lt!183313 () ListLongMap!5295)

(assert (=> b!389612 (= res!222897 (contains!2428 lt!183313 (select (arr!11008 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!389612 (=> (not res!222897) (not e!236037))))

(declare-fun b!389613 () Bool)

(declare-fun e!236035 () Bool)

(assert (=> b!389613 (= e!236038 e!236035)))

(declare-fun c!54066 () Bool)

(assert (=> b!389613 (= c!54066 (bvslt #b00000000000000000000000000000000 (size!11360 _keys!658)))))

(declare-fun b!389614 () Bool)

(declare-fun res!222898 () Bool)

(declare-fun e!236034 () Bool)

(assert (=> b!389614 (=> (not res!222898) (not e!236034))))

(assert (=> b!389614 (= res!222898 (not (contains!2428 lt!183313 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!389615 () Bool)

(declare-fun e!236036 () ListLongMap!5295)

(declare-fun e!236039 () ListLongMap!5295)

(assert (=> b!389615 (= e!236036 e!236039)))

(declare-fun c!54067 () Bool)

(assert (=> b!389615 (= c!54067 (validKeyInArray!0 (select (arr!11008 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun d!72969 () Bool)

(assert (=> d!72969 e!236034))

(declare-fun res!222899 () Bool)

(assert (=> d!72969 (=> (not res!222899) (not e!236034))))

(assert (=> d!72969 (= res!222899 (not (contains!2428 lt!183313 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72969 (= lt!183313 e!236036)))

(declare-fun c!54069 () Bool)

(assert (=> d!72969 (= c!54069 (bvsge #b00000000000000000000000000000000 (size!11360 _keys!658)))))

(assert (=> d!72969 (validMask!0 mask!970)))

(assert (=> d!72969 (= (getCurrentListMapNoExtraKeys!936 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!183313)))

(declare-fun b!389616 () Bool)

(declare-fun lt!183314 () Unit!11903)

(declare-fun lt!183316 () Unit!11903)

(assert (=> b!389616 (= lt!183314 lt!183316)))

(declare-fun lt!183315 () (_ BitVec 64))

(declare-fun lt!183318 () V!13907)

(declare-fun lt!183317 () ListLongMap!5295)

(declare-fun lt!183319 () (_ BitVec 64))

(assert (=> b!389616 (not (contains!2428 (+!1017 lt!183317 (tuple2!6381 lt!183319 lt!183318)) lt!183315))))

(declare-fun addStillNotContains!135 (ListLongMap!5295 (_ BitVec 64) V!13907 (_ BitVec 64)) Unit!11903)

(assert (=> b!389616 (= lt!183316 (addStillNotContains!135 lt!183317 lt!183319 lt!183318 lt!183315))))

(assert (=> b!389616 (= lt!183315 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!5580 (ValueCell!4457 V!13907) V!13907)

(declare-fun dynLambda!643 (Int (_ BitVec 64)) V!13907)

(assert (=> b!389616 (= lt!183318 (get!5580 (select (arr!11007 _values!506) #b00000000000000000000000000000000) (dynLambda!643 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!389616 (= lt!183319 (select (arr!11008 _keys!658) #b00000000000000000000000000000000))))

(declare-fun call!27439 () ListLongMap!5295)

(assert (=> b!389616 (= lt!183317 call!27439)))

(assert (=> b!389616 (= e!236039 (+!1017 call!27439 (tuple2!6381 (select (arr!11008 _keys!658) #b00000000000000000000000000000000) (get!5580 (select (arr!11007 _values!506) #b00000000000000000000000000000000) (dynLambda!643 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!389617 () Bool)

(assert (=> b!389617 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11360 _keys!658)))))

(assert (=> b!389617 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11359 _values!506)))))

(declare-fun apply!300 (ListLongMap!5295 (_ BitVec 64)) V!13907)

(assert (=> b!389617 (= e!236037 (= (apply!300 lt!183313 (select (arr!11008 _keys!658) #b00000000000000000000000000000000)) (get!5580 (select (arr!11007 _values!506) #b00000000000000000000000000000000) (dynLambda!643 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!389618 () Bool)

(declare-fun isEmpty!552 (ListLongMap!5295) Bool)

(assert (=> b!389618 (= e!236035 (isEmpty!552 lt!183313))))

(declare-fun b!389619 () Bool)

(assert (=> b!389619 (= e!236035 (= lt!183313 (getCurrentListMapNoExtraKeys!936 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun bm!27436 () Bool)

(assert (=> bm!27436 (= call!27439 (getCurrentListMapNoExtraKeys!936 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!389620 () Bool)

(declare-fun e!236040 () Bool)

(assert (=> b!389620 (= e!236040 (validKeyInArray!0 (select (arr!11008 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!389620 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!389621 () Bool)

(assert (=> b!389621 (= e!236039 call!27439)))

(declare-fun b!389622 () Bool)

(assert (=> b!389622 (= e!236034 e!236038)))

(declare-fun c!54068 () Bool)

(assert (=> b!389622 (= c!54068 e!236040)))

(declare-fun res!222896 () Bool)

(assert (=> b!389622 (=> (not res!222896) (not e!236040))))

(assert (=> b!389622 (= res!222896 (bvslt #b00000000000000000000000000000000 (size!11360 _keys!658)))))

(declare-fun b!389623 () Bool)

(assert (=> b!389623 (= e!236036 (ListLongMap!5296 Nil!6229))))

(assert (= (and d!72969 c!54069) b!389623))

(assert (= (and d!72969 (not c!54069)) b!389615))

(assert (= (and b!389615 c!54067) b!389616))

(assert (= (and b!389615 (not c!54067)) b!389621))

(assert (= (or b!389616 b!389621) bm!27436))

(assert (= (and d!72969 res!222899) b!389614))

(assert (= (and b!389614 res!222898) b!389622))

(assert (= (and b!389622 res!222896) b!389620))

(assert (= (and b!389622 c!54068) b!389612))

(assert (= (and b!389622 (not c!54068)) b!389613))

(assert (= (and b!389612 res!222897) b!389617))

(assert (= (and b!389613 c!54066) b!389619))

(assert (= (and b!389613 (not c!54066)) b!389618))

(declare-fun b_lambda!8621 () Bool)

(assert (=> (not b_lambda!8621) (not b!389616)))

(declare-fun t!11387 () Bool)

(declare-fun tb!3107 () Bool)

(assert (=> (and start!37878 (= defaultEntry!514 defaultEntry!514) t!11387) tb!3107))

(declare-fun result!5717 () Bool)

(assert (=> tb!3107 (= result!5717 tp_is_empty!9601)))

(assert (=> b!389616 t!11387))

(declare-fun b_and!16227 () Bool)

(assert (= b_and!16221 (and (=> t!11387 result!5717) b_and!16227)))

(declare-fun b_lambda!8623 () Bool)

(assert (=> (not b_lambda!8623) (not b!389617)))

(assert (=> b!389617 t!11387))

(declare-fun b_and!16229 () Bool)

(assert (= b_and!16227 (and (=> t!11387 result!5717) b_and!16229)))

(declare-fun m!386081 () Bool)

(assert (=> b!389619 m!386081))

(declare-fun m!386083 () Bool)

(assert (=> b!389618 m!386083))

(declare-fun m!386085 () Bool)

(assert (=> b!389612 m!386085))

(assert (=> b!389612 m!386085))

(declare-fun m!386087 () Bool)

(assert (=> b!389612 m!386087))

(declare-fun m!386089 () Bool)

(assert (=> b!389614 m!386089))

(assert (=> b!389616 m!386085))

(declare-fun m!386091 () Bool)

(assert (=> b!389616 m!386091))

(declare-fun m!386093 () Bool)

(assert (=> b!389616 m!386093))

(declare-fun m!386095 () Bool)

(assert (=> b!389616 m!386095))

(declare-fun m!386097 () Bool)

(assert (=> b!389616 m!386097))

(assert (=> b!389616 m!386093))

(assert (=> b!389616 m!386097))

(declare-fun m!386099 () Bool)

(assert (=> b!389616 m!386099))

(declare-fun m!386101 () Bool)

(assert (=> b!389616 m!386101))

(assert (=> b!389616 m!386101))

(declare-fun m!386103 () Bool)

(assert (=> b!389616 m!386103))

(assert (=> b!389615 m!386085))

(assert (=> b!389615 m!386085))

(declare-fun m!386105 () Bool)

(assert (=> b!389615 m!386105))

(assert (=> b!389617 m!386085))

(assert (=> b!389617 m!386093))

(assert (=> b!389617 m!386085))

(declare-fun m!386107 () Bool)

(assert (=> b!389617 m!386107))

(assert (=> b!389617 m!386097))

(assert (=> b!389617 m!386093))

(assert (=> b!389617 m!386097))

(assert (=> b!389617 m!386099))

(assert (=> b!389620 m!386085))

(assert (=> b!389620 m!386085))

(assert (=> b!389620 m!386105))

(declare-fun m!386109 () Bool)

(assert (=> d!72969 m!386109))

(assert (=> d!72969 m!385861))

(assert (=> bm!27436 m!386081))

(assert (=> b!389464 d!72969))

(declare-fun b!389668 () Bool)

(declare-fun e!236070 () Bool)

(assert (=> b!389668 (= e!236070 (validKeyInArray!0 (select (arr!11008 lt!183168) #b00000000000000000000000000000000)))))

(declare-fun b!389669 () Bool)

(declare-fun e!236075 () Bool)

(declare-fun lt!183368 () ListLongMap!5295)

(assert (=> b!389669 (= e!236075 (= (apply!300 lt!183368 (select (arr!11008 lt!183168) #b00000000000000000000000000000000)) (get!5580 (select (arr!11007 lt!183173) #b00000000000000000000000000000000) (dynLambda!643 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!389669 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11359 lt!183173)))))

(assert (=> b!389669 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11360 lt!183168)))))

(declare-fun b!389670 () Bool)

(declare-fun e!236077 () Bool)

(declare-fun e!236069 () Bool)

(assert (=> b!389670 (= e!236077 e!236069)))

(declare-fun c!54082 () Bool)

(assert (=> b!389670 (= c!54082 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!389671 () Bool)

(declare-fun e!236079 () ListLongMap!5295)

(declare-fun call!27460 () ListLongMap!5295)

(assert (=> b!389671 (= e!236079 call!27460)))

(declare-fun bm!27451 () Bool)

(declare-fun call!27455 () ListLongMap!5295)

(assert (=> bm!27451 (= call!27460 call!27455)))

(declare-fun b!389672 () Bool)

(declare-fun e!236074 () Bool)

(assert (=> b!389672 (= e!236074 (validKeyInArray!0 (select (arr!11008 lt!183168) #b00000000000000000000000000000000)))))

(declare-fun b!389673 () Bool)

(declare-fun res!222922 () Bool)

(assert (=> b!389673 (=> (not res!222922) (not e!236077))))

(declare-fun e!236078 () Bool)

(assert (=> b!389673 (= res!222922 e!236078)))

(declare-fun c!54084 () Bool)

(assert (=> b!389673 (= c!54084 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!389674 () Bool)

(declare-fun e!236071 () Bool)

(assert (=> b!389674 (= e!236071 (= (apply!300 lt!183368 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun bm!27452 () Bool)

(declare-fun call!27457 () ListLongMap!5295)

(declare-fun call!27456 () ListLongMap!5295)

(assert (=> bm!27452 (= call!27457 call!27456)))

(declare-fun b!389675 () Bool)

(declare-fun e!236068 () Unit!11903)

(declare-fun Unit!11909 () Unit!11903)

(assert (=> b!389675 (= e!236068 Unit!11909)))

(declare-fun b!389676 () Bool)

(declare-fun res!222920 () Bool)

(assert (=> b!389676 (=> (not res!222920) (not e!236077))))

(declare-fun e!236072 () Bool)

(assert (=> b!389676 (= res!222920 e!236072)))

(declare-fun res!222924 () Bool)

(assert (=> b!389676 (=> res!222924 e!236072)))

(assert (=> b!389676 (= res!222924 (not e!236070))))

(declare-fun res!222926 () Bool)

(assert (=> b!389676 (=> (not res!222926) (not e!236070))))

(assert (=> b!389676 (= res!222926 (bvslt #b00000000000000000000000000000000 (size!11360 lt!183168)))))

(declare-fun b!389677 () Bool)

(assert (=> b!389677 (= e!236078 e!236071)))

(declare-fun res!222925 () Bool)

(declare-fun call!27454 () Bool)

(assert (=> b!389677 (= res!222925 call!27454)))

(assert (=> b!389677 (=> (not res!222925) (not e!236071))))

(declare-fun b!389678 () Bool)

(assert (=> b!389678 (= e!236079 call!27457)))

(declare-fun b!389679 () Bool)

(declare-fun e!236067 () Bool)

(assert (=> b!389679 (= e!236067 (= (apply!300 lt!183368 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!389680 () Bool)

(declare-fun e!236073 () ListLongMap!5295)

(declare-fun e!236076 () ListLongMap!5295)

(assert (=> b!389680 (= e!236073 e!236076)))

(declare-fun c!54083 () Bool)

(assert (=> b!389680 (= c!54083 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!27459 () ListLongMap!5295)

(declare-fun bm!27454 () Bool)

(assert (=> bm!27454 (= call!27459 (getCurrentListMapNoExtraKeys!936 lt!183168 lt!183173 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!389681 () Bool)

(declare-fun call!27458 () Bool)

(assert (=> b!389681 (= e!236069 (not call!27458))))

(declare-fun b!389682 () Bool)

(declare-fun lt!183383 () Unit!11903)

(assert (=> b!389682 (= e!236068 lt!183383)))

(declare-fun lt!183379 () ListLongMap!5295)

(assert (=> b!389682 (= lt!183379 (getCurrentListMapNoExtraKeys!936 lt!183168 lt!183173 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183378 () (_ BitVec 64))

(assert (=> b!389682 (= lt!183378 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183382 () (_ BitVec 64))

(assert (=> b!389682 (= lt!183382 (select (arr!11008 lt!183168) #b00000000000000000000000000000000))))

(declare-fun lt!183381 () Unit!11903)

(declare-fun addStillContains!276 (ListLongMap!5295 (_ BitVec 64) V!13907 (_ BitVec 64)) Unit!11903)

(assert (=> b!389682 (= lt!183381 (addStillContains!276 lt!183379 lt!183378 zeroValue!472 lt!183382))))

(assert (=> b!389682 (contains!2428 (+!1017 lt!183379 (tuple2!6381 lt!183378 zeroValue!472)) lt!183382)))

(declare-fun lt!183374 () Unit!11903)

(assert (=> b!389682 (= lt!183374 lt!183381)))

(declare-fun lt!183369 () ListLongMap!5295)

(assert (=> b!389682 (= lt!183369 (getCurrentListMapNoExtraKeys!936 lt!183168 lt!183173 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183370 () (_ BitVec 64))

(assert (=> b!389682 (= lt!183370 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183366 () (_ BitVec 64))

(assert (=> b!389682 (= lt!183366 (select (arr!11008 lt!183168) #b00000000000000000000000000000000))))

(declare-fun lt!183385 () Unit!11903)

(declare-fun addApplyDifferent!276 (ListLongMap!5295 (_ BitVec 64) V!13907 (_ BitVec 64)) Unit!11903)

(assert (=> b!389682 (= lt!183385 (addApplyDifferent!276 lt!183369 lt!183370 minValue!472 lt!183366))))

(assert (=> b!389682 (= (apply!300 (+!1017 lt!183369 (tuple2!6381 lt!183370 minValue!472)) lt!183366) (apply!300 lt!183369 lt!183366))))

(declare-fun lt!183373 () Unit!11903)

(assert (=> b!389682 (= lt!183373 lt!183385)))

(declare-fun lt!183375 () ListLongMap!5295)

(assert (=> b!389682 (= lt!183375 (getCurrentListMapNoExtraKeys!936 lt!183168 lt!183173 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183371 () (_ BitVec 64))

(assert (=> b!389682 (= lt!183371 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183384 () (_ BitVec 64))

(assert (=> b!389682 (= lt!183384 (select (arr!11008 lt!183168) #b00000000000000000000000000000000))))

(declare-fun lt!183364 () Unit!11903)

(assert (=> b!389682 (= lt!183364 (addApplyDifferent!276 lt!183375 lt!183371 zeroValue!472 lt!183384))))

(assert (=> b!389682 (= (apply!300 (+!1017 lt!183375 (tuple2!6381 lt!183371 zeroValue!472)) lt!183384) (apply!300 lt!183375 lt!183384))))

(declare-fun lt!183365 () Unit!11903)

(assert (=> b!389682 (= lt!183365 lt!183364)))

(declare-fun lt!183380 () ListLongMap!5295)

(assert (=> b!389682 (= lt!183380 (getCurrentListMapNoExtraKeys!936 lt!183168 lt!183173 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183376 () (_ BitVec 64))

(assert (=> b!389682 (= lt!183376 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183367 () (_ BitVec 64))

(assert (=> b!389682 (= lt!183367 (select (arr!11008 lt!183168) #b00000000000000000000000000000000))))

(assert (=> b!389682 (= lt!183383 (addApplyDifferent!276 lt!183380 lt!183376 minValue!472 lt!183367))))

(assert (=> b!389682 (= (apply!300 (+!1017 lt!183380 (tuple2!6381 lt!183376 minValue!472)) lt!183367) (apply!300 lt!183380 lt!183367))))

(declare-fun bm!27455 () Bool)

(declare-fun c!54085 () Bool)

(assert (=> bm!27455 (= call!27455 (+!1017 (ite c!54085 call!27459 (ite c!54083 call!27456 call!27457)) (ite (or c!54085 c!54083) (tuple2!6381 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!389683 () Bool)

(assert (=> b!389683 (= e!236078 (not call!27454))))

(declare-fun d!72971 () Bool)

(assert (=> d!72971 e!236077))

(declare-fun res!222923 () Bool)

(assert (=> d!72971 (=> (not res!222923) (not e!236077))))

(assert (=> d!72971 (= res!222923 (or (bvsge #b00000000000000000000000000000000 (size!11360 lt!183168)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11360 lt!183168)))))))

(declare-fun lt!183377 () ListLongMap!5295)

(assert (=> d!72971 (= lt!183368 lt!183377)))

(declare-fun lt!183372 () Unit!11903)

(assert (=> d!72971 (= lt!183372 e!236068)))

(declare-fun c!54087 () Bool)

(assert (=> d!72971 (= c!54087 e!236074)))

(declare-fun res!222918 () Bool)

(assert (=> d!72971 (=> (not res!222918) (not e!236074))))

(assert (=> d!72971 (= res!222918 (bvslt #b00000000000000000000000000000000 (size!11360 lt!183168)))))

(assert (=> d!72971 (= lt!183377 e!236073)))

(assert (=> d!72971 (= c!54085 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72971 (validMask!0 mask!970)))

(assert (=> d!72971 (= (getCurrentListMap!2047 lt!183168 lt!183173 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!183368)))

(declare-fun bm!27453 () Bool)

(assert (=> bm!27453 (= call!27458 (contains!2428 lt!183368 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!389684 () Bool)

(assert (=> b!389684 (= e!236072 e!236075)))

(declare-fun res!222921 () Bool)

(assert (=> b!389684 (=> (not res!222921) (not e!236075))))

(assert (=> b!389684 (= res!222921 (contains!2428 lt!183368 (select (arr!11008 lt!183168) #b00000000000000000000000000000000)))))

(assert (=> b!389684 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11360 lt!183168)))))

(declare-fun b!389685 () Bool)

(declare-fun c!54086 () Bool)

(assert (=> b!389685 (= c!54086 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!389685 (= e!236076 e!236079)))

(declare-fun b!389686 () Bool)

(assert (=> b!389686 (= e!236069 e!236067)))

(declare-fun res!222919 () Bool)

(assert (=> b!389686 (= res!222919 call!27458)))

(assert (=> b!389686 (=> (not res!222919) (not e!236067))))

(declare-fun b!389687 () Bool)

(assert (=> b!389687 (= e!236076 call!27460)))

(declare-fun bm!27456 () Bool)

(assert (=> bm!27456 (= call!27454 (contains!2428 lt!183368 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27457 () Bool)

(assert (=> bm!27457 (= call!27456 call!27459)))

(declare-fun b!389688 () Bool)

(assert (=> b!389688 (= e!236073 (+!1017 call!27455 (tuple2!6381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(assert (= (and d!72971 c!54085) b!389688))

(assert (= (and d!72971 (not c!54085)) b!389680))

(assert (= (and b!389680 c!54083) b!389687))

(assert (= (and b!389680 (not c!54083)) b!389685))

(assert (= (and b!389685 c!54086) b!389671))

(assert (= (and b!389685 (not c!54086)) b!389678))

(assert (= (or b!389671 b!389678) bm!27452))

(assert (= (or b!389687 bm!27452) bm!27457))

(assert (= (or b!389687 b!389671) bm!27451))

(assert (= (or b!389688 bm!27457) bm!27454))

(assert (= (or b!389688 bm!27451) bm!27455))

(assert (= (and d!72971 res!222918) b!389672))

(assert (= (and d!72971 c!54087) b!389682))

(assert (= (and d!72971 (not c!54087)) b!389675))

(assert (= (and d!72971 res!222923) b!389676))

(assert (= (and b!389676 res!222926) b!389668))

(assert (= (and b!389676 (not res!222924)) b!389684))

(assert (= (and b!389684 res!222921) b!389669))

(assert (= (and b!389676 res!222920) b!389673))

(assert (= (and b!389673 c!54084) b!389677))

(assert (= (and b!389673 (not c!54084)) b!389683))

(assert (= (and b!389677 res!222925) b!389674))

(assert (= (or b!389677 b!389683) bm!27456))

(assert (= (and b!389673 res!222922) b!389670))

(assert (= (and b!389670 c!54082) b!389686))

(assert (= (and b!389670 (not c!54082)) b!389681))

(assert (= (and b!389686 res!222919) b!389679))

(assert (= (or b!389686 b!389681) bm!27453))

(declare-fun b_lambda!8625 () Bool)

(assert (=> (not b_lambda!8625) (not b!389669)))

(assert (=> b!389669 t!11387))

(declare-fun b_and!16231 () Bool)

(assert (= b_and!16229 (and (=> t!11387 result!5717) b_and!16231)))

(assert (=> b!389672 m!386073))

(assert (=> b!389672 m!386073))

(assert (=> b!389672 m!386079))

(declare-fun m!386111 () Bool)

(assert (=> bm!27455 m!386111))

(declare-fun m!386113 () Bool)

(assert (=> b!389679 m!386113))

(declare-fun m!386115 () Bool)

(assert (=> bm!27456 m!386115))

(assert (=> bm!27454 m!385839))

(declare-fun m!386117 () Bool)

(assert (=> b!389674 m!386117))

(declare-fun m!386119 () Bool)

(assert (=> bm!27453 m!386119))

(assert (=> b!389668 m!386073))

(assert (=> b!389668 m!386073))

(assert (=> b!389668 m!386079))

(declare-fun m!386121 () Bool)

(assert (=> b!389688 m!386121))

(assert (=> b!389684 m!386073))

(assert (=> b!389684 m!386073))

(declare-fun m!386123 () Bool)

(assert (=> b!389684 m!386123))

(declare-fun m!386125 () Bool)

(assert (=> b!389682 m!386125))

(declare-fun m!386127 () Bool)

(assert (=> b!389682 m!386127))

(declare-fun m!386129 () Bool)

(assert (=> b!389682 m!386129))

(declare-fun m!386131 () Bool)

(assert (=> b!389682 m!386131))

(declare-fun m!386133 () Bool)

(assert (=> b!389682 m!386133))

(declare-fun m!386135 () Bool)

(assert (=> b!389682 m!386135))

(declare-fun m!386137 () Bool)

(assert (=> b!389682 m!386137))

(declare-fun m!386139 () Bool)

(assert (=> b!389682 m!386139))

(declare-fun m!386141 () Bool)

(assert (=> b!389682 m!386141))

(declare-fun m!386143 () Bool)

(assert (=> b!389682 m!386143))

(assert (=> b!389682 m!386137))

(declare-fun m!386145 () Bool)

(assert (=> b!389682 m!386145))

(declare-fun m!386147 () Bool)

(assert (=> b!389682 m!386147))

(assert (=> b!389682 m!386073))

(assert (=> b!389682 m!385839))

(assert (=> b!389682 m!386127))

(assert (=> b!389682 m!386139))

(declare-fun m!386149 () Bool)

(assert (=> b!389682 m!386149))

(declare-fun m!386151 () Bool)

(assert (=> b!389682 m!386151))

(assert (=> b!389682 m!386131))

(declare-fun m!386153 () Bool)

(assert (=> b!389682 m!386153))

(declare-fun m!386155 () Bool)

(assert (=> b!389669 m!386155))

(assert (=> b!389669 m!386097))

(declare-fun m!386157 () Bool)

(assert (=> b!389669 m!386157))

(assert (=> b!389669 m!386073))

(declare-fun m!386159 () Bool)

(assert (=> b!389669 m!386159))

(assert (=> b!389669 m!386097))

(assert (=> b!389669 m!386073))

(assert (=> b!389669 m!386155))

(assert (=> d!72971 m!385861))

(assert (=> b!389464 d!72971))

(declare-fun b!389689 () Bool)

(declare-fun e!236083 () Bool)

(assert (=> b!389689 (= e!236083 (validKeyInArray!0 (select (arr!11008 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun e!236088 () Bool)

(declare-fun b!389690 () Bool)

(declare-fun lt!183390 () ListLongMap!5295)

(assert (=> b!389690 (= e!236088 (= (apply!300 lt!183390 (select (arr!11008 _keys!658) #b00000000000000000000000000000000)) (get!5580 (select (arr!11007 _values!506) #b00000000000000000000000000000000) (dynLambda!643 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!389690 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11359 _values!506)))))

(assert (=> b!389690 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11360 _keys!658)))))

(declare-fun b!389691 () Bool)

(declare-fun e!236090 () Bool)

(declare-fun e!236082 () Bool)

(assert (=> b!389691 (= e!236090 e!236082)))

(declare-fun c!54088 () Bool)

(assert (=> b!389691 (= c!54088 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!389692 () Bool)

(declare-fun e!236092 () ListLongMap!5295)

(declare-fun call!27467 () ListLongMap!5295)

(assert (=> b!389692 (= e!236092 call!27467)))

(declare-fun bm!27458 () Bool)

(declare-fun call!27462 () ListLongMap!5295)

(assert (=> bm!27458 (= call!27467 call!27462)))

(declare-fun b!389693 () Bool)

(declare-fun e!236087 () Bool)

(assert (=> b!389693 (= e!236087 (validKeyInArray!0 (select (arr!11008 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!389694 () Bool)

(declare-fun res!222931 () Bool)

(assert (=> b!389694 (=> (not res!222931) (not e!236090))))

(declare-fun e!236091 () Bool)

(assert (=> b!389694 (= res!222931 e!236091)))

(declare-fun c!54090 () Bool)

(assert (=> b!389694 (= c!54090 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!389695 () Bool)

(declare-fun e!236084 () Bool)

(assert (=> b!389695 (= e!236084 (= (apply!300 lt!183390 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun bm!27459 () Bool)

(declare-fun call!27464 () ListLongMap!5295)

(declare-fun call!27463 () ListLongMap!5295)

(assert (=> bm!27459 (= call!27464 call!27463)))

(declare-fun b!389696 () Bool)

(declare-fun e!236081 () Unit!11903)

(declare-fun Unit!11910 () Unit!11903)

(assert (=> b!389696 (= e!236081 Unit!11910)))

(declare-fun b!389697 () Bool)

(declare-fun res!222929 () Bool)

(assert (=> b!389697 (=> (not res!222929) (not e!236090))))

(declare-fun e!236085 () Bool)

(assert (=> b!389697 (= res!222929 e!236085)))

(declare-fun res!222933 () Bool)

(assert (=> b!389697 (=> res!222933 e!236085)))

(assert (=> b!389697 (= res!222933 (not e!236083))))

(declare-fun res!222935 () Bool)

(assert (=> b!389697 (=> (not res!222935) (not e!236083))))

(assert (=> b!389697 (= res!222935 (bvslt #b00000000000000000000000000000000 (size!11360 _keys!658)))))

(declare-fun b!389698 () Bool)

(assert (=> b!389698 (= e!236091 e!236084)))

(declare-fun res!222934 () Bool)

(declare-fun call!27461 () Bool)

(assert (=> b!389698 (= res!222934 call!27461)))

(assert (=> b!389698 (=> (not res!222934) (not e!236084))))

(declare-fun b!389699 () Bool)

(assert (=> b!389699 (= e!236092 call!27464)))

(declare-fun b!389700 () Bool)

(declare-fun e!236080 () Bool)

(assert (=> b!389700 (= e!236080 (= (apply!300 lt!183390 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!389701 () Bool)

(declare-fun e!236086 () ListLongMap!5295)

(declare-fun e!236089 () ListLongMap!5295)

(assert (=> b!389701 (= e!236086 e!236089)))

(declare-fun c!54089 () Bool)

(assert (=> b!389701 (= c!54089 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!27466 () ListLongMap!5295)

(declare-fun bm!27461 () Bool)

(assert (=> bm!27461 (= call!27466 (getCurrentListMapNoExtraKeys!936 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!389702 () Bool)

(declare-fun call!27465 () Bool)

(assert (=> b!389702 (= e!236082 (not call!27465))))

(declare-fun b!389703 () Bool)

(declare-fun lt!183405 () Unit!11903)

(assert (=> b!389703 (= e!236081 lt!183405)))

(declare-fun lt!183401 () ListLongMap!5295)

(assert (=> b!389703 (= lt!183401 (getCurrentListMapNoExtraKeys!936 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183400 () (_ BitVec 64))

(assert (=> b!389703 (= lt!183400 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183404 () (_ BitVec 64))

(assert (=> b!389703 (= lt!183404 (select (arr!11008 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!183403 () Unit!11903)

(assert (=> b!389703 (= lt!183403 (addStillContains!276 lt!183401 lt!183400 zeroValue!472 lt!183404))))

(assert (=> b!389703 (contains!2428 (+!1017 lt!183401 (tuple2!6381 lt!183400 zeroValue!472)) lt!183404)))

(declare-fun lt!183396 () Unit!11903)

(assert (=> b!389703 (= lt!183396 lt!183403)))

(declare-fun lt!183391 () ListLongMap!5295)

(assert (=> b!389703 (= lt!183391 (getCurrentListMapNoExtraKeys!936 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183392 () (_ BitVec 64))

(assert (=> b!389703 (= lt!183392 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183388 () (_ BitVec 64))

(assert (=> b!389703 (= lt!183388 (select (arr!11008 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!183407 () Unit!11903)

(assert (=> b!389703 (= lt!183407 (addApplyDifferent!276 lt!183391 lt!183392 minValue!472 lt!183388))))

(assert (=> b!389703 (= (apply!300 (+!1017 lt!183391 (tuple2!6381 lt!183392 minValue!472)) lt!183388) (apply!300 lt!183391 lt!183388))))

(declare-fun lt!183395 () Unit!11903)

(assert (=> b!389703 (= lt!183395 lt!183407)))

(declare-fun lt!183397 () ListLongMap!5295)

(assert (=> b!389703 (= lt!183397 (getCurrentListMapNoExtraKeys!936 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183393 () (_ BitVec 64))

(assert (=> b!389703 (= lt!183393 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183406 () (_ BitVec 64))

(assert (=> b!389703 (= lt!183406 (select (arr!11008 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!183386 () Unit!11903)

(assert (=> b!389703 (= lt!183386 (addApplyDifferent!276 lt!183397 lt!183393 zeroValue!472 lt!183406))))

(assert (=> b!389703 (= (apply!300 (+!1017 lt!183397 (tuple2!6381 lt!183393 zeroValue!472)) lt!183406) (apply!300 lt!183397 lt!183406))))

(declare-fun lt!183387 () Unit!11903)

(assert (=> b!389703 (= lt!183387 lt!183386)))

(declare-fun lt!183402 () ListLongMap!5295)

(assert (=> b!389703 (= lt!183402 (getCurrentListMapNoExtraKeys!936 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183398 () (_ BitVec 64))

(assert (=> b!389703 (= lt!183398 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183389 () (_ BitVec 64))

(assert (=> b!389703 (= lt!183389 (select (arr!11008 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!389703 (= lt!183405 (addApplyDifferent!276 lt!183402 lt!183398 minValue!472 lt!183389))))

(assert (=> b!389703 (= (apply!300 (+!1017 lt!183402 (tuple2!6381 lt!183398 minValue!472)) lt!183389) (apply!300 lt!183402 lt!183389))))

(declare-fun bm!27462 () Bool)

(declare-fun c!54091 () Bool)

(assert (=> bm!27462 (= call!27462 (+!1017 (ite c!54091 call!27466 (ite c!54089 call!27463 call!27464)) (ite (or c!54091 c!54089) (tuple2!6381 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!389704 () Bool)

(assert (=> b!389704 (= e!236091 (not call!27461))))

(declare-fun d!72973 () Bool)

(assert (=> d!72973 e!236090))

(declare-fun res!222932 () Bool)

(assert (=> d!72973 (=> (not res!222932) (not e!236090))))

(assert (=> d!72973 (= res!222932 (or (bvsge #b00000000000000000000000000000000 (size!11360 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11360 _keys!658)))))))

(declare-fun lt!183399 () ListLongMap!5295)

(assert (=> d!72973 (= lt!183390 lt!183399)))

(declare-fun lt!183394 () Unit!11903)

(assert (=> d!72973 (= lt!183394 e!236081)))

(declare-fun c!54093 () Bool)

(assert (=> d!72973 (= c!54093 e!236087)))

(declare-fun res!222927 () Bool)

(assert (=> d!72973 (=> (not res!222927) (not e!236087))))

(assert (=> d!72973 (= res!222927 (bvslt #b00000000000000000000000000000000 (size!11360 _keys!658)))))

(assert (=> d!72973 (= lt!183399 e!236086)))

(assert (=> d!72973 (= c!54091 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72973 (validMask!0 mask!970)))

(assert (=> d!72973 (= (getCurrentListMap!2047 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!183390)))

(declare-fun bm!27460 () Bool)

(assert (=> bm!27460 (= call!27465 (contains!2428 lt!183390 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!389705 () Bool)

(assert (=> b!389705 (= e!236085 e!236088)))

(declare-fun res!222930 () Bool)

(assert (=> b!389705 (=> (not res!222930) (not e!236088))))

(assert (=> b!389705 (= res!222930 (contains!2428 lt!183390 (select (arr!11008 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!389705 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11360 _keys!658)))))

(declare-fun b!389706 () Bool)

(declare-fun c!54092 () Bool)

(assert (=> b!389706 (= c!54092 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!389706 (= e!236089 e!236092)))

(declare-fun b!389707 () Bool)

(assert (=> b!389707 (= e!236082 e!236080)))

(declare-fun res!222928 () Bool)

(assert (=> b!389707 (= res!222928 call!27465)))

(assert (=> b!389707 (=> (not res!222928) (not e!236080))))

(declare-fun b!389708 () Bool)

(assert (=> b!389708 (= e!236089 call!27467)))

(declare-fun bm!27463 () Bool)

(assert (=> bm!27463 (= call!27461 (contains!2428 lt!183390 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27464 () Bool)

(assert (=> bm!27464 (= call!27463 call!27466)))

(declare-fun b!389709 () Bool)

(assert (=> b!389709 (= e!236086 (+!1017 call!27462 (tuple2!6381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(assert (= (and d!72973 c!54091) b!389709))

(assert (= (and d!72973 (not c!54091)) b!389701))

(assert (= (and b!389701 c!54089) b!389708))

(assert (= (and b!389701 (not c!54089)) b!389706))

(assert (= (and b!389706 c!54092) b!389692))

(assert (= (and b!389706 (not c!54092)) b!389699))

(assert (= (or b!389692 b!389699) bm!27459))

(assert (= (or b!389708 bm!27459) bm!27464))

(assert (= (or b!389708 b!389692) bm!27458))

(assert (= (or b!389709 bm!27464) bm!27461))

(assert (= (or b!389709 bm!27458) bm!27462))

(assert (= (and d!72973 res!222927) b!389693))

(assert (= (and d!72973 c!54093) b!389703))

(assert (= (and d!72973 (not c!54093)) b!389696))

(assert (= (and d!72973 res!222932) b!389697))

(assert (= (and b!389697 res!222935) b!389689))

(assert (= (and b!389697 (not res!222933)) b!389705))

(assert (= (and b!389705 res!222930) b!389690))

(assert (= (and b!389697 res!222929) b!389694))

(assert (= (and b!389694 c!54090) b!389698))

(assert (= (and b!389694 (not c!54090)) b!389704))

(assert (= (and b!389698 res!222934) b!389695))

(assert (= (or b!389698 b!389704) bm!27463))

(assert (= (and b!389694 res!222931) b!389691))

(assert (= (and b!389691 c!54088) b!389707))

(assert (= (and b!389691 (not c!54088)) b!389702))

(assert (= (and b!389707 res!222928) b!389700))

(assert (= (or b!389707 b!389702) bm!27460))

(declare-fun b_lambda!8627 () Bool)

(assert (=> (not b_lambda!8627) (not b!389690)))

(assert (=> b!389690 t!11387))

(declare-fun b_and!16233 () Bool)

(assert (= b_and!16231 (and (=> t!11387 result!5717) b_and!16233)))

(assert (=> b!389693 m!386085))

(assert (=> b!389693 m!386085))

(assert (=> b!389693 m!386105))

(declare-fun m!386161 () Bool)

(assert (=> bm!27462 m!386161))

(declare-fun m!386163 () Bool)

(assert (=> b!389700 m!386163))

(declare-fun m!386165 () Bool)

(assert (=> bm!27463 m!386165))

(assert (=> bm!27461 m!385829))

(declare-fun m!386167 () Bool)

(assert (=> b!389695 m!386167))

(declare-fun m!386169 () Bool)

(assert (=> bm!27460 m!386169))

(assert (=> b!389689 m!386085))

(assert (=> b!389689 m!386085))

(assert (=> b!389689 m!386105))

(declare-fun m!386171 () Bool)

(assert (=> b!389709 m!386171))

(assert (=> b!389705 m!386085))

(assert (=> b!389705 m!386085))

(declare-fun m!386173 () Bool)

(assert (=> b!389705 m!386173))

(declare-fun m!386175 () Bool)

(assert (=> b!389703 m!386175))

(declare-fun m!386177 () Bool)

(assert (=> b!389703 m!386177))

(declare-fun m!386179 () Bool)

(assert (=> b!389703 m!386179))

(declare-fun m!386181 () Bool)

(assert (=> b!389703 m!386181))

(declare-fun m!386183 () Bool)

(assert (=> b!389703 m!386183))

(declare-fun m!386185 () Bool)

(assert (=> b!389703 m!386185))

(declare-fun m!386187 () Bool)

(assert (=> b!389703 m!386187))

(declare-fun m!386189 () Bool)

(assert (=> b!389703 m!386189))

(declare-fun m!386191 () Bool)

(assert (=> b!389703 m!386191))

(declare-fun m!386193 () Bool)

(assert (=> b!389703 m!386193))

(assert (=> b!389703 m!386187))

(declare-fun m!386195 () Bool)

(assert (=> b!389703 m!386195))

(declare-fun m!386197 () Bool)

(assert (=> b!389703 m!386197))

(assert (=> b!389703 m!386085))

(assert (=> b!389703 m!385829))

(assert (=> b!389703 m!386177))

(assert (=> b!389703 m!386189))

(declare-fun m!386199 () Bool)

(assert (=> b!389703 m!386199))

(declare-fun m!386201 () Bool)

(assert (=> b!389703 m!386201))

(assert (=> b!389703 m!386181))

(declare-fun m!386203 () Bool)

(assert (=> b!389703 m!386203))

(assert (=> b!389690 m!386093))

(assert (=> b!389690 m!386097))

(assert (=> b!389690 m!386099))

(assert (=> b!389690 m!386085))

(declare-fun m!386205 () Bool)

(assert (=> b!389690 m!386205))

(assert (=> b!389690 m!386097))

(assert (=> b!389690 m!386085))

(assert (=> b!389690 m!386093))

(assert (=> d!72973 m!385861))

(assert (=> b!389464 d!72973))

(declare-fun e!236098 () Bool)

(declare-fun b!389716 () Bool)

(declare-fun call!27472 () ListLongMap!5295)

(declare-fun call!27473 () ListLongMap!5295)

(assert (=> b!389716 (= e!236098 (= call!27473 (+!1017 call!27472 (tuple2!6381 k0!778 v!373))))))

(declare-fun b!389717 () Bool)

(declare-fun e!236097 () Bool)

(assert (=> b!389717 (= e!236097 e!236098)))

(declare-fun c!54096 () Bool)

(assert (=> b!389717 (= c!54096 (bvsle #b00000000000000000000000000000000 i!548))))

(declare-fun b!389718 () Bool)

(assert (=> b!389718 (= e!236098 (= call!27473 call!27472))))

(declare-fun bm!27469 () Bool)

(assert (=> bm!27469 (= call!27472 (getCurrentListMapNoExtraKeys!936 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun d!72975 () Bool)

(assert (=> d!72975 e!236097))

(declare-fun res!222938 () Bool)

(assert (=> d!72975 (=> (not res!222938) (not e!236097))))

(assert (=> d!72975 (= res!222938 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11360 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11359 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11360 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11359 _values!506))))))))

(declare-fun lt!183410 () Unit!11903)

(declare-fun choose!1322 (array!23086 array!23084 (_ BitVec 32) (_ BitVec 32) V!13907 V!13907 (_ BitVec 32) (_ BitVec 64) V!13907 (_ BitVec 32) Int) Unit!11903)

(assert (=> d!72975 (= lt!183410 (choose!1322 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!72975 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11360 _keys!658)))))

(assert (=> d!72975 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!238 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!183410)))

(declare-fun bm!27470 () Bool)

(assert (=> bm!27470 (= call!27473 (getCurrentListMapNoExtraKeys!936 (array!23087 (store (arr!11008 _keys!658) i!548 k0!778) (size!11360 _keys!658)) (array!23085 (store (arr!11007 _values!506) i!548 (ValueCellFull!4457 v!373)) (size!11359 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and d!72975 res!222938) b!389717))

(assert (= (and b!389717 c!54096) b!389716))

(assert (= (and b!389717 (not c!54096)) b!389718))

(assert (= (or b!389716 b!389718) bm!27469))

(assert (= (or b!389716 b!389718) bm!27470))

(declare-fun m!386207 () Bool)

(assert (=> b!389716 m!386207))

(assert (=> bm!27469 m!385829))

(declare-fun m!386209 () Bool)

(assert (=> d!72975 m!386209))

(assert (=> bm!27470 m!385825))

(assert (=> bm!27470 m!385837))

(declare-fun m!386211 () Bool)

(assert (=> bm!27470 m!386211))

(assert (=> b!389464 d!72975))

(declare-fun b!389719 () Bool)

(declare-fun e!236103 () Bool)

(declare-fun e!236102 () Bool)

(assert (=> b!389719 (= e!236103 e!236102)))

(assert (=> b!389719 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11360 lt!183168)))))

(declare-fun res!222940 () Bool)

(declare-fun lt!183411 () ListLongMap!5295)

(assert (=> b!389719 (= res!222940 (contains!2428 lt!183411 (select (arr!11008 lt!183168) #b00000000000000000000000000000000)))))

(assert (=> b!389719 (=> (not res!222940) (not e!236102))))

(declare-fun b!389720 () Bool)

(declare-fun e!236100 () Bool)

(assert (=> b!389720 (= e!236103 e!236100)))

(declare-fun c!54097 () Bool)

(assert (=> b!389720 (= c!54097 (bvslt #b00000000000000000000000000000000 (size!11360 lt!183168)))))

(declare-fun b!389721 () Bool)

(declare-fun res!222941 () Bool)

(declare-fun e!236099 () Bool)

(assert (=> b!389721 (=> (not res!222941) (not e!236099))))

(assert (=> b!389721 (= res!222941 (not (contains!2428 lt!183411 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!389722 () Bool)

(declare-fun e!236101 () ListLongMap!5295)

(declare-fun e!236104 () ListLongMap!5295)

(assert (=> b!389722 (= e!236101 e!236104)))

(declare-fun c!54098 () Bool)

(assert (=> b!389722 (= c!54098 (validKeyInArray!0 (select (arr!11008 lt!183168) #b00000000000000000000000000000000)))))

(declare-fun d!72977 () Bool)

(assert (=> d!72977 e!236099))

(declare-fun res!222942 () Bool)

(assert (=> d!72977 (=> (not res!222942) (not e!236099))))

(assert (=> d!72977 (= res!222942 (not (contains!2428 lt!183411 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72977 (= lt!183411 e!236101)))

(declare-fun c!54100 () Bool)

(assert (=> d!72977 (= c!54100 (bvsge #b00000000000000000000000000000000 (size!11360 lt!183168)))))

(assert (=> d!72977 (validMask!0 mask!970)))

(assert (=> d!72977 (= (getCurrentListMapNoExtraKeys!936 lt!183168 lt!183173 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!183411)))

(declare-fun b!389723 () Bool)

(declare-fun lt!183412 () Unit!11903)

(declare-fun lt!183414 () Unit!11903)

(assert (=> b!389723 (= lt!183412 lt!183414)))

(declare-fun lt!183413 () (_ BitVec 64))

(declare-fun lt!183416 () V!13907)

(declare-fun lt!183415 () ListLongMap!5295)

(declare-fun lt!183417 () (_ BitVec 64))

(assert (=> b!389723 (not (contains!2428 (+!1017 lt!183415 (tuple2!6381 lt!183417 lt!183416)) lt!183413))))

(assert (=> b!389723 (= lt!183414 (addStillNotContains!135 lt!183415 lt!183417 lt!183416 lt!183413))))

(assert (=> b!389723 (= lt!183413 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!389723 (= lt!183416 (get!5580 (select (arr!11007 lt!183173) #b00000000000000000000000000000000) (dynLambda!643 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!389723 (= lt!183417 (select (arr!11008 lt!183168) #b00000000000000000000000000000000))))

(declare-fun call!27474 () ListLongMap!5295)

(assert (=> b!389723 (= lt!183415 call!27474)))

(assert (=> b!389723 (= e!236104 (+!1017 call!27474 (tuple2!6381 (select (arr!11008 lt!183168) #b00000000000000000000000000000000) (get!5580 (select (arr!11007 lt!183173) #b00000000000000000000000000000000) (dynLambda!643 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!389724 () Bool)

(assert (=> b!389724 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11360 lt!183168)))))

(assert (=> b!389724 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11359 lt!183173)))))

(assert (=> b!389724 (= e!236102 (= (apply!300 lt!183411 (select (arr!11008 lt!183168) #b00000000000000000000000000000000)) (get!5580 (select (arr!11007 lt!183173) #b00000000000000000000000000000000) (dynLambda!643 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!389725 () Bool)

(assert (=> b!389725 (= e!236100 (isEmpty!552 lt!183411))))

(declare-fun b!389726 () Bool)

(assert (=> b!389726 (= e!236100 (= lt!183411 (getCurrentListMapNoExtraKeys!936 lt!183168 lt!183173 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun bm!27471 () Bool)

(assert (=> bm!27471 (= call!27474 (getCurrentListMapNoExtraKeys!936 lt!183168 lt!183173 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!389727 () Bool)

(declare-fun e!236105 () Bool)

(assert (=> b!389727 (= e!236105 (validKeyInArray!0 (select (arr!11008 lt!183168) #b00000000000000000000000000000000)))))

(assert (=> b!389727 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!389728 () Bool)

(assert (=> b!389728 (= e!236104 call!27474)))

(declare-fun b!389729 () Bool)

(assert (=> b!389729 (= e!236099 e!236103)))

(declare-fun c!54099 () Bool)

(assert (=> b!389729 (= c!54099 e!236105)))

(declare-fun res!222939 () Bool)

(assert (=> b!389729 (=> (not res!222939) (not e!236105))))

(assert (=> b!389729 (= res!222939 (bvslt #b00000000000000000000000000000000 (size!11360 lt!183168)))))

(declare-fun b!389730 () Bool)

(assert (=> b!389730 (= e!236101 (ListLongMap!5296 Nil!6229))))

(assert (= (and d!72977 c!54100) b!389730))

(assert (= (and d!72977 (not c!54100)) b!389722))

(assert (= (and b!389722 c!54098) b!389723))

(assert (= (and b!389722 (not c!54098)) b!389728))

(assert (= (or b!389723 b!389728) bm!27471))

(assert (= (and d!72977 res!222942) b!389721))

(assert (= (and b!389721 res!222941) b!389729))

(assert (= (and b!389729 res!222939) b!389727))

(assert (= (and b!389729 c!54099) b!389719))

(assert (= (and b!389729 (not c!54099)) b!389720))

(assert (= (and b!389719 res!222940) b!389724))

(assert (= (and b!389720 c!54097) b!389726))

(assert (= (and b!389720 (not c!54097)) b!389725))

(declare-fun b_lambda!8629 () Bool)

(assert (=> (not b_lambda!8629) (not b!389723)))

(assert (=> b!389723 t!11387))

(declare-fun b_and!16235 () Bool)

(assert (= b_and!16233 (and (=> t!11387 result!5717) b_and!16235)))

(declare-fun b_lambda!8631 () Bool)

(assert (=> (not b_lambda!8631) (not b!389724)))

(assert (=> b!389724 t!11387))

(declare-fun b_and!16237 () Bool)

(assert (= b_and!16235 (and (=> t!11387 result!5717) b_and!16237)))

(declare-fun m!386213 () Bool)

(assert (=> b!389726 m!386213))

(declare-fun m!386215 () Bool)

(assert (=> b!389725 m!386215))

(assert (=> b!389719 m!386073))

(assert (=> b!389719 m!386073))

(declare-fun m!386217 () Bool)

(assert (=> b!389719 m!386217))

(declare-fun m!386219 () Bool)

(assert (=> b!389721 m!386219))

(assert (=> b!389723 m!386073))

(declare-fun m!386221 () Bool)

(assert (=> b!389723 m!386221))

(assert (=> b!389723 m!386155))

(declare-fun m!386223 () Bool)

(assert (=> b!389723 m!386223))

(assert (=> b!389723 m!386097))

(assert (=> b!389723 m!386155))

(assert (=> b!389723 m!386097))

(assert (=> b!389723 m!386157))

(declare-fun m!386225 () Bool)

(assert (=> b!389723 m!386225))

(assert (=> b!389723 m!386225))

(declare-fun m!386227 () Bool)

(assert (=> b!389723 m!386227))

(assert (=> b!389722 m!386073))

(assert (=> b!389722 m!386073))

(assert (=> b!389722 m!386079))

(assert (=> b!389724 m!386073))

(assert (=> b!389724 m!386155))

(assert (=> b!389724 m!386073))

(declare-fun m!386229 () Bool)

(assert (=> b!389724 m!386229))

(assert (=> b!389724 m!386097))

(assert (=> b!389724 m!386155))

(assert (=> b!389724 m!386097))

(assert (=> b!389724 m!386157))

(assert (=> b!389727 m!386073))

(assert (=> b!389727 m!386073))

(assert (=> b!389727 m!386079))

(declare-fun m!386231 () Bool)

(assert (=> d!72977 m!386231))

(assert (=> d!72977 m!385861))

(assert (=> bm!27471 m!386213))

(assert (=> b!389464 d!72977))

(declare-fun d!72979 () Bool)

(declare-fun e!236106 () Bool)

(assert (=> d!72979 e!236106))

(declare-fun res!222944 () Bool)

(assert (=> d!72979 (=> (not res!222944) (not e!236106))))

(declare-fun lt!183419 () ListLongMap!5295)

(assert (=> d!72979 (= res!222944 (contains!2428 lt!183419 (_1!3201 lt!183164)))))

(declare-fun lt!183420 () List!6232)

(assert (=> d!72979 (= lt!183419 (ListLongMap!5296 lt!183420))))

(declare-fun lt!183421 () Unit!11903)

(declare-fun lt!183418 () Unit!11903)

(assert (=> d!72979 (= lt!183421 lt!183418)))

(assert (=> d!72979 (= (getValueByKey!359 lt!183420 (_1!3201 lt!183164)) (Some!364 (_2!3201 lt!183164)))))

(assert (=> d!72979 (= lt!183418 (lemmaContainsTupThenGetReturnValue!181 lt!183420 (_1!3201 lt!183164) (_2!3201 lt!183164)))))

(assert (=> d!72979 (= lt!183420 (insertStrictlySorted!184 (toList!2663 lt!183163) (_1!3201 lt!183164) (_2!3201 lt!183164)))))

(assert (=> d!72979 (= (+!1017 lt!183163 lt!183164) lt!183419)))

(declare-fun b!389731 () Bool)

(declare-fun res!222943 () Bool)

(assert (=> b!389731 (=> (not res!222943) (not e!236106))))

(assert (=> b!389731 (= res!222943 (= (getValueByKey!359 (toList!2663 lt!183419) (_1!3201 lt!183164)) (Some!364 (_2!3201 lt!183164))))))

(declare-fun b!389732 () Bool)

(assert (=> b!389732 (= e!236106 (contains!2429 (toList!2663 lt!183419) lt!183164))))

(assert (= (and d!72979 res!222944) b!389731))

(assert (= (and b!389731 res!222943) b!389732))

(declare-fun m!386233 () Bool)

(assert (=> d!72979 m!386233))

(declare-fun m!386235 () Bool)

(assert (=> d!72979 m!386235))

(declare-fun m!386237 () Bool)

(assert (=> d!72979 m!386237))

(declare-fun m!386239 () Bool)

(assert (=> d!72979 m!386239))

(declare-fun m!386241 () Bool)

(assert (=> b!389731 m!386241))

(declare-fun m!386243 () Bool)

(assert (=> b!389732 m!386243))

(assert (=> b!389464 d!72979))

(declare-fun bm!27474 () Bool)

(declare-fun call!27477 () Bool)

(assert (=> bm!27474 (= call!27477 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!183168 mask!970))))

(declare-fun d!72981 () Bool)

(declare-fun res!222950 () Bool)

(declare-fun e!236114 () Bool)

(assert (=> d!72981 (=> res!222950 e!236114)))

(assert (=> d!72981 (= res!222950 (bvsge #b00000000000000000000000000000000 (size!11360 lt!183168)))))

(assert (=> d!72981 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!183168 mask!970) e!236114)))

(declare-fun b!389741 () Bool)

(declare-fun e!236113 () Bool)

(assert (=> b!389741 (= e!236113 call!27477)))

(declare-fun b!389742 () Bool)

(declare-fun e!236115 () Bool)

(assert (=> b!389742 (= e!236115 call!27477)))

(declare-fun b!389743 () Bool)

(assert (=> b!389743 (= e!236114 e!236115)))

(declare-fun c!54103 () Bool)

(assert (=> b!389743 (= c!54103 (validKeyInArray!0 (select (arr!11008 lt!183168) #b00000000000000000000000000000000)))))

(declare-fun b!389744 () Bool)

(assert (=> b!389744 (= e!236115 e!236113)))

(declare-fun lt!183430 () (_ BitVec 64))

(assert (=> b!389744 (= lt!183430 (select (arr!11008 lt!183168) #b00000000000000000000000000000000))))

(declare-fun lt!183428 () Unit!11903)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23086 (_ BitVec 64) (_ BitVec 32)) Unit!11903)

(assert (=> b!389744 (= lt!183428 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!183168 lt!183430 #b00000000000000000000000000000000))))

(assert (=> b!389744 (arrayContainsKey!0 lt!183168 lt!183430 #b00000000000000000000000000000000)))

(declare-fun lt!183429 () Unit!11903)

(assert (=> b!389744 (= lt!183429 lt!183428)))

(declare-fun res!222949 () Bool)

(declare-datatypes ((SeekEntryResult!3460 0))(
  ( (MissingZero!3460 (index!16019 (_ BitVec 32))) (Found!3460 (index!16020 (_ BitVec 32))) (Intermediate!3460 (undefined!4272 Bool) (index!16021 (_ BitVec 32)) (x!38195 (_ BitVec 32))) (Undefined!3460) (MissingVacant!3460 (index!16022 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23086 (_ BitVec 32)) SeekEntryResult!3460)

(assert (=> b!389744 (= res!222949 (= (seekEntryOrOpen!0 (select (arr!11008 lt!183168) #b00000000000000000000000000000000) lt!183168 mask!970) (Found!3460 #b00000000000000000000000000000000)))))

(assert (=> b!389744 (=> (not res!222949) (not e!236113))))

(assert (= (and d!72981 (not res!222950)) b!389743))

(assert (= (and b!389743 c!54103) b!389744))

(assert (= (and b!389743 (not c!54103)) b!389742))

(assert (= (and b!389744 res!222949) b!389741))

(assert (= (or b!389741 b!389742) bm!27474))

(declare-fun m!386245 () Bool)

(assert (=> bm!27474 m!386245))

(assert (=> b!389743 m!386073))

(assert (=> b!389743 m!386073))

(assert (=> b!389743 m!386079))

(assert (=> b!389744 m!386073))

(declare-fun m!386247 () Bool)

(assert (=> b!389744 m!386247))

(declare-fun m!386249 () Bool)

(assert (=> b!389744 m!386249))

(assert (=> b!389744 m!386073))

(declare-fun m!386251 () Bool)

(assert (=> b!389744 m!386251))

(assert (=> b!389470 d!72981))

(declare-fun bm!27475 () Bool)

(declare-fun call!27478 () Bool)

(assert (=> bm!27475 (= call!27478 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun d!72983 () Bool)

(declare-fun res!222952 () Bool)

(declare-fun e!236117 () Bool)

(assert (=> d!72983 (=> res!222952 e!236117)))

(assert (=> d!72983 (= res!222952 (bvsge #b00000000000000000000000000000000 (size!11360 _keys!658)))))

(assert (=> d!72983 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!236117)))

(declare-fun b!389745 () Bool)

(declare-fun e!236116 () Bool)

(assert (=> b!389745 (= e!236116 call!27478)))

(declare-fun b!389746 () Bool)

(declare-fun e!236118 () Bool)

(assert (=> b!389746 (= e!236118 call!27478)))

(declare-fun b!389747 () Bool)

(assert (=> b!389747 (= e!236117 e!236118)))

(declare-fun c!54104 () Bool)

(assert (=> b!389747 (= c!54104 (validKeyInArray!0 (select (arr!11008 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!389748 () Bool)

(assert (=> b!389748 (= e!236118 e!236116)))

(declare-fun lt!183433 () (_ BitVec 64))

(assert (=> b!389748 (= lt!183433 (select (arr!11008 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!183431 () Unit!11903)

(assert (=> b!389748 (= lt!183431 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!183433 #b00000000000000000000000000000000))))

(assert (=> b!389748 (arrayContainsKey!0 _keys!658 lt!183433 #b00000000000000000000000000000000)))

(declare-fun lt!183432 () Unit!11903)

(assert (=> b!389748 (= lt!183432 lt!183431)))

(declare-fun res!222951 () Bool)

(assert (=> b!389748 (= res!222951 (= (seekEntryOrOpen!0 (select (arr!11008 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3460 #b00000000000000000000000000000000)))))

(assert (=> b!389748 (=> (not res!222951) (not e!236116))))

(assert (= (and d!72983 (not res!222952)) b!389747))

(assert (= (and b!389747 c!54104) b!389748))

(assert (= (and b!389747 (not c!54104)) b!389746))

(assert (= (and b!389748 res!222951) b!389745))

(assert (= (or b!389745 b!389746) bm!27475))

(declare-fun m!386253 () Bool)

(assert (=> bm!27475 m!386253))

(assert (=> b!389747 m!386085))

(assert (=> b!389747 m!386085))

(assert (=> b!389747 m!386105))

(assert (=> b!389748 m!386085))

(declare-fun m!386255 () Bool)

(assert (=> b!389748 m!386255))

(declare-fun m!386257 () Bool)

(assert (=> b!389748 m!386257))

(assert (=> b!389748 m!386085))

(declare-fun m!386259 () Bool)

(assert (=> b!389748 m!386259))

(assert (=> b!389465 d!72983))

(declare-fun d!72985 () Bool)

(declare-fun res!222953 () Bool)

(declare-fun e!236120 () Bool)

(assert (=> d!72985 (=> res!222953 e!236120)))

(assert (=> d!72985 (= res!222953 (bvsge #b00000000000000000000000000000000 (size!11360 _keys!658)))))

(assert (=> d!72985 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6230) e!236120)))

(declare-fun b!389749 () Bool)

(declare-fun e!236119 () Bool)

(assert (=> b!389749 (= e!236119 (contains!2430 Nil!6230 (select (arr!11008 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27476 () Bool)

(declare-fun call!27479 () Bool)

(declare-fun c!54105 () Bool)

(assert (=> bm!27476 (= call!27479 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54105 (Cons!6229 (select (arr!11008 _keys!658) #b00000000000000000000000000000000) Nil!6230) Nil!6230)))))

(declare-fun b!389750 () Bool)

(declare-fun e!236121 () Bool)

(assert (=> b!389750 (= e!236120 e!236121)))

(declare-fun res!222954 () Bool)

(assert (=> b!389750 (=> (not res!222954) (not e!236121))))

(assert (=> b!389750 (= res!222954 (not e!236119))))

(declare-fun res!222955 () Bool)

(assert (=> b!389750 (=> (not res!222955) (not e!236119))))

(assert (=> b!389750 (= res!222955 (validKeyInArray!0 (select (arr!11008 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!389751 () Bool)

(declare-fun e!236122 () Bool)

(assert (=> b!389751 (= e!236121 e!236122)))

(assert (=> b!389751 (= c!54105 (validKeyInArray!0 (select (arr!11008 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!389752 () Bool)

(assert (=> b!389752 (= e!236122 call!27479)))

(declare-fun b!389753 () Bool)

(assert (=> b!389753 (= e!236122 call!27479)))

(assert (= (and d!72985 (not res!222953)) b!389750))

(assert (= (and b!389750 res!222955) b!389749))

(assert (= (and b!389750 res!222954) b!389751))

(assert (= (and b!389751 c!54105) b!389752))

(assert (= (and b!389751 (not c!54105)) b!389753))

(assert (= (or b!389752 b!389753) bm!27476))

(assert (=> b!389749 m!386085))

(assert (=> b!389749 m!386085))

(declare-fun m!386261 () Bool)

(assert (=> b!389749 m!386261))

(assert (=> bm!27476 m!386085))

(declare-fun m!386263 () Bool)

(assert (=> bm!27476 m!386263))

(assert (=> b!389750 m!386085))

(assert (=> b!389750 m!386085))

(assert (=> b!389750 m!386105))

(assert (=> b!389751 m!386085))

(assert (=> b!389751 m!386085))

(assert (=> b!389751 m!386105))

(assert (=> b!389467 d!72985))

(declare-fun d!72987 () Bool)

(declare-fun res!222960 () Bool)

(declare-fun e!236127 () Bool)

(assert (=> d!72987 (=> res!222960 e!236127)))

(assert (=> d!72987 (= res!222960 (= (select (arr!11008 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!72987 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!236127)))

(declare-fun b!389758 () Bool)

(declare-fun e!236128 () Bool)

(assert (=> b!389758 (= e!236127 e!236128)))

(declare-fun res!222961 () Bool)

(assert (=> b!389758 (=> (not res!222961) (not e!236128))))

(assert (=> b!389758 (= res!222961 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11360 _keys!658)))))

(declare-fun b!389759 () Bool)

(assert (=> b!389759 (= e!236128 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!72987 (not res!222960)) b!389758))

(assert (= (and b!389758 res!222961) b!389759))

(assert (=> d!72987 m!386085))

(declare-fun m!386265 () Bool)

(assert (=> b!389759 m!386265))

(assert (=> b!389461 d!72987))

(declare-fun d!72989 () Bool)

(assert (=> d!72989 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!37878 d!72989))

(declare-fun d!72991 () Bool)

(assert (=> d!72991 (= (array_inv!8138 _values!506) (bvsge (size!11359 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!37878 d!72991))

(declare-fun d!72993 () Bool)

(assert (=> d!72993 (= (array_inv!8139 _keys!658) (bvsge (size!11360 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!37878 d!72993))

(declare-fun d!72995 () Bool)

(assert (=> d!72995 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!389457 d!72995))

(declare-fun mapIsEmpty!15984 () Bool)

(declare-fun mapRes!15984 () Bool)

(assert (=> mapIsEmpty!15984 mapRes!15984))

(declare-fun b!389767 () Bool)

(declare-fun e!236134 () Bool)

(assert (=> b!389767 (= e!236134 tp_is_empty!9601)))

(declare-fun mapNonEmpty!15984 () Bool)

(declare-fun tp!31563 () Bool)

(declare-fun e!236133 () Bool)

(assert (=> mapNonEmpty!15984 (= mapRes!15984 (and tp!31563 e!236133))))

(declare-fun mapRest!15984 () (Array (_ BitVec 32) ValueCell!4457))

(declare-fun mapValue!15984 () ValueCell!4457)

(declare-fun mapKey!15984 () (_ BitVec 32))

(assert (=> mapNonEmpty!15984 (= mapRest!15975 (store mapRest!15984 mapKey!15984 mapValue!15984))))

(declare-fun b!389766 () Bool)

(assert (=> b!389766 (= e!236133 tp_is_empty!9601)))

(declare-fun condMapEmpty!15984 () Bool)

(declare-fun mapDefault!15984 () ValueCell!4457)

(assert (=> mapNonEmpty!15975 (= condMapEmpty!15984 (= mapRest!15975 ((as const (Array (_ BitVec 32) ValueCell!4457)) mapDefault!15984)))))

(assert (=> mapNonEmpty!15975 (= tp!31548 (and e!236134 mapRes!15984))))

(assert (= (and mapNonEmpty!15975 condMapEmpty!15984) mapIsEmpty!15984))

(assert (= (and mapNonEmpty!15975 (not condMapEmpty!15984)) mapNonEmpty!15984))

(assert (= (and mapNonEmpty!15984 ((_ is ValueCellFull!4457) mapValue!15984)) b!389766))

(assert (= (and mapNonEmpty!15975 ((_ is ValueCellFull!4457) mapDefault!15984)) b!389767))

(declare-fun m!386267 () Bool)

(assert (=> mapNonEmpty!15984 m!386267))

(declare-fun b_lambda!8633 () Bool)

(assert (= b_lambda!8631 (or (and start!37878 b_free!8929) b_lambda!8633)))

(declare-fun b_lambda!8635 () Bool)

(assert (= b_lambda!8625 (or (and start!37878 b_free!8929) b_lambda!8635)))

(declare-fun b_lambda!8637 () Bool)

(assert (= b_lambda!8629 (or (and start!37878 b_free!8929) b_lambda!8637)))

(declare-fun b_lambda!8639 () Bool)

(assert (= b_lambda!8623 (or (and start!37878 b_free!8929) b_lambda!8639)))

(declare-fun b_lambda!8641 () Bool)

(assert (= b_lambda!8627 (or (and start!37878 b_free!8929) b_lambda!8641)))

(declare-fun b_lambda!8643 () Bool)

(assert (= b_lambda!8621 (or (and start!37878 b_free!8929) b_lambda!8643)))

(check-sat (not bm!27454) (not b!389617) (not d!72957) (not b!389744) (not bm!27462) (not b_lambda!8633) (not b!389612) (not b!389568) (not d!72975) (not bm!27453) (not bm!27460) (not b!389751) (not b_lambda!8639) (not bm!27461) (not b!389614) (not b!389569) (not b!389620) (not b!389565) (not b!389618) (not bm!27476) (not b_lambda!8641) (not b!389725) (not b!389559) (not b!389564) (not b!389572) (not b!389560) (not b!389716) (not mapNonEmpty!15984) (not d!72971) (not b!389726) (not b!389748) (not b!389567) (not d!72959) (not b!389616) (not b!389669) (not b!389759) (not d!72977) (not b!389750) (not b!389723) (not bm!27433) (not b!389562) (not b!389684) (not b!389749) (not bm!27470) (not b!389570) (not bm!27469) (not b!389690) (not b_lambda!8635) (not bm!27474) (not b!389561) (not b!389719) (not d!72973) (not bm!27463) (not b!389615) (not d!72955) (not b_lambda!8643) (not b!389689) (not b!389668) (not b!389682) (not b!389705) (not d!72953) (not b!389709) (not d!72951) (not d!72961) (not bm!27471) (not b!389674) (not b!389566) (not b!389563) b_and!16237 tp_is_empty!9601 (not d!72979) (not bm!27436) (not b!389583) (not b!389743) (not b!389700) (not b!389732) (not b!389747) (not bm!27455) (not b!389585) (not b!389731) (not b_next!8929) (not b_lambda!8637) (not b!389721) (not b!389679) (not d!72965) (not b!389619) (not b!389727) (not b!389571) (not b!389693) (not b!389695) (not b!389584) (not b!389672) (not b!389703) (not b!389722) (not bm!27456) (not d!72969) (not b!389724) (not d!72963) (not b!389688) (not bm!27475))
(check-sat b_and!16237 (not b_next!8929))
