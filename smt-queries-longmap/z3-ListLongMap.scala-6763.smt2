; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84856 () Bool)

(assert start!84856)

(declare-fun mapNonEmpty!37101 () Bool)

(declare-fun mapRes!37101 () Bool)

(declare-fun tp!70173 () Bool)

(declare-fun e!559291 () Bool)

(assert (=> mapNonEmpty!37101 (= mapRes!37101 (and tp!70173 e!559291))))

(declare-fun mapKey!37101 () (_ BitVec 32))

(declare-datatypes ((V!36121 0))(
  ( (V!36122 (val!11727 Int)) )
))
(declare-datatypes ((ValueCell!11195 0))(
  ( (ValueCellFull!11195 (v!14303 V!36121)) (EmptyCell!11195) )
))
(declare-fun mapValue!37101 () ValueCell!11195)

(declare-datatypes ((array!62610 0))(
  ( (array!62611 (arr!30150 (Array (_ BitVec 32) ValueCell!11195)) (size!30631 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62610)

(declare-fun mapRest!37101 () (Array (_ BitVec 32) ValueCell!11195))

(assert (=> mapNonEmpty!37101 (= (arr!30150 _values!1551) (store mapRest!37101 mapKey!37101 mapValue!37101))))

(declare-fun res!662846 () Bool)

(declare-fun e!559294 () Bool)

(assert (=> start!84856 (=> (not res!662846) (not e!559294))))

(declare-fun mask!2471 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84856 (= res!662846 (validMask!0 mask!2471))))

(assert (=> start!84856 e!559294))

(assert (=> start!84856 true))

(declare-fun e!559295 () Bool)

(declare-fun array_inv!23299 (array!62610) Bool)

(assert (=> start!84856 (and (array_inv!23299 _values!1551) e!559295)))

(declare-datatypes ((array!62612 0))(
  ( (array!62613 (arr!30151 (Array (_ BitVec 32) (_ BitVec 64))) (size!30632 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62612)

(declare-fun array_inv!23300 (array!62612) Bool)

(assert (=> start!84856 (array_inv!23300 _keys!1945)))

(declare-fun b!991606 () Bool)

(declare-fun e!559292 () Bool)

(declare-fun tp_is_empty!23353 () Bool)

(assert (=> b!991606 (= e!559292 tp_is_empty!23353)))

(declare-fun b!991607 () Bool)

(declare-fun res!662848 () Bool)

(assert (=> b!991607 (=> (not res!662848) (not e!559294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62612 (_ BitVec 32)) Bool)

(assert (=> b!991607 (= res!662848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun mapIsEmpty!37101 () Bool)

(assert (=> mapIsEmpty!37101 mapRes!37101))

(declare-fun b!991608 () Bool)

(assert (=> b!991608 (= e!559294 false)))

(declare-fun lt!439790 () Bool)

(declare-datatypes ((List!20900 0))(
  ( (Nil!20897) (Cons!20896 (h!22058 (_ BitVec 64)) (t!29874 List!20900)) )
))
(declare-fun arrayNoDuplicates!0 (array!62612 (_ BitVec 32) List!20900) Bool)

(assert (=> b!991608 (= lt!439790 (arrayNoDuplicates!0 _keys!1945 #b00000000000000000000000000000000 Nil!20897))))

(declare-fun b!991609 () Bool)

(assert (=> b!991609 (= e!559291 tp_is_empty!23353)))

(declare-fun b!991610 () Bool)

(declare-fun res!662847 () Bool)

(assert (=> b!991610 (=> (not res!662847) (not e!559294))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(assert (=> b!991610 (= res!662847 (and (= (size!30631 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30632 _keys!1945) (size!30631 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun b!991611 () Bool)

(assert (=> b!991611 (= e!559295 (and e!559292 mapRes!37101))))

(declare-fun condMapEmpty!37101 () Bool)

(declare-fun mapDefault!37101 () ValueCell!11195)

(assert (=> b!991611 (= condMapEmpty!37101 (= (arr!30150 _values!1551) ((as const (Array (_ BitVec 32) ValueCell!11195)) mapDefault!37101)))))

(assert (= (and start!84856 res!662846) b!991610))

(assert (= (and b!991610 res!662847) b!991607))

(assert (= (and b!991607 res!662848) b!991608))

(assert (= (and b!991611 condMapEmpty!37101) mapIsEmpty!37101))

(assert (= (and b!991611 (not condMapEmpty!37101)) mapNonEmpty!37101))

(get-info :version)

(assert (= (and mapNonEmpty!37101 ((_ is ValueCellFull!11195) mapValue!37101)) b!991609))

(assert (= (and b!991611 ((_ is ValueCellFull!11195) mapDefault!37101)) b!991606))

(assert (= start!84856 b!991611))

(declare-fun m!918883 () Bool)

(assert (=> mapNonEmpty!37101 m!918883))

(declare-fun m!918885 () Bool)

(assert (=> start!84856 m!918885))

(declare-fun m!918887 () Bool)

(assert (=> start!84856 m!918887))

(declare-fun m!918889 () Bool)

(assert (=> start!84856 m!918889))

(declare-fun m!918891 () Bool)

(assert (=> b!991607 m!918891))

(declare-fun m!918893 () Bool)

(assert (=> b!991608 m!918893))

(check-sat (not start!84856) (not mapNonEmpty!37101) (not b!991608) (not b!991607) tp_is_empty!23353)
(check-sat)
