; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35670 () Bool)

(assert start!35670)

(declare-fun mapIsEmpty!13713 () Bool)

(declare-fun mapRes!13713 () Bool)

(assert (=> mapIsEmpty!13713 mapRes!13713))

(declare-fun mapNonEmpty!13713 () Bool)

(declare-fun tp!27771 () Bool)

(declare-fun e!219229 () Bool)

(assert (=> mapNonEmpty!13713 (= mapRes!13713 (and tp!27771 e!219229))))

(declare-fun mapKey!13713 () (_ BitVec 32))

(declare-datatypes ((V!11827 0))(
  ( (V!11828 (val!4113 Int)) )
))
(declare-datatypes ((ValueCell!3725 0))(
  ( (ValueCellFull!3725 (v!6301 V!11827)) (EmptyCell!3725) )
))
(declare-fun mapRest!13713 () (Array (_ BitVec 32) ValueCell!3725))

(declare-fun mapValue!13713 () ValueCell!3725)

(declare-datatypes ((array!19823 0))(
  ( (array!19824 (arr!9405 (Array (_ BitVec 32) ValueCell!3725)) (size!9758 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19823)

(assert (=> mapNonEmpty!13713 (= (arr!9405 _values!1208) (store mapRest!13713 mapKey!13713 mapValue!13713))))

(declare-fun b!358170 () Bool)

(declare-fun e!219228 () Bool)

(declare-fun e!219230 () Bool)

(assert (=> b!358170 (= e!219228 (and e!219230 mapRes!13713))))

(declare-fun condMapEmpty!13713 () Bool)

(declare-fun mapDefault!13713 () ValueCell!3725)

(assert (=> b!358170 (= condMapEmpty!13713 (= (arr!9405 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3725)) mapDefault!13713)))))

(declare-fun b!358172 () Bool)

(declare-fun tp_is_empty!8137 () Bool)

(assert (=> b!358172 (= e!219230 tp_is_empty!8137)))

(declare-fun b!358173 () Bool)

(assert (=> b!358173 (= e!219229 tp_is_empty!8137)))

(declare-fun b!358171 () Bool)

(declare-fun e!219227 () Bool)

(assert (=> b!358171 (= e!219227 false)))

(declare-fun lt!165958 () Bool)

(declare-datatypes ((array!19825 0))(
  ( (array!19826 (arr!9406 (Array (_ BitVec 32) (_ BitVec 64))) (size!9759 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19825)

(declare-datatypes ((List!5397 0))(
  ( (Nil!5394) (Cons!5393 (h!6249 (_ BitVec 64)) (t!10538 List!5397)) )
))
(declare-fun arrayNoDuplicates!0 (array!19825 (_ BitVec 32) List!5397) Bool)

(assert (=> b!358171 (= lt!165958 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5394))))

(declare-fun res!199104 () Bool)

(assert (=> start!35670 (=> (not res!199104) (not e!219227))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35670 (= res!199104 (validMask!0 mask!1842))))

(assert (=> start!35670 e!219227))

(assert (=> start!35670 true))

(declare-fun array_inv!6938 (array!19823) Bool)

(assert (=> start!35670 (and (array_inv!6938 _values!1208) e!219228)))

(declare-fun array_inv!6939 (array!19825) Bool)

(assert (=> start!35670 (array_inv!6939 _keys!1456)))

(declare-fun b!358174 () Bool)

(declare-fun res!199103 () Bool)

(assert (=> b!358174 (=> (not res!199103) (not e!219227))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19825 (_ BitVec 32)) Bool)

(assert (=> b!358174 (= res!199103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!358175 () Bool)

(declare-fun res!199105 () Bool)

(assert (=> b!358175 (=> (not res!199105) (not e!219227))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358175 (= res!199105 (and (= (size!9758 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9759 _keys!1456) (size!9758 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(assert (= (and start!35670 res!199104) b!358175))

(assert (= (and b!358175 res!199105) b!358174))

(assert (= (and b!358174 res!199103) b!358171))

(assert (= (and b!358170 condMapEmpty!13713) mapIsEmpty!13713))

(assert (= (and b!358170 (not condMapEmpty!13713)) mapNonEmpty!13713))

(get-info :version)

(assert (= (and mapNonEmpty!13713 ((_ is ValueCellFull!3725) mapValue!13713)) b!358173))

(assert (= (and b!358170 ((_ is ValueCellFull!3725) mapDefault!13713)) b!358172))

(assert (= start!35670 b!358170))

(declare-fun m!355545 () Bool)

(assert (=> mapNonEmpty!13713 m!355545))

(declare-fun m!355547 () Bool)

(assert (=> b!358171 m!355547))

(declare-fun m!355549 () Bool)

(assert (=> start!35670 m!355549))

(declare-fun m!355551 () Bool)

(assert (=> start!35670 m!355551))

(declare-fun m!355553 () Bool)

(assert (=> start!35670 m!355553))

(declare-fun m!355555 () Bool)

(assert (=> b!358174 m!355555))

(check-sat (not b!358171) (not start!35670) (not mapNonEmpty!13713) (not b!358174) tp_is_empty!8137)
(check-sat)
