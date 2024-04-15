; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20710 () Bool)

(assert start!20710)

(declare-fun b_free!5365 () Bool)

(declare-fun b_next!5365 () Bool)

(assert (=> start!20710 (= b_free!5365 (not b_next!5365))))

(declare-fun tp!19126 () Bool)

(declare-fun b_and!12085 () Bool)

(assert (=> start!20710 (= tp!19126 b_and!12085)))

(declare-fun b!206939 () Bool)

(declare-fun res!100370 () Bool)

(declare-fun e!135152 () Bool)

(assert (=> b!206939 (=> (not res!100370) (not e!135152))))

(declare-datatypes ((array!9637 0))(
  ( (array!9638 (arr!4568 (Array (_ BitVec 32) (_ BitVec 64))) (size!4894 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9637)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!206939 (= res!100370 (= (select (arr!4568 _keys!825) i!601) k0!843))))

(declare-fun b!206940 () Bool)

(declare-fun res!100364 () Bool)

(assert (=> b!206940 (=> (not res!100364) (not e!135152))))

(declare-datatypes ((List!2910 0))(
  ( (Nil!2907) (Cons!2906 (h!3548 (_ BitVec 64)) (t!7832 List!2910)) )
))
(declare-fun arrayNoDuplicates!0 (array!9637 (_ BitVec 32) List!2910) Bool)

(assert (=> b!206940 (= res!100364 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2907))))

(declare-fun b!206941 () Bool)

(declare-fun e!135151 () Bool)

(declare-fun e!135150 () Bool)

(declare-fun mapRes!8900 () Bool)

(assert (=> b!206941 (= e!135151 (and e!135150 mapRes!8900))))

(declare-fun condMapEmpty!8900 () Bool)

(declare-datatypes ((V!6609 0))(
  ( (V!6610 (val!2655 Int)) )
))
(declare-datatypes ((ValueCell!2267 0))(
  ( (ValueCellFull!2267 (v!4619 V!6609)) (EmptyCell!2267) )
))
(declare-datatypes ((array!9639 0))(
  ( (array!9640 (arr!4569 (Array (_ BitVec 32) ValueCell!2267)) (size!4895 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9639)

(declare-fun mapDefault!8900 () ValueCell!2267)

(assert (=> b!206941 (= condMapEmpty!8900 (= (arr!4569 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2267)) mapDefault!8900)))))

(declare-fun b!206942 () Bool)

(declare-fun res!100367 () Bool)

(assert (=> b!206942 (=> (not res!100367) (not e!135152))))

(assert (=> b!206942 (= res!100367 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4894 _keys!825))))))

(declare-fun b!206944 () Bool)

(declare-fun tp_is_empty!5221 () Bool)

(assert (=> b!206944 (= e!135150 tp_is_empty!5221)))

(declare-fun b!206945 () Bool)

(declare-fun res!100369 () Bool)

(assert (=> b!206945 (=> (not res!100369) (not e!135152))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206945 (= res!100369 (validKeyInArray!0 k0!843))))

(declare-fun b!206946 () Bool)

(declare-fun res!100366 () Bool)

