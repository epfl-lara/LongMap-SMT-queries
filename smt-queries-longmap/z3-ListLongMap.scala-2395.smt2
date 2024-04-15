; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37908 () Bool)

(assert start!37908)

(declare-fun b_free!8935 () Bool)

(declare-fun b_next!8935 () Bool)

(assert (=> start!37908 (= b_free!8935 (not b_next!8935))))

(declare-fun tp!31569 () Bool)

(declare-fun b_and!16199 () Bool)

(assert (=> start!37908 (= tp!31569 b_and!16199)))

(declare-fun b!389576 () Bool)

(declare-fun res!222861 () Bool)

(declare-fun e!236015 () Bool)

(assert (=> b!389576 (=> (not res!222861) (not e!236015))))

(declare-datatypes ((array!23099 0))(
  ( (array!23100 (arr!11014 (Array (_ BitVec 32) (_ BitVec 64))) (size!11367 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23099)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!389576 (= res!222861 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!389577 () Bool)

(declare-fun res!222871 () Bool)

(assert (=> b!389577 (=> (not res!222871) (not e!236015))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!389577 (= res!222871 (validKeyInArray!0 k0!778))))

(declare-fun b!389578 () Bool)

(declare-fun e!236012 () Bool)

(declare-fun e!236016 () Bool)

(assert (=> b!389578 (= e!236012 (not e!236016))))

(declare-fun res!222863 () Bool)

(assert (=> b!389578 (=> res!222863 e!236016)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!389578 (= res!222863 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13915 0))(
  ( (V!13916 (val!4848 Int)) )
))
(declare-datatypes ((ValueCell!4460 0))(
  ( (ValueCellFull!4460 (v!7055 V!13915)) (EmptyCell!4460) )
))
(declare-datatypes ((array!23101 0))(
  ( (array!23102 (arr!11015 (Array (_ BitVec 32) ValueCell!4460)) (size!11368 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23101)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13915)

(declare-datatypes ((tuple2!6496 0))(
  ( (tuple2!6497 (_1!3259 (_ BitVec 64)) (_2!3259 V!13915)) )
))
(declare-datatypes ((List!6341 0))(
  ( (Nil!6338) (Cons!6337 (h!7193 tuple2!6496) (t!11490 List!6341)) )
))
(declare-datatypes ((ListLongMap!5399 0))(
  ( (ListLongMap!5400 (toList!2715 List!6341)) )
))
(declare-fun lt!183229 () ListLongMap!5399)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13915)

(declare-fun getCurrentListMap!2042 (array!23099 array!23101 (_ BitVec 32) (_ BitVec 32) V!13915 V!13915 (_ BitVec 32) Int) ListLongMap!5399)

(assert (=> b!389578 (= lt!183229 (getCurrentListMap!2042 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183218 () ListLongMap!5399)

(declare-fun lt!183221 () array!23099)

(declare-fun lt!183223 () array!23101)

(assert (=> b!389578 (= lt!183218 (getCurrentListMap!2042 lt!183221 lt!183223 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183224 () ListLongMap!5399)

(declare-fun lt!183228 () ListLongMap!5399)

(assert (=> b!389578 (and (= lt!183224 lt!183228) (= lt!183228 lt!183224))))

(declare-fun lt!183222 () ListLongMap!5399)

(declare-fun lt!183227 () tuple2!6496)

(declare-fun +!1035 (ListLongMap!5399 tuple2!6496) ListLongMap!5399)

(assert (=> b!389578 (= lt!183228 (+!1035 lt!183222 lt!183227))))

(declare-fun v!373 () V!13915)

(assert (=> b!389578 (= lt!183227 (tuple2!6497 k0!778 v!373))))

(declare-datatypes ((Unit!11914 0))(
  ( (Unit!11915) )
))
(declare-fun lt!183216 () Unit!11914)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!243 (array!23099 array!23101 (_ BitVec 32) (_ BitVec 32) V!13915 V!13915 (_ BitVec 32) (_ BitVec 64) V!13915 (_ BitVec 32) Int) Unit!11914)

(assert (=> b!389578 (= lt!183216 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!243 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!952 (array!23099 array!23101 (_ BitVec 32) (_ BitVec 32) V!13915 V!13915 (_ BitVec 32) Int) ListLongMap!5399)

(assert (=> b!389578 (= lt!183224 (getCurrentListMapNoExtraKeys!952 lt!183221 lt!183223 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!389578 (= lt!183223 (array!23102 (store (arr!11015 _values!506) i!548 (ValueCellFull!4460 v!373)) (size!11368 _values!506)))))

(assert (=> b!389578 (= lt!183222 (getCurrentListMapNoExtraKeys!952 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!389579 () Bool)

(declare-fun e!236009 () Bool)

(declare-fun tp_is_empty!9607 () Bool)

(assert (=> b!389579 (= e!236009 tp_is_empty!9607)))

(declare-fun b!389580 () Bool)

(declare-fun res!222864 () Bool)

(assert (=> b!389580 (=> (not res!222864) (not e!236015))))

(assert (=> b!389580 (= res!222864 (and (= (size!11368 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11367 _keys!658) (size!11368 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!389581 () Bool)

(declare-fun e!236010 () Bool)

(declare-fun e!236014 () Bool)

(declare-fun mapRes!15987 () Bool)

(assert (=> b!389581 (= e!236010 (and e!236014 mapRes!15987))))

(declare-fun condMapEmpty!15987 () Bool)

(declare-fun mapDefault!15987 () ValueCell!4460)

(assert (=> b!389581 (= condMapEmpty!15987 (= (arr!11015 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4460)) mapDefault!15987)))))

(declare-fun b!389582 () Bool)

(declare-fun res!222867 () Bool)

(assert (=> b!389582 (=> (not res!222867) (not e!236015))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23099 (_ BitVec 32)) Bool)

(assert (=> b!389582 (= res!222867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!389583 () Bool)

(declare-fun res!222866 () Bool)

(assert (=> b!389583 (=> (not res!222866) (not e!236015))))

(assert (=> b!389583 (= res!222866 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11367 _keys!658))))))

(declare-fun b!389584 () Bool)

(assert (=> b!389584 (= e!236014 tp_is_empty!9607)))

(declare-fun res!222868 () Bool)

(assert (=> start!37908 (=> (not res!222868) (not e!236015))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37908 (= res!222868 (validMask!0 mask!970))))

(assert (=> start!37908 e!236015))

(declare-fun array_inv!8096 (array!23101) Bool)

(assert (=> start!37908 (and (array_inv!8096 _values!506) e!236010)))

(assert (=> start!37908 tp!31569))

(assert (=> start!37908 true))

(assert (=> start!37908 tp_is_empty!9607))

(declare-fun array_inv!8097 (array!23099) Bool)

(assert (=> start!37908 (array_inv!8097 _keys!658)))

(declare-fun b!389585 () Bool)

(declare-fun e!236013 () Bool)

(assert (=> b!389585 (= e!236013 true)))

(declare-fun lt!183226 () ListLongMap!5399)

(declare-fun lt!183225 () tuple2!6496)

(declare-fun lt!183215 () ListLongMap!5399)

(assert (=> b!389585 (= (+!1035 lt!183215 lt!183225) (+!1035 lt!183226 lt!183227))))

(declare-fun lt!183217 () Unit!11914)

(declare-fun lt!183219 () ListLongMap!5399)

(declare-fun addCommutativeForDiffKeys!325 (ListLongMap!5399 (_ BitVec 64) V!13915 (_ BitVec 64) V!13915) Unit!11914)

(assert (=> b!389585 (= lt!183217 (addCommutativeForDiffKeys!325 lt!183219 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!389586 () Bool)

(declare-fun res!222870 () Bool)

(assert (=> b!389586 (=> (not res!222870) (not e!236012))))

(declare-datatypes ((List!6342 0))(
  ( (Nil!6339) (Cons!6338 (h!7194 (_ BitVec 64)) (t!11491 List!6342)) )
))
(declare-fun arrayNoDuplicates!0 (array!23099 (_ BitVec 32) List!6342) Bool)

(assert (=> b!389586 (= res!222870 (arrayNoDuplicates!0 lt!183221 #b00000000000000000000000000000000 Nil!6339))))

(declare-fun b!389587 () Bool)

(declare-fun res!222862 () Bool)

(assert (=> b!389587 (=> (not res!222862) (not e!236015))))

(assert (=> b!389587 (= res!222862 (or (= (select (arr!11014 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11014 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!389588 () Bool)

(declare-fun res!222869 () Bool)

(assert (=> b!389588 (=> (not res!222869) (not e!236015))))

(assert (=> b!389588 (= res!222869 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6339))))

(declare-fun b!389589 () Bool)

(assert (=> b!389589 (= e!236016 e!236013)))

(declare-fun res!222865 () Bool)

(assert (=> b!389589 (=> res!222865 e!236013)))

(assert (=> b!389589 (= res!222865 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!183230 () ListLongMap!5399)

(assert (=> b!389589 (= lt!183230 lt!183215)))

(assert (=> b!389589 (= lt!183215 (+!1035 lt!183219 lt!183227))))

(declare-fun lt!183220 () Unit!11914)

(assert (=> b!389589 (= lt!183220 (addCommutativeForDiffKeys!325 lt!183222 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (=> b!389589 (= lt!183218 (+!1035 lt!183230 lt!183225))))

(declare-fun lt!183231 () tuple2!6496)

(assert (=> b!389589 (= lt!183230 (+!1035 lt!183228 lt!183231))))

(assert (=> b!389589 (= lt!183229 lt!183226)))

(assert (=> b!389589 (= lt!183226 (+!1035 lt!183219 lt!183225))))

(assert (=> b!389589 (= lt!183219 (+!1035 lt!183222 lt!183231))))

(assert (=> b!389589 (= lt!183218 (+!1035 (+!1035 lt!183224 lt!183231) lt!183225))))

(assert (=> b!389589 (= lt!183225 (tuple2!6497 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!389589 (= lt!183231 (tuple2!6497 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapNonEmpty!15987 () Bool)

(declare-fun tp!31568 () Bool)

(assert (=> mapNonEmpty!15987 (= mapRes!15987 (and tp!31568 e!236009))))

(declare-fun mapRest!15987 () (Array (_ BitVec 32) ValueCell!4460))

(declare-fun mapValue!15987 () ValueCell!4460)

(declare-fun mapKey!15987 () (_ BitVec 32))

(assert (=> mapNonEmpty!15987 (= (arr!11015 _values!506) (store mapRest!15987 mapKey!15987 mapValue!15987))))

(declare-fun b!389590 () Bool)

(assert (=> b!389590 (= e!236015 e!236012)))

(declare-fun res!222860 () Bool)

(assert (=> b!389590 (=> (not res!222860) (not e!236012))))

(assert (=> b!389590 (= res!222860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!183221 mask!970))))

(assert (=> b!389590 (= lt!183221 (array!23100 (store (arr!11014 _keys!658) i!548 k0!778) (size!11367 _keys!658)))))

(declare-fun mapIsEmpty!15987 () Bool)

(assert (=> mapIsEmpty!15987 mapRes!15987))

(assert (= (and start!37908 res!222868) b!389580))

(assert (= (and b!389580 res!222864) b!389582))

(assert (= (and b!389582 res!222867) b!389588))

(assert (= (and b!389588 res!222869) b!389583))

(assert (= (and b!389583 res!222866) b!389577))

(assert (= (and b!389577 res!222871) b!389587))

(assert (= (and b!389587 res!222862) b!389576))

(assert (= (and b!389576 res!222861) b!389590))

(assert (= (and b!389590 res!222860) b!389586))

(assert (= (and b!389586 res!222870) b!389578))

(assert (= (and b!389578 (not res!222863)) b!389589))

(assert (= (and b!389589 (not res!222865)) b!389585))

(assert (= (and b!389581 condMapEmpty!15987) mapIsEmpty!15987))

(assert (= (and b!389581 (not condMapEmpty!15987)) mapNonEmpty!15987))

(get-info :version)

(assert (= (and mapNonEmpty!15987 ((_ is ValueCellFull!4460) mapValue!15987)) b!389579))

(assert (= (and b!389581 ((_ is ValueCellFull!4460) mapDefault!15987)) b!389584))

(assert (= start!37908 b!389581))

(declare-fun m!385315 () Bool)

(assert (=> b!389586 m!385315))

(declare-fun m!385317 () Bool)

(assert (=> b!389588 m!385317))

(declare-fun m!385319 () Bool)

(assert (=> b!389576 m!385319))

(declare-fun m!385321 () Bool)

(assert (=> b!389582 m!385321))

(declare-fun m!385323 () Bool)

(assert (=> b!389577 m!385323))

(declare-fun m!385325 () Bool)

(assert (=> b!389589 m!385325))

(declare-fun m!385327 () Bool)

(assert (=> b!389589 m!385327))

(declare-fun m!385329 () Bool)

(assert (=> b!389589 m!385329))

(declare-fun m!385331 () Bool)

(assert (=> b!389589 m!385331))

(declare-fun m!385333 () Bool)

(assert (=> b!389589 m!385333))

(declare-fun m!385335 () Bool)

(assert (=> b!389589 m!385335))

(assert (=> b!389589 m!385325))

(declare-fun m!385337 () Bool)

(assert (=> b!389589 m!385337))

(declare-fun m!385339 () Bool)

(assert (=> b!389589 m!385339))

(declare-fun m!385341 () Bool)

(assert (=> b!389585 m!385341))

(declare-fun m!385343 () Bool)

(assert (=> b!389585 m!385343))

(declare-fun m!385345 () Bool)

(assert (=> b!389585 m!385345))

(declare-fun m!385347 () Bool)

(assert (=> b!389590 m!385347))

(declare-fun m!385349 () Bool)

(assert (=> b!389590 m!385349))

(declare-fun m!385351 () Bool)

(assert (=> b!389587 m!385351))

(declare-fun m!385353 () Bool)

(assert (=> mapNonEmpty!15987 m!385353))

(declare-fun m!385355 () Bool)

(assert (=> start!37908 m!385355))

(declare-fun m!385357 () Bool)

(assert (=> start!37908 m!385357))

(declare-fun m!385359 () Bool)

(assert (=> start!37908 m!385359))

(declare-fun m!385361 () Bool)

(assert (=> b!389578 m!385361))

(declare-fun m!385363 () Bool)

(assert (=> b!389578 m!385363))

(declare-fun m!385365 () Bool)

(assert (=> b!389578 m!385365))

(declare-fun m!385367 () Bool)

(assert (=> b!389578 m!385367))

(declare-fun m!385369 () Bool)

(assert (=> b!389578 m!385369))

(declare-fun m!385371 () Bool)

(assert (=> b!389578 m!385371))

(declare-fun m!385373 () Bool)

(assert (=> b!389578 m!385373))

(check-sat (not b!389577) (not mapNonEmpty!15987) (not b!389589) (not b!389585) (not b!389590) (not b!389576) (not b!389578) (not start!37908) (not b!389582) (not b!389588) tp_is_empty!9607 (not b!389586) b_and!16199 (not b_next!8935))
(check-sat b_and!16199 (not b_next!8935))
