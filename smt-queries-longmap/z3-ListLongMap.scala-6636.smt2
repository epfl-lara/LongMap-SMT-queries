; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83956 () Bool)

(assert start!83956)

(declare-fun b_free!19597 () Bool)

(declare-fun b_next!19597 () Bool)

(assert (=> start!83956 (= b_free!19597 (not b_next!19597))))

(declare-fun tp!68233 () Bool)

(declare-fun b_and!31293 () Bool)

(assert (=> start!83956 (= tp!68233 b_and!31293)))

(declare-fun b!979428 () Bool)

(declare-fun res!655193 () Bool)

(declare-fun e!552242 () Bool)

(assert (=> b!979428 (=> (not res!655193) (not e!552242))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!979428 (= res!655193 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!655196 () Bool)

(assert (=> start!83956 (=> (not res!655196) (not e!552242))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83956 (= res!655196 (validMask!0 mask!1948))))

(assert (=> start!83956 e!552242))

(assert (=> start!83956 true))

(declare-fun tp_is_empty!22591 () Bool)

(assert (=> start!83956 tp_is_empty!22591))

(declare-datatypes ((V!35105 0))(
  ( (V!35106 (val!11346 Int)) )
))
(declare-datatypes ((ValueCell!10814 0))(
  ( (ValueCellFull!10814 (v!13905 V!35105)) (EmptyCell!10814) )
))
(declare-datatypes ((array!61232 0))(
  ( (array!61233 (arr!29469 (Array (_ BitVec 32) ValueCell!10814)) (size!29949 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61232)

(declare-fun e!552240 () Bool)

(declare-fun array_inv!22823 (array!61232) Bool)

(assert (=> start!83956 (and (array_inv!22823 _values!1278) e!552240)))

(assert (=> start!83956 tp!68233))

(declare-datatypes ((array!61234 0))(
  ( (array!61235 (arr!29470 (Array (_ BitVec 32) (_ BitVec 64))) (size!29950 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61234)

(declare-fun array_inv!22824 (array!61234) Bool)

(assert (=> start!83956 (array_inv!22824 _keys!1544)))

(declare-fun b!979429 () Bool)

(assert (=> b!979429 (= e!552242 (not true))))

(declare-datatypes ((tuple2!14554 0))(
  ( (tuple2!14555 (_1!7288 (_ BitVec 64)) (_2!7288 V!35105)) )
))
(declare-datatypes ((List!20415 0))(
  ( (Nil!20412) (Cons!20411 (h!21579 tuple2!14554) (t!28960 List!20415)) )
))
(declare-datatypes ((ListLongMap!13253 0))(
  ( (ListLongMap!13254 (toList!6642 List!20415)) )
))
(declare-fun lt!434173 () ListLongMap!13253)

(declare-fun lt!434171 () tuple2!14554)

(declare-fun lt!434172 () tuple2!14554)

(declare-fun +!2957 (ListLongMap!13253 tuple2!14554) ListLongMap!13253)

(assert (=> b!979429 (= (+!2957 (+!2957 lt!434173 lt!434171) lt!434172) (+!2957 (+!2957 lt!434173 lt!434172) lt!434171))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun lt!434175 () V!35105)

(assert (=> b!979429 (= lt!434172 (tuple2!14555 (select (arr!29470 _keys!1544) from!1932) lt!434175))))

(declare-fun minValue!1220 () V!35105)

(assert (=> b!979429 (= lt!434171 (tuple2!14555 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32494 0))(
  ( (Unit!32495) )
))
(declare-fun lt!434174 () Unit!32494)

(declare-fun addCommutativeForDiffKeys!564 (ListLongMap!13253 (_ BitVec 64) V!35105 (_ BitVec 64) V!35105) Unit!32494)

(assert (=> b!979429 (= lt!434174 (addCommutativeForDiffKeys!564 lt!434173 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29470 _keys!1544) from!1932) lt!434175))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15281 (ValueCell!10814 V!35105) V!35105)

(declare-fun dynLambda!1752 (Int (_ BitVec 64)) V!35105)

(assert (=> b!979429 (= lt!434175 (get!15281 (select (arr!29469 _values!1278) from!1932) (dynLambda!1752 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35105)

(declare-fun getCurrentListMapNoExtraKeys!3390 (array!61234 array!61232 (_ BitVec 32) (_ BitVec 32) V!35105 V!35105 (_ BitVec 32) Int) ListLongMap!13253)

(assert (=> b!979429 (= lt!434173 (+!2957 (getCurrentListMapNoExtraKeys!3390 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14555 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!979430 () Bool)

(declare-fun res!655192 () Bool)

(assert (=> b!979430 (=> (not res!655192) (not e!552242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979430 (= res!655192 (validKeyInArray!0 (select (arr!29470 _keys!1544) from!1932)))))

(declare-fun b!979431 () Bool)

(declare-fun res!655195 () Bool)

(assert (=> b!979431 (=> (not res!655195) (not e!552242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61234 (_ BitVec 32)) Bool)

(assert (=> b!979431 (= res!655195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!35915 () Bool)

(declare-fun mapRes!35915 () Bool)

(assert (=> mapIsEmpty!35915 mapRes!35915))

(declare-fun b!979432 () Bool)

(declare-fun e!552239 () Bool)

(assert (=> b!979432 (= e!552240 (and e!552239 mapRes!35915))))

(declare-fun condMapEmpty!35915 () Bool)

(declare-fun mapDefault!35915 () ValueCell!10814)

(assert (=> b!979432 (= condMapEmpty!35915 (= (arr!29469 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10814)) mapDefault!35915)))))

(declare-fun b!979433 () Bool)

(assert (=> b!979433 (= e!552239 tp_is_empty!22591)))

(declare-fun b!979434 () Bool)

(declare-fun e!552241 () Bool)

(assert (=> b!979434 (= e!552241 tp_is_empty!22591)))

(declare-fun b!979435 () Bool)

(declare-fun res!655198 () Bool)

(assert (=> b!979435 (=> (not res!655198) (not e!552242))))

(declare-datatypes ((List!20416 0))(
  ( (Nil!20413) (Cons!20412 (h!21580 (_ BitVec 64)) (t!28961 List!20416)) )
))
(declare-fun arrayNoDuplicates!0 (array!61234 (_ BitVec 32) List!20416) Bool)

(assert (=> b!979435 (= res!655198 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20413))))

(declare-fun mapNonEmpty!35915 () Bool)

(declare-fun tp!68234 () Bool)

(assert (=> mapNonEmpty!35915 (= mapRes!35915 (and tp!68234 e!552241))))

(declare-fun mapKey!35915 () (_ BitVec 32))

(declare-fun mapValue!35915 () ValueCell!10814)

(declare-fun mapRest!35915 () (Array (_ BitVec 32) ValueCell!10814))

(assert (=> mapNonEmpty!35915 (= (arr!29469 _values!1278) (store mapRest!35915 mapKey!35915 mapValue!35915))))

(declare-fun b!979436 () Bool)

(declare-fun res!655194 () Bool)

(assert (=> b!979436 (=> (not res!655194) (not e!552242))))

(assert (=> b!979436 (= res!655194 (and (= (size!29949 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29950 _keys!1544) (size!29949 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!979437 () Bool)

(declare-fun res!655197 () Bool)

(assert (=> b!979437 (=> (not res!655197) (not e!552242))))

(assert (=> b!979437 (= res!655197 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29950 _keys!1544))))))

(assert (= (and start!83956 res!655196) b!979436))

(assert (= (and b!979436 res!655194) b!979431))

(assert (= (and b!979431 res!655195) b!979435))

(assert (= (and b!979435 res!655198) b!979437))

(assert (= (and b!979437 res!655197) b!979430))

(assert (= (and b!979430 res!655192) b!979428))

(assert (= (and b!979428 res!655193) b!979429))

(assert (= (and b!979432 condMapEmpty!35915) mapIsEmpty!35915))

(assert (= (and b!979432 (not condMapEmpty!35915)) mapNonEmpty!35915))

(get-info :version)

(assert (= (and mapNonEmpty!35915 ((_ is ValueCellFull!10814) mapValue!35915)) b!979434))

(assert (= (and b!979432 ((_ is ValueCellFull!10814) mapDefault!35915)) b!979433))

(assert (= start!83956 b!979432))

(declare-fun b_lambda!14655 () Bool)

(assert (=> (not b_lambda!14655) (not b!979429)))

(declare-fun t!28959 () Bool)

(declare-fun tb!6395 () Bool)

(assert (=> (and start!83956 (= defaultEntry!1281 defaultEntry!1281) t!28959) tb!6395))

(declare-fun result!12787 () Bool)

(assert (=> tb!6395 (= result!12787 tp_is_empty!22591)))

(assert (=> b!979429 t!28959))

(declare-fun b_and!31295 () Bool)

(assert (= b_and!31293 (and (=> t!28959 result!12787) b_and!31295)))

(declare-fun m!906977 () Bool)

(assert (=> b!979431 m!906977))

(declare-fun m!906979 () Bool)

(assert (=> mapNonEmpty!35915 m!906979))

(declare-fun m!906981 () Bool)

(assert (=> b!979430 m!906981))

(assert (=> b!979430 m!906981))

(declare-fun m!906983 () Bool)

(assert (=> b!979430 m!906983))

(assert (=> b!979429 m!906981))

(declare-fun m!906985 () Bool)

(assert (=> b!979429 m!906985))

(declare-fun m!906987 () Bool)

(assert (=> b!979429 m!906987))

(declare-fun m!906989 () Bool)

(assert (=> b!979429 m!906989))

(declare-fun m!906991 () Bool)

(assert (=> b!979429 m!906991))

(declare-fun m!906993 () Bool)

(assert (=> b!979429 m!906993))

(assert (=> b!979429 m!906981))

(declare-fun m!906995 () Bool)

(assert (=> b!979429 m!906995))

(declare-fun m!906997 () Bool)

(assert (=> b!979429 m!906997))

(assert (=> b!979429 m!906987))

(declare-fun m!906999 () Bool)

(assert (=> b!979429 m!906999))

(assert (=> b!979429 m!906985))

(assert (=> b!979429 m!906999))

(declare-fun m!907001 () Bool)

(assert (=> b!979429 m!907001))

(assert (=> b!979429 m!906991))

(assert (=> b!979429 m!906997))

(declare-fun m!907003 () Bool)

(assert (=> b!979429 m!907003))

(declare-fun m!907005 () Bool)

(assert (=> start!83956 m!907005))

(declare-fun m!907007 () Bool)

(assert (=> start!83956 m!907007))

(declare-fun m!907009 () Bool)

(assert (=> start!83956 m!907009))

(declare-fun m!907011 () Bool)

(assert (=> b!979435 m!907011))

(check-sat b_and!31295 (not b_next!19597) (not b!979429) (not start!83956) (not mapNonEmpty!35915) (not b!979435) (not b!979431) (not b!979430) (not b_lambda!14655) tp_is_empty!22591)
(check-sat b_and!31295 (not b_next!19597))
