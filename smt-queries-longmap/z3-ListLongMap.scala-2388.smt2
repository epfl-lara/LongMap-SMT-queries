; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37776 () Bool)

(assert start!37776)

(declare-fun b_free!8893 () Bool)

(declare-fun b_next!8893 () Bool)

(assert (=> start!37776 (= b_free!8893 (not b_next!8893))))

(declare-fun tp!31430 () Bool)

(declare-fun b_and!16109 () Bool)

(assert (=> start!37776 (= tp!31430 b_and!16109)))

(declare-fun mapNonEmpty!15912 () Bool)

(declare-fun mapRes!15912 () Bool)

(declare-fun tp!31431 () Bool)

(declare-fun e!235030 () Bool)

(assert (=> mapNonEmpty!15912 (= mapRes!15912 (and tp!31431 e!235030))))

(declare-datatypes ((V!13859 0))(
  ( (V!13860 (val!4827 Int)) )
))
(declare-datatypes ((ValueCell!4439 0))(
  ( (ValueCellFull!4439 (v!7018 V!13859)) (EmptyCell!4439) )
))
(declare-datatypes ((array!23009 0))(
  ( (array!23010 (arr!10973 (Array (_ BitVec 32) ValueCell!4439)) (size!11326 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23009)

(declare-fun mapValue!15912 () ValueCell!4439)

(declare-fun mapKey!15912 () (_ BitVec 32))

(declare-fun mapRest!15912 () (Array (_ BitVec 32) ValueCell!4439))

(assert (=> mapNonEmpty!15912 (= (arr!10973 _values!506) (store mapRest!15912 mapKey!15912 mapValue!15912))))

(declare-fun b!387847 () Bool)

(declare-fun res!221774 () Bool)

(declare-fun e!235033 () Bool)

(assert (=> b!387847 (=> (not res!221774) (not e!235033))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((array!23011 0))(
  ( (array!23012 (arr!10974 (Array (_ BitVec 32) (_ BitVec 64))) (size!11327 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23011)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!387847 (= res!221774 (and (= (size!11326 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11327 _keys!658) (size!11326 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!387848 () Bool)

(declare-fun tp_is_empty!9565 () Bool)

(assert (=> b!387848 (= e!235030 tp_is_empty!9565)))

(declare-fun b!387849 () Bool)

(declare-fun res!221772 () Bool)

(assert (=> b!387849 (=> (not res!221772) (not e!235033))))

(declare-datatypes ((List!6309 0))(
  ( (Nil!6306) (Cons!6305 (h!7161 (_ BitVec 64)) (t!11450 List!6309)) )
))
(declare-fun arrayNoDuplicates!0 (array!23011 (_ BitVec 32) List!6309) Bool)

(assert (=> b!387849 (= res!221772 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6306))))

(declare-fun b!387850 () Bool)

(declare-fun res!221771 () Bool)

(assert (=> b!387850 (=> (not res!221771) (not e!235033))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387850 (= res!221771 (validKeyInArray!0 k0!778))))

(declare-fun b!387851 () Bool)

(declare-fun res!221770 () Bool)

(assert (=> b!387851 (=> (not res!221770) (not e!235033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23011 (_ BitVec 32)) Bool)

(assert (=> b!387851 (= res!221770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!387852 () Bool)

(declare-fun e!235029 () Bool)

(declare-fun e!235031 () Bool)

(assert (=> b!387852 (= e!235029 (and e!235031 mapRes!15912))))

(declare-fun condMapEmpty!15912 () Bool)

(declare-fun mapDefault!15912 () ValueCell!4439)

(assert (=> b!387852 (= condMapEmpty!15912 (= (arr!10973 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4439)) mapDefault!15912)))))

(declare-fun res!221769 () Bool)

(assert (=> start!37776 (=> (not res!221769) (not e!235033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37776 (= res!221769 (validMask!0 mask!970))))

(assert (=> start!37776 e!235033))

(declare-fun array_inv!8072 (array!23009) Bool)

(assert (=> start!37776 (and (array_inv!8072 _values!506) e!235029)))

(assert (=> start!37776 tp!31430))

(assert (=> start!37776 true))

(assert (=> start!37776 tp_is_empty!9565))

(declare-fun array_inv!8073 (array!23011) Bool)

(assert (=> start!37776 (array_inv!8073 _keys!658)))

(declare-fun b!387853 () Bool)

(declare-fun res!221768 () Bool)

(assert (=> b!387853 (=> (not res!221768) (not e!235033))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!387853 (= res!221768 (or (= (select (arr!10974 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10974 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387854 () Bool)

(assert (=> b!387854 (= e!235031 tp_is_empty!9565)))

(declare-fun b!387855 () Bool)

(declare-fun res!221776 () Bool)

(declare-fun e!235032 () Bool)

(assert (=> b!387855 (=> (not res!221776) (not e!235032))))

(declare-fun lt!181985 () array!23011)

(assert (=> b!387855 (= res!221776 (arrayNoDuplicates!0 lt!181985 #b00000000000000000000000000000000 Nil!6306))))

(declare-fun mapIsEmpty!15912 () Bool)

(assert (=> mapIsEmpty!15912 mapRes!15912))

(declare-fun b!387856 () Bool)

(assert (=> b!387856 (= e!235032 (not true))))

(declare-datatypes ((tuple2!6466 0))(
  ( (tuple2!6467 (_1!3244 (_ BitVec 64)) (_2!3244 V!13859)) )
))
(declare-datatypes ((List!6310 0))(
  ( (Nil!6307) (Cons!6306 (h!7162 tuple2!6466) (t!11451 List!6310)) )
))
(declare-datatypes ((ListLongMap!5369 0))(
  ( (ListLongMap!5370 (toList!2700 List!6310)) )
))
(declare-fun lt!181983 () ListLongMap!5369)

(declare-fun lt!181986 () ListLongMap!5369)

(assert (=> b!387856 (and (= lt!181983 lt!181986) (= lt!181986 lt!181983))))

(declare-fun v!373 () V!13859)

(declare-fun lt!181984 () ListLongMap!5369)

(declare-fun +!1020 (ListLongMap!5369 tuple2!6466) ListLongMap!5369)

(assert (=> b!387856 (= lt!181986 (+!1020 lt!181984 (tuple2!6467 k0!778 v!373)))))

(declare-datatypes ((Unit!11882 0))(
  ( (Unit!11883) )
))
(declare-fun lt!181982 () Unit!11882)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13859)

(declare-fun minValue!472 () V!13859)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!231 (array!23011 array!23009 (_ BitVec 32) (_ BitVec 32) V!13859 V!13859 (_ BitVec 32) (_ BitVec 64) V!13859 (_ BitVec 32) Int) Unit!11882)

(assert (=> b!387856 (= lt!181982 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!231 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!940 (array!23011 array!23009 (_ BitVec 32) (_ BitVec 32) V!13859 V!13859 (_ BitVec 32) Int) ListLongMap!5369)

(assert (=> b!387856 (= lt!181983 (getCurrentListMapNoExtraKeys!940 lt!181985 (array!23010 (store (arr!10973 _values!506) i!548 (ValueCellFull!4439 v!373)) (size!11326 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!387856 (= lt!181984 (getCurrentListMapNoExtraKeys!940 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!387857 () Bool)

(declare-fun res!221775 () Bool)

(assert (=> b!387857 (=> (not res!221775) (not e!235033))))

(assert (=> b!387857 (= res!221775 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11327 _keys!658))))))

(declare-fun b!387858 () Bool)

(declare-fun res!221773 () Bool)

(assert (=> b!387858 (=> (not res!221773) (not e!235033))))

(declare-fun arrayContainsKey!0 (array!23011 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387858 (= res!221773 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!387859 () Bool)

(assert (=> b!387859 (= e!235033 e!235032)))

(declare-fun res!221777 () Bool)

(assert (=> b!387859 (=> (not res!221777) (not e!235032))))

(assert (=> b!387859 (= res!221777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181985 mask!970))))

(assert (=> b!387859 (= lt!181985 (array!23012 (store (arr!10974 _keys!658) i!548 k0!778) (size!11327 _keys!658)))))

(assert (= (and start!37776 res!221769) b!387847))

(assert (= (and b!387847 res!221774) b!387851))

(assert (= (and b!387851 res!221770) b!387849))

(assert (= (and b!387849 res!221772) b!387857))

(assert (= (and b!387857 res!221775) b!387850))

(assert (= (and b!387850 res!221771) b!387853))

(assert (= (and b!387853 res!221768) b!387858))

(assert (= (and b!387858 res!221773) b!387859))

(assert (= (and b!387859 res!221777) b!387855))

(assert (= (and b!387855 res!221776) b!387856))

(assert (= (and b!387852 condMapEmpty!15912) mapIsEmpty!15912))

(assert (= (and b!387852 (not condMapEmpty!15912)) mapNonEmpty!15912))

(get-info :version)

(assert (= (and mapNonEmpty!15912 ((_ is ValueCellFull!4439) mapValue!15912)) b!387848))

(assert (= (and b!387852 ((_ is ValueCellFull!4439) mapDefault!15912)) b!387854))

(assert (= start!37776 b!387852))

(declare-fun m!383363 () Bool)

(assert (=> b!387851 m!383363))

(declare-fun m!383365 () Bool)

(assert (=> mapNonEmpty!15912 m!383365))

(declare-fun m!383367 () Bool)

(assert (=> b!387850 m!383367))

(declare-fun m!383369 () Bool)

(assert (=> b!387855 m!383369))

(declare-fun m!383371 () Bool)

(assert (=> b!387849 m!383371))

(declare-fun m!383373 () Bool)

(assert (=> b!387856 m!383373))

(declare-fun m!383375 () Bool)

(assert (=> b!387856 m!383375))

(declare-fun m!383377 () Bool)

(assert (=> b!387856 m!383377))

(declare-fun m!383379 () Bool)

(assert (=> b!387856 m!383379))

(declare-fun m!383381 () Bool)

(assert (=> b!387856 m!383381))

(declare-fun m!383383 () Bool)

(assert (=> b!387853 m!383383))

(declare-fun m!383385 () Bool)

(assert (=> b!387859 m!383385))

(declare-fun m!383387 () Bool)

(assert (=> b!387859 m!383387))

(declare-fun m!383389 () Bool)

(assert (=> start!37776 m!383389))

(declare-fun m!383391 () Bool)

(assert (=> start!37776 m!383391))

(declare-fun m!383393 () Bool)

(assert (=> start!37776 m!383393))

(declare-fun m!383395 () Bool)

(assert (=> b!387858 m!383395))

(check-sat (not b!387856) tp_is_empty!9565 (not b!387855) b_and!16109 (not b_next!8893) (not b!387850) (not b!387849) (not mapNonEmpty!15912) (not b!387859) (not b!387858) (not start!37776) (not b!387851))
(check-sat b_and!16109 (not b_next!8893))
