; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83862 () Bool)

(assert start!83862)

(declare-fun b_free!19671 () Bool)

(declare-fun b_next!19671 () Bool)

(assert (=> start!83862 (= b_free!19671 (not b_next!19671))))

(declare-fun tp!68454 () Bool)

(declare-fun b_and!31431 () Bool)

(assert (=> start!83862 (= tp!68454 b_and!31431)))

(declare-fun b!979786 () Bool)

(declare-fun res!655702 () Bool)

(declare-fun e!552291 () Bool)

(assert (=> b!979786 (=> (not res!655702) (not e!552291))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35203 0))(
  ( (V!35204 (val!11383 Int)) )
))
(declare-datatypes ((ValueCell!10851 0))(
  ( (ValueCellFull!10851 (v!13945 V!35203)) (EmptyCell!10851) )
))
(declare-datatypes ((array!61345 0))(
  ( (array!61346 (arr!29530 (Array (_ BitVec 32) ValueCell!10851)) (size!30009 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61345)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61347 0))(
  ( (array!61348 (arr!29531 (Array (_ BitVec 32) (_ BitVec 64))) (size!30010 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61347)

(assert (=> b!979786 (= res!655702 (and (= (size!30009 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30010 _keys!1544) (size!30009 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!655703 () Bool)

(assert (=> start!83862 (=> (not res!655703) (not e!552291))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83862 (= res!655703 (validMask!0 mask!1948))))

(assert (=> start!83862 e!552291))

(assert (=> start!83862 true))

(declare-fun tp_is_empty!22665 () Bool)

(assert (=> start!83862 tp_is_empty!22665))

(declare-fun e!552294 () Bool)

(declare-fun array_inv!22831 (array!61345) Bool)

(assert (=> start!83862 (and (array_inv!22831 _values!1278) e!552294)))

(assert (=> start!83862 tp!68454))

(declare-fun array_inv!22832 (array!61347) Bool)

(assert (=> start!83862 (array_inv!22832 _keys!1544)))

(declare-fun b!979787 () Bool)

(declare-fun res!655704 () Bool)

(assert (=> b!979787 (=> (not res!655704) (not e!552291))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61347 (_ BitVec 32)) Bool)

(assert (=> b!979787 (= res!655704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!979788 () Bool)

(declare-fun res!655708 () Bool)

(assert (=> b!979788 (=> (not res!655708) (not e!552291))))

(declare-datatypes ((List!20468 0))(
  ( (Nil!20465) (Cons!20464 (h!21626 (_ BitVec 64)) (t!29095 List!20468)) )
))
(declare-fun arrayNoDuplicates!0 (array!61347 (_ BitVec 32) List!20468) Bool)

(assert (=> b!979788 (= res!655708 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20465))))

(declare-fun mapIsEmpty!36026 () Bool)

(declare-fun mapRes!36026 () Bool)

(assert (=> mapIsEmpty!36026 mapRes!36026))

(declare-fun mapNonEmpty!36026 () Bool)

(declare-fun tp!68455 () Bool)

(declare-fun e!552293 () Bool)

(assert (=> mapNonEmpty!36026 (= mapRes!36026 (and tp!68455 e!552293))))

(declare-fun mapRest!36026 () (Array (_ BitVec 32) ValueCell!10851))

(declare-fun mapKey!36026 () (_ BitVec 32))

(declare-fun mapValue!36026 () ValueCell!10851)

(assert (=> mapNonEmpty!36026 (= (arr!29530 _values!1278) (store mapRest!36026 mapKey!36026 mapValue!36026))))

(declare-fun b!979789 () Bool)

(declare-fun e!552292 () Bool)

(assert (=> b!979789 (= e!552292 tp_is_empty!22665)))

(declare-fun b!979790 () Bool)

(assert (=> b!979790 (= e!552294 (and e!552292 mapRes!36026))))

(declare-fun condMapEmpty!36026 () Bool)

(declare-fun mapDefault!36026 () ValueCell!10851)

(assert (=> b!979790 (= condMapEmpty!36026 (= (arr!29530 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10851)) mapDefault!36026)))))

(declare-fun b!979791 () Bool)

(declare-fun res!655709 () Bool)

(assert (=> b!979791 (=> (not res!655709) (not e!552291))))

(assert (=> b!979791 (= res!655709 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!979792 () Bool)

(declare-fun e!552289 () Bool)

(assert (=> b!979792 (= e!552291 (not e!552289))))

(declare-fun res!655705 () Bool)

(assert (=> b!979792 (=> res!655705 e!552289)))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!979792 (= res!655705 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29531 _keys!1544) from!1932)))))

(declare-datatypes ((tuple2!14600 0))(
  ( (tuple2!14601 (_1!7311 (_ BitVec 64)) (_2!7311 V!35203)) )
))
(declare-fun lt!434756 () tuple2!14600)

(declare-datatypes ((List!20469 0))(
  ( (Nil!20466) (Cons!20465 (h!21627 tuple2!14600) (t!29096 List!20469)) )
))
(declare-datatypes ((ListLongMap!13297 0))(
  ( (ListLongMap!13298 (toList!6664 List!20469)) )
))
(declare-fun lt!434755 () ListLongMap!13297)

(declare-fun lt!434757 () ListLongMap!13297)

(declare-fun lt!434751 () tuple2!14600)

(declare-fun +!2969 (ListLongMap!13297 tuple2!14600) ListLongMap!13297)

(assert (=> b!979792 (= (+!2969 lt!434757 lt!434751) (+!2969 lt!434755 lt!434756))))

(declare-fun lt!434759 () ListLongMap!13297)

(assert (=> b!979792 (= lt!434755 (+!2969 lt!434759 lt!434751))))

(declare-fun lt!434750 () V!35203)

(assert (=> b!979792 (= lt!434751 (tuple2!14601 (select (arr!29531 _keys!1544) from!1932) lt!434750))))

(assert (=> b!979792 (= lt!434757 (+!2969 lt!434759 lt!434756))))

(declare-fun minValue!1220 () V!35203)

(assert (=> b!979792 (= lt!434756 (tuple2!14601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32577 0))(
  ( (Unit!32578) )
))
(declare-fun lt!434753 () Unit!32577)

(declare-fun addCommutativeForDiffKeys!597 (ListLongMap!13297 (_ BitVec 64) V!35203 (_ BitVec 64) V!35203) Unit!32577)

(assert (=> b!979792 (= lt!434753 (addCommutativeForDiffKeys!597 lt!434759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29531 _keys!1544) from!1932) lt!434750))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15305 (ValueCell!10851 V!35203) V!35203)

(declare-fun dynLambda!1756 (Int (_ BitVec 64)) V!35203)

(assert (=> b!979792 (= lt!434750 (get!15305 (select (arr!29530 _values!1278) from!1932) (dynLambda!1756 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!434754 () ListLongMap!13297)

(declare-fun lt!434752 () tuple2!14600)

(assert (=> b!979792 (= lt!434759 (+!2969 lt!434754 lt!434752))))

(declare-fun zeroValue!1220 () V!35203)

(assert (=> b!979792 (= lt!434752 (tuple2!14601 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3370 (array!61347 array!61345 (_ BitVec 32) (_ BitVec 32) V!35203 V!35203 (_ BitVec 32) Int) ListLongMap!13297)

(assert (=> b!979792 (= lt!434754 (getCurrentListMapNoExtraKeys!3370 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!979793 () Bool)

(declare-fun res!655707 () Bool)

(assert (=> b!979793 (=> (not res!655707) (not e!552291))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979793 (= res!655707 (validKeyInArray!0 (select (arr!29531 _keys!1544) from!1932)))))

(declare-fun b!979794 () Bool)

(assert (=> b!979794 (= e!552289 (bvsle from!1932 (size!30010 _keys!1544)))))

(assert (=> b!979794 (= lt!434755 (+!2969 (+!2969 lt!434754 lt!434751) lt!434752))))

(declare-fun lt!434758 () Unit!32577)

(assert (=> b!979794 (= lt!434758 (addCommutativeForDiffKeys!597 lt!434754 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29531 _keys!1544) from!1932) lt!434750))))

(declare-fun b!979795 () Bool)

(assert (=> b!979795 (= e!552293 tp_is_empty!22665)))

(declare-fun b!979796 () Bool)

(declare-fun res!655706 () Bool)

(assert (=> b!979796 (=> (not res!655706) (not e!552291))))

(assert (=> b!979796 (= res!655706 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30010 _keys!1544))))))

(assert (= (and start!83862 res!655703) b!979786))

(assert (= (and b!979786 res!655702) b!979787))

(assert (= (and b!979787 res!655704) b!979788))

(assert (= (and b!979788 res!655708) b!979796))

(assert (= (and b!979796 res!655706) b!979793))

(assert (= (and b!979793 res!655707) b!979791))

(assert (= (and b!979791 res!655709) b!979792))

(assert (= (and b!979792 (not res!655705)) b!979794))

(assert (= (and b!979790 condMapEmpty!36026) mapIsEmpty!36026))

(assert (= (and b!979790 (not condMapEmpty!36026)) mapNonEmpty!36026))

(get-info :version)

(assert (= (and mapNonEmpty!36026 ((_ is ValueCellFull!10851) mapValue!36026)) b!979795))

(assert (= (and b!979790 ((_ is ValueCellFull!10851) mapDefault!36026)) b!979789))

(assert (= start!83862 b!979790))

(declare-fun b_lambda!14715 () Bool)

(assert (=> (not b_lambda!14715) (not b!979792)))

(declare-fun t!29094 () Bool)

(declare-fun tb!6477 () Bool)

(assert (=> (and start!83862 (= defaultEntry!1281 defaultEntry!1281) t!29094) tb!6477))

(declare-fun result!12943 () Bool)

(assert (=> tb!6477 (= result!12943 tp_is_empty!22665)))

(assert (=> b!979792 t!29094))

(declare-fun b_and!31433 () Bool)

(assert (= b_and!31431 (and (=> t!29094 result!12943) b_and!31433)))

(declare-fun m!907165 () Bool)

(assert (=> mapNonEmpty!36026 m!907165))

(declare-fun m!907167 () Bool)

(assert (=> start!83862 m!907167))

(declare-fun m!907169 () Bool)

(assert (=> start!83862 m!907169))

(declare-fun m!907171 () Bool)

(assert (=> start!83862 m!907171))

(declare-fun m!907173 () Bool)

(assert (=> b!979794 m!907173))

(assert (=> b!979794 m!907173))

(declare-fun m!907175 () Bool)

(assert (=> b!979794 m!907175))

(declare-fun m!907177 () Bool)

(assert (=> b!979794 m!907177))

(assert (=> b!979794 m!907177))

(declare-fun m!907179 () Bool)

(assert (=> b!979794 m!907179))

(assert (=> b!979793 m!907177))

(assert (=> b!979793 m!907177))

(declare-fun m!907181 () Bool)

(assert (=> b!979793 m!907181))

(declare-fun m!907183 () Bool)

(assert (=> b!979792 m!907183))

(assert (=> b!979792 m!907177))

(declare-fun m!907185 () Bool)

(assert (=> b!979792 m!907185))

(declare-fun m!907187 () Bool)

(assert (=> b!979792 m!907187))

(declare-fun m!907189 () Bool)

(assert (=> b!979792 m!907189))

(declare-fun m!907191 () Bool)

(assert (=> b!979792 m!907191))

(declare-fun m!907193 () Bool)

(assert (=> b!979792 m!907193))

(declare-fun m!907195 () Bool)

(assert (=> b!979792 m!907195))

(assert (=> b!979792 m!907177))

(declare-fun m!907197 () Bool)

(assert (=> b!979792 m!907197))

(assert (=> b!979792 m!907191))

(assert (=> b!979792 m!907195))

(declare-fun m!907199 () Bool)

(assert (=> b!979792 m!907199))

(declare-fun m!907201 () Bool)

(assert (=> b!979792 m!907201))

(declare-fun m!907203 () Bool)

(assert (=> b!979788 m!907203))

(declare-fun m!907205 () Bool)

(assert (=> b!979787 m!907205))

(check-sat (not b_lambda!14715) (not b!979787) (not b!979793) (not b_next!19671) (not mapNonEmpty!36026) b_and!31433 (not start!83862) tp_is_empty!22665 (not b!979794) (not b!979792) (not b!979788))
(check-sat b_and!31433 (not b_next!19671))
