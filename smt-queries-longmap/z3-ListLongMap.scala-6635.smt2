; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83950 () Bool)

(assert start!83950)

(declare-fun b_free!19591 () Bool)

(declare-fun b_next!19591 () Bool)

(assert (=> start!83950 (= b_free!19591 (not b_next!19591))))

(declare-fun tp!68215 () Bool)

(declare-fun b_and!31281 () Bool)

(assert (=> start!83950 (= tp!68215 b_and!31281)))

(declare-fun b!979332 () Bool)

(declare-fun res!655133 () Bool)

(declare-fun e!552194 () Bool)

(assert (=> b!979332 (=> (not res!655133) (not e!552194))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35097 0))(
  ( (V!35098 (val!11343 Int)) )
))
(declare-datatypes ((ValueCell!10811 0))(
  ( (ValueCellFull!10811 (v!13902 V!35097)) (EmptyCell!10811) )
))
(declare-datatypes ((array!61220 0))(
  ( (array!61221 (arr!29463 (Array (_ BitVec 32) ValueCell!10811)) (size!29943 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61220)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61222 0))(
  ( (array!61223 (arr!29464 (Array (_ BitVec 32) (_ BitVec 64))) (size!29944 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61222)

(assert (=> b!979332 (= res!655133 (and (= (size!29943 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29944 _keys!1544) (size!29943 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!979333 () Bool)

(declare-fun res!655132 () Bool)

(assert (=> b!979333 (=> (not res!655132) (not e!552194))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!979333 (= res!655132 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29944 _keys!1544))))))

(declare-fun b!979334 () Bool)

(assert (=> b!979334 (= e!552194 (not true))))

(declare-datatypes ((tuple2!14548 0))(
  ( (tuple2!14549 (_1!7285 (_ BitVec 64)) (_2!7285 V!35097)) )
))
(declare-datatypes ((List!20410 0))(
  ( (Nil!20407) (Cons!20406 (h!21574 tuple2!14548) (t!28949 List!20410)) )
))
(declare-datatypes ((ListLongMap!13247 0))(
  ( (ListLongMap!13248 (toList!6639 List!20410)) )
))
(declare-fun lt!434130 () ListLongMap!13247)

(declare-fun lt!434126 () tuple2!14548)

(declare-fun lt!434128 () tuple2!14548)

(declare-fun +!2954 (ListLongMap!13247 tuple2!14548) ListLongMap!13247)

(assert (=> b!979334 (= (+!2954 (+!2954 lt!434130 lt!434126) lt!434128) (+!2954 (+!2954 lt!434130 lt!434128) lt!434126))))

(declare-fun lt!434127 () V!35097)

(assert (=> b!979334 (= lt!434128 (tuple2!14549 (select (arr!29464 _keys!1544) from!1932) lt!434127))))

(declare-fun minValue!1220 () V!35097)

(assert (=> b!979334 (= lt!434126 (tuple2!14549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32488 0))(
  ( (Unit!32489) )
))
(declare-fun lt!434129 () Unit!32488)

(declare-fun addCommutativeForDiffKeys!561 (ListLongMap!13247 (_ BitVec 64) V!35097 (_ BitVec 64) V!35097) Unit!32488)

(assert (=> b!979334 (= lt!434129 (addCommutativeForDiffKeys!561 lt!434130 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29464 _keys!1544) from!1932) lt!434127))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15276 (ValueCell!10811 V!35097) V!35097)

(declare-fun dynLambda!1749 (Int (_ BitVec 64)) V!35097)

(assert (=> b!979334 (= lt!434127 (get!15276 (select (arr!29463 _values!1278) from!1932) (dynLambda!1749 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35097)

(declare-fun getCurrentListMapNoExtraKeys!3387 (array!61222 array!61220 (_ BitVec 32) (_ BitVec 32) V!35097 V!35097 (_ BitVec 32) Int) ListLongMap!13247)

(assert (=> b!979334 (= lt!434130 (+!2954 (getCurrentListMapNoExtraKeys!3387 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14549 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun mapIsEmpty!35906 () Bool)

(declare-fun mapRes!35906 () Bool)

(assert (=> mapIsEmpty!35906 mapRes!35906))

(declare-fun res!655131 () Bool)

(assert (=> start!83950 (=> (not res!655131) (not e!552194))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83950 (= res!655131 (validMask!0 mask!1948))))

(assert (=> start!83950 e!552194))

(assert (=> start!83950 true))

(declare-fun tp_is_empty!22585 () Bool)

(assert (=> start!83950 tp_is_empty!22585))

(declare-fun e!552196 () Bool)

(declare-fun array_inv!22819 (array!61220) Bool)

(assert (=> start!83950 (and (array_inv!22819 _values!1278) e!552196)))

(assert (=> start!83950 tp!68215))

(declare-fun array_inv!22820 (array!61222) Bool)

(assert (=> start!83950 (array_inv!22820 _keys!1544)))

(declare-fun b!979335 () Bool)

(declare-fun res!655129 () Bool)

(assert (=> b!979335 (=> (not res!655129) (not e!552194))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61222 (_ BitVec 32)) Bool)

(assert (=> b!979335 (= res!655129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!979336 () Bool)

(declare-fun res!655130 () Bool)

(assert (=> b!979336 (=> (not res!655130) (not e!552194))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979336 (= res!655130 (validKeyInArray!0 (select (arr!29464 _keys!1544) from!1932)))))

(declare-fun mapNonEmpty!35906 () Bool)

(declare-fun tp!68216 () Bool)

(declare-fun e!552197 () Bool)

(assert (=> mapNonEmpty!35906 (= mapRes!35906 (and tp!68216 e!552197))))

(declare-fun mapValue!35906 () ValueCell!10811)

(declare-fun mapKey!35906 () (_ BitVec 32))

(declare-fun mapRest!35906 () (Array (_ BitVec 32) ValueCell!10811))

(assert (=> mapNonEmpty!35906 (= (arr!29463 _values!1278) (store mapRest!35906 mapKey!35906 mapValue!35906))))

(declare-fun b!979337 () Bool)

(assert (=> b!979337 (= e!552197 tp_is_empty!22585)))

(declare-fun b!979338 () Bool)

(declare-fun res!655134 () Bool)

(assert (=> b!979338 (=> (not res!655134) (not e!552194))))

(declare-datatypes ((List!20411 0))(
  ( (Nil!20408) (Cons!20407 (h!21575 (_ BitVec 64)) (t!28950 List!20411)) )
))
(declare-fun arrayNoDuplicates!0 (array!61222 (_ BitVec 32) List!20411) Bool)

(assert (=> b!979338 (= res!655134 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20408))))

(declare-fun b!979339 () Bool)

(declare-fun e!552198 () Bool)

(assert (=> b!979339 (= e!552198 tp_is_empty!22585)))

(declare-fun b!979340 () Bool)

(assert (=> b!979340 (= e!552196 (and e!552198 mapRes!35906))))

(declare-fun condMapEmpty!35906 () Bool)

(declare-fun mapDefault!35906 () ValueCell!10811)

(assert (=> b!979340 (= condMapEmpty!35906 (= (arr!29463 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10811)) mapDefault!35906)))))

(declare-fun b!979341 () Bool)

(declare-fun res!655135 () Bool)

(assert (=> b!979341 (=> (not res!655135) (not e!552194))))

(assert (=> b!979341 (= res!655135 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!83950 res!655131) b!979332))

(assert (= (and b!979332 res!655133) b!979335))

(assert (= (and b!979335 res!655129) b!979338))

(assert (= (and b!979338 res!655134) b!979333))

(assert (= (and b!979333 res!655132) b!979336))

(assert (= (and b!979336 res!655130) b!979341))

(assert (= (and b!979341 res!655135) b!979334))

(assert (= (and b!979340 condMapEmpty!35906) mapIsEmpty!35906))

(assert (= (and b!979340 (not condMapEmpty!35906)) mapNonEmpty!35906))

(get-info :version)

(assert (= (and mapNonEmpty!35906 ((_ is ValueCellFull!10811) mapValue!35906)) b!979337))

(assert (= (and b!979340 ((_ is ValueCellFull!10811) mapDefault!35906)) b!979339))

(assert (= start!83950 b!979340))

(declare-fun b_lambda!14649 () Bool)

(assert (=> (not b_lambda!14649) (not b!979334)))

(declare-fun t!28948 () Bool)

(declare-fun tb!6389 () Bool)

(assert (=> (and start!83950 (= defaultEntry!1281 defaultEntry!1281) t!28948) tb!6389))

(declare-fun result!12775 () Bool)

(assert (=> tb!6389 (= result!12775 tp_is_empty!22585)))

(assert (=> b!979334 t!28948))

(declare-fun b_and!31283 () Bool)

(assert (= b_and!31281 (and (=> t!28948 result!12775) b_and!31283)))

(declare-fun m!906869 () Bool)

(assert (=> b!979335 m!906869))

(declare-fun m!906871 () Bool)

(assert (=> mapNonEmpty!35906 m!906871))

(declare-fun m!906873 () Bool)

(assert (=> b!979334 m!906873))

(declare-fun m!906875 () Bool)

(assert (=> b!979334 m!906875))

(declare-fun m!906877 () Bool)

(assert (=> b!979334 m!906877))

(declare-fun m!906879 () Bool)

(assert (=> b!979334 m!906879))

(assert (=> b!979334 m!906877))

(declare-fun m!906881 () Bool)

(assert (=> b!979334 m!906881))

(declare-fun m!906883 () Bool)

(assert (=> b!979334 m!906883))

(declare-fun m!906885 () Bool)

(assert (=> b!979334 m!906885))

(assert (=> b!979334 m!906873))

(declare-fun m!906887 () Bool)

(assert (=> b!979334 m!906887))

(declare-fun m!906889 () Bool)

(assert (=> b!979334 m!906889))

(assert (=> b!979334 m!906875))

(assert (=> b!979334 m!906889))

(declare-fun m!906891 () Bool)

(assert (=> b!979334 m!906891))

(assert (=> b!979334 m!906885))

(declare-fun m!906893 () Bool)

(assert (=> b!979334 m!906893))

(assert (=> b!979334 m!906881))

(assert (=> b!979336 m!906873))

(assert (=> b!979336 m!906873))

(declare-fun m!906895 () Bool)

(assert (=> b!979336 m!906895))

(declare-fun m!906897 () Bool)

(assert (=> b!979338 m!906897))

(declare-fun m!906899 () Bool)

(assert (=> start!83950 m!906899))

(declare-fun m!906901 () Bool)

(assert (=> start!83950 m!906901))

(declare-fun m!906903 () Bool)

(assert (=> start!83950 m!906903))

(check-sat (not start!83950) b_and!31283 (not b!979334) tp_is_empty!22585 (not b!979335) (not b_lambda!14649) (not b!979336) (not mapNonEmpty!35906) (not b_next!19591) (not b!979338))
(check-sat b_and!31283 (not b_next!19591))
