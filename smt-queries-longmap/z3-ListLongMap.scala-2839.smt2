; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40984 () Bool)

(assert start!40984)

(declare-fun b_free!10933 () Bool)

(declare-fun b_next!10933 () Bool)

(assert (=> start!40984 (= b_free!10933 (not b_next!10933))))

(declare-fun tp!38626 () Bool)

(declare-fun b_and!19049 () Bool)

(assert (=> start!40984 (= tp!38626 b_and!19049)))

(declare-fun b!456368 () Bool)

(declare-fun res!272410 () Bool)

(declare-fun e!266605 () Bool)

(assert (=> b!456368 (=> (not res!272410) (not e!266605))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!28333 0))(
  ( (array!28334 (arr!13610 (Array (_ BitVec 32) (_ BitVec 64))) (size!13963 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28333)

(assert (=> b!456368 (= res!272410 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13963 _keys!709))))))

(declare-fun b!456369 () Bool)

(declare-fun e!266598 () Bool)

(declare-fun e!266604 () Bool)

(assert (=> b!456369 (= e!266598 e!266604)))

(declare-fun res!272411 () Bool)

(assert (=> b!456369 (=> (not res!272411) (not e!266604))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!456369 (= res!272411 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!17467 0))(
  ( (V!17468 (val!6180 Int)) )
))
(declare-fun minValue!515 () V!17467)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17467)

(declare-datatypes ((ValueCell!5792 0))(
  ( (ValueCellFull!5792 (v!8440 V!17467)) (EmptyCell!5792) )
))
(declare-datatypes ((array!28335 0))(
  ( (array!28336 (arr!13611 (Array (_ BitVec 32) ValueCell!5792)) (size!13964 (_ BitVec 32))) )
))
(declare-fun lt!206378 () array!28335)

(declare-fun lt!206381 () array!28333)

(declare-datatypes ((tuple2!8162 0))(
  ( (tuple2!8163 (_1!4092 (_ BitVec 64)) (_2!4092 V!17467)) )
))
(declare-datatypes ((List!8224 0))(
  ( (Nil!8221) (Cons!8220 (h!9076 tuple2!8162) (t!14043 List!8224)) )
))
(declare-datatypes ((ListLongMap!7065 0))(
  ( (ListLongMap!7066 (toList!3548 List!8224)) )
))
(declare-fun lt!206377 () ListLongMap!7065)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1743 (array!28333 array!28335 (_ BitVec 32) (_ BitVec 32) V!17467 V!17467 (_ BitVec 32) Int) ListLongMap!7065)

