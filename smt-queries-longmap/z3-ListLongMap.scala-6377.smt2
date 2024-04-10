; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82000 () Bool)

(assert start!82000)

(declare-fun b!956383 () Bool)

(declare-fun e!538903 () Bool)

(declare-fun tp_is_empty!21039 () Bool)

(assert (=> b!956383 (= e!538903 tp_is_empty!21039)))

(declare-fun res!640372 () Bool)

(declare-fun e!538899 () Bool)

(assert (=> start!82000 (=> (not res!640372) (not e!538899))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82000 (= res!640372 (validMask!0 mask!1823))))

(assert (=> start!82000 e!538899))

(assert (=> start!82000 true))

(declare-datatypes ((V!33035 0))(
  ( (V!33036 (val!10570 Int)) )
))
(declare-datatypes ((ValueCell!10038 0))(
  ( (ValueCellFull!10038 (v!13125 V!33035)) (EmptyCell!10038) )
))
(declare-datatypes ((array!58175 0))(
  ( (array!58176 (arr!27967 (Array (_ BitVec 32) ValueCell!10038)) (size!28446 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58175)

(declare-fun e!538901 () Bool)

(declare-fun array_inv!21699 (array!58175) Bool)

(assert (=> start!82000 (and (array_inv!21699 _values!1197) e!538901)))

(declare-datatypes ((array!58177 0))(
  ( (array!58178 (arr!27968 (Array (_ BitVec 32) (_ BitVec 64))) (size!28447 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58177)

(declare-fun array_inv!21700 (array!58177) Bool)

(assert (=> start!82000 (array_inv!21700 _keys!1441)))

(declare-fun b!956384 () Bool)

(declare-fun mapRes!33520 () Bool)

(assert (=> b!956384 (= e!538901 (and e!538903 mapRes!33520))))

(declare-fun condMapEmpty!33520 () Bool)

(declare-fun mapDefault!33520 () ValueCell!10038)

(assert (=> b!956384 (= condMapEmpty!33520 (= (arr!27967 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10038)) mapDefault!33520)))))

(declare-fun mapIsEmpty!33520 () Bool)

(assert (=> mapIsEmpty!33520 mapRes!33520))

(declare-fun b!956385 () Bool)

(declare-fun res!640374 () Bool)

(assert (=> b!956385 (=> (not res!640374) (not e!538899))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!956385 (= res!640374 (and (= (size!28446 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28447 _keys!1441) (size!28446 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33520 () Bool)

(declare-fun tp!64098 () Bool)

(declare-fun e!538900 () Bool)

(assert (=> mapNonEmpty!33520 (= mapRes!33520 (and tp!64098 e!538900))))

(declare-fun mapKey!33520 () (_ BitVec 32))

(declare-fun mapRest!33520 () (Array (_ BitVec 32) ValueCell!10038))

(declare-fun mapValue!33520 () ValueCell!10038)

(assert (=> mapNonEmpty!33520 (= (arr!27967 _values!1197) (store mapRest!33520 mapKey!33520 mapValue!33520))))

(declare-fun b!956386 () Bool)

(assert (=> b!956386 (= e!538900 tp_is_empty!21039)))

(declare-fun b!956387 () Bool)

(declare-fun res!640373 () Bool)

(assert (=> b!956387 (=> (not res!640373) (not e!538899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58177 (_ BitVec 32)) Bool)

(assert (=> b!956387 (= res!640373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!956388 () Bool)

(assert (=> b!956388 (= e!538899 false)))

(declare-fun lt!430136 () Bool)

(declare-datatypes ((List!19479 0))(
  ( (Nil!19476) (Cons!19475 (h!20637 (_ BitVec 64)) (t!27840 List!19479)) )
))
(declare-fun arrayNoDuplicates!0 (array!58177 (_ BitVec 32) List!19479) Bool)

(assert (=> b!956388 (= lt!430136 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19476))))

(assert (= (and start!82000 res!640372) b!956385))

(assert (= (and b!956385 res!640374) b!956387))

(assert (= (and b!956387 res!640373) b!956388))

(assert (= (and b!956384 condMapEmpty!33520) mapIsEmpty!33520))

(assert (= (and b!956384 (not condMapEmpty!33520)) mapNonEmpty!33520))

(get-info :version)

(assert (= (and mapNonEmpty!33520 ((_ is ValueCellFull!10038) mapValue!33520)) b!956386))

(assert (= (and b!956384 ((_ is ValueCellFull!10038) mapDefault!33520)) b!956383))

(assert (= start!82000 b!956384))

(declare-fun m!887681 () Bool)

(assert (=> start!82000 m!887681))

(declare-fun m!887683 () Bool)

(assert (=> start!82000 m!887683))

(declare-fun m!887685 () Bool)

(assert (=> start!82000 m!887685))

(declare-fun m!887687 () Bool)

(assert (=> mapNonEmpty!33520 m!887687))

(declare-fun m!887689 () Bool)

(assert (=> b!956387 m!887689))

(declare-fun m!887691 () Bool)

(assert (=> b!956388 m!887691))

(check-sat (not b!956388) (not mapNonEmpty!33520) (not start!82000) (not b!956387) tp_is_empty!21039)
(check-sat)
