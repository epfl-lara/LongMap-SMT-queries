; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104676 () Bool)

(assert start!104676)

(declare-fun b_free!26493 () Bool)

(declare-fun b_next!26493 () Bool)

(assert (=> start!104676 (= b_free!26493 (not b_next!26493))))

(declare-fun tp!92966 () Bool)

(declare-fun b_and!44257 () Bool)

(assert (=> start!104676 (= tp!92966 b_and!44257)))

(declare-fun b!1247993 () Bool)

(declare-fun e!708106 () Bool)

(declare-fun tp_is_empty!31395 () Bool)

(assert (=> b!1247993 (= e!708106 tp_is_empty!31395)))

(declare-fun b!1247994 () Bool)

(declare-fun e!708105 () Bool)

(declare-fun e!708109 () Bool)

(declare-fun mapRes!48850 () Bool)

(assert (=> b!1247994 (= e!708105 (and e!708109 mapRes!48850))))

(declare-fun condMapEmpty!48850 () Bool)

(declare-datatypes ((V!47225 0))(
  ( (V!47226 (val!15760 Int)) )
))
(declare-datatypes ((ValueCell!14934 0))(
  ( (ValueCellFull!14934 (v!18456 V!47225)) (EmptyCell!14934) )
))
(declare-datatypes ((array!80484 0))(
  ( (array!80485 (arr!38810 (Array (_ BitVec 32) ValueCell!14934)) (size!39346 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80484)

(declare-fun mapDefault!48850 () ValueCell!14934)

(assert (=> b!1247994 (= condMapEmpty!48850 (= (arr!38810 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14934)) mapDefault!48850)))))

(declare-fun res!832654 () Bool)

(declare-fun e!708107 () Bool)

(assert (=> start!104676 (=> (not res!832654) (not e!708107))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104676 (= res!832654 (validMask!0 mask!1466))))

(assert (=> start!104676 e!708107))

(assert (=> start!104676 true))

(assert (=> start!104676 tp!92966))

(assert (=> start!104676 tp_is_empty!31395))

(declare-datatypes ((array!80486 0))(
  ( (array!80487 (arr!38811 (Array (_ BitVec 32) (_ BitVec 64))) (size!39347 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80486)

(declare-fun array_inv!29627 (array!80486) Bool)

(assert (=> start!104676 (array_inv!29627 _keys!1118)))

(declare-fun array_inv!29628 (array!80484) Bool)

(assert (=> start!104676 (and (array_inv!29628 _values!914) e!708105)))

(declare-fun mapNonEmpty!48850 () Bool)

(declare-fun tp!92965 () Bool)

(assert (=> mapNonEmpty!48850 (= mapRes!48850 (and tp!92965 e!708106))))

(declare-fun mapValue!48850 () ValueCell!14934)

(declare-fun mapRest!48850 () (Array (_ BitVec 32) ValueCell!14934))

(declare-fun mapKey!48850 () (_ BitVec 32))

(assert (=> mapNonEmpty!48850 (= (arr!38810 _values!914) (store mapRest!48850 mapKey!48850 mapValue!48850))))

(declare-fun b!1247995 () Bool)

(assert (=> b!1247995 (= e!708109 tp_is_empty!31395)))

(declare-fun b!1247996 () Bool)

(declare-fun res!832656 () Bool)

(assert (=> b!1247996 (=> (not res!832656) (not e!708107))))

(declare-datatypes ((List!27548 0))(
  ( (Nil!27545) (Cons!27544 (h!28753 (_ BitVec 64)) (t!41017 List!27548)) )
))
(declare-fun arrayNoDuplicates!0 (array!80486 (_ BitVec 32) List!27548) Bool)

(assert (=> b!1247996 (= res!832656 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27545))))

(declare-fun b!1247997 () Bool)

(declare-fun res!832655 () Bool)

(assert (=> b!1247997 (=> (not res!832655) (not e!708107))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1247997 (= res!832655 (and (= (size!39346 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39347 _keys!1118) (size!39346 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1247998 () Bool)

(declare-fun res!832653 () Bool)

(assert (=> b!1247998 (=> (not res!832653) (not e!708107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80486 (_ BitVec 32)) Bool)

(assert (=> b!1247998 (= res!832653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247999 () Bool)

(assert (=> b!1247999 (= e!708107 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47225)

(declare-fun minValueBefore!43 () V!47225)

(declare-datatypes ((tuple2!20300 0))(
  ( (tuple2!20301 (_1!10161 (_ BitVec 64)) (_2!10161 V!47225)) )
))
(declare-datatypes ((List!27549 0))(
  ( (Nil!27546) (Cons!27545 (h!28754 tuple2!20300) (t!41018 List!27549)) )
))
(declare-datatypes ((ListLongMap!18173 0))(
  ( (ListLongMap!18174 (toList!9102 List!27549)) )
))
(declare-fun lt!563344 () ListLongMap!18173)

(declare-fun getCurrentListMapNoExtraKeys!5509 (array!80486 array!80484 (_ BitVec 32) (_ BitVec 32) V!47225 V!47225 (_ BitVec 32) Int) ListLongMap!18173)

(assert (=> b!1247999 (= lt!563344 (getCurrentListMapNoExtraKeys!5509 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!48850 () Bool)

(assert (=> mapIsEmpty!48850 mapRes!48850))

(assert (= (and start!104676 res!832654) b!1247997))

(assert (= (and b!1247997 res!832655) b!1247998))

(assert (= (and b!1247998 res!832653) b!1247996))

(assert (= (and b!1247996 res!832656) b!1247999))

(assert (= (and b!1247994 condMapEmpty!48850) mapIsEmpty!48850))

(assert (= (and b!1247994 (not condMapEmpty!48850)) mapNonEmpty!48850))

(get-info :version)

(assert (= (and mapNonEmpty!48850 ((_ is ValueCellFull!14934) mapValue!48850)) b!1247993))

(assert (= (and b!1247994 ((_ is ValueCellFull!14934) mapDefault!48850)) b!1247995))

(assert (= start!104676 b!1247994))

(declare-fun m!1149305 () Bool)

(assert (=> start!104676 m!1149305))

(declare-fun m!1149307 () Bool)

(assert (=> start!104676 m!1149307))

(declare-fun m!1149309 () Bool)

(assert (=> start!104676 m!1149309))

(declare-fun m!1149311 () Bool)

(assert (=> b!1247999 m!1149311))

(declare-fun m!1149313 () Bool)

(assert (=> b!1247998 m!1149313))

(declare-fun m!1149315 () Bool)

(assert (=> mapNonEmpty!48850 m!1149315))

(declare-fun m!1149317 () Bool)

(assert (=> b!1247996 m!1149317))

(check-sat tp_is_empty!31395 (not b!1247999) (not b!1247996) (not b_next!26493) (not start!104676) (not mapNonEmpty!48850) (not b!1247998) b_and!44257)
(check-sat b_and!44257 (not b_next!26493))
