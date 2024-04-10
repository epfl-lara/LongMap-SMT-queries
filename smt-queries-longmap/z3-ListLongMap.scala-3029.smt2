; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42550 () Bool)

(assert start!42550)

(declare-fun b_free!11985 () Bool)

(declare-fun b_next!11985 () Bool)

(assert (=> start!42550 (= b_free!11985 (not b_next!11985))))

(declare-fun tp!41994 () Bool)

(declare-fun b_and!20465 () Bool)

(assert (=> start!42550 (= tp!41994 b_and!20465)))

(declare-fun b!474731 () Bool)

(declare-fun e!278669 () Bool)

(declare-fun e!278672 () Bool)

(declare-fun mapRes!21838 () Bool)

(assert (=> b!474731 (= e!278669 (and e!278672 mapRes!21838))))

(declare-fun condMapEmpty!21838 () Bool)

(declare-datatypes ((V!18989 0))(
  ( (V!18990 (val!6751 Int)) )
))
(declare-datatypes ((ValueCell!6363 0))(
  ( (ValueCellFull!6363 (v!9044 V!18989)) (EmptyCell!6363) )
))
(declare-datatypes ((array!30573 0))(
  ( (array!30574 (arr!14704 (Array (_ BitVec 32) ValueCell!6363)) (size!15056 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30573)

(declare-fun mapDefault!21838 () ValueCell!6363)

(assert (=> b!474731 (= condMapEmpty!21838 (= (arr!14704 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6363)) mapDefault!21838)))))

(declare-fun b!474732 () Bool)

(declare-fun e!278671 () Bool)

(declare-fun tp_is_empty!13413 () Bool)

(assert (=> b!474732 (= e!278671 tp_is_empty!13413)))

(declare-fun b!474733 () Bool)

(declare-fun res!283527 () Bool)

(declare-fun e!278670 () Bool)

(assert (=> b!474733 (=> (not res!283527) (not e!278670))))

(declare-datatypes ((array!30575 0))(
  ( (array!30576 (arr!14705 (Array (_ BitVec 32) (_ BitVec 64))) (size!15057 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30575)

(declare-datatypes ((List!8981 0))(
  ( (Nil!8978) (Cons!8977 (h!9833 (_ BitVec 64)) (t!14955 List!8981)) )
))
(declare-fun arrayNoDuplicates!0 (array!30575 (_ BitVec 32) List!8981) Bool)

(assert (=> b!474733 (= res!283527 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8978))))

(declare-fun b!474734 () Bool)

(declare-fun res!283529 () Bool)

(assert (=> b!474734 (=> (not res!283529) (not e!278670))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30575 (_ BitVec 32)) Bool)

(assert (=> b!474734 (= res!283529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474735 () Bool)

(assert (=> b!474735 (= e!278672 tp_is_empty!13413)))

(declare-fun b!474736 () Bool)

(declare-fun res!283530 () Bool)

(assert (=> b!474736 (=> (not res!283530) (not e!278670))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!474736 (= res!283530 (and (= (size!15056 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15057 _keys!1025) (size!15056 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!474737 () Bool)

(assert (=> b!474737 (= e!278670 false)))

(declare-fun zeroValue!794 () V!18989)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8906 0))(
  ( (tuple2!8907 (_1!4464 (_ BitVec 64)) (_2!4464 V!18989)) )
))
(declare-datatypes ((List!8982 0))(
  ( (Nil!8979) (Cons!8978 (h!9834 tuple2!8906) (t!14956 List!8982)) )
))
(declare-datatypes ((ListLongMap!7819 0))(
  ( (ListLongMap!7820 (toList!3925 List!8982)) )
))
(declare-fun lt!216274 () ListLongMap!7819)

(declare-fun minValueAfter!38 () V!18989)

(declare-fun getCurrentListMapNoExtraKeys!2082 (array!30575 array!30573 (_ BitVec 32) (_ BitVec 32) V!18989 V!18989 (_ BitVec 32) Int) ListLongMap!7819)

(assert (=> b!474737 (= lt!216274 (getCurrentListMapNoExtraKeys!2082 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18989)

(declare-fun lt!216275 () ListLongMap!7819)

(assert (=> b!474737 (= lt!216275 (getCurrentListMapNoExtraKeys!2082 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21838 () Bool)

(declare-fun tp!41995 () Bool)

(assert (=> mapNonEmpty!21838 (= mapRes!21838 (and tp!41995 e!278671))))

(declare-fun mapKey!21838 () (_ BitVec 32))

(declare-fun mapRest!21838 () (Array (_ BitVec 32) ValueCell!6363))

(declare-fun mapValue!21838 () ValueCell!6363)

(assert (=> mapNonEmpty!21838 (= (arr!14704 _values!833) (store mapRest!21838 mapKey!21838 mapValue!21838))))

(declare-fun res!283528 () Bool)

(assert (=> start!42550 (=> (not res!283528) (not e!278670))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42550 (= res!283528 (validMask!0 mask!1365))))

(assert (=> start!42550 e!278670))

(assert (=> start!42550 tp_is_empty!13413))

(assert (=> start!42550 tp!41994))

(assert (=> start!42550 true))

(declare-fun array_inv!10608 (array!30575) Bool)

(assert (=> start!42550 (array_inv!10608 _keys!1025)))

(declare-fun array_inv!10609 (array!30573) Bool)

(assert (=> start!42550 (and (array_inv!10609 _values!833) e!278669)))

(declare-fun mapIsEmpty!21838 () Bool)

(assert (=> mapIsEmpty!21838 mapRes!21838))

(assert (= (and start!42550 res!283528) b!474736))

(assert (= (and b!474736 res!283530) b!474734))

(assert (= (and b!474734 res!283529) b!474733))

(assert (= (and b!474733 res!283527) b!474737))

(assert (= (and b!474731 condMapEmpty!21838) mapIsEmpty!21838))

(assert (= (and b!474731 (not condMapEmpty!21838)) mapNonEmpty!21838))

(get-info :version)

(assert (= (and mapNonEmpty!21838 ((_ is ValueCellFull!6363) mapValue!21838)) b!474732))

(assert (= (and b!474731 ((_ is ValueCellFull!6363) mapDefault!21838)) b!474735))

(assert (= start!42550 b!474731))

(declare-fun m!457079 () Bool)

(assert (=> start!42550 m!457079))

(declare-fun m!457081 () Bool)

(assert (=> start!42550 m!457081))

(declare-fun m!457083 () Bool)

(assert (=> start!42550 m!457083))

(declare-fun m!457085 () Bool)

(assert (=> b!474737 m!457085))

(declare-fun m!457087 () Bool)

(assert (=> b!474737 m!457087))

(declare-fun m!457089 () Bool)

(assert (=> b!474733 m!457089))

(declare-fun m!457091 () Bool)

(assert (=> mapNonEmpty!21838 m!457091))

(declare-fun m!457093 () Bool)

(assert (=> b!474734 m!457093))

(check-sat (not b!474733) (not b_next!11985) (not start!42550) b_and!20465 (not mapNonEmpty!21838) (not b!474734) tp_is_empty!13413 (not b!474737))
(check-sat b_and!20465 (not b_next!11985))
