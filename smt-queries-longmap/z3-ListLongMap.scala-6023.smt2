; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78004 () Bool)

(assert start!78004)

(declare-fun b_free!16549 () Bool)

(declare-fun b_next!16549 () Bool)

(assert (=> start!78004 (= b_free!16549 (not b_next!16549))))

(declare-fun tp!57918 () Bool)

(declare-fun b_and!27095 () Bool)

(assert (=> start!78004 (= tp!57918 b_and!27095)))

(declare-fun b!910540 () Bool)

(declare-fun res!614449 () Bool)

(declare-fun e!510555 () Bool)

(assert (=> b!910540 (=> (not res!614449) (not e!510555))))

(declare-datatypes ((array!53939 0))(
  ( (array!53940 (arr!25926 (Array (_ BitVec 32) (_ BitVec 64))) (size!26387 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53939)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53939 (_ BitVec 32)) Bool)

(assert (=> b!910540 (= res!614449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910541 () Bool)

(declare-fun e!510554 () Bool)

(declare-fun tp_is_empty!18967 () Bool)

(assert (=> b!910541 (= e!510554 tp_is_empty!18967)))

(declare-fun b!910542 () Bool)

(declare-fun res!614446 () Bool)

(assert (=> b!910542 (=> (not res!614446) (not e!510555))))

(declare-datatypes ((V!30255 0))(
  ( (V!30256 (val!9534 Int)) )
))
(declare-datatypes ((ValueCell!9002 0))(
  ( (ValueCellFull!9002 (v!12042 V!30255)) (EmptyCell!9002) )
))
(declare-datatypes ((array!53941 0))(
  ( (array!53942 (arr!25927 (Array (_ BitVec 32) ValueCell!9002)) (size!26388 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53941)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!910542 (= res!614446 (and (= (size!26388 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26387 _keys!1386) (size!26388 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30172 () Bool)

(declare-fun mapRes!30172 () Bool)

(assert (=> mapIsEmpty!30172 mapRes!30172))

(declare-fun b!910543 () Bool)

(assert (=> b!910543 (= e!510555 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30255)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!410070 () Bool)

(declare-fun minValue!1094 () V!30255)

(declare-datatypes ((tuple2!12456 0))(
  ( (tuple2!12457 (_1!6239 (_ BitVec 64)) (_2!6239 V!30255)) )
))
(declare-datatypes ((List!18243 0))(
  ( (Nil!18240) (Cons!18239 (h!19385 tuple2!12456) (t!25819 List!18243)) )
))
(declare-datatypes ((ListLongMap!11143 0))(
  ( (ListLongMap!11144 (toList!5587 List!18243)) )
))
(declare-fun contains!4588 (ListLongMap!11143 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2789 (array!53939 array!53941 (_ BitVec 32) (_ BitVec 32) V!30255 V!30255 (_ BitVec 32) Int) ListLongMap!11143)

(assert (=> b!910543 (= lt!410070 (contains!4588 (getCurrentListMap!2789 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!910544 () Bool)

(declare-fun e!510557 () Bool)

(assert (=> b!910544 (= e!510557 tp_is_empty!18967)))

(declare-fun res!614447 () Bool)

(assert (=> start!78004 (=> (not res!614447) (not e!510555))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78004 (= res!614447 (validMask!0 mask!1756))))

(assert (=> start!78004 e!510555))

(declare-fun e!510553 () Bool)

(declare-fun array_inv!20328 (array!53941) Bool)

(assert (=> start!78004 (and (array_inv!20328 _values!1152) e!510553)))

(assert (=> start!78004 tp!57918))

(assert (=> start!78004 true))

(assert (=> start!78004 tp_is_empty!18967))

(declare-fun array_inv!20329 (array!53939) Bool)

(assert (=> start!78004 (array_inv!20329 _keys!1386)))

(declare-fun b!910545 () Bool)

(assert (=> b!910545 (= e!510553 (and e!510554 mapRes!30172))))

(declare-fun condMapEmpty!30172 () Bool)

(declare-fun mapDefault!30172 () ValueCell!9002)

(assert (=> b!910545 (= condMapEmpty!30172 (= (arr!25927 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9002)) mapDefault!30172)))))

(declare-fun b!910546 () Bool)

(declare-fun res!614448 () Bool)

(assert (=> b!910546 (=> (not res!614448) (not e!510555))))

(declare-datatypes ((List!18244 0))(
  ( (Nil!18241) (Cons!18240 (h!19386 (_ BitVec 64)) (t!25820 List!18244)) )
))
(declare-fun arrayNoDuplicates!0 (array!53939 (_ BitVec 32) List!18244) Bool)

(assert (=> b!910546 (= res!614448 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18241))))

(declare-fun mapNonEmpty!30172 () Bool)

(declare-fun tp!57919 () Bool)

(assert (=> mapNonEmpty!30172 (= mapRes!30172 (and tp!57919 e!510557))))

(declare-fun mapKey!30172 () (_ BitVec 32))

(declare-fun mapRest!30172 () (Array (_ BitVec 32) ValueCell!9002))

(declare-fun mapValue!30172 () ValueCell!9002)

(assert (=> mapNonEmpty!30172 (= (arr!25927 _values!1152) (store mapRest!30172 mapKey!30172 mapValue!30172))))

(assert (= (and start!78004 res!614447) b!910542))

(assert (= (and b!910542 res!614446) b!910540))

(assert (= (and b!910540 res!614449) b!910546))

(assert (= (and b!910546 res!614448) b!910543))

(assert (= (and b!910545 condMapEmpty!30172) mapIsEmpty!30172))

(assert (= (and b!910545 (not condMapEmpty!30172)) mapNonEmpty!30172))

(get-info :version)

(assert (= (and mapNonEmpty!30172 ((_ is ValueCellFull!9002) mapValue!30172)) b!910544))

(assert (= (and b!910545 ((_ is ValueCellFull!9002) mapDefault!30172)) b!910541))

(assert (= start!78004 b!910545))

(declare-fun m!844939 () Bool)

(assert (=> b!910540 m!844939))

(declare-fun m!844941 () Bool)

(assert (=> mapNonEmpty!30172 m!844941))

(declare-fun m!844943 () Bool)

(assert (=> start!78004 m!844943))

(declare-fun m!844945 () Bool)

(assert (=> start!78004 m!844945))

(declare-fun m!844947 () Bool)

(assert (=> start!78004 m!844947))

(declare-fun m!844949 () Bool)

(assert (=> b!910546 m!844949))

(declare-fun m!844951 () Bool)

(assert (=> b!910543 m!844951))

(assert (=> b!910543 m!844951))

(declare-fun m!844953 () Bool)

(assert (=> b!910543 m!844953))

(check-sat (not b_next!16549) (not b!910540) tp_is_empty!18967 (not b!910543) (not b!910546) (not start!78004) (not mapNonEmpty!30172) b_and!27095)
(check-sat b_and!27095 (not b_next!16549))
