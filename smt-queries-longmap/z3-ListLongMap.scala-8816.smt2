; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107344 () Bool)

(assert start!107344)

(declare-fun b_free!27625 () Bool)

(declare-fun b_next!27625 () Bool)

(assert (=> start!107344 (= b_free!27625 (not b_next!27625))))

(declare-fun tp!97101 () Bool)

(declare-fun b_and!45659 () Bool)

(assert (=> start!107344 (= tp!97101 b_and!45659)))

(declare-fun mapIsEmpty!50794 () Bool)

(declare-fun mapRes!50794 () Bool)

(assert (=> mapIsEmpty!50794 mapRes!50794))

(declare-fun res!845698 () Bool)

(declare-fun e!724746 () Bool)

(assert (=> start!107344 (=> (not res!845698) (not e!724746))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107344 (= res!845698 (validMask!0 mask!1730))))

(assert (=> start!107344 e!724746))

(declare-datatypes ((V!48939 0))(
  ( (V!48940 (val!16479 Int)) )
))
(declare-datatypes ((ValueCell!15551 0))(
  ( (ValueCellFull!15551 (v!19111 V!48939)) (EmptyCell!15551) )
))
(declare-datatypes ((array!82913 0))(
  ( (array!82914 (arr!39989 (Array (_ BitVec 32) ValueCell!15551)) (size!40526 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82913)

(declare-fun e!724749 () Bool)

(declare-fun array_inv!30593 (array!82913) Bool)

(assert (=> start!107344 (and (array_inv!30593 _values!1134) e!724749)))

(assert (=> start!107344 true))

(declare-datatypes ((array!82915 0))(
  ( (array!82916 (arr!39990 (Array (_ BitVec 32) (_ BitVec 64))) (size!40527 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82915)

(declare-fun array_inv!30594 (array!82915) Bool)

(assert (=> start!107344 (array_inv!30594 _keys!1364)))

(declare-fun tp_is_empty!32809 () Bool)

(assert (=> start!107344 tp_is_empty!32809))

(assert (=> start!107344 tp!97101))

(declare-fun mapNonEmpty!50794 () Bool)

(declare-fun tp!97102 () Bool)

(declare-fun e!724748 () Bool)

(assert (=> mapNonEmpty!50794 (= mapRes!50794 (and tp!97102 e!724748))))

(declare-fun mapValue!50794 () ValueCell!15551)

(declare-fun mapKey!50794 () (_ BitVec 32))

(declare-fun mapRest!50794 () (Array (_ BitVec 32) ValueCell!15551))

(assert (=> mapNonEmpty!50794 (= (arr!39989 _values!1134) (store mapRest!50794 mapKey!50794 mapValue!50794))))

(declare-fun b!1271340 () Bool)

(declare-fun res!845697 () Bool)

(assert (=> b!1271340 (=> (not res!845697) (not e!724746))))

(declare-datatypes ((List!28497 0))(
  ( (Nil!28494) (Cons!28493 (h!29711 (_ BitVec 64)) (t!42018 List!28497)) )
))
(declare-fun arrayNoDuplicates!0 (array!82915 (_ BitVec 32) List!28497) Bool)

(assert (=> b!1271340 (= res!845697 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28494))))

(declare-fun b!1271341 () Bool)

(declare-fun res!845700 () Bool)

(assert (=> b!1271341 (=> (not res!845700) (not e!724746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82915 (_ BitVec 32)) Bool)

(assert (=> b!1271341 (= res!845700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271342 () Bool)

(declare-fun e!724750 () Bool)

(assert (=> b!1271342 (= e!724750 tp_is_empty!32809)))

(declare-fun b!1271343 () Bool)

(declare-fun res!845699 () Bool)

(assert (=> b!1271343 (=> (not res!845699) (not e!724746))))

(declare-fun from!1698 () (_ BitVec 32))

(assert (=> b!1271343 (= res!845699 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40527 _keys!1364)) (bvslt from!1698 (size!40527 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1271344 () Bool)

(assert (=> b!1271344 (= e!724746 (not true))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48939)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48939)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48939)

(declare-fun zeroValueBefore!52 () V!48939)

(declare-datatypes ((tuple2!21354 0))(
  ( (tuple2!21355 (_1!10688 (_ BitVec 64)) (_2!10688 V!48939)) )
))
(declare-datatypes ((List!28498 0))(
  ( (Nil!28495) (Cons!28494 (h!29712 tuple2!21354) (t!42019 List!28498)) )
))
(declare-datatypes ((ListLongMap!19091 0))(
  ( (ListLongMap!19092 (toList!9561 List!28498)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5933 (array!82915 array!82913 (_ BitVec 32) (_ BitVec 32) V!48939 V!48939 (_ BitVec 32) Int) ListLongMap!19091)

(assert (=> b!1271344 (= (getCurrentListMapNoExtraKeys!5933 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5933 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42263 0))(
  ( (Unit!42264) )
))
(declare-fun lt!575134 () Unit!42263)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1223 (array!82915 array!82913 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48939 V!48939 V!48939 V!48939 (_ BitVec 32) Int) Unit!42263)

(assert (=> b!1271344 (= lt!575134 (lemmaNoChangeToArrayThenSameMapNoExtras!1223 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1271345 () Bool)

(assert (=> b!1271345 (= e!724748 tp_is_empty!32809)))

(declare-fun b!1271346 () Bool)

(declare-fun res!845696 () Bool)

(assert (=> b!1271346 (=> (not res!845696) (not e!724746))))

(assert (=> b!1271346 (= res!845696 (and (= (size!40526 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40527 _keys!1364) (size!40526 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271347 () Bool)

(assert (=> b!1271347 (= e!724749 (and e!724750 mapRes!50794))))

(declare-fun condMapEmpty!50794 () Bool)

(declare-fun mapDefault!50794 () ValueCell!15551)

(assert (=> b!1271347 (= condMapEmpty!50794 (= (arr!39989 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15551)) mapDefault!50794)))))

(assert (= (and start!107344 res!845698) b!1271346))

(assert (= (and b!1271346 res!845696) b!1271341))

(assert (= (and b!1271341 res!845700) b!1271340))

(assert (= (and b!1271340 res!845697) b!1271343))

(assert (= (and b!1271343 res!845699) b!1271344))

(assert (= (and b!1271347 condMapEmpty!50794) mapIsEmpty!50794))

(assert (= (and b!1271347 (not condMapEmpty!50794)) mapNonEmpty!50794))

(get-info :version)

(assert (= (and mapNonEmpty!50794 ((_ is ValueCellFull!15551) mapValue!50794)) b!1271345))

(assert (= (and b!1271347 ((_ is ValueCellFull!15551) mapDefault!50794)) b!1271342))

(assert (= start!107344 b!1271347))

(declare-fun m!1170039 () Bool)

(assert (=> start!107344 m!1170039))

(declare-fun m!1170041 () Bool)

(assert (=> start!107344 m!1170041))

(declare-fun m!1170043 () Bool)

(assert (=> start!107344 m!1170043))

(declare-fun m!1170045 () Bool)

(assert (=> mapNonEmpty!50794 m!1170045))

(declare-fun m!1170047 () Bool)

(assert (=> b!1271344 m!1170047))

(declare-fun m!1170049 () Bool)

(assert (=> b!1271344 m!1170049))

(declare-fun m!1170051 () Bool)

(assert (=> b!1271344 m!1170051))

(declare-fun m!1170053 () Bool)

(assert (=> b!1271340 m!1170053))

(declare-fun m!1170055 () Bool)

(assert (=> b!1271341 m!1170055))

(check-sat (not mapNonEmpty!50794) (not start!107344) (not b!1271344) tp_is_empty!32809 (not b!1271341) (not b_next!27625) b_and!45659 (not b!1271340))
(check-sat b_and!45659 (not b_next!27625))
