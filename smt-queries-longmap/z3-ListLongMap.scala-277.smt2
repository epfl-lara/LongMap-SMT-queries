; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4490 () Bool)

(assert start!4490)

(declare-fun b_free!1251 () Bool)

(declare-fun b_next!1251 () Bool)

(assert (=> start!4490 (= b_free!1251 (not b_next!1251))))

(declare-fun tp!5191 () Bool)

(declare-fun b_and!2073 () Bool)

(assert (=> start!4490 (= tp!5191 b_and!2073)))

(declare-fun b!34981 () Bool)

(declare-fun res!21267 () Bool)

(declare-fun e!22119 () Bool)

(assert (=> b!34981 (=> (not res!21267) (not e!22119))))

(declare-datatypes ((array!2423 0))(
  ( (array!2424 (arr!1159 (Array (_ BitVec 32) (_ BitVec 64))) (size!1260 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2423)

(declare-datatypes ((List!932 0))(
  ( (Nil!929) (Cons!928 (h!1495 (_ BitVec 64)) (t!3637 List!932)) )
))
(declare-fun arrayNoDuplicates!0 (array!2423 (_ BitVec 32) List!932) Bool)

(assert (=> b!34981 (= res!21267 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!929))))

(declare-fun mapIsEmpty!1954 () Bool)

(declare-fun mapRes!1954 () Bool)

(assert (=> mapIsEmpty!1954 mapRes!1954))

(declare-fun b!34982 () Bool)

(declare-fun e!22117 () Bool)

(declare-fun e!22120 () Bool)

(assert (=> b!34982 (= e!22117 (and e!22120 mapRes!1954))))

(declare-fun condMapEmpty!1954 () Bool)

(declare-datatypes ((V!1965 0))(
  ( (V!1966 (val!829 Int)) )
))
(declare-datatypes ((ValueCell!603 0))(
  ( (ValueCellFull!603 (v!1924 V!1965)) (EmptyCell!603) )
))
(declare-datatypes ((array!2425 0))(
  ( (array!2426 (arr!1160 (Array (_ BitVec 32) ValueCell!603)) (size!1261 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2425)

(declare-fun mapDefault!1954 () ValueCell!603)

(assert (=> b!34982 (= condMapEmpty!1954 (= (arr!1160 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!603)) mapDefault!1954)))))

(declare-fun b!34983 () Bool)

(declare-fun res!21272 () Bool)

(assert (=> b!34983 (=> (not res!21272) (not e!22119))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun zeroValue!1443 () V!1965)

(declare-fun minValue!1443 () V!1965)

(declare-datatypes ((tuple2!1342 0))(
  ( (tuple2!1343 (_1!682 (_ BitVec 64)) (_2!682 V!1965)) )
))
(declare-datatypes ((List!933 0))(
  ( (Nil!930) (Cons!929 (h!1496 tuple2!1342) (t!3638 List!933)) )
))
(declare-datatypes ((ListLongMap!919 0))(
  ( (ListLongMap!920 (toList!475 List!933)) )
))
(declare-fun contains!421 (ListLongMap!919 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!299 (array!2423 array!2425 (_ BitVec 32) (_ BitVec 32) V!1965 V!1965 (_ BitVec 32) Int) ListLongMap!919)

(assert (=> b!34983 (= res!21272 (not (contains!421 (getCurrentListMap!299 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun res!21273 () Bool)

(assert (=> start!4490 (=> (not res!21273) (not e!22119))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4490 (= res!21273 (validMask!0 mask!2294))))

(assert (=> start!4490 e!22119))

(assert (=> start!4490 true))

(assert (=> start!4490 tp!5191))

(declare-fun array_inv!819 (array!2425) Bool)

(assert (=> start!4490 (and (array_inv!819 _values!1501) e!22117)))

(declare-fun array_inv!820 (array!2423) Bool)

(assert (=> start!4490 (array_inv!820 _keys!1833)))

(declare-fun tp_is_empty!1605 () Bool)

(assert (=> start!4490 tp_is_empty!1605))

(declare-fun b!34984 () Bool)

(declare-fun res!21270 () Bool)

(assert (=> b!34984 (=> (not res!21270) (not e!22119))))

(assert (=> b!34984 (= res!21270 (and (= (size!1261 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1260 _keys!1833) (size!1261 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!34985 () Bool)

(assert (=> b!34985 (= e!22120 tp_is_empty!1605)))

(declare-fun b!34986 () Bool)

(declare-fun e!22116 () Bool)

(assert (=> b!34986 (= e!22116 tp_is_empty!1605)))

(declare-fun b!34987 () Bool)

(assert (=> b!34987 (= e!22119 false)))

(declare-datatypes ((SeekEntryResult!156 0))(
  ( (MissingZero!156 (index!2746 (_ BitVec 32))) (Found!156 (index!2747 (_ BitVec 32))) (Intermediate!156 (undefined!968 Bool) (index!2748 (_ BitVec 32)) (x!6974 (_ BitVec 32))) (Undefined!156) (MissingVacant!156 (index!2749 (_ BitVec 32))) )
))
(declare-fun lt!12834 () SeekEntryResult!156)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2423 (_ BitVec 32)) SeekEntryResult!156)

(assert (=> b!34987 (= lt!12834 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!34988 () Bool)

(declare-fun res!21271 () Bool)

(assert (=> b!34988 (=> (not res!21271) (not e!22119))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34988 (= res!21271 (validKeyInArray!0 k0!1304))))

(declare-fun b!34989 () Bool)

(declare-fun res!21268 () Bool)

(assert (=> b!34989 (=> (not res!21268) (not e!22119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2423 (_ BitVec 32)) Bool)

(assert (=> b!34989 (= res!21268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!34990 () Bool)

(declare-fun res!21269 () Bool)

(assert (=> b!34990 (=> (not res!21269) (not e!22119))))

(declare-fun arrayContainsKey!0 (array!2423 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34990 (= res!21269 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!1954 () Bool)

(declare-fun tp!5190 () Bool)

(assert (=> mapNonEmpty!1954 (= mapRes!1954 (and tp!5190 e!22116))))

(declare-fun mapValue!1954 () ValueCell!603)

(declare-fun mapRest!1954 () (Array (_ BitVec 32) ValueCell!603))

(declare-fun mapKey!1954 () (_ BitVec 32))

(assert (=> mapNonEmpty!1954 (= (arr!1160 _values!1501) (store mapRest!1954 mapKey!1954 mapValue!1954))))

(assert (= (and start!4490 res!21273) b!34984))

(assert (= (and b!34984 res!21270) b!34989))

(assert (= (and b!34989 res!21268) b!34981))

(assert (= (and b!34981 res!21267) b!34988))

(assert (= (and b!34988 res!21271) b!34983))

(assert (= (and b!34983 res!21272) b!34990))

(assert (= (and b!34990 res!21269) b!34987))

(assert (= (and b!34982 condMapEmpty!1954) mapIsEmpty!1954))

(assert (= (and b!34982 (not condMapEmpty!1954)) mapNonEmpty!1954))

(get-info :version)

(assert (= (and mapNonEmpty!1954 ((_ is ValueCellFull!603) mapValue!1954)) b!34986))

(assert (= (and b!34982 ((_ is ValueCellFull!603) mapDefault!1954)) b!34985))

(assert (= start!4490 b!34982))

(declare-fun m!28165 () Bool)

(assert (=> b!34988 m!28165))

(declare-fun m!28167 () Bool)

(assert (=> b!34987 m!28167))

(declare-fun m!28169 () Bool)

(assert (=> b!34989 m!28169))

(declare-fun m!28171 () Bool)

(assert (=> b!34981 m!28171))

(declare-fun m!28173 () Bool)

(assert (=> start!4490 m!28173))

(declare-fun m!28175 () Bool)

(assert (=> start!4490 m!28175))

(declare-fun m!28177 () Bool)

(assert (=> start!4490 m!28177))

(declare-fun m!28179 () Bool)

(assert (=> b!34983 m!28179))

(assert (=> b!34983 m!28179))

(declare-fun m!28181 () Bool)

(assert (=> b!34983 m!28181))

(declare-fun m!28183 () Bool)

(assert (=> b!34990 m!28183))

(declare-fun m!28185 () Bool)

(assert (=> mapNonEmpty!1954 m!28185))

(check-sat (not b!34983) (not start!4490) (not b!34987) (not b_next!1251) tp_is_empty!1605 b_and!2073 (not b!34990) (not b!34988) (not b!34981) (not b!34989) (not mapNonEmpty!1954))
(check-sat b_and!2073 (not b_next!1251))
