; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37582 () Bool)

(assert start!37582)

(declare-fun b_free!8709 () Bool)

(declare-fun b_next!8709 () Bool)

(assert (=> start!37582 (= b_free!8709 (not b_next!8709))))

(declare-fun tp!30843 () Bool)

(declare-fun b_and!15951 () Bool)

(assert (=> start!37582 (= tp!30843 b_and!15951)))

(declare-fun b!384171 () Bool)

(declare-fun res!218893 () Bool)

(declare-fun e!233273 () Bool)

(assert (=> b!384171 (=> (not res!218893) (not e!233273))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22619 0))(
  ( (array!22620 (arr!10778 (Array (_ BitVec 32) (_ BitVec 64))) (size!11130 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22619)

(assert (=> b!384171 (= res!218893 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11130 _keys!658))))))

(declare-fun b!384172 () Bool)

(declare-fun res!218890 () Bool)

(assert (=> b!384172 (=> (not res!218890) (not e!233273))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13581 0))(
  ( (V!13582 (val!4723 Int)) )
))
(declare-datatypes ((ValueCell!4335 0))(
  ( (ValueCellFull!4335 (v!6920 V!13581)) (EmptyCell!4335) )
))
(declare-datatypes ((array!22621 0))(
  ( (array!22622 (arr!10779 (Array (_ BitVec 32) ValueCell!4335)) (size!11131 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22621)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!384172 (= res!218890 (and (= (size!11131 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11130 _keys!658) (size!11131 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!218895 () Bool)

(assert (=> start!37582 (=> (not res!218895) (not e!233273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37582 (= res!218895 (validMask!0 mask!970))))

(assert (=> start!37582 e!233273))

(declare-fun e!233272 () Bool)

(declare-fun array_inv!7934 (array!22621) Bool)

(assert (=> start!37582 (and (array_inv!7934 _values!506) e!233272)))

(assert (=> start!37582 tp!30843))

(assert (=> start!37582 true))

(declare-fun tp_is_empty!9357 () Bool)

(assert (=> start!37582 tp_is_empty!9357))

(declare-fun array_inv!7935 (array!22619) Bool)

(assert (=> start!37582 (array_inv!7935 _keys!658)))

(declare-fun b!384173 () Bool)

(declare-fun e!233276 () Bool)

(declare-fun e!233274 () Bool)

(assert (=> b!384173 (= e!233276 (not e!233274))))

(declare-fun res!218887 () Bool)

(assert (=> b!384173 (=> res!218887 e!233274)))

(declare-fun lt!180681 () Bool)

(assert (=> b!384173 (= res!218887 (or (and (not lt!180681) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180681) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180681)))))

(assert (=> b!384173 (= lt!180681 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((tuple2!6356 0))(
  ( (tuple2!6357 (_1!3189 (_ BitVec 64)) (_2!3189 V!13581)) )
))
(declare-datatypes ((List!6192 0))(
  ( (Nil!6189) (Cons!6188 (h!7044 tuple2!6356) (t!11342 List!6192)) )
))
(declare-datatypes ((ListLongMap!5269 0))(
  ( (ListLongMap!5270 (toList!2650 List!6192)) )
))
(declare-fun lt!180685 () ListLongMap!5269)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13581)

(declare-fun minValue!472 () V!13581)

(declare-fun getCurrentListMap!2051 (array!22619 array!22621 (_ BitVec 32) (_ BitVec 32) V!13581 V!13581 (_ BitVec 32) Int) ListLongMap!5269)

(assert (=> b!384173 (= lt!180685 (getCurrentListMap!2051 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180683 () ListLongMap!5269)

(declare-fun lt!180687 () array!22619)

(declare-fun lt!180688 () array!22621)

(assert (=> b!384173 (= lt!180683 (getCurrentListMap!2051 lt!180687 lt!180688 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180689 () ListLongMap!5269)

(declare-fun lt!180684 () ListLongMap!5269)

(assert (=> b!384173 (and (= lt!180689 lt!180684) (= lt!180684 lt!180689))))

(declare-fun lt!180686 () ListLongMap!5269)

(declare-fun lt!180690 () tuple2!6356)

(declare-fun +!985 (ListLongMap!5269 tuple2!6356) ListLongMap!5269)

(assert (=> b!384173 (= lt!180684 (+!985 lt!180686 lt!180690))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13581)

(assert (=> b!384173 (= lt!180690 (tuple2!6357 k0!778 v!373))))

(declare-datatypes ((Unit!11856 0))(
  ( (Unit!11857) )
))
(declare-fun lt!180682 () Unit!11856)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!209 (array!22619 array!22621 (_ BitVec 32) (_ BitVec 32) V!13581 V!13581 (_ BitVec 32) (_ BitVec 64) V!13581 (_ BitVec 32) Int) Unit!11856)

(assert (=> b!384173 (= lt!180682 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!209 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!885 (array!22619 array!22621 (_ BitVec 32) (_ BitVec 32) V!13581 V!13581 (_ BitVec 32) Int) ListLongMap!5269)

(assert (=> b!384173 (= lt!180689 (getCurrentListMapNoExtraKeys!885 lt!180687 lt!180688 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!384173 (= lt!180688 (array!22622 (store (arr!10779 _values!506) i!548 (ValueCellFull!4335 v!373)) (size!11131 _values!506)))))

(assert (=> b!384173 (= lt!180686 (getCurrentListMapNoExtraKeys!885 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!384174 () Bool)

(declare-fun res!218888 () Bool)

(assert (=> b!384174 (=> (not res!218888) (not e!233276))))

(declare-datatypes ((List!6193 0))(
  ( (Nil!6190) (Cons!6189 (h!7045 (_ BitVec 64)) (t!11343 List!6193)) )
))
(declare-fun arrayNoDuplicates!0 (array!22619 (_ BitVec 32) List!6193) Bool)

(assert (=> b!384174 (= res!218888 (arrayNoDuplicates!0 lt!180687 #b00000000000000000000000000000000 Nil!6190))))

(declare-fun b!384175 () Bool)

(declare-fun e!233270 () Bool)

(assert (=> b!384175 (= e!233270 (bvsle #b00000000000000000000000000000000 (size!11130 _keys!658)))))

(declare-fun b!384176 () Bool)

(declare-fun res!218896 () Bool)

(assert (=> b!384176 (=> (not res!218896) (not e!233273))))

(declare-fun arrayContainsKey!0 (array!22619 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!384176 (= res!218896 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!384177 () Bool)

(declare-fun res!218889 () Bool)

(assert (=> b!384177 (=> (not res!218889) (not e!233273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22619 (_ BitVec 32)) Bool)

(assert (=> b!384177 (= res!218889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!384178 () Bool)

(declare-fun res!218897 () Bool)

(assert (=> b!384178 (=> (not res!218897) (not e!233273))))

(assert (=> b!384178 (= res!218897 (or (= (select (arr!10778 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10778 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15600 () Bool)

(declare-fun mapRes!15600 () Bool)

(declare-fun tp!30842 () Bool)

(declare-fun e!233271 () Bool)

(assert (=> mapNonEmpty!15600 (= mapRes!15600 (and tp!30842 e!233271))))

(declare-fun mapRest!15600 () (Array (_ BitVec 32) ValueCell!4335))

(declare-fun mapValue!15600 () ValueCell!4335)

(declare-fun mapKey!15600 () (_ BitVec 32))

(assert (=> mapNonEmpty!15600 (= (arr!10779 _values!506) (store mapRest!15600 mapKey!15600 mapValue!15600))))

(declare-fun b!384179 () Bool)

(declare-fun e!233269 () Bool)

(assert (=> b!384179 (= e!233272 (and e!233269 mapRes!15600))))

(declare-fun condMapEmpty!15600 () Bool)

(declare-fun mapDefault!15600 () ValueCell!4335)

(assert (=> b!384179 (= condMapEmpty!15600 (= (arr!10779 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4335)) mapDefault!15600)))))

(declare-fun b!384180 () Bool)

(assert (=> b!384180 (= e!233271 tp_is_empty!9357)))

(declare-fun b!384181 () Bool)

(declare-fun res!218892 () Bool)

(assert (=> b!384181 (=> (not res!218892) (not e!233273))))

(assert (=> b!384181 (= res!218892 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6190))))

(declare-fun mapIsEmpty!15600 () Bool)

(assert (=> mapIsEmpty!15600 mapRes!15600))

(declare-fun b!384182 () Bool)

(assert (=> b!384182 (= e!233274 e!233270)))

(declare-fun res!218894 () Bool)

(assert (=> b!384182 (=> res!218894 e!233270)))

(assert (=> b!384182 (= res!218894 (not (= (+!985 lt!180685 lt!180690) lt!180683)))))

(assert (=> b!384182 (= lt!180683 lt!180689)))

(declare-fun b!384183 () Bool)

(assert (=> b!384183 (= e!233273 e!233276)))

(declare-fun res!218891 () Bool)

(assert (=> b!384183 (=> (not res!218891) (not e!233276))))

(assert (=> b!384183 (= res!218891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180687 mask!970))))

(assert (=> b!384183 (= lt!180687 (array!22620 (store (arr!10778 _keys!658) i!548 k0!778) (size!11130 _keys!658)))))

(declare-fun b!384184 () Bool)

(assert (=> b!384184 (= e!233269 tp_is_empty!9357)))

(declare-fun b!384185 () Bool)

(declare-fun res!218886 () Bool)

(assert (=> b!384185 (=> (not res!218886) (not e!233273))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384185 (= res!218886 (validKeyInArray!0 k0!778))))

(assert (= (and start!37582 res!218895) b!384172))

(assert (= (and b!384172 res!218890) b!384177))

(assert (= (and b!384177 res!218889) b!384181))

(assert (= (and b!384181 res!218892) b!384171))

(assert (= (and b!384171 res!218893) b!384185))

(assert (= (and b!384185 res!218886) b!384178))

(assert (= (and b!384178 res!218897) b!384176))

(assert (= (and b!384176 res!218896) b!384183))

(assert (= (and b!384183 res!218891) b!384174))

(assert (= (and b!384174 res!218888) b!384173))

(assert (= (and b!384173 (not res!218887)) b!384182))

(assert (= (and b!384182 (not res!218894)) b!384175))

(assert (= (and b!384179 condMapEmpty!15600) mapIsEmpty!15600))

(assert (= (and b!384179 (not condMapEmpty!15600)) mapNonEmpty!15600))

(get-info :version)

(assert (= (and mapNonEmpty!15600 ((_ is ValueCellFull!4335) mapValue!15600)) b!384180))

(assert (= (and b!384179 ((_ is ValueCellFull!4335) mapDefault!15600)) b!384184))

(assert (= start!37582 b!384179))

(declare-fun m!380875 () Bool)

(assert (=> b!384176 m!380875))

(declare-fun m!380877 () Bool)

(assert (=> b!384181 m!380877))

(declare-fun m!380879 () Bool)

(assert (=> start!37582 m!380879))

(declare-fun m!380881 () Bool)

(assert (=> start!37582 m!380881))

(declare-fun m!380883 () Bool)

(assert (=> start!37582 m!380883))

(declare-fun m!380885 () Bool)

(assert (=> b!384173 m!380885))

(declare-fun m!380887 () Bool)

(assert (=> b!384173 m!380887))

(declare-fun m!380889 () Bool)

(assert (=> b!384173 m!380889))

(declare-fun m!380891 () Bool)

(assert (=> b!384173 m!380891))

(declare-fun m!380893 () Bool)

(assert (=> b!384173 m!380893))

(declare-fun m!380895 () Bool)

(assert (=> b!384173 m!380895))

(declare-fun m!380897 () Bool)

(assert (=> b!384173 m!380897))

(declare-fun m!380899 () Bool)

(assert (=> b!384183 m!380899))

(declare-fun m!380901 () Bool)

(assert (=> b!384183 m!380901))

(declare-fun m!380903 () Bool)

(assert (=> b!384182 m!380903))

(declare-fun m!380905 () Bool)

(assert (=> b!384174 m!380905))

(declare-fun m!380907 () Bool)

(assert (=> b!384177 m!380907))

(declare-fun m!380909 () Bool)

(assert (=> b!384185 m!380909))

(declare-fun m!380911 () Bool)

(assert (=> mapNonEmpty!15600 m!380911))

(declare-fun m!380913 () Bool)

(assert (=> b!384178 m!380913))

(check-sat (not b_next!8709) (not mapNonEmpty!15600) (not b!384185) (not b!384181) tp_is_empty!9357 (not b!384183) b_and!15951 (not b!384177) (not b!384173) (not b!384174) (not b!384176) (not b!384182) (not start!37582))
(check-sat b_and!15951 (not b_next!8709))
