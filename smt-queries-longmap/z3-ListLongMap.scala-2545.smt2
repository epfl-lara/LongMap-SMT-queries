; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39090 () Bool)

(assert start!39090)

(declare-fun b_free!9357 () Bool)

(declare-fun b_next!9357 () Bool)

(assert (=> start!39090 (= b_free!9357 (not b_next!9357))))

(declare-fun tp!33600 () Bool)

(declare-fun b_and!16743 () Bool)

(assert (=> start!39090 (= tp!33600 b_and!16743)))

(declare-fun b!410637 () Bool)

(declare-fun res!238048 () Bool)

(declare-fun e!246086 () Bool)

(assert (=> b!410637 (=> (not res!238048) (not e!246086))))

(declare-datatypes ((array!24885 0))(
  ( (array!24886 (arr!11892 (Array (_ BitVec 32) (_ BitVec 64))) (size!12244 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24885)

(declare-datatypes ((List!6897 0))(
  ( (Nil!6894) (Cons!6893 (h!7749 (_ BitVec 64)) (t!12071 List!6897)) )
))
(declare-fun arrayNoDuplicates!0 (array!24885 (_ BitVec 32) List!6897) Bool)

(assert (=> b!410637 (= res!238048 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6894))))

(declare-fun res!238056 () Bool)

(assert (=> start!39090 (=> (not res!238056) (not e!246086))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39090 (= res!238056 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12244 _keys!709))))))

(assert (=> start!39090 e!246086))

(declare-fun tp_is_empty!10509 () Bool)

(assert (=> start!39090 tp_is_empty!10509))

(assert (=> start!39090 tp!33600))

(assert (=> start!39090 true))

