; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4454 () Bool)

(assert start!4454)

(declare-fun b_free!1219 () Bool)

(declare-fun b_next!1219 () Bool)

(assert (=> start!4454 (= b_free!1219 (not b_next!1219))))

(declare-fun tp!5094 () Bool)

(declare-fun b_and!2031 () Bool)

(assert (=> start!4454 (= tp!5094 b_and!2031)))

(declare-fun res!20891 () Bool)

(declare-fun e!21826 () Bool)

(assert (=> start!4454 (=> (not res!20891) (not e!21826))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4454 (= res!20891 (validMask!0 mask!2294))))

(assert (=> start!4454 e!21826))

(assert (=> start!4454 true))

(assert (=> start!4454 tp!5094))

(declare-datatypes ((V!1923 0))(
  ( (V!1924 (val!813 Int)) )
))
(declare-datatypes ((ValueCell!587 0))(
  ( (ValueCellFull!587 (v!1908 V!1923)) (EmptyCell!587) )
))
(declare-datatypes ((array!2345 0))(
  ( (array!2346 (arr!1120 (Array (_ BitVec 32) ValueCell!587)) (size!1221 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2345)

(declare-fun e!21825 () Bool)

(declare-fun array_inv!765 (array!2345) Bool)

(assert (=> start!4454 (and (array_inv!765 _values!1501) e!21825)))

(declare-datatypes ((array!2347 0))(
  ( (array!2348 (arr!1121 (Array (_ BitVec 32) (_ BitVec 64))) (size!1222 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2347)

(declare-fun array_inv!766 (array!2347) Bool)

(assert (=> start!4454 (array_inv!766 _keys!1833)))

(declare-fun tp_is_empty!1573 () Bool)

(assert (=> start!4454 tp_is_empty!1573))

(declare-fun b!34429 () Bool)

(declare-fun res!20897 () Bool)

(assert (=> b!34429 (=> (not res!20897) (not e!21826))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1923)

(declare-fun minValue!1443 () V!1923)

(declare-datatypes ((tuple2!1298 0))(
  ( (tuple2!1299 (_1!660 (_ BitVec 64)) (_2!660 V!1923)) )
))
(declare-datatypes ((List!891 0))(
  ( (Nil!888) (Cons!887 (h!1454 tuple2!1298) (t!3590 List!891)) )
))
(declare-datatypes ((ListLongMap!869 0))(
  ( (ListLongMap!870 (toList!450 List!891)) )
))
(declare-fun contains!398 (ListLongMap!869 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!271 (array!2347 array!2345 (_ BitVec 32) (_ BitVec 32) V!1923 V!1923 (_ BitVec 32) Int) ListLongMap!869)

(assert (=> b!34429 (= res!20897 (not (contains!398 (getCurrentListMap!271 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!34430 () Bool)

(declare-fun e!21827 () Bool)

(assert (=> b!34430 (= e!21827 tp_is_empty!1573)))

(declare-fun b!34431 () Bool)

(declare-fun res!20892 () Bool)

(assert (=> b!34431 (=> (not res!20892) (not e!21826))))

(assert (=> b!34431 (= res!20892 (and (= (size!1221 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1222 _keys!1833) (size!1221 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!34432 () Bool)

(declare-fun res!20893 () Bool)

(assert (=> b!34432 (=> (not res!20893) (not e!21826))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34432 (= res!20893 (validKeyInArray!0 k0!1304))))

(declare-fun mapNonEmpty!1906 () Bool)

(declare-fun mapRes!1906 () Bool)

(declare-fun tp!5095 () Bool)

(declare-fun e!21828 () Bool)

(assert (=> mapNonEmpty!1906 (= mapRes!1906 (and tp!5095 e!21828))))

(declare-fun mapKey!1906 () (_ BitVec 32))

(declare-fun mapValue!1906 () ValueCell!587)

(declare-fun mapRest!1906 () (Array (_ BitVec 32) ValueCell!587))

(assert (=> mapNonEmpty!1906 (= (arr!1120 _values!1501) (store mapRest!1906 mapKey!1906 mapValue!1906))))

(declare-fun b!34433 () Bool)

(declare-fun res!20894 () Bool)

(assert (=> b!34433 (=> (not res!20894) (not e!21826))))

(declare-fun arrayContainsKey!0 (array!2347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34433 (= res!20894 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!34434 () Bool)

(declare-fun res!20896 () Bool)

(assert (=> b!34434 (=> (not res!20896) (not e!21826))))

(declare-datatypes ((List!892 0))(
  ( (Nil!889) (Cons!888 (h!1455 (_ BitVec 64)) (t!3591 List!892)) )
))
(declare-fun arrayNoDuplicates!0 (array!2347 (_ BitVec 32) List!892) Bool)

(assert (=> b!34434 (= res!20896 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!889))))

(declare-fun mapIsEmpty!1906 () Bool)

(assert (=> mapIsEmpty!1906 mapRes!1906))

(declare-fun b!34435 () Bool)

(declare-fun res!20895 () Bool)

(assert (=> b!34435 (=> (not res!20895) (not e!21826))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2347 (_ BitVec 32)) Bool)

(assert (=> b!34435 (= res!20895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!34436 () Bool)

(assert (=> b!34436 (= e!21826 false)))

(declare-datatypes ((SeekEntryResult!136 0))(
  ( (MissingZero!136 (index!2666 (_ BitVec 32))) (Found!136 (index!2667 (_ BitVec 32))) (Intermediate!136 (undefined!948 Bool) (index!2668 (_ BitVec 32)) (x!6914 (_ BitVec 32))) (Undefined!136) (MissingVacant!136 (index!2669 (_ BitVec 32))) )
))
(declare-fun lt!12742 () SeekEntryResult!136)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2347 (_ BitVec 32)) SeekEntryResult!136)

(assert (=> b!34436 (= lt!12742 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!34437 () Bool)

(assert (=> b!34437 (= e!21825 (and e!21827 mapRes!1906))))

(declare-fun condMapEmpty!1906 () Bool)

(declare-fun mapDefault!1906 () ValueCell!587)

(assert (=> b!34437 (= condMapEmpty!1906 (= (arr!1120 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!587)) mapDefault!1906)))))

(declare-fun b!34438 () Bool)

(assert (=> b!34438 (= e!21828 tp_is_empty!1573)))

(assert (= (and start!4454 res!20891) b!34431))

(assert (= (and b!34431 res!20892) b!34435))

(assert (= (and b!34435 res!20895) b!34434))

(assert (= (and b!34434 res!20896) b!34432))

(assert (= (and b!34432 res!20893) b!34429))

(assert (= (and b!34429 res!20897) b!34433))

(assert (= (and b!34433 res!20894) b!34436))

(assert (= (and b!34437 condMapEmpty!1906) mapIsEmpty!1906))

(assert (= (and b!34437 (not condMapEmpty!1906)) mapNonEmpty!1906))

(get-info :version)

(assert (= (and mapNonEmpty!1906 ((_ is ValueCellFull!587) mapValue!1906)) b!34438))

(assert (= (and b!34437 ((_ is ValueCellFull!587) mapDefault!1906)) b!34430))

(assert (= start!4454 b!34437))

(declare-fun m!27661 () Bool)

(assert (=> b!34434 m!27661))

(declare-fun m!27663 () Bool)

(assert (=> b!34429 m!27663))

(assert (=> b!34429 m!27663))

(declare-fun m!27665 () Bool)

(assert (=> b!34429 m!27665))

(declare-fun m!27667 () Bool)

(assert (=> b!34435 m!27667))

(declare-fun m!27669 () Bool)

(assert (=> b!34433 m!27669))

(declare-fun m!27671 () Bool)

(assert (=> b!34432 m!27671))

(declare-fun m!27673 () Bool)

(assert (=> mapNonEmpty!1906 m!27673))

(declare-fun m!27675 () Bool)

(assert (=> start!4454 m!27675))

(declare-fun m!27677 () Bool)

(assert (=> start!4454 m!27677))

(declare-fun m!27679 () Bool)

(assert (=> start!4454 m!27679))

(declare-fun m!27681 () Bool)

(assert (=> b!34436 m!27681))

(check-sat tp_is_empty!1573 (not b!34436) b_and!2031 (not start!4454) (not b!34433) (not b!34429) (not mapNonEmpty!1906) (not b!34435) (not b!34434) (not b_next!1219) (not b!34432))
(check-sat b_and!2031 (not b_next!1219))
