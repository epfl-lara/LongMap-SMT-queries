; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83148 () Bool)

(assert start!83148)

(declare-fun b_free!19159 () Bool)

(declare-fun b_next!19159 () Bool)

(assert (=> start!83148 (= b_free!19159 (not b_next!19159))))

(declare-fun tp!66756 () Bool)

(declare-fun b_and!30621 () Bool)

(assert (=> start!83148 (= tp!66756 b_and!30621)))

(declare-fun b!970011 () Bool)

(declare-fun e!546843 () Bool)

(declare-fun tp_is_empty!22057 () Bool)

(assert (=> b!970011 (= e!546843 tp_is_empty!22057)))

(declare-fun b!970012 () Bool)

(declare-fun res!649295 () Bool)

(declare-fun e!546844 () Bool)

(assert (=> b!970012 (=> (not res!649295) (not e!546844))))

(declare-datatypes ((array!60104 0))(
  ( (array!60105 (arr!28916 (Array (_ BitVec 32) (_ BitVec 64))) (size!29397 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60104)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!970012 (= res!649295 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29397 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29397 _keys!1717))))))

(declare-fun b!970013 () Bool)

(declare-fun res!649292 () Bool)

(assert (=> b!970013 (=> (not res!649292) (not e!546844))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60104 (_ BitVec 32)) Bool)

