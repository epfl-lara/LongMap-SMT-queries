; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131870 () Bool)

(assert start!131870)

(declare-fun res!1059167 () Bool)

(declare-fun e!859250 () Bool)

(assert (=> start!131870 (=> (not res!1059167) (not e!859250))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131870 (= res!1059167 (validMask!0 mask!926))))

(assert (=> start!131870 e!859250))

(assert (=> start!131870 true))

(declare-datatypes ((V!58921 0))(
  ( (V!58922 (val!19007 Int)) )
))
(declare-datatypes ((ValueCell!18019 0))(
  ( (ValueCellFull!18019 (v!21808 V!58921)) (EmptyCell!18019) )
))
(declare-datatypes ((array!102936 0))(
  ( (array!102937 (arr!49670 (Array (_ BitVec 32) ValueCell!18019)) (size!50220 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102936)

(declare-fun e!859251 () Bool)

(declare-fun array_inv!38639 (array!102936) Bool)

(assert (=> start!131870 (and (array_inv!38639 _values!470) e!859251)))

(declare-datatypes ((array!102938 0))(
  ( (array!102939 (arr!49671 (Array (_ BitVec 32) (_ BitVec 64))) (size!50221 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102938)

(declare-fun array_inv!38640 (array!102938) Bool)

(assert (=> start!131870 (array_inv!38640 _keys!618)))

(declare-fun b!1543785 () Bool)

(declare-fun e!859253 () Bool)

(declare-fun tp_is_empty!37859 () Bool)

(assert (=> b!1543785 (= e!859253 tp_is_empty!37859)))

(declare-fun b!1543786 () Bool)

(declare-fun res!1059168 () Bool)

(assert (=> b!1543786 (=> (not res!1059168) (not e!859250))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1543786 (= res!1059168 (and (= (size!50220 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50221 _keys!618) (size!50220 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!58492 () Bool)

(declare-fun mapRes!58492 () Bool)

(declare-fun tp!111019 () Bool)

(declare-fun e!859254 () Bool)

(assert (=> mapNonEmpty!58492 (= mapRes!58492 (and tp!111019 e!859254))))

(declare-fun mapKey!58492 () (_ BitVec 32))

(declare-fun mapValue!58492 () ValueCell!18019)

(declare-fun mapRest!58492 () (Array (_ BitVec 32) ValueCell!18019))

(assert (=> mapNonEmpty!58492 (= (arr!49670 _values!470) (store mapRest!58492 mapKey!58492 mapValue!58492))))

(declare-fun b!1543787 () Bool)

(assert (=> b!1543787 (= e!859251 (and e!859253 mapRes!58492))))

(declare-fun condMapEmpty!58492 () Bool)

(declare-fun mapDefault!58492 () ValueCell!18019)

