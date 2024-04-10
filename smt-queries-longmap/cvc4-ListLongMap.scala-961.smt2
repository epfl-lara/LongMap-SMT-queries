; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20866 () Bool)

(assert start!20866)

(declare-fun b_free!5519 () Bool)

(declare-fun b_next!5519 () Bool)

(assert (=> start!20866 (= b_free!5519 (not b_next!5519))))

(declare-fun tp!19598 () Bool)

(declare-fun b_and!12265 () Bool)

(assert (=> start!20866 (= tp!19598 b_and!12265)))

(declare-fun b!209450 () Bool)

(declare-fun res!102107 () Bool)

(declare-fun e!136453 () Bool)

(assert (=> b!209450 (=> (not res!102107) (not e!136453))))

(declare-datatypes ((array!9959 0))(
  ( (array!9960 (arr!4730 (Array (_ BitVec 32) (_ BitVec 64))) (size!5055 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9959)

(declare-datatypes ((List!3029 0))(
  ( (Nil!3026) (Cons!3025 (h!3667 (_ BitVec 64)) (t!7960 List!3029)) )
))
(declare-fun arrayNoDuplicates!0 (array!9959 (_ BitVec 32) List!3029) Bool)

(assert (=> b!209450 (= res!102107 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3026))))

(declare-fun res!102109 () Bool)

(assert (=> start!20866 (=> (not res!102109) (not e!136453))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20866 (= res!102109 (validMask!0 mask!1149))))

(assert (=> start!20866 e!136453))

(declare-datatypes ((V!6821 0))(
  ( (V!6822 (val!2735 Int)) )
))
(declare-datatypes ((ValueCell!2347 0))(
  ( (ValueCellFull!2347 (v!4705 V!6821)) (EmptyCell!2347) )
))
(declare-datatypes ((array!9961 0))(
  ( (array!9962 (arr!4731 (Array (_ BitVec 32) ValueCell!2347)) (size!5056 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9961)

(declare-fun e!136451 () Bool)

(declare-fun array_inv!3133 (array!9961) Bool)

(assert (=> start!20866 (and (array_inv!3133 _values!649) e!136451)))

(assert (=> start!20866 true))

(declare-fun tp_is_empty!5381 () Bool)

(assert (=> start!20866 tp_is_empty!5381))

(declare-fun array_inv!3134 (array!9959) Bool)

(assert (=> start!20866 (array_inv!3134 _keys!825)))

(assert (=> start!20866 tp!19598))

(declare-fun b!209451 () Bool)

(declare-fun res!102105 () Bool)

(assert (=> b!209451 (=> (not res!102105) (not e!136453))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!209451 (= res!102105 (= (select (arr!4730 _keys!825) i!601) k!843))))

(declare-fun b!209452 () Bool)

(declare-fun e!136454 () Bool)

(assert (=> b!209452 (= e!136454 tp_is_empty!5381)))

(declare-fun b!209453 () Bool)

(declare-fun e!136452 () Bool)

(assert (=> b!209453 (= e!136452 tp_is_empty!5381)))

(declare-fun b!209454 () Bool)

(declare-fun res!102103 () Bool)

(assert (=> b!209454 (=> (not res!102103) (not e!136453))))

(assert (=> b!209454 (= res!102103 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5055 _keys!825))))))

(declare-fun b!209455 () Bool)

(declare-fun res!102104 () Bool)

(assert (=> b!209455 (=> (not res!102104) (not e!136453))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!209455 (= res!102104 (and (= (size!5056 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5055 _keys!825) (size!5056 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!9140 () Bool)

(declare-fun mapRes!9140 () Bool)

(declare-fun tp!19597 () Bool)

(assert (=> mapNonEmpty!9140 (= mapRes!9140 (and tp!19597 e!136454))))

(declare-fun mapKey!9140 () (_ BitVec 32))

(declare-fun mapRest!9140 () (Array (_ BitVec 32) ValueCell!2347))

(declare-fun mapValue!9140 () ValueCell!2347)

(assert (=> mapNonEmpty!9140 (= (arr!4731 _values!649) (store mapRest!9140 mapKey!9140 mapValue!9140))))

(declare-fun b!209456 () Bool)

(assert (=> b!209456 (= e!136451 (and e!136452 mapRes!9140))))

(declare-fun condMapEmpty!9140 () Bool)

(declare-fun mapDefault!9140 () ValueCell!2347)

