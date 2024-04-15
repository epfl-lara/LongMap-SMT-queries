; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81812 () Bool)

(assert start!81812)

(declare-fun b_free!18325 () Bool)

(declare-fun b_next!18325 () Bool)

(assert (=> start!81812 (= b_free!18325 (not b_next!18325))))

(declare-fun tp!63676 () Bool)

(declare-fun b_and!29785 () Bool)

(assert (=> start!81812 (= tp!63676 b_and!29785)))

(declare-fun b!954026 () Bool)

(declare-fun e!537478 () Bool)

(declare-fun tp_is_empty!20869 () Bool)

(assert (=> b!954026 (= e!537478 tp_is_empty!20869)))

(declare-fun mapIsEmpty!33265 () Bool)

(declare-fun mapRes!33265 () Bool)

(assert (=> mapIsEmpty!33265 mapRes!33265))

(declare-fun b!954027 () Bool)

(declare-fun e!537480 () Bool)

(assert (=> b!954027 (= e!537480 tp_is_empty!20869)))

(declare-fun b!954028 () Bool)

(declare-fun res!638911 () Bool)

(declare-fun e!537477 () Bool)

(assert (=> b!954028 (=> (not res!638911) (not e!537477))))

(declare-datatypes ((array!57810 0))(
  ( (array!57811 (arr!27785 (Array (_ BitVec 32) (_ BitVec 64))) (size!28266 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57810)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954028 (= res!638911 (validKeyInArray!0 (select (arr!27785 _keys!1441) i!735)))))

(declare-fun mapNonEmpty!33265 () Bool)

(declare-fun tp!63675 () Bool)

(assert (=> mapNonEmpty!33265 (= mapRes!33265 (and tp!63675 e!537480))))

(declare-datatypes ((V!32809 0))(
  ( (V!32810 (val!10485 Int)) )
))
(declare-datatypes ((ValueCell!9953 0))(
  ( (ValueCellFull!9953 (v!13039 V!32809)) (EmptyCell!9953) )
))
(declare-fun mapValue!33265 () ValueCell!9953)

(declare-fun mapKey!33265 () (_ BitVec 32))

(declare-datatypes ((array!57812 0))(
  ( (array!57813 (arr!27786 (Array (_ BitVec 32) ValueCell!9953)) (size!28267 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57812)

(declare-fun mapRest!33265 () (Array (_ BitVec 32) ValueCell!9953))

(assert (=> mapNonEmpty!33265 (= (arr!27786 _values!1197) (store mapRest!33265 mapKey!33265 mapValue!33265))))

(declare-fun b!954030 () Bool)

(declare-fun res!638912 () Bool)

(assert (=> b!954030 (=> (not res!638912) (not e!537477))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!954030 (= res!638912 (and (= (size!28267 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28266 _keys!1441) (size!28267 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!954031 () Bool)

(declare-fun res!638910 () Bool)

(assert (=> b!954031 (=> (not res!638910) (not e!537477))))

(declare-datatypes ((List!19394 0))(
  ( (Nil!19391) (Cons!19390 (h!20552 (_ BitVec 64)) (t!27746 List!19394)) )
))
(declare-fun arrayNoDuplicates!0 (array!57810 (_ BitVec 32) List!19394) Bool)

(assert (=> b!954031 (= res!638910 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19391))))

(declare-fun b!954032 () Bool)

(declare-fun e!537476 () Bool)

(assert (=> b!954032 (= e!537476 (and e!537478 mapRes!33265))))

(declare-fun condMapEmpty!33265 () Bool)

(declare-fun mapDefault!33265 () ValueCell!9953)

(assert (=> b!954032 (= condMapEmpty!33265 (= (arr!27786 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9953)) mapDefault!33265)))))

(declare-fun b!954033 () Bool)

(declare-fun res!638914 () Bool)

(assert (=> b!954033 (=> (not res!638914) (not e!537477))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57810 (_ BitVec 32)) Bool)

(assert (=> b!954033 (= res!638914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!954034 () Bool)

(declare-fun res!638909 () Bool)

(assert (=> b!954034 (=> (not res!638909) (not e!537477))))

(assert (=> b!954034 (= res!638909 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28266 _keys!1441))))))

(declare-fun b!954029 () Bool)

(assert (=> b!954029 (= e!537477 false)))

(declare-fun zeroValue!1139 () V!32809)

(declare-fun lt!429645 () Bool)

(declare-fun minValue!1139 () V!32809)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13654 0))(
  ( (tuple2!13655 (_1!6838 (_ BitVec 64)) (_2!6838 V!32809)) )
))
(declare-datatypes ((List!19395 0))(
  ( (Nil!19392) (Cons!19391 (h!20553 tuple2!13654) (t!27747 List!19395)) )
))
(declare-datatypes ((ListLongMap!12341 0))(
  ( (ListLongMap!12342 (toList!6186 List!19395)) )
))
(declare-fun contains!5227 (ListLongMap!12341 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3348 (array!57810 array!57812 (_ BitVec 32) (_ BitVec 32) V!32809 V!32809 (_ BitVec 32) Int) ListLongMap!12341)

(assert (=> b!954029 (= lt!429645 (contains!5227 (getCurrentListMap!3348 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27785 _keys!1441) i!735)))))

(declare-fun res!638913 () Bool)

(assert (=> start!81812 (=> (not res!638913) (not e!537477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81812 (= res!638913 (validMask!0 mask!1823))))

(assert (=> start!81812 e!537477))

(assert (=> start!81812 true))

(assert (=> start!81812 tp_is_empty!20869))

(declare-fun array_inv!21631 (array!57810) Bool)

(assert (=> start!81812 (array_inv!21631 _keys!1441)))

(declare-fun array_inv!21632 (array!57812) Bool)

(assert (=> start!81812 (and (array_inv!21632 _values!1197) e!537476)))

(assert (=> start!81812 tp!63676))

(assert (= (and start!81812 res!638913) b!954030))

(assert (= (and b!954030 res!638912) b!954033))

(assert (= (and b!954033 res!638914) b!954031))

(assert (= (and b!954031 res!638910) b!954034))

(assert (= (and b!954034 res!638909) b!954028))

(assert (= (and b!954028 res!638911) b!954029))

(assert (= (and b!954032 condMapEmpty!33265) mapIsEmpty!33265))

(assert (= (and b!954032 (not condMapEmpty!33265)) mapNonEmpty!33265))

(get-info :version)

(assert (= (and mapNonEmpty!33265 ((_ is ValueCellFull!9953) mapValue!33265)) b!954027))

(assert (= (and b!954032 ((_ is ValueCellFull!9953) mapDefault!33265)) b!954026))

(assert (= start!81812 b!954032))

(declare-fun m!885285 () Bool)

(assert (=> mapNonEmpty!33265 m!885285))

(declare-fun m!885287 () Bool)

(assert (=> b!954028 m!885287))

(assert (=> b!954028 m!885287))

(declare-fun m!885289 () Bool)

(assert (=> b!954028 m!885289))

(declare-fun m!885291 () Bool)

(assert (=> start!81812 m!885291))

(declare-fun m!885293 () Bool)

(assert (=> start!81812 m!885293))

(declare-fun m!885295 () Bool)

(assert (=> start!81812 m!885295))

(declare-fun m!885297 () Bool)

(assert (=> b!954031 m!885297))

(declare-fun m!885299 () Bool)

(assert (=> b!954029 m!885299))

(assert (=> b!954029 m!885287))

(assert (=> b!954029 m!885299))

(assert (=> b!954029 m!885287))

(declare-fun m!885301 () Bool)

(assert (=> b!954029 m!885301))

(declare-fun m!885303 () Bool)

(assert (=> b!954033 m!885303))

(check-sat (not mapNonEmpty!33265) (not b!954028) (not b!954029) tp_is_empty!20869 b_and!29785 (not start!81812) (not b_next!18325) (not b!954031) (not b!954033))
(check-sat b_and!29785 (not b_next!18325))
