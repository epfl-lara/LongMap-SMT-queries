; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41536 () Bool)

(assert start!41536)

(declare-fun b_free!11203 () Bool)

(declare-fun b_next!11203 () Bool)

(assert (=> start!41536 (= b_free!11203 (not b_next!11203))))

(declare-fun tp!39607 () Bool)

(declare-fun b_and!19543 () Bool)

(assert (=> start!41536 (= tp!39607 b_and!19543)))

(declare-fun b!463978 () Bool)

(declare-fun res!277410 () Bool)

(declare-fun e!270969 () Bool)

(assert (=> b!463978 (=> (not res!277410) (not e!270969))))

(declare-datatypes ((array!29051 0))(
  ( (array!29052 (arr!13957 (Array (_ BitVec 32) (_ BitVec 64))) (size!14309 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29051)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29051 (_ BitVec 32)) Bool)

(assert (=> b!463978 (= res!277410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463979 () Bool)

(declare-fun e!270971 () Bool)

(declare-fun e!270970 () Bool)

(declare-fun mapRes!20623 () Bool)

(assert (=> b!463979 (= e!270971 (and e!270970 mapRes!20623))))

(declare-fun condMapEmpty!20623 () Bool)

(declare-datatypes ((V!17947 0))(
  ( (V!17948 (val!6360 Int)) )
))
(declare-datatypes ((ValueCell!5972 0))(
  ( (ValueCellFull!5972 (v!8647 V!17947)) (EmptyCell!5972) )
))
(declare-datatypes ((array!29053 0))(
  ( (array!29054 (arr!13958 (Array (_ BitVec 32) ValueCell!5972)) (size!14310 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29053)

(declare-fun mapDefault!20623 () ValueCell!5972)

