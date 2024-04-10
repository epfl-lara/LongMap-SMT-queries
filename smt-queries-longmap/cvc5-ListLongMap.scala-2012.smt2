; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35096 () Bool)

(assert start!35096)

(declare-fun b_free!7741 () Bool)

(declare-fun b_next!7741 () Bool)

(assert (=> start!35096 (= b_free!7741 (not b_next!7741))))

(declare-fun tp!26807 () Bool)

(declare-fun b_and!14975 () Bool)

(assert (=> start!35096 (= tp!26807 b_and!14975)))

(declare-fun b!351759 () Bool)

(declare-fun e!215414 () Bool)

(assert (=> b!351759 (= e!215414 (not true))))

(assert (=> b!351759 false))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((Unit!10868 0))(
  ( (Unit!10869) )
))
(declare-fun lt!164967 () Unit!10868)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((V!11235 0))(
  ( (V!11236 (val!3891 Int)) )
))
(declare-datatypes ((ValueCell!3503 0))(
  ( (ValueCellFull!3503 (v!6080 V!11235)) (EmptyCell!3503) )
))
(declare-datatypes ((array!18975 0))(
  ( (array!18976 (arr!8991 (Array (_ BitVec 32) ValueCell!3503)) (size!9343 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18975)

(declare-datatypes ((array!18977 0))(
  ( (array!18978 (arr!8992 (Array (_ BitVec 32) (_ BitVec 64))) (size!9344 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18977)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11235)

(declare-fun zeroValue!1467 () V!11235)

(declare-fun lemmaArrayContainsKeyThenInListMap!327 (array!18977 array!18975 (_ BitVec 32) (_ BitVec 32) V!11235 V!11235 (_ BitVec 64) (_ BitVec 32) Int) Unit!10868)

(declare-fun arrayScanForKey!0 (array!18977 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!351759 (= lt!164967 (lemmaArrayContainsKeyThenInListMap!327 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(declare-fun b!351760 () Bool)

(declare-fun res!195062 () Bool)

(assert (=> b!351760 (=> (not res!195062) (not e!215414))))

(declare-fun arrayContainsKey!0 (array!18977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!351760 (= res!195062 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!351761 () Bool)

(declare-fun e!215418 () Bool)

(declare-fun tp_is_empty!7693 () Bool)

(assert (=> b!351761 (= e!215418 tp_is_empty!7693)))

(declare-fun res!195061 () Bool)

(declare-fun e!215416 () Bool)

(assert (=> start!35096 (=> (not res!195061) (not e!215416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35096 (= res!195061 (validMask!0 mask!2385))))

(assert (=> start!35096 e!215416))

(assert (=> start!35096 true))

(assert (=> start!35096 tp_is_empty!7693))

(assert (=> start!35096 tp!26807))

(declare-fun e!215415 () Bool)

(declare-fun array_inv!6632 (array!18975) Bool)

(assert (=> start!35096 (and (array_inv!6632 _values!1525) e!215415)))

(declare-fun array_inv!6633 (array!18977) Bool)

(assert (=> start!35096 (array_inv!6633 _keys!1895)))

(declare-fun b!351762 () Bool)

(declare-fun res!195060 () Bool)

(assert (=> b!351762 (=> (not res!195060) (not e!215416))))

(declare-datatypes ((List!5230 0))(
  ( (Nil!5227) (Cons!5226 (h!6082 (_ BitVec 64)) (t!10372 List!5230)) )
))
(declare-fun arrayNoDuplicates!0 (array!18977 (_ BitVec 32) List!5230) Bool)

(assert (=> b!351762 (= res!195060 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5227))))

(declare-fun b!351763 () Bool)

(declare-fun e!215413 () Bool)

(assert (=> b!351763 (= e!215413 tp_is_empty!7693)))

(declare-fun b!351764 () Bool)

(declare-fun res!195063 () Bool)

(assert (=> b!351764 (=> (not res!195063) (not e!215416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18977 (_ BitVec 32)) Bool)

(assert (=> b!351764 (= res!195063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!13017 () Bool)

(declare-fun mapRes!13017 () Bool)

(assert (=> mapIsEmpty!13017 mapRes!13017))

(declare-fun b!351765 () Bool)

(assert (=> b!351765 (= e!215416 e!215414)))

(declare-fun res!195064 () Bool)

(assert (=> b!351765 (=> (not res!195064) (not e!215414))))

(declare-datatypes ((SeekEntryResult!3459 0))(
  ( (MissingZero!3459 (index!16015 (_ BitVec 32))) (Found!3459 (index!16016 (_ BitVec 32))) (Intermediate!3459 (undefined!4271 Bool) (index!16017 (_ BitVec 32)) (x!35007 (_ BitVec 32))) (Undefined!3459) (MissingVacant!3459 (index!16018 (_ BitVec 32))) )
))
(declare-fun lt!164968 () SeekEntryResult!3459)

(assert (=> b!351765 (= res!195064 (and (not (is-Found!3459 lt!164968)) (not (is-MissingZero!3459 lt!164968)) (is-MissingVacant!3459 lt!164968)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18977 (_ BitVec 32)) SeekEntryResult!3459)

(assert (=> b!351765 (= lt!164968 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!351766 () Bool)

(declare-fun res!195065 () Bool)

(assert (=> b!351766 (=> (not res!195065) (not e!215416))))

(assert (=> b!351766 (= res!195065 (and (= (size!9343 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9344 _keys!1895) (size!9343 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13017 () Bool)

(declare-fun tp!26808 () Bool)

(assert (=> mapNonEmpty!13017 (= mapRes!13017 (and tp!26808 e!215413))))

(declare-fun mapKey!13017 () (_ BitVec 32))

(declare-fun mapValue!13017 () ValueCell!3503)

(declare-fun mapRest!13017 () (Array (_ BitVec 32) ValueCell!3503))

(assert (=> mapNonEmpty!13017 (= (arr!8991 _values!1525) (store mapRest!13017 mapKey!13017 mapValue!13017))))

(declare-fun b!351767 () Bool)

(declare-fun res!195059 () Bool)

(assert (=> b!351767 (=> (not res!195059) (not e!215416))))

(declare-datatypes ((tuple2!5610 0))(
  ( (tuple2!5611 (_1!2816 (_ BitVec 64)) (_2!2816 V!11235)) )
))
(declare-datatypes ((List!5231 0))(
  ( (Nil!5228) (Cons!5227 (h!6083 tuple2!5610) (t!10373 List!5231)) )
))
(declare-datatypes ((ListLongMap!4523 0))(
  ( (ListLongMap!4524 (toList!2277 List!5231)) )
))
(declare-fun contains!2348 (ListLongMap!4523 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1798 (array!18977 array!18975 (_ BitVec 32) (_ BitVec 32) V!11235 V!11235 (_ BitVec 32) Int) ListLongMap!4523)

(assert (=> b!351767 (= res!195059 (not (contains!2348 (getCurrentListMap!1798 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!351768 () Bool)

(assert (=> b!351768 (= e!215415 (and e!215418 mapRes!13017))))

(declare-fun condMapEmpty!13017 () Bool)

(declare-fun mapDefault!13017 () ValueCell!3503)

