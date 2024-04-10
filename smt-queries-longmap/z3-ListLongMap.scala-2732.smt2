; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40212 () Bool)

(assert start!40212)

(declare-fun b_free!10479 () Bool)

(declare-fun b_next!10479 () Bool)

(assert (=> start!40212 (= b_free!10479 (not b_next!10479))))

(declare-fun tp!36966 () Bool)

(declare-fun b_and!18447 () Bool)

(assert (=> start!40212 (= tp!36966 b_and!18447)))

(declare-fun mapNonEmpty!19068 () Bool)

(declare-fun mapRes!19068 () Bool)

(declare-fun tp!36965 () Bool)

(declare-fun e!259676 () Bool)

(assert (=> mapNonEmpty!19068 (= mapRes!19068 (and tp!36965 e!259676))))

(declare-datatypes ((V!16613 0))(
  ( (V!16614 (val!5860 Int)) )
))
(declare-datatypes ((ValueCell!5472 0))(
  ( (ValueCellFull!5472 (v!8107 V!16613)) (EmptyCell!5472) )
))
(declare-datatypes ((array!27075 0))(
  ( (array!27076 (arr!12987 (Array (_ BitVec 32) ValueCell!5472)) (size!13339 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27075)

(declare-fun mapKey!19068 () (_ BitVec 32))

(declare-fun mapValue!19068 () ValueCell!5472)

(declare-fun mapRest!19068 () (Array (_ BitVec 32) ValueCell!5472))

(assert (=> mapNonEmpty!19068 (= (arr!12987 _values!549) (store mapRest!19068 mapKey!19068 mapValue!19068))))

(declare-fun b!440852 () Bool)

(declare-fun res!260836 () Bool)

(declare-fun e!259673 () Bool)

(assert (=> b!440852 (=> (not res!260836) (not e!259673))))

(declare-datatypes ((array!27077 0))(
  ( (array!27078 (arr!12988 (Array (_ BitVec 32) (_ BitVec 64))) (size!13340 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27077)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27077 (_ BitVec 32)) Bool)

(assert (=> b!440852 (= res!260836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!440853 () Bool)

(declare-fun e!259671 () Bool)

(declare-fun e!259675 () Bool)

(assert (=> b!440853 (= e!259671 e!259675)))

(declare-fun res!260835 () Bool)

(assert (=> b!440853 (=> (not res!260835) (not e!259675))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!440853 (= res!260835 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202713 () array!27075)

(declare-datatypes ((tuple2!7792 0))(
  ( (tuple2!7793 (_1!3907 (_ BitVec 64)) (_2!3907 V!16613)) )
))
(declare-datatypes ((List!7787 0))(
  ( (Nil!7784) (Cons!7783 (h!8639 tuple2!7792) (t!13543 List!7787)) )
))
(declare-datatypes ((ListLongMap!6705 0))(
  ( (ListLongMap!6706 (toList!3368 List!7787)) )
))
(declare-fun lt!202712 () ListLongMap!6705)

(declare-fun minValue!515 () V!16613)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16613)

(declare-fun lt!202711 () array!27077)

(declare-fun getCurrentListMapNoExtraKeys!1557 (array!27077 array!27075 (_ BitVec 32) (_ BitVec 32) V!16613 V!16613 (_ BitVec 32) Int) ListLongMap!6705)

(assert (=> b!440853 (= lt!202712 (getCurrentListMapNoExtraKeys!1557 lt!202711 lt!202713 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16613)

(assert (=> b!440853 (= lt!202713 (array!27076 (store (arr!12987 _values!549) i!563 (ValueCellFull!5472 v!412)) (size!13339 _values!549)))))

(declare-fun lt!202714 () ListLongMap!6705)

(assert (=> b!440853 (= lt!202714 (getCurrentListMapNoExtraKeys!1557 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!440854 () Bool)

(declare-fun e!259677 () Bool)

(declare-fun tp_is_empty!11631 () Bool)

(assert (=> b!440854 (= e!259677 tp_is_empty!11631)))

(declare-fun b!440855 () Bool)

(assert (=> b!440855 (= e!259673 e!259671)))

(declare-fun res!260839 () Bool)

(assert (=> b!440855 (=> (not res!260839) (not e!259671))))

(assert (=> b!440855 (= res!260839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202711 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!440855 (= lt!202711 (array!27078 (store (arr!12988 _keys!709) i!563 k0!794) (size!13340 _keys!709)))))

(declare-fun mapIsEmpty!19068 () Bool)

(assert (=> mapIsEmpty!19068 mapRes!19068))

(declare-fun res!260838 () Bool)

(assert (=> start!40212 (=> (not res!260838) (not e!259673))))

(assert (=> start!40212 (= res!260838 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13340 _keys!709))))))

(assert (=> start!40212 e!259673))

(assert (=> start!40212 tp_is_empty!11631))

(assert (=> start!40212 tp!36966))

(assert (=> start!40212 true))

(declare-fun e!259674 () Bool)

(declare-fun array_inv!9424 (array!27075) Bool)

(assert (=> start!40212 (and (array_inv!9424 _values!549) e!259674)))

(declare-fun array_inv!9425 (array!27077) Bool)

(assert (=> start!40212 (array_inv!9425 _keys!709)))

(declare-fun b!440856 () Bool)

(declare-fun res!260841 () Bool)

(assert (=> b!440856 (=> (not res!260841) (not e!259673))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!440856 (= res!260841 (validKeyInArray!0 k0!794))))

(declare-fun b!440857 () Bool)

(declare-fun res!260842 () Bool)

(assert (=> b!440857 (=> (not res!260842) (not e!259673))))

(assert (=> b!440857 (= res!260842 (and (= (size!13339 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13340 _keys!709) (size!13339 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!440858 () Bool)

(declare-fun res!260833 () Bool)

(assert (=> b!440858 (=> (not res!260833) (not e!259673))))

(assert (=> b!440858 (= res!260833 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13340 _keys!709))))))

(declare-fun b!440859 () Bool)

(assert (=> b!440859 (= e!259674 (and e!259677 mapRes!19068))))

(declare-fun condMapEmpty!19068 () Bool)

(declare-fun mapDefault!19068 () ValueCell!5472)

(assert (=> b!440859 (= condMapEmpty!19068 (= (arr!12987 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5472)) mapDefault!19068)))))

(declare-fun b!440860 () Bool)

(assert (=> b!440860 (= e!259675 (not true))))

(declare-fun +!1504 (ListLongMap!6705 tuple2!7792) ListLongMap!6705)

(assert (=> b!440860 (= (getCurrentListMapNoExtraKeys!1557 lt!202711 lt!202713 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1504 (getCurrentListMapNoExtraKeys!1557 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7793 k0!794 v!412)))))

(declare-datatypes ((Unit!13112 0))(
  ( (Unit!13113) )
))
(declare-fun lt!202715 () Unit!13112)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!673 (array!27077 array!27075 (_ BitVec 32) (_ BitVec 32) V!16613 V!16613 (_ BitVec 32) (_ BitVec 64) V!16613 (_ BitVec 32) Int) Unit!13112)

(assert (=> b!440860 (= lt!202715 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!673 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!440861 () Bool)

(declare-fun res!260832 () Bool)

(assert (=> b!440861 (=> (not res!260832) (not e!259673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!440861 (= res!260832 (validMask!0 mask!1025))))

(declare-fun b!440862 () Bool)

(declare-fun res!260837 () Bool)

(assert (=> b!440862 (=> (not res!260837) (not e!259673))))

(declare-fun arrayContainsKey!0 (array!27077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!440862 (= res!260837 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!440863 () Bool)

(declare-fun res!260834 () Bool)

(assert (=> b!440863 (=> (not res!260834) (not e!259671))))

(declare-datatypes ((List!7788 0))(
  ( (Nil!7785) (Cons!7784 (h!8640 (_ BitVec 64)) (t!13544 List!7788)) )
))
(declare-fun arrayNoDuplicates!0 (array!27077 (_ BitVec 32) List!7788) Bool)

(assert (=> b!440863 (= res!260834 (arrayNoDuplicates!0 lt!202711 #b00000000000000000000000000000000 Nil!7785))))

(declare-fun b!440864 () Bool)

(assert (=> b!440864 (= e!259676 tp_is_empty!11631)))

(declare-fun b!440865 () Bool)

(declare-fun res!260843 () Bool)

(assert (=> b!440865 (=> (not res!260843) (not e!259673))))

(assert (=> b!440865 (= res!260843 (or (= (select (arr!12988 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12988 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!440866 () Bool)

(declare-fun res!260840 () Bool)

(assert (=> b!440866 (=> (not res!260840) (not e!259673))))

(assert (=> b!440866 (= res!260840 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7785))))

(declare-fun b!440867 () Bool)

(declare-fun res!260844 () Bool)

(assert (=> b!440867 (=> (not res!260844) (not e!259671))))

(assert (=> b!440867 (= res!260844 (bvsle from!863 i!563))))

(assert (= (and start!40212 res!260838) b!440861))

(assert (= (and b!440861 res!260832) b!440857))

(assert (= (and b!440857 res!260842) b!440852))

(assert (= (and b!440852 res!260836) b!440866))

(assert (= (and b!440866 res!260840) b!440858))

(assert (= (and b!440858 res!260833) b!440856))

(assert (= (and b!440856 res!260841) b!440865))

(assert (= (and b!440865 res!260843) b!440862))

(assert (= (and b!440862 res!260837) b!440855))

(assert (= (and b!440855 res!260839) b!440863))

(assert (= (and b!440863 res!260834) b!440867))

(assert (= (and b!440867 res!260844) b!440853))

(assert (= (and b!440853 res!260835) b!440860))

(assert (= (and b!440859 condMapEmpty!19068) mapIsEmpty!19068))

(assert (= (and b!440859 (not condMapEmpty!19068)) mapNonEmpty!19068))

(get-info :version)

(assert (= (and mapNonEmpty!19068 ((_ is ValueCellFull!5472) mapValue!19068)) b!440864))

(assert (= (and b!440859 ((_ is ValueCellFull!5472) mapDefault!19068)) b!440854))

(assert (= start!40212 b!440859))

(declare-fun m!427811 () Bool)

(assert (=> b!440852 m!427811))

(declare-fun m!427813 () Bool)

(assert (=> b!440861 m!427813))

(declare-fun m!427815 () Bool)

(assert (=> start!40212 m!427815))

(declare-fun m!427817 () Bool)

(assert (=> start!40212 m!427817))

(declare-fun m!427819 () Bool)

(assert (=> b!440865 m!427819))

(declare-fun m!427821 () Bool)

(assert (=> b!440855 m!427821))

(declare-fun m!427823 () Bool)

(assert (=> b!440855 m!427823))

(declare-fun m!427825 () Bool)

(assert (=> b!440866 m!427825))

(declare-fun m!427827 () Bool)

(assert (=> b!440860 m!427827))

(declare-fun m!427829 () Bool)

(assert (=> b!440860 m!427829))

(assert (=> b!440860 m!427829))

(declare-fun m!427831 () Bool)

(assert (=> b!440860 m!427831))

(declare-fun m!427833 () Bool)

(assert (=> b!440860 m!427833))

(declare-fun m!427835 () Bool)

(assert (=> b!440863 m!427835))

(declare-fun m!427837 () Bool)

(assert (=> b!440856 m!427837))

(declare-fun m!427839 () Bool)

(assert (=> mapNonEmpty!19068 m!427839))

(declare-fun m!427841 () Bool)

(assert (=> b!440853 m!427841))

(declare-fun m!427843 () Bool)

(assert (=> b!440853 m!427843))

(declare-fun m!427845 () Bool)

(assert (=> b!440853 m!427845))

(declare-fun m!427847 () Bool)

(assert (=> b!440862 m!427847))

(check-sat (not b!440862) (not mapNonEmpty!19068) (not b_next!10479) (not b!440856) (not b!440853) b_and!18447 (not b!440866) (not start!40212) (not b!440861) (not b!440860) (not b!440852) (not b!440855) (not b!440863) tp_is_empty!11631)
(check-sat b_and!18447 (not b_next!10479))
