; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83334 () Bool)

(assert start!83334)

(declare-fun b_free!19159 () Bool)

(declare-fun b_next!19159 () Bool)

(assert (=> start!83334 (= b_free!19159 (not b_next!19159))))

(declare-fun tp!66757 () Bool)

(declare-fun b_and!30657 () Bool)

(assert (=> start!83334 (= tp!66757 b_and!30657)))

(declare-fun b!971153 () Bool)

(declare-fun e!547574 () Bool)

(declare-fun tp_is_empty!22057 () Bool)

(assert (=> b!971153 (= e!547574 tp_is_empty!22057)))

(declare-fun b!971154 () Bool)

(declare-fun e!547575 () Bool)

(declare-fun e!547573 () Bool)

(declare-fun mapRes!35095 () Bool)

(assert (=> b!971154 (= e!547575 (and e!547573 mapRes!35095))))

(declare-fun condMapEmpty!35095 () Bool)

(declare-datatypes ((V!34393 0))(
  ( (V!34394 (val!11079 Int)) )
))
(declare-datatypes ((ValueCell!10547 0))(
  ( (ValueCellFull!10547 (v!13635 V!34393)) (EmptyCell!10547) )
))
(declare-datatypes ((array!60192 0))(
  ( (array!60193 (arr!28955 (Array (_ BitVec 32) ValueCell!10547)) (size!29435 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60192)

(declare-fun mapDefault!35095 () ValueCell!10547)

(assert (=> b!971154 (= condMapEmpty!35095 (= (arr!28955 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10547)) mapDefault!35095)))))

(declare-fun b!971155 () Bool)

(assert (=> b!971155 (= e!547573 tp_is_empty!22057)))

(declare-fun mapNonEmpty!35095 () Bool)

(declare-fun tp!66756 () Bool)

(assert (=> mapNonEmpty!35095 (= mapRes!35095 (and tp!66756 e!547574))))

(declare-fun mapKey!35095 () (_ BitVec 32))

(declare-fun mapRest!35095 () (Array (_ BitVec 32) ValueCell!10547))

(declare-fun mapValue!35095 () ValueCell!10547)

(assert (=> mapNonEmpty!35095 (= (arr!28955 _values!1425) (store mapRest!35095 mapKey!35095 mapValue!35095))))

(declare-fun b!971156 () Bool)

(declare-fun res!649749 () Bool)

(declare-fun e!547576 () Bool)

(assert (=> b!971156 (=> (not res!649749) (not e!547576))))

(declare-datatypes ((array!60194 0))(
  ( (array!60195 (arr!28956 (Array (_ BitVec 32) (_ BitVec 64))) (size!29436 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60194)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971156 (= res!649749 (validKeyInArray!0 (select (arr!28956 _keys!1717) i!822)))))

(declare-fun res!649746 () Bool)

(assert (=> start!83334 (=> (not res!649746) (not e!547576))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83334 (= res!649746 (validMask!0 mask!2147))))

(assert (=> start!83334 e!547576))

(assert (=> start!83334 true))

(declare-fun array_inv!22463 (array!60192) Bool)

(assert (=> start!83334 (and (array_inv!22463 _values!1425) e!547575)))

(assert (=> start!83334 tp_is_empty!22057))

(assert (=> start!83334 tp!66757))

(declare-fun array_inv!22464 (array!60194) Bool)

(assert (=> start!83334 (array_inv!22464 _keys!1717)))

(declare-fun b!971157 () Bool)

(declare-fun res!649747 () Bool)

(assert (=> b!971157 (=> (not res!649747) (not e!547576))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!971157 (= res!649747 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29436 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29436 _keys!1717))))))

(declare-fun b!971158 () Bool)

(declare-fun res!649751 () Bool)

(assert (=> b!971158 (=> (not res!649751) (not e!547576))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!971158 (= res!649751 (and (= (size!29435 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29436 _keys!1717) (size!29435 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971159 () Bool)

(declare-fun res!649750 () Bool)

(assert (=> b!971159 (=> (not res!649750) (not e!547576))))

(declare-datatypes ((List!20052 0))(
  ( (Nil!20049) (Cons!20048 (h!21216 (_ BitVec 64)) (t!28407 List!20052)) )
))
(declare-fun arrayNoDuplicates!0 (array!60194 (_ BitVec 32) List!20052) Bool)

(assert (=> b!971159 (= res!649750 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20049))))

(declare-fun mapIsEmpty!35095 () Bool)

(assert (=> mapIsEmpty!35095 mapRes!35095))

(declare-fun b!971160 () Bool)

(declare-fun res!649748 () Bool)

(assert (=> b!971160 (=> (not res!649748) (not e!547576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60194 (_ BitVec 32)) Bool)

(assert (=> b!971160 (= res!649748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!971161 () Bool)

(assert (=> b!971161 (= e!547576 false)))

(declare-fun zeroValue!1367 () V!34393)

(declare-fun lt!432078 () Bool)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34393)

(declare-datatypes ((tuple2!14194 0))(
  ( (tuple2!14195 (_1!7108 (_ BitVec 64)) (_2!7108 V!34393)) )
))
(declare-datatypes ((List!20053 0))(
  ( (Nil!20050) (Cons!20049 (h!21217 tuple2!14194) (t!28408 List!20053)) )
))
(declare-datatypes ((ListLongMap!12893 0))(
  ( (ListLongMap!12894 (toList!6462 List!20053)) )
))
(declare-fun contains!5577 (ListLongMap!12893 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3695 (array!60194 array!60192 (_ BitVec 32) (_ BitVec 32) V!34393 V!34393 (_ BitVec 32) Int) ListLongMap!12893)

(assert (=> b!971161 (= lt!432078 (contains!5577 (getCurrentListMap!3695 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28956 _keys!1717) i!822)))))

(assert (= (and start!83334 res!649746) b!971158))

(assert (= (and b!971158 res!649751) b!971160))

(assert (= (and b!971160 res!649748) b!971159))

(assert (= (and b!971159 res!649750) b!971157))

(assert (= (and b!971157 res!649747) b!971156))

(assert (= (and b!971156 res!649749) b!971161))

(assert (= (and b!971154 condMapEmpty!35095) mapIsEmpty!35095))

(assert (= (and b!971154 (not condMapEmpty!35095)) mapNonEmpty!35095))

(get-info :version)

(assert (= (and mapNonEmpty!35095 ((_ is ValueCellFull!10547) mapValue!35095)) b!971153))

(assert (= (and b!971154 ((_ is ValueCellFull!10547) mapDefault!35095)) b!971155))

(assert (= start!83334 b!971154))

(declare-fun m!899321 () Bool)

(assert (=> b!971156 m!899321))

(assert (=> b!971156 m!899321))

(declare-fun m!899323 () Bool)

(assert (=> b!971156 m!899323))

(declare-fun m!899325 () Bool)

(assert (=> mapNonEmpty!35095 m!899325))

(declare-fun m!899327 () Bool)

(assert (=> b!971161 m!899327))

(assert (=> b!971161 m!899321))

(assert (=> b!971161 m!899327))

(assert (=> b!971161 m!899321))

(declare-fun m!899329 () Bool)

(assert (=> b!971161 m!899329))

(declare-fun m!899331 () Bool)

(assert (=> b!971160 m!899331))

(declare-fun m!899333 () Bool)

(assert (=> b!971159 m!899333))

(declare-fun m!899335 () Bool)

(assert (=> start!83334 m!899335))

(declare-fun m!899337 () Bool)

(assert (=> start!83334 m!899337))

(declare-fun m!899339 () Bool)

(assert (=> start!83334 m!899339))

(check-sat tp_is_empty!22057 (not mapNonEmpty!35095) (not b_next!19159) (not b!971159) b_and!30657 (not b!971161) (not b!971156) (not start!83334) (not b!971160))
(check-sat b_and!30657 (not b_next!19159))
