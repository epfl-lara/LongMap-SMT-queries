; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37188 () Bool)

(assert start!37188)

(declare-fun b_free!8329 () Bool)

(declare-fun b_next!8329 () Bool)

(assert (=> start!37188 (= b_free!8329 (not b_next!8329))))

(declare-fun tp!29703 () Bool)

(declare-fun b_and!15545 () Bool)

(assert (=> start!37188 (= tp!29703 b_and!15545)))

(declare-fun mapNonEmpty!15030 () Bool)

(declare-fun mapRes!15030 () Bool)

(declare-fun tp!29702 () Bool)

(declare-fun e!228771 () Bool)

(assert (=> mapNonEmpty!15030 (= mapRes!15030 (and tp!29702 e!228771))))

(declare-datatypes ((V!13075 0))(
  ( (V!13076 (val!4533 Int)) )
))
(declare-datatypes ((ValueCell!4145 0))(
  ( (ValueCellFull!4145 (v!6724 V!13075)) (EmptyCell!4145) )
))
(declare-fun mapValue!15030 () ValueCell!4145)

(declare-datatypes ((array!21871 0))(
  ( (array!21872 (arr!10404 (Array (_ BitVec 32) ValueCell!4145)) (size!10757 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21871)

(declare-fun mapKey!15030 () (_ BitVec 32))

(declare-fun mapRest!15030 () (Array (_ BitVec 32) ValueCell!4145))

(assert (=> mapNonEmpty!15030 (= (arr!10404 _values!506) (store mapRest!15030 mapKey!15030 mapValue!15030))))

(declare-fun b!375575 () Bool)

(declare-fun e!228772 () Bool)

(declare-fun e!228769 () Bool)

(assert (=> b!375575 (= e!228772 (and e!228769 mapRes!15030))))

(declare-fun condMapEmpty!15030 () Bool)

(declare-fun mapDefault!15030 () ValueCell!4145)

(assert (=> b!375575 (= condMapEmpty!15030 (= (arr!10404 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4145)) mapDefault!15030)))))

(declare-fun b!375576 () Bool)

(declare-fun res!212149 () Bool)

(declare-fun e!228775 () Bool)

(assert (=> b!375576 (=> (not res!212149) (not e!228775))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21873 0))(
  ( (array!21874 (arr!10405 (Array (_ BitVec 32) (_ BitVec 64))) (size!10758 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21873)

(assert (=> b!375576 (= res!212149 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10758 _keys!658))))))

(declare-fun res!212142 () Bool)

(assert (=> start!37188 (=> (not res!212142) (not e!228775))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37188 (= res!212142 (validMask!0 mask!970))))

(assert (=> start!37188 e!228775))

(declare-fun array_inv!7672 (array!21871) Bool)

(assert (=> start!37188 (and (array_inv!7672 _values!506) e!228772)))

(assert (=> start!37188 tp!29703))

(assert (=> start!37188 true))

(declare-fun tp_is_empty!8977 () Bool)

(assert (=> start!37188 tp_is_empty!8977))

(declare-fun array_inv!7673 (array!21873) Bool)

(assert (=> start!37188 (array_inv!7673 _keys!658)))

(declare-fun b!375577 () Bool)

(assert (=> b!375577 (= e!228769 tp_is_empty!8977)))

(declare-fun mapIsEmpty!15030 () Bool)

(assert (=> mapIsEmpty!15030 mapRes!15030))

(declare-fun b!375578 () Bool)

(declare-fun res!212143 () Bool)

(assert (=> b!375578 (=> (not res!212143) (not e!228775))))

(assert (=> b!375578 (= res!212143 (or (= (select (arr!10405 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10405 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!375579 () Bool)

(declare-fun res!212151 () Bool)

(assert (=> b!375579 (=> (not res!212151) (not e!228775))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21873 (_ BitVec 32)) Bool)

(assert (=> b!375579 (= res!212151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!375580 () Bool)

(declare-fun res!212145 () Bool)

(declare-fun e!228774 () Bool)

(assert (=> b!375580 (=> (not res!212145) (not e!228774))))

(declare-fun lt!173886 () array!21873)

(declare-datatypes ((List!5843 0))(
  ( (Nil!5840) (Cons!5839 (h!6695 (_ BitVec 64)) (t!10984 List!5843)) )
))
(declare-fun arrayNoDuplicates!0 (array!21873 (_ BitVec 32) List!5843) Bool)

(assert (=> b!375580 (= res!212145 (arrayNoDuplicates!0 lt!173886 #b00000000000000000000000000000000 Nil!5840))))

(declare-fun b!375581 () Bool)

(declare-fun e!228770 () Bool)

(declare-fun e!228773 () Bool)

(assert (=> b!375581 (= e!228770 e!228773)))

(declare-fun res!212144 () Bool)

(assert (=> b!375581 (=> res!212144 e!228773)))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!375581 (= res!212144 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!6014 0))(
  ( (tuple2!6015 (_1!3018 (_ BitVec 64)) (_2!3018 V!13075)) )
))
(declare-datatypes ((List!5844 0))(
  ( (Nil!5841) (Cons!5840 (h!6696 tuple2!6014) (t!10985 List!5844)) )
))
(declare-datatypes ((ListLongMap!4917 0))(
  ( (ListLongMap!4918 (toList!2474 List!5844)) )
))
(declare-fun lt!173880 () ListLongMap!4917)

(declare-fun lt!173887 () ListLongMap!4917)

(assert (=> b!375581 (= lt!173880 lt!173887)))

(declare-fun lt!173888 () ListLongMap!4917)

(declare-fun lt!173881 () tuple2!6014)

(declare-fun +!842 (ListLongMap!4917 tuple2!6014) ListLongMap!4917)

(assert (=> b!375581 (= lt!173887 (+!842 lt!173888 lt!173881))))

(declare-fun lt!173883 () ListLongMap!4917)

(declare-fun lt!173882 () ListLongMap!4917)

(assert (=> b!375581 (= lt!173883 lt!173882)))

(declare-fun lt!173890 () ListLongMap!4917)

(assert (=> b!375581 (= lt!173882 (+!842 lt!173890 lt!173881))))

(declare-fun lt!173892 () ListLongMap!4917)

(assert (=> b!375581 (= lt!173880 (+!842 lt!173892 lt!173881))))

(declare-fun zeroValue!472 () V!13075)

(assert (=> b!375581 (= lt!173881 (tuple2!6015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!375582 () Bool)

(declare-fun res!212150 () Bool)

(assert (=> b!375582 (=> (not res!212150) (not e!228775))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!375582 (= res!212150 (validKeyInArray!0 k0!778))))

(declare-fun b!375583 () Bool)

(assert (=> b!375583 (= e!228774 (not e!228770))))

(declare-fun res!212152 () Bool)

(assert (=> b!375583 (=> res!212152 e!228770)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!375583 (= res!212152 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13075)

(declare-fun getCurrentListMap!1888 (array!21873 array!21871 (_ BitVec 32) (_ BitVec 32) V!13075 V!13075 (_ BitVec 32) Int) ListLongMap!4917)

(assert (=> b!375583 (= lt!173883 (getCurrentListMap!1888 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173891 () array!21871)

(assert (=> b!375583 (= lt!173880 (getCurrentListMap!1888 lt!173886 lt!173891 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375583 (and (= lt!173892 lt!173888) (= lt!173888 lt!173892))))

(declare-fun lt!173885 () tuple2!6014)

(assert (=> b!375583 (= lt!173888 (+!842 lt!173890 lt!173885))))

(declare-fun v!373 () V!13075)

(assert (=> b!375583 (= lt!173885 (tuple2!6015 k0!778 v!373))))

(declare-datatypes ((Unit!11556 0))(
  ( (Unit!11557) )
))
(declare-fun lt!173889 () Unit!11556)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!81 (array!21873 array!21871 (_ BitVec 32) (_ BitVec 32) V!13075 V!13075 (_ BitVec 32) (_ BitVec 64) V!13075 (_ BitVec 32) Int) Unit!11556)

(assert (=> b!375583 (= lt!173889 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!81 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!753 (array!21873 array!21871 (_ BitVec 32) (_ BitVec 32) V!13075 V!13075 (_ BitVec 32) Int) ListLongMap!4917)

(assert (=> b!375583 (= lt!173892 (getCurrentListMapNoExtraKeys!753 lt!173886 lt!173891 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375583 (= lt!173891 (array!21872 (store (arr!10404 _values!506) i!548 (ValueCellFull!4145 v!373)) (size!10757 _values!506)))))

(assert (=> b!375583 (= lt!173890 (getCurrentListMapNoExtraKeys!753 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!375584 () Bool)

(declare-fun res!212146 () Bool)

(assert (=> b!375584 (=> (not res!212146) (not e!228775))))

(assert (=> b!375584 (= res!212146 (and (= (size!10757 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10758 _keys!658) (size!10757 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!375585 () Bool)

(declare-fun res!212153 () Bool)

(assert (=> b!375585 (=> (not res!212153) (not e!228775))))

(declare-fun arrayContainsKey!0 (array!21873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!375585 (= res!212153 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!375586 () Bool)

(assert (=> b!375586 (= e!228775 e!228774)))

(declare-fun res!212147 () Bool)

(assert (=> b!375586 (=> (not res!212147) (not e!228774))))

(assert (=> b!375586 (= res!212147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!173886 mask!970))))

(assert (=> b!375586 (= lt!173886 (array!21874 (store (arr!10405 _keys!658) i!548 k0!778) (size!10758 _keys!658)))))

(declare-fun b!375587 () Bool)

(assert (=> b!375587 (= e!228771 tp_is_empty!8977)))

(declare-fun b!375588 () Bool)

(assert (=> b!375588 (= e!228773 true)))

(assert (=> b!375588 (= lt!173887 (+!842 lt!173882 lt!173885))))

(declare-fun lt!173884 () Unit!11556)

(declare-fun addCommutativeForDiffKeys!254 (ListLongMap!4917 (_ BitVec 64) V!13075 (_ BitVec 64) V!13075) Unit!11556)

(assert (=> b!375588 (= lt!173884 (addCommutativeForDiffKeys!254 lt!173890 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!375589 () Bool)

(declare-fun res!212148 () Bool)

(assert (=> b!375589 (=> (not res!212148) (not e!228775))))

(assert (=> b!375589 (= res!212148 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5840))))

(assert (= (and start!37188 res!212142) b!375584))

(assert (= (and b!375584 res!212146) b!375579))

(assert (= (and b!375579 res!212151) b!375589))

(assert (= (and b!375589 res!212148) b!375576))

(assert (= (and b!375576 res!212149) b!375582))

(assert (= (and b!375582 res!212150) b!375578))

(assert (= (and b!375578 res!212143) b!375585))

(assert (= (and b!375585 res!212153) b!375586))

(assert (= (and b!375586 res!212147) b!375580))

(assert (= (and b!375580 res!212145) b!375583))

(assert (= (and b!375583 (not res!212152)) b!375581))

(assert (= (and b!375581 (not res!212144)) b!375588))

(assert (= (and b!375575 condMapEmpty!15030) mapIsEmpty!15030))

(assert (= (and b!375575 (not condMapEmpty!15030)) mapNonEmpty!15030))

(get-info :version)

(assert (= (and mapNonEmpty!15030 ((_ is ValueCellFull!4145) mapValue!15030)) b!375587))

(assert (= (and b!375575 ((_ is ValueCellFull!4145) mapDefault!15030)) b!375577))

(assert (= start!37188 b!375575))

(declare-fun m!371783 () Bool)

(assert (=> b!375580 m!371783))

(declare-fun m!371785 () Bool)

(assert (=> b!375581 m!371785))

(declare-fun m!371787 () Bool)

(assert (=> b!375581 m!371787))

(declare-fun m!371789 () Bool)

(assert (=> b!375581 m!371789))

(declare-fun m!371791 () Bool)

(assert (=> b!375585 m!371791))

(declare-fun m!371793 () Bool)

(assert (=> mapNonEmpty!15030 m!371793))

(declare-fun m!371795 () Bool)

(assert (=> b!375589 m!371795))

(declare-fun m!371797 () Bool)

(assert (=> b!375588 m!371797))

(declare-fun m!371799 () Bool)

(assert (=> b!375588 m!371799))

(declare-fun m!371801 () Bool)

(assert (=> b!375579 m!371801))

(declare-fun m!371803 () Bool)

(assert (=> b!375578 m!371803))

(declare-fun m!371805 () Bool)

(assert (=> b!375582 m!371805))

(declare-fun m!371807 () Bool)

(assert (=> start!37188 m!371807))

(declare-fun m!371809 () Bool)

(assert (=> start!37188 m!371809))

(declare-fun m!371811 () Bool)

(assert (=> start!37188 m!371811))

(declare-fun m!371813 () Bool)

(assert (=> b!375583 m!371813))

(declare-fun m!371815 () Bool)

(assert (=> b!375583 m!371815))

(declare-fun m!371817 () Bool)

(assert (=> b!375583 m!371817))

(declare-fun m!371819 () Bool)

(assert (=> b!375583 m!371819))

(declare-fun m!371821 () Bool)

(assert (=> b!375583 m!371821))

(declare-fun m!371823 () Bool)

(assert (=> b!375583 m!371823))

(declare-fun m!371825 () Bool)

(assert (=> b!375583 m!371825))

(declare-fun m!371827 () Bool)

(assert (=> b!375586 m!371827))

(declare-fun m!371829 () Bool)

(assert (=> b!375586 m!371829))

(check-sat (not b!375589) (not b!375585) (not b!375582) (not b!375581) (not start!37188) (not b_next!8329) (not b!375588) (not b!375580) (not mapNonEmpty!15030) tp_is_empty!8977 (not b!375579) (not b!375586) b_and!15545 (not b!375583))
(check-sat b_and!15545 (not b_next!8329))
