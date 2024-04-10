; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39150 () Bool)

(assert start!39150)

(declare-fun b_free!9417 () Bool)

(declare-fun b_next!9417 () Bool)

(assert (=> start!39150 (= b_free!9417 (not b_next!9417))))

(declare-fun tp!33779 () Bool)

(declare-fun b_and!16803 () Bool)

(assert (=> start!39150 (= tp!33779 b_and!16803)))

(declare-fun b!411987 () Bool)

(declare-fun e!246625 () Bool)

(assert (=> b!411987 (= e!246625 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!15197 0))(
  ( (V!15198 (val!5329 Int)) )
))
(declare-fun minValue!515 () V!15197)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!6912 0))(
  ( (tuple2!6913 (_1!3467 (_ BitVec 64)) (_2!3467 V!15197)) )
))
(declare-datatypes ((List!6937 0))(
  ( (Nil!6934) (Cons!6933 (h!7789 tuple2!6912) (t!12111 List!6937)) )
))
(declare-datatypes ((ListLongMap!5825 0))(
  ( (ListLongMap!5826 (toList!2928 List!6937)) )
))
(declare-fun lt!189390 () ListLongMap!5825)

(declare-datatypes ((ValueCell!4941 0))(
  ( (ValueCellFull!4941 (v!7576 V!15197)) (EmptyCell!4941) )
))
(declare-datatypes ((array!24999 0))(
  ( (array!25000 (arr!11949 (Array (_ BitVec 32) ValueCell!4941)) (size!12301 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24999)

(declare-fun zeroValue!515 () V!15197)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15197)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!25001 0))(
  ( (array!25002 (arr!11950 (Array (_ BitVec 32) (_ BitVec 64))) (size!12302 (_ BitVec 32))) )
))
(declare-fun lt!189391 () array!25001)

(declare-fun getCurrentListMapNoExtraKeys!1136 (array!25001 array!24999 (_ BitVec 32) (_ BitVec 32) V!15197 V!15197 (_ BitVec 32) Int) ListLongMap!5825)

