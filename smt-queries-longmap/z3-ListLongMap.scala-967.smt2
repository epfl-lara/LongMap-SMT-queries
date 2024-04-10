; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20982 () Bool)

(assert start!20982)

(declare-fun b_free!5553 () Bool)

(declare-fun b_next!5553 () Bool)

(assert (=> start!20982 (= b_free!5553 (not b_next!5553))))

(declare-fun tp!19712 () Bool)

(declare-fun b_and!12347 () Bool)

(assert (=> start!20982 (= tp!19712 b_and!12347)))

(declare-fun b!210816 () Bool)

(declare-fun e!137266 () Bool)

(declare-fun e!137264 () Bool)

(declare-fun mapRes!9203 () Bool)

(assert (=> b!210816 (= e!137266 (and e!137264 mapRes!9203))))

(declare-fun condMapEmpty!9203 () Bool)

(declare-datatypes ((V!6867 0))(
  ( (V!6868 (val!2752 Int)) )
))
(declare-datatypes ((ValueCell!2364 0))(
  ( (ValueCellFull!2364 (v!4738 V!6867)) (EmptyCell!2364) )
))
(declare-datatypes ((array!10031 0))(
  ( (array!10032 (arr!4762 (Array (_ BitVec 32) ValueCell!2364)) (size!5087 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10031)

(declare-fun mapDefault!9203 () ValueCell!2364)

(assert (=> b!210816 (= condMapEmpty!9203 (= (arr!4762 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2364)) mapDefault!9203)))))

(declare-fun b!210817 () Bool)

(declare-fun res!102889 () Bool)

(declare-fun e!137263 () Bool)

(assert (=> b!210817 (=> (not res!102889) (not e!137263))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!210817 (= res!102889 (validKeyInArray!0 k0!843))))

(declare-fun b!210818 () Bool)

(declare-fun e!137261 () Bool)

(declare-fun tp_is_empty!5415 () Bool)

(assert (=> b!210818 (= e!137261 tp_is_empty!5415)))

(declare-fun mapIsEmpty!9203 () Bool)

(assert (=> mapIsEmpty!9203 mapRes!9203))

(declare-fun b!210819 () Bool)

(declare-fun res!102885 () Bool)

(assert (=> b!210819 (=> (not res!102885) (not e!137263))))

(declare-datatypes ((array!10033 0))(
  ( (array!10034 (arr!4763 (Array (_ BitVec 32) (_ BitVec 64))) (size!5088 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10033)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!210819 (= res!102885 (and (= (size!5087 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5088 _keys!825) (size!5087 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!102888 () Bool)

(assert (=> start!20982 (=> (not res!102888) (not e!137263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20982 (= res!102888 (validMask!0 mask!1149))))

(assert (=> start!20982 e!137263))

(declare-fun array_inv!3153 (array!10031) Bool)

(assert (=> start!20982 (and (array_inv!3153 _values!649) e!137266)))

(assert (=> start!20982 true))

(assert (=> start!20982 tp_is_empty!5415))

(declare-fun array_inv!3154 (array!10033) Bool)

(assert (=> start!20982 (array_inv!3154 _keys!825)))

(assert (=> start!20982 tp!19712))

(declare-fun b!210820 () Bool)

(declare-fun e!137267 () Bool)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!210820 (= e!137267 (bvslt i!601 (size!5087 _values!649)))))

(declare-datatypes ((tuple2!4158 0))(
  ( (tuple2!4159 (_1!2090 (_ BitVec 64)) (_2!2090 V!6867)) )
))
(declare-fun lt!108183 () tuple2!4158)

(declare-fun lt!108180 () tuple2!4158)

(declare-datatypes ((List!3052 0))(
  ( (Nil!3049) (Cons!3048 (h!3690 tuple2!4158) (t!7991 List!3052)) )
))
(declare-datatypes ((ListLongMap!3071 0))(
  ( (ListLongMap!3072 (toList!1551 List!3052)) )
))
(declare-fun lt!108177 () ListLongMap!3071)

(declare-fun lt!108172 () ListLongMap!3071)

(declare-fun +!554 (ListLongMap!3071 tuple2!4158) ListLongMap!3071)

(assert (=> b!210820 (= (+!554 lt!108172 lt!108183) (+!554 lt!108177 lt!108180))))

(declare-fun minValue!615 () V!6867)

(declare-fun lt!108168 () ListLongMap!3071)

(declare-datatypes ((Unit!6398 0))(
  ( (Unit!6399) )
))
(declare-fun lt!108173 () Unit!6398)

(declare-fun v!520 () V!6867)

(declare-fun addCommutativeForDiffKeys!199 (ListLongMap!3071 (_ BitVec 64) V!6867 (_ BitVec 64) V!6867) Unit!6398)

(assert (=> b!210820 (= lt!108173 (addCommutativeForDiffKeys!199 lt!108168 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!210821 () Bool)

(declare-fun e!137262 () Bool)

(assert (=> b!210821 (= e!137263 (not e!137262))))

(declare-fun res!102886 () Bool)

(assert (=> b!210821 (=> res!102886 e!137262)))

(assert (=> b!210821 (= res!102886 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!108169 () ListLongMap!3071)

(declare-fun zeroValue!615 () V!6867)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1087 (array!10033 array!10031 (_ BitVec 32) (_ BitVec 32) V!6867 V!6867 (_ BitVec 32) Int) ListLongMap!3071)

(assert (=> b!210821 (= lt!108169 (getCurrentListMap!1087 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108182 () array!10031)

(declare-fun lt!108171 () ListLongMap!3071)

(assert (=> b!210821 (= lt!108171 (getCurrentListMap!1087 _keys!825 lt!108182 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108178 () ListLongMap!3071)

(declare-fun lt!108181 () ListLongMap!3071)

(assert (=> b!210821 (and (= lt!108178 lt!108181) (= lt!108181 lt!108178))))

(declare-fun lt!108175 () ListLongMap!3071)

(assert (=> b!210821 (= lt!108181 (+!554 lt!108175 lt!108180))))

(assert (=> b!210821 (= lt!108180 (tuple2!4159 k0!843 v!520))))

(declare-fun lt!108170 () Unit!6398)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!204 (array!10033 array!10031 (_ BitVec 32) (_ BitVec 32) V!6867 V!6867 (_ BitVec 32) (_ BitVec 64) V!6867 (_ BitVec 32) Int) Unit!6398)

(assert (=> b!210821 (= lt!108170 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!204 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!489 (array!10033 array!10031 (_ BitVec 32) (_ BitVec 32) V!6867 V!6867 (_ BitVec 32) Int) ListLongMap!3071)

(assert (=> b!210821 (= lt!108178 (getCurrentListMapNoExtraKeys!489 _keys!825 lt!108182 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!210821 (= lt!108182 (array!10032 (store (arr!4762 _values!649) i!601 (ValueCellFull!2364 v!520)) (size!5087 _values!649)))))

(assert (=> b!210821 (= lt!108175 (getCurrentListMapNoExtraKeys!489 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210822 () Bool)

(declare-fun res!102892 () Bool)

(assert (=> b!210822 (=> (not res!102892) (not e!137263))))

(assert (=> b!210822 (= res!102892 (= (select (arr!4763 _keys!825) i!601) k0!843))))

(declare-fun b!210823 () Bool)

(declare-fun res!102890 () Bool)

(assert (=> b!210823 (=> (not res!102890) (not e!137263))))

(assert (=> b!210823 (= res!102890 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5088 _keys!825))))))

(declare-fun mapNonEmpty!9203 () Bool)

(declare-fun tp!19711 () Bool)

(assert (=> mapNonEmpty!9203 (= mapRes!9203 (and tp!19711 e!137261))))

(declare-fun mapRest!9203 () (Array (_ BitVec 32) ValueCell!2364))

(declare-fun mapKey!9203 () (_ BitVec 32))

(declare-fun mapValue!9203 () ValueCell!2364)

(assert (=> mapNonEmpty!9203 (= (arr!4762 _values!649) (store mapRest!9203 mapKey!9203 mapValue!9203))))

(declare-fun b!210824 () Bool)

(assert (=> b!210824 (= e!137264 tp_is_empty!5415)))

(declare-fun b!210825 () Bool)

(declare-fun res!102884 () Bool)

(assert (=> b!210825 (=> (not res!102884) (not e!137263))))

(declare-datatypes ((List!3053 0))(
  ( (Nil!3050) (Cons!3049 (h!3691 (_ BitVec 64)) (t!7992 List!3053)) )
))
(declare-fun arrayNoDuplicates!0 (array!10033 (_ BitVec 32) List!3053) Bool)

(assert (=> b!210825 (= res!102884 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3050))))

(declare-fun b!210826 () Bool)

(declare-fun res!102891 () Bool)

(assert (=> b!210826 (=> (not res!102891) (not e!137263))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10033 (_ BitVec 32)) Bool)

(assert (=> b!210826 (= res!102891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!210827 () Bool)

(assert (=> b!210827 (= e!137262 e!137267)))

(declare-fun res!102887 () Bool)

(assert (=> b!210827 (=> res!102887 e!137267)))

(assert (=> b!210827 (= res!102887 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!108179 () ListLongMap!3071)

(assert (=> b!210827 (= lt!108179 lt!108172)))

(assert (=> b!210827 (= lt!108172 (+!554 lt!108168 lt!108180))))

(declare-fun lt!108174 () Unit!6398)

(assert (=> b!210827 (= lt!108174 (addCommutativeForDiffKeys!199 lt!108175 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (=> b!210827 (= lt!108171 (+!554 lt!108179 lt!108183))))

(declare-fun lt!108176 () tuple2!4158)

(assert (=> b!210827 (= lt!108179 (+!554 lt!108181 lt!108176))))

(assert (=> b!210827 (= lt!108169 lt!108177)))

(assert (=> b!210827 (= lt!108177 (+!554 lt!108168 lt!108183))))

(assert (=> b!210827 (= lt!108168 (+!554 lt!108175 lt!108176))))

(assert (=> b!210827 (= lt!108171 (+!554 (+!554 lt!108178 lt!108176) lt!108183))))

(assert (=> b!210827 (= lt!108183 (tuple2!4159 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!210827 (= lt!108176 (tuple2!4159 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (= (and start!20982 res!102888) b!210819))

(assert (= (and b!210819 res!102885) b!210826))

(assert (= (and b!210826 res!102891) b!210825))

(assert (= (and b!210825 res!102884) b!210823))

(assert (= (and b!210823 res!102890) b!210817))

(assert (= (and b!210817 res!102889) b!210822))

(assert (= (and b!210822 res!102892) b!210821))

(assert (= (and b!210821 (not res!102886)) b!210827))

(assert (= (and b!210827 (not res!102887)) b!210820))

(assert (= (and b!210816 condMapEmpty!9203) mapIsEmpty!9203))

(assert (= (and b!210816 (not condMapEmpty!9203)) mapNonEmpty!9203))

(get-info :version)

(assert (= (and mapNonEmpty!9203 ((_ is ValueCellFull!2364) mapValue!9203)) b!210818))

(assert (= (and b!210816 ((_ is ValueCellFull!2364) mapDefault!9203)) b!210824))

(assert (= start!20982 b!210816))

(declare-fun m!238465 () Bool)

(assert (=> b!210817 m!238465))

(declare-fun m!238467 () Bool)

(assert (=> b!210821 m!238467))

(declare-fun m!238469 () Bool)

(assert (=> b!210821 m!238469))

(declare-fun m!238471 () Bool)

(assert (=> b!210821 m!238471))

(declare-fun m!238473 () Bool)

(assert (=> b!210821 m!238473))

(declare-fun m!238475 () Bool)

(assert (=> b!210821 m!238475))

(declare-fun m!238477 () Bool)

(assert (=> b!210821 m!238477))

(declare-fun m!238479 () Bool)

(assert (=> b!210821 m!238479))

(declare-fun m!238481 () Bool)

(assert (=> b!210827 m!238481))

(declare-fun m!238483 () Bool)

(assert (=> b!210827 m!238483))

(declare-fun m!238485 () Bool)

(assert (=> b!210827 m!238485))

(declare-fun m!238487 () Bool)

(assert (=> b!210827 m!238487))

(declare-fun m!238489 () Bool)

(assert (=> b!210827 m!238489))

(declare-fun m!238491 () Bool)

(assert (=> b!210827 m!238491))

(assert (=> b!210827 m!238487))

(declare-fun m!238493 () Bool)

(assert (=> b!210827 m!238493))

(declare-fun m!238495 () Bool)

(assert (=> b!210827 m!238495))

(declare-fun m!238497 () Bool)

(assert (=> start!20982 m!238497))

(declare-fun m!238499 () Bool)

(assert (=> start!20982 m!238499))

(declare-fun m!238501 () Bool)

(assert (=> start!20982 m!238501))

(declare-fun m!238503 () Bool)

(assert (=> mapNonEmpty!9203 m!238503))

(declare-fun m!238505 () Bool)

(assert (=> b!210822 m!238505))

(declare-fun m!238507 () Bool)

(assert (=> b!210820 m!238507))

(declare-fun m!238509 () Bool)

(assert (=> b!210820 m!238509))

(declare-fun m!238511 () Bool)

(assert (=> b!210820 m!238511))

(declare-fun m!238513 () Bool)

(assert (=> b!210826 m!238513))

(declare-fun m!238515 () Bool)

(assert (=> b!210825 m!238515))

(check-sat (not b!210820) b_and!12347 (not start!20982) tp_is_empty!5415 (not b!210825) (not mapNonEmpty!9203) (not b_next!5553) (not b!210821) (not b!210817) (not b!210826) (not b!210827))
(check-sat b_and!12347 (not b_next!5553))
