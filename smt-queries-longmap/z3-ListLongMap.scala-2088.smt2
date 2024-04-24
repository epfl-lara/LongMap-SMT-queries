; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35682 () Bool)

(assert start!35682)

(declare-fun b!358500 () Bool)

(declare-fun res!199284 () Bool)

(declare-fun e!219462 () Bool)

(assert (=> b!358500 (=> (not res!199284) (not e!219462))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19844 0))(
  ( (array!19845 (arr!9415 (Array (_ BitVec 32) (_ BitVec 64))) (size!9767 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19844)

(declare-datatypes ((V!11843 0))(
  ( (V!11844 (val!4119 Int)) )
))
(declare-datatypes ((ValueCell!3731 0))(
  ( (ValueCellFull!3731 (v!6314 V!11843)) (EmptyCell!3731) )
))
(declare-datatypes ((array!19846 0))(
  ( (array!19847 (arr!9416 (Array (_ BitVec 32) ValueCell!3731)) (size!9768 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19846)

(assert (=> b!358500 (= res!199284 (and (= (size!9768 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9767 _keys!1456) (size!9768 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13731 () Bool)

(declare-fun mapRes!13731 () Bool)

(declare-fun tp!27789 () Bool)

(declare-fun e!219461 () Bool)

(assert (=> mapNonEmpty!13731 (= mapRes!13731 (and tp!27789 e!219461))))

(declare-fun mapValue!13731 () ValueCell!3731)

(declare-fun mapKey!13731 () (_ BitVec 32))

(declare-fun mapRest!13731 () (Array (_ BitVec 32) ValueCell!3731))

(assert (=> mapNonEmpty!13731 (= (arr!9416 _values!1208) (store mapRest!13731 mapKey!13731 mapValue!13731))))

(declare-fun b!358501 () Bool)

(declare-fun res!199283 () Bool)

(assert (=> b!358501 (=> (not res!199283) (not e!219462))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19844 (_ BitVec 32)) Bool)

(assert (=> b!358501 (= res!199283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!358502 () Bool)

(assert (=> b!358502 (= e!219462 false)))

(declare-fun lt!166229 () Bool)

(declare-datatypes ((List!5345 0))(
  ( (Nil!5342) (Cons!5341 (h!6197 (_ BitVec 64)) (t!10487 List!5345)) )
))
(declare-fun arrayNoDuplicates!0 (array!19844 (_ BitVec 32) List!5345) Bool)

(assert (=> b!358502 (= lt!166229 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5342))))

(declare-fun mapIsEmpty!13731 () Bool)

(assert (=> mapIsEmpty!13731 mapRes!13731))

(declare-fun b!358504 () Bool)

(declare-fun tp_is_empty!8149 () Bool)

(assert (=> b!358504 (= e!219461 tp_is_empty!8149)))

(declare-fun b!358505 () Bool)

(declare-fun e!219460 () Bool)

(declare-fun e!219463 () Bool)

(assert (=> b!358505 (= e!219460 (and e!219463 mapRes!13731))))

(declare-fun condMapEmpty!13731 () Bool)

(declare-fun mapDefault!13731 () ValueCell!3731)

(assert (=> b!358505 (= condMapEmpty!13731 (= (arr!9416 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3731)) mapDefault!13731)))))

(declare-fun b!358503 () Bool)

(assert (=> b!358503 (= e!219463 tp_is_empty!8149)))

(declare-fun res!199285 () Bool)

(assert (=> start!35682 (=> (not res!199285) (not e!219462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35682 (= res!199285 (validMask!0 mask!1842))))

(assert (=> start!35682 e!219462))

(assert (=> start!35682 true))

(declare-fun array_inv!6958 (array!19846) Bool)

(assert (=> start!35682 (and (array_inv!6958 _values!1208) e!219460)))

(declare-fun array_inv!6959 (array!19844) Bool)

(assert (=> start!35682 (array_inv!6959 _keys!1456)))

(assert (= (and start!35682 res!199285) b!358500))

(assert (= (and b!358500 res!199284) b!358501))

(assert (= (and b!358501 res!199283) b!358502))

(assert (= (and b!358505 condMapEmpty!13731) mapIsEmpty!13731))

(assert (= (and b!358505 (not condMapEmpty!13731)) mapNonEmpty!13731))

(get-info :version)

(assert (= (and mapNonEmpty!13731 ((_ is ValueCellFull!3731) mapValue!13731)) b!358504))

(assert (= (and b!358505 ((_ is ValueCellFull!3731) mapDefault!13731)) b!358503))

(assert (= start!35682 b!358505))

(declare-fun m!356571 () Bool)

(assert (=> mapNonEmpty!13731 m!356571))

(declare-fun m!356573 () Bool)

(assert (=> b!358501 m!356573))

(declare-fun m!356575 () Bool)

(assert (=> b!358502 m!356575))

(declare-fun m!356577 () Bool)

(assert (=> start!35682 m!356577))

(declare-fun m!356579 () Bool)

(assert (=> start!35682 m!356579))

(declare-fun m!356581 () Bool)

(assert (=> start!35682 m!356581))

(check-sat tp_is_empty!8149 (not start!35682) (not b!358501) (not mapNonEmpty!13731) (not b!358502))
(check-sat)
