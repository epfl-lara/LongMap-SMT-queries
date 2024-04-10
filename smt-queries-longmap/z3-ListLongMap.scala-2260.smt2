; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37024 () Bool)

(assert start!37024)

(declare-fun b_free!8151 () Bool)

(declare-fun b_next!8151 () Bool)

(assert (=> start!37024 (= b_free!8151 (not b_next!8151))))

(declare-fun tp!29169 () Bool)

(declare-fun b_and!15393 () Bool)

(assert (=> start!37024 (= tp!29169 b_and!15393)))

(declare-fun b!371984 () Bool)

(declare-fun e!226970 () Bool)

(assert (=> b!371984 (= e!226970 (not true))))

(declare-datatypes ((array!21539 0))(
  ( (array!21540 (arr!10238 (Array (_ BitVec 32) (_ BitVec 64))) (size!10590 (_ BitVec 32))) )
))
(declare-fun lt!170506 () array!21539)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12837 0))(
  ( (V!12838 (val!4444 Int)) )
))
(declare-datatypes ((tuple2!5896 0))(
  ( (tuple2!5897 (_1!2959 (_ BitVec 64)) (_2!2959 V!12837)) )
))
(declare-datatypes ((List!5738 0))(
  ( (Nil!5735) (Cons!5734 (h!6590 tuple2!5896) (t!10888 List!5738)) )
))
(declare-datatypes ((ListLongMap!4809 0))(
  ( (ListLongMap!4810 (toList!2420 List!5738)) )
))
(declare-fun lt!170507 () ListLongMap!4809)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((ValueCell!4056 0))(
  ( (ValueCellFull!4056 (v!6641 V!12837)) (EmptyCell!4056) )
))
(declare-datatypes ((array!21541 0))(
  ( (array!21542 (arr!10239 (Array (_ BitVec 32) ValueCell!4056)) (size!10591 (_ BitVec 32))) )
))
(declare-fun lt!170511 () array!21541)

(declare-fun zeroValue!472 () V!12837)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!12837)

(declare-fun getCurrentListMap!1863 (array!21539 array!21541 (_ BitVec 32) (_ BitVec 32) V!12837 V!12837 (_ BitVec 32) Int) ListLongMap!4809)

