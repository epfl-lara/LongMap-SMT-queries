; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38510 () Bool)

(assert start!38510)

(declare-fun b!398065 () Bool)

(declare-fun e!240639 () Bool)

(declare-fun e!240637 () Bool)

(declare-fun mapRes!16536 () Bool)

(assert (=> b!398065 (= e!240639 (and e!240637 mapRes!16536))))

(declare-fun condMapEmpty!16536 () Bool)

(declare-datatypes ((V!14363 0))(
  ( (V!14364 (val!5016 Int)) )
))
(declare-datatypes ((ValueCell!4628 0))(
  ( (ValueCellFull!4628 (v!7264 V!14363)) (EmptyCell!4628) )
))
(declare-datatypes ((array!23778 0))(
  ( (array!23779 (arr!11338 (Array (_ BitVec 32) ValueCell!4628)) (size!11690 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23778)

(declare-fun mapDefault!16536 () ValueCell!4628)

(assert (=> b!398065 (= condMapEmpty!16536 (= (arr!11338 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4628)) mapDefault!16536)))))

(declare-fun res!228721 () Bool)

(declare-fun e!240640 () Bool)

(assert (=> start!38510 (=> (not res!228721) (not e!240640))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23780 0))(
  ( (array!23781 (arr!11339 (Array (_ BitVec 32) (_ BitVec 64))) (size!11691 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23780)

(assert (=> start!38510 (= res!228721 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11691 _keys!709))))))

(assert (=> start!38510 e!240640))

(assert (=> start!38510 true))

(declare-fun array_inv!8376 (array!23778) Bool)

(assert (=> start!38510 (and (array_inv!8376 _values!549) e!240639)))

(declare-fun array_inv!8377 (array!23780) Bool)

(assert (=> start!38510 (array_inv!8377 _keys!709)))

(declare-fun b!398066 () Bool)

(declare-fun e!240638 () Bool)

(declare-fun tp_is_empty!9943 () Bool)

(assert (=> b!398066 (= e!240638 tp_is_empty!9943)))

(declare-fun b!398067 () Bool)

(declare-fun e!240636 () Bool)

(assert (=> b!398067 (= e!240636 false)))

(declare-fun lt!187428 () Bool)

(declare-fun lt!187427 () array!23780)

(declare-datatypes ((List!6423 0))(
  ( (Nil!6420) (Cons!6419 (h!7275 (_ BitVec 64)) (t!11589 List!6423)) )
))
(declare-fun arrayNoDuplicates!0 (array!23780 (_ BitVec 32) List!6423) Bool)

(assert (=> b!398067 (= lt!187428 (arrayNoDuplicates!0 lt!187427 #b00000000000000000000000000000000 Nil!6420))))

(declare-fun mapNonEmpty!16536 () Bool)

(declare-fun tp!32331 () Bool)

(assert (=> mapNonEmpty!16536 (= mapRes!16536 (and tp!32331 e!240638))))

(declare-fun mapKey!16536 () (_ BitVec 32))

(declare-fun mapValue!16536 () ValueCell!4628)

(declare-fun mapRest!16536 () (Array (_ BitVec 32) ValueCell!4628))

(assert (=> mapNonEmpty!16536 (= (arr!11338 _values!549) (store mapRest!16536 mapKey!16536 mapValue!16536))))

(declare-fun b!398068 () Bool)

(declare-fun res!228724 () Bool)

(assert (=> b!398068 (=> (not res!228724) (not e!240640))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!398068 (= res!228724 (or (= (select (arr!11339 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11339 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!398069 () Bool)

(declare-fun res!228726 () Bool)

(assert (=> b!398069 (=> (not res!228726) (not e!240640))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!398069 (= res!228726 (validKeyInArray!0 k0!794))))

(declare-fun b!398070 () Bool)

(declare-fun res!228725 () Bool)

(assert (=> b!398070 (=> (not res!228725) (not e!240640))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398070 (= res!228725 (validMask!0 mask!1025))))

(declare-fun b!398071 () Bool)

(declare-fun res!228717 () Bool)

(assert (=> b!398071 (=> (not res!228717) (not e!240640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23780 (_ BitVec 32)) Bool)

(assert (=> b!398071 (= res!228717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!398072 () Bool)

(declare-fun res!228718 () Bool)

(assert (=> b!398072 (=> (not res!228718) (not e!240640))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!398072 (= res!228718 (and (= (size!11690 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11691 _keys!709) (size!11690 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!398073 () Bool)

(assert (=> b!398073 (= e!240640 e!240636)))

(declare-fun res!228720 () Bool)

(assert (=> b!398073 (=> (not res!228720) (not e!240636))))

(assert (=> b!398073 (= res!228720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187427 mask!1025))))

(assert (=> b!398073 (= lt!187427 (array!23781 (store (arr!11339 _keys!709) i!563 k0!794) (size!11691 _keys!709)))))

(declare-fun b!398074 () Bool)

(declare-fun res!228723 () Bool)

(assert (=> b!398074 (=> (not res!228723) (not e!240640))))

(assert (=> b!398074 (= res!228723 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11691 _keys!709))))))

(declare-fun b!398075 () Bool)

(declare-fun res!228722 () Bool)

(assert (=> b!398075 (=> (not res!228722) (not e!240640))))

(assert (=> b!398075 (= res!228722 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6420))))

(declare-fun mapIsEmpty!16536 () Bool)

(assert (=> mapIsEmpty!16536 mapRes!16536))

(declare-fun b!398076 () Bool)

(declare-fun res!228719 () Bool)

(assert (=> b!398076 (=> (not res!228719) (not e!240640))))

(declare-fun arrayContainsKey!0 (array!23780 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!398076 (= res!228719 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!398077 () Bool)

(assert (=> b!398077 (= e!240637 tp_is_empty!9943)))

(assert (= (and start!38510 res!228721) b!398070))

(assert (= (and b!398070 res!228725) b!398072))

(assert (= (and b!398072 res!228718) b!398071))

(assert (= (and b!398071 res!228717) b!398075))

(assert (= (and b!398075 res!228722) b!398074))

(assert (= (and b!398074 res!228723) b!398069))

(assert (= (and b!398069 res!228726) b!398068))

(assert (= (and b!398068 res!228724) b!398076))

(assert (= (and b!398076 res!228719) b!398073))

(assert (= (and b!398073 res!228720) b!398067))

(assert (= (and b!398065 condMapEmpty!16536) mapIsEmpty!16536))

(assert (= (and b!398065 (not condMapEmpty!16536)) mapNonEmpty!16536))

(get-info :version)

(assert (= (and mapNonEmpty!16536 ((_ is ValueCellFull!4628) mapValue!16536)) b!398066))

(assert (= (and b!398065 ((_ is ValueCellFull!4628) mapDefault!16536)) b!398077))

(assert (= start!38510 b!398065))

(declare-fun m!393333 () Bool)

(assert (=> b!398070 m!393333))

(declare-fun m!393335 () Bool)

(assert (=> b!398071 m!393335))

(declare-fun m!393337 () Bool)

(assert (=> b!398069 m!393337))

(declare-fun m!393339 () Bool)

(assert (=> mapNonEmpty!16536 m!393339))

(declare-fun m!393341 () Bool)

(assert (=> b!398068 m!393341))

(declare-fun m!393343 () Bool)

(assert (=> b!398076 m!393343))

(declare-fun m!393345 () Bool)

(assert (=> b!398067 m!393345))

(declare-fun m!393347 () Bool)

(assert (=> start!38510 m!393347))

(declare-fun m!393349 () Bool)

(assert (=> start!38510 m!393349))

(declare-fun m!393351 () Bool)

(assert (=> b!398075 m!393351))

(declare-fun m!393353 () Bool)

(assert (=> b!398073 m!393353))

(declare-fun m!393355 () Bool)

(assert (=> b!398073 m!393355))

(check-sat (not b!398069) (not b!398067) (not b!398070) (not b!398073) (not start!38510) (not b!398071) tp_is_empty!9943 (not b!398076) (not b!398075) (not mapNonEmpty!16536))
(check-sat)