(assert (=> b!456369 (= lt!206377 (getCurrentListMapNoExtraKeys!1743 lt!206381 lt!206378 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!28335)

(declare-fun v!412 () V!17467)

(assert (=> b!456369 (= lt!206378 (array!28336 (store (arr!13611 _values!549) i!563 (ValueCellFull!5792 v!412)) (size!13964 _values!549)))))

(declare-fun lt!206379 () ListLongMap!7065)

(assert (=> b!456369 (= lt!206379 (getCurrentListMapNoExtraKeys!1743 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!456370 () Bool)

(declare-fun e!266601 () Bool)

(declare-fun tp_is_empty!12271 () Bool)

(assert (=> b!456370 (= e!266601 tp_is_empty!12271)))

(declare-fun b!456371 () Bool)

(assert (=> b!456371 (= e!266605 e!266598)))

(declare-fun res!272401 () Bool)

(assert (=> b!456371 (=> (not res!272401) (not e!266598))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28333 (_ BitVec 32)) Bool)

(assert (=> b!456371 (= res!272401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206381 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!456371 (= lt!206381 (array!28334 (store (arr!13610 _keys!709) i!563 k0!794) (size!13963 _keys!709)))))

(declare-fun b!456372 () Bool)

(declare-fun e!266599 () Bool)

(assert (=> b!456372 (= e!266604 (not e!266599))))

(declare-fun res!272408 () Bool)

(assert (=> b!456372 (=> res!272408 e!266599)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!456372 (= res!272408 (not (validKeyInArray!0 (select (arr!13610 _keys!709) from!863))))))

(declare-fun +!1603 (ListLongMap!7065 tuple2!8162) ListLongMap!7065)

(assert (=> b!456372 (= (getCurrentListMapNoExtraKeys!1743 lt!206381 lt!206378 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1603 (getCurrentListMapNoExtraKeys!1743 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8163 k0!794 v!412)))))

(declare-datatypes ((Unit!13255 0))(
  ( (Unit!13256) )
))
(declare-fun lt!206380 () Unit!13255)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!740 (array!28333 array!28335 (_ BitVec 32) (_ BitVec 32) V!17467 V!17467 (_ BitVec 32) (_ BitVec 64) V!17467 (_ BitVec 32) Int) Unit!13255)

(assert (=> b!456372 (= lt!206380 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!740 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!456373 () Bool)

(declare-fun res!272404 () Bool)

(assert (=> b!456373 (=> (not res!272404) (not e!266605))))

(declare-fun arrayContainsKey!0 (array!28333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!456373 (= res!272404 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!456374 () Bool)

(declare-fun res!272412 () Bool)

(assert (=> b!456374 (=> (not res!272412) (not e!266605))))

(assert (=> b!456374 (= res!272412 (and (= (size!13964 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13963 _keys!709) (size!13964 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!456375 () Bool)

(declare-fun res!272414 () Bool)

(assert (=> b!456375 (=> (not res!272414) (not e!266605))))

(assert (=> b!456375 (= res!272414 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!20047 () Bool)

(declare-fun mapRes!20047 () Bool)

(declare-fun tp!38625 () Bool)

(declare-fun e!266600 () Bool)

(assert (=> mapNonEmpty!20047 (= mapRes!20047 (and tp!38625 e!266600))))

(declare-fun mapRest!20047 () (Array (_ BitVec 32) ValueCell!5792))

(declare-fun mapValue!20047 () ValueCell!5792)

(declare-fun mapKey!20047 () (_ BitVec 32))

(assert (=> mapNonEmpty!20047 (= (arr!13611 _values!549) (store mapRest!20047 mapKey!20047 mapValue!20047))))

(declare-fun b!456376 () Bool)

(declare-fun res!272409 () Bool)

(assert (=> b!456376 (=> (not res!272409) (not e!266598))))

(declare-datatypes ((List!8225 0))(
  ( (Nil!8222) (Cons!8221 (h!9077 (_ BitVec 64)) (t!14044 List!8225)) )
))
(declare-fun arrayNoDuplicates!0 (array!28333 (_ BitVec 32) List!8225) Bool)

(assert (=> b!456376 (= res!272409 (arrayNoDuplicates!0 lt!206381 #b00000000000000000000000000000000 Nil!8222))))

(declare-fun res!272403 () Bool)

(assert (=> start!40984 (=> (not res!272403) (not e!266605))))

(assert (=> start!40984 (= res!272403 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13963 _keys!709))))))

(assert (=> start!40984 e!266605))

(assert (=> start!40984 tp_is_empty!12271))

(assert (=> start!40984 tp!38626))

(assert (=> start!40984 true))

(declare-fun e!266602 () Bool)

(declare-fun array_inv!9918 (array!28335) Bool)

(assert (=> start!40984 (and (array_inv!9918 _values!549) e!266602)))

(declare-fun array_inv!9919 (array!28333) Bool)

(assert (=> start!40984 (array_inv!9919 _keys!709)))

(declare-fun b!456377 () Bool)

(declare-fun res!272413 () Bool)

(assert (=> b!456377 (=> (not res!272413) (not e!266605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!456377 (= res!272413 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!20047 () Bool)

(assert (=> mapIsEmpty!20047 mapRes!20047))

(declare-fun b!456378 () Bool)

(assert (=> b!456378 (= e!266602 (and e!266601 mapRes!20047))))

(declare-fun condMapEmpty!20047 () Bool)

(declare-fun mapDefault!20047 () ValueCell!5792)

(assert (=> b!456378 (= condMapEmpty!20047 (= (arr!13611 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5792)) mapDefault!20047)))))

(declare-fun b!456379 () Bool)

(declare-fun res!272402 () Bool)

(assert (=> b!456379 (=> (not res!272402) (not e!266598))))

(assert (=> b!456379 (= res!272402 (bvsle from!863 i!563))))

(declare-fun b!456380 () Bool)

(assert (=> b!456380 (= e!266599 (bvslt i!563 (size!13964 _values!549)))))

(declare-fun b!456381 () Bool)

(declare-fun res!272407 () Bool)

(assert (=> b!456381 (=> (not res!272407) (not e!266605))))

(assert (=> b!456381 (= res!272407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!456382 () Bool)

(declare-fun res!272406 () Bool)

(assert (=> b!456382 (=> (not res!272406) (not e!266605))))

(assert (=> b!456382 (= res!272406 (or (= (select (arr!13610 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13610 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!456383 () Bool)

(declare-fun res!272405 () Bool)

(assert (=> b!456383 (=> (not res!272405) (not e!266605))))

(assert (=> b!456383 (= res!272405 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8222))))

(declare-fun b!456384 () Bool)

(assert (=> b!456384 (= e!266600 tp_is_empty!12271)))

(assert (= (and start!40984 res!272403) b!456377))

(assert (= (and b!456377 res!272413) b!456374))

(assert (= (and b!456374 res!272412) b!456381))

(assert (= (and b!456381 res!272407) b!456383))

(assert (= (and b!456383 res!272405) b!456368))

(assert (= (and b!456368 res!272410) b!456375))

(assert (= (and b!456375 res!272414) b!456382))

(assert (= (and b!456382 res!272406) b!456373))

(assert (= (and b!456373 res!272404) b!456371))

(assert (= (and b!456371 res!272401) b!456376))

(assert (= (and b!456376 res!272409) b!456379))

(assert (= (and b!456379 res!272402) b!456369))

(assert (= (and b!456369 res!272411) b!456372))

(assert (= (and b!456372 (not res!272408)) b!456380))

(assert (= (and b!456378 condMapEmpty!20047) mapIsEmpty!20047))

(assert (= (and b!456378 (not condMapEmpty!20047)) mapNonEmpty!20047))

(get-info :version)

(assert (= (and mapNonEmpty!20047 ((_ is ValueCellFull!5792) mapValue!20047)) b!456384))

(assert (= (and b!456378 ((_ is ValueCellFull!5792) mapDefault!20047)) b!456370))

(assert (= start!40984 b!456378))

(declare-fun m!439325 () Bool)

(assert (=> b!456382 m!439325))

(declare-fun m!439327 () Bool)

(assert (=> b!456377 m!439327))

(declare-fun m!439329 () Bool)

(assert (=> b!456375 m!439329))

(declare-fun m!439331 () Bool)

(assert (=> b!456369 m!439331))

(declare-fun m!439333 () Bool)

(assert (=> b!456369 m!439333))

(declare-fun m!439335 () Bool)

(assert (=> b!456369 m!439335))

(declare-fun m!439337 () Bool)

(assert (=> b!456376 m!439337))

(declare-fun m!439339 () Bool)

(assert (=> b!456383 m!439339))

(declare-fun m!439341 () Bool)

(assert (=> b!456381 m!439341))

(declare-fun m!439343 () Bool)

(assert (=> b!456371 m!439343))

(declare-fun m!439345 () Bool)

(assert (=> b!456371 m!439345))

(declare-fun m!439347 () Bool)

(assert (=> b!456373 m!439347))

(declare-fun m!439349 () Bool)

(assert (=> start!40984 m!439349))

(declare-fun m!439351 () Bool)

(assert (=> start!40984 m!439351))

(declare-fun m!439353 () Bool)

(assert (=> b!456372 m!439353))

(declare-fun m!439355 () Bool)

(assert (=> b!456372 m!439355))

(declare-fun m!439357 () Bool)

(assert (=> b!456372 m!439357))

(assert (=> b!456372 m!439357))

(declare-fun m!439359 () Bool)

(assert (=> b!456372 m!439359))

(assert (=> b!456372 m!439353))

(declare-fun m!439361 () Bool)

(assert (=> b!456372 m!439361))

(declare-fun m!439363 () Bool)

(assert (=> b!456372 m!439363))

(declare-fun m!439365 () Bool)

(assert (=> mapNonEmpty!20047 m!439365))

(check-sat (not b!456375) (not b!456381) tp_is_empty!12271 (not b!456369) (not b!456371) (not b!456377) (not b!456376) b_and!19049 (not mapNonEmpty!20047) (not start!40984) (not b!456373) (not b!456383) (not b!456372) (not b_next!10933))
(check-sat b_and!19049 (not b_next!10933))
