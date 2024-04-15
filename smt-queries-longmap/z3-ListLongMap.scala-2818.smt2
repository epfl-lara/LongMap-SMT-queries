; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40858 () Bool)

(assert start!40858)

(declare-fun b_free!10807 () Bool)

(declare-fun b_next!10807 () Bool)

(assert (=> start!40858 (= b_free!10807 (not b_next!10807))))

(declare-fun tp!38247 () Bool)

(declare-fun b_and!18923 () Bool)

(assert (=> start!40858 (= tp!38247 b_and!18923)))

(declare-fun b!453511 () Bool)

(declare-fun res!270122 () Bool)

(declare-fun e!265445 () Bool)

(assert (=> b!453511 (=> (not res!270122) (not e!265445))))

(declare-datatypes ((array!28087 0))(
  ( (array!28088 (arr!13487 (Array (_ BitVec 32) (_ BitVec 64))) (size!13840 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28087)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!453511 (= res!270122 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!453513 () Bool)

(declare-fun res!270121 () Bool)

(assert (=> b!453513 (=> (not res!270121) (not e!265445))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!453513 (= res!270121 (validKeyInArray!0 k0!794))))

(declare-fun e!265447 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun b!453514 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!453514 (= e!265447 (and (not (= from!863 i!563)) (bvslt from!863 i!563) (or (bvslt (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!863) (size!13840 _keys!709)))))))

(declare-datatypes ((V!17299 0))(
  ( (V!17300 (val!6117 Int)) )
))
(declare-fun minValue!515 () V!17299)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5729 0))(
  ( (ValueCellFull!5729 (v!8377 V!17299)) (EmptyCell!5729) )
))
(declare-datatypes ((array!28089 0))(
  ( (array!28090 (arr!13488 (Array (_ BitVec 32) ValueCell!5729)) (size!13841 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28089)

(declare-fun zeroValue!515 () V!17299)

(declare-datatypes ((tuple2!8066 0))(
  ( (tuple2!8067 (_1!4044 (_ BitVec 64)) (_2!4044 V!17299)) )
))
(declare-datatypes ((List!8123 0))(
  ( (Nil!8120) (Cons!8119 (h!8975 tuple2!8066) (t!13942 List!8123)) )
))
(declare-datatypes ((ListLongMap!6969 0))(
  ( (ListLongMap!6970 (toList!3500 List!8123)) )
))
(declare-fun lt!205770 () ListLongMap!6969)

(declare-fun v!412 () V!17299)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!205771 () array!28087)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1695 (array!28087 array!28089 (_ BitVec 32) (_ BitVec 32) V!17299 V!17299 (_ BitVec 32) Int) ListLongMap!6969)

(assert (=> b!453514 (= lt!205770 (getCurrentListMapNoExtraKeys!1695 lt!205771 (array!28090 (store (arr!13488 _values!549) i!563 (ValueCellFull!5729 v!412)) (size!13841 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!205772 () ListLongMap!6969)

(assert (=> b!453514 (= lt!205772 (getCurrentListMapNoExtraKeys!1695 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!453515 () Bool)

(declare-fun res!270120 () Bool)

(assert (=> b!453515 (=> (not res!270120) (not e!265445))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28087 (_ BitVec 32)) Bool)

(assert (=> b!453515 (= res!270120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!453516 () Bool)

(declare-fun e!265442 () Bool)

(declare-fun tp_is_empty!12145 () Bool)

(assert (=> b!453516 (= e!265442 tp_is_empty!12145)))

(declare-fun b!453517 () Bool)

(declare-fun res!270116 () Bool)

(assert (=> b!453517 (=> (not res!270116) (not e!265445))))

(assert (=> b!453517 (= res!270116 (and (= (size!13841 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13840 _keys!709) (size!13841 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!453518 () Bool)

(declare-fun e!265446 () Bool)

(declare-fun e!265444 () Bool)

(declare-fun mapRes!19858 () Bool)

(assert (=> b!453518 (= e!265446 (and e!265444 mapRes!19858))))

(declare-fun condMapEmpty!19858 () Bool)

(declare-fun mapDefault!19858 () ValueCell!5729)

(assert (=> b!453518 (= condMapEmpty!19858 (= (arr!13488 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5729)) mapDefault!19858)))))

(declare-fun b!453519 () Bool)

(assert (=> b!453519 (= e!265444 tp_is_empty!12145)))

(declare-fun b!453520 () Bool)

(declare-fun res!270115 () Bool)

(assert (=> b!453520 (=> (not res!270115) (not e!265445))))

(assert (=> b!453520 (= res!270115 (or (= (select (arr!13487 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13487 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453512 () Bool)

(declare-fun res!270111 () Bool)

(assert (=> b!453512 (=> (not res!270111) (not e!265445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!453512 (= res!270111 (validMask!0 mask!1025))))

(declare-fun res!270118 () Bool)

(assert (=> start!40858 (=> (not res!270118) (not e!265445))))

(assert (=> start!40858 (= res!270118 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13840 _keys!709))))))

(assert (=> start!40858 e!265445))

(assert (=> start!40858 tp_is_empty!12145))

(assert (=> start!40858 tp!38247))

(assert (=> start!40858 true))

(declare-fun array_inv!9830 (array!28089) Bool)

(assert (=> start!40858 (and (array_inv!9830 _values!549) e!265446)))

(declare-fun array_inv!9831 (array!28087) Bool)

(assert (=> start!40858 (array_inv!9831 _keys!709)))

(declare-fun b!453521 () Bool)

(declare-fun res!270112 () Bool)

(assert (=> b!453521 (=> (not res!270112) (not e!265447))))

(declare-datatypes ((List!8124 0))(
  ( (Nil!8121) (Cons!8120 (h!8976 (_ BitVec 64)) (t!13943 List!8124)) )
))
(declare-fun arrayNoDuplicates!0 (array!28087 (_ BitVec 32) List!8124) Bool)

(assert (=> b!453521 (= res!270112 (arrayNoDuplicates!0 lt!205771 #b00000000000000000000000000000000 Nil!8121))))

(declare-fun b!453522 () Bool)

(declare-fun res!270117 () Bool)

(assert (=> b!453522 (=> (not res!270117) (not e!265445))))

(assert (=> b!453522 (= res!270117 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8121))))

(declare-fun b!453523 () Bool)

(assert (=> b!453523 (= e!265445 e!265447)))

(declare-fun res!270119 () Bool)

(assert (=> b!453523 (=> (not res!270119) (not e!265447))))

(assert (=> b!453523 (= res!270119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205771 mask!1025))))

(assert (=> b!453523 (= lt!205771 (array!28088 (store (arr!13487 _keys!709) i!563 k0!794) (size!13840 _keys!709)))))

(declare-fun mapNonEmpty!19858 () Bool)

(declare-fun tp!38248 () Bool)

(assert (=> mapNonEmpty!19858 (= mapRes!19858 (and tp!38248 e!265442))))

(declare-fun mapValue!19858 () ValueCell!5729)

(declare-fun mapKey!19858 () (_ BitVec 32))

(declare-fun mapRest!19858 () (Array (_ BitVec 32) ValueCell!5729))

(assert (=> mapNonEmpty!19858 (= (arr!13488 _values!549) (store mapRest!19858 mapKey!19858 mapValue!19858))))

(declare-fun mapIsEmpty!19858 () Bool)

(assert (=> mapIsEmpty!19858 mapRes!19858))

(declare-fun b!453524 () Bool)

(declare-fun res!270114 () Bool)

(assert (=> b!453524 (=> (not res!270114) (not e!265445))))

(assert (=> b!453524 (= res!270114 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13840 _keys!709))))))

(declare-fun b!453525 () Bool)

(declare-fun res!270113 () Bool)

(assert (=> b!453525 (=> (not res!270113) (not e!265447))))

(assert (=> b!453525 (= res!270113 (bvsle from!863 i!563))))

(assert (= (and start!40858 res!270118) b!453512))

(assert (= (and b!453512 res!270111) b!453517))

(assert (= (and b!453517 res!270116) b!453515))

(assert (= (and b!453515 res!270120) b!453522))

(assert (= (and b!453522 res!270117) b!453524))

(assert (= (and b!453524 res!270114) b!453513))

(assert (= (and b!453513 res!270121) b!453520))

(assert (= (and b!453520 res!270115) b!453511))

(assert (= (and b!453511 res!270122) b!453523))

(assert (= (and b!453523 res!270119) b!453521))

(assert (= (and b!453521 res!270112) b!453525))

(assert (= (and b!453525 res!270113) b!453514))

(assert (= (and b!453518 condMapEmpty!19858) mapIsEmpty!19858))

(assert (= (and b!453518 (not condMapEmpty!19858)) mapNonEmpty!19858))

(get-info :version)

(assert (= (and mapNonEmpty!19858 ((_ is ValueCellFull!5729) mapValue!19858)) b!453516))

(assert (= (and b!453518 ((_ is ValueCellFull!5729) mapDefault!19858)) b!453519))

(assert (= start!40858 b!453518))

(declare-fun m!437387 () Bool)

(assert (=> b!453522 m!437387))

(declare-fun m!437389 () Bool)

(assert (=> mapNonEmpty!19858 m!437389))

(declare-fun m!437391 () Bool)

(assert (=> start!40858 m!437391))

(declare-fun m!437393 () Bool)

(assert (=> start!40858 m!437393))

(declare-fun m!437395 () Bool)

(assert (=> b!453520 m!437395))

(declare-fun m!437397 () Bool)

(assert (=> b!453515 m!437397))

(declare-fun m!437399 () Bool)

(assert (=> b!453511 m!437399))

(declare-fun m!437401 () Bool)

(assert (=> b!453523 m!437401))

(declare-fun m!437403 () Bool)

(assert (=> b!453523 m!437403))

(declare-fun m!437405 () Bool)

(assert (=> b!453514 m!437405))

(declare-fun m!437407 () Bool)

(assert (=> b!453514 m!437407))

(declare-fun m!437409 () Bool)

(assert (=> b!453514 m!437409))

(declare-fun m!437411 () Bool)

(assert (=> b!453512 m!437411))

(declare-fun m!437413 () Bool)

(assert (=> b!453521 m!437413))

(declare-fun m!437415 () Bool)

(assert (=> b!453513 m!437415))

(check-sat (not b!453515) b_and!18923 (not b!453523) (not mapNonEmpty!19858) (not b!453512) tp_is_empty!12145 (not b!453514) (not b!453522) (not b_next!10807) (not start!40858) (not b!453511) (not b!453521) (not b!453513))
(check-sat b_and!18923 (not b_next!10807))
