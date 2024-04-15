; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20380 () Bool)

(assert start!20380)

(declare-fun b_free!5035 () Bool)

(declare-fun b_next!5035 () Bool)

(assert (=> start!20380 (= b_free!5035 (not b_next!5035))))

(declare-fun tp!18136 () Bool)

(declare-fun b_and!11755 () Bool)

(assert (=> start!20380 (= tp!18136 b_and!11755)))

(declare-fun b!201111 () Bool)

(declare-fun res!96024 () Bool)

(declare-fun e!131817 () Bool)

(assert (=> b!201111 (=> (not res!96024) (not e!131817))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201111 (= res!96024 (validKeyInArray!0 k0!843))))

(declare-fun b!201112 () Bool)

(declare-fun res!96023 () Bool)

(assert (=> b!201112 (=> (not res!96023) (not e!131817))))

(declare-datatypes ((array!8999 0))(
  ( (array!9000 (arr!4249 (Array (_ BitVec 32) (_ BitVec 64))) (size!4575 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8999)

(declare-datatypes ((List!2664 0))(
  ( (Nil!2661) (Cons!2660 (h!3302 (_ BitVec 64)) (t!7586 List!2664)) )
))
(declare-fun arrayNoDuplicates!0 (array!8999 (_ BitVec 32) List!2664) Bool)

(assert (=> b!201112 (= res!96023 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2661))))

(declare-fun b!201113 () Bool)

(declare-fun e!131819 () Bool)

(assert (=> b!201113 (= e!131819 (bvsle #b00000000000000000000000000000000 (size!4575 _keys!825)))))

(declare-datatypes ((V!6169 0))(
  ( (V!6170 (val!2490 Int)) )
))
(declare-datatypes ((tuple2!3744 0))(
  ( (tuple2!3745 (_1!1883 (_ BitVec 64)) (_2!1883 V!6169)) )
))
(declare-fun lt!99949 () tuple2!3744)

(declare-fun lt!99952 () tuple2!3744)

(declare-datatypes ((List!2665 0))(
  ( (Nil!2662) (Cons!2661 (h!3303 tuple2!3744) (t!7587 List!2665)) )
))
(declare-datatypes ((ListLongMap!2647 0))(
  ( (ListLongMap!2648 (toList!1339 List!2665)) )
))
(declare-fun lt!99953 () ListLongMap!2647)

(declare-fun lt!99956 () ListLongMap!2647)

(declare-fun +!388 (ListLongMap!2647 tuple2!3744) ListLongMap!2647)

(assert (=> b!201113 (= (+!388 lt!99953 lt!99952) (+!388 lt!99956 lt!99949))))

(declare-fun v!520 () V!6169)

(declare-fun lt!99954 () ListLongMap!2647)

(declare-datatypes ((Unit!6028 0))(
  ( (Unit!6029) )
))
(declare-fun lt!99950 () Unit!6028)

(declare-fun minValue!615 () V!6169)

(declare-fun addCommutativeForDiffKeys!97 (ListLongMap!2647 (_ BitVec 64) V!6169 (_ BitVec 64) V!6169) Unit!6028)

(assert (=> b!201113 (= lt!99950 (addCommutativeForDiffKeys!97 lt!99954 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201114 () Bool)

(declare-fun e!131814 () Bool)

(declare-fun tp_is_empty!4891 () Bool)

(assert (=> b!201114 (= e!131814 tp_is_empty!4891)))

(declare-fun b!201115 () Bool)

(declare-fun e!131820 () Bool)

(assert (=> b!201115 (= e!131817 (not e!131820))))

(declare-fun res!96028 () Bool)

(assert (=> b!201115 (=> res!96028 e!131820)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201115 (= res!96028 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!99948 () ListLongMap!2647)

(declare-datatypes ((ValueCell!2102 0))(
  ( (ValueCellFull!2102 (v!4454 V!6169)) (EmptyCell!2102) )
))
(declare-datatypes ((array!9001 0))(
  ( (array!9002 (arr!4250 (Array (_ BitVec 32) ValueCell!2102)) (size!4576 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9001)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6169)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!903 (array!8999 array!9001 (_ BitVec 32) (_ BitVec 32) V!6169 V!6169 (_ BitVec 32) Int) ListLongMap!2647)

(assert (=> b!201115 (= lt!99948 (getCurrentListMap!903 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99947 () array!9001)

(declare-fun lt!99958 () ListLongMap!2647)

(assert (=> b!201115 (= lt!99958 (getCurrentListMap!903 _keys!825 lt!99947 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99960 () ListLongMap!2647)

(declare-fun lt!99957 () ListLongMap!2647)

(assert (=> b!201115 (and (= lt!99960 lt!99957) (= lt!99957 lt!99960))))

(declare-fun lt!99962 () ListLongMap!2647)

(assert (=> b!201115 (= lt!99957 (+!388 lt!99962 lt!99949))))

(assert (=> b!201115 (= lt!99949 (tuple2!3745 k0!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lt!99959 () Unit!6028)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!62 (array!8999 array!9001 (_ BitVec 32) (_ BitVec 32) V!6169 V!6169 (_ BitVec 32) (_ BitVec 64) V!6169 (_ BitVec 32) Int) Unit!6028)

(assert (=> b!201115 (= lt!99959 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!62 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!313 (array!8999 array!9001 (_ BitVec 32) (_ BitVec 32) V!6169 V!6169 (_ BitVec 32) Int) ListLongMap!2647)

(assert (=> b!201115 (= lt!99960 (getCurrentListMapNoExtraKeys!313 _keys!825 lt!99947 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201115 (= lt!99947 (array!9002 (store (arr!4250 _values!649) i!601 (ValueCellFull!2102 v!520)) (size!4576 _values!649)))))

(assert (=> b!201115 (= lt!99962 (getCurrentListMapNoExtraKeys!313 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!201116 () Bool)

(declare-fun e!131818 () Bool)

(declare-fun mapRes!8405 () Bool)

(assert (=> b!201116 (= e!131818 (and e!131814 mapRes!8405))))

(declare-fun condMapEmpty!8405 () Bool)

(declare-fun mapDefault!8405 () ValueCell!2102)

(assert (=> b!201116 (= condMapEmpty!8405 (= (arr!4250 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2102)) mapDefault!8405)))))

(declare-fun b!201117 () Bool)

(declare-fun res!96029 () Bool)

(assert (=> b!201117 (=> (not res!96029) (not e!131817))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8999 (_ BitVec 32)) Bool)

(assert (=> b!201117 (= res!96029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!201118 () Bool)

(declare-fun res!96027 () Bool)

(assert (=> b!201118 (=> (not res!96027) (not e!131817))))

(assert (=> b!201118 (= res!96027 (and (= (size!4576 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4575 _keys!825) (size!4576 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8405 () Bool)

(assert (=> mapIsEmpty!8405 mapRes!8405))

(declare-fun res!96022 () Bool)

(assert (=> start!20380 (=> (not res!96022) (not e!131817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20380 (= res!96022 (validMask!0 mask!1149))))

(assert (=> start!20380 e!131817))

(declare-fun array_inv!2777 (array!9001) Bool)

(assert (=> start!20380 (and (array_inv!2777 _values!649) e!131818)))

(assert (=> start!20380 true))

(assert (=> start!20380 tp_is_empty!4891))

(declare-fun array_inv!2778 (array!8999) Bool)

(assert (=> start!20380 (array_inv!2778 _keys!825)))

(assert (=> start!20380 tp!18136))

(declare-fun mapNonEmpty!8405 () Bool)

(declare-fun tp!18137 () Bool)

(declare-fun e!131815 () Bool)

(assert (=> mapNonEmpty!8405 (= mapRes!8405 (and tp!18137 e!131815))))

(declare-fun mapRest!8405 () (Array (_ BitVec 32) ValueCell!2102))

(declare-fun mapValue!8405 () ValueCell!2102)

(declare-fun mapKey!8405 () (_ BitVec 32))

(assert (=> mapNonEmpty!8405 (= (arr!4250 _values!649) (store mapRest!8405 mapKey!8405 mapValue!8405))))

(declare-fun b!201119 () Bool)

(assert (=> b!201119 (= e!131815 tp_is_empty!4891)))

(declare-fun b!201120 () Bool)

(declare-fun res!96026 () Bool)

(assert (=> b!201120 (=> (not res!96026) (not e!131817))))

(assert (=> b!201120 (= res!96026 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4575 _keys!825))))))

(declare-fun b!201121 () Bool)

(assert (=> b!201121 (= e!131820 e!131819)))

(declare-fun res!96025 () Bool)

(assert (=> b!201121 (=> res!96025 e!131819)))

(assert (=> b!201121 (= res!96025 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!99955 () ListLongMap!2647)

(assert (=> b!201121 (= lt!99955 lt!99953)))

(assert (=> b!201121 (= lt!99953 (+!388 lt!99954 lt!99949))))

(declare-fun lt!99961 () Unit!6028)

(assert (=> b!201121 (= lt!99961 (addCommutativeForDiffKeys!97 lt!99962 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (=> b!201121 (= lt!99958 (+!388 lt!99955 lt!99952))))

(declare-fun lt!99951 () tuple2!3744)

(assert (=> b!201121 (= lt!99955 (+!388 lt!99957 lt!99951))))

(assert (=> b!201121 (= lt!99948 lt!99956)))

(assert (=> b!201121 (= lt!99956 (+!388 lt!99954 lt!99952))))

(assert (=> b!201121 (= lt!99954 (+!388 lt!99962 lt!99951))))

(assert (=> b!201121 (= lt!99958 (+!388 (+!388 lt!99960 lt!99951) lt!99952))))

(assert (=> b!201121 (= lt!99952 (tuple2!3745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201121 (= lt!99951 (tuple2!3745 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201122 () Bool)

(declare-fun res!96021 () Bool)

(assert (=> b!201122 (=> (not res!96021) (not e!131817))))

(assert (=> b!201122 (= res!96021 (= (select (arr!4249 _keys!825) i!601) k0!843))))

(assert (= (and start!20380 res!96022) b!201118))

(assert (= (and b!201118 res!96027) b!201117))

(assert (= (and b!201117 res!96029) b!201112))

(assert (= (and b!201112 res!96023) b!201120))

(assert (= (and b!201120 res!96026) b!201111))

(assert (= (and b!201111 res!96024) b!201122))

(assert (= (and b!201122 res!96021) b!201115))

(assert (= (and b!201115 (not res!96028)) b!201121))

(assert (= (and b!201121 (not res!96025)) b!201113))

(assert (= (and b!201116 condMapEmpty!8405) mapIsEmpty!8405))

(assert (= (and b!201116 (not condMapEmpty!8405)) mapNonEmpty!8405))

(get-info :version)

(assert (= (and mapNonEmpty!8405 ((_ is ValueCellFull!2102) mapValue!8405)) b!201119))

(assert (= (and b!201116 ((_ is ValueCellFull!2102) mapDefault!8405)) b!201114))

(assert (= start!20380 b!201116))

(declare-fun m!227487 () Bool)

(assert (=> start!20380 m!227487))

(declare-fun m!227489 () Bool)

(assert (=> start!20380 m!227489))

(declare-fun m!227491 () Bool)

(assert (=> start!20380 m!227491))

(declare-fun m!227493 () Bool)

(assert (=> mapNonEmpty!8405 m!227493))

(declare-fun m!227495 () Bool)

(assert (=> b!201117 m!227495))

(declare-fun m!227497 () Bool)

(assert (=> b!201113 m!227497))

(declare-fun m!227499 () Bool)

(assert (=> b!201113 m!227499))

(declare-fun m!227501 () Bool)

(assert (=> b!201113 m!227501))

(declare-fun m!227503 () Bool)

(assert (=> b!201121 m!227503))

(declare-fun m!227505 () Bool)

(assert (=> b!201121 m!227505))

(declare-fun m!227507 () Bool)

(assert (=> b!201121 m!227507))

(declare-fun m!227509 () Bool)

(assert (=> b!201121 m!227509))

(declare-fun m!227511 () Bool)

(assert (=> b!201121 m!227511))

(declare-fun m!227513 () Bool)

(assert (=> b!201121 m!227513))

(declare-fun m!227515 () Bool)

(assert (=> b!201121 m!227515))

(declare-fun m!227517 () Bool)

(assert (=> b!201121 m!227517))

(assert (=> b!201121 m!227507))

(declare-fun m!227519 () Bool)

(assert (=> b!201111 m!227519))

(declare-fun m!227521 () Bool)

(assert (=> b!201112 m!227521))

(declare-fun m!227523 () Bool)

(assert (=> b!201115 m!227523))

(declare-fun m!227525 () Bool)

(assert (=> b!201115 m!227525))

(declare-fun m!227527 () Bool)

(assert (=> b!201115 m!227527))

(declare-fun m!227529 () Bool)

(assert (=> b!201115 m!227529))

(declare-fun m!227531 () Bool)

(assert (=> b!201115 m!227531))

(declare-fun m!227533 () Bool)

(assert (=> b!201115 m!227533))

(declare-fun m!227535 () Bool)

(assert (=> b!201115 m!227535))

(declare-fun m!227537 () Bool)

(assert (=> b!201122 m!227537))

(check-sat tp_is_empty!4891 (not b!201111) (not b!201113) (not mapNonEmpty!8405) (not b!201112) (not b_next!5035) (not b!201121) (not start!20380) (not b!201115) (not b!201117) b_and!11755)
(check-sat b_and!11755 (not b_next!5035))
