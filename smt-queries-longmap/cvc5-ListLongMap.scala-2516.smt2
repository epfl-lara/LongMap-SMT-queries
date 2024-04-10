; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38914 () Bool)

(assert start!38914)

(declare-fun b!407015 () Bool)

(declare-fun e!244502 () Bool)

(assert (=> b!407015 (= e!244502 false)))

(declare-fun lt!188579 () Bool)

(declare-datatypes ((array!24549 0))(
  ( (array!24550 (arr!11724 (Array (_ BitVec 32) (_ BitVec 64))) (size!12076 (_ BitVec 32))) )
))
(declare-fun lt!188578 () array!24549)

(declare-datatypes ((List!6804 0))(
  ( (Nil!6801) (Cons!6800 (h!7656 (_ BitVec 64)) (t!11978 List!6804)) )
))
(declare-fun arrayNoDuplicates!0 (array!24549 (_ BitVec 32) List!6804) Bool)

(assert (=> b!407015 (= lt!188579 (arrayNoDuplicates!0 lt!188578 #b00000000000000000000000000000000 Nil!6801))))

(declare-fun mapIsEmpty!17121 () Bool)

(declare-fun mapRes!17121 () Bool)

(assert (=> mapIsEmpty!17121 mapRes!17121))

(declare-fun b!407016 () Bool)

(declare-fun res!235222 () Bool)

(declare-fun e!244505 () Bool)

(assert (=> b!407016 (=> (not res!235222) (not e!244505))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407016 (= res!235222 (validMask!0 mask!1025))))

(declare-fun b!407017 () Bool)

(declare-fun e!244504 () Bool)

(declare-fun tp_is_empty!10333 () Bool)

(assert (=> b!407017 (= e!244504 tp_is_empty!10333)))

(declare-fun mapNonEmpty!17121 () Bool)

(declare-fun tp!33240 () Bool)

(declare-fun e!244506 () Bool)

(assert (=> mapNonEmpty!17121 (= mapRes!17121 (and tp!33240 e!244506))))

(declare-datatypes ((V!14883 0))(
  ( (V!14884 (val!5211 Int)) )
))
(declare-datatypes ((ValueCell!4823 0))(
  ( (ValueCellFull!4823 (v!7458 V!14883)) (EmptyCell!4823) )
))
(declare-datatypes ((array!24551 0))(
  ( (array!24552 (arr!11725 (Array (_ BitVec 32) ValueCell!4823)) (size!12077 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24551)

(declare-fun mapValue!17121 () ValueCell!4823)

(declare-fun mapKey!17121 () (_ BitVec 32))

(declare-fun mapRest!17121 () (Array (_ BitVec 32) ValueCell!4823))

(assert (=> mapNonEmpty!17121 (= (arr!11725 _values!549) (store mapRest!17121 mapKey!17121 mapValue!17121))))

(declare-fun b!407019 () Bool)

(declare-fun res!235218 () Bool)

(assert (=> b!407019 (=> (not res!235218) (not e!244505))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!24549)

(assert (=> b!407019 (= res!235218 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12076 _keys!709))))))

(declare-fun b!407020 () Bool)

(declare-fun e!244501 () Bool)

(assert (=> b!407020 (= e!244501 (and e!244504 mapRes!17121))))

(declare-fun condMapEmpty!17121 () Bool)

(declare-fun mapDefault!17121 () ValueCell!4823)

