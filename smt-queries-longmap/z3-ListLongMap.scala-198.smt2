; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3810 () Bool)

(assert start!3810)

(declare-fun b_free!775 () Bool)

(declare-fun b_next!775 () Bool)

(assert (=> start!3810 (= b_free!775 (not b_next!775))))

(declare-fun tp!3736 () Bool)

(declare-fun b_and!1573 () Bool)

(assert (=> start!3810 (= tp!3736 b_and!1573)))

(declare-fun mapNonEmpty!1213 () Bool)

(declare-fun mapRes!1213 () Bool)

(declare-fun tp!3735 () Bool)

(declare-fun e!17397 () Bool)

(assert (=> mapNonEmpty!1213 (= mapRes!1213 (and tp!3735 e!17397))))

(declare-datatypes ((V!1331 0))(
  ( (V!1332 (val!591 Int)) )
))
(declare-datatypes ((ValueCell!365 0))(
  ( (ValueCellFull!365 (v!1676 V!1331)) (EmptyCell!365) )
))
(declare-datatypes ((array!1475 0))(
  ( (array!1476 (arr!694 (Array (_ BitVec 32) ValueCell!365)) (size!795 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1475)

(declare-fun mapRest!1213 () (Array (_ BitVec 32) ValueCell!365))

(declare-fun mapValue!1213 () ValueCell!365)

(declare-fun mapKey!1213 () (_ BitVec 32))

(assert (=> mapNonEmpty!1213 (= (arr!694 _values!1501) (store mapRest!1213 mapKey!1213 mapValue!1213))))

(declare-fun b!26669 () Bool)

(declare-fun e!17398 () Bool)

(declare-fun e!17395 () Bool)

(assert (=> b!26669 (= e!17398 (and e!17395 mapRes!1213))))

(declare-fun condMapEmpty!1213 () Bool)

(declare-fun mapDefault!1213 () ValueCell!365)

(assert (=> b!26669 (= condMapEmpty!1213 (= (arr!694 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!365)) mapDefault!1213)))))

(declare-fun b!26670 () Bool)

(declare-fun tp_is_empty!1129 () Bool)

(assert (=> b!26670 (= e!17395 tp_is_empty!1129)))

(declare-fun b!26671 () Bool)

(declare-fun res!15815 () Bool)

(declare-fun e!17394 () Bool)

(assert (=> b!26671 (=> (not res!15815) (not e!17394))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!26671 (= res!15815 (validKeyInArray!0 k0!1304))))

(declare-fun b!26672 () Bool)

(assert (=> b!26672 (= e!17394 false)))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1477 0))(
  ( (array!1478 (arr!695 (Array (_ BitVec 32) (_ BitVec 64))) (size!796 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1477)

(declare-fun lt!10399 () Bool)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1331)

(declare-fun minValue!1443 () V!1331)

(declare-datatypes ((tuple2!1008 0))(
  ( (tuple2!1009 (_1!515 (_ BitVec 64)) (_2!515 V!1331)) )
))
(declare-datatypes ((List!594 0))(
  ( (Nil!591) (Cons!590 (h!1157 tuple2!1008) (t!3274 List!594)) )
))
(declare-datatypes ((ListLongMap!573 0))(
  ( (ListLongMap!574 (toList!302 List!594)) )
))
(declare-fun contains!240 (ListLongMap!573 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!132 (array!1477 array!1475 (_ BitVec 32) (_ BitVec 32) V!1331 V!1331 (_ BitVec 32) Int) ListLongMap!573)

(assert (=> b!26672 (= lt!10399 (contains!240 (getCurrentListMap!132 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304))))

(declare-fun b!26673 () Bool)

(assert (=> b!26673 (= e!17397 tp_is_empty!1129)))

(declare-fun b!26674 () Bool)

(declare-fun res!15816 () Bool)

(assert (=> b!26674 (=> (not res!15816) (not e!17394))))

(assert (=> b!26674 (= res!15816 (and (= (size!795 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!796 _keys!1833) (size!795 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!1213 () Bool)

(assert (=> mapIsEmpty!1213 mapRes!1213))

(declare-fun b!26675 () Bool)

(declare-fun res!15813 () Bool)

(assert (=> b!26675 (=> (not res!15813) (not e!17394))))

(declare-datatypes ((List!595 0))(
  ( (Nil!592) (Cons!591 (h!1158 (_ BitVec 64)) (t!3275 List!595)) )
))
(declare-fun arrayNoDuplicates!0 (array!1477 (_ BitVec 32) List!595) Bool)

(assert (=> b!26675 (= res!15813 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!592))))

(declare-fun res!15814 () Bool)

(assert (=> start!3810 (=> (not res!15814) (not e!17394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3810 (= res!15814 (validMask!0 mask!2294))))

(assert (=> start!3810 e!17394))

(assert (=> start!3810 true))

(assert (=> start!3810 tp!3736))

(declare-fun array_inv!493 (array!1475) Bool)

(assert (=> start!3810 (and (array_inv!493 _values!1501) e!17398)))

(declare-fun array_inv!494 (array!1477) Bool)

(assert (=> start!3810 (array_inv!494 _keys!1833)))

(assert (=> start!3810 tp_is_empty!1129))

(declare-fun b!26676 () Bool)

(declare-fun res!15817 () Bool)

(assert (=> b!26676 (=> (not res!15817) (not e!17394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1477 (_ BitVec 32)) Bool)

(assert (=> b!26676 (= res!15817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(assert (= (and start!3810 res!15814) b!26674))

(assert (= (and b!26674 res!15816) b!26676))

(assert (= (and b!26676 res!15817) b!26675))

(assert (= (and b!26675 res!15813) b!26671))

(assert (= (and b!26671 res!15815) b!26672))

(assert (= (and b!26669 condMapEmpty!1213) mapIsEmpty!1213))

(assert (= (and b!26669 (not condMapEmpty!1213)) mapNonEmpty!1213))

(get-info :version)

(assert (= (and mapNonEmpty!1213 ((_ is ValueCellFull!365) mapValue!1213)) b!26673))

(assert (= (and b!26669 ((_ is ValueCellFull!365) mapDefault!1213)) b!26670))

(assert (= start!3810 b!26669))

(declare-fun m!21319 () Bool)

(assert (=> b!26675 m!21319))

(declare-fun m!21321 () Bool)

(assert (=> start!3810 m!21321))

(declare-fun m!21323 () Bool)

(assert (=> start!3810 m!21323))

(declare-fun m!21325 () Bool)

(assert (=> start!3810 m!21325))

(declare-fun m!21327 () Bool)

(assert (=> mapNonEmpty!1213 m!21327))

(declare-fun m!21329 () Bool)

(assert (=> b!26672 m!21329))

(assert (=> b!26672 m!21329))

(declare-fun m!21331 () Bool)

(assert (=> b!26672 m!21331))

(declare-fun m!21333 () Bool)

(assert (=> b!26671 m!21333))

(declare-fun m!21335 () Bool)

(assert (=> b!26676 m!21335))

(check-sat (not b_next!775) (not mapNonEmpty!1213) (not b!26675) (not b!26676) (not start!3810) (not b!26671) b_and!1573 tp_is_empty!1129 (not b!26672))
(check-sat b_and!1573 (not b_next!775))