(assert (=> b!970013 (= res!649292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970014 () Bool)

(declare-fun res!649293 () Bool)

(assert (=> b!970014 (=> (not res!649293) (not e!546844))))

(declare-datatypes ((V!34393 0))(
  ( (V!34394 (val!11079 Int)) )
))
(declare-datatypes ((ValueCell!10547 0))(
  ( (ValueCellFull!10547 (v!13637 V!34393)) (EmptyCell!10547) )
))
(declare-datatypes ((array!60106 0))(
  ( (array!60107 (arr!28917 (Array (_ BitVec 32) ValueCell!10547)) (size!29398 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60106)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!970014 (= res!649293 (and (= (size!29398 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29397 _keys!1717) (size!29398 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970015 () Bool)

(declare-fun res!649297 () Bool)

(assert (=> b!970015 (=> (not res!649297) (not e!546844))))

(declare-datatypes ((List!20096 0))(
  ( (Nil!20093) (Cons!20092 (h!21254 (_ BitVec 64)) (t!28450 List!20096)) )
))
(declare-fun arrayNoDuplicates!0 (array!60104 (_ BitVec 32) List!20096) Bool)

(assert (=> b!970015 (= res!649297 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20093))))

(declare-fun b!970016 () Bool)

(assert (=> b!970016 (= e!546844 false)))

(declare-fun lt!431481 () Bool)

(declare-fun zeroValue!1367 () V!34393)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34393)

(declare-datatypes ((tuple2!14276 0))(
  ( (tuple2!14277 (_1!7149 (_ BitVec 64)) (_2!7149 V!34393)) )
))
(declare-datatypes ((List!20097 0))(
  ( (Nil!20094) (Cons!20093 (h!21255 tuple2!14276) (t!28451 List!20097)) )
))
(declare-datatypes ((ListLongMap!12963 0))(
  ( (ListLongMap!12964 (toList!6497 List!20097)) )
))
(declare-fun contains!5545 (ListLongMap!12963 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3659 (array!60104 array!60106 (_ BitVec 32) (_ BitVec 32) V!34393 V!34393 (_ BitVec 32) Int) ListLongMap!12963)

(assert (=> b!970016 (= lt!431481 (contains!5545 (getCurrentListMap!3659 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28916 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35095 () Bool)

(declare-fun mapRes!35095 () Bool)

(declare-fun tp!66757 () Bool)

(declare-fun e!546842 () Bool)

(assert (=> mapNonEmpty!35095 (= mapRes!35095 (and tp!66757 e!546842))))

(declare-fun mapValue!35095 () ValueCell!10547)

(declare-fun mapKey!35095 () (_ BitVec 32))

(declare-fun mapRest!35095 () (Array (_ BitVec 32) ValueCell!10547))

(assert (=> mapNonEmpty!35095 (= (arr!28917 _values!1425) (store mapRest!35095 mapKey!35095 mapValue!35095))))

(declare-fun b!970017 () Bool)

(declare-fun e!546846 () Bool)

(assert (=> b!970017 (= e!546846 (and e!546843 mapRes!35095))))

(declare-fun condMapEmpty!35095 () Bool)

(declare-fun mapDefault!35095 () ValueCell!10547)

(assert (=> b!970017 (= condMapEmpty!35095 (= (arr!28917 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10547)) mapDefault!35095)))))

(declare-fun mapIsEmpty!35095 () Bool)

(assert (=> mapIsEmpty!35095 mapRes!35095))

(declare-fun b!970018 () Bool)

(declare-fun res!649294 () Bool)

(assert (=> b!970018 (=> (not res!649294) (not e!546844))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970018 (= res!649294 (validKeyInArray!0 (select (arr!28916 _keys!1717) i!822)))))

(declare-fun res!649296 () Bool)

(assert (=> start!83148 (=> (not res!649296) (not e!546844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83148 (= res!649296 (validMask!0 mask!2147))))

(assert (=> start!83148 e!546844))

(assert (=> start!83148 true))

(declare-fun array_inv!22443 (array!60106) Bool)

(assert (=> start!83148 (and (array_inv!22443 _values!1425) e!546846)))

(assert (=> start!83148 tp_is_empty!22057))

(assert (=> start!83148 tp!66756))

(declare-fun array_inv!22444 (array!60104) Bool)

(assert (=> start!83148 (array_inv!22444 _keys!1717)))

(declare-fun b!970019 () Bool)

(assert (=> b!970019 (= e!546842 tp_is_empty!22057)))

(assert (= (and start!83148 res!649296) b!970014))

(assert (= (and b!970014 res!649293) b!970013))

(assert (= (and b!970013 res!649292) b!970015))

(assert (= (and b!970015 res!649297) b!970012))

(assert (= (and b!970012 res!649295) b!970018))

(assert (= (and b!970018 res!649294) b!970016))

(assert (= (and b!970017 condMapEmpty!35095) mapIsEmpty!35095))

(assert (= (and b!970017 (not condMapEmpty!35095)) mapNonEmpty!35095))

(get-info :version)

(assert (= (and mapNonEmpty!35095 ((_ is ValueCellFull!10547) mapValue!35095)) b!970019))

(assert (= (and b!970017 ((_ is ValueCellFull!10547) mapDefault!35095)) b!970011))

(assert (= start!83148 b!970017))

(declare-fun m!897269 () Bool)

(assert (=> b!970015 m!897269))

(declare-fun m!897271 () Bool)

(assert (=> b!970013 m!897271))

(declare-fun m!897273 () Bool)

(assert (=> b!970018 m!897273))

(assert (=> b!970018 m!897273))

(declare-fun m!897275 () Bool)

(assert (=> b!970018 m!897275))

(declare-fun m!897277 () Bool)

(assert (=> start!83148 m!897277))

(declare-fun m!897279 () Bool)

(assert (=> start!83148 m!897279))

(declare-fun m!897281 () Bool)

(assert (=> start!83148 m!897281))

(declare-fun m!897283 () Bool)

(assert (=> b!970016 m!897283))

(assert (=> b!970016 m!897273))

(assert (=> b!970016 m!897283))

(assert (=> b!970016 m!897273))

(declare-fun m!897285 () Bool)

(assert (=> b!970016 m!897285))

(declare-fun m!897287 () Bool)

(assert (=> mapNonEmpty!35095 m!897287))

(check-sat b_and!30621 (not b!970013) (not b!970016) (not mapNonEmpty!35095) (not b!970015) (not start!83148) tp_is_empty!22057 (not b!970018) (not b_next!19159))
(check-sat b_and!30621 (not b_next!19159))
