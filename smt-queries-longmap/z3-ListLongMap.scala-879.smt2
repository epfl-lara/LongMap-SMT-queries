; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20372 () Bool)

(assert start!20372)

(declare-fun b_free!5031 () Bool)

(declare-fun b_next!5031 () Bool)

(assert (=> start!20372 (= b_free!5031 (not b_next!5031))))

(declare-fun tp!18125 () Bool)

(declare-fun b_and!11777 () Bool)

(assert (=> start!20372 (= tp!18125 b_and!11777)))

(declare-fun b!201186 () Bool)

(declare-fun res!96063 () Bool)

(declare-fun e!131874 () Bool)

(assert (=> b!201186 (=> (not res!96063) (not e!131874))))

(declare-datatypes ((array!9003 0))(
  ( (array!9004 (arr!4252 (Array (_ BitVec 32) (_ BitVec 64))) (size!4577 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9003)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!201186 (= res!96063 (= (select (arr!4252 _keys!825) i!601) k0!843))))

(declare-fun res!96068 () Bool)

(assert (=> start!20372 (=> (not res!96068) (not e!131874))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20372 (= res!96068 (validMask!0 mask!1149))))

(assert (=> start!20372 e!131874))

(declare-datatypes ((V!6163 0))(
  ( (V!6164 (val!2488 Int)) )
))
(declare-datatypes ((ValueCell!2100 0))(
  ( (ValueCellFull!2100 (v!4458 V!6163)) (EmptyCell!2100) )
))
(declare-datatypes ((array!9005 0))(
  ( (array!9006 (arr!4253 (Array (_ BitVec 32) ValueCell!2100)) (size!4578 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9005)

(declare-fun e!131875 () Bool)

(declare-fun array_inv!2801 (array!9005) Bool)

(assert (=> start!20372 (and (array_inv!2801 _values!649) e!131875)))

(assert (=> start!20372 true))

(declare-fun tp_is_empty!4887 () Bool)

(assert (=> start!20372 tp_is_empty!4887))

(declare-fun array_inv!2802 (array!9003) Bool)

(assert (=> start!20372 (array_inv!2802 _keys!825)))

(assert (=> start!20372 tp!18125))

(declare-fun mapNonEmpty!8399 () Bool)

(declare-fun mapRes!8399 () Bool)

(declare-fun tp!18124 () Bool)

(declare-fun e!131877 () Bool)

(assert (=> mapNonEmpty!8399 (= mapRes!8399 (and tp!18124 e!131877))))

(declare-fun mapRest!8399 () (Array (_ BitVec 32) ValueCell!2100))

(declare-fun mapKey!8399 () (_ BitVec 32))

(declare-fun mapValue!8399 () ValueCell!2100)

(assert (=> mapNonEmpty!8399 (= (arr!4253 _values!649) (store mapRest!8399 mapKey!8399 mapValue!8399))))

(declare-fun b!201187 () Bool)

(declare-fun e!131879 () Bool)

(assert (=> b!201187 (= e!131875 (and e!131879 mapRes!8399))))

(declare-fun condMapEmpty!8399 () Bool)

(declare-fun mapDefault!8399 () ValueCell!2100)

(assert (=> b!201187 (= condMapEmpty!8399 (= (arr!4253 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2100)) mapDefault!8399)))))

(declare-fun mapIsEmpty!8399 () Bool)

(assert (=> mapIsEmpty!8399 mapRes!8399))

(declare-fun b!201188 () Bool)

(declare-fun e!131878 () Bool)

(assert (=> b!201188 (= e!131878 true)))

(declare-datatypes ((tuple2!3764 0))(
  ( (tuple2!3765 (_1!1893 (_ BitVec 64)) (_2!1893 V!6163)) )
))
(declare-datatypes ((List!2680 0))(
  ( (Nil!2677) (Cons!2676 (h!3318 tuple2!3764) (t!7611 List!2680)) )
))
(declare-datatypes ((ListLongMap!2677 0))(
  ( (ListLongMap!2678 (toList!1354 List!2680)) )
))
(declare-fun lt!100041 () ListLongMap!2677)

(declare-fun lt!100038 () ListLongMap!2677)

(declare-fun lt!100035 () tuple2!3764)

(declare-fun lt!100042 () tuple2!3764)

(declare-fun +!381 (ListLongMap!2677 tuple2!3764) ListLongMap!2677)

(assert (=> b!201188 (= (+!381 lt!100041 lt!100035) (+!381 lt!100038 lt!100042))))

(declare-fun minValue!615 () V!6163)

(declare-fun lt!100039 () ListLongMap!2677)

(declare-fun v!520 () V!6163)

(declare-datatypes ((Unit!6062 0))(
  ( (Unit!6063) )
))
(declare-fun lt!100032 () Unit!6062)

(declare-fun addCommutativeForDiffKeys!102 (ListLongMap!2677 (_ BitVec 64) V!6163 (_ BitVec 64) V!6163) Unit!6062)

(assert (=> b!201188 (= lt!100032 (addCommutativeForDiffKeys!102 lt!100039 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201189 () Bool)

(declare-fun res!96066 () Bool)

(assert (=> b!201189 (=> (not res!96066) (not e!131874))))

(declare-datatypes ((List!2681 0))(
  ( (Nil!2678) (Cons!2677 (h!3319 (_ BitVec 64)) (t!7612 List!2681)) )
))
(declare-fun arrayNoDuplicates!0 (array!9003 (_ BitVec 32) List!2681) Bool)

(assert (=> b!201189 (= res!96066 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2678))))

(declare-fun b!201190 () Bool)

(declare-fun res!96065 () Bool)

(assert (=> b!201190 (=> (not res!96065) (not e!131874))))

(assert (=> b!201190 (= res!96065 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4577 _keys!825))))))

(declare-fun b!201191 () Bool)

(assert (=> b!201191 (= e!131877 tp_is_empty!4887)))

(declare-fun b!201192 () Bool)

(declare-fun res!96070 () Bool)

(assert (=> b!201192 (=> (not res!96070) (not e!131874))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201192 (= res!96070 (validKeyInArray!0 k0!843))))

(declare-fun b!201193 () Bool)

(declare-fun res!96067 () Bool)

(assert (=> b!201193 (=> (not res!96067) (not e!131874))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201193 (= res!96067 (and (= (size!4578 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4577 _keys!825) (size!4578 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!201194 () Bool)

(assert (=> b!201194 (= e!131879 tp_is_empty!4887)))

(declare-fun b!201195 () Bool)

(declare-fun res!96064 () Bool)

(assert (=> b!201195 (=> (not res!96064) (not e!131874))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9003 (_ BitVec 32)) Bool)

(assert (=> b!201195 (= res!96064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!201196 () Bool)

(declare-fun e!131873 () Bool)

(assert (=> b!201196 (= e!131873 e!131878)))

(declare-fun res!96069 () Bool)

(assert (=> b!201196 (=> res!96069 e!131878)))

(assert (=> b!201196 (= res!96069 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!100040 () ListLongMap!2677)

(assert (=> b!201196 (= lt!100040 lt!100041)))

(assert (=> b!201196 (= lt!100041 (+!381 lt!100039 lt!100042))))

(declare-fun lt!100034 () ListLongMap!2677)

(declare-fun lt!100044 () Unit!6062)

(declare-fun zeroValue!615 () V!6163)

(assert (=> b!201196 (= lt!100044 (addCommutativeForDiffKeys!102 lt!100034 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!100046 () ListLongMap!2677)

(assert (=> b!201196 (= lt!100046 (+!381 lt!100040 lt!100035))))

(declare-fun lt!100045 () ListLongMap!2677)

(declare-fun lt!100043 () tuple2!3764)

(assert (=> b!201196 (= lt!100040 (+!381 lt!100045 lt!100043))))

(declare-fun lt!100047 () ListLongMap!2677)

(assert (=> b!201196 (= lt!100047 lt!100038)))

(assert (=> b!201196 (= lt!100038 (+!381 lt!100039 lt!100035))))

(assert (=> b!201196 (= lt!100039 (+!381 lt!100034 lt!100043))))

(declare-fun lt!100037 () ListLongMap!2677)

(assert (=> b!201196 (= lt!100046 (+!381 (+!381 lt!100037 lt!100043) lt!100035))))

(assert (=> b!201196 (= lt!100035 (tuple2!3765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201196 (= lt!100043 (tuple2!3765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201197 () Bool)

(assert (=> b!201197 (= e!131874 (not e!131873))))

(declare-fun res!96062 () Bool)

(assert (=> b!201197 (=> res!96062 e!131873)))

(assert (=> b!201197 (= res!96062 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!943 (array!9003 array!9005 (_ BitVec 32) (_ BitVec 32) V!6163 V!6163 (_ BitVec 32) Int) ListLongMap!2677)

(assert (=> b!201197 (= lt!100047 (getCurrentListMap!943 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100033 () array!9005)

(assert (=> b!201197 (= lt!100046 (getCurrentListMap!943 _keys!825 lt!100033 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201197 (and (= lt!100037 lt!100045) (= lt!100045 lt!100037))))

(assert (=> b!201197 (= lt!100045 (+!381 lt!100034 lt!100042))))

(assert (=> b!201197 (= lt!100042 (tuple2!3765 k0!843 v!520))))

(declare-fun lt!100036 () Unit!6062)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!56 (array!9003 array!9005 (_ BitVec 32) (_ BitVec 32) V!6163 V!6163 (_ BitVec 32) (_ BitVec 64) V!6163 (_ BitVec 32) Int) Unit!6062)

(assert (=> b!201197 (= lt!100036 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!56 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!317 (array!9003 array!9005 (_ BitVec 32) (_ BitVec 32) V!6163 V!6163 (_ BitVec 32) Int) ListLongMap!2677)

(assert (=> b!201197 (= lt!100037 (getCurrentListMapNoExtraKeys!317 _keys!825 lt!100033 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201197 (= lt!100033 (array!9006 (store (arr!4253 _values!649) i!601 (ValueCellFull!2100 v!520)) (size!4578 _values!649)))))

(assert (=> b!201197 (= lt!100034 (getCurrentListMapNoExtraKeys!317 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!20372 res!96068) b!201193))

(assert (= (and b!201193 res!96067) b!201195))

(assert (= (and b!201195 res!96064) b!201189))

(assert (= (and b!201189 res!96066) b!201190))

(assert (= (and b!201190 res!96065) b!201192))

(assert (= (and b!201192 res!96070) b!201186))

(assert (= (and b!201186 res!96063) b!201197))

(assert (= (and b!201197 (not res!96062)) b!201196))

(assert (= (and b!201196 (not res!96069)) b!201188))

(assert (= (and b!201187 condMapEmpty!8399) mapIsEmpty!8399))

(assert (= (and b!201187 (not condMapEmpty!8399)) mapNonEmpty!8399))

(get-info :version)

(assert (= (and mapNonEmpty!8399 ((_ is ValueCellFull!2100) mapValue!8399)) b!201191))

(assert (= (and b!201187 ((_ is ValueCellFull!2100) mapDefault!8399)) b!201194))

(assert (= start!20372 b!201187))

(declare-fun m!227999 () Bool)

(assert (=> b!201195 m!227999))

(declare-fun m!228001 () Bool)

(assert (=> b!201189 m!228001))

(declare-fun m!228003 () Bool)

(assert (=> b!201188 m!228003))

(declare-fun m!228005 () Bool)

(assert (=> b!201188 m!228005))

(declare-fun m!228007 () Bool)

(assert (=> b!201188 m!228007))

(declare-fun m!228009 () Bool)

(assert (=> b!201196 m!228009))

(declare-fun m!228011 () Bool)

(assert (=> b!201196 m!228011))

(declare-fun m!228013 () Bool)

(assert (=> b!201196 m!228013))

(declare-fun m!228015 () Bool)

(assert (=> b!201196 m!228015))

(declare-fun m!228017 () Bool)

(assert (=> b!201196 m!228017))

(assert (=> b!201196 m!228009))

(declare-fun m!228019 () Bool)

(assert (=> b!201196 m!228019))

(declare-fun m!228021 () Bool)

(assert (=> b!201196 m!228021))

(declare-fun m!228023 () Bool)

(assert (=> b!201196 m!228023))

(declare-fun m!228025 () Bool)

(assert (=> b!201186 m!228025))

(declare-fun m!228027 () Bool)

(assert (=> mapNonEmpty!8399 m!228027))

(declare-fun m!228029 () Bool)

(assert (=> start!20372 m!228029))

(declare-fun m!228031 () Bool)

(assert (=> start!20372 m!228031))

(declare-fun m!228033 () Bool)

(assert (=> start!20372 m!228033))

(declare-fun m!228035 () Bool)

(assert (=> b!201197 m!228035))

(declare-fun m!228037 () Bool)

(assert (=> b!201197 m!228037))

(declare-fun m!228039 () Bool)

(assert (=> b!201197 m!228039))

(declare-fun m!228041 () Bool)

(assert (=> b!201197 m!228041))

(declare-fun m!228043 () Bool)

(assert (=> b!201197 m!228043))

(declare-fun m!228045 () Bool)

(assert (=> b!201197 m!228045))

(declare-fun m!228047 () Bool)

(assert (=> b!201197 m!228047))

(declare-fun m!228049 () Bool)

(assert (=> b!201192 m!228049))

(check-sat tp_is_empty!4887 (not b!201196) b_and!11777 (not b!201195) (not b_next!5031) (not b!201192) (not mapNonEmpty!8399) (not b!201188) (not b!201197) (not b!201189) (not start!20372))
(check-sat b_and!11777 (not b_next!5031))
