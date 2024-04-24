; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39068 () Bool)

(assert start!39068)

(declare-fun b_free!9349 () Bool)

(declare-fun b_next!9349 () Bool)

(assert (=> start!39068 (= b_free!9349 (not b_next!9349))))

(declare-fun tp!33576 () Bool)

(declare-fun b_and!16749 () Bool)

(assert (=> start!39068 (= tp!33576 b_and!16749)))

(declare-fun res!237909 () Bool)

(declare-fun e!245981 () Bool)

(assert (=> start!39068 (=> (not res!237909) (not e!245981))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24868 0))(
  ( (array!24869 (arr!11883 (Array (_ BitVec 32) (_ BitVec 64))) (size!12235 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24868)

(assert (=> start!39068 (= res!237909 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12235 _keys!709))))))

(assert (=> start!39068 e!245981))

(declare-fun tp_is_empty!10501 () Bool)

(assert (=> start!39068 tp_is_empty!10501))

(assert (=> start!39068 tp!33576))

(assert (=> start!39068 true))

(declare-datatypes ((V!15107 0))(
  ( (V!15108 (val!5295 Int)) )
))
(declare-datatypes ((ValueCell!4907 0))(
  ( (ValueCellFull!4907 (v!7543 V!15107)) (EmptyCell!4907) )
))
(declare-datatypes ((array!24870 0))(
  ( (array!24871 (arr!11884 (Array (_ BitVec 32) ValueCell!4907)) (size!12236 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24870)

(declare-fun e!245986 () Bool)

(declare-fun array_inv!8752 (array!24870) Bool)

(assert (=> start!39068 (and (array_inv!8752 _values!549) e!245986)))

(declare-fun array_inv!8753 (array!24868) Bool)

(assert (=> start!39068 (array_inv!8753 _keys!709)))

(declare-fun b!410408 () Bool)

(declare-fun e!245985 () Bool)

(assert (=> b!410408 (= e!245985 tp_is_empty!10501)))

(declare-fun mapNonEmpty!17373 () Bool)

(declare-fun mapRes!17373 () Bool)

(declare-fun tp!33575 () Bool)

(assert (=> mapNonEmpty!17373 (= mapRes!17373 (and tp!33575 e!245985))))

(declare-fun mapValue!17373 () ValueCell!4907)

(declare-fun mapKey!17373 () (_ BitVec 32))

(declare-fun mapRest!17373 () (Array (_ BitVec 32) ValueCell!4907))

(assert (=> mapNonEmpty!17373 (= (arr!11884 _values!549) (store mapRest!17373 mapKey!17373 mapValue!17373))))

(declare-fun b!410409 () Bool)

(declare-fun res!237906 () Bool)

(assert (=> b!410409 (=> (not res!237906) (not e!245981))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!410409 (= res!237906 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12235 _keys!709))))))

(declare-fun b!410410 () Bool)

(declare-fun e!245983 () Bool)

(assert (=> b!410410 (= e!245983 tp_is_empty!10501)))

(declare-fun b!410411 () Bool)

(declare-fun res!237910 () Bool)

(assert (=> b!410411 (=> (not res!237910) (not e!245981))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410411 (= res!237910 (validMask!0 mask!1025))))

(declare-fun b!410412 () Bool)

(declare-fun res!237904 () Bool)

(declare-fun e!245984 () Bool)

(assert (=> b!410412 (=> (not res!237904) (not e!245984))))

(declare-fun lt!189104 () array!24868)

(declare-datatypes ((List!6760 0))(
  ( (Nil!6757) (Cons!6756 (h!7612 (_ BitVec 64)) (t!11926 List!6760)) )
))
(declare-fun arrayNoDuplicates!0 (array!24868 (_ BitVec 32) List!6760) Bool)

(assert (=> b!410412 (= res!237904 (arrayNoDuplicates!0 lt!189104 #b00000000000000000000000000000000 Nil!6757))))

(declare-fun b!410413 () Bool)

(declare-fun res!237911 () Bool)

(assert (=> b!410413 (=> (not res!237911) (not e!245981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24868 (_ BitVec 32)) Bool)

(assert (=> b!410413 (= res!237911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!410414 () Bool)

(assert (=> b!410414 (= e!245981 e!245984)))

(declare-fun res!237902 () Bool)

(assert (=> b!410414 (=> (not res!237902) (not e!245984))))

(assert (=> b!410414 (= res!237902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189104 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!410414 (= lt!189104 (array!24869 (store (arr!11883 _keys!709) i!563 k0!794) (size!12235 _keys!709)))))

(declare-fun mapIsEmpty!17373 () Bool)

(assert (=> mapIsEmpty!17373 mapRes!17373))

(declare-fun b!410415 () Bool)

(assert (=> b!410415 (= e!245984 false)))

(declare-fun minValue!515 () V!15107)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15107)

(declare-datatypes ((tuple2!6742 0))(
  ( (tuple2!6743 (_1!3382 (_ BitVec 64)) (_2!3382 V!15107)) )
))
(declare-datatypes ((List!6761 0))(
  ( (Nil!6758) (Cons!6757 (h!7613 tuple2!6742) (t!11927 List!6761)) )
))
(declare-datatypes ((ListLongMap!5657 0))(
  ( (ListLongMap!5658 (toList!2844 List!6761)) )
))
(declare-fun lt!189105 () ListLongMap!5657)

(declare-fun v!412 () V!15107)

(declare-fun getCurrentListMapNoExtraKeys!1096 (array!24868 array!24870 (_ BitVec 32) (_ BitVec 32) V!15107 V!15107 (_ BitVec 32) Int) ListLongMap!5657)

(assert (=> b!410415 (= lt!189105 (getCurrentListMapNoExtraKeys!1096 lt!189104 (array!24871 (store (arr!11884 _values!549) i!563 (ValueCellFull!4907 v!412)) (size!12236 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189103 () ListLongMap!5657)

(assert (=> b!410415 (= lt!189103 (getCurrentListMapNoExtraKeys!1096 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!410416 () Bool)

(assert (=> b!410416 (= e!245986 (and e!245983 mapRes!17373))))

(declare-fun condMapEmpty!17373 () Bool)

(declare-fun mapDefault!17373 () ValueCell!4907)

(assert (=> b!410416 (= condMapEmpty!17373 (= (arr!11884 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4907)) mapDefault!17373)))))

(declare-fun b!410417 () Bool)

(declare-fun res!237903 () Bool)

(assert (=> b!410417 (=> (not res!237903) (not e!245981))))

(assert (=> b!410417 (= res!237903 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6757))))

(declare-fun b!410418 () Bool)

(declare-fun res!237901 () Bool)

(assert (=> b!410418 (=> (not res!237901) (not e!245981))))

(assert (=> b!410418 (= res!237901 (and (= (size!12236 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12235 _keys!709) (size!12236 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!410419 () Bool)

(declare-fun res!237907 () Bool)

(assert (=> b!410419 (=> (not res!237907) (not e!245981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!410419 (= res!237907 (validKeyInArray!0 k0!794))))

(declare-fun b!410420 () Bool)

(declare-fun res!237908 () Bool)

(assert (=> b!410420 (=> (not res!237908) (not e!245981))))

(assert (=> b!410420 (= res!237908 (or (= (select (arr!11883 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11883 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!410421 () Bool)

(declare-fun res!237905 () Bool)

(assert (=> b!410421 (=> (not res!237905) (not e!245981))))

(declare-fun arrayContainsKey!0 (array!24868 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410421 (= res!237905 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!410422 () Bool)

(declare-fun res!237912 () Bool)

(assert (=> b!410422 (=> (not res!237912) (not e!245984))))

(assert (=> b!410422 (= res!237912 (bvsle from!863 i!563))))

(assert (= (and start!39068 res!237909) b!410411))

(assert (= (and b!410411 res!237910) b!410418))

(assert (= (and b!410418 res!237901) b!410413))

(assert (= (and b!410413 res!237911) b!410417))

(assert (= (and b!410417 res!237903) b!410409))

(assert (= (and b!410409 res!237906) b!410419))

(assert (= (and b!410419 res!237907) b!410420))

(assert (= (and b!410420 res!237908) b!410421))

(assert (= (and b!410421 res!237905) b!410414))

(assert (= (and b!410414 res!237902) b!410412))

(assert (= (and b!410412 res!237904) b!410422))

(assert (= (and b!410422 res!237912) b!410415))

(assert (= (and b!410416 condMapEmpty!17373) mapIsEmpty!17373))

(assert (= (and b!410416 (not condMapEmpty!17373)) mapNonEmpty!17373))

(get-info :version)

(assert (= (and mapNonEmpty!17373 ((_ is ValueCellFull!4907) mapValue!17373)) b!410408))

(assert (= (and b!410416 ((_ is ValueCellFull!4907) mapDefault!17373)) b!410410))

(assert (= start!39068 b!410416))

(declare-fun m!401163 () Bool)

(assert (=> b!410420 m!401163))

(declare-fun m!401165 () Bool)

(assert (=> b!410417 m!401165))

(declare-fun m!401167 () Bool)

(assert (=> b!410414 m!401167))

(declare-fun m!401169 () Bool)

(assert (=> b!410414 m!401169))

(declare-fun m!401171 () Bool)

(assert (=> mapNonEmpty!17373 m!401171))

(declare-fun m!401173 () Bool)

(assert (=> b!410413 m!401173))

(declare-fun m!401175 () Bool)

(assert (=> b!410419 m!401175))

(declare-fun m!401177 () Bool)

(assert (=> b!410415 m!401177))

(declare-fun m!401179 () Bool)

(assert (=> b!410415 m!401179))

(declare-fun m!401181 () Bool)

(assert (=> b!410415 m!401181))

(declare-fun m!401183 () Bool)

(assert (=> start!39068 m!401183))

(declare-fun m!401185 () Bool)

(assert (=> start!39068 m!401185))

(declare-fun m!401187 () Bool)

(assert (=> b!410412 m!401187))

(declare-fun m!401189 () Bool)

(assert (=> b!410411 m!401189))

(declare-fun m!401191 () Bool)

(assert (=> b!410421 m!401191))

(check-sat tp_is_empty!10501 (not start!39068) (not b!410421) (not mapNonEmpty!17373) (not b_next!9349) (not b!410415) (not b!410419) (not b!410413) (not b!410411) b_and!16749 (not b!410412) (not b!410417) (not b!410414))
(check-sat b_and!16749 (not b_next!9349))
