; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77642 () Bool)

(assert start!77642)

(declare-fun b_free!16227 () Bool)

(declare-fun b_next!16227 () Bool)

(assert (=> start!77642 (= b_free!16227 (not b_next!16227))))

(declare-fun tp!56942 () Bool)

(declare-fun b_and!26607 () Bool)

(assert (=> start!77642 (= tp!56942 b_and!26607)))

(declare-fun b!905164 () Bool)

(declare-fun res!610794 () Bool)

(declare-fun e!507225 () Bool)

(assert (=> b!905164 (=> res!610794 e!507225)))

(declare-datatypes ((V!29825 0))(
  ( (V!29826 (val!9373 Int)) )
))
(declare-fun lt!408456 () V!29825)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-datatypes ((tuple2!12188 0))(
  ( (tuple2!12189 (_1!6105 (_ BitVec 64)) (_2!6105 V!29825)) )
))
(declare-datatypes ((List!18000 0))(
  ( (Nil!17997) (Cons!17996 (h!19142 tuple2!12188) (t!25399 List!18000)) )
))
(declare-datatypes ((ListLongMap!10885 0))(
  ( (ListLongMap!10886 (toList!5458 List!18000)) )
))
(declare-fun lt!408454 () ListLongMap!10885)

(declare-fun apply!448 (ListLongMap!10885 (_ BitVec 64)) V!29825)

(assert (=> b!905164 (= res!610794 (not (= (apply!448 lt!408454 k0!1033) lt!408456)))))

(declare-fun b!905165 () Bool)

(declare-fun e!507224 () Bool)

(declare-fun tp_is_empty!18645 () Bool)

(assert (=> b!905165 (= e!507224 tp_is_empty!18645)))

(declare-fun b!905166 () Bool)

(declare-fun e!507220 () Bool)

(assert (=> b!905166 (= e!507220 tp_is_empty!18645)))

(declare-fun b!905167 () Bool)

(declare-fun res!610797 () Bool)

(declare-fun e!507218 () Bool)

