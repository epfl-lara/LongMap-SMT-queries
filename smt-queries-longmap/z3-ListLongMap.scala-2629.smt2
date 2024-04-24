; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39578 () Bool)

(assert start!39578)

(declare-fun b_free!9859 () Bool)

(declare-fun b_next!9859 () Bool)

(assert (=> start!39578 (= b_free!9859 (not b_next!9859))))

(declare-fun tp!35105 () Bool)

(declare-fun b_and!17529 () Bool)

(assert (=> start!39578 (= tp!35105 b_and!17529)))

(declare-fun b!424025 () Bool)

(declare-fun res!247983 () Bool)

(declare-fun e!251960 () Bool)

(assert (=> b!424025 (=> (not res!247983) (not e!251960))))

(declare-datatypes ((array!25870 0))(
  ( (array!25871 (arr!12384 (Array (_ BitVec 32) (_ BitVec 64))) (size!12736 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25870)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!424025 (= res!247983 (or (= (select (arr!12384 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12384 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!424026 () Bool)

(declare-fun res!247992 () Bool)

(declare-fun e!251958 () Bool)

(assert (=> b!424026 (=> (not res!247992) (not e!251958))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!424026 (= res!247992 (bvsle from!863 i!563))))

(declare-fun b!424027 () Bool)

(declare-fun res!247989 () Bool)

(assert (=> b!424027 (=> (not res!247989) (not e!251958))))

(declare-fun lt!194316 () array!25870)

(declare-datatypes ((List!7179 0))(
  ( (Nil!7176) (Cons!7175 (h!8031 (_ BitVec 64)) (t!12615 List!7179)) )
))
(declare-fun arrayNoDuplicates!0 (array!25870 (_ BitVec 32) List!7179) Bool)

(assert (=> b!424027 (= res!247989 (arrayNoDuplicates!0 lt!194316 #b00000000000000000000000000000000 Nil!7176))))

(declare-fun b!424029 () Bool)

(declare-fun res!247991 () Bool)

(assert (=> b!424029 (=> (not res!247991) (not e!251960))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!424029 (= res!247991 (validMask!0 mask!1025))))

(declare-fun b!424030 () Bool)

(declare-fun res!247984 () Bool)

(assert (=> b!424030 (=> (not res!247984) (not e!251960))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25870 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424030 (= res!247984 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!424031 () Bool)

(declare-fun res!247986 () Bool)

(assert (=> b!424031 (=> (not res!247986) (not e!251960))))

(assert (=> b!424031 (= res!247986 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12736 _keys!709))))))

(declare-fun b!424032 () Bool)

(assert (=> b!424032 (= e!251958 false)))

(declare-datatypes ((V!15787 0))(
  ( (V!15788 (val!5550 Int)) )
))
(declare-fun minValue!515 () V!15787)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7172 0))(
  ( (tuple2!7173 (_1!3597 (_ BitVec 64)) (_2!3597 V!15787)) )
))
(declare-datatypes ((List!7180 0))(
  ( (Nil!7177) (Cons!7176 (h!8032 tuple2!7172) (t!12616 List!7180)) )
))
(declare-datatypes ((ListLongMap!6087 0))(
  ( (ListLongMap!6088 (toList!3059 List!7180)) )
))
(declare-fun lt!194314 () ListLongMap!6087)

(declare-datatypes ((ValueCell!5162 0))(
  ( (ValueCellFull!5162 (v!7798 V!15787)) (EmptyCell!5162) )
))
(declare-datatypes ((array!25872 0))(
  ( (array!25873 (arr!12385 (Array (_ BitVec 32) ValueCell!5162)) (size!12737 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25872)

(declare-fun zeroValue!515 () V!15787)

(declare-fun v!412 () V!15787)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1305 (array!25870 array!25872 (_ BitVec 32) (_ BitVec 32) V!15787 V!15787 (_ BitVec 32) Int) ListLongMap!6087)

(assert (=> b!424032 (= lt!194314 (getCurrentListMapNoExtraKeys!1305 lt!194316 (array!25873 (store (arr!12385 _values!549) i!563 (ValueCellFull!5162 v!412)) (size!12737 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194315 () ListLongMap!6087)

(assert (=> b!424032 (= lt!194315 (getCurrentListMapNoExtraKeys!1305 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!424033 () Bool)

(declare-fun e!251957 () Bool)

(declare-fun e!251961 () Bool)

(declare-fun mapRes!18138 () Bool)

(assert (=> b!424033 (= e!251957 (and e!251961 mapRes!18138))))

(declare-fun condMapEmpty!18138 () Bool)

(declare-fun mapDefault!18138 () ValueCell!5162)

(assert (=> b!424033 (= condMapEmpty!18138 (= (arr!12385 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5162)) mapDefault!18138)))))

(declare-fun b!424034 () Bool)

(assert (=> b!424034 (= e!251960 e!251958)))

(declare-fun res!247988 () Bool)

(assert (=> b!424034 (=> (not res!247988) (not e!251958))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25870 (_ BitVec 32)) Bool)

(assert (=> b!424034 (= res!247988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194316 mask!1025))))

(assert (=> b!424034 (= lt!194316 (array!25871 (store (arr!12384 _keys!709) i!563 k0!794) (size!12736 _keys!709)))))

(declare-fun b!424035 () Bool)

(declare-fun res!247981 () Bool)

(assert (=> b!424035 (=> (not res!247981) (not e!251960))))

(assert (=> b!424035 (= res!247981 (and (= (size!12737 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12736 _keys!709) (size!12737 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!424036 () Bool)

(declare-fun e!251962 () Bool)

(declare-fun tp_is_empty!11011 () Bool)

(assert (=> b!424036 (= e!251962 tp_is_empty!11011)))

(declare-fun b!424037 () Bool)

(declare-fun res!247982 () Bool)

(assert (=> b!424037 (=> (not res!247982) (not e!251960))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424037 (= res!247982 (validKeyInArray!0 k0!794))))

(declare-fun b!424038 () Bool)

(declare-fun res!247985 () Bool)

(assert (=> b!424038 (=> (not res!247985) (not e!251960))))

(assert (=> b!424038 (= res!247985 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7176))))

(declare-fun mapNonEmpty!18138 () Bool)

(declare-fun tp!35106 () Bool)

(assert (=> mapNonEmpty!18138 (= mapRes!18138 (and tp!35106 e!251962))))

(declare-fun mapRest!18138 () (Array (_ BitVec 32) ValueCell!5162))

(declare-fun mapValue!18138 () ValueCell!5162)

(declare-fun mapKey!18138 () (_ BitVec 32))

(assert (=> mapNonEmpty!18138 (= (arr!12385 _values!549) (store mapRest!18138 mapKey!18138 mapValue!18138))))

(declare-fun res!247987 () Bool)

(assert (=> start!39578 (=> (not res!247987) (not e!251960))))

(assert (=> start!39578 (= res!247987 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12736 _keys!709))))))

(assert (=> start!39578 e!251960))

(assert (=> start!39578 tp_is_empty!11011))

(assert (=> start!39578 tp!35105))

(assert (=> start!39578 true))

(declare-fun array_inv!9094 (array!25872) Bool)

(assert (=> start!39578 (and (array_inv!9094 _values!549) e!251957)))

(declare-fun array_inv!9095 (array!25870) Bool)

(assert (=> start!39578 (array_inv!9095 _keys!709)))

(declare-fun b!424028 () Bool)

(declare-fun res!247990 () Bool)

(assert (=> b!424028 (=> (not res!247990) (not e!251960))))

(assert (=> b!424028 (= res!247990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!424039 () Bool)

(assert (=> b!424039 (= e!251961 tp_is_empty!11011)))

(declare-fun mapIsEmpty!18138 () Bool)

(assert (=> mapIsEmpty!18138 mapRes!18138))

(assert (= (and start!39578 res!247987) b!424029))

(assert (= (and b!424029 res!247991) b!424035))

(assert (= (and b!424035 res!247981) b!424028))

(assert (= (and b!424028 res!247990) b!424038))

(assert (= (and b!424038 res!247985) b!424031))

(assert (= (and b!424031 res!247986) b!424037))

(assert (= (and b!424037 res!247982) b!424025))

(assert (= (and b!424025 res!247983) b!424030))

(assert (= (and b!424030 res!247984) b!424034))

(assert (= (and b!424034 res!247988) b!424027))

(assert (= (and b!424027 res!247989) b!424026))

(assert (= (and b!424026 res!247992) b!424032))

(assert (= (and b!424033 condMapEmpty!18138) mapIsEmpty!18138))

(assert (= (and b!424033 (not condMapEmpty!18138)) mapNonEmpty!18138))

(get-info :version)

(assert (= (and mapNonEmpty!18138 ((_ is ValueCellFull!5162) mapValue!18138)) b!424036))

(assert (= (and b!424033 ((_ is ValueCellFull!5162) mapDefault!18138)) b!424039))

(assert (= start!39578 b!424033))

(declare-fun m!413561 () Bool)

(assert (=> b!424028 m!413561))

(declare-fun m!413563 () Bool)

(assert (=> b!424037 m!413563))

(declare-fun m!413565 () Bool)

(assert (=> start!39578 m!413565))

(declare-fun m!413567 () Bool)

(assert (=> start!39578 m!413567))

(declare-fun m!413569 () Bool)

(assert (=> b!424025 m!413569))

(declare-fun m!413571 () Bool)

(assert (=> b!424038 m!413571))

(declare-fun m!413573 () Bool)

(assert (=> mapNonEmpty!18138 m!413573))

(declare-fun m!413575 () Bool)

(assert (=> b!424027 m!413575))

(declare-fun m!413577 () Bool)

(assert (=> b!424034 m!413577))

(declare-fun m!413579 () Bool)

(assert (=> b!424034 m!413579))

(declare-fun m!413581 () Bool)

(assert (=> b!424030 m!413581))

(declare-fun m!413583 () Bool)

(assert (=> b!424032 m!413583))

(declare-fun m!413585 () Bool)

(assert (=> b!424032 m!413585))

(declare-fun m!413587 () Bool)

(assert (=> b!424032 m!413587))

(declare-fun m!413589 () Bool)

(assert (=> b!424029 m!413589))

(check-sat (not b!424037) b_and!17529 (not start!39578) (not mapNonEmpty!18138) (not b!424032) (not b!424029) (not b!424034) tp_is_empty!11011 (not b!424027) (not b!424030) (not b_next!9859) (not b!424028) (not b!424038))
(check-sat b_and!17529 (not b_next!9859))
