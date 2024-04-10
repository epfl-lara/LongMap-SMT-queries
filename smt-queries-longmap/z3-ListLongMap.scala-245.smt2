; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4154 () Bool)

(assert start!4154)

(declare-fun b_free!1059 () Bool)

(declare-fun b_next!1059 () Bool)

(assert (=> start!4154 (= b_free!1059 (not b_next!1059))))

(declare-fun tp!4597 () Bool)

(declare-fun b_and!1869 () Bool)

(assert (=> start!4154 (= tp!4597 b_and!1869)))

(declare-fun b!31301 () Bool)

(declare-fun e!20008 () Bool)

(assert (=> b!31301 (= e!20008 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1709 0))(
  ( (V!1710 (val!733 Int)) )
))
(declare-datatypes ((ValueCell!507 0))(
  ( (ValueCellFull!507 (v!1822 V!1709)) (EmptyCell!507) )
))
(declare-datatypes ((array!2049 0))(
  ( (array!2050 (arr!978 (Array (_ BitVec 32) ValueCell!507)) (size!1079 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2049)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun lt!11549 () Bool)

(declare-datatypes ((array!2051 0))(
  ( (array!2052 (arr!979 (Array (_ BitVec 32) (_ BitVec 64))) (size!1080 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2051)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1709)

(declare-fun minValue!1443 () V!1709)

(declare-datatypes ((tuple2!1200 0))(
  ( (tuple2!1201 (_1!611 (_ BitVec 64)) (_2!611 V!1709)) )
))
(declare-datatypes ((List!794 0))(
  ( (Nil!791) (Cons!790 (h!1357 tuple2!1200) (t!3487 List!794)) )
))
(declare-datatypes ((ListLongMap!777 0))(
  ( (ListLongMap!778 (toList!404 List!794)) )
))
(declare-fun contains!344 (ListLongMap!777 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!232 (array!2051 array!2049 (_ BitVec 32) (_ BitVec 32) V!1709 V!1709 (_ BitVec 32) Int) ListLongMap!777)

(assert (=> b!31301 (= lt!11549 (contains!344 (getCurrentListMap!232 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304))))

(declare-fun b!31302 () Bool)

(declare-fun res!18956 () Bool)

(assert (=> b!31302 (=> (not res!18956) (not e!20008))))

(declare-datatypes ((List!795 0))(
  ( (Nil!792) (Cons!791 (h!1358 (_ BitVec 64)) (t!3488 List!795)) )
))
(declare-fun arrayNoDuplicates!0 (array!2051 (_ BitVec 32) List!795) Bool)

(assert (=> b!31302 (= res!18956 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!792))))

(declare-fun b!31303 () Bool)

(declare-fun e!20009 () Bool)

(declare-fun tp_is_empty!1413 () Bool)

(assert (=> b!31303 (= e!20009 tp_is_empty!1413)))

(declare-fun b!31304 () Bool)

(declare-fun e!20005 () Bool)

(assert (=> b!31304 (= e!20005 tp_is_empty!1413)))

(declare-fun b!31305 () Bool)

(declare-fun res!18955 () Bool)

(assert (=> b!31305 (=> (not res!18955) (not e!20008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2051 (_ BitVec 32)) Bool)

(assert (=> b!31305 (= res!18955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31306 () Bool)

(declare-fun res!18954 () Bool)

(assert (=> b!31306 (=> (not res!18954) (not e!20008))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31306 (= res!18954 (validKeyInArray!0 k0!1304))))

(declare-fun mapNonEmpty!1648 () Bool)

(declare-fun mapRes!1648 () Bool)

(declare-fun tp!4596 () Bool)

(assert (=> mapNonEmpty!1648 (= mapRes!1648 (and tp!4596 e!20005))))

(declare-fun mapRest!1648 () (Array (_ BitVec 32) ValueCell!507))

(declare-fun mapKey!1648 () (_ BitVec 32))

(declare-fun mapValue!1648 () ValueCell!507)

(assert (=> mapNonEmpty!1648 (= (arr!978 _values!1501) (store mapRest!1648 mapKey!1648 mapValue!1648))))

(declare-fun res!18953 () Bool)

(assert (=> start!4154 (=> (not res!18953) (not e!20008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4154 (= res!18953 (validMask!0 mask!2294))))

(assert (=> start!4154 e!20008))

(assert (=> start!4154 true))

(assert (=> start!4154 tp!4597))

(declare-fun e!20007 () Bool)

(declare-fun array_inv!683 (array!2049) Bool)

(assert (=> start!4154 (and (array_inv!683 _values!1501) e!20007)))

(declare-fun array_inv!684 (array!2051) Bool)

(assert (=> start!4154 (array_inv!684 _keys!1833)))

(assert (=> start!4154 tp_is_empty!1413))

(declare-fun mapIsEmpty!1648 () Bool)

(assert (=> mapIsEmpty!1648 mapRes!1648))

(declare-fun b!31307 () Bool)

(declare-fun res!18957 () Bool)

(assert (=> b!31307 (=> (not res!18957) (not e!20008))))

(assert (=> b!31307 (= res!18957 (and (= (size!1079 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1080 _keys!1833) (size!1079 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31308 () Bool)

(assert (=> b!31308 (= e!20007 (and e!20009 mapRes!1648))))

(declare-fun condMapEmpty!1648 () Bool)

(declare-fun mapDefault!1648 () ValueCell!507)

(assert (=> b!31308 (= condMapEmpty!1648 (= (arr!978 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!507)) mapDefault!1648)))))

(assert (= (and start!4154 res!18953) b!31307))

(assert (= (and b!31307 res!18957) b!31305))

(assert (= (and b!31305 res!18955) b!31302))

(assert (= (and b!31302 res!18956) b!31306))

(assert (= (and b!31306 res!18954) b!31301))

(assert (= (and b!31308 condMapEmpty!1648) mapIsEmpty!1648))

(assert (= (and b!31308 (not condMapEmpty!1648)) mapNonEmpty!1648))

(get-info :version)

(assert (= (and mapNonEmpty!1648 ((_ is ValueCellFull!507) mapValue!1648)) b!31304))

(assert (= (and b!31308 ((_ is ValueCellFull!507) mapDefault!1648)) b!31303))

(assert (= start!4154 b!31308))

(declare-fun m!25117 () Bool)

(assert (=> b!31301 m!25117))

(assert (=> b!31301 m!25117))

(declare-fun m!25119 () Bool)

(assert (=> b!31301 m!25119))

(declare-fun m!25121 () Bool)

(assert (=> b!31305 m!25121))

(declare-fun m!25123 () Bool)

(assert (=> start!4154 m!25123))

(declare-fun m!25125 () Bool)

(assert (=> start!4154 m!25125))

(declare-fun m!25127 () Bool)

(assert (=> start!4154 m!25127))

(declare-fun m!25129 () Bool)

(assert (=> b!31306 m!25129))

(declare-fun m!25131 () Bool)

(assert (=> b!31302 m!25131))

(declare-fun m!25133 () Bool)

(assert (=> mapNonEmpty!1648 m!25133))

(check-sat b_and!1869 (not mapNonEmpty!1648) (not start!4154) (not b!31302) (not b!31306) (not b!31305) tp_is_empty!1413 (not b_next!1059) (not b!31301))
(check-sat b_and!1869 (not b_next!1059))
