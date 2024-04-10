; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34534 () Bool)

(assert start!34534)

(declare-fun b_free!7457 () Bool)

(declare-fun b_next!7457 () Bool)

(assert (=> start!34534 (= b_free!7457 (not b_next!7457))))

(declare-fun tp!25917 () Bool)

(declare-fun b_and!14665 () Bool)

(assert (=> start!34534 (= tp!25917 b_and!14665)))

(declare-fun b!345217 () Bool)

(declare-fun res!191009 () Bool)

(declare-fun e!211582 () Bool)

(assert (=> b!345217 (=> (not res!191009) (not e!211582))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10855 0))(
  ( (V!10856 (val!3749 Int)) )
))
(declare-datatypes ((ValueCell!3361 0))(
  ( (ValueCellFull!3361 (v!5925 V!10855)) (EmptyCell!3361) )
))
(declare-datatypes ((array!18401 0))(
  ( (array!18402 (arr!8717 (Array (_ BitVec 32) ValueCell!3361)) (size!9069 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18401)

(declare-datatypes ((array!18403 0))(
  ( (array!18404 (arr!8718 (Array (_ BitVec 32) (_ BitVec 64))) (size!9070 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18403)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!345217 (= res!191009 (and (= (size!9069 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9070 _keys!1895) (size!9069 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!345218 () Bool)

(declare-fun res!191007 () Bool)

(assert (=> b!345218 (=> (not res!191007) (not e!211582))))

(declare-datatypes ((List!5042 0))(
  ( (Nil!5039) (Cons!5038 (h!5894 (_ BitVec 64)) (t!10158 List!5042)) )
))
(declare-fun arrayNoDuplicates!0 (array!18403 (_ BitVec 32) List!5042) Bool)

(assert (=> b!345218 (= res!191007 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5039))))

(declare-fun b!345219 () Bool)

(declare-fun res!191005 () Bool)

(assert (=> b!345219 (=> (not res!191005) (not e!211582))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10855)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10855)

(declare-datatypes ((tuple2!5418 0))(
  ( (tuple2!5419 (_1!2720 (_ BitVec 64)) (_2!2720 V!10855)) )
))
(declare-datatypes ((List!5043 0))(
  ( (Nil!5040) (Cons!5039 (h!5895 tuple2!5418) (t!10159 List!5043)) )
))
(declare-datatypes ((ListLongMap!4331 0))(
  ( (ListLongMap!4332 (toList!2181 List!5043)) )
))
(declare-fun contains!2239 (ListLongMap!4331 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1702 (array!18403 array!18401 (_ BitVec 32) (_ BitVec 32) V!10855 V!10855 (_ BitVec 32) Int) ListLongMap!4331)

(assert (=> b!345219 (= res!191005 (not (contains!2239 (getCurrentListMap!1702 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!345220 () Bool)

(declare-fun res!191006 () Bool)

(assert (=> b!345220 (=> (not res!191006) (not e!211582))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18403 (_ BitVec 32)) Bool)

(assert (=> b!345220 (= res!191006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!191008 () Bool)

(assert (=> start!34534 (=> (not res!191008) (not e!211582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34534 (= res!191008 (validMask!0 mask!2385))))

(assert (=> start!34534 e!211582))

(assert (=> start!34534 true))

(declare-fun tp_is_empty!7409 () Bool)

(assert (=> start!34534 tp_is_empty!7409))

(assert (=> start!34534 tp!25917))

(declare-fun e!211583 () Bool)

(declare-fun array_inv!6450 (array!18401) Bool)

(assert (=> start!34534 (and (array_inv!6450 _values!1525) e!211583)))

(declare-fun array_inv!6451 (array!18403) Bool)

(assert (=> start!34534 (array_inv!6451 _keys!1895)))

(declare-fun b!345221 () Bool)

(declare-fun e!211584 () Bool)

(declare-fun mapRes!12552 () Bool)

(assert (=> b!345221 (= e!211583 (and e!211584 mapRes!12552))))

(declare-fun condMapEmpty!12552 () Bool)

(declare-fun mapDefault!12552 () ValueCell!3361)

