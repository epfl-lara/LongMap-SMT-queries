; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71234 () Bool)

(assert start!71234)

(declare-fun b_free!13255 () Bool)

(declare-fun b_next!13255 () Bool)

(assert (=> start!71234 (= b_free!13255 (not b_next!13255))))

(declare-fun tp!46522 () Bool)

(declare-fun b_and!22179 () Bool)

(assert (=> start!71234 (= tp!46522 b_and!22179)))

(declare-fun res!562939 () Bool)

(declare-fun e!459898 () Bool)

(assert (=> start!71234 (=> (not res!562939) (not e!459898))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71234 (= res!562939 (validMask!0 mask!1312))))

(assert (=> start!71234 e!459898))

(declare-fun tp_is_empty!14965 () Bool)

(assert (=> start!71234 tp_is_empty!14965))

(declare-datatypes ((array!46115 0))(
  ( (array!46116 (arr!22099 (Array (_ BitVec 32) (_ BitVec 64))) (size!22519 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46115)

(declare-fun array_inv!17663 (array!46115) Bool)

(assert (=> start!71234 (array_inv!17663 _keys!976)))

(assert (=> start!71234 true))

(declare-datatypes ((V!24955 0))(
  ( (V!24956 (val!7530 Int)) )
))
(declare-datatypes ((ValueCell!7067 0))(
  ( (ValueCellFull!7067 (v!9963 V!24955)) (EmptyCell!7067) )
))
(declare-datatypes ((array!46117 0))(
  ( (array!46118 (arr!22100 (Array (_ BitVec 32) ValueCell!7067)) (size!22520 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46117)

(declare-fun e!459896 () Bool)

(declare-fun array_inv!17664 (array!46117) Bool)

(assert (=> start!71234 (and (array_inv!17664 _values!788) e!459896)))

(assert (=> start!71234 tp!46522))

(declare-datatypes ((tuple2!9888 0))(
  ( (tuple2!9889 (_1!4955 (_ BitVec 64)) (_2!4955 V!24955)) )
))
(declare-datatypes ((List!15673 0))(
  ( (Nil!15670) (Cons!15669 (h!16804 tuple2!9888) (t!22010 List!15673)) )
))
(declare-datatypes ((ListLongMap!8713 0))(
  ( (ListLongMap!8714 (toList!4372 List!15673)) )
))
(declare-fun lt!372825 () ListLongMap!8713)

(declare-fun lt!372823 () tuple2!9888)

(declare-fun lt!372822 () ListLongMap!8713)

(declare-fun lt!372819 () tuple2!9888)

(declare-fun e!459892 () Bool)

(declare-fun b!826182 () Bool)

(declare-fun +!1919 (ListLongMap!8713 tuple2!9888) ListLongMap!8713)

(assert (=> b!826182 (= e!459892 (= lt!372825 (+!1919 (+!1919 lt!372822 lt!372823) lt!372819)))))

(declare-fun b!826183 () Bool)

(declare-fun e!459894 () Bool)

(assert (=> b!826183 (= e!459894 tp_is_empty!14965)))

(declare-fun b!826184 () Bool)

(declare-fun e!459897 () Bool)

(assert (=> b!826184 (= e!459898 (not e!459897))))

(declare-fun res!562940 () Bool)

(assert (=> b!826184 (=> res!562940 e!459897)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!826184 (= res!562940 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!372818 () ListLongMap!8713)

(assert (=> b!826184 (= lt!372818 lt!372822)))

(declare-fun zeroValueBefore!34 () V!24955)

(declare-fun zeroValueAfter!34 () V!24955)

(declare-fun minValue!754 () V!24955)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28296 0))(
  ( (Unit!28297) )
))
(declare-fun lt!372816 () Unit!28296)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!542 (array!46115 array!46117 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24955 V!24955 V!24955 V!24955 (_ BitVec 32) Int) Unit!28296)

(assert (=> b!826184 (= lt!372816 (lemmaNoChangeToArrayThenSameMapNoExtras!542 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2454 (array!46115 array!46117 (_ BitVec 32) (_ BitVec 32) V!24955 V!24955 (_ BitVec 32) Int) ListLongMap!8713)

(assert (=> b!826184 (= lt!372822 (getCurrentListMapNoExtraKeys!2454 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826184 (= lt!372818 (getCurrentListMapNoExtraKeys!2454 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826185 () Bool)

(declare-fun res!562941 () Bool)

(assert (=> b!826185 (=> (not res!562941) (not e!459898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46115 (_ BitVec 32)) Bool)

(assert (=> b!826185 (= res!562941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!826186 () Bool)

(declare-fun res!562938 () Bool)

(assert (=> b!826186 (=> (not res!562938) (not e!459898))))

(declare-datatypes ((List!15674 0))(
  ( (Nil!15671) (Cons!15670 (h!16805 (_ BitVec 64)) (t!22011 List!15674)) )
))
(declare-fun arrayNoDuplicates!0 (array!46115 (_ BitVec 32) List!15674) Bool)

(assert (=> b!826186 (= res!562938 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15671))))

(declare-fun e!459895 () Bool)

(declare-fun b!826187 () Bool)

(assert (=> b!826187 (= e!459895 (= lt!372825 (+!1919 (+!1919 lt!372822 (tuple2!9889 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!372823)))))

(declare-fun b!826188 () Bool)

(declare-fun res!562943 () Bool)

(assert (=> b!826188 (=> (not res!562943) (not e!459898))))

(assert (=> b!826188 (= res!562943 (and (= (size!22520 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22519 _keys!976) (size!22520 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!826189 () Bool)

(assert (=> b!826189 (= e!459897 true)))

(declare-fun lt!372826 () ListLongMap!8713)

(assert (=> b!826189 (= lt!372826 (+!1919 (+!1919 lt!372818 lt!372819) lt!372823))))

(declare-fun lt!372824 () ListLongMap!8713)

(declare-fun lt!372815 () ListLongMap!8713)

(assert (=> b!826189 (and (= lt!372824 lt!372815) (= lt!372825 lt!372815) (= lt!372825 lt!372824))))

(declare-fun lt!372820 () ListLongMap!8713)

(assert (=> b!826189 (= lt!372815 (+!1919 lt!372820 lt!372819))))

(declare-fun lt!372821 () ListLongMap!8713)

(assert (=> b!826189 (= lt!372824 (+!1919 lt!372821 lt!372819))))

(declare-fun lt!372817 () Unit!28296)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!207 (ListLongMap!8713 (_ BitVec 64) V!24955 V!24955) Unit!28296)

(assert (=> b!826189 (= lt!372817 (addSameAsAddTwiceSameKeyDiffValues!207 lt!372821 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!826189 e!459892))

(declare-fun res!562937 () Bool)

(assert (=> b!826189 (=> (not res!562937) (not e!459892))))

(declare-fun lt!372828 () ListLongMap!8713)

(assert (=> b!826189 (= res!562937 (= lt!372828 lt!372820))))

(declare-fun lt!372827 () tuple2!9888)

(assert (=> b!826189 (= lt!372820 (+!1919 lt!372821 lt!372827))))

(assert (=> b!826189 (= lt!372821 (+!1919 lt!372818 lt!372823))))

(assert (=> b!826189 (= lt!372819 (tuple2!9889 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!826189 e!459895))

(declare-fun res!562942 () Bool)

(assert (=> b!826189 (=> (not res!562942) (not e!459895))))

(assert (=> b!826189 (= res!562942 (= lt!372828 (+!1919 (+!1919 lt!372818 lt!372827) lt!372823)))))

(assert (=> b!826189 (= lt!372823 (tuple2!9889 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826189 (= lt!372827 (tuple2!9889 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2498 (array!46115 array!46117 (_ BitVec 32) (_ BitVec 32) V!24955 V!24955 (_ BitVec 32) Int) ListLongMap!8713)

(assert (=> b!826189 (= lt!372825 (getCurrentListMap!2498 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826189 (= lt!372828 (getCurrentListMap!2498 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24070 () Bool)

(declare-fun mapRes!24070 () Bool)

(declare-fun tp!46521 () Bool)

(assert (=> mapNonEmpty!24070 (= mapRes!24070 (and tp!46521 e!459894))))

(declare-fun mapRest!24070 () (Array (_ BitVec 32) ValueCell!7067))

(declare-fun mapValue!24070 () ValueCell!7067)

(declare-fun mapKey!24070 () (_ BitVec 32))

(assert (=> mapNonEmpty!24070 (= (arr!22100 _values!788) (store mapRest!24070 mapKey!24070 mapValue!24070))))

(declare-fun mapIsEmpty!24070 () Bool)

(assert (=> mapIsEmpty!24070 mapRes!24070))

(declare-fun b!826190 () Bool)

(declare-fun e!459893 () Bool)

(assert (=> b!826190 (= e!459893 tp_is_empty!14965)))

(declare-fun b!826191 () Bool)

(assert (=> b!826191 (= e!459896 (and e!459893 mapRes!24070))))

(declare-fun condMapEmpty!24070 () Bool)

(declare-fun mapDefault!24070 () ValueCell!7067)

(assert (=> b!826191 (= condMapEmpty!24070 (= (arr!22100 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7067)) mapDefault!24070)))))

(assert (= (and start!71234 res!562939) b!826188))

(assert (= (and b!826188 res!562943) b!826185))

(assert (= (and b!826185 res!562941) b!826186))

(assert (= (and b!826186 res!562938) b!826184))

(assert (= (and b!826184 (not res!562940)) b!826189))

(assert (= (and b!826189 res!562942) b!826187))

(assert (= (and b!826189 res!562937) b!826182))

(assert (= (and b!826191 condMapEmpty!24070) mapIsEmpty!24070))

(assert (= (and b!826191 (not condMapEmpty!24070)) mapNonEmpty!24070))

(get-info :version)

(assert (= (and mapNonEmpty!24070 ((_ is ValueCellFull!7067) mapValue!24070)) b!826183))

(assert (= (and b!826191 ((_ is ValueCellFull!7067) mapDefault!24070)) b!826190))

(assert (= start!71234 b!826191))

(declare-fun m!768639 () Bool)

(assert (=> b!826185 m!768639))

(declare-fun m!768641 () Bool)

(assert (=> b!826186 m!768641))

(declare-fun m!768643 () Bool)

(assert (=> b!826184 m!768643))

(declare-fun m!768645 () Bool)

(assert (=> b!826184 m!768645))

(declare-fun m!768647 () Bool)

(assert (=> b!826184 m!768647))

(declare-fun m!768649 () Bool)

(assert (=> b!826187 m!768649))

(assert (=> b!826187 m!768649))

(declare-fun m!768651 () Bool)

(assert (=> b!826187 m!768651))

(declare-fun m!768653 () Bool)

(assert (=> b!826182 m!768653))

(assert (=> b!826182 m!768653))

(declare-fun m!768655 () Bool)

(assert (=> b!826182 m!768655))

(declare-fun m!768657 () Bool)

(assert (=> start!71234 m!768657))

(declare-fun m!768659 () Bool)

(assert (=> start!71234 m!768659))

(declare-fun m!768661 () Bool)

(assert (=> start!71234 m!768661))

(declare-fun m!768663 () Bool)

(assert (=> mapNonEmpty!24070 m!768663))

(declare-fun m!768665 () Bool)

(assert (=> b!826189 m!768665))

(declare-fun m!768667 () Bool)

(assert (=> b!826189 m!768667))

(declare-fun m!768669 () Bool)

(assert (=> b!826189 m!768669))

(declare-fun m!768671 () Bool)

(assert (=> b!826189 m!768671))

(declare-fun m!768673 () Bool)

(assert (=> b!826189 m!768673))

(declare-fun m!768675 () Bool)

(assert (=> b!826189 m!768675))

(assert (=> b!826189 m!768675))

(declare-fun m!768677 () Bool)

(assert (=> b!826189 m!768677))

(declare-fun m!768679 () Bool)

(assert (=> b!826189 m!768679))

(declare-fun m!768681 () Bool)

(assert (=> b!826189 m!768681))

(assert (=> b!826189 m!768665))

(declare-fun m!768683 () Bool)

(assert (=> b!826189 m!768683))

(declare-fun m!768685 () Bool)

(assert (=> b!826189 m!768685))

(check-sat (not b!826187) (not b!826184) (not b!826185) (not b!826189) b_and!22179 (not b_next!13255) (not start!71234) (not mapNonEmpty!24070) tp_is_empty!14965 (not b!826186) (not b!826182))
(check-sat b_and!22179 (not b_next!13255))
