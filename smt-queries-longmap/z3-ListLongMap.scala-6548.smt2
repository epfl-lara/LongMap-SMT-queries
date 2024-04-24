; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83340 () Bool)

(assert start!83340)

(declare-fun b_free!19165 () Bool)

(declare-fun b_next!19165 () Bool)

(assert (=> start!83340 (= b_free!19165 (not b_next!19165))))

(declare-fun tp!66774 () Bool)

(declare-fun b_and!30663 () Bool)

(assert (=> start!83340 (= tp!66774 b_and!30663)))

(declare-fun b!971234 () Bool)

(declare-fun e!547619 () Bool)

(declare-fun tp_is_empty!22063 () Bool)

(assert (=> b!971234 (= e!547619 tp_is_empty!22063)))

(declare-fun b!971235 () Bool)

(declare-fun e!547621 () Bool)

(assert (=> b!971235 (= e!547621 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34401 0))(
  ( (V!34402 (val!11082 Int)) )
))
(declare-datatypes ((ValueCell!10550 0))(
  ( (ValueCellFull!10550 (v!13638 V!34401)) (EmptyCell!10550) )
))
(declare-datatypes ((array!60204 0))(
  ( (array!60205 (arr!28961 (Array (_ BitVec 32) ValueCell!10550)) (size!29441 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60204)

(declare-fun zeroValue!1367 () V!34401)

(declare-fun lt!432087 () Bool)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34401)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60206 0))(
  ( (array!60207 (arr!28962 (Array (_ BitVec 32) (_ BitVec 64))) (size!29442 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60206)

(declare-datatypes ((tuple2!14200 0))(
  ( (tuple2!14201 (_1!7111 (_ BitVec 64)) (_2!7111 V!34401)) )
))
(declare-datatypes ((List!20057 0))(
  ( (Nil!20054) (Cons!20053 (h!21221 tuple2!14200) (t!28412 List!20057)) )
))
(declare-datatypes ((ListLongMap!12899 0))(
  ( (ListLongMap!12900 (toList!6465 List!20057)) )
))
(declare-fun contains!5580 (ListLongMap!12899 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3698 (array!60206 array!60204 (_ BitVec 32) (_ BitVec 32) V!34401 V!34401 (_ BitVec 32) Int) ListLongMap!12899)

(assert (=> b!971235 (= lt!432087 (contains!5580 (getCurrentListMap!3698 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28962 _keys!1717) i!822)))))

(declare-fun b!971236 () Bool)

(declare-fun res!649805 () Bool)

(assert (=> b!971236 (=> (not res!649805) (not e!547621))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971236 (= res!649805 (validKeyInArray!0 (select (arr!28962 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35104 () Bool)

(declare-fun mapRes!35104 () Bool)

(assert (=> mapIsEmpty!35104 mapRes!35104))

(declare-fun b!971238 () Bool)

(declare-fun res!649801 () Bool)

(assert (=> b!971238 (=> (not res!649801) (not e!547621))))

(assert (=> b!971238 (= res!649801 (and (= (size!29441 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29442 _keys!1717) (size!29441 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971239 () Bool)

(declare-fun res!649804 () Bool)

(assert (=> b!971239 (=> (not res!649804) (not e!547621))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60206 (_ BitVec 32)) Bool)

(assert (=> b!971239 (= res!649804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!971240 () Bool)

(declare-fun e!547617 () Bool)

(assert (=> b!971240 (= e!547617 tp_is_empty!22063)))

(declare-fun b!971241 () Bool)

(declare-fun res!649803 () Bool)

(assert (=> b!971241 (=> (not res!649803) (not e!547621))))

(declare-datatypes ((List!20058 0))(
  ( (Nil!20055) (Cons!20054 (h!21222 (_ BitVec 64)) (t!28413 List!20058)) )
))
(declare-fun arrayNoDuplicates!0 (array!60206 (_ BitVec 32) List!20058) Bool)

(assert (=> b!971241 (= res!649803 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20055))))

(declare-fun mapNonEmpty!35104 () Bool)

(declare-fun tp!66775 () Bool)

(assert (=> mapNonEmpty!35104 (= mapRes!35104 (and tp!66775 e!547617))))

(declare-fun mapKey!35104 () (_ BitVec 32))

(declare-fun mapValue!35104 () ValueCell!10550)

(declare-fun mapRest!35104 () (Array (_ BitVec 32) ValueCell!10550))

(assert (=> mapNonEmpty!35104 (= (arr!28961 _values!1425) (store mapRest!35104 mapKey!35104 mapValue!35104))))

(declare-fun b!971242 () Bool)

(declare-fun res!649800 () Bool)

(assert (=> b!971242 (=> (not res!649800) (not e!547621))))

(assert (=> b!971242 (= res!649800 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29442 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29442 _keys!1717))))))

(declare-fun b!971237 () Bool)

(declare-fun e!547620 () Bool)

(assert (=> b!971237 (= e!547620 (and e!547619 mapRes!35104))))

(declare-fun condMapEmpty!35104 () Bool)

(declare-fun mapDefault!35104 () ValueCell!10550)

(assert (=> b!971237 (= condMapEmpty!35104 (= (arr!28961 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10550)) mapDefault!35104)))))

(declare-fun res!649802 () Bool)

(assert (=> start!83340 (=> (not res!649802) (not e!547621))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83340 (= res!649802 (validMask!0 mask!2147))))

(assert (=> start!83340 e!547621))

(assert (=> start!83340 true))

(declare-fun array_inv!22467 (array!60204) Bool)

(assert (=> start!83340 (and (array_inv!22467 _values!1425) e!547620)))

(assert (=> start!83340 tp_is_empty!22063))

(assert (=> start!83340 tp!66774))

(declare-fun array_inv!22468 (array!60206) Bool)

(assert (=> start!83340 (array_inv!22468 _keys!1717)))

(assert (= (and start!83340 res!649802) b!971238))

(assert (= (and b!971238 res!649801) b!971239))

(assert (= (and b!971239 res!649804) b!971241))

(assert (= (and b!971241 res!649803) b!971242))

(assert (= (and b!971242 res!649800) b!971236))

(assert (= (and b!971236 res!649805) b!971235))

(assert (= (and b!971237 condMapEmpty!35104) mapIsEmpty!35104))

(assert (= (and b!971237 (not condMapEmpty!35104)) mapNonEmpty!35104))

(get-info :version)

(assert (= (and mapNonEmpty!35104 ((_ is ValueCellFull!10550) mapValue!35104)) b!971240))

(assert (= (and b!971237 ((_ is ValueCellFull!10550) mapDefault!35104)) b!971234))

(assert (= start!83340 b!971237))

(declare-fun m!899381 () Bool)

(assert (=> mapNonEmpty!35104 m!899381))

(declare-fun m!899383 () Bool)

(assert (=> b!971239 m!899383))

(declare-fun m!899385 () Bool)

(assert (=> start!83340 m!899385))

(declare-fun m!899387 () Bool)

(assert (=> start!83340 m!899387))

(declare-fun m!899389 () Bool)

(assert (=> start!83340 m!899389))

(declare-fun m!899391 () Bool)

(assert (=> b!971241 m!899391))

(declare-fun m!899393 () Bool)

(assert (=> b!971236 m!899393))

(assert (=> b!971236 m!899393))

(declare-fun m!899395 () Bool)

(assert (=> b!971236 m!899395))

(declare-fun m!899397 () Bool)

(assert (=> b!971235 m!899397))

(assert (=> b!971235 m!899393))

(assert (=> b!971235 m!899397))

(assert (=> b!971235 m!899393))

(declare-fun m!899399 () Bool)

(assert (=> b!971235 m!899399))

(check-sat (not b!971241) tp_is_empty!22063 (not start!83340) (not mapNonEmpty!35104) (not b!971235) (not b!971236) (not b!971239) (not b_next!19165) b_and!30663)
(check-sat b_and!30663 (not b_next!19165))
