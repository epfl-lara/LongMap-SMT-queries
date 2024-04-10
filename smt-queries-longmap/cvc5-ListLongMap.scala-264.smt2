; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4330 () Bool)

(assert start!4330)

(declare-fun b_free!1171 () Bool)

(declare-fun b_next!1171 () Bool)

(assert (=> start!4330 (= b_free!1171 (not b_next!1171))))

(declare-fun tp!4942 () Bool)

(declare-fun b_and!1987 () Bool)

(assert (=> start!4330 (= tp!4942 b_and!1987)))

(declare-fun mapNonEmpty!1825 () Bool)

(declare-fun mapRes!1825 () Bool)

(declare-fun tp!4941 () Bool)

(declare-fun e!21179 () Bool)

(assert (=> mapNonEmpty!1825 (= mapRes!1825 (and tp!4941 e!21179))))

(declare-datatypes ((V!1859 0))(
  ( (V!1860 (val!789 Int)) )
))
(declare-datatypes ((ValueCell!563 0))(
  ( (ValueCellFull!563 (v!1881 V!1859)) (EmptyCell!563) )
))
(declare-datatypes ((array!2265 0))(
  ( (array!2266 (arr!1083 (Array (_ BitVec 32) ValueCell!563)) (size!1184 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2265)

(declare-fun mapValue!1825 () ValueCell!563)

(declare-fun mapKey!1825 () (_ BitVec 32))

(declare-fun mapRest!1825 () (Array (_ BitVec 32) ValueCell!563))

(assert (=> mapNonEmpty!1825 (= (arr!1083 _values!1501) (store mapRest!1825 mapKey!1825 mapValue!1825))))

(declare-fun b!33342 () Bool)

(declare-fun e!21178 () Bool)

(declare-fun e!21177 () Bool)

(assert (=> b!33342 (= e!21178 (and e!21177 mapRes!1825))))

(declare-fun condMapEmpty!1825 () Bool)

(declare-fun mapDefault!1825 () ValueCell!563)

