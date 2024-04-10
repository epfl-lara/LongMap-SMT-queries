; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112934 () Bool)

(assert start!112934)

(declare-fun mapNonEmpty!57211 () Bool)

(declare-fun mapRes!57211 () Bool)

(declare-fun tp!108910 () Bool)

(declare-fun e!762470 () Bool)

(assert (=> mapNonEmpty!57211 (= mapRes!57211 (and tp!108910 e!762470))))

(declare-fun mapKey!57211 () (_ BitVec 32))

(declare-datatypes ((V!54445 0))(
  ( (V!54446 (val!18578 Int)) )
))
(declare-datatypes ((ValueCell!17605 0))(
  ( (ValueCellFull!17605 (v!21225 V!54445)) (EmptyCell!17605) )
))
(declare-fun mapRest!57211 () (Array (_ BitVec 32) ValueCell!17605))

(declare-fun mapValue!57211 () ValueCell!17605)

(declare-datatypes ((array!90876 0))(
  ( (array!90877 (arr!43896 (Array (_ BitVec 32) ValueCell!17605)) (size!44446 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90876)

(assert (=> mapNonEmpty!57211 (= (arr!43896 _values!1303) (store mapRest!57211 mapKey!57211 mapValue!57211))))

(declare-fun b!1338889 () Bool)

(declare-fun res!888268 () Bool)

(declare-fun e!762474 () Bool)

(assert (=> b!1338889 (=> (not res!888268) (not e!762474))))

(declare-datatypes ((array!90878 0))(
  ( (array!90879 (arr!43897 (Array (_ BitVec 32) (_ BitVec 64))) (size!44447 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90878)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90878 (_ BitVec 32)) Bool)

(assert (=> b!1338889 (= res!888268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1338890 () Bool)

(declare-fun e!762471 () Bool)

(declare-fun e!762473 () Bool)

(assert (=> b!1338890 (= e!762471 (and e!762473 mapRes!57211))))

(declare-fun condMapEmpty!57211 () Bool)

(declare-fun mapDefault!57211 () ValueCell!17605)