(declare-datatypes ((V!15117 0))(
  ( (V!15118 (val!5299 Int)) )
))
(declare-datatypes ((ValueCell!4911 0))(
  ( (ValueCellFull!4911 (v!7546 V!15117)) (EmptyCell!4911) )
))
(declare-datatypes ((array!24887 0))(
  ( (array!24888 (arr!11893 (Array (_ BitVec 32) ValueCell!4911)) (size!12245 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24887)

(declare-fun e!246088 () Bool)

(declare-fun array_inv!8680 (array!24887) Bool)

(assert (=> start!39090 (and (array_inv!8680 _values!549) e!246088)))

(declare-fun array_inv!8681 (array!24885) Bool)

(assert (=> start!39090 (array_inv!8681 _keys!709)))

(declare-fun b!410638 () Bool)

(declare-fun e!246089 () Bool)

(assert (=> b!410638 (= e!246089 false)))

(declare-fun minValue!515 () V!15117)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!189120 () array!24885)

(declare-datatypes ((tuple2!6872 0))(
  ( (tuple2!6873 (_1!3447 (_ BitVec 64)) (_2!3447 V!15117)) )
))
(declare-datatypes ((List!6898 0))(
  ( (Nil!6895) (Cons!6894 (h!7750 tuple2!6872) (t!12072 List!6898)) )
))
(declare-datatypes ((ListLongMap!5785 0))(
  ( (ListLongMap!5786 (toList!2908 List!6898)) )
))
(declare-fun lt!189121 () ListLongMap!5785)

(declare-fun zeroValue!515 () V!15117)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15117)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1116 (array!24885 array!24887 (_ BitVec 32) (_ BitVec 32) V!15117 V!15117 (_ BitVec 32) Int) ListLongMap!5785)

(assert (=> b!410638 (= lt!189121 (getCurrentListMapNoExtraKeys!1116 lt!189120 (array!24888 (store (arr!11893 _values!549) i!563 (ValueCellFull!4911 v!412)) (size!12245 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189122 () ListLongMap!5785)

(assert (=> b!410638 (= lt!189122 (getCurrentListMapNoExtraKeys!1116 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!410639 () Bool)

(declare-fun res!238058 () Bool)

(assert (=> b!410639 (=> (not res!238058) (not e!246086))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!410639 (= res!238058 (validKeyInArray!0 k0!794))))

(declare-fun b!410640 () Bool)

(declare-fun res!238057 () Bool)

(assert (=> b!410640 (=> (not res!238057) (not e!246086))))

(assert (=> b!410640 (= res!238057 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12244 _keys!709))))))

(declare-fun b!410641 () Bool)

(declare-fun res!238059 () Bool)

(assert (=> b!410641 (=> (not res!238059) (not e!246086))))

(assert (=> b!410641 (= res!238059 (and (= (size!12245 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12244 _keys!709) (size!12245 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!410642 () Bool)

(declare-fun res!238053 () Bool)

(assert (=> b!410642 (=> (not res!238053) (not e!246086))))

(assert (=> b!410642 (= res!238053 (or (= (select (arr!11892 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11892 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!410643 () Bool)

(declare-fun res!238054 () Bool)

(assert (=> b!410643 (=> (not res!238054) (not e!246086))))

(declare-fun arrayContainsKey!0 (array!24885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410643 (= res!238054 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!410644 () Bool)

(declare-fun res!238051 () Bool)

(assert (=> b!410644 (=> (not res!238051) (not e!246089))))

(assert (=> b!410644 (= res!238051 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!17385 () Bool)

(declare-fun mapRes!17385 () Bool)

(declare-fun tp!33599 () Bool)

(declare-fun e!246090 () Bool)

(assert (=> mapNonEmpty!17385 (= mapRes!17385 (and tp!33599 e!246090))))

(declare-fun mapValue!17385 () ValueCell!4911)

(declare-fun mapRest!17385 () (Array (_ BitVec 32) ValueCell!4911))

(declare-fun mapKey!17385 () (_ BitVec 32))

(assert (=> mapNonEmpty!17385 (= (arr!11893 _values!549) (store mapRest!17385 mapKey!17385 mapValue!17385))))

(declare-fun b!410645 () Bool)

(declare-fun res!238050 () Bool)

(assert (=> b!410645 (=> (not res!238050) (not e!246086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410645 (= res!238050 (validMask!0 mask!1025))))

(declare-fun b!410646 () Bool)

(declare-fun e!246087 () Bool)

(assert (=> b!410646 (= e!246087 tp_is_empty!10509)))

(declare-fun b!410647 () Bool)

(assert (=> b!410647 (= e!246088 (and e!246087 mapRes!17385))))

(declare-fun condMapEmpty!17385 () Bool)

(declare-fun mapDefault!17385 () ValueCell!4911)

(assert (=> b!410647 (= condMapEmpty!17385 (= (arr!11893 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4911)) mapDefault!17385)))))

(declare-fun b!410648 () Bool)

(assert (=> b!410648 (= e!246086 e!246089)))

(declare-fun res!238052 () Bool)

(assert (=> b!410648 (=> (not res!238052) (not e!246089))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24885 (_ BitVec 32)) Bool)

(assert (=> b!410648 (= res!238052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189120 mask!1025))))

(assert (=> b!410648 (= lt!189120 (array!24886 (store (arr!11892 _keys!709) i!563 k0!794) (size!12244 _keys!709)))))

(declare-fun b!410649 () Bool)

(assert (=> b!410649 (= e!246090 tp_is_empty!10509)))

(declare-fun mapIsEmpty!17385 () Bool)

(assert (=> mapIsEmpty!17385 mapRes!17385))

(declare-fun b!410650 () Bool)

(declare-fun res!238055 () Bool)

(assert (=> b!410650 (=> (not res!238055) (not e!246086))))

(assert (=> b!410650 (= res!238055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!410651 () Bool)

(declare-fun res!238049 () Bool)

(assert (=> b!410651 (=> (not res!238049) (not e!246089))))

(assert (=> b!410651 (= res!238049 (arrayNoDuplicates!0 lt!189120 #b00000000000000000000000000000000 Nil!6894))))

(assert (= (and start!39090 res!238056) b!410645))

(assert (= (and b!410645 res!238050) b!410641))

(assert (= (and b!410641 res!238059) b!410650))

(assert (= (and b!410650 res!238055) b!410637))

(assert (= (and b!410637 res!238048) b!410640))

(assert (= (and b!410640 res!238057) b!410639))

(assert (= (and b!410639 res!238058) b!410642))

(assert (= (and b!410642 res!238053) b!410643))

(assert (= (and b!410643 res!238054) b!410648))

(assert (= (and b!410648 res!238052) b!410651))

(assert (= (and b!410651 res!238049) b!410644))

(assert (= (and b!410644 res!238051) b!410638))

(assert (= (and b!410647 condMapEmpty!17385) mapIsEmpty!17385))

(assert (= (and b!410647 (not condMapEmpty!17385)) mapNonEmpty!17385))

(get-info :version)

(assert (= (and mapNonEmpty!17385 ((_ is ValueCellFull!4911) mapValue!17385)) b!410649))

(assert (= (and b!410647 ((_ is ValueCellFull!4911) mapDefault!17385)) b!410646))

(assert (= start!39090 b!410647))

(declare-fun m!401053 () Bool)

(assert (=> b!410650 m!401053))

(declare-fun m!401055 () Bool)

(assert (=> start!39090 m!401055))

(declare-fun m!401057 () Bool)

(assert (=> start!39090 m!401057))

(declare-fun m!401059 () Bool)

(assert (=> b!410637 m!401059))

(declare-fun m!401061 () Bool)

(assert (=> b!410648 m!401061))

(declare-fun m!401063 () Bool)

(assert (=> b!410648 m!401063))

(declare-fun m!401065 () Bool)

(assert (=> b!410638 m!401065))

(declare-fun m!401067 () Bool)

(assert (=> b!410638 m!401067))

(declare-fun m!401069 () Bool)

(assert (=> b!410638 m!401069))

(declare-fun m!401071 () Bool)

(assert (=> b!410645 m!401071))

(declare-fun m!401073 () Bool)

(assert (=> b!410642 m!401073))

(declare-fun m!401075 () Bool)

(assert (=> b!410643 m!401075))

(declare-fun m!401077 () Bool)

(assert (=> b!410639 m!401077))

(declare-fun m!401079 () Bool)

(assert (=> mapNonEmpty!17385 m!401079))

(declare-fun m!401081 () Bool)

(assert (=> b!410651 m!401081))

(check-sat (not b!410638) (not start!39090) (not mapNonEmpty!17385) (not b!410645) tp_is_empty!10509 (not b_next!9357) (not b!410648) b_and!16743 (not b!410639) (not b!410637) (not b!410643) (not b!410650) (not b!410651))
(check-sat b_and!16743 (not b_next!9357))
