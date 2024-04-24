; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20866 () Bool)

(assert start!20866)

(declare-fun b_free!5515 () Bool)

(declare-fun b_next!5515 () Bool)

(assert (=> start!20866 (= b_free!5515 (not b_next!5515))))

(declare-fun tp!19586 () Bool)

(declare-fun b_and!12275 () Bool)

(assert (=> start!20866 (= tp!19586 b_and!12275)))

(declare-fun b!209437 () Bool)

(declare-fun e!136444 () Bool)

(declare-fun e!136445 () Bool)

(declare-fun mapRes!9134 () Bool)

(assert (=> b!209437 (= e!136444 (and e!136445 mapRes!9134))))

(declare-fun condMapEmpty!9134 () Bool)

(declare-datatypes ((V!6817 0))(
  ( (V!6818 (val!2733 Int)) )
))
(declare-datatypes ((ValueCell!2345 0))(
  ( (ValueCellFull!2345 (v!4704 V!6817)) (EmptyCell!2345) )
))
(declare-datatypes ((array!9947 0))(
  ( (array!9948 (arr!4724 (Array (_ BitVec 32) ValueCell!2345)) (size!5049 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9947)

(declare-fun mapDefault!9134 () ValueCell!2345)

(assert (=> b!209437 (= condMapEmpty!9134 (= (arr!4724 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2345)) mapDefault!9134)))))

(declare-fun b!209438 () Bool)

(declare-fun res!102087 () Bool)

(declare-fun e!136448 () Bool)

(assert (=> b!209438 (=> (not res!102087) (not e!136448))))

(declare-datatypes ((array!9949 0))(
  ( (array!9950 (arr!4725 (Array (_ BitVec 32) (_ BitVec 64))) (size!5050 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9949)

(declare-datatypes ((List!2961 0))(
  ( (Nil!2958) (Cons!2957 (h!3599 (_ BitVec 64)) (t!7884 List!2961)) )
))
(declare-fun arrayNoDuplicates!0 (array!9949 (_ BitVec 32) List!2961) Bool)

(assert (=> b!209438 (= res!102087 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2958))))

(declare-fun b!209439 () Bool)

(declare-fun res!102082 () Bool)

(assert (=> b!209439 (=> (not res!102082) (not e!136448))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!209439 (= res!102082 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5050 _keys!825))))))

(declare-fun b!209440 () Bool)

(declare-fun tp_is_empty!5377 () Bool)

(assert (=> b!209440 (= e!136445 tp_is_empty!5377)))

(declare-fun mapNonEmpty!9134 () Bool)

(declare-fun tp!19585 () Bool)

(declare-fun e!136446 () Bool)

(assert (=> mapNonEmpty!9134 (= mapRes!9134 (and tp!19585 e!136446))))

(declare-fun mapKey!9134 () (_ BitVec 32))

(declare-fun mapRest!9134 () (Array (_ BitVec 32) ValueCell!2345))

(declare-fun mapValue!9134 () ValueCell!2345)

(assert (=> mapNonEmpty!9134 (= (arr!4724 _values!649) (store mapRest!9134 mapKey!9134 mapValue!9134))))

(declare-fun b!209441 () Bool)

(declare-fun res!102084 () Bool)

(assert (=> b!209441 (=> (not res!102084) (not e!136448))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!209441 (= res!102084 (= (select (arr!4725 _keys!825) i!601) k0!843))))

(declare-fun res!102086 () Bool)

(assert (=> start!20866 (=> (not res!102086) (not e!136448))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20866 (= res!102086 (validMask!0 mask!1149))))

(assert (=> start!20866 e!136448))

(declare-fun array_inv!3099 (array!9947) Bool)

(assert (=> start!20866 (and (array_inv!3099 _values!649) e!136444)))

(assert (=> start!20866 true))

(assert (=> start!20866 tp_is_empty!5377))

(declare-fun array_inv!3100 (array!9949) Bool)

(assert (=> start!20866 (array_inv!3100 _keys!825)))

(assert (=> start!20866 tp!19586))

(declare-fun b!209442 () Bool)

(assert (=> b!209442 (= e!136446 tp_is_empty!5377)))

(declare-fun b!209443 () Bool)

(assert (=> b!209443 (= e!136448 (not (bvslt i!601 (size!5049 _values!649))))))

(declare-datatypes ((tuple2!4074 0))(
  ( (tuple2!4075 (_1!2048 (_ BitVec 64)) (_2!2048 V!6817)) )
))
(declare-datatypes ((List!2962 0))(
  ( (Nil!2959) (Cons!2958 (h!3600 tuple2!4074) (t!7885 List!2962)) )
))
(declare-datatypes ((ListLongMap!2989 0))(
  ( (ListLongMap!2990 (toList!1510 List!2962)) )
))
(declare-fun lt!107057 () ListLongMap!2989)

(declare-fun lt!107060 () ListLongMap!2989)

(assert (=> b!209443 (and (= lt!107057 lt!107060) (= lt!107060 lt!107057))))

(declare-fun lt!107059 () ListLongMap!2989)

(declare-fun v!520 () V!6817)

(declare-fun +!539 (ListLongMap!2989 tuple2!4074) ListLongMap!2989)

(assert (=> b!209443 (= lt!107060 (+!539 lt!107059 (tuple2!4075 k0!843 v!520)))))

(declare-datatypes ((Unit!6354 0))(
  ( (Unit!6355) )
))
(declare-fun lt!107058 () Unit!6354)

(declare-fun zeroValue!615 () V!6817)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6817)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!191 (array!9949 array!9947 (_ BitVec 32) (_ BitVec 32) V!6817 V!6817 (_ BitVec 32) (_ BitVec 64) V!6817 (_ BitVec 32) Int) Unit!6354)

