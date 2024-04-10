; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113430 () Bool)

(assert start!113430)

(declare-fun b_free!31481 () Bool)

(declare-fun b_next!31481 () Bool)

(assert (=> start!113430 (= b_free!31481 (not b_next!31481))))

(declare-fun tp!110247 () Bool)

(declare-fun b_and!50769 () Bool)

(assert (=> start!113430 (= tp!110247 b_and!50769)))

(declare-fun b!1346514 () Bool)

(declare-fun res!893475 () Bool)

(declare-fun e!766169 () Bool)

(assert (=> b!1346514 (=> (not res!893475) (not e!766169))))

(declare-datatypes ((array!91794 0))(
  ( (array!91795 (arr!44353 (Array (_ BitVec 32) (_ BitVec 64))) (size!44903 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91794)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!55077 0))(
  ( (V!55078 (val!18815 Int)) )
))
(declare-datatypes ((ValueCell!17842 0))(
  ( (ValueCellFull!17842 (v!21463 V!55077)) (EmptyCell!17842) )
))
(declare-datatypes ((array!91796 0))(
  ( (array!91797 (arr!44354 (Array (_ BitVec 32) ValueCell!17842)) (size!44904 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91796)

(declare-fun mask!1977 () (_ BitVec 32))

(assert (=> b!1346514 (= res!893475 (and (= (size!44904 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44903 _keys!1571) (size!44904 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57928 () Bool)

(declare-fun mapRes!57928 () Bool)

(declare-fun tp!110248 () Bool)

(declare-fun e!766168 () Bool)

(assert (=> mapNonEmpty!57928 (= mapRes!57928 (and tp!110248 e!766168))))

(declare-fun mapRest!57928 () (Array (_ BitVec 32) ValueCell!17842))

(declare-fun mapKey!57928 () (_ BitVec 32))

(declare-fun mapValue!57928 () ValueCell!17842)

(assert (=> mapNonEmpty!57928 (= (arr!44354 _values!1303) (store mapRest!57928 mapKey!57928 mapValue!57928))))

(declare-fun res!893473 () Bool)

(assert (=> start!113430 (=> (not res!893473) (not e!766169))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113430 (= res!893473 (validMask!0 mask!1977))))

(assert (=> start!113430 e!766169))

(declare-fun tp_is_empty!37481 () Bool)

(assert (=> start!113430 tp_is_empty!37481))

(assert (=> start!113430 true))

(declare-fun array_inv!33413 (array!91794) Bool)

(assert (=> start!113430 (array_inv!33413 _keys!1571)))

(declare-fun e!766167 () Bool)

(declare-fun array_inv!33414 (array!91796) Bool)

(assert (=> start!113430 (and (array_inv!33414 _values!1303) e!766167)))

(assert (=> start!113430 tp!110247))

(declare-fun mapIsEmpty!57928 () Bool)

(assert (=> mapIsEmpty!57928 mapRes!57928))

(declare-fun b!1346515 () Bool)

(declare-fun e!766165 () Bool)

(assert (=> b!1346515 (= e!766167 (and e!766165 mapRes!57928))))

(declare-fun condMapEmpty!57928 () Bool)

(declare-fun mapDefault!57928 () ValueCell!17842)

