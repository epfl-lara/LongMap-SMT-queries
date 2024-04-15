; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4076 () Bool)

(assert start!4076)

(declare-fun b_free!991 () Bool)

(declare-fun b_next!991 () Bool)

(assert (=> start!4076 (= b_free!991 (not b_next!991))))

(declare-fun tp!4393 () Bool)

(declare-fun b_and!1795 () Bool)

(assert (=> start!4076 (= tp!4393 b_and!1795)))

(declare-fun b!30201 () Bool)

(declare-fun res!18186 () Bool)

(declare-fun e!19400 () Bool)

(assert (=> b!30201 (=> (not res!18186) (not e!19400))))

(declare-datatypes ((array!1891 0))(
  ( (array!1892 (arr!899 (Array (_ BitVec 32) (_ BitVec 64))) (size!1000 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1891)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1891 (_ BitVec 32)) Bool)

(assert (=> b!30201 (= res!18186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!30202 () Bool)

(declare-fun res!18184 () Bool)

(assert (=> b!30202 (=> (not res!18184) (not e!19400))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1891 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30202 (= res!18184 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30203 () Bool)

(declare-fun e!19402 () Bool)

(declare-fun e!19398 () Bool)

(declare-fun mapRes!1546 () Bool)

(assert (=> b!30203 (= e!19402 (and e!19398 mapRes!1546))))

(declare-fun condMapEmpty!1546 () Bool)

(declare-datatypes ((V!1619 0))(
  ( (V!1620 (val!699 Int)) )
))
(declare-datatypes ((ValueCell!473 0))(
  ( (ValueCellFull!473 (v!1787 V!1619)) (EmptyCell!473) )
))
(declare-datatypes ((array!1893 0))(
  ( (array!1894 (arr!900 (Array (_ BitVec 32) ValueCell!473)) (size!1001 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1893)

(declare-fun mapDefault!1546 () ValueCell!473)

(assert (=> b!30203 (= condMapEmpty!1546 (= (arr!900 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!473)) mapDefault!1546)))))

(declare-fun b!30204 () Bool)

(declare-fun e!19401 () Bool)

(declare-fun tp_is_empty!1345 () Bool)

(assert (=> b!30204 (= e!19401 tp_is_empty!1345)))

(declare-fun b!30205 () Bool)

(assert (=> b!30205 (= e!19400 false)))

(declare-datatypes ((SeekEntryResult!104 0))(
  ( (MissingZero!104 (index!2538 (_ BitVec 32))) (Found!104 (index!2539 (_ BitVec 32))) (Intermediate!104 (undefined!916 Bool) (index!2540 (_ BitVec 32)) (x!6518 (_ BitVec 32))) (Undefined!104) (MissingVacant!104 (index!2541 (_ BitVec 32))) )
))
(declare-fun lt!11398 () SeekEntryResult!104)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1891 (_ BitVec 32)) SeekEntryResult!104)

(assert (=> b!30205 (= lt!11398 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1546 () Bool)

(assert (=> mapIsEmpty!1546 mapRes!1546))

(declare-fun res!18185 () Bool)

(assert (=> start!4076 (=> (not res!18185) (not e!19400))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4076 (= res!18185 (validMask!0 mask!2294))))

(assert (=> start!4076 e!19400))

(assert (=> start!4076 true))

(assert (=> start!4076 tp!4393))

(declare-fun array_inv!627 (array!1893) Bool)

(assert (=> start!4076 (and (array_inv!627 _values!1501) e!19402)))

(declare-fun array_inv!628 (array!1891) Bool)

(assert (=> start!4076 (array_inv!628 _keys!1833)))

(assert (=> start!4076 tp_is_empty!1345))

(declare-fun mapNonEmpty!1546 () Bool)

(declare-fun tp!4392 () Bool)

(assert (=> mapNonEmpty!1546 (= mapRes!1546 (and tp!4392 e!19401))))

(declare-fun mapRest!1546 () (Array (_ BitVec 32) ValueCell!473))

(declare-fun mapValue!1546 () ValueCell!473)

(declare-fun mapKey!1546 () (_ BitVec 32))

(assert (=> mapNonEmpty!1546 (= (arr!900 _values!1501) (store mapRest!1546 mapKey!1546 mapValue!1546))))

(declare-fun b!30206 () Bool)

(declare-fun res!18181 () Bool)

(assert (=> b!30206 (=> (not res!18181) (not e!19400))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1619)

(declare-fun minValue!1443 () V!1619)

(declare-datatypes ((tuple2!1160 0))(
  ( (tuple2!1161 (_1!591 (_ BitVec 64)) (_2!591 V!1619)) )
))
(declare-datatypes ((List!743 0))(
  ( (Nil!740) (Cons!739 (h!1306 tuple2!1160) (t!3429 List!743)) )
))
(declare-datatypes ((ListLongMap!725 0))(
  ( (ListLongMap!726 (toList!378 List!743)) )
))
(declare-fun contains!319 (ListLongMap!725 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!202 (array!1891 array!1893 (_ BitVec 32) (_ BitVec 32) V!1619 V!1619 (_ BitVec 32) Int) ListLongMap!725)

(assert (=> b!30206 (= res!18181 (not (contains!319 (getCurrentListMap!202 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!30207 () Bool)

(declare-fun res!18182 () Bool)

(assert (=> b!30207 (=> (not res!18182) (not e!19400))))

(declare-datatypes ((List!744 0))(
  ( (Nil!741) (Cons!740 (h!1307 (_ BitVec 64)) (t!3430 List!744)) )
))
(declare-fun arrayNoDuplicates!0 (array!1891 (_ BitVec 32) List!744) Bool)

(assert (=> b!30207 (= res!18182 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!741))))

(declare-fun b!30208 () Bool)

(declare-fun res!18183 () Bool)

(assert (=> b!30208 (=> (not res!18183) (not e!19400))))

(assert (=> b!30208 (= res!18183 (and (= (size!1001 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1000 _keys!1833) (size!1001 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!30209 () Bool)

(declare-fun res!18187 () Bool)

(assert (=> b!30209 (=> (not res!18187) (not e!19400))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30209 (= res!18187 (validKeyInArray!0 k0!1304))))

(declare-fun b!30210 () Bool)

(assert (=> b!30210 (= e!19398 tp_is_empty!1345)))

(assert (= (and start!4076 res!18185) b!30208))

(assert (= (and b!30208 res!18183) b!30201))

(assert (= (and b!30201 res!18186) b!30207))

(assert (= (and b!30207 res!18182) b!30209))

(assert (= (and b!30209 res!18187) b!30206))

(assert (= (and b!30206 res!18181) b!30202))

(assert (= (and b!30202 res!18184) b!30205))

(assert (= (and b!30203 condMapEmpty!1546) mapIsEmpty!1546))

(assert (= (and b!30203 (not condMapEmpty!1546)) mapNonEmpty!1546))

(get-info :version)

(assert (= (and mapNonEmpty!1546 ((_ is ValueCellFull!473) mapValue!1546)) b!30204))

(assert (= (and b!30203 ((_ is ValueCellFull!473) mapDefault!1546)) b!30210))

(assert (= start!4076 b!30203))

(declare-fun m!24249 () Bool)

(assert (=> mapNonEmpty!1546 m!24249))

(declare-fun m!24251 () Bool)

(assert (=> b!30202 m!24251))

(declare-fun m!24253 () Bool)

(assert (=> b!30206 m!24253))

(assert (=> b!30206 m!24253))

(declare-fun m!24255 () Bool)

(assert (=> b!30206 m!24255))

(declare-fun m!24257 () Bool)

(assert (=> start!4076 m!24257))

(declare-fun m!24259 () Bool)

(assert (=> start!4076 m!24259))

(declare-fun m!24261 () Bool)

(assert (=> start!4076 m!24261))

(declare-fun m!24263 () Bool)

(assert (=> b!30207 m!24263))

(declare-fun m!24265 () Bool)

(assert (=> b!30201 m!24265))

(declare-fun m!24267 () Bool)

(assert (=> b!30205 m!24267))

(declare-fun m!24269 () Bool)

(assert (=> b!30209 m!24269))

(check-sat (not b!30209) tp_is_empty!1345 (not b!30202) (not b!30205) (not start!4076) (not mapNonEmpty!1546) (not b!30201) (not b!30206) b_and!1795 (not b_next!991) (not b!30207))
(check-sat b_and!1795 (not b_next!991))