(assert (=> b!905167 (=> (not res!610797) (not e!507218))))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53334 0))(
  ( (array!53335 (arr!25626 (Array (_ BitVec 32) (_ BitVec 64))) (size!26085 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53334)

(assert (=> b!905167 (= res!610797 (and (= (select (arr!25626 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!905168 () Bool)

(declare-fun e!507219 () Bool)

(declare-fun mapRes!29680 () Bool)

(assert (=> b!905168 (= e!507219 (and e!507224 mapRes!29680))))

(declare-fun condMapEmpty!29680 () Bool)

(declare-datatypes ((ValueCell!8841 0))(
  ( (ValueCellFull!8841 (v!11878 V!29825)) (EmptyCell!8841) )
))
(declare-datatypes ((array!53336 0))(
  ( (array!53337 (arr!25627 (Array (_ BitVec 32) ValueCell!8841)) (size!26086 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53336)

(declare-fun mapDefault!29680 () ValueCell!8841)

(assert (=> b!905168 (= condMapEmpty!29680 (= (arr!25627 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8841)) mapDefault!29680)))))

(declare-fun b!905169 () Bool)

(declare-fun res!610790 () Bool)

(declare-fun e!507223 () Bool)

(assert (=> b!905169 (=> (not res!610790) (not e!507223))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53334 (_ BitVec 32)) Bool)

(assert (=> b!905169 (= res!610790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!905170 () Bool)

(declare-fun res!610792 () Bool)

(assert (=> b!905170 (=> (not res!610792) (not e!507223))))

(declare-datatypes ((List!18001 0))(
  ( (Nil!17998) (Cons!17997 (h!19143 (_ BitVec 64)) (t!25400 List!18001)) )
))
(declare-fun arrayNoDuplicates!0 (array!53334 (_ BitVec 32) List!18001) Bool)

(assert (=> b!905170 (= res!610792 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17998))))

(declare-fun b!905171 () Bool)

(assert (=> b!905171 (= e!507225 true)))

(declare-fun lt!408452 () ListLongMap!10885)

(assert (=> b!905171 (= (apply!448 lt!408452 k0!1033) lt!408456)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29825)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29825)

(declare-datatypes ((Unit!30708 0))(
  ( (Unit!30709) )
))
(declare-fun lt!408455 () Unit!30708)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!5 (array!53334 array!53336 (_ BitVec 32) (_ BitVec 32) V!29825 V!29825 (_ BitVec 64) V!29825 (_ BitVec 32) Int) Unit!30708)

(assert (=> b!905171 (= lt!408455 (lemmaListMapApplyFromThenApplyFromZero!5 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408456 i!717 defaultEntry!1160))))

(declare-fun mapIsEmpty!29680 () Bool)

(assert (=> mapIsEmpty!29680 mapRes!29680))

(declare-fun b!905172 () Bool)

(assert (=> b!905172 (= e!507223 e!507218)))

(declare-fun res!610791 () Bool)

(assert (=> b!905172 (=> (not res!610791) (not e!507218))))

(declare-fun contains!4504 (ListLongMap!10885 (_ BitVec 64)) Bool)

(assert (=> b!905172 (= res!610791 (contains!4504 lt!408452 k0!1033))))

(declare-fun getCurrentListMap!2725 (array!53334 array!53336 (_ BitVec 32) (_ BitVec 32) V!29825 V!29825 (_ BitVec 32) Int) ListLongMap!10885)

(assert (=> b!905172 (= lt!408452 (getCurrentListMap!2725 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!905173 () Bool)

(declare-fun e!507221 () Bool)

(assert (=> b!905173 (= e!507221 e!507225)))

(declare-fun res!610799 () Bool)

(assert (=> b!905173 (=> res!610799 e!507225)))

(assert (=> b!905173 (= res!610799 (not (contains!4504 lt!408454 k0!1033)))))

(assert (=> b!905173 (= lt!408454 (getCurrentListMap!2725 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!905174 () Bool)

(declare-fun res!610793 () Bool)

(assert (=> b!905174 (=> (not res!610793) (not e!507218))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905174 (= res!610793 (inRange!0 i!717 mask!1756))))

(declare-fun mapNonEmpty!29680 () Bool)

(declare-fun tp!56943 () Bool)

(assert (=> mapNonEmpty!29680 (= mapRes!29680 (and tp!56943 e!507220))))

(declare-fun mapValue!29680 () ValueCell!8841)

(declare-fun mapRest!29680 () (Array (_ BitVec 32) ValueCell!8841))

(declare-fun mapKey!29680 () (_ BitVec 32))

(assert (=> mapNonEmpty!29680 (= (arr!25627 _values!1152) (store mapRest!29680 mapKey!29680 mapValue!29680))))

(declare-fun b!905175 () Bool)

(assert (=> b!905175 (= e!507218 (not e!507221))))

(declare-fun res!610795 () Bool)

(assert (=> b!905175 (=> res!610795 e!507221)))

(assert (=> b!905175 (= res!610795 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26085 _keys!1386))))))

(declare-fun get!13461 (ValueCell!8841 V!29825) V!29825)

(declare-fun dynLambda!1325 (Int (_ BitVec 64)) V!29825)

(assert (=> b!905175 (= lt!408456 (get!13461 (select (arr!25627 _values!1152) i!717) (dynLambda!1325 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53334 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905175 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!408453 () Unit!30708)

(declare-fun lemmaKeyInListMapIsInArray!197 (array!53334 array!53336 (_ BitVec 32) (_ BitVec 32) V!29825 V!29825 (_ BitVec 64) Int) Unit!30708)

(assert (=> b!905175 (= lt!408453 (lemmaKeyInListMapIsInArray!197 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!905176 () Bool)

(declare-fun res!610796 () Bool)

(assert (=> b!905176 (=> (not res!610796) (not e!507223))))

(assert (=> b!905176 (= res!610796 (and (= (size!26086 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26085 _keys!1386) (size!26086 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!610798 () Bool)

(assert (=> start!77642 (=> (not res!610798) (not e!507223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77642 (= res!610798 (validMask!0 mask!1756))))

(assert (=> start!77642 e!507223))

(declare-fun array_inv!20076 (array!53336) Bool)

(assert (=> start!77642 (and (array_inv!20076 _values!1152) e!507219)))

(assert (=> start!77642 tp!56942))

(assert (=> start!77642 true))

(assert (=> start!77642 tp_is_empty!18645))

(declare-fun array_inv!20077 (array!53334) Bool)

(assert (=> start!77642 (array_inv!20077 _keys!1386)))

(assert (= (and start!77642 res!610798) b!905176))

(assert (= (and b!905176 res!610796) b!905169))

(assert (= (and b!905169 res!610790) b!905170))

(assert (= (and b!905170 res!610792) b!905172))

(assert (= (and b!905172 res!610791) b!905174))

(assert (= (and b!905174 res!610793) b!905167))

(assert (= (and b!905167 res!610797) b!905175))

(assert (= (and b!905175 (not res!610795)) b!905173))

(assert (= (and b!905173 (not res!610799)) b!905164))

(assert (= (and b!905164 (not res!610794)) b!905171))

(assert (= (and b!905168 condMapEmpty!29680) mapIsEmpty!29680))

(assert (= (and b!905168 (not condMapEmpty!29680)) mapNonEmpty!29680))

(get-info :version)

(assert (= (and mapNonEmpty!29680 ((_ is ValueCellFull!8841) mapValue!29680)) b!905166))

(assert (= (and b!905168 ((_ is ValueCellFull!8841) mapDefault!29680)) b!905165))

(assert (= start!77642 b!905168))

(declare-fun b_lambda!13101 () Bool)

(assert (=> (not b_lambda!13101) (not b!905175)))

(declare-fun t!25398 () Bool)

(declare-fun tb!5249 () Bool)

(assert (=> (and start!77642 (= defaultEntry!1160 defaultEntry!1160) t!25398) tb!5249))

(declare-fun result!10293 () Bool)

(assert (=> tb!5249 (= result!10293 tp_is_empty!18645)))

(assert (=> b!905175 t!25398))

(declare-fun b_and!26609 () Bool)

(assert (= b_and!26607 (and (=> t!25398 result!10293) b_and!26609)))

(declare-fun m!840575 () Bool)

(assert (=> b!905164 m!840575))

(declare-fun m!840577 () Bool)

(assert (=> b!905175 m!840577))

(declare-fun m!840579 () Bool)

(assert (=> b!905175 m!840579))

(declare-fun m!840581 () Bool)

(assert (=> b!905175 m!840581))

(declare-fun m!840583 () Bool)

(assert (=> b!905175 m!840583))

(assert (=> b!905175 m!840577))

(assert (=> b!905175 m!840581))

(declare-fun m!840585 () Bool)

(assert (=> b!905175 m!840585))

(declare-fun m!840587 () Bool)

(assert (=> start!77642 m!840587))

(declare-fun m!840589 () Bool)

(assert (=> start!77642 m!840589))

(declare-fun m!840591 () Bool)

(assert (=> start!77642 m!840591))

(declare-fun m!840593 () Bool)

(assert (=> b!905174 m!840593))

(declare-fun m!840595 () Bool)

(assert (=> b!905173 m!840595))

(declare-fun m!840597 () Bool)

(assert (=> b!905173 m!840597))

(declare-fun m!840599 () Bool)

(assert (=> mapNonEmpty!29680 m!840599))

(declare-fun m!840601 () Bool)

(assert (=> b!905167 m!840601))

(declare-fun m!840603 () Bool)

(assert (=> b!905171 m!840603))

(declare-fun m!840605 () Bool)

(assert (=> b!905171 m!840605))

(declare-fun m!840607 () Bool)

(assert (=> b!905172 m!840607))

(declare-fun m!840609 () Bool)

(assert (=> b!905172 m!840609))

(declare-fun m!840611 () Bool)

(assert (=> b!905169 m!840611))

(declare-fun m!840613 () Bool)

(assert (=> b!905170 m!840613))

(check-sat (not b!905172) (not b!905169) (not start!77642) b_and!26609 (not b!905175) (not b_next!16227) (not b!905174) (not b!905173) (not b!905164) (not b!905171) (not b!905170) (not mapNonEmpty!29680) tp_is_empty!18645 (not b_lambda!13101))
(check-sat b_and!26609 (not b_next!16227))
