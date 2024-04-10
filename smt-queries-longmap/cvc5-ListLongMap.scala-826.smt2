; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20052 () Bool)

(assert start!20052)

(declare-fun mapIsEmpty!7919 () Bool)

(declare-fun mapRes!7919 () Bool)

(assert (=> mapIsEmpty!7919 mapRes!7919))

(declare-fun res!92676 () Bool)

(declare-fun e!129313 () Bool)

(assert (=> start!20052 (=> (not res!92676) (not e!129313))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20052 (= res!92676 (validMask!0 mask!1149))))

(assert (=> start!20052 e!129313))

(assert (=> start!20052 true))

(declare-datatypes ((V!5737 0))(
  ( (V!5738 (val!2328 Int)) )
))
(declare-datatypes ((ValueCell!1940 0))(
  ( (ValueCellFull!1940 (v!4298 V!5737)) (EmptyCell!1940) )
))
(declare-datatypes ((array!8391 0))(
  ( (array!8392 (arr!3946 (Array (_ BitVec 32) ValueCell!1940)) (size!4271 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8391)

(declare-fun e!129310 () Bool)

(declare-fun array_inv!2565 (array!8391) Bool)

(assert (=> start!20052 (and (array_inv!2565 _values!649) e!129310)))

(declare-datatypes ((array!8393 0))(
  ( (array!8394 (arr!3947 (Array (_ BitVec 32) (_ BitVec 64))) (size!4272 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8393)

(declare-fun array_inv!2566 (array!8393) Bool)

(assert (=> start!20052 (array_inv!2566 _keys!825)))

(declare-fun b!196359 () Bool)

(declare-fun e!129314 () Bool)

(declare-fun tp_is_empty!4567 () Bool)

(assert (=> b!196359 (= e!129314 tp_is_empty!4567)))

(declare-fun b!196360 () Bool)

(declare-fun e!129312 () Bool)

(assert (=> b!196360 (= e!129312 tp_is_empty!4567)))

(declare-fun b!196361 () Bool)

(declare-fun res!92677 () Bool)

(assert (=> b!196361 (=> (not res!92677) (not e!129313))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!196361 (= res!92677 (and (= (size!4271 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4272 _keys!825) (size!4271 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!7919 () Bool)

(declare-fun tp!17207 () Bool)

(assert (=> mapNonEmpty!7919 (= mapRes!7919 (and tp!17207 e!129312))))

(declare-fun mapValue!7919 () ValueCell!1940)

(declare-fun mapKey!7919 () (_ BitVec 32))

(declare-fun mapRest!7919 () (Array (_ BitVec 32) ValueCell!1940))

(assert (=> mapNonEmpty!7919 (= (arr!3946 _values!649) (store mapRest!7919 mapKey!7919 mapValue!7919))))

(declare-fun b!196362 () Bool)

(assert (=> b!196362 (= e!129310 (and e!129314 mapRes!7919))))

(declare-fun condMapEmpty!7919 () Bool)

(declare-fun mapDefault!7919 () ValueCell!1940)

