; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83352 () Bool)

(assert start!83352)

(declare-fun b_free!19177 () Bool)

(declare-fun b_next!19177 () Bool)

(assert (=> start!83352 (= b_free!19177 (not b_next!19177))))

(declare-fun tp!66810 () Bool)

(declare-fun b_and!30675 () Bool)

(assert (=> start!83352 (= tp!66810 b_and!30675)))

(declare-fun res!649908 () Bool)

(declare-fun e!547708 () Bool)

(assert (=> start!83352 (=> (not res!649908) (not e!547708))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83352 (= res!649908 (validMask!0 mask!2147))))

(assert (=> start!83352 e!547708))

(assert (=> start!83352 true))

(declare-datatypes ((V!34417 0))(
  ( (V!34418 (val!11088 Int)) )
))
(declare-datatypes ((ValueCell!10556 0))(
  ( (ValueCellFull!10556 (v!13644 V!34417)) (EmptyCell!10556) )
))
(declare-datatypes ((array!60228 0))(
  ( (array!60229 (arr!28973 (Array (_ BitVec 32) ValueCell!10556)) (size!29453 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60228)

(declare-fun e!547711 () Bool)

(declare-fun array_inv!22477 (array!60228) Bool)

(assert (=> start!83352 (and (array_inv!22477 _values!1425) e!547711)))

(declare-fun tp_is_empty!22075 () Bool)

(assert (=> start!83352 tp_is_empty!22075))

(assert (=> start!83352 tp!66810))

(declare-datatypes ((array!60230 0))(
  ( (array!60231 (arr!28974 (Array (_ BitVec 32) (_ BitVec 64))) (size!29454 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60230)

(declare-fun array_inv!22478 (array!60230) Bool)

(assert (=> start!83352 (array_inv!22478 _keys!1717)))

(declare-fun b!971396 () Bool)

(declare-fun e!547709 () Bool)

(assert (=> b!971396 (= e!547709 tp_is_empty!22075)))

(declare-fun b!971397 () Bool)

(declare-fun e!547710 () Bool)

(declare-fun mapRes!35122 () Bool)

(assert (=> b!971397 (= e!547711 (and e!547710 mapRes!35122))))

(declare-fun condMapEmpty!35122 () Bool)

(declare-fun mapDefault!35122 () ValueCell!10556)

(assert (=> b!971397 (= condMapEmpty!35122 (= (arr!28973 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10556)) mapDefault!35122)))))

(declare-fun mapIsEmpty!35122 () Bool)

(assert (=> mapIsEmpty!35122 mapRes!35122))

(declare-fun b!971398 () Bool)

(declare-fun res!649911 () Bool)

(assert (=> b!971398 (=> (not res!649911) (not e!547708))))

(declare-datatypes ((List!20066 0))(
  ( (Nil!20063) (Cons!20062 (h!21230 (_ BitVec 64)) (t!28421 List!20066)) )
))
(declare-fun arrayNoDuplicates!0 (array!60230 (_ BitVec 32) List!20066) Bool)

(assert (=> b!971398 (= res!649911 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20063))))

(declare-fun b!971399 () Bool)

(declare-fun res!649913 () Bool)

(assert (=> b!971399 (=> (not res!649913) (not e!547708))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971399 (= res!649913 (validKeyInArray!0 (select (arr!28974 _keys!1717) i!822)))))

(declare-fun b!971400 () Bool)

(declare-fun res!649912 () Bool)

(assert (=> b!971400 (=> (not res!649912) (not e!547708))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!971400 (= res!649912 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29454 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29454 _keys!1717))))))

(declare-fun b!971401 () Bool)

(declare-fun res!649909 () Bool)

(assert (=> b!971401 (=> (not res!649909) (not e!547708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60230 (_ BitVec 32)) Bool)

(assert (=> b!971401 (= res!649909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!971402 () Bool)

(assert (=> b!971402 (= e!547708 false)))

(declare-fun zeroValue!1367 () V!34417)

(declare-fun minValue!1367 () V!34417)

(declare-fun lt!432105 () Bool)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-datatypes ((tuple2!14210 0))(
  ( (tuple2!14211 (_1!7116 (_ BitVec 64)) (_2!7116 V!34417)) )
))
(declare-datatypes ((List!20067 0))(
  ( (Nil!20064) (Cons!20063 (h!21231 tuple2!14210) (t!28422 List!20067)) )
))
(declare-datatypes ((ListLongMap!12909 0))(
  ( (ListLongMap!12910 (toList!6470 List!20067)) )
))
(declare-fun contains!5585 (ListLongMap!12909 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3703 (array!60230 array!60228 (_ BitVec 32) (_ BitVec 32) V!34417 V!34417 (_ BitVec 32) Int) ListLongMap!12909)

(assert (=> b!971402 (= lt!432105 (contains!5585 (getCurrentListMap!3703 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28974 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35122 () Bool)

(declare-fun tp!66811 () Bool)

(assert (=> mapNonEmpty!35122 (= mapRes!35122 (and tp!66811 e!547709))))

(declare-fun mapRest!35122 () (Array (_ BitVec 32) ValueCell!10556))

(declare-fun mapValue!35122 () ValueCell!10556)

(declare-fun mapKey!35122 () (_ BitVec 32))

(assert (=> mapNonEmpty!35122 (= (arr!28973 _values!1425) (store mapRest!35122 mapKey!35122 mapValue!35122))))

(declare-fun b!971403 () Bool)

(assert (=> b!971403 (= e!547710 tp_is_empty!22075)))

(declare-fun b!971404 () Bool)

(declare-fun res!649910 () Bool)

(assert (=> b!971404 (=> (not res!649910) (not e!547708))))

(assert (=> b!971404 (= res!649910 (and (= (size!29453 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29454 _keys!1717) (size!29453 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(assert (= (and start!83352 res!649908) b!971404))

(assert (= (and b!971404 res!649910) b!971401))

(assert (= (and b!971401 res!649909) b!971398))

(assert (= (and b!971398 res!649911) b!971400))

(assert (= (and b!971400 res!649912) b!971399))

(assert (= (and b!971399 res!649913) b!971402))

(assert (= (and b!971397 condMapEmpty!35122) mapIsEmpty!35122))

(assert (= (and b!971397 (not condMapEmpty!35122)) mapNonEmpty!35122))

(get-info :version)

(assert (= (and mapNonEmpty!35122 ((_ is ValueCellFull!10556) mapValue!35122)) b!971396))

(assert (= (and b!971397 ((_ is ValueCellFull!10556) mapDefault!35122)) b!971403))

(assert (= start!83352 b!971397))

(declare-fun m!899501 () Bool)

(assert (=> b!971402 m!899501))

(declare-fun m!899503 () Bool)

(assert (=> b!971402 m!899503))

(assert (=> b!971402 m!899501))

(assert (=> b!971402 m!899503))

(declare-fun m!899505 () Bool)

(assert (=> b!971402 m!899505))

(declare-fun m!899507 () Bool)

(assert (=> start!83352 m!899507))

(declare-fun m!899509 () Bool)

(assert (=> start!83352 m!899509))

(declare-fun m!899511 () Bool)

(assert (=> start!83352 m!899511))

(assert (=> b!971399 m!899503))

(assert (=> b!971399 m!899503))

(declare-fun m!899513 () Bool)

(assert (=> b!971399 m!899513))

(declare-fun m!899515 () Bool)

(assert (=> b!971398 m!899515))

(declare-fun m!899517 () Bool)

(assert (=> mapNonEmpty!35122 m!899517))

(declare-fun m!899519 () Bool)

(assert (=> b!971401 m!899519))

(check-sat (not mapNonEmpty!35122) (not b!971402) (not b!971401) b_and!30675 (not start!83352) (not b_next!19177) (not b!971398) (not b!971399) tp_is_empty!22075)
(check-sat b_and!30675 (not b_next!19177))
