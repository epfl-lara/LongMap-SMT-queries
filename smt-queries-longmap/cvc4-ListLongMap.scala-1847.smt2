; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33454 () Bool)

(assert start!33454)

(declare-fun b!332073 () Bool)

(declare-fun res!182949 () Bool)

(declare-fun e!203837 () Bool)

(assert (=> b!332073 (=> (not res!182949) (not e!203837))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!9919 0))(
  ( (V!9920 (val!3398 Int)) )
))
(declare-datatypes ((ValueCell!3010 0))(
  ( (ValueCellFull!3010 (v!5557 V!9919)) (EmptyCell!3010) )
))
(declare-datatypes ((array!17011 0))(
  ( (array!17012 (arr!8040 (Array (_ BitVec 32) ValueCell!3010)) (size!8392 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17011)

(declare-datatypes ((array!17013 0))(
  ( (array!17014 (arr!8041 (Array (_ BitVec 32) (_ BitVec 64))) (size!8393 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17013)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332073 (= res!182949 (and (= (size!8392 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8393 _keys!1895) (size!8392 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!332074 () Bool)

(declare-fun e!203840 () Bool)

(declare-fun e!203839 () Bool)

(declare-fun mapRes!11445 () Bool)

(assert (=> b!332074 (= e!203840 (and e!203839 mapRes!11445))))

(declare-fun condMapEmpty!11445 () Bool)

(declare-fun mapDefault!11445 () ValueCell!3010)

