; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35970 () Bool)

(assert start!35970)

(declare-fun b!361396 () Bool)

(declare-fun e!221308 () Bool)

(declare-fun e!221311 () Bool)

(declare-fun mapRes!14091 () Bool)

(assert (=> b!361396 (= e!221308 (and e!221311 mapRes!14091))))

(declare-fun condMapEmpty!14091 () Bool)

(declare-datatypes ((V!12147 0))(
  ( (V!12148 (val!4233 Int)) )
))
(declare-datatypes ((ValueCell!3845 0))(
  ( (ValueCellFull!3845 (v!6429 V!12147)) (EmptyCell!3845) )
))
(declare-datatypes ((array!20292 0))(
  ( (array!20293 (arr!9633 (Array (_ BitVec 32) ValueCell!3845)) (size!9985 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20292)

(declare-fun mapDefault!14091 () ValueCell!3845)

(assert (=> b!361396 (= condMapEmpty!14091 (= (arr!9633 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3845)) mapDefault!14091)))))

(declare-fun b!361397 () Bool)

(declare-fun tp_is_empty!8377 () Bool)

(assert (=> b!361397 (= e!221311 tp_is_empty!8377)))

(declare-fun b!361398 () Bool)

(declare-fun e!221310 () Bool)

(assert (=> b!361398 (= e!221310 tp_is_empty!8377)))

(declare-fun mapIsEmpty!14091 () Bool)

(assert (=> mapIsEmpty!14091 mapRes!14091))

(declare-fun res!201071 () Bool)

(declare-fun e!221312 () Bool)

(assert (=> start!35970 (=> (not res!201071) (not e!221312))))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35970 (= res!201071 (validMask!0 mask!1943))))

(assert (=> start!35970 e!221312))

(assert (=> start!35970 true))

(declare-fun array_inv!7114 (array!20292) Bool)

(assert (=> start!35970 (and (array_inv!7114 _values!1277) e!221308)))

(declare-datatypes ((array!20294 0))(
  ( (array!20295 (arr!9634 (Array (_ BitVec 32) (_ BitVec 64))) (size!9986 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20294)

(declare-fun array_inv!7115 (array!20294) Bool)

(assert (=> start!35970 (array_inv!7115 _keys!1541)))

(declare-fun b!361399 () Bool)

(declare-fun res!201070 () Bool)

(assert (=> b!361399 (=> (not res!201070) (not e!221312))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!361399 (= res!201070 (and (= (size!9985 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9986 _keys!1541) (size!9985 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun b!361400 () Bool)

(declare-fun res!201069 () Bool)

(assert (=> b!361400 (=> (not res!201069) (not e!221312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20294 (_ BitVec 32)) Bool)

(assert (=> b!361400 (= res!201069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!361401 () Bool)

(assert (=> b!361401 (= e!221312 false)))

(declare-fun lt!166578 () Bool)

(declare-datatypes ((List!5418 0))(
  ( (Nil!5415) (Cons!5414 (h!6270 (_ BitVec 64)) (t!10560 List!5418)) )
))
(declare-fun arrayNoDuplicates!0 (array!20294 (_ BitVec 32) List!5418) Bool)

(assert (=> b!361401 (= lt!166578 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5415))))

(declare-fun mapNonEmpty!14091 () Bool)

(declare-fun tp!28167 () Bool)

(assert (=> mapNonEmpty!14091 (= mapRes!14091 (and tp!28167 e!221310))))

(declare-fun mapValue!14091 () ValueCell!3845)

(declare-fun mapKey!14091 () (_ BitVec 32))

(declare-fun mapRest!14091 () (Array (_ BitVec 32) ValueCell!3845))

(assert (=> mapNonEmpty!14091 (= (arr!9633 _values!1277) (store mapRest!14091 mapKey!14091 mapValue!14091))))

(assert (= (and start!35970 res!201071) b!361399))

(assert (= (and b!361399 res!201070) b!361400))

(assert (= (and b!361400 res!201069) b!361401))

(assert (= (and b!361396 condMapEmpty!14091) mapIsEmpty!14091))

(assert (= (and b!361396 (not condMapEmpty!14091)) mapNonEmpty!14091))

(get-info :version)

(assert (= (and mapNonEmpty!14091 ((_ is ValueCellFull!3845) mapValue!14091)) b!361398))

(assert (= (and b!361396 ((_ is ValueCellFull!3845) mapDefault!14091)) b!361397))

(assert (= start!35970 b!361396))

(declare-fun m!358497 () Bool)

(assert (=> start!35970 m!358497))

(declare-fun m!358499 () Bool)

(assert (=> start!35970 m!358499))

(declare-fun m!358501 () Bool)

(assert (=> start!35970 m!358501))

(declare-fun m!358503 () Bool)

(assert (=> b!361400 m!358503))

(declare-fun m!358505 () Bool)

(assert (=> b!361401 m!358505))

(declare-fun m!358507 () Bool)

(assert (=> mapNonEmpty!14091 m!358507))

(check-sat (not start!35970) (not b!361401) tp_is_empty!8377 (not mapNonEmpty!14091) (not b!361400))
(check-sat)
