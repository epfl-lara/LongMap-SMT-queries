; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84394 () Bool)

(assert start!84394)

(declare-fun b_free!19927 () Bool)

(declare-fun b_next!19927 () Bool)

(assert (=> start!84394 (= b_free!19927 (not b_next!19927))))

(declare-fun tp!69385 () Bool)

(declare-fun b_and!31941 () Bool)

(assert (=> start!84394 (= tp!69385 b_and!31941)))

(declare-fun b!986165 () Bool)

(declare-fun res!659643 () Bool)

(declare-fun e!555970 () Bool)

(assert (=> b!986165 (=> (not res!659643) (not e!555970))))

(declare-datatypes ((array!62074 0))(
  ( (array!62075 (arr!29890 (Array (_ BitVec 32) (_ BitVec 64))) (size!30370 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62074)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!986165 (= res!659643 (validKeyInArray!0 (select (arr!29890 _keys!1544) from!1932)))))

(declare-fun b!986166 () Bool)

(declare-fun res!659646 () Bool)

(assert (=> b!986166 (=> (not res!659646) (not e!555970))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986166 (= res!659646 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!659642 () Bool)

(assert (=> start!84394 (=> (not res!659642) (not e!555970))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84394 (= res!659642 (validMask!0 mask!1948))))

(assert (=> start!84394 e!555970))

(assert (=> start!84394 true))

(declare-fun tp_is_empty!23029 () Bool)

(assert (=> start!84394 tp_is_empty!23029))

(declare-datatypes ((V!35689 0))(
  ( (V!35690 (val!11565 Int)) )
))
(declare-datatypes ((ValueCell!11033 0))(
  ( (ValueCellFull!11033 (v!14124 V!35689)) (EmptyCell!11033) )
))
(declare-datatypes ((array!62076 0))(
  ( (array!62077 (arr!29891 (Array (_ BitVec 32) ValueCell!11033)) (size!30371 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62076)

(declare-fun e!555967 () Bool)

(declare-fun array_inv!23121 (array!62076) Bool)

(assert (=> start!84394 (and (array_inv!23121 _values!1278) e!555967)))

(assert (=> start!84394 tp!69385))

(declare-fun array_inv!23122 (array!62074) Bool)

(assert (=> start!84394 (array_inv!23122 _keys!1544)))

(declare-fun b!986167 () Bool)

(declare-fun res!659645 () Bool)

(assert (=> b!986167 (=> (not res!659645) (not e!555970))))

(assert (=> b!986167 (= res!659645 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30370 _keys!1544))))))

(declare-fun b!986168 () Bool)

(declare-fun e!555972 () Bool)

(declare-fun mapRes!36572 () Bool)

(assert (=> b!986168 (= e!555967 (and e!555972 mapRes!36572))))

(declare-fun condMapEmpty!36572 () Bool)

(declare-fun mapDefault!36572 () ValueCell!11033)

(assert (=> b!986168 (= condMapEmpty!36572 (= (arr!29891 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11033)) mapDefault!36572)))))

(declare-fun mapIsEmpty!36572 () Bool)

(assert (=> mapIsEmpty!36572 mapRes!36572))

(declare-fun b!986169 () Bool)

(declare-fun res!659640 () Bool)

(assert (=> b!986169 (=> (not res!659640) (not e!555970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62074 (_ BitVec 32)) Bool)

(assert (=> b!986169 (= res!659640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986170 () Bool)

(declare-fun e!555969 () Bool)

(assert (=> b!986170 (= e!555969 tp_is_empty!23029)))

(declare-fun b!986171 () Bool)

(assert (=> b!986171 (= e!555972 tp_is_empty!23029)))

(declare-fun b!986172 () Bool)

(declare-fun res!659647 () Bool)

(assert (=> b!986172 (=> (not res!659647) (not e!555970))))

(assert (=> b!986172 (= res!659647 (and (= (size!30371 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30370 _keys!1544) (size!30371 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986173 () Bool)

(declare-fun e!555971 () Bool)

(assert (=> b!986173 (= e!555970 e!555971)))

(declare-fun res!659641 () Bool)

(assert (=> b!986173 (=> (not res!659641) (not e!555971))))

(assert (=> b!986173 (= res!659641 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29890 _keys!1544) from!1932))))))

(declare-fun lt!437531 () V!35689)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15538 (ValueCell!11033 V!35689) V!35689)

(declare-fun dynLambda!1863 (Int (_ BitVec 64)) V!35689)

(assert (=> b!986173 (= lt!437531 (get!15538 (select (arr!29891 _values!1278) from!1932) (dynLambda!1863 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35689)

(declare-fun zeroValue!1220 () V!35689)

(declare-datatypes ((tuple2!14816 0))(
  ( (tuple2!14817 (_1!7419 (_ BitVec 64)) (_2!7419 V!35689)) )
))
(declare-datatypes ((List!20696 0))(
  ( (Nil!20693) (Cons!20692 (h!21860 tuple2!14816) (t!29559 List!20696)) )
))
(declare-datatypes ((ListLongMap!13515 0))(
  ( (ListLongMap!13516 (toList!6773 List!20696)) )
))
(declare-fun lt!437530 () ListLongMap!13515)

(declare-fun getCurrentListMapNoExtraKeys!3506 (array!62074 array!62076 (_ BitVec 32) (_ BitVec 32) V!35689 V!35689 (_ BitVec 32) Int) ListLongMap!13515)

(assert (=> b!986173 (= lt!437530 (getCurrentListMapNoExtraKeys!3506 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapNonEmpty!36572 () Bool)

(declare-fun tp!69386 () Bool)

(assert (=> mapNonEmpty!36572 (= mapRes!36572 (and tp!69386 e!555969))))

(declare-fun mapRest!36572 () (Array (_ BitVec 32) ValueCell!11033))

(declare-fun mapValue!36572 () ValueCell!11033)

(declare-fun mapKey!36572 () (_ BitVec 32))

(assert (=> mapNonEmpty!36572 (= (arr!29891 _values!1278) (store mapRest!36572 mapKey!36572 mapValue!36572))))

(declare-fun b!986174 () Bool)

(declare-fun res!659644 () Bool)

(assert (=> b!986174 (=> (not res!659644) (not e!555970))))

(declare-datatypes ((List!20697 0))(
  ( (Nil!20694) (Cons!20693 (h!21861 (_ BitVec 64)) (t!29560 List!20697)) )
))
(declare-fun arrayNoDuplicates!0 (array!62074 (_ BitVec 32) List!20697) Bool)

(assert (=> b!986174 (= res!659644 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20694))))

(declare-fun b!986175 () Bool)

(assert (=> b!986175 (= e!555971 (not true))))

(declare-fun lt!437528 () tuple2!14816)

(declare-fun lt!437529 () tuple2!14816)

(declare-fun +!3074 (ListLongMap!13515 tuple2!14816) ListLongMap!13515)

(assert (=> b!986175 (= (+!3074 (+!3074 lt!437530 lt!437528) lt!437529) (+!3074 (+!3074 lt!437530 lt!437529) lt!437528))))

(assert (=> b!986175 (= lt!437529 (tuple2!14817 (select (arr!29890 _keys!1544) from!1932) lt!437531))))

(assert (=> b!986175 (= lt!437528 (tuple2!14817 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32728 0))(
  ( (Unit!32729) )
))
(declare-fun lt!437532 () Unit!32728)

(declare-fun addCommutativeForDiffKeys!681 (ListLongMap!13515 (_ BitVec 64) V!35689 (_ BitVec 64) V!35689) Unit!32728)

(assert (=> b!986175 (= lt!437532 (addCommutativeForDiffKeys!681 lt!437530 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29890 _keys!1544) from!1932) lt!437531))))

(assert (= (and start!84394 res!659642) b!986172))

(assert (= (and b!986172 res!659647) b!986169))

(assert (= (and b!986169 res!659640) b!986174))

(assert (= (and b!986174 res!659644) b!986167))

(assert (= (and b!986167 res!659645) b!986165))

(assert (= (and b!986165 res!659643) b!986166))

(assert (= (and b!986166 res!659646) b!986173))

(assert (= (and b!986173 res!659641) b!986175))

(assert (= (and b!986168 condMapEmpty!36572) mapIsEmpty!36572))

(assert (= (and b!986168 (not condMapEmpty!36572)) mapNonEmpty!36572))

(get-info :version)

(assert (= (and mapNonEmpty!36572 ((_ is ValueCellFull!11033) mapValue!36572)) b!986170))

(assert (= (and b!986168 ((_ is ValueCellFull!11033) mapDefault!36572)) b!986171))

(assert (= start!84394 b!986168))

(declare-fun b_lambda!14973 () Bool)

(assert (=> (not b_lambda!14973) (not b!986173)))

(declare-fun t!29558 () Bool)

(declare-fun tb!6713 () Bool)

(assert (=> (and start!84394 (= defaultEntry!1281 defaultEntry!1281) t!29558) tb!6713))

(declare-fun result!13423 () Bool)

(assert (=> tb!6713 (= result!13423 tp_is_empty!23029)))

(assert (=> b!986173 t!29558))

(declare-fun b_and!31943 () Bool)

(assert (= b_and!31941 (and (=> t!29558 result!13423) b_and!31943)))

(declare-fun m!913619 () Bool)

(assert (=> b!986169 m!913619))

(declare-fun m!913621 () Bool)

(assert (=> mapNonEmpty!36572 m!913621))

(declare-fun m!913623 () Bool)

(assert (=> b!986165 m!913623))

(assert (=> b!986165 m!913623))

(declare-fun m!913625 () Bool)

(assert (=> b!986165 m!913625))

(declare-fun m!913627 () Bool)

(assert (=> b!986174 m!913627))

(assert (=> b!986175 m!913623))

(declare-fun m!913629 () Bool)

(assert (=> b!986175 m!913629))

(declare-fun m!913631 () Bool)

(assert (=> b!986175 m!913631))

(assert (=> b!986175 m!913623))

(declare-fun m!913633 () Bool)

(assert (=> b!986175 m!913633))

(assert (=> b!986175 m!913629))

(declare-fun m!913635 () Bool)

(assert (=> b!986175 m!913635))

(declare-fun m!913637 () Bool)

(assert (=> b!986175 m!913637))

(assert (=> b!986175 m!913635))

(declare-fun m!913639 () Bool)

(assert (=> start!84394 m!913639))

(declare-fun m!913641 () Bool)

(assert (=> start!84394 m!913641))

(declare-fun m!913643 () Bool)

(assert (=> start!84394 m!913643))

(assert (=> b!986173 m!913623))

(declare-fun m!913645 () Bool)

(assert (=> b!986173 m!913645))

(declare-fun m!913647 () Bool)

(assert (=> b!986173 m!913647))

(declare-fun m!913649 () Bool)

(assert (=> b!986173 m!913649))

(assert (=> b!986173 m!913645))

(assert (=> b!986173 m!913649))

(declare-fun m!913651 () Bool)

(assert (=> b!986173 m!913651))

(check-sat (not mapNonEmpty!36572) (not b!986175) (not b!986165) (not b!986169) (not b!986173) (not b_next!19927) (not b!986174) b_and!31943 (not b_lambda!14973) (not start!84394) tp_is_empty!23029)
(check-sat b_and!31943 (not b_next!19927))
