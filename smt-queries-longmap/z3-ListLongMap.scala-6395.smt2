; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82334 () Bool)

(assert start!82334)

(declare-fun b!958556 () Bool)

(declare-fun res!641382 () Bool)

(declare-fun e!540444 () Bool)

(assert (=> b!958556 (=> (not res!641382) (not e!540444))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58422 0))(
  ( (array!58423 (arr!28080 (Array (_ BitVec 32) (_ BitVec 64))) (size!28560 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58422)

(declare-datatypes ((V!33177 0))(
  ( (V!33178 (val!10623 Int)) )
))
(declare-datatypes ((ValueCell!10091 0))(
  ( (ValueCellFull!10091 (v!13177 V!33177)) (EmptyCell!10091) )
))
(declare-datatypes ((array!58424 0))(
  ( (array!58425 (arr!28081 (Array (_ BitVec 32) ValueCell!10091)) (size!28561 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58424)

(assert (=> b!958556 (= res!641382 (and (= (size!28561 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28560 _keys!1668) (size!28561 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958557 () Bool)

(declare-fun e!540447 () Bool)

(declare-fun tp_is_empty!21145 () Bool)

(assert (=> b!958557 (= e!540447 tp_is_empty!21145)))

(declare-fun b!958558 () Bool)

(declare-fun e!540443 () Bool)

(assert (=> b!958558 (= e!540443 tp_is_empty!21145)))

(declare-fun mapNonEmpty!33697 () Bool)

(declare-fun mapRes!33697 () Bool)

(declare-fun tp!64303 () Bool)

(assert (=> mapNonEmpty!33697 (= mapRes!33697 (and tp!64303 e!540443))))

(declare-fun mapKey!33697 () (_ BitVec 32))

(declare-fun mapRest!33697 () (Array (_ BitVec 32) ValueCell!10091))

(declare-fun mapValue!33697 () ValueCell!10091)

(assert (=> mapNonEmpty!33697 (= (arr!28081 _values!1386) (store mapRest!33697 mapKey!33697 mapValue!33697))))

(declare-fun b!958559 () Bool)

(declare-fun e!540445 () Bool)

(assert (=> b!958559 (= e!540445 (and e!540447 mapRes!33697))))

(declare-fun condMapEmpty!33697 () Bool)

(declare-fun mapDefault!33697 () ValueCell!10091)

(assert (=> b!958559 (= condMapEmpty!33697 (= (arr!28081 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10091)) mapDefault!33697)))))

(declare-fun b!958560 () Bool)

(assert (=> b!958560 (= e!540444 false)))

(declare-fun lt!430720 () Bool)

(declare-datatypes ((List!19514 0))(
  ( (Nil!19511) (Cons!19510 (h!20678 (_ BitVec 64)) (t!27869 List!19514)) )
))
(declare-fun arrayNoDuplicates!0 (array!58422 (_ BitVec 32) List!19514) Bool)

(assert (=> b!958560 (= lt!430720 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19511))))

(declare-fun res!641381 () Bool)

(assert (=> start!82334 (=> (not res!641381) (not e!540444))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82334 (= res!641381 (validMask!0 mask!2088))))

(assert (=> start!82334 e!540444))

(assert (=> start!82334 true))

(declare-fun array_inv!21853 (array!58424) Bool)

(assert (=> start!82334 (and (array_inv!21853 _values!1386) e!540445)))

(declare-fun array_inv!21854 (array!58422) Bool)

(assert (=> start!82334 (array_inv!21854 _keys!1668)))

(declare-fun mapIsEmpty!33697 () Bool)

(assert (=> mapIsEmpty!33697 mapRes!33697))

(declare-fun b!958561 () Bool)

(declare-fun res!641383 () Bool)

(assert (=> b!958561 (=> (not res!641383) (not e!540444))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58422 (_ BitVec 32)) Bool)

(assert (=> b!958561 (= res!641383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(assert (= (and start!82334 res!641381) b!958556))

(assert (= (and b!958556 res!641382) b!958561))

(assert (= (and b!958561 res!641383) b!958560))

(assert (= (and b!958559 condMapEmpty!33697) mapIsEmpty!33697))

(assert (= (and b!958559 (not condMapEmpty!33697)) mapNonEmpty!33697))

(get-info :version)

(assert (= (and mapNonEmpty!33697 ((_ is ValueCellFull!10091) mapValue!33697)) b!958558))

(assert (= (and b!958559 ((_ is ValueCellFull!10091) mapDefault!33697)) b!958557))

(assert (= start!82334 b!958559))

(declare-fun m!889851 () Bool)

(assert (=> mapNonEmpty!33697 m!889851))

(declare-fun m!889853 () Bool)

(assert (=> b!958560 m!889853))

(declare-fun m!889855 () Bool)

(assert (=> start!82334 m!889855))

(declare-fun m!889857 () Bool)

(assert (=> start!82334 m!889857))

(declare-fun m!889859 () Bool)

(assert (=> start!82334 m!889859))

(declare-fun m!889861 () Bool)

(assert (=> b!958561 m!889861))

(check-sat (not start!82334) (not b!958561) tp_is_empty!21145 (not b!958560) (not mapNonEmpty!33697))
(check-sat)
