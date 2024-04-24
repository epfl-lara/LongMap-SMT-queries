; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39002 () Bool)

(assert start!39002)

(declare-fun mapNonEmpty!17274 () Bool)

(declare-fun mapRes!17274 () Bool)

(declare-fun tp!33393 () Bool)

(declare-fun e!245388 () Bool)

(assert (=> mapNonEmpty!17274 (= mapRes!17274 (and tp!33393 e!245388))))

(declare-datatypes ((V!15019 0))(
  ( (V!15020 (val!5262 Int)) )
))
(declare-datatypes ((ValueCell!4874 0))(
  ( (ValueCellFull!4874 (v!7510 V!15019)) (EmptyCell!4874) )
))
(declare-datatypes ((array!24744 0))(
  ( (array!24745 (arr!11821 (Array (_ BitVec 32) ValueCell!4874)) (size!12173 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24744)

(declare-fun mapRest!17274 () (Array (_ BitVec 32) ValueCell!4874))

(declare-fun mapValue!17274 () ValueCell!4874)

(declare-fun mapKey!17274 () (_ BitVec 32))

(assert (=> mapNonEmpty!17274 (= (arr!11821 _values!549) (store mapRest!17274 mapKey!17274 mapValue!17274))))

(declare-fun b!408955 () Bool)

(declare-fun res!236748 () Bool)

(declare-fun e!245387 () Bool)

(assert (=> b!408955 (=> (not res!236748) (not e!245387))))

(declare-datatypes ((array!24746 0))(
  ( (array!24747 (arr!11822 (Array (_ BitVec 32) (_ BitVec 64))) (size!12174 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24746)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408955 (= res!236748 (or (= (select (arr!11822 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11822 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!408956 () Bool)

(declare-fun res!236747 () Bool)

(assert (=> b!408956 (=> (not res!236747) (not e!245387))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408956 (= res!236747 (validKeyInArray!0 k0!794))))

(declare-fun b!408957 () Bool)

(declare-fun res!236753 () Bool)

(assert (=> b!408957 (=> (not res!236753) (not e!245387))))

(declare-fun arrayContainsKey!0 (array!24746 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408957 (= res!236753 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!408958 () Bool)

(declare-fun res!236745 () Bool)

(assert (=> b!408958 (=> (not res!236745) (not e!245387))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24746 (_ BitVec 32)) Bool)

(assert (=> b!408958 (= res!236745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!408959 () Bool)

(declare-fun res!236752 () Bool)

(assert (=> b!408959 (=> (not res!236752) (not e!245387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408959 (= res!236752 (validMask!0 mask!1025))))

(declare-fun b!408960 () Bool)

(declare-fun e!245390 () Bool)

(declare-fun e!245392 () Bool)

(assert (=> b!408960 (= e!245390 (and e!245392 mapRes!17274))))

(declare-fun condMapEmpty!17274 () Bool)

(declare-fun mapDefault!17274 () ValueCell!4874)

(assert (=> b!408960 (= condMapEmpty!17274 (= (arr!11821 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4874)) mapDefault!17274)))))

(declare-fun b!408961 () Bool)

(declare-fun e!245391 () Bool)

(assert (=> b!408961 (= e!245387 e!245391)))

(declare-fun res!236754 () Bool)

(assert (=> b!408961 (=> (not res!236754) (not e!245391))))

(declare-fun lt!188904 () array!24746)

(assert (=> b!408961 (= res!236754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188904 mask!1025))))

(assert (=> b!408961 (= lt!188904 (array!24747 (store (arr!11822 _keys!709) i!563 k0!794) (size!12174 _keys!709)))))

(declare-fun b!408962 () Bool)

(assert (=> b!408962 (= e!245391 false)))

(declare-fun lt!188903 () Bool)

(declare-datatypes ((List!6718 0))(
  ( (Nil!6715) (Cons!6714 (h!7570 (_ BitVec 64)) (t!11884 List!6718)) )
))
(declare-fun arrayNoDuplicates!0 (array!24746 (_ BitVec 32) List!6718) Bool)

(assert (=> b!408962 (= lt!188903 (arrayNoDuplicates!0 lt!188904 #b00000000000000000000000000000000 Nil!6715))))

(declare-fun b!408963 () Bool)

(declare-fun res!236746 () Bool)

(assert (=> b!408963 (=> (not res!236746) (not e!245387))))

(assert (=> b!408963 (= res!236746 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12174 _keys!709))))))

(declare-fun mapIsEmpty!17274 () Bool)

(assert (=> mapIsEmpty!17274 mapRes!17274))

(declare-fun res!236750 () Bool)

(assert (=> start!39002 (=> (not res!236750) (not e!245387))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39002 (= res!236750 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12174 _keys!709))))))

(assert (=> start!39002 e!245387))

(assert (=> start!39002 true))

(declare-fun array_inv!8712 (array!24744) Bool)

(assert (=> start!39002 (and (array_inv!8712 _values!549) e!245390)))

(declare-fun array_inv!8713 (array!24746) Bool)

(assert (=> start!39002 (array_inv!8713 _keys!709)))

(declare-fun b!408964 () Bool)

(declare-fun tp_is_empty!10435 () Bool)

(assert (=> b!408964 (= e!245392 tp_is_empty!10435)))

(declare-fun b!408965 () Bool)

(assert (=> b!408965 (= e!245388 tp_is_empty!10435)))

(declare-fun b!408966 () Bool)

(declare-fun res!236751 () Bool)

(assert (=> b!408966 (=> (not res!236751) (not e!245387))))

(assert (=> b!408966 (= res!236751 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6715))))

(declare-fun b!408967 () Bool)

(declare-fun res!236749 () Bool)

(assert (=> b!408967 (=> (not res!236749) (not e!245387))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!408967 (= res!236749 (and (= (size!12173 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12174 _keys!709) (size!12173 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!39002 res!236750) b!408959))

(assert (= (and b!408959 res!236752) b!408967))

(assert (= (and b!408967 res!236749) b!408958))

(assert (= (and b!408958 res!236745) b!408966))

(assert (= (and b!408966 res!236751) b!408963))

(assert (= (and b!408963 res!236746) b!408956))

(assert (= (and b!408956 res!236747) b!408955))

(assert (= (and b!408955 res!236748) b!408957))

(assert (= (and b!408957 res!236753) b!408961))

(assert (= (and b!408961 res!236754) b!408962))

(assert (= (and b!408960 condMapEmpty!17274) mapIsEmpty!17274))

(assert (= (and b!408960 (not condMapEmpty!17274)) mapNonEmpty!17274))

(get-info :version)

(assert (= (and mapNonEmpty!17274 ((_ is ValueCellFull!4874) mapValue!17274)) b!408965))

(assert (= (and b!408960 ((_ is ValueCellFull!4874) mapDefault!17274)) b!408964))

(assert (= start!39002 b!408960))

(declare-fun m!400317 () Bool)

(assert (=> b!408956 m!400317))

(declare-fun m!400319 () Bool)

(assert (=> b!408955 m!400319))

(declare-fun m!400321 () Bool)

(assert (=> b!408961 m!400321))

(declare-fun m!400323 () Bool)

(assert (=> b!408961 m!400323))

(declare-fun m!400325 () Bool)

(assert (=> mapNonEmpty!17274 m!400325))

(declare-fun m!400327 () Bool)

(assert (=> b!408958 m!400327))

(declare-fun m!400329 () Bool)

(assert (=> b!408959 m!400329))

(declare-fun m!400331 () Bool)

(assert (=> start!39002 m!400331))

(declare-fun m!400333 () Bool)

(assert (=> start!39002 m!400333))

(declare-fun m!400335 () Bool)

(assert (=> b!408957 m!400335))

(declare-fun m!400337 () Bool)

(assert (=> b!408966 m!400337))

(declare-fun m!400339 () Bool)

(assert (=> b!408962 m!400339))

(check-sat (not b!408959) (not b!408956) (not b!408957) (not b!408958) tp_is_empty!10435 (not start!39002) (not b!408966) (not b!408962) (not b!408961) (not mapNonEmpty!17274))
(check-sat)
