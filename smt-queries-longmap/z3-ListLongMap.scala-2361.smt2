; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37630 () Bool)

(assert start!37630)

(declare-fun b_free!8757 () Bool)

(declare-fun b_next!8757 () Bool)

(assert (=> start!37630 (= b_free!8757 (not b_next!8757))))

(declare-fun tp!30986 () Bool)

(declare-fun b_and!15999 () Bool)

(assert (=> start!37630 (= tp!30986 b_and!15999)))

(declare-fun b!385183 () Bool)

(declare-fun res!219690 () Bool)

(declare-fun e!233779 () Bool)

(assert (=> b!385183 (=> (not res!219690) (not e!233779))))

(declare-datatypes ((array!22711 0))(
  ( (array!22712 (arr!10824 (Array (_ BitVec 32) (_ BitVec 64))) (size!11176 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22711)

(declare-datatypes ((List!6229 0))(
  ( (Nil!6226) (Cons!6225 (h!7081 (_ BitVec 64)) (t!11379 List!6229)) )
))
(declare-fun arrayNoDuplicates!0 (array!22711 (_ BitVec 32) List!6229) Bool)

(assert (=> b!385183 (= res!219690 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6226))))

(declare-fun mapIsEmpty!15672 () Bool)

(declare-fun mapRes!15672 () Bool)

(assert (=> mapIsEmpty!15672 mapRes!15672))

(declare-fun b!385184 () Bool)

(declare-fun res!219687 () Bool)

(assert (=> b!385184 (=> (not res!219687) (not e!233779))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13645 0))(
  ( (V!13646 (val!4747 Int)) )
))
(declare-datatypes ((ValueCell!4359 0))(
  ( (ValueCellFull!4359 (v!6944 V!13645)) (EmptyCell!4359) )
))
(declare-datatypes ((array!22713 0))(
  ( (array!22714 (arr!10825 (Array (_ BitVec 32) ValueCell!4359)) (size!11177 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22713)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!385184 (= res!219687 (and (= (size!11177 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11176 _keys!658) (size!11177 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!15672 () Bool)

(declare-fun tp!30987 () Bool)

(declare-fun e!233781 () Bool)

(assert (=> mapNonEmpty!15672 (= mapRes!15672 (and tp!30987 e!233781))))

(declare-fun mapKey!15672 () (_ BitVec 32))

(declare-fun mapValue!15672 () ValueCell!4359)

(declare-fun mapRest!15672 () (Array (_ BitVec 32) ValueCell!4359))

(assert (=> mapNonEmpty!15672 (= (arr!10825 _values!506) (store mapRest!15672 mapKey!15672 mapValue!15672))))

(declare-fun b!385185 () Bool)

(declare-fun res!219692 () Bool)

(assert (=> b!385185 (=> (not res!219692) (not e!233779))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!385185 (= res!219692 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11176 _keys!658))))))

(declare-fun b!385186 () Bool)

(declare-fun res!219689 () Bool)

(assert (=> b!385186 (=> (not res!219689) (not e!233779))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385186 (= res!219689 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!385187 () Bool)

(declare-fun e!233780 () Bool)

(assert (=> b!385187 (= e!233779 e!233780)))

(declare-fun res!219686 () Bool)

(assert (=> b!385187 (=> (not res!219686) (not e!233780))))

(declare-fun lt!181475 () array!22711)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22711 (_ BitVec 32)) Bool)

(assert (=> b!385187 (= res!219686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181475 mask!970))))

(assert (=> b!385187 (= lt!181475 (array!22712 (store (arr!10824 _keys!658) i!548 k0!778) (size!11176 _keys!658)))))

(declare-fun res!219684 () Bool)

(assert (=> start!37630 (=> (not res!219684) (not e!233779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37630 (= res!219684 (validMask!0 mask!970))))

(assert (=> start!37630 e!233779))

(declare-fun e!233783 () Bool)

(declare-fun array_inv!7966 (array!22713) Bool)

(assert (=> start!37630 (and (array_inv!7966 _values!506) e!233783)))

(assert (=> start!37630 tp!30986))

(assert (=> start!37630 true))

(declare-fun tp_is_empty!9405 () Bool)

(assert (=> start!37630 tp_is_empty!9405))

(declare-fun array_inv!7967 (array!22711) Bool)

(assert (=> start!37630 (array_inv!7967 _keys!658)))

(declare-fun b!385188 () Bool)

(declare-fun e!233782 () Bool)

(assert (=> b!385188 (= e!233782 tp_is_empty!9405)))

(declare-fun b!385189 () Bool)

(declare-fun e!233777 () Bool)

(assert (=> b!385189 (= e!233780 (not e!233777))))

(declare-fun res!219682 () Bool)

(assert (=> b!385189 (=> res!219682 e!233777)))

(declare-fun lt!181472 () Bool)

(assert (=> b!385189 (= res!219682 (or (and (not lt!181472) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!181472) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!181472)))))

(assert (=> b!385189 (= lt!181472 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6394 0))(
  ( (tuple2!6395 (_1!3208 (_ BitVec 64)) (_2!3208 V!13645)) )
))
(declare-datatypes ((List!6230 0))(
  ( (Nil!6227) (Cons!6226 (h!7082 tuple2!6394) (t!11380 List!6230)) )
))
(declare-datatypes ((ListLongMap!5307 0))(
  ( (ListLongMap!5308 (toList!2669 List!6230)) )
))
(declare-fun lt!181474 () ListLongMap!5307)

(declare-fun zeroValue!472 () V!13645)

(declare-fun minValue!472 () V!13645)

(declare-fun getCurrentListMap!2065 (array!22711 array!22713 (_ BitVec 32) (_ BitVec 32) V!13645 V!13645 (_ BitVec 32) Int) ListLongMap!5307)

(assert (=> b!385189 (= lt!181474 (getCurrentListMap!2065 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181471 () ListLongMap!5307)

(declare-fun lt!181470 () array!22713)

(assert (=> b!385189 (= lt!181471 (getCurrentListMap!2065 lt!181475 lt!181470 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181469 () ListLongMap!5307)

(declare-fun lt!181478 () ListLongMap!5307)

(assert (=> b!385189 (and (= lt!181469 lt!181478) (= lt!181478 lt!181469))))

(declare-fun lt!181479 () ListLongMap!5307)

(declare-fun lt!181476 () tuple2!6394)

(declare-fun +!1004 (ListLongMap!5307 tuple2!6394) ListLongMap!5307)

(assert (=> b!385189 (= lt!181478 (+!1004 lt!181479 lt!181476))))

(declare-fun v!373 () V!13645)

(assert (=> b!385189 (= lt!181476 (tuple2!6395 k0!778 v!373))))

(declare-datatypes ((Unit!11884 0))(
  ( (Unit!11885) )
))
(declare-fun lt!181473 () Unit!11884)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!223 (array!22711 array!22713 (_ BitVec 32) (_ BitVec 32) V!13645 V!13645 (_ BitVec 32) (_ BitVec 64) V!13645 (_ BitVec 32) Int) Unit!11884)

(assert (=> b!385189 (= lt!181473 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!223 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!899 (array!22711 array!22713 (_ BitVec 32) (_ BitVec 32) V!13645 V!13645 (_ BitVec 32) Int) ListLongMap!5307)

(assert (=> b!385189 (= lt!181469 (getCurrentListMapNoExtraKeys!899 lt!181475 lt!181470 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!385189 (= lt!181470 (array!22714 (store (arr!10825 _values!506) i!548 (ValueCellFull!4359 v!373)) (size!11177 _values!506)))))

(assert (=> b!385189 (= lt!181479 (getCurrentListMapNoExtraKeys!899 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!385190 () Bool)

(assert (=> b!385190 (= e!233777 true)))

(declare-fun lt!181477 () ListLongMap!5307)

(assert (=> b!385190 (= lt!181477 (+!1004 lt!181474 lt!181476))))

(assert (=> b!385190 (= lt!181471 lt!181469)))

(declare-fun b!385191 () Bool)

(declare-fun res!219683 () Bool)

(assert (=> b!385191 (=> (not res!219683) (not e!233779))))

(assert (=> b!385191 (= res!219683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385192 () Bool)

(declare-fun res!219685 () Bool)

(assert (=> b!385192 (=> (not res!219685) (not e!233780))))

(assert (=> b!385192 (= res!219685 (arrayNoDuplicates!0 lt!181475 #b00000000000000000000000000000000 Nil!6226))))

(declare-fun b!385193 () Bool)

(assert (=> b!385193 (= e!233781 tp_is_empty!9405)))

(declare-fun b!385194 () Bool)

(declare-fun res!219691 () Bool)

(assert (=> b!385194 (=> (not res!219691) (not e!233779))))

(assert (=> b!385194 (= res!219691 (or (= (select (arr!10824 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10824 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!385195 () Bool)

(declare-fun res!219688 () Bool)

(assert (=> b!385195 (=> (not res!219688) (not e!233779))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!385195 (= res!219688 (validKeyInArray!0 k0!778))))

(declare-fun b!385196 () Bool)

(assert (=> b!385196 (= e!233783 (and e!233782 mapRes!15672))))

(declare-fun condMapEmpty!15672 () Bool)

(declare-fun mapDefault!15672 () ValueCell!4359)

(assert (=> b!385196 (= condMapEmpty!15672 (= (arr!10825 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4359)) mapDefault!15672)))))

(assert (= (and start!37630 res!219684) b!385184))

(assert (= (and b!385184 res!219687) b!385191))

(assert (= (and b!385191 res!219683) b!385183))

(assert (= (and b!385183 res!219690) b!385185))

(assert (= (and b!385185 res!219692) b!385195))

(assert (= (and b!385195 res!219688) b!385194))

(assert (= (and b!385194 res!219691) b!385186))

(assert (= (and b!385186 res!219689) b!385187))

(assert (= (and b!385187 res!219686) b!385192))

(assert (= (and b!385192 res!219685) b!385189))

(assert (= (and b!385189 (not res!219682)) b!385190))

(assert (= (and b!385196 condMapEmpty!15672) mapIsEmpty!15672))

(assert (= (and b!385196 (not condMapEmpty!15672)) mapNonEmpty!15672))

(get-info :version)

(assert (= (and mapNonEmpty!15672 ((_ is ValueCellFull!4359) mapValue!15672)) b!385193))

(assert (= (and b!385196 ((_ is ValueCellFull!4359) mapDefault!15672)) b!385188))

(assert (= start!37630 b!385196))

(declare-fun m!381835 () Bool)

(assert (=> b!385191 m!381835))

(declare-fun m!381837 () Bool)

(assert (=> b!385192 m!381837))

(declare-fun m!381839 () Bool)

(assert (=> b!385190 m!381839))

(declare-fun m!381841 () Bool)

(assert (=> b!385195 m!381841))

(declare-fun m!381843 () Bool)

(assert (=> mapNonEmpty!15672 m!381843))

(declare-fun m!381845 () Bool)

(assert (=> b!385187 m!381845))

(declare-fun m!381847 () Bool)

(assert (=> b!385187 m!381847))

(declare-fun m!381849 () Bool)

(assert (=> start!37630 m!381849))

(declare-fun m!381851 () Bool)

(assert (=> start!37630 m!381851))

(declare-fun m!381853 () Bool)

(assert (=> start!37630 m!381853))

(declare-fun m!381855 () Bool)

(assert (=> b!385194 m!381855))

(declare-fun m!381857 () Bool)

(assert (=> b!385189 m!381857))

(declare-fun m!381859 () Bool)

(assert (=> b!385189 m!381859))

(declare-fun m!381861 () Bool)

(assert (=> b!385189 m!381861))

(declare-fun m!381863 () Bool)

(assert (=> b!385189 m!381863))

(declare-fun m!381865 () Bool)

(assert (=> b!385189 m!381865))

(declare-fun m!381867 () Bool)

(assert (=> b!385189 m!381867))

(declare-fun m!381869 () Bool)

(assert (=> b!385189 m!381869))

(declare-fun m!381871 () Bool)

(assert (=> b!385183 m!381871))

(declare-fun m!381873 () Bool)

(assert (=> b!385186 m!381873))

(check-sat b_and!15999 (not mapNonEmpty!15672) (not start!37630) (not b!385186) (not b!385190) (not b_next!8757) (not b!385191) (not b!385183) (not b!385192) (not b!385187) (not b!385189) tp_is_empty!9405 (not b!385195))
(check-sat b_and!15999 (not b_next!8757))
