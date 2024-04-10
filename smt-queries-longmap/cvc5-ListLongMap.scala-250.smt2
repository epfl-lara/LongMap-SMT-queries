; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4182 () Bool)

(assert start!4182)

(declare-fun b_free!1087 () Bool)

(declare-fun b_next!1087 () Bool)

(assert (=> start!4182 (= b_free!1087 (not b_next!1087))))

(declare-fun tp!4680 () Bool)

(declare-fun b_and!1897 () Bool)

(assert (=> start!4182 (= tp!4680 b_and!1897)))

(declare-fun b!31677 () Bool)

(declare-fun e!20215 () Bool)

(declare-fun e!20219 () Bool)

(declare-fun mapRes!1690 () Bool)

(assert (=> b!31677 (= e!20215 (and e!20219 mapRes!1690))))

(declare-fun condMapEmpty!1690 () Bool)

(declare-datatypes ((V!1747 0))(
  ( (V!1748 (val!747 Int)) )
))
(declare-datatypes ((ValueCell!521 0))(
  ( (ValueCellFull!521 (v!1836 V!1747)) (EmptyCell!521) )
))
(declare-datatypes ((array!2099 0))(
  ( (array!2100 (arr!1003 (Array (_ BitVec 32) ValueCell!521)) (size!1104 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2099)

(declare-fun mapDefault!1690 () ValueCell!521)

