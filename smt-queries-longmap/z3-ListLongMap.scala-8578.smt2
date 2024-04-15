; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104682 () Bool)

(assert start!104682)

(declare-fun b_free!26503 () Bool)

(declare-fun b_next!26503 () Bool)

(assert (=> start!104682 (= b_free!26503 (not b_next!26503))))

(declare-fun tp!92995 () Bool)

(declare-fun b_and!44249 () Bool)

(assert (=> start!104682 (= tp!92995 b_and!44249)))

(declare-fun mapNonEmpty!48865 () Bool)

(declare-fun mapRes!48865 () Bool)

(declare-fun tp!92996 () Bool)

(declare-fun e!708136 () Bool)

(assert (=> mapNonEmpty!48865 (= mapRes!48865 (and tp!92996 e!708136))))

(declare-datatypes ((V!47239 0))(
  ( (V!47240 (val!15765 Int)) )
))
(declare-datatypes ((ValueCell!14939 0))(
  ( (ValueCellFull!14939 (v!18460 V!47239)) (EmptyCell!14939) )
))
(declare-fun mapRest!48865 () (Array (_ BitVec 32) ValueCell!14939))

(declare-fun mapKey!48865 () (_ BitVec 32))

(declare-fun mapValue!48865 () ValueCell!14939)

(declare-datatypes ((array!80421 0))(
  ( (array!80422 (arr!38779 (Array (_ BitVec 32) ValueCell!14939)) (size!39317 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80421)

(assert (=> mapNonEmpty!48865 (= (arr!38779 _values!914) (store mapRest!48865 mapKey!48865 mapValue!48865))))

(declare-fun b!1248016 () Bool)

(declare-fun res!832675 () Bool)

(declare-fun e!708139 () Bool)

(assert (=> b!1248016 (=> (not res!832675) (not e!708139))))

(declare-datatypes ((array!80423 0))(
  ( (array!80424 (arr!38780 (Array (_ BitVec 32) (_ BitVec 64))) (size!39318 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80423)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80423 (_ BitVec 32)) Bool)

(assert (=> b!1248016 (= res!832675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248017 () Bool)

(assert (=> b!1248017 (= e!708139 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47239)

(declare-datatypes ((tuple2!20390 0))(
  ( (tuple2!20391 (_1!10206 (_ BitVec 64)) (_2!10206 V!47239)) )
))
(declare-datatypes ((List!27616 0))(
  ( (Nil!27613) (Cons!27612 (h!28821 tuple2!20390) (t!41076 List!27616)) )
))
(declare-datatypes ((ListLongMap!18263 0))(
  ( (ListLongMap!18264 (toList!9147 List!27616)) )
))
(declare-fun lt!563180 () ListLongMap!18263)

(declare-fun minValueBefore!43 () V!47239)

(declare-fun getCurrentListMapNoExtraKeys!5564 (array!80423 array!80421 (_ BitVec 32) (_ BitVec 32) V!47239 V!47239 (_ BitVec 32) Int) ListLongMap!18263)

(assert (=> b!1248017 (= lt!563180 (getCurrentListMapNoExtraKeys!5564 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!48865 () Bool)

(assert (=> mapIsEmpty!48865 mapRes!48865))

(declare-fun b!1248018 () Bool)

(declare-fun e!708135 () Bool)

(declare-fun e!708137 () Bool)

(assert (=> b!1248018 (= e!708135 (and e!708137 mapRes!48865))))

(declare-fun condMapEmpty!48865 () Bool)

(declare-fun mapDefault!48865 () ValueCell!14939)

(assert (=> b!1248018 (= condMapEmpty!48865 (= (arr!38779 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14939)) mapDefault!48865)))))

(declare-fun b!1248019 () Bool)

(declare-fun tp_is_empty!31405 () Bool)

(assert (=> b!1248019 (= e!708137 tp_is_empty!31405)))

(declare-fun res!832674 () Bool)

(assert (=> start!104682 (=> (not res!832674) (not e!708139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104682 (= res!832674 (validMask!0 mask!1466))))

(assert (=> start!104682 e!708139))

(assert (=> start!104682 true))

(assert (=> start!104682 tp!92995))

(assert (=> start!104682 tp_is_empty!31405))

(declare-fun array_inv!29733 (array!80423) Bool)

(assert (=> start!104682 (array_inv!29733 _keys!1118)))

(declare-fun array_inv!29734 (array!80421) Bool)

(assert (=> start!104682 (and (array_inv!29734 _values!914) e!708135)))

(declare-fun b!1248020 () Bool)

(declare-fun res!832676 () Bool)

(assert (=> b!1248020 (=> (not res!832676) (not e!708139))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1248020 (= res!832676 (and (= (size!39317 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39318 _keys!1118) (size!39317 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1248021 () Bool)

(declare-fun res!832673 () Bool)

(assert (=> b!1248021 (=> (not res!832673) (not e!708139))))

(declare-datatypes ((List!27617 0))(
  ( (Nil!27614) (Cons!27613 (h!28822 (_ BitVec 64)) (t!41077 List!27617)) )
))
(declare-fun arrayNoDuplicates!0 (array!80423 (_ BitVec 32) List!27617) Bool)

(assert (=> b!1248021 (= res!832673 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27614))))

(declare-fun b!1248022 () Bool)

(assert (=> b!1248022 (= e!708136 tp_is_empty!31405)))

(assert (= (and start!104682 res!832674) b!1248020))

(assert (= (and b!1248020 res!832676) b!1248016))

(assert (= (and b!1248016 res!832675) b!1248021))

(assert (= (and b!1248021 res!832673) b!1248017))

(assert (= (and b!1248018 condMapEmpty!48865) mapIsEmpty!48865))

(assert (= (and b!1248018 (not condMapEmpty!48865)) mapNonEmpty!48865))

(get-info :version)

(assert (= (and mapNonEmpty!48865 ((_ is ValueCellFull!14939) mapValue!48865)) b!1248022))

(assert (= (and b!1248018 ((_ is ValueCellFull!14939) mapDefault!48865)) b!1248019))

(assert (= start!104682 b!1248018))

(declare-fun m!1148855 () Bool)

(assert (=> b!1248017 m!1148855))

(declare-fun m!1148857 () Bool)

(assert (=> mapNonEmpty!48865 m!1148857))

(declare-fun m!1148859 () Bool)

(assert (=> b!1248021 m!1148859))

(declare-fun m!1148861 () Bool)

(assert (=> start!104682 m!1148861))

(declare-fun m!1148863 () Bool)

(assert (=> start!104682 m!1148863))

(declare-fun m!1148865 () Bool)

(assert (=> start!104682 m!1148865))

(declare-fun m!1148867 () Bool)

(assert (=> b!1248016 m!1148867))

(check-sat (not b_next!26503) (not mapNonEmpty!48865) b_and!44249 (not b!1248017) tp_is_empty!31405 (not b!1248021) (not start!104682) (not b!1248016))
(check-sat b_and!44249 (not b_next!26503))
