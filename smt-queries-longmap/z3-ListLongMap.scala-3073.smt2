; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43276 () Bool)

(assert start!43276)

(declare-fun b_free!12157 () Bool)

(declare-fun b_next!12157 () Bool)

(assert (=> start!43276 (= b_free!12157 (not b_next!12157))))

(declare-fun tp!42741 () Bool)

(declare-fun b_and!20883 () Bool)

(assert (=> start!43276 (= tp!42741 b_and!20883)))

(declare-fun b!479344 () Bool)

(declare-fun e!282021 () Bool)

(declare-fun e!282018 () Bool)

(declare-fun mapRes!22201 () Bool)

(assert (=> b!479344 (= e!282021 (and e!282018 mapRes!22201))))

(declare-fun condMapEmpty!22201 () Bool)

(declare-datatypes ((V!19297 0))(
  ( (V!19298 (val!6882 Int)) )
))
(declare-datatypes ((ValueCell!6473 0))(
  ( (ValueCellFull!6473 (v!9165 V!19297)) (EmptyCell!6473) )
))
(declare-datatypes ((array!31001 0))(
  ( (array!31002 (arr!14907 (Array (_ BitVec 32) ValueCell!6473)) (size!15266 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31001)

(declare-fun mapDefault!22201 () ValueCell!6473)

(assert (=> b!479344 (= condMapEmpty!22201 (= (arr!14907 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6473)) mapDefault!22201)))))

(declare-fun b!479345 () Bool)

(declare-fun res!285960 () Bool)

(declare-fun e!282019 () Bool)

(assert (=> b!479345 (=> (not res!285960) (not e!282019))))

(declare-datatypes ((array!31003 0))(
  ( (array!31004 (arr!14908 (Array (_ BitVec 32) (_ BitVec 64))) (size!15267 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31003)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31003 (_ BitVec 32)) Bool)

(assert (=> b!479345 (= res!285960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun res!285961 () Bool)

(assert (=> start!43276 (=> (not res!285961) (not e!282019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43276 (= res!285961 (validMask!0 mask!2352))))

(assert (=> start!43276 e!282019))

(assert (=> start!43276 true))

(declare-fun tp_is_empty!13669 () Bool)

(assert (=> start!43276 tp_is_empty!13669))

(declare-fun array_inv!10848 (array!31001) Bool)

(assert (=> start!43276 (and (array_inv!10848 _values!1516) e!282021)))

(assert (=> start!43276 tp!42741))

(declare-fun array_inv!10849 (array!31003) Bool)

(assert (=> start!43276 (array_inv!10849 _keys!1874)))

(declare-fun b!479346 () Bool)

(declare-fun res!285962 () Bool)

(assert (=> b!479346 (=> (not res!285962) (not e!282019))))

(declare-datatypes ((List!9151 0))(
  ( (Nil!9148) (Cons!9147 (h!10003 (_ BitVec 64)) (t!15348 List!9151)) )
))
(declare-fun arrayNoDuplicates!0 (array!31003 (_ BitVec 32) List!9151) Bool)

(assert (=> b!479346 (= res!285962 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9148))))

(declare-fun b!479347 () Bool)

(declare-fun e!282020 () Bool)

(assert (=> b!479347 (= e!282020 tp_is_empty!13669)))

(declare-fun b!479348 () Bool)

(assert (=> b!479348 (= e!282018 tp_is_empty!13669)))

(declare-fun b!479349 () Bool)

(assert (=> b!479349 (= e!282019 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun lt!217654 () Bool)

(declare-fun minValue!1458 () V!19297)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19297)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9090 0))(
  ( (tuple2!9091 (_1!4556 (_ BitVec 64)) (_2!4556 V!19297)) )
))
(declare-datatypes ((List!9152 0))(
  ( (Nil!9149) (Cons!9148 (h!10004 tuple2!9090) (t!15349 List!9152)) )
))
(declare-datatypes ((ListLongMap!7993 0))(
  ( (ListLongMap!7994 (toList!4012 List!9152)) )
))
(declare-fun contains!2587 (ListLongMap!7993 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2265 (array!31003 array!31001 (_ BitVec 32) (_ BitVec 32) V!19297 V!19297 (_ BitVec 32) Int) ListLongMap!7993)

(assert (=> b!479349 (= lt!217654 (contains!2587 (getCurrentListMap!2265 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun mapNonEmpty!22201 () Bool)

(declare-fun tp!42742 () Bool)

(assert (=> mapNonEmpty!22201 (= mapRes!22201 (and tp!42742 e!282020))))

(declare-fun mapKey!22201 () (_ BitVec 32))

(declare-fun mapValue!22201 () ValueCell!6473)

(declare-fun mapRest!22201 () (Array (_ BitVec 32) ValueCell!6473))

(assert (=> mapNonEmpty!22201 (= (arr!14907 _values!1516) (store mapRest!22201 mapKey!22201 mapValue!22201))))

(declare-fun b!479350 () Bool)

(declare-fun res!285963 () Bool)

(assert (=> b!479350 (=> (not res!285963) (not e!282019))))

(assert (=> b!479350 (= res!285963 (and (= (size!15266 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15267 _keys!1874) (size!15266 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!22201 () Bool)

(assert (=> mapIsEmpty!22201 mapRes!22201))

(assert (= (and start!43276 res!285961) b!479350))

(assert (= (and b!479350 res!285963) b!479345))

(assert (= (and b!479345 res!285960) b!479346))

(assert (= (and b!479346 res!285962) b!479349))

(assert (= (and b!479344 condMapEmpty!22201) mapIsEmpty!22201))

(assert (= (and b!479344 (not condMapEmpty!22201)) mapNonEmpty!22201))

(get-info :version)

(assert (= (and mapNonEmpty!22201 ((_ is ValueCellFull!6473) mapValue!22201)) b!479347))

(assert (= (and b!479344 ((_ is ValueCellFull!6473) mapDefault!22201)) b!479348))

(assert (= start!43276 b!479344))

(declare-fun m!460785 () Bool)

(assert (=> mapNonEmpty!22201 m!460785))

(declare-fun m!460787 () Bool)

(assert (=> b!479345 m!460787))

(declare-fun m!460789 () Bool)

(assert (=> start!43276 m!460789))

(declare-fun m!460791 () Bool)

(assert (=> start!43276 m!460791))

(declare-fun m!460793 () Bool)

(assert (=> start!43276 m!460793))

(declare-fun m!460795 () Bool)

(assert (=> b!479346 m!460795))

(declare-fun m!460797 () Bool)

(assert (=> b!479349 m!460797))

(assert (=> b!479349 m!460797))

(declare-fun m!460799 () Bool)

(assert (=> b!479349 m!460799))

(check-sat b_and!20883 tp_is_empty!13669 (not start!43276) (not b_next!12157) (not b!479345) (not mapNonEmpty!22201) (not b!479349) (not b!479346))
(check-sat b_and!20883 (not b_next!12157))
