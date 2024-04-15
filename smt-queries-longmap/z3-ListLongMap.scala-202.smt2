; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3884 () Bool)

(assert start!3884)

(declare-fun b_free!799 () Bool)

(declare-fun b_next!799 () Bool)

(assert (=> start!3884 (= b_free!799 (not b_next!799))))

(declare-fun tp!3817 () Bool)

(declare-fun b_and!1603 () Bool)

(assert (=> start!3884 (= tp!3817 b_and!1603)))

(declare-fun b!27326 () Bool)

(declare-fun e!17799 () Bool)

(declare-fun tp_is_empty!1153 () Bool)

(assert (=> b!27326 (= e!17799 tp_is_empty!1153)))

(declare-fun b!27327 () Bool)

(declare-fun res!16173 () Bool)

(declare-fun e!17800 () Bool)

(assert (=> b!27327 (=> (not res!16173) (not e!17800))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27327 (= res!16173 (validKeyInArray!0 k0!1304))))

(declare-fun b!27328 () Bool)

(declare-fun e!17796 () Bool)

(declare-fun e!17798 () Bool)

(declare-fun mapRes!1258 () Bool)

(assert (=> b!27328 (= e!17796 (and e!17798 mapRes!1258))))

(declare-fun condMapEmpty!1258 () Bool)

(declare-datatypes ((V!1363 0))(
  ( (V!1364 (val!603 Int)) )
))
(declare-datatypes ((ValueCell!377 0))(
  ( (ValueCellFull!377 (v!1691 V!1363)) (EmptyCell!377) )
))
(declare-datatypes ((array!1523 0))(
  ( (array!1524 (arr!715 (Array (_ BitVec 32) ValueCell!377)) (size!816 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1523)

(declare-fun mapDefault!1258 () ValueCell!377)

(assert (=> b!27328 (= condMapEmpty!1258 (= (arr!715 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!377)) mapDefault!1258)))))

(declare-fun b!27329 () Bool)

(declare-fun res!16170 () Bool)

(assert (=> b!27329 (=> (not res!16170) (not e!17800))))

(declare-datatypes ((array!1525 0))(
  ( (array!1526 (arr!716 (Array (_ BitVec 32) (_ BitVec 64))) (size!817 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1525)

(declare-datatypes ((List!608 0))(
  ( (Nil!605) (Cons!604 (h!1171 (_ BitVec 64)) (t!3294 List!608)) )
))
(declare-fun arrayNoDuplicates!0 (array!1525 (_ BitVec 32) List!608) Bool)

(assert (=> b!27329 (= res!16170 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!605))))

(declare-fun b!27330 () Bool)

(assert (=> b!27330 (= e!17798 tp_is_empty!1153)))

(declare-fun mapNonEmpty!1258 () Bool)

(declare-fun tp!3816 () Bool)

(assert (=> mapNonEmpty!1258 (= mapRes!1258 (and tp!3816 e!17799))))

(declare-fun mapValue!1258 () ValueCell!377)

(declare-fun mapKey!1258 () (_ BitVec 32))

(declare-fun mapRest!1258 () (Array (_ BitVec 32) ValueCell!377))

(assert (=> mapNonEmpty!1258 (= (arr!715 _values!1501) (store mapRest!1258 mapKey!1258 mapValue!1258))))

(declare-fun b!27331 () Bool)

(assert (=> b!27331 (= e!17800 false)))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1363)

(declare-fun minValue!1443 () V!1363)

(declare-fun lt!10669 () Bool)

(declare-datatypes ((tuple2!1022 0))(
  ( (tuple2!1023 (_1!522 (_ BitVec 64)) (_2!522 V!1363)) )
))
(declare-datatypes ((List!609 0))(
  ( (Nil!606) (Cons!605 (h!1172 tuple2!1022) (t!3295 List!609)) )
))
(declare-datatypes ((ListLongMap!587 0))(
  ( (ListLongMap!588 (toList!309 List!609)) )
))
(declare-fun contains!250 (ListLongMap!587 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!139 (array!1525 array!1523 (_ BitVec 32) (_ BitVec 32) V!1363 V!1363 (_ BitVec 32) Int) ListLongMap!587)

(assert (=> b!27331 (= lt!10669 (contains!250 (getCurrentListMap!139 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304))))

(declare-fun b!27332 () Bool)

(declare-fun res!16171 () Bool)

(assert (=> b!27332 (=> (not res!16171) (not e!17800))))

(assert (=> b!27332 (= res!16171 (and (= (size!816 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!817 _keys!1833) (size!816 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!27333 () Bool)

(declare-fun res!16172 () Bool)

(assert (=> b!27333 (=> (not res!16172) (not e!17800))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1525 (_ BitVec 32)) Bool)

(assert (=> b!27333 (= res!16172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1258 () Bool)

(assert (=> mapIsEmpty!1258 mapRes!1258))

(declare-fun res!16174 () Bool)

(assert (=> start!3884 (=> (not res!16174) (not e!17800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3884 (= res!16174 (validMask!0 mask!2294))))

(assert (=> start!3884 e!17800))

(assert (=> start!3884 true))

(assert (=> start!3884 tp!3817))

(declare-fun array_inv!507 (array!1523) Bool)

(assert (=> start!3884 (and (array_inv!507 _values!1501) e!17796)))

(declare-fun array_inv!508 (array!1525) Bool)

(assert (=> start!3884 (array_inv!508 _keys!1833)))

(assert (=> start!3884 tp_is_empty!1153))

(assert (= (and start!3884 res!16174) b!27332))

(assert (= (and b!27332 res!16171) b!27333))

(assert (= (and b!27333 res!16172) b!27329))

(assert (= (and b!27329 res!16170) b!27327))

(assert (= (and b!27327 res!16173) b!27331))

(assert (= (and b!27328 condMapEmpty!1258) mapIsEmpty!1258))

(assert (= (and b!27328 (not condMapEmpty!1258)) mapNonEmpty!1258))

(get-info :version)

(assert (= (and mapNonEmpty!1258 ((_ is ValueCellFull!377) mapValue!1258)) b!27326))

(assert (= (and b!27328 ((_ is ValueCellFull!377) mapDefault!1258)) b!27330))

(assert (= start!3884 b!27328))

(declare-fun m!21783 () Bool)

(assert (=> mapNonEmpty!1258 m!21783))

(declare-fun m!21785 () Bool)

(assert (=> b!27333 m!21785))

(declare-fun m!21787 () Bool)

(assert (=> b!27329 m!21787))

(declare-fun m!21789 () Bool)

(assert (=> b!27331 m!21789))

(assert (=> b!27331 m!21789))

(declare-fun m!21791 () Bool)

(assert (=> b!27331 m!21791))

(declare-fun m!21793 () Bool)

(assert (=> start!3884 m!21793))

(declare-fun m!21795 () Bool)

(assert (=> start!3884 m!21795))

(declare-fun m!21797 () Bool)

(assert (=> start!3884 m!21797))

(declare-fun m!21799 () Bool)

(assert (=> b!27327 m!21799))

(check-sat (not b!27327) b_and!1603 (not start!3884) (not b_next!799) (not mapNonEmpty!1258) (not b!27333) (not b!27329) tp_is_empty!1153 (not b!27331))
(check-sat b_and!1603 (not b_next!799))
