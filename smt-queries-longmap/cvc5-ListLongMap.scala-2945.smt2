; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41876 () Bool)

(assert start!41876)

(declare-fun b_free!11479 () Bool)

(declare-fun b_next!11479 () Bool)

(assert (=> start!41876 (= b_free!11479 (not b_next!11479))))

(declare-fun tp!40446 () Bool)

(declare-fun b_and!19859 () Bool)

(assert (=> start!41876 (= tp!40446 b_and!19859)))

(declare-fun b!467576 () Bool)

(declare-fun res!279456 () Bool)

(declare-fun e!273531 () Bool)

(assert (=> b!467576 (=> (not res!279456) (not e!273531))))

(declare-datatypes ((array!29589 0))(
  ( (array!29590 (arr!14222 (Array (_ BitVec 32) (_ BitVec 64))) (size!14574 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29589)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29589 (_ BitVec 32)) Bool)

(assert (=> b!467576 (= res!279456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467577 () Bool)

(declare-fun e!273532 () Bool)

(declare-fun tp_is_empty!12907 () Bool)

(assert (=> b!467577 (= e!273532 tp_is_empty!12907)))

(declare-fun mapNonEmpty!21049 () Bool)

(declare-fun mapRes!21049 () Bool)

(declare-fun tp!40447 () Bool)

(assert (=> mapNonEmpty!21049 (= mapRes!21049 (and tp!40447 e!273532))))

(declare-datatypes ((V!18315 0))(
  ( (V!18316 (val!6498 Int)) )
))
(declare-datatypes ((ValueCell!6110 0))(
  ( (ValueCellFull!6110 (v!8787 V!18315)) (EmptyCell!6110) )
))
(declare-fun mapValue!21049 () ValueCell!6110)

(declare-fun mapKey!21049 () (_ BitVec 32))

(declare-fun mapRest!21049 () (Array (_ BitVec 32) ValueCell!6110))

(declare-datatypes ((array!29591 0))(
  ( (array!29592 (arr!14223 (Array (_ BitVec 32) ValueCell!6110)) (size!14575 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29591)

(assert (=> mapNonEmpty!21049 (= (arr!14223 _values!833) (store mapRest!21049 mapKey!21049 mapValue!21049))))

(declare-fun res!279453 () Bool)

(assert (=> start!41876 (=> (not res!279453) (not e!273531))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41876 (= res!279453 (validMask!0 mask!1365))))

(assert (=> start!41876 e!273531))

(assert (=> start!41876 tp_is_empty!12907))

(assert (=> start!41876 tp!40446))

(assert (=> start!41876 true))

(declare-fun array_inv!10264 (array!29589) Bool)

(assert (=> start!41876 (array_inv!10264 _keys!1025)))

(declare-fun e!273534 () Bool)

(declare-fun array_inv!10265 (array!29591) Bool)

(assert (=> start!41876 (and (array_inv!10265 _values!833) e!273534)))

(declare-fun b!467578 () Bool)

(declare-fun e!273530 () Bool)

(assert (=> b!467578 (= e!273534 (and e!273530 mapRes!21049))))

(declare-fun condMapEmpty!21049 () Bool)

(declare-fun mapDefault!21049 () ValueCell!6110)

