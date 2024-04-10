; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21174 () Bool)

(assert start!21174)

(declare-fun b_free!5625 () Bool)

(declare-fun b_next!5625 () Bool)

(assert (=> start!21174 (= b_free!5625 (not b_next!5625))))

(declare-fun tp!19946 () Bool)

(declare-fun b_and!12491 () Bool)

(assert (=> start!21174 (= tp!19946 b_and!12491)))

(declare-fun b!213224 () Bool)

(declare-fun e!138692 () Bool)

(declare-fun e!138690 () Bool)

(assert (=> b!213224 (= e!138692 (not e!138690))))

(declare-fun res!104326 () Bool)

(assert (=> b!213224 (=> res!104326 e!138690)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!213224 (= res!104326 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6963 0))(
  ( (V!6964 (val!2788 Int)) )
))
(declare-datatypes ((ValueCell!2400 0))(
  ( (ValueCellFull!2400 (v!4798 V!6963)) (EmptyCell!2400) )
))
(declare-datatypes ((array!10179 0))(
  ( (array!10180 (arr!4830 (Array (_ BitVec 32) ValueCell!2400)) (size!5155 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10179)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!4222 0))(
  ( (tuple2!4223 (_1!2122 (_ BitVec 64)) (_2!2122 V!6963)) )
))
(declare-datatypes ((List!3108 0))(
  ( (Nil!3105) (Cons!3104 (h!3746 tuple2!4222) (t!8059 List!3108)) )
))
(declare-datatypes ((ListLongMap!3135 0))(
  ( (ListLongMap!3136 (toList!1583 List!3108)) )
))
(declare-fun lt!110104 () ListLongMap!3135)

(declare-fun zeroValue!615 () V!6963)

(declare-datatypes ((array!10181 0))(
  ( (array!10182 (arr!4831 (Array (_ BitVec 32) (_ BitVec 64))) (size!5156 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10181)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6963)

(declare-fun getCurrentListMap!1112 (array!10181 array!10179 (_ BitVec 32) (_ BitVec 32) V!6963 V!6963 (_ BitVec 32) Int) ListLongMap!3135)

(assert (=> b!213224 (= lt!110104 (getCurrentListMap!1112 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110110 () array!10179)

(declare-fun lt!110109 () ListLongMap!3135)

(assert (=> b!213224 (= lt!110109 (getCurrentListMap!1112 _keys!825 lt!110110 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110106 () ListLongMap!3135)

(declare-fun lt!110103 () ListLongMap!3135)

(assert (=> b!213224 (and (= lt!110106 lt!110103) (= lt!110103 lt!110106))))

(declare-fun lt!110108 () ListLongMap!3135)

(declare-fun lt!110113 () tuple2!4222)

(declare-fun +!586 (ListLongMap!3135 tuple2!4222) ListLongMap!3135)

(assert (=> b!213224 (= lt!110103 (+!586 lt!110108 lt!110113))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6963)

(assert (=> b!213224 (= lt!110113 (tuple2!4223 k0!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6464 0))(
  ( (Unit!6465) )
))
(declare-fun lt!110107 () Unit!6464)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!229 (array!10181 array!10179 (_ BitVec 32) (_ BitVec 32) V!6963 V!6963 (_ BitVec 32) (_ BitVec 64) V!6963 (_ BitVec 32) Int) Unit!6464)

(assert (=> b!213224 (= lt!110107 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!229 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!514 (array!10181 array!10179 (_ BitVec 32) (_ BitVec 32) V!6963 V!6963 (_ BitVec 32) Int) ListLongMap!3135)

(assert (=> b!213224 (= lt!110106 (getCurrentListMapNoExtraKeys!514 _keys!825 lt!110110 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!213224 (= lt!110110 (array!10180 (store (arr!4830 _values!649) i!601 (ValueCellFull!2400 v!520)) (size!5155 _values!649)))))

(assert (=> b!213224 (= lt!110108 (getCurrentListMapNoExtraKeys!514 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!9329 () Bool)

(declare-fun mapRes!9329 () Bool)

(assert (=> mapIsEmpty!9329 mapRes!9329))

(declare-fun b!213225 () Bool)

(declare-fun res!104320 () Bool)

(assert (=> b!213225 (=> (not res!104320) (not e!138692))))

(assert (=> b!213225 (= res!104320 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5156 _keys!825))))))

(declare-fun b!213226 () Bool)

(declare-fun res!104327 () Bool)

(assert (=> b!213226 (=> (not res!104327) (not e!138692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10181 (_ BitVec 32)) Bool)

(assert (=> b!213226 (= res!104327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!213227 () Bool)

(declare-fun res!104328 () Bool)

(assert (=> b!213227 (=> (not res!104328) (not e!138692))))

(assert (=> b!213227 (= res!104328 (= (select (arr!4831 _keys!825) i!601) k0!843))))

(declare-fun b!213228 () Bool)

(declare-fun res!104323 () Bool)

(assert (=> b!213228 (=> (not res!104323) (not e!138692))))

(assert (=> b!213228 (= res!104323 (and (= (size!5155 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5156 _keys!825) (size!5155 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!213229 () Bool)

(declare-fun e!138695 () Bool)

(assert (=> b!213229 (= e!138690 e!138695)))

(declare-fun res!104324 () Bool)

(assert (=> b!213229 (=> res!104324 e!138695)))

(assert (=> b!213229 (= res!104324 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!110102 () ListLongMap!3135)

(assert (=> b!213229 (= lt!110104 lt!110102)))

(declare-fun lt!110111 () tuple2!4222)

(assert (=> b!213229 (= lt!110102 (+!586 lt!110108 lt!110111))))

(declare-fun lt!110112 () ListLongMap!3135)

(assert (=> b!213229 (= lt!110109 lt!110112)))

(assert (=> b!213229 (= lt!110112 (+!586 lt!110103 lt!110111))))

(assert (=> b!213229 (= lt!110109 (+!586 lt!110106 lt!110111))))

(assert (=> b!213229 (= lt!110111 (tuple2!4223 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!213230 () Bool)

(declare-fun res!104321 () Bool)

(assert (=> b!213230 (=> (not res!104321) (not e!138692))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!213230 (= res!104321 (validKeyInArray!0 k0!843))))

(declare-fun b!213231 () Bool)

(declare-fun e!138691 () Bool)

(declare-fun tp_is_empty!5487 () Bool)

(assert (=> b!213231 (= e!138691 tp_is_empty!5487)))

(declare-fun b!213233 () Bool)

(declare-fun res!104322 () Bool)

(assert (=> b!213233 (=> (not res!104322) (not e!138692))))

(declare-datatypes ((List!3109 0))(
  ( (Nil!3106) (Cons!3105 (h!3747 (_ BitVec 64)) (t!8060 List!3109)) )
))
(declare-fun arrayNoDuplicates!0 (array!10181 (_ BitVec 32) List!3109) Bool)

(assert (=> b!213233 (= res!104322 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3106))))

(declare-fun b!213234 () Bool)

(declare-fun e!138694 () Bool)

(declare-fun e!138696 () Bool)

(assert (=> b!213234 (= e!138694 (and e!138696 mapRes!9329))))

(declare-fun condMapEmpty!9329 () Bool)

(declare-fun mapDefault!9329 () ValueCell!2400)

(assert (=> b!213234 (= condMapEmpty!9329 (= (arr!4830 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2400)) mapDefault!9329)))))

(declare-fun b!213235 () Bool)

(assert (=> b!213235 (= e!138695 (bvslt i!601 (size!5155 _values!649)))))

(assert (=> b!213235 (= lt!110112 (+!586 lt!110102 lt!110113))))

(declare-fun lt!110105 () Unit!6464)

(declare-fun addCommutativeForDiffKeys!208 (ListLongMap!3135 (_ BitVec 64) V!6963 (_ BitVec 64) V!6963) Unit!6464)

(assert (=> b!213235 (= lt!110105 (addCommutativeForDiffKeys!208 lt!110108 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapNonEmpty!9329 () Bool)

(declare-fun tp!19945 () Bool)

(assert (=> mapNonEmpty!9329 (= mapRes!9329 (and tp!19945 e!138691))))

(declare-fun mapValue!9329 () ValueCell!2400)

(declare-fun mapRest!9329 () (Array (_ BitVec 32) ValueCell!2400))

(declare-fun mapKey!9329 () (_ BitVec 32))

(assert (=> mapNonEmpty!9329 (= (arr!4830 _values!649) (store mapRest!9329 mapKey!9329 mapValue!9329))))

(declare-fun res!104325 () Bool)

(assert (=> start!21174 (=> (not res!104325) (not e!138692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21174 (= res!104325 (validMask!0 mask!1149))))

(assert (=> start!21174 e!138692))

(declare-fun array_inv!3195 (array!10179) Bool)

(assert (=> start!21174 (and (array_inv!3195 _values!649) e!138694)))

(assert (=> start!21174 true))

(assert (=> start!21174 tp_is_empty!5487))

(declare-fun array_inv!3196 (array!10181) Bool)

(assert (=> start!21174 (array_inv!3196 _keys!825)))

(assert (=> start!21174 tp!19946))

(declare-fun b!213232 () Bool)

(assert (=> b!213232 (= e!138696 tp_is_empty!5487)))

(assert (= (and start!21174 res!104325) b!213228))

(assert (= (and b!213228 res!104323) b!213226))

(assert (= (and b!213226 res!104327) b!213233))

(assert (= (and b!213233 res!104322) b!213225))

(assert (= (and b!213225 res!104320) b!213230))

(assert (= (and b!213230 res!104321) b!213227))

(assert (= (and b!213227 res!104328) b!213224))

(assert (= (and b!213224 (not res!104326)) b!213229))

(assert (= (and b!213229 (not res!104324)) b!213235))

(assert (= (and b!213234 condMapEmpty!9329) mapIsEmpty!9329))

(assert (= (and b!213234 (not condMapEmpty!9329)) mapNonEmpty!9329))

(get-info :version)

(assert (= (and mapNonEmpty!9329 ((_ is ValueCellFull!2400) mapValue!9329)) b!213231))

(assert (= (and b!213234 ((_ is ValueCellFull!2400) mapDefault!9329)) b!213232))

(assert (= start!21174 b!213234))

(declare-fun m!241069 () Bool)

(assert (=> start!21174 m!241069))

(declare-fun m!241071 () Bool)

(assert (=> start!21174 m!241071))

(declare-fun m!241073 () Bool)

(assert (=> start!21174 m!241073))

(declare-fun m!241075 () Bool)

(assert (=> b!213224 m!241075))

(declare-fun m!241077 () Bool)

(assert (=> b!213224 m!241077))

(declare-fun m!241079 () Bool)

(assert (=> b!213224 m!241079))

(declare-fun m!241081 () Bool)

(assert (=> b!213224 m!241081))

(declare-fun m!241083 () Bool)

(assert (=> b!213224 m!241083))

(declare-fun m!241085 () Bool)

(assert (=> b!213224 m!241085))

(declare-fun m!241087 () Bool)

(assert (=> b!213224 m!241087))

(declare-fun m!241089 () Bool)

(assert (=> b!213227 m!241089))

(declare-fun m!241091 () Bool)

(assert (=> mapNonEmpty!9329 m!241091))

(declare-fun m!241093 () Bool)

(assert (=> b!213230 m!241093))

(declare-fun m!241095 () Bool)

(assert (=> b!213235 m!241095))

(declare-fun m!241097 () Bool)

(assert (=> b!213235 m!241097))

(declare-fun m!241099 () Bool)

(assert (=> b!213229 m!241099))

(declare-fun m!241101 () Bool)

(assert (=> b!213229 m!241101))

(declare-fun m!241103 () Bool)

(assert (=> b!213229 m!241103))

(declare-fun m!241105 () Bool)

(assert (=> b!213226 m!241105))

(declare-fun m!241107 () Bool)

(assert (=> b!213233 m!241107))

(check-sat (not b_next!5625) (not b!213226) (not b!213224) (not b!213230) (not b!213229) (not b!213233) (not mapNonEmpty!9329) tp_is_empty!5487 (not start!21174) (not b!213235) b_and!12491)
(check-sat b_and!12491 (not b_next!5625))
