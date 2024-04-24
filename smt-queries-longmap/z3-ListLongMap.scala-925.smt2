; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20650 () Bool)

(assert start!20650)

(declare-fun b_free!5305 () Bool)

(declare-fun b_next!5305 () Bool)

(assert (=> start!20650 (= b_free!5305 (not b_next!5305))))

(declare-fun tp!18946 () Bool)

(declare-fun b_and!12065 () Bool)

(assert (=> start!20650 (= tp!18946 b_and!12065)))

(declare-fun b!206183 () Bool)

(declare-fun res!99802 () Bool)

(declare-fun e!134780 () Bool)

(assert (=> b!206183 (=> (not res!99802) (not e!134780))))

(declare-datatypes ((array!9527 0))(
  ( (array!9528 (arr!4514 (Array (_ BitVec 32) (_ BitVec 64))) (size!4839 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9527)

(declare-datatypes ((List!2823 0))(
  ( (Nil!2820) (Cons!2819 (h!3461 (_ BitVec 64)) (t!7746 List!2823)) )
))
(declare-fun arrayNoDuplicates!0 (array!9527 (_ BitVec 32) List!2823) Bool)

(assert (=> b!206183 (= res!99802 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2820))))

(declare-fun b!206184 () Bool)

(declare-fun e!134777 () Bool)

(assert (=> b!206184 (= e!134780 (not e!134777))))

(declare-fun res!99808 () Bool)

(assert (=> b!206184 (=> res!99808 e!134777)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!206184 (= res!99808 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6529 0))(
  ( (V!6530 (val!2625 Int)) )
))
(declare-datatypes ((ValueCell!2237 0))(
  ( (ValueCellFull!2237 (v!4596 V!6529)) (EmptyCell!2237) )
))
(declare-datatypes ((array!9529 0))(
  ( (array!9530 (arr!4515 (Array (_ BitVec 32) ValueCell!2237)) (size!4840 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9529)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!3934 0))(
  ( (tuple2!3935 (_1!1978 (_ BitVec 64)) (_2!1978 V!6529)) )
))
(declare-datatypes ((List!2824 0))(
  ( (Nil!2821) (Cons!2820 (h!3462 tuple2!3934) (t!7747 List!2824)) )
))
(declare-datatypes ((ListLongMap!2849 0))(
  ( (ListLongMap!2850 (toList!1440 List!2824)) )
))
(declare-fun lt!105337 () ListLongMap!2849)

(declare-fun zeroValue!615 () V!6529)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6529)

(declare-fun getCurrentListMap!1012 (array!9527 array!9529 (_ BitVec 32) (_ BitVec 32) V!6529 V!6529 (_ BitVec 32) Int) ListLongMap!2849)

(assert (=> b!206184 (= lt!105337 (getCurrentListMap!1012 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105328 () ListLongMap!2849)

(declare-fun lt!105335 () array!9529)

(assert (=> b!206184 (= lt!105328 (getCurrentListMap!1012 _keys!825 lt!105335 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105329 () ListLongMap!2849)

(declare-fun lt!105331 () ListLongMap!2849)

(assert (=> b!206184 (and (= lt!105329 lt!105331) (= lt!105331 lt!105329))))

(declare-fun lt!105333 () ListLongMap!2849)

(declare-fun lt!105330 () tuple2!3934)

(declare-fun +!494 (ListLongMap!2849 tuple2!3934) ListLongMap!2849)

(assert (=> b!206184 (= lt!105331 (+!494 lt!105333 lt!105330))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6529)

(assert (=> b!206184 (= lt!105330 (tuple2!3935 k0!843 v!520))))

(declare-datatypes ((Unit!6266 0))(
  ( (Unit!6267) )
))
(declare-fun lt!105334 () Unit!6266)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!148 (array!9527 array!9529 (_ BitVec 32) (_ BitVec 32) V!6529 V!6529 (_ BitVec 32) (_ BitVec 64) V!6529 (_ BitVec 32) Int) Unit!6266)

(assert (=> b!206184 (= lt!105334 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!148 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!405 (array!9527 array!9529 (_ BitVec 32) (_ BitVec 32) V!6529 V!6529 (_ BitVec 32) Int) ListLongMap!2849)

(assert (=> b!206184 (= lt!105329 (getCurrentListMapNoExtraKeys!405 _keys!825 lt!105335 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206184 (= lt!105335 (array!9530 (store (arr!4515 _values!649) i!601 (ValueCellFull!2237 v!520)) (size!4840 _values!649)))))

(assert (=> b!206184 (= lt!105333 (getCurrentListMapNoExtraKeys!405 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206185 () Bool)

(declare-fun e!134774 () Bool)

(assert (=> b!206185 (= e!134774 true)))

(declare-fun lt!105327 () ListLongMap!2849)

(declare-fun lt!105332 () ListLongMap!2849)

(assert (=> b!206185 (= lt!105327 (+!494 lt!105332 lt!105330))))

(declare-fun lt!105338 () Unit!6266)

(declare-fun addCommutativeForDiffKeys!195 (ListLongMap!2849 (_ BitVec 64) V!6529 (_ BitVec 64) V!6529) Unit!6266)

(assert (=> b!206185 (= lt!105338 (addCommutativeForDiffKeys!195 lt!105333 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!206186 () Bool)

(declare-fun res!99805 () Bool)

(assert (=> b!206186 (=> (not res!99805) (not e!134780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9527 (_ BitVec 32)) Bool)

(assert (=> b!206186 (= res!99805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206187 () Bool)

(declare-fun res!99804 () Bool)

(assert (=> b!206187 (=> (not res!99804) (not e!134780))))

(assert (=> b!206187 (= res!99804 (= (select (arr!4514 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8810 () Bool)

(declare-fun mapRes!8810 () Bool)

(assert (=> mapIsEmpty!8810 mapRes!8810))

(declare-fun b!206188 () Bool)

(declare-fun e!134779 () Bool)

(declare-fun e!134778 () Bool)

(assert (=> b!206188 (= e!134779 (and e!134778 mapRes!8810))))

(declare-fun condMapEmpty!8810 () Bool)

(declare-fun mapDefault!8810 () ValueCell!2237)

(assert (=> b!206188 (= condMapEmpty!8810 (= (arr!4515 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2237)) mapDefault!8810)))))

(declare-fun b!206189 () Bool)

(assert (=> b!206189 (= e!134777 e!134774)))

(declare-fun res!99803 () Bool)

(assert (=> b!206189 (=> res!99803 e!134774)))

(assert (=> b!206189 (= res!99803 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!206189 (= lt!105337 lt!105332)))

(declare-fun lt!105336 () tuple2!3934)

(assert (=> b!206189 (= lt!105332 (+!494 lt!105333 lt!105336))))

(assert (=> b!206189 (= lt!105328 lt!105327)))

(assert (=> b!206189 (= lt!105327 (+!494 lt!105331 lt!105336))))

(assert (=> b!206189 (= lt!105328 (+!494 lt!105329 lt!105336))))

(assert (=> b!206189 (= lt!105336 (tuple2!3935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!206190 () Bool)

(declare-fun e!134776 () Bool)

(declare-fun tp_is_empty!5161 () Bool)

(assert (=> b!206190 (= e!134776 tp_is_empty!5161)))

(declare-fun b!206191 () Bool)

(declare-fun res!99801 () Bool)

(assert (=> b!206191 (=> (not res!99801) (not e!134780))))

(assert (=> b!206191 (= res!99801 (and (= (size!4840 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4839 _keys!825) (size!4840 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!8810 () Bool)

(declare-fun tp!18947 () Bool)

(assert (=> mapNonEmpty!8810 (= mapRes!8810 (and tp!18947 e!134776))))

(declare-fun mapRest!8810 () (Array (_ BitVec 32) ValueCell!2237))

(declare-fun mapKey!8810 () (_ BitVec 32))

(declare-fun mapValue!8810 () ValueCell!2237)

(assert (=> mapNonEmpty!8810 (= (arr!4515 _values!649) (store mapRest!8810 mapKey!8810 mapValue!8810))))

(declare-fun res!99800 () Bool)

(assert (=> start!20650 (=> (not res!99800) (not e!134780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20650 (= res!99800 (validMask!0 mask!1149))))

(assert (=> start!20650 e!134780))

(declare-fun array_inv!2959 (array!9529) Bool)

(assert (=> start!20650 (and (array_inv!2959 _values!649) e!134779)))

(assert (=> start!20650 true))

(assert (=> start!20650 tp_is_empty!5161))

(declare-fun array_inv!2960 (array!9527) Bool)

(assert (=> start!20650 (array_inv!2960 _keys!825)))

(assert (=> start!20650 tp!18946))

(declare-fun b!206192 () Bool)

(declare-fun res!99806 () Bool)

(assert (=> b!206192 (=> (not res!99806) (not e!134780))))

(assert (=> b!206192 (= res!99806 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4839 _keys!825))))))

(declare-fun b!206193 () Bool)

(assert (=> b!206193 (= e!134778 tp_is_empty!5161)))

(declare-fun b!206194 () Bool)

(declare-fun res!99807 () Bool)

(assert (=> b!206194 (=> (not res!99807) (not e!134780))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206194 (= res!99807 (validKeyInArray!0 k0!843))))

(assert (= (and start!20650 res!99800) b!206191))

(assert (= (and b!206191 res!99801) b!206186))

(assert (= (and b!206186 res!99805) b!206183))

(assert (= (and b!206183 res!99802) b!206192))

(assert (= (and b!206192 res!99806) b!206194))

(assert (= (and b!206194 res!99807) b!206187))

(assert (= (and b!206187 res!99804) b!206184))

(assert (= (and b!206184 (not res!99808)) b!206189))

(assert (= (and b!206189 (not res!99803)) b!206185))

(assert (= (and b!206188 condMapEmpty!8810) mapIsEmpty!8810))

(assert (= (and b!206188 (not condMapEmpty!8810)) mapNonEmpty!8810))

(get-info :version)

(assert (= (and mapNonEmpty!8810 ((_ is ValueCellFull!2237) mapValue!8810)) b!206190))

(assert (= (and b!206188 ((_ is ValueCellFull!2237) mapDefault!8810)) b!206193))

(assert (= start!20650 b!206188))

(declare-fun m!234021 () Bool)

(assert (=> mapNonEmpty!8810 m!234021))

(declare-fun m!234023 () Bool)

(assert (=> b!206185 m!234023))

(declare-fun m!234025 () Bool)

(assert (=> b!206185 m!234025))

(declare-fun m!234027 () Bool)

(assert (=> start!20650 m!234027))

(declare-fun m!234029 () Bool)

(assert (=> start!20650 m!234029))

(declare-fun m!234031 () Bool)

(assert (=> start!20650 m!234031))

(declare-fun m!234033 () Bool)

(assert (=> b!206187 m!234033))

(declare-fun m!234035 () Bool)

(assert (=> b!206194 m!234035))

(declare-fun m!234037 () Bool)

(assert (=> b!206184 m!234037))

(declare-fun m!234039 () Bool)

(assert (=> b!206184 m!234039))

(declare-fun m!234041 () Bool)

(assert (=> b!206184 m!234041))

(declare-fun m!234043 () Bool)

(assert (=> b!206184 m!234043))

(declare-fun m!234045 () Bool)

(assert (=> b!206184 m!234045))

(declare-fun m!234047 () Bool)

(assert (=> b!206184 m!234047))

(declare-fun m!234049 () Bool)

(assert (=> b!206184 m!234049))

(declare-fun m!234051 () Bool)

(assert (=> b!206186 m!234051))

(declare-fun m!234053 () Bool)

(assert (=> b!206183 m!234053))

(declare-fun m!234055 () Bool)

(assert (=> b!206189 m!234055))

(declare-fun m!234057 () Bool)

(assert (=> b!206189 m!234057))

(declare-fun m!234059 () Bool)

(assert (=> b!206189 m!234059))

(check-sat (not b!206185) (not b!206189) tp_is_empty!5161 (not b!206186) (not b_next!5305) (not b!206184) (not mapNonEmpty!8810) (not b!206183) (not b!206194) (not start!20650) b_and!12065)
(check-sat b_and!12065 (not b_next!5305))
