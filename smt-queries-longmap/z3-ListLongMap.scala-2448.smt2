; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38508 () Bool)

(assert start!38508)

(declare-fun b!397802 () Bool)

(declare-fun res!228486 () Bool)

(declare-fun e!240526 () Bool)

(assert (=> b!397802 (=> (not res!228486) (not e!240526))))

(declare-datatypes ((array!23765 0))(
  ( (array!23766 (arr!11332 (Array (_ BitVec 32) (_ BitVec 64))) (size!11684 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23765)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23765 (_ BitVec 32)) Bool)

(assert (=> b!397802 (= res!228486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!397803 () Bool)

(declare-fun res!228484 () Bool)

(assert (=> b!397803 (=> (not res!228484) (not e!240526))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14341 0))(
  ( (V!14342 (val!5008 Int)) )
))
(declare-datatypes ((ValueCell!4620 0))(
  ( (ValueCellFull!4620 (v!7255 V!14341)) (EmptyCell!4620) )
))
(declare-datatypes ((array!23767 0))(
  ( (array!23768 (arr!11333 (Array (_ BitVec 32) ValueCell!4620)) (size!11685 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23767)

(assert (=> b!397803 (= res!228484 (and (= (size!11685 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11684 _keys!709) (size!11685 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!397804 () Bool)

(declare-fun e!240523 () Bool)

(declare-fun e!240527 () Bool)

(declare-fun mapRes!16512 () Bool)

(assert (=> b!397804 (= e!240523 (and e!240527 mapRes!16512))))

(declare-fun condMapEmpty!16512 () Bool)

(declare-fun mapDefault!16512 () ValueCell!4620)

(assert (=> b!397804 (= condMapEmpty!16512 (= (arr!11333 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4620)) mapDefault!16512)))))

(declare-fun b!397805 () Bool)

(declare-fun res!228480 () Bool)

(assert (=> b!397805 (=> (not res!228480) (not e!240526))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397805 (= res!228480 (validKeyInArray!0 k0!794))))

(declare-fun b!397806 () Bool)

(declare-fun tp_is_empty!9927 () Bool)

(assert (=> b!397806 (= e!240527 tp_is_empty!9927)))

(declare-fun b!397807 () Bool)

(declare-fun res!228481 () Bool)

(assert (=> b!397807 (=> (not res!228481) (not e!240526))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397807 (= res!228481 (or (= (select (arr!11332 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11332 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397808 () Bool)

(declare-fun res!228487 () Bool)

(assert (=> b!397808 (=> (not res!228487) (not e!240526))))

(assert (=> b!397808 (= res!228487 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11684 _keys!709))))))

(declare-fun b!397809 () Bool)

(declare-fun res!228488 () Bool)

(assert (=> b!397809 (=> (not res!228488) (not e!240526))))

(declare-datatypes ((List!6557 0))(
  ( (Nil!6554) (Cons!6553 (h!7409 (_ BitVec 64)) (t!11731 List!6557)) )
))
(declare-fun arrayNoDuplicates!0 (array!23765 (_ BitVec 32) List!6557) Bool)

(assert (=> b!397809 (= res!228488 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6554))))

(declare-fun b!397810 () Bool)

(declare-fun res!228489 () Bool)

(assert (=> b!397810 (=> (not res!228489) (not e!240526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397810 (= res!228489 (validMask!0 mask!1025))))

(declare-fun res!228482 () Bool)

(assert (=> start!38508 (=> (not res!228482) (not e!240526))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38508 (= res!228482 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11684 _keys!709))))))

(assert (=> start!38508 e!240526))

(assert (=> start!38508 true))

(declare-fun array_inv!8304 (array!23767) Bool)

(assert (=> start!38508 (and (array_inv!8304 _values!549) e!240523)))

(declare-fun array_inv!8305 (array!23765) Bool)

(assert (=> start!38508 (array_inv!8305 _keys!709)))

(declare-fun b!397811 () Bool)

(declare-fun e!240528 () Bool)

(assert (=> b!397811 (= e!240526 e!240528)))

(declare-fun res!228483 () Bool)

(assert (=> b!397811 (=> (not res!228483) (not e!240528))))

(declare-fun lt!187361 () array!23765)

(assert (=> b!397811 (= res!228483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187361 mask!1025))))

(assert (=> b!397811 (= lt!187361 (array!23766 (store (arr!11332 _keys!709) i!563 k0!794) (size!11684 _keys!709)))))

(declare-fun mapIsEmpty!16512 () Bool)

(assert (=> mapIsEmpty!16512 mapRes!16512))

(declare-fun b!397812 () Bool)

(declare-fun e!240525 () Bool)

(assert (=> b!397812 (= e!240525 tp_is_empty!9927)))

(declare-fun b!397813 () Bool)

(declare-fun res!228485 () Bool)

(assert (=> b!397813 (=> (not res!228485) (not e!240526))))

(declare-fun arrayContainsKey!0 (array!23765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397813 (= res!228485 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16512 () Bool)

(declare-fun tp!32307 () Bool)

(assert (=> mapNonEmpty!16512 (= mapRes!16512 (and tp!32307 e!240525))))

(declare-fun mapRest!16512 () (Array (_ BitVec 32) ValueCell!4620))

(declare-fun mapKey!16512 () (_ BitVec 32))

(declare-fun mapValue!16512 () ValueCell!4620)

(assert (=> mapNonEmpty!16512 (= (arr!11333 _values!549) (store mapRest!16512 mapKey!16512 mapValue!16512))))

(declare-fun b!397814 () Bool)

(assert (=> b!397814 (= e!240528 false)))

(declare-fun lt!187360 () Bool)

(assert (=> b!397814 (= lt!187360 (arrayNoDuplicates!0 lt!187361 #b00000000000000000000000000000000 Nil!6554))))

(assert (= (and start!38508 res!228482) b!397810))

(assert (= (and b!397810 res!228489) b!397803))

(assert (= (and b!397803 res!228484) b!397802))

(assert (= (and b!397802 res!228486) b!397809))

(assert (= (and b!397809 res!228488) b!397808))

(assert (= (and b!397808 res!228487) b!397805))

(assert (= (and b!397805 res!228480) b!397807))

(assert (= (and b!397807 res!228481) b!397813))

(assert (= (and b!397813 res!228485) b!397811))

(assert (= (and b!397811 res!228483) b!397814))

(assert (= (and b!397804 condMapEmpty!16512) mapIsEmpty!16512))

(assert (= (and b!397804 (not condMapEmpty!16512)) mapNonEmpty!16512))

(get-info :version)

(assert (= (and mapNonEmpty!16512 ((_ is ValueCellFull!4620) mapValue!16512)) b!397812))

(assert (= (and b!397804 ((_ is ValueCellFull!4620) mapDefault!16512)) b!397806))

(assert (= start!38508 b!397804))

(declare-fun m!392911 () Bool)

(assert (=> b!397811 m!392911))

(declare-fun m!392913 () Bool)

(assert (=> b!397811 m!392913))

(declare-fun m!392915 () Bool)

(assert (=> b!397814 m!392915))

(declare-fun m!392917 () Bool)

(assert (=> b!397810 m!392917))

(declare-fun m!392919 () Bool)

(assert (=> b!397813 m!392919))

(declare-fun m!392921 () Bool)

(assert (=> b!397807 m!392921))

(declare-fun m!392923 () Bool)

(assert (=> b!397805 m!392923))

(declare-fun m!392925 () Bool)

(assert (=> b!397802 m!392925))

(declare-fun m!392927 () Bool)

(assert (=> mapNonEmpty!16512 m!392927))

(declare-fun m!392929 () Bool)

(assert (=> start!38508 m!392929))

(declare-fun m!392931 () Bool)

(assert (=> start!38508 m!392931))

(declare-fun m!392933 () Bool)

(assert (=> b!397809 m!392933))

(check-sat tp_is_empty!9927 (not b!397809) (not b!397813) (not b!397805) (not b!397811) (not b!397814) (not mapNonEmpty!16512) (not b!397802) (not start!38508) (not b!397810))
(check-sat)
