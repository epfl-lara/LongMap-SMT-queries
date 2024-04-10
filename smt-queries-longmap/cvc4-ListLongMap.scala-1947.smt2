; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34432 () Bool)

(assert start!34432)

(declare-fun b_free!7355 () Bool)

(declare-fun b_next!7355 () Bool)

(assert (=> start!34432 (= b_free!7355 (not b_next!7355))))

(declare-fun tp!25611 () Bool)

(declare-fun b_and!14563 () Bool)

(assert (=> start!34432 (= tp!25611 b_and!14563)))

(declare-fun mapNonEmpty!12399 () Bool)

(declare-fun mapRes!12399 () Bool)

(declare-fun tp!25610 () Bool)

(declare-fun e!210818 () Bool)

(assert (=> mapNonEmpty!12399 (= mapRes!12399 (and tp!25610 e!210818))))

(declare-fun mapKey!12399 () (_ BitVec 32))

(declare-datatypes ((V!10719 0))(
  ( (V!10720 (val!3698 Int)) )
))
(declare-datatypes ((ValueCell!3310 0))(
  ( (ValueCellFull!3310 (v!5874 V!10719)) (EmptyCell!3310) )
))
(declare-fun mapRest!12399 () (Array (_ BitVec 32) ValueCell!3310))

(declare-datatypes ((array!18207 0))(
  ( (array!18208 (arr!8620 (Array (_ BitVec 32) ValueCell!3310)) (size!8972 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18207)

(declare-fun mapValue!12399 () ValueCell!3310)

(assert (=> mapNonEmpty!12399 (= (arr!8620 _values!1525) (store mapRest!12399 mapKey!12399 mapValue!12399))))

(declare-fun res!190088 () Bool)

(declare-fun e!210819 () Bool)

(assert (=> start!34432 (=> (not res!190088) (not e!210819))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34432 (= res!190088 (validMask!0 mask!2385))))

(assert (=> start!34432 e!210819))

(assert (=> start!34432 true))

(declare-fun tp_is_empty!7307 () Bool)

(assert (=> start!34432 tp_is_empty!7307))

(assert (=> start!34432 tp!25611))

(declare-fun e!210817 () Bool)

(declare-fun array_inv!6388 (array!18207) Bool)

(assert (=> start!34432 (and (array_inv!6388 _values!1525) e!210817)))

(declare-datatypes ((array!18209 0))(
  ( (array!18210 (arr!8621 (Array (_ BitVec 32) (_ BitVec 64))) (size!8973 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18209)

(declare-fun array_inv!6389 (array!18209) Bool)

(assert (=> start!34432 (array_inv!6389 _keys!1895)))

(declare-fun b!343840 () Bool)

(declare-fun res!190086 () Bool)

(assert (=> b!343840 (=> (not res!190086) (not e!210819))))

(declare-datatypes ((List!4975 0))(
  ( (Nil!4972) (Cons!4971 (h!5827 (_ BitVec 64)) (t!10091 List!4975)) )
))
(declare-fun arrayNoDuplicates!0 (array!18209 (_ BitVec 32) List!4975) Bool)

(assert (=> b!343840 (= res!190086 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4972))))

(declare-fun b!343841 () Bool)

(declare-fun res!190091 () Bool)

(assert (=> b!343841 (=> (not res!190091) (not e!210819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18209 (_ BitVec 32)) Bool)

(assert (=> b!343841 (= res!190091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!343842 () Bool)

(assert (=> b!343842 (= e!210818 tp_is_empty!7307)))

(declare-fun mapIsEmpty!12399 () Bool)

(assert (=> mapIsEmpty!12399 mapRes!12399))

(declare-fun b!343843 () Bool)

(declare-fun res!190090 () Bool)

(assert (=> b!343843 (=> (not res!190090) (not e!210819))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343843 (= res!190090 (validKeyInArray!0 k!1348))))

(declare-fun b!343844 () Bool)

(declare-fun res!190087 () Bool)

(assert (=> b!343844 (=> (not res!190087) (not e!210819))))

(declare-fun zeroValue!1467 () V!10719)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10719)

(declare-datatypes ((tuple2!5354 0))(
  ( (tuple2!5355 (_1!2688 (_ BitVec 64)) (_2!2688 V!10719)) )
))
(declare-datatypes ((List!4976 0))(
  ( (Nil!4973) (Cons!4972 (h!5828 tuple2!5354) (t!10092 List!4976)) )
))
(declare-datatypes ((ListLongMap!4267 0))(
  ( (ListLongMap!4268 (toList!2149 List!4976)) )
))
(declare-fun contains!2207 (ListLongMap!4267 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1670 (array!18209 array!18207 (_ BitVec 32) (_ BitVec 32) V!10719 V!10719 (_ BitVec 32) Int) ListLongMap!4267)

(assert (=> b!343844 (= res!190087 (not (contains!2207 (getCurrentListMap!1670 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!343845 () Bool)

(declare-fun res!190089 () Bool)

(assert (=> b!343845 (=> (not res!190089) (not e!210819))))

(assert (=> b!343845 (= res!190089 (and (= (size!8972 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8973 _keys!1895) (size!8972 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!343846 () Bool)

(declare-fun e!210815 () Bool)

(assert (=> b!343846 (= e!210817 (and e!210815 mapRes!12399))))

(declare-fun condMapEmpty!12399 () Bool)

(declare-fun mapDefault!12399 () ValueCell!3310)

