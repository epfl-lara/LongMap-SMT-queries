; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83400 () Bool)

(assert start!83400)

(declare-fun b_free!19411 () Bool)

(declare-fun b_next!19411 () Bool)

(assert (=> start!83400 (= b_free!19411 (not b_next!19411))))

(declare-fun tp!67513 () Bool)

(declare-fun b_and!30987 () Bool)

(assert (=> start!83400 (= tp!67513 b_and!30987)))

(declare-fun b!974015 () Bool)

(declare-fun res!652051 () Bool)

(declare-fun e!548988 () Bool)

(assert (=> b!974015 (=> (not res!652051) (not e!548988))))

(declare-datatypes ((array!60584 0))(
  ( (array!60585 (arr!29156 (Array (_ BitVec 32) (_ BitVec 64))) (size!29637 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60584)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!974015 (= res!652051 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29637 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29637 _keys!1717))))))

(declare-fun mapIsEmpty!35473 () Bool)

(declare-fun mapRes!35473 () Bool)

(assert (=> mapIsEmpty!35473 mapRes!35473))

(declare-fun b!974016 () Bool)

(declare-fun res!652049 () Bool)

(assert (=> b!974016 (=> (not res!652049) (not e!548988))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34729 0))(
  ( (V!34730 (val!11205 Int)) )
))
(declare-datatypes ((ValueCell!10673 0))(
  ( (ValueCellFull!10673 (v!13763 V!34729)) (EmptyCell!10673) )
))
(declare-datatypes ((array!60586 0))(
  ( (array!60587 (arr!29157 (Array (_ BitVec 32) ValueCell!10673)) (size!29638 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60586)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!974016 (= res!652049 (and (= (size!29638 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29637 _keys!1717) (size!29638 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974017 () Bool)

(assert (=> b!974017 (= e!548988 false)))

(declare-fun zeroValue!1367 () V!34729)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34729)

(declare-datatypes ((tuple2!14468 0))(
  ( (tuple2!14469 (_1!7245 (_ BitVec 64)) (_2!7245 V!34729)) )
))
(declare-datatypes ((List!20272 0))(
  ( (Nil!20269) (Cons!20268 (h!21430 tuple2!14468) (t!28740 List!20272)) )
))
(declare-datatypes ((ListLongMap!13155 0))(
  ( (ListLongMap!13156 (toList!6593 List!20272)) )
))
(declare-fun lt!432516 () ListLongMap!13155)

(declare-fun getCurrentListMap!3755 (array!60584 array!60586 (_ BitVec 32) (_ BitVec 32) V!34729 V!34729 (_ BitVec 32) Int) ListLongMap!13155)

(assert (=> b!974017 (= lt!432516 (getCurrentListMap!3755 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974018 () Bool)

(declare-fun e!548986 () Bool)

(declare-fun tp_is_empty!22309 () Bool)

(assert (=> b!974018 (= e!548986 tp_is_empty!22309)))

(declare-fun b!974019 () Bool)

(declare-fun res!652052 () Bool)

(assert (=> b!974019 (=> (not res!652052) (not e!548988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60584 (_ BitVec 32)) Bool)

(assert (=> b!974019 (= res!652052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974020 () Bool)

(declare-fun e!548985 () Bool)

(assert (=> b!974020 (= e!548985 tp_is_empty!22309)))

(declare-fun b!974021 () Bool)

(declare-fun e!548984 () Bool)

(assert (=> b!974021 (= e!548984 (and e!548986 mapRes!35473))))

(declare-fun condMapEmpty!35473 () Bool)

(declare-fun mapDefault!35473 () ValueCell!10673)

(assert (=> b!974021 (= condMapEmpty!35473 (= (arr!29157 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10673)) mapDefault!35473)))))

(declare-fun b!974023 () Bool)

(declare-fun res!652048 () Bool)

(assert (=> b!974023 (=> (not res!652048) (not e!548988))))

(declare-fun contains!5632 (ListLongMap!13155 (_ BitVec 64)) Bool)

(assert (=> b!974023 (= res!652048 (contains!5632 (getCurrentListMap!3755 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29156 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35473 () Bool)

(declare-fun tp!67512 () Bool)

(assert (=> mapNonEmpty!35473 (= mapRes!35473 (and tp!67512 e!548985))))

(declare-fun mapRest!35473 () (Array (_ BitVec 32) ValueCell!10673))

(declare-fun mapKey!35473 () (_ BitVec 32))

(declare-fun mapValue!35473 () ValueCell!10673)

(assert (=> mapNonEmpty!35473 (= (arr!29157 _values!1425) (store mapRest!35473 mapKey!35473 mapValue!35473))))

(declare-fun b!974024 () Bool)

(declare-fun res!652050 () Bool)

(assert (=> b!974024 (=> (not res!652050) (not e!548988))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974024 (= res!652050 (validKeyInArray!0 (select (arr!29156 _keys!1717) i!822)))))

(declare-fun b!974022 () Bool)

(declare-fun res!652053 () Bool)

(assert (=> b!974022 (=> (not res!652053) (not e!548988))))

(declare-datatypes ((List!20273 0))(
  ( (Nil!20270) (Cons!20269 (h!21431 (_ BitVec 64)) (t!28741 List!20273)) )
))
(declare-fun arrayNoDuplicates!0 (array!60584 (_ BitVec 32) List!20273) Bool)

(assert (=> b!974022 (= res!652053 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20270))))

(declare-fun res!652054 () Bool)

(assert (=> start!83400 (=> (not res!652054) (not e!548988))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83400 (= res!652054 (validMask!0 mask!2147))))

(assert (=> start!83400 e!548988))

(assert (=> start!83400 true))

(declare-fun array_inv!22603 (array!60586) Bool)

(assert (=> start!83400 (and (array_inv!22603 _values!1425) e!548984)))

(assert (=> start!83400 tp_is_empty!22309))

(assert (=> start!83400 tp!67513))

(declare-fun array_inv!22604 (array!60584) Bool)

(assert (=> start!83400 (array_inv!22604 _keys!1717)))

(assert (= (and start!83400 res!652054) b!974016))

(assert (= (and b!974016 res!652049) b!974019))

(assert (= (and b!974019 res!652052) b!974022))

(assert (= (and b!974022 res!652053) b!974015))

(assert (= (and b!974015 res!652051) b!974024))

(assert (= (and b!974024 res!652050) b!974023))

(assert (= (and b!974023 res!652048) b!974017))

(assert (= (and b!974021 condMapEmpty!35473) mapIsEmpty!35473))

(assert (= (and b!974021 (not condMapEmpty!35473)) mapNonEmpty!35473))

(get-info :version)

(assert (= (and mapNonEmpty!35473 ((_ is ValueCellFull!10673) mapValue!35473)) b!974020))

(assert (= (and b!974021 ((_ is ValueCellFull!10673) mapDefault!35473)) b!974018))

(assert (= start!83400 b!974021))

(declare-fun m!901067 () Bool)

(assert (=> b!974022 m!901067))

(declare-fun m!901069 () Bool)

(assert (=> b!974023 m!901069))

(declare-fun m!901071 () Bool)

(assert (=> b!974023 m!901071))

(assert (=> b!974023 m!901069))

(assert (=> b!974023 m!901071))

(declare-fun m!901073 () Bool)

(assert (=> b!974023 m!901073))

(declare-fun m!901075 () Bool)

(assert (=> start!83400 m!901075))

(declare-fun m!901077 () Bool)

(assert (=> start!83400 m!901077))

(declare-fun m!901079 () Bool)

(assert (=> start!83400 m!901079))

(declare-fun m!901081 () Bool)

(assert (=> b!974019 m!901081))

(declare-fun m!901083 () Bool)

(assert (=> b!974017 m!901083))

(declare-fun m!901085 () Bool)

(assert (=> mapNonEmpty!35473 m!901085))

(assert (=> b!974024 m!901071))

(assert (=> b!974024 m!901071))

(declare-fun m!901087 () Bool)

(assert (=> b!974024 m!901087))

(check-sat (not b!974019) (not b!974022) tp_is_empty!22309 (not b!974017) (not mapNonEmpty!35473) (not b!974023) b_and!30987 (not b_next!19411) (not start!83400) (not b!974024))
(check-sat b_and!30987 (not b_next!19411))
