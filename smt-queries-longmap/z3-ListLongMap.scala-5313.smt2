; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71100 () Bool)

(assert start!71100)

(declare-fun b_free!13287 () Bool)

(declare-fun b_next!13287 () Bool)

(assert (=> start!71100 (= b_free!13287 (not b_next!13287))))

(declare-fun tp!46617 () Bool)

(declare-fun b_and!22201 () Bool)

(assert (=> start!71100 (= tp!46617 b_and!22201)))

(declare-fun b!825768 () Bool)

(declare-fun e!459701 () Bool)

(declare-fun tp_is_empty!14997 () Bool)

(assert (=> b!825768 (= e!459701 tp_is_empty!14997)))

(declare-fun b!825769 () Bool)

(declare-fun res!562931 () Bool)

(declare-fun e!459698 () Bool)

(assert (=> b!825769 (=> (not res!562931) (not e!459698))))

(declare-datatypes ((array!46176 0))(
  ( (array!46177 (arr!22134 (Array (_ BitVec 32) (_ BitVec 64))) (size!22555 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46176)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46176 (_ BitVec 32)) Bool)

(assert (=> b!825769 (= res!562931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!825770 () Bool)

(declare-fun e!459702 () Bool)

(declare-fun e!459705 () Bool)

(declare-fun mapRes!24118 () Bool)

(assert (=> b!825770 (= e!459702 (and e!459705 mapRes!24118))))

(declare-fun condMapEmpty!24118 () Bool)

(declare-datatypes ((V!24997 0))(
  ( (V!24998 (val!7546 Int)) )
))
(declare-datatypes ((ValueCell!7083 0))(
  ( (ValueCellFull!7083 (v!9979 V!24997)) (EmptyCell!7083) )
))
(declare-datatypes ((array!46178 0))(
  ( (array!46179 (arr!22135 (Array (_ BitVec 32) ValueCell!7083)) (size!22556 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46178)

(declare-fun mapDefault!24118 () ValueCell!7083)

(assert (=> b!825770 (= condMapEmpty!24118 (= (arr!22135 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7083)) mapDefault!24118)))))

(declare-fun b!825771 () Bool)

(assert (=> b!825771 (= e!459705 tp_is_empty!14997)))

(declare-datatypes ((tuple2!9992 0))(
  ( (tuple2!9993 (_1!5007 (_ BitVec 64)) (_2!5007 V!24997)) )
))
(declare-fun lt!373140 () tuple2!9992)

(declare-fun e!459704 () Bool)

(declare-fun lt!373137 () tuple2!9992)

(declare-datatypes ((List!15793 0))(
  ( (Nil!15790) (Cons!15789 (h!16918 tuple2!9992) (t!22138 List!15793)) )
))
(declare-datatypes ((ListLongMap!8815 0))(
  ( (ListLongMap!8816 (toList!4423 List!15793)) )
))
(declare-fun lt!373138 () ListLongMap!8815)

(declare-fun b!825772 () Bool)

(declare-fun lt!373144 () ListLongMap!8815)

(declare-fun +!1930 (ListLongMap!8815 tuple2!9992) ListLongMap!8815)

(assert (=> b!825772 (= e!459704 (= lt!373138 (+!1930 (+!1930 lt!373144 lt!373137) lt!373140)))))

(declare-fun b!825773 () Bool)

(declare-fun res!562932 () Bool)

(assert (=> b!825773 (=> (not res!562932) (not e!459698))))

(declare-datatypes ((List!15794 0))(
  ( (Nil!15791) (Cons!15790 (h!16919 (_ BitVec 64)) (t!22139 List!15794)) )
))
(declare-fun arrayNoDuplicates!0 (array!46176 (_ BitVec 32) List!15794) Bool)

(assert (=> b!825773 (= res!562932 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15791))))

(declare-fun res!562928 () Bool)

(assert (=> start!71100 (=> (not res!562928) (not e!459698))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71100 (= res!562928 (validMask!0 mask!1312))))

(assert (=> start!71100 e!459698))

(assert (=> start!71100 tp_is_empty!14997))

(declare-fun array_inv!17645 (array!46176) Bool)

(assert (=> start!71100 (array_inv!17645 _keys!976)))

(assert (=> start!71100 true))

(declare-fun array_inv!17646 (array!46178) Bool)

(assert (=> start!71100 (and (array_inv!17646 _values!788) e!459702)))

(assert (=> start!71100 tp!46617))

(declare-fun b!825774 () Bool)

(declare-fun res!562930 () Bool)

(assert (=> b!825774 (=> (not res!562930) (not e!459698))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!825774 (= res!562930 (and (= (size!22556 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22555 _keys!976) (size!22556 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!825775 () Bool)

(declare-fun e!459699 () Bool)

(declare-fun zeroValueAfter!34 () V!24997)

(assert (=> b!825775 (= e!459699 (= lt!373138 (+!1930 (+!1930 lt!373144 (tuple2!9993 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!373137)))))

(declare-fun b!825776 () Bool)

(declare-fun e!459700 () Bool)

(assert (=> b!825776 (= e!459700 true)))

(declare-fun lt!373135 () ListLongMap!8815)

(declare-fun lt!373143 () ListLongMap!8815)

(assert (=> b!825776 (= lt!373143 (+!1930 (+!1930 lt!373135 lt!373140) lt!373137))))

(declare-fun lt!373133 () ListLongMap!8815)

(declare-fun lt!373141 () ListLongMap!8815)

(assert (=> b!825776 (and (= lt!373133 lt!373141) (= lt!373138 lt!373141) (= lt!373138 lt!373133))))

(declare-fun lt!373134 () ListLongMap!8815)

(assert (=> b!825776 (= lt!373141 (+!1930 lt!373134 lt!373140))))

(declare-fun lt!373145 () ListLongMap!8815)

(assert (=> b!825776 (= lt!373133 (+!1930 lt!373145 lt!373140))))

(declare-fun zeroValueBefore!34 () V!24997)

(declare-datatypes ((Unit!28307 0))(
  ( (Unit!28308) )
))
(declare-fun lt!373139 () Unit!28307)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!213 (ListLongMap!8815 (_ BitVec 64) V!24997 V!24997) Unit!28307)

(assert (=> b!825776 (= lt!373139 (addSameAsAddTwiceSameKeyDiffValues!213 lt!373145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!825776 e!459704))

(declare-fun res!562933 () Bool)

(assert (=> b!825776 (=> (not res!562933) (not e!459704))))

(declare-fun lt!373146 () ListLongMap!8815)

(assert (=> b!825776 (= res!562933 (= lt!373146 lt!373134))))

(declare-fun lt!373142 () tuple2!9992)

(assert (=> b!825776 (= lt!373134 (+!1930 lt!373145 lt!373142))))

(assert (=> b!825776 (= lt!373145 (+!1930 lt!373135 lt!373137))))

(assert (=> b!825776 (= lt!373140 (tuple2!9993 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!825776 e!459699))

(declare-fun res!562929 () Bool)

(assert (=> b!825776 (=> (not res!562929) (not e!459699))))

(assert (=> b!825776 (= res!562929 (= lt!373146 (+!1930 (+!1930 lt!373135 lt!373142) lt!373137)))))

(declare-fun minValue!754 () V!24997)

(assert (=> b!825776 (= lt!373137 (tuple2!9993 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!825776 (= lt!373142 (tuple2!9993 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2553 (array!46176 array!46178 (_ BitVec 32) (_ BitVec 32) V!24997 V!24997 (_ BitVec 32) Int) ListLongMap!8815)

(assert (=> b!825776 (= lt!373138 (getCurrentListMap!2553 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825776 (= lt!373146 (getCurrentListMap!2553 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24118 () Bool)

(declare-fun tp!46618 () Bool)

(assert (=> mapNonEmpty!24118 (= mapRes!24118 (and tp!46618 e!459701))))

(declare-fun mapValue!24118 () ValueCell!7083)

(declare-fun mapRest!24118 () (Array (_ BitVec 32) ValueCell!7083))

(declare-fun mapKey!24118 () (_ BitVec 32))

(assert (=> mapNonEmpty!24118 (= (arr!22135 _values!788) (store mapRest!24118 mapKey!24118 mapValue!24118))))

(declare-fun b!825777 () Bool)

(assert (=> b!825777 (= e!459698 (not e!459700))))

(declare-fun res!562927 () Bool)

(assert (=> b!825777 (=> res!562927 e!459700)))

(assert (=> b!825777 (= res!562927 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!825777 (= lt!373135 lt!373144)))

(declare-fun lt!373136 () Unit!28307)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!542 (array!46176 array!46178 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24997 V!24997 V!24997 V!24997 (_ BitVec 32) Int) Unit!28307)

(assert (=> b!825777 (= lt!373136 (lemmaNoChangeToArrayThenSameMapNoExtras!542 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2432 (array!46176 array!46178 (_ BitVec 32) (_ BitVec 32) V!24997 V!24997 (_ BitVec 32) Int) ListLongMap!8815)

(assert (=> b!825777 (= lt!373144 (getCurrentListMapNoExtraKeys!2432 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825777 (= lt!373135 (getCurrentListMapNoExtraKeys!2432 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!24118 () Bool)

(assert (=> mapIsEmpty!24118 mapRes!24118))

(assert (= (and start!71100 res!562928) b!825774))

(assert (= (and b!825774 res!562930) b!825769))

(assert (= (and b!825769 res!562931) b!825773))

(assert (= (and b!825773 res!562932) b!825777))

(assert (= (and b!825777 (not res!562927)) b!825776))

(assert (= (and b!825776 res!562929) b!825775))

(assert (= (and b!825776 res!562933) b!825772))

(assert (= (and b!825770 condMapEmpty!24118) mapIsEmpty!24118))

(assert (= (and b!825770 (not condMapEmpty!24118)) mapNonEmpty!24118))

(get-info :version)

(assert (= (and mapNonEmpty!24118 ((_ is ValueCellFull!7083) mapValue!24118)) b!825768))

(assert (= (and b!825770 ((_ is ValueCellFull!7083) mapDefault!24118)) b!825771))

(assert (= start!71100 b!825770))

(declare-fun m!768125 () Bool)

(assert (=> start!71100 m!768125))

(declare-fun m!768127 () Bool)

(assert (=> start!71100 m!768127))

(declare-fun m!768129 () Bool)

(assert (=> start!71100 m!768129))

(declare-fun m!768131 () Bool)

(assert (=> b!825769 m!768131))

(declare-fun m!768133 () Bool)

(assert (=> b!825776 m!768133))

(declare-fun m!768135 () Bool)

(assert (=> b!825776 m!768135))

(declare-fun m!768137 () Bool)

(assert (=> b!825776 m!768137))

(declare-fun m!768139 () Bool)

(assert (=> b!825776 m!768139))

(declare-fun m!768141 () Bool)

(assert (=> b!825776 m!768141))

(declare-fun m!768143 () Bool)

(assert (=> b!825776 m!768143))

(declare-fun m!768145 () Bool)

(assert (=> b!825776 m!768145))

(declare-fun m!768147 () Bool)

(assert (=> b!825776 m!768147))

(assert (=> b!825776 m!768139))

(declare-fun m!768149 () Bool)

(assert (=> b!825776 m!768149))

(declare-fun m!768151 () Bool)

(assert (=> b!825776 m!768151))

(assert (=> b!825776 m!768143))

(declare-fun m!768153 () Bool)

(assert (=> b!825776 m!768153))

(declare-fun m!768155 () Bool)

(assert (=> b!825773 m!768155))

(declare-fun m!768157 () Bool)

(assert (=> b!825772 m!768157))

(assert (=> b!825772 m!768157))

(declare-fun m!768159 () Bool)

(assert (=> b!825772 m!768159))

(declare-fun m!768161 () Bool)

(assert (=> b!825777 m!768161))

(declare-fun m!768163 () Bool)

(assert (=> b!825777 m!768163))

(declare-fun m!768165 () Bool)

(assert (=> b!825777 m!768165))

(declare-fun m!768167 () Bool)

(assert (=> b!825775 m!768167))

(assert (=> b!825775 m!768167))

(declare-fun m!768169 () Bool)

(assert (=> b!825775 m!768169))

(declare-fun m!768171 () Bool)

(assert (=> mapNonEmpty!24118 m!768171))

(check-sat (not b!825769) (not b!825775) b_and!22201 (not b_next!13287) tp_is_empty!14997 (not b!825772) (not b!825773) (not b!825776) (not start!71100) (not mapNonEmpty!24118) (not b!825777))
(check-sat b_and!22201 (not b_next!13287))
