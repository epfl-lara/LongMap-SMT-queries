; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83788 () Bool)

(assert start!83788)

(declare-fun b_free!19615 () Bool)

(declare-fun b_next!19615 () Bool)

(assert (=> start!83788 (= b_free!19615 (not b_next!19615))))

(declare-fun tp!68288 () Bool)

(declare-fun b_and!31293 () Bool)

(assert (=> start!83788 (= tp!68288 b_and!31293)))

(declare-fun b!978574 () Bool)

(declare-fun res!654928 () Bool)

(declare-fun e!551646 () Bool)

(assert (=> b!978574 (=> (not res!654928) (not e!551646))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35129 0))(
  ( (V!35130 (val!11355 Int)) )
))
(declare-datatypes ((ValueCell!10823 0))(
  ( (ValueCellFull!10823 (v!13916 V!35129)) (EmptyCell!10823) )
))
(declare-datatypes ((array!61164 0))(
  ( (array!61165 (arr!29440 (Array (_ BitVec 32) ValueCell!10823)) (size!29921 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61164)

(declare-datatypes ((array!61166 0))(
  ( (array!61167 (arr!29441 (Array (_ BitVec 32) (_ BitVec 64))) (size!29922 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61166)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!978574 (= res!654928 (and (= (size!29921 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29922 _keys!1544) (size!29921 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978575 () Bool)

(declare-fun res!654927 () Bool)

(assert (=> b!978575 (=> (not res!654927) (not e!551646))))

(assert (=> b!978575 (= res!654927 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!978576 () Bool)

(declare-fun res!654932 () Bool)

(assert (=> b!978576 (=> (not res!654932) (not e!551646))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978576 (= res!654932 (validKeyInArray!0 (select (arr!29441 _keys!1544) from!1932)))))

(declare-fun mapNonEmpty!35942 () Bool)

(declare-fun mapRes!35942 () Bool)

(declare-fun tp!68287 () Bool)

(declare-fun e!551644 () Bool)

(assert (=> mapNonEmpty!35942 (= mapRes!35942 (and tp!68287 e!551644))))

(declare-fun mapRest!35942 () (Array (_ BitVec 32) ValueCell!10823))

(declare-fun mapKey!35942 () (_ BitVec 32))

(declare-fun mapValue!35942 () ValueCell!10823)

(assert (=> mapNonEmpty!35942 (= (arr!29440 _values!1278) (store mapRest!35942 mapKey!35942 mapValue!35942))))

(declare-fun res!654930 () Bool)

(assert (=> start!83788 (=> (not res!654930) (not e!551646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83788 (= res!654930 (validMask!0 mask!1948))))

(assert (=> start!83788 e!551646))

(assert (=> start!83788 true))

(declare-fun tp_is_empty!22609 () Bool)

(assert (=> start!83788 tp_is_empty!22609))

(declare-fun e!551648 () Bool)

(declare-fun array_inv!22799 (array!61164) Bool)

(assert (=> start!83788 (and (array_inv!22799 _values!1278) e!551648)))

(assert (=> start!83788 tp!68288))

(declare-fun array_inv!22800 (array!61166) Bool)

(assert (=> start!83788 (array_inv!22800 _keys!1544)))

(declare-fun b!978577 () Bool)

(declare-fun e!551645 () Bool)

(assert (=> b!978577 (= e!551645 tp_is_empty!22609)))

(declare-fun mapIsEmpty!35942 () Bool)

(assert (=> mapIsEmpty!35942 mapRes!35942))

(declare-fun b!978578 () Bool)

(declare-fun res!654933 () Bool)

(assert (=> b!978578 (=> (not res!654933) (not e!551646))))

(declare-datatypes ((List!20450 0))(
  ( (Nil!20447) (Cons!20446 (h!21608 (_ BitVec 64)) (t!29012 List!20450)) )
))
(declare-fun arrayNoDuplicates!0 (array!61166 (_ BitVec 32) List!20450) Bool)

(assert (=> b!978578 (= res!654933 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20447))))

(declare-fun b!978579 () Bool)

(assert (=> b!978579 (= e!551646 (not true))))

(declare-datatypes ((tuple2!14624 0))(
  ( (tuple2!14625 (_1!7323 (_ BitVec 64)) (_2!7323 V!35129)) )
))
(declare-datatypes ((List!20451 0))(
  ( (Nil!20448) (Cons!20447 (h!21609 tuple2!14624) (t!29013 List!20451)) )
))
(declare-datatypes ((ListLongMap!13311 0))(
  ( (ListLongMap!13312 (toList!6671 List!20451)) )
))
(declare-fun lt!433712 () ListLongMap!13311)

(declare-fun lt!433713 () tuple2!14624)

(declare-fun lt!433711 () tuple2!14624)

(declare-fun +!2971 (ListLongMap!13311 tuple2!14624) ListLongMap!13311)

(assert (=> b!978579 (= (+!2971 (+!2971 lt!433712 lt!433713) lt!433711) (+!2971 (+!2971 lt!433712 lt!433711) lt!433713))))

(declare-fun lt!433710 () V!35129)

(assert (=> b!978579 (= lt!433711 (tuple2!14625 (select (arr!29441 _keys!1544) from!1932) lt!433710))))

(declare-fun minValue!1220 () V!35129)

(assert (=> b!978579 (= lt!433713 (tuple2!14625 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32408 0))(
  ( (Unit!32409) )
))
(declare-fun lt!433709 () Unit!32408)

(declare-fun addCommutativeForDiffKeys!575 (ListLongMap!13311 (_ BitVec 64) V!35129 (_ BitVec 64) V!35129) Unit!32408)

(assert (=> b!978579 (= lt!433709 (addCommutativeForDiffKeys!575 lt!433712 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29441 _keys!1544) from!1932) lt!433710))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15260 (ValueCell!10823 V!35129) V!35129)

(declare-fun dynLambda!1724 (Int (_ BitVec 64)) V!35129)

(assert (=> b!978579 (= lt!433710 (get!15260 (select (arr!29440 _values!1278) from!1932) (dynLambda!1724 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35129)

(declare-fun getCurrentListMapNoExtraKeys!3391 (array!61166 array!61164 (_ BitVec 32) (_ BitVec 32) V!35129 V!35129 (_ BitVec 32) Int) ListLongMap!13311)

(assert (=> b!978579 (= lt!433712 (+!2971 (getCurrentListMapNoExtraKeys!3391 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14625 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!978580 () Bool)

(declare-fun res!654929 () Bool)

(assert (=> b!978580 (=> (not res!654929) (not e!551646))))

(assert (=> b!978580 (= res!654929 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29922 _keys!1544))))))

(declare-fun b!978581 () Bool)

(assert (=> b!978581 (= e!551644 tp_is_empty!22609)))

(declare-fun b!978582 () Bool)

(declare-fun res!654931 () Bool)

(assert (=> b!978582 (=> (not res!654931) (not e!551646))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61166 (_ BitVec 32)) Bool)

(assert (=> b!978582 (= res!654931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978583 () Bool)

(assert (=> b!978583 (= e!551648 (and e!551645 mapRes!35942))))

(declare-fun condMapEmpty!35942 () Bool)

(declare-fun mapDefault!35942 () ValueCell!10823)

(assert (=> b!978583 (= condMapEmpty!35942 (= (arr!29440 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10823)) mapDefault!35942)))))

(assert (= (and start!83788 res!654930) b!978574))

(assert (= (and b!978574 res!654928) b!978582))

(assert (= (and b!978582 res!654931) b!978578))

(assert (= (and b!978578 res!654933) b!978580))

(assert (= (and b!978580 res!654929) b!978576))

(assert (= (and b!978576 res!654932) b!978575))

(assert (= (and b!978575 res!654927) b!978579))

(assert (= (and b!978583 condMapEmpty!35942) mapIsEmpty!35942))

(assert (= (and b!978583 (not condMapEmpty!35942)) mapNonEmpty!35942))

(get-info :version)

(assert (= (and mapNonEmpty!35942 ((_ is ValueCellFull!10823) mapValue!35942)) b!978581))

(assert (= (and b!978583 ((_ is ValueCellFull!10823) mapDefault!35942)) b!978577))

(assert (= start!83788 b!978583))

(declare-fun b_lambda!14641 () Bool)

(assert (=> (not b_lambda!14641) (not b!978579)))

(declare-fun t!29011 () Bool)

(declare-fun tb!6413 () Bool)

(assert (=> (and start!83788 (= defaultEntry!1281 defaultEntry!1281) t!29011) tb!6413))

(declare-fun result!12823 () Bool)

(assert (=> tb!6413 (= result!12823 tp_is_empty!22609)))

(assert (=> b!978579 t!29011))

(declare-fun b_and!31295 () Bool)

(assert (= b_and!31293 (and (=> t!29011 result!12823) b_and!31295)))

(declare-fun m!905249 () Bool)

(assert (=> b!978579 m!905249))

(declare-fun m!905251 () Bool)

(assert (=> b!978579 m!905251))

(assert (=> b!978579 m!905249))

(declare-fun m!905253 () Bool)

(assert (=> b!978579 m!905253))

(declare-fun m!905255 () Bool)

(assert (=> b!978579 m!905255))

(declare-fun m!905257 () Bool)

(assert (=> b!978579 m!905257))

(declare-fun m!905259 () Bool)

(assert (=> b!978579 m!905259))

(declare-fun m!905261 () Bool)

(assert (=> b!978579 m!905261))

(declare-fun m!905263 () Bool)

(assert (=> b!978579 m!905263))

(assert (=> b!978579 m!905259))

(declare-fun m!905265 () Bool)

(assert (=> b!978579 m!905265))

(assert (=> b!978579 m!905261))

(assert (=> b!978579 m!905255))

(declare-fun m!905267 () Bool)

(assert (=> b!978579 m!905267))

(assert (=> b!978579 m!905251))

(assert (=> b!978579 m!905267))

(declare-fun m!905269 () Bool)

(assert (=> b!978579 m!905269))

(declare-fun m!905271 () Bool)

(assert (=> mapNonEmpty!35942 m!905271))

(declare-fun m!905273 () Bool)

(assert (=> b!978582 m!905273))

(declare-fun m!905275 () Bool)

(assert (=> start!83788 m!905275))

(declare-fun m!905277 () Bool)

(assert (=> start!83788 m!905277))

(declare-fun m!905279 () Bool)

(assert (=> start!83788 m!905279))

(declare-fun m!905281 () Bool)

(assert (=> b!978578 m!905281))

(assert (=> b!978576 m!905249))

(assert (=> b!978576 m!905249))

(declare-fun m!905283 () Bool)

(assert (=> b!978576 m!905283))

(check-sat (not b!978578) b_and!31295 (not b_lambda!14641) (not b!978576) (not b!978579) (not b!978582) (not b_next!19615) tp_is_empty!22609 (not start!83788) (not mapNonEmpty!35942))
(check-sat b_and!31295 (not b_next!19615))
