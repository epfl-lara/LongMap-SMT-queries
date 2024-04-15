; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40650 () Bool)

(assert start!40650)

(declare-fun b_free!10675 () Bool)

(declare-fun b_next!10675 () Bool)

(assert (=> start!40650 (= b_free!10675 (not b_next!10675))))

(declare-fun tp!37845 () Bool)

(declare-fun b_and!18657 () Bool)

(assert (=> start!40650 (= tp!37845 b_and!18657)))

(declare-fun b!449086 () Bool)

(declare-fun e!263323 () Bool)

(assert (=> b!449086 (= e!263323 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!17123 0))(
  ( (V!17124 (val!6051 Int)) )
))
(declare-datatypes ((tuple2!7954 0))(
  ( (tuple2!7955 (_1!3988 (_ BitVec 64)) (_2!3988 V!17123)) )
))
(declare-datatypes ((List!8018 0))(
  ( (Nil!8015) (Cons!8014 (h!8870 tuple2!7954) (t!13771 List!8018)) )
))
(declare-datatypes ((ListLongMap!6857 0))(
  ( (ListLongMap!6858 (toList!3444 List!8018)) )
))
(declare-fun lt!204115 () ListLongMap!6857)

(declare-fun minValue!515 () V!17123)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!27831 0))(
  ( (array!27832 (arr!13361 (Array (_ BitVec 32) (_ BitVec 64))) (size!13714 (_ BitVec 32))) )
))
(declare-fun lt!204116 () array!27831)

