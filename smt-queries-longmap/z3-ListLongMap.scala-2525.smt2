; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38954 () Bool)

(assert start!38954)

(declare-fun b!408019 () Bool)

(declare-fun res!236030 () Bool)

(declare-fun e!244959 () Bool)

(assert (=> b!408019 (=> (not res!236030) (not e!244959))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408019 (= res!236030 (validKeyInArray!0 k0!794))))

(declare-fun b!408020 () Bool)

(declare-fun e!244956 () Bool)

(declare-fun e!244957 () Bool)

(declare-fun mapRes!17202 () Bool)

(assert (=> b!408020 (= e!244956 (and e!244957 mapRes!17202))))

(declare-fun condMapEmpty!17202 () Bool)

(declare-datatypes ((V!14955 0))(
  ( (V!14956 (val!5238 Int)) )
))
(declare-datatypes ((ValueCell!4850 0))(
  ( (ValueCellFull!4850 (v!7486 V!14955)) (EmptyCell!4850) )
))
(declare-datatypes ((array!24650 0))(
  ( (array!24651 (arr!11774 (Array (_ BitVec 32) ValueCell!4850)) (size!12126 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24650)

(declare-fun mapDefault!17202 () ValueCell!4850)

(assert (=> b!408020 (= condMapEmpty!17202 (= (arr!11774 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4850)) mapDefault!17202)))))

(declare-fun b!408021 () Bool)

(declare-fun res!236031 () Bool)

(assert (=> b!408021 (=> (not res!236031) (not e!244959))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24652 0))(
  ( (array!24653 (arr!11775 (Array (_ BitVec 32) (_ BitVec 64))) (size!12127 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24652)

(assert (=> b!408021 (= res!236031 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12127 _keys!709))))))

(declare-fun b!408022 () Bool)

(declare-fun e!244958 () Bool)

(assert (=> b!408022 (= e!244958 false)))

(declare-fun lt!188759 () Bool)

(declare-fun lt!188760 () array!24652)

(declare-datatypes ((List!6703 0))(
  ( (Nil!6700) (Cons!6699 (h!7555 (_ BitVec 64)) (t!11869 List!6703)) )
))
(declare-fun arrayNoDuplicates!0 (array!24652 (_ BitVec 32) List!6703) Bool)

(assert (=> b!408022 (= lt!188759 (arrayNoDuplicates!0 lt!188760 #b00000000000000000000000000000000 Nil!6700))))

(declare-fun b!408023 () Bool)

(declare-fun e!244955 () Bool)

(declare-fun tp_is_empty!10387 () Bool)

(assert (=> b!408023 (= e!244955 tp_is_empty!10387)))

(declare-fun res!236026 () Bool)

(assert (=> start!38954 (=> (not res!236026) (not e!244959))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38954 (= res!236026 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12127 _keys!709))))))

(assert (=> start!38954 e!244959))

(assert (=> start!38954 true))

(declare-fun array_inv!8678 (array!24650) Bool)

(assert (=> start!38954 (and (array_inv!8678 _values!549) e!244956)))

(declare-fun array_inv!8679 (array!24652) Bool)

(assert (=> start!38954 (array_inv!8679 _keys!709)))

(declare-fun mapIsEmpty!17202 () Bool)

(assert (=> mapIsEmpty!17202 mapRes!17202))

(declare-fun b!408024 () Bool)

(declare-fun res!236029 () Bool)

(assert (=> b!408024 (=> (not res!236029) (not e!244959))))

(assert (=> b!408024 (= res!236029 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6700))))

(declare-fun b!408025 () Bool)

(assert (=> b!408025 (= e!244957 tp_is_empty!10387)))

(declare-fun b!408026 () Bool)

(declare-fun res!236034 () Bool)

(assert (=> b!408026 (=> (not res!236034) (not e!244959))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!408026 (= res!236034 (and (= (size!12126 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12127 _keys!709) (size!12126 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!408027 () Bool)

(declare-fun res!236027 () Bool)

(assert (=> b!408027 (=> (not res!236027) (not e!244959))))

(declare-fun arrayContainsKey!0 (array!24652 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408027 (= res!236027 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17202 () Bool)

(declare-fun tp!33321 () Bool)

(assert (=> mapNonEmpty!17202 (= mapRes!17202 (and tp!33321 e!244955))))

(declare-fun mapValue!17202 () ValueCell!4850)

(declare-fun mapKey!17202 () (_ BitVec 32))

(declare-fun mapRest!17202 () (Array (_ BitVec 32) ValueCell!4850))

(assert (=> mapNonEmpty!17202 (= (arr!11774 _values!549) (store mapRest!17202 mapKey!17202 mapValue!17202))))

(declare-fun b!408028 () Bool)

(declare-fun res!236032 () Bool)

(assert (=> b!408028 (=> (not res!236032) (not e!244959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408028 (= res!236032 (validMask!0 mask!1025))))

(declare-fun b!408029 () Bool)

(assert (=> b!408029 (= e!244959 e!244958)))

(declare-fun res!236025 () Bool)

(assert (=> b!408029 (=> (not res!236025) (not e!244958))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24652 (_ BitVec 32)) Bool)

(assert (=> b!408029 (= res!236025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188760 mask!1025))))

(assert (=> b!408029 (= lt!188760 (array!24653 (store (arr!11775 _keys!709) i!563 k0!794) (size!12127 _keys!709)))))

(declare-fun b!408030 () Bool)

(declare-fun res!236033 () Bool)

(assert (=> b!408030 (=> (not res!236033) (not e!244959))))

(assert (=> b!408030 (= res!236033 (or (= (select (arr!11775 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11775 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!408031 () Bool)

(declare-fun res!236028 () Bool)

(assert (=> b!408031 (=> (not res!236028) (not e!244959))))

(assert (=> b!408031 (= res!236028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!38954 res!236026) b!408028))

(assert (= (and b!408028 res!236032) b!408026))

(assert (= (and b!408026 res!236034) b!408031))

(assert (= (and b!408031 res!236028) b!408024))

(assert (= (and b!408024 res!236029) b!408021))

(assert (= (and b!408021 res!236031) b!408019))

(assert (= (and b!408019 res!236030) b!408030))

(assert (= (and b!408030 res!236033) b!408027))

(assert (= (and b!408027 res!236027) b!408029))

(assert (= (and b!408029 res!236025) b!408022))

(assert (= (and b!408020 condMapEmpty!17202) mapIsEmpty!17202))

(assert (= (and b!408020 (not condMapEmpty!17202)) mapNonEmpty!17202))

(get-info :version)

(assert (= (and mapNonEmpty!17202 ((_ is ValueCellFull!4850) mapValue!17202)) b!408023))

(assert (= (and b!408020 ((_ is ValueCellFull!4850) mapDefault!17202)) b!408025))

(assert (= start!38954 b!408020))

(declare-fun m!399741 () Bool)

(assert (=> b!408031 m!399741))

(declare-fun m!399743 () Bool)

(assert (=> start!38954 m!399743))

(declare-fun m!399745 () Bool)

(assert (=> start!38954 m!399745))

(declare-fun m!399747 () Bool)

(assert (=> b!408024 m!399747))

(declare-fun m!399749 () Bool)

(assert (=> b!408027 m!399749))

(declare-fun m!399751 () Bool)

(assert (=> b!408019 m!399751))

(declare-fun m!399753 () Bool)

(assert (=> b!408022 m!399753))

(declare-fun m!399755 () Bool)

(assert (=> b!408029 m!399755))

(declare-fun m!399757 () Bool)

(assert (=> b!408029 m!399757))

(declare-fun m!399759 () Bool)

(assert (=> mapNonEmpty!17202 m!399759))

(declare-fun m!399761 () Bool)

(assert (=> b!408028 m!399761))

(declare-fun m!399763 () Bool)

(assert (=> b!408030 m!399763))

(check-sat (not b!408031) (not b!408022) (not b!408028) tp_is_empty!10387 (not b!408027) (not start!38954) (not b!408029) (not b!408024) (not b!408019) (not mapNonEmpty!17202))
(check-sat)
