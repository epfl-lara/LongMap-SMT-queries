; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113010 () Bool)

(assert start!113010)

(declare-fun b!1339463 () Bool)

(declare-fun res!888570 () Bool)

(declare-fun e!762935 () Bool)

(assert (=> b!1339463 (=> (not res!888570) (not e!762935))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!90978 0))(
  ( (array!90979 (arr!43945 (Array (_ BitVec 32) (_ BitVec 64))) (size!44495 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90978)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54517 0))(
  ( (V!54518 (val!18605 Int)) )
))
(declare-datatypes ((ValueCell!17632 0))(
  ( (ValueCellFull!17632 (v!21253 V!54517)) (EmptyCell!17632) )
))
(declare-datatypes ((array!90980 0))(
  ( (array!90981 (arr!43946 (Array (_ BitVec 32) ValueCell!17632)) (size!44496 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90980)

(assert (=> b!1339463 (= res!888570 (and (= (size!44496 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44495 _keys!1571) (size!44496 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1339464 () Bool)

(declare-fun res!888568 () Bool)

(assert (=> b!1339464 (=> (not res!888568) (not e!762935))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90978 (_ BitVec 32)) Bool)

(assert (=> b!1339464 (= res!888568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339465 () Bool)

(declare-fun e!762934 () Bool)

(declare-fun e!762937 () Bool)

(declare-fun mapRes!57298 () Bool)

(assert (=> b!1339465 (= e!762934 (and e!762937 mapRes!57298))))

(declare-fun condMapEmpty!57298 () Bool)

(declare-fun mapDefault!57298 () ValueCell!17632)