(assert (=> b!411987 (= lt!189390 (getCurrentListMapNoExtraKeys!1136 lt!189391 (array!25000 (store (arr!11949 _values!549) i!563 (ValueCellFull!4941 v!412)) (size!12301 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _keys!709 () array!25001)

(declare-fun lt!189392 () ListLongMap!5825)

(assert (=> b!411987 (= lt!189392 (getCurrentListMapNoExtraKeys!1136 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!17475 () Bool)

(declare-fun mapRes!17475 () Bool)

(declare-fun tp!33780 () Bool)

(declare-fun e!246627 () Bool)

(assert (=> mapNonEmpty!17475 (= mapRes!17475 (and tp!33780 e!246627))))

(declare-fun mapKey!17475 () (_ BitVec 32))

(declare-fun mapValue!17475 () ValueCell!4941)

(declare-fun mapRest!17475 () (Array (_ BitVec 32) ValueCell!4941))

(assert (=> mapNonEmpty!17475 (= (arr!11949 _values!549) (store mapRest!17475 mapKey!17475 mapValue!17475))))

(declare-fun b!411988 () Bool)

(declare-fun res!239134 () Bool)

(assert (=> b!411988 (=> (not res!239134) (not e!246625))))

(assert (=> b!411988 (= res!239134 (bvsle from!863 i!563))))

(declare-fun b!411989 () Bool)

(declare-fun res!239132 () Bool)

(assert (=> b!411989 (=> (not res!239132) (not e!246625))))

(declare-datatypes ((List!6938 0))(
  ( (Nil!6935) (Cons!6934 (h!7790 (_ BitVec 64)) (t!12112 List!6938)) )
))
(declare-fun arrayNoDuplicates!0 (array!25001 (_ BitVec 32) List!6938) Bool)

(assert (=> b!411989 (= res!239132 (arrayNoDuplicates!0 lt!189391 #b00000000000000000000000000000000 Nil!6935))))

(declare-fun b!411990 () Bool)

(declare-fun res!239139 () Bool)

(declare-fun e!246629 () Bool)

(assert (=> b!411990 (=> (not res!239139) (not e!246629))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!411990 (= res!239139 (validMask!0 mask!1025))))

(declare-fun b!411991 () Bool)

(declare-fun res!239131 () Bool)

(assert (=> b!411991 (=> (not res!239131) (not e!246629))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!411991 (= res!239131 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!411992 () Bool)

(declare-fun res!239138 () Bool)

(assert (=> b!411992 (=> (not res!239138) (not e!246629))))

(assert (=> b!411992 (= res!239138 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12302 _keys!709))))))

(declare-fun b!411993 () Bool)

(declare-fun res!239135 () Bool)

(assert (=> b!411993 (=> (not res!239135) (not e!246629))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!411993 (= res!239135 (validKeyInArray!0 k0!794))))

(declare-fun b!411994 () Bool)

(declare-fun res!239128 () Bool)

(assert (=> b!411994 (=> (not res!239128) (not e!246629))))

(assert (=> b!411994 (= res!239128 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6935))))

(declare-fun b!411995 () Bool)

(declare-fun tp_is_empty!10569 () Bool)

(assert (=> b!411995 (= e!246627 tp_is_empty!10569)))

(declare-fun b!411996 () Bool)

(declare-fun e!246630 () Bool)

(assert (=> b!411996 (= e!246630 tp_is_empty!10569)))

(declare-fun b!411997 () Bool)

(declare-fun res!239136 () Bool)

(assert (=> b!411997 (=> (not res!239136) (not e!246629))))

(assert (=> b!411997 (= res!239136 (and (= (size!12301 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12302 _keys!709) (size!12301 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!411998 () Bool)

(declare-fun res!239129 () Bool)

(assert (=> b!411998 (=> (not res!239129) (not e!246629))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25001 (_ BitVec 32)) Bool)

(assert (=> b!411998 (= res!239129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!239133 () Bool)

(assert (=> start!39150 (=> (not res!239133) (not e!246629))))

(assert (=> start!39150 (= res!239133 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12302 _keys!709))))))

(assert (=> start!39150 e!246629))

(assert (=> start!39150 tp_is_empty!10569))

(assert (=> start!39150 tp!33779))

(assert (=> start!39150 true))

(declare-fun e!246626 () Bool)

(declare-fun array_inv!8714 (array!24999) Bool)

(assert (=> start!39150 (and (array_inv!8714 _values!549) e!246626)))

(declare-fun array_inv!8715 (array!25001) Bool)

(assert (=> start!39150 (array_inv!8715 _keys!709)))

(declare-fun mapIsEmpty!17475 () Bool)

(assert (=> mapIsEmpty!17475 mapRes!17475))

(declare-fun b!411999 () Bool)

(declare-fun res!239137 () Bool)

(assert (=> b!411999 (=> (not res!239137) (not e!246629))))

(assert (=> b!411999 (= res!239137 (or (= (select (arr!11950 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11950 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!412000 () Bool)

(assert (=> b!412000 (= e!246626 (and e!246630 mapRes!17475))))

(declare-fun condMapEmpty!17475 () Bool)

(declare-fun mapDefault!17475 () ValueCell!4941)

(assert (=> b!412000 (= condMapEmpty!17475 (= (arr!11949 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4941)) mapDefault!17475)))))

(declare-fun b!412001 () Bool)

(assert (=> b!412001 (= e!246629 e!246625)))

(declare-fun res!239130 () Bool)

(assert (=> b!412001 (=> (not res!239130) (not e!246625))))

(assert (=> b!412001 (= res!239130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189391 mask!1025))))

(assert (=> b!412001 (= lt!189391 (array!25002 (store (arr!11950 _keys!709) i!563 k0!794) (size!12302 _keys!709)))))

(assert (= (and start!39150 res!239133) b!411990))

(assert (= (and b!411990 res!239139) b!411997))

(assert (= (and b!411997 res!239136) b!411998))

(assert (= (and b!411998 res!239129) b!411994))

(assert (= (and b!411994 res!239128) b!411992))

(assert (= (and b!411992 res!239138) b!411993))

(assert (= (and b!411993 res!239135) b!411999))

(assert (= (and b!411999 res!239137) b!411991))

(assert (= (and b!411991 res!239131) b!412001))

(assert (= (and b!412001 res!239130) b!411989))

(assert (= (and b!411989 res!239132) b!411988))

(assert (= (and b!411988 res!239134) b!411987))

(assert (= (and b!412000 condMapEmpty!17475) mapIsEmpty!17475))

(assert (= (and b!412000 (not condMapEmpty!17475)) mapNonEmpty!17475))

(get-info :version)

(assert (= (and mapNonEmpty!17475 ((_ is ValueCellFull!4941) mapValue!17475)) b!411995))

(assert (= (and b!412000 ((_ is ValueCellFull!4941) mapDefault!17475)) b!411996))

(assert (= start!39150 b!412000))

(declare-fun m!401953 () Bool)

(assert (=> b!411987 m!401953))

(declare-fun m!401955 () Bool)

(assert (=> b!411987 m!401955))

(declare-fun m!401957 () Bool)

(assert (=> b!411987 m!401957))

(declare-fun m!401959 () Bool)

(assert (=> start!39150 m!401959))

(declare-fun m!401961 () Bool)

(assert (=> start!39150 m!401961))

(declare-fun m!401963 () Bool)

(assert (=> b!411994 m!401963))

(declare-fun m!401965 () Bool)

(assert (=> mapNonEmpty!17475 m!401965))

(declare-fun m!401967 () Bool)

(assert (=> b!411989 m!401967))

(declare-fun m!401969 () Bool)

(assert (=> b!411990 m!401969))

(declare-fun m!401971 () Bool)

(assert (=> b!412001 m!401971))

(declare-fun m!401973 () Bool)

(assert (=> b!412001 m!401973))

(declare-fun m!401975 () Bool)

(assert (=> b!411998 m!401975))

(declare-fun m!401977 () Bool)

(assert (=> b!411993 m!401977))

(declare-fun m!401979 () Bool)

(assert (=> b!411999 m!401979))

(declare-fun m!401981 () Bool)

(assert (=> b!411991 m!401981))

(check-sat (not mapNonEmpty!17475) (not b!412001) (not b!411998) (not b!411989) (not b!411987) (not b!411991) (not start!39150) b_and!16803 (not b!411994) tp_is_empty!10569 (not b!411990) (not b!411993) (not b_next!9417))
(check-sat b_and!16803 (not b_next!9417))
