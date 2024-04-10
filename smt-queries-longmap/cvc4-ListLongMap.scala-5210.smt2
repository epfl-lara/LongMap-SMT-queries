; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70296 () Bool)

(assert start!70296)

(declare-fun b_free!12671 () Bool)

(declare-fun b_next!12671 () Bool)

(assert (=> start!70296 (= b_free!12671 (not b_next!12671))))

(declare-fun tp!44737 () Bool)

(declare-fun b_and!21471 () Bool)

(assert (=> start!70296 (= tp!44737 b_and!21471)))

(declare-fun b!816679 () Bool)

(declare-fun res!557556 () Bool)

(declare-fun e!453063 () Bool)

(assert (=> b!816679 (=> (not res!557556) (not e!453063))))

(declare-datatypes ((array!44962 0))(
  ( (array!44963 (arr!21538 (Array (_ BitVec 32) (_ BitVec 64))) (size!21959 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44962)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44962 (_ BitVec 32)) Bool)

(assert (=> b!816679 (= res!557556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816680 () Bool)

(declare-fun e!453059 () Bool)

(declare-fun e!453062 () Bool)

(declare-fun mapRes!23161 () Bool)

(assert (=> b!816680 (= e!453059 (and e!453062 mapRes!23161))))

(declare-fun condMapEmpty!23161 () Bool)

(declare-datatypes ((V!24175 0))(
  ( (V!24176 (val!7238 Int)) )
))
(declare-datatypes ((ValueCell!6775 0))(
  ( (ValueCellFull!6775 (v!9666 V!24175)) (EmptyCell!6775) )
))
(declare-datatypes ((array!44964 0))(
  ( (array!44965 (arr!21539 (Array (_ BitVec 32) ValueCell!6775)) (size!21960 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44964)

(declare-fun mapDefault!23161 () ValueCell!6775)

