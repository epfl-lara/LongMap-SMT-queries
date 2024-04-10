; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81976 () Bool)

(assert start!81976)

(declare-fun b!956167 () Bool)

(declare-fun res!640266 () Bool)

(declare-fun e!538721 () Bool)

(assert (=> b!956167 (=> (not res!640266) (not e!538721))))

(declare-datatypes ((array!58129 0))(
  ( (array!58130 (arr!27944 (Array (_ BitVec 32) (_ BitVec 64))) (size!28423 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58129)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58129 (_ BitVec 32)) Bool)

(assert (=> b!956167 (= res!640266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!956168 () Bool)

(declare-fun e!538723 () Bool)

(declare-fun tp_is_empty!21015 () Bool)

(assert (=> b!956168 (= e!538723 tp_is_empty!21015)))

(declare-fun res!640265 () Bool)

(assert (=> start!81976 (=> (not res!640265) (not e!538721))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81976 (= res!640265 (validMask!0 mask!1823))))

(assert (=> start!81976 e!538721))

(assert (=> start!81976 true))

(declare-datatypes ((V!33003 0))(
  ( (V!33004 (val!10558 Int)) )
))
(declare-datatypes ((ValueCell!10026 0))(
  ( (ValueCellFull!10026 (v!13113 V!33003)) (EmptyCell!10026) )
))
(declare-datatypes ((array!58131 0))(
  ( (array!58132 (arr!27945 (Array (_ BitVec 32) ValueCell!10026)) (size!28424 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58131)

(declare-fun e!538720 () Bool)

(declare-fun array_inv!21683 (array!58131) Bool)

(assert (=> start!81976 (and (array_inv!21683 _values!1197) e!538720)))

(declare-fun array_inv!21684 (array!58129) Bool)

(assert (=> start!81976 (array_inv!21684 _keys!1441)))

(declare-fun b!956169 () Bool)

(assert (=> b!956169 (= e!538721 false)))

(declare-fun lt!430100 () Bool)

(declare-datatypes ((List!19470 0))(
  ( (Nil!19467) (Cons!19466 (h!20628 (_ BitVec 64)) (t!27831 List!19470)) )
))
(declare-fun arrayNoDuplicates!0 (array!58129 (_ BitVec 32) List!19470) Bool)

(assert (=> b!956169 (= lt!430100 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19467))))

(declare-fun b!956170 () Bool)

(declare-fun res!640264 () Bool)

(assert (=> b!956170 (=> (not res!640264) (not e!538721))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!956170 (= res!640264 (and (= (size!28424 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28423 _keys!1441) (size!28424 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33484 () Bool)

(declare-fun mapRes!33484 () Bool)

(declare-fun tp!64062 () Bool)

(assert (=> mapNonEmpty!33484 (= mapRes!33484 (and tp!64062 e!538723))))

(declare-fun mapValue!33484 () ValueCell!10026)

(declare-fun mapKey!33484 () (_ BitVec 32))

(declare-fun mapRest!33484 () (Array (_ BitVec 32) ValueCell!10026))

(assert (=> mapNonEmpty!33484 (= (arr!27945 _values!1197) (store mapRest!33484 mapKey!33484 mapValue!33484))))

(declare-fun b!956171 () Bool)

(declare-fun e!538719 () Bool)

(assert (=> b!956171 (= e!538719 tp_is_empty!21015)))

(declare-fun mapIsEmpty!33484 () Bool)

(assert (=> mapIsEmpty!33484 mapRes!33484))

(declare-fun b!956172 () Bool)

(assert (=> b!956172 (= e!538720 (and e!538719 mapRes!33484))))

(declare-fun condMapEmpty!33484 () Bool)

(declare-fun mapDefault!33484 () ValueCell!10026)

(assert (=> b!956172 (= condMapEmpty!33484 (= (arr!27945 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10026)) mapDefault!33484)))))

(assert (= (and start!81976 res!640265) b!956170))

(assert (= (and b!956170 res!640264) b!956167))

(assert (= (and b!956167 res!640266) b!956169))

(assert (= (and b!956172 condMapEmpty!33484) mapIsEmpty!33484))

(assert (= (and b!956172 (not condMapEmpty!33484)) mapNonEmpty!33484))

(get-info :version)

(assert (= (and mapNonEmpty!33484 ((_ is ValueCellFull!10026) mapValue!33484)) b!956168))

(assert (= (and b!956172 ((_ is ValueCellFull!10026) mapDefault!33484)) b!956171))

(assert (= start!81976 b!956172))

(declare-fun m!887537 () Bool)

(assert (=> b!956167 m!887537))

(declare-fun m!887539 () Bool)

(assert (=> start!81976 m!887539))

(declare-fun m!887541 () Bool)

(assert (=> start!81976 m!887541))

(declare-fun m!887543 () Bool)

(assert (=> start!81976 m!887543))

(declare-fun m!887545 () Bool)

(assert (=> b!956169 m!887545))

(declare-fun m!887547 () Bool)

(assert (=> mapNonEmpty!33484 m!887547))

(check-sat (not mapNonEmpty!33484) (not b!956167) tp_is_empty!21015 (not start!81976) (not b!956169))
(check-sat)
