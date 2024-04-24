; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107350 () Bool)

(assert start!107350)

(declare-fun b_free!27631 () Bool)

(declare-fun b_next!27631 () Bool)

(assert (=> start!107350 (= b_free!27631 (not b_next!27631))))

(declare-fun tp!97119 () Bool)

(declare-fun b_and!45665 () Bool)

(assert (=> start!107350 (= tp!97119 b_and!45665)))

(declare-fun mapIsEmpty!50803 () Bool)

(declare-fun mapRes!50803 () Bool)

(assert (=> mapIsEmpty!50803 mapRes!50803))

(declare-fun b!1271412 () Bool)

(declare-fun e!724793 () Bool)

(declare-fun tp_is_empty!32815 () Bool)

(assert (=> b!1271412 (= e!724793 tp_is_empty!32815)))

(declare-fun b!1271413 () Bool)

(declare-fun res!845742 () Bool)

(declare-fun e!724794 () Bool)

(assert (=> b!1271413 (=> (not res!845742) (not e!724794))))

(declare-datatypes ((V!48947 0))(
  ( (V!48948 (val!16482 Int)) )
))
(declare-datatypes ((ValueCell!15554 0))(
  ( (ValueCellFull!15554 (v!19114 V!48947)) (EmptyCell!15554) )
))
(declare-datatypes ((array!82923 0))(
  ( (array!82924 (arr!39994 (Array (_ BitVec 32) ValueCell!15554)) (size!40531 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82923)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82925 0))(
  ( (array!82926 (arr!39995 (Array (_ BitVec 32) (_ BitVec 64))) (size!40532 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82925)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271413 (= res!845742 (and (= (size!40531 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40532 _keys!1364) (size!40531 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271414 () Bool)

(declare-fun res!845743 () Bool)

(assert (=> b!1271414 (=> (not res!845743) (not e!724794))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82925 (_ BitVec 32)) Bool)

(assert (=> b!1271414 (= res!845743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271415 () Bool)

(declare-fun res!845744 () Bool)

(assert (=> b!1271415 (=> (not res!845744) (not e!724794))))

(declare-datatypes ((List!28501 0))(
  ( (Nil!28498) (Cons!28497 (h!29715 (_ BitVec 64)) (t!42022 List!28501)) )
))
(declare-fun arrayNoDuplicates!0 (array!82925 (_ BitVec 32) List!28501) Bool)

(assert (=> b!1271415 (= res!845744 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28498))))

(declare-fun b!1271416 () Bool)

(declare-fun e!724792 () Bool)

(assert (=> b!1271416 (= e!724792 (and e!724793 mapRes!50803))))

(declare-fun condMapEmpty!50803 () Bool)

(declare-fun mapDefault!50803 () ValueCell!15554)

(assert (=> b!1271416 (= condMapEmpty!50803 (= (arr!39994 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15554)) mapDefault!50803)))))

(declare-fun b!1271417 () Bool)

(assert (=> b!1271417 (= e!724794 (not true))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48947)

(declare-fun minValueBefore!52 () V!48947)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48947)

(declare-fun zeroValueBefore!52 () V!48947)

(declare-datatypes ((tuple2!21358 0))(
  ( (tuple2!21359 (_1!10690 (_ BitVec 64)) (_2!10690 V!48947)) )
))
(declare-datatypes ((List!28502 0))(
  ( (Nil!28499) (Cons!28498 (h!29716 tuple2!21358) (t!42023 List!28502)) )
))
(declare-datatypes ((ListLongMap!19095 0))(
  ( (ListLongMap!19096 (toList!9563 List!28502)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5935 (array!82925 array!82923 (_ BitVec 32) (_ BitVec 32) V!48947 V!48947 (_ BitVec 32) Int) ListLongMap!19095)

(assert (=> b!1271417 (= (getCurrentListMapNoExtraKeys!5935 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5935 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42267 0))(
  ( (Unit!42268) )
))
(declare-fun lt!575143 () Unit!42267)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1225 (array!82925 array!82923 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48947 V!48947 V!48947 V!48947 (_ BitVec 32) Int) Unit!42267)

(assert (=> b!1271417 (= lt!575143 (lemmaNoChangeToArrayThenSameMapNoExtras!1225 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1271418 () Bool)

(declare-fun e!724791 () Bool)

(assert (=> b!1271418 (= e!724791 tp_is_empty!32815)))

(declare-fun b!1271419 () Bool)

(declare-fun res!845741 () Bool)

(assert (=> b!1271419 (=> (not res!845741) (not e!724794))))

(assert (=> b!1271419 (= res!845741 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40532 _keys!1364)) (bvslt from!1698 (size!40532 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun res!845745 () Bool)

(assert (=> start!107350 (=> (not res!845745) (not e!724794))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107350 (= res!845745 (validMask!0 mask!1730))))

(assert (=> start!107350 e!724794))

(declare-fun array_inv!30597 (array!82923) Bool)

(assert (=> start!107350 (and (array_inv!30597 _values!1134) e!724792)))

(assert (=> start!107350 true))

(declare-fun array_inv!30598 (array!82925) Bool)

(assert (=> start!107350 (array_inv!30598 _keys!1364)))

(assert (=> start!107350 tp_is_empty!32815))

(assert (=> start!107350 tp!97119))

(declare-fun mapNonEmpty!50803 () Bool)

(declare-fun tp!97120 () Bool)

(assert (=> mapNonEmpty!50803 (= mapRes!50803 (and tp!97120 e!724791))))

(declare-fun mapKey!50803 () (_ BitVec 32))

(declare-fun mapRest!50803 () (Array (_ BitVec 32) ValueCell!15554))

(declare-fun mapValue!50803 () ValueCell!15554)

(assert (=> mapNonEmpty!50803 (= (arr!39994 _values!1134) (store mapRest!50803 mapKey!50803 mapValue!50803))))

(assert (= (and start!107350 res!845745) b!1271413))

(assert (= (and b!1271413 res!845742) b!1271414))

(assert (= (and b!1271414 res!845743) b!1271415))

(assert (= (and b!1271415 res!845744) b!1271419))

(assert (= (and b!1271419 res!845741) b!1271417))

(assert (= (and b!1271416 condMapEmpty!50803) mapIsEmpty!50803))

(assert (= (and b!1271416 (not condMapEmpty!50803)) mapNonEmpty!50803))

(get-info :version)

(assert (= (and mapNonEmpty!50803 ((_ is ValueCellFull!15554) mapValue!50803)) b!1271418))

(assert (= (and b!1271416 ((_ is ValueCellFull!15554) mapDefault!50803)) b!1271412))

(assert (= start!107350 b!1271416))

(declare-fun m!1170093 () Bool)

(assert (=> b!1271414 m!1170093))

(declare-fun m!1170095 () Bool)

(assert (=> start!107350 m!1170095))

(declare-fun m!1170097 () Bool)

(assert (=> start!107350 m!1170097))

(declare-fun m!1170099 () Bool)

(assert (=> start!107350 m!1170099))

(declare-fun m!1170101 () Bool)

(assert (=> b!1271415 m!1170101))

(declare-fun m!1170103 () Bool)

(assert (=> b!1271417 m!1170103))

(declare-fun m!1170105 () Bool)

(assert (=> b!1271417 m!1170105))

(declare-fun m!1170107 () Bool)

(assert (=> b!1271417 m!1170107))

(declare-fun m!1170109 () Bool)

(assert (=> mapNonEmpty!50803 m!1170109))

(check-sat tp_is_empty!32815 (not b_next!27631) (not mapNonEmpty!50803) b_and!45665 (not b!1271414) (not b!1271417) (not start!107350) (not b!1271415))
(check-sat b_and!45665 (not b_next!27631))
