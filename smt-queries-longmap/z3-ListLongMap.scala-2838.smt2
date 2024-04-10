; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40994 () Bool)

(assert start!40994)

(declare-fun b_free!10929 () Bool)

(declare-fun b_next!10929 () Bool)

(assert (=> start!40994 (= b_free!10929 (not b_next!10929))))

(declare-fun tp!38613 () Bool)

(declare-fun b_and!19071 () Bool)

(assert (=> start!40994 (= tp!38613 b_and!19071)))

(declare-fun b!456541 () Bool)

(declare-fun res!272462 () Bool)

(declare-fun e!266730 () Bool)

(assert (=> b!456541 (=> (not res!272462) (not e!266730))))

(declare-datatypes ((array!28337 0))(
  ( (array!28338 (arr!13612 (Array (_ BitVec 32) (_ BitVec 64))) (size!13964 (_ BitVec 32))) )
))
(declare-fun lt!206582 () array!28337)

(declare-datatypes ((List!8211 0))(
  ( (Nil!8208) (Cons!8207 (h!9063 (_ BitVec 64)) (t!14039 List!8211)) )
))
(declare-fun arrayNoDuplicates!0 (array!28337 (_ BitVec 32) List!8211) Bool)

(assert (=> b!456541 (= res!272462 (arrayNoDuplicates!0 lt!206582 #b00000000000000000000000000000000 Nil!8208))))

(declare-fun b!456542 () Bool)

(declare-fun e!266731 () Bool)

(assert (=> b!456542 (= e!266731 (not true))))

(declare-datatypes ((V!17461 0))(
  ( (V!17462 (val!6178 Int)) )
))
(declare-datatypes ((ValueCell!5790 0))(
  ( (ValueCellFull!5790 (v!8444 V!17461)) (EmptyCell!5790) )
))
(declare-datatypes ((array!28339 0))(
  ( (array!28340 (arr!13613 (Array (_ BitVec 32) ValueCell!5790)) (size!13965 (_ BitVec 32))) )
))
(declare-fun lt!206584 () array!28339)

(declare-fun minValue!515 () V!17461)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun _values!549 () array!28339)

(declare-fun zeroValue!515 () V!17461)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!17461)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!28337)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!8140 0))(
  ( (tuple2!8141 (_1!4081 (_ BitVec 64)) (_2!4081 V!17461)) )
))
(declare-datatypes ((List!8212 0))(
  ( (Nil!8209) (Cons!8208 (h!9064 tuple2!8140) (t!14040 List!8212)) )
))
(declare-datatypes ((ListLongMap!7053 0))(
  ( (ListLongMap!7054 (toList!3542 List!8212)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1725 (array!28337 array!28339 (_ BitVec 32) (_ BitVec 32) V!17461 V!17461 (_ BitVec 32) Int) ListLongMap!7053)

(declare-fun +!1579 (ListLongMap!7053 tuple2!8140) ListLongMap!7053)

(assert (=> b!456542 (= (getCurrentListMapNoExtraKeys!1725 lt!206582 lt!206584 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1579 (getCurrentListMapNoExtraKeys!1725 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8141 k0!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13280 0))(
  ( (Unit!13281) )
))
(declare-fun lt!206583 () Unit!13280)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!739 (array!28337 array!28339 (_ BitVec 32) (_ BitVec 32) V!17461 V!17461 (_ BitVec 32) (_ BitVec 64) V!17461 (_ BitVec 32) Int) Unit!13280)

(assert (=> b!456542 (= lt!206583 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!739 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!456543 () Bool)

(declare-fun res!272456 () Bool)

(declare-fun e!266732 () Bool)

(assert (=> b!456543 (=> (not res!272456) (not e!266732))))

(assert (=> b!456543 (= res!272456 (and (= (size!13965 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13964 _keys!709) (size!13965 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!20041 () Bool)

(declare-fun mapRes!20041 () Bool)

(assert (=> mapIsEmpty!20041 mapRes!20041))

(declare-fun res!272457 () Bool)

(assert (=> start!40994 (=> (not res!272457) (not e!266732))))

(assert (=> start!40994 (= res!272457 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13964 _keys!709))))))

(assert (=> start!40994 e!266732))

(declare-fun tp_is_empty!12267 () Bool)

(assert (=> start!40994 tp_is_empty!12267))

(assert (=> start!40994 tp!38613))

(assert (=> start!40994 true))

(declare-fun e!266734 () Bool)

(declare-fun array_inv!9862 (array!28339) Bool)

(assert (=> start!40994 (and (array_inv!9862 _values!549) e!266734)))

(declare-fun array_inv!9863 (array!28337) Bool)

(assert (=> start!40994 (array_inv!9863 _keys!709)))

(declare-fun mapNonEmpty!20041 () Bool)

(declare-fun tp!38614 () Bool)

(declare-fun e!266733 () Bool)

(assert (=> mapNonEmpty!20041 (= mapRes!20041 (and tp!38614 e!266733))))

(declare-fun mapRest!20041 () (Array (_ BitVec 32) ValueCell!5790))

(declare-fun mapKey!20041 () (_ BitVec 32))

(declare-fun mapValue!20041 () ValueCell!5790)

(assert (=> mapNonEmpty!20041 (= (arr!13613 _values!549) (store mapRest!20041 mapKey!20041 mapValue!20041))))

(declare-fun b!456544 () Bool)

(declare-fun res!272455 () Bool)

(assert (=> b!456544 (=> (not res!272455) (not e!266730))))

(assert (=> b!456544 (= res!272455 (bvsle from!863 i!563))))

(declare-fun b!456545 () Bool)

(declare-fun res!272461 () Bool)

(assert (=> b!456545 (=> (not res!272461) (not e!266732))))

(declare-fun arrayContainsKey!0 (array!28337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!456545 (= res!272461 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!456546 () Bool)

(declare-fun e!266729 () Bool)

(assert (=> b!456546 (= e!266729 tp_is_empty!12267)))

(declare-fun b!456547 () Bool)

(declare-fun res!272454 () Bool)

(assert (=> b!456547 (=> (not res!272454) (not e!266732))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!456547 (= res!272454 (validKeyInArray!0 k0!794))))

(declare-fun b!456548 () Bool)

(assert (=> b!456548 (= e!266732 e!266730)))

(declare-fun res!272451 () Bool)

(assert (=> b!456548 (=> (not res!272451) (not e!266730))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28337 (_ BitVec 32)) Bool)

(assert (=> b!456548 (= res!272451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206582 mask!1025))))

(assert (=> b!456548 (= lt!206582 (array!28338 (store (arr!13612 _keys!709) i!563 k0!794) (size!13964 _keys!709)))))

(declare-fun b!456549 () Bool)

(declare-fun res!272453 () Bool)

(assert (=> b!456549 (=> (not res!272453) (not e!266732))))

(assert (=> b!456549 (= res!272453 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8208))))

(declare-fun b!456550 () Bool)

(declare-fun res!272458 () Bool)

(assert (=> b!456550 (=> (not res!272458) (not e!266732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!456550 (= res!272458 (validMask!0 mask!1025))))

(declare-fun b!456551 () Bool)

(declare-fun res!272452 () Bool)

(assert (=> b!456551 (=> (not res!272452) (not e!266732))))

(assert (=> b!456551 (= res!272452 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13964 _keys!709))))))

(declare-fun b!456552 () Bool)

(assert (=> b!456552 (= e!266733 tp_is_empty!12267)))

(declare-fun b!456553 () Bool)

(declare-fun res!272459 () Bool)

(assert (=> b!456553 (=> (not res!272459) (not e!266732))))

(assert (=> b!456553 (= res!272459 (or (= (select (arr!13612 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13612 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!456554 () Bool)

(assert (=> b!456554 (= e!266730 e!266731)))

(declare-fun res!272460 () Bool)

(assert (=> b!456554 (=> (not res!272460) (not e!266731))))

(assert (=> b!456554 (= res!272460 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!206585 () ListLongMap!7053)

(assert (=> b!456554 (= lt!206585 (getCurrentListMapNoExtraKeys!1725 lt!206582 lt!206584 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!456554 (= lt!206584 (array!28340 (store (arr!13613 _values!549) i!563 (ValueCellFull!5790 v!412)) (size!13965 _values!549)))))

(declare-fun lt!206581 () ListLongMap!7053)

(assert (=> b!456554 (= lt!206581 (getCurrentListMapNoExtraKeys!1725 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!456555 () Bool)

(assert (=> b!456555 (= e!266734 (and e!266729 mapRes!20041))))

(declare-fun condMapEmpty!20041 () Bool)

(declare-fun mapDefault!20041 () ValueCell!5790)

(assert (=> b!456555 (= condMapEmpty!20041 (= (arr!13613 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5790)) mapDefault!20041)))))

(declare-fun b!456556 () Bool)

(declare-fun res!272450 () Bool)

(assert (=> b!456556 (=> (not res!272450) (not e!266732))))

(assert (=> b!456556 (= res!272450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!40994 res!272457) b!456550))

(assert (= (and b!456550 res!272458) b!456543))

(assert (= (and b!456543 res!272456) b!456556))

(assert (= (and b!456556 res!272450) b!456549))

(assert (= (and b!456549 res!272453) b!456551))

(assert (= (and b!456551 res!272452) b!456547))

(assert (= (and b!456547 res!272454) b!456553))

(assert (= (and b!456553 res!272459) b!456545))

(assert (= (and b!456545 res!272461) b!456548))

(assert (= (and b!456548 res!272451) b!456541))

(assert (= (and b!456541 res!272462) b!456544))

(assert (= (and b!456544 res!272455) b!456554))

(assert (= (and b!456554 res!272460) b!456542))

(assert (= (and b!456555 condMapEmpty!20041) mapIsEmpty!20041))

(assert (= (and b!456555 (not condMapEmpty!20041)) mapNonEmpty!20041))

(get-info :version)

(assert (= (and mapNonEmpty!20041 ((_ is ValueCellFull!5790) mapValue!20041)) b!456552))

(assert (= (and b!456555 ((_ is ValueCellFull!5790) mapDefault!20041)) b!456546))

(assert (= start!40994 b!456555))

(declare-fun m!439983 () Bool)

(assert (=> b!456545 m!439983))

(declare-fun m!439985 () Bool)

(assert (=> b!456554 m!439985))

(declare-fun m!439987 () Bool)

(assert (=> b!456554 m!439987))

(declare-fun m!439989 () Bool)

(assert (=> b!456554 m!439989))

(declare-fun m!439991 () Bool)

(assert (=> b!456549 m!439991))

(declare-fun m!439993 () Bool)

(assert (=> mapNonEmpty!20041 m!439993))

(declare-fun m!439995 () Bool)

(assert (=> b!456550 m!439995))

(declare-fun m!439997 () Bool)

(assert (=> b!456541 m!439997))

(declare-fun m!439999 () Bool)

(assert (=> b!456547 m!439999))

(declare-fun m!440001 () Bool)

(assert (=> b!456553 m!440001))

(declare-fun m!440003 () Bool)

(assert (=> b!456548 m!440003))

(declare-fun m!440005 () Bool)

(assert (=> b!456548 m!440005))

(declare-fun m!440007 () Bool)

(assert (=> b!456542 m!440007))

(declare-fun m!440009 () Bool)

(assert (=> b!456542 m!440009))

(assert (=> b!456542 m!440009))

(declare-fun m!440011 () Bool)

(assert (=> b!456542 m!440011))

(declare-fun m!440013 () Bool)

(assert (=> b!456542 m!440013))

(declare-fun m!440015 () Bool)

(assert (=> start!40994 m!440015))

(declare-fun m!440017 () Bool)

(assert (=> start!40994 m!440017))

(declare-fun m!440019 () Bool)

(assert (=> b!456556 m!440019))

(check-sat (not b!456549) (not b!456542) (not b!456548) (not b!456550) (not b!456554) (not b!456545) tp_is_empty!12267 (not b!456547) (not mapNonEmpty!20041) (not b!456556) b_and!19071 (not b!456541) (not b_next!10929) (not start!40994))
(check-sat b_and!19071 (not b_next!10929))
