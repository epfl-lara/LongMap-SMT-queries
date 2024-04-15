; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41170 () Bool)

(assert start!41170)

(declare-fun b_free!11053 () Bool)

(declare-fun b_next!11053 () Bool)

(assert (=> start!41170 (= b_free!11053 (not b_next!11053))))

(declare-fun tp!38994 () Bool)

(declare-fun b_and!19319 () Bool)

(assert (=> start!41170 (= tp!38994 b_and!19319)))

(declare-fun b!460163 () Bool)

(declare-fun e!268453 () Bool)

(declare-fun e!268451 () Bool)

(assert (=> b!460163 (= e!268453 e!268451)))

(declare-fun res!275156 () Bool)

(assert (=> b!460163 (=> res!275156 e!268451)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((array!28579 0))(
  ( (array!28580 (arr!13730 (Array (_ BitVec 32) (_ BitVec 64))) (size!14083 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28579)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!460163 (= res!275156 (= k0!794 (select (arr!13730 _keys!709) from!863)))))

(assert (=> b!460163 (not (= (select (arr!13730 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!13371 0))(
  ( (Unit!13372) )
))
(declare-fun lt!208269 () Unit!13371)

(declare-fun e!268446 () Unit!13371)

(assert (=> b!460163 (= lt!208269 e!268446)))

(declare-fun c!56457 () Bool)

(assert (=> b!460163 (= c!56457 (= (select (arr!13730 _keys!709) from!863) k0!794))))

(declare-datatypes ((V!17627 0))(
  ( (V!17628 (val!6240 Int)) )
))
(declare-datatypes ((tuple2!8262 0))(
  ( (tuple2!8263 (_1!4142 (_ BitVec 64)) (_2!4142 V!17627)) )
))
(declare-datatypes ((List!8323 0))(
  ( (Nil!8320) (Cons!8319 (h!9175 tuple2!8262) (t!14246 List!8323)) )
))
(declare-datatypes ((ListLongMap!7165 0))(
  ( (ListLongMap!7166 (toList!3598 List!8323)) )
))
(declare-fun lt!208263 () ListLongMap!7165)

(declare-fun lt!208268 () ListLongMap!7165)

(assert (=> b!460163 (= lt!208263 lt!208268)))

(declare-fun lt!208266 () ListLongMap!7165)

(declare-fun lt!208275 () tuple2!8262)

(declare-fun +!1650 (ListLongMap!7165 tuple2!8262) ListLongMap!7165)

(assert (=> b!460163 (= lt!208268 (+!1650 lt!208266 lt!208275))))

(declare-fun lt!208274 () V!17627)

(assert (=> b!460163 (= lt!208275 (tuple2!8263 (select (arr!13730 _keys!709) from!863) lt!208274))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5852 0))(
  ( (ValueCellFull!5852 (v!8512 V!17627)) (EmptyCell!5852) )
))
(declare-datatypes ((array!28581 0))(
  ( (array!28582 (arr!13731 (Array (_ BitVec 32) ValueCell!5852)) (size!14084 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28581)

(declare-fun get!6785 (ValueCell!5852 V!17627) V!17627)

(declare-fun dynLambda!910 (Int (_ BitVec 64)) V!17627)

(assert (=> b!460163 (= lt!208274 (get!6785 (select (arr!13731 _values!549) from!863) (dynLambda!910 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460164 () Bool)

(declare-fun Unit!13373 () Unit!13371)

(assert (=> b!460164 (= e!268446 Unit!13373)))

(declare-fun lt!208270 () Unit!13371)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28579 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13371)

(assert (=> b!460164 (= lt!208270 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!460164 false))

(declare-fun b!460165 () Bool)

(declare-fun res!275166 () Bool)

(declare-fun e!268447 () Bool)

(assert (=> b!460165 (=> (not res!275166) (not e!268447))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!460165 (= res!275166 (and (= (size!14084 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14083 _keys!709) (size!14084 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!460166 () Bool)

(declare-fun e!268450 () Bool)

(declare-fun e!268455 () Bool)

(assert (=> b!460166 (= e!268450 e!268455)))

(declare-fun res!275154 () Bool)

(assert (=> b!460166 (=> (not res!275154) (not e!268455))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!460166 (= res!275154 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!17627)

(declare-fun lt!208276 () array!28581)

(declare-fun zeroValue!515 () V!17627)

(declare-fun lt!208277 () array!28579)

(declare-fun getCurrentListMapNoExtraKeys!1790 (array!28579 array!28581 (_ BitVec 32) (_ BitVec 32) V!17627 V!17627 (_ BitVec 32) Int) ListLongMap!7165)

(assert (=> b!460166 (= lt!208263 (getCurrentListMapNoExtraKeys!1790 lt!208277 lt!208276 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17627)

(assert (=> b!460166 (= lt!208276 (array!28582 (store (arr!13731 _values!549) i!563 (ValueCellFull!5852 v!412)) (size!14084 _values!549)))))

(declare-fun lt!208264 () ListLongMap!7165)

(assert (=> b!460166 (= lt!208264 (getCurrentListMapNoExtraKeys!1790 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!460167 () Bool)

(declare-fun res!275161 () Bool)

(assert (=> b!460167 (=> (not res!275161) (not e!268447))))

(declare-fun arrayContainsKey!0 (array!28579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!460167 (= res!275161 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!460168 () Bool)

(assert (=> b!460168 (= e!268455 (not e!268453))))

(declare-fun res!275158 () Bool)

(assert (=> b!460168 (=> res!275158 e!268453)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!460168 (= res!275158 (not (validKeyInArray!0 (select (arr!13730 _keys!709) from!863))))))

(declare-fun lt!208271 () ListLongMap!7165)

(assert (=> b!460168 (= lt!208271 lt!208266)))

(declare-fun lt!208272 () ListLongMap!7165)

(declare-fun lt!208273 () tuple2!8262)

(assert (=> b!460168 (= lt!208266 (+!1650 lt!208272 lt!208273))))

(assert (=> b!460168 (= lt!208271 (getCurrentListMapNoExtraKeys!1790 lt!208277 lt!208276 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!460168 (= lt!208273 (tuple2!8263 k0!794 v!412))))

(assert (=> b!460168 (= lt!208272 (getCurrentListMapNoExtraKeys!1790 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!208267 () Unit!13371)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!780 (array!28579 array!28581 (_ BitVec 32) (_ BitVec 32) V!17627 V!17627 (_ BitVec 32) (_ BitVec 64) V!17627 (_ BitVec 32) Int) Unit!13371)

(assert (=> b!460168 (= lt!208267 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!780 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!460169 () Bool)

(declare-fun res!275160 () Bool)

(assert (=> b!460169 (=> (not res!275160) (not e!268447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!460169 (= res!275160 (validMask!0 mask!1025))))

(declare-fun b!460170 () Bool)

(declare-fun e!268454 () Bool)

(declare-fun e!268449 () Bool)

(declare-fun mapRes!20236 () Bool)

(assert (=> b!460170 (= e!268454 (and e!268449 mapRes!20236))))

(declare-fun condMapEmpty!20236 () Bool)

(declare-fun mapDefault!20236 () ValueCell!5852)

(assert (=> b!460170 (= condMapEmpty!20236 (= (arr!13731 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5852)) mapDefault!20236)))))

(declare-fun b!460171 () Bool)

(declare-fun res!275153 () Bool)

(assert (=> b!460171 (=> (not res!275153) (not e!268447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28579 (_ BitVec 32)) Bool)

(assert (=> b!460171 (= res!275153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!460172 () Bool)

(declare-fun res!275165 () Bool)

(assert (=> b!460172 (=> (not res!275165) (not e!268447))))

(declare-datatypes ((List!8324 0))(
  ( (Nil!8321) (Cons!8320 (h!9176 (_ BitVec 64)) (t!14247 List!8324)) )
))
(declare-fun arrayNoDuplicates!0 (array!28579 (_ BitVec 32) List!8324) Bool)

(assert (=> b!460172 (= res!275165 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8321))))

(declare-fun b!460162 () Bool)

(declare-fun res!275162 () Bool)

(assert (=> b!460162 (=> (not res!275162) (not e!268450))))

(assert (=> b!460162 (= res!275162 (bvsle from!863 i!563))))

(declare-fun res!275164 () Bool)

(assert (=> start!41170 (=> (not res!275164) (not e!268447))))

(assert (=> start!41170 (= res!275164 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14083 _keys!709))))))

(assert (=> start!41170 e!268447))

(declare-fun tp_is_empty!12391 () Bool)

(assert (=> start!41170 tp_is_empty!12391))

(assert (=> start!41170 tp!38994))

(assert (=> start!41170 true))

(declare-fun array_inv!9992 (array!28581) Bool)

(assert (=> start!41170 (and (array_inv!9992 _values!549) e!268454)))

(declare-fun array_inv!9993 (array!28579) Bool)

(assert (=> start!41170 (array_inv!9993 _keys!709)))

(declare-fun b!460173 () Bool)

(assert (=> b!460173 (= e!268451 true)))

(assert (=> b!460173 (= lt!208268 (+!1650 (+!1650 lt!208272 lt!208275) lt!208273))))

(declare-fun lt!208265 () Unit!13371)

(declare-fun addCommutativeForDiffKeys!429 (ListLongMap!7165 (_ BitVec 64) V!17627 (_ BitVec 64) V!17627) Unit!13371)

(assert (=> b!460173 (= lt!208265 (addCommutativeForDiffKeys!429 lt!208272 k0!794 v!412 (select (arr!13730 _keys!709) from!863) lt!208274))))

(declare-fun mapNonEmpty!20236 () Bool)

(declare-fun tp!38995 () Bool)

(declare-fun e!268448 () Bool)

(assert (=> mapNonEmpty!20236 (= mapRes!20236 (and tp!38995 e!268448))))

(declare-fun mapRest!20236 () (Array (_ BitVec 32) ValueCell!5852))

(declare-fun mapKey!20236 () (_ BitVec 32))

(declare-fun mapValue!20236 () ValueCell!5852)

(assert (=> mapNonEmpty!20236 (= (arr!13731 _values!549) (store mapRest!20236 mapKey!20236 mapValue!20236))))

(declare-fun b!460174 () Bool)

(assert (=> b!460174 (= e!268447 e!268450)))

(declare-fun res!275155 () Bool)

(assert (=> b!460174 (=> (not res!275155) (not e!268450))))

(assert (=> b!460174 (= res!275155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208277 mask!1025))))

(assert (=> b!460174 (= lt!208277 (array!28580 (store (arr!13730 _keys!709) i!563 k0!794) (size!14083 _keys!709)))))

(declare-fun mapIsEmpty!20236 () Bool)

(assert (=> mapIsEmpty!20236 mapRes!20236))

(declare-fun b!460175 () Bool)

(assert (=> b!460175 (= e!268449 tp_is_empty!12391)))

(declare-fun b!460176 () Bool)

(assert (=> b!460176 (= e!268448 tp_is_empty!12391)))

(declare-fun b!460177 () Bool)

(declare-fun res!275167 () Bool)

(assert (=> b!460177 (=> (not res!275167) (not e!268450))))

(assert (=> b!460177 (= res!275167 (arrayNoDuplicates!0 lt!208277 #b00000000000000000000000000000000 Nil!8321))))

(declare-fun b!460178 () Bool)

(declare-fun Unit!13374 () Unit!13371)

(assert (=> b!460178 (= e!268446 Unit!13374)))

(declare-fun b!460179 () Bool)

(declare-fun res!275159 () Bool)

(assert (=> b!460179 (=> (not res!275159) (not e!268447))))

(assert (=> b!460179 (= res!275159 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14083 _keys!709))))))

(declare-fun b!460180 () Bool)

(declare-fun res!275163 () Bool)

(assert (=> b!460180 (=> (not res!275163) (not e!268447))))

(assert (=> b!460180 (= res!275163 (validKeyInArray!0 k0!794))))

(declare-fun b!460181 () Bool)

(declare-fun res!275157 () Bool)

(assert (=> b!460181 (=> (not res!275157) (not e!268447))))

(assert (=> b!460181 (= res!275157 (or (= (select (arr!13730 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13730 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!41170 res!275164) b!460169))

(assert (= (and b!460169 res!275160) b!460165))

(assert (= (and b!460165 res!275166) b!460171))

(assert (= (and b!460171 res!275153) b!460172))

(assert (= (and b!460172 res!275165) b!460179))

(assert (= (and b!460179 res!275159) b!460180))

(assert (= (and b!460180 res!275163) b!460181))

(assert (= (and b!460181 res!275157) b!460167))

(assert (= (and b!460167 res!275161) b!460174))

(assert (= (and b!460174 res!275155) b!460177))

(assert (= (and b!460177 res!275167) b!460162))

(assert (= (and b!460162 res!275162) b!460166))

(assert (= (and b!460166 res!275154) b!460168))

(assert (= (and b!460168 (not res!275158)) b!460163))

(assert (= (and b!460163 c!56457) b!460164))

(assert (= (and b!460163 (not c!56457)) b!460178))

(assert (= (and b!460163 (not res!275156)) b!460173))

(assert (= (and b!460170 condMapEmpty!20236) mapIsEmpty!20236))

(assert (= (and b!460170 (not condMapEmpty!20236)) mapNonEmpty!20236))

(get-info :version)

(assert (= (and mapNonEmpty!20236 ((_ is ValueCellFull!5852) mapValue!20236)) b!460176))

(assert (= (and b!460170 ((_ is ValueCellFull!5852) mapDefault!20236)) b!460175))

(assert (= start!41170 b!460170))

(declare-fun b_lambda!9869 () Bool)

(assert (=> (not b_lambda!9869) (not b!460163)))

(declare-fun t!14245 () Bool)

(declare-fun tb!3881 () Bool)

(assert (=> (and start!41170 (= defaultEntry!557 defaultEntry!557) t!14245) tb!3881))

(declare-fun result!7315 () Bool)

(assert (=> tb!3881 (= result!7315 tp_is_empty!12391)))

(assert (=> b!460163 t!14245))

(declare-fun b_and!19321 () Bool)

(assert (= b_and!19319 (and (=> t!14245 result!7315) b_and!19321)))

(declare-fun m!442891 () Bool)

(assert (=> b!460166 m!442891))

(declare-fun m!442893 () Bool)

(assert (=> b!460166 m!442893))

(declare-fun m!442895 () Bool)

(assert (=> b!460166 m!442895))

(declare-fun m!442897 () Bool)

(assert (=> b!460171 m!442897))

(declare-fun m!442899 () Bool)

(assert (=> b!460173 m!442899))

(assert (=> b!460173 m!442899))

(declare-fun m!442901 () Bool)

(assert (=> b!460173 m!442901))

(declare-fun m!442903 () Bool)

(assert (=> b!460173 m!442903))

(assert (=> b!460173 m!442903))

(declare-fun m!442905 () Bool)

(assert (=> b!460173 m!442905))

(declare-fun m!442907 () Bool)

(assert (=> start!41170 m!442907))

(declare-fun m!442909 () Bool)

(assert (=> start!41170 m!442909))

(declare-fun m!442911 () Bool)

(assert (=> mapNonEmpty!20236 m!442911))

(declare-fun m!442913 () Bool)

(assert (=> b!460177 m!442913))

(declare-fun m!442915 () Bool)

(assert (=> b!460167 m!442915))

(declare-fun m!442917 () Bool)

(assert (=> b!460169 m!442917))

(declare-fun m!442919 () Bool)

(assert (=> b!460180 m!442919))

(declare-fun m!442921 () Bool)

(assert (=> b!460181 m!442921))

(assert (=> b!460163 m!442903))

(declare-fun m!442923 () Bool)

(assert (=> b!460163 m!442923))

(declare-fun m!442925 () Bool)

(assert (=> b!460163 m!442925))

(declare-fun m!442927 () Bool)

(assert (=> b!460163 m!442927))

(assert (=> b!460163 m!442927))

(assert (=> b!460163 m!442923))

(declare-fun m!442929 () Bool)

(assert (=> b!460163 m!442929))

(declare-fun m!442931 () Bool)

(assert (=> b!460164 m!442931))

(declare-fun m!442933 () Bool)

(assert (=> b!460174 m!442933))

(declare-fun m!442935 () Bool)

(assert (=> b!460174 m!442935))

(declare-fun m!442937 () Bool)

(assert (=> b!460172 m!442937))

(assert (=> b!460168 m!442903))

(declare-fun m!442939 () Bool)

(assert (=> b!460168 m!442939))

(assert (=> b!460168 m!442903))

(declare-fun m!442941 () Bool)

(assert (=> b!460168 m!442941))

(declare-fun m!442943 () Bool)

(assert (=> b!460168 m!442943))

(declare-fun m!442945 () Bool)

(assert (=> b!460168 m!442945))

(declare-fun m!442947 () Bool)

(assert (=> b!460168 m!442947))

(check-sat (not b!460166) (not b!460172) tp_is_empty!12391 (not b!460168) (not b!460171) (not b!460163) (not start!41170) (not b!460173) b_and!19321 (not b!460164) (not b!460174) (not b_lambda!9869) (not b!460180) (not b!460169) (not b!460167) (not b_next!11053) (not mapNonEmpty!20236) (not b!460177))
(check-sat b_and!19321 (not b_next!11053))
