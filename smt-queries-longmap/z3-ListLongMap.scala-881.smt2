; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20386 () Bool)

(assert start!20386)

(declare-fun b_free!5041 () Bool)

(declare-fun b_next!5041 () Bool)

(assert (=> start!20386 (= b_free!5041 (not b_next!5041))))

(declare-fun tp!18155 () Bool)

(declare-fun b_and!11761 () Bool)

(assert (=> start!20386 (= tp!18155 b_and!11761)))

(declare-fun b!201219 () Bool)

(declare-fun e!131881 () Bool)

(declare-fun e!131883 () Bool)

(declare-fun mapRes!8414 () Bool)

(assert (=> b!201219 (= e!131881 (and e!131883 mapRes!8414))))

(declare-fun condMapEmpty!8414 () Bool)

(declare-datatypes ((V!6177 0))(
  ( (V!6178 (val!2493 Int)) )
))
(declare-datatypes ((ValueCell!2105 0))(
  ( (ValueCellFull!2105 (v!4457 V!6177)) (EmptyCell!2105) )
))
(declare-datatypes ((array!9011 0))(
  ( (array!9012 (arr!4255 (Array (_ BitVec 32) ValueCell!2105)) (size!4581 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9011)

(declare-fun mapDefault!8414 () ValueCell!2105)

(assert (=> b!201219 (= condMapEmpty!8414 (= (arr!4255 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2105)) mapDefault!8414)))))

(declare-fun b!201220 () Bool)

(declare-fun e!131882 () Bool)

(declare-fun tp_is_empty!4897 () Bool)

(assert (=> b!201220 (= e!131882 tp_is_empty!4897)))

(declare-fun b!201221 () Bool)

(declare-fun e!131878 () Bool)

(assert (=> b!201221 (= e!131878 true)))

(declare-datatypes ((tuple2!3750 0))(
  ( (tuple2!3751 (_1!1886 (_ BitVec 64)) (_2!1886 V!6177)) )
))
(declare-datatypes ((List!2669 0))(
  ( (Nil!2666) (Cons!2665 (h!3307 tuple2!3750) (t!7591 List!2669)) )
))
(declare-datatypes ((ListLongMap!2653 0))(
  ( (ListLongMap!2654 (toList!1342 List!2669)) )
))
(declare-fun lt!100098 () ListLongMap!2653)

(declare-fun lt!100106 () tuple2!3750)

(declare-fun lt!100105 () tuple2!3750)

(declare-fun lt!100096 () ListLongMap!2653)

(declare-fun +!391 (ListLongMap!2653 tuple2!3750) ListLongMap!2653)

(assert (=> b!201221 (= (+!391 lt!100096 lt!100105) (+!391 lt!100098 lt!100106))))

(declare-fun lt!100103 () ListLongMap!2653)

(declare-fun minValue!615 () V!6177)

(declare-datatypes ((Unit!6034 0))(
  ( (Unit!6035) )
))
(declare-fun lt!100092 () Unit!6034)

(declare-fun v!520 () V!6177)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun addCommutativeForDiffKeys!100 (ListLongMap!2653 (_ BitVec 64) V!6177 (_ BitVec 64) V!6177) Unit!6034)

(assert (=> b!201221 (= lt!100092 (addCommutativeForDiffKeys!100 lt!100103 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201222 () Bool)

(declare-fun res!96103 () Bool)

(declare-fun e!131879 () Bool)

(assert (=> b!201222 (=> (not res!96103) (not e!131879))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9013 0))(
  ( (array!9014 (arr!4256 (Array (_ BitVec 32) (_ BitVec 64))) (size!4582 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9013)

(assert (=> b!201222 (= res!96103 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4582 _keys!825))))))

(declare-fun mapIsEmpty!8414 () Bool)

(assert (=> mapIsEmpty!8414 mapRes!8414))

(declare-fun b!201224 () Bool)

(declare-fun res!96109 () Bool)

(assert (=> b!201224 (=> (not res!96109) (not e!131879))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!201224 (= res!96109 (and (= (size!4581 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4582 _keys!825) (size!4581 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!201225 () Bool)

(declare-fun res!96108 () Bool)

(assert (=> b!201225 (=> (not res!96108) (not e!131879))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9013 (_ BitVec 32)) Bool)

(assert (=> b!201225 (= res!96108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!201226 () Bool)

(declare-fun res!96106 () Bool)

(assert (=> b!201226 (=> (not res!96106) (not e!131879))))

(declare-datatypes ((List!2670 0))(
  ( (Nil!2667) (Cons!2666 (h!3308 (_ BitVec 64)) (t!7592 List!2670)) )
))
(declare-fun arrayNoDuplicates!0 (array!9013 (_ BitVec 32) List!2670) Bool)

(assert (=> b!201226 (= res!96106 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2667))))

(declare-fun b!201227 () Bool)

(declare-fun e!131877 () Bool)

(assert (=> b!201227 (= e!131879 (not e!131877))))

(declare-fun res!96110 () Bool)

(assert (=> b!201227 (=> res!96110 e!131877)))

(assert (=> b!201227 (= res!96110 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6177)

(declare-fun defaultEntry!657 () Int)

(declare-fun lt!100095 () ListLongMap!2653)

(declare-fun getCurrentListMap!904 (array!9013 array!9011 (_ BitVec 32) (_ BitVec 32) V!6177 V!6177 (_ BitVec 32) Int) ListLongMap!2653)

(assert (=> b!201227 (= lt!100095 (getCurrentListMap!904 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100094 () ListLongMap!2653)

(declare-fun lt!100102 () array!9011)

(assert (=> b!201227 (= lt!100094 (getCurrentListMap!904 _keys!825 lt!100102 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100093 () ListLongMap!2653)

(declare-fun lt!100104 () ListLongMap!2653)

(assert (=> b!201227 (and (= lt!100093 lt!100104) (= lt!100104 lt!100093))))

(declare-fun lt!100091 () ListLongMap!2653)

(assert (=> b!201227 (= lt!100104 (+!391 lt!100091 lt!100106))))

(assert (=> b!201227 (= lt!100106 (tuple2!3751 k0!843 v!520))))

(declare-fun lt!100099 () Unit!6034)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!63 (array!9013 array!9011 (_ BitVec 32) (_ BitVec 32) V!6177 V!6177 (_ BitVec 32) (_ BitVec 64) V!6177 (_ BitVec 32) Int) Unit!6034)

(assert (=> b!201227 (= lt!100099 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!63 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!314 (array!9013 array!9011 (_ BitVec 32) (_ BitVec 32) V!6177 V!6177 (_ BitVec 32) Int) ListLongMap!2653)

(assert (=> b!201227 (= lt!100093 (getCurrentListMapNoExtraKeys!314 _keys!825 lt!100102 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201227 (= lt!100102 (array!9012 (store (arr!4255 _values!649) i!601 (ValueCellFull!2105 v!520)) (size!4581 _values!649)))))

(assert (=> b!201227 (= lt!100091 (getCurrentListMapNoExtraKeys!314 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!8414 () Bool)

(declare-fun tp!18154 () Bool)

(assert (=> mapNonEmpty!8414 (= mapRes!8414 (and tp!18154 e!131882))))

(declare-fun mapValue!8414 () ValueCell!2105)

(declare-fun mapKey!8414 () (_ BitVec 32))

(declare-fun mapRest!8414 () (Array (_ BitVec 32) ValueCell!2105))

(assert (=> mapNonEmpty!8414 (= (arr!4255 _values!649) (store mapRest!8414 mapKey!8414 mapValue!8414))))

(declare-fun b!201228 () Bool)

(assert (=> b!201228 (= e!131877 e!131878)))

(declare-fun res!96102 () Bool)

(assert (=> b!201228 (=> res!96102 e!131878)))

(assert (=> b!201228 (= res!96102 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!100100 () ListLongMap!2653)

(assert (=> b!201228 (= lt!100100 lt!100096)))

(assert (=> b!201228 (= lt!100096 (+!391 lt!100103 lt!100106))))

(declare-fun lt!100101 () Unit!6034)

(assert (=> b!201228 (= lt!100101 (addCommutativeForDiffKeys!100 lt!100091 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (=> b!201228 (= lt!100094 (+!391 lt!100100 lt!100105))))

(declare-fun lt!100097 () tuple2!3750)

(assert (=> b!201228 (= lt!100100 (+!391 lt!100104 lt!100097))))

(assert (=> b!201228 (= lt!100095 lt!100098)))

(assert (=> b!201228 (= lt!100098 (+!391 lt!100103 lt!100105))))

(assert (=> b!201228 (= lt!100103 (+!391 lt!100091 lt!100097))))

(assert (=> b!201228 (= lt!100094 (+!391 (+!391 lt!100093 lt!100097) lt!100105))))

(assert (=> b!201228 (= lt!100105 (tuple2!3751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201228 (= lt!100097 (tuple2!3751 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201229 () Bool)

(assert (=> b!201229 (= e!131883 tp_is_empty!4897)))

(declare-fun b!201230 () Bool)

(declare-fun res!96104 () Bool)

(assert (=> b!201230 (=> (not res!96104) (not e!131879))))

(assert (=> b!201230 (= res!96104 (= (select (arr!4256 _keys!825) i!601) k0!843))))

(declare-fun b!201223 () Bool)

(declare-fun res!96105 () Bool)

(assert (=> b!201223 (=> (not res!96105) (not e!131879))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201223 (= res!96105 (validKeyInArray!0 k0!843))))

(declare-fun res!96107 () Bool)

(assert (=> start!20386 (=> (not res!96107) (not e!131879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20386 (= res!96107 (validMask!0 mask!1149))))

(assert (=> start!20386 e!131879))

(declare-fun array_inv!2783 (array!9011) Bool)

(assert (=> start!20386 (and (array_inv!2783 _values!649) e!131881)))

(assert (=> start!20386 true))

(assert (=> start!20386 tp_is_empty!4897))

(declare-fun array_inv!2784 (array!9013) Bool)

(assert (=> start!20386 (array_inv!2784 _keys!825)))

(assert (=> start!20386 tp!18155))

(assert (= (and start!20386 res!96107) b!201224))

(assert (= (and b!201224 res!96109) b!201225))

(assert (= (and b!201225 res!96108) b!201226))

(assert (= (and b!201226 res!96106) b!201222))

(assert (= (and b!201222 res!96103) b!201223))

(assert (= (and b!201223 res!96105) b!201230))

(assert (= (and b!201230 res!96104) b!201227))

(assert (= (and b!201227 (not res!96110)) b!201228))

(assert (= (and b!201228 (not res!96102)) b!201221))

(assert (= (and b!201219 condMapEmpty!8414) mapIsEmpty!8414))

(assert (= (and b!201219 (not condMapEmpty!8414)) mapNonEmpty!8414))

(get-info :version)

(assert (= (and mapNonEmpty!8414 ((_ is ValueCellFull!2105) mapValue!8414)) b!201220))

(assert (= (and b!201219 ((_ is ValueCellFull!2105) mapDefault!8414)) b!201229))

(assert (= start!20386 b!201219))

(declare-fun m!227643 () Bool)

(assert (=> b!201223 m!227643))

(declare-fun m!227645 () Bool)

(assert (=> b!201221 m!227645))

(declare-fun m!227647 () Bool)

(assert (=> b!201221 m!227647))

(declare-fun m!227649 () Bool)

(assert (=> b!201221 m!227649))

(declare-fun m!227651 () Bool)

(assert (=> b!201225 m!227651))

(declare-fun m!227653 () Bool)

(assert (=> b!201227 m!227653))

(declare-fun m!227655 () Bool)

(assert (=> b!201227 m!227655))

(declare-fun m!227657 () Bool)

(assert (=> b!201227 m!227657))

(declare-fun m!227659 () Bool)

(assert (=> b!201227 m!227659))

(declare-fun m!227661 () Bool)

(assert (=> b!201227 m!227661))

(declare-fun m!227663 () Bool)

(assert (=> b!201227 m!227663))

(declare-fun m!227665 () Bool)

(assert (=> b!201227 m!227665))

(declare-fun m!227667 () Bool)

(assert (=> start!20386 m!227667))

(declare-fun m!227669 () Bool)

(assert (=> start!20386 m!227669))

(declare-fun m!227671 () Bool)

(assert (=> start!20386 m!227671))

(declare-fun m!227673 () Bool)

(assert (=> b!201228 m!227673))

(declare-fun m!227675 () Bool)

(assert (=> b!201228 m!227675))

(declare-fun m!227677 () Bool)

(assert (=> b!201228 m!227677))

(declare-fun m!227679 () Bool)

(assert (=> b!201228 m!227679))

(declare-fun m!227681 () Bool)

(assert (=> b!201228 m!227681))

(declare-fun m!227683 () Bool)

(assert (=> b!201228 m!227683))

(declare-fun m!227685 () Bool)

(assert (=> b!201228 m!227685))

(declare-fun m!227687 () Bool)

(assert (=> b!201228 m!227687))

(assert (=> b!201228 m!227681))

(declare-fun m!227689 () Bool)

(assert (=> b!201226 m!227689))

(declare-fun m!227691 () Bool)

(assert (=> mapNonEmpty!8414 m!227691))

(declare-fun m!227693 () Bool)

(assert (=> b!201230 m!227693))

(check-sat (not b!201226) (not b!201225) (not b_next!5041) b_and!11761 (not b!201223) tp_is_empty!4897 (not b!201228) (not b!201221) (not b!201227) (not start!20386) (not mapNonEmpty!8414))
(check-sat b_and!11761 (not b_next!5041))
