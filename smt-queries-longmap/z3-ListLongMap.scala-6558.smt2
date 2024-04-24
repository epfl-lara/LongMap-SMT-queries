; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83400 () Bool)

(assert start!83400)

(declare-fun b_free!19225 () Bool)

(declare-fun b_next!19225 () Bool)

(assert (=> start!83400 (= b_free!19225 (not b_next!19225))))

(declare-fun tp!66955 () Bool)

(declare-fun b_and!30723 () Bool)

(assert (=> start!83400 (= tp!66955 b_and!30723)))

(declare-fun b!972082 () Bool)

(declare-fun e!548067 () Bool)

(assert (=> b!972082 (= e!548067 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34481 0))(
  ( (V!34482 (val!11112 Int)) )
))
(declare-datatypes ((ValueCell!10580 0))(
  ( (ValueCellFull!10580 (v!13668 V!34481)) (EmptyCell!10580) )
))
(declare-datatypes ((array!60320 0))(
  ( (array!60321 (arr!29019 (Array (_ BitVec 32) ValueCell!10580)) (size!29499 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60320)

(declare-fun zeroValue!1367 () V!34481)

(declare-fun defaultEntry!1428 () Int)

(declare-datatypes ((tuple2!14244 0))(
  ( (tuple2!14245 (_1!7133 (_ BitVec 64)) (_2!7133 V!34481)) )
))
(declare-datatypes ((List!20099 0))(
  ( (Nil!20096) (Cons!20095 (h!21263 tuple2!14244) (t!28454 List!20099)) )
))
(declare-datatypes ((ListLongMap!12943 0))(
  ( (ListLongMap!12944 (toList!6487 List!20099)) )
))
(declare-fun lt!432168 () ListLongMap!12943)

(declare-fun minValue!1367 () V!34481)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60322 0))(
  ( (array!60323 (arr!29020 (Array (_ BitVec 32) (_ BitVec 64))) (size!29500 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60322)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun getCurrentListMap!3720 (array!60322 array!60320 (_ BitVec 32) (_ BitVec 32) V!34481 V!34481 (_ BitVec 32) Int) ListLongMap!12943)

(assert (=> b!972082 (= lt!432168 (getCurrentListMap!3720 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapIsEmpty!35194 () Bool)

(declare-fun mapRes!35194 () Bool)

(assert (=> mapIsEmpty!35194 mapRes!35194))

(declare-fun b!972083 () Bool)

(declare-fun res!650384 () Bool)

(assert (=> b!972083 (=> (not res!650384) (not e!548067))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5601 (ListLongMap!12943 (_ BitVec 64)) Bool)

(assert (=> b!972083 (= res!650384 (contains!5601 (getCurrentListMap!3720 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29020 _keys!1717) i!822)))))

(declare-fun b!972084 () Bool)

(declare-fun res!650379 () Bool)

(assert (=> b!972084 (=> (not res!650379) (not e!548067))))

(assert (=> b!972084 (= res!650379 (and (= (size!29499 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29500 _keys!1717) (size!29499 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!972085 () Bool)

(declare-fun e!548068 () Bool)

(declare-fun tp_is_empty!22123 () Bool)

(assert (=> b!972085 (= e!548068 tp_is_empty!22123)))

(declare-fun b!972086 () Bool)

(declare-fun res!650380 () Bool)

(assert (=> b!972086 (=> (not res!650380) (not e!548067))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60322 (_ BitVec 32)) Bool)

(assert (=> b!972086 (= res!650380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!972087 () Bool)

(declare-fun res!650378 () Bool)

(assert (=> b!972087 (=> (not res!650378) (not e!548067))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972087 (= res!650378 (validKeyInArray!0 (select (arr!29020 _keys!1717) i!822)))))

(declare-fun b!972088 () Bool)

(declare-fun e!548070 () Bool)

(assert (=> b!972088 (= e!548070 tp_is_empty!22123)))

(declare-fun b!972090 () Bool)

(declare-fun e!548069 () Bool)

(assert (=> b!972090 (= e!548069 (and e!548068 mapRes!35194))))

(declare-fun condMapEmpty!35194 () Bool)

(declare-fun mapDefault!35194 () ValueCell!10580)

(assert (=> b!972090 (= condMapEmpty!35194 (= (arr!29019 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10580)) mapDefault!35194)))))

(declare-fun res!650382 () Bool)

(assert (=> start!83400 (=> (not res!650382) (not e!548067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83400 (= res!650382 (validMask!0 mask!2147))))

(assert (=> start!83400 e!548067))

(assert (=> start!83400 true))

(declare-fun array_inv!22505 (array!60320) Bool)

(assert (=> start!83400 (and (array_inv!22505 _values!1425) e!548069)))

(assert (=> start!83400 tp_is_empty!22123))

(assert (=> start!83400 tp!66955))

(declare-fun array_inv!22506 (array!60322) Bool)

(assert (=> start!83400 (array_inv!22506 _keys!1717)))

(declare-fun b!972089 () Bool)

(declare-fun res!650383 () Bool)

(assert (=> b!972089 (=> (not res!650383) (not e!548067))))

(assert (=> b!972089 (= res!650383 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29500 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29500 _keys!1717))))))

(declare-fun b!972091 () Bool)

(declare-fun res!650381 () Bool)

(assert (=> b!972091 (=> (not res!650381) (not e!548067))))

(declare-datatypes ((List!20100 0))(
  ( (Nil!20097) (Cons!20096 (h!21264 (_ BitVec 64)) (t!28455 List!20100)) )
))
(declare-fun arrayNoDuplicates!0 (array!60322 (_ BitVec 32) List!20100) Bool)

(assert (=> b!972091 (= res!650381 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20097))))

(declare-fun mapNonEmpty!35194 () Bool)

(declare-fun tp!66954 () Bool)

(assert (=> mapNonEmpty!35194 (= mapRes!35194 (and tp!66954 e!548070))))

(declare-fun mapValue!35194 () ValueCell!10580)

(declare-fun mapKey!35194 () (_ BitVec 32))

(declare-fun mapRest!35194 () (Array (_ BitVec 32) ValueCell!10580))

(assert (=> mapNonEmpty!35194 (= (arr!29019 _values!1425) (store mapRest!35194 mapKey!35194 mapValue!35194))))

(assert (= (and start!83400 res!650382) b!972084))

(assert (= (and b!972084 res!650379) b!972086))

(assert (= (and b!972086 res!650380) b!972091))

(assert (= (and b!972091 res!650381) b!972089))

(assert (= (and b!972089 res!650383) b!972087))

(assert (= (and b!972087 res!650378) b!972083))

(assert (= (and b!972083 res!650384) b!972082))

(assert (= (and b!972090 condMapEmpty!35194) mapIsEmpty!35194))

(assert (= (and b!972090 (not condMapEmpty!35194)) mapNonEmpty!35194))

(get-info :version)

(assert (= (and mapNonEmpty!35194 ((_ is ValueCellFull!10580) mapValue!35194)) b!972088))

(assert (= (and b!972090 ((_ is ValueCellFull!10580) mapDefault!35194)) b!972085))

(assert (= start!83400 b!972090))

(declare-fun m!899999 () Bool)

(assert (=> b!972082 m!899999))

(declare-fun m!900001 () Bool)

(assert (=> b!972083 m!900001))

(declare-fun m!900003 () Bool)

(assert (=> b!972083 m!900003))

(assert (=> b!972083 m!900001))

(assert (=> b!972083 m!900003))

(declare-fun m!900005 () Bool)

(assert (=> b!972083 m!900005))

(declare-fun m!900007 () Bool)

(assert (=> mapNonEmpty!35194 m!900007))

(declare-fun m!900009 () Bool)

(assert (=> start!83400 m!900009))

(declare-fun m!900011 () Bool)

(assert (=> start!83400 m!900011))

(declare-fun m!900013 () Bool)

(assert (=> start!83400 m!900013))

(declare-fun m!900015 () Bool)

(assert (=> b!972091 m!900015))

(assert (=> b!972087 m!900003))

(assert (=> b!972087 m!900003))

(declare-fun m!900017 () Bool)

(assert (=> b!972087 m!900017))

(declare-fun m!900019 () Bool)

(assert (=> b!972086 m!900019))

(check-sat tp_is_empty!22123 b_and!30723 (not b!972082) (not b!972086) (not b!972087) (not b_next!19225) (not b!972083) (not b!972091) (not start!83400) (not mapNonEmpty!35194))
(check-sat b_and!30723 (not b_next!19225))
