; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83892 () Bool)

(assert start!83892)

(declare-fun b_free!19701 () Bool)

(declare-fun b_next!19701 () Bool)

(assert (=> start!83892 (= b_free!19701 (not b_next!19701))))

(declare-fun tp!68545 () Bool)

(declare-fun b_and!31491 () Bool)

(assert (=> start!83892 (= tp!68545 b_and!31491)))

(declare-fun b!980311 () Bool)

(declare-fun res!656062 () Bool)

(declare-fun e!552561 () Bool)

(assert (=> b!980311 (=> (not res!656062) (not e!552561))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980311 (= res!656062 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!980312 () Bool)

(declare-fun res!656066 () Bool)

(assert (=> b!980312 (=> (not res!656066) (not e!552561))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35243 0))(
  ( (V!35244 (val!11398 Int)) )
))
(declare-datatypes ((ValueCell!10866 0))(
  ( (ValueCellFull!10866 (v!13960 V!35243)) (EmptyCell!10866) )
))
(declare-datatypes ((array!61399 0))(
  ( (array!61400 (arr!29557 (Array (_ BitVec 32) ValueCell!10866)) (size!30036 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61399)

(declare-datatypes ((array!61401 0))(
  ( (array!61402 (arr!29558 (Array (_ BitVec 32) (_ BitVec 64))) (size!30037 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61401)

(assert (=> b!980312 (= res!656066 (and (= (size!30036 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30037 _keys!1544) (size!30036 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!656063 () Bool)

(assert (=> start!83892 (=> (not res!656063) (not e!552561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83892 (= res!656063 (validMask!0 mask!1948))))

(assert (=> start!83892 e!552561))

(assert (=> start!83892 true))

(declare-fun tp_is_empty!22695 () Bool)

(assert (=> start!83892 tp_is_empty!22695))

(declare-fun e!552563 () Bool)

(declare-fun array_inv!22849 (array!61399) Bool)

(assert (=> start!83892 (and (array_inv!22849 _values!1278) e!552563)))

(assert (=> start!83892 tp!68545))

(declare-fun array_inv!22850 (array!61401) Bool)

(assert (=> start!83892 (array_inv!22850 _keys!1544)))

(declare-fun b!980313 () Bool)

(declare-fun res!656069 () Bool)

(assert (=> b!980313 (=> (not res!656069) (not e!552561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61401 (_ BitVec 32)) Bool)

(assert (=> b!980313 (= res!656069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!980314 () Bool)

(declare-fun e!552560 () Bool)

(assert (=> b!980314 (= e!552561 (not e!552560))))

(declare-fun res!656068 () Bool)

(assert (=> b!980314 (=> res!656068 e!552560)))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!980314 (= res!656068 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29558 _keys!1544) from!1932)))))

(declare-datatypes ((tuple2!14618 0))(
  ( (tuple2!14619 (_1!7320 (_ BitVec 64)) (_2!7320 V!35243)) )
))
(declare-datatypes ((List!20486 0))(
  ( (Nil!20483) (Cons!20482 (h!21644 tuple2!14618) (t!29143 List!20486)) )
))
(declare-datatypes ((ListLongMap!13315 0))(
  ( (ListLongMap!13316 (toList!6673 List!20486)) )
))
(declare-fun lt!435203 () ListLongMap!13315)

(declare-fun lt!435208 () tuple2!14618)

(declare-fun lt!435204 () ListLongMap!13315)

(declare-fun lt!435205 () tuple2!14618)

(declare-fun +!2978 (ListLongMap!13315 tuple2!14618) ListLongMap!13315)

(assert (=> b!980314 (= (+!2978 lt!435204 lt!435205) (+!2978 lt!435203 lt!435208))))

(declare-fun lt!435202 () ListLongMap!13315)

(assert (=> b!980314 (= lt!435203 (+!2978 lt!435202 lt!435205))))

(declare-fun lt!435200 () V!35243)

(assert (=> b!980314 (= lt!435205 (tuple2!14619 (select (arr!29558 _keys!1544) from!1932) lt!435200))))

(assert (=> b!980314 (= lt!435204 (+!2978 lt!435202 lt!435208))))

(declare-fun minValue!1220 () V!35243)

(assert (=> b!980314 (= lt!435208 (tuple2!14619 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32595 0))(
  ( (Unit!32596) )
))
(declare-fun lt!435209 () Unit!32595)

(declare-fun addCommutativeForDiffKeys!606 (ListLongMap!13315 (_ BitVec 64) V!35243 (_ BitVec 64) V!35243) Unit!32595)

(assert (=> b!980314 (= lt!435209 (addCommutativeForDiffKeys!606 lt!435202 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29558 _keys!1544) from!1932) lt!435200))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15323 (ValueCell!10866 V!35243) V!35243)

(declare-fun dynLambda!1764 (Int (_ BitVec 64)) V!35243)

(assert (=> b!980314 (= lt!435200 (get!15323 (select (arr!29557 _values!1278) from!1932) (dynLambda!1764 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!435207 () ListLongMap!13315)

(declare-fun lt!435201 () tuple2!14618)

(assert (=> b!980314 (= lt!435202 (+!2978 lt!435207 lt!435201))))

(declare-fun zeroValue!1220 () V!35243)

(assert (=> b!980314 (= lt!435201 (tuple2!14619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3378 (array!61401 array!61399 (_ BitVec 32) (_ BitVec 32) V!35243 V!35243 (_ BitVec 32) Int) ListLongMap!13315)

(assert (=> b!980314 (= lt!435207 (getCurrentListMapNoExtraKeys!3378 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!980315 () Bool)

(assert (=> b!980315 (= e!552560 true)))

(assert (=> b!980315 (= lt!435203 (+!2978 (+!2978 lt!435207 lt!435205) lt!435201))))

(declare-fun lt!435206 () Unit!32595)

(assert (=> b!980315 (= lt!435206 (addCommutativeForDiffKeys!606 lt!435207 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29558 _keys!1544) from!1932) lt!435200))))

(declare-fun mapNonEmpty!36071 () Bool)

(declare-fun mapRes!36071 () Bool)

(declare-fun tp!68544 () Bool)

(declare-fun e!552559 () Bool)

(assert (=> mapNonEmpty!36071 (= mapRes!36071 (and tp!68544 e!552559))))

(declare-fun mapValue!36071 () ValueCell!10866)

(declare-fun mapRest!36071 () (Array (_ BitVec 32) ValueCell!10866))

(declare-fun mapKey!36071 () (_ BitVec 32))

(assert (=> mapNonEmpty!36071 (= (arr!29557 _values!1278) (store mapRest!36071 mapKey!36071 mapValue!36071))))

(declare-fun b!980316 () Bool)

(declare-fun res!656065 () Bool)

(assert (=> b!980316 (=> (not res!656065) (not e!552561))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980316 (= res!656065 (validKeyInArray!0 (select (arr!29558 _keys!1544) from!1932)))))

(declare-fun b!980317 () Bool)

(declare-fun e!552564 () Bool)

(assert (=> b!980317 (= e!552563 (and e!552564 mapRes!36071))))

(declare-fun condMapEmpty!36071 () Bool)

(declare-fun mapDefault!36071 () ValueCell!10866)

(assert (=> b!980317 (= condMapEmpty!36071 (= (arr!29557 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10866)) mapDefault!36071)))))

(declare-fun b!980318 () Bool)

(declare-fun res!656064 () Bool)

(assert (=> b!980318 (=> (not res!656064) (not e!552561))))

(assert (=> b!980318 (= res!656064 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30037 _keys!1544))))))

(declare-fun b!980319 () Bool)

(assert (=> b!980319 (= e!552564 tp_is_empty!22695)))

(declare-fun b!980320 () Bool)

(assert (=> b!980320 (= e!552559 tp_is_empty!22695)))

(declare-fun mapIsEmpty!36071 () Bool)

(assert (=> mapIsEmpty!36071 mapRes!36071))

(declare-fun b!980321 () Bool)

(declare-fun res!656067 () Bool)

(assert (=> b!980321 (=> (not res!656067) (not e!552561))))

(declare-datatypes ((List!20487 0))(
  ( (Nil!20484) (Cons!20483 (h!21645 (_ BitVec 64)) (t!29144 List!20487)) )
))
(declare-fun arrayNoDuplicates!0 (array!61401 (_ BitVec 32) List!20487) Bool)

(assert (=> b!980321 (= res!656067 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20484))))

(assert (= (and start!83892 res!656063) b!980312))

(assert (= (and b!980312 res!656066) b!980313))

(assert (= (and b!980313 res!656069) b!980321))

(assert (= (and b!980321 res!656067) b!980318))

(assert (= (and b!980318 res!656064) b!980316))

(assert (= (and b!980316 res!656065) b!980311))

(assert (= (and b!980311 res!656062) b!980314))

(assert (= (and b!980314 (not res!656068)) b!980315))

(assert (= (and b!980317 condMapEmpty!36071) mapIsEmpty!36071))

(assert (= (and b!980317 (not condMapEmpty!36071)) mapNonEmpty!36071))

(get-info :version)

(assert (= (and mapNonEmpty!36071 ((_ is ValueCellFull!10866) mapValue!36071)) b!980320))

(assert (= (and b!980317 ((_ is ValueCellFull!10866) mapDefault!36071)) b!980319))

(assert (= start!83892 b!980317))

(declare-fun b_lambda!14745 () Bool)

(assert (=> (not b_lambda!14745) (not b!980314)))

(declare-fun t!29142 () Bool)

(declare-fun tb!6507 () Bool)

(assert (=> (and start!83892 (= defaultEntry!1281 defaultEntry!1281) t!29142) tb!6507))

(declare-fun result!13003 () Bool)

(assert (=> tb!6507 (= result!13003 tp_is_empty!22695)))

(assert (=> b!980314 t!29142))

(declare-fun b_and!31493 () Bool)

(assert (= b_and!31491 (and (=> t!29142 result!13003) b_and!31493)))

(declare-fun m!907795 () Bool)

(assert (=> b!980316 m!907795))

(assert (=> b!980316 m!907795))

(declare-fun m!907797 () Bool)

(assert (=> b!980316 m!907797))

(declare-fun m!907799 () Bool)

(assert (=> b!980321 m!907799))

(declare-fun m!907801 () Bool)

(assert (=> start!83892 m!907801))

(declare-fun m!907803 () Bool)

(assert (=> start!83892 m!907803))

(declare-fun m!907805 () Bool)

(assert (=> start!83892 m!907805))

(declare-fun m!907807 () Bool)

(assert (=> b!980315 m!907807))

(assert (=> b!980315 m!907807))

(declare-fun m!907809 () Bool)

(assert (=> b!980315 m!907809))

(assert (=> b!980315 m!907795))

(assert (=> b!980315 m!907795))

(declare-fun m!907811 () Bool)

(assert (=> b!980315 m!907811))

(declare-fun m!907813 () Bool)

(assert (=> b!980313 m!907813))

(declare-fun m!907815 () Bool)

(assert (=> mapNonEmpty!36071 m!907815))

(assert (=> b!980314 m!907795))

(declare-fun m!907817 () Bool)

(assert (=> b!980314 m!907817))

(assert (=> b!980314 m!907795))

(declare-fun m!907819 () Bool)

(assert (=> b!980314 m!907819))

(declare-fun m!907821 () Bool)

(assert (=> b!980314 m!907821))

(declare-fun m!907823 () Bool)

(assert (=> b!980314 m!907823))

(declare-fun m!907825 () Bool)

(assert (=> b!980314 m!907825))

(declare-fun m!907827 () Bool)

(assert (=> b!980314 m!907827))

(declare-fun m!907829 () Bool)

(assert (=> b!980314 m!907829))

(declare-fun m!907831 () Bool)

(assert (=> b!980314 m!907831))

(declare-fun m!907833 () Bool)

(assert (=> b!980314 m!907833))

(assert (=> b!980314 m!907829))

(assert (=> b!980314 m!907833))

(declare-fun m!907835 () Bool)

(assert (=> b!980314 m!907835))

(check-sat (not b_next!19701) (not start!83892) (not b!980315) (not b!980314) (not b!980321) tp_is_empty!22695 (not mapNonEmpty!36071) b_and!31493 (not b_lambda!14745) (not b!980313) (not b!980316))
(check-sat b_and!31493 (not b_next!19701))
