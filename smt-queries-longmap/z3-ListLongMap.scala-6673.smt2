; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84178 () Bool)

(assert start!84178)

(declare-fun b_free!19765 () Bool)

(declare-fun b_next!19765 () Bool)

(assert (=> start!84178 (= b_free!19765 (not b_next!19765))))

(declare-fun tp!68818 () Bool)

(declare-fun b_and!31623 () Bool)

(assert (=> start!84178 (= tp!68818 b_and!31623)))

(declare-fun b!982832 () Bool)

(declare-fun res!657435 () Bool)

(declare-fun e!554118 () Bool)

(assert (=> b!982832 (=> (not res!657435) (not e!554118))))

(declare-datatypes ((array!61658 0))(
  ( (array!61659 (arr!29682 (Array (_ BitVec 32) (_ BitVec 64))) (size!30162 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61658)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61658 (_ BitVec 32)) Bool)

(assert (=> b!982832 (= res!657435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36248 () Bool)

(declare-fun mapRes!36248 () Bool)

(declare-fun tp!68819 () Bool)

(declare-fun e!554117 () Bool)

(assert (=> mapNonEmpty!36248 (= mapRes!36248 (and tp!68819 e!554117))))

(declare-fun mapKey!36248 () (_ BitVec 32))

(declare-datatypes ((V!35401 0))(
  ( (V!35402 (val!11457 Int)) )
))
(declare-datatypes ((ValueCell!10925 0))(
  ( (ValueCellFull!10925 (v!14016 V!35401)) (EmptyCell!10925) )
))
(declare-datatypes ((array!61660 0))(
  ( (array!61661 (arr!29683 (Array (_ BitVec 32) ValueCell!10925)) (size!30163 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61660)

(declare-fun mapValue!36248 () ValueCell!10925)

(declare-fun mapRest!36248 () (Array (_ BitVec 32) ValueCell!10925))

(assert (=> mapNonEmpty!36248 (= (arr!29683 _values!1278) (store mapRest!36248 mapKey!36248 mapValue!36248))))

(declare-fun b!982833 () Bool)

(declare-fun res!657441 () Bool)

(assert (=> b!982833 (=> (not res!657441) (not e!554118))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!982833 (= res!657441 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!982834 () Bool)

(declare-fun res!657440 () Bool)

(assert (=> b!982834 (=> (not res!657440) (not e!554118))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!982834 (= res!657440 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30162 _keys!1544))))))

(declare-fun b!982835 () Bool)

(declare-fun e!554115 () Bool)

(assert (=> b!982835 (= e!554115 (not true))))

(declare-datatypes ((tuple2!14686 0))(
  ( (tuple2!14687 (_1!7354 (_ BitVec 64)) (_2!7354 V!35401)) )
))
(declare-datatypes ((List!20563 0))(
  ( (Nil!20560) (Cons!20559 (h!21727 tuple2!14686) (t!29270 List!20563)) )
))
(declare-datatypes ((ListLongMap!13385 0))(
  ( (ListLongMap!13386 (toList!6708 List!20563)) )
))
(declare-fun lt!436280 () ListLongMap!13385)

(declare-fun lt!436278 () tuple2!14686)

(declare-fun lt!436281 () tuple2!14686)

(declare-fun +!3018 (ListLongMap!13385 tuple2!14686) ListLongMap!13385)

(assert (=> b!982835 (= (+!3018 (+!3018 lt!436280 lt!436278) lt!436281) (+!3018 (+!3018 lt!436280 lt!436281) lt!436278))))

(declare-fun lt!436279 () V!35401)

(assert (=> b!982835 (= lt!436281 (tuple2!14687 (select (arr!29682 _keys!1544) from!1932) lt!436279))))

(declare-fun zeroValue!1220 () V!35401)

(assert (=> b!982835 (= lt!436278 (tuple2!14687 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32616 0))(
  ( (Unit!32617) )
))
(declare-fun lt!436277 () Unit!32616)

(declare-fun addCommutativeForDiffKeys!625 (ListLongMap!13385 (_ BitVec 64) V!35401 (_ BitVec 64) V!35401) Unit!32616)

(assert (=> b!982835 (= lt!436277 (addCommutativeForDiffKeys!625 lt!436280 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29682 _keys!1544) from!1932) lt!436279))))

(declare-fun b!982836 () Bool)

(assert (=> b!982836 (= e!554118 e!554115)))

(declare-fun res!657437 () Bool)

(assert (=> b!982836 (=> (not res!657437) (not e!554115))))

(assert (=> b!982836 (= res!657437 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29682 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15414 (ValueCell!10925 V!35401) V!35401)

(declare-fun dynLambda!1811 (Int (_ BitVec 64)) V!35401)

(assert (=> b!982836 (= lt!436279 (get!15414 (select (arr!29683 _values!1278) from!1932) (dynLambda!1811 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35401)

(declare-fun getCurrentListMapNoExtraKeys!3452 (array!61658 array!61660 (_ BitVec 32) (_ BitVec 32) V!35401 V!35401 (_ BitVec 32) Int) ListLongMap!13385)

(assert (=> b!982836 (= lt!436280 (getCurrentListMapNoExtraKeys!3452 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapIsEmpty!36248 () Bool)

(assert (=> mapIsEmpty!36248 mapRes!36248))

(declare-fun b!982837 () Bool)

(declare-fun res!657442 () Bool)

(assert (=> b!982837 (=> (not res!657442) (not e!554118))))

(assert (=> b!982837 (= res!657442 (and (= (size!30163 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30162 _keys!1544) (size!30163 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982838 () Bool)

(declare-fun e!554116 () Bool)

(declare-fun tp_is_empty!22813 () Bool)

(assert (=> b!982838 (= e!554116 tp_is_empty!22813)))

(declare-fun b!982839 () Bool)

(declare-fun res!657439 () Bool)

(assert (=> b!982839 (=> (not res!657439) (not e!554118))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982839 (= res!657439 (validKeyInArray!0 (select (arr!29682 _keys!1544) from!1932)))))

(declare-fun res!657436 () Bool)

(assert (=> start!84178 (=> (not res!657436) (not e!554118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84178 (= res!657436 (validMask!0 mask!1948))))

(assert (=> start!84178 e!554118))

(assert (=> start!84178 true))

(assert (=> start!84178 tp_is_empty!22813))

(declare-fun e!554113 () Bool)

(declare-fun array_inv!22971 (array!61660) Bool)

(assert (=> start!84178 (and (array_inv!22971 _values!1278) e!554113)))

(assert (=> start!84178 tp!68818))

(declare-fun array_inv!22972 (array!61658) Bool)

(assert (=> start!84178 (array_inv!22972 _keys!1544)))

(declare-fun b!982840 () Bool)

(assert (=> b!982840 (= e!554117 tp_is_empty!22813)))

(declare-fun b!982841 () Bool)

(assert (=> b!982841 (= e!554113 (and e!554116 mapRes!36248))))

(declare-fun condMapEmpty!36248 () Bool)

(declare-fun mapDefault!36248 () ValueCell!10925)

(assert (=> b!982841 (= condMapEmpty!36248 (= (arr!29683 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10925)) mapDefault!36248)))))

(declare-fun b!982842 () Bool)

(declare-fun res!657438 () Bool)

(assert (=> b!982842 (=> (not res!657438) (not e!554118))))

(declare-datatypes ((List!20564 0))(
  ( (Nil!20561) (Cons!20560 (h!21728 (_ BitVec 64)) (t!29271 List!20564)) )
))
(declare-fun arrayNoDuplicates!0 (array!61658 (_ BitVec 32) List!20564) Bool)

(assert (=> b!982842 (= res!657438 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20561))))

(assert (= (and start!84178 res!657436) b!982837))

(assert (= (and b!982837 res!657442) b!982832))

(assert (= (and b!982832 res!657435) b!982842))

(assert (= (and b!982842 res!657438) b!982834))

(assert (= (and b!982834 res!657440) b!982839))

(assert (= (and b!982839 res!657439) b!982833))

(assert (= (and b!982833 res!657441) b!982836))

(assert (= (and b!982836 res!657437) b!982835))

(assert (= (and b!982841 condMapEmpty!36248) mapIsEmpty!36248))

(assert (= (and b!982841 (not condMapEmpty!36248)) mapNonEmpty!36248))

(get-info :version)

(assert (= (and mapNonEmpty!36248 ((_ is ValueCellFull!10925) mapValue!36248)) b!982840))

(assert (= (and b!982841 ((_ is ValueCellFull!10925) mapDefault!36248)) b!982838))

(assert (= start!84178 b!982841))

(declare-fun b_lambda!14817 () Bool)

(assert (=> (not b_lambda!14817) (not b!982836)))

(declare-fun t!29269 () Bool)

(declare-fun tb!6557 () Bool)

(assert (=> (and start!84178 (= defaultEntry!1281 defaultEntry!1281) t!29269) tb!6557))

(declare-fun result!13111 () Bool)

(assert (=> tb!6557 (= result!13111 tp_is_empty!22813)))

(assert (=> b!982836 t!29269))

(declare-fun b_and!31625 () Bool)

(assert (= b_and!31623 (and (=> t!29269 result!13111) b_and!31625)))

(declare-fun m!910577 () Bool)

(assert (=> b!982836 m!910577))

(declare-fun m!910579 () Bool)

(assert (=> b!982836 m!910579))

(declare-fun m!910581 () Bool)

(assert (=> b!982836 m!910581))

(declare-fun m!910583 () Bool)

(assert (=> b!982836 m!910583))

(assert (=> b!982836 m!910579))

(assert (=> b!982836 m!910583))

(declare-fun m!910585 () Bool)

(assert (=> b!982836 m!910585))

(declare-fun m!910587 () Bool)

(assert (=> start!84178 m!910587))

(declare-fun m!910589 () Bool)

(assert (=> start!84178 m!910589))

(declare-fun m!910591 () Bool)

(assert (=> start!84178 m!910591))

(declare-fun m!910593 () Bool)

(assert (=> mapNonEmpty!36248 m!910593))

(assert (=> b!982835 m!910577))

(declare-fun m!910595 () Bool)

(assert (=> b!982835 m!910595))

(assert (=> b!982835 m!910577))

(declare-fun m!910597 () Bool)

(assert (=> b!982835 m!910597))

(declare-fun m!910599 () Bool)

(assert (=> b!982835 m!910599))

(assert (=> b!982835 m!910595))

(declare-fun m!910601 () Bool)

(assert (=> b!982835 m!910601))

(assert (=> b!982835 m!910599))

(declare-fun m!910603 () Bool)

(assert (=> b!982835 m!910603))

(declare-fun m!910605 () Bool)

(assert (=> b!982832 m!910605))

(declare-fun m!910607 () Bool)

(assert (=> b!982842 m!910607))

(assert (=> b!982839 m!910577))

(assert (=> b!982839 m!910577))

(declare-fun m!910609 () Bool)

(assert (=> b!982839 m!910609))

(check-sat (not start!84178) b_and!31625 tp_is_empty!22813 (not b!982836) (not b!982842) (not b_next!19765) (not mapNonEmpty!36248) (not b!982832) (not b!982835) (not b_lambda!14817) (not b!982839))
(check-sat b_and!31625 (not b_next!19765))
