; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35992 () Bool)

(assert start!35992)

(declare-fun b!361521 () Bool)

(declare-fun e!221405 () Bool)

(declare-fun tp_is_empty!8385 () Bool)

(assert (=> b!361521 (= e!221405 tp_is_empty!8385)))

(declare-fun b!361522 () Bool)

(declare-fun e!221404 () Bool)

(declare-fun e!221402 () Bool)

(declare-fun mapRes!14103 () Bool)

(assert (=> b!361522 (= e!221404 (and e!221402 mapRes!14103))))

(declare-fun condMapEmpty!14103 () Bool)

(declare-datatypes ((V!12157 0))(
  ( (V!12158 (val!4237 Int)) )
))
(declare-datatypes ((ValueCell!3849 0))(
  ( (ValueCellFull!3849 (v!6432 V!12157)) (EmptyCell!3849) )
))
(declare-datatypes ((array!20321 0))(
  ( (array!20322 (arr!9648 (Array (_ BitVec 32) ValueCell!3849)) (size!10000 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20321)

(declare-fun mapDefault!14103 () ValueCell!3849)

(assert (=> b!361522 (= condMapEmpty!14103 (= (arr!9648 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3849)) mapDefault!14103)))))

(declare-fun b!361523 () Bool)

(declare-fun e!221406 () Bool)

(assert (=> b!361523 (= e!221406 false)))

(declare-fun lt!166572 () Bool)

(declare-datatypes ((array!20323 0))(
  ( (array!20324 (arr!9649 (Array (_ BitVec 32) (_ BitVec 64))) (size!10001 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20323)

(declare-datatypes ((List!5508 0))(
  ( (Nil!5505) (Cons!5504 (h!6360 (_ BitVec 64)) (t!10658 List!5508)) )
))
(declare-fun arrayNoDuplicates!0 (array!20323 (_ BitVec 32) List!5508) Bool)

(assert (=> b!361523 (= lt!166572 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5505))))

(declare-fun b!361524 () Bool)

(declare-fun res!201109 () Bool)

(assert (=> b!361524 (=> (not res!201109) (not e!221406))))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20323 (_ BitVec 32)) Bool)

(assert (=> b!361524 (= res!201109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!361525 () Bool)

(assert (=> b!361525 (= e!221402 tp_is_empty!8385)))

(declare-fun mapNonEmpty!14103 () Bool)

(declare-fun tp!28179 () Bool)

(assert (=> mapNonEmpty!14103 (= mapRes!14103 (and tp!28179 e!221405))))

(declare-fun mapValue!14103 () ValueCell!3849)

(declare-fun mapKey!14103 () (_ BitVec 32))

(declare-fun mapRest!14103 () (Array (_ BitVec 32) ValueCell!3849))

(assert (=> mapNonEmpty!14103 (= (arr!9648 _values!1277) (store mapRest!14103 mapKey!14103 mapValue!14103))))

(declare-fun mapIsEmpty!14103 () Bool)

(assert (=> mapIsEmpty!14103 mapRes!14103))

(declare-fun b!361526 () Bool)

(declare-fun res!201110 () Bool)

(assert (=> b!361526 (=> (not res!201110) (not e!221406))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!361526 (= res!201110 (and (= (size!10000 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!10001 _keys!1541) (size!10000 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun res!201108 () Bool)

(assert (=> start!35992 (=> (not res!201108) (not e!221406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35992 (= res!201108 (validMask!0 mask!1943))))

(assert (=> start!35992 e!221406))

(assert (=> start!35992 true))

(declare-fun array_inv!7094 (array!20321) Bool)

(assert (=> start!35992 (and (array_inv!7094 _values!1277) e!221404)))

(declare-fun array_inv!7095 (array!20323) Bool)

(assert (=> start!35992 (array_inv!7095 _keys!1541)))

(assert (= (and start!35992 res!201108) b!361526))

(assert (= (and b!361526 res!201110) b!361524))

(assert (= (and b!361524 res!201109) b!361523))

(assert (= (and b!361522 condMapEmpty!14103) mapIsEmpty!14103))

(assert (= (and b!361522 (not condMapEmpty!14103)) mapNonEmpty!14103))

(get-info :version)

(assert (= (and mapNonEmpty!14103 ((_ is ValueCellFull!3849) mapValue!14103)) b!361521))

(assert (= (and b!361522 ((_ is ValueCellFull!3849) mapDefault!14103)) b!361525))

(assert (= start!35992 b!361522))

(declare-fun m!358321 () Bool)

(assert (=> b!361523 m!358321))

(declare-fun m!358323 () Bool)

(assert (=> b!361524 m!358323))

(declare-fun m!358325 () Bool)

(assert (=> mapNonEmpty!14103 m!358325))

(declare-fun m!358327 () Bool)

(assert (=> start!35992 m!358327))

(declare-fun m!358329 () Bool)

(assert (=> start!35992 m!358329))

(declare-fun m!358331 () Bool)

(assert (=> start!35992 m!358331))

(check-sat (not b!361523) (not mapNonEmpty!14103) (not start!35992) tp_is_empty!8385 (not b!361524))
(check-sat)
