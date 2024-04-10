; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3780 () Bool)

(assert start!3780)

(declare-fun b!26414 () Bool)

(declare-fun e!17200 () Bool)

(declare-fun tp_is_empty!1101 () Bool)

(assert (=> b!26414 (= e!17200 tp_is_empty!1101)))

(declare-fun b!26415 () Bool)

(declare-fun e!17203 () Bool)

(declare-fun mapRes!1168 () Bool)

(assert (=> b!26415 (= e!17203 (and e!17200 mapRes!1168))))

(declare-fun condMapEmpty!1168 () Bool)

(declare-datatypes ((V!1293 0))(
  ( (V!1294 (val!577 Int)) )
))
(declare-datatypes ((ValueCell!351 0))(
  ( (ValueCellFull!351 (v!1663 V!1293)) (EmptyCell!351) )
))
(declare-datatypes ((array!1445 0))(
  ( (array!1446 (arr!680 (Array (_ BitVec 32) ValueCell!351)) (size!781 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1445)

(declare-fun mapDefault!1168 () ValueCell!351)

(assert (=> b!26415 (= condMapEmpty!1168 (= (arr!680 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!351)) mapDefault!1168)))))

(declare-fun b!26416 () Bool)

(declare-fun e!17202 () Bool)

(assert (=> b!26416 (= e!17202 false)))

(declare-fun lt!10361 () Bool)

(declare-datatypes ((array!1447 0))(
  ( (array!1448 (arr!681 (Array (_ BitVec 32) (_ BitVec 64))) (size!782 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1447)

(declare-datatypes ((List!588 0))(
  ( (Nil!585) (Cons!584 (h!1151 (_ BitVec 64)) (t!3275 List!588)) )
))
(declare-fun arrayNoDuplicates!0 (array!1447 (_ BitVec 32) List!588) Bool)

(assert (=> b!26416 (= lt!10361 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!585))))

(declare-fun mapNonEmpty!1168 () Bool)

(declare-fun tp!3688 () Bool)

(declare-fun e!17204 () Bool)

(assert (=> mapNonEmpty!1168 (= mapRes!1168 (and tp!3688 e!17204))))

(declare-fun mapRest!1168 () (Array (_ BitVec 32) ValueCell!351))

(declare-fun mapKey!1168 () (_ BitVec 32))

(declare-fun mapValue!1168 () ValueCell!351)

(assert (=> mapNonEmpty!1168 (= (arr!680 _values!1501) (store mapRest!1168 mapKey!1168 mapValue!1168))))

(declare-fun res!15684 () Bool)

(assert (=> start!3780 (=> (not res!15684) (not e!17202))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3780 (= res!15684 (validMask!0 mask!2294))))

(assert (=> start!3780 e!17202))

(assert (=> start!3780 true))

(declare-fun array_inv!463 (array!1445) Bool)

(assert (=> start!3780 (and (array_inv!463 _values!1501) e!17203)))

(declare-fun array_inv!464 (array!1447) Bool)

(assert (=> start!3780 (array_inv!464 _keys!1833)))

(declare-fun mapIsEmpty!1168 () Bool)

(assert (=> mapIsEmpty!1168 mapRes!1168))

(declare-fun b!26417 () Bool)

(declare-fun res!15682 () Bool)

(assert (=> b!26417 (=> (not res!15682) (not e!17202))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26417 (= res!15682 (and (= (size!781 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!782 _keys!1833) (size!781 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26418 () Bool)

(declare-fun res!15683 () Bool)

(assert (=> b!26418 (=> (not res!15683) (not e!17202))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1447 (_ BitVec 32)) Bool)

(assert (=> b!26418 (= res!15683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26419 () Bool)

(assert (=> b!26419 (= e!17204 tp_is_empty!1101)))

(assert (= (and start!3780 res!15684) b!26417))

(assert (= (and b!26417 res!15682) b!26418))

(assert (= (and b!26418 res!15683) b!26416))

(assert (= (and b!26415 condMapEmpty!1168) mapIsEmpty!1168))

(assert (= (and b!26415 (not condMapEmpty!1168)) mapNonEmpty!1168))

(get-info :version)

(assert (= (and mapNonEmpty!1168 ((_ is ValueCellFull!351) mapValue!1168)) b!26419))

(assert (= (and b!26415 ((_ is ValueCellFull!351) mapDefault!1168)) b!26414))

(assert (= start!3780 b!26415))

(declare-fun m!21197 () Bool)

(assert (=> b!26416 m!21197))

(declare-fun m!21199 () Bool)

(assert (=> mapNonEmpty!1168 m!21199))

(declare-fun m!21201 () Bool)

(assert (=> start!3780 m!21201))

(declare-fun m!21203 () Bool)

(assert (=> start!3780 m!21203))

(declare-fun m!21205 () Bool)

(assert (=> start!3780 m!21205))

(declare-fun m!21207 () Bool)

(assert (=> b!26418 m!21207))

(check-sat tp_is_empty!1101 (not b!26418) (not b!26416) (not start!3780) (not mapNonEmpty!1168))
(check-sat)
