; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20482 () Bool)

(assert start!20482)

(declare-fun b_free!5137 () Bool)

(declare-fun b_next!5137 () Bool)

(assert (=> start!20482 (= b_free!5137 (not b_next!5137))))

(declare-fun tp!18443 () Bool)

(declare-fun b_and!11897 () Bool)

(assert (=> start!20482 (= tp!18443 b_and!11897)))

(declare-fun res!97525 () Bool)

(declare-fun e!133016 () Bool)

(assert (=> start!20482 (=> (not res!97525) (not e!133016))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20482 (= res!97525 (validMask!0 mask!1149))))

(assert (=> start!20482 e!133016))

(declare-datatypes ((V!6305 0))(
  ( (V!6306 (val!2541 Int)) )
))
(declare-datatypes ((ValueCell!2153 0))(
  ( (ValueCellFull!2153 (v!4512 V!6305)) (EmptyCell!2153) )
))
(declare-datatypes ((array!9197 0))(
  ( (array!9198 (arr!4349 (Array (_ BitVec 32) ValueCell!2153)) (size!4674 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9197)

(declare-fun e!133013 () Bool)

(declare-fun array_inv!2841 (array!9197) Bool)

(assert (=> start!20482 (and (array_inv!2841 _values!649) e!133013)))

(assert (=> start!20482 true))

(declare-fun tp_is_empty!4993 () Bool)

(assert (=> start!20482 tp_is_empty!4993))

(declare-datatypes ((array!9199 0))(
  ( (array!9200 (arr!4350 (Array (_ BitVec 32) (_ BitVec 64))) (size!4675 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9199)

(declare-fun array_inv!2842 (array!9199) Bool)

(assert (=> start!20482 (array_inv!2842 _keys!825)))

(assert (=> start!20482 tp!18443))

(declare-fun b!203150 () Bool)

(declare-fun e!133015 () Bool)

(declare-fun mapRes!8558 () Bool)

(assert (=> b!203150 (= e!133013 (and e!133015 mapRes!8558))))

(declare-fun condMapEmpty!8558 () Bool)

(declare-fun mapDefault!8558 () ValueCell!2153)

(assert (=> b!203150 (= condMapEmpty!8558 (= (arr!4349 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2153)) mapDefault!8558)))))

(declare-fun b!203151 () Bool)

(declare-fun e!133012 () Bool)

(declare-fun e!133011 () Bool)

(assert (=> b!203151 (= e!133012 e!133011)))

(declare-fun res!97531 () Bool)

(assert (=> b!203151 (=> res!97531 e!133011)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!203151 (= res!97531 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3790 0))(
  ( (tuple2!3791 (_1!1906 (_ BitVec 64)) (_2!1906 V!6305)) )
))
(declare-datatypes ((List!2691 0))(
  ( (Nil!2688) (Cons!2687 (h!3329 tuple2!3790) (t!7614 List!2691)) )
))
(declare-datatypes ((ListLongMap!2705 0))(
  ( (ListLongMap!2706 (toList!1368 List!2691)) )
))
(declare-fun lt!102348 () ListLongMap!2705)

(declare-fun lt!102346 () ListLongMap!2705)

(assert (=> b!203151 (= lt!102348 lt!102346)))

(declare-fun lt!102347 () ListLongMap!2705)

(declare-fun lt!102349 () tuple2!3790)

(declare-fun +!422 (ListLongMap!2705 tuple2!3790) ListLongMap!2705)

(assert (=> b!203151 (= lt!102346 (+!422 lt!102347 lt!102349))))

(declare-fun lt!102350 () ListLongMap!2705)

(declare-fun lt!102342 () ListLongMap!2705)

(assert (=> b!203151 (= lt!102350 lt!102342)))

(declare-fun lt!102340 () ListLongMap!2705)

(assert (=> b!203151 (= lt!102342 (+!422 lt!102340 lt!102349))))

(declare-fun lt!102345 () ListLongMap!2705)

(assert (=> b!203151 (= lt!102348 (+!422 lt!102345 lt!102349))))

(declare-fun zeroValue!615 () V!6305)

(assert (=> b!203151 (= lt!102349 (tuple2!3791 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203152 () Bool)

(assert (=> b!203152 (= e!133015 tp_is_empty!4993)))

(declare-fun b!203153 () Bool)

(declare-fun res!97527 () Bool)

(assert (=> b!203153 (=> (not res!97527) (not e!133016))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!203153 (= res!97527 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4675 _keys!825))))))

(declare-fun mapIsEmpty!8558 () Bool)

(assert (=> mapIsEmpty!8558 mapRes!8558))

(declare-fun b!203154 () Bool)

(declare-fun res!97524 () Bool)

(assert (=> b!203154 (=> (not res!97524) (not e!133016))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203154 (= res!97524 (validKeyInArray!0 k0!843))))

(declare-fun b!203155 () Bool)

(assert (=> b!203155 (= e!133011 true)))

(declare-fun lt!102344 () tuple2!3790)

(assert (=> b!203155 (= lt!102346 (+!422 lt!102342 lt!102344))))

(declare-fun v!520 () V!6305)

(declare-datatypes ((Unit!6128 0))(
  ( (Unit!6129) )
))
(declare-fun lt!102339 () Unit!6128)

(declare-fun addCommutativeForDiffKeys!140 (ListLongMap!2705 (_ BitVec 64) V!6305 (_ BitVec 64) V!6305) Unit!6128)

(assert (=> b!203155 (= lt!102339 (addCommutativeForDiffKeys!140 lt!102340 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203156 () Bool)

(declare-fun res!97528 () Bool)

(assert (=> b!203156 (=> (not res!97528) (not e!133016))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!203156 (= res!97528 (and (= (size!4674 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4675 _keys!825) (size!4674 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!8558 () Bool)

(declare-fun tp!18442 () Bool)

(declare-fun e!133010 () Bool)

(assert (=> mapNonEmpty!8558 (= mapRes!8558 (and tp!18442 e!133010))))

(declare-fun mapKey!8558 () (_ BitVec 32))

(declare-fun mapValue!8558 () ValueCell!2153)

(declare-fun mapRest!8558 () (Array (_ BitVec 32) ValueCell!2153))

(assert (=> mapNonEmpty!8558 (= (arr!4349 _values!649) (store mapRest!8558 mapKey!8558 mapValue!8558))))

(declare-fun b!203157 () Bool)

(assert (=> b!203157 (= e!133010 tp_is_empty!4993)))

(declare-fun b!203158 () Bool)

(declare-fun res!97526 () Bool)

(assert (=> b!203158 (=> (not res!97526) (not e!133016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9199 (_ BitVec 32)) Bool)

(assert (=> b!203158 (= res!97526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!203159 () Bool)

(assert (=> b!203159 (= e!133016 (not e!133012))))

(declare-fun res!97529 () Bool)

(assert (=> b!203159 (=> res!97529 e!133012)))

(assert (=> b!203159 (= res!97529 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6305)

(declare-fun getCurrentListMap!950 (array!9199 array!9197 (_ BitVec 32) (_ BitVec 32) V!6305 V!6305 (_ BitVec 32) Int) ListLongMap!2705)

(assert (=> b!203159 (= lt!102350 (getCurrentListMap!950 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102343 () array!9197)

(assert (=> b!203159 (= lt!102348 (getCurrentListMap!950 _keys!825 lt!102343 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203159 (and (= lt!102345 lt!102347) (= lt!102347 lt!102345))))

(assert (=> b!203159 (= lt!102347 (+!422 lt!102340 lt!102344))))

(assert (=> b!203159 (= lt!102344 (tuple2!3791 k0!843 v!520))))

(declare-fun lt!102341 () Unit!6128)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!86 (array!9199 array!9197 (_ BitVec 32) (_ BitVec 32) V!6305 V!6305 (_ BitVec 32) (_ BitVec 64) V!6305 (_ BitVec 32) Int) Unit!6128)

(assert (=> b!203159 (= lt!102341 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!86 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!343 (array!9199 array!9197 (_ BitVec 32) (_ BitVec 32) V!6305 V!6305 (_ BitVec 32) Int) ListLongMap!2705)

(assert (=> b!203159 (= lt!102345 (getCurrentListMapNoExtraKeys!343 _keys!825 lt!102343 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203159 (= lt!102343 (array!9198 (store (arr!4349 _values!649) i!601 (ValueCellFull!2153 v!520)) (size!4674 _values!649)))))

(assert (=> b!203159 (= lt!102340 (getCurrentListMapNoExtraKeys!343 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!203160 () Bool)

(declare-fun res!97523 () Bool)

(assert (=> b!203160 (=> (not res!97523) (not e!133016))))

(assert (=> b!203160 (= res!97523 (= (select (arr!4350 _keys!825) i!601) k0!843))))

(declare-fun b!203161 () Bool)

(declare-fun res!97530 () Bool)

(assert (=> b!203161 (=> (not res!97530) (not e!133016))))

(declare-datatypes ((List!2692 0))(
  ( (Nil!2689) (Cons!2688 (h!3330 (_ BitVec 64)) (t!7615 List!2692)) )
))
(declare-fun arrayNoDuplicates!0 (array!9199 (_ BitVec 32) List!2692) Bool)

(assert (=> b!203161 (= res!97530 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2689))))

(assert (= (and start!20482 res!97525) b!203156))

(assert (= (and b!203156 res!97528) b!203158))

(assert (= (and b!203158 res!97526) b!203161))

(assert (= (and b!203161 res!97530) b!203153))

(assert (= (and b!203153 res!97527) b!203154))

(assert (= (and b!203154 res!97524) b!203160))

(assert (= (and b!203160 res!97523) b!203159))

(assert (= (and b!203159 (not res!97529)) b!203151))

(assert (= (and b!203151 (not res!97531)) b!203155))

(assert (= (and b!203150 condMapEmpty!8558) mapIsEmpty!8558))

(assert (= (and b!203150 (not condMapEmpty!8558)) mapNonEmpty!8558))

(get-info :version)

(assert (= (and mapNonEmpty!8558 ((_ is ValueCellFull!2153) mapValue!8558)) b!203157))

(assert (= (and b!203150 ((_ is ValueCellFull!2153) mapDefault!8558)) b!203152))

(assert (= start!20482 b!203150))

(declare-fun m!230673 () Bool)

(assert (=> b!203161 m!230673))

(declare-fun m!230675 () Bool)

(assert (=> b!203160 m!230675))

(declare-fun m!230677 () Bool)

(assert (=> b!203158 m!230677))

(declare-fun m!230679 () Bool)

(assert (=> b!203154 m!230679))

(declare-fun m!230681 () Bool)

(assert (=> b!203159 m!230681))

(declare-fun m!230683 () Bool)

(assert (=> b!203159 m!230683))

(declare-fun m!230685 () Bool)

(assert (=> b!203159 m!230685))

(declare-fun m!230687 () Bool)

(assert (=> b!203159 m!230687))

(declare-fun m!230689 () Bool)

(assert (=> b!203159 m!230689))

(declare-fun m!230691 () Bool)

(assert (=> b!203159 m!230691))

(declare-fun m!230693 () Bool)

(assert (=> b!203159 m!230693))

(declare-fun m!230695 () Bool)

(assert (=> mapNonEmpty!8558 m!230695))

(declare-fun m!230697 () Bool)

(assert (=> b!203155 m!230697))

(declare-fun m!230699 () Bool)

(assert (=> b!203155 m!230699))

(declare-fun m!230701 () Bool)

(assert (=> start!20482 m!230701))

(declare-fun m!230703 () Bool)

(assert (=> start!20482 m!230703))

(declare-fun m!230705 () Bool)

(assert (=> start!20482 m!230705))

(declare-fun m!230707 () Bool)

(assert (=> b!203151 m!230707))

(declare-fun m!230709 () Bool)

(assert (=> b!203151 m!230709))

(declare-fun m!230711 () Bool)

(assert (=> b!203151 m!230711))

(check-sat b_and!11897 tp_is_empty!4993 (not start!20482) (not b!203154) (not b!203158) (not mapNonEmpty!8558) (not b!203155) (not b!203159) (not b!203161) (not b_next!5137) (not b!203151))
(check-sat b_and!11897 (not b_next!5137))
