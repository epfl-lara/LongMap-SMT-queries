; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82340 () Bool)

(assert start!82340)

(declare-fun b!958610 () Bool)

(declare-fun res!641408 () Bool)

(declare-fun e!540492 () Bool)

(assert (=> b!958610 (=> (not res!641408) (not e!540492))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58434 0))(
  ( (array!58435 (arr!28086 (Array (_ BitVec 32) (_ BitVec 64))) (size!28566 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58434)

(declare-datatypes ((V!33185 0))(
  ( (V!33186 (val!10626 Int)) )
))
(declare-datatypes ((ValueCell!10094 0))(
  ( (ValueCellFull!10094 (v!13180 V!33185)) (EmptyCell!10094) )
))
(declare-datatypes ((array!58436 0))(
  ( (array!58437 (arr!28087 (Array (_ BitVec 32) ValueCell!10094)) (size!28567 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58436)

(assert (=> b!958610 (= res!641408 (and (= (size!28567 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28566 _keys!1668) (size!28567 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958611 () Bool)

(declare-fun e!540489 () Bool)

(declare-fun tp_is_empty!21151 () Bool)

(assert (=> b!958611 (= e!540489 tp_is_empty!21151)))

(declare-fun b!958612 () Bool)

(declare-fun res!641410 () Bool)

(assert (=> b!958612 (=> (not res!641410) (not e!540492))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58434 (_ BitVec 32)) Bool)

(assert (=> b!958612 (= res!641410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958613 () Bool)

(assert (=> b!958613 (= e!540492 false)))

(declare-fun lt!430729 () Bool)

(declare-datatypes ((List!19516 0))(
  ( (Nil!19513) (Cons!19512 (h!20680 (_ BitVec 64)) (t!27871 List!19516)) )
))
(declare-fun arrayNoDuplicates!0 (array!58434 (_ BitVec 32) List!19516) Bool)

(assert (=> b!958613 (= lt!430729 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19513))))

(declare-fun b!958614 () Bool)

(declare-fun e!540488 () Bool)

(assert (=> b!958614 (= e!540488 tp_is_empty!21151)))

(declare-fun b!958615 () Bool)

(declare-fun e!540491 () Bool)

(declare-fun mapRes!33706 () Bool)

(assert (=> b!958615 (= e!540491 (and e!540488 mapRes!33706))))

(declare-fun condMapEmpty!33706 () Bool)

(declare-fun mapDefault!33706 () ValueCell!10094)

(assert (=> b!958615 (= condMapEmpty!33706 (= (arr!28087 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10094)) mapDefault!33706)))))

(declare-fun mapIsEmpty!33706 () Bool)

(assert (=> mapIsEmpty!33706 mapRes!33706))

(declare-fun res!641409 () Bool)

(assert (=> start!82340 (=> (not res!641409) (not e!540492))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82340 (= res!641409 (validMask!0 mask!2088))))

(assert (=> start!82340 e!540492))

(assert (=> start!82340 true))

(declare-fun array_inv!21859 (array!58436) Bool)

(assert (=> start!82340 (and (array_inv!21859 _values!1386) e!540491)))

(declare-fun array_inv!21860 (array!58434) Bool)

(assert (=> start!82340 (array_inv!21860 _keys!1668)))

(declare-fun mapNonEmpty!33706 () Bool)

(declare-fun tp!64312 () Bool)

(assert (=> mapNonEmpty!33706 (= mapRes!33706 (and tp!64312 e!540489))))

(declare-fun mapKey!33706 () (_ BitVec 32))

(declare-fun mapValue!33706 () ValueCell!10094)

(declare-fun mapRest!33706 () (Array (_ BitVec 32) ValueCell!10094))

(assert (=> mapNonEmpty!33706 (= (arr!28087 _values!1386) (store mapRest!33706 mapKey!33706 mapValue!33706))))

(assert (= (and start!82340 res!641409) b!958610))

(assert (= (and b!958610 res!641408) b!958612))

(assert (= (and b!958612 res!641410) b!958613))

(assert (= (and b!958615 condMapEmpty!33706) mapIsEmpty!33706))

(assert (= (and b!958615 (not condMapEmpty!33706)) mapNonEmpty!33706))

(get-info :version)

(assert (= (and mapNonEmpty!33706 ((_ is ValueCellFull!10094) mapValue!33706)) b!958611))

(assert (= (and b!958615 ((_ is ValueCellFull!10094) mapDefault!33706)) b!958614))

(assert (= start!82340 b!958615))

(declare-fun m!889887 () Bool)

(assert (=> b!958612 m!889887))

(declare-fun m!889889 () Bool)

(assert (=> b!958613 m!889889))

(declare-fun m!889891 () Bool)

(assert (=> start!82340 m!889891))

(declare-fun m!889893 () Bool)

(assert (=> start!82340 m!889893))

(declare-fun m!889895 () Bool)

(assert (=> start!82340 m!889895))

(declare-fun m!889897 () Bool)

(assert (=> mapNonEmpty!33706 m!889897))

(check-sat tp_is_empty!21151 (not mapNonEmpty!33706) (not start!82340) (not b!958612) (not b!958613))
(check-sat)
