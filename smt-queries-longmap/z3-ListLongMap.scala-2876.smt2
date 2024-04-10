; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41378 () Bool)

(assert start!41378)

(declare-fun b!462474 () Bool)

(declare-fun res!276582 () Bool)

(declare-fun e!269873 () Bool)

(assert (=> b!462474 (=> (not res!276582) (not e!269873))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28789 0))(
  ( (array!28790 (arr!13828 (Array (_ BitVec 32) (_ BitVec 64))) (size!14180 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28789)

(declare-datatypes ((V!17765 0))(
  ( (V!17766 (val!6292 Int)) )
))
(declare-datatypes ((ValueCell!5904 0))(
  ( (ValueCellFull!5904 (v!8579 V!17765)) (EmptyCell!5904) )
))
(declare-datatypes ((array!28791 0))(
  ( (array!28792 (arr!13829 (Array (_ BitVec 32) ValueCell!5904)) (size!14181 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28791)

(assert (=> b!462474 (= res!276582 (and (= (size!14181 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14180 _keys!1025) (size!14181 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462475 () Bool)

(declare-fun e!269874 () Bool)

(declare-fun e!269875 () Bool)

(declare-fun mapRes!20413 () Bool)

(assert (=> b!462475 (= e!269874 (and e!269875 mapRes!20413))))

(declare-fun condMapEmpty!20413 () Bool)

(declare-fun mapDefault!20413 () ValueCell!5904)

(assert (=> b!462475 (= condMapEmpty!20413 (= (arr!13829 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5904)) mapDefault!20413)))))

(declare-fun mapIsEmpty!20413 () Bool)

(assert (=> mapIsEmpty!20413 mapRes!20413))

(declare-fun mapNonEmpty!20413 () Bool)

(declare-fun tp!39232 () Bool)

(declare-fun e!269876 () Bool)

(assert (=> mapNonEmpty!20413 (= mapRes!20413 (and tp!39232 e!269876))))

(declare-fun mapRest!20413 () (Array (_ BitVec 32) ValueCell!5904))

(declare-fun mapKey!20413 () (_ BitVec 32))

(declare-fun mapValue!20413 () ValueCell!5904)

(assert (=> mapNonEmpty!20413 (= (arr!13829 _values!833) (store mapRest!20413 mapKey!20413 mapValue!20413))))

(declare-fun b!462476 () Bool)

(declare-fun tp_is_empty!12495 () Bool)

(assert (=> b!462476 (= e!269875 tp_is_empty!12495)))

(declare-fun res!276583 () Bool)

(assert (=> start!41378 (=> (not res!276583) (not e!269873))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41378 (= res!276583 (validMask!0 mask!1365))))

(assert (=> start!41378 e!269873))

(assert (=> start!41378 true))

(declare-fun array_inv!10000 (array!28789) Bool)

(assert (=> start!41378 (array_inv!10000 _keys!1025)))

(declare-fun array_inv!10001 (array!28791) Bool)

(assert (=> start!41378 (and (array_inv!10001 _values!833) e!269874)))

(declare-fun b!462473 () Bool)

(assert (=> b!462473 (= e!269873 false)))

(declare-fun lt!209216 () Bool)

(declare-datatypes ((List!8343 0))(
  ( (Nil!8340) (Cons!8339 (h!9195 (_ BitVec 64)) (t!14287 List!8343)) )
))
(declare-fun arrayNoDuplicates!0 (array!28789 (_ BitVec 32) List!8343) Bool)

(assert (=> b!462473 (= lt!209216 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8340))))

(declare-fun b!462477 () Bool)

(assert (=> b!462477 (= e!269876 tp_is_empty!12495)))

(declare-fun b!462478 () Bool)

(declare-fun res!276584 () Bool)

(assert (=> b!462478 (=> (not res!276584) (not e!269873))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28789 (_ BitVec 32)) Bool)

(assert (=> b!462478 (= res!276584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!41378 res!276583) b!462474))

(assert (= (and b!462474 res!276582) b!462478))

(assert (= (and b!462478 res!276584) b!462473))

(assert (= (and b!462475 condMapEmpty!20413) mapIsEmpty!20413))

(assert (= (and b!462475 (not condMapEmpty!20413)) mapNonEmpty!20413))

(get-info :version)

(assert (= (and mapNonEmpty!20413 ((_ is ValueCellFull!5904) mapValue!20413)) b!462477))

(assert (= (and b!462475 ((_ is ValueCellFull!5904) mapDefault!20413)) b!462476))

(assert (= start!41378 b!462475))

(declare-fun m!445401 () Bool)

(assert (=> mapNonEmpty!20413 m!445401))

(declare-fun m!445403 () Bool)

(assert (=> start!41378 m!445403))

(declare-fun m!445405 () Bool)

(assert (=> start!41378 m!445405))

(declare-fun m!445407 () Bool)

(assert (=> start!41378 m!445407))

(declare-fun m!445409 () Bool)

(assert (=> b!462473 m!445409))

(declare-fun m!445411 () Bool)

(assert (=> b!462478 m!445411))

(check-sat (not b!462473) tp_is_empty!12495 (not b!462478) (not mapNonEmpty!20413) (not start!41378))
(check-sat)