(declare-datatypes ((ValueCell!5663 0))(
  ( (ValueCellFull!5663 (v!8300 V!17123)) (EmptyCell!5663) )
))
(declare-datatypes ((array!27833 0))(
  ( (array!27834 (arr!13362 (Array (_ BitVec 32) ValueCell!5663)) (size!13715 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27833)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!17123)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17123)

(declare-fun getCurrentListMapNoExtraKeys!1642 (array!27831 array!27833 (_ BitVec 32) (_ BitVec 32) V!17123 V!17123 (_ BitVec 32) Int) ListLongMap!6857)

(assert (=> b!449086 (= lt!204115 (getCurrentListMapNoExtraKeys!1642 lt!204116 (array!27834 (store (arr!13362 _values!549) i!563 (ValueCellFull!5663 v!412)) (size!13715 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204117 () ListLongMap!6857)

(declare-fun _keys!709 () array!27831)

(assert (=> b!449086 (= lt!204117 (getCurrentListMapNoExtraKeys!1642 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!449087 () Bool)

(declare-fun res!267144 () Bool)

(declare-fun e!263321 () Bool)

(assert (=> b!449087 (=> (not res!267144) (not e!263321))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27831 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!449087 (= res!267144 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!449088 () Bool)

(declare-fun e!263324 () Bool)

(declare-fun e!263319 () Bool)

(declare-fun mapRes!19653 () Bool)

(assert (=> b!449088 (= e!263324 (and e!263319 mapRes!19653))))

(declare-fun condMapEmpty!19653 () Bool)

(declare-fun mapDefault!19653 () ValueCell!5663)

(assert (=> b!449088 (= condMapEmpty!19653 (= (arr!13362 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5663)) mapDefault!19653)))))

(declare-fun b!449089 () Bool)

(declare-fun res!267142 () Bool)

(assert (=> b!449089 (=> (not res!267142) (not e!263321))))

(declare-datatypes ((List!8019 0))(
  ( (Nil!8016) (Cons!8015 (h!8871 (_ BitVec 64)) (t!13772 List!8019)) )
))
(declare-fun arrayNoDuplicates!0 (array!27831 (_ BitVec 32) List!8019) Bool)

(assert (=> b!449089 (= res!267142 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8016))))

(declare-fun res!267150 () Bool)

(assert (=> start!40650 (=> (not res!267150) (not e!263321))))

(assert (=> start!40650 (= res!267150 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13714 _keys!709))))))

(assert (=> start!40650 e!263321))

(declare-fun tp_is_empty!12013 () Bool)

(assert (=> start!40650 tp_is_empty!12013))

(assert (=> start!40650 tp!37845))

(assert (=> start!40650 true))

(declare-fun array_inv!9740 (array!27833) Bool)

(assert (=> start!40650 (and (array_inv!9740 _values!549) e!263324)))

(declare-fun array_inv!9741 (array!27831) Bool)

(assert (=> start!40650 (array_inv!9741 _keys!709)))

(declare-fun b!449090 () Bool)

(declare-fun res!267147 () Bool)

(assert (=> b!449090 (=> (not res!267147) (not e!263321))))

(assert (=> b!449090 (= res!267147 (or (= (select (arr!13361 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13361 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19653 () Bool)

(declare-fun tp!37844 () Bool)

(declare-fun e!263322 () Bool)

(assert (=> mapNonEmpty!19653 (= mapRes!19653 (and tp!37844 e!263322))))

(declare-fun mapKey!19653 () (_ BitVec 32))

(declare-fun mapValue!19653 () ValueCell!5663)

(declare-fun mapRest!19653 () (Array (_ BitVec 32) ValueCell!5663))

(assert (=> mapNonEmpty!19653 (= (arr!13362 _values!549) (store mapRest!19653 mapKey!19653 mapValue!19653))))

(declare-fun mapIsEmpty!19653 () Bool)

(assert (=> mapIsEmpty!19653 mapRes!19653))

(declare-fun b!449091 () Bool)

(declare-fun res!267146 () Bool)

(assert (=> b!449091 (=> (not res!267146) (not e!263323))))

(assert (=> b!449091 (= res!267146 (bvsle from!863 i!563))))

(declare-fun b!449092 () Bool)

(assert (=> b!449092 (= e!263321 e!263323)))

(declare-fun res!267148 () Bool)

(assert (=> b!449092 (=> (not res!267148) (not e!263323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27831 (_ BitVec 32)) Bool)

(assert (=> b!449092 (= res!267148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204116 mask!1025))))

(assert (=> b!449092 (= lt!204116 (array!27832 (store (arr!13361 _keys!709) i!563 k0!794) (size!13714 _keys!709)))))

(declare-fun b!449093 () Bool)

(declare-fun res!267141 () Bool)

(assert (=> b!449093 (=> (not res!267141) (not e!263323))))

(assert (=> b!449093 (= res!267141 (arrayNoDuplicates!0 lt!204116 #b00000000000000000000000000000000 Nil!8016))))

(declare-fun b!449094 () Bool)

(declare-fun res!267139 () Bool)

(assert (=> b!449094 (=> (not res!267139) (not e!263321))))

(assert (=> b!449094 (= res!267139 (and (= (size!13715 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13714 _keys!709) (size!13715 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!449095 () Bool)

(assert (=> b!449095 (= e!263319 tp_is_empty!12013)))

(declare-fun b!449096 () Bool)

(declare-fun res!267145 () Bool)

(assert (=> b!449096 (=> (not res!267145) (not e!263321))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!449096 (= res!267145 (validKeyInArray!0 k0!794))))

(declare-fun b!449097 () Bool)

(declare-fun res!267140 () Bool)

(assert (=> b!449097 (=> (not res!267140) (not e!263321))))

(assert (=> b!449097 (= res!267140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!449098 () Bool)

(assert (=> b!449098 (= e!263322 tp_is_empty!12013)))

(declare-fun b!449099 () Bool)

(declare-fun res!267149 () Bool)

(assert (=> b!449099 (=> (not res!267149) (not e!263321))))

(assert (=> b!449099 (= res!267149 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13714 _keys!709))))))

(declare-fun b!449100 () Bool)

(declare-fun res!267143 () Bool)

(assert (=> b!449100 (=> (not res!267143) (not e!263321))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!449100 (= res!267143 (validMask!0 mask!1025))))

(assert (= (and start!40650 res!267150) b!449100))

(assert (= (and b!449100 res!267143) b!449094))

(assert (= (and b!449094 res!267139) b!449097))

(assert (= (and b!449097 res!267140) b!449089))

(assert (= (and b!449089 res!267142) b!449099))

(assert (= (and b!449099 res!267149) b!449096))

(assert (= (and b!449096 res!267145) b!449090))

(assert (= (and b!449090 res!267147) b!449087))

(assert (= (and b!449087 res!267144) b!449092))

(assert (= (and b!449092 res!267148) b!449093))

(assert (= (and b!449093 res!267141) b!449091))

(assert (= (and b!449091 res!267146) b!449086))

(assert (= (and b!449088 condMapEmpty!19653) mapIsEmpty!19653))

(assert (= (and b!449088 (not condMapEmpty!19653)) mapNonEmpty!19653))

(get-info :version)

(assert (= (and mapNonEmpty!19653 ((_ is ValueCellFull!5663) mapValue!19653)) b!449098))

(assert (= (and b!449088 ((_ is ValueCellFull!5663) mapDefault!19653)) b!449095))

(assert (= start!40650 b!449088))

(declare-fun m!432871 () Bool)

(assert (=> b!449090 m!432871))

(declare-fun m!432873 () Bool)

(assert (=> b!449089 m!432873))

(declare-fun m!432875 () Bool)

(assert (=> mapNonEmpty!19653 m!432875))

(declare-fun m!432877 () Bool)

(assert (=> b!449086 m!432877))

(declare-fun m!432879 () Bool)

(assert (=> b!449086 m!432879))

(declare-fun m!432881 () Bool)

(assert (=> b!449086 m!432881))

(declare-fun m!432883 () Bool)

(assert (=> b!449096 m!432883))

(declare-fun m!432885 () Bool)

(assert (=> b!449087 m!432885))

(declare-fun m!432887 () Bool)

(assert (=> b!449100 m!432887))

(declare-fun m!432889 () Bool)

(assert (=> b!449092 m!432889))

(declare-fun m!432891 () Bool)

(assert (=> b!449092 m!432891))

(declare-fun m!432893 () Bool)

(assert (=> start!40650 m!432893))

(declare-fun m!432895 () Bool)

(assert (=> start!40650 m!432895))

(declare-fun m!432897 () Bool)

(assert (=> b!449097 m!432897))

(declare-fun m!432899 () Bool)

(assert (=> b!449093 m!432899))

(check-sat b_and!18657 (not b!449096) (not b!449097) (not b_next!10675) tp_is_empty!12013 (not start!40650) (not b!449086) (not b!449093) (not b!449089) (not b!449087) (not b!449100) (not b!449092) (not mapNonEmpty!19653))
(check-sat b_and!18657 (not b_next!10675))
