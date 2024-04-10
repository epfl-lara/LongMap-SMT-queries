; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99674 () Bool)

(assert start!99674)

(declare-fun b_free!25253 () Bool)

(declare-fun b_next!25253 () Bool)

(assert (=> start!99674 (= b_free!25253 (not b_next!25253))))

(declare-fun tp!88472 () Bool)

(declare-fun b_and!41373 () Bool)

(assert (=> start!99674 (= tp!88472 b_and!41373)))

(declare-fun mapNonEmpty!46502 () Bool)

(declare-fun mapRes!46502 () Bool)

(declare-fun tp!88473 () Bool)

(declare-fun e!672091 () Bool)

(assert (=> mapNonEmpty!46502 (= mapRes!46502 (and tp!88473 e!672091))))

(declare-datatypes ((V!44837 0))(
  ( (V!44838 (val!14948 Int)) )
))
(declare-datatypes ((ValueCell!14182 0))(
  ( (ValueCellFull!14182 (v!17586 V!44837)) (EmptyCell!14182) )
))
(declare-fun mapValue!46502 () ValueCell!14182)

(declare-fun mapRest!46502 () (Array (_ BitVec 32) ValueCell!14182))

(declare-datatypes ((array!76369 0))(
  ( (array!76370 (arr!36834 (Array (_ BitVec 32) ValueCell!14182)) (size!37370 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76369)

(declare-fun mapKey!46502 () (_ BitVec 32))

(assert (=> mapNonEmpty!46502 (= (arr!36834 _values!996) (store mapRest!46502 mapKey!46502 mapValue!46502))))

(declare-fun b!1182129 () Bool)

(declare-fun res!785607 () Bool)

(declare-fun e!672085 () Bool)

(assert (=> b!1182129 (=> (not res!785607) (not e!672085))))

(declare-datatypes ((array!76371 0))(
  ( (array!76372 (arr!36835 (Array (_ BitVec 32) (_ BitVec 64))) (size!37371 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76371)

(declare-datatypes ((List!25896 0))(
  ( (Nil!25893) (Cons!25892 (h!27101 (_ BitVec 64)) (t!38141 List!25896)) )
))
(declare-fun arrayNoDuplicates!0 (array!76371 (_ BitVec 32) List!25896) Bool)

(assert (=> b!1182129 (= res!785607 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25893))))

(declare-fun b!1182130 () Bool)

(declare-fun e!672092 () Bool)

(declare-fun e!672089 () Bool)

(assert (=> b!1182130 (= e!672092 (and e!672089 mapRes!46502))))

(declare-fun condMapEmpty!46502 () Bool)

(declare-fun mapDefault!46502 () ValueCell!14182)

