; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20260 () Bool)

(assert start!20260)

(declare-fun b_free!4915 () Bool)

(declare-fun b_next!4915 () Bool)

(assert (=> start!20260 (= b_free!4915 (not b_next!4915))))

(declare-fun tp!17777 () Bool)

(declare-fun b_and!11675 () Bool)

(assert (=> start!20260 (= tp!17777 b_and!11675)))

(declare-fun mapIsEmpty!8225 () Bool)

(declare-fun mapRes!8225 () Bool)

(assert (=> mapIsEmpty!8225 mapRes!8225))

(declare-fun b!199322 () Bool)

(declare-fun res!94697 () Bool)

(declare-fun e!130865 () Bool)

(assert (=> b!199322 (=> (not res!94697) (not e!130865))))

(declare-datatypes ((array!8773 0))(
  ( (array!8774 (arr!4137 (Array (_ BitVec 32) (_ BitVec 64))) (size!4462 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8773)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8773 (_ BitVec 32)) Bool)

(assert (=> b!199322 (= res!94697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199323 () Bool)

(declare-fun res!94698 () Bool)

(assert (=> b!199323 (=> (not res!94698) (not e!130865))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6009 0))(
  ( (V!6010 (val!2430 Int)) )
))
(declare-datatypes ((ValueCell!2042 0))(
  ( (ValueCellFull!2042 (v!4401 V!6009)) (EmptyCell!2042) )
))
(declare-datatypes ((array!8775 0))(
  ( (array!8776 (arr!4138 (Array (_ BitVec 32) ValueCell!2042)) (size!4463 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8775)

(assert (=> b!199323 (= res!94698 (and (= (size!4463 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4462 _keys!825) (size!4463 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199324 () Bool)

(declare-fun e!130867 () Bool)

(declare-fun tp_is_empty!4771 () Bool)

(assert (=> b!199324 (= e!130867 tp_is_empty!4771)))

(declare-fun b!199325 () Bool)

(declare-fun e!130864 () Bool)

(assert (=> b!199325 (= e!130864 tp_is_empty!4771)))

(declare-fun mapNonEmpty!8225 () Bool)

(declare-fun tp!17776 () Bool)

(assert (=> mapNonEmpty!8225 (= mapRes!8225 (and tp!17776 e!130864))))

(declare-fun mapRest!8225 () (Array (_ BitVec 32) ValueCell!2042))

(declare-fun mapValue!8225 () ValueCell!2042)

(declare-fun mapKey!8225 () (_ BitVec 32))

(assert (=> mapNonEmpty!8225 (= (arr!4138 _values!649) (store mapRest!8225 mapKey!8225 mapValue!8225))))

(declare-fun b!199326 () Bool)

(assert (=> b!199326 (= e!130865 (not (bvsle #b00000000000000000000000000000000 (size!4462 _keys!825))))))

(declare-datatypes ((tuple2!3618 0))(
  ( (tuple2!3619 (_1!1820 (_ BitVec 64)) (_2!1820 V!6009)) )
))
(declare-datatypes ((List!2539 0))(
  ( (Nil!2536) (Cons!2535 (h!3177 tuple2!3618) (t!7462 List!2539)) )
))
(declare-datatypes ((ListLongMap!2533 0))(
  ( (ListLongMap!2534 (toList!1282 List!2539)) )
))
(declare-fun lt!98292 () ListLongMap!2533)

(declare-fun lt!98294 () ListLongMap!2533)

(assert (=> b!199326 (and (= lt!98292 lt!98294) (= lt!98294 lt!98292))))

(declare-fun v!520 () V!6009)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun lt!98293 () ListLongMap!2533)

(declare-fun +!336 (ListLongMap!2533 tuple2!3618) ListLongMap!2533)

(assert (=> b!199326 (= lt!98294 (+!336 lt!98293 (tuple2!3619 k0!843 v!520)))))

(declare-fun zeroValue!615 () V!6009)

(declare-datatypes ((Unit!5958 0))(
  ( (Unit!5959) )
))
(declare-fun lt!98291 () Unit!5958)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6009)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!15 (array!8773 array!8775 (_ BitVec 32) (_ BitVec 32) V!6009 V!6009 (_ BitVec 32) (_ BitVec 64) V!6009 (_ BitVec 32) Int) Unit!5958)

(assert (=> b!199326 (= lt!98291 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!15 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!272 (array!8773 array!8775 (_ BitVec 32) (_ BitVec 32) V!6009 V!6009 (_ BitVec 32) Int) ListLongMap!2533)

(assert (=> b!199326 (= lt!98292 (getCurrentListMapNoExtraKeys!272 _keys!825 (array!8776 (store (arr!4138 _values!649) i!601 (ValueCellFull!2042 v!520)) (size!4463 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199326 (= lt!98293 (getCurrentListMapNoExtraKeys!272 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199327 () Bool)

(declare-fun e!130868 () Bool)

(assert (=> b!199327 (= e!130868 (and e!130867 mapRes!8225))))

(declare-fun condMapEmpty!8225 () Bool)

(declare-fun mapDefault!8225 () ValueCell!2042)

(assert (=> b!199327 (= condMapEmpty!8225 (= (arr!4138 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2042)) mapDefault!8225)))))

(declare-fun b!199328 () Bool)

(declare-fun res!94693 () Bool)

(assert (=> b!199328 (=> (not res!94693) (not e!130865))))

(declare-datatypes ((List!2540 0))(
  ( (Nil!2537) (Cons!2536 (h!3178 (_ BitVec 64)) (t!7463 List!2540)) )
))
(declare-fun arrayNoDuplicates!0 (array!8773 (_ BitVec 32) List!2540) Bool)

(assert (=> b!199328 (= res!94693 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2537))))

(declare-fun res!94695 () Bool)

(assert (=> start!20260 (=> (not res!94695) (not e!130865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20260 (= res!94695 (validMask!0 mask!1149))))

(assert (=> start!20260 e!130865))

(declare-fun array_inv!2699 (array!8775) Bool)

(assert (=> start!20260 (and (array_inv!2699 _values!649) e!130868)))

(assert (=> start!20260 true))

(assert (=> start!20260 tp_is_empty!4771))

(declare-fun array_inv!2700 (array!8773) Bool)

(assert (=> start!20260 (array_inv!2700 _keys!825)))

(assert (=> start!20260 tp!17777))

(declare-fun b!199321 () Bool)

(declare-fun res!94699 () Bool)

(assert (=> b!199321 (=> (not res!94699) (not e!130865))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199321 (= res!94699 (validKeyInArray!0 k0!843))))

(declare-fun b!199329 () Bool)

(declare-fun res!94696 () Bool)

(assert (=> b!199329 (=> (not res!94696) (not e!130865))))

(assert (=> b!199329 (= res!94696 (= (select (arr!4137 _keys!825) i!601) k0!843))))

(declare-fun b!199330 () Bool)

(declare-fun res!94694 () Bool)

(assert (=> b!199330 (=> (not res!94694) (not e!130865))))

(assert (=> b!199330 (= res!94694 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4462 _keys!825))))))

(assert (= (and start!20260 res!94695) b!199323))

(assert (= (and b!199323 res!94698) b!199322))

(assert (= (and b!199322 res!94697) b!199328))

(assert (= (and b!199328 res!94693) b!199330))

(assert (= (and b!199330 res!94694) b!199321))

(assert (= (and b!199321 res!94699) b!199329))

(assert (= (and b!199329 res!94696) b!199326))

(assert (= (and b!199327 condMapEmpty!8225) mapIsEmpty!8225))

(assert (= (and b!199327 (not condMapEmpty!8225)) mapNonEmpty!8225))

(get-info :version)

(assert (= (and mapNonEmpty!8225 ((_ is ValueCellFull!2042) mapValue!8225)) b!199325))

(assert (= (and b!199327 ((_ is ValueCellFull!2042) mapDefault!8225)) b!199324))

(assert (= start!20260 b!199327))

(declare-fun m!225939 () Bool)

(assert (=> b!199322 m!225939))

(declare-fun m!225941 () Bool)

(assert (=> b!199321 m!225941))

(declare-fun m!225943 () Bool)

(assert (=> b!199329 m!225943))

(declare-fun m!225945 () Bool)

(assert (=> start!20260 m!225945))

(declare-fun m!225947 () Bool)

(assert (=> start!20260 m!225947))

(declare-fun m!225949 () Bool)

(assert (=> start!20260 m!225949))

(declare-fun m!225951 () Bool)

(assert (=> mapNonEmpty!8225 m!225951))

(declare-fun m!225953 () Bool)

(assert (=> b!199326 m!225953))

(declare-fun m!225955 () Bool)

(assert (=> b!199326 m!225955))

(declare-fun m!225957 () Bool)

(assert (=> b!199326 m!225957))

(declare-fun m!225959 () Bool)

(assert (=> b!199326 m!225959))

(declare-fun m!225961 () Bool)

(assert (=> b!199326 m!225961))

(declare-fun m!225963 () Bool)

(assert (=> b!199328 m!225963))

(check-sat (not b!199326) (not mapNonEmpty!8225) (not b!199322) (not start!20260) (not b_next!4915) tp_is_empty!4771 (not b!199328) (not b!199321) b_and!11675)
(check-sat b_and!11675 (not b_next!4915))
