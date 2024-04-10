; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40784 () Bool)

(assert start!40784)

(declare-fun b_free!10773 () Bool)

(declare-fun b_next!10773 () Bool)

(assert (=> start!40784 (= b_free!10773 (not b_next!10773))))

(declare-fun tp!38142 () Bool)

(declare-fun b_and!18833 () Bool)

(assert (=> start!40784 (= tp!38142 b_and!18833)))

(declare-fun b!452176 () Bool)

(declare-fun res!269296 () Bool)

(declare-fun e!264797 () Bool)

(assert (=> b!452176 (=> (not res!269296) (not e!264797))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!28029 0))(
  ( (array!28030 (arr!13459 (Array (_ BitVec 32) (_ BitVec 64))) (size!13811 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28029)

(assert (=> b!452176 (= res!269296 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13811 _keys!709))))))

(declare-fun b!452177 () Bool)

(declare-fun res!269298 () Bool)

(declare-fun e!264794 () Bool)

(assert (=> b!452177 (=> (not res!269298) (not e!264794))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!452177 (= res!269298 (bvsle from!863 i!563))))

(declare-fun b!452178 () Bool)

(declare-fun e!264795 () Bool)

(declare-datatypes ((V!17253 0))(
  ( (V!17254 (val!6100 Int)) )
))
(declare-datatypes ((ValueCell!5712 0))(
  ( (ValueCellFull!5712 (v!8359 V!17253)) (EmptyCell!5712) )
))
(declare-datatypes ((array!28031 0))(
  ( (array!28032 (arr!13460 (Array (_ BitVec 32) ValueCell!5712)) (size!13812 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28031)

(assert (=> b!452178 (= e!264795 (bvslt from!863 (size!13812 _values!549)))))

(declare-fun minValue!515 () V!17253)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!8026 0))(
  ( (tuple2!8027 (_1!4024 (_ BitVec 64)) (_2!4024 V!17253)) )
))
(declare-datatypes ((List!8085 0))(
  ( (Nil!8082) (Cons!8081 (h!8937 tuple2!8026) (t!13881 List!8085)) )
))
(declare-datatypes ((ListLongMap!6939 0))(
  ( (ListLongMap!6940 (toList!3485 List!8085)) )
))
(declare-fun lt!205116 () ListLongMap!6939)

(declare-fun zeroValue!515 () V!17253)

(declare-fun lt!205118 () array!28029)

(declare-fun lt!205117 () array!28031)

(declare-fun +!1562 (ListLongMap!6939 tuple2!8026) ListLongMap!6939)

(declare-fun getCurrentListMapNoExtraKeys!1669 (array!28029 array!28031 (_ BitVec 32) (_ BitVec 32) V!17253 V!17253 (_ BitVec 32) Int) ListLongMap!6939)

(declare-fun get!6631 (ValueCell!5712 V!17253) V!17253)

(declare-fun dynLambda!862 (Int (_ BitVec 64)) V!17253)

(assert (=> b!452178 (= lt!205116 (+!1562 (getCurrentListMapNoExtraKeys!1669 lt!205118 lt!205117 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8027 (select (arr!13459 lt!205118) from!863) (get!6631 (select (arr!13460 lt!205117) from!863) (dynLambda!862 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!452179 () Bool)

(declare-fun e!264793 () Bool)

(declare-fun tp_is_empty!12111 () Bool)

(assert (=> b!452179 (= e!264793 tp_is_empty!12111)))

(declare-fun b!452180 () Bool)

(declare-fun e!264796 () Bool)

(assert (=> b!452180 (= e!264794 e!264796)))

(declare-fun res!269302 () Bool)

(assert (=> b!452180 (=> (not res!269302) (not e!264796))))

(assert (=> b!452180 (= res!269302 (= from!863 i!563))))

(assert (=> b!452180 (= lt!205116 (getCurrentListMapNoExtraKeys!1669 lt!205118 lt!205117 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17253)

(assert (=> b!452180 (= lt!205117 (array!28032 (store (arr!13460 _values!549) i!563 (ValueCellFull!5712 v!412)) (size!13812 _values!549)))))

(declare-fun lt!205115 () ListLongMap!6939)

(assert (=> b!452180 (= lt!205115 (getCurrentListMapNoExtraKeys!1669 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!452181 () Bool)

(declare-fun res!269300 () Bool)

(assert (=> b!452181 (=> (not res!269300) (not e!264797))))

(assert (=> b!452181 (= res!269300 (and (= (size!13812 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13811 _keys!709) (size!13812 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!452182 () Bool)

(declare-fun res!269308 () Bool)

(assert (=> b!452182 (=> (not res!269308) (not e!264794))))

(declare-datatypes ((List!8086 0))(
  ( (Nil!8083) (Cons!8082 (h!8938 (_ BitVec 64)) (t!13882 List!8086)) )
))
(declare-fun arrayNoDuplicates!0 (array!28029 (_ BitVec 32) List!8086) Bool)

(assert (=> b!452182 (= res!269308 (arrayNoDuplicates!0 lt!205118 #b00000000000000000000000000000000 Nil!8083))))

(declare-fun b!452183 () Bool)

(assert (=> b!452183 (= e!264797 e!264794)))

(declare-fun res!269299 () Bool)

(assert (=> b!452183 (=> (not res!269299) (not e!264794))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28029 (_ BitVec 32)) Bool)

(assert (=> b!452183 (= res!269299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205118 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!452183 (= lt!205118 (array!28030 (store (arr!13459 _keys!709) i!563 k0!794) (size!13811 _keys!709)))))

(declare-fun res!269301 () Bool)

(assert (=> start!40784 (=> (not res!269301) (not e!264797))))

(assert (=> start!40784 (= res!269301 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13811 _keys!709))))))

(assert (=> start!40784 e!264797))

(assert (=> start!40784 tp_is_empty!12111))

(assert (=> start!40784 tp!38142))

(assert (=> start!40784 true))

(declare-fun e!264789 () Bool)

(declare-fun array_inv!9744 (array!28031) Bool)

(assert (=> start!40784 (and (array_inv!9744 _values!549) e!264789)))

(declare-fun array_inv!9745 (array!28029) Bool)

(assert (=> start!40784 (array_inv!9745 _keys!709)))

(declare-fun b!452184 () Bool)

(declare-fun res!269297 () Bool)

(assert (=> b!452184 (=> (not res!269297) (not e!264797))))

(declare-fun arrayContainsKey!0 (array!28029 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!452184 (= res!269297 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!452185 () Bool)

(declare-fun mapRes!19803 () Bool)

(assert (=> b!452185 (= e!264789 (and e!264793 mapRes!19803))))

(declare-fun condMapEmpty!19803 () Bool)

(declare-fun mapDefault!19803 () ValueCell!5712)

(assert (=> b!452185 (= condMapEmpty!19803 (= (arr!13460 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5712)) mapDefault!19803)))))

(declare-fun b!452186 () Bool)

(assert (=> b!452186 (= e!264796 (not e!264795))))

(declare-fun res!269307 () Bool)

(assert (=> b!452186 (=> res!269307 e!264795)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!452186 (= res!269307 (validKeyInArray!0 (select (arr!13459 _keys!709) from!863)))))

(declare-fun e!264791 () Bool)

(assert (=> b!452186 e!264791))

(declare-fun c!56108 () Bool)

(assert (=> b!452186 (= c!56108 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13220 0))(
  ( (Unit!13221) )
))
(declare-fun lt!205114 () Unit!13220)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!725 (array!28029 array!28031 (_ BitVec 32) (_ BitVec 32) V!17253 V!17253 (_ BitVec 32) (_ BitVec 64) V!17253 (_ BitVec 32) Int) Unit!13220)

(assert (=> b!452186 (= lt!205114 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!725 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29929 () Bool)

(declare-fun call!29932 () ListLongMap!6939)

(assert (=> bm!29929 (= call!29932 (getCurrentListMapNoExtraKeys!1669 (ite c!56108 _keys!709 lt!205118) (ite c!56108 _values!549 lt!205117) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452187 () Bool)

(declare-fun res!269305 () Bool)

(assert (=> b!452187 (=> (not res!269305) (not e!264797))))

(assert (=> b!452187 (= res!269305 (or (= (select (arr!13459 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13459 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!29930 () Bool)

(declare-fun call!29933 () ListLongMap!6939)

(assert (=> bm!29930 (= call!29933 (getCurrentListMapNoExtraKeys!1669 (ite c!56108 lt!205118 _keys!709) (ite c!56108 lt!205117 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!19803 () Bool)

(assert (=> mapIsEmpty!19803 mapRes!19803))

(declare-fun b!452188 () Bool)

(declare-fun res!269309 () Bool)

(assert (=> b!452188 (=> (not res!269309) (not e!264797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!452188 (= res!269309 (validMask!0 mask!1025))))

(declare-fun b!452189 () Bool)

(declare-fun res!269306 () Bool)

(assert (=> b!452189 (=> (not res!269306) (not e!264797))))

(assert (=> b!452189 (= res!269306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!452190 () Bool)

(declare-fun res!269303 () Bool)

(assert (=> b!452190 (=> (not res!269303) (not e!264797))))

(assert (=> b!452190 (= res!269303 (validKeyInArray!0 k0!794))))

(declare-fun b!452191 () Bool)

(assert (=> b!452191 (= e!264791 (= call!29933 (+!1562 call!29932 (tuple2!8027 k0!794 v!412))))))

(declare-fun b!452192 () Bool)

(assert (=> b!452192 (= e!264791 (= call!29932 call!29933))))

(declare-fun b!452193 () Bool)

(declare-fun res!269304 () Bool)

(assert (=> b!452193 (=> (not res!269304) (not e!264797))))

(assert (=> b!452193 (= res!269304 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8083))))

(declare-fun mapNonEmpty!19803 () Bool)

(declare-fun tp!38141 () Bool)

(declare-fun e!264792 () Bool)

(assert (=> mapNonEmpty!19803 (= mapRes!19803 (and tp!38141 e!264792))))

(declare-fun mapRest!19803 () (Array (_ BitVec 32) ValueCell!5712))

(declare-fun mapValue!19803 () ValueCell!5712)

(declare-fun mapKey!19803 () (_ BitVec 32))

(assert (=> mapNonEmpty!19803 (= (arr!13460 _values!549) (store mapRest!19803 mapKey!19803 mapValue!19803))))

(declare-fun b!452194 () Bool)

(assert (=> b!452194 (= e!264792 tp_is_empty!12111)))

(assert (= (and start!40784 res!269301) b!452188))

(assert (= (and b!452188 res!269309) b!452181))

(assert (= (and b!452181 res!269300) b!452189))

(assert (= (and b!452189 res!269306) b!452193))

(assert (= (and b!452193 res!269304) b!452176))

(assert (= (and b!452176 res!269296) b!452190))

(assert (= (and b!452190 res!269303) b!452187))

(assert (= (and b!452187 res!269305) b!452184))

(assert (= (and b!452184 res!269297) b!452183))

(assert (= (and b!452183 res!269299) b!452182))

(assert (= (and b!452182 res!269308) b!452177))

(assert (= (and b!452177 res!269298) b!452180))

(assert (= (and b!452180 res!269302) b!452186))

(assert (= (and b!452186 c!56108) b!452191))

(assert (= (and b!452186 (not c!56108)) b!452192))

(assert (= (or b!452191 b!452192) bm!29930))

(assert (= (or b!452191 b!452192) bm!29929))

(assert (= (and b!452186 (not res!269307)) b!452178))

(assert (= (and b!452185 condMapEmpty!19803) mapIsEmpty!19803))

(assert (= (and b!452185 (not condMapEmpty!19803)) mapNonEmpty!19803))

(get-info :version)

(assert (= (and mapNonEmpty!19803 ((_ is ValueCellFull!5712) mapValue!19803)) b!452194))

(assert (= (and b!452185 ((_ is ValueCellFull!5712) mapDefault!19803)) b!452179))

(assert (= start!40784 b!452185))

(declare-fun b_lambda!9551 () Bool)

(assert (=> (not b_lambda!9551) (not b!452178)))

(declare-fun t!13880 () Bool)

(declare-fun tb!3753 () Bool)

(assert (=> (and start!40784 (= defaultEntry!557 defaultEntry!557) t!13880) tb!3753))

(declare-fun result!7043 () Bool)

(assert (=> tb!3753 (= result!7043 tp_is_empty!12111)))

(assert (=> b!452178 t!13880))

(declare-fun b_and!18835 () Bool)

(assert (= b_and!18833 (and (=> t!13880 result!7043) b_and!18835)))

(declare-fun m!435887 () Bool)

(assert (=> b!452189 m!435887))

(declare-fun m!435889 () Bool)

(assert (=> b!452182 m!435889))

(declare-fun m!435891 () Bool)

(assert (=> b!452190 m!435891))

(declare-fun m!435893 () Bool)

(assert (=> b!452180 m!435893))

(declare-fun m!435895 () Bool)

(assert (=> b!452180 m!435895))

(declare-fun m!435897 () Bool)

(assert (=> b!452180 m!435897))

(declare-fun m!435899 () Bool)

(assert (=> bm!29929 m!435899))

(declare-fun m!435901 () Bool)

(assert (=> b!452191 m!435901))

(declare-fun m!435903 () Bool)

(assert (=> b!452188 m!435903))

(declare-fun m!435905 () Bool)

(assert (=> b!452184 m!435905))

(declare-fun m!435907 () Bool)

(assert (=> b!452187 m!435907))

(declare-fun m!435909 () Bool)

(assert (=> b!452193 m!435909))

(declare-fun m!435911 () Bool)

(assert (=> b!452186 m!435911))

(assert (=> b!452186 m!435911))

(declare-fun m!435913 () Bool)

(assert (=> b!452186 m!435913))

(declare-fun m!435915 () Bool)

(assert (=> b!452186 m!435915))

(declare-fun m!435917 () Bool)

(assert (=> b!452178 m!435917))

(declare-fun m!435919 () Bool)

(assert (=> b!452178 m!435919))

(declare-fun m!435921 () Bool)

(assert (=> b!452178 m!435921))

(declare-fun m!435923 () Bool)

(assert (=> b!452178 m!435923))

(assert (=> b!452178 m!435921))

(assert (=> b!452178 m!435919))

(assert (=> b!452178 m!435917))

(declare-fun m!435925 () Bool)

(assert (=> b!452178 m!435925))

(declare-fun m!435927 () Bool)

(assert (=> b!452178 m!435927))

(declare-fun m!435929 () Bool)

(assert (=> bm!29930 m!435929))

(declare-fun m!435931 () Bool)

(assert (=> start!40784 m!435931))

(declare-fun m!435933 () Bool)

(assert (=> start!40784 m!435933))

(declare-fun m!435935 () Bool)

(assert (=> mapNonEmpty!19803 m!435935))

(declare-fun m!435937 () Bool)

(assert (=> b!452183 m!435937))

(declare-fun m!435939 () Bool)

(assert (=> b!452183 m!435939))

(check-sat (not b!452184) (not b!452191) (not mapNonEmpty!19803) (not b!452186) (not bm!29929) (not b_next!10773) (not b_lambda!9551) (not b!452188) tp_is_empty!12111 (not b!452183) b_and!18835 (not start!40784) (not b!452193) (not b!452178) (not b!452189) (not b!452180) (not b!452190) (not b!452182) (not bm!29930))
(check-sat b_and!18835 (not b_next!10773))
