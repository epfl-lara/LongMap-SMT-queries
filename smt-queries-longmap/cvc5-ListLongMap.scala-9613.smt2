; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113706 () Bool)

(assert start!113706)

(declare-fun b_free!31591 () Bool)

(declare-fun b_next!31591 () Bool)

(assert (=> start!113706 (= b_free!31591 (not b_next!31591))))

(declare-fun tp!110592 () Bool)

(declare-fun b_and!50989 () Bool)

(assert (=> start!113706 (= tp!110592 b_and!50989)))

(declare-fun b!1349572 () Bool)

(declare-fun e!767713 () Bool)

(declare-fun tp_is_empty!37591 () Bool)

(assert (=> b!1349572 (= e!767713 tp_is_empty!37591)))

(declare-fun res!895320 () Bool)

(declare-fun e!767709 () Bool)

(assert (=> start!113706 (=> (not res!895320) (not e!767709))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113706 (= res!895320 (validMask!0 mask!1977))))

(assert (=> start!113706 e!767709))

(assert (=> start!113706 tp_is_empty!37591))

(assert (=> start!113706 true))

(declare-datatypes ((array!92014 0))(
  ( (array!92015 (arr!44459 (Array (_ BitVec 32) (_ BitVec 64))) (size!45009 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!92014)

(declare-fun array_inv!33489 (array!92014) Bool)

(assert (=> start!113706 (array_inv!33489 _keys!1571)))

(declare-datatypes ((V!55225 0))(
  ( (V!55226 (val!18870 Int)) )
))
(declare-datatypes ((ValueCell!17897 0))(
  ( (ValueCellFull!17897 (v!21526 V!55225)) (EmptyCell!17897) )
))
(declare-datatypes ((array!92016 0))(
  ( (array!92017 (arr!44460 (Array (_ BitVec 32) ValueCell!17897)) (size!45010 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!92016)

(declare-fun e!767712 () Bool)

(declare-fun array_inv!33490 (array!92016) Bool)

(assert (=> start!113706 (and (array_inv!33490 _values!1303) e!767712)))

(assert (=> start!113706 tp!110592))

(declare-fun b!1349573 () Bool)

(declare-fun e!767711 () Bool)

(declare-fun mapRes!58107 () Bool)

(assert (=> b!1349573 (= e!767712 (and e!767711 mapRes!58107))))

(declare-fun condMapEmpty!58107 () Bool)

(declare-fun mapDefault!58107 () ValueCell!17897)

