; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20602 () Bool)

(assert start!20602)

(declare-fun b_free!5257 () Bool)

(declare-fun b_next!5257 () Bool)

(assert (=> start!20602 (= b_free!5257 (not b_next!5257))))

(declare-fun tp!18802 () Bool)

(declare-fun b_and!11977 () Bool)

(assert (=> start!20602 (= tp!18802 b_and!11977)))

(declare-fun mapNonEmpty!8738 () Bool)

(declare-fun mapRes!8738 () Bool)

(declare-fun tp!18803 () Bool)

(declare-fun e!134151 () Bool)

(assert (=> mapNonEmpty!8738 (= mapRes!8738 (and tp!18803 e!134151))))

(declare-fun mapKey!8738 () (_ BitVec 32))

(declare-datatypes ((V!6465 0))(
  ( (V!6466 (val!2601 Int)) )
))
(declare-datatypes ((ValueCell!2213 0))(
  ( (ValueCellFull!2213 (v!4565 V!6465)) (EmptyCell!2213) )
))
(declare-datatypes ((array!9425 0))(
  ( (array!9426 (arr!4462 (Array (_ BitVec 32) ValueCell!2213)) (size!4788 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9425)

(declare-fun mapValue!8738 () ValueCell!2213)

(declare-fun mapRest!8738 () (Array (_ BitVec 32) ValueCell!2213))

(assert (=> mapNonEmpty!8738 (= (arr!4462 _values!649) (store mapRest!8738 mapKey!8738 mapValue!8738))))

(declare-fun b!205125 () Bool)

(declare-fun e!134147 () Bool)

(declare-fun tp_is_empty!5113 () Bool)

(assert (=> b!205125 (= e!134147 tp_is_empty!5113)))

(declare-fun b!205126 () Bool)

(declare-fun res!99036 () Bool)

(declare-fun e!134145 () Bool)

(assert (=> b!205126 (=> (not res!99036) (not e!134145))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9427 0))(
  ( (array!9428 (arr!4463 (Array (_ BitVec 32) (_ BitVec 64))) (size!4789 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9427)

(assert (=> b!205126 (= res!99036 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4789 _keys!825))))))

(declare-fun b!205127 () Bool)

(declare-fun e!134149 () Bool)

(declare-fun e!134150 () Bool)

(assert (=> b!205127 (= e!134149 e!134150)))

(declare-fun res!99042 () Bool)

(assert (=> b!205127 (=> res!99042 e!134150)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!205127 (= res!99042 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3928 0))(
  ( (tuple2!3929 (_1!1975 (_ BitVec 64)) (_2!1975 V!6465)) )
))
(declare-datatypes ((List!2830 0))(
  ( (Nil!2827) (Cons!2826 (h!3468 tuple2!3928) (t!7752 List!2830)) )
))
(declare-datatypes ((ListLongMap!2831 0))(
  ( (ListLongMap!2832 (toList!1431 List!2830)) )
))
(declare-fun lt!104225 () ListLongMap!2831)

(declare-fun lt!104228 () ListLongMap!2831)

(assert (=> b!205127 (= lt!104225 lt!104228)))

(declare-fun lt!104223 () ListLongMap!2831)

(declare-fun lt!104231 () tuple2!3928)

(declare-fun +!480 (ListLongMap!2831 tuple2!3928) ListLongMap!2831)

(assert (=> b!205127 (= lt!104228 (+!480 lt!104223 lt!104231))))

(declare-fun lt!104229 () ListLongMap!2831)

(declare-fun lt!104230 () ListLongMap!2831)

(assert (=> b!205127 (= lt!104229 lt!104230)))

(declare-fun lt!104232 () ListLongMap!2831)

(assert (=> b!205127 (= lt!104230 (+!480 lt!104232 lt!104231))))

(declare-fun lt!104234 () ListLongMap!2831)

(assert (=> b!205127 (= lt!104229 (+!480 lt!104234 lt!104231))))

(declare-fun minValue!615 () V!6465)

(assert (=> b!205127 (= lt!104231 (tuple2!3929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205128 () Bool)

(declare-fun res!99038 () Bool)

(assert (=> b!205128 (=> (not res!99038) (not e!134145))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9427 (_ BitVec 32)) Bool)

(assert (=> b!205128 (= res!99038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8738 () Bool)

(assert (=> mapIsEmpty!8738 mapRes!8738))

(declare-fun b!205129 () Bool)

(declare-fun e!134146 () Bool)

(assert (=> b!205129 (= e!134146 (and e!134147 mapRes!8738))))

(declare-fun condMapEmpty!8738 () Bool)

(declare-fun mapDefault!8738 () ValueCell!2213)

(assert (=> b!205129 (= condMapEmpty!8738 (= (arr!4462 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2213)) mapDefault!8738)))))

(declare-fun b!205130 () Bool)

(declare-fun res!99039 () Bool)

(assert (=> b!205130 (=> (not res!99039) (not e!134145))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!205130 (= res!99039 (and (= (size!4788 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4789 _keys!825) (size!4788 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205131 () Bool)

(declare-fun res!99040 () Bool)

(assert (=> b!205131 (=> (not res!99040) (not e!134145))))

(assert (=> b!205131 (= res!99040 (= (select (arr!4463 _keys!825) i!601) k0!843))))

(declare-fun b!205132 () Bool)

(assert (=> b!205132 (= e!134145 (not e!134149))))

(declare-fun res!99037 () Bool)

(assert (=> b!205132 (=> res!99037 e!134149)))

(assert (=> b!205132 (= res!99037 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6465)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!976 (array!9427 array!9425 (_ BitVec 32) (_ BitVec 32) V!6465 V!6465 (_ BitVec 32) Int) ListLongMap!2831)

(assert (=> b!205132 (= lt!104225 (getCurrentListMap!976 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104227 () array!9425)

(assert (=> b!205132 (= lt!104229 (getCurrentListMap!976 _keys!825 lt!104227 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205132 (and (= lt!104234 lt!104232) (= lt!104232 lt!104234))))

(declare-fun lt!104224 () tuple2!3928)

(assert (=> b!205132 (= lt!104232 (+!480 lt!104223 lt!104224))))

(declare-fun v!520 () V!6465)

(assert (=> b!205132 (= lt!104224 (tuple2!3929 k0!843 v!520))))

(declare-datatypes ((Unit!6202 0))(
  ( (Unit!6203) )
))
(declare-fun lt!104233 () Unit!6202)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!135 (array!9427 array!9425 (_ BitVec 32) (_ BitVec 32) V!6465 V!6465 (_ BitVec 32) (_ BitVec 64) V!6465 (_ BitVec 32) Int) Unit!6202)

(assert (=> b!205132 (= lt!104233 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!135 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!386 (array!9427 array!9425 (_ BitVec 32) (_ BitVec 32) V!6465 V!6465 (_ BitVec 32) Int) ListLongMap!2831)

(assert (=> b!205132 (= lt!104234 (getCurrentListMapNoExtraKeys!386 _keys!825 lt!104227 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205132 (= lt!104227 (array!9426 (store (arr!4462 _values!649) i!601 (ValueCellFull!2213 v!520)) (size!4788 _values!649)))))

(assert (=> b!205132 (= lt!104223 (getCurrentListMapNoExtraKeys!386 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!205133 () Bool)

(declare-fun res!99041 () Bool)

(assert (=> b!205133 (=> (not res!99041) (not e!134145))))

(declare-datatypes ((List!2831 0))(
  ( (Nil!2828) (Cons!2827 (h!3469 (_ BitVec 64)) (t!7753 List!2831)) )
))
(declare-fun arrayNoDuplicates!0 (array!9427 (_ BitVec 32) List!2831) Bool)

(assert (=> b!205133 (= res!99041 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2828))))

(declare-fun res!99044 () Bool)

(assert (=> start!20602 (=> (not res!99044) (not e!134145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20602 (= res!99044 (validMask!0 mask!1149))))

(assert (=> start!20602 e!134145))

(declare-fun array_inv!2933 (array!9425) Bool)

(assert (=> start!20602 (and (array_inv!2933 _values!649) e!134146)))

(assert (=> start!20602 true))

(assert (=> start!20602 tp_is_empty!5113))

(declare-fun array_inv!2934 (array!9427) Bool)

(assert (=> start!20602 (array_inv!2934 _keys!825)))

(assert (=> start!20602 tp!18802))

(declare-fun b!205134 () Bool)

(assert (=> b!205134 (= e!134150 true)))

(assert (=> b!205134 (= lt!104230 (+!480 lt!104228 lt!104224))))

(declare-fun lt!104226 () Unit!6202)

(declare-fun addCommutativeForDiffKeys!169 (ListLongMap!2831 (_ BitVec 64) V!6465 (_ BitVec 64) V!6465) Unit!6202)

(assert (=> b!205134 (= lt!104226 (addCommutativeForDiffKeys!169 lt!104223 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205135 () Bool)

(assert (=> b!205135 (= e!134151 tp_is_empty!5113)))

(declare-fun b!205136 () Bool)

(declare-fun res!99043 () Bool)

(assert (=> b!205136 (=> (not res!99043) (not e!134145))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205136 (= res!99043 (validKeyInArray!0 k0!843))))

(assert (= (and start!20602 res!99044) b!205130))

(assert (= (and b!205130 res!99039) b!205128))

(assert (= (and b!205128 res!99038) b!205133))

(assert (= (and b!205133 res!99041) b!205126))

(assert (= (and b!205126 res!99036) b!205136))

(assert (= (and b!205136 res!99043) b!205131))

(assert (= (and b!205131 res!99040) b!205132))

(assert (= (and b!205132 (not res!99037)) b!205127))

(assert (= (and b!205127 (not res!99042)) b!205134))

(assert (= (and b!205129 condMapEmpty!8738) mapIsEmpty!8738))

(assert (= (and b!205129 (not condMapEmpty!8738)) mapNonEmpty!8738))

(get-info :version)

(assert (= (and mapNonEmpty!8738 ((_ is ValueCellFull!2213) mapValue!8738)) b!205135))

(assert (= (and b!205129 ((_ is ValueCellFull!2213) mapDefault!8738)) b!205125))

(assert (= start!20602 b!205129))

(declare-fun m!232263 () Bool)

(assert (=> b!205127 m!232263))

(declare-fun m!232265 () Bool)

(assert (=> b!205127 m!232265))

(declare-fun m!232267 () Bool)

(assert (=> b!205127 m!232267))

(declare-fun m!232269 () Bool)

(assert (=> b!205132 m!232269))

(declare-fun m!232271 () Bool)

(assert (=> b!205132 m!232271))

(declare-fun m!232273 () Bool)

(assert (=> b!205132 m!232273))

(declare-fun m!232275 () Bool)

(assert (=> b!205132 m!232275))

(declare-fun m!232277 () Bool)

(assert (=> b!205132 m!232277))

(declare-fun m!232279 () Bool)

(assert (=> b!205132 m!232279))

(declare-fun m!232281 () Bool)

(assert (=> b!205132 m!232281))

(declare-fun m!232283 () Bool)

(assert (=> b!205131 m!232283))

(declare-fun m!232285 () Bool)

(assert (=> mapNonEmpty!8738 m!232285))

(declare-fun m!232287 () Bool)

(assert (=> b!205136 m!232287))

(declare-fun m!232289 () Bool)

(assert (=> b!205134 m!232289))

(declare-fun m!232291 () Bool)

(assert (=> b!205134 m!232291))

(declare-fun m!232293 () Bool)

(assert (=> start!20602 m!232293))

(declare-fun m!232295 () Bool)

(assert (=> start!20602 m!232295))

(declare-fun m!232297 () Bool)

(assert (=> start!20602 m!232297))

(declare-fun m!232299 () Bool)

(assert (=> b!205128 m!232299))

(declare-fun m!232301 () Bool)

(assert (=> b!205133 m!232301))

(check-sat (not b!205134) (not b!205132) (not b!205133) tp_is_empty!5113 (not b_next!5257) (not mapNonEmpty!8738) (not b!205128) (not b!205127) b_and!11977 (not start!20602) (not b!205136))
(check-sat b_and!11977 (not b_next!5257))
