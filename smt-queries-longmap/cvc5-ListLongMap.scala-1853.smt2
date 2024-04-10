; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33486 () Bool)

(assert start!33486)

(declare-fun res!183094 () Bool)

(declare-fun e!204077 () Bool)

(assert (=> start!33486 (=> (not res!183094) (not e!204077))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33486 (= res!183094 (validMask!0 mask!2385))))

(assert (=> start!33486 e!204077))

(assert (=> start!33486 true))

(declare-datatypes ((V!9963 0))(
  ( (V!9964 (val!3414 Int)) )
))
(declare-datatypes ((ValueCell!3026 0))(
  ( (ValueCellFull!3026 (v!5573 V!9963)) (EmptyCell!3026) )
))
(declare-datatypes ((array!17073 0))(
  ( (array!17074 (arr!8071 (Array (_ BitVec 32) ValueCell!3026)) (size!8423 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17073)

(declare-fun e!204080 () Bool)

(declare-fun array_inv!6012 (array!17073) Bool)

(assert (=> start!33486 (and (array_inv!6012 _values!1525) e!204080)))

(declare-datatypes ((array!17075 0))(
  ( (array!17076 (arr!8072 (Array (_ BitVec 32) (_ BitVec 64))) (size!8424 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17075)

(declare-fun array_inv!6013 (array!17075) Bool)

(assert (=> start!33486 (array_inv!6013 _keys!1895)))

(declare-fun b!332361 () Bool)

(declare-fun e!204078 () Bool)

(declare-fun tp_is_empty!6739 () Bool)

(assert (=> b!332361 (= e!204078 tp_is_empty!6739)))

(declare-fun mapIsEmpty!11493 () Bool)

(declare-fun mapRes!11493 () Bool)

(assert (=> mapIsEmpty!11493 mapRes!11493))

(declare-fun b!332362 () Bool)

(declare-fun e!204081 () Bool)

(assert (=> b!332362 (= e!204081 tp_is_empty!6739)))

(declare-fun b!332363 () Bool)

(declare-fun res!183093 () Bool)

(assert (=> b!332363 (=> (not res!183093) (not e!204077))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332363 (= res!183093 (and (= (size!8423 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8424 _keys!1895) (size!8423 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!332364 () Bool)

(assert (=> b!332364 (= e!204080 (and e!204078 mapRes!11493))))

(declare-fun condMapEmpty!11493 () Bool)

(declare-fun mapDefault!11493 () ValueCell!3026)

