; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83222 () Bool)

(assert start!83222)

(declare-fun b_free!19215 () Bool)

(declare-fun b_next!19215 () Bool)

(assert (=> start!83222 (= b_free!19215 (not b_next!19215))))

(declare-fun tp!66924 () Bool)

(declare-fun b_and!30703 () Bool)

(assert (=> start!83222 (= tp!66924 b_and!30703)))

(declare-fun mapIsEmpty!35179 () Bool)

(declare-fun mapRes!35179 () Bool)

(assert (=> mapIsEmpty!35179 mapRes!35179))

(declare-fun b!971029 () Bool)

(declare-fun e!547414 () Bool)

(declare-fun tp_is_empty!22113 () Bool)

(assert (=> b!971029 (= e!547414 tp_is_empty!22113)))

(declare-fun b!971030 () Bool)

(declare-fun res!649930 () Bool)

(declare-fun e!547412 () Bool)

(assert (=> b!971030 (=> (not res!649930) (not e!547412))))

(declare-datatypes ((array!60279 0))(
  ( (array!60280 (arr!29003 (Array (_ BitVec 32) (_ BitVec 64))) (size!29482 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60279)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971030 (= res!649930 (validKeyInArray!0 (select (arr!29003 _keys!1717) i!822)))))

(declare-fun b!971031 () Bool)

(assert (=> b!971031 (= e!547412 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34467 0))(
  ( (V!34468 (val!11107 Int)) )
))
(declare-datatypes ((ValueCell!10575 0))(
  ( (ValueCellFull!10575 (v!13666 V!34467)) (EmptyCell!10575) )
))
(declare-datatypes ((array!60281 0))(
  ( (array!60282 (arr!29004 (Array (_ BitVec 32) ValueCell!10575)) (size!29483 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60281)

(declare-datatypes ((tuple2!14234 0))(
  ( (tuple2!14235 (_1!7128 (_ BitVec 64)) (_2!7128 V!34467)) )
))
(declare-datatypes ((List!20103 0))(
  ( (Nil!20100) (Cons!20099 (h!21261 tuple2!14234) (t!28466 List!20103)) )
))
(declare-datatypes ((ListLongMap!12931 0))(
  ( (ListLongMap!12932 (toList!6481 List!20103)) )
))
(declare-fun lt!431792 () ListLongMap!12931)

(declare-fun zeroValue!1367 () V!34467)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34467)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3714 (array!60279 array!60281 (_ BitVec 32) (_ BitVec 32) V!34467 V!34467 (_ BitVec 32) Int) ListLongMap!12931)

(assert (=> b!971031 (= lt!431792 (getCurrentListMap!3714 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!971032 () Bool)

(declare-fun res!649933 () Bool)

(assert (=> b!971032 (=> (not res!649933) (not e!547412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60279 (_ BitVec 32)) Bool)

(assert (=> b!971032 (= res!649933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!971033 () Bool)

(declare-fun res!649931 () Bool)

(assert (=> b!971033 (=> (not res!649931) (not e!547412))))

(assert (=> b!971033 (= res!649931 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29482 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29482 _keys!1717))))))

(declare-fun b!971034 () Bool)

(declare-fun res!649929 () Bool)

(assert (=> b!971034 (=> (not res!649929) (not e!547412))))

(assert (=> b!971034 (= res!649929 (and (= (size!29483 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29482 _keys!1717) (size!29483 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35179 () Bool)

(declare-fun tp!66923 () Bool)

(declare-fun e!547411 () Bool)

(assert (=> mapNonEmpty!35179 (= mapRes!35179 (and tp!66923 e!547411))))

(declare-fun mapKey!35179 () (_ BitVec 32))

(declare-fun mapRest!35179 () (Array (_ BitVec 32) ValueCell!10575))

(declare-fun mapValue!35179 () ValueCell!10575)

(assert (=> mapNonEmpty!35179 (= (arr!29004 _values!1425) (store mapRest!35179 mapKey!35179 mapValue!35179))))

(declare-fun res!649934 () Bool)

(assert (=> start!83222 (=> (not res!649934) (not e!547412))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83222 (= res!649934 (validMask!0 mask!2147))))

(assert (=> start!83222 e!547412))

(assert (=> start!83222 true))

(declare-fun e!547410 () Bool)

(declare-fun array_inv!22445 (array!60281) Bool)

(assert (=> start!83222 (and (array_inv!22445 _values!1425) e!547410)))

(assert (=> start!83222 tp_is_empty!22113))

(assert (=> start!83222 tp!66924))

(declare-fun array_inv!22446 (array!60279) Bool)

(assert (=> start!83222 (array_inv!22446 _keys!1717)))

(declare-fun b!971035 () Bool)

(assert (=> b!971035 (= e!547410 (and e!547414 mapRes!35179))))

(declare-fun condMapEmpty!35179 () Bool)

(declare-fun mapDefault!35179 () ValueCell!10575)

(assert (=> b!971035 (= condMapEmpty!35179 (= (arr!29004 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10575)) mapDefault!35179)))))

(declare-fun b!971036 () Bool)

(declare-fun res!649932 () Bool)

(assert (=> b!971036 (=> (not res!649932) (not e!547412))))

(declare-datatypes ((List!20104 0))(
  ( (Nil!20101) (Cons!20100 (h!21262 (_ BitVec 64)) (t!28467 List!20104)) )
))
(declare-fun arrayNoDuplicates!0 (array!60279 (_ BitVec 32) List!20104) Bool)

(assert (=> b!971036 (= res!649932 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20101))))

(declare-fun b!971037 () Bool)

(declare-fun res!649935 () Bool)

(assert (=> b!971037 (=> (not res!649935) (not e!547412))))

(declare-fun contains!5583 (ListLongMap!12931 (_ BitVec 64)) Bool)

(assert (=> b!971037 (= res!649935 (contains!5583 (getCurrentListMap!3714 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29003 _keys!1717) i!822)))))

(declare-fun b!971038 () Bool)

(assert (=> b!971038 (= e!547411 tp_is_empty!22113)))

(assert (= (and start!83222 res!649934) b!971034))

(assert (= (and b!971034 res!649929) b!971032))

(assert (= (and b!971032 res!649933) b!971036))

(assert (= (and b!971036 res!649932) b!971033))

(assert (= (and b!971033 res!649931) b!971030))

(assert (= (and b!971030 res!649930) b!971037))

(assert (= (and b!971037 res!649935) b!971031))

(assert (= (and b!971035 condMapEmpty!35179) mapIsEmpty!35179))

(assert (= (and b!971035 (not condMapEmpty!35179)) mapNonEmpty!35179))

(get-info :version)

(assert (= (and mapNonEmpty!35179 ((_ is ValueCellFull!10575) mapValue!35179)) b!971038))

(assert (= (and b!971035 ((_ is ValueCellFull!10575) mapDefault!35179)) b!971029))

(assert (= start!83222 b!971035))

(declare-fun m!898595 () Bool)

(assert (=> b!971036 m!898595))

(declare-fun m!898597 () Bool)

(assert (=> mapNonEmpty!35179 m!898597))

(declare-fun m!898599 () Bool)

(assert (=> b!971032 m!898599))

(declare-fun m!898601 () Bool)

(assert (=> start!83222 m!898601))

(declare-fun m!898603 () Bool)

(assert (=> start!83222 m!898603))

(declare-fun m!898605 () Bool)

(assert (=> start!83222 m!898605))

(declare-fun m!898607 () Bool)

(assert (=> b!971031 m!898607))

(declare-fun m!898609 () Bool)

(assert (=> b!971037 m!898609))

(declare-fun m!898611 () Bool)

(assert (=> b!971037 m!898611))

(assert (=> b!971037 m!898609))

(assert (=> b!971037 m!898611))

(declare-fun m!898613 () Bool)

(assert (=> b!971037 m!898613))

(assert (=> b!971030 m!898611))

(assert (=> b!971030 m!898611))

(declare-fun m!898615 () Bool)

(assert (=> b!971030 m!898615))

(check-sat (not mapNonEmpty!35179) (not b_next!19215) (not b!971031) tp_is_empty!22113 (not b!971036) b_and!30703 (not b!971032) (not b!971030) (not b!971037) (not start!83222))
(check-sat b_and!30703 (not b_next!19215))
