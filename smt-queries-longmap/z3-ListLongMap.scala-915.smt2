; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20590 () Bool)

(assert start!20590)

(declare-fun b_free!5245 () Bool)

(declare-fun b_next!5245 () Bool)

(assert (=> start!20590 (= b_free!5245 (not b_next!5245))))

(declare-fun tp!18767 () Bool)

(declare-fun b_and!11965 () Bool)

(assert (=> start!20590 (= tp!18767 b_and!11965)))

(declare-fun b!204909 () Bool)

(declare-fun e!134022 () Bool)

(declare-fun e!134021 () Bool)

(assert (=> b!204909 (= e!134022 e!134021)))

(declare-fun res!98881 () Bool)

(assert (=> b!204909 (=> res!98881 e!134021)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!204909 (= res!98881 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6449 0))(
  ( (V!6450 (val!2595 Int)) )
))
(declare-datatypes ((tuple2!3918 0))(
  ( (tuple2!3919 (_1!1970 (_ BitVec 64)) (_2!1970 V!6449)) )
))
(declare-datatypes ((List!2820 0))(
  ( (Nil!2817) (Cons!2816 (h!3458 tuple2!3918) (t!7742 List!2820)) )
))
(declare-datatypes ((ListLongMap!2821 0))(
  ( (ListLongMap!2822 (toList!1426 List!2820)) )
))
(declare-fun lt!104013 () ListLongMap!2821)

(declare-fun lt!104007 () ListLongMap!2821)

(assert (=> b!204909 (= lt!104013 lt!104007)))

(declare-fun lt!104015 () ListLongMap!2821)

(declare-fun lt!104016 () tuple2!3918)

(declare-fun +!475 (ListLongMap!2821 tuple2!3918) ListLongMap!2821)

(assert (=> b!204909 (= lt!104007 (+!475 lt!104015 lt!104016))))

(declare-fun lt!104008 () ListLongMap!2821)

(declare-fun lt!104010 () ListLongMap!2821)

(assert (=> b!204909 (= lt!104008 lt!104010)))

(declare-fun lt!104018 () ListLongMap!2821)

(assert (=> b!204909 (= lt!104010 (+!475 lt!104018 lt!104016))))

(declare-fun lt!104014 () ListLongMap!2821)

(assert (=> b!204909 (= lt!104008 (+!475 lt!104014 lt!104016))))

(declare-fun minValue!615 () V!6449)

