; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40202 () Bool)

(assert start!40202)

(declare-fun b_free!10483 () Bool)

(declare-fun b_next!10483 () Bool)

(assert (=> start!40202 (= b_free!10483 (not b_next!10483))))

(declare-fun tp!36977 () Bool)

(declare-fun b_and!18465 () Bool)

(assert (=> start!40202 (= tp!36977 b_and!18465)))

(declare-fun b!440899 () Bool)

(declare-fun e!259682 () Bool)

(declare-fun tp_is_empty!11635 () Bool)

(assert (=> b!440899 (= e!259682 tp_is_empty!11635)))

(declare-fun b!440900 () Bool)

(declare-fun e!259687 () Bool)

(assert (=> b!440900 (= e!259687 tp_is_empty!11635)))

(declare-fun mapNonEmpty!19074 () Bool)

(declare-fun mapRes!19074 () Bool)

(declare-fun tp!36978 () Bool)

(assert (=> mapNonEmpty!19074 (= mapRes!19074 (and tp!36978 e!259682))))

(declare-datatypes ((V!16619 0))(
  ( (V!16620 (val!5862 Int)) )
))
(declare-datatypes ((ValueCell!5474 0))(
  ( (ValueCellFull!5474 (v!8110 V!16619)) (EmptyCell!5474) )
))
(declare-fun mapValue!19074 () ValueCell!5474)

(declare-datatypes ((array!27090 0))(
  ( (array!27091 (arr!12994 (Array (_ BitVec 32) ValueCell!5474)) (size!13346 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27090)

(declare-fun mapKey!19074 () (_ BitVec 32))

(declare-fun mapRest!19074 () (Array (_ BitVec 32) ValueCell!5474))

(assert (=> mapNonEmpty!19074 (= (arr!12994 _values!549) (store mapRest!19074 mapKey!19074 mapValue!19074))))

(declare-fun b!440901 () Bool)

(declare-fun e!259684 () Bool)

(assert (=> b!440901 (= e!259684 (and e!259687 mapRes!19074))))

(declare-fun condMapEmpty!19074 () Bool)

(declare-fun mapDefault!19074 () ValueCell!5474)

(assert (=> b!440901 (= condMapEmpty!19074 (= (arr!12994 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5474)) mapDefault!19074)))))

(declare-fun b!440902 () Bool)

(declare-fun e!259681 () Bool)

(declare-fun e!259683 () Bool)

(assert (=> b!440902 (= e!259681 e!259683)))

(declare-fun res!260909 () Bool)

(assert (=> b!440902 (=> (not res!260909) (not e!259683))))

(declare-datatypes ((array!27092 0))(
  ( (array!27093 (arr!12995 (Array (_ BitVec 32) (_ BitVec 64))) (size!13347 (_ BitVec 32))) )
))
(declare-fun lt!202762 () array!27092)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27092 (_ BitVec 32)) Bool)

(assert (=> b!440902 (= res!260909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202762 mask!1025))))

(declare-fun _keys!709 () array!27092)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!440902 (= lt!202762 (array!27093 (store (arr!12995 _keys!709) i!563 k0!794) (size!13347 _keys!709)))))

(declare-fun b!440903 () Bool)

(declare-fun res!260908 () Bool)

(assert (=> b!440903 (=> (not res!260908) (not e!259681))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!440903 (= res!260908 (validKeyInArray!0 k0!794))))

(declare-fun b!440904 () Bool)

(declare-fun res!260912 () Bool)

(assert (=> b!440904 (=> (not res!260912) (not e!259683))))

(declare-datatypes ((List!7689 0))(
  ( (Nil!7686) (Cons!7685 (h!8541 (_ BitVec 64)) (t!13437 List!7689)) )
))
(declare-fun arrayNoDuplicates!0 (array!27092 (_ BitVec 32) List!7689) Bool)

