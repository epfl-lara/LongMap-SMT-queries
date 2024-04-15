; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39494 () Bool)

(assert start!39494)

(declare-fun b_free!9775 () Bool)

(declare-fun b_next!9775 () Bool)

(assert (=> start!39494 (= b_free!9775 (not b_next!9775))))

(declare-fun tp!34854 () Bool)

(declare-fun b_and!17399 () Bool)

(assert (=> start!39494 (= tp!34854 b_and!17399)))

(declare-fun mapIsEmpty!18012 () Bool)

(declare-fun mapRes!18012 () Bool)

(assert (=> mapIsEmpty!18012 mapRes!18012))

(declare-fun b!421879 () Bool)

(declare-fun e!251038 () Bool)

(declare-fun tp_is_empty!10927 () Bool)

(assert (=> b!421879 (= e!251038 tp_is_empty!10927)))

(declare-fun b!421880 () Bool)

(declare-fun e!251042 () Bool)

(declare-fun e!251046 () Bool)

(assert (=> b!421880 (= e!251042 (and e!251046 mapRes!18012))))

(declare-fun condMapEmpty!18012 () Bool)

(declare-datatypes ((V!15675 0))(
  ( (V!15676 (val!5508 Int)) )
))
(declare-datatypes ((ValueCell!5120 0))(
  ( (ValueCellFull!5120 (v!7749 V!15675)) (EmptyCell!5120) )
))
(declare-datatypes ((array!25683 0))(
  ( (array!25684 (arr!12291 (Array (_ BitVec 32) ValueCell!5120)) (size!12644 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25683)

(declare-fun mapDefault!18012 () ValueCell!5120)

(assert (=> b!421880 (= condMapEmpty!18012 (= (arr!12291 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5120)) mapDefault!18012)))))

(declare-datatypes ((tuple2!7216 0))(
  ( (tuple2!7217 (_1!3619 (_ BitVec 64)) (_2!3619 V!15675)) )
))
(declare-datatypes ((List!7206 0))(
  ( (Nil!7203) (Cons!7202 (h!8058 tuple2!7216) (t!12637 List!7206)) )
))
(declare-datatypes ((ListLongMap!6119 0))(
  ( (ListLongMap!6120 (toList!3075 List!7206)) )
))
(declare-fun call!29479 () ListLongMap!6119)

(declare-fun call!29478 () ListLongMap!6119)

(declare-fun e!251041 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun b!421881 () Bool)

(declare-fun v!412 () V!15675)

(declare-fun +!1295 (ListLongMap!6119 tuple2!7216) ListLongMap!6119)

(assert (=> b!421881 (= e!251041 (= call!29479 (+!1295 call!29478 (tuple2!7217 k0!794 v!412))))))

(declare-fun b!421882 () Bool)

(declare-fun res!246334 () Bool)

(declare-fun e!251039 () Bool)

(assert (=> b!421882 (=> (not res!246334) (not e!251039))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!25685 0))(
  ( (array!25686 (arr!12292 (Array (_ BitVec 32) (_ BitVec 64))) (size!12645 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25685)

(assert (=> b!421882 (= res!246334 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12645 _keys!709))))))

(declare-fun b!421883 () Bool)

(declare-fun res!246342 () Bool)

(assert (=> b!421883 (=> (not res!246342) (not e!251039))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!421883 (= res!246342 (and (= (size!12644 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12645 _keys!709) (size!12644 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun minValue!515 () V!15675)

(declare-fun c!55305 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun bm!29475 () Bool)

(declare-fun zeroValue!515 () V!15675)

(declare-fun lt!193633 () array!25685)

(declare-fun lt!193637 () array!25683)

(declare-fun getCurrentListMapNoExtraKeys!1284 (array!25685 array!25683 (_ BitVec 32) (_ BitVec 32) V!15675 V!15675 (_ BitVec 32) Int) ListLongMap!6119)

(assert (=> bm!29475 (= call!29479 (getCurrentListMapNoExtraKeys!1284 (ite c!55305 lt!193633 _keys!709) (ite c!55305 lt!193637 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421884 () Bool)

(declare-fun res!246332 () Bool)

(assert (=> b!421884 (=> (not res!246332) (not e!251039))))

(declare-fun arrayContainsKey!0 (array!25685 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!421884 (= res!246332 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!246330 () Bool)

(assert (=> start!39494 (=> (not res!246330) (not e!251039))))

(assert (=> start!39494 (= res!246330 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12645 _keys!709))))))

(assert (=> start!39494 e!251039))

(assert (=> start!39494 tp_is_empty!10927))

(assert (=> start!39494 tp!34854))

(assert (=> start!39494 true))

(declare-fun array_inv!8998 (array!25683) Bool)

(assert (=> start!39494 (and (array_inv!8998 _values!549) e!251042)))

(declare-fun array_inv!8999 (array!25685) Bool)

(assert (=> start!39494 (array_inv!8999 _keys!709)))

(declare-fun b!421885 () Bool)

(declare-fun e!251043 () Bool)

(assert (=> b!421885 (= e!251039 e!251043)))

(declare-fun res!246329 () Bool)

(assert (=> b!421885 (=> (not res!246329) (not e!251043))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25685 (_ BitVec 32)) Bool)

(assert (=> b!421885 (= res!246329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193633 mask!1025))))

(assert (=> b!421885 (= lt!193633 (array!25686 (store (arr!12292 _keys!709) i!563 k0!794) (size!12645 _keys!709)))))

(declare-fun b!421886 () Bool)

(declare-fun res!246333 () Bool)

(assert (=> b!421886 (=> (not res!246333) (not e!251039))))

(assert (=> b!421886 (= res!246333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!421887 () Bool)

(declare-fun res!246336 () Bool)

(assert (=> b!421887 (=> (not res!246336) (not e!251039))))

(assert (=> b!421887 (= res!246336 (or (= (select (arr!12292 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12292 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!421888 () Bool)

(declare-fun res!246331 () Bool)

(assert (=> b!421888 (=> (not res!246331) (not e!251043))))

(assert (=> b!421888 (= res!246331 (bvsle from!863 i!563))))

(declare-fun b!421889 () Bool)

(assert (=> b!421889 (= e!251041 (= call!29478 call!29479))))

(declare-fun b!421890 () Bool)

(declare-fun res!246339 () Bool)

(assert (=> b!421890 (=> (not res!246339) (not e!251043))))

(declare-datatypes ((List!7207 0))(
  ( (Nil!7204) (Cons!7203 (h!8059 (_ BitVec 64)) (t!12638 List!7207)) )
))
(declare-fun arrayNoDuplicates!0 (array!25685 (_ BitVec 32) List!7207) Bool)

(assert (=> b!421890 (= res!246339 (arrayNoDuplicates!0 lt!193633 #b00000000000000000000000000000000 Nil!7204))))

(declare-fun b!421891 () Bool)

(assert (=> b!421891 (= e!251046 tp_is_empty!10927)))

(declare-fun b!421892 () Bool)

(declare-fun res!246337 () Bool)

(assert (=> b!421892 (=> (not res!246337) (not e!251039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!421892 (= res!246337 (validMask!0 mask!1025))))

(declare-fun b!421893 () Bool)

(declare-fun e!251040 () Bool)

(assert (=> b!421893 (= e!251040 true)))

(declare-fun lt!193636 () V!15675)

(declare-fun lt!193628 () ListLongMap!6119)

(declare-fun lt!193627 () tuple2!7216)

(assert (=> b!421893 (= (+!1295 lt!193628 lt!193627) (+!1295 (+!1295 lt!193628 (tuple2!7217 k0!794 lt!193636)) lt!193627))))

(declare-fun lt!193632 () V!15675)

(assert (=> b!421893 (= lt!193627 (tuple2!7217 k0!794 lt!193632))))

(declare-datatypes ((Unit!12438 0))(
  ( (Unit!12439) )
))
(declare-fun lt!193629 () Unit!12438)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!78 (ListLongMap!6119 (_ BitVec 64) V!15675 V!15675) Unit!12438)

(assert (=> b!421893 (= lt!193629 (addSameAsAddTwiceSameKeyDiffValues!78 lt!193628 k0!794 lt!193636 lt!193632))))

(declare-fun lt!193635 () V!15675)

(declare-fun get!6111 (ValueCell!5120 V!15675) V!15675)

(assert (=> b!421893 (= lt!193636 (get!6111 (select (arr!12291 _values!549) from!863) lt!193635))))

(declare-fun lt!193630 () ListLongMap!6119)

(assert (=> b!421893 (= lt!193630 (+!1295 lt!193628 (tuple2!7217 (select (arr!12292 lt!193633) from!863) lt!193632)))))

(assert (=> b!421893 (= lt!193632 (get!6111 (select (store (arr!12291 _values!549) i!563 (ValueCellFull!5120 v!412)) from!863) lt!193635))))

(declare-fun dynLambda!735 (Int (_ BitVec 64)) V!15675)

(assert (=> b!421893 (= lt!193635 (dynLambda!735 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!421893 (= lt!193628 (getCurrentListMapNoExtraKeys!1284 lt!193633 lt!193637 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!18012 () Bool)

(declare-fun tp!34853 () Bool)

(assert (=> mapNonEmpty!18012 (= mapRes!18012 (and tp!34853 e!251038))))

(declare-fun mapKey!18012 () (_ BitVec 32))

(declare-fun mapValue!18012 () ValueCell!5120)

(declare-fun mapRest!18012 () (Array (_ BitVec 32) ValueCell!5120))

(assert (=> mapNonEmpty!18012 (= (arr!12291 _values!549) (store mapRest!18012 mapKey!18012 mapValue!18012))))

(declare-fun b!421894 () Bool)

(declare-fun e!251045 () Bool)

(assert (=> b!421894 (= e!251045 (not e!251040))))

(declare-fun res!246340 () Bool)

(assert (=> b!421894 (=> res!246340 e!251040)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!421894 (= res!246340 (validKeyInArray!0 (select (arr!12292 _keys!709) from!863)))))

(assert (=> b!421894 e!251041))

(assert (=> b!421894 (= c!55305 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!193634 () Unit!12438)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!467 (array!25685 array!25683 (_ BitVec 32) (_ BitVec 32) V!15675 V!15675 (_ BitVec 32) (_ BitVec 64) V!15675 (_ BitVec 32) Int) Unit!12438)

(assert (=> b!421894 (= lt!193634 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!467 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29476 () Bool)

(assert (=> bm!29476 (= call!29478 (getCurrentListMapNoExtraKeys!1284 (ite c!55305 _keys!709 lt!193633) (ite c!55305 _values!549 lt!193637) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421895 () Bool)

(assert (=> b!421895 (= e!251043 e!251045)))

(declare-fun res!246335 () Bool)

(assert (=> b!421895 (=> (not res!246335) (not e!251045))))

(assert (=> b!421895 (= res!246335 (= from!863 i!563))))

(assert (=> b!421895 (= lt!193630 (getCurrentListMapNoExtraKeys!1284 lt!193633 lt!193637 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!421895 (= lt!193637 (array!25684 (store (arr!12291 _values!549) i!563 (ValueCellFull!5120 v!412)) (size!12644 _values!549)))))

(declare-fun lt!193631 () ListLongMap!6119)

(assert (=> b!421895 (= lt!193631 (getCurrentListMapNoExtraKeys!1284 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!421896 () Bool)

(declare-fun res!246341 () Bool)

(assert (=> b!421896 (=> (not res!246341) (not e!251039))))

(assert (=> b!421896 (= res!246341 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7204))))

(declare-fun b!421897 () Bool)

(declare-fun res!246338 () Bool)

(assert (=> b!421897 (=> (not res!246338) (not e!251039))))

(assert (=> b!421897 (= res!246338 (validKeyInArray!0 k0!794))))

(assert (= (and start!39494 res!246330) b!421892))

(assert (= (and b!421892 res!246337) b!421883))

(assert (= (and b!421883 res!246342) b!421886))

(assert (= (and b!421886 res!246333) b!421896))

(assert (= (and b!421896 res!246341) b!421882))

(assert (= (and b!421882 res!246334) b!421897))

(assert (= (and b!421897 res!246338) b!421887))

(assert (= (and b!421887 res!246336) b!421884))

(assert (= (and b!421884 res!246332) b!421885))

(assert (= (and b!421885 res!246329) b!421890))

(assert (= (and b!421890 res!246339) b!421888))

(assert (= (and b!421888 res!246331) b!421895))

(assert (= (and b!421895 res!246335) b!421894))

(assert (= (and b!421894 c!55305) b!421881))

(assert (= (and b!421894 (not c!55305)) b!421889))

(assert (= (or b!421881 b!421889) bm!29475))

(assert (= (or b!421881 b!421889) bm!29476))

(assert (= (and b!421894 (not res!246340)) b!421893))

(assert (= (and b!421880 condMapEmpty!18012) mapIsEmpty!18012))

(assert (= (and b!421880 (not condMapEmpty!18012)) mapNonEmpty!18012))

(get-info :version)

(assert (= (and mapNonEmpty!18012 ((_ is ValueCellFull!5120) mapValue!18012)) b!421879))

(assert (= (and b!421880 ((_ is ValueCellFull!5120) mapDefault!18012)) b!421891))

(assert (= start!39494 b!421880))

(declare-fun b_lambda!9061 () Bool)

(assert (=> (not b_lambda!9061) (not b!421893)))

(declare-fun t!12636 () Bool)

(declare-fun tb!3389 () Bool)

(assert (=> (and start!39494 (= defaultEntry!557 defaultEntry!557) t!12636) tb!3389))

(declare-fun result!6313 () Bool)

(assert (=> tb!3389 (= result!6313 tp_is_empty!10927)))

(assert (=> b!421893 t!12636))

(declare-fun b_and!17401 () Bool)

(assert (= b_and!17399 (and (=> t!12636 result!6313) b_and!17401)))

(declare-fun m!411243 () Bool)

(assert (=> mapNonEmpty!18012 m!411243))

(declare-fun m!411245 () Bool)

(assert (=> b!421895 m!411245))

(declare-fun m!411247 () Bool)

(assert (=> b!421895 m!411247))

(declare-fun m!411249 () Bool)

(assert (=> b!421895 m!411249))

(declare-fun m!411251 () Bool)

(assert (=> b!421896 m!411251))

(declare-fun m!411253 () Bool)

(assert (=> b!421881 m!411253))

(declare-fun m!411255 () Bool)

(assert (=> b!421884 m!411255))

(declare-fun m!411257 () Bool)

(assert (=> bm!29476 m!411257))

(declare-fun m!411259 () Bool)

(assert (=> b!421897 m!411259))

(declare-fun m!411261 () Bool)

(assert (=> b!421890 m!411261))

(declare-fun m!411263 () Bool)

(assert (=> b!421886 m!411263))

(declare-fun m!411265 () Bool)

(assert (=> b!421894 m!411265))

(assert (=> b!421894 m!411265))

(declare-fun m!411267 () Bool)

(assert (=> b!421894 m!411267))

(declare-fun m!411269 () Bool)

(assert (=> b!421894 m!411269))

(declare-fun m!411271 () Bool)

(assert (=> b!421887 m!411271))

(declare-fun m!411273 () Bool)

(assert (=> b!421892 m!411273))

(declare-fun m!411275 () Bool)

(assert (=> b!421893 m!411275))

(declare-fun m!411277 () Bool)

(assert (=> b!421893 m!411277))

(declare-fun m!411279 () Bool)

(assert (=> b!421893 m!411279))

(declare-fun m!411281 () Bool)

(assert (=> b!421893 m!411281))

(declare-fun m!411283 () Bool)

(assert (=> b!421893 m!411283))

(declare-fun m!411285 () Bool)

(assert (=> b!421893 m!411285))

(declare-fun m!411287 () Bool)

(assert (=> b!421893 m!411287))

(assert (=> b!421893 m!411277))

(declare-fun m!411289 () Bool)

(assert (=> b!421893 m!411289))

(declare-fun m!411291 () Bool)

(assert (=> b!421893 m!411291))

(declare-fun m!411293 () Bool)

(assert (=> b!421893 m!411293))

(assert (=> b!421893 m!411283))

(declare-fun m!411295 () Bool)

(assert (=> b!421893 m!411295))

(assert (=> b!421893 m!411285))

(declare-fun m!411297 () Bool)

(assert (=> b!421893 m!411297))

(assert (=> b!421893 m!411247))

(declare-fun m!411299 () Bool)

(assert (=> bm!29475 m!411299))

(declare-fun m!411301 () Bool)

(assert (=> b!421885 m!411301))

(declare-fun m!411303 () Bool)

(assert (=> b!421885 m!411303))

(declare-fun m!411305 () Bool)

(assert (=> start!39494 m!411305))

(declare-fun m!411307 () Bool)

(assert (=> start!39494 m!411307))

(check-sat (not b!421890) (not b_next!9775) (not b!421896) (not b!421881) tp_is_empty!10927 (not b!421894) (not b!421885) (not b!421892) (not b!421886) (not bm!29475) (not start!39494) (not mapNonEmpty!18012) (not b!421895) (not b_lambda!9061) b_and!17401 (not b!421897) (not b!421884) (not bm!29476) (not b!421893))
(check-sat b_and!17401 (not b_next!9775))
