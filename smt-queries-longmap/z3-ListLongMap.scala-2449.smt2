; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38498 () Bool)

(assert start!38498)

(declare-fun b!397831 () Bool)

(declare-fun res!228542 () Bool)

(declare-fun e!240528 () Bool)

(assert (=> b!397831 (=> (not res!228542) (not e!240528))))

(declare-datatypes ((array!23756 0))(
  ( (array!23757 (arr!11327 (Array (_ BitVec 32) (_ BitVec 64))) (size!11679 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23756)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14347 0))(
  ( (V!14348 (val!5010 Int)) )
))
(declare-datatypes ((ValueCell!4622 0))(
  ( (ValueCellFull!4622 (v!7258 V!14347)) (EmptyCell!4622) )
))
(declare-datatypes ((array!23758 0))(
  ( (array!23759 (arr!11328 (Array (_ BitVec 32) ValueCell!4622)) (size!11680 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23758)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!397831 (= res!228542 (and (= (size!11680 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11679 _keys!709) (size!11680 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!397832 () Bool)

(declare-fun res!228543 () Bool)

(assert (=> b!397832 (=> (not res!228543) (not e!240528))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397832 (= res!228543 (validKeyInArray!0 k0!794))))

(declare-fun b!397833 () Bool)

(declare-fun e!240527 () Bool)

(assert (=> b!397833 (= e!240527 false)))

(declare-fun lt!187391 () Bool)

(declare-fun lt!187392 () array!23756)

(declare-datatypes ((List!6420 0))(
  ( (Nil!6417) (Cons!6416 (h!7272 (_ BitVec 64)) (t!11586 List!6420)) )
))
(declare-fun arrayNoDuplicates!0 (array!23756 (_ BitVec 32) List!6420) Bool)

(assert (=> b!397833 (= lt!187391 (arrayNoDuplicates!0 lt!187392 #b00000000000000000000000000000000 Nil!6417))))

(declare-fun b!397834 () Bool)

(declare-fun res!228545 () Bool)

(assert (=> b!397834 (=> (not res!228545) (not e!240528))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397834 (= res!228545 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11679 _keys!709))))))

(declare-fun b!397835 () Bool)

(declare-fun res!228540 () Bool)

(assert (=> b!397835 (=> (not res!228540) (not e!240528))))

(assert (=> b!397835 (= res!228540 (or (= (select (arr!11327 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11327 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397836 () Bool)

(declare-fun e!240530 () Bool)

(declare-fun tp_is_empty!9931 () Bool)

(assert (=> b!397836 (= e!240530 tp_is_empty!9931)))

(declare-fun b!397837 () Bool)

(declare-fun res!228538 () Bool)

(assert (=> b!397837 (=> (not res!228538) (not e!240528))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397837 (= res!228538 (validMask!0 mask!1025))))

(declare-fun res!228541 () Bool)

(assert (=> start!38498 (=> (not res!228541) (not e!240528))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38498 (= res!228541 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11679 _keys!709))))))

(assert (=> start!38498 e!240528))

(assert (=> start!38498 true))

(declare-fun e!240529 () Bool)

(declare-fun array_inv!8368 (array!23758) Bool)

(assert (=> start!38498 (and (array_inv!8368 _values!549) e!240529)))

(declare-fun array_inv!8369 (array!23756) Bool)

(assert (=> start!38498 (array_inv!8369 _keys!709)))

(declare-fun b!397838 () Bool)

(declare-fun res!228537 () Bool)

(assert (=> b!397838 (=> (not res!228537) (not e!240528))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23756 (_ BitVec 32)) Bool)

(assert (=> b!397838 (= res!228537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!397839 () Bool)

(declare-fun res!228539 () Bool)

(assert (=> b!397839 (=> (not res!228539) (not e!240528))))

(assert (=> b!397839 (= res!228539 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6417))))

(declare-fun mapIsEmpty!16518 () Bool)

(declare-fun mapRes!16518 () Bool)

(assert (=> mapIsEmpty!16518 mapRes!16518))

(declare-fun b!397840 () Bool)

(declare-fun e!240531 () Bool)

(assert (=> b!397840 (= e!240531 tp_is_empty!9931)))

(declare-fun b!397841 () Bool)

(assert (=> b!397841 (= e!240528 e!240527)))

(declare-fun res!228546 () Bool)

(assert (=> b!397841 (=> (not res!228546) (not e!240527))))

(assert (=> b!397841 (= res!228546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187392 mask!1025))))

(assert (=> b!397841 (= lt!187392 (array!23757 (store (arr!11327 _keys!709) i!563 k0!794) (size!11679 _keys!709)))))

(declare-fun b!397842 () Bool)

(declare-fun res!228544 () Bool)

(assert (=> b!397842 (=> (not res!228544) (not e!240528))))

(declare-fun arrayContainsKey!0 (array!23756 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397842 (= res!228544 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16518 () Bool)

(declare-fun tp!32313 () Bool)

(assert (=> mapNonEmpty!16518 (= mapRes!16518 (and tp!32313 e!240530))))

(declare-fun mapRest!16518 () (Array (_ BitVec 32) ValueCell!4622))

(declare-fun mapValue!16518 () ValueCell!4622)

(declare-fun mapKey!16518 () (_ BitVec 32))

(assert (=> mapNonEmpty!16518 (= (arr!11328 _values!549) (store mapRest!16518 mapKey!16518 mapValue!16518))))

(declare-fun b!397843 () Bool)

(assert (=> b!397843 (= e!240529 (and e!240531 mapRes!16518))))

(declare-fun condMapEmpty!16518 () Bool)

(declare-fun mapDefault!16518 () ValueCell!4622)

(assert (=> b!397843 (= condMapEmpty!16518 (= (arr!11328 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4622)) mapDefault!16518)))))

(assert (= (and start!38498 res!228541) b!397837))

(assert (= (and b!397837 res!228538) b!397831))

(assert (= (and b!397831 res!228542) b!397838))

(assert (= (and b!397838 res!228537) b!397839))

(assert (= (and b!397839 res!228539) b!397834))

(assert (= (and b!397834 res!228545) b!397832))

(assert (= (and b!397832 res!228543) b!397835))

(assert (= (and b!397835 res!228540) b!397842))

(assert (= (and b!397842 res!228544) b!397841))

(assert (= (and b!397841 res!228546) b!397833))

(assert (= (and b!397843 condMapEmpty!16518) mapIsEmpty!16518))

(assert (= (and b!397843 (not condMapEmpty!16518)) mapNonEmpty!16518))

(get-info :version)

(assert (= (and mapNonEmpty!16518 ((_ is ValueCellFull!4622) mapValue!16518)) b!397836))

(assert (= (and b!397843 ((_ is ValueCellFull!4622) mapDefault!16518)) b!397840))

(assert (= start!38498 b!397843))

(declare-fun m!393189 () Bool)

(assert (=> b!397841 m!393189))

(declare-fun m!393191 () Bool)

(assert (=> b!397841 m!393191))

(declare-fun m!393193 () Bool)

(assert (=> b!397839 m!393193))

(declare-fun m!393195 () Bool)

(assert (=> b!397837 m!393195))

(declare-fun m!393197 () Bool)

(assert (=> b!397838 m!393197))

(declare-fun m!393199 () Bool)

(assert (=> b!397842 m!393199))

(declare-fun m!393201 () Bool)

(assert (=> start!38498 m!393201))

(declare-fun m!393203 () Bool)

(assert (=> start!38498 m!393203))

(declare-fun m!393205 () Bool)

(assert (=> b!397833 m!393205))

(declare-fun m!393207 () Bool)

(assert (=> mapNonEmpty!16518 m!393207))

(declare-fun m!393209 () Bool)

(assert (=> b!397835 m!393209))

(declare-fun m!393211 () Bool)

(assert (=> b!397832 m!393211))

(check-sat (not b!397838) tp_is_empty!9931 (not mapNonEmpty!16518) (not b!397832) (not b!397837) (not b!397833) (not b!397839) (not b!397841) (not b!397842) (not start!38498))
(check-sat)
