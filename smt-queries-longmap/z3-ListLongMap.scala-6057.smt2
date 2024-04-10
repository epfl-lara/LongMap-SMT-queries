; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78390 () Bool)

(assert start!78390)

(declare-fun b_free!16755 () Bool)

(declare-fun b_next!16755 () Bool)

(assert (=> start!78390 (= b_free!16755 (not b_next!16755))))

(declare-fun tp!58553 () Bool)

(declare-fun b_and!27375 () Bool)

(assert (=> start!78390 (= tp!58553 b_and!27375)))

(declare-fun b!914458 () Bool)

(declare-fun res!616715 () Bool)

(declare-fun e!512996 () Bool)

(assert (=> b!914458 (=> (not res!616715) (not e!512996))))

(declare-datatypes ((V!30529 0))(
  ( (V!30530 (val!9637 Int)) )
))
(declare-datatypes ((ValueCell!9105 0))(
  ( (ValueCellFull!9105 (v!12153 V!30529)) (EmptyCell!9105) )
))
(declare-datatypes ((array!54338 0))(
  ( (array!54339 (arr!26120 (Array (_ BitVec 32) ValueCell!9105)) (size!26579 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54338)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!54340 0))(
  ( (array!54341 (arr!26121 (Array (_ BitVec 32) (_ BitVec 64))) (size!26580 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54340)

(assert (=> b!914458 (= res!616715 (and (= (size!26579 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26580 _keys!1386) (size!26579 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!914459 () Bool)

(declare-fun e!512999 () Bool)

(declare-fun tp_is_empty!19173 () Bool)

(assert (=> b!914459 (= e!512999 tp_is_empty!19173)))

(declare-fun b!914460 () Bool)

(declare-fun e!512998 () Bool)

(declare-fun mapRes!30498 () Bool)

(assert (=> b!914460 (= e!512998 (and e!512999 mapRes!30498))))

(declare-fun condMapEmpty!30498 () Bool)

(declare-fun mapDefault!30498 () ValueCell!9105)

(assert (=> b!914460 (= condMapEmpty!30498 (= (arr!26120 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9105)) mapDefault!30498)))))

(declare-fun b!914461 () Bool)

(declare-fun res!616713 () Bool)

(assert (=> b!914461 (=> (not res!616713) (not e!512996))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54340 (_ BitVec 32)) Bool)

(assert (=> b!914461 (= res!616713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!914462 () Bool)

(declare-fun res!616712 () Bool)

(assert (=> b!914462 (=> (not res!616712) (not e!512996))))

(declare-datatypes ((List!18352 0))(
  ( (Nil!18349) (Cons!18348 (h!19494 (_ BitVec 64)) (t!25963 List!18352)) )
))
(declare-fun arrayNoDuplicates!0 (array!54340 (_ BitVec 32) List!18352) Bool)

(assert (=> b!914462 (= res!616712 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18349))))

(declare-fun res!616714 () Bool)

(assert (=> start!78390 (=> (not res!616714) (not e!512996))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78390 (= res!616714 (validMask!0 mask!1756))))

(assert (=> start!78390 e!512996))

(declare-fun array_inv!20400 (array!54338) Bool)

(assert (=> start!78390 (and (array_inv!20400 _values!1152) e!512998)))

(assert (=> start!78390 tp!58553))

(assert (=> start!78390 true))

(assert (=> start!78390 tp_is_empty!19173))

(declare-fun array_inv!20401 (array!54340) Bool)

(assert (=> start!78390 (array_inv!20401 _keys!1386)))

(declare-fun mapNonEmpty!30498 () Bool)

(declare-fun tp!58552 () Bool)

(declare-fun e!512997 () Bool)

(assert (=> mapNonEmpty!30498 (= mapRes!30498 (and tp!58552 e!512997))))

(declare-fun mapRest!30498 () (Array (_ BitVec 32) ValueCell!9105))

(declare-fun mapValue!30498 () ValueCell!9105)

(declare-fun mapKey!30498 () (_ BitVec 32))

(assert (=> mapNonEmpty!30498 (= (arr!26120 _values!1152) (store mapRest!30498 mapKey!30498 mapValue!30498))))

(declare-fun b!914463 () Bool)

(assert (=> b!914463 (= e!512997 tp_is_empty!19173)))

(declare-fun b!914464 () Bool)

(assert (=> b!914464 (= e!512996 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30529)

(declare-fun minValue!1094 () V!30529)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!411486 () Bool)

(declare-datatypes ((tuple2!12564 0))(
  ( (tuple2!12565 (_1!6293 (_ BitVec 64)) (_2!6293 V!30529)) )
))
(declare-datatypes ((List!18353 0))(
  ( (Nil!18350) (Cons!18349 (h!19495 tuple2!12564) (t!25964 List!18353)) )
))
(declare-datatypes ((ListLongMap!11261 0))(
  ( (ListLongMap!11262 (toList!5646 List!18353)) )
))
(declare-fun contains!4696 (ListLongMap!11261 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2907 (array!54340 array!54338 (_ BitVec 32) (_ BitVec 32) V!30529 V!30529 (_ BitVec 32) Int) ListLongMap!11261)

(assert (=> b!914464 (= lt!411486 (contains!4696 (getCurrentListMap!2907 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapIsEmpty!30498 () Bool)

(assert (=> mapIsEmpty!30498 mapRes!30498))

(assert (= (and start!78390 res!616714) b!914458))

(assert (= (and b!914458 res!616715) b!914461))

(assert (= (and b!914461 res!616713) b!914462))

(assert (= (and b!914462 res!616712) b!914464))

(assert (= (and b!914460 condMapEmpty!30498) mapIsEmpty!30498))

(assert (= (and b!914460 (not condMapEmpty!30498)) mapNonEmpty!30498))

(get-info :version)

(assert (= (and mapNonEmpty!30498 ((_ is ValueCellFull!9105) mapValue!30498)) b!914463))

(assert (= (and b!914460 ((_ is ValueCellFull!9105) mapDefault!30498)) b!914459))

(assert (= start!78390 b!914460))

(declare-fun m!849191 () Bool)

(assert (=> b!914461 m!849191))

(declare-fun m!849193 () Bool)

(assert (=> b!914464 m!849193))

(assert (=> b!914464 m!849193))

(declare-fun m!849195 () Bool)

(assert (=> b!914464 m!849195))

(declare-fun m!849197 () Bool)

(assert (=> b!914462 m!849197))

(declare-fun m!849199 () Bool)

(assert (=> mapNonEmpty!30498 m!849199))

(declare-fun m!849201 () Bool)

(assert (=> start!78390 m!849201))

(declare-fun m!849203 () Bool)

(assert (=> start!78390 m!849203))

(declare-fun m!849205 () Bool)

(assert (=> start!78390 m!849205))

(check-sat b_and!27375 (not b!914464) (not b_next!16755) (not mapNonEmpty!30498) (not b!914462) (not start!78390) tp_is_empty!19173 (not b!914461))
(check-sat b_and!27375 (not b_next!16755))