(assert (=> b!371984 (= lt!170507 (getCurrentListMap!1863 lt!170506 lt!170511 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170508 () ListLongMap!4809)

(declare-fun lt!170509 () ListLongMap!4809)

(assert (=> b!371984 (and (= lt!170508 lt!170509) (= lt!170509 lt!170508))))

(declare-fun v!373 () V!12837)

(declare-fun lt!170505 () ListLongMap!4809)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun +!766 (ListLongMap!4809 tuple2!5896) ListLongMap!4809)

(assert (=> b!371984 (= lt!170509 (+!766 lt!170505 (tuple2!5897 k0!778 v!373)))))

(declare-datatypes ((Unit!11438 0))(
  ( (Unit!11439) )
))
(declare-fun lt!170510 () Unit!11438)

(declare-fun _values!506 () array!21541)

(declare-fun _keys!658 () array!21539)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!21 (array!21539 array!21541 (_ BitVec 32) (_ BitVec 32) V!12837 V!12837 (_ BitVec 32) (_ BitVec 64) V!12837 (_ BitVec 32) Int) Unit!11438)

(assert (=> b!371984 (= lt!170510 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!21 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!697 (array!21539 array!21541 (_ BitVec 32) (_ BitVec 32) V!12837 V!12837 (_ BitVec 32) Int) ListLongMap!4809)

(assert (=> b!371984 (= lt!170508 (getCurrentListMapNoExtraKeys!697 lt!170506 lt!170511 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371984 (= lt!170511 (array!21542 (store (arr!10239 _values!506) i!548 (ValueCellFull!4056 v!373)) (size!10591 _values!506)))))

(assert (=> b!371984 (= lt!170505 (getCurrentListMapNoExtraKeys!697 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!371985 () Bool)

(declare-fun e!226973 () Bool)

(declare-fun e!226968 () Bool)

(declare-fun mapRes!14763 () Bool)

(assert (=> b!371985 (= e!226973 (and e!226968 mapRes!14763))))

(declare-fun condMapEmpty!14763 () Bool)

(declare-fun mapDefault!14763 () ValueCell!4056)

(assert (=> b!371985 (= condMapEmpty!14763 (= (arr!10239 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4056)) mapDefault!14763)))))

(declare-fun mapNonEmpty!14763 () Bool)

(declare-fun tp!29168 () Bool)

(declare-fun e!226971 () Bool)

(assert (=> mapNonEmpty!14763 (= mapRes!14763 (and tp!29168 e!226971))))

(declare-fun mapRest!14763 () (Array (_ BitVec 32) ValueCell!4056))

(declare-fun mapValue!14763 () ValueCell!4056)

(declare-fun mapKey!14763 () (_ BitVec 32))

(assert (=> mapNonEmpty!14763 (= (arr!10239 _values!506) (store mapRest!14763 mapKey!14763 mapValue!14763))))

(declare-fun b!371986 () Bool)

(declare-fun res!209214 () Bool)

(declare-fun e!226969 () Bool)

(assert (=> b!371986 (=> (not res!209214) (not e!226969))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21539 (_ BitVec 32)) Bool)

(assert (=> b!371986 (= res!209214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!371987 () Bool)

(declare-fun res!209210 () Bool)

(assert (=> b!371987 (=> (not res!209210) (not e!226969))))

(assert (=> b!371987 (= res!209210 (or (= (select (arr!10238 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10238 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14763 () Bool)

(assert (=> mapIsEmpty!14763 mapRes!14763))

(declare-fun res!209215 () Bool)

(assert (=> start!37024 (=> (not res!209215) (not e!226969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37024 (= res!209215 (validMask!0 mask!970))))

(assert (=> start!37024 e!226969))

(declare-fun array_inv!7556 (array!21541) Bool)

(assert (=> start!37024 (and (array_inv!7556 _values!506) e!226973)))

(assert (=> start!37024 tp!29169))

(assert (=> start!37024 true))

(declare-fun tp_is_empty!8799 () Bool)

(assert (=> start!37024 tp_is_empty!8799))

(declare-fun array_inv!7557 (array!21539) Bool)

(assert (=> start!37024 (array_inv!7557 _keys!658)))

(declare-fun b!371988 () Bool)

(assert (=> b!371988 (= e!226968 tp_is_empty!8799)))

(declare-fun b!371989 () Bool)

(declare-fun res!209213 () Bool)

(assert (=> b!371989 (=> (not res!209213) (not e!226969))))

(assert (=> b!371989 (= res!209213 (and (= (size!10591 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10590 _keys!658) (size!10591 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!371990 () Bool)

(assert (=> b!371990 (= e!226971 tp_is_empty!8799)))

(declare-fun b!371991 () Bool)

(declare-fun res!209216 () Bool)

(assert (=> b!371991 (=> (not res!209216) (not e!226969))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371991 (= res!209216 (validKeyInArray!0 k0!778))))

(declare-fun b!371992 () Bool)

(assert (=> b!371992 (= e!226969 e!226970)))

(declare-fun res!209212 () Bool)

(assert (=> b!371992 (=> (not res!209212) (not e!226970))))

(assert (=> b!371992 (= res!209212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170506 mask!970))))

(assert (=> b!371992 (= lt!170506 (array!21540 (store (arr!10238 _keys!658) i!548 k0!778) (size!10590 _keys!658)))))

(declare-fun b!371993 () Bool)

(declare-fun res!209218 () Bool)

(assert (=> b!371993 (=> (not res!209218) (not e!226970))))

(declare-datatypes ((List!5739 0))(
  ( (Nil!5736) (Cons!5735 (h!6591 (_ BitVec 64)) (t!10889 List!5739)) )
))
(declare-fun arrayNoDuplicates!0 (array!21539 (_ BitVec 32) List!5739) Bool)

(assert (=> b!371993 (= res!209218 (arrayNoDuplicates!0 lt!170506 #b00000000000000000000000000000000 Nil!5736))))

(declare-fun b!371994 () Bool)

(declare-fun res!209217 () Bool)

(assert (=> b!371994 (=> (not res!209217) (not e!226969))))

(assert (=> b!371994 (= res!209217 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5736))))

(declare-fun b!371995 () Bool)

(declare-fun res!209211 () Bool)

(assert (=> b!371995 (=> (not res!209211) (not e!226969))))

(declare-fun arrayContainsKey!0 (array!21539 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371995 (= res!209211 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!371996 () Bool)

(declare-fun res!209219 () Bool)

(assert (=> b!371996 (=> (not res!209219) (not e!226969))))

(assert (=> b!371996 (= res!209219 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10590 _keys!658))))))

(assert (= (and start!37024 res!209215) b!371989))

(assert (= (and b!371989 res!209213) b!371986))

(assert (= (and b!371986 res!209214) b!371994))

(assert (= (and b!371994 res!209217) b!371996))

(assert (= (and b!371996 res!209219) b!371991))

(assert (= (and b!371991 res!209216) b!371987))

(assert (= (and b!371987 res!209210) b!371995))

(assert (= (and b!371995 res!209211) b!371992))

(assert (= (and b!371992 res!209212) b!371993))

(assert (= (and b!371993 res!209218) b!371984))

(assert (= (and b!371985 condMapEmpty!14763) mapIsEmpty!14763))

(assert (= (and b!371985 (not condMapEmpty!14763)) mapNonEmpty!14763))

(get-info :version)

(assert (= (and mapNonEmpty!14763 ((_ is ValueCellFull!4056) mapValue!14763)) b!371990))

(assert (= (and b!371985 ((_ is ValueCellFull!4056) mapDefault!14763)) b!371988))

(assert (= start!37024 b!371985))

(declare-fun m!367887 () Bool)

(assert (=> b!371993 m!367887))

(declare-fun m!367889 () Bool)

(assert (=> b!371994 m!367889))

(declare-fun m!367891 () Bool)

(assert (=> b!371995 m!367891))

(declare-fun m!367893 () Bool)

(assert (=> start!37024 m!367893))

(declare-fun m!367895 () Bool)

(assert (=> start!37024 m!367895))

(declare-fun m!367897 () Bool)

(assert (=> start!37024 m!367897))

(declare-fun m!367899 () Bool)

(assert (=> b!371986 m!367899))

(declare-fun m!367901 () Bool)

(assert (=> b!371992 m!367901))

(declare-fun m!367903 () Bool)

(assert (=> b!371992 m!367903))

(declare-fun m!367905 () Bool)

(assert (=> b!371987 m!367905))

(declare-fun m!367907 () Bool)

(assert (=> b!371984 m!367907))

(declare-fun m!367909 () Bool)

(assert (=> b!371984 m!367909))

(declare-fun m!367911 () Bool)

(assert (=> b!371984 m!367911))

(declare-fun m!367913 () Bool)

(assert (=> b!371984 m!367913))

(declare-fun m!367915 () Bool)

(assert (=> b!371984 m!367915))

(declare-fun m!367917 () Bool)

(assert (=> b!371984 m!367917))

(declare-fun m!367919 () Bool)

(assert (=> mapNonEmpty!14763 m!367919))

(declare-fun m!367921 () Bool)

(assert (=> b!371991 m!367921))

(check-sat (not b!371986) b_and!15393 (not b!371992) (not mapNonEmpty!14763) (not b!371995) (not b!371993) (not start!37024) (not b_next!8151) (not b!371984) tp_is_empty!8799 (not b!371991) (not b!371994))
(check-sat b_and!15393 (not b_next!8151))