(assert (=> b!206946 (=> (not res!100366) (not e!135152))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!206946 (= res!100366 (and (= (size!4895 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4894 _keys!825) (size!4895 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!100365 () Bool)

(assert (=> start!20710 (=> (not res!100365) (not e!135152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20710 (= res!100365 (validMask!0 mask!1149))))

(assert (=> start!20710 e!135152))

(declare-fun array_inv!2999 (array!9639) Bool)

(assert (=> start!20710 (and (array_inv!2999 _values!649) e!135151)))

(assert (=> start!20710 true))

(assert (=> start!20710 tp_is_empty!5221))

(declare-fun array_inv!3000 (array!9637) Bool)

(assert (=> start!20710 (array_inv!3000 _keys!825)))

(assert (=> start!20710 tp!19126))

(declare-fun b!206943 () Bool)

(declare-fun res!100368 () Bool)

(assert (=> b!206943 (=> (not res!100368) (not e!135152))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9637 (_ BitVec 32)) Bool)

(assert (=> b!206943 (= res!100368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206947 () Bool)

(assert (=> b!206947 (= e!135152 (not true))))

(declare-datatypes ((tuple2!4008 0))(
  ( (tuple2!4009 (_1!2015 (_ BitVec 64)) (_2!2015 V!6609)) )
))
(declare-datatypes ((List!2911 0))(
  ( (Nil!2908) (Cons!2907 (h!3549 tuple2!4008) (t!7833 List!2911)) )
))
(declare-datatypes ((ListLongMap!2911 0))(
  ( (ListLongMap!2912 (toList!1471 List!2911)) )
))
(declare-fun lt!105846 () ListLongMap!2911)

(declare-fun zeroValue!615 () V!6609)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6609)

(declare-fun getCurrentListMap!1012 (array!9637 array!9639 (_ BitVec 32) (_ BitVec 32) V!6609 V!6609 (_ BitVec 32) Int) ListLongMap!2911)

(assert (=> b!206947 (= lt!105846 (getCurrentListMap!1012 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105842 () array!9639)

(declare-fun lt!105844 () ListLongMap!2911)

(assert (=> b!206947 (= lt!105844 (getCurrentListMap!1012 _keys!825 lt!105842 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105843 () ListLongMap!2911)

(declare-fun lt!105848 () ListLongMap!2911)

(assert (=> b!206947 (and (= lt!105843 lt!105848) (= lt!105848 lt!105843))))

(declare-fun lt!105845 () ListLongMap!2911)

(declare-fun v!520 () V!6609)

(declare-fun +!520 (ListLongMap!2911 tuple2!4008) ListLongMap!2911)

(assert (=> b!206947 (= lt!105848 (+!520 lt!105845 (tuple2!4009 k0!843 v!520)))))

(declare-datatypes ((Unit!6280 0))(
  ( (Unit!6281) )
))
(declare-fun lt!105847 () Unit!6280)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!171 (array!9637 array!9639 (_ BitVec 32) (_ BitVec 32) V!6609 V!6609 (_ BitVec 32) (_ BitVec 64) V!6609 (_ BitVec 32) Int) Unit!6280)

(assert (=> b!206947 (= lt!105847 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!171 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!422 (array!9637 array!9639 (_ BitVec 32) (_ BitVec 32) V!6609 V!6609 (_ BitVec 32) Int) ListLongMap!2911)

(assert (=> b!206947 (= lt!105843 (getCurrentListMapNoExtraKeys!422 _keys!825 lt!105842 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206947 (= lt!105842 (array!9640 (store (arr!4569 _values!649) i!601 (ValueCellFull!2267 v!520)) (size!4895 _values!649)))))

(assert (=> b!206947 (= lt!105845 (getCurrentListMapNoExtraKeys!422 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206948 () Bool)

(declare-fun e!135153 () Bool)

(assert (=> b!206948 (= e!135153 tp_is_empty!5221)))

(declare-fun mapNonEmpty!8900 () Bool)

(declare-fun tp!19127 () Bool)

(assert (=> mapNonEmpty!8900 (= mapRes!8900 (and tp!19127 e!135153))))

(declare-fun mapValue!8900 () ValueCell!2267)

(declare-fun mapKey!8900 () (_ BitVec 32))

(declare-fun mapRest!8900 () (Array (_ BitVec 32) ValueCell!2267))

(assert (=> mapNonEmpty!8900 (= (arr!4569 _values!649) (store mapRest!8900 mapKey!8900 mapValue!8900))))

(declare-fun mapIsEmpty!8900 () Bool)

(assert (=> mapIsEmpty!8900 mapRes!8900))

(assert (= (and start!20710 res!100365) b!206946))

(assert (= (and b!206946 res!100366) b!206943))

(assert (= (and b!206943 res!100368) b!206940))

(assert (= (and b!206940 res!100364) b!206942))

(assert (= (and b!206942 res!100367) b!206945))

(assert (= (and b!206945 res!100369) b!206939))

(assert (= (and b!206939 res!100370) b!206947))

(assert (= (and b!206941 condMapEmpty!8900) mapIsEmpty!8900))

(assert (= (and b!206941 (not condMapEmpty!8900)) mapNonEmpty!8900))

(get-info :version)

(assert (= (and mapNonEmpty!8900 ((_ is ValueCellFull!2267) mapValue!8900)) b!206948))

(assert (= (and b!206941 ((_ is ValueCellFull!2267) mapDefault!8900)) b!206944))

(assert (= start!20710 b!206941))

(declare-fun m!234213 () Bool)

(assert (=> b!206939 m!234213))

(declare-fun m!234215 () Bool)

(assert (=> mapNonEmpty!8900 m!234215))

(declare-fun m!234217 () Bool)

(assert (=> b!206943 m!234217))

(declare-fun m!234219 () Bool)

(assert (=> b!206940 m!234219))

(declare-fun m!234221 () Bool)

(assert (=> b!206945 m!234221))

(declare-fun m!234223 () Bool)

(assert (=> b!206947 m!234223))

(declare-fun m!234225 () Bool)

(assert (=> b!206947 m!234225))

(declare-fun m!234227 () Bool)

(assert (=> b!206947 m!234227))

(declare-fun m!234229 () Bool)

(assert (=> b!206947 m!234229))

(declare-fun m!234231 () Bool)

(assert (=> b!206947 m!234231))

(declare-fun m!234233 () Bool)

(assert (=> b!206947 m!234233))

(declare-fun m!234235 () Bool)

(assert (=> b!206947 m!234235))

(declare-fun m!234237 () Bool)

(assert (=> start!20710 m!234237))

(declare-fun m!234239 () Bool)

(assert (=> start!20710 m!234239))

(declare-fun m!234241 () Bool)

(assert (=> start!20710 m!234241))

(check-sat (not start!20710) (not b!206947) (not b!206945) (not b!206943) (not b!206940) (not b_next!5365) b_and!12085 tp_is_empty!5221 (not mapNonEmpty!8900))
(check-sat b_and!12085 (not b_next!5365))
