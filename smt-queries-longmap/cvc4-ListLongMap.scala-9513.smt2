; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112906 () Bool)

(assert start!112906)

(declare-fun mapIsEmpty!57187 () Bool)

(declare-fun mapRes!57187 () Bool)

(assert (=> mapIsEmpty!57187 mapRes!57187))

(declare-fun b!1338734 () Bool)

(declare-fun res!888192 () Bool)

(declare-fun e!762353 () Bool)

(assert (=> b!1338734 (=> (not res!888192) (not e!762353))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!90848 0))(
  ( (array!90849 (arr!43884 (Array (_ BitVec 32) (_ BitVec 64))) (size!44434 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90848)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54429 0))(
  ( (V!54430 (val!18572 Int)) )
))
(declare-datatypes ((ValueCell!17599 0))(
  ( (ValueCellFull!17599 (v!21219 V!54429)) (EmptyCell!17599) )
))
(declare-datatypes ((array!90850 0))(
  ( (array!90851 (arr!43885 (Array (_ BitVec 32) ValueCell!17599)) (size!44435 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90850)

(assert (=> b!1338734 (= res!888192 (and (= (size!44435 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44434 _keys!1571) (size!44435 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1338735 () Bool)

(assert (=> b!1338735 (= e!762353 (bvsgt #b00000000000000000000000000000000 (size!44434 _keys!1571)))))

(declare-fun b!1338736 () Bool)

(declare-fun res!888191 () Bool)

(assert (=> b!1338736 (=> (not res!888191) (not e!762353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90848 (_ BitVec 32)) Bool)

(assert (=> b!1338736 (= res!888191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1338737 () Bool)

(declare-fun e!762351 () Bool)

(declare-fun tp_is_empty!36995 () Bool)

(assert (=> b!1338737 (= e!762351 tp_is_empty!36995)))

(declare-fun b!1338738 () Bool)

(declare-fun e!762354 () Bool)

(declare-fun e!762352 () Bool)

(assert (=> b!1338738 (= e!762354 (and e!762352 mapRes!57187))))

(declare-fun condMapEmpty!57187 () Bool)

(declare-fun mapDefault!57187 () ValueCell!17599)

