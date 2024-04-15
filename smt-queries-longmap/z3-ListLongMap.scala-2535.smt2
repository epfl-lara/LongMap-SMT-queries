; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39014 () Bool)

(assert start!39014)

(declare-fun b_free!9295 () Bool)

(declare-fun b_next!9295 () Bool)

(assert (=> start!39014 (= b_free!9295 (not b_next!9295))))

(declare-fun tp!33413 () Bool)

(declare-fun b_and!16655 () Bool)

(assert (=> start!39014 (= tp!33413 b_and!16655)))

(declare-fun b!408971 () Bool)

(declare-fun e!245358 () Bool)

(declare-fun tp_is_empty!10447 () Bool)

(assert (=> b!408971 (= e!245358 tp_is_empty!10447)))

(declare-fun b!408972 () Bool)

(declare-fun res!236812 () Bool)

(declare-fun e!245357 () Bool)

(assert (=> b!408972 (=> (not res!236812) (not e!245357))))

(declare-datatypes ((array!24755 0))(
  ( (array!24756 (arr!11827 (Array (_ BitVec 32) (_ BitVec 64))) (size!12180 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24755)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408972 (= res!236812 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!408973 () Bool)

(declare-fun e!245353 () Bool)

(assert (=> b!408973 (= e!245357 e!245353)))

(declare-fun res!236811 () Bool)

(assert (=> b!408973 (=> (not res!236811) (not e!245353))))

(declare-fun lt!188686 () array!24755)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24755 (_ BitVec 32)) Bool)

(assert (=> b!408973 (= res!236811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188686 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408973 (= lt!188686 (array!24756 (store (arr!11827 _keys!709) i!563 k0!794) (size!12180 _keys!709)))))

(declare-fun b!408974 () Bool)

(declare-fun res!236808 () Bool)

(assert (=> b!408974 (=> (not res!236808) (not e!245357))))

(assert (=> b!408974 (= res!236808 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12180 _keys!709))))))

(declare-fun b!408975 () Bool)

(declare-fun res!236810 () Bool)

