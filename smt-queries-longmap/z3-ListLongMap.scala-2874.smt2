; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41366 () Bool)

(assert start!41366)

(declare-fun mapNonEmpty!20395 () Bool)

(declare-fun mapRes!20395 () Bool)

(declare-fun tp!39214 () Bool)

(declare-fun e!269783 () Bool)

(assert (=> mapNonEmpty!20395 (= mapRes!20395 (and tp!39214 e!269783))))

(declare-fun mapKey!20395 () (_ BitVec 32))

(declare-datatypes ((V!17749 0))(
  ( (V!17750 (val!6286 Int)) )
))
(declare-datatypes ((ValueCell!5898 0))(
  ( (ValueCellFull!5898 (v!8573 V!17749)) (EmptyCell!5898) )
))
(declare-datatypes ((array!28767 0))(
  ( (array!28768 (arr!13817 (Array (_ BitVec 32) ValueCell!5898)) (size!14169 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28767)

(declare-fun mapValue!20395 () ValueCell!5898)

(declare-fun mapRest!20395 () (Array (_ BitVec 32) ValueCell!5898))

(assert (=> mapNonEmpty!20395 (= (arr!13817 _values!833) (store mapRest!20395 mapKey!20395 mapValue!20395))))

(declare-fun b!462366 () Bool)

(declare-fun e!269785 () Bool)

(declare-fun tp_is_empty!12483 () Bool)

(assert (=> b!462366 (= e!269785 tp_is_empty!12483)))

(declare-fun b!462367 () Bool)

(declare-fun res!276529 () Bool)

(declare-fun e!269784 () Bool)

(assert (=> b!462367 (=> (not res!276529) (not e!269784))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28769 0))(
  ( (array!28770 (arr!13818 (Array (_ BitVec 32) (_ BitVec 64))) (size!14170 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28769)

(assert (=> b!462367 (= res!276529 (and (= (size!14169 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14170 _keys!1025) (size!14169 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462368 () Bool)

(declare-fun res!276530 () Bool)

(assert (=> b!462368 (=> (not res!276530) (not e!269784))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28769 (_ BitVec 32)) Bool)

(assert (=> b!462368 (= res!276530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462365 () Bool)

(declare-fun e!269786 () Bool)

(assert (=> b!462365 (= e!269786 (and e!269785 mapRes!20395))))

(declare-fun condMapEmpty!20395 () Bool)

(declare-fun mapDefault!20395 () ValueCell!5898)

(assert (=> b!462365 (= condMapEmpty!20395 (= (arr!13817 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5898)) mapDefault!20395)))))

(declare-fun res!276528 () Bool)

(assert (=> start!41366 (=> (not res!276528) (not e!269784))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41366 (= res!276528 (validMask!0 mask!1365))))

(assert (=> start!41366 e!269784))

(assert (=> start!41366 true))

(declare-fun array_inv!9992 (array!28769) Bool)

(assert (=> start!41366 (array_inv!9992 _keys!1025)))

(declare-fun array_inv!9993 (array!28767) Bool)

(assert (=> start!41366 (and (array_inv!9993 _values!833) e!269786)))

(declare-fun b!462369 () Bool)

(assert (=> b!462369 (= e!269783 tp_is_empty!12483)))

(declare-fun b!462370 () Bool)

(assert (=> b!462370 (= e!269784 false)))

(declare-fun lt!209198 () Bool)

(declare-datatypes ((List!8341 0))(
  ( (Nil!8338) (Cons!8337 (h!9193 (_ BitVec 64)) (t!14285 List!8341)) )
))
(declare-fun arrayNoDuplicates!0 (array!28769 (_ BitVec 32) List!8341) Bool)

(assert (=> b!462370 (= lt!209198 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8338))))

(declare-fun mapIsEmpty!20395 () Bool)

(assert (=> mapIsEmpty!20395 mapRes!20395))

(assert (= (and start!41366 res!276528) b!462367))

(assert (= (and b!462367 res!276529) b!462368))

(assert (= (and b!462368 res!276530) b!462370))

(assert (= (and b!462365 condMapEmpty!20395) mapIsEmpty!20395))

(assert (= (and b!462365 (not condMapEmpty!20395)) mapNonEmpty!20395))

(get-info :version)

(assert (= (and mapNonEmpty!20395 ((_ is ValueCellFull!5898) mapValue!20395)) b!462369))

(assert (= (and b!462365 ((_ is ValueCellFull!5898) mapDefault!20395)) b!462366))

(assert (= start!41366 b!462365))

(declare-fun m!445329 () Bool)

(assert (=> mapNonEmpty!20395 m!445329))

(declare-fun m!445331 () Bool)

(assert (=> b!462368 m!445331))

(declare-fun m!445333 () Bool)

(assert (=> start!41366 m!445333))

(declare-fun m!445335 () Bool)

(assert (=> start!41366 m!445335))

(declare-fun m!445337 () Bool)

(assert (=> start!41366 m!445337))

(declare-fun m!445339 () Bool)

(assert (=> b!462370 m!445339))

(check-sat (not start!41366) tp_is_empty!12483 (not b!462368) (not b!462370) (not mapNonEmpty!20395))
(check-sat)
