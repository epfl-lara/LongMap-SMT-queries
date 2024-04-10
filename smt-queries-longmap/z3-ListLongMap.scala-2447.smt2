; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38502 () Bool)

(assert start!38502)

(declare-fun b!397685 () Bool)

(declare-fun e!240470 () Bool)

(declare-fun tp_is_empty!9921 () Bool)

(assert (=> b!397685 (= e!240470 tp_is_empty!9921)))

(declare-fun b!397686 () Bool)

(declare-fun e!240469 () Bool)

(assert (=> b!397686 (= e!240469 false)))

(declare-fun lt!187343 () Bool)

(declare-datatypes ((array!23755 0))(
  ( (array!23756 (arr!11327 (Array (_ BitVec 32) (_ BitVec 64))) (size!11679 (_ BitVec 32))) )
))
(declare-fun lt!187342 () array!23755)

(declare-datatypes ((List!6555 0))(
  ( (Nil!6552) (Cons!6551 (h!7407 (_ BitVec 64)) (t!11729 List!6555)) )
))
(declare-fun arrayNoDuplicates!0 (array!23755 (_ BitVec 32) List!6555) Bool)

(assert (=> b!397686 (= lt!187343 (arrayNoDuplicates!0 lt!187342 #b00000000000000000000000000000000 Nil!6552))))

(declare-fun b!397687 () Bool)

(declare-fun e!240474 () Bool)

(declare-fun mapRes!16503 () Bool)

(assert (=> b!397687 (= e!240474 (and e!240470 mapRes!16503))))

(declare-fun condMapEmpty!16503 () Bool)

(declare-datatypes ((V!14333 0))(
  ( (V!14334 (val!5005 Int)) )
))
(declare-datatypes ((ValueCell!4617 0))(
  ( (ValueCellFull!4617 (v!7252 V!14333)) (EmptyCell!4617) )
))
(declare-datatypes ((array!23757 0))(
  ( (array!23758 (arr!11328 (Array (_ BitVec 32) ValueCell!4617)) (size!11680 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23757)

(declare-fun mapDefault!16503 () ValueCell!4617)

(assert (=> b!397687 (= condMapEmpty!16503 (= (arr!11328 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4617)) mapDefault!16503)))))

(declare-fun b!397688 () Bool)

(declare-fun res!228394 () Bool)

(declare-fun e!240473 () Bool)

(assert (=> b!397688 (=> (not res!228394) (not e!240473))))

(declare-fun _keys!709 () array!23755)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397688 (= res!228394 (or (= (select (arr!11327 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11327 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!228398 () Bool)

(assert (=> start!38502 (=> (not res!228398) (not e!240473))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38502 (= res!228398 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11679 _keys!709))))))

(assert (=> start!38502 e!240473))

(assert (=> start!38502 true))

(declare-fun array_inv!8300 (array!23757) Bool)

(assert (=> start!38502 (and (array_inv!8300 _values!549) e!240474)))

(declare-fun array_inv!8301 (array!23755) Bool)

(assert (=> start!38502 (array_inv!8301 _keys!709)))

(declare-fun b!397689 () Bool)

(declare-fun res!228397 () Bool)

(assert (=> b!397689 (=> (not res!228397) (not e!240473))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397689 (= res!228397 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!397690 () Bool)

(assert (=> b!397690 (= e!240473 e!240469)))

(declare-fun res!228391 () Bool)

(assert (=> b!397690 (=> (not res!228391) (not e!240469))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23755 (_ BitVec 32)) Bool)

(assert (=> b!397690 (= res!228391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187342 mask!1025))))

(assert (=> b!397690 (= lt!187342 (array!23756 (store (arr!11327 _keys!709) i!563 k0!794) (size!11679 _keys!709)))))

(declare-fun b!397691 () Bool)

(declare-fun res!228399 () Bool)

(assert (=> b!397691 (=> (not res!228399) (not e!240473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397691 (= res!228399 (validMask!0 mask!1025))))

(declare-fun b!397692 () Bool)

(declare-fun e!240472 () Bool)

(assert (=> b!397692 (= e!240472 tp_is_empty!9921)))

(declare-fun b!397693 () Bool)

(declare-fun res!228396 () Bool)

(assert (=> b!397693 (=> (not res!228396) (not e!240473))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397693 (= res!228396 (validKeyInArray!0 k0!794))))

(declare-fun b!397694 () Bool)

(declare-fun res!228390 () Bool)

(assert (=> b!397694 (=> (not res!228390) (not e!240473))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!397694 (= res!228390 (and (= (size!11680 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11679 _keys!709) (size!11680 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!397695 () Bool)

(declare-fun res!228395 () Bool)

(assert (=> b!397695 (=> (not res!228395) (not e!240473))))

(assert (=> b!397695 (= res!228395 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6552))))

(declare-fun mapIsEmpty!16503 () Bool)

(assert (=> mapIsEmpty!16503 mapRes!16503))

(declare-fun mapNonEmpty!16503 () Bool)

(declare-fun tp!32298 () Bool)

(assert (=> mapNonEmpty!16503 (= mapRes!16503 (and tp!32298 e!240472))))

(declare-fun mapKey!16503 () (_ BitVec 32))

(declare-fun mapRest!16503 () (Array (_ BitVec 32) ValueCell!4617))

(declare-fun mapValue!16503 () ValueCell!4617)

(assert (=> mapNonEmpty!16503 (= (arr!11328 _values!549) (store mapRest!16503 mapKey!16503 mapValue!16503))))

(declare-fun b!397696 () Bool)

(declare-fun res!228393 () Bool)

(assert (=> b!397696 (=> (not res!228393) (not e!240473))))

(assert (=> b!397696 (= res!228393 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11679 _keys!709))))))

(declare-fun b!397697 () Bool)

(declare-fun res!228392 () Bool)

(assert (=> b!397697 (=> (not res!228392) (not e!240473))))

(assert (=> b!397697 (= res!228392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!38502 res!228398) b!397691))

(assert (= (and b!397691 res!228399) b!397694))

(assert (= (and b!397694 res!228390) b!397697))

(assert (= (and b!397697 res!228392) b!397695))

(assert (= (and b!397695 res!228395) b!397696))

(assert (= (and b!397696 res!228393) b!397693))

(assert (= (and b!397693 res!228396) b!397688))

(assert (= (and b!397688 res!228394) b!397689))

(assert (= (and b!397689 res!228397) b!397690))

(assert (= (and b!397690 res!228391) b!397686))

(assert (= (and b!397687 condMapEmpty!16503) mapIsEmpty!16503))

(assert (= (and b!397687 (not condMapEmpty!16503)) mapNonEmpty!16503))

(get-info :version)

(assert (= (and mapNonEmpty!16503 ((_ is ValueCellFull!4617) mapValue!16503)) b!397692))

(assert (= (and b!397687 ((_ is ValueCellFull!4617) mapDefault!16503)) b!397685))

(assert (= start!38502 b!397687))

(declare-fun m!392839 () Bool)

(assert (=> b!397690 m!392839))

(declare-fun m!392841 () Bool)

(assert (=> b!397690 m!392841))

(declare-fun m!392843 () Bool)

(assert (=> b!397697 m!392843))

(declare-fun m!392845 () Bool)

(assert (=> b!397695 m!392845))

(declare-fun m!392847 () Bool)

(assert (=> b!397689 m!392847))

(declare-fun m!392849 () Bool)

(assert (=> b!397688 m!392849))

(declare-fun m!392851 () Bool)

(assert (=> mapNonEmpty!16503 m!392851))

(declare-fun m!392853 () Bool)

(assert (=> b!397693 m!392853))

(declare-fun m!392855 () Bool)

(assert (=> b!397686 m!392855))

(declare-fun m!392857 () Bool)

(assert (=> start!38502 m!392857))

(declare-fun m!392859 () Bool)

(assert (=> start!38502 m!392859))

(declare-fun m!392861 () Bool)

(assert (=> b!397691 m!392861))

(check-sat (not mapNonEmpty!16503) (not b!397691) (not b!397697) (not b!397690) (not b!397686) tp_is_empty!9921 (not b!397689) (not b!397695) (not start!38502) (not b!397693))
(check-sat)