(assert (=> b!408975 (=> (not res!236810) (not e!245357))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15035 0))(
  ( (V!15036 (val!5268 Int)) )
))
(declare-datatypes ((ValueCell!4880 0))(
  ( (ValueCellFull!4880 (v!7509 V!15035)) (EmptyCell!4880) )
))
(declare-datatypes ((array!24757 0))(
  ( (array!24758 (arr!11828 (Array (_ BitVec 32) ValueCell!4880)) (size!12181 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24757)

(assert (=> b!408975 (= res!236810 (and (= (size!12181 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12180 _keys!709) (size!12181 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!408976 () Bool)

(declare-fun res!236807 () Bool)

(assert (=> b!408976 (=> (not res!236807) (not e!245357))))

(assert (=> b!408976 (= res!236807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!408977 () Bool)

(declare-fun e!245355 () Bool)

(assert (=> b!408977 (= e!245355 tp_is_empty!10447)))

(declare-fun b!408978 () Bool)

(declare-fun e!245354 () Bool)

(declare-fun mapRes!17292 () Bool)

(assert (=> b!408978 (= e!245354 (and e!245358 mapRes!17292))))

(declare-fun condMapEmpty!17292 () Bool)

(declare-fun mapDefault!17292 () ValueCell!4880)

(assert (=> b!408978 (= condMapEmpty!17292 (= (arr!11828 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4880)) mapDefault!17292)))))

(declare-fun mapIsEmpty!17292 () Bool)

(assert (=> mapIsEmpty!17292 mapRes!17292))

(declare-fun res!236803 () Bool)

(assert (=> start!39014 (=> (not res!236803) (not e!245357))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39014 (= res!236803 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12180 _keys!709))))))

(assert (=> start!39014 e!245357))

(assert (=> start!39014 tp_is_empty!10447))

(assert (=> start!39014 tp!33413))

(assert (=> start!39014 true))

(declare-fun array_inv!8674 (array!24757) Bool)

(assert (=> start!39014 (and (array_inv!8674 _values!549) e!245354)))

(declare-fun array_inv!8675 (array!24755) Bool)

(assert (=> start!39014 (array_inv!8675 _keys!709)))

(declare-fun b!408979 () Bool)

(assert (=> b!408979 (= e!245353 false)))

(declare-fun minValue!515 () V!15035)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15035)

(declare-datatypes ((tuple2!6814 0))(
  ( (tuple2!6815 (_1!3418 (_ BitVec 64)) (_2!3418 V!15035)) )
))
(declare-datatypes ((List!6823 0))(
  ( (Nil!6820) (Cons!6819 (h!7675 tuple2!6814) (t!11988 List!6823)) )
))
(declare-datatypes ((ListLongMap!5717 0))(
  ( (ListLongMap!5718 (toList!2874 List!6823)) )
))
(declare-fun lt!188687 () ListLongMap!5717)

(declare-fun getCurrentListMapNoExtraKeys!1088 (array!24755 array!24757 (_ BitVec 32) (_ BitVec 32) V!15035 V!15035 (_ BitVec 32) Int) ListLongMap!5717)

(assert (=> b!408979 (= lt!188687 (getCurrentListMapNoExtraKeys!1088 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!408980 () Bool)

(declare-fun res!236814 () Bool)

(assert (=> b!408980 (=> (not res!236814) (not e!245353))))

(assert (=> b!408980 (= res!236814 (bvsle from!863 i!563))))

(declare-fun b!408981 () Bool)

(declare-fun res!236806 () Bool)

(assert (=> b!408981 (=> (not res!236806) (not e!245357))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408981 (= res!236806 (validMask!0 mask!1025))))

(declare-fun b!408982 () Bool)

(declare-fun res!236805 () Bool)

(assert (=> b!408982 (=> (not res!236805) (not e!245357))))

(assert (=> b!408982 (= res!236805 (or (= (select (arr!11827 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11827 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!408983 () Bool)

(declare-fun res!236809 () Bool)

(assert (=> b!408983 (=> (not res!236809) (not e!245353))))

(declare-datatypes ((List!6824 0))(
  ( (Nil!6821) (Cons!6820 (h!7676 (_ BitVec 64)) (t!11989 List!6824)) )
))
(declare-fun arrayNoDuplicates!0 (array!24755 (_ BitVec 32) List!6824) Bool)

(assert (=> b!408983 (= res!236809 (arrayNoDuplicates!0 lt!188686 #b00000000000000000000000000000000 Nil!6821))))

(declare-fun b!408984 () Bool)

(declare-fun res!236813 () Bool)

(assert (=> b!408984 (=> (not res!236813) (not e!245357))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408984 (= res!236813 (validKeyInArray!0 k0!794))))

(declare-fun b!408985 () Bool)

(declare-fun res!236804 () Bool)

(assert (=> b!408985 (=> (not res!236804) (not e!245357))))

(assert (=> b!408985 (= res!236804 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6821))))

(declare-fun mapNonEmpty!17292 () Bool)

(declare-fun tp!33414 () Bool)

(assert (=> mapNonEmpty!17292 (= mapRes!17292 (and tp!33414 e!245355))))

(declare-fun mapRest!17292 () (Array (_ BitVec 32) ValueCell!4880))

(declare-fun mapKey!17292 () (_ BitVec 32))

(declare-fun mapValue!17292 () ValueCell!4880)

(assert (=> mapNonEmpty!17292 (= (arr!11828 _values!549) (store mapRest!17292 mapKey!17292 mapValue!17292))))

(assert (= (and start!39014 res!236803) b!408981))

(assert (= (and b!408981 res!236806) b!408975))

(assert (= (and b!408975 res!236810) b!408976))

(assert (= (and b!408976 res!236807) b!408985))

(assert (= (and b!408985 res!236804) b!408974))

(assert (= (and b!408974 res!236808) b!408984))

(assert (= (and b!408984 res!236813) b!408982))

(assert (= (and b!408982 res!236805) b!408972))

(assert (= (and b!408972 res!236812) b!408973))

(assert (= (and b!408973 res!236811) b!408983))

(assert (= (and b!408983 res!236809) b!408980))

(assert (= (and b!408980 res!236814) b!408979))

(assert (= (and b!408978 condMapEmpty!17292) mapIsEmpty!17292))

(assert (= (and b!408978 (not condMapEmpty!17292)) mapNonEmpty!17292))

(get-info :version)

(assert (= (and mapNonEmpty!17292 ((_ is ValueCellFull!4880) mapValue!17292)) b!408977))

(assert (= (and b!408978 ((_ is ValueCellFull!4880) mapDefault!17292)) b!408971))

(assert (= start!39014 b!408978))

(declare-fun m!399507 () Bool)

(assert (=> mapNonEmpty!17292 m!399507))

(declare-fun m!399509 () Bool)

(assert (=> b!408981 m!399509))

(declare-fun m!399511 () Bool)

(assert (=> b!408983 m!399511))

(declare-fun m!399513 () Bool)

(assert (=> b!408984 m!399513))

(declare-fun m!399515 () Bool)

(assert (=> b!408972 m!399515))

(declare-fun m!399517 () Bool)

(assert (=> b!408982 m!399517))

(declare-fun m!399519 () Bool)

(assert (=> start!39014 m!399519))

(declare-fun m!399521 () Bool)

(assert (=> start!39014 m!399521))

(declare-fun m!399523 () Bool)

(assert (=> b!408973 m!399523))

(declare-fun m!399525 () Bool)

(assert (=> b!408973 m!399525))

(declare-fun m!399527 () Bool)

(assert (=> b!408985 m!399527))

(declare-fun m!399529 () Bool)

(assert (=> b!408976 m!399529))

(declare-fun m!399531 () Bool)

(assert (=> b!408979 m!399531))

(check-sat (not b!408985) (not b!408973) (not start!39014) (not mapNonEmpty!17292) b_and!16655 (not b!408979) (not b!408972) (not b!408983) (not b!408981) (not b!408984) tp_is_empty!10447 (not b_next!9295) (not b!408976))
(check-sat b_and!16655 (not b_next!9295))
