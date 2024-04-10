; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84006 () Bool)

(assert start!84006)

(declare-fun b_free!19761 () Bool)

(declare-fun b_next!19761 () Bool)

(assert (=> start!84006 (= b_free!19761 (not b_next!19761))))

(declare-fun tp!68806 () Bool)

(declare-fun b_and!31605 () Bool)

(assert (=> start!84006 (= tp!68806 b_and!31605)))

(declare-fun b!981859 () Bool)

(declare-fun e!553498 () Bool)

(declare-fun tp_is_empty!22809 () Bool)

(assert (=> b!981859 (= e!553498 tp_is_empty!22809)))

(declare-fun b!981860 () Bool)

(declare-fun e!553500 () Bool)

(assert (=> b!981860 (= e!553500 tp_is_empty!22809)))

(declare-fun b!981861 () Bool)

(declare-fun e!553497 () Bool)

(declare-fun mapRes!36242 () Bool)

(assert (=> b!981861 (= e!553497 (and e!553500 mapRes!36242))))

(declare-fun condMapEmpty!36242 () Bool)

(declare-datatypes ((V!35395 0))(
  ( (V!35396 (val!11455 Int)) )
))
(declare-datatypes ((ValueCell!10923 0))(
  ( (ValueCellFull!10923 (v!14017 V!35395)) (EmptyCell!10923) )
))
(declare-datatypes ((array!61613 0))(
  ( (array!61614 (arr!29664 (Array (_ BitVec 32) ValueCell!10923)) (size!30143 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61613)

(declare-fun mapDefault!36242 () ValueCell!10923)

(assert (=> b!981861 (= condMapEmpty!36242 (= (arr!29664 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10923)) mapDefault!36242)))))

(declare-fun b!981862 () Bool)

(declare-fun res!657048 () Bool)

(declare-fun e!553496 () Bool)

(assert (=> b!981862 (=> (not res!657048) (not e!553496))))

(declare-datatypes ((array!61615 0))(
  ( (array!61616 (arr!29665 (Array (_ BitVec 32) (_ BitVec 64))) (size!30144 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61615)

(declare-datatypes ((List!20548 0))(
  ( (Nil!20545) (Cons!20544 (h!21706 (_ BitVec 64)) (t!29259 List!20548)) )
))
(declare-fun arrayNoDuplicates!0 (array!61615 (_ BitVec 32) List!20548) Bool)

(assert (=> b!981862 (= res!657048 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20545))))

(declare-fun mapIsEmpty!36242 () Bool)

(assert (=> mapIsEmpty!36242 mapRes!36242))

(declare-fun res!657045 () Bool)

(assert (=> start!84006 (=> (not res!657045) (not e!553496))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84006 (= res!657045 (validMask!0 mask!1948))))

(assert (=> start!84006 e!553496))

(assert (=> start!84006 true))

(assert (=> start!84006 tp_is_empty!22809))

(declare-fun array_inv!22937 (array!61613) Bool)

(assert (=> start!84006 (and (array_inv!22937 _values!1278) e!553497)))

(assert (=> start!84006 tp!68806))

(declare-fun array_inv!22938 (array!61615) Bool)

(assert (=> start!84006 (array_inv!22938 _keys!1544)))

(declare-fun b!981863 () Bool)

(declare-fun e!553495 () Bool)

(assert (=> b!981863 (= e!553496 e!553495)))

(declare-fun res!657044 () Bool)

(assert (=> b!981863 (=> (not res!657044) (not e!553495))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!981863 (= res!657044 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29665 _keys!1544) from!1932))))))

(declare-fun lt!435887 () V!35395)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15377 (ValueCell!10923 V!35395) V!35395)

(declare-fun dynLambda!1780 (Int (_ BitVec 64)) V!35395)

