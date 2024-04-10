; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39066 () Bool)

(assert start!39066)

(declare-fun b_free!9333 () Bool)

(declare-fun b_next!9333 () Bool)

(assert (=> start!39066 (= b_free!9333 (not b_next!9333))))

(declare-fun tp!33527 () Bool)

(declare-fun b_and!16719 () Bool)

(assert (=> start!39066 (= tp!33527 b_and!16719)))

(declare-fun res!237619 () Bool)

(declare-fun e!245873 () Bool)

(assert (=> start!39066 (=> (not res!237619) (not e!245873))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24841 0))(
  ( (array!24842 (arr!11870 (Array (_ BitVec 32) (_ BitVec 64))) (size!12222 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24841)

(assert (=> start!39066 (= res!237619 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12222 _keys!709))))))

(assert (=> start!39066 e!245873))

(declare-fun tp_is_empty!10485 () Bool)

(assert (=> start!39066 tp_is_empty!10485))

(assert (=> start!39066 tp!33527))

(assert (=> start!39066 true))

(declare-datatypes ((V!15085 0))(
  ( (V!15086 (val!5287 Int)) )
))
(declare-datatypes ((ValueCell!4899 0))(
  ( (ValueCellFull!4899 (v!7534 V!15085)) (EmptyCell!4899) )
))
(declare-datatypes ((array!24843 0))(
  ( (array!24844 (arr!11871 (Array (_ BitVec 32) ValueCell!4899)) (size!12223 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24843)

(declare-fun e!245869 () Bool)

(declare-fun array_inv!8662 (array!24843) Bool)

(assert (=> start!39066 (and (array_inv!8662 _values!549) e!245869)))

(declare-fun array_inv!8663 (array!24841) Bool)

(assert (=> start!39066 (array_inv!8663 _keys!709)))

(declare-fun b!410097 () Bool)

(declare-fun res!237616 () Bool)

(assert (=> b!410097 (=> (not res!237616) (not e!245873))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!410097 (= res!237616 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12222 _keys!709))))))

(declare-fun b!410098 () Bool)

(declare-fun res!237617 () Bool)

(assert (=> b!410098 (=> (not res!237617) (not e!245873))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24841 (_ BitVec 32)) Bool)

(assert (=> b!410098 (= res!237617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!410099 () Bool)

(declare-fun res!237618 () Bool)

(assert (=> b!410099 (=> (not res!237618) (not e!245873))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24841 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410099 (= res!237618 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!410100 () Bool)

(declare-fun e!245872 () Bool)

(declare-fun mapRes!17349 () Bool)

(assert (=> b!410100 (= e!245869 (and e!245872 mapRes!17349))))

(declare-fun condMapEmpty!17349 () Bool)

(declare-fun mapDefault!17349 () ValueCell!4899)

(assert (=> b!410100 (= condMapEmpty!17349 (= (arr!11871 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4899)) mapDefault!17349)))))

(declare-fun b!410101 () Bool)

(assert (=> b!410101 (= e!245872 tp_is_empty!10485)))

(declare-fun b!410102 () Bool)

(declare-fun res!237622 () Bool)

(assert (=> b!410102 (=> (not res!237622) (not e!245873))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410102 (= res!237622 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!17349 () Bool)

(declare-fun tp!33528 () Bool)

(declare-fun e!245870 () Bool)

(assert (=> mapNonEmpty!17349 (= mapRes!17349 (and tp!33528 e!245870))))

(declare-fun mapKey!17349 () (_ BitVec 32))

(declare-fun mapRest!17349 () (Array (_ BitVec 32) ValueCell!4899))

(declare-fun mapValue!17349 () ValueCell!4899)

(assert (=> mapNonEmpty!17349 (= (arr!11871 _values!549) (store mapRest!17349 mapKey!17349 mapValue!17349))))

(declare-fun b!410103 () Bool)

(declare-fun res!237625 () Bool)

(assert (=> b!410103 (=> (not res!237625) (not e!245873))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!410103 (= res!237625 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!17349 () Bool)

(assert (=> mapIsEmpty!17349 mapRes!17349))

(declare-fun b!410104 () Bool)

(declare-fun res!237627 () Bool)

(declare-fun e!245871 () Bool)

(assert (=> b!410104 (=> (not res!237627) (not e!245871))))

(declare-fun lt!189035 () array!24841)

(declare-datatypes ((List!6879 0))(
  ( (Nil!6876) (Cons!6875 (h!7731 (_ BitVec 64)) (t!12053 List!6879)) )
))
(declare-fun arrayNoDuplicates!0 (array!24841 (_ BitVec 32) List!6879) Bool)

(assert (=> b!410104 (= res!237627 (arrayNoDuplicates!0 lt!189035 #b00000000000000000000000000000000 Nil!6876))))

(declare-fun b!410105 () Bool)

(assert (=> b!410105 (= e!245870 tp_is_empty!10485)))

(declare-fun b!410106 () Bool)

(declare-fun res!237623 () Bool)

(assert (=> b!410106 (=> (not res!237623) (not e!245871))))

(assert (=> b!410106 (= res!237623 (bvsle from!863 i!563))))

(declare-fun b!410107 () Bool)

(declare-fun res!237626 () Bool)

(assert (=> b!410107 (=> (not res!237626) (not e!245873))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!410107 (= res!237626 (and (= (size!12223 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12222 _keys!709) (size!12223 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!410108 () Bool)

(declare-fun res!237621 () Bool)

(assert (=> b!410108 (=> (not res!237621) (not e!245873))))

(assert (=> b!410108 (= res!237621 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6876))))

(declare-fun b!410109 () Bool)

(assert (=> b!410109 (= e!245873 e!245871)))

(declare-fun res!237624 () Bool)

(assert (=> b!410109 (=> (not res!237624) (not e!245871))))

(assert (=> b!410109 (= res!237624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189035 mask!1025))))

(assert (=> b!410109 (= lt!189035 (array!24842 (store (arr!11870 _keys!709) i!563 k0!794) (size!12222 _keys!709)))))

(declare-fun b!410110 () Bool)

(declare-fun res!237620 () Bool)

(assert (=> b!410110 (=> (not res!237620) (not e!245873))))

(assert (=> b!410110 (= res!237620 (or (= (select (arr!11870 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11870 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!410111 () Bool)

(assert (=> b!410111 (= e!245871 false)))

(declare-fun minValue!515 () V!15085)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!6856 0))(
  ( (tuple2!6857 (_1!3439 (_ BitVec 64)) (_2!3439 V!15085)) )
))
(declare-datatypes ((List!6880 0))(
  ( (Nil!6877) (Cons!6876 (h!7732 tuple2!6856) (t!12054 List!6880)) )
))
(declare-datatypes ((ListLongMap!5769 0))(
  ( (ListLongMap!5770 (toList!2900 List!6880)) )
))
(declare-fun lt!189034 () ListLongMap!5769)

(declare-fun zeroValue!515 () V!15085)

(declare-fun getCurrentListMapNoExtraKeys!1108 (array!24841 array!24843 (_ BitVec 32) (_ BitVec 32) V!15085 V!15085 (_ BitVec 32) Int) ListLongMap!5769)

(assert (=> b!410111 (= lt!189034 (getCurrentListMapNoExtraKeys!1108 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!39066 res!237619) b!410102))

(assert (= (and b!410102 res!237622) b!410107))

(assert (= (and b!410107 res!237626) b!410098))

(assert (= (and b!410098 res!237617) b!410108))

(assert (= (and b!410108 res!237621) b!410097))

(assert (= (and b!410097 res!237616) b!410103))

(assert (= (and b!410103 res!237625) b!410110))

(assert (= (and b!410110 res!237620) b!410099))

(assert (= (and b!410099 res!237618) b!410109))

(assert (= (and b!410109 res!237624) b!410104))

(assert (= (and b!410104 res!237627) b!410106))

(assert (= (and b!410106 res!237623) b!410111))

(assert (= (and b!410100 condMapEmpty!17349) mapIsEmpty!17349))

(assert (= (and b!410100 (not condMapEmpty!17349)) mapNonEmpty!17349))

(get-info :version)

(assert (= (and mapNonEmpty!17349 ((_ is ValueCellFull!4899) mapValue!17349)) b!410105))

(assert (= (and b!410100 ((_ is ValueCellFull!4899) mapDefault!17349)) b!410101))

(assert (= start!39066 b!410100))

(declare-fun m!400725 () Bool)

(assert (=> mapNonEmpty!17349 m!400725))

(declare-fun m!400727 () Bool)

(assert (=> b!410099 m!400727))

(declare-fun m!400729 () Bool)

(assert (=> b!410102 m!400729))

(declare-fun m!400731 () Bool)

(assert (=> b!410098 m!400731))

(declare-fun m!400733 () Bool)

(assert (=> b!410111 m!400733))

(declare-fun m!400735 () Bool)

(assert (=> start!39066 m!400735))

(declare-fun m!400737 () Bool)

(assert (=> start!39066 m!400737))

(declare-fun m!400739 () Bool)

(assert (=> b!410110 m!400739))

(declare-fun m!400741 () Bool)

(assert (=> b!410108 m!400741))

(declare-fun m!400743 () Bool)

(assert (=> b!410103 m!400743))

(declare-fun m!400745 () Bool)

(assert (=> b!410104 m!400745))

(declare-fun m!400747 () Bool)

(assert (=> b!410109 m!400747))

(declare-fun m!400749 () Bool)

(assert (=> b!410109 m!400749))

(check-sat (not b!410109) (not b!410111) (not b!410098) (not b!410108) (not start!39066) b_and!16719 (not b!410104) (not b_next!9333) (not mapNonEmpty!17349) (not b!410102) (not b!410103) (not b!410099) tp_is_empty!10485)
(check-sat b_and!16719 (not b_next!9333))
