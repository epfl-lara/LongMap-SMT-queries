; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38454 () Bool)

(assert start!38454)

(declare-fun b!396749 () Bool)

(declare-fun res!227677 () Bool)

(declare-fun e!240039 () Bool)

(assert (=> b!396749 (=> (not res!227677) (not e!240039))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396749 (= res!227677 (validKeyInArray!0 k0!794))))

(declare-fun b!396750 () Bool)

(declare-fun e!240037 () Bool)

(assert (=> b!396750 (= e!240039 e!240037)))

(declare-fun res!227671 () Bool)

(assert (=> b!396750 (=> (not res!227671) (not e!240037))))

(declare-datatypes ((array!23659 0))(
  ( (array!23660 (arr!11279 (Array (_ BitVec 32) (_ BitVec 64))) (size!11631 (_ BitVec 32))) )
))
(declare-fun lt!187199 () array!23659)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23659 (_ BitVec 32)) Bool)

(assert (=> b!396750 (= res!227671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187199 mask!1025))))

(declare-fun _keys!709 () array!23659)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!396750 (= lt!187199 (array!23660 (store (arr!11279 _keys!709) i!563 k0!794) (size!11631 _keys!709)))))

(declare-fun b!396751 () Bool)

(declare-fun res!227679 () Bool)

