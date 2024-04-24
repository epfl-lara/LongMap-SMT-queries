; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20170 () Bool)

(assert start!20170)

(declare-fun b_free!4825 () Bool)

(declare-fun b_next!4825 () Bool)

(assert (=> start!20170 (= b_free!4825 (not b_next!4825))))

(declare-fun tp!17507 () Bool)

(declare-fun b_and!11585 () Bool)

(assert (=> start!20170 (= tp!17507 b_and!11585)))

(declare-fun b!197971 () Bool)

(declare-fun res!93748 () Bool)

(declare-fun e!130192 () Bool)

(assert (=> b!197971 (=> (not res!93748) (not e!130192))))

(declare-datatypes ((array!8601 0))(
  ( (array!8602 (arr!4051 (Array (_ BitVec 32) (_ BitVec 64))) (size!4376 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8601)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5889 0))(
  ( (V!5890 (val!2385 Int)) )
))
(declare-datatypes ((ValueCell!1997 0))(
  ( (ValueCellFull!1997 (v!4356 V!5889)) (EmptyCell!1997) )
))
(declare-datatypes ((array!8603 0))(
  ( (array!8604 (arr!4052 (Array (_ BitVec 32) ValueCell!1997)) (size!4377 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8603)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!197971 (= res!93748 (and (= (size!4377 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4376 _keys!825) (size!4377 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197972 () Bool)

(declare-fun e!130193 () Bool)

(declare-fun tp_is_empty!4681 () Bool)

(assert (=> b!197972 (= e!130193 tp_is_empty!4681)))

(declare-fun b!197973 () Bool)

(declare-fun e!130191 () Bool)

(declare-fun mapRes!8090 () Bool)

(assert (=> b!197973 (= e!130191 (and e!130193 mapRes!8090))))

(declare-fun condMapEmpty!8090 () Bool)

(declare-fun mapDefault!8090 () ValueCell!1997)

(assert (=> b!197973 (= condMapEmpty!8090 (= (arr!4052 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1997)) mapDefault!8090)))))

(declare-fun b!197974 () Bool)

(declare-fun res!93752 () Bool)

(assert (=> b!197974 (=> (not res!93752) (not e!130192))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197974 (= res!93752 (= (select (arr!4051 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!8090 () Bool)

(declare-fun tp!17506 () Bool)

(declare-fun e!130190 () Bool)

(assert (=> mapNonEmpty!8090 (= mapRes!8090 (and tp!17506 e!130190))))

(declare-fun mapKey!8090 () (_ BitVec 32))

(declare-fun mapRest!8090 () (Array (_ BitVec 32) ValueCell!1997))

(declare-fun mapValue!8090 () ValueCell!1997)

(assert (=> mapNonEmpty!8090 (= (arr!4052 _values!649) (store mapRest!8090 mapKey!8090 mapValue!8090))))

(declare-fun b!197975 () Bool)

(declare-fun res!93751 () Bool)

(assert (=> b!197975 (=> (not res!93751) (not e!130192))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8601 (_ BitVec 32)) Bool)

(assert (=> b!197975 (= res!93751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197976 () Bool)

(assert (=> b!197976 (= e!130190 tp_is_empty!4681)))

(declare-fun b!197978 () Bool)

(declare-fun res!93749 () Bool)

(assert (=> b!197978 (=> (not res!93749) (not e!130192))))

(assert (=> b!197978 (= res!93749 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4376 _keys!825))))))

(declare-fun b!197979 () Bool)

(assert (=> b!197979 (= e!130192 false)))

(declare-datatypes ((tuple2!3568 0))(
  ( (tuple2!3569 (_1!1795 (_ BitVec 64)) (_2!1795 V!5889)) )
))
(declare-datatypes ((List!2485 0))(
  ( (Nil!2482) (Cons!2481 (h!3123 tuple2!3568) (t!7408 List!2485)) )
))
(declare-datatypes ((ListLongMap!2483 0))(
  ( (ListLongMap!2484 (toList!1257 List!2485)) )
))
(declare-fun lt!97873 () ListLongMap!2483)

(declare-fun zeroValue!615 () V!5889)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5889)

(declare-fun v!520 () V!5889)

(declare-fun getCurrentListMapNoExtraKeys!247 (array!8601 array!8603 (_ BitVec 32) (_ BitVec 32) V!5889 V!5889 (_ BitVec 32) Int) ListLongMap!2483)

(assert (=> b!197979 (= lt!97873 (getCurrentListMapNoExtraKeys!247 _keys!825 (array!8604 (store (arr!4052 _values!649) i!601 (ValueCellFull!1997 v!520)) (size!4377 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97874 () ListLongMap!2483)

(assert (=> b!197979 (= lt!97874 (getCurrentListMapNoExtraKeys!247 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8090 () Bool)

(assert (=> mapIsEmpty!8090 mapRes!8090))

(declare-fun b!197980 () Bool)

(declare-fun res!93750 () Bool)

(assert (=> b!197980 (=> (not res!93750) (not e!130192))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197980 (= res!93750 (validKeyInArray!0 k0!843))))

(declare-fun b!197977 () Bool)

(declare-fun res!93753 () Bool)

(assert (=> b!197977 (=> (not res!93753) (not e!130192))))

(declare-datatypes ((List!2486 0))(
  ( (Nil!2483) (Cons!2482 (h!3124 (_ BitVec 64)) (t!7409 List!2486)) )
))
(declare-fun arrayNoDuplicates!0 (array!8601 (_ BitVec 32) List!2486) Bool)

(assert (=> b!197977 (= res!93753 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2483))))

(declare-fun res!93754 () Bool)

(assert (=> start!20170 (=> (not res!93754) (not e!130192))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20170 (= res!93754 (validMask!0 mask!1149))))

(assert (=> start!20170 e!130192))

(declare-fun array_inv!2639 (array!8603) Bool)

(assert (=> start!20170 (and (array_inv!2639 _values!649) e!130191)))

(assert (=> start!20170 true))

(assert (=> start!20170 tp_is_empty!4681))

(declare-fun array_inv!2640 (array!8601) Bool)

(assert (=> start!20170 (array_inv!2640 _keys!825)))

(assert (=> start!20170 tp!17507))

(assert (= (and start!20170 res!93754) b!197971))

(assert (= (and b!197971 res!93748) b!197975))

(assert (= (and b!197975 res!93751) b!197977))

(assert (= (and b!197977 res!93753) b!197978))

(assert (= (and b!197978 res!93749) b!197980))

(assert (= (and b!197980 res!93750) b!197974))

(assert (= (and b!197974 res!93752) b!197979))

(assert (= (and b!197973 condMapEmpty!8090) mapIsEmpty!8090))

(assert (= (and b!197973 (not condMapEmpty!8090)) mapNonEmpty!8090))

(get-info :version)

(assert (= (and mapNonEmpty!8090 ((_ is ValueCellFull!1997) mapValue!8090)) b!197976))

(assert (= (and b!197973 ((_ is ValueCellFull!1997) mapDefault!8090)) b!197972))

(assert (= start!20170 b!197973))

(declare-fun m!224853 () Bool)

(assert (=> b!197979 m!224853))

(declare-fun m!224855 () Bool)

(assert (=> b!197979 m!224855))

(declare-fun m!224857 () Bool)

(assert (=> b!197979 m!224857))

(declare-fun m!224859 () Bool)

(assert (=> b!197980 m!224859))

(declare-fun m!224861 () Bool)

(assert (=> mapNonEmpty!8090 m!224861))

(declare-fun m!224863 () Bool)

(assert (=> b!197975 m!224863))

(declare-fun m!224865 () Bool)

(assert (=> b!197977 m!224865))

(declare-fun m!224867 () Bool)

(assert (=> b!197974 m!224867))

(declare-fun m!224869 () Bool)

(assert (=> start!20170 m!224869))

(declare-fun m!224871 () Bool)

(assert (=> start!20170 m!224871))

(declare-fun m!224873 () Bool)

(assert (=> start!20170 m!224873))

(check-sat (not b!197975) (not b!197980) (not mapNonEmpty!8090) (not b_next!4825) (not b!197977) (not start!20170) (not b!197979) b_and!11585 tp_is_empty!4681)
(check-sat b_and!11585 (not b_next!4825))
