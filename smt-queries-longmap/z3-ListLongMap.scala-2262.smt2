; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37020 () Bool)

(assert start!37020)

(declare-fun b_free!8161 () Bool)

(declare-fun b_next!8161 () Bool)

(assert (=> start!37020 (= b_free!8161 (not b_next!8161))))

(declare-fun tp!29198 () Bool)

(declare-fun b_and!15377 () Bool)

(assert (=> start!37020 (= tp!29198 b_and!15377)))

(declare-fun b!371908 () Bool)

(declare-fun e!226888 () Bool)

(declare-fun tp_is_empty!8809 () Bool)

(assert (=> b!371908 (= e!226888 tp_is_empty!8809)))

(declare-fun b!371909 () Bool)

(declare-fun res!209239 () Bool)

(declare-fun e!226889 () Bool)

(assert (=> b!371909 (=> (not res!209239) (not e!226889))))

(declare-datatypes ((array!21543 0))(
  ( (array!21544 (arr!10240 (Array (_ BitVec 32) (_ BitVec 64))) (size!10593 (_ BitVec 32))) )
))
(declare-fun lt!170377 () array!21543)

(declare-datatypes ((List!5712 0))(
  ( (Nil!5709) (Cons!5708 (h!6564 (_ BitVec 64)) (t!10853 List!5712)) )
))
(declare-fun arrayNoDuplicates!0 (array!21543 (_ BitVec 32) List!5712) Bool)

