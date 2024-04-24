; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133904 () Bool)

(assert start!133904)

(declare-fun b!1563030 () Bool)

(declare-fun e!871149 () Bool)

(assert (=> b!1563030 (= e!871149 false)))

(declare-fun lt!671927 () Bool)

(declare-datatypes ((array!103994 0))(
  ( (array!103995 (arr!50182 (Array (_ BitVec 32) (_ BitVec 64))) (size!50733 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103994)

(declare-datatypes ((List!36428 0))(
  ( (Nil!36425) (Cons!36424 (h!37888 (_ BitVec 64)) (t!51153 List!36428)) )
))
(declare-fun arrayNoDuplicates!0 (array!103994 (_ BitVec 32) List!36428) Bool)

(assert (=> b!1563030 (= lt!671927 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36425))))

(declare-fun b!1563032 () Bool)

(declare-fun e!871153 () Bool)

(declare-fun tp_is_empty!38575 () Bool)

(assert (=> b!1563032 (= e!871153 tp_is_empty!38575)))

(declare-fun b!1563033 () Bool)

(declare-fun res!1067977 () Bool)

(assert (=> b!1563033 (=> (not res!1067977) (not e!871149))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103994 (_ BitVec 32)) Bool)

(assert (=> b!1563033 (= res!1067977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1563034 () Bool)

(declare-fun e!871151 () Bool)

(declare-fun mapRes!59238 () Bool)

(assert (=> b!1563034 (= e!871151 (and e!871153 mapRes!59238))))

(declare-fun condMapEmpty!59238 () Bool)

(declare-datatypes ((V!59641 0))(
  ( (V!59642 (val!19371 Int)) )
))
(declare-datatypes ((ValueCell!18257 0))(
  ( (ValueCellFull!18257 (v!22115 V!59641)) (EmptyCell!18257) )
))
(declare-datatypes ((array!103996 0))(
  ( (array!103997 (arr!50183 (Array (_ BitVec 32) ValueCell!18257)) (size!50734 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103996)

(declare-fun mapDefault!59238 () ValueCell!18257)

(assert (=> b!1563034 (= condMapEmpty!59238 (= (arr!50183 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18257)) mapDefault!59238)))))

(declare-fun b!1563035 () Bool)

(declare-fun res!1067976 () Bool)

(assert (=> b!1563035 (=> (not res!1067976) (not e!871149))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1563035 (= res!1067976 (and (= (size!50734 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50733 _keys!637) (size!50734 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1067978 () Bool)

(assert (=> start!133904 (=> (not res!1067978) (not e!871149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133904 (= res!1067978 (validMask!0 mask!947))))

(assert (=> start!133904 e!871149))

(assert (=> start!133904 true))

(declare-fun array_inv!39257 (array!103996) Bool)

(assert (=> start!133904 (and (array_inv!39257 _values!487) e!871151)))

(declare-fun array_inv!39258 (array!103994) Bool)

(assert (=> start!133904 (array_inv!39258 _keys!637)))

(declare-fun b!1563031 () Bool)

(declare-fun e!871152 () Bool)

(assert (=> b!1563031 (= e!871152 tp_is_empty!38575)))

(declare-fun mapIsEmpty!59238 () Bool)

(assert (=> mapIsEmpty!59238 mapRes!59238))

(declare-fun mapNonEmpty!59238 () Bool)

(declare-fun tp!112893 () Bool)

(assert (=> mapNonEmpty!59238 (= mapRes!59238 (and tp!112893 e!871152))))

(declare-fun mapKey!59238 () (_ BitVec 32))

(declare-fun mapRest!59238 () (Array (_ BitVec 32) ValueCell!18257))

(declare-fun mapValue!59238 () ValueCell!18257)

(assert (=> mapNonEmpty!59238 (= (arr!50183 _values!487) (store mapRest!59238 mapKey!59238 mapValue!59238))))

(assert (= (and start!133904 res!1067978) b!1563035))

(assert (= (and b!1563035 res!1067976) b!1563033))

(assert (= (and b!1563033 res!1067977) b!1563030))

(assert (= (and b!1563034 condMapEmpty!59238) mapIsEmpty!59238))

(assert (= (and b!1563034 (not condMapEmpty!59238)) mapNonEmpty!59238))

(get-info :version)

(assert (= (and mapNonEmpty!59238 ((_ is ValueCellFull!18257) mapValue!59238)) b!1563031))

(assert (= (and b!1563034 ((_ is ValueCellFull!18257) mapDefault!59238)) b!1563032))

(assert (= start!133904 b!1563034))

(declare-fun m!1438647 () Bool)

(assert (=> b!1563030 m!1438647))

(declare-fun m!1438649 () Bool)

(assert (=> b!1563033 m!1438649))

(declare-fun m!1438651 () Bool)

(assert (=> start!133904 m!1438651))

(declare-fun m!1438653 () Bool)

(assert (=> start!133904 m!1438653))

(declare-fun m!1438655 () Bool)

(assert (=> start!133904 m!1438655))

(declare-fun m!1438657 () Bool)

(assert (=> mapNonEmpty!59238 m!1438657))

(check-sat tp_is_empty!38575 (not mapNonEmpty!59238) (not b!1563033) (not b!1563030) (not start!133904))
(check-sat)
