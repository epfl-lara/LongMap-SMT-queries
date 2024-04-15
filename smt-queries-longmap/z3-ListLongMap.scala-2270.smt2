; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37068 () Bool)

(assert start!37068)

(declare-fun b_free!8209 () Bool)

(declare-fun b_next!8209 () Bool)

(assert (=> start!37068 (= b_free!8209 (not b_next!8209))))

(declare-fun tp!29343 () Bool)

(declare-fun b_and!15425 () Bool)

(assert (=> start!37068 (= tp!29343 b_and!15425)))

(declare-fun b!372873 () Bool)

(declare-fun res!209988 () Bool)

(declare-fun e!227342 () Bool)

(assert (=> b!372873 (=> (not res!209988) (not e!227342))))

(declare-datatypes ((array!21635 0))(
  ( (array!21636 (arr!10286 (Array (_ BitVec 32) (_ BitVec 64))) (size!10639 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21635)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21635 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372873 (= res!209988 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!372874 () Bool)

(declare-fun res!209980 () Bool)

(assert (=> b!372874 (=> (not res!209980) (not e!227342))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372874 (= res!209980 (validKeyInArray!0 k0!778))))

(declare-fun b!372875 () Bool)

(declare-fun e!227336 () Bool)

(declare-fun tp_is_empty!8857 () Bool)

(assert (=> b!372875 (= e!227336 tp_is_empty!8857)))

(declare-fun b!372877 () Bool)

(declare-fun res!209987 () Bool)

(assert (=> b!372877 (=> (not res!209987) (not e!227342))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!372877 (= res!209987 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10639 _keys!658))))))

(declare-fun b!372878 () Bool)

(declare-fun res!209986 () Bool)

(assert (=> b!372878 (=> (not res!209986) (not e!227342))))

(assert (=> b!372878 (= res!209986 (or (= (select (arr!10286 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10286 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!372879 () Bool)

(declare-fun e!227339 () Bool)

(declare-fun e!227337 () Bool)

(assert (=> b!372879 (= e!227339 (not e!227337))))

(declare-fun res!209983 () Bool)

(assert (=> b!372879 (=> res!209983 e!227337)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!372879 (= res!209983 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!12915 0))(
  ( (V!12916 (val!4473 Int)) )
))
(declare-datatypes ((ValueCell!4085 0))(
  ( (ValueCellFull!4085 (v!6664 V!12915)) (EmptyCell!4085) )
))
(declare-datatypes ((array!21637 0))(
  ( (array!21638 (arr!10287 (Array (_ BitVec 32) ValueCell!4085)) (size!10640 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21637)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12915)

(declare-datatypes ((tuple2!5908 0))(
  ( (tuple2!5909 (_1!2965 (_ BitVec 64)) (_2!2965 V!12915)) )
))
(declare-datatypes ((List!5745 0))(
  ( (Nil!5742) (Cons!5741 (h!6597 tuple2!5908) (t!10886 List!5745)) )
))
(declare-datatypes ((ListLongMap!4811 0))(
  ( (ListLongMap!4812 (toList!2421 List!5745)) )
))
(declare-fun lt!170934 () ListLongMap!4811)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!12915)

(declare-fun getCurrentListMap!1845 (array!21635 array!21637 (_ BitVec 32) (_ BitVec 32) V!12915 V!12915 (_ BitVec 32) Int) ListLongMap!4811)

(assert (=> b!372879 (= lt!170934 (getCurrentListMap!1845 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170925 () ListLongMap!4811)

(declare-fun lt!170933 () array!21637)

(declare-fun lt!170922 () array!21635)

(assert (=> b!372879 (= lt!170925 (getCurrentListMap!1845 lt!170922 lt!170933 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170926 () ListLongMap!4811)

(declare-fun lt!170930 () ListLongMap!4811)

(assert (=> b!372879 (and (= lt!170926 lt!170930) (= lt!170930 lt!170926))))

(declare-fun lt!170928 () ListLongMap!4811)

(declare-fun lt!170924 () tuple2!5908)

(declare-fun +!789 (ListLongMap!4811 tuple2!5908) ListLongMap!4811)

(assert (=> b!372879 (= lt!170930 (+!789 lt!170928 lt!170924))))

(declare-fun v!373 () V!12915)

(assert (=> b!372879 (= lt!170924 (tuple2!5909 k0!778 v!373))))

(declare-datatypes ((Unit!11450 0))(
  ( (Unit!11451) )
))
(declare-fun lt!170923 () Unit!11450)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!38 (array!21635 array!21637 (_ BitVec 32) (_ BitVec 32) V!12915 V!12915 (_ BitVec 32) (_ BitVec 64) V!12915 (_ BitVec 32) Int) Unit!11450)

(assert (=> b!372879 (= lt!170923 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!38 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!710 (array!21635 array!21637 (_ BitVec 32) (_ BitVec 32) V!12915 V!12915 (_ BitVec 32) Int) ListLongMap!4811)

(assert (=> b!372879 (= lt!170926 (getCurrentListMapNoExtraKeys!710 lt!170922 lt!170933 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372879 (= lt!170933 (array!21638 (store (arr!10287 _values!506) i!548 (ValueCellFull!4085 v!373)) (size!10640 _values!506)))))

(assert (=> b!372879 (= lt!170928 (getCurrentListMapNoExtraKeys!710 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!372880 () Bool)

(declare-fun e!227341 () Bool)

(assert (=> b!372880 (= e!227341 tp_is_empty!8857)))

(declare-fun b!372881 () Bool)

(declare-fun res!209989 () Bool)

(assert (=> b!372881 (=> (not res!209989) (not e!227342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21635 (_ BitVec 32)) Bool)

(assert (=> b!372881 (= res!209989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!372882 () Bool)

(declare-fun res!209990 () Bool)

(assert (=> b!372882 (=> (not res!209990) (not e!227339))))

(declare-datatypes ((List!5746 0))(
  ( (Nil!5743) (Cons!5742 (h!6598 (_ BitVec 64)) (t!10887 List!5746)) )
))
(declare-fun arrayNoDuplicates!0 (array!21635 (_ BitVec 32) List!5746) Bool)

(assert (=> b!372882 (= res!209990 (arrayNoDuplicates!0 lt!170922 #b00000000000000000000000000000000 Nil!5743))))

(declare-fun mapIsEmpty!14850 () Bool)

(declare-fun mapRes!14850 () Bool)

(assert (=> mapIsEmpty!14850 mapRes!14850))

(declare-fun b!372883 () Bool)

(declare-fun res!209984 () Bool)

(assert (=> b!372883 (=> (not res!209984) (not e!227342))))

(assert (=> b!372883 (= res!209984 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5743))))

(declare-fun b!372876 () Bool)

(assert (=> b!372876 (= e!227342 e!227339)))

(declare-fun res!209982 () Bool)

(assert (=> b!372876 (=> (not res!209982) (not e!227339))))

(assert (=> b!372876 (= res!209982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170922 mask!970))))

(assert (=> b!372876 (= lt!170922 (array!21636 (store (arr!10286 _keys!658) i!548 k0!778) (size!10639 _keys!658)))))

(declare-fun res!209985 () Bool)

(assert (=> start!37068 (=> (not res!209985) (not e!227342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37068 (= res!209985 (validMask!0 mask!970))))

(assert (=> start!37068 e!227342))

(declare-fun e!227340 () Bool)

(declare-fun array_inv!7590 (array!21637) Bool)

(assert (=> start!37068 (and (array_inv!7590 _values!506) e!227340)))

(assert (=> start!37068 tp!29343))

(assert (=> start!37068 true))

(assert (=> start!37068 tp_is_empty!8857))

(declare-fun array_inv!7591 (array!21635) Bool)

(assert (=> start!37068 (array_inv!7591 _keys!658)))

(declare-fun b!372884 () Bool)

(declare-fun res!209981 () Bool)

(assert (=> b!372884 (=> (not res!209981) (not e!227342))))

(assert (=> b!372884 (= res!209981 (and (= (size!10640 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10639 _keys!658) (size!10640 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!372885 () Bool)

(assert (=> b!372885 (= e!227340 (and e!227336 mapRes!14850))))

(declare-fun condMapEmpty!14850 () Bool)

(declare-fun mapDefault!14850 () ValueCell!4085)

(assert (=> b!372885 (= condMapEmpty!14850 (= (arr!10287 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4085)) mapDefault!14850)))))

(declare-fun mapNonEmpty!14850 () Bool)

(declare-fun tp!29342 () Bool)

(assert (=> mapNonEmpty!14850 (= mapRes!14850 (and tp!29342 e!227341))))

(declare-fun mapRest!14850 () (Array (_ BitVec 32) ValueCell!4085))

(declare-fun mapValue!14850 () ValueCell!4085)

(declare-fun mapKey!14850 () (_ BitVec 32))

(assert (=> mapNonEmpty!14850 (= (arr!10287 _values!506) (store mapRest!14850 mapKey!14850 mapValue!14850))))

(declare-fun b!372886 () Bool)

(assert (=> b!372886 (= e!227337 true)))

(declare-fun lt!170932 () ListLongMap!4811)

(declare-fun lt!170929 () ListLongMap!4811)

(assert (=> b!372886 (= lt!170932 (+!789 lt!170929 lt!170924))))

(declare-fun lt!170921 () Unit!11450)

(declare-fun addCommutativeForDiffKeys!209 (ListLongMap!4811 (_ BitVec 64) V!12915 (_ BitVec 64) V!12915) Unit!11450)

(assert (=> b!372886 (= lt!170921 (addCommutativeForDiffKeys!209 lt!170928 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!170927 () tuple2!5908)

(assert (=> b!372886 (= lt!170925 (+!789 lt!170932 lt!170927))))

(declare-fun lt!170931 () tuple2!5908)

(assert (=> b!372886 (= lt!170932 (+!789 lt!170930 lt!170931))))

(assert (=> b!372886 (= lt!170934 (+!789 lt!170929 lt!170927))))

(assert (=> b!372886 (= lt!170929 (+!789 lt!170928 lt!170931))))

(assert (=> b!372886 (= lt!170925 (+!789 (+!789 lt!170926 lt!170931) lt!170927))))

(assert (=> b!372886 (= lt!170927 (tuple2!5909 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!372886 (= lt!170931 (tuple2!5909 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (= (and start!37068 res!209985) b!372884))

(assert (= (and b!372884 res!209981) b!372881))

(assert (= (and b!372881 res!209989) b!372883))

(assert (= (and b!372883 res!209984) b!372877))

(assert (= (and b!372877 res!209987) b!372874))

(assert (= (and b!372874 res!209980) b!372878))

(assert (= (and b!372878 res!209986) b!372873))

(assert (= (and b!372873 res!209988) b!372876))

(assert (= (and b!372876 res!209982) b!372882))

(assert (= (and b!372882 res!209990) b!372879))

(assert (= (and b!372879 (not res!209983)) b!372886))

(assert (= (and b!372885 condMapEmpty!14850) mapIsEmpty!14850))

(assert (= (and b!372885 (not condMapEmpty!14850)) mapNonEmpty!14850))

(get-info :version)

(assert (= (and mapNonEmpty!14850 ((_ is ValueCellFull!4085) mapValue!14850)) b!372880))

(assert (= (and b!372885 ((_ is ValueCellFull!4085) mapDefault!14850)) b!372875))

(assert (= start!37068 b!372885))

(declare-fun m!368249 () Bool)

(assert (=> start!37068 m!368249))

(declare-fun m!368251 () Bool)

(assert (=> start!37068 m!368251))

(declare-fun m!368253 () Bool)

(assert (=> start!37068 m!368253))

(declare-fun m!368255 () Bool)

(assert (=> b!372878 m!368255))

(declare-fun m!368257 () Bool)

(assert (=> b!372879 m!368257))

(declare-fun m!368259 () Bool)

(assert (=> b!372879 m!368259))

(declare-fun m!368261 () Bool)

(assert (=> b!372879 m!368261))

(declare-fun m!368263 () Bool)

(assert (=> b!372879 m!368263))

(declare-fun m!368265 () Bool)

(assert (=> b!372879 m!368265))

(declare-fun m!368267 () Bool)

(assert (=> b!372879 m!368267))

(declare-fun m!368269 () Bool)

(assert (=> b!372879 m!368269))

(declare-fun m!368271 () Bool)

(assert (=> b!372886 m!368271))

(declare-fun m!368273 () Bool)

(assert (=> b!372886 m!368273))

(declare-fun m!368275 () Bool)

(assert (=> b!372886 m!368275))

(declare-fun m!368277 () Bool)

(assert (=> b!372886 m!368277))

(declare-fun m!368279 () Bool)

(assert (=> b!372886 m!368279))

(declare-fun m!368281 () Bool)

(assert (=> b!372886 m!368281))

(assert (=> b!372886 m!368277))

(declare-fun m!368283 () Bool)

(assert (=> b!372886 m!368283))

(declare-fun m!368285 () Bool)

(assert (=> b!372886 m!368285))

(declare-fun m!368287 () Bool)

(assert (=> b!372883 m!368287))

(declare-fun m!368289 () Bool)

(assert (=> mapNonEmpty!14850 m!368289))

(declare-fun m!368291 () Bool)

(assert (=> b!372874 m!368291))

(declare-fun m!368293 () Bool)

(assert (=> b!372876 m!368293))

(declare-fun m!368295 () Bool)

(assert (=> b!372876 m!368295))

(declare-fun m!368297 () Bool)

(assert (=> b!372882 m!368297))

(declare-fun m!368299 () Bool)

(assert (=> b!372873 m!368299))

(declare-fun m!368301 () Bool)

(assert (=> b!372881 m!368301))

(check-sat tp_is_empty!8857 (not b!372873) (not b!372874) (not b_next!8209) (not b!372883) (not b!372882) (not b!372886) (not b!372881) (not start!37068) (not b!372876) b_and!15425 (not mapNonEmpty!14850) (not b!372879))
(check-sat b_and!15425 (not b_next!8209))
