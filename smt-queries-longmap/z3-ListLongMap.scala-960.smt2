; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20860 () Bool)

(assert start!20860)

(declare-fun b_free!5509 () Bool)

(declare-fun b_next!5509 () Bool)

(assert (=> start!20860 (= b_free!5509 (not b_next!5509))))

(declare-fun tp!19568 () Bool)

(declare-fun b_and!12269 () Bool)

(assert (=> start!20860 (= tp!19568 b_and!12269)))

(declare-fun b!209347 () Bool)

(declare-fun e!136400 () Bool)

(declare-fun tp_is_empty!5371 () Bool)

(assert (=> b!209347 (= e!136400 tp_is_empty!5371)))

(declare-fun b!209348 () Bool)

(declare-fun res!102020 () Bool)

(declare-fun e!136403 () Bool)

(assert (=> b!209348 (=> (not res!102020) (not e!136403))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!209348 (= res!102020 (validKeyInArray!0 k0!843))))

(declare-fun res!102021 () Bool)

(assert (=> start!20860 (=> (not res!102021) (not e!136403))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20860 (= res!102021 (validMask!0 mask!1149))))

(assert (=> start!20860 e!136403))

(declare-datatypes ((V!6809 0))(
  ( (V!6810 (val!2730 Int)) )
))
(declare-datatypes ((ValueCell!2342 0))(
  ( (ValueCellFull!2342 (v!4701 V!6809)) (EmptyCell!2342) )
))
(declare-datatypes ((array!9935 0))(
  ( (array!9936 (arr!4718 (Array (_ BitVec 32) ValueCell!2342)) (size!5043 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9935)

(declare-fun e!136399 () Bool)

(declare-fun array_inv!3093 (array!9935) Bool)

(assert (=> start!20860 (and (array_inv!3093 _values!649) e!136399)))

(assert (=> start!20860 true))

(assert (=> start!20860 tp_is_empty!5371))

(declare-datatypes ((array!9937 0))(
  ( (array!9938 (arr!4719 (Array (_ BitVec 32) (_ BitVec 64))) (size!5044 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9937)

(declare-fun array_inv!3094 (array!9937) Bool)

(assert (=> start!20860 (array_inv!3094 _keys!825)))

(assert (=> start!20860 tp!19568))

(declare-fun b!209349 () Bool)

(declare-fun res!102024 () Bool)

(assert (=> b!209349 (=> (not res!102024) (not e!136403))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!209349 (= res!102024 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5044 _keys!825))))))

(declare-fun b!209350 () Bool)

(declare-fun mapRes!9125 () Bool)

(assert (=> b!209350 (= e!136399 (and e!136400 mapRes!9125))))

(declare-fun condMapEmpty!9125 () Bool)

(declare-fun mapDefault!9125 () ValueCell!2342)

(assert (=> b!209350 (= condMapEmpty!9125 (= (arr!4718 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2342)) mapDefault!9125)))))

(declare-fun b!209351 () Bool)

(declare-datatypes ((tuple2!4070 0))(
  ( (tuple2!4071 (_1!2046 (_ BitVec 64)) (_2!2046 V!6809)) )
))
(declare-datatypes ((List!2957 0))(
  ( (Nil!2954) (Cons!2953 (h!3595 tuple2!4070) (t!7880 List!2957)) )
))
(declare-datatypes ((ListLongMap!2985 0))(
  ( (ListLongMap!2986 (toList!1508 List!2957)) )
))
(declare-fun lt!107024 () ListLongMap!2985)

(declare-fun lt!107022 () ListLongMap!2985)

(assert (=> b!209351 (= e!136403 (not (= lt!107024 lt!107022)))))

(assert (=> b!209351 (= lt!107022 lt!107024)))

(declare-fun lt!107021 () ListLongMap!2985)

(declare-fun v!520 () V!6809)

(declare-fun +!537 (ListLongMap!2985 tuple2!4070) ListLongMap!2985)

(assert (=> b!209351 (= lt!107024 (+!537 lt!107021 (tuple2!4071 k0!843 v!520)))))

(declare-datatypes ((Unit!6350 0))(
  ( (Unit!6351) )
))
(declare-fun lt!107023 () Unit!6350)

(declare-fun zeroValue!615 () V!6809)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6809)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!189 (array!9937 array!9935 (_ BitVec 32) (_ BitVec 32) V!6809 V!6809 (_ BitVec 32) (_ BitVec 64) V!6809 (_ BitVec 32) Int) Unit!6350)

(assert (=> b!209351 (= lt!107023 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!189 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!471 (array!9937 array!9935 (_ BitVec 32) (_ BitVec 32) V!6809 V!6809 (_ BitVec 32) Int) ListLongMap!2985)

(assert (=> b!209351 (= lt!107022 (getCurrentListMapNoExtraKeys!471 _keys!825 (array!9936 (store (arr!4718 _values!649) i!601 (ValueCellFull!2342 v!520)) (size!5043 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!209351 (= lt!107021 (getCurrentListMapNoExtraKeys!471 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209352 () Bool)

(declare-fun e!136402 () Bool)

(assert (=> b!209352 (= e!136402 tp_is_empty!5371)))

(declare-fun b!209353 () Bool)

(declare-fun res!102022 () Bool)

(assert (=> b!209353 (=> (not res!102022) (not e!136403))))

(assert (=> b!209353 (= res!102022 (= (select (arr!4719 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!9125 () Bool)

(declare-fun tp!19567 () Bool)

(assert (=> mapNonEmpty!9125 (= mapRes!9125 (and tp!19567 e!136402))))

(declare-fun mapValue!9125 () ValueCell!2342)

(declare-fun mapKey!9125 () (_ BitVec 32))

(declare-fun mapRest!9125 () (Array (_ BitVec 32) ValueCell!2342))

(assert (=> mapNonEmpty!9125 (= (arr!4718 _values!649) (store mapRest!9125 mapKey!9125 mapValue!9125))))

(declare-fun b!209354 () Bool)

(declare-fun res!102025 () Bool)

(assert (=> b!209354 (=> (not res!102025) (not e!136403))))

(assert (=> b!209354 (= res!102025 (and (= (size!5043 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5044 _keys!825) (size!5043 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!209355 () Bool)

(declare-fun res!102023 () Bool)

(assert (=> b!209355 (=> (not res!102023) (not e!136403))))

(declare-datatypes ((List!2958 0))(
  ( (Nil!2955) (Cons!2954 (h!3596 (_ BitVec 64)) (t!7881 List!2958)) )
))
(declare-fun arrayNoDuplicates!0 (array!9937 (_ BitVec 32) List!2958) Bool)

(assert (=> b!209355 (= res!102023 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2955))))

(declare-fun b!209356 () Bool)

(declare-fun res!102019 () Bool)

(assert (=> b!209356 (=> (not res!102019) (not e!136403))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9937 (_ BitVec 32)) Bool)

(assert (=> b!209356 (= res!102019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!9125 () Bool)

(assert (=> mapIsEmpty!9125 mapRes!9125))

(assert (= (and start!20860 res!102021) b!209354))

(assert (= (and b!209354 res!102025) b!209356))

(assert (= (and b!209356 res!102019) b!209355))

(assert (= (and b!209355 res!102023) b!209349))

(assert (= (and b!209349 res!102024) b!209348))

(assert (= (and b!209348 res!102020) b!209353))

(assert (= (and b!209353 res!102022) b!209351))

(assert (= (and b!209350 condMapEmpty!9125) mapIsEmpty!9125))

(assert (= (and b!209350 (not condMapEmpty!9125)) mapNonEmpty!9125))

(get-info :version)

(assert (= (and mapNonEmpty!9125 ((_ is ValueCellFull!2342) mapValue!9125)) b!209352))

(assert (= (and b!209350 ((_ is ValueCellFull!2342) mapDefault!9125)) b!209347))

(assert (= start!20860 b!209350))

(declare-fun m!236883 () Bool)

(assert (=> b!209356 m!236883))

(declare-fun m!236885 () Bool)

(assert (=> b!209351 m!236885))

(declare-fun m!236887 () Bool)

(assert (=> b!209351 m!236887))

(declare-fun m!236889 () Bool)

(assert (=> b!209351 m!236889))

(declare-fun m!236891 () Bool)

(assert (=> b!209351 m!236891))

(declare-fun m!236893 () Bool)

(assert (=> b!209351 m!236893))

(declare-fun m!236895 () Bool)

(assert (=> b!209353 m!236895))

(declare-fun m!236897 () Bool)

(assert (=> b!209355 m!236897))

(declare-fun m!236899 () Bool)

(assert (=> mapNonEmpty!9125 m!236899))

(declare-fun m!236901 () Bool)

(assert (=> b!209348 m!236901))

(declare-fun m!236903 () Bool)

(assert (=> start!20860 m!236903))

(declare-fun m!236905 () Bool)

(assert (=> start!20860 m!236905))

(declare-fun m!236907 () Bool)

(assert (=> start!20860 m!236907))

(check-sat (not mapNonEmpty!9125) (not b!209348) (not b_next!5509) (not b!209356) (not b!209351) (not start!20860) tp_is_empty!5371 (not b!209355) b_and!12269)
(check-sat b_and!12269 (not b_next!5509))
