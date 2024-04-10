; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4162 () Bool)

(assert start!4162)

(declare-fun b_free!1067 () Bool)

(declare-fun b_next!1067 () Bool)

(assert (=> start!4162 (= b_free!1067 (not b_next!1067))))

(declare-fun tp!4620 () Bool)

(declare-fun b_and!1877 () Bool)

(assert (=> start!4162 (= tp!4620 b_and!1877)))

(declare-fun mapNonEmpty!1660 () Bool)

(declare-fun mapRes!1660 () Bool)

(declare-fun tp!4621 () Bool)

(declare-fun e!20069 () Bool)

(assert (=> mapNonEmpty!1660 (= mapRes!1660 (and tp!4621 e!20069))))

(declare-datatypes ((V!1719 0))(
  ( (V!1720 (val!737 Int)) )
))
(declare-datatypes ((ValueCell!511 0))(
  ( (ValueCellFull!511 (v!1826 V!1719)) (EmptyCell!511) )
))
(declare-fun mapRest!1660 () (Array (_ BitVec 32) ValueCell!511))

(declare-fun mapKey!1660 () (_ BitVec 32))

(declare-datatypes ((array!2063 0))(
  ( (array!2064 (arr!985 (Array (_ BitVec 32) ValueCell!511)) (size!1086 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2063)

(declare-fun mapValue!1660 () ValueCell!511)

(assert (=> mapNonEmpty!1660 (= (arr!985 _values!1501) (store mapRest!1660 mapKey!1660 mapValue!1660))))

(declare-fun b!31398 () Bool)

(declare-fun e!20065 () Bool)

(declare-fun e!20066 () Bool)

(assert (=> b!31398 (= e!20065 (and e!20066 mapRes!1660))))

(declare-fun condMapEmpty!1660 () Bool)

(declare-fun mapDefault!1660 () ValueCell!511)

