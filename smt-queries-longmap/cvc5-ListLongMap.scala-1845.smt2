; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33426 () Bool)

(assert start!33426)

(declare-fun b!331874 () Bool)

(declare-fun res!182838 () Bool)

(declare-fun e!203683 () Bool)

(assert (=> b!331874 (=> (not res!182838) (not e!203683))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!9899 0))(
  ( (V!9900 (val!3390 Int)) )
))
(declare-datatypes ((ValueCell!3002 0))(
  ( (ValueCellFull!3002 (v!5548 V!9899)) (EmptyCell!3002) )
))
(declare-datatypes ((array!16981 0))(
  ( (array!16982 (arr!8026 (Array (_ BitVec 32) ValueCell!3002)) (size!8378 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16981)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((array!16983 0))(
  ( (array!16984 (arr!8027 (Array (_ BitVec 32) (_ BitVec 64))) (size!8379 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16983)

(assert (=> b!331874 (= res!182838 (and (= (size!8378 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8379 _keys!1895) (size!8378 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!182840 () Bool)

(assert (=> start!33426 (=> (not res!182840) (not e!203683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33426 (= res!182840 (validMask!0 mask!2385))))

(assert (=> start!33426 e!203683))

(assert (=> start!33426 true))

(declare-fun e!203684 () Bool)

(declare-fun array_inv!5980 (array!16981) Bool)

(assert (=> start!33426 (and (array_inv!5980 _values!1525) e!203684)))

(declare-fun array_inv!5981 (array!16983) Bool)

(assert (=> start!33426 (array_inv!5981 _keys!1895)))

(declare-fun b!331875 () Bool)

(declare-fun e!203681 () Bool)

(declare-fun mapRes!11418 () Bool)

(assert (=> b!331875 (= e!203684 (and e!203681 mapRes!11418))))

(declare-fun condMapEmpty!11418 () Bool)

(declare-fun mapDefault!11418 () ValueCell!3002)

