; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39044 () Bool)

(assert start!39044)

(declare-fun b_free!9325 () Bool)

(declare-fun b_next!9325 () Bool)

(assert (=> start!39044 (= b_free!9325 (not b_next!9325))))

(declare-fun tp!33504 () Bool)

(declare-fun b_and!16685 () Bool)

(assert (=> start!39044 (= tp!33504 b_and!16685)))

(declare-fun b!409646 () Bool)

(declare-fun res!237351 () Bool)

(declare-fun e!245623 () Bool)

(assert (=> b!409646 (=> (not res!237351) (not e!245623))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409646 (= res!237351 (validKeyInArray!0 k0!794))))

(declare-fun b!409647 () Bool)

(declare-fun res!237349 () Bool)

(assert (=> b!409647 (=> (not res!237349) (not e!245623))))

(declare-datatypes ((array!24815 0))(
  ( (array!24816 (arr!11857 (Array (_ BitVec 32) (_ BitVec 64))) (size!12210 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24815)

(declare-fun arrayContainsKey!0 (array!24815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!409647 (= res!237349 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!409648 () Bool)

(declare-fun e!245625 () Bool)

(declare-fun tp_is_empty!10477 () Bool)

(assert (=> b!409648 (= e!245625 tp_is_empty!10477)))

(declare-fun b!409649 () Bool)

(declare-fun res!237346 () Bool)

(assert (=> b!409649 (=> (not res!237346) (not e!245623))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15075 0))(
  ( (V!15076 (val!5283 Int)) )
))
(declare-datatypes ((ValueCell!4895 0))(
  ( (ValueCellFull!4895 (v!7524 V!15075)) (EmptyCell!4895) )
))
(declare-datatypes ((array!24817 0))(
  ( (array!24818 (arr!11858 (Array (_ BitVec 32) ValueCell!4895)) (size!12211 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24817)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!409649 (= res!237346 (and (= (size!12211 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12210 _keys!709) (size!12211 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!409650 () Bool)

(declare-fun res!237345 () Bool)

(assert (=> b!409650 (=> (not res!237345) (not e!245623))))

(declare-datatypes ((List!6849 0))(
  ( (Nil!6846) (Cons!6845 (h!7701 (_ BitVec 64)) (t!12014 List!6849)) )
))
(declare-fun arrayNoDuplicates!0 (array!24815 (_ BitVec 32) List!6849) Bool)

(assert (=> b!409650 (= res!237345 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6846))))

(declare-fun b!409651 () Bool)

(declare-fun res!237344 () Bool)

(declare-fun e!245626 () Bool)

(assert (=> b!409651 (=> (not res!237344) (not e!245626))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!409651 (= res!237344 (bvsle from!863 i!563))))

(declare-fun b!409652 () Bool)

(declare-fun res!237348 () Bool)

(assert (=> b!409652 (=> (not res!237348) (not e!245623))))

(assert (=> b!409652 (= res!237348 (or (= (select (arr!11857 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11857 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!409653 () Bool)

(declare-fun res!237353 () Bool)

(assert (=> b!409653 (=> (not res!237353) (not e!245623))))

(assert (=> b!409653 (= res!237353 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12210 _keys!709))))))

(declare-fun b!409654 () Bool)

(declare-fun e!245628 () Bool)

(assert (=> b!409654 (= e!245628 tp_is_empty!10477)))

(declare-fun b!409655 () Bool)

(assert (=> b!409655 (= e!245623 e!245626)))

(declare-fun res!237347 () Bool)

(assert (=> b!409655 (=> (not res!237347) (not e!245626))))

(declare-fun lt!188776 () array!24815)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24815 (_ BitVec 32)) Bool)

(assert (=> b!409655 (= res!237347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188776 mask!1025))))

(assert (=> b!409655 (= lt!188776 (array!24816 (store (arr!11857 _keys!709) i!563 k0!794) (size!12210 _keys!709)))))

(declare-fun b!409656 () Bool)

(declare-fun res!237350 () Bool)

(assert (=> b!409656 (=> (not res!237350) (not e!245623))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409656 (= res!237350 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!17337 () Bool)

(declare-fun mapRes!17337 () Bool)

(assert (=> mapIsEmpty!17337 mapRes!17337))

(declare-fun res!237343 () Bool)

(assert (=> start!39044 (=> (not res!237343) (not e!245623))))

(assert (=> start!39044 (= res!237343 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12210 _keys!709))))))

(assert (=> start!39044 e!245623))

(assert (=> start!39044 tp_is_empty!10477))

(assert (=> start!39044 tp!33504))

(assert (=> start!39044 true))

(declare-fun e!245627 () Bool)

(declare-fun array_inv!8696 (array!24817) Bool)

(assert (=> start!39044 (and (array_inv!8696 _values!549) e!245627)))

(declare-fun array_inv!8697 (array!24815) Bool)

(assert (=> start!39044 (array_inv!8697 _keys!709)))

(declare-fun mapNonEmpty!17337 () Bool)

(declare-fun tp!33503 () Bool)

(assert (=> mapNonEmpty!17337 (= mapRes!17337 (and tp!33503 e!245628))))

(declare-fun mapValue!17337 () ValueCell!4895)

(declare-fun mapRest!17337 () (Array (_ BitVec 32) ValueCell!4895))

(declare-fun mapKey!17337 () (_ BitVec 32))

(assert (=> mapNonEmpty!17337 (= (arr!11858 _values!549) (store mapRest!17337 mapKey!17337 mapValue!17337))))

(declare-fun b!409657 () Bool)

(assert (=> b!409657 (= e!245626 false)))

(declare-fun minValue!515 () V!15075)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15075)

(declare-datatypes ((tuple2!6838 0))(
  ( (tuple2!6839 (_1!3430 (_ BitVec 64)) (_2!3430 V!15075)) )
))
(declare-datatypes ((List!6850 0))(
  ( (Nil!6847) (Cons!6846 (h!7702 tuple2!6838) (t!12015 List!6850)) )
))
(declare-datatypes ((ListLongMap!5741 0))(
  ( (ListLongMap!5742 (toList!2886 List!6850)) )
))
(declare-fun lt!188777 () ListLongMap!5741)

(declare-fun getCurrentListMapNoExtraKeys!1100 (array!24815 array!24817 (_ BitVec 32) (_ BitVec 32) V!15075 V!15075 (_ BitVec 32) Int) ListLongMap!5741)

(assert (=> b!409657 (= lt!188777 (getCurrentListMapNoExtraKeys!1100 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!409658 () Bool)

(assert (=> b!409658 (= e!245627 (and e!245625 mapRes!17337))))

(declare-fun condMapEmpty!17337 () Bool)

(declare-fun mapDefault!17337 () ValueCell!4895)

(assert (=> b!409658 (= condMapEmpty!17337 (= (arr!11858 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4895)) mapDefault!17337)))))

(declare-fun b!409659 () Bool)

(declare-fun res!237352 () Bool)

(assert (=> b!409659 (=> (not res!237352) (not e!245623))))

(assert (=> b!409659 (= res!237352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!409660 () Bool)

(declare-fun res!237354 () Bool)

(assert (=> b!409660 (=> (not res!237354) (not e!245626))))

(assert (=> b!409660 (= res!237354 (arrayNoDuplicates!0 lt!188776 #b00000000000000000000000000000000 Nil!6846))))

(assert (= (and start!39044 res!237343) b!409656))

(assert (= (and b!409656 res!237350) b!409649))

(assert (= (and b!409649 res!237346) b!409659))

(assert (= (and b!409659 res!237352) b!409650))

(assert (= (and b!409650 res!237345) b!409653))

(assert (= (and b!409653 res!237353) b!409646))

(assert (= (and b!409646 res!237351) b!409652))

(assert (= (and b!409652 res!237348) b!409647))

(assert (= (and b!409647 res!237349) b!409655))

(assert (= (and b!409655 res!237347) b!409660))

(assert (= (and b!409660 res!237354) b!409651))

(assert (= (and b!409651 res!237344) b!409657))

(assert (= (and b!409658 condMapEmpty!17337) mapIsEmpty!17337))

(assert (= (and b!409658 (not condMapEmpty!17337)) mapNonEmpty!17337))

(get-info :version)

(assert (= (and mapNonEmpty!17337 ((_ is ValueCellFull!4895) mapValue!17337)) b!409654))

(assert (= (and b!409658 ((_ is ValueCellFull!4895) mapDefault!17337)) b!409648))

(assert (= start!39044 b!409658))

(declare-fun m!399897 () Bool)

(assert (=> b!409656 m!399897))

(declare-fun m!399899 () Bool)

(assert (=> b!409660 m!399899))

(declare-fun m!399901 () Bool)

(assert (=> b!409657 m!399901))

(declare-fun m!399903 () Bool)

(assert (=> b!409647 m!399903))

(declare-fun m!399905 () Bool)

(assert (=> b!409650 m!399905))

(declare-fun m!399907 () Bool)

(assert (=> mapNonEmpty!17337 m!399907))

(declare-fun m!399909 () Bool)

(assert (=> b!409655 m!399909))

(declare-fun m!399911 () Bool)

(assert (=> b!409655 m!399911))

(declare-fun m!399913 () Bool)

(assert (=> b!409659 m!399913))

(declare-fun m!399915 () Bool)

(assert (=> start!39044 m!399915))

(declare-fun m!399917 () Bool)

(assert (=> start!39044 m!399917))

(declare-fun m!399919 () Bool)

(assert (=> b!409646 m!399919))

(declare-fun m!399921 () Bool)

(assert (=> b!409652 m!399921))

(check-sat b_and!16685 (not b!409656) (not b!409657) (not b!409659) tp_is_empty!10477 (not b!409655) (not b!409650) (not b!409660) (not start!39044) (not mapNonEmpty!17337) (not b_next!9325) (not b!409647) (not b!409646))
(check-sat b_and!16685 (not b_next!9325))
