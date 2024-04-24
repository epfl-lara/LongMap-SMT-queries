; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36996 () Bool)

(assert start!36996)

(declare-fun b_free!8137 () Bool)

(declare-fun b_next!8137 () Bool)

(assert (=> start!36996 (= b_free!8137 (not b_next!8137))))

(declare-fun tp!29127 () Bool)

(declare-fun b_and!15393 () Bool)

(assert (=> start!36996 (= tp!29127 b_and!15393)))

(declare-fun b!371662 () Bool)

(declare-fun res!209005 () Bool)

(declare-fun e!226810 () Bool)

(assert (=> b!371662 (=> (not res!209005) (not e!226810))))

(declare-datatypes ((array!21496 0))(
  ( (array!21497 (arr!10216 (Array (_ BitVec 32) (_ BitVec 64))) (size!10568 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21496)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21496 (_ BitVec 32)) Bool)

(assert (=> b!371662 (= res!209005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!371663 () Bool)

(declare-fun e!226812 () Bool)

(declare-fun e!226814 () Bool)

(declare-fun mapRes!14742 () Bool)

(assert (=> b!371663 (= e!226812 (and e!226814 mapRes!14742))))

(declare-fun condMapEmpty!14742 () Bool)

(declare-datatypes ((V!12819 0))(
  ( (V!12820 (val!4437 Int)) )
))
(declare-datatypes ((ValueCell!4049 0))(
  ( (ValueCellFull!4049 (v!6635 V!12819)) (EmptyCell!4049) )
))
(declare-datatypes ((array!21498 0))(
  ( (array!21499 (arr!10217 (Array (_ BitVec 32) ValueCell!4049)) (size!10569 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21498)

(declare-fun mapDefault!14742 () ValueCell!4049)

(assert (=> b!371663 (= condMapEmpty!14742 (= (arr!10217 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4049)) mapDefault!14742)))))

(declare-fun b!371664 () Bool)

(declare-fun res!209004 () Bool)

(assert (=> b!371664 (=> (not res!209004) (not e!226810))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371664 (= res!209004 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!14742 () Bool)

(assert (=> mapIsEmpty!14742 mapRes!14742))

(declare-fun b!371665 () Bool)

(declare-fun res!208997 () Bool)

(declare-fun e!226813 () Bool)

(assert (=> b!371665 (=> (not res!208997) (not e!226813))))

(declare-fun lt!170413 () array!21496)

(declare-datatypes ((List!5627 0))(
  ( (Nil!5624) (Cons!5623 (h!6479 (_ BitVec 64)) (t!10769 List!5627)) )
))
(declare-fun arrayNoDuplicates!0 (array!21496 (_ BitVec 32) List!5627) Bool)

(assert (=> b!371665 (= res!208997 (arrayNoDuplicates!0 lt!170413 #b00000000000000000000000000000000 Nil!5624))))

(declare-fun b!371666 () Bool)

(declare-fun res!209002 () Bool)

(assert (=> b!371666 (=> (not res!209002) (not e!226810))))

(declare-fun arrayContainsKey!0 (array!21496 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371666 (= res!209002 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!209000 () Bool)

(assert (=> start!36996 (=> (not res!209000) (not e!226810))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36996 (= res!209000 (validMask!0 mask!970))))

(assert (=> start!36996 e!226810))

(declare-fun array_inv!7574 (array!21498) Bool)

(assert (=> start!36996 (and (array_inv!7574 _values!506) e!226812)))

(assert (=> start!36996 tp!29127))

(assert (=> start!36996 true))

(declare-fun tp_is_empty!8785 () Bool)

(assert (=> start!36996 tp_is_empty!8785))

(declare-fun array_inv!7575 (array!21496) Bool)

(assert (=> start!36996 (array_inv!7575 _keys!658)))

(declare-fun mapNonEmpty!14742 () Bool)

(declare-fun tp!29126 () Bool)

(declare-fun e!226811 () Bool)

(assert (=> mapNonEmpty!14742 (= mapRes!14742 (and tp!29126 e!226811))))

(declare-fun mapRest!14742 () (Array (_ BitVec 32) ValueCell!4049))

(declare-fun mapKey!14742 () (_ BitVec 32))

(declare-fun mapValue!14742 () ValueCell!4049)

(assert (=> mapNonEmpty!14742 (= (arr!10217 _values!506) (store mapRest!14742 mapKey!14742 mapValue!14742))))

(declare-fun b!371667 () Bool)

(assert (=> b!371667 (= e!226811 tp_is_empty!8785)))

(declare-fun b!371668 () Bool)

(declare-fun res!209003 () Bool)

(assert (=> b!371668 (=> (not res!209003) (not e!226810))))

(assert (=> b!371668 (= res!209003 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5624))))

(declare-fun b!371669 () Bool)

(assert (=> b!371669 (= e!226814 tp_is_empty!8785)))

(declare-fun b!371670 () Bool)

(assert (=> b!371670 (= e!226810 e!226813)))

(declare-fun res!209006 () Bool)

(assert (=> b!371670 (=> (not res!209006) (not e!226813))))

(assert (=> b!371670 (= res!209006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170413 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!371670 (= lt!170413 (array!21497 (store (arr!10216 _keys!658) i!548 k0!778) (size!10568 _keys!658)))))

(declare-fun b!371671 () Bool)

(declare-fun res!209001 () Bool)

(assert (=> b!371671 (=> (not res!209001) (not e!226810))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!371671 (= res!209001 (and (= (size!10569 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10568 _keys!658) (size!10569 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!371672 () Bool)

(declare-fun res!208998 () Bool)

(assert (=> b!371672 (=> (not res!208998) (not e!226810))))

(assert (=> b!371672 (= res!208998 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10568 _keys!658))))))

(declare-fun b!371673 () Bool)

(declare-fun res!208999 () Bool)

(assert (=> b!371673 (=> (not res!208999) (not e!226810))))

(assert (=> b!371673 (= res!208999 (or (= (select (arr!10216 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10216 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!371674 () Bool)

(assert (=> b!371674 (= e!226813 (not true))))

(declare-datatypes ((tuple2!5788 0))(
  ( (tuple2!5789 (_1!2905 (_ BitVec 64)) (_2!2905 V!12819)) )
))
(declare-datatypes ((List!5628 0))(
  ( (Nil!5625) (Cons!5624 (h!6480 tuple2!5788) (t!10770 List!5628)) )
))
(declare-datatypes ((ListLongMap!4703 0))(
  ( (ListLongMap!4704 (toList!2367 List!5628)) )
))
(declare-fun lt!170409 () ListLongMap!4703)

(declare-fun lt!170412 () ListLongMap!4703)

(assert (=> b!371674 (and (= lt!170409 lt!170412) (= lt!170412 lt!170409))))

(declare-fun lt!170411 () ListLongMap!4703)

(declare-fun v!373 () V!12819)

(declare-fun +!763 (ListLongMap!4703 tuple2!5788) ListLongMap!4703)

(assert (=> b!371674 (= lt!170412 (+!763 lt!170411 (tuple2!5789 k0!778 v!373)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((Unit!11417 0))(
  ( (Unit!11418) )
))
(declare-fun lt!170410 () Unit!11417)

(declare-fun zeroValue!472 () V!12819)

(declare-fun minValue!472 () V!12819)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!16 (array!21496 array!21498 (_ BitVec 32) (_ BitVec 32) V!12819 V!12819 (_ BitVec 32) (_ BitVec 64) V!12819 (_ BitVec 32) Int) Unit!11417)

(assert (=> b!371674 (= lt!170410 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!16 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!676 (array!21496 array!21498 (_ BitVec 32) (_ BitVec 32) V!12819 V!12819 (_ BitVec 32) Int) ListLongMap!4703)

(assert (=> b!371674 (= lt!170409 (getCurrentListMapNoExtraKeys!676 lt!170413 (array!21499 (store (arr!10217 _values!506) i!548 (ValueCellFull!4049 v!373)) (size!10569 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371674 (= lt!170411 (getCurrentListMapNoExtraKeys!676 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!36996 res!209000) b!371671))

(assert (= (and b!371671 res!209001) b!371662))

(assert (= (and b!371662 res!209005) b!371668))

(assert (= (and b!371668 res!209003) b!371672))

(assert (= (and b!371672 res!208998) b!371664))

(assert (= (and b!371664 res!209004) b!371673))

(assert (= (and b!371673 res!208999) b!371666))

(assert (= (and b!371666 res!209002) b!371670))

(assert (= (and b!371670 res!209006) b!371665))

(assert (= (and b!371665 res!208997) b!371674))

(assert (= (and b!371663 condMapEmpty!14742) mapIsEmpty!14742))

(assert (= (and b!371663 (not condMapEmpty!14742)) mapNonEmpty!14742))

(get-info :version)

(assert (= (and mapNonEmpty!14742 ((_ is ValueCellFull!4049) mapValue!14742)) b!371667))

(assert (= (and b!371663 ((_ is ValueCellFull!4049) mapDefault!14742)) b!371669))

(assert (= start!36996 b!371663))

(declare-fun m!367877 () Bool)

(assert (=> b!371670 m!367877))

(declare-fun m!367879 () Bool)

(assert (=> b!371670 m!367879))

(declare-fun m!367881 () Bool)

(assert (=> b!371673 m!367881))

(declare-fun m!367883 () Bool)

(assert (=> mapNonEmpty!14742 m!367883))

(declare-fun m!367885 () Bool)

(assert (=> b!371674 m!367885))

(declare-fun m!367887 () Bool)

(assert (=> b!371674 m!367887))

(declare-fun m!367889 () Bool)

(assert (=> b!371674 m!367889))

(declare-fun m!367891 () Bool)

(assert (=> b!371674 m!367891))

(declare-fun m!367893 () Bool)

(assert (=> b!371674 m!367893))

(declare-fun m!367895 () Bool)

(assert (=> b!371668 m!367895))

(declare-fun m!367897 () Bool)

(assert (=> b!371666 m!367897))

(declare-fun m!367899 () Bool)

(assert (=> b!371665 m!367899))

(declare-fun m!367901 () Bool)

(assert (=> b!371664 m!367901))

(declare-fun m!367903 () Bool)

(assert (=> start!36996 m!367903))

(declare-fun m!367905 () Bool)

(assert (=> start!36996 m!367905))

(declare-fun m!367907 () Bool)

(assert (=> start!36996 m!367907))

(declare-fun m!367909 () Bool)

(assert (=> b!371662 m!367909))

(check-sat (not b!371662) (not b_next!8137) (not b!371674) (not b!371665) (not b!371668) b_and!15393 (not b!371670) (not mapNonEmpty!14742) tp_is_empty!8785 (not b!371666) (not b!371664) (not start!36996))
(check-sat b_and!15393 (not b_next!8137))
