; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41224 () Bool)

(assert start!41224)

(declare-fun b_free!11067 () Bool)

(declare-fun b_next!11067 () Bool)

(assert (=> start!41224 (= b_free!11067 (not b_next!11067))))

(declare-fun tp!39040 () Bool)

(declare-fun b_and!19387 () Bool)

(assert (=> start!41224 (= tp!39040 b_and!19387)))

(declare-fun b!460996 () Bool)

(declare-fun res!275660 () Bool)

(declare-fun e!268914 () Bool)

(assert (=> b!460996 (=> (not res!275660) (not e!268914))))

(declare-datatypes ((array!28611 0))(
  ( (array!28612 (arr!13745 (Array (_ BitVec 32) (_ BitVec 64))) (size!14097 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28611)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!460996 (= res!275660 (or (= (select (arr!13745 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13745 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460997 () Bool)

(declare-fun e!268917 () Bool)

(assert (=> b!460997 (= e!268914 e!268917)))

(declare-fun res!275663 () Bool)

(assert (=> b!460997 (=> (not res!275663) (not e!268917))))

(declare-fun lt!208857 () array!28611)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28611 (_ BitVec 32)) Bool)

(assert (=> b!460997 (= res!275663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208857 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!460997 (= lt!208857 (array!28612 (store (arr!13745 _keys!709) i!563 k0!794) (size!14097 _keys!709)))))

(declare-fun b!460998 () Bool)

(declare-fun res!275655 () Bool)

(assert (=> b!460998 (=> (not res!275655) (not e!268914))))

(declare-fun arrayContainsKey!0 (array!28611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!460998 (= res!275655 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!460999 () Bool)

(declare-fun e!268913 () Bool)

(assert (=> b!460999 (= e!268917 e!268913)))

(declare-fun res!275656 () Bool)

(assert (=> b!460999 (=> (not res!275656) (not e!268913))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!460999 (= res!275656 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!17645 0))(
  ( (V!17646 (val!6247 Int)) )
))
(declare-fun minValue!515 () V!17645)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17645)

(declare-datatypes ((ValueCell!5859 0))(
  ( (ValueCellFull!5859 (v!8529 V!17645)) (EmptyCell!5859) )
))
(declare-datatypes ((array!28613 0))(
  ( (array!28614 (arr!13746 (Array (_ BitVec 32) ValueCell!5859)) (size!14098 (_ BitVec 32))) )
))
(declare-fun lt!208856 () array!28613)

(declare-datatypes ((tuple2!8244 0))(
  ( (tuple2!8245 (_1!4133 (_ BitVec 64)) (_2!4133 V!17645)) )
))
(declare-datatypes ((List!8315 0))(
  ( (Nil!8312) (Cons!8311 (h!9167 tuple2!8244) (t!14257 List!8315)) )
))
(declare-datatypes ((ListLongMap!7157 0))(
  ( (ListLongMap!7158 (toList!3594 List!8315)) )
))
(declare-fun lt!208855 () ListLongMap!7157)

(declare-fun getCurrentListMapNoExtraKeys!1774 (array!28611 array!28613 (_ BitVec 32) (_ BitVec 32) V!17645 V!17645 (_ BitVec 32) Int) ListLongMap!7157)

(assert (=> b!460999 (= lt!208855 (getCurrentListMapNoExtraKeys!1774 lt!208857 lt!208856 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17645)

(declare-fun _values!549 () array!28613)

(assert (=> b!460999 (= lt!208856 (array!28614 (store (arr!13746 _values!549) i!563 (ValueCellFull!5859 v!412)) (size!14098 _values!549)))))

(declare-fun lt!208853 () ListLongMap!7157)

(assert (=> b!460999 (= lt!208853 (getCurrentListMapNoExtraKeys!1774 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!461000 () Bool)

(declare-fun e!268918 () Bool)

(declare-fun tp_is_empty!12405 () Bool)

(assert (=> b!461000 (= e!268918 tp_is_empty!12405)))

(declare-fun b!461001 () Bool)

(declare-fun res!275664 () Bool)

(assert (=> b!461001 (=> (not res!275664) (not e!268914))))

(assert (=> b!461001 (= res!275664 (and (= (size!14098 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14097 _keys!709) (size!14098 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!275654 () Bool)

(assert (=> start!41224 (=> (not res!275654) (not e!268914))))

(assert (=> start!41224 (= res!275654 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14097 _keys!709))))))

(assert (=> start!41224 e!268914))

(assert (=> start!41224 tp_is_empty!12405))

(assert (=> start!41224 tp!39040))

(assert (=> start!41224 true))

(declare-fun e!268919 () Bool)

(declare-fun array_inv!9942 (array!28613) Bool)

(assert (=> start!41224 (and (array_inv!9942 _values!549) e!268919)))

(declare-fun array_inv!9943 (array!28611) Bool)

(assert (=> start!41224 (array_inv!9943 _keys!709)))

(declare-fun b!461002 () Bool)

(declare-fun mapRes!20260 () Bool)

(assert (=> b!461002 (= e!268919 (and e!268918 mapRes!20260))))

(declare-fun condMapEmpty!20260 () Bool)

(declare-fun mapDefault!20260 () ValueCell!5859)

(assert (=> b!461002 (= condMapEmpty!20260 (= (arr!13746 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5859)) mapDefault!20260)))))

(declare-fun b!461003 () Bool)

(declare-fun res!275659 () Bool)

(assert (=> b!461003 (=> (not res!275659) (not e!268914))))

(declare-datatypes ((List!8316 0))(
  ( (Nil!8313) (Cons!8312 (h!9168 (_ BitVec 64)) (t!14258 List!8316)) )
))
(declare-fun arrayNoDuplicates!0 (array!28611 (_ BitVec 32) List!8316) Bool)

(assert (=> b!461003 (= res!275659 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8313))))

(declare-fun b!461004 () Bool)

(assert (=> b!461004 (= e!268913 (not true))))

(declare-fun +!1629 (ListLongMap!7157 tuple2!8244) ListLongMap!7157)

(assert (=> b!461004 (= (getCurrentListMapNoExtraKeys!1774 lt!208857 lt!208856 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1629 (getCurrentListMapNoExtraKeys!1774 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8245 k0!794 v!412)))))

(declare-datatypes ((Unit!13424 0))(
  ( (Unit!13425) )
))
(declare-fun lt!208854 () Unit!13424)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!785 (array!28611 array!28613 (_ BitVec 32) (_ BitVec 32) V!17645 V!17645 (_ BitVec 32) (_ BitVec 64) V!17645 (_ BitVec 32) Int) Unit!13424)

(assert (=> b!461004 (= lt!208854 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!785 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!461005 () Bool)

(declare-fun e!268915 () Bool)

(assert (=> b!461005 (= e!268915 tp_is_empty!12405)))

(declare-fun b!461006 () Bool)

(declare-fun res!275665 () Bool)

(assert (=> b!461006 (=> (not res!275665) (not e!268917))))

(assert (=> b!461006 (= res!275665 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!20260 () Bool)

(assert (=> mapIsEmpty!20260 mapRes!20260))

(declare-fun b!461007 () Bool)

(declare-fun res!275657 () Bool)

(assert (=> b!461007 (=> (not res!275657) (not e!268914))))

(assert (=> b!461007 (= res!275657 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14097 _keys!709))))))

(declare-fun b!461008 () Bool)

(declare-fun res!275658 () Bool)

(assert (=> b!461008 (=> (not res!275658) (not e!268914))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!461008 (= res!275658 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!20260 () Bool)

(declare-fun tp!39039 () Bool)

(assert (=> mapNonEmpty!20260 (= mapRes!20260 (and tp!39039 e!268915))))

(declare-fun mapRest!20260 () (Array (_ BitVec 32) ValueCell!5859))

(declare-fun mapValue!20260 () ValueCell!5859)

(declare-fun mapKey!20260 () (_ BitVec 32))

(assert (=> mapNonEmpty!20260 (= (arr!13746 _values!549) (store mapRest!20260 mapKey!20260 mapValue!20260))))

(declare-fun b!461009 () Bool)

(declare-fun res!275661 () Bool)

(assert (=> b!461009 (=> (not res!275661) (not e!268914))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!461009 (= res!275661 (validKeyInArray!0 k0!794))))

(declare-fun b!461010 () Bool)

(declare-fun res!275662 () Bool)

(assert (=> b!461010 (=> (not res!275662) (not e!268914))))

(assert (=> b!461010 (= res!275662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!461011 () Bool)

(declare-fun res!275666 () Bool)

(assert (=> b!461011 (=> (not res!275666) (not e!268917))))

(assert (=> b!461011 (= res!275666 (arrayNoDuplicates!0 lt!208857 #b00000000000000000000000000000000 Nil!8313))))

(assert (= (and start!41224 res!275654) b!461008))

(assert (= (and b!461008 res!275658) b!461001))

(assert (= (and b!461001 res!275664) b!461010))

(assert (= (and b!461010 res!275662) b!461003))

(assert (= (and b!461003 res!275659) b!461007))

(assert (= (and b!461007 res!275657) b!461009))

(assert (= (and b!461009 res!275661) b!460996))

(assert (= (and b!460996 res!275660) b!460998))

(assert (= (and b!460998 res!275655) b!460997))

(assert (= (and b!460997 res!275663) b!461011))

(assert (= (and b!461011 res!275666) b!461006))

(assert (= (and b!461006 res!275665) b!460999))

(assert (= (and b!460999 res!275656) b!461004))

(assert (= (and b!461002 condMapEmpty!20260) mapIsEmpty!20260))

(assert (= (and b!461002 (not condMapEmpty!20260)) mapNonEmpty!20260))

(get-info :version)

(assert (= (and mapNonEmpty!20260 ((_ is ValueCellFull!5859) mapValue!20260)) b!461005))

(assert (= (and b!461002 ((_ is ValueCellFull!5859) mapDefault!20260)) b!461000))

(assert (= start!41224 b!461002))

(declare-fun m!444239 () Bool)

(assert (=> b!461003 m!444239))

(declare-fun m!444241 () Bool)

(assert (=> b!461009 m!444241))

(declare-fun m!444243 () Bool)

(assert (=> b!460999 m!444243))

(declare-fun m!444245 () Bool)

(assert (=> b!460999 m!444245))

(declare-fun m!444247 () Bool)

(assert (=> b!460999 m!444247))

(declare-fun m!444249 () Bool)

(assert (=> start!41224 m!444249))

(declare-fun m!444251 () Bool)

(assert (=> start!41224 m!444251))

(declare-fun m!444253 () Bool)

(assert (=> b!460998 m!444253))

(declare-fun m!444255 () Bool)

(assert (=> b!460996 m!444255))

(declare-fun m!444257 () Bool)

(assert (=> b!461004 m!444257))

(declare-fun m!444259 () Bool)

(assert (=> b!461004 m!444259))

(assert (=> b!461004 m!444259))

(declare-fun m!444261 () Bool)

(assert (=> b!461004 m!444261))

(declare-fun m!444263 () Bool)

(assert (=> b!461004 m!444263))

(declare-fun m!444265 () Bool)

(assert (=> mapNonEmpty!20260 m!444265))

(declare-fun m!444267 () Bool)

(assert (=> b!460997 m!444267))

(declare-fun m!444269 () Bool)

(assert (=> b!460997 m!444269))

(declare-fun m!444271 () Bool)

(assert (=> b!461011 m!444271))

(declare-fun m!444273 () Bool)

(assert (=> b!461010 m!444273))

(declare-fun m!444275 () Bool)

(assert (=> b!461008 m!444275))

(check-sat (not b!461010) (not b!460998) (not b!460997) (not b_next!11067) (not b!461003) tp_is_empty!12405 (not start!41224) (not b!461009) (not b!461011) (not b!460999) (not b!461008) b_and!19387 (not b!461004) (not mapNonEmpty!20260))
(check-sat b_and!19387 (not b_next!11067))
