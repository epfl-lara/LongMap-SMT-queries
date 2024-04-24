; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82870 () Bool)

(assert start!82870)

(declare-fun b_free!18835 () Bool)

(declare-fun b_next!18835 () Bool)

(assert (=> start!82870 (= b_free!18835 (not b_next!18835))))

(declare-fun tp!65625 () Bool)

(declare-fun b_and!30333 () Bool)

(assert (=> start!82870 (= tp!65625 b_and!30333)))

(declare-fun b!965291 () Bool)

(declare-fun res!645839 () Bool)

(declare-fun e!544270 () Bool)

(assert (=> b!965291 (=> (not res!645839) (not e!544270))))

(declare-datatypes ((array!59384 0))(
  ( (array!59385 (arr!28556 (Array (_ BitVec 32) (_ BitVec 64))) (size!29036 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59384)

(declare-datatypes ((List!19804 0))(
  ( (Nil!19801) (Cons!19800 (h!20968 (_ BitVec 64)) (t!28159 List!19804)) )
))
(declare-fun arrayNoDuplicates!0 (array!59384 (_ BitVec 32) List!19804) Bool)

(assert (=> b!965291 (= res!645839 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19801))))

(declare-fun b!965292 () Bool)

(declare-fun res!645841 () Bool)

(assert (=> b!965292 (=> (not res!645841) (not e!544270))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33833 0))(
  ( (V!33834 (val!10869 Int)) )
))
(declare-datatypes ((ValueCell!10337 0))(
  ( (ValueCellFull!10337 (v!13424 V!33833)) (EmptyCell!10337) )
))
(declare-datatypes ((array!59386 0))(
  ( (array!59387 (arr!28557 (Array (_ BitVec 32) ValueCell!10337)) (size!29037 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59386)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!965292 (= res!645841 (and (= (size!29037 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29036 _keys!1686) (size!29037 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34450 () Bool)

(declare-fun mapRes!34450 () Bool)

(assert (=> mapIsEmpty!34450 mapRes!34450))

(declare-fun b!965293 () Bool)

(declare-fun e!544268 () Bool)

(assert (=> b!965293 (= e!544268 true)))

(declare-fun zeroValue!1342 () V!33833)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33833)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-datatypes ((tuple2!13956 0))(
  ( (tuple2!13957 (_1!6989 (_ BitVec 64)) (_2!6989 V!33833)) )
))
(declare-datatypes ((List!19805 0))(
  ( (Nil!19802) (Cons!19801 (h!20969 tuple2!13956) (t!28160 List!19805)) )
))
(declare-datatypes ((ListLongMap!12655 0))(
  ( (ListLongMap!12656 (toList!6343 List!19805)) )
))
(declare-fun contains!5458 (ListLongMap!12655 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3576 (array!59384 array!59386 (_ BitVec 32) (_ BitVec 32) V!33833 V!33833 (_ BitVec 32) Int) ListLongMap!12655)

(assert (=> b!965293 (contains!5458 (getCurrentListMap!3576 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28556 _keys!1686) i!803))))

(declare-datatypes ((Unit!32242 0))(
  ( (Unit!32243) )
))
(declare-fun lt!431456 () Unit!32242)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun lemmaInListMapFromThenInFromSmaller!28 (array!59384 array!59386 (_ BitVec 32) (_ BitVec 32) V!33833 V!33833 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32242)

(assert (=> b!965293 (= lt!431456 (lemmaInListMapFromThenInFromSmaller!28 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun b!965294 () Bool)

(declare-fun res!645844 () Bool)

(assert (=> b!965294 (=> (not res!645844) (not e!544270))))

(assert (=> b!965294 (= res!645844 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29036 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29036 _keys!1686))))))

(declare-fun b!965295 () Bool)

(declare-fun res!645845 () Bool)

(assert (=> b!965295 (=> (not res!645845) (not e!544270))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59384 (_ BitVec 32)) Bool)

(assert (=> b!965295 (= res!645845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965296 () Bool)

(declare-fun e!544266 () Bool)

(declare-fun tp_is_empty!21637 () Bool)

(assert (=> b!965296 (= e!544266 tp_is_empty!21637)))

(declare-fun mapNonEmpty!34450 () Bool)

(declare-fun tp!65626 () Bool)

(declare-fun e!544269 () Bool)

(assert (=> mapNonEmpty!34450 (= mapRes!34450 (and tp!65626 e!544269))))

(declare-fun mapRest!34450 () (Array (_ BitVec 32) ValueCell!10337))

(declare-fun mapKey!34450 () (_ BitVec 32))

(declare-fun mapValue!34450 () ValueCell!10337)

(assert (=> mapNonEmpty!34450 (= (arr!28557 _values!1400) (store mapRest!34450 mapKey!34450 mapValue!34450))))

(declare-fun res!645840 () Bool)

(assert (=> start!82870 (=> (not res!645840) (not e!544270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82870 (= res!645840 (validMask!0 mask!2110))))

(assert (=> start!82870 e!544270))

(assert (=> start!82870 true))

(declare-fun e!544267 () Bool)

(declare-fun array_inv!22185 (array!59386) Bool)

(assert (=> start!82870 (and (array_inv!22185 _values!1400) e!544267)))

(declare-fun array_inv!22186 (array!59384) Bool)

(assert (=> start!82870 (array_inv!22186 _keys!1686)))

(assert (=> start!82870 tp!65625))

(assert (=> start!82870 tp_is_empty!21637))

(declare-fun b!965297 () Bool)

(assert (=> b!965297 (= e!544270 (not e!544268))))

(declare-fun res!645842 () Bool)

(assert (=> b!965297 (=> res!645842 e!544268)))

(assert (=> b!965297 (= res!645842 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29036 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(assert (=> b!965297 (contains!5458 (getCurrentListMap!3576 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28556 _keys!1686) i!803))))

(declare-fun lt!431455 () Unit!32242)

(declare-fun lemmaInListMapFromThenInFromMinusOne!35 (array!59384 array!59386 (_ BitVec 32) (_ BitVec 32) V!33833 V!33833 (_ BitVec 32) (_ BitVec 32) Int) Unit!32242)

(assert (=> b!965297 (= lt!431455 (lemmaInListMapFromThenInFromMinusOne!35 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!965298 () Bool)

(assert (=> b!965298 (= e!544267 (and e!544266 mapRes!34450))))

(declare-fun condMapEmpty!34450 () Bool)

(declare-fun mapDefault!34450 () ValueCell!10337)

(assert (=> b!965298 (= condMapEmpty!34450 (= (arr!28557 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10337)) mapDefault!34450)))))

(declare-fun b!965299 () Bool)

(assert (=> b!965299 (= e!544269 tp_is_empty!21637)))

(declare-fun b!965300 () Bool)

(declare-fun res!645846 () Bool)

(assert (=> b!965300 (=> (not res!645846) (not e!544270))))

(assert (=> b!965300 (= res!645846 (bvsgt from!2084 newFrom!159))))

(declare-fun b!965301 () Bool)

(declare-fun res!645843 () Bool)

(assert (=> b!965301 (=> (not res!645843) (not e!544270))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965301 (= res!645843 (validKeyInArray!0 (select (arr!28556 _keys!1686) i!803)))))

(declare-fun b!965302 () Bool)

(declare-fun res!645838 () Bool)

(assert (=> b!965302 (=> (not res!645838) (not e!544270))))

(assert (=> b!965302 (= res!645838 (contains!5458 (getCurrentListMap!3576 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28556 _keys!1686) i!803)))))

(assert (= (and start!82870 res!645840) b!965292))

(assert (= (and b!965292 res!645841) b!965295))

(assert (= (and b!965295 res!645845) b!965291))

(assert (= (and b!965291 res!645839) b!965294))

(assert (= (and b!965294 res!645844) b!965301))

(assert (= (and b!965301 res!645843) b!965302))

(assert (= (and b!965302 res!645838) b!965300))

(assert (= (and b!965300 res!645846) b!965297))

(assert (= (and b!965297 (not res!645842)) b!965293))

(assert (= (and b!965298 condMapEmpty!34450) mapIsEmpty!34450))

(assert (= (and b!965298 (not condMapEmpty!34450)) mapNonEmpty!34450))

(get-info :version)

(assert (= (and mapNonEmpty!34450 ((_ is ValueCellFull!10337) mapValue!34450)) b!965299))

(assert (= (and b!965298 ((_ is ValueCellFull!10337) mapDefault!34450)) b!965296))

(assert (= start!82870 b!965298))

(declare-fun m!894943 () Bool)

(assert (=> mapNonEmpty!34450 m!894943))

(declare-fun m!894945 () Bool)

(assert (=> b!965291 m!894945))

(declare-fun m!894947 () Bool)

(assert (=> start!82870 m!894947))

(declare-fun m!894949 () Bool)

(assert (=> start!82870 m!894949))

(declare-fun m!894951 () Bool)

(assert (=> start!82870 m!894951))

(declare-fun m!894953 () Bool)

(assert (=> b!965301 m!894953))

(assert (=> b!965301 m!894953))

(declare-fun m!894955 () Bool)

(assert (=> b!965301 m!894955))

(declare-fun m!894957 () Bool)

(assert (=> b!965295 m!894957))

(declare-fun m!894959 () Bool)

(assert (=> b!965302 m!894959))

(assert (=> b!965302 m!894953))

(assert (=> b!965302 m!894959))

(assert (=> b!965302 m!894953))

(declare-fun m!894961 () Bool)

(assert (=> b!965302 m!894961))

(declare-fun m!894963 () Bool)

(assert (=> b!965293 m!894963))

(assert (=> b!965293 m!894953))

(assert (=> b!965293 m!894963))

(assert (=> b!965293 m!894953))

(declare-fun m!894965 () Bool)

(assert (=> b!965293 m!894965))

(declare-fun m!894967 () Bool)

(assert (=> b!965293 m!894967))

(declare-fun m!894969 () Bool)

(assert (=> b!965297 m!894969))

(assert (=> b!965297 m!894953))

(assert (=> b!965297 m!894969))

(assert (=> b!965297 m!894953))

(declare-fun m!894971 () Bool)

(assert (=> b!965297 m!894971))

(declare-fun m!894973 () Bool)

(assert (=> b!965297 m!894973))

(check-sat b_and!30333 (not start!82870) (not b!965302) (not b_next!18835) (not b!965295) (not mapNonEmpty!34450) tp_is_empty!21637 (not b!965301) (not b!965293) (not b!965297) (not b!965291))
(check-sat b_and!30333 (not b_next!18835))
