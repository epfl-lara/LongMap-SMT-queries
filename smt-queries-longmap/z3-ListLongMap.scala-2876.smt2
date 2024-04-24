; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41362 () Bool)

(assert start!41362)

(declare-fun b!462394 () Bool)

(declare-fun res!276567 () Bool)

(declare-fun e!269819 () Bool)

(assert (=> b!462394 (=> (not res!276567) (not e!269819))))

(declare-datatypes ((array!28788 0))(
  ( (array!28789 (arr!13827 (Array (_ BitVec 32) (_ BitVec 64))) (size!14179 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28788)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28788 (_ BitVec 32)) Bool)

(assert (=> b!462394 (= res!276567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462395 () Bool)

(declare-fun res!276568 () Bool)

(assert (=> b!462395 (=> (not res!276568) (not e!269819))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!17763 0))(
  ( (V!17764 (val!6291 Int)) )
))
(declare-datatypes ((ValueCell!5903 0))(
  ( (ValueCellFull!5903 (v!8579 V!17763)) (EmptyCell!5903) )
))
(declare-datatypes ((array!28790 0))(
  ( (array!28791 (arr!13828 (Array (_ BitVec 32) ValueCell!5903)) (size!14180 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28790)

(assert (=> b!462395 (= res!276568 (and (= (size!14180 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14179 _keys!1025) (size!14180 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462396 () Bool)

(assert (=> b!462396 (= e!269819 false)))

(declare-fun lt!209225 () Bool)

(declare-datatypes ((List!8270 0))(
  ( (Nil!8267) (Cons!8266 (h!9122 (_ BitVec 64)) (t!14206 List!8270)) )
))
(declare-fun arrayNoDuplicates!0 (array!28788 (_ BitVec 32) List!8270) Bool)

(assert (=> b!462396 (= lt!209225 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8267))))

(declare-fun res!276566 () Bool)

(assert (=> start!41362 (=> (not res!276566) (not e!269819))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41362 (= res!276566 (validMask!0 mask!1365))))

(assert (=> start!41362 e!269819))

(assert (=> start!41362 true))

(declare-fun array_inv!10080 (array!28788) Bool)

(assert (=> start!41362 (array_inv!10080 _keys!1025)))

(declare-fun e!269821 () Bool)

(declare-fun array_inv!10081 (array!28790) Bool)

(assert (=> start!41362 (and (array_inv!10081 _values!833) e!269821)))

(declare-fun b!462397 () Bool)

(declare-fun e!269820 () Bool)

(declare-fun tp_is_empty!12493 () Bool)

(assert (=> b!462397 (= e!269820 tp_is_empty!12493)))

(declare-fun b!462398 () Bool)

(declare-fun e!269823 () Bool)

(declare-fun mapRes!20410 () Bool)

(assert (=> b!462398 (= e!269821 (and e!269823 mapRes!20410))))

(declare-fun condMapEmpty!20410 () Bool)

(declare-fun mapDefault!20410 () ValueCell!5903)

(assert (=> b!462398 (= condMapEmpty!20410 (= (arr!13828 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5903)) mapDefault!20410)))))

(declare-fun mapNonEmpty!20410 () Bool)

(declare-fun tp!39229 () Bool)

(assert (=> mapNonEmpty!20410 (= mapRes!20410 (and tp!39229 e!269820))))

(declare-fun mapKey!20410 () (_ BitVec 32))

(declare-fun mapValue!20410 () ValueCell!5903)

(declare-fun mapRest!20410 () (Array (_ BitVec 32) ValueCell!5903))

(assert (=> mapNonEmpty!20410 (= (arr!13828 _values!833) (store mapRest!20410 mapKey!20410 mapValue!20410))))

(declare-fun b!462399 () Bool)

(assert (=> b!462399 (= e!269823 tp_is_empty!12493)))

(declare-fun mapIsEmpty!20410 () Bool)

(assert (=> mapIsEmpty!20410 mapRes!20410))

(assert (= (and start!41362 res!276566) b!462395))

(assert (= (and b!462395 res!276568) b!462394))

(assert (= (and b!462394 res!276567) b!462396))

(assert (= (and b!462398 condMapEmpty!20410) mapIsEmpty!20410))

(assert (= (and b!462398 (not condMapEmpty!20410)) mapNonEmpty!20410))

(get-info :version)

(assert (= (and mapNonEmpty!20410 ((_ is ValueCellFull!5903) mapValue!20410)) b!462397))

(assert (= (and b!462398 ((_ is ValueCellFull!5903) mapDefault!20410)) b!462399))

(assert (= start!41362 b!462398))

(declare-fun m!445571 () Bool)

(assert (=> b!462394 m!445571))

(declare-fun m!445573 () Bool)

(assert (=> b!462396 m!445573))

(declare-fun m!445575 () Bool)

(assert (=> start!41362 m!445575))

(declare-fun m!445577 () Bool)

(assert (=> start!41362 m!445577))

(declare-fun m!445579 () Bool)

(assert (=> start!41362 m!445579))

(declare-fun m!445581 () Bool)

(assert (=> mapNonEmpty!20410 m!445581))

(check-sat (not b!462394) (not mapNonEmpty!20410) (not start!41362) tp_is_empty!12493 (not b!462396))
(check-sat)
