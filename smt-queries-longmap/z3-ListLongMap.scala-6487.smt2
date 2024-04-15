; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82744 () Bool)

(assert start!82744)

(declare-fun b_free!18895 () Bool)

(declare-fun b_next!18895 () Bool)

(assert (=> start!82744 (= b_free!18895 (not b_next!18895))))

(declare-fun tp!65805 () Bool)

(declare-fun b_and!30357 () Bool)

(assert (=> start!82744 (= tp!65805 b_and!30357)))

(declare-fun b!965088 () Bool)

(declare-fun res!646057 () Bool)

(declare-fun e!544029 () Bool)

(assert (=> b!965088 (=> (not res!646057) (not e!544029))))

(declare-datatypes ((array!59414 0))(
  ( (array!59415 (arr!28576 (Array (_ BitVec 32) (_ BitVec 64))) (size!29057 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59414)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!965088 (= res!646057 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29057 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29057 _keys!1686))))))

(declare-fun mapNonEmpty!34540 () Bool)

(declare-fun mapRes!34540 () Bool)

(declare-fun tp!65806 () Bool)

(declare-fun e!544030 () Bool)

(assert (=> mapNonEmpty!34540 (= mapRes!34540 (and tp!65806 e!544030))))

(declare-datatypes ((V!33913 0))(
  ( (V!33914 (val!10899 Int)) )
))
(declare-datatypes ((ValueCell!10367 0))(
  ( (ValueCellFull!10367 (v!13456 V!33913)) (EmptyCell!10367) )
))
(declare-fun mapRest!34540 () (Array (_ BitVec 32) ValueCell!10367))

