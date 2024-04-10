; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112890 () Bool)

(assert start!112890)

(declare-fun mapIsEmpty!57169 () Bool)

(declare-fun mapRes!57169 () Bool)

(assert (=> mapIsEmpty!57169 mapRes!57169))

(declare-fun b!1338649 () Bool)

(declare-fun e!762272 () Bool)

(declare-fun tp_is_empty!36985 () Bool)

(assert (=> b!1338649 (= e!762272 tp_is_empty!36985)))

(declare-fun res!888160 () Bool)

(declare-fun e!762269 () Bool)

(assert (=> start!112890 (=> (not res!888160) (not e!762269))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112890 (= res!888160 (validMask!0 mask!1977))))

(assert (=> start!112890 e!762269))

(assert (=> start!112890 true))

(declare-datatypes ((V!54417 0))(
  ( (V!54418 (val!18567 Int)) )
))
(declare-datatypes ((ValueCell!17594 0))(
  ( (ValueCellFull!17594 (v!21214 V!54417)) (EmptyCell!17594) )
))
(declare-datatypes ((array!90828 0))(
  ( (array!90829 (arr!43875 (Array (_ BitVec 32) ValueCell!17594)) (size!44425 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90828)

(declare-fun e!762271 () Bool)

(declare-fun array_inv!33087 (array!90828) Bool)

(assert (=> start!112890 (and (array_inv!33087 _values!1303) e!762271)))

(declare-datatypes ((array!90830 0))(
  ( (array!90831 (arr!43876 (Array (_ BitVec 32) (_ BitVec 64))) (size!44426 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90830)

(declare-fun array_inv!33088 (array!90830) Bool)

(assert (=> start!112890 (array_inv!33088 _keys!1571)))

(declare-fun b!1338650 () Bool)

(declare-fun e!762270 () Bool)

(assert (=> b!1338650 (= e!762270 tp_is_empty!36985)))

(declare-fun b!1338651 () Bool)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1338651 (= e!762269 (and (= (size!44425 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44426 _keys!1571) (size!44425 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011) (= (size!44426 _keys!1571) (bvadd #b00000000000000000000000000000001 mask!1977)) (bvsgt #b00000000000000000000000000000000 (size!44426 _keys!1571))))))

(declare-fun b!1338652 () Bool)

(assert (=> b!1338652 (= e!762271 (and e!762270 mapRes!57169))))

(declare-fun condMapEmpty!57169 () Bool)

(declare-fun mapDefault!57169 () ValueCell!17594)

