; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40906 () Bool)

(assert start!40906)

(declare-fun b_free!10855 () Bool)

(declare-fun b_next!10855 () Bool)

(assert (=> start!40906 (= b_free!10855 (not b_next!10855))))

(declare-fun tp!38391 () Bool)

(declare-fun b_and!19007 () Bool)

(assert (=> start!40906 (= tp!38391 b_and!19007)))

(declare-fun b!454801 () Bool)

(declare-fun res!271107 () Bool)

(declare-fun e!266011 () Bool)

(assert (=> b!454801 (=> (not res!271107) (not e!266011))))

(declare-datatypes ((array!28182 0))(
  ( (array!28183 (arr!13534 (Array (_ BitVec 32) (_ BitVec 64))) (size!13886 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28182)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!454801 (= res!271107 (or (= (select (arr!13534 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13534 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!454802 () Bool)

(declare-fun e!266014 () Bool)

(assert (=> b!454802 (= e!266014 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!17363 0))(
  ( (V!17364 (val!6141 Int)) )
))
(declare-datatypes ((tuple2!7994 0))(
  ( (tuple2!7995 (_1!4008 (_ BitVec 64)) (_2!4008 V!17363)) )
))
(declare-datatypes ((List!8064 0))(
  ( (Nil!8061) (Cons!8060 (h!8916 tuple2!7994) (t!13884 List!8064)) )
))
(declare-datatypes ((ListLongMap!6909 0))(
  ( (ListLongMap!6910 (toList!3470 List!8064)) )
))
(declare-fun lt!206233 () ListLongMap!6909)

(declare-fun minValue!515 () V!17363)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5753 0))(
  ( (ValueCellFull!5753 (v!8408 V!17363)) (EmptyCell!5753) )
))
(declare-datatypes ((array!28184 0))(
  ( (array!28185 (arr!13535 (Array (_ BitVec 32) ValueCell!5753)) (size!13887 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28184)

(declare-fun zeroValue!515 () V!17363)

(declare-fun lt!206232 () array!28182)

(declare-fun v!412 () V!17363)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1699 (array!28182 array!28184 (_ BitVec 32) (_ BitVec 32) V!17363 V!17363 (_ BitVec 32) Int) ListLongMap!6909)

(assert (=> b!454802 (= lt!206233 (getCurrentListMapNoExtraKeys!1699 lt!206232 (array!28185 (store (arr!13535 _values!549) i!563 (ValueCellFull!5753 v!412)) (size!13887 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206234 () ListLongMap!6909)

(assert (=> b!454802 (= lt!206234 (getCurrentListMapNoExtraKeys!1699 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!454803 () Bool)

(declare-fun res!271102 () Bool)

(assert (=> b!454803 (=> (not res!271102) (not e!266011))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28182 (_ BitVec 32)) Bool)

(assert (=> b!454803 (= res!271102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!454804 () Bool)

(declare-fun e!266010 () Bool)

(declare-fun tp_is_empty!12193 () Bool)

(assert (=> b!454804 (= e!266010 tp_is_empty!12193)))

(declare-fun b!454805 () Bool)

(declare-fun e!266013 () Bool)

(assert (=> b!454805 (= e!266013 tp_is_empty!12193)))

(declare-fun b!454806 () Bool)

(declare-fun res!271099 () Bool)

(assert (=> b!454806 (=> (not res!271099) (not e!266011))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454806 (= res!271099 (validKeyInArray!0 k0!794))))

(declare-fun b!454807 () Bool)

(declare-fun res!271106 () Bool)

(assert (=> b!454807 (=> (not res!271106) (not e!266014))))

(declare-datatypes ((List!8065 0))(
  ( (Nil!8062) (Cons!8061 (h!8917 (_ BitVec 64)) (t!13885 List!8065)) )
))
(declare-fun arrayNoDuplicates!0 (array!28182 (_ BitVec 32) List!8065) Bool)

(assert (=> b!454807 (= res!271106 (arrayNoDuplicates!0 lt!206232 #b00000000000000000000000000000000 Nil!8062))))

(declare-fun b!454808 () Bool)

(declare-fun res!271103 () Bool)

(assert (=> b!454808 (=> (not res!271103) (not e!266011))))

(assert (=> b!454808 (= res!271103 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13886 _keys!709))))))

(declare-fun b!454809 () Bool)

(declare-fun e!266012 () Bool)

(declare-fun mapRes!19930 () Bool)

(assert (=> b!454809 (= e!266012 (and e!266013 mapRes!19930))))

(declare-fun condMapEmpty!19930 () Bool)

(declare-fun mapDefault!19930 () ValueCell!5753)

(assert (=> b!454809 (= condMapEmpty!19930 (= (arr!13535 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5753)) mapDefault!19930)))))

(declare-fun b!454810 () Bool)

(declare-fun res!271097 () Bool)

(assert (=> b!454810 (=> (not res!271097) (not e!266011))))

(declare-fun arrayContainsKey!0 (array!28182 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454810 (= res!271097 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!454811 () Bool)

(declare-fun res!271104 () Bool)

(assert (=> b!454811 (=> (not res!271104) (not e!266011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454811 (= res!271104 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!19930 () Bool)

(declare-fun tp!38392 () Bool)

(assert (=> mapNonEmpty!19930 (= mapRes!19930 (and tp!38392 e!266010))))

(declare-fun mapKey!19930 () (_ BitVec 32))

(declare-fun mapValue!19930 () ValueCell!5753)

(declare-fun mapRest!19930 () (Array (_ BitVec 32) ValueCell!5753))

(assert (=> mapNonEmpty!19930 (= (arr!13535 _values!549) (store mapRest!19930 mapKey!19930 mapValue!19930))))

(declare-fun b!454812 () Bool)

(declare-fun res!271101 () Bool)

(assert (=> b!454812 (=> (not res!271101) (not e!266011))))

(assert (=> b!454812 (= res!271101 (and (= (size!13887 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13886 _keys!709) (size!13887 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!454813 () Bool)

(assert (=> b!454813 (= e!266011 e!266014)))

(declare-fun res!271100 () Bool)

(assert (=> b!454813 (=> (not res!271100) (not e!266014))))

(assert (=> b!454813 (= res!271100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206232 mask!1025))))

(assert (=> b!454813 (= lt!206232 (array!28183 (store (arr!13534 _keys!709) i!563 k0!794) (size!13886 _keys!709)))))

(declare-fun b!454814 () Bool)

(declare-fun res!271098 () Bool)

(assert (=> b!454814 (=> (not res!271098) (not e!266014))))

(assert (=> b!454814 (= res!271098 (bvsle from!863 i!563))))

(declare-fun res!271105 () Bool)

(assert (=> start!40906 (=> (not res!271105) (not e!266011))))

(assert (=> start!40906 (= res!271105 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13886 _keys!709))))))

(assert (=> start!40906 e!266011))

(assert (=> start!40906 tp_is_empty!12193))

(assert (=> start!40906 tp!38391))

(assert (=> start!40906 true))

(declare-fun array_inv!9880 (array!28184) Bool)

(assert (=> start!40906 (and (array_inv!9880 _values!549) e!266012)))

(declare-fun array_inv!9881 (array!28182) Bool)

(assert (=> start!40906 (array_inv!9881 _keys!709)))

(declare-fun mapIsEmpty!19930 () Bool)

(assert (=> mapIsEmpty!19930 mapRes!19930))

(declare-fun b!454815 () Bool)

(declare-fun res!271108 () Bool)

(assert (=> b!454815 (=> (not res!271108) (not e!266011))))

(assert (=> b!454815 (= res!271108 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8062))))

(assert (= (and start!40906 res!271105) b!454811))

(assert (= (and b!454811 res!271104) b!454812))

(assert (= (and b!454812 res!271101) b!454803))

(assert (= (and b!454803 res!271102) b!454815))

(assert (= (and b!454815 res!271108) b!454808))

(assert (= (and b!454808 res!271103) b!454806))

(assert (= (and b!454806 res!271099) b!454801))

(assert (= (and b!454801 res!271107) b!454810))

(assert (= (and b!454810 res!271097) b!454813))

(assert (= (and b!454813 res!271100) b!454807))

(assert (= (and b!454807 res!271106) b!454814))

(assert (= (and b!454814 res!271098) b!454802))

(assert (= (and b!454809 condMapEmpty!19930) mapIsEmpty!19930))

(assert (= (and b!454809 (not condMapEmpty!19930)) mapNonEmpty!19930))

(get-info :version)

(assert (= (and mapNonEmpty!19930 ((_ is ValueCellFull!5753) mapValue!19930)) b!454804))

(assert (= (and b!454809 ((_ is ValueCellFull!5753) mapDefault!19930)) b!454805))

(assert (= start!40906 b!454809))

(declare-fun m!439023 () Bool)

(assert (=> start!40906 m!439023))

(declare-fun m!439025 () Bool)

(assert (=> start!40906 m!439025))

(declare-fun m!439027 () Bool)

(assert (=> b!454803 m!439027))

(declare-fun m!439029 () Bool)

(assert (=> mapNonEmpty!19930 m!439029))

(declare-fun m!439031 () Bool)

(assert (=> b!454801 m!439031))

(declare-fun m!439033 () Bool)

(assert (=> b!454807 m!439033))

(declare-fun m!439035 () Bool)

(assert (=> b!454802 m!439035))

(declare-fun m!439037 () Bool)

(assert (=> b!454802 m!439037))

(declare-fun m!439039 () Bool)

(assert (=> b!454802 m!439039))

(declare-fun m!439041 () Bool)

(assert (=> b!454810 m!439041))

(declare-fun m!439043 () Bool)

(assert (=> b!454813 m!439043))

(declare-fun m!439045 () Bool)

(assert (=> b!454813 m!439045))

(declare-fun m!439047 () Bool)

(assert (=> b!454815 m!439047))

(declare-fun m!439049 () Bool)

(assert (=> b!454811 m!439049))

(declare-fun m!439051 () Bool)

(assert (=> b!454806 m!439051))

(check-sat tp_is_empty!12193 (not b!454803) (not b!454811) (not b!454815) (not start!40906) (not b!454802) (not b!454813) (not mapNonEmpty!19930) (not b!454806) (not b_next!10855) (not b!454810) (not b!454807) b_and!19007)
(check-sat b_and!19007 (not b_next!10855))
