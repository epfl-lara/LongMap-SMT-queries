; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84884 () Bool)

(assert start!84884)

(declare-fun mapIsEmpty!37116 () Bool)

(declare-fun mapRes!37116 () Bool)

(assert (=> mapIsEmpty!37116 mapRes!37116))

(declare-fun b!991951 () Bool)

(declare-fun res!663017 () Bool)

(declare-fun e!559517 () Bool)

(assert (=> b!991951 (=> (not res!663017) (not e!559517))))

(declare-fun k!1425 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!991951 (= res!663017 (validKeyInArray!0 k!1425))))

(declare-fun b!991952 () Bool)

(declare-fun res!663018 () Bool)

(assert (=> b!991952 (=> (not res!663018) (not e!559517))))

(declare-datatypes ((array!62695 0))(
  ( (array!62696 (arr!30192 (Array (_ BitVec 32) (_ BitVec 64))) (size!30671 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62695)

(declare-fun mask!2471 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62695 (_ BitVec 32)) Bool)

(assert (=> b!991952 (= res!663018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun b!991953 () Bool)

(assert (=> b!991953 (= e!559517 (not (= (size!30671 _keys!1945) (bvadd #b00000000000000000000000000000001 mask!2471))))))

(declare-fun b!991954 () Bool)

(declare-fun res!663019 () Bool)

(assert (=> b!991954 (=> (not res!663019) (not e!559517))))

(declare-datatypes ((List!20868 0))(
  ( (Nil!20865) (Cons!20864 (h!22026 (_ BitVec 64)) (t!29851 List!20868)) )
))
(declare-fun arrayNoDuplicates!0 (array!62695 (_ BitVec 32) List!20868) Bool)

(assert (=> b!991954 (= res!663019 (arrayNoDuplicates!0 _keys!1945 #b00000000000000000000000000000000 Nil!20865))))

(declare-fun b!991955 () Bool)

(declare-fun e!559518 () Bool)

(declare-fun tp_is_empty!23363 () Bool)

(assert (=> b!991955 (= e!559518 tp_is_empty!23363)))

(declare-fun res!663021 () Bool)

(assert (=> start!84884 (=> (not res!663021) (not e!559517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84884 (= res!663021 (validMask!0 mask!2471))))

(assert (=> start!84884 e!559517))

(assert (=> start!84884 true))

(declare-datatypes ((V!36133 0))(
  ( (V!36134 (val!11732 Int)) )
))
(declare-datatypes ((ValueCell!11200 0))(
  ( (ValueCellFull!11200 (v!14309 V!36133)) (EmptyCell!11200) )
))
(declare-datatypes ((array!62697 0))(
  ( (array!62698 (arr!30193 (Array (_ BitVec 32) ValueCell!11200)) (size!30672 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62697)

(declare-fun e!559515 () Bool)

(declare-fun array_inv!23319 (array!62697) Bool)

(assert (=> start!84884 (and (array_inv!23319 _values!1551) e!559515)))

(declare-fun array_inv!23320 (array!62695) Bool)

(assert (=> start!84884 (array_inv!23320 _keys!1945)))

(declare-fun b!991956 () Bool)

(declare-fun e!559516 () Bool)

(assert (=> b!991956 (= e!559516 tp_is_empty!23363)))

(declare-fun mapNonEmpty!37116 () Bool)

(declare-fun tp!70187 () Bool)

(assert (=> mapNonEmpty!37116 (= mapRes!37116 (and tp!70187 e!559516))))

(declare-fun mapRest!37116 () (Array (_ BitVec 32) ValueCell!11200))

(declare-fun mapKey!37116 () (_ BitVec 32))

(declare-fun mapValue!37116 () ValueCell!11200)

(assert (=> mapNonEmpty!37116 (= (arr!30193 _values!1551) (store mapRest!37116 mapKey!37116 mapValue!37116))))

(declare-fun b!991957 () Bool)

(declare-fun res!663020 () Bool)

(assert (=> b!991957 (=> (not res!663020) (not e!559517))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(assert (=> b!991957 (= res!663020 (and (= (size!30672 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30671 _keys!1945) (size!30672 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun b!991958 () Bool)

(assert (=> b!991958 (= e!559515 (and e!559518 mapRes!37116))))

(declare-fun condMapEmpty!37116 () Bool)

(declare-fun mapDefault!37116 () ValueCell!11200)

