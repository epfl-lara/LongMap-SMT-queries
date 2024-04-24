; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4478 () Bool)

(assert start!4478)

(declare-fun b_free!1243 () Bool)

(declare-fun b_next!1243 () Bool)

(assert (=> start!4478 (= b_free!1243 (not b_next!1243))))

(declare-fun tp!5166 () Bool)

(declare-fun b_and!2055 () Bool)

(assert (=> start!4478 (= tp!5166 b_and!2055)))

(declare-fun b!34789 () Bool)

(declare-fun res!21145 () Bool)

(declare-fun e!22006 () Bool)

(assert (=> b!34789 (=> (not res!21145) (not e!22006))))

(declare-datatypes ((array!2389 0))(
  ( (array!2390 (arr!1142 (Array (_ BitVec 32) (_ BitVec 64))) (size!1243 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2389)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2389 (_ BitVec 32)) Bool)

(assert (=> b!34789 (= res!21145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!34790 () Bool)

(declare-fun res!21146 () Bool)

(assert (=> b!34790 (=> (not res!21146) (not e!22006))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1955 0))(
  ( (V!1956 (val!825 Int)) )
))
(declare-datatypes ((ValueCell!599 0))(
  ( (ValueCellFull!599 (v!1920 V!1955)) (EmptyCell!599) )
))
(declare-datatypes ((array!2391 0))(
  ( (array!2392 (arr!1143 (Array (_ BitVec 32) ValueCell!599)) (size!1244 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2391)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1955)

(declare-fun minValue!1443 () V!1955)

(declare-datatypes ((tuple2!1310 0))(
  ( (tuple2!1311 (_1!666 (_ BitVec 64)) (_2!666 V!1955)) )
))
(declare-datatypes ((List!905 0))(
  ( (Nil!902) (Cons!901 (h!1468 tuple2!1310) (t!3604 List!905)) )
))
(declare-datatypes ((ListLongMap!881 0))(
  ( (ListLongMap!882 (toList!456 List!905)) )
))
(declare-fun contains!404 (ListLongMap!881 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!277 (array!2389 array!2391 (_ BitVec 32) (_ BitVec 32) V!1955 V!1955 (_ BitVec 32) Int) ListLongMap!881)

(assert (=> b!34790 (= res!21146 (not (contains!404 (getCurrentListMap!277 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!34791 () Bool)

(declare-fun e!22007 () Bool)

(declare-fun tp_is_empty!1597 () Bool)

(assert (=> b!34791 (= e!22007 tp_is_empty!1597)))

(declare-fun b!34792 () Bool)

(assert (=> b!34792 (= e!22006 false)))

(declare-datatypes ((SeekEntryResult!142 0))(
  ( (MissingZero!142 (index!2690 (_ BitVec 32))) (Found!142 (index!2691 (_ BitVec 32))) (Intermediate!142 (undefined!954 Bool) (index!2692 (_ BitVec 32)) (x!6952 (_ BitVec 32))) (Undefined!142) (MissingVacant!142 (index!2693 (_ BitVec 32))) )
))
(declare-fun lt!12778 () SeekEntryResult!142)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2389 (_ BitVec 32)) SeekEntryResult!142)

(assert (=> b!34792 (= lt!12778 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1942 () Bool)

(declare-fun mapRes!1942 () Bool)

(declare-fun tp!5167 () Bool)

(declare-fun e!22004 () Bool)

(assert (=> mapNonEmpty!1942 (= mapRes!1942 (and tp!5167 e!22004))))

(declare-fun mapRest!1942 () (Array (_ BitVec 32) ValueCell!599))

(declare-fun mapKey!1942 () (_ BitVec 32))

(declare-fun mapValue!1942 () ValueCell!599)

(assert (=> mapNonEmpty!1942 (= (arr!1143 _values!1501) (store mapRest!1942 mapKey!1942 mapValue!1942))))

(declare-fun res!21147 () Bool)

(assert (=> start!4478 (=> (not res!21147) (not e!22006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4478 (= res!21147 (validMask!0 mask!2294))))

(assert (=> start!4478 e!22006))

(assert (=> start!4478 true))

(assert (=> start!4478 tp!5166))

(declare-fun e!22005 () Bool)

(declare-fun array_inv!779 (array!2391) Bool)

(assert (=> start!4478 (and (array_inv!779 _values!1501) e!22005)))

(declare-fun array_inv!780 (array!2389) Bool)

(assert (=> start!4478 (array_inv!780 _keys!1833)))

(assert (=> start!4478 tp_is_empty!1597))

(declare-fun mapIsEmpty!1942 () Bool)

(assert (=> mapIsEmpty!1942 mapRes!1942))

(declare-fun b!34793 () Bool)

(declare-fun res!21149 () Bool)

(assert (=> b!34793 (=> (not res!21149) (not e!22006))))

(assert (=> b!34793 (= res!21149 (and (= (size!1244 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1243 _keys!1833) (size!1244 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!34794 () Bool)

(assert (=> b!34794 (= e!22005 (and e!22007 mapRes!1942))))

(declare-fun condMapEmpty!1942 () Bool)

(declare-fun mapDefault!1942 () ValueCell!599)

(assert (=> b!34794 (= condMapEmpty!1942 (= (arr!1143 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!599)) mapDefault!1942)))))

(declare-fun b!34795 () Bool)

(declare-fun res!21144 () Bool)

(assert (=> b!34795 (=> (not res!21144) (not e!22006))))

(declare-datatypes ((List!906 0))(
  ( (Nil!903) (Cons!902 (h!1469 (_ BitVec 64)) (t!3605 List!906)) )
))
(declare-fun arrayNoDuplicates!0 (array!2389 (_ BitVec 32) List!906) Bool)

(assert (=> b!34795 (= res!21144 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!903))))

(declare-fun b!34796 () Bool)

(declare-fun res!21143 () Bool)

(assert (=> b!34796 (=> (not res!21143) (not e!22006))))

(declare-fun arrayContainsKey!0 (array!2389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34796 (= res!21143 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!34797 () Bool)

(assert (=> b!34797 (= e!22004 tp_is_empty!1597)))

(declare-fun b!34798 () Bool)

(declare-fun res!21148 () Bool)

(assert (=> b!34798 (=> (not res!21148) (not e!22006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34798 (= res!21148 (validKeyInArray!0 k0!1304))))

(assert (= (and start!4478 res!21147) b!34793))

(assert (= (and b!34793 res!21149) b!34789))

(assert (= (and b!34789 res!21145) b!34795))

(assert (= (and b!34795 res!21144) b!34798))

(assert (= (and b!34798 res!21148) b!34790))

(assert (= (and b!34790 res!21146) b!34796))

(assert (= (and b!34796 res!21143) b!34792))

(assert (= (and b!34794 condMapEmpty!1942) mapIsEmpty!1942))

(assert (= (and b!34794 (not condMapEmpty!1942)) mapNonEmpty!1942))

(get-info :version)

(assert (= (and mapNonEmpty!1942 ((_ is ValueCellFull!599) mapValue!1942)) b!34797))

(assert (= (and b!34794 ((_ is ValueCellFull!599) mapDefault!1942)) b!34791))

(assert (= start!4478 b!34794))

(declare-fun m!27925 () Bool)

(assert (=> b!34792 m!27925))

(declare-fun m!27927 () Bool)

(assert (=> b!34790 m!27927))

(assert (=> b!34790 m!27927))

(declare-fun m!27929 () Bool)

(assert (=> b!34790 m!27929))

(declare-fun m!27931 () Bool)

(assert (=> b!34796 m!27931))

(declare-fun m!27933 () Bool)

(assert (=> b!34798 m!27933))

(declare-fun m!27935 () Bool)

(assert (=> start!4478 m!27935))

(declare-fun m!27937 () Bool)

(assert (=> start!4478 m!27937))

(declare-fun m!27939 () Bool)

(assert (=> start!4478 m!27939))

(declare-fun m!27941 () Bool)

(assert (=> b!34789 m!27941))

(declare-fun m!27943 () Bool)

(assert (=> b!34795 m!27943))

(declare-fun m!27945 () Bool)

(assert (=> mapNonEmpty!1942 m!27945))

(check-sat (not start!4478) tp_is_empty!1597 (not b!34792) (not b_next!1243) (not b!34795) (not b!34790) (not b!34798) (not b!34789) (not b!34796) (not mapNonEmpty!1942) b_and!2055)
(check-sat b_and!2055 (not b_next!1243))
