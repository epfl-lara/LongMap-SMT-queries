; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82154 () Bool)

(assert start!82154)

(declare-fun b!957160 () Bool)

(declare-fun res!640655 () Bool)

(declare-fun e!539380 () Bool)

(assert (=> b!957160 (=> (not res!640655) (not e!539380))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((array!58196 0))(
  ( (array!58197 (arr!27973 (Array (_ BitVec 32) (_ BitVec 64))) (size!28453 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58196)

(declare-datatypes ((V!33017 0))(
  ( (V!33018 (val!10563 Int)) )
))
(declare-datatypes ((ValueCell!10031 0))(
  ( (ValueCellFull!10031 (v!13115 V!33017)) (EmptyCell!10031) )
))
(declare-datatypes ((array!58198 0))(
  ( (array!58199 (arr!27974 (Array (_ BitVec 32) ValueCell!10031)) (size!28454 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58198)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!957160 (= res!640655 (and (= (size!28454 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28453 _keys!1441) (size!28454 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!957161 () Bool)

(declare-fun e!539379 () Bool)

(declare-fun e!539378 () Bool)

(declare-fun mapRes!33499 () Bool)

(assert (=> b!957161 (= e!539379 (and e!539378 mapRes!33499))))

(declare-fun condMapEmpty!33499 () Bool)

(declare-fun mapDefault!33499 () ValueCell!10031)

(assert (=> b!957161 (= condMapEmpty!33499 (= (arr!27974 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10031)) mapDefault!33499)))))

(declare-fun mapNonEmpty!33499 () Bool)

(declare-fun tp!64078 () Bool)

(declare-fun e!539377 () Bool)

(assert (=> mapNonEmpty!33499 (= mapRes!33499 (and tp!64078 e!539377))))

(declare-fun mapRest!33499 () (Array (_ BitVec 32) ValueCell!10031))

(declare-fun mapKey!33499 () (_ BitVec 32))

(declare-fun mapValue!33499 () ValueCell!10031)

(assert (=> mapNonEmpty!33499 (= (arr!27974 _values!1197) (store mapRest!33499 mapKey!33499 mapValue!33499))))

(declare-fun mapIsEmpty!33499 () Bool)

(assert (=> mapIsEmpty!33499 mapRes!33499))

(declare-fun b!957162 () Bool)

(assert (=> b!957162 (= e!539380 false)))

(declare-fun lt!430476 () Bool)

(declare-datatypes ((List!19473 0))(
  ( (Nil!19470) (Cons!19469 (h!20637 (_ BitVec 64)) (t!27826 List!19473)) )
))
(declare-fun arrayNoDuplicates!0 (array!58196 (_ BitVec 32) List!19473) Bool)

(assert (=> b!957162 (= lt!430476 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19470))))

(declare-fun b!957164 () Bool)

(declare-fun res!640653 () Bool)

(assert (=> b!957164 (=> (not res!640653) (not e!539380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58196 (_ BitVec 32)) Bool)

(assert (=> b!957164 (= res!640653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!957165 () Bool)

(declare-fun tp_is_empty!21025 () Bool)

(assert (=> b!957165 (= e!539377 tp_is_empty!21025)))

(declare-fun res!640654 () Bool)

(assert (=> start!82154 (=> (not res!640654) (not e!539380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82154 (= res!640654 (validMask!0 mask!1823))))

(assert (=> start!82154 e!539380))

(assert (=> start!82154 true))

(declare-fun array_inv!21781 (array!58198) Bool)

(assert (=> start!82154 (and (array_inv!21781 _values!1197) e!539379)))

(declare-fun array_inv!21782 (array!58196) Bool)

(assert (=> start!82154 (array_inv!21782 _keys!1441)))

(declare-fun b!957163 () Bool)

(assert (=> b!957163 (= e!539378 tp_is_empty!21025)))

(assert (= (and start!82154 res!640654) b!957160))

(assert (= (and b!957160 res!640655) b!957164))

(assert (= (and b!957164 res!640653) b!957162))

(assert (= (and b!957161 condMapEmpty!33499) mapIsEmpty!33499))

(assert (= (and b!957161 (not condMapEmpty!33499)) mapNonEmpty!33499))

(get-info :version)

(assert (= (and mapNonEmpty!33499 ((_ is ValueCellFull!10031) mapValue!33499)) b!957165))

(assert (= (and b!957161 ((_ is ValueCellFull!10031) mapDefault!33499)) b!957163))

(assert (= start!82154 b!957161))

(declare-fun m!888891 () Bool)

(assert (=> mapNonEmpty!33499 m!888891))

(declare-fun m!888893 () Bool)

(assert (=> b!957162 m!888893))

(declare-fun m!888895 () Bool)

(assert (=> b!957164 m!888895))

(declare-fun m!888897 () Bool)

(assert (=> start!82154 m!888897))

(declare-fun m!888899 () Bool)

(assert (=> start!82154 m!888899))

(declare-fun m!888901 () Bool)

(assert (=> start!82154 m!888901))

(check-sat (not start!82154) (not mapNonEmpty!33499) tp_is_empty!21025 (not b!957164) (not b!957162))
(check-sat)
