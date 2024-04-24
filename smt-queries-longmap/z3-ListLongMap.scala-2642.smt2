; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39656 () Bool)

(assert start!39656)

(declare-fun b_free!9937 () Bool)

(declare-fun b_next!9937 () Bool)

(assert (=> start!39656 (= b_free!9937 (not b_next!9937))))

(declare-fun tp!35340 () Bool)

(declare-fun b_and!17607 () Bool)

(assert (=> start!39656 (= tp!35340 b_and!17607)))

(declare-fun b!425855 () Bool)

(declare-fun res!249460 () Bool)

(declare-fun e!252734 () Bool)

(assert (=> b!425855 (=> (not res!249460) (not e!252734))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26024 0))(
  ( (array!26025 (arr!12461 (Array (_ BitVec 32) (_ BitVec 64))) (size!12813 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26024)

(assert (=> b!425855 (= res!249460 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12813 _keys!709))))))

(declare-fun b!425856 () Bool)

(declare-fun res!249459 () Bool)

(assert (=> b!425856 (=> (not res!249459) (not e!252734))))

(declare-datatypes ((List!7247 0))(
  ( (Nil!7244) (Cons!7243 (h!8099 (_ BitVec 64)) (t!12683 List!7247)) )
))
(declare-fun arrayNoDuplicates!0 (array!26024 (_ BitVec 32) List!7247) Bool)

(assert (=> b!425856 (= res!249459 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7244))))

(declare-fun b!425857 () Bool)

(declare-fun res!249471 () Bool)

