; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77924 () Bool)

(assert start!77924)

(declare-fun b_free!16467 () Bool)

(declare-fun b_next!16467 () Bool)

(assert (=> start!77924 (= b_free!16467 (not b_next!16467))))

(declare-fun tp!57669 () Bool)

(declare-fun b_and!27037 () Bool)

(assert (=> start!77924 (= tp!57669 b_and!27037)))

(declare-fun mapIsEmpty!30046 () Bool)

(declare-fun mapRes!30046 () Bool)

(assert (=> mapIsEmpty!30046 mapRes!30046))

(declare-fun b!909791 () Bool)

(declare-fun res!614002 () Bool)

(declare-fun e!510016 () Bool)

(assert (=> b!909791 (=> (not res!614002) (not e!510016))))

(declare-datatypes ((array!53794 0))(
  ( (array!53795 (arr!25854 (Array (_ BitVec 32) (_ BitVec 64))) (size!26313 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53794)

(declare-datatypes ((List!18163 0))(
  ( (Nil!18160) (Cons!18159 (h!19305 (_ BitVec 64)) (t!25746 List!18163)) )
))
(declare-fun arrayNoDuplicates!0 (array!53794 (_ BitVec 32) List!18163) Bool)

(assert (=> b!909791 (= res!614002 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18160))))

(declare-fun res!614001 () Bool)

(assert (=> start!77924 (=> (not res!614001) (not e!510016))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77924 (= res!614001 (validMask!0 mask!1756))))

(assert (=> start!77924 e!510016))

(declare-datatypes ((V!30145 0))(
  ( (V!30146 (val!9493 Int)) )
))
(declare-datatypes ((ValueCell!8961 0))(
  ( (ValueCellFull!8961 (v!12001 V!30145)) (EmptyCell!8961) )
))
(declare-datatypes ((array!53796 0))(
  ( (array!53797 (arr!25855 (Array (_ BitVec 32) ValueCell!8961)) (size!26314 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53796)

(declare-fun e!510015 () Bool)

(declare-fun array_inv!20224 (array!53796) Bool)

(assert (=> start!77924 (and (array_inv!20224 _values!1152) e!510015)))

(assert (=> start!77924 tp!57669))

(assert (=> start!77924 true))

(declare-fun tp_is_empty!18885 () Bool)

(assert (=> start!77924 tp_is_empty!18885))

(declare-fun array_inv!20225 (array!53794) Bool)

(assert (=> start!77924 (array_inv!20225 _keys!1386)))

(declare-fun b!909792 () Bool)

(declare-fun res!614004 () Bool)

(assert (=> b!909792 (=> (not res!614004) (not e!510016))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!909792 (= res!614004 (and (= (size!26314 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26313 _keys!1386) (size!26314 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909793 () Bool)

(declare-fun e!510014 () Bool)

(assert (=> b!909793 (= e!510014 tp_is_empty!18885)))

(declare-fun b!909794 () Bool)

(assert (=> b!909794 (= e!510015 (and e!510014 mapRes!30046))))

(declare-fun condMapEmpty!30046 () Bool)

(declare-fun mapDefault!30046 () ValueCell!8961)

(assert (=> b!909794 (= condMapEmpty!30046 (= (arr!25855 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8961)) mapDefault!30046)))))

(declare-fun b!909795 () Bool)

(declare-fun res!614003 () Bool)

(assert (=> b!909795 (=> (not res!614003) (not e!510016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53794 (_ BitVec 32)) Bool)

(assert (=> b!909795 (= res!614003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909796 () Bool)

(assert (=> b!909796 (= e!510016 false)))

(declare-fun lt!410105 () Bool)

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30145)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30145)

(declare-datatypes ((tuple2!12370 0))(
  ( (tuple2!12371 (_1!6196 (_ BitVec 64)) (_2!6196 V!30145)) )
))
(declare-datatypes ((List!18164 0))(
  ( (Nil!18161) (Cons!18160 (h!19306 tuple2!12370) (t!25747 List!18164)) )
))
(declare-datatypes ((ListLongMap!11067 0))(
  ( (ListLongMap!11068 (toList!5549 List!18164)) )
))
(declare-fun contains!4592 (ListLongMap!11067 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2811 (array!53794 array!53796 (_ BitVec 32) (_ BitVec 32) V!30145 V!30145 (_ BitVec 32) Int) ListLongMap!11067)

(assert (=> b!909796 (= lt!410105 (contains!4592 (getCurrentListMap!2811 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapNonEmpty!30046 () Bool)

(declare-fun tp!57668 () Bool)

(declare-fun e!510018 () Bool)

(assert (=> mapNonEmpty!30046 (= mapRes!30046 (and tp!57668 e!510018))))

(declare-fun mapRest!30046 () (Array (_ BitVec 32) ValueCell!8961))

(declare-fun mapKey!30046 () (_ BitVec 32))

(declare-fun mapValue!30046 () ValueCell!8961)

(assert (=> mapNonEmpty!30046 (= (arr!25855 _values!1152) (store mapRest!30046 mapKey!30046 mapValue!30046))))

(declare-fun b!909797 () Bool)

(assert (=> b!909797 (= e!510018 tp_is_empty!18885)))

(assert (= (and start!77924 res!614001) b!909792))

(assert (= (and b!909792 res!614004) b!909795))

(assert (= (and b!909795 res!614003) b!909791))

(assert (= (and b!909791 res!614002) b!909796))

(assert (= (and b!909794 condMapEmpty!30046) mapIsEmpty!30046))

(assert (= (and b!909794 (not condMapEmpty!30046)) mapNonEmpty!30046))

(get-info :version)

(assert (= (and mapNonEmpty!30046 ((_ is ValueCellFull!8961) mapValue!30046)) b!909797))

(assert (= (and b!909794 ((_ is ValueCellFull!8961) mapDefault!30046)) b!909793))

(assert (= start!77924 b!909794))

(declare-fun m!844949 () Bool)

(assert (=> mapNonEmpty!30046 m!844949))

(declare-fun m!844951 () Bool)

(assert (=> b!909796 m!844951))

(assert (=> b!909796 m!844951))

(declare-fun m!844953 () Bool)

(assert (=> b!909796 m!844953))

(declare-fun m!844955 () Bool)

(assert (=> b!909795 m!844955))

(declare-fun m!844957 () Bool)

(assert (=> start!77924 m!844957))

(declare-fun m!844959 () Bool)

(assert (=> start!77924 m!844959))

(declare-fun m!844961 () Bool)

(assert (=> start!77924 m!844961))

(declare-fun m!844963 () Bool)

(assert (=> b!909791 m!844963))

(check-sat (not b!909791) (not b_next!16467) tp_is_empty!18885 (not b!909795) (not b!909796) (not mapNonEmpty!30046) b_and!27037 (not start!77924))
(check-sat b_and!27037 (not b_next!16467))
