; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77562 () Bool)

(assert start!77562)

(declare-fun b_free!16165 () Bool)

(declare-fun b_next!16165 () Bool)

(assert (=> start!77562 (= b_free!16165 (not b_next!16165))))

(declare-fun tp!56758 () Bool)

(declare-fun b_and!26505 () Bool)

(assert (=> start!77562 (= tp!56758 b_and!26505)))

(declare-fun b!903772 () Bool)

(declare-fun res!609823 () Bool)

(declare-fun e!506400 () Bool)

(assert (=> b!903772 (=> (not res!609823) (not e!506400))))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53197 0))(
  ( (array!53198 (arr!25558 (Array (_ BitVec 32) (_ BitVec 64))) (size!26019 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53197)

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!903772 (= res!609823 (and (= (select (arr!25558 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!903773 () Bool)

(declare-fun res!609824 () Bool)

(assert (=> b!903773 (=> (not res!609824) (not e!506400))))

(declare-datatypes ((V!29743 0))(
  ( (V!29744 (val!9342 Int)) )
))
(declare-datatypes ((ValueCell!8810 0))(
  ( (ValueCellFull!8810 (v!11846 V!29743)) (EmptyCell!8810) )
))
(declare-datatypes ((array!53199 0))(
  ( (array!53200 (arr!25559 (Array (_ BitVec 32) ValueCell!8810)) (size!26020 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53199)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!903773 (= res!609824 (and (= (size!26020 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26019 _keys!1386) (size!26020 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903774 () Bool)

(declare-fun e!506398 () Bool)

(declare-fun tp_is_empty!18583 () Bool)

(assert (=> b!903774 (= e!506398 tp_is_empty!18583)))

(declare-fun b!903775 () Bool)

(declare-fun res!609822 () Bool)

(assert (=> b!903775 (=> (not res!609822) (not e!506400))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53197 (_ BitVec 32)) Bool)

(assert (=> b!903775 (= res!609822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903776 () Bool)

(declare-fun e!506399 () Bool)

(declare-fun e!506402 () Bool)

(assert (=> b!903776 (= e!506399 e!506402)))

(declare-fun res!609820 () Bool)

(assert (=> b!903776 (=> res!609820 e!506402)))

(declare-datatypes ((tuple2!12160 0))(
  ( (tuple2!12161 (_1!6091 (_ BitVec 64)) (_2!6091 V!29743)) )
))
(declare-datatypes ((List!17964 0))(
  ( (Nil!17961) (Cons!17960 (h!19106 tuple2!12160) (t!25338 List!17964)) )
))
(declare-datatypes ((ListLongMap!10847 0))(
  ( (ListLongMap!10848 (toList!5439 List!17964)) )
))
(declare-fun lt!407892 () ListLongMap!10847)

(declare-fun contains!4449 (ListLongMap!10847 (_ BitVec 64)) Bool)

(assert (=> b!903776 (= res!609820 (not (contains!4449 lt!407892 k0!1033)))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29743)

(declare-fun minValue!1094 () V!29743)

(declare-fun getCurrentListMap!2653 (array!53197 array!53199 (_ BitVec 32) (_ BitVec 32) V!29743 V!29743 (_ BitVec 32) Int) ListLongMap!10847)

(assert (=> b!903776 (= lt!407892 (getCurrentListMap!2653 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!903777 () Bool)

(declare-fun res!609821 () Bool)

(assert (=> b!903777 (=> (not res!609821) (not e!506400))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!903777 (= res!609821 (inRange!0 i!717 mask!1756))))

(declare-fun res!609826 () Bool)

(assert (=> start!77562 (=> (not res!609826) (not e!506400))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77562 (= res!609826 (validMask!0 mask!1756))))

(assert (=> start!77562 e!506400))

(declare-fun e!506396 () Bool)

(declare-fun array_inv!20086 (array!53199) Bool)

(assert (=> start!77562 (and (array_inv!20086 _values!1152) e!506396)))

(assert (=> start!77562 tp!56758))

(assert (=> start!77562 true))

(assert (=> start!77562 tp_is_empty!18583))

(declare-fun array_inv!20087 (array!53197) Bool)

(assert (=> start!77562 (array_inv!20087 _keys!1386)))

(declare-fun b!903778 () Bool)

(declare-fun res!609825 () Bool)

(assert (=> b!903778 (=> (not res!609825) (not e!506400))))

(declare-datatypes ((List!17965 0))(
  ( (Nil!17962) (Cons!17961 (h!19107 (_ BitVec 64)) (t!25339 List!17965)) )
))
(declare-fun arrayNoDuplicates!0 (array!53197 (_ BitVec 32) List!17965) Bool)

(assert (=> b!903778 (= res!609825 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17962))))

(declare-fun mapNonEmpty!29587 () Bool)

(declare-fun mapRes!29587 () Bool)

(declare-fun tp!56757 () Bool)

(declare-fun e!506401 () Bool)

(assert (=> mapNonEmpty!29587 (= mapRes!29587 (and tp!56757 e!506401))))

(declare-fun mapRest!29587 () (Array (_ BitVec 32) ValueCell!8810))

(declare-fun mapValue!29587 () ValueCell!8810)

(declare-fun mapKey!29587 () (_ BitVec 32))

(assert (=> mapNonEmpty!29587 (= (arr!25559 _values!1152) (store mapRest!29587 mapKey!29587 mapValue!29587))))

(declare-fun b!903779 () Bool)

(assert (=> b!903779 (= e!506401 tp_is_empty!18583)))

(declare-fun b!903780 () Bool)

(declare-fun res!609827 () Bool)

(assert (=> b!903780 (=> (not res!609827) (not e!506400))))

(assert (=> b!903780 (= res!609827 (contains!4449 (getCurrentListMap!2653 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!903781 () Bool)

(assert (=> b!903781 (= e!506396 (and e!506398 mapRes!29587))))

(declare-fun condMapEmpty!29587 () Bool)

(declare-fun mapDefault!29587 () ValueCell!8810)

(assert (=> b!903781 (= condMapEmpty!29587 (= (arr!25559 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8810)) mapDefault!29587)))))

(declare-fun b!903782 () Bool)

(assert (=> b!903782 (= e!506400 (not e!506399))))

(declare-fun res!609828 () Bool)

(assert (=> b!903782 (=> res!609828 e!506399)))

(assert (=> b!903782 (= res!609828 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26019 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!903782 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30596 0))(
  ( (Unit!30597) )
))
(declare-fun lt!407891 () Unit!30596)

(declare-fun lemmaKeyInListMapIsInArray!180 (array!53197 array!53199 (_ BitVec 32) (_ BitVec 32) V!29743 V!29743 (_ BitVec 64) Int) Unit!30596)

(assert (=> b!903782 (= lt!407891 (lemmaKeyInListMapIsInArray!180 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun mapIsEmpty!29587 () Bool)

(assert (=> mapIsEmpty!29587 mapRes!29587))

(declare-fun b!903783 () Bool)

(assert (=> b!903783 (= e!506402 true)))

(declare-fun lt!407893 () V!29743)

(declare-fun apply!424 (ListLongMap!10847 (_ BitVec 64)) V!29743)

(assert (=> b!903783 (= lt!407893 (apply!424 lt!407892 k0!1033))))

(assert (= (and start!77562 res!609826) b!903773))

(assert (= (and b!903773 res!609824) b!903775))

(assert (= (and b!903775 res!609822) b!903778))

(assert (= (and b!903778 res!609825) b!903780))

(assert (= (and b!903780 res!609827) b!903777))

(assert (= (and b!903777 res!609821) b!903772))

(assert (= (and b!903772 res!609823) b!903782))

(assert (= (and b!903782 (not res!609828)) b!903776))

(assert (= (and b!903776 (not res!609820)) b!903783))

(assert (= (and b!903781 condMapEmpty!29587) mapIsEmpty!29587))

(assert (= (and b!903781 (not condMapEmpty!29587)) mapNonEmpty!29587))

(get-info :version)

(assert (= (and mapNonEmpty!29587 ((_ is ValueCellFull!8810) mapValue!29587)) b!903779))

(assert (= (and b!903781 ((_ is ValueCellFull!8810) mapDefault!29587)) b!903774))

(assert (= start!77562 b!903781))

(declare-fun m!838817 () Bool)

(assert (=> b!903783 m!838817))

(declare-fun m!838819 () Bool)

(assert (=> b!903777 m!838819))

(declare-fun m!838821 () Bool)

(assert (=> start!77562 m!838821))

(declare-fun m!838823 () Bool)

(assert (=> start!77562 m!838823))

(declare-fun m!838825 () Bool)

(assert (=> start!77562 m!838825))

(declare-fun m!838827 () Bool)

(assert (=> b!903775 m!838827))

(declare-fun m!838829 () Bool)

(assert (=> mapNonEmpty!29587 m!838829))

(declare-fun m!838831 () Bool)

(assert (=> b!903772 m!838831))

(declare-fun m!838833 () Bool)

(assert (=> b!903776 m!838833))

(declare-fun m!838835 () Bool)

(assert (=> b!903776 m!838835))

(declare-fun m!838837 () Bool)

(assert (=> b!903780 m!838837))

(assert (=> b!903780 m!838837))

(declare-fun m!838839 () Bool)

(assert (=> b!903780 m!838839))

(declare-fun m!838841 () Bool)

(assert (=> b!903778 m!838841))

(declare-fun m!838843 () Bool)

(assert (=> b!903782 m!838843))

(declare-fun m!838845 () Bool)

(assert (=> b!903782 m!838845))

(check-sat tp_is_empty!18583 (not b!903778) (not b!903775) (not start!77562) (not b_next!16165) (not b!903783) (not b!903777) b_and!26505 (not b!903780) (not b!903776) (not b!903782) (not mapNonEmpty!29587))
(check-sat b_and!26505 (not b_next!16165))
