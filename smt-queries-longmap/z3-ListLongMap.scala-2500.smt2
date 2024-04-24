; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38804 () Bool)

(assert start!38804)

(declare-fun res!233781 () Bool)

(declare-fun e!243610 () Bool)

(assert (=> start!38804 (=> (not res!233781) (not e!243610))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24354 0))(
  ( (array!24355 (arr!11626 (Array (_ BitVec 32) (_ BitVec 64))) (size!11978 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24354)

(assert (=> start!38804 (= res!233781 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11978 _keys!709))))))

(assert (=> start!38804 e!243610))

(assert (=> start!38804 true))

(declare-datatypes ((V!14755 0))(
  ( (V!14756 (val!5163 Int)) )
))
(declare-datatypes ((ValueCell!4775 0))(
  ( (ValueCellFull!4775 (v!7411 V!14755)) (EmptyCell!4775) )
))
(declare-datatypes ((array!24356 0))(
  ( (array!24357 (arr!11627 (Array (_ BitVec 32) ValueCell!4775)) (size!11979 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24356)

(declare-fun e!243607 () Bool)

(declare-fun array_inv!8588 (array!24356) Bool)

(assert (=> start!38804 (and (array_inv!8588 _values!549) e!243607)))

(declare-fun array_inv!8589 (array!24354) Bool)

(assert (=> start!38804 (array_inv!8589 _keys!709)))

(declare-fun b!405094 () Bool)

(declare-fun res!233780 () Bool)

(assert (=> b!405094 (=> (not res!233780) (not e!243610))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24354 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405094 (= res!233780 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!405095 () Bool)

(declare-fun res!233775 () Bool)

(assert (=> b!405095 (=> (not res!233775) (not e!243610))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405095 (= res!233775 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11978 _keys!709))))))

(declare-fun mapIsEmpty!16977 () Bool)

(declare-fun mapRes!16977 () Bool)

(assert (=> mapIsEmpty!16977 mapRes!16977))

(declare-fun b!405096 () Bool)

(declare-fun e!243606 () Bool)

(assert (=> b!405096 (= e!243606 false)))

(declare-fun lt!188310 () Bool)

(declare-fun lt!188309 () array!24354)

(declare-datatypes ((List!6641 0))(
  ( (Nil!6638) (Cons!6637 (h!7493 (_ BitVec 64)) (t!11807 List!6641)) )
))
(declare-fun arrayNoDuplicates!0 (array!24354 (_ BitVec 32) List!6641) Bool)

(assert (=> b!405096 (= lt!188310 (arrayNoDuplicates!0 lt!188309 #b00000000000000000000000000000000 Nil!6638))))

(declare-fun b!405097 () Bool)

(declare-fun res!233779 () Bool)

(assert (=> b!405097 (=> (not res!233779) (not e!243610))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24354 (_ BitVec 32)) Bool)

(assert (=> b!405097 (= res!233779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!405098 () Bool)

(declare-fun e!243605 () Bool)

(declare-fun tp_is_empty!10237 () Bool)

(assert (=> b!405098 (= e!243605 tp_is_empty!10237)))

(declare-fun b!405099 () Bool)

(declare-fun res!233777 () Bool)

(assert (=> b!405099 (=> (not res!233777) (not e!243610))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405099 (= res!233777 (validMask!0 mask!1025))))

(declare-fun b!405100 () Bool)

(declare-fun e!243609 () Bool)

(assert (=> b!405100 (= e!243609 tp_is_empty!10237)))

(declare-fun b!405101 () Bool)

(declare-fun res!233783 () Bool)

(assert (=> b!405101 (=> (not res!233783) (not e!243610))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!405101 (= res!233783 (and (= (size!11979 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11978 _keys!709) (size!11979 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!405102 () Bool)

(assert (=> b!405102 (= e!243610 e!243606)))

(declare-fun res!233782 () Bool)

(assert (=> b!405102 (=> (not res!233782) (not e!243606))))

(assert (=> b!405102 (= res!233782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188309 mask!1025))))

(assert (=> b!405102 (= lt!188309 (array!24355 (store (arr!11626 _keys!709) i!563 k0!794) (size!11978 _keys!709)))))

(declare-fun b!405103 () Bool)

(declare-fun res!233778 () Bool)

(assert (=> b!405103 (=> (not res!233778) (not e!243610))))

(assert (=> b!405103 (= res!233778 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6638))))

(declare-fun mapNonEmpty!16977 () Bool)

(declare-fun tp!33096 () Bool)

(assert (=> mapNonEmpty!16977 (= mapRes!16977 (and tp!33096 e!243609))))

(declare-fun mapRest!16977 () (Array (_ BitVec 32) ValueCell!4775))

(declare-fun mapValue!16977 () ValueCell!4775)

(declare-fun mapKey!16977 () (_ BitVec 32))

(assert (=> mapNonEmpty!16977 (= (arr!11627 _values!549) (store mapRest!16977 mapKey!16977 mapValue!16977))))

(declare-fun b!405104 () Bool)

(declare-fun res!233776 () Bool)

(assert (=> b!405104 (=> (not res!233776) (not e!243610))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405104 (= res!233776 (validKeyInArray!0 k0!794))))

(declare-fun b!405105 () Bool)

(assert (=> b!405105 (= e!243607 (and e!243605 mapRes!16977))))

(declare-fun condMapEmpty!16977 () Bool)

(declare-fun mapDefault!16977 () ValueCell!4775)

(assert (=> b!405105 (= condMapEmpty!16977 (= (arr!11627 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4775)) mapDefault!16977)))))

(declare-fun b!405106 () Bool)

(declare-fun res!233784 () Bool)

(assert (=> b!405106 (=> (not res!233784) (not e!243610))))

(assert (=> b!405106 (= res!233784 (or (= (select (arr!11626 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11626 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!38804 res!233781) b!405099))

(assert (= (and b!405099 res!233777) b!405101))

(assert (= (and b!405101 res!233783) b!405097))

(assert (= (and b!405097 res!233779) b!405103))

(assert (= (and b!405103 res!233778) b!405095))

(assert (= (and b!405095 res!233775) b!405104))

(assert (= (and b!405104 res!233776) b!405106))

(assert (= (and b!405106 res!233784) b!405094))

(assert (= (and b!405094 res!233780) b!405102))

(assert (= (and b!405102 res!233782) b!405096))

(assert (= (and b!405105 condMapEmpty!16977) mapIsEmpty!16977))

(assert (= (and b!405105 (not condMapEmpty!16977)) mapNonEmpty!16977))

(get-info :version)

(assert (= (and mapNonEmpty!16977 ((_ is ValueCellFull!4775) mapValue!16977)) b!405100))

(assert (= (and b!405105 ((_ is ValueCellFull!4775) mapDefault!16977)) b!405098))

(assert (= start!38804 b!405105))

(declare-fun m!397941 () Bool)

(assert (=> b!405104 m!397941))

(declare-fun m!397943 () Bool)

(assert (=> b!405094 m!397943))

(declare-fun m!397945 () Bool)

(assert (=> b!405096 m!397945))

(declare-fun m!397947 () Bool)

(assert (=> mapNonEmpty!16977 m!397947))

(declare-fun m!397949 () Bool)

(assert (=> b!405102 m!397949))

(declare-fun m!397951 () Bool)

(assert (=> b!405102 m!397951))

(declare-fun m!397953 () Bool)

(assert (=> b!405097 m!397953))

(declare-fun m!397955 () Bool)

(assert (=> b!405106 m!397955))

(declare-fun m!397957 () Bool)

(assert (=> b!405099 m!397957))

(declare-fun m!397959 () Bool)

(assert (=> start!38804 m!397959))

(declare-fun m!397961 () Bool)

(assert (=> start!38804 m!397961))

(declare-fun m!397963 () Bool)

(assert (=> b!405103 m!397963))

(check-sat (not b!405104) (not mapNonEmpty!16977) (not b!405096) (not b!405097) (not b!405099) (not start!38804) (not b!405103) (not b!405094) tp_is_empty!10237 (not b!405102))
(check-sat)
