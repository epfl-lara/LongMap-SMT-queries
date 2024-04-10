; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113680 () Bool)

(assert start!113680)

(declare-fun b_free!31589 () Bool)

(declare-fun b_next!31589 () Bool)

(assert (=> start!113680 (= b_free!31589 (not b_next!31589))))

(declare-fun tp!110582 () Bool)

(declare-fun b_and!50977 () Bool)

(assert (=> start!113680 (= tp!110582 b_and!50977)))

(declare-fun b!1349349 () Bool)

(declare-fun res!895215 () Bool)

(declare-fun e!767580 () Bool)

(assert (=> b!1349349 (=> (not res!895215) (not e!767580))))

(declare-datatypes ((V!55221 0))(
  ( (V!55222 (val!18869 Int)) )
))
(declare-fun minValue!1245 () V!55221)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!92008 0))(
  ( (array!92009 (arr!44457 (Array (_ BitVec 32) (_ BitVec 64))) (size!45007 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!92008)

(declare-fun zeroValue!1245 () V!55221)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((ValueCell!17896 0))(
  ( (ValueCellFull!17896 (v!21524 V!55221)) (EmptyCell!17896) )
))
(declare-datatypes ((array!92010 0))(
  ( (array!92011 (arr!44458 (Array (_ BitVec 32) ValueCell!17896)) (size!45008 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!92010)

(declare-datatypes ((tuple2!24336 0))(
  ( (tuple2!24337 (_1!12179 (_ BitVec 64)) (_2!12179 V!55221)) )
))
(declare-datatypes ((List!31488 0))(
  ( (Nil!31485) (Cons!31484 (h!32693 tuple2!24336) (t!46144 List!31488)) )
))
(declare-datatypes ((ListLongMap!21993 0))(
  ( (ListLongMap!21994 (toList!11012 List!31488)) )
))
(declare-fun contains!9194 (ListLongMap!21993 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5960 (array!92008 array!92010 (_ BitVec 32) (_ BitVec 32) V!55221 V!55221 (_ BitVec 32) Int) ListLongMap!21993)

(assert (=> b!1349349 (= res!895215 (contains!9194 (getCurrentListMap!5960 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun res!895220 () Bool)

(assert (=> start!113680 (=> (not res!895220) (not e!767580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113680 (= res!895220 (validMask!0 mask!1977))))

(assert (=> start!113680 e!767580))

(declare-fun tp_is_empty!37589 () Bool)

(assert (=> start!113680 tp_is_empty!37589))

(assert (=> start!113680 true))

(declare-fun array_inv!33487 (array!92008) Bool)

(assert (=> start!113680 (array_inv!33487 _keys!1571)))

(declare-fun e!767576 () Bool)

(declare-fun array_inv!33488 (array!92010) Bool)

(assert (=> start!113680 (and (array_inv!33488 _values!1303) e!767576)))

(assert (=> start!113680 tp!110582))

(declare-fun b!1349350 () Bool)

(declare-fun res!895221 () Bool)

(assert (=> b!1349350 (=> (not res!895221) (not e!767580))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1349350 (= res!895221 (validKeyInArray!0 (select (arr!44457 _keys!1571) from!1960)))))

(declare-fun b!1349351 () Bool)

(declare-fun e!767575 () Bool)

(declare-fun mapRes!58101 () Bool)

(assert (=> b!1349351 (= e!767576 (and e!767575 mapRes!58101))))

(declare-fun condMapEmpty!58101 () Bool)

(declare-fun mapDefault!58101 () ValueCell!17896)

