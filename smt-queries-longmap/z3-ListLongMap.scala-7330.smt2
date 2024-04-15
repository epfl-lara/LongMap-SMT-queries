; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93656 () Bool)

(assert start!93656)

(declare-fun res!707747 () Bool)

(declare-fun e!603041 () Bool)

(assert (=> start!93656 (=> (not res!707747) (not e!603041))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93656 (= res!707747 (validMask!0 mask!1515))))

(assert (=> start!93656 e!603041))

(assert (=> start!93656 true))

(declare-datatypes ((V!38425 0))(
  ( (V!38426 (val!12534 Int)) )
))
(declare-datatypes ((ValueCell!11780 0))(
  ( (ValueCellFull!11780 (v!15143 V!38425)) (EmptyCell!11780) )
))
(declare-datatypes ((array!66898 0))(
  ( (array!66899 (arr!32159 (Array (_ BitVec 32) ValueCell!11780)) (size!32697 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66898)

(declare-fun e!603042 () Bool)

(declare-fun array_inv!24930 (array!66898) Bool)

(assert (=> start!93656 (and (array_inv!24930 _values!955) e!603042)))

(declare-datatypes ((array!66900 0))(
  ( (array!66901 (arr!32160 (Array (_ BitVec 32) (_ BitVec 64))) (size!32698 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66900)

(declare-fun array_inv!24931 (array!66900) Bool)

(assert (=> start!93656 (array_inv!24931 _keys!1163)))

(declare-fun b!1059474 () Bool)

(declare-fun res!707748 () Bool)

(assert (=> b!1059474 (=> (not res!707748) (not e!603041))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1059474 (= res!707748 (and (= (size!32697 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32698 _keys!1163) (size!32697 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1059475 () Bool)

(assert (=> b!1059475 (= e!603041 false)))

(declare-fun lt!466955 () Bool)

(declare-datatypes ((List!22464 0))(
  ( (Nil!22461) (Cons!22460 (h!23669 (_ BitVec 64)) (t!31762 List!22464)) )
))
(declare-fun arrayNoDuplicates!0 (array!66900 (_ BitVec 32) List!22464) Bool)

(assert (=> b!1059475 (= lt!466955 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22461))))

(declare-fun b!1059476 () Bool)

(declare-fun e!603044 () Bool)

(declare-fun mapRes!39115 () Bool)

(assert (=> b!1059476 (= e!603042 (and e!603044 mapRes!39115))))

(declare-fun condMapEmpty!39115 () Bool)

(declare-fun mapDefault!39115 () ValueCell!11780)

(assert (=> b!1059476 (= condMapEmpty!39115 (= (arr!32159 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11780)) mapDefault!39115)))))

(declare-fun mapNonEmpty!39115 () Bool)

(declare-fun tp!74921 () Bool)

(declare-fun e!603045 () Bool)

(assert (=> mapNonEmpty!39115 (= mapRes!39115 (and tp!74921 e!603045))))

(declare-fun mapKey!39115 () (_ BitVec 32))

(declare-fun mapRest!39115 () (Array (_ BitVec 32) ValueCell!11780))

(declare-fun mapValue!39115 () ValueCell!11780)

(assert (=> mapNonEmpty!39115 (= (arr!32159 _values!955) (store mapRest!39115 mapKey!39115 mapValue!39115))))

(declare-fun mapIsEmpty!39115 () Bool)

(assert (=> mapIsEmpty!39115 mapRes!39115))

(declare-fun b!1059477 () Bool)

(declare-fun tp_is_empty!24967 () Bool)

(assert (=> b!1059477 (= e!603045 tp_is_empty!24967)))

(declare-fun b!1059478 () Bool)

(declare-fun res!707749 () Bool)

(assert (=> b!1059478 (=> (not res!707749) (not e!603041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66900 (_ BitVec 32)) Bool)

(assert (=> b!1059478 (= res!707749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1059479 () Bool)

(assert (=> b!1059479 (= e!603044 tp_is_empty!24967)))

(assert (= (and start!93656 res!707747) b!1059474))

(assert (= (and b!1059474 res!707748) b!1059478))

(assert (= (and b!1059478 res!707749) b!1059475))

(assert (= (and b!1059476 condMapEmpty!39115) mapIsEmpty!39115))

(assert (= (and b!1059476 (not condMapEmpty!39115)) mapNonEmpty!39115))

(get-info :version)

(assert (= (and mapNonEmpty!39115 ((_ is ValueCellFull!11780) mapValue!39115)) b!1059477))

(assert (= (and b!1059476 ((_ is ValueCellFull!11780) mapDefault!39115)) b!1059479))

(assert (= start!93656 b!1059476))

(declare-fun m!978365 () Bool)

(assert (=> start!93656 m!978365))

(declare-fun m!978367 () Bool)

(assert (=> start!93656 m!978367))

(declare-fun m!978369 () Bool)

(assert (=> start!93656 m!978369))

(declare-fun m!978371 () Bool)

(assert (=> b!1059475 m!978371))

(declare-fun m!978373 () Bool)

(assert (=> mapNonEmpty!39115 m!978373))

(declare-fun m!978375 () Bool)

(assert (=> b!1059478 m!978375))

(check-sat (not b!1059475) tp_is_empty!24967 (not mapNonEmpty!39115) (not b!1059478) (not start!93656))
(check-sat)
