; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38492 () Bool)

(assert start!38492)

(declare-fun b!397492 () Bool)

(declare-fun e!240334 () Bool)

(declare-fun e!240335 () Bool)

(assert (=> b!397492 (= e!240334 e!240335)))

(declare-fun res!228327 () Bool)

(assert (=> b!397492 (=> (not res!228327) (not e!240335))))

(declare-datatypes ((array!23743 0))(
  ( (array!23744 (arr!11321 (Array (_ BitVec 32) (_ BitVec 64))) (size!11674 (_ BitVec 32))) )
))
(declare-fun lt!187121 () array!23743)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23743 (_ BitVec 32)) Bool)

(assert (=> b!397492 (= res!228327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187121 mask!1025))))

(declare-fun _keys!709 () array!23743)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397492 (= lt!187121 (array!23744 (store (arr!11321 _keys!709) i!563 k0!794) (size!11674 _keys!709)))))

(declare-fun b!397493 () Bool)

(assert (=> b!397493 (= e!240335 false)))

(declare-fun lt!187120 () Bool)

(declare-datatypes ((List!6514 0))(
  ( (Nil!6511) (Cons!6510 (h!7366 (_ BitVec 64)) (t!11679 List!6514)) )
))
(declare-fun arrayNoDuplicates!0 (array!23743 (_ BitVec 32) List!6514) Bool)

