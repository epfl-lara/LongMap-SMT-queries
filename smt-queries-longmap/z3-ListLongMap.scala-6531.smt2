; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83238 () Bool)

(assert start!83238)

(declare-fun res!649002 () Bool)

(declare-fun e!546855 () Bool)

(assert (=> start!83238 (=> (not res!649002) (not e!546855))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83238 (= res!649002 (validMask!0 mask!2147))))

(assert (=> start!83238 e!546855))

(assert (=> start!83238 true))

(declare-datatypes ((V!34265 0))(
  ( (V!34266 (val!11031 Int)) )
))
(declare-datatypes ((ValueCell!10499 0))(
  ( (ValueCellFull!10499 (v!13587 V!34265)) (EmptyCell!10499) )
))
(declare-datatypes ((array!60008 0))(
  ( (array!60009 (arr!28863 (Array (_ BitVec 32) ValueCell!10499)) (size!29343 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60008)

(declare-fun e!546853 () Bool)

(declare-fun array_inv!22399 (array!60008) Bool)

(assert (=> start!83238 (and (array_inv!22399 _values!1425) e!546853)))

(declare-datatypes ((array!60010 0))(
  ( (array!60011 (arr!28864 (Array (_ BitVec 32) (_ BitVec 64))) (size!29344 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60010)

(declare-fun array_inv!22400 (array!60010) Bool)

(assert (=> start!83238 (array_inv!22400 _keys!1717)))

(declare-fun mapIsEmpty!34951 () Bool)

(declare-fun mapRes!34951 () Bool)

(assert (=> mapIsEmpty!34951 mapRes!34951))

(declare-fun b!969977 () Bool)

(declare-fun e!546852 () Bool)

(declare-fun tp_is_empty!21961 () Bool)

(assert (=> b!969977 (= e!546852 tp_is_empty!21961)))

(declare-fun b!969978 () Bool)

(declare-fun res!649004 () Bool)

(assert (=> b!969978 (=> (not res!649004) (not e!546855))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969978 (= res!649004 (and (= (size!29343 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29344 _keys!1717) (size!29343 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969979 () Bool)

(declare-fun e!546854 () Bool)

(assert (=> b!969979 (= e!546854 tp_is_empty!21961)))

(declare-fun b!969980 () Bool)

(assert (=> b!969980 (= e!546855 false)))

(declare-fun lt!431952 () Bool)

(declare-datatypes ((List!20005 0))(
  ( (Nil!20002) (Cons!20001 (h!21169 (_ BitVec 64)) (t!28360 List!20005)) )
))
(declare-fun arrayNoDuplicates!0 (array!60010 (_ BitVec 32) List!20005) Bool)

(assert (=> b!969980 (= lt!431952 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20002))))

(declare-fun b!969981 () Bool)

(declare-fun res!649003 () Bool)

(assert (=> b!969981 (=> (not res!649003) (not e!546855))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60010 (_ BitVec 32)) Bool)

(assert (=> b!969981 (= res!649003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969982 () Bool)

(assert (=> b!969982 (= e!546853 (and e!546854 mapRes!34951))))

(declare-fun condMapEmpty!34951 () Bool)

(declare-fun mapDefault!34951 () ValueCell!10499)

(assert (=> b!969982 (= condMapEmpty!34951 (= (arr!28863 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10499)) mapDefault!34951)))))

(declare-fun mapNonEmpty!34951 () Bool)

(declare-fun tp!66520 () Bool)

(assert (=> mapNonEmpty!34951 (= mapRes!34951 (and tp!66520 e!546852))))

(declare-fun mapValue!34951 () ValueCell!10499)

(declare-fun mapRest!34951 () (Array (_ BitVec 32) ValueCell!10499))

(declare-fun mapKey!34951 () (_ BitVec 32))

(assert (=> mapNonEmpty!34951 (= (arr!28863 _values!1425) (store mapRest!34951 mapKey!34951 mapValue!34951))))

(assert (= (and start!83238 res!649002) b!969978))

(assert (= (and b!969978 res!649004) b!969981))

(assert (= (and b!969981 res!649003) b!969980))

(assert (= (and b!969982 condMapEmpty!34951) mapIsEmpty!34951))

(assert (= (and b!969982 (not condMapEmpty!34951)) mapNonEmpty!34951))

(get-info :version)

(assert (= (and mapNonEmpty!34951 ((_ is ValueCellFull!10499) mapValue!34951)) b!969977))

(assert (= (and b!969982 ((_ is ValueCellFull!10499) mapDefault!34951)) b!969979))

(assert (= start!83238 b!969982))

(declare-fun m!898493 () Bool)

(assert (=> start!83238 m!898493))

(declare-fun m!898495 () Bool)

(assert (=> start!83238 m!898495))

(declare-fun m!898497 () Bool)

(assert (=> start!83238 m!898497))

(declare-fun m!898499 () Bool)

(assert (=> b!969980 m!898499))

(declare-fun m!898501 () Bool)

(assert (=> b!969981 m!898501))

(declare-fun m!898503 () Bool)

(assert (=> mapNonEmpty!34951 m!898503))

(check-sat (not b!969980) (not start!83238) (not b!969981) (not mapNonEmpty!34951) tp_is_empty!21961)
(check-sat)
