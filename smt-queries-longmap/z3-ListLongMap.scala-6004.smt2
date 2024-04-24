; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78044 () Bool)

(assert start!78044)

(declare-fun b_free!16435 () Bool)

(declare-fun b_next!16435 () Bool)

(assert (=> start!78044 (= b_free!16435 (not b_next!16435))))

(declare-fun tp!57571 () Bool)

(declare-fun b_and!27013 () Bool)

(assert (=> start!78044 (= tp!57571 b_and!27013)))

(declare-fun b!910231 () Bool)

(declare-fun e!510286 () Bool)

(declare-fun e!510285 () Bool)

(declare-fun mapRes!29995 () Bool)

(assert (=> b!910231 (= e!510286 (and e!510285 mapRes!29995))))

(declare-fun condMapEmpty!29995 () Bool)

(declare-datatypes ((V!30103 0))(
  ( (V!30104 (val!9477 Int)) )
))
(declare-datatypes ((ValueCell!8945 0))(
  ( (ValueCellFull!8945 (v!11981 V!30103)) (EmptyCell!8945) )
))
(declare-datatypes ((array!53781 0))(
  ( (array!53782 (arr!25844 (Array (_ BitVec 32) ValueCell!8945)) (size!26304 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53781)

(declare-fun mapDefault!29995 () ValueCell!8945)

(assert (=> b!910231 (= condMapEmpty!29995 (= (arr!25844 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8945)) mapDefault!29995)))))

(declare-fun mapNonEmpty!29995 () Bool)

(declare-fun tp!57570 () Bool)

(declare-fun e!510288 () Bool)

(assert (=> mapNonEmpty!29995 (= mapRes!29995 (and tp!57570 e!510288))))

(declare-fun mapRest!29995 () (Array (_ BitVec 32) ValueCell!8945))

(declare-fun mapKey!29995 () (_ BitVec 32))

(declare-fun mapValue!29995 () ValueCell!8945)

(assert (=> mapNonEmpty!29995 (= (arr!25844 _values!1152) (store mapRest!29995 mapKey!29995 mapValue!29995))))

(declare-fun b!910232 () Bool)

(declare-fun res!614091 () Bool)

(declare-fun e!510287 () Bool)

(assert (=> b!910232 (=> (not res!614091) (not e!510287))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53783 0))(
  ( (array!53784 (arr!25845 (Array (_ BitVec 32) (_ BitVec 64))) (size!26305 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53783)

(assert (=> b!910232 (= res!614091 (and (= (size!26304 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26305 _keys!1386) (size!26304 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!29995 () Bool)

(assert (=> mapIsEmpty!29995 mapRes!29995))

(declare-fun b!910233 () Bool)

(declare-fun tp_is_empty!18853 () Bool)

(assert (=> b!910233 (= e!510288 tp_is_empty!18853)))

(declare-fun b!910234 () Bool)

(declare-fun res!614092 () Bool)

(assert (=> b!910234 (=> (not res!614092) (not e!510287))))

(declare-datatypes ((List!18124 0))(
  ( (Nil!18121) (Cons!18120 (h!19272 (_ BitVec 64)) (t!25697 List!18124)) )
))
(declare-fun arrayNoDuplicates!0 (array!53783 (_ BitVec 32) List!18124) Bool)

(assert (=> b!910234 (= res!614092 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18121))))

(declare-fun res!614090 () Bool)

(assert (=> start!78044 (=> (not res!614090) (not e!510287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78044 (= res!614090 (validMask!0 mask!1756))))

(assert (=> start!78044 e!510287))

(declare-fun array_inv!20286 (array!53781) Bool)

(assert (=> start!78044 (and (array_inv!20286 _values!1152) e!510286)))

(assert (=> start!78044 tp!57571))

(assert (=> start!78044 true))

(assert (=> start!78044 tp_is_empty!18853))

(declare-fun array_inv!20287 (array!53783) Bool)

(assert (=> start!78044 (array_inv!20287 _keys!1386)))

(declare-fun b!910235 () Bool)

(assert (=> b!910235 (= e!510285 tp_is_empty!18853)))

(declare-fun b!910236 () Bool)

(assert (=> b!910236 (= e!510287 false)))

(declare-fun lt!410340 () Bool)

(declare-fun zeroValue!1094 () V!30103)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30103)

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((tuple2!12304 0))(
  ( (tuple2!12305 (_1!6163 (_ BitVec 64)) (_2!6163 V!30103)) )
))
(declare-datatypes ((List!18125 0))(
  ( (Nil!18122) (Cons!18121 (h!19273 tuple2!12304) (t!25698 List!18125)) )
))
(declare-datatypes ((ListLongMap!11003 0))(
  ( (ListLongMap!11004 (toList!5517 List!18125)) )
))
(declare-fun contains!4568 (ListLongMap!11003 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2778 (array!53783 array!53781 (_ BitVec 32) (_ BitVec 32) V!30103 V!30103 (_ BitVec 32) Int) ListLongMap!11003)

(assert (=> b!910236 (= lt!410340 (contains!4568 (getCurrentListMap!2778 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!910237 () Bool)

(declare-fun res!614093 () Bool)

(assert (=> b!910237 (=> (not res!614093) (not e!510287))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53783 (_ BitVec 32)) Bool)

(assert (=> b!910237 (= res!614093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!78044 res!614090) b!910232))

(assert (= (and b!910232 res!614091) b!910237))

(assert (= (and b!910237 res!614093) b!910234))

(assert (= (and b!910234 res!614092) b!910236))

(assert (= (and b!910231 condMapEmpty!29995) mapIsEmpty!29995))

(assert (= (and b!910231 (not condMapEmpty!29995)) mapNonEmpty!29995))

(get-info :version)

(assert (= (and mapNonEmpty!29995 ((_ is ValueCellFull!8945) mapValue!29995)) b!910233))

(assert (= (and b!910231 ((_ is ValueCellFull!8945) mapDefault!29995)) b!910235))

(assert (= start!78044 b!910231))

(declare-fun m!845895 () Bool)

(assert (=> b!910237 m!845895))

(declare-fun m!845897 () Bool)

(assert (=> b!910234 m!845897))

(declare-fun m!845899 () Bool)

(assert (=> start!78044 m!845899))

(declare-fun m!845901 () Bool)

(assert (=> start!78044 m!845901))

(declare-fun m!845903 () Bool)

(assert (=> start!78044 m!845903))

(declare-fun m!845905 () Bool)

(assert (=> mapNonEmpty!29995 m!845905))

(declare-fun m!845907 () Bool)

(assert (=> b!910236 m!845907))

(assert (=> b!910236 m!845907))

(declare-fun m!845909 () Bool)

(assert (=> b!910236 m!845909))

(check-sat (not mapNonEmpty!29995) b_and!27013 (not b!910237) tp_is_empty!18853 (not b!910234) (not start!78044) (not b_next!16435) (not b!910236))
(check-sat b_and!27013 (not b_next!16435))
