; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77618 () Bool)

(assert start!77618)

(declare-fun b!903535 () Bool)

(declare-fun res!609457 () Bool)

(declare-fun e!506142 () Bool)

(assert (=> b!903535 (=> (not res!609457) (not e!506142))))

(declare-datatypes ((array!53025 0))(
  ( (array!53026 (arr!25468 (Array (_ BitVec 32) (_ BitVec 64))) (size!25928 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53025)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53025 (_ BitVec 32)) Bool)

(assert (=> b!903535 (= res!609457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903536 () Bool)

(declare-fun e!506145 () Bool)

(declare-fun e!506143 () Bool)

(declare-fun mapRes!29404 () Bool)

(assert (=> b!903536 (= e!506145 (and e!506143 mapRes!29404))))

(declare-fun condMapEmpty!29404 () Bool)

(declare-datatypes ((V!29583 0))(
  ( (V!29584 (val!9282 Int)) )
))
(declare-datatypes ((ValueCell!8750 0))(
  ( (ValueCellFull!8750 (v!11784 V!29583)) (EmptyCell!8750) )
))
(declare-datatypes ((array!53027 0))(
  ( (array!53028 (arr!25469 (Array (_ BitVec 32) ValueCell!8750)) (size!25929 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53027)

(declare-fun mapDefault!29404 () ValueCell!8750)

(assert (=> b!903536 (= condMapEmpty!29404 (= (arr!25469 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8750)) mapDefault!29404)))))

(declare-fun mapIsEmpty!29404 () Bool)

(assert (=> mapIsEmpty!29404 mapRes!29404))

(declare-fun b!903537 () Bool)

(declare-fun e!506141 () Bool)

(declare-fun tp_is_empty!18463 () Bool)

(assert (=> b!903537 (= e!506141 tp_is_empty!18463)))

(declare-fun res!609455 () Bool)

(assert (=> start!77618 (=> (not res!609455) (not e!506142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77618 (= res!609455 (validMask!0 mask!1756))))

(assert (=> start!77618 e!506142))

(assert (=> start!77618 true))

(declare-fun array_inv!20030 (array!53027) Bool)

(assert (=> start!77618 (and (array_inv!20030 _values!1152) e!506145)))

(declare-fun array_inv!20031 (array!53025) Bool)

(assert (=> start!77618 (array_inv!20031 _keys!1386)))

(declare-fun b!903538 () Bool)

(assert (=> b!903538 (= e!506142 false)))

(declare-fun lt!408250 () Bool)

(declare-datatypes ((List!17846 0))(
  ( (Nil!17843) (Cons!17842 (h!18994 (_ BitVec 64)) (t!25221 List!17846)) )
))
(declare-fun arrayNoDuplicates!0 (array!53025 (_ BitVec 32) List!17846) Bool)

(assert (=> b!903538 (= lt!408250 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17843))))

(declare-fun mapNonEmpty!29404 () Bool)

(declare-fun tp!56464 () Bool)

(assert (=> mapNonEmpty!29404 (= mapRes!29404 (and tp!56464 e!506141))))

(declare-fun mapValue!29404 () ValueCell!8750)

(declare-fun mapKey!29404 () (_ BitVec 32))

(declare-fun mapRest!29404 () (Array (_ BitVec 32) ValueCell!8750))

(assert (=> mapNonEmpty!29404 (= (arr!25469 _values!1152) (store mapRest!29404 mapKey!29404 mapValue!29404))))

(declare-fun b!903539 () Bool)

(assert (=> b!903539 (= e!506143 tp_is_empty!18463)))

(declare-fun b!903540 () Bool)

(declare-fun res!609456 () Bool)

(assert (=> b!903540 (=> (not res!609456) (not e!506142))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!903540 (= res!609456 (and (= (size!25929 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25928 _keys!1386) (size!25929 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(assert (= (and start!77618 res!609455) b!903540))

(assert (= (and b!903540 res!609456) b!903535))

(assert (= (and b!903535 res!609457) b!903538))

(assert (= (and b!903536 condMapEmpty!29404) mapIsEmpty!29404))

(assert (= (and b!903536 (not condMapEmpty!29404)) mapNonEmpty!29404))

(get-info :version)

(assert (= (and mapNonEmpty!29404 ((_ is ValueCellFull!8750) mapValue!29404)) b!903537))

(assert (= (and b!903536 ((_ is ValueCellFull!8750) mapDefault!29404)) b!903539))

(assert (= start!77618 b!903536))

(declare-fun m!839861 () Bool)

(assert (=> b!903535 m!839861))

(declare-fun m!839863 () Bool)

(assert (=> start!77618 m!839863))

(declare-fun m!839865 () Bool)

(assert (=> start!77618 m!839865))

(declare-fun m!839867 () Bool)

(assert (=> start!77618 m!839867))

(declare-fun m!839869 () Bool)

(assert (=> b!903538 m!839869))

(declare-fun m!839871 () Bool)

(assert (=> mapNonEmpty!29404 m!839871))

(check-sat (not start!77618) (not mapNonEmpty!29404) tp_is_empty!18463 (not b!903535) (not b!903538))
(check-sat)
