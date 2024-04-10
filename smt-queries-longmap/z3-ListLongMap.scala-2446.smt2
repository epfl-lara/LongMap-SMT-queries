; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38496 () Bool)

(assert start!38496)

(declare-fun b!397568 () Bool)

(declare-fun res!228306 () Bool)

(declare-fun e!240420 () Bool)

(assert (=> b!397568 (=> (not res!228306) (not e!240420))))

(declare-datatypes ((array!23743 0))(
  ( (array!23744 (arr!11321 (Array (_ BitVec 32) (_ BitVec 64))) (size!11673 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23743)

(declare-datatypes ((List!6552 0))(
  ( (Nil!6549) (Cons!6548 (h!7404 (_ BitVec 64)) (t!11726 List!6552)) )
))
(declare-fun arrayNoDuplicates!0 (array!23743 (_ BitVec 32) List!6552) Bool)

(assert (=> b!397568 (= res!228306 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6549))))

(declare-fun mapIsEmpty!16494 () Bool)

(declare-fun mapRes!16494 () Bool)

(assert (=> mapIsEmpty!16494 mapRes!16494))

(declare-fun b!397569 () Bool)

(declare-fun res!228309 () Bool)

(assert (=> b!397569 (=> (not res!228309) (not e!240420))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397569 (= res!228309 (or (= (select (arr!11321 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11321 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397570 () Bool)

(declare-fun e!240416 () Bool)

(assert (=> b!397570 (= e!240416 false)))

(declare-fun lt!187324 () Bool)

(declare-fun lt!187325 () array!23743)

(assert (=> b!397570 (= lt!187324 (arrayNoDuplicates!0 lt!187325 #b00000000000000000000000000000000 Nil!6549))))

(declare-fun b!397571 () Bool)

(declare-fun res!228307 () Bool)

(assert (=> b!397571 (=> (not res!228307) (not e!240420))))

(assert (=> b!397571 (= res!228307 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11673 _keys!709))))))

(declare-fun b!397572 () Bool)

(declare-fun res!228304 () Bool)

(assert (=> b!397572 (=> (not res!228304) (not e!240420))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14325 0))(
  ( (V!14326 (val!5002 Int)) )
))
(declare-datatypes ((ValueCell!4614 0))(
  ( (ValueCellFull!4614 (v!7249 V!14325)) (EmptyCell!4614) )
))
(declare-datatypes ((array!23745 0))(
  ( (array!23746 (arr!11322 (Array (_ BitVec 32) ValueCell!4614)) (size!11674 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23745)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!397572 (= res!228304 (and (= (size!11674 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11673 _keys!709) (size!11674 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!397573 () Bool)

(declare-fun e!240417 () Bool)

(declare-fun e!240418 () Bool)

(assert (=> b!397573 (= e!240417 (and e!240418 mapRes!16494))))

(declare-fun condMapEmpty!16494 () Bool)

(declare-fun mapDefault!16494 () ValueCell!4614)

(assert (=> b!397573 (= condMapEmpty!16494 (= (arr!11322 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4614)) mapDefault!16494)))))

(declare-fun b!397574 () Bool)

(declare-fun res!228300 () Bool)

(assert (=> b!397574 (=> (not res!228300) (not e!240420))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397574 (= res!228300 (validKeyInArray!0 k0!794))))

(declare-fun b!397575 () Bool)

(declare-fun res!228305 () Bool)

(assert (=> b!397575 (=> (not res!228305) (not e!240420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397575 (= res!228305 (validMask!0 mask!1025))))

(declare-fun b!397576 () Bool)

(assert (=> b!397576 (= e!240420 e!240416)))

(declare-fun res!228303 () Bool)

(assert (=> b!397576 (=> (not res!228303) (not e!240416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23743 (_ BitVec 32)) Bool)

(assert (=> b!397576 (= res!228303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187325 mask!1025))))

(assert (=> b!397576 (= lt!187325 (array!23744 (store (arr!11321 _keys!709) i!563 k0!794) (size!11673 _keys!709)))))

(declare-fun res!228308 () Bool)

(assert (=> start!38496 (=> (not res!228308) (not e!240420))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38496 (= res!228308 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11673 _keys!709))))))

(assert (=> start!38496 e!240420))

(assert (=> start!38496 true))

(declare-fun array_inv!8296 (array!23745) Bool)

(assert (=> start!38496 (and (array_inv!8296 _values!549) e!240417)))

(declare-fun array_inv!8297 (array!23743) Bool)

(assert (=> start!38496 (array_inv!8297 _keys!709)))

(declare-fun b!397577 () Bool)

(declare-fun res!228301 () Bool)

(assert (=> b!397577 (=> (not res!228301) (not e!240420))))

(declare-fun arrayContainsKey!0 (array!23743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397577 (= res!228301 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!397578 () Bool)

(declare-fun tp_is_empty!9915 () Bool)

(assert (=> b!397578 (= e!240418 tp_is_empty!9915)))

(declare-fun b!397579 () Bool)

(declare-fun res!228302 () Bool)

(assert (=> b!397579 (=> (not res!228302) (not e!240420))))

(assert (=> b!397579 (= res!228302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!397580 () Bool)

(declare-fun e!240419 () Bool)

(assert (=> b!397580 (= e!240419 tp_is_empty!9915)))

(declare-fun mapNonEmpty!16494 () Bool)

(declare-fun tp!32289 () Bool)

(assert (=> mapNonEmpty!16494 (= mapRes!16494 (and tp!32289 e!240419))))

(declare-fun mapKey!16494 () (_ BitVec 32))

(declare-fun mapValue!16494 () ValueCell!4614)

(declare-fun mapRest!16494 () (Array (_ BitVec 32) ValueCell!4614))

(assert (=> mapNonEmpty!16494 (= (arr!11322 _values!549) (store mapRest!16494 mapKey!16494 mapValue!16494))))

(assert (= (and start!38496 res!228308) b!397575))

(assert (= (and b!397575 res!228305) b!397572))

(assert (= (and b!397572 res!228304) b!397579))

(assert (= (and b!397579 res!228302) b!397568))

(assert (= (and b!397568 res!228306) b!397571))

(assert (= (and b!397571 res!228307) b!397574))

(assert (= (and b!397574 res!228300) b!397569))

(assert (= (and b!397569 res!228309) b!397577))

(assert (= (and b!397577 res!228301) b!397576))

(assert (= (and b!397576 res!228303) b!397570))

(assert (= (and b!397573 condMapEmpty!16494) mapIsEmpty!16494))

(assert (= (and b!397573 (not condMapEmpty!16494)) mapNonEmpty!16494))

(get-info :version)

(assert (= (and mapNonEmpty!16494 ((_ is ValueCellFull!4614) mapValue!16494)) b!397580))

(assert (= (and b!397573 ((_ is ValueCellFull!4614) mapDefault!16494)) b!397578))

(assert (= start!38496 b!397573))

(declare-fun m!392767 () Bool)

(assert (=> b!397579 m!392767))

(declare-fun m!392769 () Bool)

(assert (=> b!397574 m!392769))

(declare-fun m!392771 () Bool)

(assert (=> start!38496 m!392771))

(declare-fun m!392773 () Bool)

(assert (=> start!38496 m!392773))

(declare-fun m!392775 () Bool)

(assert (=> b!397570 m!392775))

(declare-fun m!392777 () Bool)

(assert (=> b!397569 m!392777))

(declare-fun m!392779 () Bool)

(assert (=> b!397576 m!392779))

(declare-fun m!392781 () Bool)

(assert (=> b!397576 m!392781))

(declare-fun m!392783 () Bool)

(assert (=> b!397575 m!392783))

(declare-fun m!392785 () Bool)

(assert (=> mapNonEmpty!16494 m!392785))

(declare-fun m!392787 () Bool)

(assert (=> b!397577 m!392787))

(declare-fun m!392789 () Bool)

(assert (=> b!397568 m!392789))

(check-sat (not b!397575) (not b!397576) (not b!397579) (not b!397574) (not start!38496) (not b!397568) (not b!397570) (not b!397577) (not mapNonEmpty!16494) tp_is_empty!9915)
(check-sat)
