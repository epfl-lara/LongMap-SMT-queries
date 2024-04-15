; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105480 () Bool)

(assert start!105480)

(declare-fun b_free!27121 () Bool)

(declare-fun b_next!27121 () Bool)

(assert (=> start!105480 (= b_free!27121 (not b_next!27121))))

(declare-fun tp!94880 () Bool)

(declare-fun b_and!44959 () Bool)

(assert (=> start!105480 (= tp!94880 b_and!44959)))

(declare-fun mapNonEmpty!49822 () Bool)

(declare-fun mapRes!49822 () Bool)

(declare-fun tp!94879 () Bool)

(declare-fun e!714425 () Bool)

(assert (=> mapNonEmpty!49822 (= mapRes!49822 (and tp!94879 e!714425))))

(declare-datatypes ((V!48063 0))(
  ( (V!48064 (val!16074 Int)) )
))
(declare-datatypes ((ValueCell!15248 0))(
  ( (ValueCellFull!15248 (v!18774 V!48063)) (EmptyCell!15248) )
))
(declare-fun mapRest!49822 () (Array (_ BitVec 32) ValueCell!15248))

(declare-fun mapValue!49822 () ValueCell!15248)

(declare-fun mapKey!49822 () (_ BitVec 32))

(declare-datatypes ((array!81615 0))(
  ( (array!81616 (arr!39366 (Array (_ BitVec 32) ValueCell!15248)) (size!39904 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81615)

(assert (=> mapNonEmpty!49822 (= (arr!39366 _values!914) (store mapRest!49822 mapKey!49822 mapValue!49822))))

(declare-fun b!1256626 () Bool)

(declare-fun res!837711 () Bool)

(declare-fun e!714421 () Bool)

(assert (=> b!1256626 (=> (not res!837711) (not e!714421))))

(declare-datatypes ((array!81617 0))(
  ( (array!81618 (arr!39367 (Array (_ BitVec 32) (_ BitVec 64))) (size!39905 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81617)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81617 (_ BitVec 32)) Bool)

(assert (=> b!1256626 (= res!837711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49822 () Bool)

(assert (=> mapIsEmpty!49822 mapRes!49822))

(declare-fun b!1256627 () Bool)

(declare-fun res!837716 () Bool)

(assert (=> b!1256627 (=> (not res!837716) (not e!714421))))

(declare-datatypes ((List!28056 0))(
  ( (Nil!28053) (Cons!28052 (h!29261 (_ BitVec 64)) (t!41536 List!28056)) )
))
(declare-fun arrayNoDuplicates!0 (array!81617 (_ BitVec 32) List!28056) Bool)

(assert (=> b!1256627 (= res!837716 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28053))))

(declare-fun b!1256628 () Bool)

(declare-fun e!714426 () Bool)

(assert (=> b!1256628 (= e!714421 (not e!714426))))

(declare-fun res!837713 () Bool)

(assert (=> b!1256628 (=> res!837713 e!714426)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1256628 (= res!837713 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!20848 0))(
  ( (tuple2!20849 (_1!10435 (_ BitVec 64)) (_2!10435 V!48063)) )
))
(declare-datatypes ((List!28057 0))(
  ( (Nil!28054) (Cons!28053 (h!29262 tuple2!20848) (t!41537 List!28057)) )
))
(declare-datatypes ((ListLongMap!18721 0))(
  ( (ListLongMap!18722 (toList!9376 List!28057)) )
))
(declare-fun lt!568124 () ListLongMap!18721)

(declare-fun lt!568125 () ListLongMap!18721)

(assert (=> b!1256628 (= lt!568124 lt!568125)))

(declare-datatypes ((Unit!41709 0))(
  ( (Unit!41710) )
))
(declare-fun lt!568126 () Unit!41709)

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48063)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48063)

(declare-fun minValueBefore!43 () V!48063)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1083 (array!81617 array!81615 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48063 V!48063 V!48063 V!48063 (_ BitVec 32) Int) Unit!41709)

(assert (=> b!1256628 (= lt!568126 (lemmaNoChangeToArrayThenSameMapNoExtras!1083 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5761 (array!81617 array!81615 (_ BitVec 32) (_ BitVec 32) V!48063 V!48063 (_ BitVec 32) Int) ListLongMap!18721)

(assert (=> b!1256628 (= lt!568125 (getCurrentListMapNoExtraKeys!5761 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256628 (= lt!568124 (getCurrentListMapNoExtraKeys!5761 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256629 () Bool)

(declare-fun tp_is_empty!32023 () Bool)

(assert (=> b!1256629 (= e!714425 tp_is_empty!32023)))

(declare-fun res!837715 () Bool)

(assert (=> start!105480 (=> (not res!837715) (not e!714421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105480 (= res!837715 (validMask!0 mask!1466))))

(assert (=> start!105480 e!714421))

(assert (=> start!105480 true))

(assert (=> start!105480 tp!94880))

(assert (=> start!105480 tp_is_empty!32023))

(declare-fun array_inv!30123 (array!81617) Bool)

(assert (=> start!105480 (array_inv!30123 _keys!1118)))

(declare-fun e!714424 () Bool)

(declare-fun array_inv!30124 (array!81615) Bool)

(assert (=> start!105480 (and (array_inv!30124 _values!914) e!714424)))

(declare-fun b!1256625 () Bool)

(declare-fun e!714420 () Bool)

(assert (=> b!1256625 (= e!714424 (and e!714420 mapRes!49822))))

(declare-fun condMapEmpty!49822 () Bool)

(declare-fun mapDefault!49822 () ValueCell!15248)

(assert (=> b!1256625 (= condMapEmpty!49822 (= (arr!39366 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15248)) mapDefault!49822)))))

(declare-fun b!1256630 () Bool)

(declare-fun e!714422 () Bool)

(assert (=> b!1256630 (= e!714422 true)))

(declare-fun lt!568127 () ListLongMap!18721)

(declare-fun -!2040 (ListLongMap!18721 (_ BitVec 64)) ListLongMap!18721)

(assert (=> b!1256630 (= (-!2040 lt!568127 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568127)))

(declare-fun lt!568128 () Unit!41709)

(declare-fun removeNotPresentStillSame!135 (ListLongMap!18721 (_ BitVec 64)) Unit!41709)

(assert (=> b!1256630 (= lt!568128 (removeNotPresentStillSame!135 lt!568127 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1256631 () Bool)

(assert (=> b!1256631 (= e!714426 e!714422)))

(declare-fun res!837714 () Bool)

(assert (=> b!1256631 (=> res!837714 e!714422)))

(declare-fun contains!7527 (ListLongMap!18721 (_ BitVec 64)) Bool)

(assert (=> b!1256631 (= res!837714 (contains!7527 lt!568127 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4486 (array!81617 array!81615 (_ BitVec 32) (_ BitVec 32) V!48063 V!48063 (_ BitVec 32) Int) ListLongMap!18721)

(assert (=> b!1256631 (= lt!568127 (getCurrentListMap!4486 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256632 () Bool)

(declare-fun res!837712 () Bool)

(assert (=> b!1256632 (=> (not res!837712) (not e!714421))))

(assert (=> b!1256632 (= res!837712 (and (= (size!39904 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39905 _keys!1118) (size!39904 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1256633 () Bool)

(assert (=> b!1256633 (= e!714420 tp_is_empty!32023)))

(assert (= (and start!105480 res!837715) b!1256632))

(assert (= (and b!1256632 res!837712) b!1256626))

(assert (= (and b!1256626 res!837711) b!1256627))

(assert (= (and b!1256627 res!837716) b!1256628))

(assert (= (and b!1256628 (not res!837713)) b!1256631))

(assert (= (and b!1256631 (not res!837714)) b!1256630))

(assert (= (and b!1256625 condMapEmpty!49822) mapIsEmpty!49822))

(assert (= (and b!1256625 (not condMapEmpty!49822)) mapNonEmpty!49822))

(get-info :version)

(assert (= (and mapNonEmpty!49822 ((_ is ValueCellFull!15248) mapValue!49822)) b!1256629))

(assert (= (and b!1256625 ((_ is ValueCellFull!15248) mapDefault!49822)) b!1256633))

(assert (= start!105480 b!1256625))

(declare-fun m!1156825 () Bool)

(assert (=> b!1256631 m!1156825))

(declare-fun m!1156827 () Bool)

(assert (=> b!1256631 m!1156827))

(declare-fun m!1156829 () Bool)

(assert (=> b!1256630 m!1156829))

(declare-fun m!1156831 () Bool)

(assert (=> b!1256630 m!1156831))

(declare-fun m!1156833 () Bool)

(assert (=> b!1256626 m!1156833))

(declare-fun m!1156835 () Bool)

(assert (=> start!105480 m!1156835))

(declare-fun m!1156837 () Bool)

(assert (=> start!105480 m!1156837))

(declare-fun m!1156839 () Bool)

(assert (=> start!105480 m!1156839))

(declare-fun m!1156841 () Bool)

(assert (=> mapNonEmpty!49822 m!1156841))

(declare-fun m!1156843 () Bool)

(assert (=> b!1256628 m!1156843))

(declare-fun m!1156845 () Bool)

(assert (=> b!1256628 m!1156845))

(declare-fun m!1156847 () Bool)

(assert (=> b!1256628 m!1156847))

(declare-fun m!1156849 () Bool)

(assert (=> b!1256627 m!1156849))

(check-sat (not start!105480) (not b!1256626) (not b_next!27121) (not b!1256630) (not mapNonEmpty!49822) (not b!1256627) b_and!44959 (not b!1256631) (not b!1256628) tp_is_empty!32023)
(check-sat b_and!44959 (not b_next!27121))