(assert (=> b!425857 (=> (not res!249471) (not e!252734))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26024 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!425857 (= res!249471 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!425858 () Bool)

(declare-fun res!249463 () Bool)

(assert (=> b!425858 (=> (not res!249463) (not e!252734))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26024 (_ BitVec 32)) Bool)

(assert (=> b!425858 (= res!249463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!425859 () Bool)

(declare-fun e!252735 () Bool)

(assert (=> b!425859 (= e!252735 (not true))))

(declare-datatypes ((V!15891 0))(
  ( (V!15892 (val!5589 Int)) )
))
(declare-datatypes ((ValueCell!5201 0))(
  ( (ValueCellFull!5201 (v!7837 V!15891)) (EmptyCell!5201) )
))
(declare-datatypes ((array!26026 0))(
  ( (array!26027 (arr!12462 (Array (_ BitVec 32) ValueCell!5201)) (size!12814 (_ BitVec 32))) )
))
(declare-fun lt!194815 () array!26026)

(declare-fun lt!194816 () array!26024)

(declare-fun minValue!515 () V!15891)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun _values!549 () array!26026)

(declare-fun zeroValue!515 () V!15891)

(declare-fun v!412 () V!15891)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7238 0))(
  ( (tuple2!7239 (_1!3630 (_ BitVec 64)) (_2!3630 V!15891)) )
))
(declare-datatypes ((List!7248 0))(
  ( (Nil!7245) (Cons!7244 (h!8100 tuple2!7238) (t!12684 List!7248)) )
))
(declare-datatypes ((ListLongMap!6153 0))(
  ( (ListLongMap!6154 (toList!3092 List!7248)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1338 (array!26024 array!26026 (_ BitVec 32) (_ BitVec 32) V!15891 V!15891 (_ BitVec 32) Int) ListLongMap!6153)

(declare-fun +!1308 (ListLongMap!6153 tuple2!7238) ListLongMap!6153)

(assert (=> b!425859 (= (getCurrentListMapNoExtraKeys!1338 lt!194816 lt!194815 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1308 (getCurrentListMapNoExtraKeys!1338 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7239 k0!794 v!412)))))

(declare-datatypes ((Unit!12491 0))(
  ( (Unit!12492) )
))
(declare-fun lt!194814 () Unit!12491)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!492 (array!26024 array!26026 (_ BitVec 32) (_ BitVec 32) V!15891 V!15891 (_ BitVec 32) (_ BitVec 64) V!15891 (_ BitVec 32) Int) Unit!12491)

(assert (=> b!425859 (= lt!194814 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!492 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!425860 () Bool)

(declare-fun e!252739 () Bool)

(assert (=> b!425860 (= e!252734 e!252739)))

(declare-fun res!249468 () Bool)

(assert (=> b!425860 (=> (not res!249468) (not e!252739))))

(assert (=> b!425860 (= res!249468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194816 mask!1025))))

(assert (=> b!425860 (= lt!194816 (array!26025 (store (arr!12461 _keys!709) i!563 k0!794) (size!12813 _keys!709)))))

(declare-fun b!425861 () Bool)

(declare-fun res!249461 () Bool)

(assert (=> b!425861 (=> (not res!249461) (not e!252734))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!425861 (= res!249461 (validKeyInArray!0 k0!794))))

(declare-fun b!425862 () Bool)

(declare-fun res!249465 () Bool)

(assert (=> b!425862 (=> (not res!249465) (not e!252739))))

(assert (=> b!425862 (= res!249465 (arrayNoDuplicates!0 lt!194816 #b00000000000000000000000000000000 Nil!7244))))

(declare-fun b!425863 () Bool)

(declare-fun res!249469 () Bool)

(assert (=> b!425863 (=> (not res!249469) (not e!252734))))

(assert (=> b!425863 (= res!249469 (and (= (size!12814 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12813 _keys!709) (size!12814 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!425864 () Bool)

(declare-fun e!252737 () Bool)

(declare-fun tp_is_empty!11089 () Bool)

(assert (=> b!425864 (= e!252737 tp_is_empty!11089)))

(declare-fun mapIsEmpty!18255 () Bool)

(declare-fun mapRes!18255 () Bool)

(assert (=> mapIsEmpty!18255 mapRes!18255))

(declare-fun res!249470 () Bool)

(assert (=> start!39656 (=> (not res!249470) (not e!252734))))

(assert (=> start!39656 (= res!249470 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12813 _keys!709))))))

(assert (=> start!39656 e!252734))

(assert (=> start!39656 tp_is_empty!11089))

(assert (=> start!39656 tp!35340))

(assert (=> start!39656 true))

(declare-fun e!252738 () Bool)

(declare-fun array_inv!9152 (array!26026) Bool)

(assert (=> start!39656 (and (array_inv!9152 _values!549) e!252738)))

(declare-fun array_inv!9153 (array!26024) Bool)

(assert (=> start!39656 (array_inv!9153 _keys!709)))

(declare-fun b!425854 () Bool)

(declare-fun res!249466 () Bool)

(assert (=> b!425854 (=> (not res!249466) (not e!252734))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!425854 (= res!249466 (validMask!0 mask!1025))))

(declare-fun b!425865 () Bool)

(declare-fun res!249467 () Bool)

(assert (=> b!425865 (=> (not res!249467) (not e!252734))))

(assert (=> b!425865 (= res!249467 (or (= (select (arr!12461 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12461 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!425866 () Bool)

(declare-fun res!249464 () Bool)

(assert (=> b!425866 (=> (not res!249464) (not e!252739))))

(assert (=> b!425866 (= res!249464 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!18255 () Bool)

(declare-fun tp!35339 () Bool)

(declare-fun e!252736 () Bool)

(assert (=> mapNonEmpty!18255 (= mapRes!18255 (and tp!35339 e!252736))))

(declare-fun mapValue!18255 () ValueCell!5201)

(declare-fun mapKey!18255 () (_ BitVec 32))

(declare-fun mapRest!18255 () (Array (_ BitVec 32) ValueCell!5201))

(assert (=> mapNonEmpty!18255 (= (arr!12462 _values!549) (store mapRest!18255 mapKey!18255 mapValue!18255))))

(declare-fun b!425867 () Bool)

(assert (=> b!425867 (= e!252738 (and e!252737 mapRes!18255))))

(declare-fun condMapEmpty!18255 () Bool)

(declare-fun mapDefault!18255 () ValueCell!5201)

(assert (=> b!425867 (= condMapEmpty!18255 (= (arr!12462 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5201)) mapDefault!18255)))))

(declare-fun b!425868 () Bool)

(assert (=> b!425868 (= e!252736 tp_is_empty!11089)))

(declare-fun b!425869 () Bool)

(assert (=> b!425869 (= e!252739 e!252735)))

(declare-fun res!249462 () Bool)

(assert (=> b!425869 (=> (not res!249462) (not e!252735))))

(assert (=> b!425869 (= res!249462 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!194813 () ListLongMap!6153)

(assert (=> b!425869 (= lt!194813 (getCurrentListMapNoExtraKeys!1338 lt!194816 lt!194815 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!425869 (= lt!194815 (array!26027 (store (arr!12462 _values!549) i!563 (ValueCellFull!5201 v!412)) (size!12814 _values!549)))))

(declare-fun lt!194817 () ListLongMap!6153)

(assert (=> b!425869 (= lt!194817 (getCurrentListMapNoExtraKeys!1338 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!39656 res!249470) b!425854))

(assert (= (and b!425854 res!249466) b!425863))

(assert (= (and b!425863 res!249469) b!425858))

(assert (= (and b!425858 res!249463) b!425856))

(assert (= (and b!425856 res!249459) b!425855))

(assert (= (and b!425855 res!249460) b!425861))

(assert (= (and b!425861 res!249461) b!425865))

(assert (= (and b!425865 res!249467) b!425857))

(assert (= (and b!425857 res!249471) b!425860))

(assert (= (and b!425860 res!249468) b!425862))

(assert (= (and b!425862 res!249465) b!425866))

(assert (= (and b!425866 res!249464) b!425869))

(assert (= (and b!425869 res!249462) b!425859))

(assert (= (and b!425867 condMapEmpty!18255) mapIsEmpty!18255))

(assert (= (and b!425867 (not condMapEmpty!18255)) mapNonEmpty!18255))

(get-info :version)

(assert (= (and mapNonEmpty!18255 ((_ is ValueCellFull!5201) mapValue!18255)) b!425868))

(assert (= (and b!425867 ((_ is ValueCellFull!5201) mapDefault!18255)) b!425864))

(assert (= start!39656 b!425867))

(declare-fun m!414923 () Bool)

(assert (=> start!39656 m!414923))

(declare-fun m!414925 () Bool)

(assert (=> start!39656 m!414925))

(declare-fun m!414927 () Bool)

(assert (=> b!425865 m!414927))

(declare-fun m!414929 () Bool)

(assert (=> b!425859 m!414929))

(declare-fun m!414931 () Bool)

(assert (=> b!425859 m!414931))

(assert (=> b!425859 m!414931))

(declare-fun m!414933 () Bool)

(assert (=> b!425859 m!414933))

(declare-fun m!414935 () Bool)

(assert (=> b!425859 m!414935))

(declare-fun m!414937 () Bool)

(assert (=> b!425858 m!414937))

(declare-fun m!414939 () Bool)

(assert (=> mapNonEmpty!18255 m!414939))

(declare-fun m!414941 () Bool)

(assert (=> b!425862 m!414941))

(declare-fun m!414943 () Bool)

(assert (=> b!425856 m!414943))

(declare-fun m!414945 () Bool)

(assert (=> b!425860 m!414945))

(declare-fun m!414947 () Bool)

(assert (=> b!425860 m!414947))

(declare-fun m!414949 () Bool)

(assert (=> b!425857 m!414949))

(declare-fun m!414951 () Bool)

(assert (=> b!425861 m!414951))

(declare-fun m!414953 () Bool)

(assert (=> b!425869 m!414953))

(declare-fun m!414955 () Bool)

(assert (=> b!425869 m!414955))

(declare-fun m!414957 () Bool)

(assert (=> b!425869 m!414957))

(declare-fun m!414959 () Bool)

(assert (=> b!425854 m!414959))

(check-sat (not b!425869) (not start!39656) tp_is_empty!11089 (not b!425859) (not mapNonEmpty!18255) (not b!425861) (not b!425857) (not b!425854) (not b!425860) (not b_next!9937) b_and!17607 (not b!425858) (not b!425856) (not b!425862))
(check-sat b_and!17607 (not b_next!9937))
