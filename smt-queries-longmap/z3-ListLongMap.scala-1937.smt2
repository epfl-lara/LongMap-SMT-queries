; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34302 () Bool)

(assert start!34302)

(declare-fun b_free!7291 () Bool)

(declare-fun b_next!7291 () Bool)

(assert (=> start!34302 (= b_free!7291 (not b_next!7291))))

(declare-fun tp!25413 () Bool)

(declare-fun b_and!14469 () Bool)

(assert (=> start!34302 (= tp!25413 b_and!14469)))

(declare-fun b!342204 () Bool)

(declare-fun e!209840 () Bool)

(declare-fun tp_is_empty!7243 () Bool)

(assert (=> b!342204 (= e!209840 tp_is_empty!7243)))

(declare-fun b!342205 () Bool)

(declare-datatypes ((Unit!10628 0))(
  ( (Unit!10629) )
))
(declare-fun e!209843 () Unit!10628)

(declare-fun Unit!10630 () Unit!10628)

(assert (=> b!342205 (= e!209843 Unit!10630)))

(declare-fun b!342206 () Bool)

(declare-fun res!189185 () Bool)

(declare-fun e!209841 () Bool)

(assert (=> b!342206 (=> (not res!189185) (not e!209841))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10635 0))(
  ( (V!10636 (val!3666 Int)) )
))
(declare-datatypes ((ValueCell!3278 0))(
  ( (ValueCellFull!3278 (v!5834 V!10635)) (EmptyCell!3278) )
))
(declare-datatypes ((array!18065 0))(
  ( (array!18066 (arr!8551 (Array (_ BitVec 32) ValueCell!3278)) (size!8904 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18065)

(declare-datatypes ((array!18067 0))(
  ( (array!18068 (arr!8552 (Array (_ BitVec 32) (_ BitVec 64))) (size!8905 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18067)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!342206 (= res!189185 (and (= (size!8904 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8905 _keys!1895) (size!8904 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!342207 () Bool)

(declare-fun res!189188 () Bool)

(assert (=> b!342207 (=> (not res!189188) (not e!209841))))

(declare-datatypes ((List!4885 0))(
  ( (Nil!4882) (Cons!4881 (h!5737 (_ BitVec 64)) (t!9988 List!4885)) )
))
(declare-fun arrayNoDuplicates!0 (array!18067 (_ BitVec 32) List!4885) Bool)

(assert (=> b!342207 (= res!189188 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4882))))

(declare-fun b!342208 () Bool)

(declare-fun e!209844 () Bool)

(assert (=> b!342208 (= e!209844 tp_is_empty!7243)))

(declare-fun res!189182 () Bool)

(assert (=> start!34302 (=> (not res!189182) (not e!209841))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34302 (= res!189182 (validMask!0 mask!2385))))

(assert (=> start!34302 e!209841))

(assert (=> start!34302 true))

(assert (=> start!34302 tp_is_empty!7243))

(assert (=> start!34302 tp!25413))

(declare-fun e!209842 () Bool)

(declare-fun array_inv!6358 (array!18065) Bool)

(assert (=> start!34302 (and (array_inv!6358 _values!1525) e!209842)))

(declare-fun array_inv!6359 (array!18067) Bool)

(assert (=> start!34302 (array_inv!6359 _keys!1895)))

(declare-fun b!342209 () Bool)

(declare-fun res!189183 () Bool)

(assert (=> b!342209 (=> (not res!189183) (not e!209841))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18067 (_ BitVec 32)) Bool)

(assert (=> b!342209 (= res!189183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12297 () Bool)

(declare-fun mapRes!12297 () Bool)

(declare-fun tp!25412 () Bool)

(assert (=> mapNonEmpty!12297 (= mapRes!12297 (and tp!25412 e!209840))))

(declare-fun mapKey!12297 () (_ BitVec 32))

(declare-fun mapValue!12297 () ValueCell!3278)

(declare-fun mapRest!12297 () (Array (_ BitVec 32) ValueCell!3278))

(assert (=> mapNonEmpty!12297 (= (arr!8551 _values!1525) (store mapRest!12297 mapKey!12297 mapValue!12297))))

(declare-fun b!342210 () Bool)

(declare-fun e!209839 () Bool)

(assert (=> b!342210 (= e!209841 e!209839)))

(declare-fun res!189187 () Bool)

(assert (=> b!342210 (=> (not res!189187) (not e!209839))))

(declare-datatypes ((SeekEntryResult!3296 0))(
  ( (MissingZero!3296 (index!15363 (_ BitVec 32))) (Found!3296 (index!15364 (_ BitVec 32))) (Intermediate!3296 (undefined!4108 Bool) (index!15365 (_ BitVec 32)) (x!34089 (_ BitVec 32))) (Undefined!3296) (MissingVacant!3296 (index!15366 (_ BitVec 32))) )
))
(declare-fun lt!161933 () SeekEntryResult!3296)

(get-info :version)

(assert (=> b!342210 (= res!189187 (and (not ((_ is Found!3296) lt!161933)) (not ((_ is MissingZero!3296) lt!161933)) ((_ is MissingVacant!3296) lt!161933)))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18067 (_ BitVec 32)) SeekEntryResult!3296)

(assert (=> b!342210 (= lt!161933 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!342211 () Bool)

(assert (=> b!342211 (= e!209839 false)))

(declare-fun lt!161934 () Unit!10628)

(assert (=> b!342211 (= lt!161934 e!209843)))

(declare-fun c!52745 () Bool)

(declare-fun arrayContainsKey!0 (array!18067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342211 (= c!52745 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!342212 () Bool)

(declare-fun Unit!10631 () Unit!10628)

(assert (=> b!342212 (= e!209843 Unit!10631)))

(declare-fun zeroValue!1467 () V!10635)

(declare-fun defaultEntry!1528 () Int)

(declare-fun lt!161932 () Unit!10628)

(declare-fun minValue!1467 () V!10635)

(declare-fun lemmaArrayContainsKeyThenInListMap!299 (array!18067 array!18065 (_ BitVec 32) (_ BitVec 32) V!10635 V!10635 (_ BitVec 64) (_ BitVec 32) Int) Unit!10628)

(declare-fun arrayScanForKey!0 (array!18067 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!342212 (= lt!161932 (lemmaArrayContainsKeyThenInListMap!299 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!342212 false))

(declare-fun b!342213 () Bool)

(assert (=> b!342213 (= e!209842 (and e!209844 mapRes!12297))))

(declare-fun condMapEmpty!12297 () Bool)

(declare-fun mapDefault!12297 () ValueCell!3278)

(assert (=> b!342213 (= condMapEmpty!12297 (= (arr!8551 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3278)) mapDefault!12297)))))

(declare-fun b!342214 () Bool)

(declare-fun res!189186 () Bool)

(assert (=> b!342214 (=> (not res!189186) (not e!209841))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!342214 (= res!189186 (validKeyInArray!0 k0!1348))))

(declare-fun b!342215 () Bool)

(declare-fun res!189184 () Bool)

(assert (=> b!342215 (=> (not res!189184) (not e!209841))))

(declare-datatypes ((tuple2!5262 0))(
  ( (tuple2!5263 (_1!2642 (_ BitVec 64)) (_2!2642 V!10635)) )
))
(declare-datatypes ((List!4886 0))(
  ( (Nil!4883) (Cons!4882 (h!5738 tuple2!5262) (t!9989 List!4886)) )
))
(declare-datatypes ((ListLongMap!4165 0))(
  ( (ListLongMap!4166 (toList!2098 List!4886)) )
))
(declare-fun contains!2165 (ListLongMap!4165 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1604 (array!18067 array!18065 (_ BitVec 32) (_ BitVec 32) V!10635 V!10635 (_ BitVec 32) Int) ListLongMap!4165)

(assert (=> b!342215 (= res!189184 (not (contains!2165 (getCurrentListMap!1604 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapIsEmpty!12297 () Bool)

(assert (=> mapIsEmpty!12297 mapRes!12297))

(assert (= (and start!34302 res!189182) b!342206))

(assert (= (and b!342206 res!189185) b!342209))

(assert (= (and b!342209 res!189183) b!342207))

(assert (= (and b!342207 res!189188) b!342214))

(assert (= (and b!342214 res!189186) b!342215))

(assert (= (and b!342215 res!189184) b!342210))

(assert (= (and b!342210 res!189187) b!342211))

(assert (= (and b!342211 c!52745) b!342212))

(assert (= (and b!342211 (not c!52745)) b!342205))

(assert (= (and b!342213 condMapEmpty!12297) mapIsEmpty!12297))

(assert (= (and b!342213 (not condMapEmpty!12297)) mapNonEmpty!12297))

(assert (= (and mapNonEmpty!12297 ((_ is ValueCellFull!3278) mapValue!12297)) b!342204))

(assert (= (and b!342213 ((_ is ValueCellFull!3278) mapDefault!12297)) b!342208))

(assert (= start!34302 b!342213))

(declare-fun m!343893 () Bool)

(assert (=> b!342214 m!343893))

(declare-fun m!343895 () Bool)

(assert (=> mapNonEmpty!12297 m!343895))

(declare-fun m!343897 () Bool)

(assert (=> b!342212 m!343897))

(assert (=> b!342212 m!343897))

(declare-fun m!343899 () Bool)

(assert (=> b!342212 m!343899))

(declare-fun m!343901 () Bool)

(assert (=> start!34302 m!343901))

(declare-fun m!343903 () Bool)

(assert (=> start!34302 m!343903))

(declare-fun m!343905 () Bool)

(assert (=> start!34302 m!343905))

(declare-fun m!343907 () Bool)

(assert (=> b!342210 m!343907))

(declare-fun m!343909 () Bool)

(assert (=> b!342207 m!343909))

(declare-fun m!343911 () Bool)

(assert (=> b!342211 m!343911))

(declare-fun m!343913 () Bool)

(assert (=> b!342209 m!343913))

(declare-fun m!343915 () Bool)

(assert (=> b!342215 m!343915))

(assert (=> b!342215 m!343915))

(declare-fun m!343917 () Bool)

(assert (=> b!342215 m!343917))

(check-sat (not b!342211) (not b!342210) (not start!34302) (not b!342215) (not mapNonEmpty!12297) (not b!342207) (not b!342212) b_and!14469 (not b_next!7291) (not b!342214) (not b!342209) tp_is_empty!7243)
(check-sat b_and!14469 (not b_next!7291))
