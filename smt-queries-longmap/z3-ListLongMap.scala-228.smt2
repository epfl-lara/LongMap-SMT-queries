; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4040 () Bool)

(assert start!4040)

(declare-fun b_free!955 () Bool)

(declare-fun b_next!955 () Bool)

(assert (=> start!4040 (= b_free!955 (not b_next!955))))

(declare-fun tp!4284 () Bool)

(declare-fun b_and!1759 () Bool)

(assert (=> start!4040 (= tp!4284 b_and!1759)))

(declare-fun b!29675 () Bool)

(declare-fun e!19128 () Bool)

(assert (=> b!29675 (= e!19128 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1571 0))(
  ( (V!1572 (val!681 Int)) )
))
(declare-datatypes ((ValueCell!455 0))(
  ( (ValueCellFull!455 (v!1769 V!1571)) (EmptyCell!455) )
))
(declare-datatypes ((array!1823 0))(
  ( (array!1824 (arr!865 (Array (_ BitVec 32) ValueCell!455)) (size!966 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1823)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1825 0))(
  ( (array!1826 (arr!866 (Array (_ BitVec 32) (_ BitVec 64))) (size!967 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1825)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun lt!11344 () Bool)

(declare-fun zeroValue!1443 () V!1571)

(declare-fun minValue!1443 () V!1571)

(declare-datatypes ((tuple2!1136 0))(
  ( (tuple2!1137 (_1!579 (_ BitVec 64)) (_2!579 V!1571)) )
))
(declare-datatypes ((List!717 0))(
  ( (Nil!714) (Cons!713 (h!1280 tuple2!1136) (t!3403 List!717)) )
))
(declare-datatypes ((ListLongMap!701 0))(
  ( (ListLongMap!702 (toList!366 List!717)) )
))
(declare-fun contains!307 (ListLongMap!701 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!190 (array!1825 array!1823 (_ BitVec 32) (_ BitVec 32) V!1571 V!1571 (_ BitVec 32) Int) ListLongMap!701)

(assert (=> b!29675 (= lt!11344 (contains!307 (getCurrentListMap!190 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304))))

(declare-fun mapNonEmpty!1492 () Bool)

(declare-fun mapRes!1492 () Bool)

(declare-fun tp!4285 () Bool)

(declare-fun e!19129 () Bool)

(assert (=> mapNonEmpty!1492 (= mapRes!1492 (and tp!4285 e!19129))))

(declare-fun mapValue!1492 () ValueCell!455)

(declare-fun mapRest!1492 () (Array (_ BitVec 32) ValueCell!455))

(declare-fun mapKey!1492 () (_ BitVec 32))

(assert (=> mapNonEmpty!1492 (= (arr!865 _values!1501) (store mapRest!1492 mapKey!1492 mapValue!1492))))

(declare-fun b!29676 () Bool)

(declare-fun e!19131 () Bool)

(declare-fun e!19130 () Bool)

(assert (=> b!29676 (= e!19131 (and e!19130 mapRes!1492))))

(declare-fun condMapEmpty!1492 () Bool)

(declare-fun mapDefault!1492 () ValueCell!455)

(assert (=> b!29676 (= condMapEmpty!1492 (= (arr!865 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!455)) mapDefault!1492)))))

(declare-fun b!29677 () Bool)

(declare-fun tp_is_empty!1309 () Bool)

(assert (=> b!29677 (= e!19130 tp_is_empty!1309)))

(declare-fun b!29678 () Bool)

(declare-fun res!17818 () Bool)

(assert (=> b!29678 (=> (not res!17818) (not e!19128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1825 (_ BitVec 32)) Bool)

(assert (=> b!29678 (= res!17818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!17820 () Bool)

(assert (=> start!4040 (=> (not res!17820) (not e!19128))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4040 (= res!17820 (validMask!0 mask!2294))))

(assert (=> start!4040 e!19128))

(assert (=> start!4040 true))

(assert (=> start!4040 tp!4284))

(declare-fun array_inv!605 (array!1823) Bool)

(assert (=> start!4040 (and (array_inv!605 _values!1501) e!19131)))

(declare-fun array_inv!606 (array!1825) Bool)

(assert (=> start!4040 (array_inv!606 _keys!1833)))

(assert (=> start!4040 tp_is_empty!1309))

(declare-fun mapIsEmpty!1492 () Bool)

(assert (=> mapIsEmpty!1492 mapRes!1492))

(declare-fun b!29679 () Bool)

(declare-fun res!17821 () Bool)

(assert (=> b!29679 (=> (not res!17821) (not e!19128))))

(assert (=> b!29679 (= res!17821 (and (= (size!966 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!967 _keys!1833) (size!966 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29680 () Bool)

(declare-fun res!17817 () Bool)

(assert (=> b!29680 (=> (not res!17817) (not e!19128))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29680 (= res!17817 (validKeyInArray!0 k0!1304))))

(declare-fun b!29681 () Bool)

(assert (=> b!29681 (= e!19129 tp_is_empty!1309)))

(declare-fun b!29682 () Bool)

(declare-fun res!17819 () Bool)

(assert (=> b!29682 (=> (not res!17819) (not e!19128))))

(declare-datatypes ((List!718 0))(
  ( (Nil!715) (Cons!714 (h!1281 (_ BitVec 64)) (t!3404 List!718)) )
))
(declare-fun arrayNoDuplicates!0 (array!1825 (_ BitVec 32) List!718) Bool)

(assert (=> b!29682 (= res!17819 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!715))))

(assert (= (and start!4040 res!17820) b!29679))

(assert (= (and b!29679 res!17821) b!29678))

(assert (= (and b!29678 res!17818) b!29682))

(assert (= (and b!29682 res!17819) b!29680))

(assert (= (and b!29680 res!17817) b!29675))

(assert (= (and b!29676 condMapEmpty!1492) mapIsEmpty!1492))

(assert (= (and b!29676 (not condMapEmpty!1492)) mapNonEmpty!1492))

(get-info :version)

(assert (= (and mapNonEmpty!1492 ((_ is ValueCellFull!455) mapValue!1492)) b!29681))

(assert (= (and b!29676 ((_ is ValueCellFull!455) mapDefault!1492)) b!29677))

(assert (= start!4040 b!29676))

(declare-fun m!23865 () Bool)

(assert (=> b!29675 m!23865))

(assert (=> b!29675 m!23865))

(declare-fun m!23867 () Bool)

(assert (=> b!29675 m!23867))

(declare-fun m!23869 () Bool)

(assert (=> b!29682 m!23869))

(declare-fun m!23871 () Bool)

(assert (=> b!29678 m!23871))

(declare-fun m!23873 () Bool)

(assert (=> b!29680 m!23873))

(declare-fun m!23875 () Bool)

(assert (=> start!4040 m!23875))

(declare-fun m!23877 () Bool)

(assert (=> start!4040 m!23877))

(declare-fun m!23879 () Bool)

(assert (=> start!4040 m!23879))

(declare-fun m!23881 () Bool)

(assert (=> mapNonEmpty!1492 m!23881))

(check-sat (not b!29675) (not b!29682) (not b!29678) b_and!1759 (not mapNonEmpty!1492) (not start!4040) (not b!29680) (not b_next!955) tp_is_empty!1309)
(check-sat b_and!1759 (not b_next!955))