(assert (=> b!397493 (= lt!187120 (arrayNoDuplicates!0 lt!187121 #b00000000000000000000000000000000 Nil!6511))))

(declare-fun res!228322 () Bool)

(assert (=> start!38492 (=> (not res!228322) (not e!240334))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38492 (= res!228322 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11674 _keys!709))))))

(assert (=> start!38492 e!240334))

(assert (=> start!38492 true))

(declare-datatypes ((V!14339 0))(
  ( (V!14340 (val!5007 Int)) )
))
(declare-datatypes ((ValueCell!4619 0))(
  ( (ValueCellFull!4619 (v!7248 V!14339)) (EmptyCell!4619) )
))
(declare-datatypes ((array!23745 0))(
  ( (array!23746 (arr!11322 (Array (_ BitVec 32) ValueCell!4619)) (size!11675 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23745)

(declare-fun e!240333 () Bool)

(declare-fun array_inv!8310 (array!23745) Bool)

(assert (=> start!38492 (and (array_inv!8310 _values!549) e!240333)))

(declare-fun array_inv!8311 (array!23743) Bool)

(assert (=> start!38492 (array_inv!8311 _keys!709)))

(declare-fun b!397494 () Bool)

(declare-fun res!228330 () Bool)

(assert (=> b!397494 (=> (not res!228330) (not e!240334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397494 (= res!228330 (validMask!0 mask!1025))))

(declare-fun b!397495 () Bool)

(declare-fun res!228325 () Bool)

(assert (=> b!397495 (=> (not res!228325) (not e!240334))))

(assert (=> b!397495 (= res!228325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!397496 () Bool)

(declare-fun res!228324 () Bool)

(assert (=> b!397496 (=> (not res!228324) (not e!240334))))

(assert (=> b!397496 (= res!228324 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6511))))

(declare-fun b!397497 () Bool)

(declare-fun res!228323 () Bool)

(assert (=> b!397497 (=> (not res!228323) (not e!240334))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!397497 (= res!228323 (and (= (size!11675 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11674 _keys!709) (size!11675 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!397498 () Bool)

(declare-fun e!240332 () Bool)

(declare-fun tp_is_empty!9925 () Bool)

(assert (=> b!397498 (= e!240332 tp_is_empty!9925)))

(declare-fun b!397499 () Bool)

(declare-fun res!228326 () Bool)

(assert (=> b!397499 (=> (not res!228326) (not e!240334))))

(declare-fun arrayContainsKey!0 (array!23743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397499 (= res!228326 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16509 () Bool)

(declare-fun mapRes!16509 () Bool)

(declare-fun tp!32304 () Bool)

(assert (=> mapNonEmpty!16509 (= mapRes!16509 (and tp!32304 e!240332))))

(declare-fun mapValue!16509 () ValueCell!4619)

(declare-fun mapRest!16509 () (Array (_ BitVec 32) ValueCell!4619))

(declare-fun mapKey!16509 () (_ BitVec 32))

(assert (=> mapNonEmpty!16509 (= (arr!11322 _values!549) (store mapRest!16509 mapKey!16509 mapValue!16509))))

(declare-fun b!397500 () Bool)

(declare-fun res!228321 () Bool)

(assert (=> b!397500 (=> (not res!228321) (not e!240334))))

(assert (=> b!397500 (= res!228321 (or (= (select (arr!11321 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11321 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397501 () Bool)

(declare-fun e!240336 () Bool)

(assert (=> b!397501 (= e!240336 tp_is_empty!9925)))

(declare-fun b!397502 () Bool)

(declare-fun res!228328 () Bool)

(assert (=> b!397502 (=> (not res!228328) (not e!240334))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397502 (= res!228328 (validKeyInArray!0 k0!794))))

(declare-fun b!397503 () Bool)

(assert (=> b!397503 (= e!240333 (and e!240336 mapRes!16509))))

(declare-fun condMapEmpty!16509 () Bool)

(declare-fun mapDefault!16509 () ValueCell!4619)

(assert (=> b!397503 (= condMapEmpty!16509 (= (arr!11322 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4619)) mapDefault!16509)))))

(declare-fun mapIsEmpty!16509 () Bool)

(assert (=> mapIsEmpty!16509 mapRes!16509))

(declare-fun b!397504 () Bool)

(declare-fun res!228329 () Bool)

(assert (=> b!397504 (=> (not res!228329) (not e!240334))))

(assert (=> b!397504 (= res!228329 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11674 _keys!709))))))

(assert (= (and start!38492 res!228322) b!397494))

(assert (= (and b!397494 res!228330) b!397497))

(assert (= (and b!397497 res!228323) b!397495))

(assert (= (and b!397495 res!228325) b!397496))

(assert (= (and b!397496 res!228324) b!397504))

(assert (= (and b!397504 res!228329) b!397502))

(assert (= (and b!397502 res!228328) b!397500))

(assert (= (and b!397500 res!228321) b!397499))

(assert (= (and b!397499 res!228326) b!397492))

(assert (= (and b!397492 res!228327) b!397493))

(assert (= (and b!397503 condMapEmpty!16509) mapIsEmpty!16509))

(assert (= (and b!397503 (not condMapEmpty!16509)) mapNonEmpty!16509))

(get-info :version)

(assert (= (and mapNonEmpty!16509 ((_ is ValueCellFull!4619) mapValue!16509)) b!397498))

(assert (= (and b!397503 ((_ is ValueCellFull!4619) mapDefault!16509)) b!397501))

(assert (= start!38492 b!397503))

(declare-fun m!392163 () Bool)

(assert (=> b!397493 m!392163))

(declare-fun m!392165 () Bool)

(assert (=> b!397495 m!392165))

(declare-fun m!392167 () Bool)

(assert (=> b!397502 m!392167))

(declare-fun m!392169 () Bool)

(assert (=> b!397494 m!392169))

(declare-fun m!392171 () Bool)

(assert (=> mapNonEmpty!16509 m!392171))

(declare-fun m!392173 () Bool)

(assert (=> b!397500 m!392173))

(declare-fun m!392175 () Bool)

(assert (=> b!397499 m!392175))

(declare-fun m!392177 () Bool)

(assert (=> b!397496 m!392177))

(declare-fun m!392179 () Bool)

(assert (=> b!397492 m!392179))

(declare-fun m!392181 () Bool)

(assert (=> b!397492 m!392181))

(declare-fun m!392183 () Bool)

(assert (=> start!38492 m!392183))

(declare-fun m!392185 () Bool)

(assert (=> start!38492 m!392185))

(check-sat (not b!397493) (not mapNonEmpty!16509) (not start!38492) (not b!397492) (not b!397496) (not b!397494) (not b!397495) tp_is_empty!9925 (not b!397499) (not b!397502))
(check-sat)
