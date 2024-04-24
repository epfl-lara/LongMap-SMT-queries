; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3792 () Bool)

(assert start!3792)

(declare-fun mapIsEmpty!1192 () Bool)

(declare-fun mapRes!1192 () Bool)

(assert (=> mapIsEmpty!1192 mapRes!1192))

(declare-fun b!26486 () Bool)

(declare-fun res!15714 () Bool)

(declare-fun e!17270 () Bool)

(assert (=> b!26486 (=> (not res!15714) (not e!17270))))

(declare-datatypes ((V!1315 0))(
  ( (V!1316 (val!585 Int)) )
))
(declare-datatypes ((ValueCell!359 0))(
  ( (ValueCellFull!359 (v!1671 V!1315)) (EmptyCell!359) )
))
(declare-datatypes ((array!1453 0))(
  ( (array!1454 (arr!684 (Array (_ BitVec 32) ValueCell!359)) (size!785 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1453)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1455 0))(
  ( (array!1456 (arr!685 (Array (_ BitVec 32) (_ BitVec 64))) (size!786 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1455)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!26486 (= res!15714 (and (= (size!785 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!786 _keys!1833) (size!785 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun res!15715 () Bool)

(assert (=> start!3792 (=> (not res!15715) (not e!17270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3792 (= res!15715 (validMask!0 mask!2294))))

(assert (=> start!3792 e!17270))

(assert (=> start!3792 true))

(declare-fun e!17269 () Bool)

(declare-fun array_inv!479 (array!1453) Bool)

(assert (=> start!3792 (and (array_inv!479 _values!1501) e!17269)))

(declare-fun array_inv!480 (array!1455) Bool)

(assert (=> start!3792 (array_inv!480 _keys!1833)))

(declare-fun b!26487 () Bool)

(declare-fun e!17271 () Bool)

(declare-fun tp_is_empty!1117 () Bool)

(assert (=> b!26487 (= e!17271 tp_is_empty!1117)))

(declare-fun b!26488 () Bool)

(declare-fun res!15716 () Bool)

(assert (=> b!26488 (=> (not res!15716) (not e!17270))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1455 (_ BitVec 32)) Bool)

(assert (=> b!26488 (= res!15716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26489 () Bool)

(declare-fun e!17268 () Bool)

(assert (=> b!26489 (= e!17268 tp_is_empty!1117)))

(declare-fun b!26490 () Bool)

(assert (=> b!26490 (= e!17269 (and e!17268 mapRes!1192))))

(declare-fun condMapEmpty!1192 () Bool)

(declare-fun mapDefault!1192 () ValueCell!359)

(assert (=> b!26490 (= condMapEmpty!1192 (= (arr!684 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!359)) mapDefault!1192)))))

(declare-fun b!26491 () Bool)

(assert (=> b!26491 (= e!17270 false)))

(declare-fun lt!10341 () Bool)

(declare-datatypes ((List!588 0))(
  ( (Nil!585) (Cons!584 (h!1151 (_ BitVec 64)) (t!3269 List!588)) )
))
(declare-fun arrayNoDuplicates!0 (array!1455 (_ BitVec 32) List!588) Bool)

(assert (=> b!26491 (= lt!10341 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!585))))

(declare-fun mapNonEmpty!1192 () Bool)

(declare-fun tp!3712 () Bool)

(assert (=> mapNonEmpty!1192 (= mapRes!1192 (and tp!3712 e!17271))))

(declare-fun mapValue!1192 () ValueCell!359)

(declare-fun mapRest!1192 () (Array (_ BitVec 32) ValueCell!359))

(declare-fun mapKey!1192 () (_ BitVec 32))

(assert (=> mapNonEmpty!1192 (= (arr!684 _values!1501) (store mapRest!1192 mapKey!1192 mapValue!1192))))

(assert (= (and start!3792 res!15715) b!26486))

(assert (= (and b!26486 res!15714) b!26488))

(assert (= (and b!26488 res!15716) b!26491))

(assert (= (and b!26490 condMapEmpty!1192) mapIsEmpty!1192))

(assert (= (and b!26490 (not condMapEmpty!1192)) mapNonEmpty!1192))

(get-info :version)

(assert (= (and mapNonEmpty!1192 ((_ is ValueCellFull!359) mapValue!1192)) b!26487))

(assert (= (and b!26490 ((_ is ValueCellFull!359) mapDefault!1192)) b!26489))

(assert (= start!3792 b!26490))

(declare-fun m!21141 () Bool)

(assert (=> start!3792 m!21141))

(declare-fun m!21143 () Bool)

(assert (=> start!3792 m!21143))

(declare-fun m!21145 () Bool)

(assert (=> start!3792 m!21145))

(declare-fun m!21147 () Bool)

(assert (=> b!26488 m!21147))

(declare-fun m!21149 () Bool)

(assert (=> b!26491 m!21149))

(declare-fun m!21151 () Bool)

(assert (=> mapNonEmpty!1192 m!21151))

(check-sat (not b!26491) (not mapNonEmpty!1192) (not start!3792) tp_is_empty!1117 (not b!26488))
(check-sat)
