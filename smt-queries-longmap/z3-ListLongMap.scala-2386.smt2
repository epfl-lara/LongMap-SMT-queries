; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37764 () Bool)

(assert start!37764)

(declare-fun b_free!8881 () Bool)

(declare-fun b_next!8881 () Bool)

(assert (=> start!37764 (= b_free!8881 (not b_next!8881))))

(declare-fun tp!31395 () Bool)

(declare-fun b_and!16137 () Bool)

(assert (=> start!37764 (= tp!31395 b_and!16137)))

(declare-fun b!387835 () Bool)

(declare-fun res!221717 () Bool)

(declare-fun e!235065 () Bool)

(assert (=> b!387835 (=> (not res!221717) (not e!235065))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13843 0))(
  ( (V!13844 (val!4821 Int)) )
))
(declare-datatypes ((ValueCell!4433 0))(
  ( (ValueCellFull!4433 (v!7019 V!13843)) (EmptyCell!4433) )
))
(declare-datatypes ((array!22986 0))(
  ( (array!22987 (arr!10961 (Array (_ BitVec 32) ValueCell!4433)) (size!11313 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22986)

(declare-datatypes ((array!22988 0))(
  ( (array!22989 (arr!10962 (Array (_ BitVec 32) (_ BitVec 64))) (size!11314 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22988)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!387835 (= res!221717 (and (= (size!11313 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11314 _keys!658) (size!11313 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!387836 () Bool)

(declare-fun res!221719 () Bool)

(assert (=> b!387836 (=> (not res!221719) (not e!235065))))

(declare-datatypes ((List!6194 0))(
  ( (Nil!6191) (Cons!6190 (h!7046 (_ BitVec 64)) (t!11336 List!6194)) )
))
(declare-fun arrayNoDuplicates!0 (array!22988 (_ BitVec 32) List!6194) Bool)

(assert (=> b!387836 (= res!221719 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6191))))

(declare-fun b!387837 () Bool)

(declare-fun e!235063 () Bool)

(declare-fun e!235066 () Bool)

(declare-fun mapRes!15894 () Bool)

(assert (=> b!387837 (= e!235063 (and e!235066 mapRes!15894))))

(declare-fun condMapEmpty!15894 () Bool)

(declare-fun mapDefault!15894 () ValueCell!4433)

(assert (=> b!387837 (= condMapEmpty!15894 (= (arr!10961 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4433)) mapDefault!15894)))))

(declare-fun b!387838 () Bool)

(declare-fun res!221720 () Bool)

(assert (=> b!387838 (=> (not res!221720) (not e!235065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22988 (_ BitVec 32)) Bool)

(assert (=> b!387838 (= res!221720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!387839 () Bool)

(declare-fun res!221715 () Bool)

(assert (=> b!387839 (=> (not res!221715) (not e!235065))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387839 (= res!221715 (validKeyInArray!0 k0!778))))

(declare-fun b!387840 () Bool)

(declare-fun res!221721 () Bool)

(declare-fun e!235067 () Bool)

(assert (=> b!387840 (=> (not res!221721) (not e!235067))))

(declare-fun lt!182160 () array!22988)

(assert (=> b!387840 (= res!221721 (arrayNoDuplicates!0 lt!182160 #b00000000000000000000000000000000 Nil!6191))))

(declare-fun b!387841 () Bool)

(declare-fun res!221716 () Bool)

(assert (=> b!387841 (=> (not res!221716) (not e!235065))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!387841 (= res!221716 (or (= (select (arr!10962 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10962 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!221714 () Bool)

(assert (=> start!37764 (=> (not res!221714) (not e!235065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37764 (= res!221714 (validMask!0 mask!970))))

(assert (=> start!37764 e!235065))

(declare-fun array_inv!8100 (array!22986) Bool)

(assert (=> start!37764 (and (array_inv!8100 _values!506) e!235063)))

(assert (=> start!37764 tp!31395))

(assert (=> start!37764 true))

(declare-fun tp_is_empty!9553 () Bool)

(assert (=> start!37764 tp_is_empty!9553))

(declare-fun array_inv!8101 (array!22988) Bool)

(assert (=> start!37764 (array_inv!8101 _keys!658)))

(declare-fun b!387842 () Bool)

(assert (=> b!387842 (= e!235065 e!235067)))

(declare-fun res!221718 () Bool)

(assert (=> b!387842 (=> (not res!221718) (not e!235067))))

(assert (=> b!387842 (= res!221718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182160 mask!970))))

(assert (=> b!387842 (= lt!182160 (array!22989 (store (arr!10962 _keys!658) i!548 k0!778) (size!11314 _keys!658)))))

(declare-fun b!387843 () Bool)

(assert (=> b!387843 (= e!235067 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6344 0))(
  ( (tuple2!6345 (_1!3183 (_ BitVec 64)) (_2!3183 V!13843)) )
))
(declare-datatypes ((List!6195 0))(
  ( (Nil!6192) (Cons!6191 (h!7047 tuple2!6344) (t!11337 List!6195)) )
))
(declare-datatypes ((ListLongMap!5259 0))(
  ( (ListLongMap!5260 (toList!2645 List!6195)) )
))
(declare-fun lt!182159 () ListLongMap!5259)

(declare-fun v!373 () V!13843)

(declare-fun zeroValue!472 () V!13843)

(declare-fun minValue!472 () V!13843)

(declare-fun getCurrentListMapNoExtraKeys!920 (array!22988 array!22986 (_ BitVec 32) (_ BitVec 32) V!13843 V!13843 (_ BitVec 32) Int) ListLongMap!5259)

(assert (=> b!387843 (= lt!182159 (getCurrentListMapNoExtraKeys!920 lt!182160 (array!22987 (store (arr!10961 _values!506) i!548 (ValueCellFull!4433 v!373)) (size!11313 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182161 () ListLongMap!5259)

(assert (=> b!387843 (= lt!182161 (getCurrentListMapNoExtraKeys!920 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!387844 () Bool)

(assert (=> b!387844 (= e!235066 tp_is_empty!9553)))

(declare-fun b!387845 () Bool)

(declare-fun e!235068 () Bool)

(assert (=> b!387845 (= e!235068 tp_is_empty!9553)))

(declare-fun mapNonEmpty!15894 () Bool)

(declare-fun tp!31394 () Bool)

(assert (=> mapNonEmpty!15894 (= mapRes!15894 (and tp!31394 e!235068))))

(declare-fun mapValue!15894 () ValueCell!4433)

(declare-fun mapKey!15894 () (_ BitVec 32))

(declare-fun mapRest!15894 () (Array (_ BitVec 32) ValueCell!4433))

(assert (=> mapNonEmpty!15894 (= (arr!10961 _values!506) (store mapRest!15894 mapKey!15894 mapValue!15894))))

(declare-fun b!387846 () Bool)

(declare-fun res!221722 () Bool)

(assert (=> b!387846 (=> (not res!221722) (not e!235065))))

(declare-fun arrayContainsKey!0 (array!22988 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387846 (= res!221722 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!387847 () Bool)

(declare-fun res!221723 () Bool)

(assert (=> b!387847 (=> (not res!221723) (not e!235065))))

(assert (=> b!387847 (= res!221723 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11314 _keys!658))))))

(declare-fun mapIsEmpty!15894 () Bool)

(assert (=> mapIsEmpty!15894 mapRes!15894))

(assert (= (and start!37764 res!221714) b!387835))

(assert (= (and b!387835 res!221717) b!387838))

(assert (= (and b!387838 res!221720) b!387836))

(assert (= (and b!387836 res!221719) b!387847))

(assert (= (and b!387847 res!221723) b!387839))

(assert (= (and b!387839 res!221715) b!387841))

(assert (= (and b!387841 res!221716) b!387846))

(assert (= (and b!387846 res!221722) b!387842))

(assert (= (and b!387842 res!221718) b!387840))

(assert (= (and b!387840 res!221721) b!387843))

(assert (= (and b!387837 condMapEmpty!15894) mapIsEmpty!15894))

(assert (= (and b!387837 (not condMapEmpty!15894)) mapNonEmpty!15894))

(get-info :version)

(assert (= (and mapNonEmpty!15894 ((_ is ValueCellFull!4433) mapValue!15894)) b!387845))

(assert (= (and b!387837 ((_ is ValueCellFull!4433) mapDefault!15894)) b!387844))

(assert (= start!37764 b!387837))

(declare-fun m!384125 () Bool)

(assert (=> mapNonEmpty!15894 m!384125))

(declare-fun m!384127 () Bool)

(assert (=> b!387839 m!384127))

(declare-fun m!384129 () Bool)

(assert (=> start!37764 m!384129))

(declare-fun m!384131 () Bool)

(assert (=> start!37764 m!384131))

(declare-fun m!384133 () Bool)

(assert (=> start!37764 m!384133))

(declare-fun m!384135 () Bool)

(assert (=> b!387840 m!384135))

(declare-fun m!384137 () Bool)

(assert (=> b!387836 m!384137))

(declare-fun m!384139 () Bool)

(assert (=> b!387846 m!384139))

(declare-fun m!384141 () Bool)

(assert (=> b!387838 m!384141))

(declare-fun m!384143 () Bool)

(assert (=> b!387843 m!384143))

(declare-fun m!384145 () Bool)

(assert (=> b!387843 m!384145))

(declare-fun m!384147 () Bool)

(assert (=> b!387843 m!384147))

(declare-fun m!384149 () Bool)

(assert (=> b!387841 m!384149))

(declare-fun m!384151 () Bool)

(assert (=> b!387842 m!384151))

(declare-fun m!384153 () Bool)

(assert (=> b!387842 m!384153))

(check-sat (not start!37764) (not b!387842) (not b!387838) (not b!387836) (not b!387840) b_and!16137 (not b!387839) (not b_next!8881) (not b!387843) (not b!387846) tp_is_empty!9553 (not mapNonEmpty!15894))
(check-sat b_and!16137 (not b_next!8881))
