; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33682 () Bool)

(assert start!33682)

(declare-fun b_free!6917 () Bool)

(declare-fun b_next!6917 () Bool)

(assert (=> start!33682 (= b_free!6917 (not b_next!6917))))

(declare-fun tp!24255 () Bool)

(declare-fun b_and!14097 () Bool)

(assert (=> start!33682 (= tp!24255 b_and!14097)))

(declare-fun b!334635 () Bool)

(declare-fun res!184520 () Bool)

(declare-fun e!205406 () Bool)

(assert (=> b!334635 (=> (not res!184520) (not e!205406))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334635 (= res!184520 (validKeyInArray!0 k!1348))))

(declare-fun mapIsEmpty!11700 () Bool)

(declare-fun mapRes!11700 () Bool)

(assert (=> mapIsEmpty!11700 mapRes!11700))

(declare-fun b!334636 () Bool)

(declare-fun e!205407 () Bool)

(assert (=> b!334636 (= e!205406 e!205407)))

(declare-fun res!184518 () Bool)

(assert (=> b!334636 (=> (not res!184518) (not e!205407))))

(declare-datatypes ((SeekEntryResult!3168 0))(
  ( (MissingZero!3168 (index!14851 (_ BitVec 32))) (Found!3168 (index!14852 (_ BitVec 32))) (Intermediate!3168 (undefined!3980 Bool) (index!14853 (_ BitVec 32)) (x!33342 (_ BitVec 32))) (Undefined!3168) (MissingVacant!3168 (index!14854 (_ BitVec 32))) )
))
(declare-fun lt!159559 () SeekEntryResult!3168)

(declare-datatypes ((array!17331 0))(
  ( (array!17332 (arr!8196 (Array (_ BitVec 32) (_ BitVec 64))) (size!8548 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17331)

(assert (=> b!334636 (= res!184518 (and (is-Found!3168 lt!159559) (= (select (arr!8196 _keys!1895) (index!14852 lt!159559)) k!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17331 (_ BitVec 32)) SeekEntryResult!3168)

(assert (=> b!334636 (= lt!159559 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!334637 () Bool)

(declare-fun res!184517 () Bool)

(assert (=> b!334637 (=> (not res!184517) (not e!205406))))

(declare-datatypes ((List!4675 0))(
  ( (Nil!4672) (Cons!4671 (h!5527 (_ BitVec 64)) (t!9763 List!4675)) )
))
(declare-fun arrayNoDuplicates!0 (array!17331 (_ BitVec 32) List!4675) Bool)

(assert (=> b!334637 (= res!184517 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4672))))

(declare-fun b!334638 () Bool)

(assert (=> b!334638 (= e!205407 (not true))))

(declare-fun arrayContainsKey!0 (array!17331 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334638 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10409 0))(
  ( (Unit!10410) )
))
(declare-fun lt!159558 () Unit!10409)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17331 (_ BitVec 64) (_ BitVec 32)) Unit!10409)

(assert (=> b!334638 (= lt!159558 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!14852 lt!159559)))))

(declare-fun b!334639 () Bool)

(declare-fun res!184522 () Bool)

(assert (=> b!334639 (=> (not res!184522) (not e!205406))))

(declare-datatypes ((V!10135 0))(
  ( (V!10136 (val!3479 Int)) )
))
(declare-fun zeroValue!1467 () V!10135)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3091 0))(
  ( (ValueCellFull!3091 (v!5641 V!10135)) (EmptyCell!3091) )
))
(declare-datatypes ((array!17333 0))(
  ( (array!17334 (arr!8197 (Array (_ BitVec 32) ValueCell!3091)) (size!8549 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17333)

(declare-fun minValue!1467 () V!10135)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((tuple2!5050 0))(
  ( (tuple2!5051 (_1!2536 (_ BitVec 64)) (_2!2536 V!10135)) )
))
(declare-datatypes ((List!4676 0))(
  ( (Nil!4673) (Cons!4672 (h!5528 tuple2!5050) (t!9764 List!4676)) )
))
(declare-datatypes ((ListLongMap!3963 0))(
  ( (ListLongMap!3964 (toList!1997 List!4676)) )
))
(declare-fun contains!2041 (ListLongMap!3963 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1525 (array!17331 array!17333 (_ BitVec 32) (_ BitVec 32) V!10135 V!10135 (_ BitVec 32) Int) ListLongMap!3963)

(assert (=> b!334639 (= res!184522 (not (contains!2041 (getCurrentListMap!1525 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun res!184521 () Bool)

(assert (=> start!33682 (=> (not res!184521) (not e!205406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33682 (= res!184521 (validMask!0 mask!2385))))

(assert (=> start!33682 e!205406))

(assert (=> start!33682 true))

(declare-fun tp_is_empty!6869 () Bool)

(assert (=> start!33682 tp_is_empty!6869))

(assert (=> start!33682 tp!24255))

(declare-fun e!205404 () Bool)

(declare-fun array_inv!6092 (array!17333) Bool)

(assert (=> start!33682 (and (array_inv!6092 _values!1525) e!205404)))

(declare-fun array_inv!6093 (array!17331) Bool)

(assert (=> start!33682 (array_inv!6093 _keys!1895)))

(declare-fun b!334640 () Bool)

(declare-fun e!205405 () Bool)

(assert (=> b!334640 (= e!205405 tp_is_empty!6869)))

(declare-fun mapNonEmpty!11700 () Bool)

(declare-fun tp!24254 () Bool)

(assert (=> mapNonEmpty!11700 (= mapRes!11700 (and tp!24254 e!205405))))

(declare-fun mapValue!11700 () ValueCell!3091)

(declare-fun mapRest!11700 () (Array (_ BitVec 32) ValueCell!3091))

(declare-fun mapKey!11700 () (_ BitVec 32))

(assert (=> mapNonEmpty!11700 (= (arr!8197 _values!1525) (store mapRest!11700 mapKey!11700 mapValue!11700))))

(declare-fun b!334641 () Bool)

(declare-fun res!184519 () Bool)

(assert (=> b!334641 (=> (not res!184519) (not e!205406))))

(assert (=> b!334641 (= res!184519 (and (= (size!8549 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8548 _keys!1895) (size!8549 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334642 () Bool)

(declare-fun e!205403 () Bool)

(assert (=> b!334642 (= e!205403 tp_is_empty!6869)))

(declare-fun b!334643 () Bool)

(declare-fun res!184523 () Bool)

(assert (=> b!334643 (=> (not res!184523) (not e!205406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17331 (_ BitVec 32)) Bool)

(assert (=> b!334643 (= res!184523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!334644 () Bool)

(assert (=> b!334644 (= e!205404 (and e!205403 mapRes!11700))))

(declare-fun condMapEmpty!11700 () Bool)

(declare-fun mapDefault!11700 () ValueCell!3091)

