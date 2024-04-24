; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20704 () Bool)

(assert start!20704)

(declare-fun b_free!5359 () Bool)

(declare-fun b_next!5359 () Bool)

(assert (=> start!20704 (= b_free!5359 (not b_next!5359))))

(declare-fun tp!19108 () Bool)

(declare-fun b_and!12119 () Bool)

(assert (=> start!20704 (= tp!19108 b_and!12119)))

(declare-fun b!207043 () Bool)

(declare-fun res!100418 () Bool)

(declare-fun e!135229 () Bool)

(assert (=> b!207043 (=> (not res!100418) (not e!135229))))

(declare-datatypes ((array!9633 0))(
  ( (array!9634 (arr!4567 (Array (_ BitVec 32) (_ BitVec 64))) (size!4892 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9633)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9633 (_ BitVec 32)) Bool)

(assert (=> b!207043 (= res!100418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207044 () Bool)

(declare-fun res!100419 () Bool)

(assert (=> b!207044 (=> (not res!100419) (not e!135229))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6601 0))(
  ( (V!6602 (val!2652 Int)) )
))
(declare-datatypes ((ValueCell!2264 0))(
  ( (ValueCellFull!2264 (v!4623 V!6601)) (EmptyCell!2264) )
))
(declare-datatypes ((array!9635 0))(
  ( (array!9636 (arr!4568 (Array (_ BitVec 32) ValueCell!2264)) (size!4893 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9635)

(assert (=> b!207044 (= res!100419 (and (= (size!4893 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4892 _keys!825) (size!4893 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!100423 () Bool)

(assert (=> start!20704 (=> (not res!100423) (not e!135229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20704 (= res!100423 (validMask!0 mask!1149))))

(assert (=> start!20704 e!135229))

(declare-fun e!135232 () Bool)

(declare-fun array_inv!2991 (array!9635) Bool)

(assert (=> start!20704 (and (array_inv!2991 _values!649) e!135232)))

(assert (=> start!20704 true))

(declare-fun tp_is_empty!5215 () Bool)

(assert (=> start!20704 tp_is_empty!5215))

(declare-fun array_inv!2992 (array!9633) Bool)

(assert (=> start!20704 (array_inv!2992 _keys!825)))

(assert (=> start!20704 tp!19108))

(declare-fun b!207045 () Bool)

(declare-fun res!100420 () Bool)

(assert (=> b!207045 (=> (not res!100420) (not e!135229))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!207045 (= res!100420 (= (select (arr!4567 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8891 () Bool)

(declare-fun mapRes!8891 () Bool)

(assert (=> mapIsEmpty!8891 mapRes!8891))

(declare-fun mapNonEmpty!8891 () Bool)

(declare-fun tp!19109 () Bool)

(declare-fun e!135230 () Bool)

(assert (=> mapNonEmpty!8891 (= mapRes!8891 (and tp!19109 e!135230))))

(declare-fun mapValue!8891 () ValueCell!2264)

(declare-fun mapKey!8891 () (_ BitVec 32))

(declare-fun mapRest!8891 () (Array (_ BitVec 32) ValueCell!2264))

(assert (=> mapNonEmpty!8891 (= (arr!4568 _values!649) (store mapRest!8891 mapKey!8891 mapValue!8891))))

(declare-fun b!207046 () Bool)

(declare-fun res!100422 () Bool)

(assert (=> b!207046 (=> (not res!100422) (not e!135229))))

(declare-datatypes ((List!2861 0))(
  ( (Nil!2858) (Cons!2857 (h!3499 (_ BitVec 64)) (t!7784 List!2861)) )
))
(declare-fun arrayNoDuplicates!0 (array!9633 (_ BitVec 32) List!2861) Bool)

(assert (=> b!207046 (= res!100422 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2858))))

(declare-fun b!207047 () Bool)

(declare-fun e!135231 () Bool)

(assert (=> b!207047 (= e!135232 (and e!135231 mapRes!8891))))

(declare-fun condMapEmpty!8891 () Bool)

(declare-fun mapDefault!8891 () ValueCell!2264)

(assert (=> b!207047 (= condMapEmpty!8891 (= (arr!4568 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2264)) mapDefault!8891)))))

(declare-fun b!207048 () Bool)

(declare-fun res!100421 () Bool)

(assert (=> b!207048 (=> (not res!100421) (not e!135229))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207048 (= res!100421 (validKeyInArray!0 k0!843))))

(declare-fun b!207049 () Bool)

(assert (=> b!207049 (= e!135230 tp_is_empty!5215)))

(declare-fun b!207050 () Bool)

(declare-fun res!100417 () Bool)

(assert (=> b!207050 (=> (not res!100417) (not e!135229))))

(assert (=> b!207050 (= res!100417 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4892 _keys!825))))))

(declare-fun b!207051 () Bool)

(assert (=> b!207051 (= e!135229 (not true))))

(declare-datatypes ((tuple2!3974 0))(
  ( (tuple2!3975 (_1!1998 (_ BitVec 64)) (_2!1998 V!6601)) )
))
(declare-datatypes ((List!2862 0))(
  ( (Nil!2859) (Cons!2858 (h!3500 tuple2!3974) (t!7785 List!2862)) )
))
(declare-datatypes ((ListLongMap!2889 0))(
  ( (ListLongMap!2890 (toList!1460 List!2862)) )
))
(declare-fun lt!106025 () ListLongMap!2889)

(declare-fun zeroValue!615 () V!6601)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6601)

(declare-fun getCurrentListMap!1030 (array!9633 array!9635 (_ BitVec 32) (_ BitVec 32) V!6601 V!6601 (_ BitVec 32) Int) ListLongMap!2889)

(assert (=> b!207051 (= lt!106025 (getCurrentListMap!1030 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106019 () array!9635)

(declare-fun lt!106020 () ListLongMap!2889)

(assert (=> b!207051 (= lt!106020 (getCurrentListMap!1030 _keys!825 lt!106019 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106023 () ListLongMap!2889)

(declare-fun lt!106022 () ListLongMap!2889)

(assert (=> b!207051 (and (= lt!106023 lt!106022) (= lt!106022 lt!106023))))

(declare-fun v!520 () V!6601)

(declare-fun lt!106024 () ListLongMap!2889)

(declare-fun +!514 (ListLongMap!2889 tuple2!3974) ListLongMap!2889)

(assert (=> b!207051 (= lt!106022 (+!514 lt!106024 (tuple2!3975 k0!843 v!520)))))

(declare-datatypes ((Unit!6304 0))(
  ( (Unit!6305) )
))
(declare-fun lt!106021 () Unit!6304)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!166 (array!9633 array!9635 (_ BitVec 32) (_ BitVec 32) V!6601 V!6601 (_ BitVec 32) (_ BitVec 64) V!6601 (_ BitVec 32) Int) Unit!6304)

(assert (=> b!207051 (= lt!106021 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!166 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!423 (array!9633 array!9635 (_ BitVec 32) (_ BitVec 32) V!6601 V!6601 (_ BitVec 32) Int) ListLongMap!2889)

(assert (=> b!207051 (= lt!106023 (getCurrentListMapNoExtraKeys!423 _keys!825 lt!106019 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207051 (= lt!106019 (array!9636 (store (arr!4568 _values!649) i!601 (ValueCellFull!2264 v!520)) (size!4893 _values!649)))))

(assert (=> b!207051 (= lt!106024 (getCurrentListMapNoExtraKeys!423 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207052 () Bool)

(assert (=> b!207052 (= e!135231 tp_is_empty!5215)))

(assert (= (and start!20704 res!100423) b!207044))

(assert (= (and b!207044 res!100419) b!207043))

(assert (= (and b!207043 res!100418) b!207046))

(assert (= (and b!207046 res!100422) b!207050))

(assert (= (and b!207050 res!100417) b!207048))

(assert (= (and b!207048 res!100421) b!207045))

(assert (= (and b!207045 res!100420) b!207051))

(assert (= (and b!207047 condMapEmpty!8891) mapIsEmpty!8891))

(assert (= (and b!207047 (not condMapEmpty!8891)) mapNonEmpty!8891))

(get-info :version)

(assert (= (and mapNonEmpty!8891 ((_ is ValueCellFull!2264) mapValue!8891)) b!207049))

(assert (= (and b!207047 ((_ is ValueCellFull!2264) mapDefault!8891)) b!207052))

(assert (= start!20704 b!207047))

(declare-fun m!234921 () Bool)

(assert (=> mapNonEmpty!8891 m!234921))

(declare-fun m!234923 () Bool)

(assert (=> start!20704 m!234923))

(declare-fun m!234925 () Bool)

(assert (=> start!20704 m!234925))

(declare-fun m!234927 () Bool)

(assert (=> start!20704 m!234927))

(declare-fun m!234929 () Bool)

(assert (=> b!207043 m!234929))

(declare-fun m!234931 () Bool)

(assert (=> b!207051 m!234931))

(declare-fun m!234933 () Bool)

(assert (=> b!207051 m!234933))

(declare-fun m!234935 () Bool)

(assert (=> b!207051 m!234935))

(declare-fun m!234937 () Bool)

(assert (=> b!207051 m!234937))

(declare-fun m!234939 () Bool)

(assert (=> b!207051 m!234939))

(declare-fun m!234941 () Bool)

(assert (=> b!207051 m!234941))

(declare-fun m!234943 () Bool)

(assert (=> b!207051 m!234943))

(declare-fun m!234945 () Bool)

(assert (=> b!207048 m!234945))

(declare-fun m!234947 () Bool)

(assert (=> b!207045 m!234947))

(declare-fun m!234949 () Bool)

(assert (=> b!207046 m!234949))

(check-sat (not b!207048) tp_is_empty!5215 b_and!12119 (not b!207043) (not start!20704) (not b_next!5359) (not b!207051) (not mapNonEmpty!8891) (not b!207046))
(check-sat b_and!12119 (not b_next!5359))
