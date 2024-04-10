; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33444 () Bool)

(assert start!33444)

(declare-fun b!331983 () Bool)

(declare-fun res!182905 () Bool)

(declare-fun e!203764 () Bool)

(assert (=> b!331983 (=> (not res!182905) (not e!203764))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!9907 0))(
  ( (V!9908 (val!3393 Int)) )
))
(declare-datatypes ((ValueCell!3005 0))(
  ( (ValueCellFull!3005 (v!5552 V!9907)) (EmptyCell!3005) )
))
(declare-datatypes ((array!16995 0))(
  ( (array!16996 (arr!8032 (Array (_ BitVec 32) ValueCell!3005)) (size!8384 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16995)

(declare-datatypes ((array!16997 0))(
  ( (array!16998 (arr!8033 (Array (_ BitVec 32) (_ BitVec 64))) (size!8385 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16997)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331983 (= res!182905 (and (= (size!8384 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8385 _keys!1895) (size!8384 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!331984 () Bool)

(declare-fun e!203765 () Bool)

(declare-fun e!203763 () Bool)

(declare-fun mapRes!11430 () Bool)

(assert (=> b!331984 (= e!203765 (and e!203763 mapRes!11430))))

(declare-fun condMapEmpty!11430 () Bool)

(declare-fun mapDefault!11430 () ValueCell!3005)

