; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40876 () Bool)

(assert start!40876)

(declare-fun b_free!10825 () Bool)

(declare-fun b_next!10825 () Bool)

(assert (=> start!40876 (= b_free!10825 (not b_next!10825))))

(declare-fun tp!38302 () Bool)

(declare-fun b_and!18977 () Bool)

(assert (=> start!40876 (= tp!38302 b_and!18977)))

(declare-fun b!454126 () Bool)

(declare-fun res!270567 () Bool)

(declare-fun e!265744 () Bool)

(assert (=> b!454126 (=> (not res!270567) (not e!265744))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454126 (= res!270567 (validMask!0 mask!1025))))

(declare-fun b!454127 () Bool)

(declare-fun res!270562 () Bool)

(assert (=> b!454127 (=> (not res!270562) (not e!265744))))

(declare-datatypes ((array!28124 0))(
  ( (array!28125 (arr!13505 (Array (_ BitVec 32) (_ BitVec 64))) (size!13857 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28124)

(declare-datatypes ((List!8043 0))(
  ( (Nil!8040) (Cons!8039 (h!8895 (_ BitVec 64)) (t!13863 List!8043)) )
))
(declare-fun arrayNoDuplicates!0 (array!28124 (_ BitVec 32) List!8043) Bool)

(assert (=> b!454127 (= res!270562 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8040))))

(declare-fun b!454128 () Bool)

(declare-fun e!265743 () Bool)

(declare-fun e!265742 () Bool)

(declare-fun mapRes!19885 () Bool)

(assert (=> b!454128 (= e!265743 (and e!265742 mapRes!19885))))

(declare-fun condMapEmpty!19885 () Bool)

(declare-datatypes ((V!17323 0))(
  ( (V!17324 (val!6126 Int)) )
))
(declare-datatypes ((ValueCell!5738 0))(
  ( (ValueCellFull!5738 (v!8393 V!17323)) (EmptyCell!5738) )
))
(declare-datatypes ((array!28126 0))(
  ( (array!28127 (arr!13506 (Array (_ BitVec 32) ValueCell!5738)) (size!13858 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28126)

(declare-fun mapDefault!19885 () ValueCell!5738)

(assert (=> b!454128 (= condMapEmpty!19885 (= (arr!13506 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5738)) mapDefault!19885)))))

(declare-fun mapNonEmpty!19885 () Bool)

(declare-fun tp!38301 () Bool)

(declare-fun e!265740 () Bool)

(assert (=> mapNonEmpty!19885 (= mapRes!19885 (and tp!38301 e!265740))))

(declare-fun mapValue!19885 () ValueCell!5738)

(declare-fun mapKey!19885 () (_ BitVec 32))

(declare-fun mapRest!19885 () (Array (_ BitVec 32) ValueCell!5738))

(assert (=> mapNonEmpty!19885 (= (arr!13506 _values!549) (store mapRest!19885 mapKey!19885 mapValue!19885))))

(declare-fun b!454129 () Bool)

(declare-fun res!270568 () Bool)

(assert (=> b!454129 (=> (not res!270568) (not e!265744))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454129 (= res!270568 (validKeyInArray!0 k0!794))))

(declare-fun res!270557 () Bool)

(assert (=> start!40876 (=> (not res!270557) (not e!265744))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40876 (= res!270557 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13857 _keys!709))))))

(assert (=> start!40876 e!265744))

(declare-fun tp_is_empty!12163 () Bool)

(assert (=> start!40876 tp_is_empty!12163))

(assert (=> start!40876 tp!38302))

(assert (=> start!40876 true))

(declare-fun array_inv!9862 (array!28126) Bool)

(assert (=> start!40876 (and (array_inv!9862 _values!549) e!265743)))

(declare-fun array_inv!9863 (array!28124) Bool)

(assert (=> start!40876 (array_inv!9863 _keys!709)))

(declare-fun b!454130 () Bool)

(declare-fun res!270558 () Bool)

(assert (=> b!454130 (=> (not res!270558) (not e!265744))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!454130 (= res!270558 (and (= (size!13858 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13857 _keys!709) (size!13858 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19885 () Bool)

(assert (=> mapIsEmpty!19885 mapRes!19885))

(declare-fun b!454131 () Bool)

(declare-fun res!270563 () Bool)

(assert (=> b!454131 (=> (not res!270563) (not e!265744))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!454131 (= res!270563 (or (= (select (arr!13505 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13505 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!454132 () Bool)

(assert (=> b!454132 (= e!265742 tp_is_empty!12163)))

(declare-fun b!454133 () Bool)

(assert (=> b!454133 (= e!265740 tp_is_empty!12163)))

(declare-fun b!454134 () Bool)

(declare-fun res!270566 () Bool)

(assert (=> b!454134 (=> (not res!270566) (not e!265744))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28124 (_ BitVec 32)) Bool)

(assert (=> b!454134 (= res!270566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!454135 () Bool)

(declare-fun res!270565 () Bool)

(assert (=> b!454135 (=> (not res!270565) (not e!265744))))

(declare-fun arrayContainsKey!0 (array!28124 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454135 (= res!270565 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!454136 () Bool)

(declare-fun e!265741 () Bool)

(assert (=> b!454136 (= e!265744 e!265741)))

(declare-fun res!270559 () Bool)

(assert (=> b!454136 (=> (not res!270559) (not e!265741))))

(declare-fun lt!206099 () array!28124)

(assert (=> b!454136 (= res!270559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206099 mask!1025))))

(assert (=> b!454136 (= lt!206099 (array!28125 (store (arr!13505 _keys!709) i!563 k0!794) (size!13857 _keys!709)))))

(declare-fun b!454137 () Bool)

(declare-fun res!270564 () Bool)

(assert (=> b!454137 (=> (not res!270564) (not e!265741))))

(assert (=> b!454137 (= res!270564 (bvsle from!863 i!563))))

(declare-fun b!454138 () Bool)

(declare-fun res!270561 () Bool)

(assert (=> b!454138 (=> (not res!270561) (not e!265744))))

(assert (=> b!454138 (= res!270561 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13857 _keys!709))))))

(declare-fun b!454139 () Bool)

(declare-fun res!270560 () Bool)

(assert (=> b!454139 (=> (not res!270560) (not e!265741))))

(assert (=> b!454139 (= res!270560 (arrayNoDuplicates!0 lt!206099 #b00000000000000000000000000000000 Nil!8040))))

(declare-fun b!454140 () Bool)

(assert (=> b!454140 (= e!265741 false)))

(declare-fun minValue!515 () V!17323)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17323)

(declare-datatypes ((tuple2!7974 0))(
  ( (tuple2!7975 (_1!3998 (_ BitVec 64)) (_2!3998 V!17323)) )
))
(declare-datatypes ((List!8044 0))(
  ( (Nil!8041) (Cons!8040 (h!8896 tuple2!7974) (t!13864 List!8044)) )
))
(declare-datatypes ((ListLongMap!6889 0))(
  ( (ListLongMap!6890 (toList!3460 List!8044)) )
))
(declare-fun lt!206098 () ListLongMap!6889)

(declare-fun v!412 () V!17323)

(declare-fun getCurrentListMapNoExtraKeys!1689 (array!28124 array!28126 (_ BitVec 32) (_ BitVec 32) V!17323 V!17323 (_ BitVec 32) Int) ListLongMap!6889)

(assert (=> b!454140 (= lt!206098 (getCurrentListMapNoExtraKeys!1689 lt!206099 (array!28127 (store (arr!13506 _values!549) i!563 (ValueCellFull!5738 v!412)) (size!13858 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206097 () ListLongMap!6889)

(assert (=> b!454140 (= lt!206097 (getCurrentListMapNoExtraKeys!1689 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!40876 res!270557) b!454126))

(assert (= (and b!454126 res!270567) b!454130))

(assert (= (and b!454130 res!270558) b!454134))

(assert (= (and b!454134 res!270566) b!454127))

(assert (= (and b!454127 res!270562) b!454138))

(assert (= (and b!454138 res!270561) b!454129))

(assert (= (and b!454129 res!270568) b!454131))

(assert (= (and b!454131 res!270563) b!454135))

(assert (= (and b!454135 res!270565) b!454136))

(assert (= (and b!454136 res!270559) b!454139))

(assert (= (and b!454139 res!270560) b!454137))

(assert (= (and b!454137 res!270564) b!454140))

(assert (= (and b!454128 condMapEmpty!19885) mapIsEmpty!19885))

(assert (= (and b!454128 (not condMapEmpty!19885)) mapNonEmpty!19885))

(get-info :version)

(assert (= (and mapNonEmpty!19885 ((_ is ValueCellFull!5738) mapValue!19885)) b!454133))

(assert (= (and b!454128 ((_ is ValueCellFull!5738) mapDefault!19885)) b!454132))

(assert (= start!40876 b!454128))

(declare-fun m!438573 () Bool)

(assert (=> mapNonEmpty!19885 m!438573))

(declare-fun m!438575 () Bool)

(assert (=> b!454129 m!438575))

(declare-fun m!438577 () Bool)

(assert (=> b!454139 m!438577))

(declare-fun m!438579 () Bool)

(assert (=> start!40876 m!438579))

(declare-fun m!438581 () Bool)

(assert (=> start!40876 m!438581))

(declare-fun m!438583 () Bool)

(assert (=> b!454131 m!438583))

(declare-fun m!438585 () Bool)

(assert (=> b!454134 m!438585))

(declare-fun m!438587 () Bool)

(assert (=> b!454140 m!438587))

(declare-fun m!438589 () Bool)

(assert (=> b!454140 m!438589))

(declare-fun m!438591 () Bool)

(assert (=> b!454140 m!438591))

(declare-fun m!438593 () Bool)

(assert (=> b!454135 m!438593))

(declare-fun m!438595 () Bool)

(assert (=> b!454136 m!438595))

(declare-fun m!438597 () Bool)

(assert (=> b!454136 m!438597))

(declare-fun m!438599 () Bool)

(assert (=> b!454127 m!438599))

(declare-fun m!438601 () Bool)

(assert (=> b!454126 m!438601))

(check-sat (not b!454135) (not b!454140) (not b!454126) (not b!454127) (not mapNonEmpty!19885) (not b_next!10825) (not b!454139) (not b!454129) (not b!454136) (not start!40876) b_and!18977 (not b!454134) tp_is_empty!12163)
(check-sat b_and!18977 (not b_next!10825))
