; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84856 () Bool)

(assert start!84856)

(declare-fun b!991736 () Bool)

(declare-fun res!662893 () Bool)

(declare-fun e!559360 () Bool)

(assert (=> b!991736 (=> (not res!662893) (not e!559360))))

(declare-datatypes ((array!62663 0))(
  ( (array!62664 (arr!30177 (Array (_ BitVec 32) (_ BitVec 64))) (size!30656 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62663)

(declare-fun mask!2471 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62663 (_ BitVec 32)) Bool)

(assert (=> b!991736 (= res!662893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun b!991737 () Bool)

(declare-fun e!559358 () Bool)

(declare-fun tp_is_empty!23347 () Bool)

(assert (=> b!991737 (= e!559358 tp_is_empty!23347)))

(declare-fun mapIsEmpty!37089 () Bool)

(declare-fun mapRes!37089 () Bool)

(assert (=> mapIsEmpty!37089 mapRes!37089))

(declare-fun b!991738 () Bool)

(declare-fun res!662892 () Bool)

(assert (=> b!991738 (=> (not res!662892) (not e!559360))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(declare-datatypes ((V!36113 0))(
  ( (V!36114 (val!11724 Int)) )
))
(declare-datatypes ((ValueCell!11192 0))(
  ( (ValueCellFull!11192 (v!14300 V!36113)) (EmptyCell!11192) )
))
(declare-datatypes ((array!62665 0))(
  ( (array!62666 (arr!30178 (Array (_ BitVec 32) ValueCell!11192)) (size!30657 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62665)

(assert (=> b!991738 (= res!662892 (and (= (size!30657 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30656 _keys!1945) (size!30657 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun b!991739 () Bool)

(declare-fun e!559359 () Bool)

(assert (=> b!991739 (= e!559359 (and e!559358 mapRes!37089))))

(declare-fun condMapEmpty!37089 () Bool)

(declare-fun mapDefault!37089 () ValueCell!11192)

