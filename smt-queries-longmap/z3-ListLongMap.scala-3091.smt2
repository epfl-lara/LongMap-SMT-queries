; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43488 () Bool)

(assert start!43488)

(declare-fun b_free!12267 () Bool)

(declare-fun b_next!12267 () Bool)

(assert (=> start!43488 (= b_free!12267 (not b_next!12267))))

(declare-fun tp!43084 () Bool)

(declare-fun b_and!21027 () Bool)

(assert (=> start!43488 (= tp!43084 b_and!21027)))

(declare-fun b!481859 () Bool)

(declare-fun res!287255 () Bool)

(declare-fun e!283508 () Bool)

(assert (=> b!481859 (=> (not res!287255) (not e!283508))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!31219 0))(
  ( (array!31220 (arr!15012 (Array (_ BitVec 32) (_ BitVec 64))) (size!15370 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31219)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19443 0))(
  ( (V!19444 (val!6937 Int)) )
))
(declare-datatypes ((ValueCell!6528 0))(
  ( (ValueCellFull!6528 (v!9230 V!19443)) (EmptyCell!6528) )
))
(declare-datatypes ((array!31221 0))(
  ( (array!31222 (arr!15013 (Array (_ BitVec 32) ValueCell!6528)) (size!15371 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31221)

(assert (=> b!481859 (= res!287255 (and (= (size!15371 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15370 _keys!1874) (size!15371 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!481860 () Bool)

(declare-fun res!287256 () Bool)

(assert (=> b!481860 (=> (not res!287256) (not e!283508))))

(declare-datatypes ((List!9180 0))(
  ( (Nil!9177) (Cons!9176 (h!10032 (_ BitVec 64)) (t!15394 List!9180)) )
))
(declare-fun arrayNoDuplicates!0 (array!31219 (_ BitVec 32) List!9180) Bool)

(assert (=> b!481860 (= res!287256 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9177))))

(declare-fun b!481861 () Bool)

(declare-fun e!283506 () Bool)

(declare-fun e!283505 () Bool)

(declare-fun mapRes!22378 () Bool)

(assert (=> b!481861 (= e!283506 (and e!283505 mapRes!22378))))

(declare-fun condMapEmpty!22378 () Bool)

(declare-fun mapDefault!22378 () ValueCell!6528)

(assert (=> b!481861 (= condMapEmpty!22378 (= (arr!15013 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6528)) mapDefault!22378)))))

(declare-fun b!481862 () Bool)

(assert (=> b!481862 (= e!283508 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun lt!218638 () Bool)

(declare-fun minValue!1458 () V!19443)

(declare-fun zeroValue!1458 () V!19443)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9100 0))(
  ( (tuple2!9101 (_1!4561 (_ BitVec 64)) (_2!4561 V!19443)) )
))
(declare-datatypes ((List!9181 0))(
  ( (Nil!9178) (Cons!9177 (h!10033 tuple2!9100) (t!15395 List!9181)) )
))
(declare-datatypes ((ListLongMap!8013 0))(
  ( (ListLongMap!8014 (toList!4022 List!9181)) )
))
(declare-fun contains!2636 (ListLongMap!8013 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2341 (array!31219 array!31221 (_ BitVec 32) (_ BitVec 32) V!19443 V!19443 (_ BitVec 32) Int) ListLongMap!8013)

(assert (=> b!481862 (= lt!218638 (contains!2636 (getCurrentListMap!2341 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun mapIsEmpty!22378 () Bool)

(assert (=> mapIsEmpty!22378 mapRes!22378))

(declare-fun b!481863 () Bool)

(declare-fun tp_is_empty!13779 () Bool)

(assert (=> b!481863 (= e!283505 tp_is_empty!13779)))

(declare-fun b!481864 () Bool)

(declare-fun res!287257 () Bool)

(assert (=> b!481864 (=> (not res!287257) (not e!283508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31219 (_ BitVec 32)) Bool)

(assert (=> b!481864 (= res!287257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!481865 () Bool)

(declare-fun e!283509 () Bool)

(assert (=> b!481865 (= e!283509 tp_is_empty!13779)))

(declare-fun res!287254 () Bool)

(assert (=> start!43488 (=> (not res!287254) (not e!283508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43488 (= res!287254 (validMask!0 mask!2352))))

(assert (=> start!43488 e!283508))

(assert (=> start!43488 true))

(assert (=> start!43488 tp_is_empty!13779))

(declare-fun array_inv!10826 (array!31221) Bool)

(assert (=> start!43488 (and (array_inv!10826 _values!1516) e!283506)))

(assert (=> start!43488 tp!43084))

(declare-fun array_inv!10827 (array!31219) Bool)

(assert (=> start!43488 (array_inv!10827 _keys!1874)))

(declare-fun mapNonEmpty!22378 () Bool)

(declare-fun tp!43083 () Bool)

(assert (=> mapNonEmpty!22378 (= mapRes!22378 (and tp!43083 e!283509))))

(declare-fun mapRest!22378 () (Array (_ BitVec 32) ValueCell!6528))

(declare-fun mapKey!22378 () (_ BitVec 32))

(declare-fun mapValue!22378 () ValueCell!6528)

(assert (=> mapNonEmpty!22378 (= (arr!15013 _values!1516) (store mapRest!22378 mapKey!22378 mapValue!22378))))

(assert (= (and start!43488 res!287254) b!481859))

(assert (= (and b!481859 res!287255) b!481864))

(assert (= (and b!481864 res!287257) b!481860))

(assert (= (and b!481860 res!287256) b!481862))

(assert (= (and b!481861 condMapEmpty!22378) mapIsEmpty!22378))

(assert (= (and b!481861 (not condMapEmpty!22378)) mapNonEmpty!22378))

(get-info :version)

(assert (= (and mapNonEmpty!22378 ((_ is ValueCellFull!6528) mapValue!22378)) b!481865))

(assert (= (and b!481861 ((_ is ValueCellFull!6528) mapDefault!22378)) b!481863))

(assert (= start!43488 b!481861))

(declare-fun m!463251 () Bool)

(assert (=> start!43488 m!463251))

(declare-fun m!463253 () Bool)

(assert (=> start!43488 m!463253))

(declare-fun m!463255 () Bool)

(assert (=> start!43488 m!463255))

(declare-fun m!463257 () Bool)

(assert (=> b!481864 m!463257))

(declare-fun m!463259 () Bool)

(assert (=> mapNonEmpty!22378 m!463259))

(declare-fun m!463261 () Bool)

(assert (=> b!481862 m!463261))

(assert (=> b!481862 m!463261))

(declare-fun m!463263 () Bool)

(assert (=> b!481862 m!463263))

(declare-fun m!463265 () Bool)

(assert (=> b!481860 m!463265))

(check-sat (not b!481864) b_and!21027 (not b_next!12267) tp_is_empty!13779 (not b!481862) (not start!43488) (not b!481860) (not mapNonEmpty!22378))
(check-sat b_and!21027 (not b_next!12267))
