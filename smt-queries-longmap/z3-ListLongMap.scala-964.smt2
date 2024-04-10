; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20922 () Bool)

(assert start!20922)

(declare-fun b_free!5535 () Bool)

(declare-fun b_next!5535 () Bool)

(assert (=> start!20922 (= b_free!5535 (not b_next!5535))))

(declare-fun tp!19652 () Bool)

(declare-fun b_and!12305 () Bool)

(assert (=> start!20922 (= tp!19652 b_and!12305)))

(declare-datatypes ((V!6843 0))(
  ( (V!6844 (val!2743 Int)) )
))
(declare-datatypes ((tuple2!4146 0))(
  ( (tuple2!4147 (_1!2084 (_ BitVec 64)) (_2!2084 V!6843)) )
))
(declare-datatypes ((List!3040 0))(
  ( (Nil!3037) (Cons!3036 (h!3678 tuple2!4146) (t!7975 List!3040)) )
))
(declare-datatypes ((ListLongMap!3059 0))(
  ( (ListLongMap!3060 (toList!1545 List!3040)) )
))
(declare-fun lt!107522 () ListLongMap!3059)

(declare-fun lt!107525 () tuple2!4146)

(declare-fun lt!107523 () ListLongMap!3059)

(declare-fun lt!107520 () tuple2!4146)

(declare-fun b!210098 () Bool)

(declare-fun e!136836 () Bool)

(declare-fun +!548 (ListLongMap!3059 tuple2!4146) ListLongMap!3059)

(assert (=> b!210098 (= e!136836 (= lt!107522 (+!548 (+!548 lt!107523 lt!107525) lt!107520)))))

(declare-fun b!210099 () Bool)

(declare-fun e!136838 () Bool)

(declare-fun tp_is_empty!5397 () Bool)

(assert (=> b!210099 (= e!136838 tp_is_empty!5397)))

(declare-fun b!210100 () Bool)

(declare-fun res!102467 () Bool)

(declare-fun e!136837 () Bool)

(assert (=> b!210100 (=> (not res!102467) (not e!136837))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!210100 (= res!102467 (validKeyInArray!0 k0!843))))

(declare-fun e!136842 () Bool)

(declare-fun lt!107527 () ListLongMap!3059)

(declare-fun lt!107526 () ListLongMap!3059)

(declare-fun b!210101 () Bool)

(assert (=> b!210101 (= e!136842 (= lt!107526 (+!548 (+!548 lt!107527 lt!107525) lt!107520)))))

(assert (=> b!210101 e!136836))

(declare-fun res!102463 () Bool)

(assert (=> b!210101 (=> (not res!102463) (not e!136836))))

(declare-fun lt!107519 () ListLongMap!3059)

(assert (=> b!210101 (= res!102463 (= lt!107526 (+!548 (+!548 lt!107519 lt!107525) lt!107520)))))

(declare-fun minValue!615 () V!6843)

