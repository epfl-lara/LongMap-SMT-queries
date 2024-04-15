; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104688 () Bool)

(assert start!104688)

(declare-fun b_free!26509 () Bool)

(declare-fun b_next!26509 () Bool)

(assert (=> start!104688 (= b_free!26509 (not b_next!26509))))

(declare-fun tp!93013 () Bool)

(declare-fun b_and!44255 () Bool)

(assert (=> start!104688 (= tp!93013 b_and!44255)))

(declare-fun b!1248079 () Bool)

(declare-fun res!832710 () Bool)

(declare-fun e!708180 () Bool)

(assert (=> b!1248079 (=> (not res!832710) (not e!708180))))

(declare-datatypes ((array!80433 0))(
  ( (array!80434 (arr!38785 (Array (_ BitVec 32) (_ BitVec 64))) (size!39323 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80433)

(declare-datatypes ((List!27620 0))(
  ( (Nil!27617) (Cons!27616 (h!28825 (_ BitVec 64)) (t!41080 List!27620)) )
))
(declare-fun arrayNoDuplicates!0 (array!80433 (_ BitVec 32) List!27620) Bool)

(assert (=> b!1248079 (= res!832710 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27617))))

(declare-fun b!1248080 () Bool)

(declare-fun res!832711 () Bool)

(assert (=> b!1248080 (=> (not res!832711) (not e!708180))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80433 (_ BitVec 32)) Bool)

(assert (=> b!1248080 (= res!832711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248081 () Bool)

(declare-fun e!708182 () Bool)

(declare-fun tp_is_empty!31411 () Bool)

(assert (=> b!1248081 (= e!708182 tp_is_empty!31411)))

(declare-fun mapNonEmpty!48874 () Bool)

(declare-fun mapRes!48874 () Bool)

(declare-fun tp!93014 () Bool)

(declare-fun e!708181 () Bool)

(assert (=> mapNonEmpty!48874 (= mapRes!48874 (and tp!93014 e!708181))))

(declare-fun mapKey!48874 () (_ BitVec 32))

(declare-datatypes ((V!47247 0))(
  ( (V!47248 (val!15768 Int)) )
))
(declare-datatypes ((ValueCell!14942 0))(
  ( (ValueCellFull!14942 (v!18463 V!47247)) (EmptyCell!14942) )
))
(declare-fun mapValue!48874 () ValueCell!14942)

(declare-fun mapRest!48874 () (Array (_ BitVec 32) ValueCell!14942))

(declare-datatypes ((array!80435 0))(
  ( (array!80436 (arr!38786 (Array (_ BitVec 32) ValueCell!14942)) (size!39324 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80435)

(assert (=> mapNonEmpty!48874 (= (arr!38786 _values!914) (store mapRest!48874 mapKey!48874 mapValue!48874))))

(declare-fun b!1248082 () Bool)

(assert (=> b!1248082 (= e!708180 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47247)

(declare-fun minValueBefore!43 () V!47247)

(declare-datatypes ((tuple2!20392 0))(
  ( (tuple2!20393 (_1!10207 (_ BitVec 64)) (_2!10207 V!47247)) )
))
(declare-datatypes ((List!27621 0))(
  ( (Nil!27618) (Cons!27617 (h!28826 tuple2!20392) (t!41081 List!27621)) )
))
(declare-datatypes ((ListLongMap!18265 0))(
  ( (ListLongMap!18266 (toList!9148 List!27621)) )
))
(declare-fun lt!563189 () ListLongMap!18265)

(declare-fun getCurrentListMapNoExtraKeys!5565 (array!80433 array!80435 (_ BitVec 32) (_ BitVec 32) V!47247 V!47247 (_ BitVec 32) Int) ListLongMap!18265)

(assert (=> b!1248082 (= lt!563189 (getCurrentListMapNoExtraKeys!5565 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!48874 () Bool)

(assert (=> mapIsEmpty!48874 mapRes!48874))

(declare-fun res!832712 () Bool)

(assert (=> start!104688 (=> (not res!832712) (not e!708180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104688 (= res!832712 (validMask!0 mask!1466))))

(assert (=> start!104688 e!708180))

(assert (=> start!104688 true))

(assert (=> start!104688 tp!93013))

(assert (=> start!104688 tp_is_empty!31411))

(declare-fun array_inv!29737 (array!80433) Bool)

(assert (=> start!104688 (array_inv!29737 _keys!1118)))

(declare-fun e!708184 () Bool)

(declare-fun array_inv!29738 (array!80435) Bool)

(assert (=> start!104688 (and (array_inv!29738 _values!914) e!708184)))

(declare-fun b!1248083 () Bool)

(assert (=> b!1248083 (= e!708184 (and e!708182 mapRes!48874))))

(declare-fun condMapEmpty!48874 () Bool)

(declare-fun mapDefault!48874 () ValueCell!14942)

(assert (=> b!1248083 (= condMapEmpty!48874 (= (arr!38786 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14942)) mapDefault!48874)))))

(declare-fun b!1248084 () Bool)

(declare-fun res!832709 () Bool)

(assert (=> b!1248084 (=> (not res!832709) (not e!708180))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1248084 (= res!832709 (and (= (size!39324 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39323 _keys!1118) (size!39324 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1248085 () Bool)

(assert (=> b!1248085 (= e!708181 tp_is_empty!31411)))

(assert (= (and start!104688 res!832712) b!1248084))

(assert (= (and b!1248084 res!832709) b!1248080))

(assert (= (and b!1248080 res!832711) b!1248079))

(assert (= (and b!1248079 res!832710) b!1248082))

(assert (= (and b!1248083 condMapEmpty!48874) mapIsEmpty!48874))

(assert (= (and b!1248083 (not condMapEmpty!48874)) mapNonEmpty!48874))

(get-info :version)

(assert (= (and mapNonEmpty!48874 ((_ is ValueCellFull!14942) mapValue!48874)) b!1248085))

(assert (= (and b!1248083 ((_ is ValueCellFull!14942) mapDefault!48874)) b!1248081))

(assert (= start!104688 b!1248083))

(declare-fun m!1148897 () Bool)

(assert (=> b!1248080 m!1148897))

(declare-fun m!1148899 () Bool)

(assert (=> mapNonEmpty!48874 m!1148899))

(declare-fun m!1148901 () Bool)

(assert (=> b!1248079 m!1148901))

(declare-fun m!1148903 () Bool)

(assert (=> start!104688 m!1148903))

(declare-fun m!1148905 () Bool)

(assert (=> start!104688 m!1148905))

(declare-fun m!1148907 () Bool)

(assert (=> start!104688 m!1148907))

(declare-fun m!1148909 () Bool)

(assert (=> b!1248082 m!1148909))

(check-sat (not b_next!26509) b_and!44255 (not mapNonEmpty!48874) tp_is_empty!31411 (not b!1248082) (not b!1248080) (not start!104688) (not b!1248079))
(check-sat b_and!44255 (not b_next!26509))
