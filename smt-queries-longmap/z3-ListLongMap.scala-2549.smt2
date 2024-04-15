; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39098 () Bool)

(assert start!39098)

(declare-fun b_free!9379 () Bool)

(declare-fun b_next!9379 () Bool)

(assert (=> start!39098 (= b_free!9379 (not b_next!9379))))

(declare-fun tp!33665 () Bool)

(declare-fun b_and!16739 () Bool)

(assert (=> start!39098 (= tp!33665 b_and!16739)))

(declare-fun b!410861 () Bool)

(declare-fun res!238323 () Bool)

(declare-fun e!246109 () Bool)

(assert (=> b!410861 (=> (not res!238323) (not e!246109))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410861 (= res!238323 (validMask!0 mask!1025))))

(declare-fun b!410862 () Bool)

(declare-fun e!246113 () Bool)

(declare-fun tp_is_empty!10531 () Bool)

(assert (=> b!410862 (= e!246113 tp_is_empty!10531)))

(declare-fun b!410863 () Bool)

(declare-fun res!238315 () Bool)

(assert (=> b!410863 (=> (not res!238315) (not e!246109))))

(declare-datatypes ((array!24917 0))(
  ( (array!24918 (arr!11908 (Array (_ BitVec 32) (_ BitVec 64))) (size!12261 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24917)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15147 0))(
  ( (V!15148 (val!5310 Int)) )
))
(declare-datatypes ((ValueCell!4922 0))(
  ( (ValueCellFull!4922 (v!7551 V!15147)) (EmptyCell!4922) )
))
(declare-datatypes ((array!24919 0))(
  ( (array!24920 (arr!11909 (Array (_ BitVec 32) ValueCell!4922)) (size!12262 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24919)

(assert (=> b!410863 (= res!238315 (and (= (size!12262 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12261 _keys!709) (size!12262 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!410864 () Bool)

(declare-fun res!238321 () Bool)

(assert (=> b!410864 (=> (not res!238321) (not e!246109))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24917 (_ BitVec 32)) Bool)

(assert (=> b!410864 (= res!238321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!410865 () Bool)

(declare-fun res!238318 () Bool)

(declare-fun e!246114 () Bool)

(assert (=> b!410865 (=> (not res!238318) (not e!246114))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!410865 (= res!238318 (bvsle from!863 i!563))))

(declare-fun b!410866 () Bool)

(declare-fun res!238325 () Bool)

(assert (=> b!410866 (=> (not res!238325) (not e!246109))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!410866 (= res!238325 (validKeyInArray!0 k0!794))))

(declare-fun b!410867 () Bool)

(declare-fun e!246112 () Bool)

(assert (=> b!410867 (= e!246112 tp_is_empty!10531)))

(declare-fun b!410868 () Bool)

(declare-fun res!238317 () Bool)

(assert (=> b!410868 (=> (not res!238317) (not e!246114))))

(declare-fun lt!188987 () array!24917)

(declare-datatypes ((List!6888 0))(
  ( (Nil!6885) (Cons!6884 (h!7740 (_ BitVec 64)) (t!12053 List!6888)) )
))
(declare-fun arrayNoDuplicates!0 (array!24917 (_ BitVec 32) List!6888) Bool)

(assert (=> b!410868 (= res!238317 (arrayNoDuplicates!0 lt!188987 #b00000000000000000000000000000000 Nil!6885))))

(declare-fun mapNonEmpty!17418 () Bool)

(declare-fun mapRes!17418 () Bool)

(declare-fun tp!33666 () Bool)

(assert (=> mapNonEmpty!17418 (= mapRes!17418 (and tp!33666 e!246112))))

(declare-fun mapValue!17418 () ValueCell!4922)

(declare-fun mapRest!17418 () (Array (_ BitVec 32) ValueCell!4922))

(declare-fun mapKey!17418 () (_ BitVec 32))

(assert (=> mapNonEmpty!17418 (= (arr!11909 _values!549) (store mapRest!17418 mapKey!17418 mapValue!17418))))

(declare-fun b!410869 () Bool)

(assert (=> b!410869 (= e!246114 false)))

(declare-fun zeroValue!515 () V!15147)

(declare-fun v!412 () V!15147)

(declare-fun minValue!515 () V!15147)

(declare-datatypes ((tuple2!6876 0))(
  ( (tuple2!6877 (_1!3449 (_ BitVec 64)) (_2!3449 V!15147)) )
))
(declare-datatypes ((List!6889 0))(
  ( (Nil!6886) (Cons!6885 (h!7741 tuple2!6876) (t!12054 List!6889)) )
))
(declare-datatypes ((ListLongMap!5779 0))(
  ( (ListLongMap!5780 (toList!2905 List!6889)) )
))
(declare-fun lt!188985 () ListLongMap!5779)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1119 (array!24917 array!24919 (_ BitVec 32) (_ BitVec 32) V!15147 V!15147 (_ BitVec 32) Int) ListLongMap!5779)

(assert (=> b!410869 (= lt!188985 (getCurrentListMapNoExtraKeys!1119 lt!188987 (array!24920 (store (arr!11909 _values!549) i!563 (ValueCellFull!4922 v!412)) (size!12262 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!188986 () ListLongMap!5779)

(assert (=> b!410869 (= lt!188986 (getCurrentListMapNoExtraKeys!1119 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!410870 () Bool)

(declare-fun res!238316 () Bool)

(assert (=> b!410870 (=> (not res!238316) (not e!246109))))

(declare-fun arrayContainsKey!0 (array!24917 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410870 (= res!238316 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17418 () Bool)

(assert (=> mapIsEmpty!17418 mapRes!17418))

(declare-fun b!410871 () Bool)

(declare-fun res!238322 () Bool)

(assert (=> b!410871 (=> (not res!238322) (not e!246109))))

(assert (=> b!410871 (= res!238322 (or (= (select (arr!11908 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11908 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!410872 () Bool)

(declare-fun res!238324 () Bool)

(assert (=> b!410872 (=> (not res!238324) (not e!246109))))

(assert (=> b!410872 (= res!238324 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6885))))

(declare-fun b!410873 () Bool)

(declare-fun res!238319 () Bool)

(assert (=> b!410873 (=> (not res!238319) (not e!246109))))

(assert (=> b!410873 (= res!238319 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12261 _keys!709))))))

(declare-fun b!410874 () Bool)

(declare-fun e!246111 () Bool)

(assert (=> b!410874 (= e!246111 (and e!246113 mapRes!17418))))

(declare-fun condMapEmpty!17418 () Bool)

(declare-fun mapDefault!17418 () ValueCell!4922)

(assert (=> b!410874 (= condMapEmpty!17418 (= (arr!11909 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4922)) mapDefault!17418)))))

(declare-fun res!238326 () Bool)

(assert (=> start!39098 (=> (not res!238326) (not e!246109))))

(assert (=> start!39098 (= res!238326 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12261 _keys!709))))))

(assert (=> start!39098 e!246109))

(assert (=> start!39098 tp_is_empty!10531))

(assert (=> start!39098 tp!33665))

(assert (=> start!39098 true))

(declare-fun array_inv!8738 (array!24919) Bool)

(assert (=> start!39098 (and (array_inv!8738 _values!549) e!246111)))

(declare-fun array_inv!8739 (array!24917) Bool)

(assert (=> start!39098 (array_inv!8739 _keys!709)))

(declare-fun b!410875 () Bool)

(assert (=> b!410875 (= e!246109 e!246114)))

(declare-fun res!238320 () Bool)

(assert (=> b!410875 (=> (not res!238320) (not e!246114))))

(assert (=> b!410875 (= res!238320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188987 mask!1025))))

(assert (=> b!410875 (= lt!188987 (array!24918 (store (arr!11908 _keys!709) i!563 k0!794) (size!12261 _keys!709)))))

(assert (= (and start!39098 res!238326) b!410861))

(assert (= (and b!410861 res!238323) b!410863))

(assert (= (and b!410863 res!238315) b!410864))

(assert (= (and b!410864 res!238321) b!410872))

(assert (= (and b!410872 res!238324) b!410873))

(assert (= (and b!410873 res!238319) b!410866))

(assert (= (and b!410866 res!238325) b!410871))

(assert (= (and b!410871 res!238322) b!410870))

(assert (= (and b!410870 res!238316) b!410875))

(assert (= (and b!410875 res!238320) b!410868))

(assert (= (and b!410868 res!238317) b!410865))

(assert (= (and b!410865 res!238318) b!410869))

(assert (= (and b!410874 condMapEmpty!17418) mapIsEmpty!17418))

(assert (= (and b!410874 (not condMapEmpty!17418)) mapNonEmpty!17418))

(get-info :version)

(assert (= (and mapNonEmpty!17418 ((_ is ValueCellFull!4922) mapValue!17418)) b!410867))

(assert (= (and b!410874 ((_ is ValueCellFull!4922) mapDefault!17418)) b!410862))

(assert (= start!39098 b!410874))

(declare-fun m!400659 () Bool)

(assert (=> b!410872 m!400659))

(declare-fun m!400661 () Bool)

(assert (=> b!410869 m!400661))

(declare-fun m!400663 () Bool)

(assert (=> b!410869 m!400663))

(declare-fun m!400665 () Bool)

(assert (=> b!410869 m!400665))

(declare-fun m!400667 () Bool)

(assert (=> start!39098 m!400667))

(declare-fun m!400669 () Bool)

(assert (=> start!39098 m!400669))

(declare-fun m!400671 () Bool)

(assert (=> b!410866 m!400671))

(declare-fun m!400673 () Bool)

(assert (=> b!410875 m!400673))

(declare-fun m!400675 () Bool)

(assert (=> b!410875 m!400675))

(declare-fun m!400677 () Bool)

(assert (=> b!410864 m!400677))

(declare-fun m!400679 () Bool)

(assert (=> b!410871 m!400679))

(declare-fun m!400681 () Bool)

(assert (=> b!410861 m!400681))

(declare-fun m!400683 () Bool)

(assert (=> b!410870 m!400683))

(declare-fun m!400685 () Bool)

(assert (=> mapNonEmpty!17418 m!400685))

(declare-fun m!400687 () Bool)

(assert (=> b!410868 m!400687))

(check-sat (not b!410864) (not b!410869) tp_is_empty!10531 (not start!39098) (not b!410872) (not b!410866) (not b!410870) (not b!410868) (not b!410875) b_and!16739 (not b_next!9379) (not b!410861) (not mapNonEmpty!17418))
(check-sat b_and!16739 (not b_next!9379))
