; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4208 () Bool)

(assert start!4208)

(declare-fun b_free!1117 () Bool)

(declare-fun b_next!1117 () Bool)

(assert (=> start!4208 (= b_free!1117 (not b_next!1117))))

(declare-fun tp!4771 () Bool)

(declare-fun b_and!1917 () Bool)

(assert (=> start!4208 (= tp!4771 b_and!1917)))

(declare-fun mapNonEmpty!1735 () Bool)

(declare-fun mapRes!1735 () Bool)

(declare-fun tp!4770 () Bool)

(declare-fun e!20388 () Bool)

(assert (=> mapNonEmpty!1735 (= mapRes!1735 (and tp!4770 e!20388))))

(declare-datatypes ((V!1787 0))(
  ( (V!1788 (val!762 Int)) )
))
(declare-datatypes ((ValueCell!536 0))(
  ( (ValueCellFull!536 (v!1851 V!1787)) (EmptyCell!536) )
))
(declare-datatypes ((array!2141 0))(
  ( (array!2142 (arr!1024 (Array (_ BitVec 32) ValueCell!536)) (size!1125 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2141)

(declare-fun mapKey!1735 () (_ BitVec 32))

(declare-fun mapRest!1735 () (Array (_ BitVec 32) ValueCell!536))

(declare-fun mapValue!1735 () ValueCell!536)

(assert (=> mapNonEmpty!1735 (= (arr!1024 _values!1501) (store mapRest!1735 mapKey!1735 mapValue!1735))))

(declare-fun b!32055 () Bool)

(declare-fun e!20389 () Bool)

(declare-fun e!20392 () Bool)

(assert (=> b!32055 (= e!20389 (and e!20392 mapRes!1735))))

(declare-fun condMapEmpty!1735 () Bool)

(declare-fun mapDefault!1735 () ValueCell!536)

(assert (=> b!32055 (= condMapEmpty!1735 (= (arr!1024 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!536)) mapDefault!1735)))))

(declare-fun b!32056 () Bool)

(declare-fun res!19481 () Bool)

(declare-fun e!20391 () Bool)

(assert (=> b!32056 (=> (not res!19481) (not e!20391))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2143 0))(
  ( (array!2144 (arr!1025 (Array (_ BitVec 32) (_ BitVec 64))) (size!1126 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2143)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1787)

(declare-fun minValue!1443 () V!1787)

(declare-datatypes ((tuple2!1230 0))(
  ( (tuple2!1231 (_1!626 (_ BitVec 64)) (_2!626 V!1787)) )
))
(declare-datatypes ((List!825 0))(
  ( (Nil!822) (Cons!821 (h!1388 tuple2!1230) (t!3512 List!825)) )
))
(declare-datatypes ((ListLongMap!801 0))(
  ( (ListLongMap!802 (toList!416 List!825)) )
))
(declare-fun contains!358 (ListLongMap!801 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!241 (array!2143 array!2141 (_ BitVec 32) (_ BitVec 32) V!1787 V!1787 (_ BitVec 32) Int) ListLongMap!801)

(assert (=> b!32056 (= res!19481 (not (contains!358 (getCurrentListMap!241 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!32057 () Bool)

(declare-fun tp_is_empty!1471 () Bool)

(assert (=> b!32057 (= e!20388 tp_is_empty!1471)))

(declare-fun b!32058 () Bool)

(declare-fun res!19483 () Bool)

(assert (=> b!32058 (=> (not res!19483) (not e!20391))))

(declare-datatypes ((List!826 0))(
  ( (Nil!823) (Cons!822 (h!1389 (_ BitVec 64)) (t!3513 List!826)) )
))
(declare-fun arrayNoDuplicates!0 (array!2143 (_ BitVec 32) List!826) Bool)

(assert (=> b!32058 (= res!19483 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!823))))

(declare-fun b!32059 () Bool)

(declare-fun res!19479 () Bool)

(assert (=> b!32059 (=> (not res!19479) (not e!20391))))

(declare-fun arrayContainsKey!0 (array!2143 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32059 (= res!19479 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32060 () Bool)

(assert (=> b!32060 (= e!20392 tp_is_empty!1471)))

(declare-fun mapIsEmpty!1735 () Bool)

(assert (=> mapIsEmpty!1735 mapRes!1735))

(declare-fun res!19478 () Bool)

(assert (=> start!4208 (=> (not res!19478) (not e!20391))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4208 (= res!19478 (validMask!0 mask!2294))))

(assert (=> start!4208 e!20391))

(assert (=> start!4208 true))

(assert (=> start!4208 tp!4771))

(declare-fun array_inv!705 (array!2141) Bool)

(assert (=> start!4208 (and (array_inv!705 _values!1501) e!20389)))

(declare-fun array_inv!706 (array!2143) Bool)

(assert (=> start!4208 (array_inv!706 _keys!1833)))

(assert (=> start!4208 tp_is_empty!1471))

(declare-fun b!32061 () Bool)

(declare-fun res!19484 () Bool)

(assert (=> b!32061 (=> (not res!19484) (not e!20391))))

(assert (=> b!32061 (= res!19484 (and (= (size!1125 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1126 _keys!1833) (size!1125 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!32062 () Bool)

(declare-fun res!19480 () Bool)

(assert (=> b!32062 (=> (not res!19480) (not e!20391))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2143 (_ BitVec 32)) Bool)

(assert (=> b!32062 (= res!19480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!32063 () Bool)

(assert (=> b!32063 (= e!20391 false)))

(declare-fun lt!11592 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2143 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32063 (= lt!11592 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32064 () Bool)

(declare-fun res!19482 () Bool)

(assert (=> b!32064 (=> (not res!19482) (not e!20391))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32064 (= res!19482 (validKeyInArray!0 k0!1304))))

(assert (= (and start!4208 res!19478) b!32061))

(assert (= (and b!32061 res!19484) b!32062))

(assert (= (and b!32062 res!19480) b!32058))

(assert (= (and b!32058 res!19483) b!32064))

(assert (= (and b!32064 res!19482) b!32056))

(assert (= (and b!32056 res!19481) b!32059))

(assert (= (and b!32059 res!19479) b!32063))

(assert (= (and b!32055 condMapEmpty!1735) mapIsEmpty!1735))

(assert (= (and b!32055 (not condMapEmpty!1735)) mapNonEmpty!1735))

(get-info :version)

(assert (= (and mapNonEmpty!1735 ((_ is ValueCellFull!536) mapValue!1735)) b!32057))

(assert (= (and b!32055 ((_ is ValueCellFull!536) mapDefault!1735)) b!32060))

(assert (= start!4208 b!32055))

(declare-fun m!25571 () Bool)

(assert (=> b!32056 m!25571))

(assert (=> b!32056 m!25571))

(declare-fun m!25573 () Bool)

(assert (=> b!32056 m!25573))

(declare-fun m!25575 () Bool)

(assert (=> b!32062 m!25575))

(declare-fun m!25577 () Bool)

(assert (=> b!32063 m!25577))

(declare-fun m!25579 () Bool)

(assert (=> start!4208 m!25579))

(declare-fun m!25581 () Bool)

(assert (=> start!4208 m!25581))

(declare-fun m!25583 () Bool)

(assert (=> start!4208 m!25583))

(declare-fun m!25585 () Bool)

(assert (=> b!32059 m!25585))

(declare-fun m!25587 () Bool)

(assert (=> mapNonEmpty!1735 m!25587))

(declare-fun m!25589 () Bool)

(assert (=> b!32058 m!25589))

(declare-fun m!25591 () Bool)

(assert (=> b!32064 m!25591))

(check-sat (not start!4208) tp_is_empty!1471 (not b!32062) (not b_next!1117) b_and!1917 (not b!32056) (not b!32064) (not mapNonEmpty!1735) (not b!32059) (not b!32063) (not b!32058))
(check-sat b_and!1917 (not b_next!1117))
