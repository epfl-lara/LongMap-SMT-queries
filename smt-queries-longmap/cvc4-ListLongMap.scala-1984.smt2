; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34792 () Bool)

(assert start!34792)

(declare-fun b_free!7577 () Bool)

(declare-fun b_next!7577 () Bool)

(assert (=> start!34792 (= b_free!7577 (not b_next!7577))))

(declare-fun tp!26298 () Bool)

(declare-fun b_and!14799 () Bool)

(assert (=> start!34792 (= tp!26298 b_and!14799)))

(declare-fun mapNonEmpty!12753 () Bool)

(declare-fun mapRes!12753 () Bool)

(declare-fun tp!26297 () Bool)

(declare-fun e!213284 () Bool)

(assert (=> mapNonEmpty!12753 (= mapRes!12753 (and tp!26297 e!213284))))

(declare-datatypes ((V!11015 0))(
  ( (V!11016 (val!3809 Int)) )
))
(declare-datatypes ((ValueCell!3421 0))(
  ( (ValueCellFull!3421 (v!5992 V!11015)) (EmptyCell!3421) )
))
(declare-fun mapValue!12753 () ValueCell!3421)

(declare-fun mapKey!12753 () (_ BitVec 32))

(declare-datatypes ((array!18645 0))(
  ( (array!18646 (arr!8832 (Array (_ BitVec 32) ValueCell!3421)) (size!9184 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18645)

(declare-fun mapRest!12753 () (Array (_ BitVec 32) ValueCell!3421))

(assert (=> mapNonEmpty!12753 (= (arr!8832 _values!1525) (store mapRest!12753 mapKey!12753 mapValue!12753))))

(declare-fun b!348080 () Bool)

(declare-fun e!213289 () Bool)

(declare-fun e!213286 () Bool)

(assert (=> b!348080 (= e!213289 e!213286)))

(declare-fun res!192756 () Bool)

(assert (=> b!348080 (=> (not res!192756) (not e!213286))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((array!18647 0))(
  ( (array!18648 (arr!8833 (Array (_ BitVec 32) (_ BitVec 64))) (size!9185 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18647)

(declare-datatypes ((SeekEntryResult!3408 0))(
  ( (MissingZero!3408 (index!15811 (_ BitVec 32))) (Found!3408 (index!15812 (_ BitVec 32))) (Intermediate!3408 (undefined!4220 Bool) (index!15813 (_ BitVec 32)) (x!34672 (_ BitVec 32))) (Undefined!3408) (MissingVacant!3408 (index!15814 (_ BitVec 32))) )
))
(declare-fun lt!163810 () SeekEntryResult!3408)

(assert (=> b!348080 (= res!192756 (and (is-Found!3408 lt!163810) (= (select (arr!8833 _keys!1895) (index!15812 lt!163810)) k!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18647 (_ BitVec 32)) SeekEntryResult!3408)

(assert (=> b!348080 (= lt!163810 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!348081 () Bool)

(declare-fun res!192758 () Bool)

(declare-fun e!213287 () Bool)

(assert (=> b!348081 (=> (not res!192758) (not e!213287))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!348081 (= res!192758 (and (= (size!9184 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9185 _keys!1895) (size!9184 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!348082 () Bool)

(declare-fun e!213290 () Bool)

(declare-fun tp_is_empty!7529 () Bool)

(assert (=> b!348082 (= e!213290 tp_is_empty!7529)))

(declare-fun b!348083 () Bool)

(assert (=> b!348083 (= e!213287 e!213289)))

(declare-fun res!192759 () Bool)

(assert (=> b!348083 (=> (not res!192759) (not e!213289))))

(declare-datatypes ((tuple2!5506 0))(
  ( (tuple2!5507 (_1!2764 (_ BitVec 64)) (_2!2764 V!11015)) )
))
(declare-datatypes ((List!5129 0))(
  ( (Nil!5126) (Cons!5125 (h!5981 tuple2!5506) (t!10259 List!5129)) )
))
(declare-datatypes ((ListLongMap!4419 0))(
  ( (ListLongMap!4420 (toList!2225 List!5129)) )
))
(declare-fun lt!163812 () ListLongMap!4419)

(declare-fun contains!2290 (ListLongMap!4419 (_ BitVec 64)) Bool)

(assert (=> b!348083 (= res!192759 (not (contains!2290 lt!163812 k!1348)))))

(declare-fun zeroValue!1467 () V!11015)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11015)

(declare-fun getCurrentListMap!1746 (array!18647 array!18645 (_ BitVec 32) (_ BitVec 32) V!11015 V!11015 (_ BitVec 32) Int) ListLongMap!4419)

(assert (=> b!348083 (= lt!163812 (getCurrentListMap!1746 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun mapIsEmpty!12753 () Bool)

(assert (=> mapIsEmpty!12753 mapRes!12753))

(declare-fun b!348084 () Bool)

(declare-fun res!192757 () Bool)

(assert (=> b!348084 (=> (not res!192757) (not e!213286))))

(declare-fun arrayContainsKey!0 (array!18647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348084 (= res!192757 (arrayContainsKey!0 _keys!1895 k!1348 (index!15812 lt!163810)))))

(declare-fun b!348085 () Bool)

(declare-fun e!213285 () Bool)

(assert (=> b!348085 (= e!213285 (and e!213290 mapRes!12753))))

(declare-fun condMapEmpty!12753 () Bool)

(declare-fun mapDefault!12753 () ValueCell!3421)

