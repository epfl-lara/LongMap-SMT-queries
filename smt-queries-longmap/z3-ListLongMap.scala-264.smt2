; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4320 () Bool)

(assert start!4320)

(declare-fun b_free!1171 () Bool)

(declare-fun b_next!1171 () Bool)

(assert (=> start!4320 (= b_free!1171 (not b_next!1171))))

(declare-fun tp!4942 () Bool)

(declare-fun b_and!1981 () Bool)

(assert (=> start!4320 (= tp!4942 b_and!1981)))

(declare-fun b!33288 () Bool)

(declare-fun res!20228 () Bool)

(declare-fun e!21133 () Bool)

(assert (=> b!33288 (=> (not res!20228) (not e!21133))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2237 0))(
  ( (array!2238 (arr!1069 (Array (_ BitVec 32) (_ BitVec 64))) (size!1170 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2237)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-datatypes ((V!1859 0))(
  ( (V!1860 (val!789 Int)) )
))
(declare-datatypes ((ValueCell!563 0))(
  ( (ValueCellFull!563 (v!1880 V!1859)) (EmptyCell!563) )
))
(declare-datatypes ((array!2239 0))(
  ( (array!2240 (arr!1070 (Array (_ BitVec 32) ValueCell!563)) (size!1171 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2239)

(assert (=> b!33288 (= res!20228 (and (= (size!1171 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1170 _keys!1833) (size!1171 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!33289 () Bool)

(declare-fun res!20231 () Bool)

(declare-fun e!21134 () Bool)

(assert (=> b!33289 (=> (not res!20231) (not e!21134))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2237 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!33289 (= res!20231 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun res!20229 () Bool)

(assert (=> start!4320 (=> (not res!20229) (not e!21133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4320 (= res!20229 (validMask!0 mask!2294))))

(assert (=> start!4320 e!21133))

(assert (=> start!4320 true))

(assert (=> start!4320 tp!4942))

(declare-fun e!21136 () Bool)

(declare-fun array_inv!761 (array!2239) Bool)

(assert (=> start!4320 (and (array_inv!761 _values!1501) e!21136)))

(declare-fun array_inv!762 (array!2237) Bool)

(assert (=> start!4320 (array_inv!762 _keys!1833)))

(declare-fun tp_is_empty!1525 () Bool)

(assert (=> start!4320 tp_is_empty!1525))

(declare-fun b!33290 () Bool)

(declare-fun e!21135 () Bool)

(declare-fun mapRes!1825 () Bool)

(assert (=> b!33290 (= e!21136 (and e!21135 mapRes!1825))))

(declare-fun condMapEmpty!1825 () Bool)

(declare-fun mapDefault!1825 () ValueCell!563)

(assert (=> b!33290 (= condMapEmpty!1825 (= (arr!1070 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!563)) mapDefault!1825)))))

(declare-fun b!33291 () Bool)

(assert (=> b!33291 (= e!21134 (not (= (size!1170 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-datatypes ((SeekEntryResult!135 0))(
  ( (MissingZero!135 (index!2662 (_ BitVec 32))) (Found!135 (index!2663 (_ BitVec 32))) (Intermediate!135 (undefined!947 Bool) (index!2664 (_ BitVec 32)) (x!6819 (_ BitVec 32))) (Undefined!135) (MissingVacant!135 (index!2665 (_ BitVec 32))) )
))
(declare-fun lt!12133 () SeekEntryResult!135)

(declare-fun lt!12134 () (_ BitVec 32))

(get-info :version)

(assert (=> b!33291 (and ((_ is Found!135) lt!12133) (= (index!2663 lt!12133) lt!12134))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2237 (_ BitVec 32)) SeekEntryResult!135)

(assert (=> b!33291 (= lt!12133 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!743 0))(
  ( (Unit!744) )
))
(declare-fun lt!12135 () Unit!743)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!2237 (_ BitVec 32)) Unit!743)

(assert (=> b!33291 (= lt!12135 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!12134 _keys!1833 mask!2294))))

(declare-datatypes ((tuple2!1284 0))(
  ( (tuple2!1285 (_1!653 (_ BitVec 64)) (_2!653 V!1859)) )
))
(declare-datatypes ((List!867 0))(
  ( (Nil!864) (Cons!863 (h!1430 tuple2!1284) (t!3559 List!867)) )
))
(declare-datatypes ((ListLongMap!849 0))(
  ( (ListLongMap!850 (toList!440 List!867)) )
))
(declare-fun lt!12136 () ListLongMap!849)

(declare-fun contains!384 (ListLongMap!849 (_ BitVec 64)) Bool)

(assert (=> b!33291 (contains!384 lt!12136 (select (arr!1069 _keys!1833) lt!12134))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun lt!12137 () Unit!743)

(declare-fun zeroValue!1443 () V!1859)

(declare-fun minValue!1443 () V!1859)

(declare-fun lemmaValidKeyInArrayIsInListMap!56 (array!2237 array!2239 (_ BitVec 32) (_ BitVec 32) V!1859 V!1859 (_ BitVec 32) Int) Unit!743)

(assert (=> b!33291 (= lt!12137 (lemmaValidKeyInArrayIsInListMap!56 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12134 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2237 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!33291 (= lt!12134 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!33292 () Bool)

(assert (=> b!33292 (= e!21135 tp_is_empty!1525)))

(declare-fun b!33293 () Bool)

(declare-fun res!20232 () Bool)

(assert (=> b!33293 (=> (not res!20232) (not e!21133))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!33293 (= res!20232 (validKeyInArray!0 k0!1304))))

(declare-fun mapNonEmpty!1825 () Bool)

(declare-fun tp!4941 () Bool)

(declare-fun e!21138 () Bool)

(assert (=> mapNonEmpty!1825 (= mapRes!1825 (and tp!4941 e!21138))))

(declare-fun mapRest!1825 () (Array (_ BitVec 32) ValueCell!563))

(declare-fun mapKey!1825 () (_ BitVec 32))

(declare-fun mapValue!1825 () ValueCell!563)

(assert (=> mapNonEmpty!1825 (= (arr!1070 _values!1501) (store mapRest!1825 mapKey!1825 mapValue!1825))))

(declare-fun b!33294 () Bool)

(declare-fun res!20233 () Bool)

(assert (=> b!33294 (=> (not res!20233) (not e!21133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2237 (_ BitVec 32)) Bool)

(assert (=> b!33294 (= res!20233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!33295 () Bool)

(assert (=> b!33295 (= e!21133 e!21134)))

(declare-fun res!20230 () Bool)

(assert (=> b!33295 (=> (not res!20230) (not e!21134))))

(assert (=> b!33295 (= res!20230 (not (contains!384 lt!12136 k0!1304)))))

(declare-fun getCurrentListMap!260 (array!2237 array!2239 (_ BitVec 32) (_ BitVec 32) V!1859 V!1859 (_ BitVec 32) Int) ListLongMap!849)

(assert (=> b!33295 (= lt!12136 (getCurrentListMap!260 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!33296 () Bool)

(declare-fun res!20234 () Bool)

(assert (=> b!33296 (=> (not res!20234) (not e!21133))))

(declare-datatypes ((List!868 0))(
  ( (Nil!865) (Cons!864 (h!1431 (_ BitVec 64)) (t!3560 List!868)) )
))
(declare-fun arrayNoDuplicates!0 (array!2237 (_ BitVec 32) List!868) Bool)

(assert (=> b!33296 (= res!20234 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!865))))

(declare-fun b!33297 () Bool)

(assert (=> b!33297 (= e!21138 tp_is_empty!1525)))

(declare-fun mapIsEmpty!1825 () Bool)

(assert (=> mapIsEmpty!1825 mapRes!1825))

(assert (= (and start!4320 res!20229) b!33288))

(assert (= (and b!33288 res!20228) b!33294))

(assert (= (and b!33294 res!20233) b!33296))

(assert (= (and b!33296 res!20234) b!33293))

(assert (= (and b!33293 res!20232) b!33295))

(assert (= (and b!33295 res!20230) b!33289))

(assert (= (and b!33289 res!20231) b!33291))

(assert (= (and b!33290 condMapEmpty!1825) mapIsEmpty!1825))

(assert (= (and b!33290 (not condMapEmpty!1825)) mapNonEmpty!1825))

(assert (= (and mapNonEmpty!1825 ((_ is ValueCellFull!563) mapValue!1825)) b!33297))

(assert (= (and b!33290 ((_ is ValueCellFull!563) mapDefault!1825)) b!33292))

(assert (= start!4320 b!33290))

(declare-fun m!26669 () Bool)

(assert (=> b!33294 m!26669))

(declare-fun m!26671 () Bool)

(assert (=> b!33289 m!26671))

(declare-fun m!26673 () Bool)

(assert (=> start!4320 m!26673))

(declare-fun m!26675 () Bool)

(assert (=> start!4320 m!26675))

(declare-fun m!26677 () Bool)

(assert (=> start!4320 m!26677))

(declare-fun m!26679 () Bool)

(assert (=> b!33291 m!26679))

(declare-fun m!26681 () Bool)

(assert (=> b!33291 m!26681))

(declare-fun m!26683 () Bool)

(assert (=> b!33291 m!26683))

(declare-fun m!26685 () Bool)

(assert (=> b!33291 m!26685))

(assert (=> b!33291 m!26679))

(declare-fun m!26687 () Bool)

(assert (=> b!33291 m!26687))

(declare-fun m!26689 () Bool)

(assert (=> b!33291 m!26689))

(declare-fun m!26691 () Bool)

(assert (=> b!33293 m!26691))

(declare-fun m!26693 () Bool)

(assert (=> b!33295 m!26693))

(declare-fun m!26695 () Bool)

(assert (=> b!33295 m!26695))

(declare-fun m!26697 () Bool)

(assert (=> mapNonEmpty!1825 m!26697))

(declare-fun m!26699 () Bool)

(assert (=> b!33296 m!26699))

(check-sat (not b!33296) (not b!33294) tp_is_empty!1525 (not b!33295) (not b_next!1171) (not start!4320) (not b!33289) (not b!33291) (not b!33293) (not mapNonEmpty!1825) b_and!1981)
(check-sat b_and!1981 (not b_next!1171))
