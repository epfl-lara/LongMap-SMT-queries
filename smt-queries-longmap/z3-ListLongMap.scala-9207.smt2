; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110592 () Bool)

(assert start!110592)

(declare-fun b_free!29427 () Bool)

(declare-fun b_next!29427 () Bool)

(assert (=> start!110592 (= b_free!29427 (not b_next!29427))))

(declare-fun tp!103602 () Bool)

(declare-fun b_and!47635 () Bool)

(assert (=> start!110592 (= tp!103602 b_and!47635)))

(declare-fun b!1308463 () Bool)

(declare-fun res!868586 () Bool)

(declare-fun e!746563 () Bool)

(assert (=> b!1308463 (=> (not res!868586) (not e!746563))))

(declare-datatypes ((array!87312 0))(
  ( (array!87313 (arr!42136 (Array (_ BitVec 32) (_ BitVec 64))) (size!42686 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87312)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!51979 0))(
  ( (V!51980 (val!17653 Int)) )
))
(declare-datatypes ((ValueCell!16680 0))(
  ( (ValueCellFull!16680 (v!20280 V!51979)) (EmptyCell!16680) )
))
(declare-datatypes ((array!87314 0))(
  ( (array!87315 (arr!42137 (Array (_ BitVec 32) ValueCell!16680)) (size!42687 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87314)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1308463 (= res!868586 (and (= (size!42687 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42686 _keys!1628) (size!42687 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!868588 () Bool)

(assert (=> start!110592 (=> (not res!868588) (not e!746563))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110592 (= res!868588 (validMask!0 mask!2040))))

(assert (=> start!110592 e!746563))

(assert (=> start!110592 tp!103602))

(declare-fun array_inv!31847 (array!87312) Bool)

(assert (=> start!110592 (array_inv!31847 _keys!1628)))

(assert (=> start!110592 true))

(declare-fun tp_is_empty!35157 () Bool)

(assert (=> start!110592 tp_is_empty!35157))

(declare-fun e!746564 () Bool)

(declare-fun array_inv!31848 (array!87314) Bool)

(assert (=> start!110592 (and (array_inv!31848 _values!1354) e!746564)))

(declare-fun b!1308464 () Bool)

(declare-fun res!868587 () Bool)

(assert (=> b!1308464 (=> (not res!868587) (not e!746563))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!51979)

(declare-fun zeroValue!1296 () V!51979)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22728 0))(
  ( (tuple2!22729 (_1!11375 (_ BitVec 64)) (_2!11375 V!51979)) )
))
(declare-datatypes ((List!29869 0))(
  ( (Nil!29866) (Cons!29865 (h!31074 tuple2!22728) (t!43475 List!29869)) )
))
(declare-datatypes ((ListLongMap!20385 0))(
  ( (ListLongMap!20386 (toList!10208 List!29869)) )
))
(declare-fun contains!8358 (ListLongMap!20385 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5221 (array!87312 array!87314 (_ BitVec 32) (_ BitVec 32) V!51979 V!51979 (_ BitVec 32) Int) ListLongMap!20385)

(assert (=> b!1308464 (= res!868587 (contains!8358 (getCurrentListMap!5221 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1308465 () Bool)

(declare-fun res!868589 () Bool)

(assert (=> b!1308465 (=> (not res!868589) (not e!746563))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1308465 (= res!868589 (validKeyInArray!0 (select (arr!42136 _keys!1628) from!2020)))))

(declare-fun b!1308466 () Bool)

(declare-fun res!868591 () Bool)

(assert (=> b!1308466 (=> (not res!868591) (not e!746563))))

(declare-datatypes ((List!29870 0))(
  ( (Nil!29867) (Cons!29866 (h!31075 (_ BitVec 64)) (t!43476 List!29870)) )
))
(declare-fun arrayNoDuplicates!0 (array!87312 (_ BitVec 32) List!29870) Bool)

(assert (=> b!1308466 (= res!868591 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29867))))

(declare-fun mapNonEmpty!54364 () Bool)

(declare-fun mapRes!54364 () Bool)

(declare-fun tp!103603 () Bool)

(declare-fun e!746566 () Bool)

(assert (=> mapNonEmpty!54364 (= mapRes!54364 (and tp!103603 e!746566))))

(declare-fun mapKey!54364 () (_ BitVec 32))

(declare-fun mapValue!54364 () ValueCell!16680)

(declare-fun mapRest!54364 () (Array (_ BitVec 32) ValueCell!16680))

(assert (=> mapNonEmpty!54364 (= (arr!42137 _values!1354) (store mapRest!54364 mapKey!54364 mapValue!54364))))

(declare-fun b!1308467 () Bool)

(declare-fun res!868592 () Bool)

(assert (=> b!1308467 (=> (not res!868592) (not e!746563))))

(assert (=> b!1308467 (= res!868592 (not (= (select (arr!42136 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1308468 () Bool)

(declare-fun e!746565 () Bool)

(assert (=> b!1308468 (= e!746564 (and e!746565 mapRes!54364))))

(declare-fun condMapEmpty!54364 () Bool)

(declare-fun mapDefault!54364 () ValueCell!16680)

(assert (=> b!1308468 (= condMapEmpty!54364 (= (arr!42137 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16680)) mapDefault!54364)))))

(declare-fun b!1308469 () Bool)

(declare-fun res!868593 () Bool)

(assert (=> b!1308469 (=> (not res!868593) (not e!746563))))

(assert (=> b!1308469 (= res!868593 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42686 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308470 () Bool)

(assert (=> b!1308470 (= e!746565 tp_is_empty!35157)))

(declare-fun b!1308471 () Bool)

(assert (=> b!1308471 (= e!746563 (not true))))

(assert (=> b!1308471 (contains!8358 (getCurrentListMap!5221 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43294 0))(
  ( (Unit!43295) )
))
(declare-fun lt!585159 () Unit!43294)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!11 (array!87312 array!87314 (_ BitVec 32) (_ BitVec 32) V!51979 V!51979 (_ BitVec 64) (_ BitVec 32) Int) Unit!43294)

(assert (=> b!1308471 (= lt!585159 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!11 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1308472 () Bool)

(declare-fun res!868590 () Bool)

(assert (=> b!1308472 (=> (not res!868590) (not e!746563))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87312 (_ BitVec 32)) Bool)

(assert (=> b!1308472 (= res!868590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1308473 () Bool)

(declare-fun res!868585 () Bool)

(assert (=> b!1308473 (=> (not res!868585) (not e!746563))))

(assert (=> b!1308473 (= res!868585 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1308474 () Bool)

(assert (=> b!1308474 (= e!746566 tp_is_empty!35157)))

(declare-fun mapIsEmpty!54364 () Bool)

(assert (=> mapIsEmpty!54364 mapRes!54364))

(assert (= (and start!110592 res!868588) b!1308463))

(assert (= (and b!1308463 res!868586) b!1308472))

(assert (= (and b!1308472 res!868590) b!1308466))

(assert (= (and b!1308466 res!868591) b!1308469))

(assert (= (and b!1308469 res!868593) b!1308464))

(assert (= (and b!1308464 res!868587) b!1308467))

(assert (= (and b!1308467 res!868592) b!1308465))

(assert (= (and b!1308465 res!868589) b!1308473))

(assert (= (and b!1308473 res!868585) b!1308471))

(assert (= (and b!1308468 condMapEmpty!54364) mapIsEmpty!54364))

(assert (= (and b!1308468 (not condMapEmpty!54364)) mapNonEmpty!54364))

(get-info :version)

(assert (= (and mapNonEmpty!54364 ((_ is ValueCellFull!16680) mapValue!54364)) b!1308474))

(assert (= (and b!1308468 ((_ is ValueCellFull!16680) mapDefault!54364)) b!1308470))

(assert (= start!110592 b!1308468))

(declare-fun m!1198841 () Bool)

(assert (=> b!1308472 m!1198841))

(declare-fun m!1198843 () Bool)

(assert (=> b!1308467 m!1198843))

(assert (=> b!1308465 m!1198843))

(assert (=> b!1308465 m!1198843))

(declare-fun m!1198845 () Bool)

(assert (=> b!1308465 m!1198845))

(declare-fun m!1198847 () Bool)

(assert (=> mapNonEmpty!54364 m!1198847))

(declare-fun m!1198849 () Bool)

(assert (=> start!110592 m!1198849))

(declare-fun m!1198851 () Bool)

(assert (=> start!110592 m!1198851))

(declare-fun m!1198853 () Bool)

(assert (=> start!110592 m!1198853))

(declare-fun m!1198855 () Bool)

(assert (=> b!1308464 m!1198855))

(assert (=> b!1308464 m!1198855))

(declare-fun m!1198857 () Bool)

(assert (=> b!1308464 m!1198857))

(declare-fun m!1198859 () Bool)

(assert (=> b!1308471 m!1198859))

(assert (=> b!1308471 m!1198859))

(declare-fun m!1198861 () Bool)

(assert (=> b!1308471 m!1198861))

(declare-fun m!1198863 () Bool)

(assert (=> b!1308471 m!1198863))

(declare-fun m!1198865 () Bool)

(assert (=> b!1308466 m!1198865))

(check-sat (not b!1308464) tp_is_empty!35157 (not b!1308472) (not start!110592) (not mapNonEmpty!54364) (not b!1308465) (not b!1308466) (not b!1308471) b_and!47635 (not b_next!29427))
(check-sat b_and!47635 (not b_next!29427))
