; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!598 () Bool)

(assert start!598)

(declare-fun b_free!71 () Bool)

(declare-fun b_next!71 () Bool)

(assert (=> start!598 (= b_free!71 (not b_next!71))))

(declare-fun tp!431 () Bool)

(declare-fun b_and!209 () Bool)

(assert (=> start!598 (= tp!431 b_and!209)))

(declare-fun b!3679 () Bool)

(declare-fun e!1833 () Bool)

(declare-fun tp_is_empty!149 () Bool)

(assert (=> b!3679 (= e!1833 tp_is_empty!149)))

(declare-fun b!3680 () Bool)

(declare-fun res!5305 () Bool)

(declare-fun e!1832 () Bool)

(assert (=> b!3680 (=> (not res!5305) (not e!1832))))

(declare-datatypes ((array!237 0))(
  ( (array!238 (arr!111 (Array (_ BitVec 32) (_ BitVec 64))) (size!173 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!237)

(declare-datatypes ((List!66 0))(
  ( (Nil!63) (Cons!62 (h!628 (_ BitVec 64)) (t!2193 List!66)) )
))
(declare-fun arrayNoDuplicates!0 (array!237 (_ BitVec 32) List!66) Bool)

(assert (=> b!3680 (= res!5305 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!63))))

(declare-fun res!5308 () Bool)

(assert (=> start!598 (=> (not res!5308) (not e!1832))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!598 (= res!5308 (validMask!0 mask!2250))))

(assert (=> start!598 e!1832))

(assert (=> start!598 tp!431))

(assert (=> start!598 true))

(declare-datatypes ((V!375 0))(
  ( (V!376 (val!80 Int)) )
))
(declare-datatypes ((ValueCell!58 0))(
  ( (ValueCellFull!58 (v!1167 V!375)) (EmptyCell!58) )
))
(declare-datatypes ((array!239 0))(
  ( (array!240 (arr!112 (Array (_ BitVec 32) ValueCell!58)) (size!174 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!239)

(declare-fun e!1835 () Bool)

(declare-fun array_inv!79 (array!239) Bool)

(assert (=> start!598 (and (array_inv!79 _values!1492) e!1835)))

(assert (=> start!598 tp_is_empty!149))

(declare-fun array_inv!80 (array!237) Bool)

(assert (=> start!598 (array_inv!80 _keys!1806)))

(declare-fun mapNonEmpty!182 () Bool)

(declare-fun mapRes!182 () Bool)

(declare-fun tp!430 () Bool)

(assert (=> mapNonEmpty!182 (= mapRes!182 (and tp!430 e!1833))))

(declare-fun mapValue!182 () ValueCell!58)

(declare-fun mapRest!182 () (Array (_ BitVec 32) ValueCell!58))

(declare-fun mapKey!182 () (_ BitVec 32))

(assert (=> mapNonEmpty!182 (= (arr!112 _values!1492) (store mapRest!182 mapKey!182 mapValue!182))))

(declare-fun b!3681 () Bool)

(declare-fun res!5307 () Bool)

(assert (=> b!3681 (=> (not res!5307) (not e!1832))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!237 (_ BitVec 32)) Bool)

(assert (=> b!3681 (= res!5307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!3682 () Bool)

(declare-fun e!1831 () Bool)

(assert (=> b!3682 (= e!1835 (and e!1831 mapRes!182))))

(declare-fun condMapEmpty!182 () Bool)

(declare-fun mapDefault!182 () ValueCell!58)

