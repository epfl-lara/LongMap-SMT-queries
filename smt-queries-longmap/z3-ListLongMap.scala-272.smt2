; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4460 () Bool)

(assert start!4460)

(declare-fun b_free!1221 () Bool)

(declare-fun b_next!1221 () Bool)

(assert (=> start!4460 (= b_free!1221 (not b_next!1221))))

(declare-fun tp!5100 () Bool)

(declare-fun b_and!2043 () Bool)

(assert (=> start!4460 (= tp!5100 b_and!2043)))

(declare-fun b!34531 () Bool)

(declare-fun res!20954 () Bool)

(declare-fun e!21894 () Bool)

(assert (=> b!34531 (=> (not res!20954) (not e!21894))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1925 0))(
  ( (V!1926 (val!814 Int)) )
))
(declare-datatypes ((ValueCell!588 0))(
  ( (ValueCellFull!588 (v!1909 V!1925)) (EmptyCell!588) )
))
(declare-datatypes ((array!2367 0))(
  ( (array!2368 (arr!1131 (Array (_ BitVec 32) ValueCell!588)) (size!1232 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2367)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2369 0))(
  ( (array!2370 (arr!1132 (Array (_ BitVec 32) (_ BitVec 64))) (size!1233 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2369)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1925)

(declare-fun minValue!1443 () V!1925)

(declare-datatypes ((tuple2!1326 0))(
  ( (tuple2!1327 (_1!674 (_ BitVec 64)) (_2!674 V!1925)) )
))
(declare-datatypes ((List!912 0))(
  ( (Nil!909) (Cons!908 (h!1475 tuple2!1326) (t!3617 List!912)) )
))
(declare-datatypes ((ListLongMap!903 0))(
  ( (ListLongMap!904 (toList!467 List!912)) )
))
(declare-fun contains!413 (ListLongMap!903 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!291 (array!2369 array!2367 (_ BitVec 32) (_ BitVec 32) V!1925 V!1925 (_ BitVec 32) Int) ListLongMap!903)

(assert (=> b!34531 (= res!20954 (not (contains!413 (getCurrentListMap!291 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!34532 () Bool)

(declare-fun res!20957 () Bool)

(assert (=> b!34532 (=> (not res!20957) (not e!21894))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2369 (_ BitVec 32)) Bool)

(assert (=> b!34532 (= res!20957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!34533 () Bool)

(declare-fun res!20956 () Bool)

(assert (=> b!34533 (=> (not res!20956) (not e!21894))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34533 (= res!20956 (validKeyInArray!0 k0!1304))))

(declare-fun mapIsEmpty!1909 () Bool)

(declare-fun mapRes!1909 () Bool)

(assert (=> mapIsEmpty!1909 mapRes!1909))

(declare-fun b!34535 () Bool)

(declare-fun res!20952 () Bool)

(assert (=> b!34535 (=> (not res!20952) (not e!21894))))

(declare-fun arrayContainsKey!0 (array!2369 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34535 (= res!20952 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!34536 () Bool)

(declare-fun e!21895 () Bool)

(declare-fun e!21892 () Bool)

(assert (=> b!34536 (= e!21895 (and e!21892 mapRes!1909))))

(declare-fun condMapEmpty!1909 () Bool)

(declare-fun mapDefault!1909 () ValueCell!588)

(assert (=> b!34536 (= condMapEmpty!1909 (= (arr!1131 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!588)) mapDefault!1909)))))

(declare-fun b!34537 () Bool)

(declare-fun res!20958 () Bool)

(assert (=> b!34537 (=> (not res!20958) (not e!21894))))

(declare-datatypes ((List!913 0))(
  ( (Nil!910) (Cons!909 (h!1476 (_ BitVec 64)) (t!3618 List!913)) )
))
(declare-fun arrayNoDuplicates!0 (array!2369 (_ BitVec 32) List!913) Bool)

(assert (=> b!34537 (= res!20958 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!910))))

(declare-fun b!34538 () Bool)

(assert (=> b!34538 (= e!21894 false)))

(declare-datatypes ((SeekEntryResult!147 0))(
  ( (MissingZero!147 (index!2710 (_ BitVec 32))) (Found!147 (index!2711 (_ BitVec 32))) (Intermediate!147 (undefined!959 Bool) (index!2712 (_ BitVec 32)) (x!6925 (_ BitVec 32))) (Undefined!147) (MissingVacant!147 (index!2713 (_ BitVec 32))) )
))
(declare-fun lt!12789 () SeekEntryResult!147)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2369 (_ BitVec 32)) SeekEntryResult!147)

(assert (=> b!34538 (= lt!12789 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1909 () Bool)

(declare-fun tp!5101 () Bool)

(declare-fun e!21891 () Bool)

(assert (=> mapNonEmpty!1909 (= mapRes!1909 (and tp!5101 e!21891))))

(declare-fun mapValue!1909 () ValueCell!588)

(declare-fun mapKey!1909 () (_ BitVec 32))

(declare-fun mapRest!1909 () (Array (_ BitVec 32) ValueCell!588))

(assert (=> mapNonEmpty!1909 (= (arr!1131 _values!1501) (store mapRest!1909 mapKey!1909 mapValue!1909))))

(declare-fun b!34539 () Bool)

(declare-fun tp_is_empty!1575 () Bool)

(assert (=> b!34539 (= e!21892 tp_is_empty!1575)))

(declare-fun b!34540 () Bool)

(declare-fun res!20953 () Bool)

(assert (=> b!34540 (=> (not res!20953) (not e!21894))))

(assert (=> b!34540 (= res!20953 (and (= (size!1232 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1233 _keys!1833) (size!1232 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun res!20955 () Bool)

(assert (=> start!4460 (=> (not res!20955) (not e!21894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4460 (= res!20955 (validMask!0 mask!2294))))

(assert (=> start!4460 e!21894))

(assert (=> start!4460 true))

(assert (=> start!4460 tp!5100))

(declare-fun array_inv!801 (array!2367) Bool)

(assert (=> start!4460 (and (array_inv!801 _values!1501) e!21895)))

(declare-fun array_inv!802 (array!2369) Bool)

(assert (=> start!4460 (array_inv!802 _keys!1833)))

(assert (=> start!4460 tp_is_empty!1575))

(declare-fun b!34534 () Bool)

(assert (=> b!34534 (= e!21891 tp_is_empty!1575)))

(assert (= (and start!4460 res!20955) b!34540))

(assert (= (and b!34540 res!20953) b!34532))

(assert (= (and b!34532 res!20957) b!34537))

(assert (= (and b!34537 res!20958) b!34533))

(assert (= (and b!34533 res!20956) b!34531))

(assert (= (and b!34531 res!20954) b!34535))

(assert (= (and b!34535 res!20952) b!34538))

(assert (= (and b!34536 condMapEmpty!1909) mapIsEmpty!1909))

(assert (= (and b!34536 (not condMapEmpty!1909)) mapNonEmpty!1909))

(get-info :version)

(assert (= (and mapNonEmpty!1909 ((_ is ValueCellFull!588) mapValue!1909)) b!34534))

(assert (= (and b!34536 ((_ is ValueCellFull!588) mapDefault!1909)) b!34539))

(assert (= start!4460 b!34536))

(declare-fun m!27835 () Bool)

(assert (=> b!34535 m!27835))

(declare-fun m!27837 () Bool)

(assert (=> b!34531 m!27837))

(assert (=> b!34531 m!27837))

(declare-fun m!27839 () Bool)

(assert (=> b!34531 m!27839))

(declare-fun m!27841 () Bool)

(assert (=> b!34532 m!27841))

(declare-fun m!27843 () Bool)

(assert (=> b!34538 m!27843))

(declare-fun m!27845 () Bool)

(assert (=> b!34537 m!27845))

(declare-fun m!27847 () Bool)

(assert (=> mapNonEmpty!1909 m!27847))

(declare-fun m!27849 () Bool)

(assert (=> b!34533 m!27849))

(declare-fun m!27851 () Bool)

(assert (=> start!4460 m!27851))

(declare-fun m!27853 () Bool)

(assert (=> start!4460 m!27853))

(declare-fun m!27855 () Bool)

(assert (=> start!4460 m!27855))

(check-sat (not b!34535) (not b!34533) (not b!34538) (not b!34531) (not b_next!1221) (not b!34537) (not mapNonEmpty!1909) (not b!34532) tp_is_empty!1575 b_and!2043 (not start!4460))
(check-sat b_and!2043 (not b_next!1221))
