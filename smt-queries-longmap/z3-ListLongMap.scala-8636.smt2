; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105120 () Bool)

(assert start!105120)

(declare-fun b_free!26853 () Bool)

(declare-fun b_next!26853 () Bool)

(assert (=> start!105120 (= b_free!26853 (not b_next!26853))))

(declare-fun tp!94060 () Bool)

(declare-fun b_and!44657 () Bool)

(assert (=> start!105120 (= tp!94060 b_and!44657)))

(declare-fun b!1252704 () Bool)

(declare-fun e!711539 () Bool)

(assert (=> b!1252704 (= e!711539 true)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((V!47705 0))(
  ( (V!47706 (val!15940 Int)) )
))
(declare-fun zeroValue!871 () V!47705)

(declare-datatypes ((tuple2!20562 0))(
  ( (tuple2!20563 (_1!10292 (_ BitVec 64)) (_2!10292 V!47705)) )
))
(declare-datatypes ((List!27796 0))(
  ( (Nil!27793) (Cons!27792 (h!29001 tuple2!20562) (t!41275 List!27796)) )
))
(declare-datatypes ((ListLongMap!18435 0))(
  ( (ListLongMap!18436 (toList!9233 List!27796)) )
))
(declare-fun lt!565464 () ListLongMap!18435)

(declare-datatypes ((array!81172 0))(
  ( (array!81173 (arr!39149 (Array (_ BitVec 32) (_ BitVec 64))) (size!39685 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81172)

(declare-datatypes ((ValueCell!15114 0))(
  ( (ValueCellFull!15114 (v!18638 V!47705)) (EmptyCell!15114) )
))
(declare-datatypes ((array!81174 0))(
  ( (array!81175 (arr!39150 (Array (_ BitVec 32) ValueCell!15114)) (size!39686 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81174)

(declare-fun minValueBefore!43 () V!47705)

(declare-fun getCurrentListMap!4481 (array!81172 array!81174 (_ BitVec 32) (_ BitVec 32) V!47705 V!47705 (_ BitVec 32) Int) ListLongMap!18435)

(assert (=> b!1252704 (= lt!565464 (getCurrentListMap!4481 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252705 () Bool)

(declare-fun e!711538 () Bool)

(declare-fun tp_is_empty!31755 () Bool)

(assert (=> b!1252705 (= e!711538 tp_is_empty!31755)))

(declare-fun b!1252706 () Bool)

(declare-fun res!835402 () Bool)

(declare-fun e!711540 () Bool)

(assert (=> b!1252706 (=> (not res!835402) (not e!711540))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81172 (_ BitVec 32)) Bool)

(assert (=> b!1252706 (= res!835402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252707 () Bool)

(declare-fun e!711541 () Bool)

(declare-fun e!711537 () Bool)

(declare-fun mapRes!49405 () Bool)

(assert (=> b!1252707 (= e!711541 (and e!711537 mapRes!49405))))

(declare-fun condMapEmpty!49405 () Bool)

(declare-fun mapDefault!49405 () ValueCell!15114)

(assert (=> b!1252707 (= condMapEmpty!49405 (= (arr!39150 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15114)) mapDefault!49405)))))

(declare-fun res!835400 () Bool)

(assert (=> start!105120 (=> (not res!835400) (not e!711540))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105120 (= res!835400 (validMask!0 mask!1466))))

(assert (=> start!105120 e!711540))

(assert (=> start!105120 true))

(assert (=> start!105120 tp!94060))

(assert (=> start!105120 tp_is_empty!31755))

(declare-fun array_inv!29857 (array!81172) Bool)

(assert (=> start!105120 (array_inv!29857 _keys!1118)))

(declare-fun array_inv!29858 (array!81174) Bool)

(assert (=> start!105120 (and (array_inv!29858 _values!914) e!711541)))

(declare-fun mapIsEmpty!49405 () Bool)

(assert (=> mapIsEmpty!49405 mapRes!49405))

(declare-fun b!1252708 () Bool)

(declare-fun res!835401 () Bool)

(assert (=> b!1252708 (=> (not res!835401) (not e!711540))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1252708 (= res!835401 (and (= (size!39686 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39685 _keys!1118) (size!39686 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49405 () Bool)

(declare-fun tp!94061 () Bool)

(assert (=> mapNonEmpty!49405 (= mapRes!49405 (and tp!94061 e!711538))))

(declare-fun mapValue!49405 () ValueCell!15114)

(declare-fun mapKey!49405 () (_ BitVec 32))

(declare-fun mapRest!49405 () (Array (_ BitVec 32) ValueCell!15114))

(assert (=> mapNonEmpty!49405 (= (arr!39150 _values!914) (store mapRest!49405 mapKey!49405 mapValue!49405))))

(declare-fun b!1252709 () Bool)

(assert (=> b!1252709 (= e!711537 tp_is_empty!31755)))

(declare-fun b!1252710 () Bool)

(assert (=> b!1252710 (= e!711540 (not e!711539))))

(declare-fun res!835398 () Bool)

(assert (=> b!1252710 (=> res!835398 e!711539)))

(assert (=> b!1252710 (= res!835398 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!565465 () ListLongMap!18435)

(declare-fun lt!565463 () ListLongMap!18435)

(assert (=> b!1252710 (= lt!565465 lt!565463)))

(declare-fun minValueAfter!43 () V!47705)

(declare-datatypes ((Unit!41653 0))(
  ( (Unit!41654) )
))
(declare-fun lt!565466 () Unit!41653)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!992 (array!81172 array!81174 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47705 V!47705 V!47705 V!47705 (_ BitVec 32) Int) Unit!41653)

(assert (=> b!1252710 (= lt!565466 (lemmaNoChangeToArrayThenSameMapNoExtras!992 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5628 (array!81172 array!81174 (_ BitVec 32) (_ BitVec 32) V!47705 V!47705 (_ BitVec 32) Int) ListLongMap!18435)

(assert (=> b!1252710 (= lt!565463 (getCurrentListMapNoExtraKeys!5628 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252710 (= lt!565465 (getCurrentListMapNoExtraKeys!5628 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252711 () Bool)

(declare-fun res!835399 () Bool)

(assert (=> b!1252711 (=> (not res!835399) (not e!711540))))

(declare-datatypes ((List!27797 0))(
  ( (Nil!27794) (Cons!27793 (h!29002 (_ BitVec 64)) (t!41276 List!27797)) )
))
(declare-fun arrayNoDuplicates!0 (array!81172 (_ BitVec 32) List!27797) Bool)

(assert (=> b!1252711 (= res!835399 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27794))))

(assert (= (and start!105120 res!835400) b!1252708))

(assert (= (and b!1252708 res!835401) b!1252706))

(assert (= (and b!1252706 res!835402) b!1252711))

(assert (= (and b!1252711 res!835399) b!1252710))

(assert (= (and b!1252710 (not res!835398)) b!1252704))

(assert (= (and b!1252707 condMapEmpty!49405) mapIsEmpty!49405))

(assert (= (and b!1252707 (not condMapEmpty!49405)) mapNonEmpty!49405))

(get-info :version)

(assert (= (and mapNonEmpty!49405 ((_ is ValueCellFull!15114) mapValue!49405)) b!1252705))

(assert (= (and b!1252707 ((_ is ValueCellFull!15114) mapDefault!49405)) b!1252709))

(assert (= start!105120 b!1252707))

(declare-fun m!1153285 () Bool)

(assert (=> start!105120 m!1153285))

(declare-fun m!1153287 () Bool)

(assert (=> start!105120 m!1153287))

(declare-fun m!1153289 () Bool)

(assert (=> start!105120 m!1153289))

(declare-fun m!1153291 () Bool)

(assert (=> b!1252711 m!1153291))

(declare-fun m!1153293 () Bool)

(assert (=> b!1252706 m!1153293))

(declare-fun m!1153295 () Bool)

(assert (=> b!1252704 m!1153295))

(declare-fun m!1153297 () Bool)

(assert (=> b!1252710 m!1153297))

(declare-fun m!1153299 () Bool)

(assert (=> b!1252710 m!1153299))

(declare-fun m!1153301 () Bool)

(assert (=> b!1252710 m!1153301))

(declare-fun m!1153303 () Bool)

(assert (=> mapNonEmpty!49405 m!1153303))

(check-sat (not b!1252711) b_and!44657 (not b!1252704) (not start!105120) (not b!1252710) (not b_next!26853) (not mapNonEmpty!49405) tp_is_empty!31755 (not b!1252706))
(check-sat b_and!44657 (not b_next!26853))
