; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77444 () Bool)

(assert start!77444)

(declare-fun mapNonEmpty!29422 () Bool)

(declare-fun mapRes!29422 () Bool)

(declare-fun tp!56482 () Bool)

(declare-fun e!505503 () Bool)

(assert (=> mapNonEmpty!29422 (= mapRes!29422 (and tp!56482 e!505503))))

(declare-datatypes ((V!29599 0))(
  ( (V!29600 (val!9288 Int)) )
))
(declare-datatypes ((ValueCell!8756 0))(
  ( (ValueCellFull!8756 (v!11792 V!29599)) (EmptyCell!8756) )
))
(declare-datatypes ((array!52995 0))(
  ( (array!52996 (arr!25458 (Array (_ BitVec 32) ValueCell!8756)) (size!25919 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52995)

(declare-fun mapValue!29422 () ValueCell!8756)

(declare-fun mapRest!29422 () (Array (_ BitVec 32) ValueCell!8756))

(declare-fun mapKey!29422 () (_ BitVec 32))

(assert (=> mapNonEmpty!29422 (= (arr!25458 _values!1152) (store mapRest!29422 mapKey!29422 mapValue!29422))))

(declare-fun b!902502 () Bool)

(declare-fun e!505502 () Bool)

(declare-fun e!505501 () Bool)

(assert (=> b!902502 (= e!505502 (and e!505501 mapRes!29422))))

(declare-fun condMapEmpty!29422 () Bool)

(declare-fun mapDefault!29422 () ValueCell!8756)

(assert (=> b!902502 (= condMapEmpty!29422 (= (arr!25458 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8756)) mapDefault!29422)))))

(declare-fun b!902503 () Bool)

(declare-fun tp_is_empty!18475 () Bool)

(assert (=> b!902503 (= e!505503 tp_is_empty!18475)))

(declare-fun b!902504 () Bool)

(declare-fun res!609056 () Bool)

(declare-fun e!505504 () Bool)

(assert (=> b!902504 (=> (not res!609056) (not e!505504))))

(declare-datatypes ((array!52997 0))(
  ( (array!52998 (arr!25459 (Array (_ BitVec 32) (_ BitVec 64))) (size!25920 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52997)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52997 (_ BitVec 32)) Bool)

(assert (=> b!902504 (= res!609056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!29422 () Bool)

(assert (=> mapIsEmpty!29422 mapRes!29422))

(declare-fun b!902501 () Bool)

(declare-fun res!609057 () Bool)

(assert (=> b!902501 (=> (not res!609057) (not e!505504))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!902501 (= res!609057 (and (= (size!25919 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25920 _keys!1386) (size!25919 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!609055 () Bool)

(assert (=> start!77444 (=> (not res!609055) (not e!505504))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77444 (= res!609055 (validMask!0 mask!1756))))

(assert (=> start!77444 e!505504))

(assert (=> start!77444 true))

(declare-fun array_inv!20016 (array!52995) Bool)

(assert (=> start!77444 (and (array_inv!20016 _values!1152) e!505502)))

(declare-fun array_inv!20017 (array!52997) Bool)

(assert (=> start!77444 (array_inv!20017 _keys!1386)))

(declare-fun b!902505 () Bool)

(assert (=> b!902505 (= e!505504 false)))

(declare-fun lt!407671 () Bool)

(declare-datatypes ((List!17905 0))(
  ( (Nil!17902) (Cons!17901 (h!19047 (_ BitVec 64)) (t!25279 List!17905)) )
))
(declare-fun arrayNoDuplicates!0 (array!52997 (_ BitVec 32) List!17905) Bool)

(assert (=> b!902505 (= lt!407671 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17902))))

(declare-fun b!902506 () Bool)

(assert (=> b!902506 (= e!505501 tp_is_empty!18475)))

(assert (= (and start!77444 res!609055) b!902501))

(assert (= (and b!902501 res!609057) b!902504))

(assert (= (and b!902504 res!609056) b!902505))

(assert (= (and b!902502 condMapEmpty!29422) mapIsEmpty!29422))

(assert (= (and b!902502 (not condMapEmpty!29422)) mapNonEmpty!29422))

(get-info :version)

(assert (= (and mapNonEmpty!29422 ((_ is ValueCellFull!8756) mapValue!29422)) b!902503))

(assert (= (and b!902502 ((_ is ValueCellFull!8756) mapDefault!29422)) b!902506))

(assert (= start!77444 b!902502))

(declare-fun m!837881 () Bool)

(assert (=> mapNonEmpty!29422 m!837881))

(declare-fun m!837883 () Bool)

(assert (=> b!902504 m!837883))

(declare-fun m!837885 () Bool)

(assert (=> start!77444 m!837885))

(declare-fun m!837887 () Bool)

(assert (=> start!77444 m!837887))

(declare-fun m!837889 () Bool)

(assert (=> start!77444 m!837889))

(declare-fun m!837891 () Bool)

(assert (=> b!902505 m!837891))

(check-sat tp_is_empty!18475 (not b!902504) (not start!77444) (not mapNonEmpty!29422) (not b!902505))
(check-sat)
