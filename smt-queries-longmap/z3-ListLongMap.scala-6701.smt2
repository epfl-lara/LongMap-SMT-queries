; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84346 () Bool)

(assert start!84346)

(declare-fun b_free!19879 () Bool)

(declare-fun b_next!19879 () Bool)

(assert (=> start!84346 (= b_free!19879 (not b_next!19879))))

(declare-fun tp!69242 () Bool)

(declare-fun b_and!31845 () Bool)

(assert (=> start!84346 (= tp!69242 b_and!31845)))

(declare-fun mapNonEmpty!36500 () Bool)

(declare-fun mapRes!36500 () Bool)

(declare-fun tp!69241 () Bool)

(declare-fun e!555539 () Bool)

(assert (=> mapNonEmpty!36500 (= mapRes!36500 (and tp!69241 e!555539))))

(declare-datatypes ((V!35625 0))(
  ( (V!35626 (val!11541 Int)) )
))
(declare-datatypes ((ValueCell!11009 0))(
  ( (ValueCellFull!11009 (v!14100 V!35625)) (EmptyCell!11009) )
))
(declare-datatypes ((array!61980 0))(
  ( (array!61981 (arr!29843 (Array (_ BitVec 32) ValueCell!11009)) (size!30323 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61980)

(declare-fun mapKey!36500 () (_ BitVec 32))

(declare-fun mapRest!36500 () (Array (_ BitVec 32) ValueCell!11009))

(declare-fun mapValue!36500 () ValueCell!11009)

(assert (=> mapNonEmpty!36500 (= (arr!29843 _values!1278) (store mapRest!36500 mapKey!36500 mapValue!36500))))

(declare-fun b!985325 () Bool)

(declare-fun e!555537 () Bool)

(declare-fun e!555536 () Bool)

(assert (=> b!985325 (= e!555537 (and e!555536 mapRes!36500))))

(declare-fun condMapEmpty!36500 () Bool)

(declare-fun mapDefault!36500 () ValueCell!11009)

(assert (=> b!985325 (= condMapEmpty!36500 (= (arr!29843 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11009)) mapDefault!36500)))))

(declare-fun b!985326 () Bool)

(declare-fun tp_is_empty!22981 () Bool)

(assert (=> b!985326 (= e!555536 tp_is_empty!22981)))

(declare-fun b!985327 () Bool)

(declare-fun res!659069 () Bool)

(declare-fun e!555535 () Bool)

(assert (=> b!985327 (=> (not res!659069) (not e!555535))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!985327 (= res!659069 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!985328 () Bool)

(declare-fun res!659065 () Bool)

(assert (=> b!985328 (=> (not res!659065) (not e!555535))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61982 0))(
  ( (array!61983 (arr!29844 (Array (_ BitVec 32) (_ BitVec 64))) (size!30324 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61982)

(assert (=> b!985328 (= res!659065 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30324 _keys!1544))))))

(declare-fun b!985329 () Bool)

(declare-fun res!659066 () Bool)

(assert (=> b!985329 (=> (not res!659066) (not e!555535))))

(declare-datatypes ((List!20662 0))(
  ( (Nil!20659) (Cons!20658 (h!21826 (_ BitVec 64)) (t!29477 List!20662)) )
))
(declare-fun arrayNoDuplicates!0 (array!61982 (_ BitVec 32) List!20662) Bool)

(assert (=> b!985329 (= res!659066 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20659))))

(declare-fun b!985330 () Bool)

(declare-fun res!659071 () Bool)

(assert (=> b!985330 (=> (not res!659071) (not e!555535))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!985330 (= res!659071 (validKeyInArray!0 (select (arr!29844 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!36500 () Bool)

(assert (=> mapIsEmpty!36500 mapRes!36500))

(declare-fun b!985331 () Bool)

(declare-fun e!555540 () Bool)

(assert (=> b!985331 (= e!555540 (not true))))

(declare-datatypes ((tuple2!14782 0))(
  ( (tuple2!14783 (_1!7402 (_ BitVec 64)) (_2!7402 V!35625)) )
))
(declare-datatypes ((List!20663 0))(
  ( (Nil!20660) (Cons!20659 (h!21827 tuple2!14782) (t!29478 List!20663)) )
))
(declare-datatypes ((ListLongMap!13481 0))(
  ( (ListLongMap!13482 (toList!6756 List!20663)) )
))
(declare-fun lt!437170 () ListLongMap!13481)

(declare-fun lt!437172 () tuple2!14782)

(declare-fun lt!437168 () tuple2!14782)

(declare-fun +!3059 (ListLongMap!13481 tuple2!14782) ListLongMap!13481)

(assert (=> b!985331 (= (+!3059 (+!3059 lt!437170 lt!437172) lt!437168) (+!3059 (+!3059 lt!437170 lt!437168) lt!437172))))

(declare-fun lt!437171 () V!35625)

(assert (=> b!985331 (= lt!437168 (tuple2!14783 (select (arr!29844 _keys!1544) from!1932) lt!437171))))

(declare-fun minValue!1220 () V!35625)

(assert (=> b!985331 (= lt!437172 (tuple2!14783 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32698 0))(
  ( (Unit!32699) )
))
(declare-fun lt!437169 () Unit!32698)

(declare-fun addCommutativeForDiffKeys!666 (ListLongMap!13481 (_ BitVec 64) V!35625 (_ BitVec 64) V!35625) Unit!32698)

(assert (=> b!985331 (= lt!437169 (addCommutativeForDiffKeys!666 lt!437170 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29844 _keys!1544) from!1932) lt!437171))))

(declare-fun b!985333 () Bool)

(assert (=> b!985333 (= e!555539 tp_is_empty!22981)))

(declare-fun b!985334 () Bool)

(declare-fun res!659068 () Bool)

(assert (=> b!985334 (=> (not res!659068) (not e!555535))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61982 (_ BitVec 32)) Bool)

(assert (=> b!985334 (= res!659068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985335 () Bool)

(assert (=> b!985335 (= e!555535 e!555540)))

(declare-fun res!659070 () Bool)

(assert (=> b!985335 (=> (not res!659070) (not e!555540))))

(assert (=> b!985335 (= res!659070 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29844 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15507 (ValueCell!11009 V!35625) V!35625)

(declare-fun dynLambda!1848 (Int (_ BitVec 64)) V!35625)

(assert (=> b!985335 (= lt!437171 (get!15507 (select (arr!29843 _values!1278) from!1932) (dynLambda!1848 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35625)

(declare-fun getCurrentListMapNoExtraKeys!3491 (array!61982 array!61980 (_ BitVec 32) (_ BitVec 32) V!35625 V!35625 (_ BitVec 32) Int) ListLongMap!13481)

(assert (=> b!985335 (= lt!437170 (getCurrentListMapNoExtraKeys!3491 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!985332 () Bool)

(declare-fun res!659067 () Bool)

(assert (=> b!985332 (=> (not res!659067) (not e!555535))))

(assert (=> b!985332 (= res!659067 (and (= (size!30323 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30324 _keys!1544) (size!30323 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!659064 () Bool)

(assert (=> start!84346 (=> (not res!659064) (not e!555535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84346 (= res!659064 (validMask!0 mask!1948))))

(assert (=> start!84346 e!555535))

(assert (=> start!84346 true))

(assert (=> start!84346 tp_is_empty!22981))

(declare-fun array_inv!23089 (array!61980) Bool)

(assert (=> start!84346 (and (array_inv!23089 _values!1278) e!555537)))

(assert (=> start!84346 tp!69242))

(declare-fun array_inv!23090 (array!61982) Bool)

(assert (=> start!84346 (array_inv!23090 _keys!1544)))

(assert (= (and start!84346 res!659064) b!985332))

(assert (= (and b!985332 res!659067) b!985334))

(assert (= (and b!985334 res!659068) b!985329))

(assert (= (and b!985329 res!659066) b!985328))

(assert (= (and b!985328 res!659065) b!985330))

(assert (= (and b!985330 res!659071) b!985327))

(assert (= (and b!985327 res!659069) b!985335))

(assert (= (and b!985335 res!659070) b!985331))

(assert (= (and b!985325 condMapEmpty!36500) mapIsEmpty!36500))

(assert (= (and b!985325 (not condMapEmpty!36500)) mapNonEmpty!36500))

(get-info :version)

(assert (= (and mapNonEmpty!36500 ((_ is ValueCellFull!11009) mapValue!36500)) b!985333))

(assert (= (and b!985325 ((_ is ValueCellFull!11009) mapDefault!36500)) b!985326))

(assert (= start!84346 b!985325))

(declare-fun b_lambda!14925 () Bool)

(assert (=> (not b_lambda!14925) (not b!985335)))

(declare-fun t!29476 () Bool)

(declare-fun tb!6665 () Bool)

(assert (=> (and start!84346 (= defaultEntry!1281 defaultEntry!1281) t!29476) tb!6665))

(declare-fun result!13327 () Bool)

(assert (=> tb!6665 (= result!13327 tp_is_empty!22981)))

(assert (=> b!985335 t!29476))

(declare-fun b_and!31847 () Bool)

(assert (= b_and!31845 (and (=> t!29476 result!13327) b_and!31847)))

(declare-fun m!912803 () Bool)

(assert (=> b!985334 m!912803))

(declare-fun m!912805 () Bool)

(assert (=> b!985329 m!912805))

(declare-fun m!912807 () Bool)

(assert (=> b!985335 m!912807))

(declare-fun m!912809 () Bool)

(assert (=> b!985335 m!912809))

(declare-fun m!912811 () Bool)

(assert (=> b!985335 m!912811))

(declare-fun m!912813 () Bool)

(assert (=> b!985335 m!912813))

(assert (=> b!985335 m!912809))

(assert (=> b!985335 m!912813))

(declare-fun m!912815 () Bool)

(assert (=> b!985335 m!912815))

(declare-fun m!912817 () Bool)

(assert (=> start!84346 m!912817))

(declare-fun m!912819 () Bool)

(assert (=> start!84346 m!912819))

(declare-fun m!912821 () Bool)

(assert (=> start!84346 m!912821))

(assert (=> b!985331 m!912807))

(declare-fun m!912823 () Bool)

(assert (=> b!985331 m!912823))

(declare-fun m!912825 () Bool)

(assert (=> b!985331 m!912825))

(declare-fun m!912827 () Bool)

(assert (=> b!985331 m!912827))

(assert (=> b!985331 m!912823))

(assert (=> b!985331 m!912807))

(declare-fun m!912829 () Bool)

(assert (=> b!985331 m!912829))

(assert (=> b!985331 m!912827))

(declare-fun m!912831 () Bool)

(assert (=> b!985331 m!912831))

(assert (=> b!985330 m!912807))

(assert (=> b!985330 m!912807))

(declare-fun m!912833 () Bool)

(assert (=> b!985330 m!912833))

(declare-fun m!912835 () Bool)

(assert (=> mapNonEmpty!36500 m!912835))

(check-sat (not start!84346) tp_is_empty!22981 (not b_next!19879) (not b!985335) (not b!985330) b_and!31847 (not b!985329) (not b_lambda!14925) (not mapNonEmpty!36500) (not b!985334) (not b!985331))
(check-sat b_and!31847 (not b_next!19879))
