; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20696 () Bool)

(assert start!20696)

(declare-fun b_free!5355 () Bool)

(declare-fun b_next!5355 () Bool)

(assert (=> start!20696 (= b_free!5355 (not b_next!5355))))

(declare-fun tp!19097 () Bool)

(declare-fun b_and!12101 () Bool)

(assert (=> start!20696 (= tp!19097 b_and!12101)))

(declare-fun b!206936 () Bool)

(declare-fun res!100355 () Bool)

(declare-fun e!135177 () Bool)

(assert (=> b!206936 (=> (not res!100355) (not e!135177))))

(declare-datatypes ((array!9631 0))(
  ( (array!9632 (arr!4566 (Array (_ BitVec 32) (_ BitVec 64))) (size!4891 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9631)

(declare-datatypes ((List!2914 0))(
  ( (Nil!2911) (Cons!2910 (h!3552 (_ BitVec 64)) (t!7845 List!2914)) )
))
(declare-fun arrayNoDuplicates!0 (array!9631 (_ BitVec 32) List!2914) Bool)

(assert (=> b!206936 (= res!100355 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2911))))

(declare-fun b!206937 () Bool)

(declare-fun res!100356 () Bool)

(assert (=> b!206937 (=> (not res!100356) (not e!135177))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6595 0))(
  ( (V!6596 (val!2650 Int)) )
))
(declare-datatypes ((ValueCell!2262 0))(
  ( (ValueCellFull!2262 (v!4620 V!6595)) (EmptyCell!2262) )
))
(declare-datatypes ((array!9633 0))(
  ( (array!9634 (arr!4567 (Array (_ BitVec 32) ValueCell!2262)) (size!4892 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9633)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!206937 (= res!100356 (and (= (size!4892 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4891 _keys!825) (size!4892 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8885 () Bool)

(declare-fun mapRes!8885 () Bool)

(assert (=> mapIsEmpty!8885 mapRes!8885))

(declare-fun b!206938 () Bool)

(assert (=> b!206938 (= e!135177 (not true))))

(declare-datatypes ((tuple2!4024 0))(
  ( (tuple2!4025 (_1!2023 (_ BitVec 64)) (_2!2023 V!6595)) )
))
(declare-datatypes ((List!2915 0))(
  ( (Nil!2912) (Cons!2911 (h!3553 tuple2!4024) (t!7846 List!2915)) )
))
(declare-datatypes ((ListLongMap!2937 0))(
  ( (ListLongMap!2938 (toList!1484 List!2915)) )
))
(declare-fun lt!105919 () ListLongMap!2937)

(declare-fun zeroValue!615 () V!6595)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6595)

(declare-fun getCurrentListMap!1051 (array!9631 array!9633 (_ BitVec 32) (_ BitVec 32) V!6595 V!6595 (_ BitVec 32) Int) ListLongMap!2937)

(assert (=> b!206938 (= lt!105919 (getCurrentListMap!1051 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105923 () array!9633)

(declare-fun lt!105924 () ListLongMap!2937)

(assert (=> b!206938 (= lt!105924 (getCurrentListMap!1051 _keys!825 lt!105923 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105920 () ListLongMap!2937)

(declare-fun lt!105921 () ListLongMap!2937)

(assert (=> b!206938 (and (= lt!105920 lt!105921) (= lt!105921 lt!105920))))

(declare-fun lt!105922 () ListLongMap!2937)

(declare-fun v!520 () V!6595)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun +!511 (ListLongMap!2937 tuple2!4024) ListLongMap!2937)

(assert (=> b!206938 (= lt!105921 (+!511 lt!105922 (tuple2!4025 k0!843 v!520)))))

(declare-datatypes ((Unit!6310 0))(
  ( (Unit!6311) )
))
(declare-fun lt!105918 () Unit!6310)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!164 (array!9631 array!9633 (_ BitVec 32) (_ BitVec 32) V!6595 V!6595 (_ BitVec 32) (_ BitVec 64) V!6595 (_ BitVec 32) Int) Unit!6310)

(assert (=> b!206938 (= lt!105918 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!164 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!425 (array!9631 array!9633 (_ BitVec 32) (_ BitVec 32) V!6595 V!6595 (_ BitVec 32) Int) ListLongMap!2937)

(assert (=> b!206938 (= lt!105920 (getCurrentListMapNoExtraKeys!425 _keys!825 lt!105923 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206938 (= lt!105923 (array!9634 (store (arr!4567 _values!649) i!601 (ValueCellFull!2262 v!520)) (size!4892 _values!649)))))

(assert (=> b!206938 (= lt!105922 (getCurrentListMapNoExtraKeys!425 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206939 () Bool)

(declare-fun res!100357 () Bool)

(assert (=> b!206939 (=> (not res!100357) (not e!135177))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206939 (= res!100357 (validKeyInArray!0 k0!843))))

(declare-fun b!206940 () Bool)

(declare-fun e!135175 () Bool)

(declare-fun e!135176 () Bool)

(assert (=> b!206940 (= e!135175 (and e!135176 mapRes!8885))))

(declare-fun condMapEmpty!8885 () Bool)

(declare-fun mapDefault!8885 () ValueCell!2262)

(assert (=> b!206940 (= condMapEmpty!8885 (= (arr!4567 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2262)) mapDefault!8885)))))

(declare-fun mapNonEmpty!8885 () Bool)

(declare-fun tp!19096 () Bool)

(declare-fun e!135179 () Bool)

(assert (=> mapNonEmpty!8885 (= mapRes!8885 (and tp!19096 e!135179))))

(declare-fun mapValue!8885 () ValueCell!2262)

(declare-fun mapRest!8885 () (Array (_ BitVec 32) ValueCell!2262))

(declare-fun mapKey!8885 () (_ BitVec 32))

(assert (=> mapNonEmpty!8885 (= (arr!4567 _values!649) (store mapRest!8885 mapKey!8885 mapValue!8885))))

(declare-fun b!206941 () Bool)

(declare-fun tp_is_empty!5211 () Bool)

(assert (=> b!206941 (= e!135176 tp_is_empty!5211)))

(declare-fun b!206942 () Bool)

(assert (=> b!206942 (= e!135179 tp_is_empty!5211)))

(declare-fun b!206943 () Bool)

(declare-fun res!100358 () Bool)

(assert (=> b!206943 (=> (not res!100358) (not e!135177))))

(assert (=> b!206943 (= res!100358 (= (select (arr!4566 _keys!825) i!601) k0!843))))

(declare-fun res!100360 () Bool)

(assert (=> start!20696 (=> (not res!100360) (not e!135177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20696 (= res!100360 (validMask!0 mask!1149))))

(assert (=> start!20696 e!135177))

(declare-fun array_inv!3021 (array!9633) Bool)

(assert (=> start!20696 (and (array_inv!3021 _values!649) e!135175)))

(assert (=> start!20696 true))

(assert (=> start!20696 tp_is_empty!5211))

(declare-fun array_inv!3022 (array!9631) Bool)

(assert (=> start!20696 (array_inv!3022 _keys!825)))

(assert (=> start!20696 tp!19097))

(declare-fun b!206944 () Bool)

(declare-fun res!100354 () Bool)

(assert (=> b!206944 (=> (not res!100354) (not e!135177))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9631 (_ BitVec 32)) Bool)

(assert (=> b!206944 (= res!100354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206945 () Bool)

(declare-fun res!100359 () Bool)

(assert (=> b!206945 (=> (not res!100359) (not e!135177))))

(assert (=> b!206945 (= res!100359 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4891 _keys!825))))))

(assert (= (and start!20696 res!100360) b!206937))

(assert (= (and b!206937 res!100356) b!206944))

(assert (= (and b!206944 res!100354) b!206936))

(assert (= (and b!206936 res!100355) b!206945))

(assert (= (and b!206945 res!100359) b!206939))

(assert (= (and b!206939 res!100357) b!206943))

(assert (= (and b!206943 res!100358) b!206938))

(assert (= (and b!206940 condMapEmpty!8885) mapIsEmpty!8885))

(assert (= (and b!206940 (not condMapEmpty!8885)) mapNonEmpty!8885))

(get-info :version)

(assert (= (and mapNonEmpty!8885 ((_ is ValueCellFull!2262) mapValue!8885)) b!206942))

(assert (= (and b!206940 ((_ is ValueCellFull!2262) mapDefault!8885)) b!206941))

(assert (= start!20696 b!206940))

(declare-fun m!234679 () Bool)

(assert (=> b!206939 m!234679))

(declare-fun m!234681 () Bool)

(assert (=> b!206936 m!234681))

(declare-fun m!234683 () Bool)

(assert (=> start!20696 m!234683))

(declare-fun m!234685 () Bool)

(assert (=> start!20696 m!234685))

(declare-fun m!234687 () Bool)

(assert (=> start!20696 m!234687))

(declare-fun m!234689 () Bool)

(assert (=> mapNonEmpty!8885 m!234689))

(declare-fun m!234691 () Bool)

(assert (=> b!206944 m!234691))

(declare-fun m!234693 () Bool)

(assert (=> b!206943 m!234693))

(declare-fun m!234695 () Bool)

(assert (=> b!206938 m!234695))

(declare-fun m!234697 () Bool)

(assert (=> b!206938 m!234697))

(declare-fun m!234699 () Bool)

(assert (=> b!206938 m!234699))

(declare-fun m!234701 () Bool)

(assert (=> b!206938 m!234701))

(declare-fun m!234703 () Bool)

(assert (=> b!206938 m!234703))

(declare-fun m!234705 () Bool)

(assert (=> b!206938 m!234705))

(declare-fun m!234707 () Bool)

(assert (=> b!206938 m!234707))

(check-sat (not b!206936) (not b!206939) (not start!20696) (not b!206938) b_and!12101 (not mapNonEmpty!8885) (not b!206944) tp_is_empty!5211 (not b_next!5355))
(check-sat b_and!12101 (not b_next!5355))
