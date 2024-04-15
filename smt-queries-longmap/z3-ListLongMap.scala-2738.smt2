; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40232 () Bool)

(assert start!40232)

(declare-fun b_free!10513 () Bool)

(declare-fun b_next!10513 () Bool)

(assert (=> start!40232 (= b_free!10513 (not b_next!10513))))

(declare-fun tp!37068 () Bool)

(declare-fun b_and!18455 () Bool)

(assert (=> start!40232 (= tp!37068 b_and!18455)))

(declare-fun b!441397 () Bool)

(declare-fun res!261371 () Bool)

(declare-fun e!259858 () Bool)

(assert (=> b!441397 (=> (not res!261371) (not e!259858))))

(declare-datatypes ((array!27145 0))(
  ( (array!27146 (arr!13022 (Array (_ BitVec 32) (_ BitVec 64))) (size!13375 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27145)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!441397 (= res!261371 (or (= (select (arr!13022 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13022 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!441398 () Bool)

(declare-fun res!261373 () Bool)

(assert (=> b!441398 (=> (not res!261373) (not e!259858))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16659 0))(
  ( (V!16660 (val!5877 Int)) )
))
(declare-datatypes ((ValueCell!5489 0))(
  ( (ValueCellFull!5489 (v!8118 V!16659)) (EmptyCell!5489) )
))
(declare-datatypes ((array!27147 0))(
  ( (array!27148 (arr!13023 (Array (_ BitVec 32) ValueCell!5489)) (size!13376 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27147)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!441398 (= res!261373 (and (= (size!13376 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13375 _keys!709) (size!13376 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!441399 () Bool)

(declare-fun res!261378 () Bool)

(assert (=> b!441399 (=> (not res!261378) (not e!259858))))

(assert (=> b!441399 (= res!261378 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13375 _keys!709))))))

(declare-fun b!441400 () Bool)

(declare-fun e!259860 () Bool)

(declare-fun tp_is_empty!11665 () Bool)

(assert (=> b!441400 (= e!259860 tp_is_empty!11665)))

(declare-fun b!441401 () Bool)

(declare-fun e!259856 () Bool)

(assert (=> b!441401 (= e!259856 tp_is_empty!11665)))

(declare-fun b!441402 () Bool)

(declare-fun e!259854 () Bool)

(assert (=> b!441402 (= e!259854 (not true))))

(declare-fun lt!202734 () array!27145)

(declare-fun minValue!515 () V!16659)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16659)

(declare-fun v!412 () V!16659)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!202733 () array!27147)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((tuple2!7834 0))(
  ( (tuple2!7835 (_1!3928 (_ BitVec 64)) (_2!3928 V!16659)) )
))
(declare-datatypes ((List!7819 0))(
  ( (Nil!7816) (Cons!7815 (h!8671 tuple2!7834) (t!13566 List!7819)) )
))
(declare-datatypes ((ListLongMap!6737 0))(
  ( (ListLongMap!6738 (toList!3384 List!7819)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1583 (array!27145 array!27147 (_ BitVec 32) (_ BitVec 32) V!16659 V!16659 (_ BitVec 32) Int) ListLongMap!6737)

(declare-fun +!1544 (ListLongMap!6737 tuple2!7834) ListLongMap!6737)

(assert (=> b!441402 (= (getCurrentListMapNoExtraKeys!1583 lt!202734 lt!202733 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1544 (getCurrentListMapNoExtraKeys!1583 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7835 k0!794 v!412)))))

(declare-datatypes ((Unit!13105 0))(
  ( (Unit!13106) )
))
(declare-fun lt!202732 () Unit!13105)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!682 (array!27145 array!27147 (_ BitVec 32) (_ BitVec 32) V!16659 V!16659 (_ BitVec 32) (_ BitVec 64) V!16659 (_ BitVec 32) Int) Unit!13105)

(assert (=> b!441402 (= lt!202732 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!682 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!441403 () Bool)

(declare-fun e!259855 () Bool)

(assert (=> b!441403 (= e!259858 e!259855)))

(declare-fun res!261377 () Bool)

(assert (=> b!441403 (=> (not res!261377) (not e!259855))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27145 (_ BitVec 32)) Bool)

(assert (=> b!441403 (= res!261377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202734 mask!1025))))

(assert (=> b!441403 (= lt!202734 (array!27146 (store (arr!13022 _keys!709) i!563 k0!794) (size!13375 _keys!709)))))

(declare-fun b!441404 () Bool)

(declare-fun e!259857 () Bool)

(declare-fun mapRes!19119 () Bool)

(assert (=> b!441404 (= e!259857 (and e!259856 mapRes!19119))))

(declare-fun condMapEmpty!19119 () Bool)

(declare-fun mapDefault!19119 () ValueCell!5489)

(assert (=> b!441404 (= condMapEmpty!19119 (= (arr!13023 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5489)) mapDefault!19119)))))

(declare-fun b!441405 () Bool)

(declare-fun res!261376 () Bool)

(assert (=> b!441405 (=> (not res!261376) (not e!259858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!441405 (= res!261376 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!19119 () Bool)

(assert (=> mapIsEmpty!19119 mapRes!19119))

(declare-fun b!441407 () Bool)

(declare-fun res!261366 () Bool)

(assert (=> b!441407 (=> (not res!261366) (not e!259855))))

(declare-datatypes ((List!7820 0))(
  ( (Nil!7817) (Cons!7816 (h!8672 (_ BitVec 64)) (t!13567 List!7820)) )
))
(declare-fun arrayNoDuplicates!0 (array!27145 (_ BitVec 32) List!7820) Bool)

(assert (=> b!441407 (= res!261366 (arrayNoDuplicates!0 lt!202734 #b00000000000000000000000000000000 Nil!7817))))

(declare-fun b!441408 () Bool)

(declare-fun res!261368 () Bool)

(assert (=> b!441408 (=> (not res!261368) (not e!259858))))

(assert (=> b!441408 (= res!261368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!441409 () Bool)

(assert (=> b!441409 (= e!259855 e!259854)))

(declare-fun res!261375 () Bool)

(assert (=> b!441409 (=> (not res!261375) (not e!259854))))

(assert (=> b!441409 (= res!261375 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202736 () ListLongMap!6737)

(assert (=> b!441409 (= lt!202736 (getCurrentListMapNoExtraKeys!1583 lt!202734 lt!202733 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!441409 (= lt!202733 (array!27148 (store (arr!13023 _values!549) i!563 (ValueCellFull!5489 v!412)) (size!13376 _values!549)))))

(declare-fun lt!202735 () ListLongMap!6737)

(assert (=> b!441409 (= lt!202735 (getCurrentListMapNoExtraKeys!1583 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!441410 () Bool)

(declare-fun res!261374 () Bool)

(assert (=> b!441410 (=> (not res!261374) (not e!259858))))

(declare-fun arrayContainsKey!0 (array!27145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!441410 (= res!261374 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!441411 () Bool)

(declare-fun res!261369 () Bool)

(assert (=> b!441411 (=> (not res!261369) (not e!259858))))

(assert (=> b!441411 (= res!261369 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7817))))

(declare-fun b!441412 () Bool)

(declare-fun res!261367 () Bool)

(assert (=> b!441412 (=> (not res!261367) (not e!259855))))

(assert (=> b!441412 (= res!261367 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!19119 () Bool)

(declare-fun tp!37067 () Bool)

(assert (=> mapNonEmpty!19119 (= mapRes!19119 (and tp!37067 e!259860))))

(declare-fun mapRest!19119 () (Array (_ BitVec 32) ValueCell!5489))

(declare-fun mapKey!19119 () (_ BitVec 32))

(declare-fun mapValue!19119 () ValueCell!5489)

(assert (=> mapNonEmpty!19119 (= (arr!13023 _values!549) (store mapRest!19119 mapKey!19119 mapValue!19119))))

(declare-fun b!441406 () Bool)

(declare-fun res!261372 () Bool)

(assert (=> b!441406 (=> (not res!261372) (not e!259858))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!441406 (= res!261372 (validKeyInArray!0 k0!794))))

(declare-fun res!261370 () Bool)

(assert (=> start!40232 (=> (not res!261370) (not e!259858))))

(assert (=> start!40232 (= res!261370 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13375 _keys!709))))))

(assert (=> start!40232 e!259858))

(assert (=> start!40232 tp_is_empty!11665))

(assert (=> start!40232 tp!37068))

(assert (=> start!40232 true))

(declare-fun array_inv!9496 (array!27147) Bool)

(assert (=> start!40232 (and (array_inv!9496 _values!549) e!259857)))

(declare-fun array_inv!9497 (array!27145) Bool)

(assert (=> start!40232 (array_inv!9497 _keys!709)))

(assert (= (and start!40232 res!261370) b!441405))

(assert (= (and b!441405 res!261376) b!441398))

(assert (= (and b!441398 res!261373) b!441408))

(assert (= (and b!441408 res!261368) b!441411))

(assert (= (and b!441411 res!261369) b!441399))

(assert (= (and b!441399 res!261378) b!441406))

(assert (= (and b!441406 res!261372) b!441397))

(assert (= (and b!441397 res!261371) b!441410))

(assert (= (and b!441410 res!261374) b!441403))

(assert (= (and b!441403 res!261377) b!441407))

(assert (= (and b!441407 res!261366) b!441412))

(assert (= (and b!441412 res!261367) b!441409))

(assert (= (and b!441409 res!261375) b!441402))

(assert (= (and b!441404 condMapEmpty!19119) mapIsEmpty!19119))

(assert (= (and b!441404 (not condMapEmpty!19119)) mapNonEmpty!19119))

(get-info :version)

(assert (= (and mapNonEmpty!19119 ((_ is ValueCellFull!5489) mapValue!19119)) b!441400))

(assert (= (and b!441404 ((_ is ValueCellFull!5489) mapDefault!19119)) b!441401))

(assert (= start!40232 b!441404))

(declare-fun m!427725 () Bool)

(assert (=> b!441403 m!427725))

(declare-fun m!427727 () Bool)

(assert (=> b!441403 m!427727))

(declare-fun m!427729 () Bool)

(assert (=> b!441397 m!427729))

(declare-fun m!427731 () Bool)

(assert (=> b!441406 m!427731))

(declare-fun m!427733 () Bool)

(assert (=> start!40232 m!427733))

(declare-fun m!427735 () Bool)

(assert (=> start!40232 m!427735))

(declare-fun m!427737 () Bool)

(assert (=> b!441407 m!427737))

(declare-fun m!427739 () Bool)

(assert (=> b!441408 m!427739))

(declare-fun m!427741 () Bool)

(assert (=> b!441410 m!427741))

(declare-fun m!427743 () Bool)

(assert (=> b!441402 m!427743))

(declare-fun m!427745 () Bool)

(assert (=> b!441402 m!427745))

(assert (=> b!441402 m!427745))

(declare-fun m!427747 () Bool)

(assert (=> b!441402 m!427747))

(declare-fun m!427749 () Bool)

(assert (=> b!441402 m!427749))

(declare-fun m!427751 () Bool)

(assert (=> b!441405 m!427751))

(declare-fun m!427753 () Bool)

(assert (=> b!441411 m!427753))

(declare-fun m!427755 () Bool)

(assert (=> mapNonEmpty!19119 m!427755))

(declare-fun m!427757 () Bool)

(assert (=> b!441409 m!427757))

(declare-fun m!427759 () Bool)

(assert (=> b!441409 m!427759))

(declare-fun m!427761 () Bool)

(assert (=> b!441409 m!427761))

(check-sat (not b!441410) tp_is_empty!11665 (not mapNonEmpty!19119) (not b!441402) (not b!441409) (not b_next!10513) (not b!441408) (not b!441405) (not start!40232) (not b!441406) b_and!18455 (not b!441411) (not b!441407) (not b!441403))
(check-sat b_and!18455 (not b_next!10513))