(assert (=> b!371909 (= res!209239 (arrayNoDuplicates!0 lt!170377 #b00000000000000000000000000000000 Nil!5709))))

(declare-fun b!371910 () Bool)

(declare-fun res!209238 () Bool)

(declare-fun e!226885 () Bool)

(assert (=> b!371910 (=> (not res!209238) (not e!226885))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371910 (= res!209238 (validKeyInArray!0 k0!778))))

(declare-fun b!371911 () Bool)

(declare-fun res!209233 () Bool)

(assert (=> b!371911 (=> (not res!209233) (not e!226885))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12851 0))(
  ( (V!12852 (val!4449 Int)) )
))
(declare-datatypes ((ValueCell!4061 0))(
  ( (ValueCellFull!4061 (v!6640 V!12851)) (EmptyCell!4061) )
))
(declare-datatypes ((array!21545 0))(
  ( (array!21546 (arr!10241 (Array (_ BitVec 32) ValueCell!4061)) (size!10594 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21545)

(declare-fun _keys!658 () array!21543)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!371911 (= res!209233 (and (= (size!10594 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10593 _keys!658) (size!10594 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!371912 () Bool)

(assert (=> b!371912 (= e!226885 e!226889)))

(declare-fun res!209236 () Bool)

(assert (=> b!371912 (=> (not res!209236) (not e!226889))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21543 (_ BitVec 32)) Bool)

(assert (=> b!371912 (= res!209236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170377 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!371912 (= lt!170377 (array!21544 (store (arr!10240 _keys!658) i!548 k0!778) (size!10593 _keys!658)))))

(declare-fun b!371913 () Bool)

(declare-fun res!209240 () Bool)

(assert (=> b!371913 (=> (not res!209240) (not e!226885))))

(declare-fun arrayContainsKey!0 (array!21543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371913 (= res!209240 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14778 () Bool)

(declare-fun mapRes!14778 () Bool)

(assert (=> mapIsEmpty!14778 mapRes!14778))

(declare-fun b!371914 () Bool)

(declare-fun e!226886 () Bool)

(assert (=> b!371914 (= e!226886 tp_is_empty!8809)))

(declare-fun b!371915 () Bool)

(declare-fun res!209235 () Bool)

(assert (=> b!371915 (=> (not res!209235) (not e!226885))))

(assert (=> b!371915 (= res!209235 (or (= (select (arr!10240 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10240 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!371916 () Bool)

(declare-fun res!209234 () Bool)

(assert (=> b!371916 (=> (not res!209234) (not e!226885))))

(assert (=> b!371916 (= res!209234 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5709))))

(declare-fun b!371917 () Bool)

(declare-fun res!209232 () Bool)

(assert (=> b!371917 (=> (not res!209232) (not e!226885))))

(assert (=> b!371917 (= res!209232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!371918 () Bool)

(assert (=> b!371918 (= e!226889 (not true))))

(declare-fun lt!170376 () array!21545)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12851)

(declare-datatypes ((tuple2!5876 0))(
  ( (tuple2!5877 (_1!2949 (_ BitVec 64)) (_2!2949 V!12851)) )
))
(declare-datatypes ((List!5713 0))(
  ( (Nil!5710) (Cons!5709 (h!6565 tuple2!5876) (t!10854 List!5713)) )
))
(declare-datatypes ((ListLongMap!4779 0))(
  ( (ListLongMap!4780 (toList!2405 List!5713)) )
))
(declare-fun lt!170378 () ListLongMap!4779)

(declare-fun minValue!472 () V!12851)

(declare-fun getCurrentListMap!1831 (array!21543 array!21545 (_ BitVec 32) (_ BitVec 32) V!12851 V!12851 (_ BitVec 32) Int) ListLongMap!4779)

(assert (=> b!371918 (= lt!170378 (getCurrentListMap!1831 lt!170377 lt!170376 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170379 () ListLongMap!4779)

(declare-fun lt!170382 () ListLongMap!4779)

(assert (=> b!371918 (and (= lt!170379 lt!170382) (= lt!170382 lt!170379))))

(declare-fun v!373 () V!12851)

(declare-fun lt!170381 () ListLongMap!4779)

(declare-fun +!773 (ListLongMap!4779 tuple2!5876) ListLongMap!4779)

(assert (=> b!371918 (= lt!170382 (+!773 lt!170381 (tuple2!5877 k0!778 v!373)))))

(declare-datatypes ((Unit!11422 0))(
  ( (Unit!11423) )
))
(declare-fun lt!170380 () Unit!11422)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!24 (array!21543 array!21545 (_ BitVec 32) (_ BitVec 32) V!12851 V!12851 (_ BitVec 32) (_ BitVec 64) V!12851 (_ BitVec 32) Int) Unit!11422)

(assert (=> b!371918 (= lt!170380 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!24 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!696 (array!21543 array!21545 (_ BitVec 32) (_ BitVec 32) V!12851 V!12851 (_ BitVec 32) Int) ListLongMap!4779)

(assert (=> b!371918 (= lt!170379 (getCurrentListMapNoExtraKeys!696 lt!170377 lt!170376 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371918 (= lt!170376 (array!21546 (store (arr!10241 _values!506) i!548 (ValueCellFull!4061 v!373)) (size!10594 _values!506)))))

(assert (=> b!371918 (= lt!170381 (getCurrentListMapNoExtraKeys!696 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!209231 () Bool)

(assert (=> start!37020 (=> (not res!209231) (not e!226885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37020 (= res!209231 (validMask!0 mask!970))))

(assert (=> start!37020 e!226885))

(declare-fun e!226884 () Bool)

(declare-fun array_inv!7562 (array!21545) Bool)

(assert (=> start!37020 (and (array_inv!7562 _values!506) e!226884)))

(assert (=> start!37020 tp!29198))

(assert (=> start!37020 true))

(assert (=> start!37020 tp_is_empty!8809))

(declare-fun array_inv!7563 (array!21543) Bool)

(assert (=> start!37020 (array_inv!7563 _keys!658)))

(declare-fun b!371919 () Bool)

(assert (=> b!371919 (= e!226884 (and e!226888 mapRes!14778))))

(declare-fun condMapEmpty!14778 () Bool)

(declare-fun mapDefault!14778 () ValueCell!4061)

(assert (=> b!371919 (= condMapEmpty!14778 (= (arr!10241 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4061)) mapDefault!14778)))))

(declare-fun b!371920 () Bool)

(declare-fun res!209237 () Bool)

(assert (=> b!371920 (=> (not res!209237) (not e!226885))))

(assert (=> b!371920 (= res!209237 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10593 _keys!658))))))

(declare-fun mapNonEmpty!14778 () Bool)

(declare-fun tp!29199 () Bool)

(assert (=> mapNonEmpty!14778 (= mapRes!14778 (and tp!29199 e!226886))))

(declare-fun mapRest!14778 () (Array (_ BitVec 32) ValueCell!4061))

(declare-fun mapKey!14778 () (_ BitVec 32))

(declare-fun mapValue!14778 () ValueCell!4061)

(assert (=> mapNonEmpty!14778 (= (arr!10241 _values!506) (store mapRest!14778 mapKey!14778 mapValue!14778))))

(assert (= (and start!37020 res!209231) b!371911))

(assert (= (and b!371911 res!209233) b!371917))

(assert (= (and b!371917 res!209232) b!371916))

(assert (= (and b!371916 res!209234) b!371920))

(assert (= (and b!371920 res!209237) b!371910))

(assert (= (and b!371910 res!209238) b!371915))

(assert (= (and b!371915 res!209235) b!371913))

(assert (= (and b!371913 res!209240) b!371912))

(assert (= (and b!371912 res!209236) b!371909))

(assert (= (and b!371909 res!209239) b!371918))

(assert (= (and b!371919 condMapEmpty!14778) mapIsEmpty!14778))

(assert (= (and b!371919 (not condMapEmpty!14778)) mapNonEmpty!14778))

(get-info :version)

(assert (= (and mapNonEmpty!14778 ((_ is ValueCellFull!4061) mapValue!14778)) b!371914))

(assert (= (and b!371919 ((_ is ValueCellFull!4061) mapDefault!14778)) b!371908))

(assert (= start!37020 b!371919))

(declare-fun m!367343 () Bool)

(assert (=> b!371909 m!367343))

(declare-fun m!367345 () Bool)

(assert (=> b!371915 m!367345))

(declare-fun m!367347 () Bool)

(assert (=> b!371917 m!367347))

(declare-fun m!367349 () Bool)

(assert (=> b!371910 m!367349))

(declare-fun m!367351 () Bool)

(assert (=> b!371913 m!367351))

(declare-fun m!367353 () Bool)

(assert (=> mapNonEmpty!14778 m!367353))

(declare-fun m!367355 () Bool)

(assert (=> b!371916 m!367355))

(declare-fun m!367357 () Bool)

(assert (=> b!371912 m!367357))

(declare-fun m!367359 () Bool)

(assert (=> b!371912 m!367359))

(declare-fun m!367361 () Bool)

(assert (=> start!37020 m!367361))

(declare-fun m!367363 () Bool)

(assert (=> start!37020 m!367363))

(declare-fun m!367365 () Bool)

(assert (=> start!37020 m!367365))

(declare-fun m!367367 () Bool)

(assert (=> b!371918 m!367367))

(declare-fun m!367369 () Bool)

(assert (=> b!371918 m!367369))

(declare-fun m!367371 () Bool)

(assert (=> b!371918 m!367371))

(declare-fun m!367373 () Bool)

(assert (=> b!371918 m!367373))

(declare-fun m!367375 () Bool)

(assert (=> b!371918 m!367375))

(declare-fun m!367377 () Bool)

(assert (=> b!371918 m!367377))

(check-sat (not b_next!8161) b_and!15377 (not start!37020) tp_is_empty!8809 (not b!371909) (not mapNonEmpty!14778) (not b!371913) (not b!371910) (not b!371918) (not b!371916) (not b!371917) (not b!371912))
(check-sat b_and!15377 (not b_next!8161))
