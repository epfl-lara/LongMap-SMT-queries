; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113124 () Bool)

(assert start!113124)

(declare-fun b_free!31175 () Bool)

(declare-fun b_next!31175 () Bool)

(assert (=> start!113124 (= b_free!31175 (not b_next!31175))))

(declare-fun tp!109330 () Bool)

(declare-fun b_and!50257 () Bool)

(assert (=> start!113124 (= tp!109330 b_and!50257)))

(declare-fun b!1341219 () Bool)

(declare-fun e!763792 () Bool)

(declare-fun tp_is_empty!37175 () Bool)

(assert (=> b!1341219 (= e!763792 tp_is_empty!37175)))

(declare-fun b!1341220 () Bool)

(declare-fun res!889760 () Bool)

(declare-fun e!763790 () Bool)

(assert (=> b!1341220 (=> (not res!889760) (not e!763790))))

(declare-datatypes ((array!91202 0))(
  ( (array!91203 (arr!44057 (Array (_ BitVec 32) (_ BitVec 64))) (size!44607 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91202)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91202 (_ BitVec 32)) Bool)

(assert (=> b!1341220 (= res!889760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapNonEmpty!57469 () Bool)

(declare-fun mapRes!57469 () Bool)

(declare-fun tp!109329 () Bool)

(declare-fun e!763789 () Bool)

(assert (=> mapNonEmpty!57469 (= mapRes!57469 (and tp!109329 e!763789))))

(declare-datatypes ((V!54669 0))(
  ( (V!54670 (val!18662 Int)) )
))
(declare-datatypes ((ValueCell!17689 0))(
  ( (ValueCellFull!17689 (v!21310 V!54669)) (EmptyCell!17689) )
))
(declare-fun mapValue!57469 () ValueCell!17689)

(declare-fun mapKey!57469 () (_ BitVec 32))

(declare-datatypes ((array!91204 0))(
  ( (array!91205 (arr!44058 (Array (_ BitVec 32) ValueCell!17689)) (size!44608 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91204)

(declare-fun mapRest!57469 () (Array (_ BitVec 32) ValueCell!17689))

(assert (=> mapNonEmpty!57469 (= (arr!44058 _values!1303) (store mapRest!57469 mapKey!57469 mapValue!57469))))

(declare-fun b!1341222 () Bool)

(declare-fun res!889762 () Bool)

(assert (=> b!1341222 (=> (not res!889762) (not e!763790))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1341222 (= res!889762 (and (= (size!44608 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44607 _keys!1571) (size!44608 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1341223 () Bool)

(assert (=> b!1341223 (= e!763789 tp_is_empty!37175)))

(declare-fun b!1341224 () Bool)

(declare-fun e!763793 () Bool)

(assert (=> b!1341224 (= e!763793 (and e!763792 mapRes!57469))))

(declare-fun condMapEmpty!57469 () Bool)

(declare-fun mapDefault!57469 () ValueCell!17689)

