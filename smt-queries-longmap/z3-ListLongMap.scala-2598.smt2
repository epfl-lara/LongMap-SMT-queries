; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39392 () Bool)

(assert start!39392)

(declare-fun b_free!9673 () Bool)

(declare-fun b_next!9673 () Bool)

(assert (=> start!39392 (= b_free!9673 (not b_next!9673))))

(declare-fun tp!34547 () Bool)

(declare-fun b_and!17195 () Bool)

(assert (=> start!39392 (= tp!34547 b_and!17195)))

(declare-fun mapIsEmpty!17859 () Bool)

(declare-fun mapRes!17859 () Bool)

(assert (=> mapIsEmpty!17859 mapRes!17859))

(declare-fun b!418870 () Bool)

(declare-fun res!244194 () Bool)

(declare-fun e!249665 () Bool)

(assert (=> b!418870 (=> (not res!244194) (not e!249665))))

(declare-datatypes ((array!25487 0))(
  ( (array!25488 (arr!12193 (Array (_ BitVec 32) (_ BitVec 64))) (size!12546 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25487)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!418870 (= res!244194 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17859 () Bool)

(declare-fun tp!34548 () Bool)

(declare-fun e!249664 () Bool)

(assert (=> mapNonEmpty!17859 (= mapRes!17859 (and tp!34548 e!249664))))

(declare-fun mapKey!17859 () (_ BitVec 32))

(declare-datatypes ((V!15539 0))(
  ( (V!15540 (val!5457 Int)) )
))
(declare-datatypes ((ValueCell!5069 0))(
  ( (ValueCellFull!5069 (v!7698 V!15539)) (EmptyCell!5069) )
))
(declare-datatypes ((array!25489 0))(
  ( (array!25490 (arr!12194 (Array (_ BitVec 32) ValueCell!5069)) (size!12547 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25489)

(declare-fun mapValue!17859 () ValueCell!5069)

(declare-fun mapRest!17859 () (Array (_ BitVec 32) ValueCell!5069))

(assert (=> mapNonEmpty!17859 (= (arr!12194 _values!549) (store mapRest!17859 mapKey!17859 mapValue!17859))))

(declare-fun b!418871 () Bool)

(declare-fun e!249662 () Bool)

(declare-datatypes ((tuple2!7122 0))(
  ( (tuple2!7123 (_1!3572 (_ BitVec 64)) (_2!3572 V!15539)) )
))
(declare-datatypes ((List!7121 0))(
  ( (Nil!7118) (Cons!7117 (h!7973 tuple2!7122) (t!12450 List!7121)) )
))
(declare-datatypes ((ListLongMap!6025 0))(
  ( (ListLongMap!6026 (toList!3028 List!7121)) )
))
(declare-fun call!29173 () ListLongMap!6025)

(declare-fun call!29172 () ListLongMap!6025)

(assert (=> b!418871 (= e!249662 (= call!29173 call!29172))))

(declare-fun b!418872 () Bool)

(declare-fun e!249668 () Bool)

(declare-fun tp_is_empty!10825 () Bool)

(assert (=> b!418872 (= e!249668 tp_is_empty!10825)))

(declare-fun b!418873 () Bool)

(declare-fun res!244198 () Bool)

(assert (=> b!418873 (=> (not res!244198) (not e!249665))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!418873 (= res!244198 (validMask!0 mask!1025))))

(declare-fun b!418874 () Bool)

(assert (=> b!418874 (= e!249664 tp_is_empty!10825)))

(declare-fun b!418875 () Bool)

(declare-fun res!244196 () Bool)

(declare-fun e!249667 () Bool)

(assert (=> b!418875 (=> (not res!244196) (not e!249667))))

(declare-fun lt!191945 () array!25487)

(declare-datatypes ((List!7122 0))(
  ( (Nil!7119) (Cons!7118 (h!7974 (_ BitVec 64)) (t!12451 List!7122)) )
))
(declare-fun arrayNoDuplicates!0 (array!25487 (_ BitVec 32) List!7122) Bool)

(assert (=> b!418875 (= res!244196 (arrayNoDuplicates!0 lt!191945 #b00000000000000000000000000000000 Nil!7119))))

(declare-fun b!418876 () Bool)

(declare-fun res!244192 () Bool)

(assert (=> b!418876 (=> (not res!244192) (not e!249665))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25487 (_ BitVec 32)) Bool)

(assert (=> b!418876 (= res!244192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!418877 () Bool)

(declare-fun e!249669 () Bool)

(declare-fun e!249666 () Bool)

(assert (=> b!418877 (= e!249669 (not e!249666))))

(declare-fun res!244197 () Bool)

(assert (=> b!418877 (=> res!244197 e!249666)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!418877 (= res!244197 (validKeyInArray!0 (select (arr!12193 _keys!709) from!863)))))

(assert (=> b!418877 e!249662))

(declare-fun c!55152 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!418877 (= c!55152 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12354 0))(
  ( (Unit!12355) )
))
(declare-fun lt!191947 () Unit!12354)

(declare-fun minValue!515 () V!15539)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15539)

(declare-fun v!412 () V!15539)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!432 (array!25487 array!25489 (_ BitVec 32) (_ BitVec 32) V!15539 V!15539 (_ BitVec 32) (_ BitVec 64) V!15539 (_ BitVec 32) Int) Unit!12354)

(assert (=> b!418877 (= lt!191947 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!432 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418878 () Bool)

(declare-fun e!249663 () Bool)

(assert (=> b!418878 (= e!249663 (and e!249668 mapRes!17859))))

(declare-fun condMapEmpty!17859 () Bool)

(declare-fun mapDefault!17859 () ValueCell!5069)

(assert (=> b!418878 (= condMapEmpty!17859 (= (arr!12194 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5069)) mapDefault!17859)))))

(declare-fun res!244189 () Bool)

(assert (=> start!39392 (=> (not res!244189) (not e!249665))))

(assert (=> start!39392 (= res!244189 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12546 _keys!709))))))

(assert (=> start!39392 e!249665))

(assert (=> start!39392 tp_is_empty!10825))

(assert (=> start!39392 tp!34547))

(assert (=> start!39392 true))

(declare-fun array_inv!8936 (array!25489) Bool)

(assert (=> start!39392 (and (array_inv!8936 _values!549) e!249663)))

(declare-fun array_inv!8937 (array!25487) Bool)

(assert (=> start!39392 (array_inv!8937 _keys!709)))

(declare-fun b!418879 () Bool)

(declare-fun res!244200 () Bool)

(assert (=> b!418879 (=> (not res!244200) (not e!249667))))

(assert (=> b!418879 (= res!244200 (bvsle from!863 i!563))))

(declare-fun b!418880 () Bool)

(assert (=> b!418880 (= e!249666 true)))

(declare-fun lt!191953 () ListLongMap!6025)

(declare-fun lt!191952 () tuple2!7122)

(declare-fun lt!191949 () V!15539)

(declare-fun +!1255 (ListLongMap!6025 tuple2!7122) ListLongMap!6025)

(assert (=> b!418880 (= (+!1255 lt!191953 lt!191952) (+!1255 (+!1255 lt!191953 (tuple2!7123 k0!794 lt!191949)) lt!191952))))

(declare-fun lt!191951 () V!15539)

(assert (=> b!418880 (= lt!191952 (tuple2!7123 k0!794 lt!191951))))

(declare-fun lt!191944 () Unit!12354)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!41 (ListLongMap!6025 (_ BitVec 64) V!15539 V!15539) Unit!12354)

(assert (=> b!418880 (= lt!191944 (addSameAsAddTwiceSameKeyDiffValues!41 lt!191953 k0!794 lt!191949 lt!191951))))

(declare-fun lt!191950 () V!15539)

(declare-fun get!6040 (ValueCell!5069 V!15539) V!15539)

(assert (=> b!418880 (= lt!191949 (get!6040 (select (arr!12194 _values!549) from!863) lt!191950))))

(declare-fun lt!191946 () ListLongMap!6025)

(assert (=> b!418880 (= lt!191946 (+!1255 lt!191953 (tuple2!7123 (select (arr!12193 lt!191945) from!863) lt!191951)))))

(assert (=> b!418880 (= lt!191951 (get!6040 (select (store (arr!12194 _values!549) i!563 (ValueCellFull!5069 v!412)) from!863) lt!191950))))

(declare-fun dynLambda!698 (Int (_ BitVec 64)) V!15539)

(assert (=> b!418880 (= lt!191950 (dynLambda!698 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!191948 () array!25489)

(declare-fun getCurrentListMapNoExtraKeys!1239 (array!25487 array!25489 (_ BitVec 32) (_ BitVec 32) V!15539 V!15539 (_ BitVec 32) Int) ListLongMap!6025)

(assert (=> b!418880 (= lt!191953 (getCurrentListMapNoExtraKeys!1239 lt!191945 lt!191948 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418881 () Bool)

(declare-fun res!244190 () Bool)

(assert (=> b!418881 (=> (not res!244190) (not e!249665))))

(assert (=> b!418881 (= res!244190 (or (= (select (arr!12193 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12193 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!418882 () Bool)

(assert (=> b!418882 (= e!249662 (= call!29172 (+!1255 call!29173 (tuple2!7123 k0!794 v!412))))))

(declare-fun bm!29169 () Bool)

(assert (=> bm!29169 (= call!29173 (getCurrentListMapNoExtraKeys!1239 (ite c!55152 _keys!709 lt!191945) (ite c!55152 _values!549 lt!191948) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418883 () Bool)

(declare-fun res!244199 () Bool)

(assert (=> b!418883 (=> (not res!244199) (not e!249665))))

(assert (=> b!418883 (= res!244199 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12546 _keys!709))))))

(declare-fun b!418884 () Bool)

(assert (=> b!418884 (= e!249667 e!249669)))

(declare-fun res!244193 () Bool)

(assert (=> b!418884 (=> (not res!244193) (not e!249669))))

(assert (=> b!418884 (= res!244193 (= from!863 i!563))))

(assert (=> b!418884 (= lt!191946 (getCurrentListMapNoExtraKeys!1239 lt!191945 lt!191948 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!418884 (= lt!191948 (array!25490 (store (arr!12194 _values!549) i!563 (ValueCellFull!5069 v!412)) (size!12547 _values!549)))))

(declare-fun lt!191954 () ListLongMap!6025)

(assert (=> b!418884 (= lt!191954 (getCurrentListMapNoExtraKeys!1239 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!418885 () Bool)

(declare-fun res!244191 () Bool)

(assert (=> b!418885 (=> (not res!244191) (not e!249665))))

(assert (=> b!418885 (= res!244191 (validKeyInArray!0 k0!794))))

(declare-fun b!418886 () Bool)

(assert (=> b!418886 (= e!249665 e!249667)))

(declare-fun res!244187 () Bool)

(assert (=> b!418886 (=> (not res!244187) (not e!249667))))

(assert (=> b!418886 (= res!244187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191945 mask!1025))))

(assert (=> b!418886 (= lt!191945 (array!25488 (store (arr!12193 _keys!709) i!563 k0!794) (size!12546 _keys!709)))))

(declare-fun b!418887 () Bool)

(declare-fun res!244195 () Bool)

(assert (=> b!418887 (=> (not res!244195) (not e!249665))))

(assert (=> b!418887 (= res!244195 (and (= (size!12547 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12546 _keys!709) (size!12547 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!418888 () Bool)

(declare-fun res!244188 () Bool)

(assert (=> b!418888 (=> (not res!244188) (not e!249665))))

(assert (=> b!418888 (= res!244188 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7119))))

(declare-fun bm!29170 () Bool)

(assert (=> bm!29170 (= call!29172 (getCurrentListMapNoExtraKeys!1239 (ite c!55152 lt!191945 _keys!709) (ite c!55152 lt!191948 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39392 res!244189) b!418873))

(assert (= (and b!418873 res!244198) b!418887))

(assert (= (and b!418887 res!244195) b!418876))

(assert (= (and b!418876 res!244192) b!418888))

(assert (= (and b!418888 res!244188) b!418883))

(assert (= (and b!418883 res!244199) b!418885))

(assert (= (and b!418885 res!244191) b!418881))

(assert (= (and b!418881 res!244190) b!418870))

(assert (= (and b!418870 res!244194) b!418886))

(assert (= (and b!418886 res!244187) b!418875))

(assert (= (and b!418875 res!244196) b!418879))

(assert (= (and b!418879 res!244200) b!418884))

(assert (= (and b!418884 res!244193) b!418877))

(assert (= (and b!418877 c!55152) b!418882))

(assert (= (and b!418877 (not c!55152)) b!418871))

(assert (= (or b!418882 b!418871) bm!29170))

(assert (= (or b!418882 b!418871) bm!29169))

(assert (= (and b!418877 (not res!244197)) b!418880))

(assert (= (and b!418878 condMapEmpty!17859) mapIsEmpty!17859))

(assert (= (and b!418878 (not condMapEmpty!17859)) mapNonEmpty!17859))

(get-info :version)

(assert (= (and mapNonEmpty!17859 ((_ is ValueCellFull!5069) mapValue!17859)) b!418874))

(assert (= (and b!418878 ((_ is ValueCellFull!5069) mapDefault!17859)) b!418872))

(assert (= start!39392 b!418878))

(declare-fun b_lambda!8959 () Bool)

(assert (=> (not b_lambda!8959) (not b!418880)))

(declare-fun t!12449 () Bool)

(declare-fun tb!3287 () Bool)

(assert (=> (and start!39392 (= defaultEntry!557 defaultEntry!557) t!12449) tb!3287))

(declare-fun result!6109 () Bool)

(assert (=> tb!3287 (= result!6109 tp_is_empty!10825)))

(assert (=> b!418880 t!12449))

(declare-fun b_and!17197 () Bool)

(assert (= b_and!17195 (and (=> t!12449 result!6109) b_and!17197)))

(declare-fun m!407881 () Bool)

(assert (=> b!418881 m!407881))

(declare-fun m!407883 () Bool)

(assert (=> b!418888 m!407883))

(declare-fun m!407885 () Bool)

(assert (=> b!418873 m!407885))

(declare-fun m!407887 () Bool)

(assert (=> bm!29169 m!407887))

(declare-fun m!407889 () Bool)

(assert (=> b!418880 m!407889))

(declare-fun m!407891 () Bool)

(assert (=> b!418880 m!407891))

(declare-fun m!407893 () Bool)

(assert (=> b!418880 m!407893))

(declare-fun m!407895 () Bool)

(assert (=> b!418880 m!407895))

(declare-fun m!407897 () Bool)

(assert (=> b!418880 m!407897))

(declare-fun m!407899 () Bool)

(assert (=> b!418880 m!407899))

(assert (=> b!418880 m!407889))

(declare-fun m!407901 () Bool)

(assert (=> b!418880 m!407901))

(declare-fun m!407903 () Bool)

(assert (=> b!418880 m!407903))

(declare-fun m!407905 () Bool)

(assert (=> b!418880 m!407905))

(declare-fun m!407907 () Bool)

(assert (=> b!418880 m!407907))

(assert (=> b!418880 m!407901))

(declare-fun m!407909 () Bool)

(assert (=> b!418880 m!407909))

(assert (=> b!418880 m!407905))

(declare-fun m!407911 () Bool)

(assert (=> b!418880 m!407911))

(declare-fun m!407913 () Bool)

(assert (=> b!418880 m!407913))

(declare-fun m!407915 () Bool)

(assert (=> b!418875 m!407915))

(declare-fun m!407917 () Bool)

(assert (=> b!418886 m!407917))

(declare-fun m!407919 () Bool)

(assert (=> b!418886 m!407919))

(declare-fun m!407921 () Bool)

(assert (=> b!418884 m!407921))

(assert (=> b!418884 m!407895))

(declare-fun m!407923 () Bool)

(assert (=> b!418884 m!407923))

(declare-fun m!407925 () Bool)

(assert (=> b!418877 m!407925))

(assert (=> b!418877 m!407925))

(declare-fun m!407927 () Bool)

(assert (=> b!418877 m!407927))

(declare-fun m!407929 () Bool)

(assert (=> b!418877 m!407929))

(declare-fun m!407931 () Bool)

(assert (=> bm!29170 m!407931))

(declare-fun m!407933 () Bool)

(assert (=> b!418876 m!407933))

(declare-fun m!407935 () Bool)

(assert (=> start!39392 m!407935))

(declare-fun m!407937 () Bool)

(assert (=> start!39392 m!407937))

(declare-fun m!407939 () Bool)

(assert (=> b!418882 m!407939))

(declare-fun m!407941 () Bool)

(assert (=> b!418870 m!407941))

(declare-fun m!407943 () Bool)

(assert (=> b!418885 m!407943))

(declare-fun m!407945 () Bool)

(assert (=> mapNonEmpty!17859 m!407945))

(check-sat (not b_lambda!8959) tp_is_empty!10825 (not bm!29169) (not b!418877) (not b!418886) (not b!418870) (not b!418888) (not b!418885) (not mapNonEmpty!17859) (not b!418884) (not b!418880) (not start!39392) (not b!418876) (not bm!29170) b_and!17197 (not b!418875) (not b_next!9673) (not b!418873) (not b!418882))
(check-sat b_and!17197 (not b_next!9673))
