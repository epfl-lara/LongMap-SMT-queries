; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41384 () Bool)

(assert start!41384)

(declare-fun mapIsEmpty!20422 () Bool)

(declare-fun mapRes!20422 () Bool)

(assert (=> mapIsEmpty!20422 mapRes!20422))

(declare-fun mapNonEmpty!20422 () Bool)

(declare-fun tp!39241 () Bool)

(declare-fun e!269920 () Bool)

(assert (=> mapNonEmpty!20422 (= mapRes!20422 (and tp!39241 e!269920))))

(declare-fun mapKey!20422 () (_ BitVec 32))

(declare-datatypes ((V!17773 0))(
  ( (V!17774 (val!6295 Int)) )
))
(declare-datatypes ((ValueCell!5907 0))(
  ( (ValueCellFull!5907 (v!8582 V!17773)) (EmptyCell!5907) )
))
(declare-datatypes ((array!28801 0))(
  ( (array!28802 (arr!13834 (Array (_ BitVec 32) ValueCell!5907)) (size!14186 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28801)

(declare-fun mapValue!20422 () ValueCell!5907)

(declare-fun mapRest!20422 () (Array (_ BitVec 32) ValueCell!5907))

(assert (=> mapNonEmpty!20422 (= (arr!13834 _values!833) (store mapRest!20422 mapKey!20422 mapValue!20422))))

(declare-fun b!462527 () Bool)

(declare-fun res!276610 () Bool)

(declare-fun e!269919 () Bool)

(assert (=> b!462527 (=> (not res!276610) (not e!269919))))

(declare-datatypes ((array!28803 0))(
  ( (array!28804 (arr!13835 (Array (_ BitVec 32) (_ BitVec 64))) (size!14187 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28803)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28803 (_ BitVec 32)) Bool)

(assert (=> b!462527 (= res!276610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!276611 () Bool)

(assert (=> start!41384 (=> (not res!276611) (not e!269919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41384 (= res!276611 (validMask!0 mask!1365))))

(assert (=> start!41384 e!269919))

(assert (=> start!41384 true))

(declare-fun array_inv!10002 (array!28803) Bool)

(assert (=> start!41384 (array_inv!10002 _keys!1025)))

(declare-fun e!269918 () Bool)

(declare-fun array_inv!10003 (array!28801) Bool)

(assert (=> start!41384 (and (array_inv!10003 _values!833) e!269918)))

(declare-fun b!462528 () Bool)

(assert (=> b!462528 (= e!269919 false)))

(declare-fun lt!209225 () Bool)

(declare-datatypes ((List!8345 0))(
  ( (Nil!8342) (Cons!8341 (h!9197 (_ BitVec 64)) (t!14289 List!8345)) )
))
(declare-fun arrayNoDuplicates!0 (array!28803 (_ BitVec 32) List!8345) Bool)

(assert (=> b!462528 (= lt!209225 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8342))))

(declare-fun b!462529 () Bool)

(declare-fun res!276609 () Bool)

(assert (=> b!462529 (=> (not res!276609) (not e!269919))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462529 (= res!276609 (and (= (size!14186 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14187 _keys!1025) (size!14186 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462530 () Bool)

(declare-fun tp_is_empty!12501 () Bool)

(assert (=> b!462530 (= e!269920 tp_is_empty!12501)))

(declare-fun b!462531 () Bool)

(declare-fun e!269922 () Bool)

(assert (=> b!462531 (= e!269922 tp_is_empty!12501)))

(declare-fun b!462532 () Bool)

(assert (=> b!462532 (= e!269918 (and e!269922 mapRes!20422))))

(declare-fun condMapEmpty!20422 () Bool)

(declare-fun mapDefault!20422 () ValueCell!5907)

(assert (=> b!462532 (= condMapEmpty!20422 (= (arr!13834 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5907)) mapDefault!20422)))))

(assert (= (and start!41384 res!276611) b!462529))

(assert (= (and b!462529 res!276609) b!462527))

(assert (= (and b!462527 res!276610) b!462528))

(assert (= (and b!462532 condMapEmpty!20422) mapIsEmpty!20422))

(assert (= (and b!462532 (not condMapEmpty!20422)) mapNonEmpty!20422))

(get-info :version)

(assert (= (and mapNonEmpty!20422 ((_ is ValueCellFull!5907) mapValue!20422)) b!462530))

(assert (= (and b!462532 ((_ is ValueCellFull!5907) mapDefault!20422)) b!462531))

(assert (= start!41384 b!462532))

(declare-fun m!445437 () Bool)

(assert (=> mapNonEmpty!20422 m!445437))

(declare-fun m!445439 () Bool)

(assert (=> b!462527 m!445439))

(declare-fun m!445441 () Bool)

(assert (=> start!41384 m!445441))

(declare-fun m!445443 () Bool)

(assert (=> start!41384 m!445443))

(declare-fun m!445445 () Bool)

(assert (=> start!41384 m!445445))

(declare-fun m!445447 () Bool)

(assert (=> b!462528 m!445447))

(check-sat (not b!462527) (not start!41384) (not mapNonEmpty!20422) (not b!462528) tp_is_empty!12501)
(check-sat)
