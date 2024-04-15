; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41368 () Bool)

(assert start!41368)

(declare-fun mapIsEmpty!20419 () Bool)

(declare-fun mapRes!20419 () Bool)

(assert (=> mapIsEmpty!20419 mapRes!20419))

(declare-fun b!462238 () Bool)

(declare-fun res!276473 () Bool)

(declare-fun e!269731 () Bool)

(assert (=> b!462238 (=> (not res!276473) (not e!269731))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28793 0))(
  ( (array!28794 (arr!13830 (Array (_ BitVec 32) (_ BitVec 64))) (size!14183 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28793)

(declare-datatypes ((V!17771 0))(
  ( (V!17772 (val!6294 Int)) )
))
(declare-datatypes ((ValueCell!5906 0))(
  ( (ValueCellFull!5906 (v!8575 V!17771)) (EmptyCell!5906) )
))
(declare-datatypes ((array!28795 0))(
  ( (array!28796 (arr!13831 (Array (_ BitVec 32) ValueCell!5906)) (size!14184 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28795)

(assert (=> b!462238 (= res!276473 (and (= (size!14184 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14183 _keys!1025) (size!14184 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462239 () Bool)

(declare-fun e!269732 () Bool)

(declare-fun tp_is_empty!12499 () Bool)

(assert (=> b!462239 (= e!269732 tp_is_empty!12499)))

(declare-fun b!462240 () Bool)

(declare-fun e!269733 () Bool)

(declare-fun e!269730 () Bool)

(assert (=> b!462240 (= e!269733 (and e!269730 mapRes!20419))))

(declare-fun condMapEmpty!20419 () Bool)

(declare-fun mapDefault!20419 () ValueCell!5906)

(assert (=> b!462240 (= condMapEmpty!20419 (= (arr!13831 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5906)) mapDefault!20419)))))

(declare-fun b!462241 () Bool)

(assert (=> b!462241 (= e!269730 tp_is_empty!12499)))

(declare-fun mapNonEmpty!20419 () Bool)

(declare-fun tp!39238 () Bool)

(assert (=> mapNonEmpty!20419 (= mapRes!20419 (and tp!39238 e!269732))))

(declare-fun mapValue!20419 () ValueCell!5906)

(declare-fun mapKey!20419 () (_ BitVec 32))

(declare-fun mapRest!20419 () (Array (_ BitVec 32) ValueCell!5906))

(assert (=> mapNonEmpty!20419 (= (arr!13831 _values!833) (store mapRest!20419 mapKey!20419 mapValue!20419))))

(declare-fun res!276472 () Bool)

(assert (=> start!41368 (=> (not res!276472) (not e!269731))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41368 (= res!276472 (validMask!0 mask!1365))))

(assert (=> start!41368 e!269731))

(assert (=> start!41368 true))

(declare-fun array_inv!10072 (array!28793) Bool)

(assert (=> start!41368 (array_inv!10072 _keys!1025)))

(declare-fun array_inv!10073 (array!28795) Bool)

(assert (=> start!41368 (and (array_inv!10073 _values!833) e!269733)))

(declare-fun b!462242 () Bool)

(declare-fun res!276471 () Bool)

(assert (=> b!462242 (=> (not res!276471) (not e!269731))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28793 (_ BitVec 32)) Bool)

(assert (=> b!462242 (= res!276471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462243 () Bool)

(assert (=> b!462243 (= e!269731 false)))

(declare-fun lt!208988 () Bool)

(declare-datatypes ((List!8367 0))(
  ( (Nil!8364) (Cons!8363 (h!9219 (_ BitVec 64)) (t!14302 List!8367)) )
))
(declare-fun arrayNoDuplicates!0 (array!28793 (_ BitVec 32) List!8367) Bool)

(assert (=> b!462243 (= lt!208988 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8364))))

(assert (= (and start!41368 res!276472) b!462238))

(assert (= (and b!462238 res!276473) b!462242))

(assert (= (and b!462242 res!276471) b!462243))

(assert (= (and b!462240 condMapEmpty!20419) mapIsEmpty!20419))

(assert (= (and b!462240 (not condMapEmpty!20419)) mapNonEmpty!20419))

(get-info :version)

(assert (= (and mapNonEmpty!20419 ((_ is ValueCellFull!5906) mapValue!20419)) b!462239))

(assert (= (and b!462240 ((_ is ValueCellFull!5906) mapDefault!20419)) b!462241))

(assert (= start!41368 b!462240))

(declare-fun m!444691 () Bool)

(assert (=> mapNonEmpty!20419 m!444691))

(declare-fun m!444693 () Bool)

(assert (=> start!41368 m!444693))

(declare-fun m!444695 () Bool)

(assert (=> start!41368 m!444695))

(declare-fun m!444697 () Bool)

(assert (=> start!41368 m!444697))

(declare-fun m!444699 () Bool)

(assert (=> b!462242 m!444699))

(declare-fun m!444701 () Bool)

(assert (=> b!462243 m!444701))

(check-sat tp_is_empty!12499 (not b!462242) (not start!41368) (not b!462243) (not mapNonEmpty!20419))
(check-sat)