(assert (=> b!981863 (= lt!435887 (get!15377 (select (arr!29664 _values!1278) from!1932) (dynLambda!1780 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35395)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35395)

(declare-datatypes ((tuple2!14666 0))(
  ( (tuple2!14667 (_1!7344 (_ BitVec 64)) (_2!7344 V!35395)) )
))
(declare-datatypes ((List!20549 0))(
  ( (Nil!20546) (Cons!20545 (h!21707 tuple2!14666) (t!29260 List!20549)) )
))
(declare-datatypes ((ListLongMap!13363 0))(
  ( (ListLongMap!13364 (toList!6697 List!20549)) )
))
(declare-fun lt!435889 () ListLongMap!13363)

(declare-fun getCurrentListMapNoExtraKeys!3397 (array!61615 array!61613 (_ BitVec 32) (_ BitVec 32) V!35395 V!35395 (_ BitVec 32) Int) ListLongMap!13363)

(assert (=> b!981863 (= lt!435889 (getCurrentListMapNoExtraKeys!3397 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!981864 () Bool)

(declare-fun res!657047 () Bool)

(assert (=> b!981864 (=> (not res!657047) (not e!553496))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61615 (_ BitVec 32)) Bool)

(assert (=> b!981864 (= res!657047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981865 () Bool)

(declare-fun res!657043 () Bool)

(assert (=> b!981865 (=> (not res!657043) (not e!553496))))

(assert (=> b!981865 (= res!657043 (and (= (size!30143 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30144 _keys!1544) (size!30143 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981866 () Bool)

(declare-fun res!657046 () Bool)

(assert (=> b!981866 (=> (not res!657046) (not e!553496))))

(assert (=> b!981866 (= res!657046 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30144 _keys!1544))))))

(declare-fun b!981867 () Bool)

(assert (=> b!981867 (= e!553495 (not true))))

(declare-fun lt!435888 () tuple2!14666)

(declare-fun lt!435886 () tuple2!14666)

(declare-fun +!2997 (ListLongMap!13363 tuple2!14666) ListLongMap!13363)

(assert (=> b!981867 (= (+!2997 (+!2997 lt!435889 lt!435888) lt!435886) (+!2997 (+!2997 lt!435889 lt!435886) lt!435888))))

(assert (=> b!981867 (= lt!435886 (tuple2!14667 (select (arr!29665 _keys!1544) from!1932) lt!435887))))

(assert (=> b!981867 (= lt!435888 (tuple2!14667 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32633 0))(
  ( (Unit!32634) )
))
(declare-fun lt!435890 () Unit!32633)

(declare-fun addCommutativeForDiffKeys!625 (ListLongMap!13363 (_ BitVec 64) V!35395 (_ BitVec 64) V!35395) Unit!32633)

(assert (=> b!981867 (= lt!435890 (addCommutativeForDiffKeys!625 lt!435889 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29665 _keys!1544) from!1932) lt!435887))))

(declare-fun b!981868 () Bool)

(declare-fun res!657050 () Bool)

(assert (=> b!981868 (=> (not res!657050) (not e!553496))))

(assert (=> b!981868 (= res!657050 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!36242 () Bool)

(declare-fun tp!68805 () Bool)

(assert (=> mapNonEmpty!36242 (= mapRes!36242 (and tp!68805 e!553498))))

(declare-fun mapRest!36242 () (Array (_ BitVec 32) ValueCell!10923))

(declare-fun mapKey!36242 () (_ BitVec 32))

(declare-fun mapValue!36242 () ValueCell!10923)

(assert (=> mapNonEmpty!36242 (= (arr!29664 _values!1278) (store mapRest!36242 mapKey!36242 mapValue!36242))))

(declare-fun b!981869 () Bool)

(declare-fun res!657049 () Bool)

(assert (=> b!981869 (=> (not res!657049) (not e!553496))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981869 (= res!657049 (validKeyInArray!0 (select (arr!29665 _keys!1544) from!1932)))))

(assert (= (and start!84006 res!657045) b!981865))

(assert (= (and b!981865 res!657043) b!981864))

(assert (= (and b!981864 res!657047) b!981862))

(assert (= (and b!981862 res!657048) b!981866))

(assert (= (and b!981866 res!657046) b!981869))

(assert (= (and b!981869 res!657049) b!981868))

(assert (= (and b!981868 res!657050) b!981863))

(assert (= (and b!981863 res!657044) b!981867))

(assert (= (and b!981861 condMapEmpty!36242) mapIsEmpty!36242))

(assert (= (and b!981861 (not condMapEmpty!36242)) mapNonEmpty!36242))

(get-info :version)

(assert (= (and mapNonEmpty!36242 ((_ is ValueCellFull!10923) mapValue!36242)) b!981859))

(assert (= (and b!981861 ((_ is ValueCellFull!10923) mapDefault!36242)) b!981860))

(assert (= start!84006 b!981861))

(declare-fun b_lambda!14799 () Bool)

(assert (=> (not b_lambda!14799) (not b!981863)))

(declare-fun t!29258 () Bool)

(declare-fun tb!6561 () Bool)

(assert (=> (and start!84006 (= defaultEntry!1281 defaultEntry!1281) t!29258) tb!6561))

(declare-fun result!13111 () Bool)

(assert (=> tb!6561 (= result!13111 tp_is_empty!22809)))

(assert (=> b!981863 t!29258))

(declare-fun b_and!31607 () Bool)

(assert (= b_and!31605 (and (=> t!29258 result!13111) b_and!31607)))

(declare-fun m!909215 () Bool)

(assert (=> b!981867 m!909215))

(declare-fun m!909217 () Bool)

(assert (=> b!981867 m!909217))

(declare-fun m!909219 () Bool)

(assert (=> b!981867 m!909219))

(declare-fun m!909221 () Bool)

(assert (=> b!981867 m!909221))

(assert (=> b!981867 m!909217))

(declare-fun m!909223 () Bool)

(assert (=> b!981867 m!909223))

(assert (=> b!981867 m!909219))

(assert (=> b!981867 m!909215))

(declare-fun m!909225 () Bool)

(assert (=> b!981867 m!909225))

(assert (=> b!981869 m!909217))

(assert (=> b!981869 m!909217))

(declare-fun m!909227 () Bool)

(assert (=> b!981869 m!909227))

(declare-fun m!909229 () Bool)

(assert (=> b!981864 m!909229))

(declare-fun m!909231 () Bool)

(assert (=> mapNonEmpty!36242 m!909231))

(assert (=> b!981863 m!909217))

(declare-fun m!909233 () Bool)

(assert (=> b!981863 m!909233))

(declare-fun m!909235 () Bool)

(assert (=> b!981863 m!909235))

(declare-fun m!909237 () Bool)

(assert (=> b!981863 m!909237))

(assert (=> b!981863 m!909233))

(assert (=> b!981863 m!909237))

(declare-fun m!909239 () Bool)

(assert (=> b!981863 m!909239))

(declare-fun m!909241 () Bool)

(assert (=> start!84006 m!909241))

(declare-fun m!909243 () Bool)

(assert (=> start!84006 m!909243))

(declare-fun m!909245 () Bool)

(assert (=> start!84006 m!909245))

(declare-fun m!909247 () Bool)

(assert (=> b!981862 m!909247))

(check-sat b_and!31607 (not b!981867) (not b!981869) (not b!981864) (not b_lambda!14799) (not b!981863) tp_is_empty!22809 (not b!981862) (not mapNonEmpty!36242) (not b_next!19761) (not start!84006))
(check-sat b_and!31607 (not b_next!19761))