(assert (=> b!204909 (= lt!104016 (tuple2!3919 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204910 () Bool)

(declare-fun e!134020 () Bool)

(declare-fun tp_is_empty!5101 () Bool)

(assert (=> b!204910 (= e!134020 tp_is_empty!5101)))

(declare-fun mapNonEmpty!8720 () Bool)

(declare-fun mapRes!8720 () Bool)

(declare-fun tp!18766 () Bool)

(declare-fun e!134019 () Bool)

(assert (=> mapNonEmpty!8720 (= mapRes!8720 (and tp!18766 e!134019))))

(declare-fun mapKey!8720 () (_ BitVec 32))

(declare-datatypes ((ValueCell!2207 0))(
  ( (ValueCellFull!2207 (v!4559 V!6449)) (EmptyCell!2207) )
))
(declare-datatypes ((array!9403 0))(
  ( (array!9404 (arr!4451 (Array (_ BitVec 32) ValueCell!2207)) (size!4777 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9403)

(declare-fun mapRest!8720 () (Array (_ BitVec 32) ValueCell!2207))

(declare-fun mapValue!8720 () ValueCell!2207)

(assert (=> mapNonEmpty!8720 (= (arr!4451 _values!649) (store mapRest!8720 mapKey!8720 mapValue!8720))))

(declare-fun b!204911 () Bool)

(declare-fun e!134024 () Bool)

(assert (=> b!204911 (= e!134024 (not e!134022))))

(declare-fun res!98880 () Bool)

(assert (=> b!204911 (=> res!98880 e!134022)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204911 (= res!98880 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6449)

(declare-datatypes ((array!9405 0))(
  ( (array!9406 (arr!4452 (Array (_ BitVec 32) (_ BitVec 64))) (size!4778 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9405)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!971 (array!9405 array!9403 (_ BitVec 32) (_ BitVec 32) V!6449 V!6449 (_ BitVec 32) Int) ListLongMap!2821)

(assert (=> b!204911 (= lt!104013 (getCurrentListMap!971 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104009 () array!9403)

(assert (=> b!204911 (= lt!104008 (getCurrentListMap!971 _keys!825 lt!104009 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204911 (and (= lt!104014 lt!104018) (= lt!104018 lt!104014))))

(declare-fun lt!104012 () tuple2!3918)

(assert (=> b!204911 (= lt!104018 (+!475 lt!104015 lt!104012))))

(declare-fun v!520 () V!6449)

(assert (=> b!204911 (= lt!104012 (tuple2!3919 k0!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6192 0))(
  ( (Unit!6193) )
))
(declare-fun lt!104011 () Unit!6192)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!130 (array!9405 array!9403 (_ BitVec 32) (_ BitVec 32) V!6449 V!6449 (_ BitVec 32) (_ BitVec 64) V!6449 (_ BitVec 32) Int) Unit!6192)

(assert (=> b!204911 (= lt!104011 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!130 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!381 (array!9405 array!9403 (_ BitVec 32) (_ BitVec 32) V!6449 V!6449 (_ BitVec 32) Int) ListLongMap!2821)

(assert (=> b!204911 (= lt!104014 (getCurrentListMapNoExtraKeys!381 _keys!825 lt!104009 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204911 (= lt!104009 (array!9404 (store (arr!4451 _values!649) i!601 (ValueCellFull!2207 v!520)) (size!4777 _values!649)))))

(assert (=> b!204911 (= lt!104015 (getCurrentListMapNoExtraKeys!381 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204912 () Bool)

(assert (=> b!204912 (= e!134021 true)))

(assert (=> b!204912 (= lt!104010 (+!475 lt!104007 lt!104012))))

(declare-fun lt!104017 () Unit!6192)

(declare-fun addCommutativeForDiffKeys!164 (ListLongMap!2821 (_ BitVec 64) V!6449 (_ BitVec 64) V!6449) Unit!6192)

(assert (=> b!204912 (= lt!104017 (addCommutativeForDiffKeys!164 lt!104015 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204913 () Bool)

(declare-fun res!98875 () Bool)

(assert (=> b!204913 (=> (not res!98875) (not e!134024))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9405 (_ BitVec 32)) Bool)

(assert (=> b!204913 (= res!98875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!204914 () Bool)

(declare-fun res!98877 () Bool)

(assert (=> b!204914 (=> (not res!98877) (not e!134024))))

(assert (=> b!204914 (= res!98877 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4778 _keys!825))))))

(declare-fun b!204915 () Bool)

(assert (=> b!204915 (= e!134019 tp_is_empty!5101)))

(declare-fun b!204916 () Bool)

(declare-fun res!98879 () Bool)

(assert (=> b!204916 (=> (not res!98879) (not e!134024))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204916 (= res!98879 (validKeyInArray!0 k0!843))))

(declare-fun mapIsEmpty!8720 () Bool)

(assert (=> mapIsEmpty!8720 mapRes!8720))

(declare-fun res!98874 () Bool)

(assert (=> start!20590 (=> (not res!98874) (not e!134024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20590 (= res!98874 (validMask!0 mask!1149))))

(assert (=> start!20590 e!134024))

(declare-fun e!134023 () Bool)

(declare-fun array_inv!2927 (array!9403) Bool)

(assert (=> start!20590 (and (array_inv!2927 _values!649) e!134023)))

(assert (=> start!20590 true))

(assert (=> start!20590 tp_is_empty!5101))

(declare-fun array_inv!2928 (array!9405) Bool)

(assert (=> start!20590 (array_inv!2928 _keys!825)))

(assert (=> start!20590 tp!18767))

(declare-fun b!204917 () Bool)

(declare-fun res!98876 () Bool)

(assert (=> b!204917 (=> (not res!98876) (not e!134024))))

(assert (=> b!204917 (= res!98876 (= (select (arr!4452 _keys!825) i!601) k0!843))))

(declare-fun b!204918 () Bool)

(declare-fun res!98878 () Bool)

(assert (=> b!204918 (=> (not res!98878) (not e!134024))))

(assert (=> b!204918 (= res!98878 (and (= (size!4777 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4778 _keys!825) (size!4777 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!204919 () Bool)

(assert (=> b!204919 (= e!134023 (and e!134020 mapRes!8720))))

(declare-fun condMapEmpty!8720 () Bool)

(declare-fun mapDefault!8720 () ValueCell!2207)

(assert (=> b!204919 (= condMapEmpty!8720 (= (arr!4451 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2207)) mapDefault!8720)))))

(declare-fun b!204920 () Bool)

(declare-fun res!98882 () Bool)

(assert (=> b!204920 (=> (not res!98882) (not e!134024))))

(declare-datatypes ((List!2821 0))(
  ( (Nil!2818) (Cons!2817 (h!3459 (_ BitVec 64)) (t!7743 List!2821)) )
))
(declare-fun arrayNoDuplicates!0 (array!9405 (_ BitVec 32) List!2821) Bool)

(assert (=> b!204920 (= res!98882 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2818))))

(assert (= (and start!20590 res!98874) b!204918))

(assert (= (and b!204918 res!98878) b!204913))

(assert (= (and b!204913 res!98875) b!204920))

(assert (= (and b!204920 res!98882) b!204914))

(assert (= (and b!204914 res!98877) b!204916))

(assert (= (and b!204916 res!98879) b!204917))

(assert (= (and b!204917 res!98876) b!204911))

(assert (= (and b!204911 (not res!98880)) b!204909))

(assert (= (and b!204909 (not res!98881)) b!204912))

(assert (= (and b!204919 condMapEmpty!8720) mapIsEmpty!8720))

(assert (= (and b!204919 (not condMapEmpty!8720)) mapNonEmpty!8720))

(get-info :version)

(assert (= (and mapNonEmpty!8720 ((_ is ValueCellFull!2207) mapValue!8720)) b!204915))

(assert (= (and b!204919 ((_ is ValueCellFull!2207) mapDefault!8720)) b!204910))

(assert (= start!20590 b!204919))

(declare-fun m!232023 () Bool)

(assert (=> b!204913 m!232023))

(declare-fun m!232025 () Bool)

(assert (=> b!204916 m!232025))

(declare-fun m!232027 () Bool)

(assert (=> b!204920 m!232027))

(declare-fun m!232029 () Bool)

(assert (=> b!204909 m!232029))

(declare-fun m!232031 () Bool)

(assert (=> b!204909 m!232031))

(declare-fun m!232033 () Bool)

(assert (=> b!204909 m!232033))

(declare-fun m!232035 () Bool)

(assert (=> b!204912 m!232035))

(declare-fun m!232037 () Bool)

(assert (=> b!204912 m!232037))

(declare-fun m!232039 () Bool)

(assert (=> b!204917 m!232039))

(declare-fun m!232041 () Bool)

(assert (=> start!20590 m!232041))

(declare-fun m!232043 () Bool)

(assert (=> start!20590 m!232043))

(declare-fun m!232045 () Bool)

(assert (=> start!20590 m!232045))

(declare-fun m!232047 () Bool)

(assert (=> b!204911 m!232047))

(declare-fun m!232049 () Bool)

(assert (=> b!204911 m!232049))

(declare-fun m!232051 () Bool)

(assert (=> b!204911 m!232051))

(declare-fun m!232053 () Bool)

(assert (=> b!204911 m!232053))

(declare-fun m!232055 () Bool)

(assert (=> b!204911 m!232055))

(declare-fun m!232057 () Bool)

(assert (=> b!204911 m!232057))

(declare-fun m!232059 () Bool)

(assert (=> b!204911 m!232059))

(declare-fun m!232061 () Bool)

(assert (=> mapNonEmpty!8720 m!232061))

(check-sat b_and!11965 (not mapNonEmpty!8720) (not b!204913) (not b_next!5245) (not b!204912) tp_is_empty!5101 (not b!204916) (not b!204909) (not b!204920) (not start!20590) (not b!204911))
(check-sat b_and!11965 (not b_next!5245))
