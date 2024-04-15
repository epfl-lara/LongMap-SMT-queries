; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3774 () Bool)

(assert start!3774)

(declare-fun mapIsEmpty!1174 () Bool)

(declare-fun mapRes!1174 () Bool)

(assert (=> mapIsEmpty!1174 mapRes!1174))

(declare-fun b!26396 () Bool)

(declare-fun e!17187 () Bool)

(declare-fun e!17188 () Bool)

(assert (=> b!26396 (= e!17187 (and e!17188 mapRes!1174))))

(declare-fun condMapEmpty!1174 () Bool)

(declare-datatypes ((V!1299 0))(
  ( (V!1300 (val!579 Int)) )
))
(declare-datatypes ((ValueCell!353 0))(
  ( (ValueCellFull!353 (v!1664 V!1299)) (EmptyCell!353) )
))
(declare-datatypes ((array!1429 0))(
  ( (array!1430 (arr!672 (Array (_ BitVec 32) ValueCell!353)) (size!773 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1429)

(declare-fun mapDefault!1174 () ValueCell!353)

(assert (=> b!26396 (= condMapEmpty!1174 (= (arr!672 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!353)) mapDefault!1174)))))

(declare-fun b!26397 () Bool)

(declare-fun e!17189 () Bool)

(assert (=> b!26397 (= e!17189 false)))

(declare-fun lt!10363 () Bool)

(declare-datatypes ((array!1431 0))(
  ( (array!1432 (arr!673 (Array (_ BitVec 32) (_ BitVec 64))) (size!774 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1431)

(declare-datatypes ((List!586 0))(
  ( (Nil!583) (Cons!582 (h!1149 (_ BitVec 64)) (t!3266 List!586)) )
))
(declare-fun arrayNoDuplicates!0 (array!1431 (_ BitVec 32) List!586) Bool)

(assert (=> b!26397 (= lt!10363 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!583))))

(declare-fun b!26398 () Bool)

(declare-fun res!15669 () Bool)

(assert (=> b!26398 (=> (not res!15669) (not e!17189))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!26398 (= res!15669 (and (= (size!773 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!774 _keys!1833) (size!773 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26399 () Bool)

(declare-fun res!15670 () Bool)

(assert (=> b!26399 (=> (not res!15670) (not e!17189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1431 (_ BitVec 32)) Bool)

(assert (=> b!26399 (= res!15670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26400 () Bool)

(declare-fun tp_is_empty!1105 () Bool)

(assert (=> b!26400 (= e!17188 tp_is_empty!1105)))

(declare-fun b!26401 () Bool)

(declare-fun e!17191 () Bool)

(assert (=> b!26401 (= e!17191 tp_is_empty!1105)))

(declare-fun res!15668 () Bool)

(assert (=> start!3774 (=> (not res!15668) (not e!17189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3774 (= res!15668 (validMask!0 mask!2294))))

(assert (=> start!3774 e!17189))

(assert (=> start!3774 true))

(declare-fun array_inv!473 (array!1429) Bool)

(assert (=> start!3774 (and (array_inv!473 _values!1501) e!17187)))

(declare-fun array_inv!474 (array!1431) Bool)

(assert (=> start!3774 (array_inv!474 _keys!1833)))

(declare-fun mapNonEmpty!1174 () Bool)

(declare-fun tp!3694 () Bool)

(assert (=> mapNonEmpty!1174 (= mapRes!1174 (and tp!3694 e!17191))))

(declare-fun mapRest!1174 () (Array (_ BitVec 32) ValueCell!353))

(declare-fun mapValue!1174 () ValueCell!353)

(declare-fun mapKey!1174 () (_ BitVec 32))

(assert (=> mapNonEmpty!1174 (= (arr!672 _values!1501) (store mapRest!1174 mapKey!1174 mapValue!1174))))

(assert (= (and start!3774 res!15668) b!26398))

(assert (= (and b!26398 res!15669) b!26399))

(assert (= (and b!26399 res!15670) b!26397))

(assert (= (and b!26396 condMapEmpty!1174) mapIsEmpty!1174))

(assert (= (and b!26396 (not condMapEmpty!1174)) mapNonEmpty!1174))

(get-info :version)

(assert (= (and mapNonEmpty!1174 ((_ is ValueCellFull!353) mapValue!1174)) b!26401))

(assert (= (and b!26396 ((_ is ValueCellFull!353) mapDefault!1174)) b!26400))

(assert (= start!3774 b!26396))

(declare-fun m!21151 () Bool)

(assert (=> b!26397 m!21151))

(declare-fun m!21153 () Bool)

(assert (=> b!26399 m!21153))

(declare-fun m!21155 () Bool)

(assert (=> start!3774 m!21155))

(declare-fun m!21157 () Bool)

(assert (=> start!3774 m!21157))

(declare-fun m!21159 () Bool)

(assert (=> start!3774 m!21159))

(declare-fun m!21161 () Bool)

(assert (=> mapNonEmpty!1174 m!21161))

(check-sat (not start!3774) tp_is_empty!1105 (not b!26397) (not b!26399) (not mapNonEmpty!1174))
(check-sat)
