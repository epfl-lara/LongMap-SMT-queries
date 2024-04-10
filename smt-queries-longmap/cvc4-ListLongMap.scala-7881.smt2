; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98034 () Bool)

(assert start!98034)

(declare-fun b_free!23735 () Bool)

(declare-fun b_next!23735 () Bool)

(assert (=> start!98034 (= b_free!23735 (not b_next!23735))))

(declare-fun tp!83908 () Bool)

(declare-fun b_and!38253 () Bool)

(assert (=> start!98034 (= tp!83908 b_and!38253)))

(declare-fun b!1125132 () Bool)

(declare-fun res!751810 () Bool)

(declare-fun e!640475 () Bool)

(assert (=> b!1125132 (=> (not res!751810) (not e!640475))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1125132 (= res!751810 (validMask!0 mask!1564))))

(declare-fun b!1125133 () Bool)

(declare-fun e!640477 () Bool)

(declare-fun e!640479 () Bool)

(declare-fun mapRes!44215 () Bool)

(assert (=> b!1125133 (= e!640477 (and e!640479 mapRes!44215))))

(declare-fun condMapEmpty!44215 () Bool)

(declare-datatypes ((V!42813 0))(
  ( (V!42814 (val!14189 Int)) )
))
(declare-datatypes ((ValueCell!13423 0))(
  ( (ValueCellFull!13423 (v!16822 V!42813)) (EmptyCell!13423) )
))
(declare-datatypes ((array!73395 0))(
  ( (array!73396 (arr!35350 (Array (_ BitVec 32) ValueCell!13423)) (size!35886 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73395)

(declare-fun mapDefault!44215 () ValueCell!13423)

