; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38934 () Bool)

(assert start!38934)

(declare-fun b!407405 () Bool)

(declare-fun e!244686 () Bool)

(declare-fun e!244683 () Bool)

(assert (=> b!407405 (= e!244686 e!244683)))

(declare-fun res!235525 () Bool)

(assert (=> b!407405 (=> (not res!235525) (not e!244683))))

(declare-datatypes ((array!24587 0))(
  ( (array!24588 (arr!11743 (Array (_ BitVec 32) (_ BitVec 64))) (size!12095 (_ BitVec 32))) )
))
(declare-fun lt!188638 () array!24587)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24587 (_ BitVec 32)) Bool)

(assert (=> b!407405 (= res!235525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188638 mask!1025))))

(declare-fun _keys!709 () array!24587)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!407405 (= lt!188638 (array!24588 (store (arr!11743 _keys!709) i!563 k0!794) (size!12095 _keys!709)))))

(declare-fun b!407406 () Bool)

(declare-fun res!235527 () Bool)

(assert (=> b!407406 (=> (not res!235527) (not e!244686))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407406 (= res!235527 (validMask!0 mask!1025))))

(declare-fun res!235522 () Bool)

(assert (=> start!38934 (=> (not res!235522) (not e!244686))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38934 (= res!235522 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12095 _keys!709))))))

(assert (=> start!38934 e!244686))

(assert (=> start!38934 true))

