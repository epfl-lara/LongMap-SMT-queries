; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132200 () Bool)

(assert start!132200)

(declare-fun b!1545483 () Bool)

(declare-fun e!860145 () Bool)

(declare-fun tp_is_empty!37777 () Bool)

(assert (=> b!1545483 (= e!860145 tp_is_empty!37777)))

(declare-fun res!1059657 () Bool)

(declare-fun e!860144 () Bool)

(assert (=> start!132200 (=> (not res!1059657) (not e!860144))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132200 (= res!1059657 (validMask!0 mask!926))))

(assert (=> start!132200 e!860144))

(assert (=> start!132200 true))

(declare-datatypes ((V!58813 0))(
  ( (V!58814 (val!18966 Int)) )
))
(declare-datatypes ((ValueCell!17978 0))(
  ( (ValueCellFull!17978 (v!21759 V!58813)) (EmptyCell!17978) )
))
(declare-datatypes ((array!102902 0))(
  ( (array!102903 (arr!49646 (Array (_ BitVec 32) ValueCell!17978)) (size!50197 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102902)

(declare-fun e!860146 () Bool)

(declare-fun array_inv!38887 (array!102902) Bool)

(assert (=> start!132200 (and (array_inv!38887 _values!470) e!860146)))

(declare-datatypes ((array!102904 0))(
  ( (array!102905 (arr!49647 (Array (_ BitVec 32) (_ BitVec 64))) (size!50198 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102904)

(declare-fun array_inv!38888 (array!102904) Bool)

(assert (=> start!132200 (array_inv!38888 _keys!618)))

(declare-fun b!1545484 () Bool)

(declare-fun res!1059658 () Bool)

(assert (=> b!1545484 (=> (not res!1059658) (not e!860144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102904 (_ BitVec 32)) Bool)

(assert (=> b!1545484 (= res!1059658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1545485 () Bool)

(assert (=> b!1545485 (= e!860144 false)))

(declare-fun lt!666826 () Bool)

(declare-datatypes ((List!35939 0))(
  ( (Nil!35936) (Cons!35935 (h!37398 (_ BitVec 64)) (t!50625 List!35939)) )
))
(declare-fun arrayNoDuplicates!0 (array!102904 (_ BitVec 32) List!35939) Bool)

(assert (=> b!1545485 (= lt!666826 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35936))))

(declare-fun b!1545486 () Bool)

(declare-fun e!860148 () Bool)

(assert (=> b!1545486 (= e!860148 tp_is_empty!37777)))

(declare-fun b!1545487 () Bool)

(declare-fun mapRes!58369 () Bool)

(assert (=> b!1545487 (= e!860146 (and e!860145 mapRes!58369))))

(declare-fun condMapEmpty!58369 () Bool)

(declare-fun mapDefault!58369 () ValueCell!17978)

(assert (=> b!1545487 (= condMapEmpty!58369 (= (arr!49646 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17978)) mapDefault!58369)))))

(declare-fun mapNonEmpty!58369 () Bool)

(declare-fun tp!110896 () Bool)

(assert (=> mapNonEmpty!58369 (= mapRes!58369 (and tp!110896 e!860148))))

(declare-fun mapValue!58369 () ValueCell!17978)

(declare-fun mapRest!58369 () (Array (_ BitVec 32) ValueCell!17978))

(declare-fun mapKey!58369 () (_ BitVec 32))

(assert (=> mapNonEmpty!58369 (= (arr!49646 _values!470) (store mapRest!58369 mapKey!58369 mapValue!58369))))

(declare-fun b!1545488 () Bool)

(declare-fun res!1059659 () Bool)

(assert (=> b!1545488 (=> (not res!1059659) (not e!860144))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1545488 (= res!1059659 (and (= (size!50197 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50198 _keys!618) (size!50197 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58369 () Bool)

(assert (=> mapIsEmpty!58369 mapRes!58369))

(assert (= (and start!132200 res!1059657) b!1545488))

(assert (= (and b!1545488 res!1059659) b!1545484))

(assert (= (and b!1545484 res!1059658) b!1545485))

(assert (= (and b!1545487 condMapEmpty!58369) mapIsEmpty!58369))

(assert (= (and b!1545487 (not condMapEmpty!58369)) mapNonEmpty!58369))

(get-info :version)

(assert (= (and mapNonEmpty!58369 ((_ is ValueCellFull!17978) mapValue!58369)) b!1545486))

(assert (= (and b!1545487 ((_ is ValueCellFull!17978) mapDefault!58369)) b!1545483))

(assert (= start!132200 b!1545487))

(declare-fun m!1426743 () Bool)

(assert (=> start!132200 m!1426743))

(declare-fun m!1426745 () Bool)

(assert (=> start!132200 m!1426745))

(declare-fun m!1426747 () Bool)

(assert (=> start!132200 m!1426747))

(declare-fun m!1426749 () Bool)

(assert (=> b!1545484 m!1426749))

(declare-fun m!1426751 () Bool)

(assert (=> b!1545485 m!1426751))

(declare-fun m!1426753 () Bool)

(assert (=> mapNonEmpty!58369 m!1426753))

(check-sat (not mapNonEmpty!58369) tp_is_empty!37777 (not start!132200) (not b!1545485) (not b!1545484))
(check-sat)
