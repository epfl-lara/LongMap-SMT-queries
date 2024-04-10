; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84874 () Bool)

(assert start!84874)

(declare-fun b!991845 () Bool)

(declare-fun res!662957 () Bool)

(declare-fun e!559440 () Bool)

(assert (=> b!991845 (=> (not res!662957) (not e!559440))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(declare-datatypes ((V!36121 0))(
  ( (V!36122 (val!11727 Int)) )
))
(declare-datatypes ((ValueCell!11195 0))(
  ( (ValueCellFull!11195 (v!14304 V!36121)) (EmptyCell!11195) )
))
(declare-datatypes ((array!62677 0))(
  ( (array!62678 (arr!30183 (Array (_ BitVec 32) ValueCell!11195)) (size!30662 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62677)

(declare-fun mask!2471 () (_ BitVec 32))

(declare-datatypes ((array!62679 0))(
  ( (array!62680 (arr!30184 (Array (_ BitVec 32) (_ BitVec 64))) (size!30663 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62679)

(assert (=> b!991845 (= res!662957 (and (= (size!30662 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30663 _keys!1945) (size!30662 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun b!991846 () Bool)

(declare-fun e!559443 () Bool)

(declare-fun tp_is_empty!23353 () Bool)

(assert (=> b!991846 (= e!559443 tp_is_empty!23353)))

(declare-fun b!991847 () Bool)

(assert (=> b!991847 (= e!559440 false)))

(declare-fun lt!440026 () Bool)

(declare-datatypes ((List!20864 0))(
  ( (Nil!20861) (Cons!20860 (h!22022 (_ BitVec 64)) (t!29847 List!20864)) )
))
(declare-fun arrayNoDuplicates!0 (array!62679 (_ BitVec 32) List!20864) Bool)

(assert (=> b!991847 (= lt!440026 (arrayNoDuplicates!0 _keys!1945 #b00000000000000000000000000000000 Nil!20861))))

(declare-fun b!991848 () Bool)

(declare-fun res!662956 () Bool)

(assert (=> b!991848 (=> (not res!662956) (not e!559440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62679 (_ BitVec 32)) Bool)

(assert (=> b!991848 (= res!662956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun b!991849 () Bool)

(declare-fun e!559439 () Bool)

(assert (=> b!991849 (= e!559439 tp_is_empty!23353)))

(declare-fun res!662958 () Bool)

(assert (=> start!84874 (=> (not res!662958) (not e!559440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84874 (= res!662958 (validMask!0 mask!2471))))

(assert (=> start!84874 e!559440))

(assert (=> start!84874 true))

(declare-fun e!559442 () Bool)

(declare-fun array_inv!23311 (array!62677) Bool)

(assert (=> start!84874 (and (array_inv!23311 _values!1551) e!559442)))

(declare-fun array_inv!23312 (array!62679) Bool)

(assert (=> start!84874 (array_inv!23312 _keys!1945)))

(declare-fun mapIsEmpty!37101 () Bool)

(declare-fun mapRes!37101 () Bool)

(assert (=> mapIsEmpty!37101 mapRes!37101))

(declare-fun mapNonEmpty!37101 () Bool)

(declare-fun tp!70172 () Bool)

(assert (=> mapNonEmpty!37101 (= mapRes!37101 (and tp!70172 e!559443))))

(declare-fun mapRest!37101 () (Array (_ BitVec 32) ValueCell!11195))

(declare-fun mapValue!37101 () ValueCell!11195)

(declare-fun mapKey!37101 () (_ BitVec 32))

(assert (=> mapNonEmpty!37101 (= (arr!30183 _values!1551) (store mapRest!37101 mapKey!37101 mapValue!37101))))

(declare-fun b!991850 () Bool)

(assert (=> b!991850 (= e!559442 (and e!559439 mapRes!37101))))

(declare-fun condMapEmpty!37101 () Bool)

(declare-fun mapDefault!37101 () ValueCell!11195)

