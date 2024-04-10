; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34692 () Bool)

(assert start!34692)

(declare-fun b_free!7499 () Bool)

(declare-fun b_next!7499 () Bool)

(assert (=> start!34692 (= b_free!7499 (not b_next!7499))))

(declare-fun tp!26060 () Bool)

(declare-fun b_and!14719 () Bool)

(assert (=> start!34692 (= tp!26060 b_and!14719)))

(declare-fun b!346649 () Bool)

(declare-fun res!191757 () Bool)

(declare-fun e!212453 () Bool)

(assert (=> b!346649 (=> (not res!191757) (not e!212453))))

(declare-datatypes ((array!18495 0))(
  ( (array!18496 (arr!8758 (Array (_ BitVec 32) (_ BitVec 64))) (size!9110 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18495)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18495 (_ BitVec 32)) Bool)

(assert (=> b!346649 (= res!191757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!191760 () Bool)

(assert (=> start!34692 (=> (not res!191760) (not e!212453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34692 (= res!191760 (validMask!0 mask!2385))))

(assert (=> start!34692 e!212453))

(assert (=> start!34692 true))

(declare-fun tp_is_empty!7451 () Bool)

(assert (=> start!34692 tp_is_empty!7451))

(assert (=> start!34692 tp!26060))

(declare-datatypes ((V!10911 0))(
  ( (V!10912 (val!3770 Int)) )
))
(declare-datatypes ((ValueCell!3382 0))(
  ( (ValueCellFull!3382 (v!5952 V!10911)) (EmptyCell!3382) )
))
(declare-datatypes ((array!18497 0))(
  ( (array!18498 (arr!8759 (Array (_ BitVec 32) ValueCell!3382)) (size!9111 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18497)

(declare-fun e!212449 () Bool)

(declare-fun array_inv!6486 (array!18497) Bool)

(assert (=> start!34692 (and (array_inv!6486 _values!1525) e!212449)))

(declare-fun array_inv!6487 (array!18495) Bool)

(assert (=> start!34692 (array_inv!6487 _keys!1895)))

(declare-fun b!346650 () Bool)

(declare-fun e!212452 () Bool)

(assert (=> b!346650 (= e!212453 e!212452)))

(declare-fun res!191762 () Bool)

(assert (=> b!346650 (=> (not res!191762) (not e!212452))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3378 0))(
  ( (MissingZero!3378 (index!15691 (_ BitVec 32))) (Found!3378 (index!15692 (_ BitVec 32))) (Intermediate!3378 (undefined!4190 Bool) (index!15693 (_ BitVec 32)) (x!34528 (_ BitVec 32))) (Undefined!3378) (MissingVacant!3378 (index!15694 (_ BitVec 32))) )
))
(declare-fun lt!163407 () SeekEntryResult!3378)

(assert (=> b!346650 (= res!191762 (and (is-Found!3378 lt!163407) (= (select (arr!8758 _keys!1895) (index!15692 lt!163407)) k!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18495 (_ BitVec 32)) SeekEntryResult!3378)

(assert (=> b!346650 (= lt!163407 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!346651 () Bool)

(declare-fun res!191759 () Bool)

(assert (=> b!346651 (=> (not res!191759) (not e!212453))))

(declare-datatypes ((List!5077 0))(
  ( (Nil!5074) (Cons!5073 (h!5929 (_ BitVec 64)) (t!10205 List!5077)) )
))
(declare-fun arrayNoDuplicates!0 (array!18495 (_ BitVec 32) List!5077) Bool)

(assert (=> b!346651 (= res!191759 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5074))))

(declare-fun b!346652 () Bool)

(declare-fun e!212454 () Bool)

(assert (=> b!346652 (= e!212454 tp_is_empty!7451)))

(declare-fun b!346653 () Bool)

(declare-fun e!212451 () Bool)

(assert (=> b!346653 (= e!212451 tp_is_empty!7451)))

(declare-fun b!346654 () Bool)

(declare-fun res!191756 () Bool)

(assert (=> b!346654 (=> (not res!191756) (not e!212453))))

(declare-fun zeroValue!1467 () V!10911)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10911)

(declare-datatypes ((tuple2!5454 0))(
  ( (tuple2!5455 (_1!2738 (_ BitVec 64)) (_2!2738 V!10911)) )
))
(declare-datatypes ((List!5078 0))(
  ( (Nil!5075) (Cons!5074 (h!5930 tuple2!5454) (t!10206 List!5078)) )
))
(declare-datatypes ((ListLongMap!4367 0))(
  ( (ListLongMap!4368 (toList!2199 List!5078)) )
))
(declare-fun contains!2263 (ListLongMap!4367 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1720 (array!18495 array!18497 (_ BitVec 32) (_ BitVec 32) V!10911 V!10911 (_ BitVec 32) Int) ListLongMap!4367)

(assert (=> b!346654 (= res!191756 (not (contains!2263 (getCurrentListMap!1720 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!346655 () Bool)

(declare-fun res!191761 () Bool)

(assert (=> b!346655 (=> (not res!191761) (not e!212453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346655 (= res!191761 (validKeyInArray!0 k!1348))))

(declare-fun b!346656 () Bool)

(declare-fun res!191758 () Bool)

(assert (=> b!346656 (=> (not res!191758) (not e!212453))))

(assert (=> b!346656 (= res!191758 (and (= (size!9111 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9110 _keys!1895) (size!9111 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!12633 () Bool)

(declare-fun mapRes!12633 () Bool)

(declare-fun tp!26061 () Bool)

(assert (=> mapNonEmpty!12633 (= mapRes!12633 (and tp!26061 e!212454))))

(declare-fun mapValue!12633 () ValueCell!3382)

(declare-fun mapKey!12633 () (_ BitVec 32))

(declare-fun mapRest!12633 () (Array (_ BitVec 32) ValueCell!3382))

(assert (=> mapNonEmpty!12633 (= (arr!8759 _values!1525) (store mapRest!12633 mapKey!12633 mapValue!12633))))

(declare-fun b!346657 () Bool)

(assert (=> b!346657 (= e!212452 (not true))))

(declare-fun arrayContainsKey!0 (array!18495 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!346657 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10757 0))(
  ( (Unit!10758) )
))
(declare-fun lt!163408 () Unit!10757)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18495 (_ BitVec 64) (_ BitVec 32)) Unit!10757)

(assert (=> b!346657 (= lt!163408 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!15692 lt!163407)))))

(declare-fun b!346658 () Bool)

(assert (=> b!346658 (= e!212449 (and e!212451 mapRes!12633))))

(declare-fun condMapEmpty!12633 () Bool)

(declare-fun mapDefault!12633 () ValueCell!3382)

