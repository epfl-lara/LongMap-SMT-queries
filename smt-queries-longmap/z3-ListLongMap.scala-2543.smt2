; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39078 () Bool)

(assert start!39078)

(declare-fun b_free!9345 () Bool)

(declare-fun b_next!9345 () Bool)

(assert (=> start!39078 (= b_free!9345 (not b_next!9345))))

(declare-fun tp!33563 () Bool)

(declare-fun b_and!16731 () Bool)

(assert (=> start!39078 (= tp!33563 b_and!16731)))

(declare-fun b!410368 () Bool)

(declare-fun e!245981 () Bool)

(declare-fun tp_is_empty!10497 () Bool)

(assert (=> b!410368 (= e!245981 tp_is_empty!10497)))

(declare-fun b!410369 () Bool)

(declare-fun res!237837 () Bool)

(declare-fun e!245977 () Bool)

(assert (=> b!410369 (=> (not res!237837) (not e!245977))))

(declare-datatypes ((array!24863 0))(
  ( (array!24864 (arr!11881 (Array (_ BitVec 32) (_ BitVec 64))) (size!12233 (_ BitVec 32))) )
))
(declare-fun lt!189071 () array!24863)

(declare-datatypes ((List!6887 0))(
  ( (Nil!6884) (Cons!6883 (h!7739 (_ BitVec 64)) (t!12061 List!6887)) )
))
(declare-fun arrayNoDuplicates!0 (array!24863 (_ BitVec 32) List!6887) Bool)

