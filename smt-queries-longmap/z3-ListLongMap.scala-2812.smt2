; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40768 () Bool)

(assert start!40768)

(declare-fun b_free!10771 () Bool)

(declare-fun b_next!10771 () Bool)

(assert (=> start!40768 (= b_free!10771 (not b_next!10771))))

(declare-fun tp!38135 () Bool)

(declare-fun b_and!18803 () Bool)

(assert (=> start!40768 (= tp!38135 b_and!18803)))

(declare-fun b!451846 () Bool)

(declare-fun res!269131 () Bool)

(declare-fun e!264590 () Bool)

(assert (=> b!451846 (=> (not res!269131) (not e!264590))))

(declare-datatypes ((array!28015 0))(
  ( (array!28016 (arr!13452 (Array (_ BitVec 32) (_ BitVec 64))) (size!13805 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28015)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28015 (_ BitVec 32)) Bool)

(assert (=> b!451846 (= res!269131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!451847 () Bool)

(declare-fun e!264593 () Bool)

(declare-fun tp_is_empty!12109 () Bool)

(assert (=> b!451847 (= e!264593 tp_is_empty!12109)))

(declare-fun mapIsEmpty!19800 () Bool)

(declare-fun mapRes!19800 () Bool)

(assert (=> mapIsEmpty!19800 mapRes!19800))

(declare-fun b!451848 () Bool)

(declare-fun res!269134 () Bool)

(assert (=> b!451848 (=> (not res!269134) (not e!264590))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!451848 (= res!269134 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13805 _keys!709))))))

(declare-fun b!451849 () Bool)

(declare-fun e!264591 () Bool)

(assert (=> b!451849 (= e!264591 tp_is_empty!12109)))

(declare-datatypes ((V!17251 0))(
  ( (V!17252 (val!6099 Int)) )
))
(declare-datatypes ((tuple2!8032 0))(
  ( (tuple2!8033 (_1!4027 (_ BitVec 64)) (_2!4027 V!17251)) )
))
(declare-datatypes ((List!8092 0))(
  ( (Nil!8089) (Cons!8088 (h!8944 tuple2!8032) (t!13877 List!8092)) )
))
(declare-datatypes ((ListLongMap!6935 0))(
  ( (ListLongMap!6936 (toList!3483 List!8092)) )
))
(declare-fun call!29902 () ListLongMap!6935)

(declare-fun minValue!515 () V!17251)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5711 0))(
  ( (ValueCellFull!5711 (v!8352 V!17251)) (EmptyCell!5711) )
))
(declare-datatypes ((array!28017 0))(
  ( (array!28018 (arr!13453 (Array (_ BitVec 32) ValueCell!5711)) (size!13806 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28017)

(declare-fun lt!204868 () array!28017)

(declare-fun zeroValue!515 () V!17251)

(declare-fun bm!29898 () Bool)

(declare-fun lt!204866 () array!28015)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun c!56034 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1679 (array!28015 array!28017 (_ BitVec 32) (_ BitVec 32) V!17251 V!17251 (_ BitVec 32) Int) ListLongMap!6935)

(assert (=> bm!29898 (= call!29902 (getCurrentListMapNoExtraKeys!1679 (ite c!56034 lt!204866 _keys!709) (ite c!56034 lt!204868 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!269125 () Bool)

(assert (=> start!40768 (=> (not res!269125) (not e!264590))))

(assert (=> start!40768 (= res!269125 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13805 _keys!709))))))

(assert (=> start!40768 e!264590))

(assert (=> start!40768 tp_is_empty!12109))

(assert (=> start!40768 tp!38135))

(assert (=> start!40768 true))

(declare-fun e!264594 () Bool)

(declare-fun array_inv!9804 (array!28017) Bool)

(assert (=> start!40768 (and (array_inv!9804 _values!549) e!264594)))

(declare-fun array_inv!9805 (array!28015) Bool)

(assert (=> start!40768 (array_inv!9805 _keys!709)))

(declare-fun b!451850 () Bool)

(declare-fun res!269137 () Bool)

(assert (=> b!451850 (=> (not res!269137) (not e!264590))))

(declare-datatypes ((List!8093 0))(
  ( (Nil!8090) (Cons!8089 (h!8945 (_ BitVec 64)) (t!13878 List!8093)) )
))
(declare-fun arrayNoDuplicates!0 (array!28015 (_ BitVec 32) List!8093) Bool)

(assert (=> b!451850 (= res!269137 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8090))))

(declare-fun call!29901 () ListLongMap!6935)

(declare-fun e!264595 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun b!451851 () Bool)

(declare-fun v!412 () V!17251)

(declare-fun +!1582 (ListLongMap!6935 tuple2!8032) ListLongMap!6935)

(assert (=> b!451851 (= e!264595 (= call!29902 (+!1582 call!29901 (tuple2!8033 k0!794 v!412))))))

(declare-fun b!451852 () Bool)

(declare-fun e!264592 () Bool)

(declare-fun e!264589 () Bool)

(assert (=> b!451852 (= e!264592 (not e!264589))))

(declare-fun res!269129 () Bool)

(assert (=> b!451852 (=> res!269129 e!264589)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!451852 (= res!269129 (validKeyInArray!0 (select (arr!13452 _keys!709) from!863)))))

(assert (=> b!451852 e!264595))

(assert (=> b!451852 (= c!56034 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13185 0))(
  ( (Unit!13186) )
))
(declare-fun lt!204865 () Unit!13185)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!720 (array!28015 array!28017 (_ BitVec 32) (_ BitVec 32) V!17251 V!17251 (_ BitVec 32) (_ BitVec 64) V!17251 (_ BitVec 32) Int) Unit!13185)

(assert (=> b!451852 (= lt!204865 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!720 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451853 () Bool)

(declare-fun res!269127 () Bool)

(assert (=> b!451853 (=> (not res!269127) (not e!264590))))

(declare-fun arrayContainsKey!0 (array!28015 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!451853 (= res!269127 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19800 () Bool)

(declare-fun tp!38136 () Bool)

(assert (=> mapNonEmpty!19800 (= mapRes!19800 (and tp!38136 e!264593))))

(declare-fun mapValue!19800 () ValueCell!5711)

(declare-fun mapKey!19800 () (_ BitVec 32))

(declare-fun mapRest!19800 () (Array (_ BitVec 32) ValueCell!5711))

(assert (=> mapNonEmpty!19800 (= (arr!13453 _values!549) (store mapRest!19800 mapKey!19800 mapValue!19800))))

(declare-fun b!451854 () Bool)

(declare-fun res!269136 () Bool)

(declare-fun e!264588 () Bool)

(assert (=> b!451854 (=> (not res!269136) (not e!264588))))

(assert (=> b!451854 (= res!269136 (bvsle from!863 i!563))))

(declare-fun b!451855 () Bool)

(declare-fun res!269130 () Bool)

(assert (=> b!451855 (=> (not res!269130) (not e!264588))))

(assert (=> b!451855 (= res!269130 (arrayNoDuplicates!0 lt!204866 #b00000000000000000000000000000000 Nil!8090))))

(declare-fun b!451856 () Bool)

(assert (=> b!451856 (= e!264589 (bvslt from!863 (size!13806 _values!549)))))

(declare-fun lt!204869 () ListLongMap!6935)

(declare-fun get!6630 (ValueCell!5711 V!17251) V!17251)

(declare-fun dynLambda!858 (Int (_ BitVec 64)) V!17251)

(assert (=> b!451856 (= lt!204869 (+!1582 (getCurrentListMapNoExtraKeys!1679 lt!204866 lt!204868 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8033 (select (arr!13452 lt!204866) from!863) (get!6630 (select (arr!13453 lt!204868) from!863) (dynLambda!858 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!451857 () Bool)

(declare-fun res!269132 () Bool)

(assert (=> b!451857 (=> (not res!269132) (not e!264590))))

(assert (=> b!451857 (= res!269132 (or (= (select (arr!13452 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13452 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!451858 () Bool)

(declare-fun res!269138 () Bool)

(assert (=> b!451858 (=> (not res!269138) (not e!264590))))

(assert (=> b!451858 (= res!269138 (validKeyInArray!0 k0!794))))

(declare-fun b!451859 () Bool)

(assert (=> b!451859 (= e!264595 (= call!29901 call!29902))))

(declare-fun b!451860 () Bool)

(assert (=> b!451860 (= e!264594 (and e!264591 mapRes!19800))))

(declare-fun condMapEmpty!19800 () Bool)

(declare-fun mapDefault!19800 () ValueCell!5711)

(assert (=> b!451860 (= condMapEmpty!19800 (= (arr!13453 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5711)) mapDefault!19800)))))

(declare-fun b!451861 () Bool)

(assert (=> b!451861 (= e!264588 e!264592)))

(declare-fun res!269133 () Bool)

(assert (=> b!451861 (=> (not res!269133) (not e!264592))))

(assert (=> b!451861 (= res!269133 (= from!863 i!563))))

(assert (=> b!451861 (= lt!204869 (getCurrentListMapNoExtraKeys!1679 lt!204866 lt!204868 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!451861 (= lt!204868 (array!28018 (store (arr!13453 _values!549) i!563 (ValueCellFull!5711 v!412)) (size!13806 _values!549)))))

(declare-fun lt!204867 () ListLongMap!6935)

(assert (=> b!451861 (= lt!204867 (getCurrentListMapNoExtraKeys!1679 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!451862 () Bool)

(declare-fun res!269135 () Bool)

(assert (=> b!451862 (=> (not res!269135) (not e!264590))))

(assert (=> b!451862 (= res!269135 (and (= (size!13806 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13805 _keys!709) (size!13806 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!451863 () Bool)

(assert (=> b!451863 (= e!264590 e!264588)))

(declare-fun res!269126 () Bool)

(assert (=> b!451863 (=> (not res!269126) (not e!264588))))

(assert (=> b!451863 (= res!269126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204866 mask!1025))))

(assert (=> b!451863 (= lt!204866 (array!28016 (store (arr!13452 _keys!709) i!563 k0!794) (size!13805 _keys!709)))))

(declare-fun b!451864 () Bool)

(declare-fun res!269128 () Bool)

(assert (=> b!451864 (=> (not res!269128) (not e!264590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!451864 (= res!269128 (validMask!0 mask!1025))))

(declare-fun bm!29899 () Bool)

(assert (=> bm!29899 (= call!29901 (getCurrentListMapNoExtraKeys!1679 (ite c!56034 _keys!709 lt!204866) (ite c!56034 _values!549 lt!204868) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!40768 res!269125) b!451864))

(assert (= (and b!451864 res!269128) b!451862))

(assert (= (and b!451862 res!269135) b!451846))

(assert (= (and b!451846 res!269131) b!451850))

(assert (= (and b!451850 res!269137) b!451848))

(assert (= (and b!451848 res!269134) b!451858))

(assert (= (and b!451858 res!269138) b!451857))

(assert (= (and b!451857 res!269132) b!451853))

(assert (= (and b!451853 res!269127) b!451863))

(assert (= (and b!451863 res!269126) b!451855))

(assert (= (and b!451855 res!269130) b!451854))

(assert (= (and b!451854 res!269136) b!451861))

(assert (= (and b!451861 res!269133) b!451852))

(assert (= (and b!451852 c!56034) b!451851))

(assert (= (and b!451852 (not c!56034)) b!451859))

(assert (= (or b!451851 b!451859) bm!29898))

(assert (= (or b!451851 b!451859) bm!29899))

(assert (= (and b!451852 (not res!269129)) b!451856))

(assert (= (and b!451860 condMapEmpty!19800) mapIsEmpty!19800))

(assert (= (and b!451860 (not condMapEmpty!19800)) mapNonEmpty!19800))

(get-info :version)

(assert (= (and mapNonEmpty!19800 ((_ is ValueCellFull!5711) mapValue!19800)) b!451847))

(assert (= (and b!451860 ((_ is ValueCellFull!5711) mapDefault!19800)) b!451849))

(assert (= start!40768 b!451860))

(declare-fun b_lambda!9531 () Bool)

(assert (=> (not b_lambda!9531) (not b!451856)))

(declare-fun t!13876 () Bool)

(declare-fun tb!3743 () Bool)

(assert (=> (and start!40768 (= defaultEntry!557 defaultEntry!557) t!13876) tb!3743))

(declare-fun result!7031 () Bool)

(assert (=> tb!3743 (= result!7031 tp_is_empty!12109)))

(assert (=> b!451856 t!13876))

(declare-fun b_and!18805 () Bool)

(assert (= b_and!18803 (and (=> t!13876 result!7031) b_and!18805)))

(declare-fun m!435101 () Bool)

(assert (=> b!451852 m!435101))

(assert (=> b!451852 m!435101))

(declare-fun m!435103 () Bool)

(assert (=> b!451852 m!435103))

(declare-fun m!435105 () Bool)

(assert (=> b!451852 m!435105))

(declare-fun m!435107 () Bool)

(assert (=> b!451850 m!435107))

(declare-fun m!435109 () Bool)

(assert (=> b!451857 m!435109))

(declare-fun m!435111 () Bool)

(assert (=> b!451861 m!435111))

(declare-fun m!435113 () Bool)

(assert (=> b!451861 m!435113))

(declare-fun m!435115 () Bool)

(assert (=> b!451861 m!435115))

(declare-fun m!435117 () Bool)

(assert (=> b!451863 m!435117))

(declare-fun m!435119 () Bool)

(assert (=> b!451863 m!435119))

(declare-fun m!435121 () Bool)

(assert (=> bm!29899 m!435121))

(declare-fun m!435123 () Bool)

(assert (=> b!451851 m!435123))

(declare-fun m!435125 () Bool)

(assert (=> bm!29898 m!435125))

(declare-fun m!435127 () Bool)

(assert (=> b!451853 m!435127))

(declare-fun m!435129 () Bool)

(assert (=> start!40768 m!435129))

(declare-fun m!435131 () Bool)

(assert (=> start!40768 m!435131))

(declare-fun m!435133 () Bool)

(assert (=> b!451855 m!435133))

(declare-fun m!435135 () Bool)

(assert (=> b!451864 m!435135))

(declare-fun m!435137 () Bool)

(assert (=> b!451858 m!435137))

(declare-fun m!435139 () Bool)

(assert (=> b!451846 m!435139))

(declare-fun m!435141 () Bool)

(assert (=> b!451856 m!435141))

(declare-fun m!435143 () Bool)

(assert (=> b!451856 m!435143))

(declare-fun m!435145 () Bool)

(assert (=> b!451856 m!435145))

(assert (=> b!451856 m!435145))

(declare-fun m!435147 () Bool)

(assert (=> b!451856 m!435147))

(declare-fun m!435149 () Bool)

(assert (=> b!451856 m!435149))

(assert (=> b!451856 m!435149))

(assert (=> b!451856 m!435141))

(declare-fun m!435151 () Bool)

(assert (=> b!451856 m!435151))

(declare-fun m!435153 () Bool)

(assert (=> mapNonEmpty!19800 m!435153))

(check-sat (not b!451853) (not mapNonEmpty!19800) (not b!451846) (not b!451858) (not b_next!10771) (not b!451855) b_and!18805 (not b!451851) (not bm!29898) (not bm!29899) (not b_lambda!9531) (not b!451852) (not b!451864) (not b!451863) (not b!451861) tp_is_empty!12109 (not start!40768) (not b!451850) (not b!451856))
(check-sat b_and!18805 (not b_next!10771))
