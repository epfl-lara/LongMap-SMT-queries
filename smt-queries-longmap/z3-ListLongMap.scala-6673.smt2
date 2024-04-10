; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84012 () Bool)

(assert start!84012)

(declare-fun b_free!19767 () Bool)

(declare-fun b_next!19767 () Bool)

(assert (=> start!84012 (= b_free!19767 (not b_next!19767))))

(declare-fun tp!68824 () Bool)

(declare-fun b_and!31617 () Bool)

(assert (=> start!84012 (= tp!68824 b_and!31617)))

(declare-fun b!981964 () Bool)

(declare-fun res!657122 () Bool)

(declare-fun e!553552 () Bool)

(assert (=> b!981964 (=> (not res!657122) (not e!553552))))

(declare-datatypes ((array!61625 0))(
  ( (array!61626 (arr!29670 (Array (_ BitVec 32) (_ BitVec 64))) (size!30149 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61625)

(declare-datatypes ((List!20551 0))(
  ( (Nil!20548) (Cons!20547 (h!21709 (_ BitVec 64)) (t!29268 List!20551)) )
))
(declare-fun arrayNoDuplicates!0 (array!61625 (_ BitVec 32) List!20551) Bool)

(assert (=> b!981964 (= res!657122 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20548))))

(declare-fun mapNonEmpty!36251 () Bool)

(declare-fun mapRes!36251 () Bool)

(declare-fun tp!68823 () Bool)

(declare-fun e!553550 () Bool)

(assert (=> mapNonEmpty!36251 (= mapRes!36251 (and tp!68823 e!553550))))

(declare-datatypes ((V!35403 0))(
  ( (V!35404 (val!11458 Int)) )
))
(declare-datatypes ((ValueCell!10926 0))(
  ( (ValueCellFull!10926 (v!14020 V!35403)) (EmptyCell!10926) )
))
(declare-datatypes ((array!61627 0))(
  ( (array!61628 (arr!29671 (Array (_ BitVec 32) ValueCell!10926)) (size!30150 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61627)

(declare-fun mapValue!36251 () ValueCell!10926)

(declare-fun mapKey!36251 () (_ BitVec 32))

(declare-fun mapRest!36251 () (Array (_ BitVec 32) ValueCell!10926))

(assert (=> mapNonEmpty!36251 (= (arr!29671 _values!1278) (store mapRest!36251 mapKey!36251 mapValue!36251))))

(declare-fun b!981965 () Bool)

(declare-fun e!553551 () Bool)

(declare-fun tp_is_empty!22815 () Bool)

(assert (=> b!981965 (= e!553551 tp_is_empty!22815)))

(declare-fun b!981966 () Bool)

(assert (=> b!981966 (= e!553550 tp_is_empty!22815)))

(declare-fun b!981967 () Bool)

(declare-fun e!553549 () Bool)

(assert (=> b!981967 (= e!553552 e!553549)))

(declare-fun res!657119 () Bool)

(assert (=> b!981967 (=> (not res!657119) (not e!553549))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!981967 (= res!657119 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29670 _keys!1544) from!1932))))))

(declare-fun lt!435932 () V!35403)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15381 (ValueCell!10926 V!35403) V!35403)

(declare-fun dynLambda!1782 (Int (_ BitVec 64)) V!35403)

(assert (=> b!981967 (= lt!435932 (get!15381 (select (arr!29671 _values!1278) from!1932) (dynLambda!1782 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35403)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35403)

(declare-datatypes ((tuple2!14670 0))(
  ( (tuple2!14671 (_1!7346 (_ BitVec 64)) (_2!7346 V!35403)) )
))
(declare-datatypes ((List!20552 0))(
  ( (Nil!20549) (Cons!20548 (h!21710 tuple2!14670) (t!29269 List!20552)) )
))
(declare-datatypes ((ListLongMap!13367 0))(
  ( (ListLongMap!13368 (toList!6699 List!20552)) )
))
(declare-fun lt!435933 () ListLongMap!13367)

(declare-fun getCurrentListMapNoExtraKeys!3399 (array!61625 array!61627 (_ BitVec 32) (_ BitVec 32) V!35403 V!35403 (_ BitVec 32) Int) ListLongMap!13367)

(assert (=> b!981967 (= lt!435933 (getCurrentListMapNoExtraKeys!3399 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!981968 () Bool)

(declare-fun res!657116 () Bool)

(assert (=> b!981968 (=> (not res!657116) (not e!553552))))

(assert (=> b!981968 (= res!657116 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!981969 () Bool)

(declare-fun res!657120 () Bool)

(assert (=> b!981969 (=> (not res!657120) (not e!553552))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981969 (= res!657120 (validKeyInArray!0 (select (arr!29670 _keys!1544) from!1932)))))

(declare-fun b!981970 () Bool)

(declare-fun res!657117 () Bool)

(assert (=> b!981970 (=> (not res!657117) (not e!553552))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61625 (_ BitVec 32)) Bool)

(assert (=> b!981970 (= res!657117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981971 () Bool)

(declare-fun res!657121 () Bool)

(assert (=> b!981971 (=> (not res!657121) (not e!553552))))

(assert (=> b!981971 (= res!657121 (and (= (size!30150 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30149 _keys!1544) (size!30150 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981972 () Bool)

(assert (=> b!981972 (= e!553549 (not true))))

(declare-fun lt!435931 () tuple2!14670)

(declare-fun lt!435934 () tuple2!14670)

(declare-fun +!2998 (ListLongMap!13367 tuple2!14670) ListLongMap!13367)

(assert (=> b!981972 (= (+!2998 (+!2998 lt!435933 lt!435931) lt!435934) (+!2998 (+!2998 lt!435933 lt!435934) lt!435931))))

(assert (=> b!981972 (= lt!435934 (tuple2!14671 (select (arr!29670 _keys!1544) from!1932) lt!435932))))

(assert (=> b!981972 (= lt!435931 (tuple2!14671 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32635 0))(
  ( (Unit!32636) )
))
(declare-fun lt!435935 () Unit!32635)

(declare-fun addCommutativeForDiffKeys!626 (ListLongMap!13367 (_ BitVec 64) V!35403 (_ BitVec 64) V!35403) Unit!32635)

(assert (=> b!981972 (= lt!435935 (addCommutativeForDiffKeys!626 lt!435933 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29670 _keys!1544) from!1932) lt!435932))))

(declare-fun res!657115 () Bool)

(assert (=> start!84012 (=> (not res!657115) (not e!553552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84012 (= res!657115 (validMask!0 mask!1948))))

(assert (=> start!84012 e!553552))

(assert (=> start!84012 true))

(assert (=> start!84012 tp_is_empty!22815))

(declare-fun e!553554 () Bool)

(declare-fun array_inv!22941 (array!61627) Bool)

(assert (=> start!84012 (and (array_inv!22941 _values!1278) e!553554)))

(assert (=> start!84012 tp!68824))

(declare-fun array_inv!22942 (array!61625) Bool)

(assert (=> start!84012 (array_inv!22942 _keys!1544)))

(declare-fun b!981973 () Bool)

(assert (=> b!981973 (= e!553554 (and e!553551 mapRes!36251))))

(declare-fun condMapEmpty!36251 () Bool)

(declare-fun mapDefault!36251 () ValueCell!10926)

(assert (=> b!981973 (= condMapEmpty!36251 (= (arr!29671 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10926)) mapDefault!36251)))))

(declare-fun b!981974 () Bool)

(declare-fun res!657118 () Bool)

(assert (=> b!981974 (=> (not res!657118) (not e!553552))))

(assert (=> b!981974 (= res!657118 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30149 _keys!1544))))))

(declare-fun mapIsEmpty!36251 () Bool)

(assert (=> mapIsEmpty!36251 mapRes!36251))

(assert (= (and start!84012 res!657115) b!981971))

(assert (= (and b!981971 res!657121) b!981970))

(assert (= (and b!981970 res!657117) b!981964))

(assert (= (and b!981964 res!657122) b!981974))

(assert (= (and b!981974 res!657118) b!981969))

(assert (= (and b!981969 res!657120) b!981968))

(assert (= (and b!981968 res!657116) b!981967))

(assert (= (and b!981967 res!657119) b!981972))

(assert (= (and b!981973 condMapEmpty!36251) mapIsEmpty!36251))

(assert (= (and b!981973 (not condMapEmpty!36251)) mapNonEmpty!36251))

(get-info :version)

(assert (= (and mapNonEmpty!36251 ((_ is ValueCellFull!10926) mapValue!36251)) b!981966))

(assert (= (and b!981973 ((_ is ValueCellFull!10926) mapDefault!36251)) b!981965))

(assert (= start!84012 b!981973))

(declare-fun b_lambda!14805 () Bool)

(assert (=> (not b_lambda!14805) (not b!981967)))

(declare-fun t!29267 () Bool)

(declare-fun tb!6567 () Bool)

(assert (=> (and start!84012 (= defaultEntry!1281 defaultEntry!1281) t!29267) tb!6567))

(declare-fun result!13123 () Bool)

(assert (=> tb!6567 (= result!13123 tp_is_empty!22815)))

(assert (=> b!981967 t!29267))

(declare-fun b_and!31619 () Bool)

(assert (= b_and!31617 (and (=> t!29267 result!13123) b_and!31619)))

(declare-fun m!909317 () Bool)

(assert (=> b!981964 m!909317))

(declare-fun m!909319 () Bool)

(assert (=> b!981972 m!909319))

(declare-fun m!909321 () Bool)

(assert (=> b!981972 m!909321))

(declare-fun m!909323 () Bool)

(assert (=> b!981972 m!909323))

(declare-fun m!909325 () Bool)

(assert (=> b!981972 m!909325))

(assert (=> b!981972 m!909319))

(declare-fun m!909327 () Bool)

(assert (=> b!981972 m!909327))

(declare-fun m!909329 () Bool)

(assert (=> b!981972 m!909329))

(assert (=> b!981972 m!909327))

(assert (=> b!981972 m!909323))

(declare-fun m!909331 () Bool)

(assert (=> b!981970 m!909331))

(assert (=> b!981967 m!909323))

(declare-fun m!909333 () Bool)

(assert (=> b!981967 m!909333))

(declare-fun m!909335 () Bool)

(assert (=> b!981967 m!909335))

(declare-fun m!909337 () Bool)

(assert (=> b!981967 m!909337))

(assert (=> b!981967 m!909333))

(assert (=> b!981967 m!909337))

(declare-fun m!909339 () Bool)

(assert (=> b!981967 m!909339))

(assert (=> b!981969 m!909323))

(assert (=> b!981969 m!909323))

(declare-fun m!909341 () Bool)

(assert (=> b!981969 m!909341))

(declare-fun m!909343 () Bool)

(assert (=> mapNonEmpty!36251 m!909343))

(declare-fun m!909345 () Bool)

(assert (=> start!84012 m!909345))

(declare-fun m!909347 () Bool)

(assert (=> start!84012 m!909347))

(declare-fun m!909349 () Bool)

(assert (=> start!84012 m!909349))

(check-sat b_and!31619 (not b!981972) (not b!981970) (not b!981969) (not b!981964) (not start!84012) (not b_lambda!14805) (not b!981967) (not b_next!19767) (not mapNonEmpty!36251) tp_is_empty!22815)
(check-sat b_and!31619 (not b_next!19767))
