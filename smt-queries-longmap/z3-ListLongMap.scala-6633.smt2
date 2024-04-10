; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83772 () Bool)

(assert start!83772)

(declare-fun b_free!19581 () Bool)

(declare-fun b_next!19581 () Bool)

(assert (=> start!83772 (= b_free!19581 (not b_next!19581))))

(declare-fun tp!68184 () Bool)

(declare-fun b_and!31251 () Bool)

(assert (=> start!83772 (= tp!68184 b_and!31251)))

(declare-fun b!978269 () Bool)

(declare-fun res!654680 () Bool)

(declare-fun e!551541 () Bool)

(assert (=> b!978269 (=> (not res!654680) (not e!551541))))

(declare-datatypes ((array!61177 0))(
  ( (array!61178 (arr!29446 (Array (_ BitVec 32) (_ BitVec 64))) (size!29925 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61177)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61177 (_ BitVec 32)) Bool)

(assert (=> b!978269 (= res!654680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978270 () Bool)

(declare-fun e!551538 () Bool)

(declare-fun tp_is_empty!22575 () Bool)

(assert (=> b!978270 (= e!551538 tp_is_empty!22575)))

(declare-fun mapNonEmpty!35891 () Bool)

(declare-fun mapRes!35891 () Bool)

(declare-fun tp!68185 () Bool)

(declare-fun e!551539 () Bool)

(assert (=> mapNonEmpty!35891 (= mapRes!35891 (and tp!68185 e!551539))))

(declare-fun mapKey!35891 () (_ BitVec 32))

(declare-datatypes ((V!35083 0))(
  ( (V!35084 (val!11338 Int)) )
))
(declare-datatypes ((ValueCell!10806 0))(
  ( (ValueCellFull!10806 (v!13900 V!35083)) (EmptyCell!10806) )
))
(declare-datatypes ((array!61179 0))(
  ( (array!61180 (arr!29447 (Array (_ BitVec 32) ValueCell!10806)) (size!29926 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61179)

(declare-fun mapRest!35891 () (Array (_ BitVec 32) ValueCell!10806))

(declare-fun mapValue!35891 () ValueCell!10806)

(assert (=> mapNonEmpty!35891 (= (arr!29447 _values!1278) (store mapRest!35891 mapKey!35891 mapValue!35891))))

(declare-fun b!978271 () Bool)

(declare-fun res!654682 () Bool)

(assert (=> b!978271 (=> (not res!654682) (not e!551541))))

(declare-datatypes ((List!20408 0))(
  ( (Nil!20405) (Cons!20404 (h!21566 (_ BitVec 64)) (t!28945 List!20408)) )
))
(declare-fun arrayNoDuplicates!0 (array!61177 (_ BitVec 32) List!20408) Bool)

(assert (=> b!978271 (= res!654682 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20405))))

(declare-fun b!978272 () Bool)

(assert (=> b!978272 (= e!551541 (not true))))

(declare-datatypes ((tuple2!14536 0))(
  ( (tuple2!14537 (_1!7279 (_ BitVec 64)) (_2!7279 V!35083)) )
))
(declare-datatypes ((List!20409 0))(
  ( (Nil!20406) (Cons!20405 (h!21567 tuple2!14536) (t!28946 List!20409)) )
))
(declare-datatypes ((ListLongMap!13233 0))(
  ( (ListLongMap!13234 (toList!6632 List!20409)) )
))
(declare-fun lt!433691 () ListLongMap!13233)

(declare-fun lt!433692 () tuple2!14536)

(declare-fun lt!433694 () tuple2!14536)

(declare-fun +!2937 (ListLongMap!13233 tuple2!14536) ListLongMap!13233)

(assert (=> b!978272 (= (+!2937 (+!2937 lt!433691 lt!433692) lt!433694) (+!2937 (+!2937 lt!433691 lt!433694) lt!433692))))

(declare-fun lt!433690 () V!35083)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!978272 (= lt!433694 (tuple2!14537 (select (arr!29446 _keys!1544) from!1932) lt!433690))))

(declare-fun minValue!1220 () V!35083)

(assert (=> b!978272 (= lt!433692 (tuple2!14537 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32513 0))(
  ( (Unit!32514) )
))
(declare-fun lt!433693 () Unit!32513)

(declare-fun addCommutativeForDiffKeys!565 (ListLongMap!13233 (_ BitVec 64) V!35083 (_ BitVec 64) V!35083) Unit!32513)

(assert (=> b!978272 (= lt!433693 (addCommutativeForDiffKeys!565 lt!433691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29446 _keys!1544) from!1932) lt!433690))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15244 (ValueCell!10806 V!35083) V!35083)

(declare-fun dynLambda!1725 (Int (_ BitVec 64)) V!35083)

(assert (=> b!978272 (= lt!433690 (get!15244 (select (arr!29447 _values!1278) from!1932) (dynLambda!1725 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35083)

(declare-fun getCurrentListMapNoExtraKeys!3339 (array!61177 array!61179 (_ BitVec 32) (_ BitVec 32) V!35083 V!35083 (_ BitVec 32) Int) ListLongMap!13233)

(assert (=> b!978272 (= lt!433691 (+!2937 (getCurrentListMapNoExtraKeys!3339 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14537 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!978273 () Bool)

(declare-fun res!654683 () Bool)

(assert (=> b!978273 (=> (not res!654683) (not e!551541))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978273 (= res!654683 (validKeyInArray!0 (select (arr!29446 _keys!1544) from!1932)))))

(declare-fun b!978274 () Bool)

(declare-fun res!654686 () Bool)

(assert (=> b!978274 (=> (not res!654686) (not e!551541))))

(assert (=> b!978274 (= res!654686 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!978275 () Bool)

(declare-fun res!654684 () Bool)

(assert (=> b!978275 (=> (not res!654684) (not e!551541))))

(assert (=> b!978275 (= res!654684 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29925 _keys!1544))))))

(declare-fun b!978276 () Bool)

(declare-fun e!551540 () Bool)

(assert (=> b!978276 (= e!551540 (and e!551538 mapRes!35891))))

(declare-fun condMapEmpty!35891 () Bool)

(declare-fun mapDefault!35891 () ValueCell!10806)

(assert (=> b!978276 (= condMapEmpty!35891 (= (arr!29447 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10806)) mapDefault!35891)))))

(declare-fun mapIsEmpty!35891 () Bool)

(assert (=> mapIsEmpty!35891 mapRes!35891))

(declare-fun res!654681 () Bool)

(assert (=> start!83772 (=> (not res!654681) (not e!551541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83772 (= res!654681 (validMask!0 mask!1948))))

(assert (=> start!83772 e!551541))

(assert (=> start!83772 true))

(assert (=> start!83772 tp_is_empty!22575))

(declare-fun array_inv!22763 (array!61179) Bool)

(assert (=> start!83772 (and (array_inv!22763 _values!1278) e!551540)))

(assert (=> start!83772 tp!68184))

(declare-fun array_inv!22764 (array!61177) Bool)

(assert (=> start!83772 (array_inv!22764 _keys!1544)))

(declare-fun b!978277 () Bool)

(declare-fun res!654685 () Bool)

(assert (=> b!978277 (=> (not res!654685) (not e!551541))))

(assert (=> b!978277 (= res!654685 (and (= (size!29926 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29925 _keys!1544) (size!29926 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978278 () Bool)

(assert (=> b!978278 (= e!551539 tp_is_empty!22575)))

(assert (= (and start!83772 res!654681) b!978277))

(assert (= (and b!978277 res!654685) b!978269))

(assert (= (and b!978269 res!654680) b!978271))

(assert (= (and b!978271 res!654682) b!978275))

(assert (= (and b!978275 res!654684) b!978273))

(assert (= (and b!978273 res!654683) b!978274))

(assert (= (and b!978274 res!654686) b!978272))

(assert (= (and b!978276 condMapEmpty!35891) mapIsEmpty!35891))

(assert (= (and b!978276 (not condMapEmpty!35891)) mapNonEmpty!35891))

(get-info :version)

(assert (= (and mapNonEmpty!35891 ((_ is ValueCellFull!10806) mapValue!35891)) b!978278))

(assert (= (and b!978276 ((_ is ValueCellFull!10806) mapDefault!35891)) b!978270))

(assert (= start!83772 b!978276))

(declare-fun b_lambda!14625 () Bool)

(assert (=> (not b_lambda!14625) (not b!978272)))

(declare-fun t!28944 () Bool)

(declare-fun tb!6387 () Bool)

(assert (=> (and start!83772 (= defaultEntry!1281 defaultEntry!1281) t!28944) tb!6387))

(declare-fun result!12763 () Bool)

(assert (=> tb!6387 (= result!12763 tp_is_empty!22575)))

(assert (=> b!978272 t!28944))

(declare-fun b_and!31253 () Bool)

(assert (= b_and!31251 (and (=> t!28944 result!12763) b_and!31253)))

(declare-fun m!905395 () Bool)

(assert (=> mapNonEmpty!35891 m!905395))

(declare-fun m!905397 () Bool)

(assert (=> b!978273 m!905397))

(assert (=> b!978273 m!905397))

(declare-fun m!905399 () Bool)

(assert (=> b!978273 m!905399))

(declare-fun m!905401 () Bool)

(assert (=> start!83772 m!905401))

(declare-fun m!905403 () Bool)

(assert (=> start!83772 m!905403))

(declare-fun m!905405 () Bool)

(assert (=> start!83772 m!905405))

(declare-fun m!905407 () Bool)

(assert (=> b!978271 m!905407))

(declare-fun m!905409 () Bool)

(assert (=> b!978269 m!905409))

(declare-fun m!905411 () Bool)

(assert (=> b!978272 m!905411))

(declare-fun m!905413 () Bool)

(assert (=> b!978272 m!905413))

(declare-fun m!905415 () Bool)

(assert (=> b!978272 m!905415))

(assert (=> b!978272 m!905411))

(assert (=> b!978272 m!905397))

(declare-fun m!905417 () Bool)

(assert (=> b!978272 m!905417))

(declare-fun m!905419 () Bool)

(assert (=> b!978272 m!905419))

(declare-fun m!905421 () Bool)

(assert (=> b!978272 m!905421))

(assert (=> b!978272 m!905419))

(declare-fun m!905423 () Bool)

(assert (=> b!978272 m!905423))

(assert (=> b!978272 m!905397))

(assert (=> b!978272 m!905421))

(declare-fun m!905425 () Bool)

(assert (=> b!978272 m!905425))

(declare-fun m!905427 () Bool)

(assert (=> b!978272 m!905427))

(assert (=> b!978272 m!905415))

(assert (=> b!978272 m!905427))

(declare-fun m!905429 () Bool)

(assert (=> b!978272 m!905429))

(check-sat (not b!978273) b_and!31253 (not b_next!19581) (not b!978272) tp_is_empty!22575 (not start!83772) (not mapNonEmpty!35891) (not b!978269) (not b_lambda!14625) (not b!978271))
(check-sat b_and!31253 (not b_next!19581))
