; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34468 () Bool)

(assert start!34468)

(declare-fun b_free!7391 () Bool)

(declare-fun b_next!7391 () Bool)

(assert (=> start!34468 (= b_free!7391 (not b_next!7391))))

(declare-fun tp!25718 () Bool)

(declare-fun b_and!14599 () Bool)

(assert (=> start!34468 (= tp!25718 b_and!14599)))

(declare-fun mapNonEmpty!12453 () Bool)

(declare-fun mapRes!12453 () Bool)

(declare-fun tp!25719 () Bool)

(declare-fun e!211086 () Bool)

(assert (=> mapNonEmpty!12453 (= mapRes!12453 (and tp!25719 e!211086))))

(declare-datatypes ((V!10767 0))(
  ( (V!10768 (val!3716 Int)) )
))
(declare-datatypes ((ValueCell!3328 0))(
  ( (ValueCellFull!3328 (v!5892 V!10767)) (EmptyCell!3328) )
))
(declare-fun mapRest!12453 () (Array (_ BitVec 32) ValueCell!3328))

(declare-datatypes ((array!18277 0))(
  ( (array!18278 (arr!8655 (Array (_ BitVec 32) ValueCell!3328)) (size!9007 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18277)

(declare-fun mapValue!12453 () ValueCell!3328)

(declare-fun mapKey!12453 () (_ BitVec 32))

(assert (=> mapNonEmpty!12453 (= (arr!8655 _values!1525) (store mapRest!12453 mapKey!12453 mapValue!12453))))

(declare-fun b!344326 () Bool)

(declare-fun tp_is_empty!7343 () Bool)

(assert (=> b!344326 (= e!211086 tp_is_empty!7343)))

(declare-fun b!344327 () Bool)

(declare-fun res!190410 () Bool)

(declare-fun e!211087 () Bool)

(assert (=> b!344327 (=> (not res!190410) (not e!211087))))

(declare-datatypes ((array!18279 0))(
  ( (array!18280 (arr!8656 (Array (_ BitVec 32) (_ BitVec 64))) (size!9008 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18279)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18279 (_ BitVec 32)) Bool)

(assert (=> b!344327 (= res!190410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344328 () Bool)

(declare-fun res!190412 () Bool)

(assert (=> b!344328 (=> (not res!190412) (not e!211087))))

(declare-datatypes ((List!5002 0))(
  ( (Nil!4999) (Cons!4998 (h!5854 (_ BitVec 64)) (t!10118 List!5002)) )
))
(declare-fun arrayNoDuplicates!0 (array!18279 (_ BitVec 32) List!5002) Bool)

(assert (=> b!344328 (= res!190412 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4999))))

(declare-fun b!344329 () Bool)

(declare-fun res!190415 () Bool)

(assert (=> b!344329 (=> (not res!190415) (not e!211087))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!344329 (= res!190415 (and (= (size!9007 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9008 _keys!1895) (size!9007 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344330 () Bool)

(declare-fun res!190414 () Bool)

(assert (=> b!344330 (=> (not res!190414) (not e!211087))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10767)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10767)

(declare-datatypes ((tuple2!5382 0))(
  ( (tuple2!5383 (_1!2702 (_ BitVec 64)) (_2!2702 V!10767)) )
))
(declare-datatypes ((List!5003 0))(
  ( (Nil!5000) (Cons!4999 (h!5855 tuple2!5382) (t!10119 List!5003)) )
))
(declare-datatypes ((ListLongMap!4295 0))(
  ( (ListLongMap!4296 (toList!2163 List!5003)) )
))
(declare-fun contains!2221 (ListLongMap!4295 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1684 (array!18279 array!18277 (_ BitVec 32) (_ BitVec 32) V!10767 V!10767 (_ BitVec 32) Int) ListLongMap!4295)

(assert (=> b!344330 (= res!190414 (not (contains!2221 (getCurrentListMap!1684 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!344332 () Bool)

(declare-fun res!190413 () Bool)

(assert (=> b!344332 (=> (not res!190413) (not e!211087))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344332 (= res!190413 (validKeyInArray!0 k!1348))))

(declare-fun b!344333 () Bool)

(declare-fun e!211088 () Bool)

(declare-fun e!211085 () Bool)

(assert (=> b!344333 (= e!211088 (and e!211085 mapRes!12453))))

(declare-fun condMapEmpty!12453 () Bool)

(declare-fun mapDefault!12453 () ValueCell!3328)

