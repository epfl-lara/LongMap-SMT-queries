; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39248 () Bool)

(assert start!39248)

(declare-fun b_free!9529 () Bool)

(declare-fun b_next!9529 () Bool)

(assert (=> start!39248 (= b_free!9529 (not b_next!9529))))

(declare-fun tp!34116 () Bool)

(declare-fun b_and!16947 () Bool)

(assert (=> start!39248 (= tp!34116 b_and!16947)))

(declare-fun b!414844 () Bool)

(declare-fun res!241300 () Bool)

(declare-fun e!247862 () Bool)

(assert (=> b!414844 (=> (not res!241300) (not e!247862))))

(declare-datatypes ((array!25222 0))(
  ( (array!25223 (arr!12060 (Array (_ BitVec 32) (_ BitVec 64))) (size!12412 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25222)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15347 0))(
  ( (V!15348 (val!5385 Int)) )
))
(declare-datatypes ((ValueCell!4997 0))(
  ( (ValueCellFull!4997 (v!7633 V!15347)) (EmptyCell!4997) )
))
(declare-datatypes ((array!25224 0))(
  ( (array!25225 (arr!12061 (Array (_ BitVec 32) ValueCell!4997)) (size!12413 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25224)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!414844 (= res!241300 (and (= (size!12413 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12412 _keys!709) (size!12413 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!414845 () Bool)

(declare-fun e!247861 () Bool)

(assert (=> b!414845 (= e!247861 true)))

(declare-fun minValue!515 () V!15347)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!190137 () array!25222)

(declare-fun zeroValue!515 () V!15347)

(declare-datatypes ((tuple2!6882 0))(
  ( (tuple2!6883 (_1!3452 (_ BitVec 64)) (_2!3452 V!15347)) )
))
(declare-datatypes ((List!6902 0))(
  ( (Nil!6899) (Cons!6898 (h!7754 tuple2!6882) (t!12088 List!6902)) )
))
(declare-datatypes ((ListLongMap!5797 0))(
  ( (ListLongMap!5798 (toList!2914 List!6902)) )
))
(declare-fun lt!190135 () ListLongMap!5797)

(declare-fun lt!190134 () array!25224)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun +!1189 (ListLongMap!5797 tuple2!6882) ListLongMap!5797)

(declare-fun getCurrentListMapNoExtraKeys!1163 (array!25222 array!25224 (_ BitVec 32) (_ BitVec 32) V!15347 V!15347 (_ BitVec 32) Int) ListLongMap!5797)

(declare-fun get!5955 (ValueCell!4997 V!15347) V!15347)

(declare-fun dynLambda!658 (Int (_ BitVec 64)) V!15347)

(assert (=> b!414845 (= lt!190135 (+!1189 (getCurrentListMapNoExtraKeys!1163 lt!190137 lt!190134 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!6883 (select (arr!12060 lt!190137) from!863) (get!5955 (select (arr!12061 lt!190134) from!863) (dynLambda!658 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!241292 () Bool)

(assert (=> start!39248 (=> (not res!241292) (not e!247862))))

(assert (=> start!39248 (= res!241292 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12412 _keys!709))))))

(assert (=> start!39248 e!247862))

(declare-fun tp_is_empty!10681 () Bool)

(assert (=> start!39248 tp_is_empty!10681))

(assert (=> start!39248 tp!34116))

(assert (=> start!39248 true))

(declare-fun e!247864 () Bool)

(declare-fun array_inv!8878 (array!25224) Bool)

(assert (=> start!39248 (and (array_inv!8878 _values!549) e!247864)))

(declare-fun array_inv!8879 (array!25222) Bool)

(assert (=> start!39248 (array_inv!8879 _keys!709)))

(declare-fun b!414846 () Bool)

(declare-fun e!247867 () Bool)

(declare-fun call!28753 () ListLongMap!5797)

(declare-fun call!28752 () ListLongMap!5797)

(assert (=> b!414846 (= e!247867 (= call!28753 call!28752))))

(declare-fun b!414847 () Bool)

(declare-fun res!241289 () Bool)

(declare-fun e!247866 () Bool)

(assert (=> b!414847 (=> (not res!241289) (not e!247866))))

(declare-datatypes ((List!6903 0))(
  ( (Nil!6900) (Cons!6899 (h!7755 (_ BitVec 64)) (t!12089 List!6903)) )
))
(declare-fun arrayNoDuplicates!0 (array!25222 (_ BitVec 32) List!6903) Bool)

(assert (=> b!414847 (= res!241289 (arrayNoDuplicates!0 lt!190137 #b00000000000000000000000000000000 Nil!6900))))

(declare-fun b!414848 () Bool)

(declare-fun res!241297 () Bool)

(assert (=> b!414848 (=> (not res!241297) (not e!247862))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25222 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!414848 (= res!241297 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!414849 () Bool)

(declare-fun res!241290 () Bool)

(assert (=> b!414849 (=> (not res!241290) (not e!247862))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!414849 (= res!241290 (or (= (select (arr!12060 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12060 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun c!54984 () Bool)

(declare-fun bm!28749 () Bool)

(assert (=> bm!28749 (= call!28753 (getCurrentListMapNoExtraKeys!1163 (ite c!54984 _keys!709 lt!190137) (ite c!54984 _values!549 lt!190134) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414850 () Bool)

(declare-fun res!241298 () Bool)

(assert (=> b!414850 (=> (not res!241298) (not e!247862))))

(assert (=> b!414850 (= res!241298 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6900))))

(declare-fun b!414851 () Bool)

(declare-fun e!247860 () Bool)

(assert (=> b!414851 (= e!247860 tp_is_empty!10681)))

(declare-fun b!414852 () Bool)

(declare-fun e!247863 () Bool)

(assert (=> b!414852 (= e!247863 tp_is_empty!10681)))

(declare-fun b!414853 () Bool)

(declare-fun e!247859 () Bool)

(assert (=> b!414853 (= e!247859 (not e!247861))))

(declare-fun res!241295 () Bool)

(assert (=> b!414853 (=> res!241295 e!247861)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!414853 (= res!241295 (validKeyInArray!0 (select (arr!12060 _keys!709) from!863)))))

(assert (=> b!414853 e!247867))

(assert (=> b!414853 (= c!54984 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun v!412 () V!15347)

(declare-datatypes ((Unit!12261 0))(
  ( (Unit!12262) )
))
(declare-fun lt!190136 () Unit!12261)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!398 (array!25222 array!25224 (_ BitVec 32) (_ BitVec 32) V!15347 V!15347 (_ BitVec 32) (_ BitVec 64) V!15347 (_ BitVec 32) Int) Unit!12261)

(assert (=> b!414853 (= lt!190136 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!398 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414854 () Bool)

(declare-fun res!241293 () Bool)

(assert (=> b!414854 (=> (not res!241293) (not e!247862))))

(assert (=> b!414854 (= res!241293 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12412 _keys!709))))))

(declare-fun b!414855 () Bool)

(assert (=> b!414855 (= e!247867 (= call!28752 (+!1189 call!28753 (tuple2!6883 k0!794 v!412))))))

(declare-fun b!414856 () Bool)

(assert (=> b!414856 (= e!247862 e!247866)))

(declare-fun res!241299 () Bool)

(assert (=> b!414856 (=> (not res!241299) (not e!247866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25222 (_ BitVec 32)) Bool)

(assert (=> b!414856 (= res!241299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190137 mask!1025))))

(assert (=> b!414856 (= lt!190137 (array!25223 (store (arr!12060 _keys!709) i!563 k0!794) (size!12412 _keys!709)))))

(declare-fun mapNonEmpty!17643 () Bool)

(declare-fun mapRes!17643 () Bool)

(declare-fun tp!34115 () Bool)

(assert (=> mapNonEmpty!17643 (= mapRes!17643 (and tp!34115 e!247863))))

(declare-fun mapValue!17643 () ValueCell!4997)

(declare-fun mapKey!17643 () (_ BitVec 32))

(declare-fun mapRest!17643 () (Array (_ BitVec 32) ValueCell!4997))

(assert (=> mapNonEmpty!17643 (= (arr!12061 _values!549) (store mapRest!17643 mapKey!17643 mapValue!17643))))

(declare-fun b!414857 () Bool)

(assert (=> b!414857 (= e!247866 e!247859)))

(declare-fun res!241296 () Bool)

(assert (=> b!414857 (=> (not res!241296) (not e!247859))))

(assert (=> b!414857 (= res!241296 (= from!863 i!563))))

(assert (=> b!414857 (= lt!190135 (getCurrentListMapNoExtraKeys!1163 lt!190137 lt!190134 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!414857 (= lt!190134 (array!25225 (store (arr!12061 _values!549) i!563 (ValueCellFull!4997 v!412)) (size!12413 _values!549)))))

(declare-fun lt!190133 () ListLongMap!5797)

(assert (=> b!414857 (= lt!190133 (getCurrentListMapNoExtraKeys!1163 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!414858 () Bool)

(declare-fun res!241291 () Bool)

(assert (=> b!414858 (=> (not res!241291) (not e!247862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!414858 (= res!241291 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!17643 () Bool)

(assert (=> mapIsEmpty!17643 mapRes!17643))

(declare-fun b!414859 () Bool)

(declare-fun res!241302 () Bool)

(assert (=> b!414859 (=> (not res!241302) (not e!247866))))

(assert (=> b!414859 (= res!241302 (bvsle from!863 i!563))))

(declare-fun b!414860 () Bool)

(assert (=> b!414860 (= e!247864 (and e!247860 mapRes!17643))))

(declare-fun condMapEmpty!17643 () Bool)

(declare-fun mapDefault!17643 () ValueCell!4997)

(assert (=> b!414860 (= condMapEmpty!17643 (= (arr!12061 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4997)) mapDefault!17643)))))

(declare-fun b!414861 () Bool)

(declare-fun res!241301 () Bool)

(assert (=> b!414861 (=> (not res!241301) (not e!247862))))

(assert (=> b!414861 (= res!241301 (validKeyInArray!0 k0!794))))

(declare-fun bm!28750 () Bool)

(assert (=> bm!28750 (= call!28752 (getCurrentListMapNoExtraKeys!1163 (ite c!54984 lt!190137 _keys!709) (ite c!54984 lt!190134 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414862 () Bool)

(declare-fun res!241294 () Bool)

(assert (=> b!414862 (=> (not res!241294) (not e!247862))))

(assert (=> b!414862 (= res!241294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!39248 res!241292) b!414858))

(assert (= (and b!414858 res!241291) b!414844))

(assert (= (and b!414844 res!241300) b!414862))

(assert (= (and b!414862 res!241294) b!414850))

(assert (= (and b!414850 res!241298) b!414854))

(assert (= (and b!414854 res!241293) b!414861))

(assert (= (and b!414861 res!241301) b!414849))

(assert (= (and b!414849 res!241290) b!414848))

(assert (= (and b!414848 res!241297) b!414856))

(assert (= (and b!414856 res!241299) b!414847))

(assert (= (and b!414847 res!241289) b!414859))

(assert (= (and b!414859 res!241302) b!414857))

(assert (= (and b!414857 res!241296) b!414853))

(assert (= (and b!414853 c!54984) b!414855))

(assert (= (and b!414853 (not c!54984)) b!414846))

(assert (= (or b!414855 b!414846) bm!28750))

(assert (= (or b!414855 b!414846) bm!28749))

(assert (= (and b!414853 (not res!241295)) b!414845))

(assert (= (and b!414860 condMapEmpty!17643) mapIsEmpty!17643))

(assert (= (and b!414860 (not condMapEmpty!17643)) mapNonEmpty!17643))

(get-info :version)

(assert (= (and mapNonEmpty!17643 ((_ is ValueCellFull!4997) mapValue!17643)) b!414852))

(assert (= (and b!414860 ((_ is ValueCellFull!4997) mapDefault!17643)) b!414851))

(assert (= start!39248 b!414860))

(declare-fun b_lambda!8855 () Bool)

(assert (=> (not b_lambda!8855) (not b!414845)))

(declare-fun t!12087 () Bool)

(declare-fun tb!3143 () Bool)

(assert (=> (and start!39248 (= defaultEntry!557 defaultEntry!557) t!12087) tb!3143))

(declare-fun result!5821 () Bool)

(assert (=> tb!3143 (= result!5821 tp_is_empty!10681)))

(assert (=> b!414845 t!12087))

(declare-fun b_and!16949 () Bool)

(assert (= b_and!16947 (and (=> t!12087 result!5821) b_and!16949)))

(declare-fun m!404307 () Bool)

(assert (=> b!414857 m!404307))

(declare-fun m!404309 () Bool)

(assert (=> b!414857 m!404309))

(declare-fun m!404311 () Bool)

(assert (=> b!414857 m!404311))

(declare-fun m!404313 () Bool)

(assert (=> b!414858 m!404313))

(declare-fun m!404315 () Bool)

(assert (=> mapNonEmpty!17643 m!404315))

(declare-fun m!404317 () Bool)

(assert (=> b!414855 m!404317))

(declare-fun m!404319 () Bool)

(assert (=> b!414856 m!404319))

(declare-fun m!404321 () Bool)

(assert (=> b!414856 m!404321))

(declare-fun m!404323 () Bool)

(assert (=> b!414845 m!404323))

(declare-fun m!404325 () Bool)

(assert (=> b!414845 m!404325))

(assert (=> b!414845 m!404323))

(declare-fun m!404327 () Bool)

(assert (=> b!414845 m!404327))

(declare-fun m!404329 () Bool)

(assert (=> b!414845 m!404329))

(declare-fun m!404331 () Bool)

(assert (=> b!414845 m!404331))

(assert (=> b!414845 m!404327))

(declare-fun m!404333 () Bool)

(assert (=> b!414845 m!404333))

(assert (=> b!414845 m!404331))

(declare-fun m!404335 () Bool)

(assert (=> start!39248 m!404335))

(declare-fun m!404337 () Bool)

(assert (=> start!39248 m!404337))

(declare-fun m!404339 () Bool)

(assert (=> bm!28750 m!404339))

(declare-fun m!404341 () Bool)

(assert (=> b!414853 m!404341))

(assert (=> b!414853 m!404341))

(declare-fun m!404343 () Bool)

(assert (=> b!414853 m!404343))

(declare-fun m!404345 () Bool)

(assert (=> b!414853 m!404345))

(declare-fun m!404347 () Bool)

(assert (=> b!414849 m!404347))

(declare-fun m!404349 () Bool)

(assert (=> b!414848 m!404349))

(declare-fun m!404351 () Bool)

(assert (=> bm!28749 m!404351))

(declare-fun m!404353 () Bool)

(assert (=> b!414850 m!404353))

(declare-fun m!404355 () Bool)

(assert (=> b!414847 m!404355))

(declare-fun m!404357 () Bool)

(assert (=> b!414861 m!404357))

(declare-fun m!404359 () Bool)

(assert (=> b!414862 m!404359))

(check-sat b_and!16949 (not bm!28750) (not bm!28749) (not b!414855) tp_is_empty!10681 (not b!414845) (not b_lambda!8855) (not b_next!9529) (not start!39248) (not b!414847) (not b!414861) (not b!414858) (not b!414850) (not mapNonEmpty!17643) (not b!414862) (not b!414857) (not b!414853) (not b!414856) (not b!414848))
(check-sat b_and!16949 (not b_next!9529))