(assert (=> b!209443 (= lt!107058 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!191 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!473 (array!9949 array!9947 (_ BitVec 32) (_ BitVec 32) V!6817 V!6817 (_ BitVec 32) Int) ListLongMap!2989)

(assert (=> b!209443 (= lt!107057 (getCurrentListMapNoExtraKeys!473 _keys!825 (array!9948 (store (arr!4724 _values!649) i!601 (ValueCellFull!2345 v!520)) (size!5049 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!209443 (= lt!107059 (getCurrentListMapNoExtraKeys!473 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209444 () Bool)

(declare-fun res!102083 () Bool)

(assert (=> b!209444 (=> (not res!102083) (not e!136448))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!209444 (= res!102083 (validKeyInArray!0 k0!843))))

(declare-fun b!209445 () Bool)

(declare-fun res!102088 () Bool)

(assert (=> b!209445 (=> (not res!102088) (not e!136448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9949 (_ BitVec 32)) Bool)

(assert (=> b!209445 (= res!102088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!209446 () Bool)

(declare-fun res!102085 () Bool)

(assert (=> b!209446 (=> (not res!102085) (not e!136448))))

(assert (=> b!209446 (= res!102085 (and (= (size!5049 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5050 _keys!825) (size!5049 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!9134 () Bool)

(assert (=> mapIsEmpty!9134 mapRes!9134))

(assert (= (and start!20866 res!102086) b!209446))

(assert (= (and b!209446 res!102085) b!209445))

(assert (= (and b!209445 res!102088) b!209438))

(assert (= (and b!209438 res!102087) b!209439))

(assert (= (and b!209439 res!102082) b!209444))

(assert (= (and b!209444 res!102083) b!209441))

(assert (= (and b!209441 res!102084) b!209443))

(assert (= (and b!209437 condMapEmpty!9134) mapIsEmpty!9134))

(assert (= (and b!209437 (not condMapEmpty!9134)) mapNonEmpty!9134))

(get-info :version)

(assert (= (and mapNonEmpty!9134 ((_ is ValueCellFull!2345) mapValue!9134)) b!209442))

(assert (= (and b!209437 ((_ is ValueCellFull!2345) mapDefault!9134)) b!209440))

(assert (= start!20866 b!209437))

(declare-fun m!236961 () Bool)

(assert (=> b!209445 m!236961))

(declare-fun m!236963 () Bool)

(assert (=> mapNonEmpty!9134 m!236963))

(declare-fun m!236965 () Bool)

(assert (=> start!20866 m!236965))

(declare-fun m!236967 () Bool)

(assert (=> start!20866 m!236967))

(declare-fun m!236969 () Bool)

(assert (=> start!20866 m!236969))

(declare-fun m!236971 () Bool)

(assert (=> b!209441 m!236971))

(declare-fun m!236973 () Bool)

(assert (=> b!209444 m!236973))

(declare-fun m!236975 () Bool)

(assert (=> b!209443 m!236975))

(declare-fun m!236977 () Bool)

(assert (=> b!209443 m!236977))

(declare-fun m!236979 () Bool)

(assert (=> b!209443 m!236979))

(declare-fun m!236981 () Bool)

(assert (=> b!209443 m!236981))

(declare-fun m!236983 () Bool)

(assert (=> b!209443 m!236983))

(declare-fun m!236985 () Bool)

(assert (=> b!209438 m!236985))

(check-sat (not b!209438) b_and!12275 (not b!209445) (not b!209444) (not b!209443) (not b_next!5515) (not start!20866) tp_is_empty!5377 (not mapNonEmpty!9134))
(check-sat b_and!12275 (not b_next!5515))