(declare-datatypes ((V!14909 0))(
  ( (V!14910 (val!5221 Int)) )
))
(declare-datatypes ((ValueCell!4833 0))(
  ( (ValueCellFull!4833 (v!7468 V!14909)) (EmptyCell!4833) )
))
(declare-datatypes ((array!24589 0))(
  ( (array!24590 (arr!11744 (Array (_ BitVec 32) ValueCell!4833)) (size!12096 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24589)

(declare-fun e!244684 () Bool)

(declare-fun array_inv!8568 (array!24589) Bool)

(assert (=> start!38934 (and (array_inv!8568 _values!549) e!244684)))

(declare-fun array_inv!8569 (array!24587) Bool)

(assert (=> start!38934 (array_inv!8569 _keys!709)))

(declare-fun b!407407 () Bool)

(declare-fun res!235519 () Bool)

(assert (=> b!407407 (=> (not res!235519) (not e!244686))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407407 (= res!235519 (validKeyInArray!0 k0!794))))

(declare-fun b!407408 () Bool)

(declare-fun res!235524 () Bool)

(assert (=> b!407408 (=> (not res!235524) (not e!244686))))

(declare-datatypes ((List!6813 0))(
  ( (Nil!6810) (Cons!6809 (h!7665 (_ BitVec 64)) (t!11987 List!6813)) )
))
(declare-fun arrayNoDuplicates!0 (array!24587 (_ BitVec 32) List!6813) Bool)

(assert (=> b!407408 (= res!235524 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6810))))

(declare-fun mapIsEmpty!17151 () Bool)

(declare-fun mapRes!17151 () Bool)

(assert (=> mapIsEmpty!17151 mapRes!17151))

(declare-fun b!407409 () Bool)

(declare-fun res!235526 () Bool)

(assert (=> b!407409 (=> (not res!235526) (not e!244686))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!407409 (= res!235526 (and (= (size!12096 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12095 _keys!709) (size!12096 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!407410 () Bool)

(declare-fun res!235520 () Bool)

(assert (=> b!407410 (=> (not res!235520) (not e!244686))))

(declare-fun arrayContainsKey!0 (array!24587 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!407410 (= res!235520 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17151 () Bool)

(declare-fun tp!33270 () Bool)

(declare-fun e!244681 () Bool)

(assert (=> mapNonEmpty!17151 (= mapRes!17151 (and tp!33270 e!244681))))

(declare-fun mapValue!17151 () ValueCell!4833)

(declare-fun mapRest!17151 () (Array (_ BitVec 32) ValueCell!4833))

(declare-fun mapKey!17151 () (_ BitVec 32))

(assert (=> mapNonEmpty!17151 (= (arr!11744 _values!549) (store mapRest!17151 mapKey!17151 mapValue!17151))))

(declare-fun b!407411 () Bool)

(declare-fun e!244685 () Bool)

(declare-fun tp_is_empty!10353 () Bool)

(assert (=> b!407411 (= e!244685 tp_is_empty!10353)))

(declare-fun b!407412 () Bool)

(assert (=> b!407412 (= e!244681 tp_is_empty!10353)))

(declare-fun b!407413 () Bool)

(assert (=> b!407413 (= e!244683 false)))

(declare-fun lt!188639 () Bool)

(assert (=> b!407413 (= lt!188639 (arrayNoDuplicates!0 lt!188638 #b00000000000000000000000000000000 Nil!6810))))

(declare-fun b!407414 () Bool)

(declare-fun res!235521 () Bool)

(assert (=> b!407414 (=> (not res!235521) (not e!244686))))

(assert (=> b!407414 (= res!235521 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12095 _keys!709))))))

(declare-fun b!407415 () Bool)

(declare-fun res!235523 () Bool)

(assert (=> b!407415 (=> (not res!235523) (not e!244686))))

(assert (=> b!407415 (= res!235523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!407416 () Bool)

(declare-fun res!235518 () Bool)

(assert (=> b!407416 (=> (not res!235518) (not e!244686))))

(assert (=> b!407416 (= res!235518 (or (= (select (arr!11743 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11743 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!407417 () Bool)

(assert (=> b!407417 (= e!244684 (and e!244685 mapRes!17151))))

(declare-fun condMapEmpty!17151 () Bool)

(declare-fun mapDefault!17151 () ValueCell!4833)

(assert (=> b!407417 (= condMapEmpty!17151 (= (arr!11744 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4833)) mapDefault!17151)))))

(assert (= (and start!38934 res!235522) b!407406))

(assert (= (and b!407406 res!235527) b!407409))

(assert (= (and b!407409 res!235526) b!407415))

(assert (= (and b!407415 res!235523) b!407408))

(assert (= (and b!407408 res!235524) b!407414))

(assert (= (and b!407414 res!235521) b!407407))

(assert (= (and b!407407 res!235519) b!407416))

(assert (= (and b!407416 res!235518) b!407410))

(assert (= (and b!407410 res!235520) b!407405))

(assert (= (and b!407405 res!235525) b!407413))

(assert (= (and b!407417 condMapEmpty!17151) mapIsEmpty!17151))

(assert (= (and b!407417 (not condMapEmpty!17151)) mapNonEmpty!17151))

(get-info :version)

(assert (= (and mapNonEmpty!17151 ((_ is ValueCellFull!4833) mapValue!17151)) b!407412))

(assert (= (and b!407417 ((_ is ValueCellFull!4833) mapDefault!17151)) b!407411))

(assert (= start!38934 b!407417))

(declare-fun m!399103 () Bool)

(assert (=> b!407407 m!399103))

(declare-fun m!399105 () Bool)

(assert (=> b!407405 m!399105))

(declare-fun m!399107 () Bool)

(assert (=> b!407405 m!399107))

(declare-fun m!399109 () Bool)

(assert (=> b!407408 m!399109))

(declare-fun m!399111 () Bool)

(assert (=> b!407416 m!399111))

(declare-fun m!399113 () Bool)

(assert (=> b!407406 m!399113))

(declare-fun m!399115 () Bool)

(assert (=> b!407410 m!399115))

(declare-fun m!399117 () Bool)

(assert (=> start!38934 m!399117))

(declare-fun m!399119 () Bool)

(assert (=> start!38934 m!399119))

(declare-fun m!399121 () Bool)

(assert (=> b!407415 m!399121))

(declare-fun m!399123 () Bool)

(assert (=> mapNonEmpty!17151 m!399123))

(declare-fun m!399125 () Bool)

(assert (=> b!407413 m!399125))

(check-sat (not b!407408) (not b!407415) (not b!407407) (not b!407405) tp_is_empty!10353 (not mapNonEmpty!17151) (not b!407410) (not b!407413) (not start!38934) (not b!407406))
(check-sat)
