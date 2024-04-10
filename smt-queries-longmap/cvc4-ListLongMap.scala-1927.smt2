; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34212 () Bool)

(assert start!34212)

(declare-fun b_free!7235 () Bool)

(declare-fun b_next!7235 () Bool)

(assert (=> start!34212 (= b_free!7235 (not b_next!7235))))

(declare-fun tp!25239 () Bool)

(declare-fun b_and!14435 () Bool)

(assert (=> start!34212 (= tp!25239 b_and!14435)))

(declare-fun b!341221 () Bool)

(declare-fun e!209277 () Bool)

(declare-fun tp_is_empty!7187 () Bool)

(assert (=> b!341221 (= e!209277 tp_is_empty!7187)))

(declare-fun b!341222 () Bool)

(declare-fun res!188595 () Bool)

(declare-fun e!209276 () Bool)

(assert (=> b!341222 (=> (not res!188595) (not e!209276))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10559 0))(
  ( (V!10560 (val!3638 Int)) )
))
(declare-datatypes ((ValueCell!3250 0))(
  ( (ValueCellFull!3250 (v!5810 V!10559)) (EmptyCell!3250) )
))
(declare-datatypes ((array!17969 0))(
  ( (array!17970 (arr!8505 (Array (_ BitVec 32) ValueCell!3250)) (size!8857 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17969)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((array!17971 0))(
  ( (array!17972 (arr!8506 (Array (_ BitVec 32) (_ BitVec 64))) (size!8858 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17971)

(assert (=> b!341222 (= res!188595 (and (= (size!8857 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8858 _keys!1895) (size!8857 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!341223 () Bool)

(declare-fun res!188596 () Bool)

(assert (=> b!341223 (=> (not res!188596) (not e!209276))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10559)

(declare-fun zeroValue!1467 () V!10559)

(declare-datatypes ((tuple2!5276 0))(
  ( (tuple2!5277 (_1!2649 (_ BitVec 64)) (_2!2649 V!10559)) )
))
(declare-datatypes ((List!4894 0))(
  ( (Nil!4891) (Cons!4890 (h!5746 tuple2!5276) (t!10002 List!4894)) )
))
(declare-datatypes ((ListLongMap!4189 0))(
  ( (ListLongMap!4190 (toList!2110 List!4894)) )
))
(declare-fun contains!2164 (ListLongMap!4189 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1631 (array!17971 array!17969 (_ BitVec 32) (_ BitVec 32) V!10559 V!10559 (_ BitVec 32) Int) ListLongMap!4189)

(assert (=> b!341223 (= res!188596 (not (contains!2164 (getCurrentListMap!1631 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!341224 () Bool)

(declare-fun res!188593 () Bool)

(assert (=> b!341224 (=> (not res!188593) (not e!209276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17971 (_ BitVec 32)) Bool)

(assert (=> b!341224 (= res!188593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!341225 () Bool)

(declare-fun e!209280 () Bool)

(declare-fun e!209278 () Bool)

(declare-fun mapRes!12207 () Bool)

(assert (=> b!341225 (= e!209280 (and e!209278 mapRes!12207))))

(declare-fun condMapEmpty!12207 () Bool)

(declare-fun mapDefault!12207 () ValueCell!3250)

