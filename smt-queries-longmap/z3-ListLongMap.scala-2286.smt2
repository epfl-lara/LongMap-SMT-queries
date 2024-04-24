; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37164 () Bool)

(assert start!37164)

(declare-fun b_free!8305 () Bool)

(declare-fun b_next!8305 () Bool)

(assert (=> start!37164 (= b_free!8305 (not b_next!8305))))

(declare-fun tp!29630 () Bool)

(declare-fun b_and!15561 () Bool)

(assert (=> start!37164 (= tp!29630 b_and!15561)))

(declare-fun b!375248 () Bool)

(declare-fun e!228628 () Bool)

(declare-fun e!228627 () Bool)

(assert (=> b!375248 (= e!228628 (not e!228627))))

(declare-fun res!211836 () Bool)

(assert (=> b!375248 (=> res!211836 e!228627)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!375248 (= res!211836 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13043 0))(
  ( (V!13044 (val!4521 Int)) )
))
(declare-datatypes ((ValueCell!4133 0))(
  ( (ValueCellFull!4133 (v!6719 V!13043)) (EmptyCell!4133) )
))
(declare-datatypes ((array!21824 0))(
  ( (array!21825 (arr!10380 (Array (_ BitVec 32) ValueCell!4133)) (size!10732 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21824)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5918 0))(
  ( (tuple2!5919 (_1!2970 (_ BitVec 64)) (_2!2970 V!13043)) )
))
(declare-datatypes ((List!5763 0))(
  ( (Nil!5760) (Cons!5759 (h!6615 tuple2!5918) (t!10905 List!5763)) )
))
(declare-datatypes ((ListLongMap!4833 0))(
  ( (ListLongMap!4834 (toList!2432 List!5763)) )
))
(declare-fun lt!173614 () ListLongMap!4833)

(declare-fun zeroValue!472 () V!13043)

(declare-datatypes ((array!21826 0))(
  ( (array!21827 (arr!10381 (Array (_ BitVec 32) (_ BitVec 64))) (size!10733 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21826)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13043)

(declare-fun getCurrentListMap!1887 (array!21826 array!21824 (_ BitVec 32) (_ BitVec 32) V!13043 V!13043 (_ BitVec 32) Int) ListLongMap!4833)

(assert (=> b!375248 (= lt!173614 (getCurrentListMap!1887 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173603 () array!21826)

(declare-fun lt!173610 () array!21824)

(declare-fun lt!173602 () ListLongMap!4833)

(assert (=> b!375248 (= lt!173602 (getCurrentListMap!1887 lt!173603 lt!173610 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173605 () ListLongMap!4833)

(declare-fun lt!173606 () ListLongMap!4833)

(assert (=> b!375248 (and (= lt!173605 lt!173606) (= lt!173606 lt!173605))))

(declare-fun lt!173617 () ListLongMap!4833)

(declare-fun lt!173604 () tuple2!5918)

(declare-fun +!828 (ListLongMap!4833 tuple2!5918) ListLongMap!4833)

(assert (=> b!375248 (= lt!173606 (+!828 lt!173617 lt!173604))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13043)

(assert (=> b!375248 (= lt!173604 (tuple2!5919 k0!778 v!373))))

(declare-datatypes ((Unit!11545 0))(
  ( (Unit!11546) )
))
(declare-fun lt!173607 () Unit!11545)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!74 (array!21826 array!21824 (_ BitVec 32) (_ BitVec 32) V!13043 V!13043 (_ BitVec 32) (_ BitVec 64) V!13043 (_ BitVec 32) Int) Unit!11545)

(assert (=> b!375248 (= lt!173607 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!74 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!734 (array!21826 array!21824 (_ BitVec 32) (_ BitVec 32) V!13043 V!13043 (_ BitVec 32) Int) ListLongMap!4833)

(assert (=> b!375248 (= lt!173605 (getCurrentListMapNoExtraKeys!734 lt!173603 lt!173610 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375248 (= lt!173610 (array!21825 (store (arr!10380 _values!506) i!548 (ValueCellFull!4133 v!373)) (size!10732 _values!506)))))

(assert (=> b!375248 (= lt!173617 (getCurrentListMapNoExtraKeys!734 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!375249 () Bool)

(declare-fun res!211838 () Bool)

(declare-fun e!228623 () Bool)

(assert (=> b!375249 (=> (not res!211838) (not e!228623))))

(declare-datatypes ((List!5764 0))(
  ( (Nil!5761) (Cons!5760 (h!6616 (_ BitVec 64)) (t!10906 List!5764)) )
))
(declare-fun arrayNoDuplicates!0 (array!21826 (_ BitVec 32) List!5764) Bool)

(assert (=> b!375249 (= res!211838 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5761))))

(declare-fun mapNonEmpty!14994 () Bool)

(declare-fun mapRes!14994 () Bool)

(declare-fun tp!29631 () Bool)

(declare-fun e!228630 () Bool)

(assert (=> mapNonEmpty!14994 (= mapRes!14994 (and tp!29631 e!228630))))

(declare-fun mapRest!14994 () (Array (_ BitVec 32) ValueCell!4133))

(declare-fun mapKey!14994 () (_ BitVec 32))

(declare-fun mapValue!14994 () ValueCell!4133)

(assert (=> mapNonEmpty!14994 (= (arr!10380 _values!506) (store mapRest!14994 mapKey!14994 mapValue!14994))))

(declare-fun b!375250 () Bool)

(assert (=> b!375250 (= e!228623 e!228628)))

(declare-fun res!211833 () Bool)

(assert (=> b!375250 (=> (not res!211833) (not e!228628))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21826 (_ BitVec 32)) Bool)

(assert (=> b!375250 (= res!211833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!173603 mask!970))))

(assert (=> b!375250 (= lt!173603 (array!21827 (store (arr!10381 _keys!658) i!548 k0!778) (size!10733 _keys!658)))))

(declare-fun res!211837 () Bool)

(assert (=> start!37164 (=> (not res!211837) (not e!228623))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37164 (= res!211837 (validMask!0 mask!970))))

(assert (=> start!37164 e!228623))

(declare-fun e!228625 () Bool)

(declare-fun array_inv!7706 (array!21824) Bool)

(assert (=> start!37164 (and (array_inv!7706 _values!506) e!228625)))

(assert (=> start!37164 tp!29630))

(assert (=> start!37164 true))

(declare-fun tp_is_empty!8953 () Bool)

(assert (=> start!37164 tp_is_empty!8953))

(declare-fun array_inv!7707 (array!21826) Bool)

(assert (=> start!37164 (array_inv!7707 _keys!658)))

(declare-fun b!375251 () Bool)

(assert (=> b!375251 (= e!228630 tp_is_empty!8953)))

(declare-fun mapIsEmpty!14994 () Bool)

(assert (=> mapIsEmpty!14994 mapRes!14994))

(declare-fun b!375252 () Bool)

(declare-fun e!228629 () Bool)

(assert (=> b!375252 (= e!228625 (and e!228629 mapRes!14994))))

(declare-fun condMapEmpty!14994 () Bool)

(declare-fun mapDefault!14994 () ValueCell!4133)

(assert (=> b!375252 (= condMapEmpty!14994 (= (arr!10380 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4133)) mapDefault!14994)))))

(declare-fun b!375253 () Bool)

(declare-fun res!211830 () Bool)

(assert (=> b!375253 (=> (not res!211830) (not e!228623))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!375253 (= res!211830 (validKeyInArray!0 k0!778))))

(declare-fun b!375254 () Bool)

(declare-fun res!211835 () Bool)

(assert (=> b!375254 (=> (not res!211835) (not e!228623))))

(assert (=> b!375254 (= res!211835 (or (= (select (arr!10381 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10381 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!375255 () Bool)

(declare-fun e!228626 () Bool)

(assert (=> b!375255 (= e!228627 e!228626)))

(declare-fun res!211829 () Bool)

(assert (=> b!375255 (=> res!211829 e!228626)))

(assert (=> b!375255 (= res!211829 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!173611 () ListLongMap!4833)

(declare-fun lt!173601 () ListLongMap!4833)

(assert (=> b!375255 (= lt!173611 lt!173601)))

(declare-fun lt!173608 () ListLongMap!4833)

(assert (=> b!375255 (= lt!173601 (+!828 lt!173608 lt!173604))))

(declare-fun lt!173613 () Unit!11545)

(declare-fun addCommutativeForDiffKeys!255 (ListLongMap!4833 (_ BitVec 64) V!13043 (_ BitVec 64) V!13043) Unit!11545)

(assert (=> b!375255 (= lt!173613 (addCommutativeForDiffKeys!255 lt!173617 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!173609 () tuple2!5918)

(assert (=> b!375255 (= lt!173602 (+!828 lt!173611 lt!173609))))

(declare-fun lt!173612 () tuple2!5918)

(assert (=> b!375255 (= lt!173611 (+!828 lt!173606 lt!173612))))

(declare-fun lt!173615 () ListLongMap!4833)

(assert (=> b!375255 (= lt!173614 lt!173615)))

(assert (=> b!375255 (= lt!173615 (+!828 lt!173608 lt!173609))))

(assert (=> b!375255 (= lt!173608 (+!828 lt!173617 lt!173612))))

(assert (=> b!375255 (= lt!173602 (+!828 (+!828 lt!173605 lt!173612) lt!173609))))

(assert (=> b!375255 (= lt!173609 (tuple2!5919 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!375255 (= lt!173612 (tuple2!5919 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!375256 () Bool)

(declare-fun res!211827 () Bool)

(assert (=> b!375256 (=> (not res!211827) (not e!228623))))

(assert (=> b!375256 (= res!211827 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10733 _keys!658))))))

(declare-fun b!375257 () Bool)

(declare-fun res!211831 () Bool)

(assert (=> b!375257 (=> (not res!211831) (not e!228623))))

(assert (=> b!375257 (= res!211831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!375258 () Bool)

(declare-fun res!211828 () Bool)

(assert (=> b!375258 (=> (not res!211828) (not e!228623))))

(declare-fun arrayContainsKey!0 (array!21826 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!375258 (= res!211828 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!375259 () Bool)

(assert (=> b!375259 (= e!228629 tp_is_empty!8953)))

(declare-fun b!375260 () Bool)

(declare-fun res!211832 () Bool)

(assert (=> b!375260 (=> (not res!211832) (not e!228623))))

(assert (=> b!375260 (= res!211832 (and (= (size!10732 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10733 _keys!658) (size!10732 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!375261 () Bool)

(declare-fun res!211834 () Bool)

(assert (=> b!375261 (=> (not res!211834) (not e!228628))))

(assert (=> b!375261 (= res!211834 (arrayNoDuplicates!0 lt!173603 #b00000000000000000000000000000000 Nil!5761))))

(declare-fun b!375262 () Bool)

(assert (=> b!375262 (= e!228626 true)))

(assert (=> b!375262 (= (+!828 lt!173601 lt!173609) (+!828 lt!173615 lt!173604))))

(declare-fun lt!173616 () Unit!11545)

(assert (=> b!375262 (= lt!173616 (addCommutativeForDiffKeys!255 lt!173608 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (= (and start!37164 res!211837) b!375260))

(assert (= (and b!375260 res!211832) b!375257))

(assert (= (and b!375257 res!211831) b!375249))

(assert (= (and b!375249 res!211838) b!375256))

(assert (= (and b!375256 res!211827) b!375253))

(assert (= (and b!375253 res!211830) b!375254))

(assert (= (and b!375254 res!211835) b!375258))

(assert (= (and b!375258 res!211828) b!375250))

(assert (= (and b!375250 res!211833) b!375261))

(assert (= (and b!375261 res!211834) b!375248))

(assert (= (and b!375248 (not res!211836)) b!375255))

(assert (= (and b!375255 (not res!211829)) b!375262))

(assert (= (and b!375252 condMapEmpty!14994) mapIsEmpty!14994))

(assert (= (and b!375252 (not condMapEmpty!14994)) mapNonEmpty!14994))

(get-info :version)

(assert (= (and mapNonEmpty!14994 ((_ is ValueCellFull!4133) mapValue!14994)) b!375251))

(assert (= (and b!375252 ((_ is ValueCellFull!4133) mapDefault!14994)) b!375259))

(assert (= start!37164 b!375252))

(declare-fun m!372065 () Bool)

(assert (=> b!375261 m!372065))

(declare-fun m!372067 () Bool)

(assert (=> b!375258 m!372067))

(declare-fun m!372069 () Bool)

(assert (=> b!375249 m!372069))

(declare-fun m!372071 () Bool)

(assert (=> b!375262 m!372071))

(declare-fun m!372073 () Bool)

(assert (=> b!375262 m!372073))

(declare-fun m!372075 () Bool)

(assert (=> b!375262 m!372075))

(declare-fun m!372077 () Bool)

(assert (=> start!37164 m!372077))

(declare-fun m!372079 () Bool)

(assert (=> start!37164 m!372079))

(declare-fun m!372081 () Bool)

(assert (=> start!37164 m!372081))

(declare-fun m!372083 () Bool)

(assert (=> b!375257 m!372083))

(declare-fun m!372085 () Bool)

(assert (=> b!375250 m!372085))

(declare-fun m!372087 () Bool)

(assert (=> b!375250 m!372087))

(declare-fun m!372089 () Bool)

(assert (=> b!375255 m!372089))

(declare-fun m!372091 () Bool)

(assert (=> b!375255 m!372091))

(declare-fun m!372093 () Bool)

(assert (=> b!375255 m!372093))

(assert (=> b!375255 m!372089))

(declare-fun m!372095 () Bool)

(assert (=> b!375255 m!372095))

(declare-fun m!372097 () Bool)

(assert (=> b!375255 m!372097))

(declare-fun m!372099 () Bool)

(assert (=> b!375255 m!372099))

(declare-fun m!372101 () Bool)

(assert (=> b!375255 m!372101))

(declare-fun m!372103 () Bool)

(assert (=> b!375255 m!372103))

(declare-fun m!372105 () Bool)

(assert (=> b!375248 m!372105))

(declare-fun m!372107 () Bool)

(assert (=> b!375248 m!372107))

(declare-fun m!372109 () Bool)

(assert (=> b!375248 m!372109))

(declare-fun m!372111 () Bool)

(assert (=> b!375248 m!372111))

(declare-fun m!372113 () Bool)

(assert (=> b!375248 m!372113))

(declare-fun m!372115 () Bool)

(assert (=> b!375248 m!372115))

(declare-fun m!372117 () Bool)

(assert (=> b!375248 m!372117))

(declare-fun m!372119 () Bool)

(assert (=> b!375253 m!372119))

(declare-fun m!372121 () Bool)

(assert (=> mapNonEmpty!14994 m!372121))

(declare-fun m!372123 () Bool)

(assert (=> b!375254 m!372123))

(check-sat (not b!375248) (not b_next!8305) (not b!375262) (not b!375255) (not b!375261) (not start!37164) (not mapNonEmpty!14994) tp_is_empty!8953 (not b!375258) (not b!375249) (not b!375250) (not b!375257) (not b!375253) b_and!15561)
(check-sat b_and!15561 (not b_next!8305))
