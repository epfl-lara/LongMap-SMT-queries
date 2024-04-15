; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37104 () Bool)

(assert start!37104)

(declare-fun b_free!8245 () Bool)

(declare-fun b_next!8245 () Bool)

(assert (=> start!37104 (= b_free!8245 (not b_next!8245))))

(declare-fun tp!29450 () Bool)

(declare-fun b_and!15461 () Bool)

(assert (=> start!37104 (= tp!29450 b_and!15461)))

(declare-fun b!373676 () Bool)

(declare-fun res!210624 () Bool)

(declare-fun e!227765 () Bool)

(assert (=> b!373676 (=> (not res!210624) (not e!227765))))

(declare-datatypes ((array!21703 0))(
  ( (array!21704 (arr!10320 (Array (_ BitVec 32) (_ BitVec 64))) (size!10673 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21703)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21703 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373676 (= res!210624 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!373677 () Bool)

(declare-fun e!227766 () Bool)

(assert (=> b!373677 (= e!227766 true)))

(declare-datatypes ((V!12963 0))(
  ( (V!12964 (val!4491 Int)) )
))
(declare-datatypes ((tuple2!5936 0))(
  ( (tuple2!5937 (_1!2979 (_ BitVec 64)) (_2!2979 V!12963)) )
))
(declare-fun lt!171833 () tuple2!5936)

(declare-fun lt!171825 () tuple2!5936)

(declare-datatypes ((List!5771 0))(
  ( (Nil!5768) (Cons!5767 (h!6623 tuple2!5936) (t!10912 List!5771)) )
))
(declare-datatypes ((ListLongMap!4839 0))(
  ( (ListLongMap!4840 (toList!2435 List!5771)) )
))
(declare-fun lt!171830 () ListLongMap!4839)

(declare-fun lt!171821 () ListLongMap!4839)

(declare-fun +!803 (ListLongMap!4839 tuple2!5936) ListLongMap!4839)

(assert (=> b!373677 (= (+!803 lt!171821 lt!171833) (+!803 lt!171830 lt!171825))))

(declare-fun v!373 () V!12963)

(declare-fun lt!171827 () ListLongMap!4839)

(declare-datatypes ((Unit!11478 0))(
  ( (Unit!11479) )
))
(declare-fun lt!171831 () Unit!11478)

(declare-fun minValue!472 () V!12963)

(declare-fun addCommutativeForDiffKeys!221 (ListLongMap!4839 (_ BitVec 64) V!12963 (_ BitVec 64) V!12963) Unit!11478)

(assert (=> b!373677 (= lt!171831 (addCommutativeForDiffKeys!221 lt!171827 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!373678 () Bool)

(declare-fun res!210621 () Bool)

(assert (=> b!373678 (=> (not res!210621) (not e!227765))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21703 (_ BitVec 32)) Bool)

(assert (=> b!373678 (= res!210621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!14904 () Bool)

(declare-fun mapRes!14904 () Bool)

(declare-fun tp!29451 () Bool)

(declare-fun e!227764 () Bool)

(assert (=> mapNonEmpty!14904 (= mapRes!14904 (and tp!29451 e!227764))))

(declare-fun mapKey!14904 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4103 0))(
  ( (ValueCellFull!4103 (v!6682 V!12963)) (EmptyCell!4103) )
))
(declare-datatypes ((array!21705 0))(
  ( (array!21706 (arr!10321 (Array (_ BitVec 32) ValueCell!4103)) (size!10674 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21705)

(declare-fun mapValue!14904 () ValueCell!4103)

(declare-fun mapRest!14904 () (Array (_ BitVec 32) ValueCell!4103))

(assert (=> mapNonEmpty!14904 (= (arr!10321 _values!506) (store mapRest!14904 mapKey!14904 mapValue!14904))))

(declare-fun b!373679 () Bool)

(declare-fun res!210629 () Bool)

(declare-fun e!227762 () Bool)

(assert (=> b!373679 (=> (not res!210629) (not e!227762))))

(declare-fun lt!171829 () array!21703)

(declare-datatypes ((List!5772 0))(
  ( (Nil!5769) (Cons!5768 (h!6624 (_ BitVec 64)) (t!10913 List!5772)) )
))
(declare-fun arrayNoDuplicates!0 (array!21703 (_ BitVec 32) List!5772) Bool)

(assert (=> b!373679 (= res!210629 (arrayNoDuplicates!0 lt!171829 #b00000000000000000000000000000000 Nil!5769))))

(declare-fun b!373680 () Bool)

(declare-fun res!210622 () Bool)

(assert (=> b!373680 (=> (not res!210622) (not e!227765))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373680 (= res!210622 (validKeyInArray!0 k0!778))))

(declare-fun b!373681 () Bool)

(declare-fun res!210625 () Bool)

(assert (=> b!373681 (=> (not res!210625) (not e!227765))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!373681 (= res!210625 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10673 _keys!658))))))

(declare-fun b!373682 () Bool)

(declare-fun res!210632 () Bool)

(assert (=> b!373682 (=> (not res!210632) (not e!227765))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!373682 (= res!210632 (and (= (size!10674 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10673 _keys!658) (size!10674 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!373683 () Bool)

(declare-fun e!227763 () Bool)

(assert (=> b!373683 (= e!227762 (not e!227763))))

(declare-fun res!210628 () Bool)

(assert (=> b!373683 (=> res!210628 e!227763)))

(assert (=> b!373683 (= res!210628 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12963)

(declare-fun lt!171832 () ListLongMap!4839)

(declare-fun getCurrentListMap!1857 (array!21703 array!21705 (_ BitVec 32) (_ BitVec 32) V!12963 V!12963 (_ BitVec 32) Int) ListLongMap!4839)

(assert (=> b!373683 (= lt!171832 (getCurrentListMap!1857 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171822 () array!21705)

(declare-fun lt!171834 () ListLongMap!4839)

(assert (=> b!373683 (= lt!171834 (getCurrentListMap!1857 lt!171829 lt!171822 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171820 () ListLongMap!4839)

(declare-fun lt!171824 () ListLongMap!4839)

(assert (=> b!373683 (and (= lt!171820 lt!171824) (= lt!171824 lt!171820))))

(declare-fun lt!171826 () ListLongMap!4839)

(assert (=> b!373683 (= lt!171824 (+!803 lt!171826 lt!171825))))

(assert (=> b!373683 (= lt!171825 (tuple2!5937 k0!778 v!373))))

(declare-fun lt!171823 () Unit!11478)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!50 (array!21703 array!21705 (_ BitVec 32) (_ BitVec 32) V!12963 V!12963 (_ BitVec 32) (_ BitVec 64) V!12963 (_ BitVec 32) Int) Unit!11478)

(assert (=> b!373683 (= lt!171823 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!50 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!722 (array!21703 array!21705 (_ BitVec 32) (_ BitVec 32) V!12963 V!12963 (_ BitVec 32) Int) ListLongMap!4839)

(assert (=> b!373683 (= lt!171820 (getCurrentListMapNoExtraKeys!722 lt!171829 lt!171822 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373683 (= lt!171822 (array!21706 (store (arr!10321 _values!506) i!548 (ValueCellFull!4103 v!373)) (size!10674 _values!506)))))

(assert (=> b!373683 (= lt!171826 (getCurrentListMapNoExtraKeys!722 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!373684 () Bool)

(declare-fun e!227768 () Bool)

(declare-fun tp_is_empty!8893 () Bool)

(assert (=> b!373684 (= e!227768 tp_is_empty!8893)))

(declare-fun res!210630 () Bool)

(assert (=> start!37104 (=> (not res!210630) (not e!227765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37104 (= res!210630 (validMask!0 mask!970))))

(assert (=> start!37104 e!227765))

(declare-fun e!227761 () Bool)

(declare-fun array_inv!7616 (array!21705) Bool)

(assert (=> start!37104 (and (array_inv!7616 _values!506) e!227761)))

(assert (=> start!37104 tp!29450))

(assert (=> start!37104 true))

(assert (=> start!37104 tp_is_empty!8893))

(declare-fun array_inv!7617 (array!21703) Bool)

(assert (=> start!37104 (array_inv!7617 _keys!658)))

(declare-fun b!373685 () Bool)

(declare-fun res!210626 () Bool)

(assert (=> b!373685 (=> (not res!210626) (not e!227765))))

(assert (=> b!373685 (= res!210626 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5769))))

(declare-fun b!373686 () Bool)

(assert (=> b!373686 (= e!227765 e!227762)))

(declare-fun res!210627 () Bool)

(assert (=> b!373686 (=> (not res!210627) (not e!227762))))

(assert (=> b!373686 (= res!210627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171829 mask!970))))

(assert (=> b!373686 (= lt!171829 (array!21704 (store (arr!10320 _keys!658) i!548 k0!778) (size!10673 _keys!658)))))

(declare-fun b!373687 () Bool)

(declare-fun res!210623 () Bool)

(assert (=> b!373687 (=> (not res!210623) (not e!227765))))

(assert (=> b!373687 (= res!210623 (or (= (select (arr!10320 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10320 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14904 () Bool)

(assert (=> mapIsEmpty!14904 mapRes!14904))

(declare-fun b!373688 () Bool)

(assert (=> b!373688 (= e!227761 (and e!227768 mapRes!14904))))

(declare-fun condMapEmpty!14904 () Bool)

(declare-fun mapDefault!14904 () ValueCell!4103)

(assert (=> b!373688 (= condMapEmpty!14904 (= (arr!10321 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4103)) mapDefault!14904)))))

(declare-fun b!373689 () Bool)

(assert (=> b!373689 (= e!227764 tp_is_empty!8893)))

(declare-fun b!373690 () Bool)

(assert (=> b!373690 (= e!227763 e!227766)))

(declare-fun res!210631 () Bool)

(assert (=> b!373690 (=> res!210631 e!227766)))

(assert (=> b!373690 (= res!210631 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!171818 () ListLongMap!4839)

(assert (=> b!373690 (= lt!171818 lt!171821)))

(assert (=> b!373690 (= lt!171821 (+!803 lt!171827 lt!171825))))

(declare-fun lt!171819 () Unit!11478)

(assert (=> b!373690 (= lt!171819 (addCommutativeForDiffKeys!221 lt!171826 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (=> b!373690 (= lt!171834 (+!803 lt!171818 lt!171833))))

(declare-fun lt!171828 () tuple2!5936)

(assert (=> b!373690 (= lt!171818 (+!803 lt!171824 lt!171828))))

(assert (=> b!373690 (= lt!171832 lt!171830)))

(assert (=> b!373690 (= lt!171830 (+!803 lt!171827 lt!171833))))

(assert (=> b!373690 (= lt!171827 (+!803 lt!171826 lt!171828))))

(assert (=> b!373690 (= lt!171834 (+!803 (+!803 lt!171820 lt!171828) lt!171833))))

(assert (=> b!373690 (= lt!171833 (tuple2!5937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!373690 (= lt!171828 (tuple2!5937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (= (and start!37104 res!210630) b!373682))

(assert (= (and b!373682 res!210632) b!373678))

(assert (= (and b!373678 res!210621) b!373685))

(assert (= (and b!373685 res!210626) b!373681))

(assert (= (and b!373681 res!210625) b!373680))

(assert (= (and b!373680 res!210622) b!373687))

(assert (= (and b!373687 res!210623) b!373676))

(assert (= (and b!373676 res!210624) b!373686))

(assert (= (and b!373686 res!210627) b!373679))

(assert (= (and b!373679 res!210629) b!373683))

(assert (= (and b!373683 (not res!210628)) b!373690))

(assert (= (and b!373690 (not res!210631)) b!373677))

(assert (= (and b!373688 condMapEmpty!14904) mapIsEmpty!14904))

(assert (= (and b!373688 (not condMapEmpty!14904)) mapNonEmpty!14904))

(get-info :version)

(assert (= (and mapNonEmpty!14904 ((_ is ValueCellFull!4103) mapValue!14904)) b!373689))

(assert (= (and b!373688 ((_ is ValueCellFull!4103) mapDefault!14904)) b!373684))

(assert (= start!37104 b!373688))

(declare-fun m!369311 () Bool)

(assert (=> start!37104 m!369311))

(declare-fun m!369313 () Bool)

(assert (=> start!37104 m!369313))

(declare-fun m!369315 () Bool)

(assert (=> start!37104 m!369315))

(declare-fun m!369317 () Bool)

(assert (=> b!373686 m!369317))

(declare-fun m!369319 () Bool)

(assert (=> b!373686 m!369319))

(declare-fun m!369321 () Bool)

(assert (=> b!373677 m!369321))

(declare-fun m!369323 () Bool)

(assert (=> b!373677 m!369323))

(declare-fun m!369325 () Bool)

(assert (=> b!373677 m!369325))

(declare-fun m!369327 () Bool)

(assert (=> b!373690 m!369327))

(declare-fun m!369329 () Bool)

(assert (=> b!373690 m!369329))

(declare-fun m!369331 () Bool)

(assert (=> b!373690 m!369331))

(declare-fun m!369333 () Bool)

(assert (=> b!373690 m!369333))

(declare-fun m!369335 () Bool)

(assert (=> b!373690 m!369335))

(declare-fun m!369337 () Bool)

(assert (=> b!373690 m!369337))

(declare-fun m!369339 () Bool)

(assert (=> b!373690 m!369339))

(assert (=> b!373690 m!369329))

(declare-fun m!369341 () Bool)

(assert (=> b!373690 m!369341))

(declare-fun m!369343 () Bool)

(assert (=> b!373679 m!369343))

(declare-fun m!369345 () Bool)

(assert (=> mapNonEmpty!14904 m!369345))

(declare-fun m!369347 () Bool)

(assert (=> b!373685 m!369347))

(declare-fun m!369349 () Bool)

(assert (=> b!373687 m!369349))

(declare-fun m!369351 () Bool)

(assert (=> b!373678 m!369351))

(declare-fun m!369353 () Bool)

(assert (=> b!373676 m!369353))

(declare-fun m!369355 () Bool)

(assert (=> b!373683 m!369355))

(declare-fun m!369357 () Bool)

(assert (=> b!373683 m!369357))

(declare-fun m!369359 () Bool)

(assert (=> b!373683 m!369359))

(declare-fun m!369361 () Bool)

(assert (=> b!373683 m!369361))

(declare-fun m!369363 () Bool)

(assert (=> b!373683 m!369363))

(declare-fun m!369365 () Bool)

(assert (=> b!373683 m!369365))

(declare-fun m!369367 () Bool)

(assert (=> b!373683 m!369367))

(declare-fun m!369369 () Bool)

(assert (=> b!373680 m!369369))

(check-sat (not b!373686) (not b!373679) (not b!373678) (not b!373685) (not b!373677) b_and!15461 (not b_next!8245) (not b!373683) tp_is_empty!8893 (not b!373680) (not b!373690) (not b!373676) (not start!37104) (not mapNonEmpty!14904))
(check-sat b_and!15461 (not b_next!8245))