(assert (=> b!210101 (= lt!107520 (tuple2!4147 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun zeroValue!615 () V!6843)

(assert (=> b!210101 (= lt!107525 (tuple2!4147 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!210102 () Bool)

(declare-fun res!102468 () Bool)

(assert (=> b!210102 (=> (not res!102468) (not e!136837))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9993 0))(
  ( (array!9994 (arr!4745 (Array (_ BitVec 32) (_ BitVec 64))) (size!5070 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9993)

(assert (=> b!210102 (= res!102468 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5070 _keys!825))))))

(declare-fun mapNonEmpty!9170 () Bool)

(declare-fun mapRes!9170 () Bool)

(declare-fun tp!19651 () Bool)

(assert (=> mapNonEmpty!9170 (= mapRes!9170 (and tp!19651 e!136838))))

(declare-datatypes ((ValueCell!2355 0))(
  ( (ValueCellFull!2355 (v!4721 V!6843)) (EmptyCell!2355) )
))
(declare-fun mapValue!9170 () ValueCell!2355)

(declare-fun mapRest!9170 () (Array (_ BitVec 32) ValueCell!2355))

(declare-fun mapKey!9170 () (_ BitVec 32))

(declare-datatypes ((array!9995 0))(
  ( (array!9996 (arr!4746 (Array (_ BitVec 32) ValueCell!2355)) (size!5071 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9995)

(assert (=> mapNonEmpty!9170 (= (arr!4746 _values!649) (store mapRest!9170 mapKey!9170 mapValue!9170))))

(declare-fun mapIsEmpty!9170 () Bool)

(assert (=> mapIsEmpty!9170 mapRes!9170))

(declare-fun b!210104 () Bool)

(declare-fun res!102469 () Bool)

(assert (=> b!210104 (=> (not res!102469) (not e!136837))))

(declare-datatypes ((List!3041 0))(
  ( (Nil!3038) (Cons!3037 (h!3679 (_ BitVec 64)) (t!7976 List!3041)) )
))
(declare-fun arrayNoDuplicates!0 (array!9993 (_ BitVec 32) List!3041) Bool)

(assert (=> b!210104 (= res!102469 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3038))))

(declare-fun b!210105 () Bool)

(declare-fun e!136840 () Bool)

(assert (=> b!210105 (= e!136840 tp_is_empty!5397)))

(declare-fun b!210106 () Bool)

(declare-fun res!102466 () Bool)

(assert (=> b!210106 (=> (not res!102466) (not e!136837))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!210106 (= res!102466 (and (= (size!5071 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5070 _keys!825) (size!5071 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!210107 () Bool)

(declare-fun res!102464 () Bool)

(assert (=> b!210107 (=> (not res!102464) (not e!136837))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9993 (_ BitVec 32)) Bool)

(assert (=> b!210107 (= res!102464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!210108 () Bool)

(assert (=> b!210108 (= e!136837 (not e!136842))))

(declare-fun res!102471 () Bool)

(assert (=> b!210108 (=> res!102471 e!136842)))

(assert (=> b!210108 (= res!102471 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1082 (array!9993 array!9995 (_ BitVec 32) (_ BitVec 32) V!6843 V!6843 (_ BitVec 32) Int) ListLongMap!3059)

(assert (=> b!210108 (= lt!107522 (getCurrentListMap!1082 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107521 () array!9995)

(assert (=> b!210108 (= lt!107526 (getCurrentListMap!1082 _keys!825 lt!107521 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!210108 (and (= lt!107519 lt!107527) (= lt!107527 lt!107519))))

(declare-fun v!520 () V!6843)

(assert (=> b!210108 (= lt!107527 (+!548 lt!107523 (tuple2!4147 k0!843 v!520)))))

(declare-datatypes ((Unit!6384 0))(
  ( (Unit!6385) )
))
(declare-fun lt!107524 () Unit!6384)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!199 (array!9993 array!9995 (_ BitVec 32) (_ BitVec 32) V!6843 V!6843 (_ BitVec 32) (_ BitVec 64) V!6843 (_ BitVec 32) Int) Unit!6384)

(assert (=> b!210108 (= lt!107524 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!199 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!484 (array!9993 array!9995 (_ BitVec 32) (_ BitVec 32) V!6843 V!6843 (_ BitVec 32) Int) ListLongMap!3059)

(assert (=> b!210108 (= lt!107519 (getCurrentListMapNoExtraKeys!484 _keys!825 lt!107521 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!210108 (= lt!107521 (array!9996 (store (arr!4746 _values!649) i!601 (ValueCellFull!2355 v!520)) (size!5071 _values!649)))))

(assert (=> b!210108 (= lt!107523 (getCurrentListMapNoExtraKeys!484 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210109 () Bool)

(declare-fun e!136839 () Bool)

(assert (=> b!210109 (= e!136839 (and e!136840 mapRes!9170))))

(declare-fun condMapEmpty!9170 () Bool)

(declare-fun mapDefault!9170 () ValueCell!2355)

(assert (=> b!210109 (= condMapEmpty!9170 (= (arr!4746 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2355)) mapDefault!9170)))))

(declare-fun res!102470 () Bool)

(assert (=> start!20922 (=> (not res!102470) (not e!136837))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20922 (= res!102470 (validMask!0 mask!1149))))

(assert (=> start!20922 e!136837))

(declare-fun array_inv!3141 (array!9995) Bool)

(assert (=> start!20922 (and (array_inv!3141 _values!649) e!136839)))

(assert (=> start!20922 true))

(assert (=> start!20922 tp_is_empty!5397))

(declare-fun array_inv!3142 (array!9993) Bool)

(assert (=> start!20922 (array_inv!3142 _keys!825)))

(assert (=> start!20922 tp!19652))

(declare-fun b!210103 () Bool)

(declare-fun res!102465 () Bool)

(assert (=> b!210103 (=> (not res!102465) (not e!136837))))

(assert (=> b!210103 (= res!102465 (= (select (arr!4745 _keys!825) i!601) k0!843))))

(assert (= (and start!20922 res!102470) b!210106))

(assert (= (and b!210106 res!102466) b!210107))

(assert (= (and b!210107 res!102464) b!210104))

(assert (= (and b!210104 res!102469) b!210102))

(assert (= (and b!210102 res!102468) b!210100))

(assert (= (and b!210100 res!102467) b!210103))

(assert (= (and b!210103 res!102465) b!210108))

(assert (= (and b!210108 (not res!102471)) b!210101))

(assert (= (and b!210101 res!102463) b!210098))

(assert (= (and b!210109 condMapEmpty!9170) mapIsEmpty!9170))

(assert (= (and b!210109 (not condMapEmpty!9170)) mapNonEmpty!9170))

(get-info :version)

(assert (= (and mapNonEmpty!9170 ((_ is ValueCellFull!2355) mapValue!9170)) b!210099))

(assert (= (and b!210109 ((_ is ValueCellFull!2355) mapDefault!9170)) b!210105))

(assert (= start!20922 b!210109))

(declare-fun m!237543 () Bool)

(assert (=> mapNonEmpty!9170 m!237543))

(declare-fun m!237545 () Bool)

(assert (=> b!210103 m!237545))

(declare-fun m!237547 () Bool)

(assert (=> b!210108 m!237547))

(declare-fun m!237549 () Bool)

(assert (=> b!210108 m!237549))

(declare-fun m!237551 () Bool)

(assert (=> b!210108 m!237551))

(declare-fun m!237553 () Bool)

(assert (=> b!210108 m!237553))

(declare-fun m!237555 () Bool)

(assert (=> b!210108 m!237555))

(declare-fun m!237557 () Bool)

(assert (=> b!210108 m!237557))

(declare-fun m!237559 () Bool)

(assert (=> b!210108 m!237559))

(declare-fun m!237561 () Bool)

(assert (=> b!210100 m!237561))

(declare-fun m!237563 () Bool)

(assert (=> b!210101 m!237563))

(assert (=> b!210101 m!237563))

(declare-fun m!237565 () Bool)

(assert (=> b!210101 m!237565))

(declare-fun m!237567 () Bool)

(assert (=> b!210101 m!237567))

(assert (=> b!210101 m!237567))

(declare-fun m!237569 () Bool)

(assert (=> b!210101 m!237569))

(declare-fun m!237571 () Bool)

(assert (=> start!20922 m!237571))

(declare-fun m!237573 () Bool)

(assert (=> start!20922 m!237573))

(declare-fun m!237575 () Bool)

(assert (=> start!20922 m!237575))

(declare-fun m!237577 () Bool)

(assert (=> b!210107 m!237577))

(declare-fun m!237579 () Bool)

(assert (=> b!210104 m!237579))

(declare-fun m!237581 () Bool)

(assert (=> b!210098 m!237581))

(assert (=> b!210098 m!237581))

(declare-fun m!237583 () Bool)

(assert (=> b!210098 m!237583))

(check-sat (not start!20922) (not b!210100) (not b!210107) (not mapNonEmpty!9170) (not b_next!5535) b_and!12305 (not b!210108) (not b!210104) (not b!210101) (not b!210098) tp_is_empty!5397)
(check-sat b_and!12305 (not b_next!5535))
