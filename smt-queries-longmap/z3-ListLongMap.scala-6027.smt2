; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78048 () Bool)

(assert start!78048)

(declare-fun b_free!16575 () Bool)

(declare-fun b_next!16575 () Bool)

(assert (=> start!78048 (= b_free!16575 (not b_next!16575))))

(declare-fun tp!57995 () Bool)

(declare-fun b_and!27147 () Bool)

(assert (=> start!78048 (= tp!57995 b_and!27147)))

(declare-fun b!911053 () Bool)

(declare-fun res!614714 () Bool)

(declare-fun e!510897 () Bool)

(assert (=> b!911053 (=> (not res!614714) (not e!510897))))

(declare-datatypes ((V!30289 0))(
  ( (V!30290 (val!9547 Int)) )
))
(declare-datatypes ((ValueCell!9015 0))(
  ( (ValueCellFull!9015 (v!12056 V!30289)) (EmptyCell!9015) )
))
(declare-datatypes ((array!53990 0))(
  ( (array!53991 (arr!25951 (Array (_ BitVec 32) ValueCell!9015)) (size!26410 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53990)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53992 0))(
  ( (array!53993 (arr!25952 (Array (_ BitVec 32) (_ BitVec 64))) (size!26411 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53992)

(assert (=> b!911053 (= res!614714 (and (= (size!26410 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26411 _keys!1386) (size!26410 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911054 () Bool)

(declare-fun e!510896 () Bool)

(declare-fun tp_is_empty!18993 () Bool)

(assert (=> b!911054 (= e!510896 tp_is_empty!18993)))

(declare-fun mapIsEmpty!30211 () Bool)

(declare-fun mapRes!30211 () Bool)

(assert (=> mapIsEmpty!30211 mapRes!30211))

(declare-fun b!911055 () Bool)

(assert (=> b!911055 (= e!510897 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30289)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30289)

(declare-fun lt!410345 () Bool)

(declare-datatypes ((tuple2!12436 0))(
  ( (tuple2!12437 (_1!6229 (_ BitVec 64)) (_2!6229 V!30289)) )
))
(declare-datatypes ((List!18227 0))(
  ( (Nil!18224) (Cons!18223 (h!19369 tuple2!12436) (t!25812 List!18227)) )
))
(declare-datatypes ((ListLongMap!11133 0))(
  ( (ListLongMap!11134 (toList!5582 List!18227)) )
))
(declare-fun contains!4626 (ListLongMap!11133 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2844 (array!53992 array!53990 (_ BitVec 32) (_ BitVec 32) V!30289 V!30289 (_ BitVec 32) Int) ListLongMap!11133)

(assert (=> b!911055 (= lt!410345 (contains!4626 (getCurrentListMap!2844 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!911056 () Bool)

(declare-fun res!614715 () Bool)

(assert (=> b!911056 (=> (not res!614715) (not e!510897))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53992 (_ BitVec 32)) Bool)

(assert (=> b!911056 (= res!614715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!30211 () Bool)

(declare-fun tp!57996 () Bool)

(assert (=> mapNonEmpty!30211 (= mapRes!30211 (and tp!57996 e!510896))))

(declare-fun mapKey!30211 () (_ BitVec 32))

(declare-fun mapValue!30211 () ValueCell!9015)

(declare-fun mapRest!30211 () (Array (_ BitVec 32) ValueCell!9015))

(assert (=> mapNonEmpty!30211 (= (arr!25951 _values!1152) (store mapRest!30211 mapKey!30211 mapValue!30211))))

(declare-fun b!911057 () Bool)

(declare-fun e!510900 () Bool)

(assert (=> b!911057 (= e!510900 tp_is_empty!18993)))

(declare-fun b!911058 () Bool)

(declare-fun res!614712 () Bool)

(assert (=> b!911058 (=> (not res!614712) (not e!510897))))

(declare-datatypes ((List!18228 0))(
  ( (Nil!18225) (Cons!18224 (h!19370 (_ BitVec 64)) (t!25813 List!18228)) )
))
(declare-fun arrayNoDuplicates!0 (array!53992 (_ BitVec 32) List!18228) Bool)

(assert (=> b!911058 (= res!614712 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18225))))

(declare-fun b!911052 () Bool)

(declare-fun e!510899 () Bool)

(assert (=> b!911052 (= e!510899 (and e!510900 mapRes!30211))))

(declare-fun condMapEmpty!30211 () Bool)

(declare-fun mapDefault!30211 () ValueCell!9015)

(assert (=> b!911052 (= condMapEmpty!30211 (= (arr!25951 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9015)) mapDefault!30211)))))

(declare-fun res!614713 () Bool)

(assert (=> start!78048 (=> (not res!614713) (not e!510897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78048 (= res!614713 (validMask!0 mask!1756))))

(assert (=> start!78048 e!510897))

(declare-fun array_inv!20286 (array!53990) Bool)

(assert (=> start!78048 (and (array_inv!20286 _values!1152) e!510899)))

(assert (=> start!78048 tp!57995))

(assert (=> start!78048 true))

(assert (=> start!78048 tp_is_empty!18993))

(declare-fun array_inv!20287 (array!53992) Bool)

(assert (=> start!78048 (array_inv!20287 _keys!1386)))

(assert (= (and start!78048 res!614713) b!911053))

(assert (= (and b!911053 res!614714) b!911056))

(assert (= (and b!911056 res!614715) b!911058))

(assert (= (and b!911058 res!614712) b!911055))

(assert (= (and b!911052 condMapEmpty!30211) mapIsEmpty!30211))

(assert (= (and b!911052 (not condMapEmpty!30211)) mapNonEmpty!30211))

(get-info :version)

(assert (= (and mapNonEmpty!30211 ((_ is ValueCellFull!9015) mapValue!30211)) b!911054))

(assert (= (and b!911052 ((_ is ValueCellFull!9015) mapDefault!30211)) b!911057))

(assert (= start!78048 b!911052))

(declare-fun m!845905 () Bool)

(assert (=> start!78048 m!845905))

(declare-fun m!845907 () Bool)

(assert (=> start!78048 m!845907))

(declare-fun m!845909 () Bool)

(assert (=> start!78048 m!845909))

(declare-fun m!845911 () Bool)

(assert (=> b!911056 m!845911))

(declare-fun m!845913 () Bool)

(assert (=> b!911055 m!845913))

(assert (=> b!911055 m!845913))

(declare-fun m!845915 () Bool)

(assert (=> b!911055 m!845915))

(declare-fun m!845917 () Bool)

(assert (=> mapNonEmpty!30211 m!845917))

(declare-fun m!845919 () Bool)

(assert (=> b!911058 m!845919))

(check-sat (not mapNonEmpty!30211) (not b!911056) (not b!911055) b_and!27147 tp_is_empty!18993 (not start!78048) (not b_next!16575) (not b!911058))
(check-sat b_and!27147 (not b_next!16575))
