; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20726 () Bool)

(assert start!20726)

(declare-fun b_free!5385 () Bool)

(declare-fun b_next!5385 () Bool)

(assert (=> start!20726 (= b_free!5385 (not b_next!5385))))

(declare-fun tp!19187 () Bool)

(declare-fun b_and!12131 () Bool)

(assert (=> start!20726 (= tp!19187 b_and!12131)))

(declare-fun b!207386 () Bool)

(declare-fun res!100670 () Bool)

(declare-fun e!135403 () Bool)

(assert (=> b!207386 (=> (not res!100670) (not e!135403))))

(declare-datatypes ((array!9689 0))(
  ( (array!9690 (arr!4595 (Array (_ BitVec 32) (_ BitVec 64))) (size!4920 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9689)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6635 0))(
  ( (V!6636 (val!2665 Int)) )
))
(declare-datatypes ((ValueCell!2277 0))(
  ( (ValueCellFull!2277 (v!4635 V!6635)) (EmptyCell!2277) )
))
(declare-datatypes ((array!9691 0))(
  ( (array!9692 (arr!4596 (Array (_ BitVec 32) ValueCell!2277)) (size!4921 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9691)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!207386 (= res!100670 (and (= (size!4921 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4920 _keys!825) (size!4921 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!100675 () Bool)

(assert (=> start!20726 (=> (not res!100675) (not e!135403))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20726 (= res!100675 (validMask!0 mask!1149))))

(assert (=> start!20726 e!135403))

(declare-fun e!135400 () Bool)

(declare-fun array_inv!3041 (array!9691) Bool)

(assert (=> start!20726 (and (array_inv!3041 _values!649) e!135400)))

(assert (=> start!20726 true))

(declare-fun tp_is_empty!5241 () Bool)

(assert (=> start!20726 tp_is_empty!5241))

(declare-fun array_inv!3042 (array!9689) Bool)

(assert (=> start!20726 (array_inv!3042 _keys!825)))

(assert (=> start!20726 tp!19187))

(declare-fun b!207387 () Bool)

(declare-fun e!135401 () Bool)

(declare-fun mapRes!8930 () Bool)

(assert (=> b!207387 (= e!135400 (and e!135401 mapRes!8930))))

(declare-fun condMapEmpty!8930 () Bool)

(declare-fun mapDefault!8930 () ValueCell!2277)

(assert (=> b!207387 (= condMapEmpty!8930 (= (arr!4596 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2277)) mapDefault!8930)))))

(declare-fun b!207388 () Bool)

(assert (=> b!207388 (= e!135401 tp_is_empty!5241)))

(declare-fun b!207389 () Bool)

(declare-fun res!100669 () Bool)

(assert (=> b!207389 (=> (not res!100669) (not e!135403))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!207389 (= res!100669 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4920 _keys!825))))))

(declare-fun b!207390 () Bool)

(declare-fun res!100674 () Bool)

(assert (=> b!207390 (=> (not res!100674) (not e!135403))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!207390 (= res!100674 (= (select (arr!4595 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!8930 () Bool)

(declare-fun tp!19186 () Bool)

(declare-fun e!135404 () Bool)

(assert (=> mapNonEmpty!8930 (= mapRes!8930 (and tp!19186 e!135404))))

(declare-fun mapValue!8930 () ValueCell!2277)

(declare-fun mapKey!8930 () (_ BitVec 32))

(declare-fun mapRest!8930 () (Array (_ BitVec 32) ValueCell!2277))

(assert (=> mapNonEmpty!8930 (= (arr!4596 _values!649) (store mapRest!8930 mapKey!8930 mapValue!8930))))

(declare-fun b!207391 () Bool)

(declare-fun res!100671 () Bool)

(assert (=> b!207391 (=> (not res!100671) (not e!135403))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9689 (_ BitVec 32)) Bool)

(assert (=> b!207391 (= res!100671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207392 () Bool)

(declare-fun res!100672 () Bool)

(assert (=> b!207392 (=> (not res!100672) (not e!135403))))

(declare-datatypes ((List!2935 0))(
  ( (Nil!2932) (Cons!2931 (h!3573 (_ BitVec 64)) (t!7866 List!2935)) )
))
(declare-fun arrayNoDuplicates!0 (array!9689 (_ BitVec 32) List!2935) Bool)

(assert (=> b!207392 (= res!100672 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2932))))

(declare-fun b!207393 () Bool)

(assert (=> b!207393 (= e!135404 tp_is_empty!5241)))

(declare-fun b!207394 () Bool)

(declare-fun res!100673 () Bool)

(assert (=> b!207394 (=> (not res!100673) (not e!135403))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207394 (= res!100673 (validKeyInArray!0 k0!843))))

(declare-fun b!207395 () Bool)

(assert (=> b!207395 (= e!135403 (not true))))

(declare-fun zeroValue!615 () V!6635)

(declare-datatypes ((tuple2!4044 0))(
  ( (tuple2!4045 (_1!2033 (_ BitVec 64)) (_2!2033 V!6635)) )
))
(declare-datatypes ((List!2936 0))(
  ( (Nil!2933) (Cons!2932 (h!3574 tuple2!4044) (t!7867 List!2936)) )
))
(declare-datatypes ((ListLongMap!2957 0))(
  ( (ListLongMap!2958 (toList!1494 List!2936)) )
))
(declare-fun lt!106242 () ListLongMap!2957)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6635)

(declare-fun getCurrentListMap!1061 (array!9689 array!9691 (_ BitVec 32) (_ BitVec 32) V!6635 V!6635 (_ BitVec 32) Int) ListLongMap!2957)

(assert (=> b!207395 (= lt!106242 (getCurrentListMap!1061 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106247 () array!9691)

(declare-fun lt!106244 () ListLongMap!2957)

(assert (=> b!207395 (= lt!106244 (getCurrentListMap!1061 _keys!825 lt!106247 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106245 () ListLongMap!2957)

(declare-fun lt!106246 () ListLongMap!2957)

(assert (=> b!207395 (and (= lt!106245 lt!106246) (= lt!106246 lt!106245))))

(declare-fun lt!106248 () ListLongMap!2957)

(declare-fun v!520 () V!6635)

(declare-fun +!521 (ListLongMap!2957 tuple2!4044) ListLongMap!2957)

(assert (=> b!207395 (= lt!106246 (+!521 lt!106248 (tuple2!4045 k0!843 v!520)))))

(declare-datatypes ((Unit!6330 0))(
  ( (Unit!6331) )
))
(declare-fun lt!106243 () Unit!6330)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!174 (array!9689 array!9691 (_ BitVec 32) (_ BitVec 32) V!6635 V!6635 (_ BitVec 32) (_ BitVec 64) V!6635 (_ BitVec 32) Int) Unit!6330)

(assert (=> b!207395 (= lt!106243 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!174 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!435 (array!9689 array!9691 (_ BitVec 32) (_ BitVec 32) V!6635 V!6635 (_ BitVec 32) Int) ListLongMap!2957)

(assert (=> b!207395 (= lt!106245 (getCurrentListMapNoExtraKeys!435 _keys!825 lt!106247 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207395 (= lt!106247 (array!9692 (store (arr!4596 _values!649) i!601 (ValueCellFull!2277 v!520)) (size!4921 _values!649)))))

(assert (=> b!207395 (= lt!106248 (getCurrentListMapNoExtraKeys!435 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8930 () Bool)

(assert (=> mapIsEmpty!8930 mapRes!8930))

(assert (= (and start!20726 res!100675) b!207386))

(assert (= (and b!207386 res!100670) b!207391))

(assert (= (and b!207391 res!100671) b!207392))

(assert (= (and b!207392 res!100672) b!207389))

(assert (= (and b!207389 res!100669) b!207394))

(assert (= (and b!207394 res!100673) b!207390))

(assert (= (and b!207390 res!100674) b!207395))

(assert (= (and b!207387 condMapEmpty!8930) mapIsEmpty!8930))

(assert (= (and b!207387 (not condMapEmpty!8930)) mapNonEmpty!8930))

(get-info :version)

(assert (= (and mapNonEmpty!8930 ((_ is ValueCellFull!2277) mapValue!8930)) b!207393))

(assert (= (and b!207387 ((_ is ValueCellFull!2277) mapDefault!8930)) b!207388))

(assert (= start!20726 b!207387))

(declare-fun m!235129 () Bool)

(assert (=> b!207395 m!235129))

(declare-fun m!235131 () Bool)

(assert (=> b!207395 m!235131))

(declare-fun m!235133 () Bool)

(assert (=> b!207395 m!235133))

(declare-fun m!235135 () Bool)

(assert (=> b!207395 m!235135))

(declare-fun m!235137 () Bool)

(assert (=> b!207395 m!235137))

(declare-fun m!235139 () Bool)

(assert (=> b!207395 m!235139))

(declare-fun m!235141 () Bool)

(assert (=> b!207395 m!235141))

(declare-fun m!235143 () Bool)

(assert (=> b!207394 m!235143))

(declare-fun m!235145 () Bool)

(assert (=> start!20726 m!235145))

(declare-fun m!235147 () Bool)

(assert (=> start!20726 m!235147))

(declare-fun m!235149 () Bool)

(assert (=> start!20726 m!235149))

(declare-fun m!235151 () Bool)

(assert (=> mapNonEmpty!8930 m!235151))

(declare-fun m!235153 () Bool)

(assert (=> b!207390 m!235153))

(declare-fun m!235155 () Bool)

(assert (=> b!207392 m!235155))

(declare-fun m!235157 () Bool)

(assert (=> b!207391 m!235157))

(check-sat (not b!207395) tp_is_empty!5241 (not mapNonEmpty!8930) (not b!207391) (not start!20726) (not b!207392) b_and!12131 (not b_next!5385) (not b!207394))
(check-sat b_and!12131 (not b_next!5385))
