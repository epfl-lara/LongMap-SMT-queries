; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77718 () Bool)

(assert start!77718)

(declare-fun b_free!16135 () Bool)

(declare-fun b_next!16135 () Bool)

(assert (=> start!77718 (= b_free!16135 (not b_next!16135))))

(declare-fun tp!56668 () Bool)

(declare-fun b_and!26511 () Bool)

(assert (=> start!77718 (= tp!56668 b_and!26511)))

(declare-fun b!904454 () Bool)

(declare-fun res!609950 () Bool)

(declare-fun e!506846 () Bool)

(assert (=> b!904454 (=> (not res!609950) (not e!506846))))

(declare-datatypes ((V!29703 0))(
  ( (V!29704 (val!9327 Int)) )
))
(declare-datatypes ((ValueCell!8795 0))(
  ( (ValueCellFull!8795 (v!11829 V!29703)) (EmptyCell!8795) )
))
(declare-datatypes ((array!53197 0))(
  ( (array!53198 (arr!25553 (Array (_ BitVec 32) ValueCell!8795)) (size!26013 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53197)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53199 0))(
  ( (array!53200 (arr!25554 (Array (_ BitVec 32) (_ BitVec 64))) (size!26014 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53199)

(assert (=> b!904454 (= res!609950 (and (= (size!26013 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26014 _keys!1386) (size!26013 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!904455 () Bool)

(declare-fun e!506845 () Bool)

(declare-fun tp_is_empty!18553 () Bool)

(assert (=> b!904455 (= e!506845 tp_is_empty!18553)))

(declare-fun b!904456 () Bool)

(declare-fun e!506847 () Bool)

(assert (=> b!904456 (= e!506847 tp_is_empty!18553)))

(declare-fun mapIsEmpty!29542 () Bool)

(declare-fun mapRes!29542 () Bool)

(assert (=> mapIsEmpty!29542 mapRes!29542))

(declare-fun b!904457 () Bool)

(declare-fun e!506843 () Bool)

(assert (=> b!904457 (= e!506843 (and e!506847 mapRes!29542))))

(declare-fun condMapEmpty!29542 () Bool)

(declare-fun mapDefault!29542 () ValueCell!8795)

(assert (=> b!904457 (= condMapEmpty!29542 (= (arr!25553 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8795)) mapDefault!29542)))))

(declare-fun res!609952 () Bool)

(assert (=> start!77718 (=> (not res!609952) (not e!506846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77718 (= res!609952 (validMask!0 mask!1756))))

(assert (=> start!77718 e!506846))

(declare-fun array_inv!20090 (array!53197) Bool)

(assert (=> start!77718 (and (array_inv!20090 _values!1152) e!506843)))

(assert (=> start!77718 tp!56668))

(assert (=> start!77718 true))

(assert (=> start!77718 tp_is_empty!18553))

(declare-fun array_inv!20091 (array!53199) Bool)

(assert (=> start!77718 (array_inv!20091 _keys!1386)))

(declare-fun b!904458 () Bool)

(declare-fun res!609951 () Bool)

(assert (=> b!904458 (=> (not res!609951) (not e!506846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53199 (_ BitVec 32)) Bool)

(assert (=> b!904458 (= res!609951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!904459 () Bool)

(assert (=> b!904459 (= e!506846 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29703)

(declare-fun lt!408385 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!29703)

(declare-datatypes ((tuple2!12040 0))(
  ( (tuple2!12041 (_1!6031 (_ BitVec 64)) (_2!6031 V!29703)) )
))
(declare-datatypes ((List!17893 0))(
  ( (Nil!17890) (Cons!17889 (h!19041 tuple2!12040) (t!25268 List!17893)) )
))
(declare-datatypes ((ListLongMap!10739 0))(
  ( (ListLongMap!10740 (toList!5385 List!17893)) )
))
(declare-fun contains!4443 (ListLongMap!10739 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2654 (array!53199 array!53197 (_ BitVec 32) (_ BitVec 32) V!29703 V!29703 (_ BitVec 32) Int) ListLongMap!10739)

(assert (=> b!904459 (= lt!408385 (contains!4443 (getCurrentListMap!2654 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapNonEmpty!29542 () Bool)

(declare-fun tp!56667 () Bool)

(assert (=> mapNonEmpty!29542 (= mapRes!29542 (and tp!56667 e!506845))))

(declare-fun mapRest!29542 () (Array (_ BitVec 32) ValueCell!8795))

(declare-fun mapValue!29542 () ValueCell!8795)

(declare-fun mapKey!29542 () (_ BitVec 32))

(assert (=> mapNonEmpty!29542 (= (arr!25553 _values!1152) (store mapRest!29542 mapKey!29542 mapValue!29542))))

(declare-fun b!904460 () Bool)

(declare-fun res!609949 () Bool)

(assert (=> b!904460 (=> (not res!609949) (not e!506846))))

(declare-datatypes ((List!17894 0))(
  ( (Nil!17891) (Cons!17890 (h!19042 (_ BitVec 64)) (t!25269 List!17894)) )
))
(declare-fun arrayNoDuplicates!0 (array!53199 (_ BitVec 32) List!17894) Bool)

(assert (=> b!904460 (= res!609949 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17891))))

(assert (= (and start!77718 res!609952) b!904454))

(assert (= (and b!904454 res!609950) b!904458))

(assert (= (and b!904458 res!609951) b!904460))

(assert (= (and b!904460 res!609949) b!904459))

(assert (= (and b!904457 condMapEmpty!29542) mapIsEmpty!29542))

(assert (= (and b!904457 (not condMapEmpty!29542)) mapNonEmpty!29542))

(get-info :version)

(assert (= (and mapNonEmpty!29542 ((_ is ValueCellFull!8795) mapValue!29542)) b!904455))

(assert (= (and b!904457 ((_ is ValueCellFull!8795) mapDefault!29542)) b!904456))

(assert (= start!77718 b!904457))

(declare-fun m!840503 () Bool)

(assert (=> b!904460 m!840503))

(declare-fun m!840505 () Bool)

(assert (=> b!904458 m!840505))

(declare-fun m!840507 () Bool)

(assert (=> start!77718 m!840507))

(declare-fun m!840509 () Bool)

(assert (=> start!77718 m!840509))

(declare-fun m!840511 () Bool)

(assert (=> start!77718 m!840511))

(declare-fun m!840513 () Bool)

(assert (=> mapNonEmpty!29542 m!840513))

(declare-fun m!840515 () Bool)

(assert (=> b!904459 m!840515))

(assert (=> b!904459 m!840515))

(declare-fun m!840517 () Bool)

(assert (=> b!904459 m!840517))

(check-sat b_and!26511 tp_is_empty!18553 (not b!904458) (not b_next!16135) (not mapNonEmpty!29542) (not start!77718) (not b!904460) (not b!904459))
(check-sat b_and!26511 (not b_next!16135))
