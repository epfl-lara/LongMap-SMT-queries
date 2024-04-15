; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82870 () Bool)

(assert start!82870)

(declare-fun b_free!19015 () Bool)

(declare-fun b_next!19015 () Bool)

(assert (=> start!82870 (= b_free!19015 (not b_next!19015))))

(declare-fun tp!66175 () Bool)

(declare-fun b_and!30477 () Bool)

(assert (=> start!82870 (= tp!66175 b_and!30477)))

(declare-fun b!966847 () Bool)

(declare-fun res!647252 () Bool)

(declare-fun e!544975 () Bool)

(assert (=> b!966847 (=> (not res!647252) (not e!544975))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!966847 (= res!647252 (bvsgt from!2084 newFrom!159))))

(declare-fun b!966848 () Bool)

(declare-fun res!647246 () Bool)

(assert (=> b!966848 (=> (not res!647246) (not e!544975))))

(declare-datatypes ((array!59650 0))(
  ( (array!59651 (arr!28694 (Array (_ BitVec 32) (_ BitVec 64))) (size!29175 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59650)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59650 (_ BitVec 32)) Bool)

(assert (=> b!966848 (= res!647246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966849 () Bool)

(declare-fun res!647249 () Bool)

(assert (=> b!966849 (=> (not res!647249) (not e!544975))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34081 0))(
  ( (V!34082 (val!10962 Int)) )
))
(declare-datatypes ((ValueCell!10430 0))(
  ( (ValueCellFull!10430 (v!13519 V!34081)) (EmptyCell!10430) )
))
(declare-datatypes ((array!59652 0))(
  ( (array!59653 (arr!28695 (Array (_ BitVec 32) ValueCell!10430)) (size!29176 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59652)

(assert (=> b!966849 (= res!647249 (and (= (size!29176 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29175 _keys!1686) (size!29176 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!966850 () Bool)

(declare-fun res!647251 () Bool)

(assert (=> b!966850 (=> (not res!647251) (not e!544975))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966850 (= res!647251 (validKeyInArray!0 (select (arr!28694 _keys!1686) i!803)))))

(declare-fun b!966851 () Bool)

(assert (=> b!966851 (= e!544975 (not true))))

(declare-fun minValue!1342 () V!34081)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34081)

(declare-datatypes ((tuple2!14168 0))(
  ( (tuple2!14169 (_1!7095 (_ BitVec 64)) (_2!7095 V!34081)) )
))
(declare-datatypes ((List!19975 0))(
  ( (Nil!19972) (Cons!19971 (h!21133 tuple2!14168) (t!28329 List!19975)) )
))
(declare-datatypes ((ListLongMap!12855 0))(
  ( (ListLongMap!12856 (toList!6443 List!19975)) )
))
(declare-fun contains!5488 (ListLongMap!12855 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3605 (array!59650 array!59652 (_ BitVec 32) (_ BitVec 32) V!34081 V!34081 (_ BitVec 32) Int) ListLongMap!12855)

(assert (=> b!966851 (contains!5488 (getCurrentListMap!3605 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28694 _keys!1686) i!803))))

(declare-datatypes ((Unit!32182 0))(
  ( (Unit!32183) )
))
(declare-fun lt!431153 () Unit!32182)

(declare-fun lemmaInListMapFromThenInFromMinusOne!55 (array!59650 array!59652 (_ BitVec 32) (_ BitVec 32) V!34081 V!34081 (_ BitVec 32) (_ BitVec 32) Int) Unit!32182)

(assert (=> b!966851 (= lt!431153 (lemmaInListMapFromThenInFromMinusOne!55 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun res!647250 () Bool)

(assert (=> start!82870 (=> (not res!647250) (not e!544975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82870 (= res!647250 (validMask!0 mask!2110))))

(assert (=> start!82870 e!544975))

(assert (=> start!82870 true))

(declare-fun e!544976 () Bool)

(declare-fun array_inv!22279 (array!59652) Bool)

(assert (=> start!82870 (and (array_inv!22279 _values!1400) e!544976)))

(declare-fun array_inv!22280 (array!59650) Bool)

(assert (=> start!82870 (array_inv!22280 _keys!1686)))

(assert (=> start!82870 tp!66175))

(declare-fun tp_is_empty!21823 () Bool)

(assert (=> start!82870 tp_is_empty!21823))

(declare-fun b!966852 () Bool)

(declare-fun res!647248 () Bool)

(assert (=> b!966852 (=> (not res!647248) (not e!544975))))

(assert (=> b!966852 (= res!647248 (contains!5488 (getCurrentListMap!3605 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28694 _keys!1686) i!803)))))

(declare-fun b!966853 () Bool)

(declare-fun e!544978 () Bool)

(assert (=> b!966853 (= e!544978 tp_is_empty!21823)))

(declare-fun b!966854 () Bool)

(declare-fun e!544977 () Bool)

(declare-fun mapRes!34729 () Bool)

(assert (=> b!966854 (= e!544976 (and e!544977 mapRes!34729))))

(declare-fun condMapEmpty!34729 () Bool)

(declare-fun mapDefault!34729 () ValueCell!10430)

(assert (=> b!966854 (= condMapEmpty!34729 (= (arr!28695 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10430)) mapDefault!34729)))))

(declare-fun b!966855 () Bool)

(declare-fun res!647245 () Bool)

(assert (=> b!966855 (=> (not res!647245) (not e!544975))))

(assert (=> b!966855 (= res!647245 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29175 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29175 _keys!1686))))))

(declare-fun mapNonEmpty!34729 () Bool)

(declare-fun tp!66174 () Bool)

(assert (=> mapNonEmpty!34729 (= mapRes!34729 (and tp!66174 e!544978))))

(declare-fun mapValue!34729 () ValueCell!10430)

(declare-fun mapRest!34729 () (Array (_ BitVec 32) ValueCell!10430))

(declare-fun mapKey!34729 () (_ BitVec 32))

(assert (=> mapNonEmpty!34729 (= (arr!28695 _values!1400) (store mapRest!34729 mapKey!34729 mapValue!34729))))

(declare-fun mapIsEmpty!34729 () Bool)

(assert (=> mapIsEmpty!34729 mapRes!34729))

(declare-fun b!966856 () Bool)

(declare-fun res!647247 () Bool)

(assert (=> b!966856 (=> (not res!647247) (not e!544975))))

(declare-datatypes ((List!19976 0))(
  ( (Nil!19973) (Cons!19972 (h!21134 (_ BitVec 64)) (t!28330 List!19976)) )
))
(declare-fun arrayNoDuplicates!0 (array!59650 (_ BitVec 32) List!19976) Bool)

(assert (=> b!966856 (= res!647247 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19973))))

(declare-fun b!966857 () Bool)

(assert (=> b!966857 (= e!544977 tp_is_empty!21823)))

(assert (= (and start!82870 res!647250) b!966849))

(assert (= (and b!966849 res!647249) b!966848))

(assert (= (and b!966848 res!647246) b!966856))

(assert (= (and b!966856 res!647247) b!966855))

(assert (= (and b!966855 res!647245) b!966850))

(assert (= (and b!966850 res!647251) b!966852))

(assert (= (and b!966852 res!647248) b!966847))

(assert (= (and b!966847 res!647252) b!966851))

(assert (= (and b!966854 condMapEmpty!34729) mapIsEmpty!34729))

(assert (= (and b!966854 (not condMapEmpty!34729)) mapNonEmpty!34729))

(get-info :version)

(assert (= (and mapNonEmpty!34729 ((_ is ValueCellFull!10430) mapValue!34729)) b!966853))

(assert (= (and b!966854 ((_ is ValueCellFull!10430) mapDefault!34729)) b!966857))

(assert (= start!82870 b!966854))

(declare-fun m!894955 () Bool)

(assert (=> mapNonEmpty!34729 m!894955))

(declare-fun m!894957 () Bool)

(assert (=> b!966852 m!894957))

(declare-fun m!894959 () Bool)

(assert (=> b!966852 m!894959))

(assert (=> b!966852 m!894957))

(assert (=> b!966852 m!894959))

(declare-fun m!894961 () Bool)

(assert (=> b!966852 m!894961))

(assert (=> b!966850 m!894959))

(assert (=> b!966850 m!894959))

(declare-fun m!894963 () Bool)

(assert (=> b!966850 m!894963))

(declare-fun m!894965 () Bool)

(assert (=> b!966851 m!894965))

(assert (=> b!966851 m!894959))

(assert (=> b!966851 m!894965))

(assert (=> b!966851 m!894959))

(declare-fun m!894967 () Bool)

(assert (=> b!966851 m!894967))

(declare-fun m!894969 () Bool)

(assert (=> b!966851 m!894969))

(declare-fun m!894971 () Bool)

(assert (=> start!82870 m!894971))

(declare-fun m!894973 () Bool)

(assert (=> start!82870 m!894973))

(declare-fun m!894975 () Bool)

(assert (=> start!82870 m!894975))

(declare-fun m!894977 () Bool)

(assert (=> b!966848 m!894977))

(declare-fun m!894979 () Bool)

(assert (=> b!966856 m!894979))

(check-sat b_and!30477 (not b_next!19015) (not start!82870) (not mapNonEmpty!34729) (not b!966848) (not b!966852) (not b!966850) (not b!966851) tp_is_empty!21823 (not b!966856))
(check-sat b_and!30477 (not b_next!19015))
