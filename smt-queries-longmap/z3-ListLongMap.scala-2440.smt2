; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38444 () Bool)

(assert start!38444)

(declare-fun b!396778 () Bool)

(declare-fun e!240046 () Bool)

(declare-fun tp_is_empty!9877 () Bool)

(assert (=> b!396778 (= e!240046 tp_is_empty!9877)))

(declare-fun mapNonEmpty!16437 () Bool)

(declare-fun mapRes!16437 () Bool)

(declare-fun tp!32232 () Bool)

(declare-fun e!240042 () Bool)

(assert (=> mapNonEmpty!16437 (= mapRes!16437 (and tp!32232 e!240042))))

(declare-fun mapKey!16437 () (_ BitVec 32))

(declare-datatypes ((V!14275 0))(
  ( (V!14276 (val!4983 Int)) )
))
(declare-datatypes ((ValueCell!4595 0))(
  ( (ValueCellFull!4595 (v!7231 V!14275)) (EmptyCell!4595) )
))
(declare-fun mapRest!16437 () (Array (_ BitVec 32) ValueCell!4595))

(declare-datatypes ((array!23656 0))(
  ( (array!23657 (arr!11277 (Array (_ BitVec 32) ValueCell!4595)) (size!11629 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23656)

(declare-fun mapValue!16437 () ValueCell!4595)

(assert (=> mapNonEmpty!16437 (= (arr!11277 _values!549) (store mapRest!16437 mapKey!16437 mapValue!16437))))

(declare-fun b!396779 () Bool)

(declare-fun res!227729 () Bool)

(declare-fun e!240043 () Bool)

(assert (=> b!396779 (=> (not res!227729) (not e!240043))))

(declare-datatypes ((array!23658 0))(
  ( (array!23659 (arr!11278 (Array (_ BitVec 32) (_ BitVec 64))) (size!11630 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23658)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23658 (_ BitVec 32)) Bool)

(assert (=> b!396779 (= res!227729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!396780 () Bool)

(assert (=> b!396780 (= e!240042 tp_is_empty!9877)))

(declare-fun b!396781 () Bool)

(declare-fun res!227734 () Bool)

(assert (=> b!396781 (=> (not res!227734) (not e!240043))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396781 (= res!227734 (validKeyInArray!0 k0!794))))

(declare-fun res!227735 () Bool)

(assert (=> start!38444 (=> (not res!227735) (not e!240043))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38444 (= res!227735 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11630 _keys!709))))))

(assert (=> start!38444 e!240043))

(assert (=> start!38444 true))

(declare-fun e!240045 () Bool)

(declare-fun array_inv!8334 (array!23656) Bool)

(assert (=> start!38444 (and (array_inv!8334 _values!549) e!240045)))

(declare-fun array_inv!8335 (array!23658) Bool)

(assert (=> start!38444 (array_inv!8335 _keys!709)))

(declare-fun b!396782 () Bool)

(declare-fun e!240044 () Bool)

(assert (=> b!396782 (= e!240044 false)))

(declare-fun lt!187230 () Bool)

(declare-fun lt!187229 () array!23658)

(declare-datatypes ((List!6401 0))(
  ( (Nil!6398) (Cons!6397 (h!7253 (_ BitVec 64)) (t!11567 List!6401)) )
))
(declare-fun arrayNoDuplicates!0 (array!23658 (_ BitVec 32) List!6401) Bool)

(assert (=> b!396782 (= lt!187230 (arrayNoDuplicates!0 lt!187229 #b00000000000000000000000000000000 Nil!6398))))

(declare-fun b!396783 () Bool)

(assert (=> b!396783 (= e!240043 e!240044)))

(declare-fun res!227728 () Bool)

(assert (=> b!396783 (=> (not res!227728) (not e!240044))))

(assert (=> b!396783 (= res!227728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187229 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!396783 (= lt!187229 (array!23659 (store (arr!11278 _keys!709) i!563 k0!794) (size!11630 _keys!709)))))

(declare-fun b!396784 () Bool)

(declare-fun res!227730 () Bool)

(assert (=> b!396784 (=> (not res!227730) (not e!240043))))

(assert (=> b!396784 (= res!227730 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6398))))

(declare-fun b!396785 () Bool)

(declare-fun res!227727 () Bool)

(assert (=> b!396785 (=> (not res!227727) (not e!240043))))

(assert (=> b!396785 (= res!227727 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11630 _keys!709))))))

(declare-fun b!396786 () Bool)

(assert (=> b!396786 (= e!240045 (and e!240046 mapRes!16437))))

(declare-fun condMapEmpty!16437 () Bool)

(declare-fun mapDefault!16437 () ValueCell!4595)

(assert (=> b!396786 (= condMapEmpty!16437 (= (arr!11277 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4595)) mapDefault!16437)))))

(declare-fun b!396787 () Bool)

(declare-fun res!227736 () Bool)

(assert (=> b!396787 (=> (not res!227736) (not e!240043))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!396787 (= res!227736 (validMask!0 mask!1025))))

(declare-fun b!396788 () Bool)

(declare-fun res!227731 () Bool)

(assert (=> b!396788 (=> (not res!227731) (not e!240043))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!396788 (= res!227731 (and (= (size!11629 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11630 _keys!709) (size!11629 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!16437 () Bool)

(assert (=> mapIsEmpty!16437 mapRes!16437))

(declare-fun b!396789 () Bool)

(declare-fun res!227732 () Bool)

(assert (=> b!396789 (=> (not res!227732) (not e!240043))))

(assert (=> b!396789 (= res!227732 (or (= (select (arr!11278 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11278 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!396790 () Bool)

(declare-fun res!227733 () Bool)

(assert (=> b!396790 (=> (not res!227733) (not e!240043))))

(declare-fun arrayContainsKey!0 (array!23658 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396790 (= res!227733 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!38444 res!227735) b!396787))

(assert (= (and b!396787 res!227736) b!396788))

(assert (= (and b!396788 res!227731) b!396779))

(assert (= (and b!396779 res!227729) b!396784))

(assert (= (and b!396784 res!227730) b!396785))

(assert (= (and b!396785 res!227727) b!396781))

(assert (= (and b!396781 res!227734) b!396789))

(assert (= (and b!396789 res!227732) b!396790))

(assert (= (and b!396790 res!227733) b!396783))

(assert (= (and b!396783 res!227728) b!396782))

(assert (= (and b!396786 condMapEmpty!16437) mapIsEmpty!16437))

(assert (= (and b!396786 (not condMapEmpty!16437)) mapNonEmpty!16437))

(get-info :version)

(assert (= (and mapNonEmpty!16437 ((_ is ValueCellFull!4595) mapValue!16437)) b!396780))

(assert (= (and b!396786 ((_ is ValueCellFull!4595) mapDefault!16437)) b!396778))

(assert (= start!38444 b!396786))

(declare-fun m!392541 () Bool)

(assert (=> b!396779 m!392541))

(declare-fun m!392543 () Bool)

(assert (=> b!396781 m!392543))

(declare-fun m!392545 () Bool)

(assert (=> b!396789 m!392545))

(declare-fun m!392547 () Bool)

(assert (=> b!396784 m!392547))

(declare-fun m!392549 () Bool)

(assert (=> b!396787 m!392549))

(declare-fun m!392551 () Bool)

(assert (=> b!396790 m!392551))

(declare-fun m!392553 () Bool)

(assert (=> start!38444 m!392553))

(declare-fun m!392555 () Bool)

(assert (=> start!38444 m!392555))

(declare-fun m!392557 () Bool)

(assert (=> b!396782 m!392557))

(declare-fun m!392559 () Bool)

(assert (=> mapNonEmpty!16437 m!392559))

(declare-fun m!392561 () Bool)

(assert (=> b!396783 m!392561))

(declare-fun m!392563 () Bool)

(assert (=> b!396783 m!392563))

(check-sat (not start!38444) (not mapNonEmpty!16437) (not b!396781) (not b!396787) (not b!396782) (not b!396783) (not b!396784) (not b!396790) tp_is_empty!9877 (not b!396779))
(check-sat)
