; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40888 () Bool)

(assert start!40888)

(declare-fun b_free!10837 () Bool)

(declare-fun b_next!10837 () Bool)

(assert (=> start!40888 (= b_free!10837 (not b_next!10837))))

(declare-fun tp!38337 () Bool)

(declare-fun b_and!18989 () Bool)

(assert (=> start!40888 (= tp!38337 b_and!18989)))

(declare-fun b!454396 () Bool)

(declare-fun res!270779 () Bool)

(declare-fun e!265851 () Bool)

(assert (=> b!454396 (=> (not res!270779) (not e!265851))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454396 (= res!270779 (validMask!0 mask!1025))))

(declare-fun b!454397 () Bool)

(declare-fun res!270776 () Bool)

(assert (=> b!454397 (=> (not res!270776) (not e!265851))))

(declare-datatypes ((array!28146 0))(
  ( (array!28147 (arr!13516 (Array (_ BitVec 32) (_ BitVec 64))) (size!13868 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28146)

(declare-datatypes ((List!8052 0))(
  ( (Nil!8049) (Cons!8048 (h!8904 (_ BitVec 64)) (t!13872 List!8052)) )
))
(declare-fun arrayNoDuplicates!0 (array!28146 (_ BitVec 32) List!8052) Bool)

(assert (=> b!454397 (= res!270776 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8049))))

(declare-fun b!454398 () Bool)

(declare-fun e!265848 () Bool)

(declare-fun tp_is_empty!12175 () Bool)

(assert (=> b!454398 (= e!265848 tp_is_empty!12175)))

(declare-fun b!454399 () Bool)

(declare-fun e!265852 () Bool)

(assert (=> b!454399 (= e!265851 e!265852)))

(declare-fun res!270773 () Bool)

(assert (=> b!454399 (=> (not res!270773) (not e!265852))))

(declare-fun lt!206151 () array!28146)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28146 (_ BitVec 32)) Bool)

(assert (=> b!454399 (= res!270773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206151 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!454399 (= lt!206151 (array!28147 (store (arr!13516 _keys!709) i!563 k0!794) (size!13868 _keys!709)))))

(declare-fun b!454400 () Bool)

(declare-fun res!270781 () Bool)

(assert (=> b!454400 (=> (not res!270781) (not e!265851))))

(declare-fun arrayContainsKey!0 (array!28146 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454400 (= res!270781 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!454401 () Bool)

(declare-fun res!270782 () Bool)

(assert (=> b!454401 (=> (not res!270782) (not e!265851))))

(assert (=> b!454401 (= res!270782 (or (= (select (arr!13516 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13516 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!454402 () Bool)

(declare-fun e!265850 () Bool)

(declare-fun e!265849 () Bool)

(declare-fun mapRes!19903 () Bool)

(assert (=> b!454402 (= e!265850 (and e!265849 mapRes!19903))))

(declare-fun condMapEmpty!19903 () Bool)

(declare-datatypes ((V!17339 0))(
  ( (V!17340 (val!6132 Int)) )
))
(declare-datatypes ((ValueCell!5744 0))(
  ( (ValueCellFull!5744 (v!8399 V!17339)) (EmptyCell!5744) )
))
(declare-datatypes ((array!28148 0))(
  ( (array!28149 (arr!13517 (Array (_ BitVec 32) ValueCell!5744)) (size!13869 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28148)

(declare-fun mapDefault!19903 () ValueCell!5744)

(assert (=> b!454402 (= condMapEmpty!19903 (= (arr!13517 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5744)) mapDefault!19903)))))

(declare-fun b!454404 () Bool)

(declare-fun res!270778 () Bool)

(assert (=> b!454404 (=> (not res!270778) (not e!265852))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!454404 (= res!270778 (bvsle from!863 i!563))))

(declare-fun b!454405 () Bool)

(declare-fun res!270784 () Bool)

(assert (=> b!454405 (=> (not res!270784) (not e!265851))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454405 (= res!270784 (validKeyInArray!0 k0!794))))

(declare-fun b!454406 () Bool)

(declare-fun res!270777 () Bool)

(assert (=> b!454406 (=> (not res!270777) (not e!265851))))

(assert (=> b!454406 (= res!270777 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13868 _keys!709))))))

(declare-fun b!454407 () Bool)

(declare-fun res!270774 () Bool)

(assert (=> b!454407 (=> (not res!270774) (not e!265852))))

(assert (=> b!454407 (= res!270774 (arrayNoDuplicates!0 lt!206151 #b00000000000000000000000000000000 Nil!8049))))

(declare-fun mapNonEmpty!19903 () Bool)

(declare-fun tp!38338 () Bool)

(assert (=> mapNonEmpty!19903 (= mapRes!19903 (and tp!38338 e!265848))))

(declare-fun mapRest!19903 () (Array (_ BitVec 32) ValueCell!5744))

(declare-fun mapValue!19903 () ValueCell!5744)

(declare-fun mapKey!19903 () (_ BitVec 32))

(assert (=> mapNonEmpty!19903 (= (arr!13517 _values!549) (store mapRest!19903 mapKey!19903 mapValue!19903))))

(declare-fun b!454403 () Bool)

(declare-fun res!270783 () Bool)

(assert (=> b!454403 (=> (not res!270783) (not e!265851))))

(assert (=> b!454403 (= res!270783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!270780 () Bool)

(assert (=> start!40888 (=> (not res!270780) (not e!265851))))

(assert (=> start!40888 (= res!270780 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13868 _keys!709))))))

(assert (=> start!40888 e!265851))

(assert (=> start!40888 tp_is_empty!12175))

(assert (=> start!40888 tp!38337))

(assert (=> start!40888 true))

(declare-fun array_inv!9870 (array!28148) Bool)

(assert (=> start!40888 (and (array_inv!9870 _values!549) e!265850)))

(declare-fun array_inv!9871 (array!28146) Bool)

(assert (=> start!40888 (array_inv!9871 _keys!709)))

(declare-fun b!454408 () Bool)

(declare-fun res!270775 () Bool)

(assert (=> b!454408 (=> (not res!270775) (not e!265851))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!454408 (= res!270775 (and (= (size!13869 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13868 _keys!709) (size!13869 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!454409 () Bool)

(assert (=> b!454409 (= e!265852 false)))

(declare-fun minValue!515 () V!17339)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17339)

(declare-datatypes ((tuple2!7984 0))(
  ( (tuple2!7985 (_1!4003 (_ BitVec 64)) (_2!4003 V!17339)) )
))
(declare-datatypes ((List!8053 0))(
  ( (Nil!8050) (Cons!8049 (h!8905 tuple2!7984) (t!13873 List!8053)) )
))
(declare-datatypes ((ListLongMap!6899 0))(
  ( (ListLongMap!6900 (toList!3465 List!8053)) )
))
(declare-fun lt!206152 () ListLongMap!6899)

(declare-fun v!412 () V!17339)

(declare-fun getCurrentListMapNoExtraKeys!1694 (array!28146 array!28148 (_ BitVec 32) (_ BitVec 32) V!17339 V!17339 (_ BitVec 32) Int) ListLongMap!6899)

(assert (=> b!454409 (= lt!206152 (getCurrentListMapNoExtraKeys!1694 lt!206151 (array!28149 (store (arr!13517 _values!549) i!563 (ValueCellFull!5744 v!412)) (size!13869 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206153 () ListLongMap!6899)

(assert (=> b!454409 (= lt!206153 (getCurrentListMapNoExtraKeys!1694 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!454410 () Bool)

(assert (=> b!454410 (= e!265849 tp_is_empty!12175)))

(declare-fun mapIsEmpty!19903 () Bool)

(assert (=> mapIsEmpty!19903 mapRes!19903))

(assert (= (and start!40888 res!270780) b!454396))

(assert (= (and b!454396 res!270779) b!454408))

(assert (= (and b!454408 res!270775) b!454403))

(assert (= (and b!454403 res!270783) b!454397))

(assert (= (and b!454397 res!270776) b!454406))

(assert (= (and b!454406 res!270777) b!454405))

(assert (= (and b!454405 res!270784) b!454401))

(assert (= (and b!454401 res!270782) b!454400))

(assert (= (and b!454400 res!270781) b!454399))

(assert (= (and b!454399 res!270773) b!454407))

(assert (= (and b!454407 res!270774) b!454404))

(assert (= (and b!454404 res!270778) b!454409))

(assert (= (and b!454402 condMapEmpty!19903) mapIsEmpty!19903))

(assert (= (and b!454402 (not condMapEmpty!19903)) mapNonEmpty!19903))

(get-info :version)

(assert (= (and mapNonEmpty!19903 ((_ is ValueCellFull!5744) mapValue!19903)) b!454398))

(assert (= (and b!454402 ((_ is ValueCellFull!5744) mapDefault!19903)) b!454410))

(assert (= start!40888 b!454402))

(declare-fun m!438753 () Bool)

(assert (=> b!454399 m!438753))

(declare-fun m!438755 () Bool)

(assert (=> b!454399 m!438755))

(declare-fun m!438757 () Bool)

(assert (=> mapNonEmpty!19903 m!438757))

(declare-fun m!438759 () Bool)

(assert (=> b!454396 m!438759))

(declare-fun m!438761 () Bool)

(assert (=> b!454405 m!438761))

(declare-fun m!438763 () Bool)

(assert (=> b!454407 m!438763))

(declare-fun m!438765 () Bool)

(assert (=> b!454397 m!438765))

(declare-fun m!438767 () Bool)

(assert (=> start!40888 m!438767))

(declare-fun m!438769 () Bool)

(assert (=> start!40888 m!438769))

(declare-fun m!438771 () Bool)

(assert (=> b!454400 m!438771))

(declare-fun m!438773 () Bool)

(assert (=> b!454403 m!438773))

(declare-fun m!438775 () Bool)

(assert (=> b!454409 m!438775))

(declare-fun m!438777 () Bool)

(assert (=> b!454409 m!438777))

(declare-fun m!438779 () Bool)

(assert (=> b!454409 m!438779))

(declare-fun m!438781 () Bool)

(assert (=> b!454401 m!438781))

(check-sat b_and!18989 (not b!454405) (not b!454407) tp_is_empty!12175 (not mapNonEmpty!19903) (not b!454403) (not b!454400) (not start!40888) (not b!454396) (not b_next!10837) (not b!454409) (not b!454397) (not b!454399))
(check-sat b_and!18989 (not b_next!10837))
