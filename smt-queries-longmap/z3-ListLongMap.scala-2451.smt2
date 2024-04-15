; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38510 () Bool)

(assert start!38510)

(declare-fun b!397843 () Bool)

(declare-fun e!240498 () Bool)

(assert (=> b!397843 (= e!240498 false)))

(declare-fun lt!187174 () Bool)

(declare-datatypes ((array!23777 0))(
  ( (array!23778 (arr!11338 (Array (_ BitVec 32) (_ BitVec 64))) (size!11691 (_ BitVec 32))) )
))
(declare-fun lt!187175 () array!23777)

(declare-datatypes ((List!6521 0))(
  ( (Nil!6518) (Cons!6517 (h!7373 (_ BitVec 64)) (t!11686 List!6521)) )
))
(declare-fun arrayNoDuplicates!0 (array!23777 (_ BitVec 32) List!6521) Bool)

(assert (=> b!397843 (= lt!187174 (arrayNoDuplicates!0 lt!187175 #b00000000000000000000000000000000 Nil!6518))))

(declare-fun b!397844 () Bool)

(declare-fun res!228597 () Bool)

(declare-fun e!240496 () Bool)

(assert (=> b!397844 (=> (not res!228597) (not e!240496))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!23777)

(assert (=> b!397844 (= res!228597 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11691 _keys!709))))))

(declare-fun mapIsEmpty!16536 () Bool)

(declare-fun mapRes!16536 () Bool)

(assert (=> mapIsEmpty!16536 mapRes!16536))

(declare-fun b!397845 () Bool)

(declare-fun e!240494 () Bool)

(declare-fun tp_is_empty!9943 () Bool)

(assert (=> b!397845 (= e!240494 tp_is_empty!9943)))

(declare-fun b!397846 () Bool)

(declare-fun e!240493 () Bool)

(declare-fun e!240497 () Bool)

(assert (=> b!397846 (= e!240493 (and e!240497 mapRes!16536))))

(declare-fun condMapEmpty!16536 () Bool)

(declare-datatypes ((V!14363 0))(
  ( (V!14364 (val!5016 Int)) )
))
(declare-datatypes ((ValueCell!4628 0))(
  ( (ValueCellFull!4628 (v!7257 V!14363)) (EmptyCell!4628) )
))
(declare-datatypes ((array!23779 0))(
  ( (array!23780 (arr!11339 (Array (_ BitVec 32) ValueCell!4628)) (size!11692 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23779)

(declare-fun mapDefault!16536 () ValueCell!4628)

(assert (=> b!397846 (= condMapEmpty!16536 (= (arr!11339 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4628)) mapDefault!16536)))))

(declare-fun b!397847 () Bool)

(declare-fun res!228599 () Bool)

(assert (=> b!397847 (=> (not res!228599) (not e!240496))))

(assert (=> b!397847 (= res!228599 (or (= (select (arr!11338 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11338 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397848 () Bool)

(assert (=> b!397848 (= e!240497 tp_is_empty!9943)))

(declare-fun b!397849 () Bool)

(declare-fun res!228600 () Bool)

(assert (=> b!397849 (=> (not res!228600) (not e!240496))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23777 (_ BitVec 32)) Bool)

(assert (=> b!397849 (= res!228600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!397851 () Bool)

(declare-fun res!228596 () Bool)

(assert (=> b!397851 (=> (not res!228596) (not e!240496))))

(assert (=> b!397851 (= res!228596 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6518))))

(declare-fun b!397852 () Bool)

(declare-fun res!228595 () Bool)

(assert (=> b!397852 (=> (not res!228595) (not e!240496))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397852 (= res!228595 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!228592 () Bool)

(assert (=> start!38510 (=> (not res!228592) (not e!240496))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38510 (= res!228592 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11691 _keys!709))))))

(assert (=> start!38510 e!240496))

(assert (=> start!38510 true))

(declare-fun array_inv!8324 (array!23779) Bool)

(assert (=> start!38510 (and (array_inv!8324 _values!549) e!240493)))

(declare-fun array_inv!8325 (array!23777) Bool)

(assert (=> start!38510 (array_inv!8325 _keys!709)))

(declare-fun b!397850 () Bool)

(declare-fun res!228594 () Bool)

(assert (=> b!397850 (=> (not res!228594) (not e!240496))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397850 (= res!228594 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!16536 () Bool)

(declare-fun tp!32331 () Bool)

(assert (=> mapNonEmpty!16536 (= mapRes!16536 (and tp!32331 e!240494))))

(declare-fun mapRest!16536 () (Array (_ BitVec 32) ValueCell!4628))

(declare-fun mapKey!16536 () (_ BitVec 32))

(declare-fun mapValue!16536 () ValueCell!4628)

(assert (=> mapNonEmpty!16536 (= (arr!11339 _values!549) (store mapRest!16536 mapKey!16536 mapValue!16536))))

(declare-fun b!397853 () Bool)

(declare-fun res!228593 () Bool)

(assert (=> b!397853 (=> (not res!228593) (not e!240496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397853 (= res!228593 (validMask!0 mask!1025))))

(declare-fun b!397854 () Bool)

(assert (=> b!397854 (= e!240496 e!240498)))

(declare-fun res!228591 () Bool)

(assert (=> b!397854 (=> (not res!228591) (not e!240498))))

(assert (=> b!397854 (= res!228591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187175 mask!1025))))

(assert (=> b!397854 (= lt!187175 (array!23778 (store (arr!11338 _keys!709) i!563 k0!794) (size!11691 _keys!709)))))

(declare-fun b!397855 () Bool)

(declare-fun res!228598 () Bool)

(assert (=> b!397855 (=> (not res!228598) (not e!240496))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!397855 (= res!228598 (and (= (size!11692 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11691 _keys!709) (size!11692 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!38510 res!228592) b!397853))

(assert (= (and b!397853 res!228593) b!397855))

(assert (= (and b!397855 res!228598) b!397849))

(assert (= (and b!397849 res!228600) b!397851))

(assert (= (and b!397851 res!228596) b!397844))

(assert (= (and b!397844 res!228597) b!397850))

(assert (= (and b!397850 res!228594) b!397847))

(assert (= (and b!397847 res!228599) b!397852))

(assert (= (and b!397852 res!228595) b!397854))

(assert (= (and b!397854 res!228591) b!397843))

(assert (= (and b!397846 condMapEmpty!16536) mapIsEmpty!16536))

(assert (= (and b!397846 (not condMapEmpty!16536)) mapNonEmpty!16536))

(get-info :version)

(assert (= (and mapNonEmpty!16536 ((_ is ValueCellFull!4628) mapValue!16536)) b!397845))

(assert (= (and b!397846 ((_ is ValueCellFull!4628) mapDefault!16536)) b!397848))

(assert (= start!38510 b!397846))

(declare-fun m!392379 () Bool)

(assert (=> b!397850 m!392379))

(declare-fun m!392381 () Bool)

(assert (=> b!397851 m!392381))

(declare-fun m!392383 () Bool)

(assert (=> b!397852 m!392383))

(declare-fun m!392385 () Bool)

(assert (=> b!397853 m!392385))

(declare-fun m!392387 () Bool)

(assert (=> start!38510 m!392387))

(declare-fun m!392389 () Bool)

(assert (=> start!38510 m!392389))

(declare-fun m!392391 () Bool)

(assert (=> b!397847 m!392391))

(declare-fun m!392393 () Bool)

(assert (=> mapNonEmpty!16536 m!392393))

(declare-fun m!392395 () Bool)

(assert (=> b!397854 m!392395))

(declare-fun m!392397 () Bool)

(assert (=> b!397854 m!392397))

(declare-fun m!392399 () Bool)

(assert (=> b!397843 m!392399))

(declare-fun m!392401 () Bool)

(assert (=> b!397849 m!392401))

(check-sat (not b!397851) tp_is_empty!9943 (not b!397853) (not b!397843) (not b!397849) (not mapNonEmpty!16536) (not b!397854) (not start!38510) (not b!397850) (not b!397852))
(check-sat)
