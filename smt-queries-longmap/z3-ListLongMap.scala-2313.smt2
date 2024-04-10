; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37342 () Bool)

(assert start!37342)

(declare-fun b_free!8469 () Bool)

(declare-fun b_next!8469 () Bool)

(assert (=> start!37342 (= b_free!8469 (not b_next!8469))))

(declare-fun tp!30122 () Bool)

(declare-fun b_and!15711 () Bool)

(assert (=> start!37342 (= tp!30122 b_and!15711)))

(declare-fun b!379005 () Bool)

(declare-fun res!214805 () Bool)

(declare-fun e!230626 () Bool)

(assert (=> b!379005 (=> (not res!214805) (not e!230626))))

(declare-datatypes ((array!22157 0))(
  ( (array!22158 (arr!10547 (Array (_ BitVec 32) (_ BitVec 64))) (size!10899 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22157)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22157 (_ BitVec 32)) Bool)

(assert (=> b!379005 (= res!214805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!379006 () Bool)

(declare-fun e!230630 () Bool)

(declare-fun e!230628 () Bool)

(assert (=> b!379006 (= e!230630 (not e!230628))))

(declare-fun res!214800 () Bool)

(assert (=> b!379006 (=> res!214800 e!230628)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!379006 (= res!214800 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13261 0))(
  ( (V!13262 (val!4603 Int)) )
))
(declare-datatypes ((ValueCell!4215 0))(
  ( (ValueCellFull!4215 (v!6800 V!13261)) (EmptyCell!4215) )
))
(declare-datatypes ((array!22159 0))(
  ( (array!22160 (arr!10548 (Array (_ BitVec 32) ValueCell!4215)) (size!10900 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22159)

(declare-datatypes ((tuple2!6154 0))(
  ( (tuple2!6155 (_1!3088 (_ BitVec 64)) (_2!3088 V!13261)) )
))
(declare-datatypes ((List!5990 0))(
  ( (Nil!5987) (Cons!5986 (h!6842 tuple2!6154) (t!11140 List!5990)) )
))
(declare-datatypes ((ListLongMap!5067 0))(
  ( (ListLongMap!5068 (toList!2549 List!5990)) )
))
(declare-fun lt!176820 () ListLongMap!5067)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13261)

(declare-fun minValue!472 () V!13261)

(declare-fun getCurrentListMap!1972 (array!22157 array!22159 (_ BitVec 32) (_ BitVec 32) V!13261 V!13261 (_ BitVec 32) Int) ListLongMap!5067)

(assert (=> b!379006 (= lt!176820 (getCurrentListMap!1972 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176813 () ListLongMap!5067)

(declare-fun lt!176816 () array!22159)

(declare-fun lt!176818 () array!22157)

(assert (=> b!379006 (= lt!176813 (getCurrentListMap!1972 lt!176818 lt!176816 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176815 () ListLongMap!5067)

(declare-fun lt!176811 () ListLongMap!5067)

(assert (=> b!379006 (and (= lt!176815 lt!176811) (= lt!176811 lt!176815))))

(declare-fun lt!176817 () ListLongMap!5067)

(declare-fun lt!176814 () tuple2!6154)

(declare-fun +!895 (ListLongMap!5067 tuple2!6154) ListLongMap!5067)

(assert (=> b!379006 (= lt!176811 (+!895 lt!176817 lt!176814))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13261)

(assert (=> b!379006 (= lt!176814 (tuple2!6155 k0!778 v!373))))

(declare-datatypes ((Unit!11688 0))(
  ( (Unit!11689) )
))
(declare-fun lt!176810 () Unit!11688)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!130 (array!22157 array!22159 (_ BitVec 32) (_ BitVec 32) V!13261 V!13261 (_ BitVec 32) (_ BitVec 64) V!13261 (_ BitVec 32) Int) Unit!11688)

(assert (=> b!379006 (= lt!176810 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!130 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!806 (array!22157 array!22159 (_ BitVec 32) (_ BitVec 32) V!13261 V!13261 (_ BitVec 32) Int) ListLongMap!5067)

(assert (=> b!379006 (= lt!176815 (getCurrentListMapNoExtraKeys!806 lt!176818 lt!176816 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379006 (= lt!176816 (array!22160 (store (arr!10548 _values!506) i!548 (ValueCellFull!4215 v!373)) (size!10900 _values!506)))))

(assert (=> b!379006 (= lt!176817 (getCurrentListMapNoExtraKeys!806 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!379007 () Bool)

(declare-fun res!214810 () Bool)

(assert (=> b!379007 (=> (not res!214810) (not e!230626))))

(declare-datatypes ((List!5991 0))(
  ( (Nil!5988) (Cons!5987 (h!6843 (_ BitVec 64)) (t!11141 List!5991)) )
))
(declare-fun arrayNoDuplicates!0 (array!22157 (_ BitVec 32) List!5991) Bool)

(assert (=> b!379007 (= res!214810 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5988))))

(declare-fun b!379008 () Bool)

(declare-fun e!230623 () Bool)

(declare-fun tp_is_empty!9117 () Bool)

(assert (=> b!379008 (= e!230623 tp_is_empty!9117)))

(declare-fun b!379009 () Bool)

(declare-fun res!214804 () Bool)

(assert (=> b!379009 (=> (not res!214804) (not e!230630))))

(assert (=> b!379009 (= res!214804 (arrayNoDuplicates!0 lt!176818 #b00000000000000000000000000000000 Nil!5988))))

(declare-fun b!379010 () Bool)

(declare-fun res!214801 () Bool)

(assert (=> b!379010 (=> (not res!214801) (not e!230626))))

(assert (=> b!379010 (= res!214801 (and (= (size!10900 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10899 _keys!658) (size!10900 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!379011 () Bool)

(declare-fun e!230624 () Bool)

(assert (=> b!379011 (= e!230624 tp_is_empty!9117)))

(declare-fun mapNonEmpty!15240 () Bool)

(declare-fun mapRes!15240 () Bool)

(declare-fun tp!30123 () Bool)

(assert (=> mapNonEmpty!15240 (= mapRes!15240 (and tp!30123 e!230624))))

(declare-fun mapValue!15240 () ValueCell!4215)

(declare-fun mapRest!15240 () (Array (_ BitVec 32) ValueCell!4215))

(declare-fun mapKey!15240 () (_ BitVec 32))

(assert (=> mapNonEmpty!15240 (= (arr!10548 _values!506) (store mapRest!15240 mapKey!15240 mapValue!15240))))

(declare-fun b!379012 () Bool)

(declare-fun res!214809 () Bool)

(assert (=> b!379012 (=> (not res!214809) (not e!230626))))

(declare-fun arrayContainsKey!0 (array!22157 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379012 (= res!214809 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!214802 () Bool)

(assert (=> start!37342 (=> (not res!214802) (not e!230626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37342 (= res!214802 (validMask!0 mask!970))))

(assert (=> start!37342 e!230626))

(declare-fun e!230625 () Bool)

(declare-fun array_inv!7770 (array!22159) Bool)

(assert (=> start!37342 (and (array_inv!7770 _values!506) e!230625)))

(assert (=> start!37342 tp!30122))

(assert (=> start!37342 true))

(assert (=> start!37342 tp_is_empty!9117))

(declare-fun array_inv!7771 (array!22157) Bool)

(assert (=> start!37342 (array_inv!7771 _keys!658)))

(declare-fun b!379013 () Bool)

(assert (=> b!379013 (= e!230625 (and e!230623 mapRes!15240))))

(declare-fun condMapEmpty!15240 () Bool)

(declare-fun mapDefault!15240 () ValueCell!4215)

(assert (=> b!379013 (= condMapEmpty!15240 (= (arr!10548 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4215)) mapDefault!15240)))))

(declare-fun b!379014 () Bool)

(declare-fun res!214811 () Bool)

(assert (=> b!379014 (=> (not res!214811) (not e!230626))))

(assert (=> b!379014 (= res!214811 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10899 _keys!658))))))

(declare-fun b!379015 () Bool)

(declare-fun res!214807 () Bool)

(assert (=> b!379015 (=> (not res!214807) (not e!230626))))

(assert (=> b!379015 (= res!214807 (or (= (select (arr!10547 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10547 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15240 () Bool)

(assert (=> mapIsEmpty!15240 mapRes!15240))

(declare-fun b!379016 () Bool)

(declare-fun e!230627 () Bool)

(assert (=> b!379016 (= e!230627 true)))

(declare-fun lt!176808 () ListLongMap!5067)

(declare-fun lt!176812 () ListLongMap!5067)

(assert (=> b!379016 (= lt!176808 (+!895 lt!176812 lt!176814))))

(declare-fun lt!176819 () Unit!11688)

(declare-fun addCommutativeForDiffKeys!295 (ListLongMap!5067 (_ BitVec 64) V!13261 (_ BitVec 64) V!13261) Unit!11688)

(assert (=> b!379016 (= lt!176819 (addCommutativeForDiffKeys!295 lt!176817 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379017 () Bool)

(declare-fun res!214808 () Bool)

(assert (=> b!379017 (=> (not res!214808) (not e!230626))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379017 (= res!214808 (validKeyInArray!0 k0!778))))

(declare-fun b!379018 () Bool)

(assert (=> b!379018 (= e!230626 e!230630)))

(declare-fun res!214806 () Bool)

(assert (=> b!379018 (=> (not res!214806) (not e!230630))))

(assert (=> b!379018 (= res!214806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176818 mask!970))))

(assert (=> b!379018 (= lt!176818 (array!22158 (store (arr!10547 _keys!658) i!548 k0!778) (size!10899 _keys!658)))))

(declare-fun b!379019 () Bool)

(assert (=> b!379019 (= e!230628 e!230627)))

(declare-fun res!214803 () Bool)

(assert (=> b!379019 (=> res!214803 e!230627)))

(assert (=> b!379019 (= res!214803 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!379019 (= lt!176820 lt!176812)))

(declare-fun lt!176809 () tuple2!6154)

(assert (=> b!379019 (= lt!176812 (+!895 lt!176817 lt!176809))))

(assert (=> b!379019 (= lt!176813 lt!176808)))

(assert (=> b!379019 (= lt!176808 (+!895 lt!176811 lt!176809))))

(assert (=> b!379019 (= lt!176813 (+!895 lt!176815 lt!176809))))

(assert (=> b!379019 (= lt!176809 (tuple2!6155 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (= (and start!37342 res!214802) b!379010))

(assert (= (and b!379010 res!214801) b!379005))

(assert (= (and b!379005 res!214805) b!379007))

(assert (= (and b!379007 res!214810) b!379014))

(assert (= (and b!379014 res!214811) b!379017))

(assert (= (and b!379017 res!214808) b!379015))

(assert (= (and b!379015 res!214807) b!379012))

(assert (= (and b!379012 res!214809) b!379018))

(assert (= (and b!379018 res!214806) b!379009))

(assert (= (and b!379009 res!214804) b!379006))

(assert (= (and b!379006 (not res!214800)) b!379019))

(assert (= (and b!379019 (not res!214803)) b!379016))

(assert (= (and b!379013 condMapEmpty!15240) mapIsEmpty!15240))

(assert (= (and b!379013 (not condMapEmpty!15240)) mapNonEmpty!15240))

(get-info :version)

(assert (= (and mapNonEmpty!15240 ((_ is ValueCellFull!4215) mapValue!15240)) b!379011))

(assert (= (and b!379013 ((_ is ValueCellFull!4215) mapDefault!15240)) b!379008))

(assert (= start!37342 b!379013))

(declare-fun m!375855 () Bool)

(assert (=> start!37342 m!375855))

(declare-fun m!375857 () Bool)

(assert (=> start!37342 m!375857))

(declare-fun m!375859 () Bool)

(assert (=> start!37342 m!375859))

(declare-fun m!375861 () Bool)

(assert (=> b!379019 m!375861))

(declare-fun m!375863 () Bool)

(assert (=> b!379019 m!375863))

(declare-fun m!375865 () Bool)

(assert (=> b!379019 m!375865))

(declare-fun m!375867 () Bool)

(assert (=> b!379012 m!375867))

(declare-fun m!375869 () Bool)

(assert (=> b!379017 m!375869))

(declare-fun m!375871 () Bool)

(assert (=> b!379006 m!375871))

(declare-fun m!375873 () Bool)

(assert (=> b!379006 m!375873))

(declare-fun m!375875 () Bool)

(assert (=> b!379006 m!375875))

(declare-fun m!375877 () Bool)

(assert (=> b!379006 m!375877))

(declare-fun m!375879 () Bool)

(assert (=> b!379006 m!375879))

(declare-fun m!375881 () Bool)

(assert (=> b!379006 m!375881))

(declare-fun m!375883 () Bool)

(assert (=> b!379006 m!375883))

(declare-fun m!375885 () Bool)

(assert (=> mapNonEmpty!15240 m!375885))

(declare-fun m!375887 () Bool)

(assert (=> b!379005 m!375887))

(declare-fun m!375889 () Bool)

(assert (=> b!379009 m!375889))

(declare-fun m!375891 () Bool)

(assert (=> b!379007 m!375891))

(declare-fun m!375893 () Bool)

(assert (=> b!379018 m!375893))

(declare-fun m!375895 () Bool)

(assert (=> b!379018 m!375895))

(declare-fun m!375897 () Bool)

(assert (=> b!379016 m!375897))

(declare-fun m!375899 () Bool)

(assert (=> b!379016 m!375899))

(declare-fun m!375901 () Bool)

(assert (=> b!379015 m!375901))

(check-sat (not b!379009) (not b!379019) (not b!379007) (not b!379016) (not b_next!8469) (not mapNonEmpty!15240) (not start!37342) tp_is_empty!9117 (not b!379018) (not b!379012) (not b!379017) (not b!379005) (not b!379006) b_and!15711)
(check-sat b_and!15711 (not b_next!8469))