(assert (=> b!396751 (=> (not res!227679) (not e!240039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!396751 (= res!227679 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!16431 () Bool)

(declare-fun mapRes!16431 () Bool)

(assert (=> mapIsEmpty!16431 mapRes!16431))

(declare-fun mapNonEmpty!16431 () Bool)

(declare-fun tp!32226 () Bool)

(declare-fun e!240041 () Bool)

(assert (=> mapNonEmpty!16431 (= mapRes!16431 (and tp!32226 e!240041))))

(declare-datatypes ((V!14269 0))(
  ( (V!14270 (val!4981 Int)) )
))
(declare-datatypes ((ValueCell!4593 0))(
  ( (ValueCellFull!4593 (v!7228 V!14269)) (EmptyCell!4593) )
))
(declare-datatypes ((array!23661 0))(
  ( (array!23662 (arr!11280 (Array (_ BitVec 32) ValueCell!4593)) (size!11632 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23661)

(declare-fun mapKey!16431 () (_ BitVec 32))

(declare-fun mapRest!16431 () (Array (_ BitVec 32) ValueCell!4593))

(declare-fun mapValue!16431 () ValueCell!4593)

(assert (=> mapNonEmpty!16431 (= (arr!11280 _values!549) (store mapRest!16431 mapKey!16431 mapValue!16431))))

(declare-fun b!396753 () Bool)

(declare-fun e!240038 () Bool)

(declare-fun e!240042 () Bool)

(assert (=> b!396753 (= e!240038 (and e!240042 mapRes!16431))))

(declare-fun condMapEmpty!16431 () Bool)

(declare-fun mapDefault!16431 () ValueCell!4593)

(assert (=> b!396753 (= condMapEmpty!16431 (= (arr!11280 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4593)) mapDefault!16431)))))

(declare-fun b!396754 () Bool)

(declare-fun res!227670 () Bool)

(assert (=> b!396754 (=> (not res!227670) (not e!240039))))

(declare-fun arrayContainsKey!0 (array!23659 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396754 (= res!227670 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!396755 () Bool)

(declare-fun res!227676 () Bool)

(assert (=> b!396755 (=> (not res!227676) (not e!240039))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!396755 (= res!227676 (and (= (size!11632 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11631 _keys!709) (size!11632 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!396756 () Bool)

(assert (=> b!396756 (= e!240037 false)))

(declare-fun lt!187198 () Bool)

(declare-datatypes ((List!6533 0))(
  ( (Nil!6530) (Cons!6529 (h!7385 (_ BitVec 64)) (t!11707 List!6533)) )
))
(declare-fun arrayNoDuplicates!0 (array!23659 (_ BitVec 32) List!6533) Bool)

(assert (=> b!396756 (= lt!187198 (arrayNoDuplicates!0 lt!187199 #b00000000000000000000000000000000 Nil!6530))))

(declare-fun b!396757 () Bool)

(declare-fun tp_is_empty!9873 () Bool)

(assert (=> b!396757 (= e!240042 tp_is_empty!9873)))

(declare-fun b!396758 () Bool)

(assert (=> b!396758 (= e!240041 tp_is_empty!9873)))

(declare-fun b!396759 () Bool)

(declare-fun res!227675 () Bool)

(assert (=> b!396759 (=> (not res!227675) (not e!240039))))

(assert (=> b!396759 (= res!227675 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6530))))

(declare-fun b!396760 () Bool)

(declare-fun res!227673 () Bool)

(assert (=> b!396760 (=> (not res!227673) (not e!240039))))

(assert (=> b!396760 (= res!227673 (or (= (select (arr!11279 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11279 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!396761 () Bool)

(declare-fun res!227678 () Bool)

(assert (=> b!396761 (=> (not res!227678) (not e!240039))))

(assert (=> b!396761 (= res!227678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!227674 () Bool)

(assert (=> start!38454 (=> (not res!227674) (not e!240039))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38454 (= res!227674 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11631 _keys!709))))))

(assert (=> start!38454 e!240039))

(assert (=> start!38454 true))

(declare-fun array_inv!8272 (array!23661) Bool)

(assert (=> start!38454 (and (array_inv!8272 _values!549) e!240038)))

(declare-fun array_inv!8273 (array!23659) Bool)

(assert (=> start!38454 (array_inv!8273 _keys!709)))

(declare-fun b!396752 () Bool)

(declare-fun res!227672 () Bool)

(assert (=> b!396752 (=> (not res!227672) (not e!240039))))

(assert (=> b!396752 (= res!227672 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11631 _keys!709))))))

(assert (= (and start!38454 res!227674) b!396751))

(assert (= (and b!396751 res!227679) b!396755))

(assert (= (and b!396755 res!227676) b!396761))

(assert (= (and b!396761 res!227678) b!396759))

(assert (= (and b!396759 res!227675) b!396752))

(assert (= (and b!396752 res!227672) b!396749))

(assert (= (and b!396749 res!227677) b!396760))

(assert (= (and b!396760 res!227673) b!396754))

(assert (= (and b!396754 res!227670) b!396750))

(assert (= (and b!396750 res!227671) b!396756))

(assert (= (and b!396753 condMapEmpty!16431) mapIsEmpty!16431))

(assert (= (and b!396753 (not condMapEmpty!16431)) mapNonEmpty!16431))

(get-info :version)

(assert (= (and mapNonEmpty!16431 ((_ is ValueCellFull!4593) mapValue!16431)) b!396758))

(assert (= (and b!396753 ((_ is ValueCellFull!4593) mapDefault!16431)) b!396757))

(assert (= start!38454 b!396753))

(declare-fun m!392263 () Bool)

(assert (=> start!38454 m!392263))

(declare-fun m!392265 () Bool)

(assert (=> start!38454 m!392265))

(declare-fun m!392267 () Bool)

(assert (=> b!396751 m!392267))

(declare-fun m!392269 () Bool)

(assert (=> b!396761 m!392269))

(declare-fun m!392271 () Bool)

(assert (=> b!396754 m!392271))

(declare-fun m!392273 () Bool)

(assert (=> b!396760 m!392273))

(declare-fun m!392275 () Bool)

(assert (=> mapNonEmpty!16431 m!392275))

(declare-fun m!392277 () Bool)

(assert (=> b!396756 m!392277))

(declare-fun m!392279 () Bool)

(assert (=> b!396749 m!392279))

(declare-fun m!392281 () Bool)

(assert (=> b!396759 m!392281))

(declare-fun m!392283 () Bool)

(assert (=> b!396750 m!392283))

(declare-fun m!392285 () Bool)

(assert (=> b!396750 m!392285))

(check-sat (not b!396751) (not b!396754) (not b!396756) (not b!396759) tp_is_empty!9873 (not start!38454) (not b!396750) (not b!396761) (not mapNonEmpty!16431) (not b!396749))
(check-sat)
