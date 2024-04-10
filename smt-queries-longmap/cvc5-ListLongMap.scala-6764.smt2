; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84880 () Bool)

(assert start!84880)

(declare-fun b!991903 () Bool)

(declare-fun res!662987 () Bool)

(declare-fun e!559486 () Bool)

(assert (=> b!991903 (=> (not res!662987) (not e!559486))))

(declare-fun k!1425 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!991903 (= res!662987 (validKeyInArray!0 k!1425))))

(declare-fun b!991904 () Bool)

(declare-fun res!662989 () Bool)

(assert (=> b!991904 (=> (not res!662989) (not e!559486))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(declare-datatypes ((V!36129 0))(
  ( (V!36130 (val!11730 Int)) )
))
(declare-datatypes ((ValueCell!11198 0))(
  ( (ValueCellFull!11198 (v!14307 V!36129)) (EmptyCell!11198) )
))
(declare-datatypes ((array!62687 0))(
  ( (array!62688 (arr!30188 (Array (_ BitVec 32) ValueCell!11198)) (size!30667 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62687)

(declare-fun mask!2471 () (_ BitVec 32))

(declare-datatypes ((array!62689 0))(
  ( (array!62690 (arr!30189 (Array (_ BitVec 32) (_ BitVec 64))) (size!30668 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62689)

(assert (=> b!991904 (= res!662989 (and (= (size!30667 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30668 _keys!1945) (size!30667 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun b!991906 () Bool)

(declare-fun res!662990 () Bool)

(assert (=> b!991906 (=> (not res!662990) (not e!559486))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62689 (_ BitVec 32)) Bool)

(assert (=> b!991906 (= res!662990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun b!991907 () Bool)

(assert (=> b!991907 (= e!559486 (not (= (size!30668 _keys!1945) (bvadd #b00000000000000000000000000000001 mask!2471))))))

(declare-fun b!991908 () Bool)

(declare-fun e!559487 () Bool)

(declare-fun tp_is_empty!23359 () Bool)

(assert (=> b!991908 (= e!559487 tp_is_empty!23359)))

(declare-fun mapNonEmpty!37110 () Bool)

(declare-fun mapRes!37110 () Bool)

(declare-fun tp!70181 () Bool)

(declare-fun e!559485 () Bool)

(assert (=> mapNonEmpty!37110 (= mapRes!37110 (and tp!70181 e!559485))))

(declare-fun mapValue!37110 () ValueCell!11198)

(declare-fun mapRest!37110 () (Array (_ BitVec 32) ValueCell!11198))

(declare-fun mapKey!37110 () (_ BitVec 32))

(assert (=> mapNonEmpty!37110 (= (arr!30188 _values!1551) (store mapRest!37110 mapKey!37110 mapValue!37110))))

(declare-fun b!991909 () Bool)

(assert (=> b!991909 (= e!559485 tp_is_empty!23359)))

(declare-fun b!991905 () Bool)

(declare-fun res!662988 () Bool)

(assert (=> b!991905 (=> (not res!662988) (not e!559486))))

(declare-datatypes ((List!20866 0))(
  ( (Nil!20863) (Cons!20862 (h!22024 (_ BitVec 64)) (t!29849 List!20866)) )
))
(declare-fun arrayNoDuplicates!0 (array!62689 (_ BitVec 32) List!20866) Bool)

(assert (=> b!991905 (= res!662988 (arrayNoDuplicates!0 _keys!1945 #b00000000000000000000000000000000 Nil!20863))))

(declare-fun res!662991 () Bool)

(assert (=> start!84880 (=> (not res!662991) (not e!559486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84880 (= res!662991 (validMask!0 mask!2471))))

(assert (=> start!84880 e!559486))

(assert (=> start!84880 true))

(declare-fun e!559488 () Bool)

(declare-fun array_inv!23315 (array!62687) Bool)

(assert (=> start!84880 (and (array_inv!23315 _values!1551) e!559488)))

(declare-fun array_inv!23316 (array!62689) Bool)

(assert (=> start!84880 (array_inv!23316 _keys!1945)))

(declare-fun mapIsEmpty!37110 () Bool)

(assert (=> mapIsEmpty!37110 mapRes!37110))

(declare-fun b!991910 () Bool)

(assert (=> b!991910 (= e!559488 (and e!559487 mapRes!37110))))

(declare-fun condMapEmpty!37110 () Bool)

(declare-fun mapDefault!37110 () ValueCell!11198)

