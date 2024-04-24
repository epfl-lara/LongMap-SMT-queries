; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3768 () Bool)

(assert start!3768)

(declare-fun b!26270 () Bool)

(declare-fun e!17092 () Bool)

(declare-fun tp_is_empty!1093 () Bool)

(assert (=> b!26270 (= e!17092 tp_is_empty!1093)))

(declare-fun mapIsEmpty!1156 () Bool)

(declare-fun mapRes!1156 () Bool)

(assert (=> mapIsEmpty!1156 mapRes!1156))

(declare-fun b!26271 () Bool)

(declare-fun e!17089 () Bool)

(assert (=> b!26271 (= e!17089 tp_is_empty!1093)))

(declare-fun res!15607 () Bool)

(declare-fun e!17091 () Bool)

(assert (=> start!3768 (=> (not res!15607) (not e!17091))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3768 (= res!15607 (validMask!0 mask!2294))))

(assert (=> start!3768 e!17091))

(assert (=> start!3768 true))

(declare-datatypes ((V!1283 0))(
  ( (V!1284 (val!573 Int)) )
))
(declare-datatypes ((ValueCell!347 0))(
  ( (ValueCellFull!347 (v!1659 V!1283)) (EmptyCell!347) )
))
(declare-datatypes ((array!1411 0))(
  ( (array!1412 (arr!663 (Array (_ BitVec 32) ValueCell!347)) (size!764 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1411)

(declare-fun e!17088 () Bool)

(declare-fun array_inv!465 (array!1411) Bool)

(assert (=> start!3768 (and (array_inv!465 _values!1501) e!17088)))

(declare-datatypes ((array!1413 0))(
  ( (array!1414 (arr!664 (Array (_ BitVec 32) (_ BitVec 64))) (size!765 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1413)

(declare-fun array_inv!466 (array!1413) Bool)

(assert (=> start!3768 (array_inv!466 _keys!1833)))

(declare-fun b!26272 () Bool)

(declare-fun res!15608 () Bool)

(assert (=> b!26272 (=> (not res!15608) (not e!17091))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1413 (_ BitVec 32)) Bool)

(assert (=> b!26272 (= res!15608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1156 () Bool)

(declare-fun tp!3676 () Bool)

(assert (=> mapNonEmpty!1156 (= mapRes!1156 (and tp!3676 e!17089))))

(declare-fun mapRest!1156 () (Array (_ BitVec 32) ValueCell!347))

(declare-fun mapValue!1156 () ValueCell!347)

(declare-fun mapKey!1156 () (_ BitVec 32))

(assert (=> mapNonEmpty!1156 (= (arr!663 _values!1501) (store mapRest!1156 mapKey!1156 mapValue!1156))))

(declare-fun b!26273 () Bool)

(assert (=> b!26273 (= e!17088 (and e!17092 mapRes!1156))))

(declare-fun condMapEmpty!1156 () Bool)

(declare-fun mapDefault!1156 () ValueCell!347)

(assert (=> b!26273 (= condMapEmpty!1156 (= (arr!663 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!347)) mapDefault!1156)))))

(declare-fun b!26274 () Bool)

(assert (=> b!26274 (= e!17091 false)))

(declare-fun lt!10305 () Bool)

(declare-datatypes ((List!581 0))(
  ( (Nil!578) (Cons!577 (h!1144 (_ BitVec 64)) (t!3262 List!581)) )
))
(declare-fun arrayNoDuplicates!0 (array!1413 (_ BitVec 32) List!581) Bool)

(assert (=> b!26274 (= lt!10305 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!578))))

(declare-fun b!26275 () Bool)

(declare-fun res!15606 () Bool)

(assert (=> b!26275 (=> (not res!15606) (not e!17091))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26275 (= res!15606 (and (= (size!764 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!765 _keys!1833) (size!764 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(assert (= (and start!3768 res!15607) b!26275))

(assert (= (and b!26275 res!15606) b!26272))

(assert (= (and b!26272 res!15608) b!26274))

(assert (= (and b!26273 condMapEmpty!1156) mapIsEmpty!1156))

(assert (= (and b!26273 (not condMapEmpty!1156)) mapNonEmpty!1156))

(get-info :version)

(assert (= (and mapNonEmpty!1156 ((_ is ValueCellFull!347) mapValue!1156)) b!26271))

(assert (= (and b!26273 ((_ is ValueCellFull!347) mapDefault!1156)) b!26270))

(assert (= start!3768 b!26273))

(declare-fun m!20997 () Bool)

(assert (=> start!3768 m!20997))

(declare-fun m!20999 () Bool)

(assert (=> start!3768 m!20999))

(declare-fun m!21001 () Bool)

(assert (=> start!3768 m!21001))

(declare-fun m!21003 () Bool)

(assert (=> b!26272 m!21003))

(declare-fun m!21005 () Bool)

(assert (=> mapNonEmpty!1156 m!21005))

(declare-fun m!21007 () Bool)

(assert (=> b!26274 m!21007))

(check-sat tp_is_empty!1093 (not b!26272) (not mapNonEmpty!1156) (not b!26274) (not start!3768))
(check-sat)
