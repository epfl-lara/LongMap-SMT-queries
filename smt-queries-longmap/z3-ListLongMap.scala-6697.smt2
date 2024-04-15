; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84136 () Bool)

(assert start!84136)

(declare-fun b_free!19855 () Bool)

(declare-fun b_next!19855 () Bool)

(assert (=> start!84136 (= b_free!19855 (not b_next!19855))))

(declare-fun tp!69170 () Bool)

(declare-fun b_and!31761 () Bool)

(assert (=> start!84136 (= tp!69170 b_and!31761)))

(declare-fun b!983763 () Bool)

(declare-fun e!554590 () Bool)

(declare-fun tp_is_empty!22957 () Bool)

(assert (=> b!983763 (= e!554590 tp_is_empty!22957)))

(declare-fun mapNonEmpty!36464 () Bool)

(declare-fun mapRes!36464 () Bool)

(declare-fun tp!69169 () Bool)

(assert (=> mapNonEmpty!36464 (= mapRes!36464 (and tp!69169 e!554590))))

(declare-datatypes ((V!35593 0))(
  ( (V!35594 (val!11529 Int)) )
))
(declare-datatypes ((ValueCell!10997 0))(
  ( (ValueCellFull!10997 (v!14090 V!35593)) (EmptyCell!10997) )
))
(declare-datatypes ((array!61824 0))(
  ( (array!61825 (arr!29770 (Array (_ BitVec 32) ValueCell!10997)) (size!30251 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61824)

(declare-fun mapKey!36464 () (_ BitVec 32))

(declare-fun mapRest!36464 () (Array (_ BitVec 32) ValueCell!10997))

(declare-fun mapValue!36464 () ValueCell!10997)

(assert (=> mapNonEmpty!36464 (= (arr!29770 _values!1278) (store mapRest!36464 mapKey!36464 mapValue!36464))))

(declare-fun b!983764 () Bool)

(declare-fun res!658322 () Bool)

(declare-fun e!554589 () Bool)

(assert (=> b!983764 (=> (not res!658322) (not e!554589))))

(declare-datatypes ((array!61826 0))(
  ( (array!61827 (arr!29771 (Array (_ BitVec 32) (_ BitVec 64))) (size!30252 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61826)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61826 (_ BitVec 32)) Bool)

(assert (=> b!983764 (= res!658322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983765 () Bool)

(declare-fun e!554594 () Bool)

(assert (=> b!983765 (= e!554589 e!554594)))

(declare-fun res!658326 () Bool)

(assert (=> b!983765 (=> (not res!658326) (not e!554594))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!983765 (= res!658326 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29771 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!436395 () V!35593)

(declare-fun get!15455 (ValueCell!10997 V!35593) V!35593)

(declare-fun dynLambda!1803 (Int (_ BitVec 64)) V!35593)

(assert (=> b!983765 (= lt!436395 (get!15455 (select (arr!29770 _values!1278) from!1932) (dynLambda!1803 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35593)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14816 0))(
  ( (tuple2!14817 (_1!7419 (_ BitVec 64)) (_2!7419 V!35593)) )
))
(declare-datatypes ((List!20671 0))(
  ( (Nil!20668) (Cons!20667 (h!21829 tuple2!14816) (t!29461 List!20671)) )
))
(declare-datatypes ((ListLongMap!13503 0))(
  ( (ListLongMap!13504 (toList!6767 List!20671)) )
))
(declare-fun lt!436394 () ListLongMap!13503)

(declare-fun zeroValue!1220 () V!35593)

(declare-fun getCurrentListMapNoExtraKeys!3475 (array!61826 array!61824 (_ BitVec 32) (_ BitVec 32) V!35593 V!35593 (_ BitVec 32) Int) ListLongMap!13503)

(assert (=> b!983765 (= lt!436394 (getCurrentListMapNoExtraKeys!3475 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapIsEmpty!36464 () Bool)

(assert (=> mapIsEmpty!36464 mapRes!36464))

(declare-fun b!983766 () Bool)

(declare-fun res!658325 () Bool)

(assert (=> b!983766 (=> (not res!658325) (not e!554589))))

(assert (=> b!983766 (= res!658325 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30252 _keys!1544))))))

(declare-fun b!983767 () Bool)

(declare-fun e!554591 () Bool)

(declare-fun e!554592 () Bool)

(assert (=> b!983767 (= e!554591 (and e!554592 mapRes!36464))))

(declare-fun condMapEmpty!36464 () Bool)

(declare-fun mapDefault!36464 () ValueCell!10997)

(assert (=> b!983767 (= condMapEmpty!36464 (= (arr!29770 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10997)) mapDefault!36464)))))

(declare-fun b!983768 () Bool)

(declare-fun res!658328 () Bool)

(assert (=> b!983768 (=> (not res!658328) (not e!554589))))

(assert (=> b!983768 (= res!658328 (and (= (size!30251 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30252 _keys!1544) (size!30251 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!658329 () Bool)

(assert (=> start!84136 (=> (not res!658329) (not e!554589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84136 (= res!658329 (validMask!0 mask!1948))))

(assert (=> start!84136 e!554589))

(assert (=> start!84136 true))

(assert (=> start!84136 tp_is_empty!22957))

(declare-fun array_inv!23025 (array!61824) Bool)

(assert (=> start!84136 (and (array_inv!23025 _values!1278) e!554591)))

(assert (=> start!84136 tp!69170))

(declare-fun array_inv!23026 (array!61826) Bool)

(assert (=> start!84136 (array_inv!23026 _keys!1544)))

(declare-fun b!983769 () Bool)

(assert (=> b!983769 (= e!554592 tp_is_empty!22957)))

(declare-fun b!983770 () Bool)

(declare-fun res!658327 () Bool)

(assert (=> b!983770 (=> (not res!658327) (not e!554589))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!983770 (= res!658327 (validKeyInArray!0 (select (arr!29771 _keys!1544) from!1932)))))

(declare-fun b!983771 () Bool)

(declare-fun res!658324 () Bool)

(assert (=> b!983771 (=> (not res!658324) (not e!554589))))

(declare-datatypes ((List!20672 0))(
  ( (Nil!20669) (Cons!20668 (h!21830 (_ BitVec 64)) (t!29462 List!20672)) )
))
(declare-fun arrayNoDuplicates!0 (array!61826 (_ BitVec 32) List!20672) Bool)

(assert (=> b!983771 (= res!658324 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20669))))

(declare-fun b!983772 () Bool)

(declare-fun res!658323 () Bool)

(assert (=> b!983772 (=> (not res!658323) (not e!554589))))

(assert (=> b!983772 (= res!658323 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!983773 () Bool)

(assert (=> b!983773 (= e!554594 (not true))))

(declare-fun lt!436392 () tuple2!14816)

(declare-fun lt!436393 () tuple2!14816)

(declare-fun +!3051 (ListLongMap!13503 tuple2!14816) ListLongMap!13503)

(assert (=> b!983773 (= (+!3051 (+!3051 lt!436394 lt!436392) lt!436393) (+!3051 (+!3051 lt!436394 lt!436393) lt!436392))))

(assert (=> b!983773 (= lt!436393 (tuple2!14817 (select (arr!29771 _keys!1544) from!1932) lt!436395))))

(assert (=> b!983773 (= lt!436392 (tuple2!14817 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32568 0))(
  ( (Unit!32569) )
))
(declare-fun lt!436391 () Unit!32568)

(declare-fun addCommutativeForDiffKeys!655 (ListLongMap!13503 (_ BitVec 64) V!35593 (_ BitVec 64) V!35593) Unit!32568)

(assert (=> b!983773 (= lt!436391 (addCommutativeForDiffKeys!655 lt!436394 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29771 _keys!1544) from!1932) lt!436395))))

(assert (= (and start!84136 res!658329) b!983768))

(assert (= (and b!983768 res!658328) b!983764))

(assert (= (and b!983764 res!658322) b!983771))

(assert (= (and b!983771 res!658324) b!983766))

(assert (= (and b!983766 res!658325) b!983770))

(assert (= (and b!983770 res!658327) b!983772))

(assert (= (and b!983772 res!658323) b!983765))

(assert (= (and b!983765 res!658326) b!983773))

(assert (= (and b!983767 condMapEmpty!36464) mapIsEmpty!36464))

(assert (= (and b!983767 (not condMapEmpty!36464)) mapNonEmpty!36464))

(get-info :version)

(assert (= (and mapNonEmpty!36464 ((_ is ValueCellFull!10997) mapValue!36464)) b!983763))

(assert (= (and b!983767 ((_ is ValueCellFull!10997) mapDefault!36464)) b!983769))

(assert (= start!84136 b!983767))

(declare-fun b_lambda!14869 () Bool)

(assert (=> (not b_lambda!14869) (not b!983765)))

(declare-fun t!29460 () Bool)

(declare-fun tb!6641 () Bool)

(assert (=> (and start!84136 (= defaultEntry!1281 defaultEntry!1281) t!29460) tb!6641))

(declare-fun result!13279 () Bool)

(assert (=> tb!6641 (= result!13279 tp_is_empty!22957)))

(assert (=> b!983765 t!29460))

(declare-fun b_and!31763 () Bool)

(assert (= b_and!31761 (and (=> t!29460 result!13279) b_and!31763)))

(declare-fun m!910343 () Bool)

(assert (=> b!983771 m!910343))

(declare-fun m!910345 () Bool)

(assert (=> b!983770 m!910345))

(assert (=> b!983770 m!910345))

(declare-fun m!910347 () Bool)

(assert (=> b!983770 m!910347))

(declare-fun m!910349 () Bool)

(assert (=> start!84136 m!910349))

(declare-fun m!910351 () Bool)

(assert (=> start!84136 m!910351))

(declare-fun m!910353 () Bool)

(assert (=> start!84136 m!910353))

(assert (=> b!983765 m!910345))

(declare-fun m!910355 () Bool)

(assert (=> b!983765 m!910355))

(declare-fun m!910357 () Bool)

(assert (=> b!983765 m!910357))

(declare-fun m!910359 () Bool)

(assert (=> b!983765 m!910359))

(assert (=> b!983765 m!910355))

(assert (=> b!983765 m!910359))

(declare-fun m!910361 () Bool)

(assert (=> b!983765 m!910361))

(declare-fun m!910363 () Bool)

(assert (=> b!983764 m!910363))

(assert (=> b!983773 m!910345))

(declare-fun m!910365 () Bool)

(assert (=> b!983773 m!910365))

(declare-fun m!910367 () Bool)

(assert (=> b!983773 m!910367))

(declare-fun m!910369 () Bool)

(assert (=> b!983773 m!910369))

(assert (=> b!983773 m!910367))

(assert (=> b!983773 m!910365))

(declare-fun m!910371 () Bool)

(assert (=> b!983773 m!910371))

(assert (=> b!983773 m!910345))

(declare-fun m!910373 () Bool)

(assert (=> b!983773 m!910373))

(declare-fun m!910375 () Bool)

(assert (=> mapNonEmpty!36464 m!910375))

(check-sat (not b!983773) b_and!31763 (not mapNonEmpty!36464) (not b!983764) (not b!983765) (not start!84136) tp_is_empty!22957 (not b_lambda!14869) (not b!983771) (not b!983770) (not b_next!19855))
(check-sat b_and!31763 (not b_next!19855))
