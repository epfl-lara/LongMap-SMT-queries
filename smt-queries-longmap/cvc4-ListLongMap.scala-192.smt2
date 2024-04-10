; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3776 () Bool)

(assert start!3776)

(declare-fun b!26378 () Bool)

(declare-fun res!15665 () Bool)

(declare-fun e!17171 () Bool)

(assert (=> b!26378 (=> (not res!15665) (not e!17171))))

(declare-datatypes ((V!1287 0))(
  ( (V!1288 (val!575 Int)) )
))
(declare-datatypes ((ValueCell!349 0))(
  ( (ValueCellFull!349 (v!1661 V!1287)) (EmptyCell!349) )
))
(declare-datatypes ((array!1437 0))(
  ( (array!1438 (arr!676 (Array (_ BitVec 32) ValueCell!349)) (size!777 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1437)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1439 0))(
  ( (array!1440 (arr!677 (Array (_ BitVec 32) (_ BitVec 64))) (size!778 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1439)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!26378 (= res!15665 (and (= (size!777 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!778 _keys!1833) (size!777 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun res!15666 () Bool)

(assert (=> start!3776 (=> (not res!15666) (not e!17171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3776 (= res!15666 (validMask!0 mask!2294))))

(assert (=> start!3776 e!17171))

(assert (=> start!3776 true))

(declare-fun e!17173 () Bool)

(declare-fun array_inv!461 (array!1437) Bool)

(assert (=> start!3776 (and (array_inv!461 _values!1501) e!17173)))

(declare-fun array_inv!462 (array!1439) Bool)

(assert (=> start!3776 (array_inv!462 _keys!1833)))

(declare-fun b!26379 () Bool)

(declare-fun res!15664 () Bool)

(assert (=> b!26379 (=> (not res!15664) (not e!17171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1439 (_ BitVec 32)) Bool)

(assert (=> b!26379 (= res!15664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26380 () Bool)

(declare-fun e!17170 () Bool)

(declare-fun tp_is_empty!1097 () Bool)

(assert (=> b!26380 (= e!17170 tp_is_empty!1097)))

(declare-fun b!26381 () Bool)

(declare-fun mapRes!1162 () Bool)

(assert (=> b!26381 (= e!17173 (and e!17170 mapRes!1162))))

(declare-fun condMapEmpty!1162 () Bool)

(declare-fun mapDefault!1162 () ValueCell!349)

