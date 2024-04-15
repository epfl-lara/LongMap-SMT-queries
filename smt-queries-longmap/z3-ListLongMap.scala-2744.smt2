; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40288 () Bool)

(assert start!40288)

(declare-fun b!442283 () Bool)

(declare-fun res!261995 () Bool)

(declare-fun e!260296 () Bool)

(assert (=> b!442283 (=> (not res!261995) (not e!260296))))

(declare-datatypes ((array!27215 0))(
  ( (array!27216 (arr!13056 (Array (_ BitVec 32) (_ BitVec 64))) (size!13409 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27215)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27215 (_ BitVec 32)) Bool)

(assert (=> b!442283 (= res!261995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!442284 () Bool)

(declare-fun e!260293 () Bool)

(declare-fun tp_is_empty!11701 () Bool)

(assert (=> b!442284 (= e!260293 tp_is_empty!11701)))

(declare-fun mapIsEmpty!19176 () Bool)

(declare-fun mapRes!19176 () Bool)

(assert (=> mapIsEmpty!19176 mapRes!19176))

(declare-fun b!442285 () Bool)

(declare-fun e!260292 () Bool)

(assert (=> b!442285 (= e!260292 tp_is_empty!11701)))

(declare-fun res!261993 () Bool)

(assert (=> start!40288 (=> (not res!261993) (not e!260296))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40288 (= res!261993 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13409 _keys!709))))))

(assert (=> start!40288 e!260296))

(assert (=> start!40288 true))

(declare-datatypes ((V!16707 0))(
  ( (V!16708 (val!5895 Int)) )
))
(declare-datatypes ((ValueCell!5507 0))(
  ( (ValueCellFull!5507 (v!8140 V!16707)) (EmptyCell!5507) )
))
(declare-datatypes ((array!27217 0))(
  ( (array!27218 (arr!13057 (Array (_ BitVec 32) ValueCell!5507)) (size!13410 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27217)

(declare-fun e!260295 () Bool)

(declare-fun array_inv!9522 (array!27217) Bool)

(assert (=> start!40288 (and (array_inv!9522 _values!549) e!260295)))

(declare-fun array_inv!9523 (array!27215) Bool)

(assert (=> start!40288 (array_inv!9523 _keys!709)))

(declare-fun b!442286 () Bool)

(declare-fun res!261992 () Bool)

(assert (=> b!442286 (=> (not res!261992) (not e!260296))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!442286 (= res!261992 (and (= (size!13410 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13409 _keys!709) (size!13410 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!442287 () Bool)

(assert (=> b!442287 (= e!260295 (and e!260292 mapRes!19176))))

(declare-fun condMapEmpty!19176 () Bool)

(declare-fun mapDefault!19176 () ValueCell!5507)

(assert (=> b!442287 (= condMapEmpty!19176 (= (arr!13057 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5507)) mapDefault!19176)))))

(declare-fun b!442288 () Bool)

(declare-fun res!261994 () Bool)

(assert (=> b!442288 (=> (not res!261994) (not e!260296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442288 (= res!261994 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!19176 () Bool)

(declare-fun tp!37158 () Bool)

(assert (=> mapNonEmpty!19176 (= mapRes!19176 (and tp!37158 e!260293))))

(declare-fun mapKey!19176 () (_ BitVec 32))

(declare-fun mapRest!19176 () (Array (_ BitVec 32) ValueCell!5507))

(declare-fun mapValue!19176 () ValueCell!5507)

(assert (=> mapNonEmpty!19176 (= (arr!13057 _values!549) (store mapRest!19176 mapKey!19176 mapValue!19176))))

(declare-fun b!442289 () Bool)

(assert (=> b!442289 (= e!260296 false)))

(declare-fun lt!202982 () Bool)

(declare-datatypes ((List!7839 0))(
  ( (Nil!7836) (Cons!7835 (h!8691 (_ BitVec 64)) (t!13588 List!7839)) )
))
(declare-fun arrayNoDuplicates!0 (array!27215 (_ BitVec 32) List!7839) Bool)

(assert (=> b!442289 (= lt!202982 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7836))))

(assert (= (and start!40288 res!261993) b!442288))

(assert (= (and b!442288 res!261994) b!442286))

(assert (= (and b!442286 res!261992) b!442283))

(assert (= (and b!442283 res!261995) b!442289))

(assert (= (and b!442287 condMapEmpty!19176) mapIsEmpty!19176))

(assert (= (and b!442287 (not condMapEmpty!19176)) mapNonEmpty!19176))

(get-info :version)

(assert (= (and mapNonEmpty!19176 ((_ is ValueCellFull!5507) mapValue!19176)) b!442284))

(assert (= (and b!442287 ((_ is ValueCellFull!5507) mapDefault!19176)) b!442285))

(assert (= start!40288 b!442287))

(declare-fun m!428443 () Bool)

(assert (=> b!442283 m!428443))

(declare-fun m!428445 () Bool)

(assert (=> b!442289 m!428445))

(declare-fun m!428447 () Bool)

(assert (=> mapNonEmpty!19176 m!428447))

(declare-fun m!428449 () Bool)

(assert (=> b!442288 m!428449))

(declare-fun m!428451 () Bool)

(assert (=> start!40288 m!428451))

(declare-fun m!428453 () Bool)

(assert (=> start!40288 m!428453))

(check-sat (not start!40288) (not b!442283) (not mapNonEmpty!19176) (not b!442289) tp_is_empty!11701 (not b!442288))
(check-sat)
