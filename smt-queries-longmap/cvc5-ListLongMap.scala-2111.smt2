; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35834 () Bool)

(assert start!35834)

(declare-fun mapNonEmpty!13938 () Bool)

(declare-fun mapRes!13938 () Bool)

(declare-fun tp!28005 () Bool)

(declare-fun e!220530 () Bool)

(assert (=> mapNonEmpty!13938 (= mapRes!13938 (and tp!28005 e!220530))))

(declare-fun mapKey!13938 () (_ BitVec 32))

(declare-datatypes ((V!12027 0))(
  ( (V!12028 (val!4188 Int)) )
))
(declare-datatypes ((ValueCell!3800 0))(
  ( (ValueCellFull!3800 (v!6382 V!12027)) (EmptyCell!3800) )
))
(declare-fun mapRest!13938 () (Array (_ BitVec 32) ValueCell!3800))

(declare-datatypes ((array!20127 0))(
  ( (array!20128 (arr!9557 (Array (_ BitVec 32) ValueCell!3800)) (size!9909 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20127)

(declare-fun mapValue!13938 () ValueCell!3800)

(assert (=> mapNonEmpty!13938 (= (arr!9557 _values!1208) (store mapRest!13938 mapKey!13938 mapValue!13938))))

(declare-fun b!360084 () Bool)

(declare-fun res!200198 () Bool)

(declare-fun e!220532 () Bool)

(assert (=> b!360084 (=> (not res!200198) (not e!220532))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360084 (= res!200198 (validKeyInArray!0 k!1077))))

(declare-fun b!360085 () Bool)

(declare-fun e!220528 () Bool)

(declare-fun e!220531 () Bool)

(assert (=> b!360085 (= e!220528 (and e!220531 mapRes!13938))))

(declare-fun condMapEmpty!13938 () Bool)

(declare-fun mapDefault!13938 () ValueCell!3800)