(assert (=> b!410369 (= res!237837 (arrayNoDuplicates!0 lt!189071 #b00000000000000000000000000000000 Nil!6884))))

(declare-fun b!410370 () Bool)

(declare-fun res!237840 () Bool)

(declare-fun e!245980 () Bool)

(assert (=> b!410370 (=> (not res!237840) (not e!245980))))

(declare-fun _keys!709 () array!24863)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24863 (_ BitVec 32)) Bool)

(assert (=> b!410370 (= res!237840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!410371 () Bool)

(declare-fun e!245978 () Bool)

(assert (=> b!410371 (= e!245978 tp_is_empty!10497)))

(declare-fun mapIsEmpty!17367 () Bool)

(declare-fun mapRes!17367 () Bool)

(assert (=> mapIsEmpty!17367 mapRes!17367))

(declare-fun b!410372 () Bool)

(declare-fun res!237835 () Bool)

(assert (=> b!410372 (=> (not res!237835) (not e!245980))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24863 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410372 (= res!237835 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!410373 () Bool)

(declare-fun res!237836 () Bool)

(assert (=> b!410373 (=> (not res!237836) (not e!245977))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!410373 (= res!237836 (bvsle from!863 i!563))))

(declare-fun b!410367 () Bool)

(declare-fun res!237832 () Bool)

(assert (=> b!410367 (=> (not res!237832) (not e!245980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410367 (= res!237832 (validMask!0 mask!1025))))

(declare-fun res!237841 () Bool)

(assert (=> start!39078 (=> (not res!237841) (not e!245980))))

(assert (=> start!39078 (= res!237841 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12233 _keys!709))))))

(assert (=> start!39078 e!245980))

(assert (=> start!39078 tp_is_empty!10497))

(assert (=> start!39078 tp!33563))

(assert (=> start!39078 true))

(declare-datatypes ((V!15101 0))(
  ( (V!15102 (val!5293 Int)) )
))
(declare-datatypes ((ValueCell!4905 0))(
  ( (ValueCellFull!4905 (v!7540 V!15101)) (EmptyCell!4905) )
))
(declare-datatypes ((array!24865 0))(
  ( (array!24866 (arr!11882 (Array (_ BitVec 32) ValueCell!4905)) (size!12234 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24865)

(declare-fun e!245979 () Bool)

(declare-fun array_inv!8670 (array!24865) Bool)

(assert (=> start!39078 (and (array_inv!8670 _values!549) e!245979)))

(declare-fun array_inv!8671 (array!24863) Bool)

(assert (=> start!39078 (array_inv!8671 _keys!709)))

(declare-fun b!410374 () Bool)

(declare-fun res!237838 () Bool)

(assert (=> b!410374 (=> (not res!237838) (not e!245980))))

(assert (=> b!410374 (= res!237838 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12233 _keys!709))))))

(declare-fun b!410375 () Bool)

(declare-fun res!237842 () Bool)

(assert (=> b!410375 (=> (not res!237842) (not e!245980))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!410375 (= res!237842 (and (= (size!12234 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12233 _keys!709) (size!12234 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!410376 () Bool)

(assert (=> b!410376 (= e!245977 false)))

(declare-fun minValue!515 () V!15101)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15101)

(declare-datatypes ((tuple2!6862 0))(
  ( (tuple2!6863 (_1!3442 (_ BitVec 64)) (_2!3442 V!15101)) )
))
(declare-datatypes ((List!6888 0))(
  ( (Nil!6885) (Cons!6884 (h!7740 tuple2!6862) (t!12062 List!6888)) )
))
(declare-datatypes ((ListLongMap!5775 0))(
  ( (ListLongMap!5776 (toList!2903 List!6888)) )
))
(declare-fun lt!189070 () ListLongMap!5775)

(declare-fun getCurrentListMapNoExtraKeys!1111 (array!24863 array!24865 (_ BitVec 32) (_ BitVec 32) V!15101 V!15101 (_ BitVec 32) Int) ListLongMap!5775)

(assert (=> b!410376 (= lt!189070 (getCurrentListMapNoExtraKeys!1111 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!410377 () Bool)

(declare-fun res!237839 () Bool)

(assert (=> b!410377 (=> (not res!237839) (not e!245980))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!410377 (= res!237839 (validKeyInArray!0 k0!794))))

(declare-fun b!410378 () Bool)

(assert (=> b!410378 (= e!245979 (and e!245978 mapRes!17367))))

(declare-fun condMapEmpty!17367 () Bool)

(declare-fun mapDefault!17367 () ValueCell!4905)

(assert (=> b!410378 (= condMapEmpty!17367 (= (arr!11882 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4905)) mapDefault!17367)))))

(declare-fun mapNonEmpty!17367 () Bool)

(declare-fun tp!33564 () Bool)

(assert (=> mapNonEmpty!17367 (= mapRes!17367 (and tp!33564 e!245981))))

(declare-fun mapValue!17367 () ValueCell!4905)

(declare-fun mapKey!17367 () (_ BitVec 32))

(declare-fun mapRest!17367 () (Array (_ BitVec 32) ValueCell!4905))

(assert (=> mapNonEmpty!17367 (= (arr!11882 _values!549) (store mapRest!17367 mapKey!17367 mapValue!17367))))

(declare-fun b!410379 () Bool)

(declare-fun res!237833 () Bool)

(assert (=> b!410379 (=> (not res!237833) (not e!245980))))

(assert (=> b!410379 (= res!237833 (or (= (select (arr!11881 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11881 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!410380 () Bool)

(declare-fun res!237834 () Bool)

(assert (=> b!410380 (=> (not res!237834) (not e!245980))))

(assert (=> b!410380 (= res!237834 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6884))))

(declare-fun b!410381 () Bool)

(assert (=> b!410381 (= e!245980 e!245977)))

(declare-fun res!237843 () Bool)

(assert (=> b!410381 (=> (not res!237843) (not e!245977))))

(assert (=> b!410381 (= res!237843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189071 mask!1025))))

(assert (=> b!410381 (= lt!189071 (array!24864 (store (arr!11881 _keys!709) i!563 k0!794) (size!12233 _keys!709)))))

(assert (= (and start!39078 res!237841) b!410367))

(assert (= (and b!410367 res!237832) b!410375))

(assert (= (and b!410375 res!237842) b!410370))

(assert (= (and b!410370 res!237840) b!410380))

(assert (= (and b!410380 res!237834) b!410374))

(assert (= (and b!410374 res!237838) b!410377))

(assert (= (and b!410377 res!237839) b!410379))

(assert (= (and b!410379 res!237833) b!410372))

(assert (= (and b!410372 res!237835) b!410381))

(assert (= (and b!410381 res!237843) b!410369))

(assert (= (and b!410369 res!237837) b!410373))

(assert (= (and b!410373 res!237836) b!410376))

(assert (= (and b!410378 condMapEmpty!17367) mapIsEmpty!17367))

(assert (= (and b!410378 (not condMapEmpty!17367)) mapNonEmpty!17367))

(get-info :version)

(assert (= (and mapNonEmpty!17367 ((_ is ValueCellFull!4905) mapValue!17367)) b!410368))

(assert (= (and b!410378 ((_ is ValueCellFull!4905) mapDefault!17367)) b!410371))

(assert (= start!39078 b!410378))

(declare-fun m!400881 () Bool)

(assert (=> mapNonEmpty!17367 m!400881))

(declare-fun m!400883 () Bool)

(assert (=> b!410380 m!400883))

(declare-fun m!400885 () Bool)

(assert (=> b!410370 m!400885))

(declare-fun m!400887 () Bool)

(assert (=> start!39078 m!400887))

(declare-fun m!400889 () Bool)

(assert (=> start!39078 m!400889))

(declare-fun m!400891 () Bool)

(assert (=> b!410377 m!400891))

(declare-fun m!400893 () Bool)

(assert (=> b!410369 m!400893))

(declare-fun m!400895 () Bool)

(assert (=> b!410367 m!400895))

(declare-fun m!400897 () Bool)

(assert (=> b!410379 m!400897))

(declare-fun m!400899 () Bool)

(assert (=> b!410376 m!400899))

(declare-fun m!400901 () Bool)

(assert (=> b!410372 m!400901))

(declare-fun m!400903 () Bool)

(assert (=> b!410381 m!400903))

(declare-fun m!400905 () Bool)

(assert (=> b!410381 m!400905))

(check-sat (not mapNonEmpty!17367) (not b!410380) (not b!410369) b_and!16731 (not b_next!9345) (not b!410381) (not b!410377) tp_is_empty!10497 (not b!410376) (not b!410372) (not start!39078) (not b!410367) (not b!410370))
(check-sat b_and!16731 (not b_next!9345))