(declare-datatypes ((array!59416 0))(
  ( (array!59417 (arr!28577 (Array (_ BitVec 32) ValueCell!10367)) (size!29058 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59416)

(declare-fun mapKey!34540 () (_ BitVec 32))

(declare-fun mapValue!34540 () ValueCell!10367)

(assert (=> mapNonEmpty!34540 (= (arr!28577 _values!1400) (store mapRest!34540 mapKey!34540 mapValue!34540))))

(declare-fun res!646056 () Bool)

(assert (=> start!82744 (=> (not res!646056) (not e!544029))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82744 (= res!646056 (validMask!0 mask!2110))))

(assert (=> start!82744 e!544029))

(assert (=> start!82744 true))

(declare-fun e!544032 () Bool)

(declare-fun array_inv!22191 (array!59416) Bool)

(assert (=> start!82744 (and (array_inv!22191 _values!1400) e!544032)))

(declare-fun array_inv!22192 (array!59414) Bool)

(assert (=> start!82744 (array_inv!22192 _keys!1686)))

(assert (=> start!82744 tp!65805))

(declare-fun tp_is_empty!21697 () Bool)

(assert (=> start!82744 tp_is_empty!21697))

(declare-fun b!965089 () Bool)

(assert (=> b!965089 (= e!544030 tp_is_empty!21697)))

(declare-fun b!965090 () Bool)

(declare-fun e!544031 () Bool)

(assert (=> b!965090 (= e!544031 tp_is_empty!21697)))

(declare-fun mapIsEmpty!34540 () Bool)

(assert (=> mapIsEmpty!34540 mapRes!34540))

(declare-fun b!965091 () Bool)

(declare-fun res!646054 () Bool)

(assert (=> b!965091 (=> (not res!646054) (not e!544029))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!965091 (= res!646054 (and (= (size!29058 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29057 _keys!1686) (size!29058 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965092 () Bool)

(assert (=> b!965092 (= e!544029 false)))

(declare-fun lt!430991 () Bool)

(declare-fun minValue!1342 () V!33913)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33913)

(declare-datatypes ((tuple2!14080 0))(
  ( (tuple2!14081 (_1!7051 (_ BitVec 64)) (_2!7051 V!33913)) )
))
(declare-datatypes ((List!19888 0))(
  ( (Nil!19885) (Cons!19884 (h!21046 tuple2!14080) (t!28242 List!19888)) )
))
(declare-datatypes ((ListLongMap!12767 0))(
  ( (ListLongMap!12768 (toList!6399 List!19888)) )
))
(declare-fun contains!5446 (ListLongMap!12767 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3561 (array!59414 array!59416 (_ BitVec 32) (_ BitVec 32) V!33913 V!33913 (_ BitVec 32) Int) ListLongMap!12767)

(assert (=> b!965092 (= lt!430991 (contains!5446 (getCurrentListMap!3561 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28576 _keys!1686) i!803)))))

(declare-fun b!965093 () Bool)

(declare-fun res!646053 () Bool)

(assert (=> b!965093 (=> (not res!646053) (not e!544029))))

(declare-datatypes ((List!19889 0))(
  ( (Nil!19886) (Cons!19885 (h!21047 (_ BitVec 64)) (t!28243 List!19889)) )
))
(declare-fun arrayNoDuplicates!0 (array!59414 (_ BitVec 32) List!19889) Bool)

(assert (=> b!965093 (= res!646053 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19886))))

(declare-fun b!965094 () Bool)

(assert (=> b!965094 (= e!544032 (and e!544031 mapRes!34540))))

(declare-fun condMapEmpty!34540 () Bool)

(declare-fun mapDefault!34540 () ValueCell!10367)

(assert (=> b!965094 (= condMapEmpty!34540 (= (arr!28577 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10367)) mapDefault!34540)))))

(declare-fun b!965095 () Bool)

(declare-fun res!646055 () Bool)

(assert (=> b!965095 (=> (not res!646055) (not e!544029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59414 (_ BitVec 32)) Bool)

(assert (=> b!965095 (= res!646055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965096 () Bool)

(declare-fun res!646058 () Bool)

(assert (=> b!965096 (=> (not res!646058) (not e!544029))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965096 (= res!646058 (validKeyInArray!0 (select (arr!28576 _keys!1686) i!803)))))

(assert (= (and start!82744 res!646056) b!965091))

(assert (= (and b!965091 res!646054) b!965095))

(assert (= (and b!965095 res!646055) b!965093))

(assert (= (and b!965093 res!646053) b!965088))

(assert (= (and b!965088 res!646057) b!965096))

(assert (= (and b!965096 res!646058) b!965092))

(assert (= (and b!965094 condMapEmpty!34540) mapIsEmpty!34540))

(assert (= (and b!965094 (not condMapEmpty!34540)) mapNonEmpty!34540))

(get-info :version)

(assert (= (and mapNonEmpty!34540 ((_ is ValueCellFull!10367) mapValue!34540)) b!965089))

(assert (= (and b!965094 ((_ is ValueCellFull!10367) mapDefault!34540)) b!965090))

(assert (= start!82744 b!965094))

(declare-fun m!893671 () Bool)

(assert (=> b!965093 m!893671))

(declare-fun m!893673 () Bool)

(assert (=> mapNonEmpty!34540 m!893673))

(declare-fun m!893675 () Bool)

(assert (=> b!965096 m!893675))

(assert (=> b!965096 m!893675))

(declare-fun m!893677 () Bool)

(assert (=> b!965096 m!893677))

(declare-fun m!893679 () Bool)

(assert (=> start!82744 m!893679))

(declare-fun m!893681 () Bool)

(assert (=> start!82744 m!893681))

(declare-fun m!893683 () Bool)

(assert (=> start!82744 m!893683))

(declare-fun m!893685 () Bool)

(assert (=> b!965095 m!893685))

(declare-fun m!893687 () Bool)

(assert (=> b!965092 m!893687))

(assert (=> b!965092 m!893675))

(assert (=> b!965092 m!893687))

(assert (=> b!965092 m!893675))

(declare-fun m!893689 () Bool)

(assert (=> b!965092 m!893689))

(check-sat (not b!965095) (not mapNonEmpty!34540) tp_is_empty!21697 (not b!965092) (not b_next!18895) (not start!82744) (not b!965096) b_and!30357 (not b!965093))
(check-sat b_and!30357 (not b_next!18895))
