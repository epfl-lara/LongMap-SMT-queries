; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4160 () Bool)

(assert start!4160)

(declare-fun b_free!1069 () Bool)

(declare-fun b_next!1069 () Bool)

(assert (=> start!4160 (= b_free!1069 (not b_next!1069))))

(declare-fun tp!4626 () Bool)

(declare-fun b_and!1869 () Bool)

(assert (=> start!4160 (= tp!4626 b_and!1869)))

(declare-fun res!18989 () Bool)

(declare-fun e!20030 () Bool)

(assert (=> start!4160 (=> (not res!18989) (not e!20030))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4160 (= res!18989 (validMask!0 mask!2294))))

(assert (=> start!4160 e!20030))

(assert (=> start!4160 true))

(assert (=> start!4160 tp!4626))

(declare-datatypes ((V!1723 0))(
  ( (V!1724 (val!738 Int)) )
))
(declare-datatypes ((ValueCell!512 0))(
  ( (ValueCellFull!512 (v!1827 V!1723)) (EmptyCell!512) )
))
(declare-datatypes ((array!2049 0))(
  ( (array!2050 (arr!978 (Array (_ BitVec 32) ValueCell!512)) (size!1079 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2049)

(declare-fun e!20029 () Bool)

(declare-fun array_inv!671 (array!2049) Bool)

(assert (=> start!4160 (and (array_inv!671 _values!1501) e!20029)))

(declare-datatypes ((array!2051 0))(
  ( (array!2052 (arr!979 (Array (_ BitVec 32) (_ BitVec 64))) (size!1080 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2051)

(declare-fun array_inv!672 (array!2051) Bool)

(assert (=> start!4160 (array_inv!672 _keys!1833)))

(declare-fun tp_is_empty!1423 () Bool)

(assert (=> start!4160 tp_is_empty!1423))

(declare-fun b!31349 () Bool)

(declare-fun res!18991 () Bool)

(assert (=> b!31349 (=> (not res!18991) (not e!20030))))

(declare-datatypes ((List!796 0))(
  ( (Nil!793) (Cons!792 (h!1359 (_ BitVec 64)) (t!3483 List!796)) )
))
(declare-fun arrayNoDuplicates!0 (array!2051 (_ BitVec 32) List!796) Bool)

(assert (=> b!31349 (= res!18991 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!793))))

(declare-fun b!31350 () Bool)

(declare-fun res!18988 () Bool)

(assert (=> b!31350 (=> (not res!18988) (not e!20030))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2051 (_ BitVec 32)) Bool)

(assert (=> b!31350 (= res!18988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1663 () Bool)

(declare-fun mapRes!1663 () Bool)

(assert (=> mapIsEmpty!1663 mapRes!1663))

(declare-fun b!31351 () Bool)

(declare-fun res!18992 () Bool)

(assert (=> b!31351 (=> (not res!18992) (not e!20030))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31351 (= res!18992 (validKeyInArray!0 k0!1304))))

(declare-fun b!31352 () Bool)

(assert (=> b!31352 (= e!20030 false)))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun lt!11520 () Bool)

(declare-fun zeroValue!1443 () V!1723)

(declare-fun minValue!1443 () V!1723)

(declare-datatypes ((tuple2!1202 0))(
  ( (tuple2!1203 (_1!612 (_ BitVec 64)) (_2!612 V!1723)) )
))
(declare-datatypes ((List!797 0))(
  ( (Nil!794) (Cons!793 (h!1360 tuple2!1202) (t!3484 List!797)) )
))
(declare-datatypes ((ListLongMap!773 0))(
  ( (ListLongMap!774 (toList!402 List!797)) )
))
(declare-fun contains!344 (ListLongMap!773 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!227 (array!2051 array!2049 (_ BitVec 32) (_ BitVec 32) V!1723 V!1723 (_ BitVec 32) Int) ListLongMap!773)

(assert (=> b!31352 (= lt!11520 (contains!344 (getCurrentListMap!227 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304))))

(declare-fun b!31353 () Bool)

(declare-fun res!18990 () Bool)

(assert (=> b!31353 (=> (not res!18990) (not e!20030))))

(assert (=> b!31353 (= res!18990 (and (= (size!1079 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1080 _keys!1833) (size!1079 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31354 () Bool)

(declare-fun e!20032 () Bool)

(assert (=> b!31354 (= e!20032 tp_is_empty!1423)))

(declare-fun b!31355 () Bool)

(declare-fun e!20028 () Bool)

(assert (=> b!31355 (= e!20028 tp_is_empty!1423)))

(declare-fun b!31356 () Bool)

(assert (=> b!31356 (= e!20029 (and e!20032 mapRes!1663))))

(declare-fun condMapEmpty!1663 () Bool)

(declare-fun mapDefault!1663 () ValueCell!512)

(assert (=> b!31356 (= condMapEmpty!1663 (= (arr!978 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!512)) mapDefault!1663)))))

(declare-fun mapNonEmpty!1663 () Bool)

(declare-fun tp!4627 () Bool)

(assert (=> mapNonEmpty!1663 (= mapRes!1663 (and tp!4627 e!20028))))

(declare-fun mapKey!1663 () (_ BitVec 32))

(declare-fun mapRest!1663 () (Array (_ BitVec 32) ValueCell!512))

(declare-fun mapValue!1663 () ValueCell!512)

(assert (=> mapNonEmpty!1663 (= (arr!978 _values!1501) (store mapRest!1663 mapKey!1663 mapValue!1663))))

(assert (= (and start!4160 res!18989) b!31353))

(assert (= (and b!31353 res!18990) b!31350))

(assert (= (and b!31350 res!18988) b!31349))

(assert (= (and b!31349 res!18991) b!31351))

(assert (= (and b!31351 res!18992) b!31352))

(assert (= (and b!31356 condMapEmpty!1663) mapIsEmpty!1663))

(assert (= (and b!31356 (not condMapEmpty!1663)) mapNonEmpty!1663))

(get-info :version)

(assert (= (and mapNonEmpty!1663 ((_ is ValueCellFull!512) mapValue!1663)) b!31355))

(assert (= (and b!31356 ((_ is ValueCellFull!512) mapDefault!1663)) b!31354))

(assert (= start!4160 b!31356))

(declare-fun m!25055 () Bool)

(assert (=> mapNonEmpty!1663 m!25055))

(declare-fun m!25057 () Bool)

(assert (=> start!4160 m!25057))

(declare-fun m!25059 () Bool)

(assert (=> start!4160 m!25059))

(declare-fun m!25061 () Bool)

(assert (=> start!4160 m!25061))

(declare-fun m!25063 () Bool)

(assert (=> b!31349 m!25063))

(declare-fun m!25065 () Bool)

(assert (=> b!31350 m!25065))

(declare-fun m!25067 () Bool)

(assert (=> b!31351 m!25067))

(declare-fun m!25069 () Bool)

(assert (=> b!31352 m!25069))

(assert (=> b!31352 m!25069))

(declare-fun m!25071 () Bool)

(assert (=> b!31352 m!25071))

(check-sat (not b!31352) (not b!31349) (not start!4160) (not mapNonEmpty!1663) tp_is_empty!1423 b_and!1869 (not b!31351) (not b_next!1069) (not b!31350))
(check-sat b_and!1869 (not b_next!1069))
