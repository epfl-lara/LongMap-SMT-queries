; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84004 () Bool)

(assert start!84004)

(declare-fun b_free!19645 () Bool)

(declare-fun b_next!19645 () Bool)

(assert (=> start!84004 (= b_free!19645 (not b_next!19645))))

(declare-fun tp!68378 () Bool)

(declare-fun b_and!31389 () Bool)

(assert (=> start!84004 (= tp!68378 b_and!31389)))

(declare-fun b!980234 () Bool)

(declare-fun res!655738 () Bool)

(declare-fun e!552641 () Bool)

(assert (=> b!980234 (=> (not res!655738) (not e!552641))))

(declare-datatypes ((array!61324 0))(
  ( (array!61325 (arr!29515 (Array (_ BitVec 32) (_ BitVec 64))) (size!29995 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61324)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61324 (_ BitVec 32)) Bool)

(assert (=> b!980234 (= res!655738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!35987 () Bool)

(declare-fun mapRes!35987 () Bool)

(declare-fun tp!68377 () Bool)

(declare-fun e!552640 () Bool)

(assert (=> mapNonEmpty!35987 (= mapRes!35987 (and tp!68377 e!552640))))

(declare-datatypes ((V!35169 0))(
  ( (V!35170 (val!11370 Int)) )
))
(declare-datatypes ((ValueCell!10838 0))(
  ( (ValueCellFull!10838 (v!13929 V!35169)) (EmptyCell!10838) )
))
(declare-datatypes ((array!61326 0))(
  ( (array!61327 (arr!29516 (Array (_ BitVec 32) ValueCell!10838)) (size!29996 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61326)

(declare-fun mapKey!35987 () (_ BitVec 32))

(declare-fun mapRest!35987 () (Array (_ BitVec 32) ValueCell!10838))

(declare-fun mapValue!35987 () ValueCell!10838)

(assert (=> mapNonEmpty!35987 (= (arr!29516 _values!1278) (store mapRest!35987 mapKey!35987 mapValue!35987))))

(declare-fun mapIsEmpty!35987 () Bool)

(assert (=> mapIsEmpty!35987 mapRes!35987))

(declare-fun res!655739 () Bool)

(assert (=> start!84004 (=> (not res!655739) (not e!552641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84004 (= res!655739 (validMask!0 mask!1948))))

(assert (=> start!84004 e!552641))

(assert (=> start!84004 true))

(declare-fun tp_is_empty!22639 () Bool)

(assert (=> start!84004 tp_is_empty!22639))

(declare-fun e!552642 () Bool)

(declare-fun array_inv!22853 (array!61326) Bool)

(assert (=> start!84004 (and (array_inv!22853 _values!1278) e!552642)))

(assert (=> start!84004 tp!68378))

(declare-fun array_inv!22854 (array!61324) Bool)

(assert (=> start!84004 (array_inv!22854 _keys!1544)))

(declare-fun b!980235 () Bool)

(declare-fun e!552637 () Bool)

(assert (=> b!980235 (= e!552637 true)))

(declare-datatypes ((tuple2!14592 0))(
  ( (tuple2!14593 (_1!7307 (_ BitVec 64)) (_2!7307 V!35169)) )
))
(declare-datatypes ((List!20451 0))(
  ( (Nil!20448) (Cons!20447 (h!21615 tuple2!14592) (t!29044 List!20451)) )
))
(declare-datatypes ((ListLongMap!13291 0))(
  ( (ListLongMap!13292 (toList!6661 List!20451)) )
))
(declare-fun lt!434721 () ListLongMap!13291)

(declare-fun lt!434726 () ListLongMap!13291)

(declare-fun lt!434727 () tuple2!14592)

(declare-fun lt!434724 () tuple2!14592)

(declare-fun +!2976 (ListLongMap!13291 tuple2!14592) ListLongMap!13291)

(assert (=> b!980235 (= lt!434726 (+!2976 (+!2976 lt!434721 lt!434724) lt!434727))))

(declare-datatypes ((Unit!32532 0))(
  ( (Unit!32533) )
))
(declare-fun lt!434728 () Unit!32532)

(declare-fun lt!434725 () V!35169)

(declare-fun zeroValue!1220 () V!35169)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!583 (ListLongMap!13291 (_ BitVec 64) V!35169 (_ BitVec 64) V!35169) Unit!32532)

(assert (=> b!980235 (= lt!434728 (addCommutativeForDiffKeys!583 lt!434721 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29515 _keys!1544) from!1932) lt!434725))))

(declare-fun b!980236 () Bool)

(declare-fun res!655735 () Bool)

(assert (=> b!980236 (=> (not res!655735) (not e!552641))))

(declare-datatypes ((List!20452 0))(
  ( (Nil!20449) (Cons!20448 (h!21616 (_ BitVec 64)) (t!29045 List!20452)) )
))
(declare-fun arrayNoDuplicates!0 (array!61324 (_ BitVec 32) List!20452) Bool)

(assert (=> b!980236 (= res!655735 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20449))))

(declare-fun b!980237 () Bool)

(declare-fun res!655734 () Bool)

(assert (=> b!980237 (=> (not res!655734) (not e!552641))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980237 (= res!655734 (validKeyInArray!0 (select (arr!29515 _keys!1544) from!1932)))))

(declare-fun b!980238 () Bool)

(declare-fun res!655736 () Bool)

(assert (=> b!980238 (=> (not res!655736) (not e!552641))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980238 (= res!655736 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!980239 () Bool)

(assert (=> b!980239 (= e!552640 tp_is_empty!22639)))

(declare-fun b!980240 () Bool)

(declare-fun res!655737 () Bool)

(assert (=> b!980240 (=> (not res!655737) (not e!552641))))

(assert (=> b!980240 (= res!655737 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29995 _keys!1544))))))

(declare-fun b!980241 () Bool)

(declare-fun e!552639 () Bool)

(assert (=> b!980241 (= e!552639 tp_is_empty!22639)))

(declare-fun b!980242 () Bool)

(declare-fun res!655740 () Bool)

(assert (=> b!980242 (=> (not res!655740) (not e!552641))))

(assert (=> b!980242 (= res!655740 (and (= (size!29996 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29995 _keys!1544) (size!29996 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!980243 () Bool)

(assert (=> b!980243 (= e!552642 (and e!552639 mapRes!35987))))

(declare-fun condMapEmpty!35987 () Bool)

(declare-fun mapDefault!35987 () ValueCell!10838)

(assert (=> b!980243 (= condMapEmpty!35987 (= (arr!29516 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10838)) mapDefault!35987)))))

(declare-fun b!980244 () Bool)

(assert (=> b!980244 (= e!552641 (not e!552637))))

(declare-fun res!655741 () Bool)

(assert (=> b!980244 (=> res!655741 e!552637)))

(assert (=> b!980244 (= res!655741 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29515 _keys!1544) from!1932)))))

(declare-fun lt!434730 () tuple2!14592)

(declare-fun lt!434729 () ListLongMap!13291)

(assert (=> b!980244 (= (+!2976 lt!434729 lt!434724) (+!2976 lt!434726 lt!434730))))

(declare-fun lt!434722 () ListLongMap!13291)

(assert (=> b!980244 (= lt!434726 (+!2976 lt!434722 lt!434724))))

(assert (=> b!980244 (= lt!434724 (tuple2!14593 (select (arr!29515 _keys!1544) from!1932) lt!434725))))

(assert (=> b!980244 (= lt!434729 (+!2976 lt!434722 lt!434730))))

(declare-fun minValue!1220 () V!35169)

(assert (=> b!980244 (= lt!434730 (tuple2!14593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!434723 () Unit!32532)

(assert (=> b!980244 (= lt!434723 (addCommutativeForDiffKeys!583 lt!434722 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29515 _keys!1544) from!1932) lt!434725))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15316 (ValueCell!10838 V!35169) V!35169)

(declare-fun dynLambda!1771 (Int (_ BitVec 64)) V!35169)

(assert (=> b!980244 (= lt!434725 (get!15316 (select (arr!29516 _values!1278) from!1932) (dynLambda!1771 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!980244 (= lt!434722 (+!2976 lt!434721 lt!434727))))

(assert (=> b!980244 (= lt!434727 (tuple2!14593 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3409 (array!61324 array!61326 (_ BitVec 32) (_ BitVec 32) V!35169 V!35169 (_ BitVec 32) Int) ListLongMap!13291)

(assert (=> b!980244 (= lt!434721 (getCurrentListMapNoExtraKeys!3409 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(assert (= (and start!84004 res!655739) b!980242))

(assert (= (and b!980242 res!655740) b!980234))

(assert (= (and b!980234 res!655738) b!980236))

(assert (= (and b!980236 res!655735) b!980240))

(assert (= (and b!980240 res!655737) b!980237))

(assert (= (and b!980237 res!655734) b!980238))

(assert (= (and b!980238 res!655736) b!980244))

(assert (= (and b!980244 (not res!655741)) b!980235))

(assert (= (and b!980243 condMapEmpty!35987) mapIsEmpty!35987))

(assert (= (and b!980243 (not condMapEmpty!35987)) mapNonEmpty!35987))

(get-info :version)

(assert (= (and mapNonEmpty!35987 ((_ is ValueCellFull!10838) mapValue!35987)) b!980239))

(assert (= (and b!980243 ((_ is ValueCellFull!10838) mapDefault!35987)) b!980241))

(assert (= start!84004 b!980243))

(declare-fun b_lambda!14703 () Bool)

(assert (=> (not b_lambda!14703) (not b!980244)))

(declare-fun t!29043 () Bool)

(declare-fun tb!6443 () Bool)

(assert (=> (and start!84004 (= defaultEntry!1281 defaultEntry!1281) t!29043) tb!6443))

(declare-fun result!12883 () Bool)

(assert (=> tb!6443 (= result!12883 tp_is_empty!22639)))

(assert (=> b!980244 t!29043))

(declare-fun b_and!31391 () Bool)

(assert (= b_and!31389 (and (=> t!29043 result!12883) b_and!31391)))

(declare-fun m!907913 () Bool)

(assert (=> b!980237 m!907913))

(assert (=> b!980237 m!907913))

(declare-fun m!907915 () Bool)

(assert (=> b!980237 m!907915))

(declare-fun m!907917 () Bool)

(assert (=> b!980236 m!907917))

(declare-fun m!907919 () Bool)

(assert (=> b!980235 m!907919))

(assert (=> b!980235 m!907919))

(declare-fun m!907921 () Bool)

(assert (=> b!980235 m!907921))

(assert (=> b!980235 m!907913))

(assert (=> b!980235 m!907913))

(declare-fun m!907923 () Bool)

(assert (=> b!980235 m!907923))

(declare-fun m!907925 () Bool)

(assert (=> b!980234 m!907925))

(declare-fun m!907927 () Bool)

(assert (=> mapNonEmpty!35987 m!907927))

(declare-fun m!907929 () Bool)

(assert (=> start!84004 m!907929))

(declare-fun m!907931 () Bool)

(assert (=> start!84004 m!907931))

(declare-fun m!907933 () Bool)

(assert (=> start!84004 m!907933))

(declare-fun m!907935 () Bool)

(assert (=> b!980244 m!907935))

(assert (=> b!980244 m!907913))

(declare-fun m!907937 () Bool)

(assert (=> b!980244 m!907937))

(declare-fun m!907939 () Bool)

(assert (=> b!980244 m!907939))

(declare-fun m!907941 () Bool)

(assert (=> b!980244 m!907941))

(declare-fun m!907943 () Bool)

(assert (=> b!980244 m!907943))

(declare-fun m!907945 () Bool)

(assert (=> b!980244 m!907945))

(declare-fun m!907947 () Bool)

(assert (=> b!980244 m!907947))

(assert (=> b!980244 m!907913))

(declare-fun m!907949 () Bool)

(assert (=> b!980244 m!907949))

(declare-fun m!907951 () Bool)

(assert (=> b!980244 m!907951))

(assert (=> b!980244 m!907935))

(assert (=> b!980244 m!907951))

(declare-fun m!907953 () Bool)

(assert (=> b!980244 m!907953))

(check-sat (not b!980234) (not b!980244) (not mapNonEmpty!35987) tp_is_empty!22639 (not b_next!19645) (not b!980236) (not b_lambda!14703) b_and!31391 (not b!980235) (not b!980237) (not start!84004))
(check-sat b_and!31391 (not b_next!19645))
