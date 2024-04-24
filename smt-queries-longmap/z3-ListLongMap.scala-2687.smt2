; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39926 () Bool)

(assert start!39926)

(declare-fun b_free!10207 () Bool)

(declare-fun b_next!10207 () Bool)

(assert (=> start!39926 (= b_free!10207 (not b_next!10207))))

(declare-fun tp!36149 () Bool)

(declare-fun b_and!18087 () Bool)

(assert (=> start!39926 (= tp!36149 b_and!18087)))

(declare-fun b!433569 () Bool)

(declare-fun e!256337 () Bool)

(declare-fun e!256338 () Bool)

(assert (=> b!433569 (= e!256337 e!256338)))

(declare-fun res!255236 () Bool)

(assert (=> b!433569 (=> res!255236 e!256338)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((array!26554 0))(
  ( (array!26555 (arr!12726 (Array (_ BitVec 32) (_ BitVec 64))) (size!13078 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26554)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!433569 (= res!255236 (= k0!794 (select (arr!12726 _keys!709) from!863)))))

(assert (=> b!433569 (not (= (select (arr!12726 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12838 0))(
  ( (Unit!12839) )
))
(declare-fun lt!199181 () Unit!12838)

(declare-fun e!256334 () Unit!12838)

(assert (=> b!433569 (= lt!199181 e!256334)))

(declare-fun c!55623 () Bool)

(assert (=> b!433569 (= c!55623 (= (select (arr!12726 _keys!709) from!863) k0!794))))

(declare-datatypes ((V!16251 0))(
  ( (V!16252 (val!5724 Int)) )
))
(declare-datatypes ((tuple2!7474 0))(
  ( (tuple2!7475 (_1!3748 (_ BitVec 64)) (_2!3748 V!16251)) )
))
(declare-datatypes ((List!7464 0))(
  ( (Nil!7461) (Cons!7460 (h!8316 tuple2!7474) (t!13112 List!7464)) )
))
(declare-datatypes ((ListLongMap!6389 0))(
  ( (ListLongMap!6390 (toList!3210 List!7464)) )
))
(declare-fun lt!199183 () ListLongMap!6389)

(declare-fun lt!199184 () ListLongMap!6389)

(assert (=> b!433569 (= lt!199183 lt!199184)))

(declare-fun lt!199190 () ListLongMap!6389)

(declare-fun lt!199194 () tuple2!7474)

(declare-fun +!1417 (ListLongMap!6389 tuple2!7474) ListLongMap!6389)

(assert (=> b!433569 (= lt!199184 (+!1417 lt!199190 lt!199194))))

(declare-fun lt!199185 () V!16251)

(assert (=> b!433569 (= lt!199194 (tuple2!7475 (select (arr!12726 _keys!709) from!863) lt!199185))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5336 0))(
  ( (ValueCellFull!5336 (v!7972 V!16251)) (EmptyCell!5336) )
))
(declare-datatypes ((array!26556 0))(
  ( (array!26557 (arr!12727 (Array (_ BitVec 32) ValueCell!5336)) (size!13079 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26556)

(declare-fun get!6344 (ValueCell!5336 V!16251) V!16251)

(declare-fun dynLambda!821 (Int (_ BitVec 64)) V!16251)

(assert (=> b!433569 (= lt!199185 (get!6344 (select (arr!12727 _values!549) from!863) (dynLambda!821 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433570 () Bool)

(declare-fun e!256330 () Bool)

(declare-fun e!256331 () Bool)

(assert (=> b!433570 (= e!256330 e!256331)))

(declare-fun res!255224 () Bool)

(assert (=> b!433570 (=> (not res!255224) (not e!256331))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!433570 (= res!255224 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16251)

(declare-fun lt!199192 () array!26556)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!199191 () array!26554)

(declare-fun minValue!515 () V!16251)

(declare-fun getCurrentListMapNoExtraKeys!1446 (array!26554 array!26556 (_ BitVec 32) (_ BitVec 32) V!16251 V!16251 (_ BitVec 32) Int) ListLongMap!6389)

(assert (=> b!433570 (= lt!199183 (getCurrentListMapNoExtraKeys!1446 lt!199191 lt!199192 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16251)

(assert (=> b!433570 (= lt!199192 (array!26557 (store (arr!12727 _values!549) i!563 (ValueCellFull!5336 v!412)) (size!13079 _values!549)))))

(declare-fun lt!199186 () ListLongMap!6389)

(assert (=> b!433570 (= lt!199186 (getCurrentListMapNoExtraKeys!1446 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!433571 () Bool)

(declare-fun Unit!12840 () Unit!12838)

(assert (=> b!433571 (= e!256334 Unit!12840)))

(declare-fun lt!199188 () Unit!12838)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26554 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12838)

(assert (=> b!433571 (= lt!199188 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!433571 false))

(declare-fun b!433572 () Bool)

(declare-fun res!255228 () Bool)

(declare-fun e!256333 () Bool)

(assert (=> b!433572 (=> (not res!255228) (not e!256333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!433572 (= res!255228 (validMask!0 mask!1025))))

(declare-fun b!433573 () Bool)

(declare-fun res!255233 () Bool)

(assert (=> b!433573 (=> (not res!255233) (not e!256333))))

(declare-datatypes ((List!7465 0))(
  ( (Nil!7462) (Cons!7461 (h!8317 (_ BitVec 64)) (t!13113 List!7465)) )
))
(declare-fun arrayNoDuplicates!0 (array!26554 (_ BitVec 32) List!7465) Bool)

(assert (=> b!433573 (= res!255233 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7462))))

(declare-fun b!433574 () Bool)

(declare-fun res!255237 () Bool)

(assert (=> b!433574 (=> (not res!255237) (not e!256333))))

(assert (=> b!433574 (= res!255237 (or (= (select (arr!12726 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12726 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18660 () Bool)

(declare-fun mapRes!18660 () Bool)

(declare-fun tp!36150 () Bool)

(declare-fun e!256332 () Bool)

(assert (=> mapNonEmpty!18660 (= mapRes!18660 (and tp!36150 e!256332))))

(declare-fun mapKey!18660 () (_ BitVec 32))

(declare-fun mapValue!18660 () ValueCell!5336)

(declare-fun mapRest!18660 () (Array (_ BitVec 32) ValueCell!5336))

(assert (=> mapNonEmpty!18660 (= (arr!12727 _values!549) (store mapRest!18660 mapKey!18660 mapValue!18660))))

(declare-fun b!433575 () Bool)

(declare-fun e!256335 () Bool)

(declare-fun e!256339 () Bool)

(assert (=> b!433575 (= e!256335 (and e!256339 mapRes!18660))))

(declare-fun condMapEmpty!18660 () Bool)

(declare-fun mapDefault!18660 () ValueCell!5336)

(assert (=> b!433575 (= condMapEmpty!18660 (= (arr!12727 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5336)) mapDefault!18660)))))

(declare-fun b!433576 () Bool)

(declare-fun tp_is_empty!11359 () Bool)

(assert (=> b!433576 (= e!256332 tp_is_empty!11359)))

(declare-fun b!433577 () Bool)

(declare-fun res!255229 () Bool)

(assert (=> b!433577 (=> (not res!255229) (not e!256333))))

(assert (=> b!433577 (= res!255229 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13078 _keys!709))))))

(declare-fun mapIsEmpty!18660 () Bool)

(assert (=> mapIsEmpty!18660 mapRes!18660))

(declare-fun b!433578 () Bool)

(declare-fun Unit!12841 () Unit!12838)

(assert (=> b!433578 (= e!256334 Unit!12841)))

(declare-fun b!433579 () Bool)

(declare-fun res!255227 () Bool)

(assert (=> b!433579 (=> (not res!255227) (not e!256333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26554 (_ BitVec 32)) Bool)

(assert (=> b!433579 (= res!255227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!255234 () Bool)

(assert (=> start!39926 (=> (not res!255234) (not e!256333))))

(assert (=> start!39926 (= res!255234 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13078 _keys!709))))))

(assert (=> start!39926 e!256333))

(assert (=> start!39926 tp_is_empty!11359))

(assert (=> start!39926 tp!36149))

(assert (=> start!39926 true))

(declare-fun array_inv!9310 (array!26556) Bool)

(assert (=> start!39926 (and (array_inv!9310 _values!549) e!256335)))

(declare-fun array_inv!9311 (array!26554) Bool)

(assert (=> start!39926 (array_inv!9311 _keys!709)))

(declare-fun b!433580 () Bool)

(declare-fun res!255231 () Bool)

(assert (=> b!433580 (=> (not res!255231) (not e!256333))))

(assert (=> b!433580 (= res!255231 (and (= (size!13079 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13078 _keys!709) (size!13079 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!433581 () Bool)

(assert (=> b!433581 (= e!256338 true)))

(declare-fun lt!199193 () tuple2!7474)

(declare-fun lt!199187 () ListLongMap!6389)

(assert (=> b!433581 (= lt!199184 (+!1417 (+!1417 lt!199187 lt!199194) lt!199193))))

(declare-fun lt!199182 () Unit!12838)

(declare-fun addCommutativeForDiffKeys!389 (ListLongMap!6389 (_ BitVec 64) V!16251 (_ BitVec 64) V!16251) Unit!12838)

(assert (=> b!433581 (= lt!199182 (addCommutativeForDiffKeys!389 lt!199187 k0!794 v!412 (select (arr!12726 _keys!709) from!863) lt!199185))))

(declare-fun b!433582 () Bool)

(assert (=> b!433582 (= e!256333 e!256330)))

(declare-fun res!255223 () Bool)

(assert (=> b!433582 (=> (not res!255223) (not e!256330))))

(assert (=> b!433582 (= res!255223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!199191 mask!1025))))

(assert (=> b!433582 (= lt!199191 (array!26555 (store (arr!12726 _keys!709) i!563 k0!794) (size!13078 _keys!709)))))

(declare-fun b!433583 () Bool)

(assert (=> b!433583 (= e!256339 tp_is_empty!11359)))

(declare-fun b!433584 () Bool)

(declare-fun res!255226 () Bool)

(assert (=> b!433584 (=> (not res!255226) (not e!256330))))

(assert (=> b!433584 (= res!255226 (arrayNoDuplicates!0 lt!199191 #b00000000000000000000000000000000 Nil!7462))))

(declare-fun b!433585 () Bool)

(declare-fun res!255235 () Bool)

(assert (=> b!433585 (=> (not res!255235) (not e!256333))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!433585 (= res!255235 (validKeyInArray!0 k0!794))))

(declare-fun b!433586 () Bool)

(assert (=> b!433586 (= e!256331 (not e!256337))))

(declare-fun res!255225 () Bool)

(assert (=> b!433586 (=> res!255225 e!256337)))

(assert (=> b!433586 (= res!255225 (not (validKeyInArray!0 (select (arr!12726 _keys!709) from!863))))))

(declare-fun lt!199189 () ListLongMap!6389)

(assert (=> b!433586 (= lt!199189 lt!199190)))

(assert (=> b!433586 (= lt!199190 (+!1417 lt!199187 lt!199193))))

(assert (=> b!433586 (= lt!199189 (getCurrentListMapNoExtraKeys!1446 lt!199191 lt!199192 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!433586 (= lt!199193 (tuple2!7475 k0!794 v!412))))

(assert (=> b!433586 (= lt!199187 (getCurrentListMapNoExtraKeys!1446 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!199180 () Unit!12838)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!583 (array!26554 array!26556 (_ BitVec 32) (_ BitVec 32) V!16251 V!16251 (_ BitVec 32) (_ BitVec 64) V!16251 (_ BitVec 32) Int) Unit!12838)

(assert (=> b!433586 (= lt!199180 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!583 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!433587 () Bool)

(declare-fun res!255232 () Bool)

(assert (=> b!433587 (=> (not res!255232) (not e!256333))))

(declare-fun arrayContainsKey!0 (array!26554 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!433587 (= res!255232 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!433588 () Bool)

(declare-fun res!255230 () Bool)

(assert (=> b!433588 (=> (not res!255230) (not e!256330))))

(assert (=> b!433588 (= res!255230 (bvsle from!863 i!563))))

(assert (= (and start!39926 res!255234) b!433572))

(assert (= (and b!433572 res!255228) b!433580))

(assert (= (and b!433580 res!255231) b!433579))

(assert (= (and b!433579 res!255227) b!433573))

(assert (= (and b!433573 res!255233) b!433577))

(assert (= (and b!433577 res!255229) b!433585))

(assert (= (and b!433585 res!255235) b!433574))

(assert (= (and b!433574 res!255237) b!433587))

(assert (= (and b!433587 res!255232) b!433582))

(assert (= (and b!433582 res!255223) b!433584))

(assert (= (and b!433584 res!255226) b!433588))

(assert (= (and b!433588 res!255230) b!433570))

(assert (= (and b!433570 res!255224) b!433586))

(assert (= (and b!433586 (not res!255225)) b!433569))

(assert (= (and b!433569 c!55623) b!433571))

(assert (= (and b!433569 (not c!55623)) b!433578))

(assert (= (and b!433569 (not res!255236)) b!433581))

(assert (= (and b!433575 condMapEmpty!18660) mapIsEmpty!18660))

(assert (= (and b!433575 (not condMapEmpty!18660)) mapNonEmpty!18660))

(get-info :version)

(assert (= (and mapNonEmpty!18660 ((_ is ValueCellFull!5336) mapValue!18660)) b!433576))

(assert (= (and b!433575 ((_ is ValueCellFull!5336) mapDefault!18660)) b!433583))

(assert (= start!39926 b!433575))

(declare-fun b_lambda!9317 () Bool)

(assert (=> (not b_lambda!9317) (not b!433569)))

(declare-fun t!13111 () Bool)

(declare-fun tb!3605 () Bool)

(assert (=> (and start!39926 (= defaultEntry!557 defaultEntry!557) t!13111) tb!3605))

(declare-fun result!6745 () Bool)

(assert (=> tb!3605 (= result!6745 tp_is_empty!11359)))

(assert (=> b!433569 t!13111))

(declare-fun b_and!18089 () Bool)

(assert (= b_and!18087 (and (=> t!13111 result!6745) b_and!18089)))

(declare-fun m!421841 () Bool)

(assert (=> b!433584 m!421841))

(declare-fun m!421843 () Bool)

(assert (=> b!433579 m!421843))

(declare-fun m!421845 () Bool)

(assert (=> b!433572 m!421845))

(declare-fun m!421847 () Bool)

(assert (=> b!433571 m!421847))

(declare-fun m!421849 () Bool)

(assert (=> b!433573 m!421849))

(declare-fun m!421851 () Bool)

(assert (=> b!433574 m!421851))

(declare-fun m!421853 () Bool)

(assert (=> b!433570 m!421853))

(declare-fun m!421855 () Bool)

(assert (=> b!433570 m!421855))

(declare-fun m!421857 () Bool)

(assert (=> b!433570 m!421857))

(declare-fun m!421859 () Bool)

(assert (=> b!433587 m!421859))

(declare-fun m!421861 () Bool)

(assert (=> b!433582 m!421861))

(declare-fun m!421863 () Bool)

(assert (=> b!433582 m!421863))

(declare-fun m!421865 () Bool)

(assert (=> b!433585 m!421865))

(declare-fun m!421867 () Bool)

(assert (=> b!433581 m!421867))

(assert (=> b!433581 m!421867))

(declare-fun m!421869 () Bool)

(assert (=> b!433581 m!421869))

(declare-fun m!421871 () Bool)

(assert (=> b!433581 m!421871))

(assert (=> b!433581 m!421871))

(declare-fun m!421873 () Bool)

(assert (=> b!433581 m!421873))

(assert (=> b!433569 m!421871))

(declare-fun m!421875 () Bool)

(assert (=> b!433569 m!421875))

(declare-fun m!421877 () Bool)

(assert (=> b!433569 m!421877))

(declare-fun m!421879 () Bool)

(assert (=> b!433569 m!421879))

(assert (=> b!433569 m!421879))

(assert (=> b!433569 m!421877))

(declare-fun m!421881 () Bool)

(assert (=> b!433569 m!421881))

(declare-fun m!421883 () Bool)

(assert (=> mapNonEmpty!18660 m!421883))

(declare-fun m!421885 () Bool)

(assert (=> start!39926 m!421885))

(declare-fun m!421887 () Bool)

(assert (=> start!39926 m!421887))

(assert (=> b!433586 m!421871))

(declare-fun m!421889 () Bool)

(assert (=> b!433586 m!421889))

(declare-fun m!421891 () Bool)

(assert (=> b!433586 m!421891))

(declare-fun m!421893 () Bool)

(assert (=> b!433586 m!421893))

(assert (=> b!433586 m!421871))

(declare-fun m!421895 () Bool)

(assert (=> b!433586 m!421895))

(declare-fun m!421897 () Bool)

(assert (=> b!433586 m!421897))

(check-sat (not mapNonEmpty!18660) (not b!433572) (not b!433570) (not b!433587) (not start!39926) (not b!433579) b_and!18089 (not b!433571) (not b!433573) tp_is_empty!11359 (not b!433581) (not b!433584) (not b!433569) (not b!433586) (not b!433585) (not b_next!10207) (not b!433582) (not b_lambda!9317))
(check-sat b_and!18089 (not b_next!10207))
