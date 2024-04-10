; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!632 () Bool)

(assert start!632)

(declare-fun b_free!105 () Bool)

(declare-fun b_next!105 () Bool)

(assert (=> start!632 (= b_free!105 (not b_next!105))))

(declare-fun tp!532 () Bool)

(declare-fun b_and!243 () Bool)

(assert (=> start!632 (= tp!532 b_and!243)))

(declare-fun b!4036 () Bool)

(declare-fun e!2086 () Bool)

(declare-fun tp_is_empty!183 () Bool)

(assert (=> b!4036 (= e!2086 tp_is_empty!183)))

(declare-fun b!4037 () Bool)

(declare-fun e!2088 () Bool)

(assert (=> b!4037 (= e!2088 tp_is_empty!183)))

(declare-fun b!4038 () Bool)

(declare-fun e!2087 () Bool)

(assert (=> b!4038 (= e!2087 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-datatypes ((V!421 0))(
  ( (V!422 (val!97 Int)) )
))
(declare-datatypes ((ValueCell!75 0))(
  ( (ValueCellFull!75 (v!1184 V!421)) (EmptyCell!75) )
))
(declare-datatypes ((array!299 0))(
  ( (array!300 (arr!142 (Array (_ BitVec 32) ValueCell!75)) (size!204 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!299)

(declare-fun minValue!1434 () V!421)

(declare-datatypes ((array!301 0))(
  ( (array!302 (arr!143 (Array (_ BitVec 32) (_ BitVec 64))) (size!205 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!301)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!421)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun lt!558 () Bool)

(declare-datatypes ((tuple2!76 0))(
  ( (tuple2!77 (_1!38 (_ BitVec 64)) (_2!38 V!421)) )
))
(declare-datatypes ((List!86 0))(
  ( (Nil!83) (Cons!82 (h!648 tuple2!76) (t!2213 List!86)) )
))
(declare-datatypes ((ListLongMap!81 0))(
  ( (ListLongMap!82 (toList!56 List!86)) )
))
(declare-fun contains!26 (ListLongMap!81 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!15 (array!301 array!299 (_ BitVec 32) (_ BitVec 32) V!421 V!421 (_ BitVec 32) Int) ListLongMap!81)

(assert (=> b!4038 (= lt!558 (contains!26 (getCurrentListMap!15 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!4039 () Bool)

(declare-fun res!5511 () Bool)

(assert (=> b!4039 (=> (not res!5511) (not e!2087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!301 (_ BitVec 32)) Bool)

(assert (=> b!4039 (= res!5511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapNonEmpty!233 () Bool)

(declare-fun mapRes!233 () Bool)

(declare-fun tp!533 () Bool)

(assert (=> mapNonEmpty!233 (= mapRes!233 (and tp!533 e!2088))))

(declare-fun mapKey!233 () (_ BitVec 32))

(declare-fun mapRest!233 () (Array (_ BitVec 32) ValueCell!75))

(declare-fun mapValue!233 () ValueCell!75)

(assert (=> mapNonEmpty!233 (= (arr!142 _values!1492) (store mapRest!233 mapKey!233 mapValue!233))))

(declare-fun b!4041 () Bool)

(declare-fun res!5509 () Bool)

(assert (=> b!4041 (=> (not res!5509) (not e!2087))))

(assert (=> b!4041 (= res!5509 (and (= (size!204 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!205 _keys!1806) (size!204 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!4042 () Bool)

(declare-fun res!5510 () Bool)

(assert (=> b!4042 (=> (not res!5510) (not e!2087))))

(declare-datatypes ((List!87 0))(
  ( (Nil!84) (Cons!83 (h!649 (_ BitVec 64)) (t!2214 List!87)) )
))
(declare-fun arrayNoDuplicates!0 (array!301 (_ BitVec 32) List!87) Bool)

(assert (=> b!4042 (= res!5510 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!84))))

(declare-fun mapIsEmpty!233 () Bool)

(assert (=> mapIsEmpty!233 mapRes!233))

(declare-fun b!4040 () Bool)

(declare-fun e!2090 () Bool)

(assert (=> b!4040 (= e!2090 (and e!2086 mapRes!233))))

(declare-fun condMapEmpty!233 () Bool)

(declare-fun mapDefault!233 () ValueCell!75)

(assert (=> b!4040 (= condMapEmpty!233 (= (arr!142 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!75)) mapDefault!233)))))

(declare-fun res!5512 () Bool)

(assert (=> start!632 (=> (not res!5512) (not e!2087))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!632 (= res!5512 (validMask!0 mask!2250))))

(assert (=> start!632 e!2087))

(assert (=> start!632 tp!532))

(assert (=> start!632 true))

(declare-fun array_inv!103 (array!299) Bool)

(assert (=> start!632 (and (array_inv!103 _values!1492) e!2090)))

(assert (=> start!632 tp_is_empty!183))

(declare-fun array_inv!104 (array!301) Bool)

(assert (=> start!632 (array_inv!104 _keys!1806)))

(assert (= (and start!632 res!5512) b!4041))

(assert (= (and b!4041 res!5509) b!4039))

(assert (= (and b!4039 res!5511) b!4042))

(assert (= (and b!4042 res!5510) b!4038))

(assert (= (and b!4040 condMapEmpty!233) mapIsEmpty!233))

(assert (= (and b!4040 (not condMapEmpty!233)) mapNonEmpty!233))

(get-info :version)

(assert (= (and mapNonEmpty!233 ((_ is ValueCellFull!75) mapValue!233)) b!4037))

(assert (= (and b!4040 ((_ is ValueCellFull!75) mapDefault!233)) b!4036))

(assert (= start!632 b!4040))

(declare-fun m!2079 () Bool)

(assert (=> b!4038 m!2079))

(assert (=> b!4038 m!2079))

(declare-fun m!2081 () Bool)

(assert (=> b!4038 m!2081))

(declare-fun m!2083 () Bool)

(assert (=> mapNonEmpty!233 m!2083))

(declare-fun m!2085 () Bool)

(assert (=> start!632 m!2085))

(declare-fun m!2087 () Bool)

(assert (=> start!632 m!2087))

(declare-fun m!2089 () Bool)

(assert (=> start!632 m!2089))

(declare-fun m!2091 () Bool)

(assert (=> b!4039 m!2091))

(declare-fun m!2093 () Bool)

(assert (=> b!4042 m!2093))

(check-sat (not start!632) (not b!4038) b_and!243 tp_is_empty!183 (not b!4039) (not mapNonEmpty!233) (not b!4042) (not b_next!105))
(check-sat b_and!243 (not b_next!105))
