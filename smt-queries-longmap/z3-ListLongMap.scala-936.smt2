; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20716 () Bool)

(assert start!20716)

(declare-fun b_free!5371 () Bool)

(declare-fun b_next!5371 () Bool)

(assert (=> start!20716 (= b_free!5371 (not b_next!5371))))

(declare-fun tp!19145 () Bool)

(declare-fun b_and!12091 () Bool)

(assert (=> start!20716 (= tp!19145 b_and!12091)))

(declare-fun b!207029 () Bool)

(declare-fun res!100429 () Bool)

(declare-fun e!135196 () Bool)

(assert (=> b!207029 (=> (not res!100429) (not e!135196))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9649 0))(
  ( (array!9650 (arr!4574 (Array (_ BitVec 32) (_ BitVec 64))) (size!4900 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9649)

(assert (=> b!207029 (= res!100429 (= (select (arr!4574 _keys!825) i!601) k0!843))))

(declare-fun b!207030 () Bool)

(declare-fun res!100433 () Bool)

(assert (=> b!207030 (=> (not res!100433) (not e!135196))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9649 (_ BitVec 32)) Bool)

(assert (=> b!207030 (= res!100433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207031 () Bool)

(declare-fun e!135194 () Bool)

(declare-fun tp_is_empty!5227 () Bool)

(assert (=> b!207031 (= e!135194 tp_is_empty!5227)))

(declare-fun b!207032 () Bool)

(declare-fun res!100432 () Bool)

(assert (=> b!207032 (=> (not res!100432) (not e!135196))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6617 0))(
  ( (V!6618 (val!2658 Int)) )
))
(declare-datatypes ((ValueCell!2270 0))(
  ( (ValueCellFull!2270 (v!4622 V!6617)) (EmptyCell!2270) )
))
(declare-datatypes ((array!9651 0))(
  ( (array!9652 (arr!4575 (Array (_ BitVec 32) ValueCell!2270)) (size!4901 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9651)

(assert (=> b!207032 (= res!100432 (and (= (size!4901 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4900 _keys!825) (size!4901 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!100430 () Bool)

(assert (=> start!20716 (=> (not res!100430) (not e!135196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20716 (= res!100430 (validMask!0 mask!1149))))

(assert (=> start!20716 e!135196))

(declare-fun e!135197 () Bool)

(declare-fun array_inv!3005 (array!9651) Bool)

(assert (=> start!20716 (and (array_inv!3005 _values!649) e!135197)))

(assert (=> start!20716 true))

(assert (=> start!20716 tp_is_empty!5227))

(declare-fun array_inv!3006 (array!9649) Bool)

(assert (=> start!20716 (array_inv!3006 _keys!825)))

(assert (=> start!20716 tp!19145))

(declare-fun b!207033 () Bool)

(declare-fun e!135198 () Bool)

(declare-fun mapRes!8909 () Bool)

(assert (=> b!207033 (= e!135197 (and e!135198 mapRes!8909))))

(declare-fun condMapEmpty!8909 () Bool)

(declare-fun mapDefault!8909 () ValueCell!2270)

(assert (=> b!207033 (= condMapEmpty!8909 (= (arr!4575 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2270)) mapDefault!8909)))))

(declare-fun b!207034 () Bool)

(declare-fun res!100428 () Bool)

(assert (=> b!207034 (=> (not res!100428) (not e!135196))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207034 (= res!100428 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!8909 () Bool)

(declare-fun tp!19144 () Bool)

(assert (=> mapNonEmpty!8909 (= mapRes!8909 (and tp!19144 e!135194))))

(declare-fun mapValue!8909 () ValueCell!2270)

(declare-fun mapKey!8909 () (_ BitVec 32))

(declare-fun mapRest!8909 () (Array (_ BitVec 32) ValueCell!2270))

(assert (=> mapNonEmpty!8909 (= (arr!4575 _values!649) (store mapRest!8909 mapKey!8909 mapValue!8909))))

(declare-fun b!207035 () Bool)

(declare-fun res!100427 () Bool)

(assert (=> b!207035 (=> (not res!100427) (not e!135196))))

(assert (=> b!207035 (= res!100427 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4900 _keys!825))))))

(declare-fun mapIsEmpty!8909 () Bool)

(assert (=> mapIsEmpty!8909 mapRes!8909))

(declare-fun b!207036 () Bool)

(assert (=> b!207036 (= e!135198 tp_is_empty!5227)))

(declare-datatypes ((tuple2!4014 0))(
  ( (tuple2!4015 (_1!2018 (_ BitVec 64)) (_2!2018 V!6617)) )
))
(declare-datatypes ((List!2916 0))(
  ( (Nil!2913) (Cons!2912 (h!3554 tuple2!4014) (t!7838 List!2916)) )
))
(declare-datatypes ((ListLongMap!2917 0))(
  ( (ListLongMap!2918 (toList!1474 List!2916)) )
))
(declare-fun lt!105912 () ListLongMap!2917)

(declare-fun lt!105914 () Bool)

(declare-fun b!207037 () Bool)

(declare-fun lt!105913 () ListLongMap!2917)

(assert (=> b!207037 (= e!135196 (not (or (and (not lt!105914) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!105914) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!105914) (not (= lt!105913 lt!105912)) (bvsle #b00000000000000000000000000000000 (size!4900 _keys!825)))))))

(assert (=> b!207037 (= lt!105914 (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!105911 () ListLongMap!2917)

(declare-fun zeroValue!615 () V!6617)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6617)

(declare-fun getCurrentListMap!1015 (array!9649 array!9651 (_ BitVec 32) (_ BitVec 32) V!6617 V!6617 (_ BitVec 32) Int) ListLongMap!2917)

(assert (=> b!207037 (= lt!105911 (getCurrentListMap!1015 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105907 () array!9651)

(assert (=> b!207037 (= lt!105913 (getCurrentListMap!1015 _keys!825 lt!105907 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105909 () ListLongMap!2917)

(assert (=> b!207037 (and (= lt!105912 lt!105909) (= lt!105909 lt!105912))))

(declare-fun v!520 () V!6617)

(declare-fun lt!105910 () ListLongMap!2917)

(declare-fun +!523 (ListLongMap!2917 tuple2!4014) ListLongMap!2917)

(assert (=> b!207037 (= lt!105909 (+!523 lt!105910 (tuple2!4015 k0!843 v!520)))))

(declare-datatypes ((Unit!6286 0))(
  ( (Unit!6287) )
))
(declare-fun lt!105908 () Unit!6286)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!174 (array!9649 array!9651 (_ BitVec 32) (_ BitVec 32) V!6617 V!6617 (_ BitVec 32) (_ BitVec 64) V!6617 (_ BitVec 32) Int) Unit!6286)

(assert (=> b!207037 (= lt!105908 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!174 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!425 (array!9649 array!9651 (_ BitVec 32) (_ BitVec 32) V!6617 V!6617 (_ BitVec 32) Int) ListLongMap!2917)

(assert (=> b!207037 (= lt!105912 (getCurrentListMapNoExtraKeys!425 _keys!825 lt!105907 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207037 (= lt!105907 (array!9652 (store (arr!4575 _values!649) i!601 (ValueCellFull!2270 v!520)) (size!4901 _values!649)))))

(assert (=> b!207037 (= lt!105910 (getCurrentListMapNoExtraKeys!425 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207038 () Bool)

(declare-fun res!100431 () Bool)

(assert (=> b!207038 (=> (not res!100431) (not e!135196))))

(declare-datatypes ((List!2917 0))(
  ( (Nil!2914) (Cons!2913 (h!3555 (_ BitVec 64)) (t!7839 List!2917)) )
))
(declare-fun arrayNoDuplicates!0 (array!9649 (_ BitVec 32) List!2917) Bool)

(assert (=> b!207038 (= res!100431 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2914))))

(assert (= (and start!20716 res!100430) b!207032))

(assert (= (and b!207032 res!100432) b!207030))

(assert (= (and b!207030 res!100433) b!207038))

(assert (= (and b!207038 res!100431) b!207035))

(assert (= (and b!207035 res!100427) b!207034))

(assert (= (and b!207034 res!100428) b!207029))

(assert (= (and b!207029 res!100429) b!207037))

(assert (= (and b!207033 condMapEmpty!8909) mapIsEmpty!8909))

(assert (= (and b!207033 (not condMapEmpty!8909)) mapNonEmpty!8909))

(get-info :version)

(assert (= (and mapNonEmpty!8909 ((_ is ValueCellFull!2270) mapValue!8909)) b!207031))

(assert (= (and b!207033 ((_ is ValueCellFull!2270) mapDefault!8909)) b!207036))

(assert (= start!20716 b!207033))

(declare-fun m!234303 () Bool)

(assert (=> b!207029 m!234303))

(declare-fun m!234305 () Bool)

(assert (=> b!207038 m!234305))

(declare-fun m!234307 () Bool)

(assert (=> b!207030 m!234307))

(declare-fun m!234309 () Bool)

(assert (=> start!20716 m!234309))

(declare-fun m!234311 () Bool)

(assert (=> start!20716 m!234311))

(declare-fun m!234313 () Bool)

(assert (=> start!20716 m!234313))

(declare-fun m!234315 () Bool)

(assert (=> b!207034 m!234315))

(declare-fun m!234317 () Bool)

(assert (=> b!207037 m!234317))

(declare-fun m!234319 () Bool)

(assert (=> b!207037 m!234319))

(declare-fun m!234321 () Bool)

(assert (=> b!207037 m!234321))

(declare-fun m!234323 () Bool)

(assert (=> b!207037 m!234323))

(declare-fun m!234325 () Bool)

(assert (=> b!207037 m!234325))

(declare-fun m!234327 () Bool)

(assert (=> b!207037 m!234327))

(declare-fun m!234329 () Bool)

(assert (=> b!207037 m!234329))

(declare-fun m!234331 () Bool)

(assert (=> mapNonEmpty!8909 m!234331))

(check-sat tp_is_empty!5227 (not b_next!5371) (not b!207038) (not start!20716) (not b!207030) (not b!207037) (not b!207034) b_and!12091 (not mapNonEmpty!8909))
(check-sat b_and!12091 (not b_next!5371))
