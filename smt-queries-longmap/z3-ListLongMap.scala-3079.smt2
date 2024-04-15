; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43352 () Bool)

(assert start!43352)

(declare-fun b_free!12193 () Bool)

(declare-fun b_next!12193 () Bool)

(assert (=> start!43352 (= b_free!12193 (not b_next!12193))))

(declare-fun tp!42856 () Bool)

(declare-fun b_and!20923 () Bool)

(assert (=> start!43352 (= tp!42856 b_and!20923)))

(declare-fun b!480125 () Bool)

(declare-fun res!286365 () Bool)

(declare-fun e!282501 () Bool)

(assert (=> b!480125 (=> (not res!286365) (not e!282501))))

(declare-datatypes ((array!31071 0))(
  ( (array!31072 (arr!14940 (Array (_ BitVec 32) (_ BitVec 64))) (size!15299 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31071)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31071 (_ BitVec 32)) Bool)

(assert (=> b!480125 (= res!286365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!480127 () Bool)

(declare-fun e!282498 () Bool)

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!480127 (= e!282498 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!480128 () Bool)

(declare-fun arrayContainsKey!0 (array!31071 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480128 (= e!282498 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!480129 () Bool)

(declare-fun res!286367 () Bool)

(assert (=> b!480129 (=> (not res!286367) (not e!282501))))

(declare-datatypes ((V!19345 0))(
  ( (V!19346 (val!6900 Int)) )
))
(declare-datatypes ((ValueCell!6491 0))(
  ( (ValueCellFull!6491 (v!9185 V!19345)) (EmptyCell!6491) )
))
(declare-datatypes ((array!31073 0))(
  ( (array!31074 (arr!14941 (Array (_ BitVec 32) ValueCell!6491)) (size!15300 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31073)

(assert (=> b!480129 (= res!286367 (and (= (size!15300 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15299 _keys!1874) (size!15300 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!480130 () Bool)

(declare-fun e!282497 () Bool)

(declare-fun tp_is_empty!13705 () Bool)

(assert (=> b!480130 (= e!282497 tp_is_empty!13705)))

(declare-fun mapNonEmpty!22261 () Bool)

(declare-fun mapRes!22261 () Bool)

(declare-fun tp!42855 () Bool)

(assert (=> mapNonEmpty!22261 (= mapRes!22261 (and tp!42855 e!282497))))

(declare-fun mapRest!22261 () (Array (_ BitVec 32) ValueCell!6491))

(declare-fun mapKey!22261 () (_ BitVec 32))

(declare-fun mapValue!22261 () ValueCell!6491)

(assert (=> mapNonEmpty!22261 (= (arr!14941 _values!1516) (store mapRest!22261 mapKey!22261 mapValue!22261))))

(declare-fun b!480131 () Bool)

(declare-fun e!282500 () Bool)

(declare-fun e!282496 () Bool)

(assert (=> b!480131 (= e!282500 (and e!282496 mapRes!22261))))

(declare-fun condMapEmpty!22261 () Bool)

(declare-fun mapDefault!22261 () ValueCell!6491)

(assert (=> b!480131 (= condMapEmpty!22261 (= (arr!14941 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6491)) mapDefault!22261)))))

(declare-fun b!480132 () Bool)

(declare-fun res!286368 () Bool)

(assert (=> b!480132 (=> (not res!286368) (not e!282501))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480132 (= res!286368 (validKeyInArray!0 k0!1332))))

(declare-fun res!286364 () Bool)

(assert (=> start!43352 (=> (not res!286364) (not e!282501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43352 (= res!286364 (validMask!0 mask!2352))))

(assert (=> start!43352 e!282501))

(assert (=> start!43352 true))

(assert (=> start!43352 tp_is_empty!13705))

(declare-fun array_inv!10868 (array!31073) Bool)

(assert (=> start!43352 (and (array_inv!10868 _values!1516) e!282500)))

(assert (=> start!43352 tp!42856))

(declare-fun array_inv!10869 (array!31071) Bool)

(assert (=> start!43352 (array_inv!10869 _keys!1874)))

(declare-fun b!480126 () Bool)

(assert (=> b!480126 (= e!282501 (not true))))

(declare-fun lt!217909 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!31071 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!480126 (= lt!217909 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!480126 e!282498))

(declare-fun c!57704 () Bool)

(assert (=> b!480126 (= c!57704 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun minValue!1458 () V!19345)

(declare-datatypes ((Unit!14066 0))(
  ( (Unit!14067) )
))
(declare-fun lt!217908 () Unit!14066)

(declare-fun zeroValue!1458 () V!19345)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!122 (array!31071 array!31073 (_ BitVec 32) (_ BitVec 32) V!19345 V!19345 (_ BitVec 64) Int) Unit!14066)

(assert (=> b!480126 (= lt!217908 (lemmaKeyInListMapIsInArray!122 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun mapIsEmpty!22261 () Bool)

(assert (=> mapIsEmpty!22261 mapRes!22261))

(declare-fun b!480133 () Bool)

(declare-fun res!286363 () Bool)

(assert (=> b!480133 (=> (not res!286363) (not e!282501))))

(declare-datatypes ((List!9167 0))(
  ( (Nil!9164) (Cons!9163 (h!10019 (_ BitVec 64)) (t!15368 List!9167)) )
))
(declare-fun arrayNoDuplicates!0 (array!31071 (_ BitVec 32) List!9167) Bool)

(assert (=> b!480133 (= res!286363 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9164))))

(declare-fun b!480134 () Bool)

(declare-fun res!286366 () Bool)

(assert (=> b!480134 (=> (not res!286366) (not e!282501))))

(declare-datatypes ((tuple2!9102 0))(
  ( (tuple2!9103 (_1!4562 (_ BitVec 64)) (_2!4562 V!19345)) )
))
(declare-datatypes ((List!9168 0))(
  ( (Nil!9165) (Cons!9164 (h!10020 tuple2!9102) (t!15369 List!9168)) )
))
(declare-datatypes ((ListLongMap!8005 0))(
  ( (ListLongMap!8006 (toList!4018 List!9168)) )
))
(declare-fun contains!2595 (ListLongMap!8005 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2271 (array!31071 array!31073 (_ BitVec 32) (_ BitVec 32) V!19345 V!19345 (_ BitVec 32) Int) ListLongMap!8005)

(assert (=> b!480134 (= res!286366 (contains!2595 (getCurrentListMap!2271 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!480135 () Bool)

(assert (=> b!480135 (= e!282496 tp_is_empty!13705)))

(assert (= (and start!43352 res!286364) b!480129))

(assert (= (and b!480129 res!286367) b!480125))

(assert (= (and b!480125 res!286365) b!480133))

(assert (= (and b!480133 res!286363) b!480134))

(assert (= (and b!480134 res!286366) b!480132))

(assert (= (and b!480132 res!286368) b!480126))

(assert (= (and b!480126 c!57704) b!480128))

(assert (= (and b!480126 (not c!57704)) b!480127))

(assert (= (and b!480131 condMapEmpty!22261) mapIsEmpty!22261))

(assert (= (and b!480131 (not condMapEmpty!22261)) mapNonEmpty!22261))

(get-info :version)

(assert (= (and mapNonEmpty!22261 ((_ is ValueCellFull!6491) mapValue!22261)) b!480130))

(assert (= (and b!480131 ((_ is ValueCellFull!6491) mapDefault!22261)) b!480135))

(assert (= start!43352 b!480131))

(declare-fun m!461325 () Bool)

(assert (=> b!480133 m!461325))

(declare-fun m!461327 () Bool)

(assert (=> mapNonEmpty!22261 m!461327))

(declare-fun m!461329 () Bool)

(assert (=> start!43352 m!461329))

(declare-fun m!461331 () Bool)

(assert (=> start!43352 m!461331))

(declare-fun m!461333 () Bool)

(assert (=> start!43352 m!461333))

(declare-fun m!461335 () Bool)

(assert (=> b!480125 m!461335))

(declare-fun m!461337 () Bool)

(assert (=> b!480132 m!461337))

(declare-fun m!461339 () Bool)

(assert (=> b!480128 m!461339))

(declare-fun m!461341 () Bool)

(assert (=> b!480134 m!461341))

(assert (=> b!480134 m!461341))

(declare-fun m!461343 () Bool)

(assert (=> b!480134 m!461343))

(declare-fun m!461345 () Bool)

(assert (=> b!480126 m!461345))

(declare-fun m!461347 () Bool)

(assert (=> b!480126 m!461347))

(check-sat (not b!480133) (not b_next!12193) (not b!480132) b_and!20923 (not b!480125) (not b!480128) (not mapNonEmpty!22261) (not b!480134) (not start!43352) (not b!480126) tp_is_empty!13705)
(check-sat b_and!20923 (not b_next!12193))
