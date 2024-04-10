; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3946 () Bool)

(assert start!3946)

(declare-fun b_free!851 () Bool)

(declare-fun b_next!851 () Bool)

(assert (=> start!3946 (= b_free!851 (not b_next!851))))

(declare-fun tp!3972 () Bool)

(declare-fun b_and!1661 () Bool)

(assert (=> start!3946 (= tp!3972 b_and!1661)))

(declare-fun mapNonEmpty!1336 () Bool)

(declare-fun mapRes!1336 () Bool)

(declare-fun tp!3973 () Bool)

(declare-fun e!18230 () Bool)

(assert (=> mapNonEmpty!1336 (= mapRes!1336 (and tp!3973 e!18230))))

(declare-datatypes ((V!1431 0))(
  ( (V!1432 (val!629 Int)) )
))
(declare-datatypes ((ValueCell!403 0))(
  ( (ValueCellFull!403 (v!1718 V!1431)) (EmptyCell!403) )
))
(declare-datatypes ((array!1651 0))(
  ( (array!1652 (arr!779 (Array (_ BitVec 32) ValueCell!403)) (size!880 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1651)

(declare-fun mapValue!1336 () ValueCell!403)

(declare-fun mapRest!1336 () (Array (_ BitVec 32) ValueCell!403))

(declare-fun mapKey!1336 () (_ BitVec 32))

(assert (=> mapNonEmpty!1336 (= (arr!779 _values!1501) (store mapRest!1336 mapKey!1336 mapValue!1336))))

(declare-fun b!28146 () Bool)

(declare-fun e!18233 () Bool)

(declare-fun e!18232 () Bool)

(assert (=> b!28146 (= e!18233 (and e!18232 mapRes!1336))))

(declare-fun condMapEmpty!1336 () Bool)

(declare-fun mapDefault!1336 () ValueCell!403)

