; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34456 () Bool)

(assert start!34456)

(declare-fun b_free!7379 () Bool)

(declare-fun b_next!7379 () Bool)

(assert (=> start!34456 (= b_free!7379 (not b_next!7379))))

(declare-fun tp!25682 () Bool)

(declare-fun b_and!14587 () Bool)

(assert (=> start!34456 (= tp!25682 b_and!14587)))

(declare-fun b!344164 () Bool)

(declare-fun res!190304 () Bool)

(declare-fun e!210995 () Bool)

(assert (=> b!344164 (=> (not res!190304) (not e!210995))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344164 (= res!190304 (validKeyInArray!0 k!1348))))

(declare-fun b!344165 () Bool)

(declare-fun e!210996 () Bool)

(declare-fun tp_is_empty!7331 () Bool)

(assert (=> b!344165 (= e!210996 tp_is_empty!7331)))

(declare-fun b!344166 () Bool)

(declare-fun res!190305 () Bool)

(assert (=> b!344166 (=> (not res!190305) (not e!210995))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!18253 0))(
  ( (array!18254 (arr!8643 (Array (_ BitVec 32) (_ BitVec 64))) (size!8995 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18253)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((V!10751 0))(
  ( (V!10752 (val!3710 Int)) )
))
(declare-datatypes ((ValueCell!3322 0))(
  ( (ValueCellFull!3322 (v!5886 V!10751)) (EmptyCell!3322) )
))
(declare-datatypes ((array!18255 0))(
  ( (array!18256 (arr!8644 (Array (_ BitVec 32) ValueCell!3322)) (size!8996 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18255)

(assert (=> b!344166 (= res!190305 (and (= (size!8996 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8995 _keys!1895) (size!8996 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344167 () Bool)

(declare-fun res!190306 () Bool)

(assert (=> b!344167 (=> (not res!190306) (not e!210995))))

(declare-fun zeroValue!1467 () V!10751)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10751)

(declare-datatypes ((tuple2!5370 0))(
  ( (tuple2!5371 (_1!2696 (_ BitVec 64)) (_2!2696 V!10751)) )
))
(declare-datatypes ((List!4992 0))(
  ( (Nil!4989) (Cons!4988 (h!5844 tuple2!5370) (t!10108 List!4992)) )
))
(declare-datatypes ((ListLongMap!4283 0))(
  ( (ListLongMap!4284 (toList!2157 List!4992)) )
))
(declare-fun contains!2215 (ListLongMap!4283 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1678 (array!18253 array!18255 (_ BitVec 32) (_ BitVec 32) V!10751 V!10751 (_ BitVec 32) Int) ListLongMap!4283)

(assert (=> b!344167 (= res!190306 (not (contains!2215 (getCurrentListMap!1678 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun mapIsEmpty!12435 () Bool)

(declare-fun mapRes!12435 () Bool)

(assert (=> mapIsEmpty!12435 mapRes!12435))

(declare-fun b!344168 () Bool)

(declare-fun res!190303 () Bool)

(assert (=> b!344168 (=> (not res!190303) (not e!210995))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18253 (_ BitVec 32)) Bool)

(assert (=> b!344168 (= res!190303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344169 () Bool)

(declare-fun e!210997 () Bool)

(assert (=> b!344169 (= e!210997 (and e!210996 mapRes!12435))))

(declare-fun condMapEmpty!12435 () Bool)

(declare-fun mapDefault!12435 () ValueCell!3322)

