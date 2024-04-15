; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37062 () Bool)

(assert start!37062)

(declare-fun b_free!8203 () Bool)

(declare-fun b_next!8203 () Bool)

(assert (=> start!37062 (= b_free!8203 (not b_next!8203))))

(declare-fun tp!29324 () Bool)

(declare-fun b_and!15419 () Bool)

(assert (=> start!37062 (= tp!29324 b_and!15419)))

(declare-fun b!372733 () Bool)

(declare-fun res!209877 () Bool)

(declare-fun e!227272 () Bool)

(assert (=> b!372733 (=> (not res!209877) (not e!227272))))

(declare-datatypes ((V!12907 0))(
  ( (V!12908 (val!4470 Int)) )
))
(declare-datatypes ((tuple2!5902 0))(
  ( (tuple2!5903 (_1!2962 (_ BitVec 64)) (_2!2962 V!12907)) )
))
(declare-fun lt!170823 () tuple2!5902)

(declare-datatypes ((List!5740 0))(
  ( (Nil!5737) (Cons!5736 (h!6592 tuple2!5902) (t!10881 List!5740)) )
))
(declare-datatypes ((ListLongMap!4805 0))(
  ( (ListLongMap!4806 (toList!2418 List!5740)) )
))
(declare-fun lt!170826 () ListLongMap!4805)

(declare-fun lt!170829 () tuple2!5902)

(declare-fun lt!170831 () ListLongMap!4805)

(declare-fun +!786 (ListLongMap!4805 tuple2!5902) ListLongMap!4805)

(assert (=> b!372733 (= res!209877 (= lt!170826 (+!786 (+!786 lt!170831 lt!170823) lt!170829)))))

(declare-fun b!372734 () Bool)

(declare-fun res!209874 () Bool)

(declare-fun e!227267 () Bool)

(assert (=> b!372734 (=> (not res!209874) (not e!227267))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372734 (= res!209874 (validKeyInArray!0 k0!778))))

(declare-fun b!372735 () Bool)

(declare-fun res!209870 () Bool)

(declare-fun e!227266 () Bool)

(assert (=> b!372735 (=> (not res!209870) (not e!227266))))

(declare-datatypes ((array!21623 0))(
  ( (array!21624 (arr!10280 (Array (_ BitVec 32) (_ BitVec 64))) (size!10633 (_ BitVec 32))) )
))
(declare-fun lt!170828 () array!21623)

(declare-datatypes ((List!5741 0))(
  ( (Nil!5738) (Cons!5737 (h!6593 (_ BitVec 64)) (t!10882 List!5741)) )
))
(declare-fun arrayNoDuplicates!0 (array!21623 (_ BitVec 32) List!5741) Bool)

