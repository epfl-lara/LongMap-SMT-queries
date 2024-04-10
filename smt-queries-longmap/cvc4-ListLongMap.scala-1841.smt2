; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33374 () Bool)

(assert start!33374)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun b!331607 () Bool)

(declare-datatypes ((V!9871 0))(
  ( (V!9872 (val!3380 Int)) )
))
(declare-datatypes ((ValueCell!2992 0))(
  ( (ValueCellFull!2992 (v!5538 V!9871)) (EmptyCell!2992) )
))
(declare-datatypes ((array!16933 0))(
  ( (array!16934 (arr!8006 (Array (_ BitVec 32) ValueCell!2992)) (size!8358 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16933)

(declare-datatypes ((array!16935 0))(
  ( (array!16936 (arr!8007 (Array (_ BitVec 32) (_ BitVec 64))) (size!8359 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16935)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun e!203473 () Bool)

(assert (=> b!331607 (= e!203473 (and (= (size!8358 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8359 _keys!1895) (size!8358 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011) (= (size!8359 _keys!1895) (bvadd #b00000000000000000000000000000001 mask!2385)) (bvsgt #b00000000000000000000000000000000 (size!8359 _keys!1895))))))

(declare-fun res!182709 () Bool)

(assert (=> start!33374 (=> (not res!182709) (not e!203473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33374 (= res!182709 (validMask!0 mask!2385))))

(assert (=> start!33374 e!203473))

(assert (=> start!33374 true))

(declare-fun e!203476 () Bool)

(declare-fun array_inv!5964 (array!16933) Bool)

(assert (=> start!33374 (and (array_inv!5964 _values!1525) e!203476)))

(declare-fun array_inv!5965 (array!16935) Bool)

(assert (=> start!33374 (array_inv!5965 _keys!1895)))

(declare-fun b!331608 () Bool)

(declare-fun e!203474 () Bool)

(declare-fun tp_is_empty!6671 () Bool)

(assert (=> b!331608 (= e!203474 tp_is_empty!6671)))

(declare-fun b!331609 () Bool)

(declare-fun e!203472 () Bool)

(declare-fun mapRes!11376 () Bool)

(assert (=> b!331609 (= e!203476 (and e!203472 mapRes!11376))))

(declare-fun condMapEmpty!11376 () Bool)

(declare-fun mapDefault!11376 () ValueCell!2992)

