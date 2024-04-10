; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43268 () Bool)

(assert start!43268)

(declare-fun b_free!12135 () Bool)

(declare-fun b_next!12135 () Bool)

(assert (=> start!43268 (= b_free!12135 (not b_next!12135))))

(declare-fun tp!42676 () Bool)

(declare-fun b_and!20887 () Bool)

(assert (=> start!43268 (= tp!42676 b_and!20887)))

(declare-fun mapNonEmpty!22168 () Bool)

(declare-fun mapRes!22168 () Bool)

(declare-fun tp!42675 () Bool)

(declare-fun e!282028 () Bool)

(assert (=> mapNonEmpty!22168 (= mapRes!22168 (and tp!42675 e!282028))))

(declare-fun mapKey!22168 () (_ BitVec 32))

(declare-datatypes ((V!19267 0))(
  ( (V!19268 (val!6871 Int)) )
))
(declare-datatypes ((ValueCell!6462 0))(
  ( (ValueCellFull!6462 (v!9160 V!19267)) (EmptyCell!6462) )
))
(declare-fun mapRest!22168 () (Array (_ BitVec 32) ValueCell!6462))

(declare-fun mapValue!22168 () ValueCell!6462)

(declare-datatypes ((array!30967 0))(
  ( (array!30968 (arr!14890 (Array (_ BitVec 32) ValueCell!6462)) (size!15248 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30967)

(assert (=> mapNonEmpty!22168 (= (arr!14890 _values!1516) (store mapRest!22168 mapKey!22168 mapValue!22168))))

(declare-fun b!479385 () Bool)

(declare-fun e!282029 () Bool)

(declare-fun e!282027 () Bool)

(assert (=> b!479385 (= e!282029 (and e!282027 mapRes!22168))))

(declare-fun condMapEmpty!22168 () Bool)

(declare-fun mapDefault!22168 () ValueCell!6462)

(assert (=> b!479385 (= condMapEmpty!22168 (= (arr!14890 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6462)) mapDefault!22168)))))

(declare-fun b!479386 () Bool)

(declare-fun e!282030 () Bool)

(assert (=> b!479386 (= e!282030 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun minValue!1458 () V!19267)

(declare-fun lt!217855 () Bool)

(declare-fun zeroValue!1458 () V!19267)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!30969 0))(
  ( (array!30970 (arr!14891 (Array (_ BitVec 32) (_ BitVec 64))) (size!15249 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30969)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((tuple2!9018 0))(
  ( (tuple2!9019 (_1!4520 (_ BitVec 64)) (_2!4520 V!19267)) )
))
(declare-datatypes ((List!9096 0))(
  ( (Nil!9093) (Cons!9092 (h!9948 tuple2!9018) (t!15302 List!9096)) )
))
(declare-datatypes ((ListLongMap!7931 0))(
  ( (ListLongMap!7932 (toList!3981 List!9096)) )
))
(declare-fun contains!2591 (ListLongMap!7931 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2300 (array!30969 array!30967 (_ BitVec 32) (_ BitVec 32) V!19267 V!19267 (_ BitVec 32) Int) ListLongMap!7931)

(assert (=> b!479386 (= lt!217855 (contains!2591 (getCurrentListMap!2300 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!479387 () Bool)

(declare-fun res!285957 () Bool)

(assert (=> b!479387 (=> (not res!285957) (not e!282030))))

(declare-datatypes ((List!9097 0))(
  ( (Nil!9094) (Cons!9093 (h!9949 (_ BitVec 64)) (t!15303 List!9097)) )
))
(declare-fun arrayNoDuplicates!0 (array!30969 (_ BitVec 32) List!9097) Bool)

(assert (=> b!479387 (= res!285957 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9094))))

(declare-fun b!479388 () Bool)

(declare-fun res!285958 () Bool)

(assert (=> b!479388 (=> (not res!285958) (not e!282030))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30969 (_ BitVec 32)) Bool)

(assert (=> b!479388 (= res!285958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479389 () Bool)

(declare-fun tp_is_empty!13647 () Bool)

(assert (=> b!479389 (= e!282028 tp_is_empty!13647)))

(declare-fun b!479384 () Bool)

(assert (=> b!479384 (= e!282027 tp_is_empty!13647)))

(declare-fun res!285960 () Bool)

(assert (=> start!43268 (=> (not res!285960) (not e!282030))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43268 (= res!285960 (validMask!0 mask!2352))))

(assert (=> start!43268 e!282030))

(assert (=> start!43268 true))

(assert (=> start!43268 tp_is_empty!13647))

(declare-fun array_inv!10740 (array!30967) Bool)

(assert (=> start!43268 (and (array_inv!10740 _values!1516) e!282029)))

(assert (=> start!43268 tp!42676))

(declare-fun array_inv!10741 (array!30969) Bool)

(assert (=> start!43268 (array_inv!10741 _keys!1874)))

(declare-fun mapIsEmpty!22168 () Bool)

(assert (=> mapIsEmpty!22168 mapRes!22168))

(declare-fun b!479390 () Bool)

(declare-fun res!285959 () Bool)

(assert (=> b!479390 (=> (not res!285959) (not e!282030))))

(assert (=> b!479390 (= res!285959 (and (= (size!15248 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15249 _keys!1874) (size!15248 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(assert (= (and start!43268 res!285960) b!479390))

(assert (= (and b!479390 res!285959) b!479388))

(assert (= (and b!479388 res!285958) b!479387))

(assert (= (and b!479387 res!285957) b!479386))

(assert (= (and b!479385 condMapEmpty!22168) mapIsEmpty!22168))

(assert (= (and b!479385 (not condMapEmpty!22168)) mapNonEmpty!22168))

(get-info :version)

(assert (= (and mapNonEmpty!22168 ((_ is ValueCellFull!6462) mapValue!22168)) b!479389))

(assert (= (and b!479385 ((_ is ValueCellFull!6462) mapDefault!22168)) b!479384))

(assert (= start!43268 b!479385))

(declare-fun m!461343 () Bool)

(assert (=> b!479386 m!461343))

(assert (=> b!479386 m!461343))

(declare-fun m!461345 () Bool)

(assert (=> b!479386 m!461345))

(declare-fun m!461347 () Bool)

(assert (=> b!479387 m!461347))

(declare-fun m!461349 () Bool)

(assert (=> b!479388 m!461349))

(declare-fun m!461351 () Bool)

(assert (=> mapNonEmpty!22168 m!461351))

(declare-fun m!461353 () Bool)

(assert (=> start!43268 m!461353))

(declare-fun m!461355 () Bool)

(assert (=> start!43268 m!461355))

(declare-fun m!461357 () Bool)

(assert (=> start!43268 m!461357))

(check-sat (not start!43268) (not b!479386) (not b_next!12135) (not b!479388) tp_is_empty!13647 (not mapNonEmpty!22168) (not b!479387) b_and!20887)
(check-sat b_and!20887 (not b_next!12135))
