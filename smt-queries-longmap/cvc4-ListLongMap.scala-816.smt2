; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19952 () Bool)

(assert start!19952)

(declare-fun mapIsEmpty!7820 () Bool)

(declare-fun mapRes!7820 () Bool)

(assert (=> mapIsEmpty!7820 mapRes!7820))

(declare-fun b!195731 () Bool)

(declare-fun e!128799 () Bool)

(declare-fun tp_is_empty!4511 () Bool)

(assert (=> b!195731 (= e!128799 tp_is_empty!4511)))

(declare-fun res!92363 () Bool)

(declare-fun e!128796 () Bool)

(assert (=> start!19952 (=> (not res!92363) (not e!128796))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!19952 (= res!92363 (validMask!0 mask!1149))))

(assert (=> start!19952 e!128796))

(assert (=> start!19952 true))

(declare-datatypes ((V!5661 0))(
  ( (V!5662 (val!2300 Int)) )
))
(declare-datatypes ((ValueCell!1912 0))(
  ( (ValueCellFull!1912 (v!4269 V!5661)) (EmptyCell!1912) )
))
(declare-datatypes ((array!8279 0))(
  ( (array!8280 (arr!3895 (Array (_ BitVec 32) ValueCell!1912)) (size!4220 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8279)

(declare-fun e!128797 () Bool)

(declare-fun array_inv!2529 (array!8279) Bool)

(assert (=> start!19952 (and (array_inv!2529 _values!649) e!128797)))

(declare-datatypes ((array!8281 0))(
  ( (array!8282 (arr!3896 (Array (_ BitVec 32) (_ BitVec 64))) (size!4221 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8281)

(declare-fun array_inv!2530 (array!8281) Bool)

(assert (=> start!19952 (array_inv!2530 _keys!825)))

(declare-fun b!195732 () Bool)

(assert (=> b!195732 (= e!128797 (and e!128799 mapRes!7820))))

(declare-fun condMapEmpty!7820 () Bool)

(declare-fun mapDefault!7820 () ValueCell!1912)

