; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105550 () Bool)

(assert start!105550)

(declare-fun b_free!27169 () Bool)

(declare-fun b_next!27169 () Bool)

(assert (=> start!105550 (= b_free!27169 (not b_next!27169))))

(declare-fun tp!95027 () Bool)

(declare-fun b_and!45017 () Bool)

(assert (=> start!105550 (= tp!95027 b_and!45017)))

(declare-fun mapIsEmpty!49897 () Bool)

(declare-fun mapRes!49897 () Bool)

(assert (=> mapIsEmpty!49897 mapRes!49897))

(declare-fun b!1257408 () Bool)

(declare-fun e!715003 () Bool)

(declare-fun tp_is_empty!32071 () Bool)

(assert (=> b!1257408 (= e!715003 tp_is_empty!32071)))

(declare-fun b!1257409 () Bool)

(declare-fun res!838182 () Bool)

(declare-fun e!715004 () Bool)

(assert (=> b!1257409 (=> (not res!838182) (not e!715004))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81701 0))(
  ( (array!81702 (arr!39408 (Array (_ BitVec 32) (_ BitVec 64))) (size!39946 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81701)

(declare-datatypes ((V!48127 0))(
  ( (V!48128 (val!16098 Int)) )
))
(declare-datatypes ((ValueCell!15272 0))(
  ( (ValueCellFull!15272 (v!18799 V!48127)) (EmptyCell!15272) )
))
(declare-datatypes ((array!81703 0))(
  ( (array!81704 (arr!39409 (Array (_ BitVec 32) ValueCell!15272)) (size!39947 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81703)

(assert (=> b!1257409 (= res!838182 (and (= (size!39947 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39946 _keys!1118) (size!39947 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!838184 () Bool)

(assert (=> start!105550 (=> (not res!838184) (not e!715004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105550 (= res!838184 (validMask!0 mask!1466))))

(assert (=> start!105550 e!715004))

(assert (=> start!105550 true))

(assert (=> start!105550 tp!95027))

(assert (=> start!105550 tp_is_empty!32071))

(declare-fun array_inv!30153 (array!81701) Bool)

(assert (=> start!105550 (array_inv!30153 _keys!1118)))

(declare-fun e!715006 () Bool)

(declare-fun array_inv!30154 (array!81703) Bool)

(assert (=> start!105550 (and (array_inv!30154 _values!914) e!715006)))

(declare-fun b!1257410 () Bool)

(assert (=> b!1257410 (= e!715006 (and e!715003 mapRes!49897))))

(declare-fun condMapEmpty!49897 () Bool)

(declare-fun mapDefault!49897 () ValueCell!15272)

(assert (=> b!1257410 (= condMapEmpty!49897 (= (arr!39409 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15272)) mapDefault!49897)))))

(declare-fun b!1257411 () Bool)

(declare-fun res!838183 () Bool)

(assert (=> b!1257411 (=> (not res!838183) (not e!715004))))

(declare-datatypes ((List!28090 0))(
  ( (Nil!28087) (Cons!28086 (h!29295 (_ BitVec 64)) (t!41572 List!28090)) )
))
(declare-fun arrayNoDuplicates!0 (array!81701 (_ BitVec 32) List!28090) Bool)

(assert (=> b!1257411 (= res!838183 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28087))))

(declare-fun b!1257412 () Bool)

(assert (=> b!1257412 (= e!715004 (not true))))

(declare-datatypes ((tuple2!20882 0))(
  ( (tuple2!20883 (_1!10452 (_ BitVec 64)) (_2!10452 V!48127)) )
))
(declare-datatypes ((List!28091 0))(
  ( (Nil!28088) (Cons!28087 (h!29296 tuple2!20882) (t!41573 List!28091)) )
))
(declare-datatypes ((ListLongMap!18755 0))(
  ( (ListLongMap!18756 (toList!9393 List!28091)) )
))
(declare-fun lt!568587 () ListLongMap!18755)

(declare-fun lt!568586 () ListLongMap!18755)

(assert (=> b!1257412 (= lt!568587 lt!568586)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48127)

(declare-fun zeroValue!871 () V!48127)

(declare-fun minValueBefore!43 () V!48127)

(declare-datatypes ((Unit!41745 0))(
  ( (Unit!41746) )
))
(declare-fun lt!568588 () Unit!41745)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1097 (array!81701 array!81703 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48127 V!48127 V!48127 V!48127 (_ BitVec 32) Int) Unit!41745)

(assert (=> b!1257412 (= lt!568588 (lemmaNoChangeToArrayThenSameMapNoExtras!1097 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5775 (array!81701 array!81703 (_ BitVec 32) (_ BitVec 32) V!48127 V!48127 (_ BitVec 32) Int) ListLongMap!18755)

(assert (=> b!1257412 (= lt!568586 (getCurrentListMapNoExtraKeys!5775 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257412 (= lt!568587 (getCurrentListMapNoExtraKeys!5775 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257413 () Bool)

(declare-fun res!838185 () Bool)

(assert (=> b!1257413 (=> (not res!838185) (not e!715004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81701 (_ BitVec 32)) Bool)

(assert (=> b!1257413 (= res!838185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49897 () Bool)

(declare-fun tp!95026 () Bool)

(declare-fun e!715002 () Bool)

(assert (=> mapNonEmpty!49897 (= mapRes!49897 (and tp!95026 e!715002))))

(declare-fun mapKey!49897 () (_ BitVec 32))

(declare-fun mapValue!49897 () ValueCell!15272)

(declare-fun mapRest!49897 () (Array (_ BitVec 32) ValueCell!15272))

(assert (=> mapNonEmpty!49897 (= (arr!39409 _values!914) (store mapRest!49897 mapKey!49897 mapValue!49897))))

(declare-fun b!1257414 () Bool)

(assert (=> b!1257414 (= e!715002 tp_is_empty!32071)))

(assert (= (and start!105550 res!838184) b!1257409))

(assert (= (and b!1257409 res!838182) b!1257413))

(assert (= (and b!1257413 res!838185) b!1257411))

(assert (= (and b!1257411 res!838183) b!1257412))

(assert (= (and b!1257410 condMapEmpty!49897) mapIsEmpty!49897))

(assert (= (and b!1257410 (not condMapEmpty!49897)) mapNonEmpty!49897))

(get-info :version)

(assert (= (and mapNonEmpty!49897 ((_ is ValueCellFull!15272) mapValue!49897)) b!1257414))

(assert (= (and b!1257410 ((_ is ValueCellFull!15272) mapDefault!49897)) b!1257408))

(assert (= start!105550 b!1257410))

(declare-fun m!1157551 () Bool)

(assert (=> b!1257412 m!1157551))

(declare-fun m!1157553 () Bool)

(assert (=> b!1257412 m!1157553))

(declare-fun m!1157555 () Bool)

(assert (=> b!1257412 m!1157555))

(declare-fun m!1157557 () Bool)

(assert (=> b!1257411 m!1157557))

(declare-fun m!1157559 () Bool)

(assert (=> b!1257413 m!1157559))

(declare-fun m!1157561 () Bool)

(assert (=> start!105550 m!1157561))

(declare-fun m!1157563 () Bool)

(assert (=> start!105550 m!1157563))

(declare-fun m!1157565 () Bool)

(assert (=> start!105550 m!1157565))

(declare-fun m!1157567 () Bool)

(assert (=> mapNonEmpty!49897 m!1157567))

(check-sat (not start!105550) tp_is_empty!32071 (not b_next!27169) b_and!45017 (not b!1257411) (not b!1257413) (not b!1257412) (not mapNonEmpty!49897))
(check-sat b_and!45017 (not b_next!27169))
