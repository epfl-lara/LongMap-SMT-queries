; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20524 () Bool)

(assert start!20524)

(declare-fun b_free!5179 () Bool)

(declare-fun b_next!5179 () Bool)

(assert (=> start!20524 (= b_free!5179 (not b_next!5179))))

(declare-fun tp!18568 () Bool)

(declare-fun b_and!11939 () Bool)

(assert (=> start!20524 (= tp!18568 b_and!11939)))

(declare-fun res!98092 () Bool)

(declare-fun e!133453 () Bool)

(assert (=> start!20524 (=> (not res!98092) (not e!133453))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20524 (= res!98092 (validMask!0 mask!1149))))

(assert (=> start!20524 e!133453))

(declare-datatypes ((V!6361 0))(
  ( (V!6362 (val!2562 Int)) )
))
(declare-datatypes ((ValueCell!2174 0))(
  ( (ValueCellFull!2174 (v!4533 V!6361)) (EmptyCell!2174) )
))
(declare-datatypes ((array!9281 0))(
  ( (array!9282 (arr!4391 (Array (_ BitVec 32) ValueCell!2174)) (size!4716 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9281)

(declare-fun e!133451 () Bool)

(declare-fun array_inv!2869 (array!9281) Bool)

(assert (=> start!20524 (and (array_inv!2869 _values!649) e!133451)))

(assert (=> start!20524 true))

(declare-fun tp_is_empty!5035 () Bool)

(assert (=> start!20524 tp_is_empty!5035))

(declare-datatypes ((array!9283 0))(
  ( (array!9284 (arr!4392 (Array (_ BitVec 32) (_ BitVec 64))) (size!4717 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9283)

(declare-fun array_inv!2870 (array!9283) Bool)

(assert (=> start!20524 (array_inv!2870 _keys!825)))

(assert (=> start!20524 tp!18568))

(declare-fun b!203906 () Bool)

(declare-fun e!133456 () Bool)

(declare-fun mapRes!8621 () Bool)

(assert (=> b!203906 (= e!133451 (and e!133456 mapRes!8621))))

(declare-fun condMapEmpty!8621 () Bool)

(declare-fun mapDefault!8621 () ValueCell!2174)

(assert (=> b!203906 (= condMapEmpty!8621 (= (arr!4391 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2174)) mapDefault!8621)))))

(declare-fun b!203907 () Bool)

(declare-fun res!98098 () Bool)

(assert (=> b!203907 (=> (not res!98098) (not e!133453))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9283 (_ BitVec 32)) Bool)

(assert (=> b!203907 (= res!98098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!203908 () Bool)

(declare-fun res!98091 () Bool)

(assert (=> b!203908 (=> (not res!98091) (not e!133453))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!203908 (= res!98091 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4717 _keys!825))))))

(declare-fun b!203909 () Bool)

(declare-fun e!133454 () Bool)

(declare-fun e!133457 () Bool)

(assert (=> b!203909 (= e!133454 e!133457)))

(declare-fun res!98095 () Bool)

(assert (=> b!203909 (=> res!98095 e!133457)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!203909 (= res!98095 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3826 0))(
  ( (tuple2!3827 (_1!1924 (_ BitVec 64)) (_2!1924 V!6361)) )
))
(declare-datatypes ((List!2725 0))(
  ( (Nil!2722) (Cons!2721 (h!3363 tuple2!3826) (t!7648 List!2725)) )
))
(declare-datatypes ((ListLongMap!2741 0))(
  ( (ListLongMap!2742 (toList!1386 List!2725)) )
))
(declare-fun lt!103095 () ListLongMap!2741)

(declare-fun lt!103098 () ListLongMap!2741)

(assert (=> b!203909 (= lt!103095 lt!103098)))

(declare-fun lt!103104 () ListLongMap!2741)

(declare-fun lt!103099 () tuple2!3826)

(declare-fun +!440 (ListLongMap!2741 tuple2!3826) ListLongMap!2741)

(assert (=> b!203909 (= lt!103098 (+!440 lt!103104 lt!103099))))

(declare-fun lt!103097 () ListLongMap!2741)

(declare-fun lt!103103 () ListLongMap!2741)

(assert (=> b!203909 (= lt!103097 lt!103103)))

(declare-fun lt!103100 () ListLongMap!2741)

(assert (=> b!203909 (= lt!103103 (+!440 lt!103100 lt!103099))))

(declare-fun lt!103102 () ListLongMap!2741)

(assert (=> b!203909 (= lt!103095 (+!440 lt!103102 lt!103099))))

(declare-fun zeroValue!615 () V!6361)

(assert (=> b!203909 (= lt!103099 (tuple2!3827 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203910 () Bool)

(assert (=> b!203910 (= e!133453 (not e!133454))))

(declare-fun res!98097 () Bool)

(assert (=> b!203910 (=> res!98097 e!133454)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!203910 (= res!98097 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6361)

(declare-fun getCurrentListMap!964 (array!9283 array!9281 (_ BitVec 32) (_ BitVec 32) V!6361 V!6361 (_ BitVec 32) Int) ListLongMap!2741)

(assert (=> b!203910 (= lt!103097 (getCurrentListMap!964 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103101 () array!9281)

(assert (=> b!203910 (= lt!103095 (getCurrentListMap!964 _keys!825 lt!103101 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203910 (and (= lt!103102 lt!103104) (= lt!103104 lt!103102))))

(declare-fun lt!103096 () tuple2!3826)

(assert (=> b!203910 (= lt!103104 (+!440 lt!103100 lt!103096))))

(declare-fun v!520 () V!6361)

(assert (=> b!203910 (= lt!103096 (tuple2!3827 k0!843 v!520))))

(declare-datatypes ((Unit!6160 0))(
  ( (Unit!6161) )
))
(declare-fun lt!103106 () Unit!6160)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!100 (array!9283 array!9281 (_ BitVec 32) (_ BitVec 32) V!6361 V!6361 (_ BitVec 32) (_ BitVec 64) V!6361 (_ BitVec 32) Int) Unit!6160)

(assert (=> b!203910 (= lt!103106 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!100 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!357 (array!9283 array!9281 (_ BitVec 32) (_ BitVec 32) V!6361 V!6361 (_ BitVec 32) Int) ListLongMap!2741)

(assert (=> b!203910 (= lt!103102 (getCurrentListMapNoExtraKeys!357 _keys!825 lt!103101 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203910 (= lt!103101 (array!9282 (store (arr!4391 _values!649) i!601 (ValueCellFull!2174 v!520)) (size!4716 _values!649)))))

(assert (=> b!203910 (= lt!103100 (getCurrentListMapNoExtraKeys!357 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8621 () Bool)

(assert (=> mapIsEmpty!8621 mapRes!8621))

(declare-fun b!203911 () Bool)

(assert (=> b!203911 (= e!133456 tp_is_empty!5035)))

(declare-fun mapNonEmpty!8621 () Bool)

(declare-fun tp!18569 () Bool)

(declare-fun e!133455 () Bool)

(assert (=> mapNonEmpty!8621 (= mapRes!8621 (and tp!18569 e!133455))))

(declare-fun mapKey!8621 () (_ BitVec 32))

(declare-fun mapValue!8621 () ValueCell!2174)

(declare-fun mapRest!8621 () (Array (_ BitVec 32) ValueCell!2174))

(assert (=> mapNonEmpty!8621 (= (arr!4391 _values!649) (store mapRest!8621 mapKey!8621 mapValue!8621))))

(declare-fun b!203912 () Bool)

(assert (=> b!203912 (= e!133457 true)))

(assert (=> b!203912 (= lt!103098 (+!440 lt!103103 lt!103096))))

(declare-fun lt!103105 () Unit!6160)

(declare-fun addCommutativeForDiffKeys!154 (ListLongMap!2741 (_ BitVec 64) V!6361 (_ BitVec 64) V!6361) Unit!6160)

(assert (=> b!203912 (= lt!103105 (addCommutativeForDiffKeys!154 lt!103100 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203913 () Bool)

(declare-fun res!98093 () Bool)

(assert (=> b!203913 (=> (not res!98093) (not e!133453))))

(declare-datatypes ((List!2726 0))(
  ( (Nil!2723) (Cons!2722 (h!3364 (_ BitVec 64)) (t!7649 List!2726)) )
))
(declare-fun arrayNoDuplicates!0 (array!9283 (_ BitVec 32) List!2726) Bool)

(assert (=> b!203913 (= res!98093 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2723))))

(declare-fun b!203914 () Bool)

(declare-fun res!98096 () Bool)

(assert (=> b!203914 (=> (not res!98096) (not e!133453))))

(assert (=> b!203914 (= res!98096 (and (= (size!4716 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4717 _keys!825) (size!4716 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!203915 () Bool)

(assert (=> b!203915 (= e!133455 tp_is_empty!5035)))

(declare-fun b!203916 () Bool)

(declare-fun res!98094 () Bool)

(assert (=> b!203916 (=> (not res!98094) (not e!133453))))

(assert (=> b!203916 (= res!98094 (= (select (arr!4392 _keys!825) i!601) k0!843))))

(declare-fun b!203917 () Bool)

(declare-fun res!98090 () Bool)

(assert (=> b!203917 (=> (not res!98090) (not e!133453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203917 (= res!98090 (validKeyInArray!0 k0!843))))

(assert (= (and start!20524 res!98092) b!203914))

(assert (= (and b!203914 res!98096) b!203907))

(assert (= (and b!203907 res!98098) b!203913))

(assert (= (and b!203913 res!98093) b!203908))

(assert (= (and b!203908 res!98091) b!203917))

(assert (= (and b!203917 res!98090) b!203916))

(assert (= (and b!203916 res!98094) b!203910))

(assert (= (and b!203910 (not res!98097)) b!203909))

(assert (= (and b!203909 (not res!98095)) b!203912))

(assert (= (and b!203906 condMapEmpty!8621) mapIsEmpty!8621))

(assert (= (and b!203906 (not condMapEmpty!8621)) mapNonEmpty!8621))

(get-info :version)

(assert (= (and mapNonEmpty!8621 ((_ is ValueCellFull!2174) mapValue!8621)) b!203915))

(assert (= (and b!203906 ((_ is ValueCellFull!2174) mapDefault!8621)) b!203911))

(assert (= start!20524 b!203906))

(declare-fun m!231513 () Bool)

(assert (=> mapNonEmpty!8621 m!231513))

(declare-fun m!231515 () Bool)

(assert (=> b!203909 m!231515))

(declare-fun m!231517 () Bool)

(assert (=> b!203909 m!231517))

(declare-fun m!231519 () Bool)

(assert (=> b!203909 m!231519))

(declare-fun m!231521 () Bool)

(assert (=> b!203907 m!231521))

(declare-fun m!231523 () Bool)

(assert (=> start!20524 m!231523))

(declare-fun m!231525 () Bool)

(assert (=> start!20524 m!231525))

(declare-fun m!231527 () Bool)

(assert (=> start!20524 m!231527))

(declare-fun m!231529 () Bool)

(assert (=> b!203910 m!231529))

(declare-fun m!231531 () Bool)

(assert (=> b!203910 m!231531))

(declare-fun m!231533 () Bool)

(assert (=> b!203910 m!231533))

(declare-fun m!231535 () Bool)

(assert (=> b!203910 m!231535))

(declare-fun m!231537 () Bool)

(assert (=> b!203910 m!231537))

(declare-fun m!231539 () Bool)

(assert (=> b!203910 m!231539))

(declare-fun m!231541 () Bool)

(assert (=> b!203910 m!231541))

(declare-fun m!231543 () Bool)

(assert (=> b!203912 m!231543))

(declare-fun m!231545 () Bool)

(assert (=> b!203912 m!231545))

(declare-fun m!231547 () Bool)

(assert (=> b!203917 m!231547))

(declare-fun m!231549 () Bool)

(assert (=> b!203913 m!231549))

(declare-fun m!231551 () Bool)

(assert (=> b!203916 m!231551))

(check-sat (not start!20524) (not b!203913) (not b!203910) b_and!11939 (not b_next!5179) (not b!203917) (not mapNonEmpty!8621) (not b!203907) (not b!203912) tp_is_empty!5035 (not b!203909))
(check-sat b_and!11939 (not b_next!5179))
