; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20752 () Bool)

(assert start!20752)

(declare-fun b_free!5407 () Bool)

(declare-fun b_next!5407 () Bool)

(assert (=> start!20752 (= b_free!5407 (not b_next!5407))))

(declare-fun tp!19253 () Bool)

(declare-fun b_and!12127 () Bool)

(assert (=> start!20752 (= tp!19253 b_and!12127)))

(declare-fun b!207569 () Bool)

(declare-fun e!135468 () Bool)

(declare-fun tp_is_empty!5263 () Bool)

(assert (=> b!207569 (= e!135468 tp_is_empty!5263)))

(declare-fun b!207570 () Bool)

(declare-fun res!100806 () Bool)

(declare-fun e!135465 () Bool)

(assert (=> b!207570 (=> (not res!100806) (not e!135465))))

(declare-datatypes ((array!9719 0))(
  ( (array!9720 (arr!4609 (Array (_ BitVec 32) (_ BitVec 64))) (size!4935 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9719)

(declare-datatypes ((List!2943 0))(
  ( (Nil!2940) (Cons!2939 (h!3581 (_ BitVec 64)) (t!7865 List!2943)) )
))
(declare-fun arrayNoDuplicates!0 (array!9719 (_ BitVec 32) List!2943) Bool)

(assert (=> b!207570 (= res!100806 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2940))))

(declare-fun b!207571 () Bool)

(declare-fun res!100810 () Bool)

(assert (=> b!207571 (=> (not res!100810) (not e!135465))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6665 0))(
  ( (V!6666 (val!2676 Int)) )
))
(declare-datatypes ((ValueCell!2288 0))(
  ( (ValueCellFull!2288 (v!4640 V!6665)) (EmptyCell!2288) )
))
(declare-datatypes ((array!9721 0))(
  ( (array!9722 (arr!4610 (Array (_ BitVec 32) ValueCell!2288)) (size!4936 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9721)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!207571 (= res!100810 (and (= (size!4936 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4935 _keys!825) (size!4936 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!207573 () Bool)

(declare-fun res!100811 () Bool)

(assert (=> b!207573 (=> (not res!100811) (not e!135465))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!207573 (= res!100811 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4935 _keys!825))))))

(declare-fun b!207574 () Bool)

(declare-fun e!135467 () Bool)

(assert (=> b!207574 (= e!135467 tp_is_empty!5263)))

(declare-fun mapNonEmpty!8963 () Bool)

(declare-fun mapRes!8963 () Bool)

(declare-fun tp!19252 () Bool)

(assert (=> mapNonEmpty!8963 (= mapRes!8963 (and tp!19252 e!135468))))

(declare-fun mapValue!8963 () ValueCell!2288)

(declare-fun mapRest!8963 () (Array (_ BitVec 32) ValueCell!2288))

(declare-fun mapKey!8963 () (_ BitVec 32))

(assert (=> mapNonEmpty!8963 (= (arr!4610 _values!649) (store mapRest!8963 mapKey!8963 mapValue!8963))))

(declare-fun b!207575 () Bool)

(declare-fun res!100809 () Bool)

(assert (=> b!207575 (=> (not res!100809) (not e!135465))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9719 (_ BitVec 32)) Bool)

(assert (=> b!207575 (= res!100809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207576 () Bool)

(assert (=> b!207576 (= e!135465 (not true))))

(declare-datatypes ((tuple2!4040 0))(
  ( (tuple2!4041 (_1!2031 (_ BitVec 64)) (_2!2031 V!6665)) )
))
(declare-datatypes ((List!2944 0))(
  ( (Nil!2941) (Cons!2940 (h!3582 tuple2!4040) (t!7866 List!2944)) )
))
(declare-datatypes ((ListLongMap!2943 0))(
  ( (ListLongMap!2944 (toList!1487 List!2944)) )
))
(declare-fun lt!106296 () ListLongMap!2943)

(declare-fun zeroValue!615 () V!6665)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6665)

(declare-fun getCurrentListMap!1028 (array!9719 array!9721 (_ BitVec 32) (_ BitVec 32) V!6665 V!6665 (_ BitVec 32) Int) ListLongMap!2943)

(assert (=> b!207576 (= lt!106296 (getCurrentListMap!1028 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106295 () array!9721)

(declare-fun lt!106293 () ListLongMap!2943)

(assert (=> b!207576 (= lt!106293 (getCurrentListMap!1028 _keys!825 lt!106295 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106298 () ListLongMap!2943)

(declare-fun lt!106294 () ListLongMap!2943)

(assert (=> b!207576 (and (= lt!106298 lt!106294) (= lt!106294 lt!106298))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6665)

(declare-fun lt!106297 () ListLongMap!2943)

(declare-fun +!536 (ListLongMap!2943 tuple2!4040) ListLongMap!2943)

(assert (=> b!207576 (= lt!106294 (+!536 lt!106297 (tuple2!4041 k0!843 v!520)))))

(declare-datatypes ((Unit!6312 0))(
  ( (Unit!6313) )
))
(declare-fun lt!106292 () Unit!6312)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!187 (array!9719 array!9721 (_ BitVec 32) (_ BitVec 32) V!6665 V!6665 (_ BitVec 32) (_ BitVec 64) V!6665 (_ BitVec 32) Int) Unit!6312)

(assert (=> b!207576 (= lt!106292 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!187 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!438 (array!9719 array!9721 (_ BitVec 32) (_ BitVec 32) V!6665 V!6665 (_ BitVec 32) Int) ListLongMap!2943)

(assert (=> b!207576 (= lt!106298 (getCurrentListMapNoExtraKeys!438 _keys!825 lt!106295 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207576 (= lt!106295 (array!9722 (store (arr!4610 _values!649) i!601 (ValueCellFull!2288 v!520)) (size!4936 _values!649)))))

(assert (=> b!207576 (= lt!106297 (getCurrentListMapNoExtraKeys!438 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207577 () Bool)

(declare-fun res!100805 () Bool)

(assert (=> b!207577 (=> (not res!100805) (not e!135465))))

(assert (=> b!207577 (= res!100805 (= (select (arr!4609 _keys!825) i!601) k0!843))))

(declare-fun res!100807 () Bool)

(assert (=> start!20752 (=> (not res!100807) (not e!135465))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20752 (= res!100807 (validMask!0 mask!1149))))

(assert (=> start!20752 e!135465))

(declare-fun e!135464 () Bool)

(declare-fun array_inv!3031 (array!9721) Bool)

(assert (=> start!20752 (and (array_inv!3031 _values!649) e!135464)))

(assert (=> start!20752 true))

(assert (=> start!20752 tp_is_empty!5263))

(declare-fun array_inv!3032 (array!9719) Bool)

(assert (=> start!20752 (array_inv!3032 _keys!825)))

(assert (=> start!20752 tp!19253))

(declare-fun b!207572 () Bool)

(assert (=> b!207572 (= e!135464 (and e!135467 mapRes!8963))))

(declare-fun condMapEmpty!8963 () Bool)

(declare-fun mapDefault!8963 () ValueCell!2288)

(assert (=> b!207572 (= condMapEmpty!8963 (= (arr!4610 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2288)) mapDefault!8963)))))

(declare-fun mapIsEmpty!8963 () Bool)

(assert (=> mapIsEmpty!8963 mapRes!8963))

(declare-fun b!207578 () Bool)

(declare-fun res!100808 () Bool)

(assert (=> b!207578 (=> (not res!100808) (not e!135465))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207578 (= res!100808 (validKeyInArray!0 k0!843))))

(assert (= (and start!20752 res!100807) b!207571))

(assert (= (and b!207571 res!100810) b!207575))

(assert (= (and b!207575 res!100809) b!207570))

(assert (= (and b!207570 res!100806) b!207573))

(assert (= (and b!207573 res!100811) b!207578))

(assert (= (and b!207578 res!100808) b!207577))

(assert (= (and b!207577 res!100805) b!207576))

(assert (= (and b!207572 condMapEmpty!8963) mapIsEmpty!8963))

(assert (= (and b!207572 (not condMapEmpty!8963)) mapNonEmpty!8963))

(get-info :version)

(assert (= (and mapNonEmpty!8963 ((_ is ValueCellFull!2288) mapValue!8963)) b!207569))

(assert (= (and b!207572 ((_ is ValueCellFull!2288) mapDefault!8963)) b!207574))

(assert (= start!20752 b!207572))

(declare-fun m!234843 () Bool)

(assert (=> b!207570 m!234843))

(declare-fun m!234845 () Bool)

(assert (=> b!207578 m!234845))

(declare-fun m!234847 () Bool)

(assert (=> start!20752 m!234847))

(declare-fun m!234849 () Bool)

(assert (=> start!20752 m!234849))

(declare-fun m!234851 () Bool)

(assert (=> start!20752 m!234851))

(declare-fun m!234853 () Bool)

(assert (=> b!207575 m!234853))

(declare-fun m!234855 () Bool)

(assert (=> mapNonEmpty!8963 m!234855))

(declare-fun m!234857 () Bool)

(assert (=> b!207576 m!234857))

(declare-fun m!234859 () Bool)

(assert (=> b!207576 m!234859))

(declare-fun m!234861 () Bool)

(assert (=> b!207576 m!234861))

(declare-fun m!234863 () Bool)

(assert (=> b!207576 m!234863))

(declare-fun m!234865 () Bool)

(assert (=> b!207576 m!234865))

(declare-fun m!234867 () Bool)

(assert (=> b!207576 m!234867))

(declare-fun m!234869 () Bool)

(assert (=> b!207576 m!234869))

(declare-fun m!234871 () Bool)

(assert (=> b!207577 m!234871))

(check-sat (not start!20752) (not b!207576) tp_is_empty!5263 (not b_next!5407) (not mapNonEmpty!8963) (not b!207575) (not b!207578) b_and!12127 (not b!207570))
(check-sat b_and!12127 (not b_next!5407))
