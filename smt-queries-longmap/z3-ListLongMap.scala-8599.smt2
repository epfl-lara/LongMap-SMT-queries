; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104826 () Bool)

(assert start!104826)

(declare-fun b_free!26631 () Bool)

(declare-fun b_next!26631 () Bool)

(assert (=> start!104826 (= b_free!26631 (not b_next!26631))))

(declare-fun tp!93383 () Bool)

(declare-fun b_and!44399 () Bool)

(assert (=> start!104826 (= tp!93383 b_and!44399)))

(declare-fun b!1249516 () Bool)

(declare-fun res!833510 () Bool)

(declare-fun e!709189 () Bool)

(assert (=> b!1249516 (=> (not res!833510) (not e!709189))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80746 0))(
  ( (array!80747 (arr!38940 (Array (_ BitVec 32) (_ BitVec 64))) (size!39476 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80746)

(declare-datatypes ((V!47409 0))(
  ( (V!47410 (val!15829 Int)) )
))
(declare-datatypes ((ValueCell!15003 0))(
  ( (ValueCellFull!15003 (v!18525 V!47409)) (EmptyCell!15003) )
))
(declare-datatypes ((array!80748 0))(
  ( (array!80749 (arr!38941 (Array (_ BitVec 32) ValueCell!15003)) (size!39477 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80748)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1249516 (= res!833510 (and (= (size!39477 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39476 _keys!1118) (size!39477 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249517 () Bool)

(declare-fun e!709190 () Bool)

(declare-fun e!709192 () Bool)

(declare-fun mapRes!49060 () Bool)

(assert (=> b!1249517 (= e!709190 (and e!709192 mapRes!49060))))

(declare-fun condMapEmpty!49060 () Bool)

(declare-fun mapDefault!49060 () ValueCell!15003)

(assert (=> b!1249517 (= condMapEmpty!49060 (= (arr!38941 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15003)) mapDefault!49060)))))

(declare-fun b!1249518 () Bool)

(assert (=> b!1249518 (= e!709189 (not true))))

(declare-datatypes ((tuple2!20392 0))(
  ( (tuple2!20393 (_1!10207 (_ BitVec 64)) (_2!10207 V!47409)) )
))
(declare-datatypes ((List!27635 0))(
  ( (Nil!27632) (Cons!27631 (h!28840 tuple2!20392) (t!41106 List!27635)) )
))
(declare-datatypes ((ListLongMap!18265 0))(
  ( (ListLongMap!18266 (toList!9148 List!27635)) )
))
(declare-fun lt!563762 () ListLongMap!18265)

(declare-fun lt!563763 () ListLongMap!18265)

(assert (=> b!1249518 (= lt!563762 lt!563763)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47409)

(declare-fun zeroValue!871 () V!47409)

(declare-datatypes ((Unit!41493 0))(
  ( (Unit!41494) )
))
(declare-fun lt!563764 () Unit!41493)

(declare-fun minValueBefore!43 () V!47409)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!919 (array!80746 array!80748 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47409 V!47409 V!47409 V!47409 (_ BitVec 32) Int) Unit!41493)

(assert (=> b!1249518 (= lt!563764 (lemmaNoChangeToArrayThenSameMapNoExtras!919 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5555 (array!80746 array!80748 (_ BitVec 32) (_ BitVec 32) V!47409 V!47409 (_ BitVec 32) Int) ListLongMap!18265)

(assert (=> b!1249518 (= lt!563763 (getCurrentListMapNoExtraKeys!5555 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1249518 (= lt!563762 (getCurrentListMapNoExtraKeys!5555 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49060 () Bool)

(declare-fun tp!93382 () Bool)

(declare-fun e!709191 () Bool)

(assert (=> mapNonEmpty!49060 (= mapRes!49060 (and tp!93382 e!709191))))

(declare-fun mapRest!49060 () (Array (_ BitVec 32) ValueCell!15003))

(declare-fun mapKey!49060 () (_ BitVec 32))

(declare-fun mapValue!49060 () ValueCell!15003)

(assert (=> mapNonEmpty!49060 (= (arr!38941 _values!914) (store mapRest!49060 mapKey!49060 mapValue!49060))))

(declare-fun b!1249519 () Bool)

(declare-fun tp_is_empty!31533 () Bool)

(assert (=> b!1249519 (= e!709192 tp_is_empty!31533)))

(declare-fun b!1249520 () Bool)

(assert (=> b!1249520 (= e!709191 tp_is_empty!31533)))

(declare-fun mapIsEmpty!49060 () Bool)

(assert (=> mapIsEmpty!49060 mapRes!49060))

(declare-fun b!1249521 () Bool)

(declare-fun res!833508 () Bool)

(assert (=> b!1249521 (=> (not res!833508) (not e!709189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80746 (_ BitVec 32)) Bool)

(assert (=> b!1249521 (= res!833508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!833509 () Bool)

(assert (=> start!104826 (=> (not res!833509) (not e!709189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104826 (= res!833509 (validMask!0 mask!1466))))

(assert (=> start!104826 e!709189))

(assert (=> start!104826 true))

(assert (=> start!104826 tp!93383))

(assert (=> start!104826 tp_is_empty!31533))

(declare-fun array_inv!29715 (array!80746) Bool)

(assert (=> start!104826 (array_inv!29715 _keys!1118)))

(declare-fun array_inv!29716 (array!80748) Bool)

(assert (=> start!104826 (and (array_inv!29716 _values!914) e!709190)))

(declare-fun b!1249515 () Bool)

(declare-fun res!833511 () Bool)

(assert (=> b!1249515 (=> (not res!833511) (not e!709189))))

(declare-datatypes ((List!27636 0))(
  ( (Nil!27633) (Cons!27632 (h!28841 (_ BitVec 64)) (t!41107 List!27636)) )
))
(declare-fun arrayNoDuplicates!0 (array!80746 (_ BitVec 32) List!27636) Bool)

(assert (=> b!1249515 (= res!833511 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27633))))

(assert (= (and start!104826 res!833509) b!1249516))

(assert (= (and b!1249516 res!833510) b!1249521))

(assert (= (and b!1249521 res!833508) b!1249515))

(assert (= (and b!1249515 res!833511) b!1249518))

(assert (= (and b!1249517 condMapEmpty!49060) mapIsEmpty!49060))

(assert (= (and b!1249517 (not condMapEmpty!49060)) mapNonEmpty!49060))

(get-info :version)

(assert (= (and mapNonEmpty!49060 ((_ is ValueCellFull!15003) mapValue!49060)) b!1249520))

(assert (= (and b!1249517 ((_ is ValueCellFull!15003) mapDefault!49060)) b!1249519))

(assert (= start!104826 b!1249517))

(declare-fun m!1150433 () Bool)

(assert (=> mapNonEmpty!49060 m!1150433))

(declare-fun m!1150435 () Bool)

(assert (=> b!1249521 m!1150435))

(declare-fun m!1150437 () Bool)

(assert (=> b!1249518 m!1150437))

(declare-fun m!1150439 () Bool)

(assert (=> b!1249518 m!1150439))

(declare-fun m!1150441 () Bool)

(assert (=> b!1249518 m!1150441))

(declare-fun m!1150443 () Bool)

(assert (=> b!1249515 m!1150443))

(declare-fun m!1150445 () Bool)

(assert (=> start!104826 m!1150445))

(declare-fun m!1150447 () Bool)

(assert (=> start!104826 m!1150447))

(declare-fun m!1150449 () Bool)

(assert (=> start!104826 m!1150449))

(check-sat b_and!44399 tp_is_empty!31533 (not start!104826) (not b!1249521) (not b!1249515) (not mapNonEmpty!49060) (not b!1249518) (not b_next!26631))
(check-sat b_and!44399 (not b_next!26631))
