; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4166 () Bool)

(assert start!4166)

(declare-fun b_free!1071 () Bool)

(declare-fun b_next!1071 () Bool)

(assert (=> start!4166 (= b_free!1071 (not b_next!1071))))

(declare-fun tp!4632 () Bool)

(declare-fun b_and!1881 () Bool)

(assert (=> start!4166 (= tp!4632 b_and!1881)))

(declare-fun b!31445 () Bool)

(declare-fun e!20097 () Bool)

(declare-fun tp_is_empty!1425 () Bool)

(assert (=> b!31445 (= e!20097 tp_is_empty!1425)))

(declare-fun b!31446 () Bool)

(declare-fun res!19045 () Bool)

(declare-fun e!20099 () Bool)

(assert (=> b!31446 (=> (not res!19045) (not e!20099))))

(declare-datatypes ((array!2069 0))(
  ( (array!2070 (arr!988 (Array (_ BitVec 32) (_ BitVec 64))) (size!1089 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2069)

(declare-datatypes ((List!800 0))(
  ( (Nil!797) (Cons!796 (h!1363 (_ BitVec 64)) (t!3493 List!800)) )
))
(declare-fun arrayNoDuplicates!0 (array!2069 (_ BitVec 32) List!800) Bool)

(assert (=> b!31446 (= res!19045 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!797))))

(declare-fun b!31447 () Bool)

(declare-fun res!19046 () Bool)

(assert (=> b!31447 (=> (not res!19046) (not e!20099))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31447 (= res!19046 (validKeyInArray!0 k0!1304))))

(declare-fun b!31448 () Bool)

(declare-fun res!19044 () Bool)

(assert (=> b!31448 (=> (not res!19044) (not e!20099))))

(declare-datatypes ((V!1725 0))(
  ( (V!1726 (val!739 Int)) )
))
(declare-datatypes ((ValueCell!513 0))(
  ( (ValueCellFull!513 (v!1828 V!1725)) (EmptyCell!513) )
))
(declare-datatypes ((array!2071 0))(
  ( (array!2072 (arr!989 (Array (_ BitVec 32) ValueCell!513)) (size!1090 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2071)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!31448 (= res!19044 (and (= (size!1090 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1089 _keys!1833) (size!1090 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31449 () Bool)

(declare-fun res!19047 () Bool)

(assert (=> b!31449 (=> (not res!19047) (not e!20099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2069 (_ BitVec 32)) Bool)

(assert (=> b!31449 (= res!19047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1666 () Bool)

(declare-fun mapRes!1666 () Bool)

(declare-fun tp!4633 () Bool)

(assert (=> mapNonEmpty!1666 (= mapRes!1666 (and tp!4633 e!20097))))

(declare-fun mapRest!1666 () (Array (_ BitVec 32) ValueCell!513))

(declare-fun mapKey!1666 () (_ BitVec 32))

(declare-fun mapValue!1666 () ValueCell!513)

(assert (=> mapNonEmpty!1666 (= (arr!989 _values!1501) (store mapRest!1666 mapKey!1666 mapValue!1666))))

(declare-fun b!31450 () Bool)

(declare-fun e!20096 () Bool)

(assert (=> b!31450 (= e!20096 tp_is_empty!1425)))

(declare-fun res!19043 () Bool)

(assert (=> start!4166 (=> (not res!19043) (not e!20099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4166 (= res!19043 (validMask!0 mask!2294))))

(assert (=> start!4166 e!20099))

(assert (=> start!4166 true))

(assert (=> start!4166 tp!4632))

(declare-fun e!20095 () Bool)

(declare-fun array_inv!689 (array!2071) Bool)

(assert (=> start!4166 (and (array_inv!689 _values!1501) e!20095)))

(declare-fun array_inv!690 (array!2069) Bool)

(assert (=> start!4166 (array_inv!690 _keys!1833)))

(assert (=> start!4166 tp_is_empty!1425))

(declare-fun b!31451 () Bool)

(assert (=> b!31451 (= e!20095 (and e!20096 mapRes!1666))))

(declare-fun condMapEmpty!1666 () Bool)

(declare-fun mapDefault!1666 () ValueCell!513)

(assert (=> b!31451 (= condMapEmpty!1666 (= (arr!989 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!513)) mapDefault!1666)))))

(declare-fun mapIsEmpty!1666 () Bool)

(assert (=> mapIsEmpty!1666 mapRes!1666))

(declare-fun b!31452 () Bool)

(assert (=> b!31452 (= e!20099 false)))

(declare-fun defaultEntry!1504 () Int)

(declare-fun lt!11567 () Bool)

(declare-fun zeroValue!1443 () V!1725)

(declare-fun minValue!1443 () V!1725)

(declare-datatypes ((tuple2!1206 0))(
  ( (tuple2!1207 (_1!614 (_ BitVec 64)) (_2!614 V!1725)) )
))
(declare-datatypes ((List!801 0))(
  ( (Nil!798) (Cons!797 (h!1364 tuple2!1206) (t!3494 List!801)) )
))
(declare-datatypes ((ListLongMap!783 0))(
  ( (ListLongMap!784 (toList!407 List!801)) )
))
(declare-fun contains!347 (ListLongMap!783 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!235 (array!2069 array!2071 (_ BitVec 32) (_ BitVec 32) V!1725 V!1725 (_ BitVec 32) Int) ListLongMap!783)

(assert (=> b!31452 (= lt!11567 (contains!347 (getCurrentListMap!235 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304))))

(assert (= (and start!4166 res!19043) b!31448))

(assert (= (and b!31448 res!19044) b!31449))

(assert (= (and b!31449 res!19047) b!31446))

(assert (= (and b!31446 res!19045) b!31447))

(assert (= (and b!31447 res!19046) b!31452))

(assert (= (and b!31451 condMapEmpty!1666) mapIsEmpty!1666))

(assert (= (and b!31451 (not condMapEmpty!1666)) mapNonEmpty!1666))

(get-info :version)

(assert (= (and mapNonEmpty!1666 ((_ is ValueCellFull!513) mapValue!1666)) b!31445))

(assert (= (and b!31451 ((_ is ValueCellFull!513) mapDefault!1666)) b!31450))

(assert (= start!4166 b!31451))

(declare-fun m!25225 () Bool)

(assert (=> b!31452 m!25225))

(assert (=> b!31452 m!25225))

(declare-fun m!25227 () Bool)

(assert (=> b!31452 m!25227))

(declare-fun m!25229 () Bool)

(assert (=> mapNonEmpty!1666 m!25229))

(declare-fun m!25231 () Bool)

(assert (=> b!31449 m!25231))

(declare-fun m!25233 () Bool)

(assert (=> start!4166 m!25233))

(declare-fun m!25235 () Bool)

(assert (=> start!4166 m!25235))

(declare-fun m!25237 () Bool)

(assert (=> start!4166 m!25237))

(declare-fun m!25239 () Bool)

(assert (=> b!31447 m!25239))

(declare-fun m!25241 () Bool)

(assert (=> b!31446 m!25241))

(check-sat (not b_next!1071) tp_is_empty!1425 (not start!4166) (not b!31452) (not mapNonEmpty!1666) (not b!31447) (not b!31449) b_and!1881 (not b!31446))
(check-sat b_and!1881 (not b_next!1071))