(assert (=> b!440904 (= res!260912 (arrayNoDuplicates!0 lt!202762 #b00000000000000000000000000000000 Nil!7686))))

(declare-fun b!440905 () Bool)

(declare-fun res!260910 () Bool)

(assert (=> b!440905 (=> (not res!260910) (not e!259681))))

(assert (=> b!440905 (= res!260910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!19074 () Bool)

(assert (=> mapIsEmpty!19074 mapRes!19074))

(declare-fun b!440906 () Bool)

(declare-fun e!259685 () Bool)

(assert (=> b!440906 (= e!259685 (not true))))

(declare-fun minValue!515 () V!16619)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16619)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!202763 () array!27090)

(declare-fun defaultEntry!557 () Int)

(declare-fun v!412 () V!16619)

(declare-datatypes ((tuple2!7700 0))(
  ( (tuple2!7701 (_1!3861 (_ BitVec 64)) (_2!3861 V!16619)) )
))
(declare-datatypes ((List!7690 0))(
  ( (Nil!7687) (Cons!7686 (h!8542 tuple2!7700) (t!13438 List!7690)) )
))
(declare-datatypes ((ListLongMap!6615 0))(
  ( (ListLongMap!6616 (toList!3323 List!7690)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1556 (array!27092 array!27090 (_ BitVec 32) (_ BitVec 32) V!16619 V!16619 (_ BitVec 32) Int) ListLongMap!6615)

(declare-fun +!1513 (ListLongMap!6615 tuple2!7700) ListLongMap!6615)

(assert (=> b!440906 (= (getCurrentListMapNoExtraKeys!1556 lt!202762 lt!202763 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1513 (getCurrentListMapNoExtraKeys!1556 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7701 k0!794 v!412)))))

(declare-datatypes ((Unit!13101 0))(
  ( (Unit!13102) )
))
(declare-fun lt!202764 () Unit!13101)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!673 (array!27092 array!27090 (_ BitVec 32) (_ BitVec 32) V!16619 V!16619 (_ BitVec 32) (_ BitVec 64) V!16619 (_ BitVec 32) Int) Unit!13101)

(assert (=> b!440906 (= lt!202764 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!673 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!440907 () Bool)

(declare-fun res!260911 () Bool)

(assert (=> b!440907 (=> (not res!260911) (not e!259683))))

(assert (=> b!440907 (= res!260911 (bvsle from!863 i!563))))

(declare-fun b!440908 () Bool)

(declare-fun res!260919 () Bool)

(assert (=> b!440908 (=> (not res!260919) (not e!259681))))

(assert (=> b!440908 (= res!260919 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13347 _keys!709))))))

(declare-fun res!260913 () Bool)

(assert (=> start!40202 (=> (not res!260913) (not e!259681))))

(assert (=> start!40202 (= res!260913 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13347 _keys!709))))))

(assert (=> start!40202 e!259681))

(assert (=> start!40202 tp_is_empty!11635))

(assert (=> start!40202 tp!36977))

(assert (=> start!40202 true))

(declare-fun array_inv!9496 (array!27090) Bool)

(assert (=> start!40202 (and (array_inv!9496 _values!549) e!259684)))

(declare-fun array_inv!9497 (array!27092) Bool)

(assert (=> start!40202 (array_inv!9497 _keys!709)))

(declare-fun b!440909 () Bool)

(declare-fun res!260915 () Bool)

(assert (=> b!440909 (=> (not res!260915) (not e!259681))))

(declare-fun arrayContainsKey!0 (array!27092 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!440909 (= res!260915 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!440910 () Bool)

(declare-fun res!260907 () Bool)

(assert (=> b!440910 (=> (not res!260907) (not e!259681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!440910 (= res!260907 (validMask!0 mask!1025))))

(declare-fun b!440911 () Bool)

(assert (=> b!440911 (= e!259683 e!259685)))

(declare-fun res!260914 () Bool)

(assert (=> b!440911 (=> (not res!260914) (not e!259685))))

(assert (=> b!440911 (= res!260914 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202760 () ListLongMap!6615)

(assert (=> b!440911 (= lt!202760 (getCurrentListMapNoExtraKeys!1556 lt!202762 lt!202763 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!440911 (= lt!202763 (array!27091 (store (arr!12994 _values!549) i!563 (ValueCellFull!5474 v!412)) (size!13346 _values!549)))))

(declare-fun lt!202761 () ListLongMap!6615)

(assert (=> b!440911 (= lt!202761 (getCurrentListMapNoExtraKeys!1556 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!440912 () Bool)

(declare-fun res!260918 () Bool)

(assert (=> b!440912 (=> (not res!260918) (not e!259681))))

(assert (=> b!440912 (= res!260918 (and (= (size!13346 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13347 _keys!709) (size!13346 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!440913 () Bool)

(declare-fun res!260917 () Bool)

(assert (=> b!440913 (=> (not res!260917) (not e!259681))))

(assert (=> b!440913 (= res!260917 (or (= (select (arr!12995 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12995 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!440914 () Bool)

(declare-fun res!260916 () Bool)

(assert (=> b!440914 (=> (not res!260916) (not e!259681))))

(assert (=> b!440914 (= res!260916 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7686))))

(assert (= (and start!40202 res!260913) b!440910))

(assert (= (and b!440910 res!260907) b!440912))

(assert (= (and b!440912 res!260918) b!440905))

(assert (= (and b!440905 res!260910) b!440914))

(assert (= (and b!440914 res!260916) b!440908))

(assert (= (and b!440908 res!260919) b!440903))

(assert (= (and b!440903 res!260908) b!440913))

(assert (= (and b!440913 res!260917) b!440909))

(assert (= (and b!440909 res!260915) b!440902))

(assert (= (and b!440902 res!260909) b!440904))

(assert (= (and b!440904 res!260912) b!440907))

(assert (= (and b!440907 res!260911) b!440911))

(assert (= (and b!440911 res!260914) b!440906))

(assert (= (and b!440901 condMapEmpty!19074) mapIsEmpty!19074))

(assert (= (and b!440901 (not condMapEmpty!19074)) mapNonEmpty!19074))

(get-info :version)

(assert (= (and mapNonEmpty!19074 ((_ is ValueCellFull!5474) mapValue!19074)) b!440899))

(assert (= (and b!440901 ((_ is ValueCellFull!5474) mapDefault!19074)) b!440900))

(assert (= start!40202 b!440901))

(declare-fun m!428105 () Bool)

(assert (=> b!440906 m!428105))

(declare-fun m!428107 () Bool)

(assert (=> b!440906 m!428107))

(assert (=> b!440906 m!428107))

(declare-fun m!428109 () Bool)

(assert (=> b!440906 m!428109))

(declare-fun m!428111 () Bool)

(assert (=> b!440906 m!428111))

(declare-fun m!428113 () Bool)

(assert (=> mapNonEmpty!19074 m!428113))

(declare-fun m!428115 () Bool)

(assert (=> b!440902 m!428115))

(declare-fun m!428117 () Bool)

(assert (=> b!440902 m!428117))

(declare-fun m!428119 () Bool)

(assert (=> b!440910 m!428119))

(declare-fun m!428121 () Bool)

(assert (=> b!440913 m!428121))

(declare-fun m!428123 () Bool)

(assert (=> b!440903 m!428123))

(declare-fun m!428125 () Bool)

(assert (=> b!440911 m!428125))

(declare-fun m!428127 () Bool)

(assert (=> b!440911 m!428127))

(declare-fun m!428129 () Bool)

(assert (=> b!440911 m!428129))

(declare-fun m!428131 () Bool)

(assert (=> b!440904 m!428131))

(declare-fun m!428133 () Bool)

(assert (=> b!440909 m!428133))

(declare-fun m!428135 () Bool)

(assert (=> b!440914 m!428135))

(declare-fun m!428137 () Bool)

(assert (=> start!40202 m!428137))

(declare-fun m!428139 () Bool)

(assert (=> start!40202 m!428139))

(declare-fun m!428141 () Bool)

(assert (=> b!440905 m!428141))

(check-sat (not b!440905) tp_is_empty!11635 (not b!440910) (not b_next!10483) (not mapNonEmpty!19074) (not b!440904) (not b!440914) (not start!40202) (not b!440902) b_and!18465 (not b!440909) (not b!440903) (not b!440911) (not b!440906))
(check-sat b_and!18465 (not b_next!10483))
