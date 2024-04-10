; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35986 () Bool)

(assert start!35986)

(declare-fun b!361467 () Bool)

(declare-fun e!221360 () Bool)

(declare-fun tp_is_empty!8379 () Bool)

(assert (=> b!361467 (= e!221360 tp_is_empty!8379)))

(declare-fun b!361468 () Bool)

(declare-fun res!201083 () Bool)

(declare-fun e!221359 () Bool)

(assert (=> b!361468 (=> (not res!201083) (not e!221359))))

(declare-datatypes ((array!20311 0))(
  ( (array!20312 (arr!9643 (Array (_ BitVec 32) (_ BitVec 64))) (size!9995 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20311)

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20311 (_ BitVec 32)) Bool)

(assert (=> b!361468 (= res!201083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!361469 () Bool)

(declare-fun e!221361 () Bool)

(declare-fun mapRes!14094 () Bool)

(assert (=> b!361469 (= e!221361 (and e!221360 mapRes!14094))))

(declare-fun condMapEmpty!14094 () Bool)

(declare-datatypes ((V!12149 0))(
  ( (V!12150 (val!4234 Int)) )
))
(declare-datatypes ((ValueCell!3846 0))(
  ( (ValueCellFull!3846 (v!6429 V!12149)) (EmptyCell!3846) )
))
(declare-datatypes ((array!20313 0))(
  ( (array!20314 (arr!9644 (Array (_ BitVec 32) ValueCell!3846)) (size!9996 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20313)

(declare-fun mapDefault!14094 () ValueCell!3846)

(assert (=> b!361469 (= condMapEmpty!14094 (= (arr!9644 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3846)) mapDefault!14094)))))

(declare-fun res!201081 () Bool)

(assert (=> start!35986 (=> (not res!201081) (not e!221359))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35986 (= res!201081 (validMask!0 mask!1943))))

(assert (=> start!35986 e!221359))

(assert (=> start!35986 true))

(declare-fun array_inv!7090 (array!20313) Bool)

(assert (=> start!35986 (and (array_inv!7090 _values!1277) e!221361)))

(declare-fun array_inv!7091 (array!20311) Bool)

(assert (=> start!35986 (array_inv!7091 _keys!1541)))

(declare-fun b!361470 () Bool)

(declare-fun e!221358 () Bool)

(assert (=> b!361470 (= e!221358 tp_is_empty!8379)))

(declare-fun b!361471 () Bool)

(declare-fun res!201082 () Bool)

(assert (=> b!361471 (=> (not res!201082) (not e!221359))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!361471 (= res!201082 (and (= (size!9996 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9995 _keys!1541) (size!9996 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!14094 () Bool)

(declare-fun tp!28170 () Bool)

(assert (=> mapNonEmpty!14094 (= mapRes!14094 (and tp!28170 e!221358))))

(declare-fun mapKey!14094 () (_ BitVec 32))

(declare-fun mapRest!14094 () (Array (_ BitVec 32) ValueCell!3846))

(declare-fun mapValue!14094 () ValueCell!3846)

(assert (=> mapNonEmpty!14094 (= (arr!9644 _values!1277) (store mapRest!14094 mapKey!14094 mapValue!14094))))

(declare-fun b!361472 () Bool)

(assert (=> b!361472 (= e!221359 false)))

(declare-fun lt!166563 () Bool)

(declare-datatypes ((List!5507 0))(
  ( (Nil!5504) (Cons!5503 (h!6359 (_ BitVec 64)) (t!10657 List!5507)) )
))
(declare-fun arrayNoDuplicates!0 (array!20311 (_ BitVec 32) List!5507) Bool)

(assert (=> b!361472 (= lt!166563 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5504))))

(declare-fun mapIsEmpty!14094 () Bool)

(assert (=> mapIsEmpty!14094 mapRes!14094))

(assert (= (and start!35986 res!201081) b!361471))

(assert (= (and b!361471 res!201082) b!361468))

(assert (= (and b!361468 res!201083) b!361472))

(assert (= (and b!361469 condMapEmpty!14094) mapIsEmpty!14094))

(assert (= (and b!361469 (not condMapEmpty!14094)) mapNonEmpty!14094))

(get-info :version)

(assert (= (and mapNonEmpty!14094 ((_ is ValueCellFull!3846) mapValue!14094)) b!361470))

(assert (= (and b!361469 ((_ is ValueCellFull!3846) mapDefault!14094)) b!361467))

(assert (= start!35986 b!361469))

(declare-fun m!358285 () Bool)

(assert (=> b!361468 m!358285))

(declare-fun m!358287 () Bool)

(assert (=> start!35986 m!358287))

(declare-fun m!358289 () Bool)

(assert (=> start!35986 m!358289))

(declare-fun m!358291 () Bool)

(assert (=> start!35986 m!358291))

(declare-fun m!358293 () Bool)

(assert (=> mapNonEmpty!14094 m!358293))

(declare-fun m!358295 () Bool)

(assert (=> b!361472 m!358295))

(check-sat (not b!361472) (not mapNonEmpty!14094) (not start!35986) tp_is_empty!8379 (not b!361468))
(check-sat)
