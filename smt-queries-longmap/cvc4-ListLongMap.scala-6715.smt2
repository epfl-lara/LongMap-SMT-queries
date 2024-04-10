; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84266 () Bool)

(assert start!84266)

(declare-fun b!985867 () Bool)

(declare-fun e!555731 () Bool)

(declare-fun e!555730 () Bool)

(declare-fun mapRes!36632 () Bool)

(assert (=> b!985867 (= e!555731 (and e!555730 mapRes!36632))))

(declare-fun condMapEmpty!36632 () Bool)

(declare-datatypes ((V!35741 0))(
  ( (V!35742 (val!11585 Int)) )
))
(declare-datatypes ((ValueCell!11053 0))(
  ( (ValueCellFull!11053 (v!14147 V!35741)) (EmptyCell!11053) )
))
(declare-datatypes ((array!62113 0))(
  ( (array!62114 (arr!29914 (Array (_ BitVec 32) ValueCell!11053)) (size!30393 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62113)

(declare-fun mapDefault!36632 () ValueCell!11053)

