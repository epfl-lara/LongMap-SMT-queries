; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20644 () Bool)

(assert start!20644)

(declare-fun b_free!5299 () Bool)

(declare-fun b_next!5299 () Bool)

(assert (=> start!20644 (= b_free!5299 (not b_next!5299))))

(declare-fun tp!18928 () Bool)

(declare-fun b_and!12059 () Bool)

(assert (=> start!20644 (= tp!18928 b_and!12059)))

(declare-fun b!206075 () Bool)

(declare-fun res!99720 () Bool)

(declare-fun e!134712 () Bool)

(assert (=> b!206075 (=> (not res!99720) (not e!134712))))

(declare-datatypes ((array!9515 0))(
  ( (array!9516 (arr!4508 (Array (_ BitVec 32) (_ BitVec 64))) (size!4833 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9515)

(declare-datatypes ((List!2819 0))(
  ( (Nil!2816) (Cons!2815 (h!3457 (_ BitVec 64)) (t!7742 List!2819)) )
))
(declare-fun arrayNoDuplicates!0 (array!9515 (_ BitVec 32) List!2819) Bool)

(assert (=> b!206075 (= res!99720 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2816))))

(declare-fun b!206076 () Bool)

(declare-fun res!99723 () Bool)

(assert (=> b!206076 (=> (not res!99723) (not e!134712))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!206076 (= res!99723 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4833 _keys!825))))))

(declare-fun b!206077 () Bool)

(declare-fun res!99725 () Bool)

(assert (=> b!206077 (=> (not res!99725) (not e!134712))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9515 (_ BitVec 32)) Bool)

