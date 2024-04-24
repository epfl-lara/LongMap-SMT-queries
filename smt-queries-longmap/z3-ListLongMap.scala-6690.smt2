; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84280 () Bool)

(assert start!84280)

(declare-fun b!984403 () Bool)

(declare-fun res!658471 () Bool)

(declare-fun e!554997 () Bool)

(assert (=> b!984403 (=> (not res!658471) (not e!554997))))

(declare-datatypes ((array!61854 0))(
  ( (array!61855 (arr!29780 (Array (_ BitVec 32) (_ BitVec 64))) (size!30260 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61854)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61854 (_ BitVec 32)) Bool)

(assert (=> b!984403 (= res!658471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!984404 () Bool)

(declare-fun res!658469 () Bool)

(assert (=> b!984404 (=> (not res!658469) (not e!554997))))

(declare-datatypes ((V!35537 0))(
  ( (V!35538 (val!11508 Int)) )
))
(declare-datatypes ((ValueCell!10976 0))(
  ( (ValueCellFull!10976 (v!14067 V!35537)) (EmptyCell!10976) )
))
(declare-datatypes ((array!61856 0))(
  ( (array!61857 (arr!29781 (Array (_ BitVec 32) ValueCell!10976)) (size!30261 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61856)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!984404 (= res!658469 (and (= (size!30261 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30260 _keys!1544) (size!30261 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!658470 () Bool)

(assert (=> start!84280 (=> (not res!658470) (not e!554997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84280 (= res!658470 (validMask!0 mask!1948))))

(assert (=> start!84280 e!554997))

(assert (=> start!84280 true))

(declare-fun e!554996 () Bool)

(declare-fun array_inv!23043 (array!61856) Bool)

(assert (=> start!84280 (and (array_inv!23043 _values!1278) e!554996)))

(declare-fun array_inv!23044 (array!61854) Bool)

(assert (=> start!84280 (array_inv!23044 _keys!1544)))

(declare-fun mapNonEmpty!36401 () Bool)

(declare-fun mapRes!36401 () Bool)

(declare-fun tp!69086 () Bool)

(declare-fun e!554994 () Bool)

(assert (=> mapNonEmpty!36401 (= mapRes!36401 (and tp!69086 e!554994))))

(declare-fun mapValue!36401 () ValueCell!10976)

(declare-fun mapKey!36401 () (_ BitVec 32))

(declare-fun mapRest!36401 () (Array (_ BitVec 32) ValueCell!10976))

(assert (=> mapNonEmpty!36401 (= (arr!29781 _values!1278) (store mapRest!36401 mapKey!36401 mapValue!36401))))

(declare-fun b!984405 () Bool)

(declare-fun e!554995 () Bool)

(declare-fun tp_is_empty!22915 () Bool)

(assert (=> b!984405 (= e!554995 tp_is_empty!22915)))

(declare-fun b!984406 () Bool)

(assert (=> b!984406 (= e!554997 false)))

(declare-fun lt!436890 () Bool)

(declare-datatypes ((List!20630 0))(
  ( (Nil!20627) (Cons!20626 (h!21794 (_ BitVec 64)) (t!29413 List!20630)) )
))
(declare-fun arrayNoDuplicates!0 (array!61854 (_ BitVec 32) List!20630) Bool)

(assert (=> b!984406 (= lt!436890 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20627))))

(declare-fun b!984407 () Bool)

(assert (=> b!984407 (= e!554994 tp_is_empty!22915)))

(declare-fun mapIsEmpty!36401 () Bool)

(assert (=> mapIsEmpty!36401 mapRes!36401))

(declare-fun b!984408 () Bool)

(assert (=> b!984408 (= e!554996 (and e!554995 mapRes!36401))))

(declare-fun condMapEmpty!36401 () Bool)

(declare-fun mapDefault!36401 () ValueCell!10976)

(assert (=> b!984408 (= condMapEmpty!36401 (= (arr!29781 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10976)) mapDefault!36401)))))

(assert (= (and start!84280 res!658470) b!984404))

(assert (= (and b!984404 res!658469) b!984403))

(assert (= (and b!984403 res!658471) b!984406))

(assert (= (and b!984408 condMapEmpty!36401) mapIsEmpty!36401))

(assert (= (and b!984408 (not condMapEmpty!36401)) mapNonEmpty!36401))

(get-info :version)

(assert (= (and mapNonEmpty!36401 ((_ is ValueCellFull!10976) mapValue!36401)) b!984407))

(assert (= (and b!984408 ((_ is ValueCellFull!10976) mapDefault!36401)) b!984405))

(assert (= start!84280 b!984408))

(declare-fun m!912047 () Bool)

(assert (=> b!984403 m!912047))

(declare-fun m!912049 () Bool)

(assert (=> start!84280 m!912049))

(declare-fun m!912051 () Bool)

(assert (=> start!84280 m!912051))

(declare-fun m!912053 () Bool)

(assert (=> start!84280 m!912053))

(declare-fun m!912055 () Bool)

(assert (=> mapNonEmpty!36401 m!912055))

(declare-fun m!912057 () Bool)

(assert (=> b!984406 m!912057))

(check-sat tp_is_empty!22915 (not start!84280) (not b!984403) (not mapNonEmpty!36401) (not b!984406))
(check-sat)
