; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19954 () Bool)

(assert start!19954)

(declare-datatypes ((array!8283 0))(
  ( (array!8284 (arr!3897 (Array (_ BitVec 32) (_ BitVec 64))) (size!4222 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8283)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun b!195743 () Bool)

(declare-datatypes ((V!5665 0))(
  ( (V!5666 (val!2301 Int)) )
))
(declare-datatypes ((ValueCell!1913 0))(
  ( (ValueCellFull!1913 (v!4270 V!5665)) (EmptyCell!1913) )
))
(declare-datatypes ((array!8285 0))(
  ( (array!8286 (arr!3898 (Array (_ BitVec 32) ValueCell!1913)) (size!4223 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8285)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun e!128810 () Bool)

(assert (=> b!195743 (= e!128810 (and (= (size!4223 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4222 _keys!825) (size!4223 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011) (= (size!4222 _keys!825) (bvadd #b00000000000000000000000000000001 mask!1149)) (bvsgt #b00000000000000000000000000000000 (size!4222 _keys!825))))))

(declare-fun res!92366 () Bool)

(assert (=> start!19954 (=> (not res!92366) (not e!128810))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!19954 (= res!92366 (validMask!0 mask!1149))))

(assert (=> start!19954 e!128810))

(assert (=> start!19954 true))

(declare-fun e!128812 () Bool)

(declare-fun array_inv!2531 (array!8285) Bool)

(assert (=> start!19954 (and (array_inv!2531 _values!649) e!128812)))

(declare-fun array_inv!2532 (array!8283) Bool)

(assert (=> start!19954 (array_inv!2532 _keys!825)))

(declare-fun mapNonEmpty!7823 () Bool)

(declare-fun mapRes!7823 () Bool)

(declare-fun tp!17111 () Bool)

(declare-fun e!128813 () Bool)

(assert (=> mapNonEmpty!7823 (= mapRes!7823 (and tp!17111 e!128813))))

(declare-fun mapKey!7823 () (_ BitVec 32))

(declare-fun mapValue!7823 () ValueCell!1913)

(declare-fun mapRest!7823 () (Array (_ BitVec 32) ValueCell!1913))

(assert (=> mapNonEmpty!7823 (= (arr!3898 _values!649) (store mapRest!7823 mapKey!7823 mapValue!7823))))

(declare-fun b!195744 () Bool)

(declare-fun tp_is_empty!4513 () Bool)

(assert (=> b!195744 (= e!128813 tp_is_empty!4513)))

(declare-fun b!195745 () Bool)

(declare-fun e!128811 () Bool)

(assert (=> b!195745 (= e!128812 (and e!128811 mapRes!7823))))

(declare-fun condMapEmpty!7823 () Bool)

(declare-fun mapDefault!7823 () ValueCell!1913)

