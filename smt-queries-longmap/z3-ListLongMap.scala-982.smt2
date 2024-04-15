; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21214 () Bool)

(assert start!21214)

(declare-fun b_free!5641 () Bool)

(declare-fun b_next!5641 () Bool)

(assert (=> start!21214 (= b_free!5641 (not b_next!5641))))

(declare-fun tp!19996 () Bool)

(declare-fun b_and!12493 () Bool)

(assert (=> start!21214 (= tp!19996 b_and!12493)))

(declare-fun b!213527 () Bool)

(declare-fun res!104499 () Bool)

(declare-fun e!138852 () Bool)

(assert (=> b!213527 (=> (not res!104499) (not e!138852))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!10201 0))(
  ( (array!10202 (arr!4839 (Array (_ BitVec 32) (_ BitVec 64))) (size!5165 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10201)

(assert (=> b!213527 (= res!104499 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5165 _keys!825))))))

(declare-fun b!213528 () Bool)

(declare-fun res!104501 () Bool)

(assert (=> b!213528 (=> (not res!104501) (not e!138852))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10201 (_ BitVec 32)) Bool)

(assert (=> b!213528 (= res!104501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!213529 () Bool)

(declare-fun res!104495 () Bool)

(assert (=> b!213529 (=> (not res!104495) (not e!138852))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!213529 (= res!104495 (validKeyInArray!0 k0!843))))

(declare-fun lt!110307 () Bool)

(declare-datatypes ((V!6985 0))(
  ( (V!6986 (val!2796 Int)) )
))
(declare-datatypes ((ValueCell!2408 0))(
  ( (ValueCellFull!2408 (v!4804 V!6985)) (EmptyCell!2408) )
))
(declare-datatypes ((array!10203 0))(
  ( (array!10204 (arr!4840 (Array (_ BitVec 32) ValueCell!2408)) (size!5166 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10203)

(declare-datatypes ((tuple2!4200 0))(
  ( (tuple2!4201 (_1!2111 (_ BitVec 64)) (_2!2111 V!6985)) )
))
(declare-datatypes ((List!3106 0))(
  ( (Nil!3103) (Cons!3102 (h!3744 tuple2!4200) (t!8050 List!3106)) )
))
(declare-datatypes ((ListLongMap!3103 0))(
  ( (ListLongMap!3104 (toList!1567 List!3106)) )
))
(declare-fun lt!110308 () ListLongMap!3103)

(declare-fun lt!110311 () ListLongMap!3103)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun b!213530 () Bool)

(assert (=> b!213530 (= e!138852 (not (or (and (not lt!110307) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!110307) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!110307) (not (= lt!110311 lt!110308)) (bvslt i!601 (size!5166 _values!649)))))))

(assert (=> b!213530 (= lt!110307 (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6985)

(declare-fun lt!110309 () ListLongMap!3103)

(declare-fun zeroValue!615 () V!6985)

(declare-fun getCurrentListMap!1076 (array!10201 array!10203 (_ BitVec 32) (_ BitVec 32) V!6985 V!6985 (_ BitVec 32) Int) ListLongMap!3103)

(assert (=> b!213530 (= lt!110309 (getCurrentListMap!1076 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110306 () array!10203)

(assert (=> b!213530 (= lt!110311 (getCurrentListMap!1076 _keys!825 lt!110306 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110312 () ListLongMap!3103)

(assert (=> b!213530 (and (= lt!110308 lt!110312) (= lt!110312 lt!110308))))

(declare-fun lt!110310 () ListLongMap!3103)

(declare-fun v!520 () V!6985)

(declare-fun +!591 (ListLongMap!3103 tuple2!4200) ListLongMap!3103)

(assert (=> b!213530 (= lt!110312 (+!591 lt!110310 (tuple2!4201 k0!843 v!520)))))

(declare-datatypes ((Unit!6436 0))(
  ( (Unit!6437) )
))
(declare-fun lt!110305 () Unit!6436)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!237 (array!10201 array!10203 (_ BitVec 32) (_ BitVec 32) V!6985 V!6985 (_ BitVec 32) (_ BitVec 64) V!6985 (_ BitVec 32) Int) Unit!6436)

(assert (=> b!213530 (= lt!110305 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!237 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!513 (array!10201 array!10203 (_ BitVec 32) (_ BitVec 32) V!6985 V!6985 (_ BitVec 32) Int) ListLongMap!3103)

(assert (=> b!213530 (= lt!110308 (getCurrentListMapNoExtraKeys!513 _keys!825 lt!110306 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!213530 (= lt!110306 (array!10204 (store (arr!4840 _values!649) i!601 (ValueCellFull!2408 v!520)) (size!5166 _values!649)))))

(assert (=> b!213530 (= lt!110310 (getCurrentListMapNoExtraKeys!513 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!9356 () Bool)

(declare-fun mapRes!9356 () Bool)

(declare-fun tp!19997 () Bool)

(declare-fun e!138855 () Bool)

(assert (=> mapNonEmpty!9356 (= mapRes!9356 (and tp!19997 e!138855))))

(declare-fun mapValue!9356 () ValueCell!2408)

(declare-fun mapRest!9356 () (Array (_ BitVec 32) ValueCell!2408))

(declare-fun mapKey!9356 () (_ BitVec 32))

(assert (=> mapNonEmpty!9356 (= (arr!4840 _values!649) (store mapRest!9356 mapKey!9356 mapValue!9356))))

(declare-fun b!213532 () Bool)

(declare-fun res!104497 () Bool)

(assert (=> b!213532 (=> (not res!104497) (not e!138852))))

(assert (=> b!213532 (= res!104497 (and (= (size!5166 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5165 _keys!825) (size!5166 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!213533 () Bool)

(declare-fun e!138851 () Bool)

(declare-fun e!138854 () Bool)

(assert (=> b!213533 (= e!138851 (and e!138854 mapRes!9356))))

(declare-fun condMapEmpty!9356 () Bool)

(declare-fun mapDefault!9356 () ValueCell!2408)

(assert (=> b!213533 (= condMapEmpty!9356 (= (arr!4840 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2408)) mapDefault!9356)))))

(declare-fun b!213534 () Bool)

(declare-fun tp_is_empty!5503 () Bool)

(assert (=> b!213534 (= e!138855 tp_is_empty!5503)))

(declare-fun mapIsEmpty!9356 () Bool)

(assert (=> mapIsEmpty!9356 mapRes!9356))

(declare-fun b!213535 () Bool)

(assert (=> b!213535 (= e!138854 tp_is_empty!5503)))

(declare-fun b!213536 () Bool)

(declare-fun res!104496 () Bool)

(assert (=> b!213536 (=> (not res!104496) (not e!138852))))

(declare-datatypes ((List!3107 0))(
  ( (Nil!3104) (Cons!3103 (h!3745 (_ BitVec 64)) (t!8051 List!3107)) )
))
(declare-fun arrayNoDuplicates!0 (array!10201 (_ BitVec 32) List!3107) Bool)

(assert (=> b!213536 (= res!104496 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3104))))

(declare-fun b!213531 () Bool)

(declare-fun res!104498 () Bool)

(assert (=> b!213531 (=> (not res!104498) (not e!138852))))

(assert (=> b!213531 (= res!104498 (= (select (arr!4839 _keys!825) i!601) k0!843))))

(declare-fun res!104500 () Bool)

(assert (=> start!21214 (=> (not res!104500) (not e!138852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21214 (= res!104500 (validMask!0 mask!1149))))

(assert (=> start!21214 e!138852))

(declare-fun array_inv!3179 (array!10203) Bool)

(assert (=> start!21214 (and (array_inv!3179 _values!649) e!138851)))

(assert (=> start!21214 true))

(assert (=> start!21214 tp_is_empty!5503))

(declare-fun array_inv!3180 (array!10201) Bool)

(assert (=> start!21214 (array_inv!3180 _keys!825)))

(assert (=> start!21214 tp!19996))

(assert (= (and start!21214 res!104500) b!213532))

(assert (= (and b!213532 res!104497) b!213528))

(assert (= (and b!213528 res!104501) b!213536))

(assert (= (and b!213536 res!104496) b!213527))

(assert (= (and b!213527 res!104499) b!213529))

(assert (= (and b!213529 res!104495) b!213531))

(assert (= (and b!213531 res!104498) b!213530))

(assert (= (and b!213533 condMapEmpty!9356) mapIsEmpty!9356))

(assert (= (and b!213533 (not condMapEmpty!9356)) mapNonEmpty!9356))

(get-info :version)

(assert (= (and mapNonEmpty!9356 ((_ is ValueCellFull!2408) mapValue!9356)) b!213534))

(assert (= (and b!213533 ((_ is ValueCellFull!2408) mapDefault!9356)) b!213535))

(assert (= start!21214 b!213533))

(declare-fun m!240927 () Bool)

(assert (=> start!21214 m!240927))

(declare-fun m!240929 () Bool)

(assert (=> start!21214 m!240929))

(declare-fun m!240931 () Bool)

(assert (=> start!21214 m!240931))

(declare-fun m!240933 () Bool)

(assert (=> mapNonEmpty!9356 m!240933))

(declare-fun m!240935 () Bool)

(assert (=> b!213529 m!240935))

(declare-fun m!240937 () Bool)

(assert (=> b!213536 m!240937))

(declare-fun m!240939 () Bool)

(assert (=> b!213530 m!240939))

(declare-fun m!240941 () Bool)

(assert (=> b!213530 m!240941))

(declare-fun m!240943 () Bool)

(assert (=> b!213530 m!240943))

(declare-fun m!240945 () Bool)

(assert (=> b!213530 m!240945))

(declare-fun m!240947 () Bool)

(assert (=> b!213530 m!240947))

(declare-fun m!240949 () Bool)

(assert (=> b!213530 m!240949))

(declare-fun m!240951 () Bool)

(assert (=> b!213530 m!240951))

(declare-fun m!240953 () Bool)

(assert (=> b!213528 m!240953))

(declare-fun m!240955 () Bool)

(assert (=> b!213531 m!240955))

(check-sat tp_is_empty!5503 (not b!213536) (not b!213528) b_and!12493 (not b!213529) (not mapNonEmpty!9356) (not start!21214) (not b!213530) (not b_next!5641))
(check-sat b_and!12493 (not b_next!5641))
