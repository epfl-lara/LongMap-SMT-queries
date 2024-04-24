; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37908 () Bool)

(assert start!37908)

(declare-fun b_free!8935 () Bool)

(declare-fun b_next!8935 () Bool)

(assert (=> start!37908 (= b_free!8935 (not b_next!8935))))

(declare-fun tp!31568 () Bool)

(declare-fun b_and!16239 () Bool)

(assert (=> start!37908 (= tp!31568 b_and!16239)))

(declare-fun b!389798 () Bool)

(declare-fun e!236153 () Bool)

(declare-fun e!236157 () Bool)

(declare-fun mapRes!15987 () Bool)

(assert (=> b!389798 (= e!236153 (and e!236157 mapRes!15987))))

(declare-fun condMapEmpty!15987 () Bool)

(declare-datatypes ((V!13915 0))(
  ( (V!13916 (val!4848 Int)) )
))
(declare-datatypes ((ValueCell!4460 0))(
  ( (ValueCellFull!4460 (v!7062 V!13915)) (EmptyCell!4460) )
))
(declare-datatypes ((array!23098 0))(
  ( (array!23099 (arr!11013 (Array (_ BitVec 32) ValueCell!4460)) (size!11365 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23098)

(declare-fun mapDefault!15987 () ValueCell!4460)

(assert (=> b!389798 (= condMapEmpty!15987 (= (arr!11013 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4460)) mapDefault!15987)))))

(declare-fun b!389799 () Bool)

(declare-fun res!222990 () Bool)

(declare-fun e!236158 () Bool)

(assert (=> b!389799 (=> (not res!222990) (not e!236158))))

(declare-datatypes ((array!23100 0))(
  ( (array!23101 (arr!11014 (Array (_ BitVec 32) (_ BitVec 64))) (size!11366 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23100)

(declare-datatypes ((List!6238 0))(
  ( (Nil!6235) (Cons!6234 (h!7090 (_ BitVec 64)) (t!11388 List!6238)) )
))
(declare-fun arrayNoDuplicates!0 (array!23100 (_ BitVec 32) List!6238) Bool)

(assert (=> b!389799 (= res!222990 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6235))))

(declare-fun res!222994 () Bool)

(assert (=> start!37908 (=> (not res!222994) (not e!236158))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37908 (= res!222994 (validMask!0 mask!970))))

(assert (=> start!37908 e!236158))

(declare-fun array_inv!8144 (array!23098) Bool)

(assert (=> start!37908 (and (array_inv!8144 _values!506) e!236153)))

(assert (=> start!37908 tp!31568))

(assert (=> start!37908 true))

(declare-fun tp_is_empty!9607 () Bool)

(assert (=> start!37908 tp_is_empty!9607))

(declare-fun array_inv!8145 (array!23100) Bool)

(assert (=> start!37908 (array_inv!8145 _keys!658)))

(declare-fun b!389800 () Bool)

(declare-fun res!222987 () Bool)

(declare-fun e!236152 () Bool)

(assert (=> b!389800 (=> (not res!222987) (not e!236152))))

(declare-fun lt!183479 () array!23100)

(assert (=> b!389800 (= res!222987 (arrayNoDuplicates!0 lt!183479 #b00000000000000000000000000000000 Nil!6235))))

(declare-fun b!389801 () Bool)

(declare-fun res!222997 () Bool)

(assert (=> b!389801 (=> (not res!222997) (not e!236158))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!389801 (= res!222997 (and (= (size!11365 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11366 _keys!658) (size!11365 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!389802 () Bool)

(declare-fun e!236156 () Bool)

(assert (=> b!389802 (= e!236156 tp_is_empty!9607)))

(declare-fun b!389803 () Bool)

(declare-fun res!222991 () Bool)

(assert (=> b!389803 (=> (not res!222991) (not e!236158))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23100 (_ BitVec 32)) Bool)

(assert (=> b!389803 (= res!222991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!389804 () Bool)

(declare-fun res!222993 () Bool)

(assert (=> b!389804 (=> (not res!222993) (not e!236158))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!389804 (= res!222993 (or (= (select (arr!11014 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11014 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!389805 () Bool)

(declare-fun res!222995 () Bool)

(assert (=> b!389805 (=> (not res!222995) (not e!236158))))

(assert (=> b!389805 (= res!222995 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11366 _keys!658))))))

(declare-fun mapIsEmpty!15987 () Bool)

(assert (=> mapIsEmpty!15987 mapRes!15987))

(declare-fun mapNonEmpty!15987 () Bool)

(declare-fun tp!31569 () Bool)

(assert (=> mapNonEmpty!15987 (= mapRes!15987 (and tp!31569 e!236156))))

(declare-fun mapValue!15987 () ValueCell!4460)

(declare-fun mapKey!15987 () (_ BitVec 32))

(declare-fun mapRest!15987 () (Array (_ BitVec 32) ValueCell!4460))

(assert (=> mapNonEmpty!15987 (= (arr!11013 _values!506) (store mapRest!15987 mapKey!15987 mapValue!15987))))

(declare-fun b!389806 () Bool)

(assert (=> b!389806 (= e!236157 tp_is_empty!9607)))

(declare-fun b!389807 () Bool)

(assert (=> b!389807 (= e!236158 e!236152)))

(declare-fun res!222992 () Bool)

(assert (=> b!389807 (=> (not res!222992) (not e!236152))))

(assert (=> b!389807 (= res!222992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!183479 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!389807 (= lt!183479 (array!23101 (store (arr!11014 _keys!658) i!548 k0!778) (size!11366 _keys!658)))))

(declare-fun b!389808 () Bool)

(declare-fun res!222989 () Bool)

(assert (=> b!389808 (=> (not res!222989) (not e!236158))))

(declare-fun arrayContainsKey!0 (array!23100 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!389808 (= res!222989 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!389809 () Bool)

(declare-fun res!222996 () Bool)

(assert (=> b!389809 (=> (not res!222996) (not e!236158))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!389809 (= res!222996 (validKeyInArray!0 k0!778))))

(declare-fun b!389810 () Bool)

(declare-fun e!236151 () Bool)

(assert (=> b!389810 (= e!236152 (not e!236151))))

(declare-fun res!222986 () Bool)

(assert (=> b!389810 (=> res!222986 e!236151)))

(assert (=> b!389810 (= res!222986 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6386 0))(
  ( (tuple2!6387 (_1!3204 (_ BitVec 64)) (_2!3204 V!13915)) )
))
(declare-datatypes ((List!6239 0))(
  ( (Nil!6236) (Cons!6235 (h!7091 tuple2!6386) (t!11389 List!6239)) )
))
(declare-datatypes ((ListLongMap!5301 0))(
  ( (ListLongMap!5302 (toList!2666 List!6239)) )
))
(declare-fun lt!183468 () ListLongMap!5301)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13915)

(declare-fun minValue!472 () V!13915)

(declare-fun getCurrentListMap!2050 (array!23100 array!23098 (_ BitVec 32) (_ BitVec 32) V!13915 V!13915 (_ BitVec 32) Int) ListLongMap!5301)

(assert (=> b!389810 (= lt!183468 (getCurrentListMap!2050 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183472 () ListLongMap!5301)

(declare-fun lt!183478 () array!23098)

(assert (=> b!389810 (= lt!183472 (getCurrentListMap!2050 lt!183479 lt!183478 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183482 () ListLongMap!5301)

(declare-fun lt!183481 () ListLongMap!5301)

(assert (=> b!389810 (and (= lt!183482 lt!183481) (= lt!183481 lt!183482))))

(declare-fun lt!183483 () ListLongMap!5301)

(declare-fun lt!183475 () tuple2!6386)

(declare-fun +!1020 (ListLongMap!5301 tuple2!6386) ListLongMap!5301)

(assert (=> b!389810 (= lt!183481 (+!1020 lt!183483 lt!183475))))

(declare-fun v!373 () V!13915)

(assert (=> b!389810 (= lt!183475 (tuple2!6387 k0!778 v!373))))

(declare-datatypes ((Unit!11911 0))(
  ( (Unit!11912) )
))
(declare-fun lt!183477 () Unit!11911)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!241 (array!23100 array!23098 (_ BitVec 32) (_ BitVec 32) V!13915 V!13915 (_ BitVec 32) (_ BitVec 64) V!13915 (_ BitVec 32) Int) Unit!11911)

(assert (=> b!389810 (= lt!183477 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!241 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!939 (array!23100 array!23098 (_ BitVec 32) (_ BitVec 32) V!13915 V!13915 (_ BitVec 32) Int) ListLongMap!5301)

(assert (=> b!389810 (= lt!183482 (getCurrentListMapNoExtraKeys!939 lt!183479 lt!183478 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!389810 (= lt!183478 (array!23099 (store (arr!11013 _values!506) i!548 (ValueCellFull!4460 v!373)) (size!11365 _values!506)))))

(assert (=> b!389810 (= lt!183483 (getCurrentListMapNoExtraKeys!939 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!389811 () Bool)

(declare-fun e!236155 () Bool)

(assert (=> b!389811 (= e!236151 e!236155)))

(declare-fun res!222988 () Bool)

(assert (=> b!389811 (=> res!222988 e!236155)))

(assert (=> b!389811 (= res!222988 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!183473 () ListLongMap!5301)

(declare-fun lt!183470 () ListLongMap!5301)

(assert (=> b!389811 (= lt!183473 lt!183470)))

(declare-fun lt!183480 () ListLongMap!5301)

(assert (=> b!389811 (= lt!183470 (+!1020 lt!183480 lt!183475))))

(declare-fun lt!183474 () Unit!11911)

(declare-fun addCommutativeForDiffKeys!333 (ListLongMap!5301 (_ BitVec 64) V!13915 (_ BitVec 64) V!13915) Unit!11911)

(assert (=> b!389811 (= lt!183474 (addCommutativeForDiffKeys!333 lt!183483 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!183469 () tuple2!6386)

(assert (=> b!389811 (= lt!183472 (+!1020 lt!183473 lt!183469))))

(declare-fun lt!183484 () tuple2!6386)

(assert (=> b!389811 (= lt!183473 (+!1020 lt!183481 lt!183484))))

(declare-fun lt!183476 () ListLongMap!5301)

(assert (=> b!389811 (= lt!183468 lt!183476)))

(assert (=> b!389811 (= lt!183476 (+!1020 lt!183480 lt!183469))))

(assert (=> b!389811 (= lt!183480 (+!1020 lt!183483 lt!183484))))

(assert (=> b!389811 (= lt!183472 (+!1020 (+!1020 lt!183482 lt!183484) lt!183469))))

(assert (=> b!389811 (= lt!183469 (tuple2!6387 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!389811 (= lt!183484 (tuple2!6387 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!389812 () Bool)

(assert (=> b!389812 (= e!236155 true)))

(assert (=> b!389812 (= (+!1020 lt!183470 lt!183469) (+!1020 lt!183476 lt!183475))))

(declare-fun lt!183471 () Unit!11911)

(assert (=> b!389812 (= lt!183471 (addCommutativeForDiffKeys!333 lt!183480 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (= (and start!37908 res!222994) b!389801))

(assert (= (and b!389801 res!222997) b!389803))

(assert (= (and b!389803 res!222991) b!389799))

(assert (= (and b!389799 res!222990) b!389805))

(assert (= (and b!389805 res!222995) b!389809))

(assert (= (and b!389809 res!222996) b!389804))

(assert (= (and b!389804 res!222993) b!389808))

(assert (= (and b!389808 res!222989) b!389807))

(assert (= (and b!389807 res!222992) b!389800))

(assert (= (and b!389800 res!222987) b!389810))

(assert (= (and b!389810 (not res!222986)) b!389811))

(assert (= (and b!389811 (not res!222988)) b!389812))

(assert (= (and b!389798 condMapEmpty!15987) mapIsEmpty!15987))

(assert (= (and b!389798 (not condMapEmpty!15987)) mapNonEmpty!15987))

(get-info :version)

(assert (= (and mapNonEmpty!15987 ((_ is ValueCellFull!4460) mapValue!15987)) b!389802))

(assert (= (and b!389798 ((_ is ValueCellFull!4460) mapDefault!15987)) b!389806))

(assert (= start!37908 b!389798))

(declare-fun m!386269 () Bool)

(assert (=> b!389810 m!386269))

(declare-fun m!386271 () Bool)

(assert (=> b!389810 m!386271))

(declare-fun m!386273 () Bool)

(assert (=> b!389810 m!386273))

(declare-fun m!386275 () Bool)

(assert (=> b!389810 m!386275))

(declare-fun m!386277 () Bool)

(assert (=> b!389810 m!386277))

(declare-fun m!386279 () Bool)

(assert (=> b!389810 m!386279))

(declare-fun m!386281 () Bool)

(assert (=> b!389810 m!386281))

(declare-fun m!386283 () Bool)

(assert (=> start!37908 m!386283))

(declare-fun m!386285 () Bool)

(assert (=> start!37908 m!386285))

(declare-fun m!386287 () Bool)

(assert (=> start!37908 m!386287))

(declare-fun m!386289 () Bool)

(assert (=> b!389804 m!386289))

(declare-fun m!386291 () Bool)

(assert (=> mapNonEmpty!15987 m!386291))

(declare-fun m!386293 () Bool)

(assert (=> b!389811 m!386293))

(declare-fun m!386295 () Bool)

(assert (=> b!389811 m!386295))

(declare-fun m!386297 () Bool)

(assert (=> b!389811 m!386297))

(declare-fun m!386299 () Bool)

(assert (=> b!389811 m!386299))

(declare-fun m!386301 () Bool)

(assert (=> b!389811 m!386301))

(declare-fun m!386303 () Bool)

(assert (=> b!389811 m!386303))

(declare-fun m!386305 () Bool)

(assert (=> b!389811 m!386305))

(declare-fun m!386307 () Bool)

(assert (=> b!389811 m!386307))

(assert (=> b!389811 m!386295))

(declare-fun m!386309 () Bool)

(assert (=> b!389799 m!386309))

(declare-fun m!386311 () Bool)

(assert (=> b!389807 m!386311))

(declare-fun m!386313 () Bool)

(assert (=> b!389807 m!386313))

(declare-fun m!386315 () Bool)

(assert (=> b!389800 m!386315))

(declare-fun m!386317 () Bool)

(assert (=> b!389809 m!386317))

(declare-fun m!386319 () Bool)

(assert (=> b!389808 m!386319))

(declare-fun m!386321 () Bool)

(assert (=> b!389803 m!386321))

(declare-fun m!386323 () Bool)

(assert (=> b!389812 m!386323))

(declare-fun m!386325 () Bool)

(assert (=> b!389812 m!386325))

(declare-fun m!386327 () Bool)

(assert (=> b!389812 m!386327))

(check-sat (not start!37908) (not b!389809) (not b!389808) (not b!389800) (not b!389811) (not b_next!8935) tp_is_empty!9607 b_and!16239 (not b!389799) (not mapNonEmpty!15987) (not b!389812) (not b!389803) (not b!389807) (not b!389810))
(check-sat b_and!16239 (not b_next!8935))