(assert (=> b!372735 (= res!209870 (arrayNoDuplicates!0 lt!170828 #b00000000000000000000000000000000 Nil!5738))))

(declare-fun b!372736 () Bool)

(declare-fun e!227273 () Bool)

(declare-fun e!227271 () Bool)

(declare-fun mapRes!14841 () Bool)

(assert (=> b!372736 (= e!227273 (and e!227271 mapRes!14841))))

(declare-fun condMapEmpty!14841 () Bool)

(declare-datatypes ((ValueCell!4082 0))(
  ( (ValueCellFull!4082 (v!6661 V!12907)) (EmptyCell!4082) )
))
(declare-datatypes ((array!21625 0))(
  ( (array!21626 (arr!10281 (Array (_ BitVec 32) ValueCell!4082)) (size!10634 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21625)

(declare-fun mapDefault!14841 () ValueCell!4082)

(assert (=> b!372736 (= condMapEmpty!14841 (= (arr!10281 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4082)) mapDefault!14841)))))

(declare-fun b!372737 () Bool)

(assert (=> b!372737 (= e!227267 e!227266)))

(declare-fun res!209879 () Bool)

(assert (=> b!372737 (=> (not res!209879) (not e!227266))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21623 (_ BitVec 32)) Bool)

(assert (=> b!372737 (= res!209879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170828 mask!970))))

(declare-fun _keys!658 () array!21623)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!372737 (= lt!170828 (array!21624 (store (arr!10280 _keys!658) i!548 k0!778) (size!10633 _keys!658)))))

(declare-fun mapNonEmpty!14841 () Bool)

(declare-fun tp!29325 () Bool)

(declare-fun e!227269 () Bool)

(assert (=> mapNonEmpty!14841 (= mapRes!14841 (and tp!29325 e!227269))))

(declare-fun mapKey!14841 () (_ BitVec 32))

(declare-fun mapValue!14841 () ValueCell!4082)

(declare-fun mapRest!14841 () (Array (_ BitVec 32) ValueCell!4082))

(assert (=> mapNonEmpty!14841 (= (arr!10281 _values!506) (store mapRest!14841 mapKey!14841 mapValue!14841))))

(declare-fun b!372739 () Bool)

(declare-fun tp_is_empty!8851 () Bool)

(assert (=> b!372739 (= e!227269 tp_is_empty!8851)))

(declare-fun b!372740 () Bool)

(declare-fun lt!170825 () ListLongMap!4805)

(declare-fun lt!170827 () ListLongMap!4805)

(assert (=> b!372740 (= e!227272 (= lt!170825 (+!786 (+!786 lt!170827 lt!170823) lt!170829)))))

(declare-fun b!372741 () Bool)

(declare-fun res!209872 () Bool)

(assert (=> b!372741 (=> (not res!209872) (not e!227267))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!372741 (= res!209872 (and (= (size!10634 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10633 _keys!658) (size!10634 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!372742 () Bool)

(declare-fun e!227268 () Bool)

(assert (=> b!372742 (= e!227266 (not e!227268))))

(declare-fun res!209878 () Bool)

(assert (=> b!372742 (=> res!209878 e!227268)))

(assert (=> b!372742 (= res!209878 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12907)

(declare-fun minValue!472 () V!12907)

(declare-fun getCurrentListMap!1844 (array!21623 array!21625 (_ BitVec 32) (_ BitVec 32) V!12907 V!12907 (_ BitVec 32) Int) ListLongMap!4805)

(assert (=> b!372742 (= lt!170826 (getCurrentListMap!1844 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170824 () array!21625)

(assert (=> b!372742 (= lt!170825 (getCurrentListMap!1844 lt!170828 lt!170824 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170832 () ListLongMap!4805)

(assert (=> b!372742 (and (= lt!170832 lt!170827) (= lt!170827 lt!170832))))

(declare-fun v!373 () V!12907)

(assert (=> b!372742 (= lt!170827 (+!786 lt!170831 (tuple2!5903 k0!778 v!373)))))

(declare-datatypes ((Unit!11448 0))(
  ( (Unit!11449) )
))
(declare-fun lt!170830 () Unit!11448)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!37 (array!21623 array!21625 (_ BitVec 32) (_ BitVec 32) V!12907 V!12907 (_ BitVec 32) (_ BitVec 64) V!12907 (_ BitVec 32) Int) Unit!11448)

(assert (=> b!372742 (= lt!170830 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!37 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!709 (array!21623 array!21625 (_ BitVec 32) (_ BitVec 32) V!12907 V!12907 (_ BitVec 32) Int) ListLongMap!4805)

(assert (=> b!372742 (= lt!170832 (getCurrentListMapNoExtraKeys!709 lt!170828 lt!170824 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372742 (= lt!170824 (array!21626 (store (arr!10281 _values!506) i!548 (ValueCellFull!4082 v!373)) (size!10634 _values!506)))))

(assert (=> b!372742 (= lt!170831 (getCurrentListMapNoExtraKeys!709 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!372743 () Bool)

(declare-fun res!209871 () Bool)

(assert (=> b!372743 (=> (not res!209871) (not e!227267))))

(declare-fun arrayContainsKey!0 (array!21623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372743 (= res!209871 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!372744 () Bool)

(declare-fun res!209876 () Bool)

(assert (=> b!372744 (=> (not res!209876) (not e!227267))))

(assert (=> b!372744 (= res!209876 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5738))))

(declare-fun b!372738 () Bool)

(assert (=> b!372738 (= e!227271 tp_is_empty!8851)))

(declare-fun res!209869 () Bool)

(assert (=> start!37062 (=> (not res!209869) (not e!227267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37062 (= res!209869 (validMask!0 mask!970))))

(assert (=> start!37062 e!227267))

(declare-fun array_inv!7588 (array!21625) Bool)

(assert (=> start!37062 (and (array_inv!7588 _values!506) e!227273)))

(assert (=> start!37062 tp!29324))

(assert (=> start!37062 true))

(assert (=> start!37062 tp_is_empty!8851))

(declare-fun array_inv!7589 (array!21623) Bool)

(assert (=> start!37062 (array_inv!7589 _keys!658)))

(declare-fun b!372745 () Bool)

(assert (=> b!372745 (= e!227268 true)))

(assert (=> b!372745 e!227272))

(declare-fun res!209867 () Bool)

(assert (=> b!372745 (=> (not res!209867) (not e!227272))))

(assert (=> b!372745 (= res!209867 (= lt!170825 (+!786 (+!786 lt!170832 lt!170823) lt!170829)))))

(assert (=> b!372745 (= lt!170829 (tuple2!5903 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!372745 (= lt!170823 (tuple2!5903 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!372746 () Bool)

(declare-fun res!209873 () Bool)

(assert (=> b!372746 (=> (not res!209873) (not e!227267))))

(assert (=> b!372746 (= res!209873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!372747 () Bool)

(declare-fun res!209875 () Bool)

(assert (=> b!372747 (=> (not res!209875) (not e!227267))))

(assert (=> b!372747 (= res!209875 (or (= (select (arr!10280 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10280 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!372748 () Bool)

(declare-fun res!209868 () Bool)

(assert (=> b!372748 (=> (not res!209868) (not e!227267))))

(assert (=> b!372748 (= res!209868 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10633 _keys!658))))))

(declare-fun mapIsEmpty!14841 () Bool)

(assert (=> mapIsEmpty!14841 mapRes!14841))

(assert (= (and start!37062 res!209869) b!372741))

(assert (= (and b!372741 res!209872) b!372746))

(assert (= (and b!372746 res!209873) b!372744))

(assert (= (and b!372744 res!209876) b!372748))

(assert (= (and b!372748 res!209868) b!372734))

(assert (= (and b!372734 res!209874) b!372747))

(assert (= (and b!372747 res!209875) b!372743))

(assert (= (and b!372743 res!209871) b!372737))

(assert (= (and b!372737 res!209879) b!372735))

(assert (= (and b!372735 res!209870) b!372742))

(assert (= (and b!372742 (not res!209878)) b!372745))

(assert (= (and b!372745 res!209867) b!372733))

(assert (= (and b!372733 res!209877) b!372740))

(assert (= (and b!372736 condMapEmpty!14841) mapIsEmpty!14841))

(assert (= (and b!372736 (not condMapEmpty!14841)) mapNonEmpty!14841))

(get-info :version)

(assert (= (and mapNonEmpty!14841 ((_ is ValueCellFull!4082) mapValue!14841)) b!372739))

(assert (= (and b!372736 ((_ is ValueCellFull!4082) mapDefault!14841)) b!372738))

(assert (= start!37062 b!372736))

(declare-fun m!368099 () Bool)

(assert (=> b!372735 m!368099))

(declare-fun m!368101 () Bool)

(assert (=> b!372745 m!368101))

(assert (=> b!372745 m!368101))

(declare-fun m!368103 () Bool)

(assert (=> b!372745 m!368103))

(declare-fun m!368105 () Bool)

(assert (=> mapNonEmpty!14841 m!368105))

(declare-fun m!368107 () Bool)

(assert (=> start!37062 m!368107))

(declare-fun m!368109 () Bool)

(assert (=> start!37062 m!368109))

(declare-fun m!368111 () Bool)

(assert (=> start!37062 m!368111))

(declare-fun m!368113 () Bool)

(assert (=> b!372743 m!368113))

(declare-fun m!368115 () Bool)

(assert (=> b!372737 m!368115))

(declare-fun m!368117 () Bool)

(assert (=> b!372737 m!368117))

(declare-fun m!368119 () Bool)

(assert (=> b!372742 m!368119))

(declare-fun m!368121 () Bool)

(assert (=> b!372742 m!368121))

(declare-fun m!368123 () Bool)

(assert (=> b!372742 m!368123))

(declare-fun m!368125 () Bool)

(assert (=> b!372742 m!368125))

(declare-fun m!368127 () Bool)

(assert (=> b!372742 m!368127))

(declare-fun m!368129 () Bool)

(assert (=> b!372742 m!368129))

(declare-fun m!368131 () Bool)

(assert (=> b!372742 m!368131))

(declare-fun m!368133 () Bool)

(assert (=> b!372747 m!368133))

(declare-fun m!368135 () Bool)

(assert (=> b!372733 m!368135))

(assert (=> b!372733 m!368135))

(declare-fun m!368137 () Bool)

(assert (=> b!372733 m!368137))

(declare-fun m!368139 () Bool)

(assert (=> b!372734 m!368139))

(declare-fun m!368141 () Bool)

(assert (=> b!372740 m!368141))

(assert (=> b!372740 m!368141))

(declare-fun m!368143 () Bool)

(assert (=> b!372740 m!368143))

(declare-fun m!368145 () Bool)

(assert (=> b!372744 m!368145))

(declare-fun m!368147 () Bool)

(assert (=> b!372746 m!368147))

(check-sat (not b!372735) (not b!372743) b_and!15419 (not b!372742) (not b!372740) (not b!372745) (not b!372733) (not start!37062) (not b!372744) (not b!372737) (not b_next!8203) (not mapNonEmpty!14841) tp_is_empty!8851 (not b!372734) (not b!372746))
(check-sat b_and!15419 (not b_next!8203))
