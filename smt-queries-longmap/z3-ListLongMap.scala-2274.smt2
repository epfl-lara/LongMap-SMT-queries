; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37092 () Bool)

(assert start!37092)

(declare-fun b_free!8233 () Bool)

(declare-fun b_next!8233 () Bool)

(assert (=> start!37092 (= b_free!8233 (not b_next!8233))))

(declare-fun tp!29415 () Bool)

(declare-fun b_and!15489 () Bool)

(assert (=> start!37092 (= tp!29415 b_and!15489)))

(declare-fun b!373628 () Bool)

(declare-fun e!227759 () Bool)

(declare-fun tp_is_empty!8881 () Bool)

(assert (=> b!373628 (= e!227759 tp_is_empty!8881)))

(declare-fun res!210541 () Bool)

(declare-fun e!227762 () Bool)

(assert (=> start!37092 (=> (not res!210541) (not e!227762))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37092 (= res!210541 (validMask!0 mask!970))))

(assert (=> start!37092 e!227762))

(declare-datatypes ((V!12947 0))(
  ( (V!12948 (val!4485 Int)) )
))
(declare-datatypes ((ValueCell!4097 0))(
  ( (ValueCellFull!4097 (v!6683 V!12947)) (EmptyCell!4097) )
))
(declare-datatypes ((array!21684 0))(
  ( (array!21685 (arr!10310 (Array (_ BitVec 32) ValueCell!4097)) (size!10662 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21684)

(declare-fun e!227760 () Bool)

(declare-fun array_inv!7654 (array!21684) Bool)

(assert (=> start!37092 (and (array_inv!7654 _values!506) e!227760)))

(assert (=> start!37092 tp!29415))

(assert (=> start!37092 true))

(assert (=> start!37092 tp_is_empty!8881))

(declare-datatypes ((array!21686 0))(
  ( (array!21687 (arr!10311 (Array (_ BitVec 32) (_ BitVec 64))) (size!10663 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21686)

(declare-fun array_inv!7655 (array!21686) Bool)

(assert (=> start!37092 (array_inv!7655 _keys!658)))

(declare-fun b!373629 () Bool)

(declare-fun res!210535 () Bool)

(assert (=> b!373629 (=> (not res!210535) (not e!227762))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21686 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373629 (= res!210535 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!373630 () Bool)

(declare-fun res!210531 () Bool)

(declare-fun e!227764 () Bool)

(assert (=> b!373630 (=> (not res!210531) (not e!227764))))

(declare-fun lt!171779 () array!21686)

(declare-datatypes ((List!5704 0))(
  ( (Nil!5701) (Cons!5700 (h!6556 (_ BitVec 64)) (t!10846 List!5704)) )
))
(declare-fun arrayNoDuplicates!0 (array!21686 (_ BitVec 32) List!5704) Bool)

(assert (=> b!373630 (= res!210531 (arrayNoDuplicates!0 lt!171779 #b00000000000000000000000000000000 Nil!5701))))

(declare-fun b!373631 () Bool)

(declare-fun res!210540 () Bool)

(assert (=> b!373631 (=> (not res!210540) (not e!227762))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!373631 (= res!210540 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10663 _keys!658))))))

(declare-fun b!373632 () Bool)

(declare-fun res!210539 () Bool)

(assert (=> b!373632 (=> (not res!210539) (not e!227762))))

(assert (=> b!373632 (= res!210539 (or (= (select (arr!10311 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10311 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!373633 () Bool)

(declare-fun res!210533 () Bool)

(assert (=> b!373633 (=> (not res!210533) (not e!227762))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21686 (_ BitVec 32)) Bool)

(assert (=> b!373633 (= res!210533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!373634 () Bool)

(declare-fun res!210538 () Bool)

(assert (=> b!373634 (=> (not res!210538) (not e!227762))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!373634 (= res!210538 (and (= (size!10662 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10663 _keys!658) (size!10662 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!373635 () Bool)

(declare-fun e!227761 () Bool)

(assert (=> b!373635 (= e!227764 (not e!227761))))

(declare-fun res!210532 () Bool)

(assert (=> b!373635 (=> res!210532 e!227761)))

(assert (=> b!373635 (= res!210532 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!5860 0))(
  ( (tuple2!5861 (_1!2941 (_ BitVec 64)) (_2!2941 V!12947)) )
))
(declare-datatypes ((List!5705 0))(
  ( (Nil!5702) (Cons!5701 (h!6557 tuple2!5860) (t!10847 List!5705)) )
))
(declare-datatypes ((ListLongMap!4775 0))(
  ( (ListLongMap!4776 (toList!2403 List!5705)) )
))
(declare-fun lt!171765 () ListLongMap!4775)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12947)

(declare-fun minValue!472 () V!12947)

(declare-fun getCurrentListMap!1864 (array!21686 array!21684 (_ BitVec 32) (_ BitVec 32) V!12947 V!12947 (_ BitVec 32) Int) ListLongMap!4775)

(assert (=> b!373635 (= lt!171765 (getCurrentListMap!1864 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171781 () array!21684)

(declare-fun lt!171778 () ListLongMap!4775)

(assert (=> b!373635 (= lt!171778 (getCurrentListMap!1864 lt!171779 lt!171781 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171773 () ListLongMap!4775)

(declare-fun lt!171777 () ListLongMap!4775)

(assert (=> b!373635 (and (= lt!171773 lt!171777) (= lt!171777 lt!171773))))

(declare-fun lt!171767 () ListLongMap!4775)

(declare-fun lt!171771 () tuple2!5860)

(declare-fun +!799 (ListLongMap!4775 tuple2!5860) ListLongMap!4775)

(assert (=> b!373635 (= lt!171777 (+!799 lt!171767 lt!171771))))

(declare-fun v!373 () V!12947)

(assert (=> b!373635 (= lt!171771 (tuple2!5861 k0!778 v!373))))

(declare-datatypes ((Unit!11487 0))(
  ( (Unit!11488) )
))
(declare-fun lt!171776 () Unit!11487)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!51 (array!21686 array!21684 (_ BitVec 32) (_ BitVec 32) V!12947 V!12947 (_ BitVec 32) (_ BitVec 64) V!12947 (_ BitVec 32) Int) Unit!11487)

(assert (=> b!373635 (= lt!171776 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!51 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!711 (array!21686 array!21684 (_ BitVec 32) (_ BitVec 32) V!12947 V!12947 (_ BitVec 32) Int) ListLongMap!4775)

(assert (=> b!373635 (= lt!171773 (getCurrentListMapNoExtraKeys!711 lt!171779 lt!171781 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373635 (= lt!171781 (array!21685 (store (arr!10310 _values!506) i!548 (ValueCellFull!4097 v!373)) (size!10662 _values!506)))))

(assert (=> b!373635 (= lt!171767 (getCurrentListMapNoExtraKeys!711 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!373636 () Bool)

(declare-fun mapRes!14886 () Bool)

(assert (=> b!373636 (= e!227760 (and e!227759 mapRes!14886))))

(declare-fun condMapEmpty!14886 () Bool)

(declare-fun mapDefault!14886 () ValueCell!4097)

(assert (=> b!373636 (= condMapEmpty!14886 (= (arr!10310 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4097)) mapDefault!14886)))))

(declare-fun b!373637 () Bool)

(declare-fun res!210534 () Bool)

(assert (=> b!373637 (=> (not res!210534) (not e!227762))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373637 (= res!210534 (validKeyInArray!0 k0!778))))

(declare-fun b!373638 () Bool)

(assert (=> b!373638 (= e!227762 e!227764)))

(declare-fun res!210542 () Bool)

(assert (=> b!373638 (=> (not res!210542) (not e!227764))))

(assert (=> b!373638 (= res!210542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171779 mask!970))))

(assert (=> b!373638 (= lt!171779 (array!21687 (store (arr!10311 _keys!658) i!548 k0!778) (size!10663 _keys!658)))))

(declare-fun mapIsEmpty!14886 () Bool)

(assert (=> mapIsEmpty!14886 mapRes!14886))

(declare-fun b!373639 () Bool)

(declare-fun e!227763 () Bool)

(assert (=> b!373639 (= e!227761 e!227763)))

(declare-fun res!210537 () Bool)

(assert (=> b!373639 (=> res!210537 e!227763)))

(assert (=> b!373639 (= res!210537 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!171769 () ListLongMap!4775)

(declare-fun lt!171766 () ListLongMap!4775)

(assert (=> b!373639 (= lt!171769 lt!171766)))

(declare-fun lt!171780 () ListLongMap!4775)

(assert (=> b!373639 (= lt!171766 (+!799 lt!171780 lt!171771))))

(declare-fun lt!171775 () Unit!11487)

(declare-fun addCommutativeForDiffKeys!227 (ListLongMap!4775 (_ BitVec 64) V!12947 (_ BitVec 64) V!12947) Unit!11487)

(assert (=> b!373639 (= lt!171775 (addCommutativeForDiffKeys!227 lt!171767 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!171768 () tuple2!5860)

(assert (=> b!373639 (= lt!171778 (+!799 lt!171769 lt!171768))))

(declare-fun lt!171770 () tuple2!5860)

(assert (=> b!373639 (= lt!171769 (+!799 lt!171777 lt!171770))))

(declare-fun lt!171772 () ListLongMap!4775)

(assert (=> b!373639 (= lt!171765 lt!171772)))

(assert (=> b!373639 (= lt!171772 (+!799 lt!171780 lt!171768))))

(assert (=> b!373639 (= lt!171780 (+!799 lt!171767 lt!171770))))

(assert (=> b!373639 (= lt!171778 (+!799 (+!799 lt!171773 lt!171770) lt!171768))))

(assert (=> b!373639 (= lt!171768 (tuple2!5861 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!373639 (= lt!171770 (tuple2!5861 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!373640 () Bool)

(declare-fun res!210536 () Bool)

(assert (=> b!373640 (=> (not res!210536) (not e!227762))))

(assert (=> b!373640 (= res!210536 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5701))))

(declare-fun b!373641 () Bool)

(assert (=> b!373641 (= e!227763 true)))

(assert (=> b!373641 (= (+!799 lt!171766 lt!171768) (+!799 lt!171772 lt!171771))))

(declare-fun lt!171774 () Unit!11487)

(assert (=> b!373641 (= lt!171774 (addCommutativeForDiffKeys!227 lt!171780 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!373642 () Bool)

(declare-fun e!227766 () Bool)

(assert (=> b!373642 (= e!227766 tp_is_empty!8881)))

(declare-fun mapNonEmpty!14886 () Bool)

(declare-fun tp!29414 () Bool)

(assert (=> mapNonEmpty!14886 (= mapRes!14886 (and tp!29414 e!227766))))

(declare-fun mapKey!14886 () (_ BitVec 32))

(declare-fun mapValue!14886 () ValueCell!4097)

(declare-fun mapRest!14886 () (Array (_ BitVec 32) ValueCell!4097))

(assert (=> mapNonEmpty!14886 (= (arr!10310 _values!506) (store mapRest!14886 mapKey!14886 mapValue!14886))))

(assert (= (and start!37092 res!210541) b!373634))

(assert (= (and b!373634 res!210538) b!373633))

(assert (= (and b!373633 res!210533) b!373640))

(assert (= (and b!373640 res!210536) b!373631))

(assert (= (and b!373631 res!210540) b!373637))

(assert (= (and b!373637 res!210534) b!373632))

(assert (= (and b!373632 res!210539) b!373629))

(assert (= (and b!373629 res!210535) b!373638))

(assert (= (and b!373638 res!210542) b!373630))

(assert (= (and b!373630 res!210531) b!373635))

(assert (= (and b!373635 (not res!210532)) b!373639))

(assert (= (and b!373639 (not res!210537)) b!373641))

(assert (= (and b!373636 condMapEmpty!14886) mapIsEmpty!14886))

(assert (= (and b!373636 (not condMapEmpty!14886)) mapNonEmpty!14886))

(get-info :version)

(assert (= (and mapNonEmpty!14886 ((_ is ValueCellFull!4097) mapValue!14886)) b!373642))

(assert (= (and b!373636 ((_ is ValueCellFull!4097) mapDefault!14886)) b!373628))

(assert (= start!37092 b!373636))

(declare-fun m!369905 () Bool)

(assert (=> b!373635 m!369905))

(declare-fun m!369907 () Bool)

(assert (=> b!373635 m!369907))

(declare-fun m!369909 () Bool)

(assert (=> b!373635 m!369909))

(declare-fun m!369911 () Bool)

(assert (=> b!373635 m!369911))

(declare-fun m!369913 () Bool)

(assert (=> b!373635 m!369913))

(declare-fun m!369915 () Bool)

(assert (=> b!373635 m!369915))

(declare-fun m!369917 () Bool)

(assert (=> b!373635 m!369917))

(declare-fun m!369919 () Bool)

(assert (=> mapNonEmpty!14886 m!369919))

(declare-fun m!369921 () Bool)

(assert (=> b!373630 m!369921))

(declare-fun m!369923 () Bool)

(assert (=> b!373633 m!369923))

(declare-fun m!369925 () Bool)

(assert (=> b!373641 m!369925))

(declare-fun m!369927 () Bool)

(assert (=> b!373641 m!369927))

(declare-fun m!369929 () Bool)

(assert (=> b!373641 m!369929))

(declare-fun m!369931 () Bool)

(assert (=> b!373637 m!369931))

(declare-fun m!369933 () Bool)

(assert (=> b!373629 m!369933))

(declare-fun m!369935 () Bool)

(assert (=> b!373640 m!369935))

(declare-fun m!369937 () Bool)

(assert (=> b!373632 m!369937))

(declare-fun m!369939 () Bool)

(assert (=> start!37092 m!369939))

(declare-fun m!369941 () Bool)

(assert (=> start!37092 m!369941))

(declare-fun m!369943 () Bool)

(assert (=> start!37092 m!369943))

(declare-fun m!369945 () Bool)

(assert (=> b!373639 m!369945))

(declare-fun m!369947 () Bool)

(assert (=> b!373639 m!369947))

(declare-fun m!369949 () Bool)

(assert (=> b!373639 m!369949))

(declare-fun m!369951 () Bool)

(assert (=> b!373639 m!369951))

(declare-fun m!369953 () Bool)

(assert (=> b!373639 m!369953))

(assert (=> b!373639 m!369949))

(declare-fun m!369955 () Bool)

(assert (=> b!373639 m!369955))

(declare-fun m!369957 () Bool)

(assert (=> b!373639 m!369957))

(declare-fun m!369959 () Bool)

(assert (=> b!373639 m!369959))

(declare-fun m!369961 () Bool)

(assert (=> b!373638 m!369961))

(declare-fun m!369963 () Bool)

(assert (=> b!373638 m!369963))

(check-sat (not b!373638) (not b!373637) (not b!373640) tp_is_empty!8881 (not mapNonEmpty!14886) (not b!373641) (not b_next!8233) (not b!373630) (not b!373639) (not b!373635) (not b!373633) b_and!15489 (not b!373629) (not start!37092))
(check-sat b_and!15489 (not b_next!8233))
