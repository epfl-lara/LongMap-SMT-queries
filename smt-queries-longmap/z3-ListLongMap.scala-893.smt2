; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20456 () Bool)

(assert start!20456)

(declare-fun b_free!5115 () Bool)

(declare-fun b_next!5115 () Bool)

(assert (=> start!20456 (= b_free!5115 (not b_next!5115))))

(declare-fun tp!18376 () Bool)

(declare-fun b_and!11861 () Bool)

(assert (=> start!20456 (= tp!18376 b_and!11861)))

(declare-fun mapNonEmpty!8525 () Bool)

(declare-fun mapRes!8525 () Bool)

(declare-fun tp!18377 () Bool)

(declare-fun e!132757 () Bool)

(assert (=> mapNonEmpty!8525 (= mapRes!8525 (and tp!18377 e!132757))))

(declare-datatypes ((V!6275 0))(
  ( (V!6276 (val!2530 Int)) )
))
(declare-datatypes ((ValueCell!2142 0))(
  ( (ValueCellFull!2142 (v!4500 V!6275)) (EmptyCell!2142) )
))
(declare-fun mapRest!8525 () (Array (_ BitVec 32) ValueCell!2142))

(declare-datatypes ((array!9167 0))(
  ( (array!9168 (arr!4334 (Array (_ BitVec 32) ValueCell!2142)) (size!4659 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9167)

(declare-fun mapKey!8525 () (_ BitVec 32))

(declare-fun mapValue!8525 () ValueCell!2142)

(assert (=> mapNonEmpty!8525 (= (arr!4334 _values!649) (store mapRest!8525 mapKey!8525 mapValue!8525))))

(declare-fun b!202707 () Bool)

(declare-fun res!97206 () Bool)

(declare-fun e!132758 () Bool)

(assert (=> b!202707 (=> (not res!97206) (not e!132758))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((array!9169 0))(
  ( (array!9170 (arr!4335 (Array (_ BitVec 32) (_ BitVec 64))) (size!4660 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9169)

(assert (=> b!202707 (= res!97206 (and (= (size!4659 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4660 _keys!825) (size!4659 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!97207 () Bool)

(assert (=> start!20456 (=> (not res!97207) (not e!132758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20456 (= res!97207 (validMask!0 mask!1149))))

(assert (=> start!20456 e!132758))

(declare-fun e!132760 () Bool)

(declare-fun array_inv!2861 (array!9167) Bool)

(assert (=> start!20456 (and (array_inv!2861 _values!649) e!132760)))

(assert (=> start!20456 true))

(declare-fun tp_is_empty!4971 () Bool)

(assert (=> start!20456 tp_is_empty!4971))

(declare-fun array_inv!2862 (array!9169) Bool)

(assert (=> start!20456 (array_inv!2862 _keys!825)))

(assert (=> start!20456 tp!18376))

(declare-fun b!202708 () Bool)

(declare-fun e!132755 () Bool)

(declare-fun e!132759 () Bool)

(assert (=> b!202708 (= e!132755 e!132759)))

(declare-fun res!97210 () Bool)

(assert (=> b!202708 (=> res!97210 e!132759)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!202708 (= res!97210 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3838 0))(
  ( (tuple2!3839 (_1!1930 (_ BitVec 64)) (_2!1930 V!6275)) )
))
(declare-datatypes ((List!2741 0))(
  ( (Nil!2738) (Cons!2737 (h!3379 tuple2!3838) (t!7672 List!2741)) )
))
(declare-datatypes ((ListLongMap!2751 0))(
  ( (ListLongMap!2752 (toList!1391 List!2741)) )
))
(declare-fun lt!101894 () ListLongMap!2751)

(declare-fun lt!101890 () ListLongMap!2751)

(assert (=> b!202708 (= lt!101894 lt!101890)))

(declare-fun lt!101888 () ListLongMap!2751)

(declare-fun lt!101891 () tuple2!3838)

(declare-fun +!418 (ListLongMap!2751 tuple2!3838) ListLongMap!2751)

(assert (=> b!202708 (= lt!101890 (+!418 lt!101888 lt!101891))))

(declare-fun lt!101892 () ListLongMap!2751)

(declare-fun lt!101893 () ListLongMap!2751)

(assert (=> b!202708 (= lt!101892 lt!101893)))

(declare-fun lt!101884 () ListLongMap!2751)

(assert (=> b!202708 (= lt!101893 (+!418 lt!101884 lt!101891))))

(declare-fun lt!101885 () ListLongMap!2751)

(assert (=> b!202708 (= lt!101894 (+!418 lt!101885 lt!101891))))

(declare-fun zeroValue!615 () V!6275)

(assert (=> b!202708 (= lt!101891 (tuple2!3839 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202709 () Bool)

(declare-fun res!97212 () Bool)

(assert (=> b!202709 (=> (not res!97212) (not e!132758))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9169 (_ BitVec 32)) Bool)

(assert (=> b!202709 (= res!97212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!202710 () Bool)

(declare-fun res!97205 () Bool)

(assert (=> b!202710 (=> (not res!97205) (not e!132758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202710 (= res!97205 (validKeyInArray!0 k0!843))))

(declare-fun b!202711 () Bool)

(assert (=> b!202711 (= e!132758 (not e!132755))))

(declare-fun res!97208 () Bool)

(assert (=> b!202711 (=> res!97208 e!132755)))

(assert (=> b!202711 (= res!97208 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6275)

(declare-fun getCurrentListMap!970 (array!9169 array!9167 (_ BitVec 32) (_ BitVec 32) V!6275 V!6275 (_ BitVec 32) Int) ListLongMap!2751)

(assert (=> b!202711 (= lt!101892 (getCurrentListMap!970 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101889 () array!9167)

(assert (=> b!202711 (= lt!101894 (getCurrentListMap!970 _keys!825 lt!101889 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202711 (and (= lt!101885 lt!101888) (= lt!101888 lt!101885))))

(declare-fun lt!101895 () tuple2!3838)

(assert (=> b!202711 (= lt!101888 (+!418 lt!101884 lt!101895))))

(declare-fun v!520 () V!6275)

(assert (=> b!202711 (= lt!101895 (tuple2!3839 k0!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6130 0))(
  ( (Unit!6131) )
))
(declare-fun lt!101886 () Unit!6130)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!83 (array!9169 array!9167 (_ BitVec 32) (_ BitVec 32) V!6275 V!6275 (_ BitVec 32) (_ BitVec 64) V!6275 (_ BitVec 32) Int) Unit!6130)

(assert (=> b!202711 (= lt!101886 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!83 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!344 (array!9169 array!9167 (_ BitVec 32) (_ BitVec 32) V!6275 V!6275 (_ BitVec 32) Int) ListLongMap!2751)

(assert (=> b!202711 (= lt!101885 (getCurrentListMapNoExtraKeys!344 _keys!825 lt!101889 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202711 (= lt!101889 (array!9168 (store (arr!4334 _values!649) i!601 (ValueCellFull!2142 v!520)) (size!4659 _values!649)))))

(assert (=> b!202711 (= lt!101884 (getCurrentListMapNoExtraKeys!344 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!202712 () Bool)

(assert (=> b!202712 (= e!132757 tp_is_empty!4971)))

(declare-fun b!202713 () Bool)

(declare-fun e!132756 () Bool)

(assert (=> b!202713 (= e!132760 (and e!132756 mapRes!8525))))

(declare-fun condMapEmpty!8525 () Bool)

(declare-fun mapDefault!8525 () ValueCell!2142)

(assert (=> b!202713 (= condMapEmpty!8525 (= (arr!4334 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2142)) mapDefault!8525)))))

(declare-fun b!202714 () Bool)

(declare-fun res!97211 () Bool)

(assert (=> b!202714 (=> (not res!97211) (not e!132758))))

(declare-datatypes ((List!2742 0))(
  ( (Nil!2739) (Cons!2738 (h!3380 (_ BitVec 64)) (t!7673 List!2742)) )
))
(declare-fun arrayNoDuplicates!0 (array!9169 (_ BitVec 32) List!2742) Bool)

(assert (=> b!202714 (= res!97211 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2739))))

(declare-fun b!202715 () Bool)

(assert (=> b!202715 (= e!132756 tp_is_empty!4971)))

(declare-fun b!202716 () Bool)

(declare-fun res!97209 () Bool)

(assert (=> b!202716 (=> (not res!97209) (not e!132758))))

(assert (=> b!202716 (= res!97209 (= (select (arr!4335 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8525 () Bool)

(assert (=> mapIsEmpty!8525 mapRes!8525))

(declare-fun b!202717 () Bool)

(declare-fun res!97213 () Bool)

(assert (=> b!202717 (=> (not res!97213) (not e!132758))))

(assert (=> b!202717 (= res!97213 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4660 _keys!825))))))

(declare-fun b!202718 () Bool)

(assert (=> b!202718 (= e!132759 true)))

(assert (=> b!202718 (= lt!101890 (+!418 lt!101893 lt!101895))))

(declare-fun lt!101887 () Unit!6130)

(declare-fun addCommutativeForDiffKeys!134 (ListLongMap!2751 (_ BitVec 64) V!6275 (_ BitVec 64) V!6275) Unit!6130)

(assert (=> b!202718 (= lt!101887 (addCommutativeForDiffKeys!134 lt!101884 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (= (and start!20456 res!97207) b!202707))

(assert (= (and b!202707 res!97206) b!202709))

(assert (= (and b!202709 res!97212) b!202714))

(assert (= (and b!202714 res!97211) b!202717))

(assert (= (and b!202717 res!97213) b!202710))

(assert (= (and b!202710 res!97205) b!202716))

(assert (= (and b!202716 res!97209) b!202711))

(assert (= (and b!202711 (not res!97208)) b!202708))

(assert (= (and b!202708 (not res!97210)) b!202718))

(assert (= (and b!202713 condMapEmpty!8525) mapIsEmpty!8525))

(assert (= (and b!202713 (not condMapEmpty!8525)) mapNonEmpty!8525))

(get-info :version)

(assert (= (and mapNonEmpty!8525 ((_ is ValueCellFull!2142) mapValue!8525)) b!202712))

(assert (= (and b!202713 ((_ is ValueCellFull!2142) mapDefault!8525)) b!202715))

(assert (= start!20456 b!202713))

(declare-fun m!230051 () Bool)

(assert (=> b!202718 m!230051))

(declare-fun m!230053 () Bool)

(assert (=> b!202718 m!230053))

(declare-fun m!230055 () Bool)

(assert (=> b!202708 m!230055))

(declare-fun m!230057 () Bool)

(assert (=> b!202708 m!230057))

(declare-fun m!230059 () Bool)

(assert (=> b!202708 m!230059))

(declare-fun m!230061 () Bool)

(assert (=> b!202710 m!230061))

(declare-fun m!230063 () Bool)

(assert (=> b!202716 m!230063))

(declare-fun m!230065 () Bool)

(assert (=> start!20456 m!230065))

(declare-fun m!230067 () Bool)

(assert (=> start!20456 m!230067))

(declare-fun m!230069 () Bool)

(assert (=> start!20456 m!230069))

(declare-fun m!230071 () Bool)

(assert (=> b!202714 m!230071))

(declare-fun m!230073 () Bool)

(assert (=> mapNonEmpty!8525 m!230073))

(declare-fun m!230075 () Bool)

(assert (=> b!202711 m!230075))

(declare-fun m!230077 () Bool)

(assert (=> b!202711 m!230077))

(declare-fun m!230079 () Bool)

(assert (=> b!202711 m!230079))

(declare-fun m!230081 () Bool)

(assert (=> b!202711 m!230081))

(declare-fun m!230083 () Bool)

(assert (=> b!202711 m!230083))

(declare-fun m!230085 () Bool)

(assert (=> b!202711 m!230085))

(declare-fun m!230087 () Bool)

(assert (=> b!202711 m!230087))

(declare-fun m!230089 () Bool)

(assert (=> b!202709 m!230089))

(check-sat (not b_next!5115) (not b!202708) (not b!202711) (not mapNonEmpty!8525) (not b!202718) (not b!202709) (not b!202710) tp_is_empty!4971 b_and!11861 (not start!20456) (not b!202714))
(check-sat b_and!11861 (not b_next!5115))
