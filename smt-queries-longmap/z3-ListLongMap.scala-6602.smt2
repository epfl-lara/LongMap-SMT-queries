; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83664 () Bool)

(assert start!83664)

(declare-fun b_free!19483 () Bool)

(declare-fun b_next!19483 () Bool)

(assert (=> start!83664 (= b_free!19483 (not b_next!19483))))

(declare-fun tp!67737 () Bool)

(declare-fun b_and!31095 () Bool)

(assert (=> start!83664 (= tp!67737 b_and!31095)))

(declare-fun mapNonEmpty!35590 () Bool)

(declare-fun mapRes!35590 () Bool)

(declare-fun tp!67738 () Bool)

(declare-fun e!550309 () Bool)

(assert (=> mapNonEmpty!35590 (= mapRes!35590 (and tp!67738 e!550309))))

(declare-datatypes ((V!34833 0))(
  ( (V!34834 (val!11244 Int)) )
))
(declare-datatypes ((ValueCell!10712 0))(
  ( (ValueCellFull!10712 (v!13800 V!34833)) (EmptyCell!10712) )
))
(declare-datatypes ((array!60842 0))(
  ( (array!60843 (arr!29280 (Array (_ BitVec 32) ValueCell!10712)) (size!29760 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60842)

(declare-fun mapRest!35590 () (Array (_ BitVec 32) ValueCell!10712))

(declare-fun mapKey!35590 () (_ BitVec 32))

(declare-fun mapValue!35590 () ValueCell!10712)

(assert (=> mapNonEmpty!35590 (= (arr!29280 _values!1425) (store mapRest!35590 mapKey!35590 mapValue!35590))))

(declare-fun b!976301 () Bool)

(declare-fun res!653297 () Bool)

(declare-fun e!550308 () Bool)

(assert (=> b!976301 (=> (not res!653297) (not e!550308))))

(declare-datatypes ((array!60844 0))(
  ( (array!60845 (arr!29281 (Array (_ BitVec 32) (_ BitVec 64))) (size!29761 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60844)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!976301 (= res!653297 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29761 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29761 _keys!1717))))))

(declare-fun b!976302 () Bool)

(declare-fun res!653295 () Bool)

(assert (=> b!976302 (=> (not res!653295) (not e!550308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976302 (= res!653295 (validKeyInArray!0 (select (arr!29281 _keys!1717) i!822)))))

(declare-fun b!976303 () Bool)

(declare-fun e!550310 () Bool)

(declare-fun tp_is_empty!22387 () Bool)

(assert (=> b!976303 (= e!550310 tp_is_empty!22387)))

(declare-fun b!976304 () Bool)

(assert (=> b!976304 (= e!550308 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((tuple2!14460 0))(
  ( (tuple2!14461 (_1!7241 (_ BitVec 64)) (_2!7241 V!34833)) )
))
(declare-datatypes ((List!20307 0))(
  ( (Nil!20304) (Cons!20303 (h!21471 tuple2!14460) (t!28776 List!20307)) )
))
(declare-datatypes ((ListLongMap!13159 0))(
  ( (ListLongMap!13160 (toList!6595 List!20307)) )
))
(declare-fun lt!433221 () ListLongMap!13159)

(declare-fun zeroValue!1367 () V!34833)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34833)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3828 (array!60844 array!60842 (_ BitVec 32) (_ BitVec 32) V!34833 V!34833 (_ BitVec 32) Int) ListLongMap!13159)

(assert (=> b!976304 (= lt!433221 (getCurrentListMap!3828 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976305 () Bool)

(assert (=> b!976305 (= e!550309 tp_is_empty!22387)))

(declare-fun b!976306 () Bool)

(declare-fun e!550312 () Bool)

(assert (=> b!976306 (= e!550312 (and e!550310 mapRes!35590))))

(declare-fun condMapEmpty!35590 () Bool)

(declare-fun mapDefault!35590 () ValueCell!10712)

(assert (=> b!976306 (= condMapEmpty!35590 (= (arr!29280 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10712)) mapDefault!35590)))))

(declare-fun b!976300 () Bool)

(declare-fun res!653294 () Bool)

(assert (=> b!976300 (=> (not res!653294) (not e!550308))))

(declare-datatypes ((List!20308 0))(
  ( (Nil!20305) (Cons!20304 (h!21472 (_ BitVec 64)) (t!28777 List!20308)) )
))
(declare-fun arrayNoDuplicates!0 (array!60844 (_ BitVec 32) List!20308) Bool)

(assert (=> b!976300 (= res!653294 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20305))))

(declare-fun res!653296 () Bool)

(assert (=> start!83664 (=> (not res!653296) (not e!550308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83664 (= res!653296 (validMask!0 mask!2147))))

(assert (=> start!83664 e!550308))

(assert (=> start!83664 true))

(declare-fun array_inv!22697 (array!60842) Bool)

(assert (=> start!83664 (and (array_inv!22697 _values!1425) e!550312)))

(assert (=> start!83664 tp_is_empty!22387))

(assert (=> start!83664 tp!67737))

(declare-fun array_inv!22698 (array!60844) Bool)

(assert (=> start!83664 (array_inv!22698 _keys!1717)))

(declare-fun mapIsEmpty!35590 () Bool)

(assert (=> mapIsEmpty!35590 mapRes!35590))

(declare-fun b!976307 () Bool)

(declare-fun res!653299 () Bool)

(assert (=> b!976307 (=> (not res!653299) (not e!550308))))

(declare-fun contains!5694 (ListLongMap!13159 (_ BitVec 64)) Bool)

(assert (=> b!976307 (= res!653299 (contains!5694 (getCurrentListMap!3828 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29281 _keys!1717) i!822)))))

(declare-fun b!976308 () Bool)

(declare-fun res!653300 () Bool)

(assert (=> b!976308 (=> (not res!653300) (not e!550308))))

(assert (=> b!976308 (= res!653300 (and (= (size!29760 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29761 _keys!1717) (size!29760 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!976309 () Bool)

(declare-fun res!653298 () Bool)

(assert (=> b!976309 (=> (not res!653298) (not e!550308))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60844 (_ BitVec 32)) Bool)

(assert (=> b!976309 (= res!653298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(assert (= (and start!83664 res!653296) b!976308))

(assert (= (and b!976308 res!653300) b!976309))

(assert (= (and b!976309 res!653298) b!976300))

(assert (= (and b!976300 res!653294) b!976301))

(assert (= (and b!976301 res!653297) b!976302))

(assert (= (and b!976302 res!653295) b!976307))

(assert (= (and b!976307 res!653299) b!976304))

(assert (= (and b!976306 condMapEmpty!35590) mapIsEmpty!35590))

(assert (= (and b!976306 (not condMapEmpty!35590)) mapNonEmpty!35590))

(get-info :version)

(assert (= (and mapNonEmpty!35590 ((_ is ValueCellFull!10712) mapValue!35590)) b!976305))

(assert (= (and b!976306 ((_ is ValueCellFull!10712) mapDefault!35590)) b!976303))

(assert (= start!83664 b!976306))

(declare-fun m!903947 () Bool)

(assert (=> b!976309 m!903947))

(declare-fun m!903949 () Bool)

(assert (=> mapNonEmpty!35590 m!903949))

(declare-fun m!903951 () Bool)

(assert (=> start!83664 m!903951))

(declare-fun m!903953 () Bool)

(assert (=> start!83664 m!903953))

(declare-fun m!903955 () Bool)

(assert (=> start!83664 m!903955))

(declare-fun m!903957 () Bool)

(assert (=> b!976307 m!903957))

(declare-fun m!903959 () Bool)

(assert (=> b!976307 m!903959))

(assert (=> b!976307 m!903957))

(assert (=> b!976307 m!903959))

(declare-fun m!903961 () Bool)

(assert (=> b!976307 m!903961))

(declare-fun m!903963 () Bool)

(assert (=> b!976304 m!903963))

(assert (=> b!976302 m!903959))

(assert (=> b!976302 m!903959))

(declare-fun m!903965 () Bool)

(assert (=> b!976302 m!903965))

(declare-fun m!903967 () Bool)

(assert (=> b!976300 m!903967))

(check-sat b_and!31095 (not b!976307) (not b!976300) (not mapNonEmpty!35590) (not b_next!19483) (not start!83664) tp_is_empty!22387 (not b!976309) (not b!976302) (not b!976304))
(check-sat b_and!31095 (not b_next!19483))
