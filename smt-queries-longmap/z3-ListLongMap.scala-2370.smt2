; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37668 () Bool)

(assert start!37668)

(declare-fun b_free!8785 () Bool)

(declare-fun b_next!8785 () Bool)

(assert (=> start!37668 (= b_free!8785 (not b_next!8785))))

(declare-fun tp!31106 () Bool)

(declare-fun b_and!16001 () Bool)

(assert (=> start!37668 (= tp!31106 b_and!16001)))

(declare-fun b!385741 () Bool)

(declare-fun res!220156 () Bool)

(declare-fun e!234062 () Bool)

(assert (=> b!385741 (=> (not res!220156) (not e!234062))))

(declare-datatypes ((array!22797 0))(
  ( (array!22798 (arr!10867 (Array (_ BitVec 32) (_ BitVec 64))) (size!11220 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22797)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22797 (_ BitVec 32)) Bool)

(assert (=> b!385741 (= res!220156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385742 () Bool)

(declare-fun res!220154 () Bool)

(assert (=> b!385742 (=> (not res!220154) (not e!234062))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13715 0))(
  ( (V!13716 (val!4773 Int)) )
))
(declare-datatypes ((ValueCell!4385 0))(
  ( (ValueCellFull!4385 (v!6964 V!13715)) (EmptyCell!4385) )
))
(declare-datatypes ((array!22799 0))(
  ( (array!22800 (arr!10868 (Array (_ BitVec 32) ValueCell!4385)) (size!11221 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22799)

(assert (=> b!385742 (= res!220154 (and (= (size!11221 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11220 _keys!658) (size!11221 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!15750 () Bool)

(declare-fun mapRes!15750 () Bool)

(declare-fun tp!31107 () Bool)

(declare-fun e!234061 () Bool)

(assert (=> mapNonEmpty!15750 (= mapRes!15750 (and tp!31107 e!234061))))

(declare-fun mapKey!15750 () (_ BitVec 32))

(declare-fun mapValue!15750 () ValueCell!4385)

(declare-fun mapRest!15750 () (Array (_ BitVec 32) ValueCell!4385))

(assert (=> mapNonEmpty!15750 (= (arr!10868 _values!506) (store mapRest!15750 mapKey!15750 mapValue!15750))))

(declare-fun b!385743 () Bool)

(declare-fun e!234057 () Bool)

(assert (=> b!385743 (= e!234062 e!234057)))

(declare-fun res!220148 () Bool)

(assert (=> b!385743 (=> (not res!220148) (not e!234057))))

(declare-fun lt!181475 () array!22797)

(assert (=> b!385743 (= res!220148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181475 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!385743 (= lt!181475 (array!22798 (store (arr!10867 _keys!658) i!548 k0!778) (size!11220 _keys!658)))))

(declare-fun b!385745 () Bool)

(declare-fun res!220153 () Bool)

(assert (=> b!385745 (=> (not res!220153) (not e!234062))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!385745 (= res!220153 (validKeyInArray!0 k0!778))))

(declare-fun b!385746 () Bool)

(declare-fun res!220150 () Bool)

(assert (=> b!385746 (=> (not res!220150) (not e!234057))))

(declare-datatypes ((List!6232 0))(
  ( (Nil!6229) (Cons!6228 (h!7084 (_ BitVec 64)) (t!11373 List!6232)) )
))
(declare-fun arrayNoDuplicates!0 (array!22797 (_ BitVec 32) List!6232) Bool)

(assert (=> b!385746 (= res!220150 (arrayNoDuplicates!0 lt!181475 #b00000000000000000000000000000000 Nil!6229))))

(declare-fun b!385747 () Bool)

(declare-fun res!220151 () Bool)

(assert (=> b!385747 (=> (not res!220151) (not e!234062))))

(assert (=> b!385747 (= res!220151 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6229))))

(declare-fun b!385748 () Bool)

(declare-fun tp_is_empty!9457 () Bool)

(assert (=> b!385748 (= e!234061 tp_is_empty!9457)))

(declare-fun b!385749 () Bool)

(declare-fun res!220152 () Bool)

(assert (=> b!385749 (=> (not res!220152) (not e!234062))))

(assert (=> b!385749 (= res!220152 (or (= (select (arr!10867 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10867 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!385750 () Bool)

(declare-fun e!234059 () Bool)

(declare-fun e!234058 () Bool)

(assert (=> b!385750 (= e!234059 (and e!234058 mapRes!15750))))

(declare-fun condMapEmpty!15750 () Bool)

(declare-fun mapDefault!15750 () ValueCell!4385)

(assert (=> b!385750 (= condMapEmpty!15750 (= (arr!10868 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4385)) mapDefault!15750)))))

(declare-fun mapIsEmpty!15750 () Bool)

(assert (=> mapIsEmpty!15750 mapRes!15750))

(declare-fun b!385751 () Bool)

(declare-fun res!220155 () Bool)

(assert (=> b!385751 (=> (not res!220155) (not e!234062))))

(declare-fun arrayContainsKey!0 (array!22797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385751 (= res!220155 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!385744 () Bool)

(assert (=> b!385744 (= e!234058 tp_is_empty!9457)))

(declare-fun res!220157 () Bool)

(assert (=> start!37668 (=> (not res!220157) (not e!234062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37668 (= res!220157 (validMask!0 mask!970))))

(assert (=> start!37668 e!234062))

(declare-fun array_inv!7996 (array!22799) Bool)

(assert (=> start!37668 (and (array_inv!7996 _values!506) e!234059)))

(assert (=> start!37668 tp!31106))

(assert (=> start!37668 true))

(assert (=> start!37668 tp_is_empty!9457))

(declare-fun array_inv!7997 (array!22797) Bool)

(assert (=> start!37668 (array_inv!7997 _keys!658)))

(declare-fun b!385752 () Bool)

(declare-fun res!220149 () Bool)

(assert (=> b!385752 (=> (not res!220149) (not e!234062))))

(assert (=> b!385752 (= res!220149 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11220 _keys!658))))))

(declare-fun b!385753 () Bool)

(assert (=> b!385753 (= e!234057 false)))

(declare-datatypes ((tuple2!6400 0))(
  ( (tuple2!6401 (_1!3211 (_ BitVec 64)) (_2!3211 V!13715)) )
))
(declare-datatypes ((List!6233 0))(
  ( (Nil!6230) (Cons!6229 (h!7085 tuple2!6400) (t!11374 List!6233)) )
))
(declare-datatypes ((ListLongMap!5303 0))(
  ( (ListLongMap!5304 (toList!2667 List!6233)) )
))
(declare-fun lt!181476 () ListLongMap!5303)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13715)

(declare-fun v!373 () V!13715)

(declare-fun minValue!472 () V!13715)

(declare-fun getCurrentListMapNoExtraKeys!907 (array!22797 array!22799 (_ BitVec 32) (_ BitVec 32) V!13715 V!13715 (_ BitVec 32) Int) ListLongMap!5303)

(assert (=> b!385753 (= lt!181476 (getCurrentListMapNoExtraKeys!907 lt!181475 (array!22800 (store (arr!10868 _values!506) i!548 (ValueCellFull!4385 v!373)) (size!11221 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181474 () ListLongMap!5303)

(assert (=> b!385753 (= lt!181474 (getCurrentListMapNoExtraKeys!907 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!37668 res!220157) b!385742))

(assert (= (and b!385742 res!220154) b!385741))

(assert (= (and b!385741 res!220156) b!385747))

(assert (= (and b!385747 res!220151) b!385752))

(assert (= (and b!385752 res!220149) b!385745))

(assert (= (and b!385745 res!220153) b!385749))

(assert (= (and b!385749 res!220152) b!385751))

(assert (= (and b!385751 res!220155) b!385743))

(assert (= (and b!385743 res!220148) b!385746))

(assert (= (and b!385746 res!220150) b!385753))

(assert (= (and b!385750 condMapEmpty!15750) mapIsEmpty!15750))

(assert (= (and b!385750 (not condMapEmpty!15750)) mapNonEmpty!15750))

(get-info :version)

(assert (= (and mapNonEmpty!15750 ((_ is ValueCellFull!4385) mapValue!15750)) b!385748))

(assert (= (and b!385750 ((_ is ValueCellFull!4385) mapDefault!15750)) b!385744))

(assert (= start!37668 b!385750))

(declare-fun m!381731 () Bool)

(assert (=> b!385751 m!381731))

(declare-fun m!381733 () Bool)

(assert (=> b!385743 m!381733))

(declare-fun m!381735 () Bool)

(assert (=> b!385743 m!381735))

(declare-fun m!381737 () Bool)

(assert (=> b!385745 m!381737))

(declare-fun m!381739 () Bool)

(assert (=> start!37668 m!381739))

(declare-fun m!381741 () Bool)

(assert (=> start!37668 m!381741))

(declare-fun m!381743 () Bool)

(assert (=> start!37668 m!381743))

(declare-fun m!381745 () Bool)

(assert (=> b!385753 m!381745))

(declare-fun m!381747 () Bool)

(assert (=> b!385753 m!381747))

(declare-fun m!381749 () Bool)

(assert (=> b!385753 m!381749))

(declare-fun m!381751 () Bool)

(assert (=> mapNonEmpty!15750 m!381751))

(declare-fun m!381753 () Bool)

(assert (=> b!385749 m!381753))

(declare-fun m!381755 () Bool)

(assert (=> b!385747 m!381755))

(declare-fun m!381757 () Bool)

(assert (=> b!385741 m!381757))

(declare-fun m!381759 () Bool)

(assert (=> b!385746 m!381759))

(check-sat (not b!385747) tp_is_empty!9457 (not b!385751) (not b!385741) (not b!385746) (not b!385753) (not b!385743) (not mapNonEmpty!15750) b_and!16001 (not b!385745) (not start!37668) (not b_next!8785))
(check-sat b_and!16001 (not b_next!8785))
