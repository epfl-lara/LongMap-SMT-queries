; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39578 () Bool)

(assert start!39578)

(declare-fun b_free!9859 () Bool)

(declare-fun b_next!9859 () Bool)

(assert (=> start!39578 (= b_free!9859 (not b_next!9859))))

(declare-fun tp!35105 () Bool)

(declare-fun b_and!17489 () Bool)

(assert (=> start!39578 (= tp!35105 b_and!17489)))

(declare-fun b!423803 () Bool)

(declare-fun res!247864 () Bool)

(declare-fun e!251815 () Bool)

(assert (=> b!423803 (=> (not res!247864) (not e!251815))))

(declare-datatypes ((array!25851 0))(
  ( (array!25852 (arr!12375 (Array (_ BitVec 32) (_ BitVec 64))) (size!12728 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25851)

(declare-datatypes ((List!7272 0))(
  ( (Nil!7269) (Cons!7268 (h!8124 (_ BitVec 64)) (t!12707 List!7272)) )
))
(declare-fun arrayNoDuplicates!0 (array!25851 (_ BitVec 32) List!7272) Bool)

(assert (=> b!423803 (= res!247864 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7269))))

(declare-fun b!423805 () Bool)

(declare-fun res!247861 () Bool)

(declare-fun e!251816 () Bool)

(assert (=> b!423805 (=> (not res!247861) (not e!251816))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!423805 (= res!247861 (bvsle from!863 i!563))))

(declare-fun b!423806 () Bool)

(assert (=> b!423806 (= e!251815 e!251816)))

(declare-fun res!247856 () Bool)

(assert (=> b!423806 (=> (not res!247856) (not e!251816))))

(declare-fun lt!194063 () array!25851)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25851 (_ BitVec 32)) Bool)

(assert (=> b!423806 (= res!247856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194063 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!423806 (= lt!194063 (array!25852 (store (arr!12375 _keys!709) i!563 k0!794) (size!12728 _keys!709)))))

(declare-fun mapIsEmpty!18138 () Bool)

(declare-fun mapRes!18138 () Bool)

(assert (=> mapIsEmpty!18138 mapRes!18138))

(declare-fun b!423807 () Bool)

(declare-fun res!247866 () Bool)

(assert (=> b!423807 (=> (not res!247866) (not e!251815))))

(assert (=> b!423807 (= res!247866 (or (= (select (arr!12375 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12375 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!423808 () Bool)

(declare-fun res!247857 () Bool)

(assert (=> b!423808 (=> (not res!247857) (not e!251815))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15787 0))(
  ( (V!15788 (val!5550 Int)) )
))
(declare-datatypes ((ValueCell!5162 0))(
  ( (ValueCellFull!5162 (v!7791 V!15787)) (EmptyCell!5162) )
))
(declare-datatypes ((array!25853 0))(
  ( (array!25854 (arr!12376 (Array (_ BitVec 32) ValueCell!5162)) (size!12729 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25853)

(assert (=> b!423808 (= res!247857 (and (= (size!12729 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12728 _keys!709) (size!12729 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!423809 () Bool)

(declare-fun res!247855 () Bool)

(assert (=> b!423809 (=> (not res!247855) (not e!251815))))

(declare-fun arrayContainsKey!0 (array!25851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423809 (= res!247855 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!423810 () Bool)

(declare-fun res!247858 () Bool)

(assert (=> b!423810 (=> (not res!247858) (not e!251816))))

(assert (=> b!423810 (= res!247858 (arrayNoDuplicates!0 lt!194063 #b00000000000000000000000000000000 Nil!7269))))

(declare-fun b!423811 () Bool)

(declare-fun res!247860 () Bool)

(assert (=> b!423811 (=> (not res!247860) (not e!251815))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423811 (= res!247860 (validKeyInArray!0 k0!794))))

(declare-fun b!423812 () Bool)

(declare-fun res!247862 () Bool)

(assert (=> b!423812 (=> (not res!247862) (not e!251815))))

(assert (=> b!423812 (= res!247862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!423813 () Bool)

(declare-fun res!247859 () Bool)

(assert (=> b!423813 (=> (not res!247859) (not e!251815))))

(assert (=> b!423813 (= res!247859 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12728 _keys!709))))))

(declare-fun b!423814 () Bool)

(declare-fun e!251818 () Bool)

(declare-fun e!251820 () Bool)

(assert (=> b!423814 (= e!251818 (and e!251820 mapRes!18138))))

(declare-fun condMapEmpty!18138 () Bool)

(declare-fun mapDefault!18138 () ValueCell!5162)

(assert (=> b!423814 (= condMapEmpty!18138 (= (arr!12376 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5162)) mapDefault!18138)))))

(declare-fun b!423804 () Bool)

(declare-fun tp_is_empty!11011 () Bool)

(assert (=> b!423804 (= e!251820 tp_is_empty!11011)))

(declare-fun res!247865 () Bool)

(assert (=> start!39578 (=> (not res!247865) (not e!251815))))

(assert (=> start!39578 (= res!247865 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12728 _keys!709))))))

(assert (=> start!39578 e!251815))

(assert (=> start!39578 tp_is_empty!11011))

(assert (=> start!39578 tp!35105))

(assert (=> start!39578 true))

(declare-fun array_inv!9052 (array!25853) Bool)

(assert (=> start!39578 (and (array_inv!9052 _values!549) e!251818)))

(declare-fun array_inv!9053 (array!25851) Bool)

(assert (=> start!39578 (array_inv!9053 _keys!709)))

(declare-fun mapNonEmpty!18138 () Bool)

(declare-fun tp!35106 () Bool)

(declare-fun e!251817 () Bool)

(assert (=> mapNonEmpty!18138 (= mapRes!18138 (and tp!35106 e!251817))))

(declare-fun mapRest!18138 () (Array (_ BitVec 32) ValueCell!5162))

(declare-fun mapValue!18138 () ValueCell!5162)

(declare-fun mapKey!18138 () (_ BitVec 32))

(assert (=> mapNonEmpty!18138 (= (arr!12376 _values!549) (store mapRest!18138 mapKey!18138 mapValue!18138))))

(declare-fun b!423815 () Bool)

(assert (=> b!423815 (= e!251817 tp_is_empty!11011)))

(declare-fun b!423816 () Bool)

(declare-fun res!247863 () Bool)

(assert (=> b!423816 (=> (not res!247863) (not e!251815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423816 (= res!247863 (validMask!0 mask!1025))))

(declare-fun b!423817 () Bool)

(assert (=> b!423817 (= e!251816 false)))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7276 0))(
  ( (tuple2!7277 (_1!3649 (_ BitVec 64)) (_2!3649 V!15787)) )
))
(declare-datatypes ((List!7273 0))(
  ( (Nil!7270) (Cons!7269 (h!8125 tuple2!7276) (t!12708 List!7273)) )
))
(declare-datatypes ((ListLongMap!6179 0))(
  ( (ListLongMap!6180 (toList!3105 List!7273)) )
))
(declare-fun lt!194061 () ListLongMap!6179)

(declare-fun zeroValue!515 () V!15787)

(declare-fun v!412 () V!15787)

(declare-fun minValue!515 () V!15787)

(declare-fun getCurrentListMapNoExtraKeys!1313 (array!25851 array!25853 (_ BitVec 32) (_ BitVec 32) V!15787 V!15787 (_ BitVec 32) Int) ListLongMap!6179)

(assert (=> b!423817 (= lt!194061 (getCurrentListMapNoExtraKeys!1313 lt!194063 (array!25854 (store (arr!12376 _values!549) i!563 (ValueCellFull!5162 v!412)) (size!12729 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194062 () ListLongMap!6179)

(assert (=> b!423817 (= lt!194062 (getCurrentListMapNoExtraKeys!1313 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!39578 res!247865) b!423816))

(assert (= (and b!423816 res!247863) b!423808))

(assert (= (and b!423808 res!247857) b!423812))

(assert (= (and b!423812 res!247862) b!423803))

(assert (= (and b!423803 res!247864) b!423813))

(assert (= (and b!423813 res!247859) b!423811))

(assert (= (and b!423811 res!247860) b!423807))

(assert (= (and b!423807 res!247866) b!423809))

(assert (= (and b!423809 res!247855) b!423806))

(assert (= (and b!423806 res!247856) b!423810))

(assert (= (and b!423810 res!247858) b!423805))

(assert (= (and b!423805 res!247861) b!423817))

(assert (= (and b!423814 condMapEmpty!18138) mapIsEmpty!18138))

(assert (= (and b!423814 (not condMapEmpty!18138)) mapNonEmpty!18138))

(get-info :version)

(assert (= (and mapNonEmpty!18138 ((_ is ValueCellFull!5162) mapValue!18138)) b!423815))

(assert (= (and b!423814 ((_ is ValueCellFull!5162) mapDefault!18138)) b!423804))

(assert (= start!39578 b!423814))

(declare-fun m!412611 () Bool)

(assert (=> b!423806 m!412611))

(declare-fun m!412613 () Bool)

(assert (=> b!423806 m!412613))

(declare-fun m!412615 () Bool)

(assert (=> b!423816 m!412615))

(declare-fun m!412617 () Bool)

(assert (=> b!423811 m!412617))

(declare-fun m!412619 () Bool)

(assert (=> b!423809 m!412619))

(declare-fun m!412621 () Bool)

(assert (=> b!423807 m!412621))

(declare-fun m!412623 () Bool)

(assert (=> b!423810 m!412623))

(declare-fun m!412625 () Bool)

(assert (=> mapNonEmpty!18138 m!412625))

(declare-fun m!412627 () Bool)

(assert (=> b!423817 m!412627))

(declare-fun m!412629 () Bool)

(assert (=> b!423817 m!412629))

(declare-fun m!412631 () Bool)

(assert (=> b!423817 m!412631))

(declare-fun m!412633 () Bool)

(assert (=> start!39578 m!412633))

(declare-fun m!412635 () Bool)

(assert (=> start!39578 m!412635))

(declare-fun m!412637 () Bool)

(assert (=> b!423803 m!412637))

(declare-fun m!412639 () Bool)

(assert (=> b!423812 m!412639))

(check-sat (not b!423803) (not b_next!9859) (not mapNonEmpty!18138) (not b!423812) (not b!423811) (not b!423810) b_and!17489 (not b!423816) (not b!423809) (not start!39578) (not b!423817) tp_is_empty!11011 (not b!423806))
(check-sat b_and!17489 (not b_next!9859))
