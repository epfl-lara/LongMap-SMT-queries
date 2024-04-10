; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4168 () Bool)

(assert start!4168)

(declare-fun b_free!1073 () Bool)

(declare-fun b_next!1073 () Bool)

(assert (=> start!4168 (= b_free!1073 (not b_next!1073))))

(declare-fun tp!4639 () Bool)

(declare-fun b_and!1883 () Bool)

(assert (=> start!4168 (= tp!4639 b_and!1883)))

(declare-fun b!31469 () Bool)

(declare-fun e!20112 () Bool)

(declare-fun e!20110 () Bool)

(declare-fun mapRes!1669 () Bool)

(assert (=> b!31469 (= e!20112 (and e!20110 mapRes!1669))))

(declare-fun condMapEmpty!1669 () Bool)

(declare-datatypes ((V!1727 0))(
  ( (V!1728 (val!740 Int)) )
))
(declare-datatypes ((ValueCell!514 0))(
  ( (ValueCellFull!514 (v!1829 V!1727)) (EmptyCell!514) )
))
(declare-datatypes ((array!2073 0))(
  ( (array!2074 (arr!990 (Array (_ BitVec 32) ValueCell!514)) (size!1091 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2073)

(declare-fun mapDefault!1669 () ValueCell!514)

