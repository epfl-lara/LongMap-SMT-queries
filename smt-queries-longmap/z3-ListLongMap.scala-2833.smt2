; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40948 () Bool)

(assert start!40948)

(declare-fun b_free!10897 () Bool)

(declare-fun b_next!10897 () Bool)

(assert (=> start!40948 (= b_free!10897 (not b_next!10897))))

(declare-fun tp!38517 () Bool)

(declare-fun b_and!19013 () Bool)

(assert (=> start!40948 (= tp!38517 b_and!19013)))

(declare-fun b!455536 () Bool)

(declare-fun res!271735 () Bool)

(declare-fun e!266255 () Bool)

(assert (=> b!455536 (=> (not res!271735) (not e!266255))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!455536 (= res!271735 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!19993 () Bool)

(declare-fun mapRes!19993 () Bool)

(assert (=> mapIsEmpty!19993 mapRes!19993))

(declare-fun b!455537 () Bool)

(assert (=> b!455537 (= e!266255 false)))

(declare-datatypes ((V!17419 0))(
  ( (V!17420 (val!6162 Int)) )
))
(declare-fun minValue!515 () V!17419)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5774 0))(
  ( (ValueCellFull!5774 (v!8422 V!17419)) (EmptyCell!5774) )
))
(declare-datatypes ((array!28265 0))(
  ( (array!28266 (arr!13576 (Array (_ BitVec 32) ValueCell!5774)) (size!13929 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28265)

(declare-fun zeroValue!515 () V!17419)

(declare-datatypes ((array!28267 0))(
  ( (array!28268 (arr!13577 (Array (_ BitVec 32) (_ BitVec 64))) (size!13930 (_ BitVec 32))) )
))
(declare-fun lt!206176 () array!28267)

(declare-datatypes ((tuple2!8134 0))(
  ( (tuple2!8135 (_1!4078 (_ BitVec 64)) (_2!4078 V!17419)) )
))
(declare-datatypes ((List!8195 0))(
  ( (Nil!8192) (Cons!8191 (h!9047 tuple2!8134) (t!14014 List!8195)) )
))
(declare-datatypes ((ListLongMap!7037 0))(
  ( (ListLongMap!7038 (toList!3534 List!8195)) )
))
(declare-fun lt!206177 () ListLongMap!7037)

(declare-fun v!412 () V!17419)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1729 (array!28267 array!28265 (_ BitVec 32) (_ BitVec 32) V!17419 V!17419 (_ BitVec 32) Int) ListLongMap!7037)

(assert (=> b!455537 (= lt!206177 (getCurrentListMapNoExtraKeys!1729 lt!206176 (array!28266 (store (arr!13576 _values!549) i!563 (ValueCellFull!5774 v!412)) (size!13929 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206175 () ListLongMap!7037)

(declare-fun _keys!709 () array!28267)

(assert (=> b!455537 (= lt!206175 (getCurrentListMapNoExtraKeys!1729 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!455538 () Bool)

(declare-fun e!266256 () Bool)

(assert (=> b!455538 (= e!266256 e!266255)))

(declare-fun res!271733 () Bool)

(assert (=> b!455538 (=> (not res!271733) (not e!266255))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28267 (_ BitVec 32)) Bool)

(assert (=> b!455538 (= res!271733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206176 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!455538 (= lt!206176 (array!28268 (store (arr!13577 _keys!709) i!563 k0!794) (size!13930 _keys!709)))))

(declare-fun b!455539 () Bool)

(declare-fun res!271740 () Bool)

(assert (=> b!455539 (=> (not res!271740) (not e!266256))))

(declare-datatypes ((List!8196 0))(
  ( (Nil!8193) (Cons!8192 (h!9048 (_ BitVec 64)) (t!14015 List!8196)) )
))
(declare-fun arrayNoDuplicates!0 (array!28267 (_ BitVec 32) List!8196) Bool)

(assert (=> b!455539 (= res!271740 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8193))))

(declare-fun b!455540 () Bool)

(declare-fun e!266253 () Bool)

(declare-fun e!266257 () Bool)

(assert (=> b!455540 (= e!266253 (and e!266257 mapRes!19993))))

(declare-fun condMapEmpty!19993 () Bool)

(declare-fun mapDefault!19993 () ValueCell!5774)

(assert (=> b!455540 (= condMapEmpty!19993 (= (arr!13576 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5774)) mapDefault!19993)))))

(declare-fun b!455541 () Bool)

(declare-fun res!271736 () Bool)

(assert (=> b!455541 (=> (not res!271736) (not e!266256))))

(assert (=> b!455541 (= res!271736 (or (= (select (arr!13577 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13577 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19993 () Bool)

(declare-fun tp!38518 () Bool)

(declare-fun e!266252 () Bool)

(assert (=> mapNonEmpty!19993 (= mapRes!19993 (and tp!38518 e!266252))))

(declare-fun mapRest!19993 () (Array (_ BitVec 32) ValueCell!5774))

(declare-fun mapValue!19993 () ValueCell!5774)

(declare-fun mapKey!19993 () (_ BitVec 32))

(assert (=> mapNonEmpty!19993 (= (arr!13576 _values!549) (store mapRest!19993 mapKey!19993 mapValue!19993))))

(declare-fun b!455542 () Bool)

(declare-fun res!271732 () Bool)

(assert (=> b!455542 (=> (not res!271732) (not e!266256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!455542 (= res!271732 (validKeyInArray!0 k0!794))))

(declare-fun b!455543 () Bool)

(declare-fun res!271739 () Bool)

(assert (=> b!455543 (=> (not res!271739) (not e!266256))))

(assert (=> b!455543 (= res!271739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!455544 () Bool)

(declare-fun res!271741 () Bool)

(assert (=> b!455544 (=> (not res!271741) (not e!266256))))

(declare-fun arrayContainsKey!0 (array!28267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!455544 (= res!271741 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!455545 () Bool)

(declare-fun tp_is_empty!12235 () Bool)

(assert (=> b!455545 (= e!266257 tp_is_empty!12235)))

(declare-fun b!455546 () Bool)

(declare-fun res!271742 () Bool)

(assert (=> b!455546 (=> (not res!271742) (not e!266256))))

(assert (=> b!455546 (= res!271742 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13930 _keys!709))))))

(declare-fun b!455547 () Bool)

(declare-fun res!271737 () Bool)

(assert (=> b!455547 (=> (not res!271737) (not e!266256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!455547 (= res!271737 (validMask!0 mask!1025))))

(declare-fun b!455548 () Bool)

(declare-fun res!271738 () Bool)

(assert (=> b!455548 (=> (not res!271738) (not e!266256))))

(assert (=> b!455548 (= res!271738 (and (= (size!13929 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13930 _keys!709) (size!13929 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!455549 () Bool)

(declare-fun res!271731 () Bool)

(assert (=> b!455549 (=> (not res!271731) (not e!266255))))

(assert (=> b!455549 (= res!271731 (arrayNoDuplicates!0 lt!206176 #b00000000000000000000000000000000 Nil!8193))))

(declare-fun b!455550 () Bool)

(assert (=> b!455550 (= e!266252 tp_is_empty!12235)))

(declare-fun res!271734 () Bool)

(assert (=> start!40948 (=> (not res!271734) (not e!266256))))

(assert (=> start!40948 (= res!271734 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13930 _keys!709))))))

(assert (=> start!40948 e!266256))

(assert (=> start!40948 tp_is_empty!12235))

(assert (=> start!40948 tp!38517))

(assert (=> start!40948 true))

(declare-fun array_inv!9894 (array!28265) Bool)

(assert (=> start!40948 (and (array_inv!9894 _values!549) e!266253)))

(declare-fun array_inv!9895 (array!28267) Bool)

(assert (=> start!40948 (array_inv!9895 _keys!709)))

(assert (= (and start!40948 res!271734) b!455547))

(assert (= (and b!455547 res!271737) b!455548))

(assert (= (and b!455548 res!271738) b!455543))

(assert (= (and b!455543 res!271739) b!455539))

(assert (= (and b!455539 res!271740) b!455546))

(assert (= (and b!455546 res!271742) b!455542))

(assert (= (and b!455542 res!271732) b!455541))

(assert (= (and b!455541 res!271736) b!455544))

(assert (= (and b!455544 res!271741) b!455538))

(assert (= (and b!455538 res!271733) b!455549))

(assert (= (and b!455549 res!271731) b!455536))

(assert (= (and b!455536 res!271735) b!455537))

(assert (= (and b!455540 condMapEmpty!19993) mapIsEmpty!19993))

(assert (= (and b!455540 (not condMapEmpty!19993)) mapNonEmpty!19993))

(get-info :version)

(assert (= (and mapNonEmpty!19993 ((_ is ValueCellFull!5774) mapValue!19993)) b!455550))

(assert (= (and b!455540 ((_ is ValueCellFull!5774) mapDefault!19993)) b!455545))

(assert (= start!40948 b!455540))

(declare-fun m!438737 () Bool)

(assert (=> mapNonEmpty!19993 m!438737))

(declare-fun m!438739 () Bool)

(assert (=> b!455549 m!438739))

(declare-fun m!438741 () Bool)

(assert (=> b!455537 m!438741))

(declare-fun m!438743 () Bool)

(assert (=> b!455537 m!438743))

(declare-fun m!438745 () Bool)

(assert (=> b!455537 m!438745))

(declare-fun m!438747 () Bool)

(assert (=> b!455541 m!438747))

(declare-fun m!438749 () Bool)

(assert (=> b!455547 m!438749))

(declare-fun m!438751 () Bool)

(assert (=> b!455539 m!438751))

(declare-fun m!438753 () Bool)

(assert (=> b!455544 m!438753))

(declare-fun m!438755 () Bool)

(assert (=> b!455542 m!438755))

(declare-fun m!438757 () Bool)

(assert (=> start!40948 m!438757))

(declare-fun m!438759 () Bool)

(assert (=> start!40948 m!438759))

(declare-fun m!438761 () Bool)

(assert (=> b!455538 m!438761))

(declare-fun m!438763 () Bool)

(assert (=> b!455538 m!438763))

(declare-fun m!438765 () Bool)

(assert (=> b!455543 m!438765))

(check-sat (not b!455539) (not start!40948) tp_is_empty!12235 (not b!455547) (not mapNonEmpty!19993) (not b!455544) (not b!455549) b_and!19013 (not b!455537) (not b!455538) (not b!455542) (not b!455543) (not b_next!10897))
(check-sat b_and!19013 (not b_next!10897))