(assert (=> b!206077 (= res!99725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!99719 () Bool)

(assert (=> start!20644 (=> (not res!99719) (not e!134712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20644 (= res!99719 (validMask!0 mask!1149))))

(assert (=> start!20644 e!134712))

(declare-datatypes ((V!6521 0))(
  ( (V!6522 (val!2622 Int)) )
))
(declare-datatypes ((ValueCell!2234 0))(
  ( (ValueCellFull!2234 (v!4593 V!6521)) (EmptyCell!2234) )
))
(declare-datatypes ((array!9517 0))(
  ( (array!9518 (arr!4509 (Array (_ BitVec 32) ValueCell!2234)) (size!4834 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9517)

(declare-fun e!134717 () Bool)

(declare-fun array_inv!2953 (array!9517) Bool)

(assert (=> start!20644 (and (array_inv!2953 _values!649) e!134717)))

(assert (=> start!20644 true))

(declare-fun tp_is_empty!5155 () Bool)

(assert (=> start!20644 tp_is_empty!5155))

(declare-fun array_inv!2954 (array!9515) Bool)

(assert (=> start!20644 (array_inv!2954 _keys!825)))

(assert (=> start!20644 tp!18928))

(declare-fun b!206078 () Bool)

(declare-fun res!99724 () Bool)

(assert (=> b!206078 (=> (not res!99724) (not e!134712))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!206078 (= res!99724 (= (select (arr!4508 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8801 () Bool)

(declare-fun mapRes!8801 () Bool)

(assert (=> mapIsEmpty!8801 mapRes!8801))

(declare-fun b!206079 () Bool)

(declare-fun res!99721 () Bool)

(assert (=> b!206079 (=> (not res!99721) (not e!134712))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206079 (= res!99721 (validKeyInArray!0 k0!843))))

(declare-fun b!206080 () Bool)

(declare-fun e!134716 () Bool)

(assert (=> b!206080 (= e!134716 true)))

(declare-datatypes ((tuple2!3928 0))(
  ( (tuple2!3929 (_1!1975 (_ BitVec 64)) (_2!1975 V!6521)) )
))
(declare-datatypes ((List!2820 0))(
  ( (Nil!2817) (Cons!2816 (h!3458 tuple2!3928) (t!7743 List!2820)) )
))
(declare-datatypes ((ListLongMap!2843 0))(
  ( (ListLongMap!2844 (toList!1437 List!2820)) )
))
(declare-fun lt!105226 () ListLongMap!2843)

(declare-fun lt!105228 () ListLongMap!2843)

(declare-fun lt!105229 () tuple2!3928)

(declare-fun +!491 (ListLongMap!2843 tuple2!3928) ListLongMap!2843)

(assert (=> b!206080 (= lt!105226 (+!491 lt!105228 lt!105229))))

(declare-fun minValue!615 () V!6521)

(declare-fun v!520 () V!6521)

(declare-fun lt!105219 () ListLongMap!2843)

(declare-datatypes ((Unit!6260 0))(
  ( (Unit!6261) )
))
(declare-fun lt!105224 () Unit!6260)

(declare-fun addCommutativeForDiffKeys!194 (ListLongMap!2843 (_ BitVec 64) V!6521 (_ BitVec 64) V!6521) Unit!6260)

(assert (=> b!206080 (= lt!105224 (addCommutativeForDiffKeys!194 lt!105219 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!206081 () Bool)

(declare-fun e!134714 () Bool)

(assert (=> b!206081 (= e!134717 (and e!134714 mapRes!8801))))

(declare-fun condMapEmpty!8801 () Bool)

(declare-fun mapDefault!8801 () ValueCell!2234)

(assert (=> b!206081 (= condMapEmpty!8801 (= (arr!4509 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2234)) mapDefault!8801)))))

(declare-fun b!206082 () Bool)

(declare-fun e!134713 () Bool)

(assert (=> b!206082 (= e!134712 (not e!134713))))

(declare-fun res!99726 () Bool)

(assert (=> b!206082 (=> res!99726 e!134713)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!206082 (= res!99726 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6521)

(declare-fun defaultEntry!657 () Int)

(declare-fun lt!105225 () ListLongMap!2843)

(declare-fun getCurrentListMap!1009 (array!9515 array!9517 (_ BitVec 32) (_ BitVec 32) V!6521 V!6521 (_ BitVec 32) Int) ListLongMap!2843)

(assert (=> b!206082 (= lt!105225 (getCurrentListMap!1009 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105230 () array!9517)

(declare-fun lt!105221 () ListLongMap!2843)

(assert (=> b!206082 (= lt!105221 (getCurrentListMap!1009 _keys!825 lt!105230 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105227 () ListLongMap!2843)

(declare-fun lt!105222 () ListLongMap!2843)

(assert (=> b!206082 (and (= lt!105227 lt!105222) (= lt!105222 lt!105227))))

(assert (=> b!206082 (= lt!105222 (+!491 lt!105219 lt!105229))))

(assert (=> b!206082 (= lt!105229 (tuple2!3929 k0!843 v!520))))

(declare-fun lt!105220 () Unit!6260)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!145 (array!9515 array!9517 (_ BitVec 32) (_ BitVec 32) V!6521 V!6521 (_ BitVec 32) (_ BitVec 64) V!6521 (_ BitVec 32) Int) Unit!6260)

(assert (=> b!206082 (= lt!105220 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!145 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!402 (array!9515 array!9517 (_ BitVec 32) (_ BitVec 32) V!6521 V!6521 (_ BitVec 32) Int) ListLongMap!2843)

(assert (=> b!206082 (= lt!105227 (getCurrentListMapNoExtraKeys!402 _keys!825 lt!105230 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206082 (= lt!105230 (array!9518 (store (arr!4509 _values!649) i!601 (ValueCellFull!2234 v!520)) (size!4834 _values!649)))))

(assert (=> b!206082 (= lt!105219 (getCurrentListMapNoExtraKeys!402 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206083 () Bool)

(declare-fun e!134711 () Bool)

(assert (=> b!206083 (= e!134711 tp_is_empty!5155)))

(declare-fun b!206084 () Bool)

(assert (=> b!206084 (= e!134714 tp_is_empty!5155)))

(declare-fun mapNonEmpty!8801 () Bool)

(declare-fun tp!18929 () Bool)

(assert (=> mapNonEmpty!8801 (= mapRes!8801 (and tp!18929 e!134711))))

(declare-fun mapValue!8801 () ValueCell!2234)

(declare-fun mapRest!8801 () (Array (_ BitVec 32) ValueCell!2234))

(declare-fun mapKey!8801 () (_ BitVec 32))

(assert (=> mapNonEmpty!8801 (= (arr!4509 _values!649) (store mapRest!8801 mapKey!8801 mapValue!8801))))

(declare-fun b!206085 () Bool)

(assert (=> b!206085 (= e!134713 e!134716)))

(declare-fun res!99722 () Bool)

(assert (=> b!206085 (=> res!99722 e!134716)))

(assert (=> b!206085 (= res!99722 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!206085 (= lt!105225 lt!105228)))

(declare-fun lt!105223 () tuple2!3928)

(assert (=> b!206085 (= lt!105228 (+!491 lt!105219 lt!105223))))

(assert (=> b!206085 (= lt!105221 lt!105226)))

(assert (=> b!206085 (= lt!105226 (+!491 lt!105222 lt!105223))))

(assert (=> b!206085 (= lt!105221 (+!491 lt!105227 lt!105223))))

(assert (=> b!206085 (= lt!105223 (tuple2!3929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!206086 () Bool)

(declare-fun res!99727 () Bool)

(assert (=> b!206086 (=> (not res!99727) (not e!134712))))

(assert (=> b!206086 (= res!99727 (and (= (size!4834 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4833 _keys!825) (size!4834 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20644 res!99719) b!206086))

(assert (= (and b!206086 res!99727) b!206077))

(assert (= (and b!206077 res!99725) b!206075))

(assert (= (and b!206075 res!99720) b!206076))

(assert (= (and b!206076 res!99723) b!206079))

(assert (= (and b!206079 res!99721) b!206078))

(assert (= (and b!206078 res!99724) b!206082))

(assert (= (and b!206082 (not res!99726)) b!206085))

(assert (= (and b!206085 (not res!99722)) b!206080))

(assert (= (and b!206081 condMapEmpty!8801) mapIsEmpty!8801))

(assert (= (and b!206081 (not condMapEmpty!8801)) mapNonEmpty!8801))

(get-info :version)

(assert (= (and mapNonEmpty!8801 ((_ is ValueCellFull!2234) mapValue!8801)) b!206083))

(assert (= (and b!206081 ((_ is ValueCellFull!2234) mapDefault!8801)) b!206084))

(assert (= start!20644 b!206081))

(declare-fun m!233901 () Bool)

(assert (=> b!206078 m!233901))

(declare-fun m!233903 () Bool)

(assert (=> b!206080 m!233903))

(declare-fun m!233905 () Bool)

(assert (=> b!206080 m!233905))

(declare-fun m!233907 () Bool)

(assert (=> start!20644 m!233907))

(declare-fun m!233909 () Bool)

(assert (=> start!20644 m!233909))

(declare-fun m!233911 () Bool)

(assert (=> start!20644 m!233911))

(declare-fun m!233913 () Bool)

(assert (=> b!206082 m!233913))

(declare-fun m!233915 () Bool)

(assert (=> b!206082 m!233915))

(declare-fun m!233917 () Bool)

(assert (=> b!206082 m!233917))

(declare-fun m!233919 () Bool)

(assert (=> b!206082 m!233919))

(declare-fun m!233921 () Bool)

(assert (=> b!206082 m!233921))

(declare-fun m!233923 () Bool)

(assert (=> b!206082 m!233923))

(declare-fun m!233925 () Bool)

(assert (=> b!206082 m!233925))

(declare-fun m!233927 () Bool)

(assert (=> b!206085 m!233927))

(declare-fun m!233929 () Bool)

(assert (=> b!206085 m!233929))

(declare-fun m!233931 () Bool)

(assert (=> b!206085 m!233931))

(declare-fun m!233933 () Bool)

(assert (=> b!206079 m!233933))

(declare-fun m!233935 () Bool)

(assert (=> b!206075 m!233935))

(declare-fun m!233937 () Bool)

(assert (=> mapNonEmpty!8801 m!233937))

(declare-fun m!233939 () Bool)

(assert (=> b!206077 m!233939))

(check-sat (not b!206079) (not b!206080) (not start!20644) (not b!206085) (not b!206077) b_and!12059 (not b!206082) (not mapNonEmpty!8801) tp_is_empty!5155 (not b!206075) (not b_next!5299))
(check-sat b_and!12059 (not b_next!5299))
