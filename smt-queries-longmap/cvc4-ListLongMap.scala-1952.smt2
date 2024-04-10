; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34462 () Bool)

(assert start!34462)

(declare-fun b_free!7385 () Bool)

(declare-fun b_next!7385 () Bool)

(assert (=> start!34462 (= b_free!7385 (not b_next!7385))))

(declare-fun tp!25700 () Bool)

(declare-fun b_and!14593 () Bool)

(assert (=> start!34462 (= tp!25700 b_and!14593)))

(declare-fun b!344245 () Bool)

(declare-fun res!190356 () Bool)

(declare-fun e!211044 () Bool)

(assert (=> b!344245 (=> (not res!190356) (not e!211044))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10759 0))(
  ( (V!10760 (val!3713 Int)) )
))
(declare-fun zeroValue!1467 () V!10759)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3325 0))(
  ( (ValueCellFull!3325 (v!5889 V!10759)) (EmptyCell!3325) )
))
(declare-datatypes ((array!18265 0))(
  ( (array!18266 (arr!8649 (Array (_ BitVec 32) ValueCell!3325)) (size!9001 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18265)

(declare-datatypes ((array!18267 0))(
  ( (array!18268 (arr!8650 (Array (_ BitVec 32) (_ BitVec 64))) (size!9002 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18267)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10759)

(declare-datatypes ((tuple2!5376 0))(
  ( (tuple2!5377 (_1!2699 (_ BitVec 64)) (_2!2699 V!10759)) )
))
(declare-datatypes ((List!4996 0))(
  ( (Nil!4993) (Cons!4992 (h!5848 tuple2!5376) (t!10112 List!4996)) )
))
(declare-datatypes ((ListLongMap!4289 0))(
  ( (ListLongMap!4290 (toList!2160 List!4996)) )
))
(declare-fun contains!2218 (ListLongMap!4289 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1681 (array!18267 array!18265 (_ BitVec 32) (_ BitVec 32) V!10759 V!10759 (_ BitVec 32) Int) ListLongMap!4289)

(assert (=> b!344245 (= res!190356 (not (contains!2218 (getCurrentListMap!1681 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun mapNonEmpty!12444 () Bool)

(declare-fun mapRes!12444 () Bool)

(declare-fun tp!25701 () Bool)

(declare-fun e!211041 () Bool)

(assert (=> mapNonEmpty!12444 (= mapRes!12444 (and tp!25701 e!211041))))

(declare-fun mapKey!12444 () (_ BitVec 32))

(declare-fun mapValue!12444 () ValueCell!3325)

(declare-fun mapRest!12444 () (Array (_ BitVec 32) ValueCell!3325))

(assert (=> mapNonEmpty!12444 (= (arr!8649 _values!1525) (store mapRest!12444 mapKey!12444 mapValue!12444))))

(declare-fun b!344246 () Bool)

(declare-fun res!190357 () Bool)

(assert (=> b!344246 (=> (not res!190357) (not e!211044))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18267 (_ BitVec 32)) Bool)

(assert (=> b!344246 (= res!190357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344247 () Bool)

(declare-fun res!190359 () Bool)

(assert (=> b!344247 (=> (not res!190359) (not e!211044))))

(assert (=> b!344247 (= res!190359 (and (= (size!9001 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9002 _keys!1895) (size!9001 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344248 () Bool)

(declare-fun res!190361 () Bool)

(assert (=> b!344248 (=> (not res!190361) (not e!211044))))

(declare-datatypes ((List!4997 0))(
  ( (Nil!4994) (Cons!4993 (h!5849 (_ BitVec 64)) (t!10113 List!4997)) )
))
(declare-fun arrayNoDuplicates!0 (array!18267 (_ BitVec 32) List!4997) Bool)

(assert (=> b!344248 (= res!190361 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4994))))

(declare-fun b!344249 () Bool)

(declare-fun tp_is_empty!7337 () Bool)

(assert (=> b!344249 (= e!211041 tp_is_empty!7337)))

(declare-fun b!344250 () Bool)

(declare-fun e!211043 () Bool)

(declare-fun e!211042 () Bool)

(assert (=> b!344250 (= e!211043 (and e!211042 mapRes!12444))))

(declare-fun condMapEmpty!12444 () Bool)

(declare-fun mapDefault!12444 () ValueCell!3325)

