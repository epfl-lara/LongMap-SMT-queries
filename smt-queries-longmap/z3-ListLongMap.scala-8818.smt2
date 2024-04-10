; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107134 () Bool)

(assert start!107134)

(declare-fun b_free!27639 () Bool)

(declare-fun b_next!27639 () Bool)

(assert (=> start!107134 (= b_free!27639 (not b_next!27639))))

(declare-fun tp!97143 () Bool)

(declare-fun b_and!45671 () Bool)

(assert (=> start!107134 (= tp!97143 b_and!45671)))

(declare-fun b!1270203 () Bool)

(declare-fun res!845281 () Bool)

(declare-fun e!724007 () Bool)

(assert (=> b!1270203 (=> (not res!845281) (not e!724007))))

(declare-datatypes ((V!48957 0))(
  ( (V!48958 (val!16486 Int)) )
))
(declare-datatypes ((ValueCell!15558 0))(
  ( (ValueCellFull!15558 (v!19123 V!48957)) (EmptyCell!15558) )
))
(declare-datatypes ((array!82908 0))(
  ( (array!82909 (arr!39991 (Array (_ BitVec 32) ValueCell!15558)) (size!40527 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82908)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82910 0))(
  ( (array!82911 (arr!39992 (Array (_ BitVec 32) (_ BitVec 64))) (size!40528 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82910)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270203 (= res!845281 (and (= (size!40527 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40528 _keys!1364) (size!40527 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270205 () Bool)

(declare-fun e!724005 () Bool)

(declare-fun tp_is_empty!32823 () Bool)

(assert (=> b!1270205 (= e!724005 tp_is_empty!32823)))

(declare-fun b!1270206 () Bool)

(declare-fun res!845285 () Bool)

(assert (=> b!1270206 (=> (not res!845285) (not e!724007))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82910 (_ BitVec 32)) Bool)

(assert (=> b!1270206 (= res!845285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270207 () Bool)

(declare-fun res!845283 () Bool)

(assert (=> b!1270207 (=> (not res!845283) (not e!724007))))

(declare-datatypes ((List!28474 0))(
  ( (Nil!28471) (Cons!28470 (h!29679 (_ BitVec 64)) (t!42003 List!28474)) )
))
(declare-fun arrayNoDuplicates!0 (array!82910 (_ BitVec 32) List!28474) Bool)

(assert (=> b!1270207 (= res!845283 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28471))))

(declare-fun b!1270208 () Bool)

(declare-fun e!724006 () Bool)

(declare-fun e!724008 () Bool)

(declare-fun mapRes!50815 () Bool)

(assert (=> b!1270208 (= e!724006 (and e!724008 mapRes!50815))))

(declare-fun condMapEmpty!50815 () Bool)

(declare-fun mapDefault!50815 () ValueCell!15558)

(assert (=> b!1270208 (= condMapEmpty!50815 (= (arr!39991 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15558)) mapDefault!50815)))))

(declare-fun b!1270209 () Bool)

(assert (=> b!1270209 (= e!724007 (not true))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48957)

(declare-fun minValueBefore!52 () V!48957)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48957)

(declare-fun zeroValueBefore!52 () V!48957)

(declare-datatypes ((tuple2!21358 0))(
  ( (tuple2!21359 (_1!10690 (_ BitVec 64)) (_2!10690 V!48957)) )
))
(declare-datatypes ((List!28475 0))(
  ( (Nil!28472) (Cons!28471 (h!29680 tuple2!21358) (t!42004 List!28475)) )
))
(declare-datatypes ((ListLongMap!19087 0))(
  ( (ListLongMap!19088 (toList!9559 List!28475)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5891 (array!82910 array!82908 (_ BitVec 32) (_ BitVec 32) V!48957 V!48957 (_ BitVec 32) Int) ListLongMap!19087)

(assert (=> b!1270209 (= (getCurrentListMapNoExtraKeys!5891 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5891 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42304 0))(
  ( (Unit!42305) )
))
(declare-fun lt!574671 () Unit!42304)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1233 (array!82910 array!82908 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48957 V!48957 V!48957 V!48957 (_ BitVec 32) Int) Unit!42304)

(assert (=> b!1270209 (= lt!574671 (lemmaNoChangeToArrayThenSameMapNoExtras!1233 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun mapIsEmpty!50815 () Bool)

(assert (=> mapIsEmpty!50815 mapRes!50815))

(declare-fun b!1270204 () Bool)

(declare-fun res!845282 () Bool)

(assert (=> b!1270204 (=> (not res!845282) (not e!724007))))

(assert (=> b!1270204 (= res!845282 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40528 _keys!1364)) (bvslt from!1698 (size!40528 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun res!845284 () Bool)

(assert (=> start!107134 (=> (not res!845284) (not e!724007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107134 (= res!845284 (validMask!0 mask!1730))))

(assert (=> start!107134 e!724007))

(declare-fun array_inv!30417 (array!82908) Bool)

(assert (=> start!107134 (and (array_inv!30417 _values!1134) e!724006)))

(assert (=> start!107134 true))

(declare-fun array_inv!30418 (array!82910) Bool)

(assert (=> start!107134 (array_inv!30418 _keys!1364)))

(assert (=> start!107134 tp_is_empty!32823))

(assert (=> start!107134 tp!97143))

(declare-fun b!1270210 () Bool)

(assert (=> b!1270210 (= e!724008 tp_is_empty!32823)))

(declare-fun mapNonEmpty!50815 () Bool)

(declare-fun tp!97144 () Bool)

(assert (=> mapNonEmpty!50815 (= mapRes!50815 (and tp!97144 e!724005))))

(declare-fun mapRest!50815 () (Array (_ BitVec 32) ValueCell!15558))

(declare-fun mapValue!50815 () ValueCell!15558)

(declare-fun mapKey!50815 () (_ BitVec 32))

(assert (=> mapNonEmpty!50815 (= (arr!39991 _values!1134) (store mapRest!50815 mapKey!50815 mapValue!50815))))

(assert (= (and start!107134 res!845284) b!1270203))

(assert (= (and b!1270203 res!845281) b!1270206))

(assert (= (and b!1270206 res!845285) b!1270207))

(assert (= (and b!1270207 res!845283) b!1270204))

(assert (= (and b!1270204 res!845282) b!1270209))

(assert (= (and b!1270208 condMapEmpty!50815) mapIsEmpty!50815))

(assert (= (and b!1270208 (not condMapEmpty!50815)) mapNonEmpty!50815))

(get-info :version)

(assert (= (and mapNonEmpty!50815 ((_ is ValueCellFull!15558) mapValue!50815)) b!1270205))

(assert (= (and b!1270208 ((_ is ValueCellFull!15558) mapDefault!50815)) b!1270210))

(assert (= start!107134 b!1270208))

(declare-fun m!1168553 () Bool)

(assert (=> b!1270207 m!1168553))

(declare-fun m!1168555 () Bool)

(assert (=> mapNonEmpty!50815 m!1168555))

(declare-fun m!1168557 () Bool)

(assert (=> start!107134 m!1168557))

(declare-fun m!1168559 () Bool)

(assert (=> start!107134 m!1168559))

(declare-fun m!1168561 () Bool)

(assert (=> start!107134 m!1168561))

(declare-fun m!1168563 () Bool)

(assert (=> b!1270209 m!1168563))

(declare-fun m!1168565 () Bool)

(assert (=> b!1270209 m!1168565))

(declare-fun m!1168567 () Bool)

(assert (=> b!1270209 m!1168567))

(declare-fun m!1168569 () Bool)

(assert (=> b!1270206 m!1168569))

(check-sat (not b!1270209) tp_is_empty!32823 b_and!45671 (not b!1270207) (not b_next!27639) (not mapNonEmpty!50815) (not start!107134) (not b!1270206))
(check-sat b_and!45671 (not b_next!27639))
