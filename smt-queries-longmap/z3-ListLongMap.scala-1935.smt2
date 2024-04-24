; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34290 () Bool)

(assert start!34290)

(declare-fun b_free!7279 () Bool)

(declare-fun b_next!7279 () Bool)

(assert (=> start!34290 (= b_free!7279 (not b_next!7279))))

(declare-fun tp!25377 () Bool)

(declare-fun b_and!14497 () Bool)

(assert (=> start!34290 (= tp!25377 b_and!14497)))

(declare-fun b!342211 () Bool)

(declare-datatypes ((Unit!10613 0))(
  ( (Unit!10614) )
))
(declare-fun e!209856 () Unit!10613)

(declare-fun Unit!10615 () Unit!10613)

(assert (=> b!342211 (= e!209856 Unit!10615)))

(declare-fun mapIsEmpty!12279 () Bool)

(declare-fun mapRes!12279 () Bool)

(assert (=> mapIsEmpty!12279 mapRes!12279))

(declare-fun b!342212 () Bool)

(declare-fun e!209860 () Bool)

(declare-fun tp_is_empty!7231 () Bool)

(assert (=> b!342212 (= e!209860 tp_is_empty!7231)))

(declare-fun b!342213 () Bool)

(declare-fun res!189184 () Bool)

(declare-fun e!209861 () Bool)

(assert (=> b!342213 (=> (not res!189184) (not e!209861))))

(declare-datatypes ((array!18050 0))(
  ( (array!18051 (arr!8543 (Array (_ BitVec 32) (_ BitVec 64))) (size!8895 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18050)

(declare-datatypes ((List!4822 0))(
  ( (Nil!4819) (Cons!4818 (h!5674 (_ BitVec 64)) (t!9926 List!4822)) )
))
(declare-fun arrayNoDuplicates!0 (array!18050 (_ BitVec 32) List!4822) Bool)

(assert (=> b!342213 (= res!189184 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4819))))

(declare-fun b!342214 () Bool)

(declare-fun res!189182 () Bool)

(assert (=> b!342214 (=> (not res!189182) (not e!209861))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!342214 (= res!189182 (validKeyInArray!0 k0!1348))))

(declare-fun b!342215 () Bool)

(declare-fun e!209859 () Bool)

(assert (=> b!342215 (= e!209861 e!209859)))

(declare-fun res!189185 () Bool)

(assert (=> b!342215 (=> (not res!189185) (not e!209859))))

(declare-datatypes ((SeekEntryResult!3252 0))(
  ( (MissingZero!3252 (index!15187 (_ BitVec 32))) (Found!3252 (index!15188 (_ BitVec 32))) (Intermediate!3252 (undefined!4064 Bool) (index!15189 (_ BitVec 32)) (x!34031 (_ BitVec 32))) (Undefined!3252) (MissingVacant!3252 (index!15190 (_ BitVec 32))) )
))
(declare-fun lt!162124 () SeekEntryResult!3252)

(get-info :version)

(assert (=> b!342215 (= res!189185 (and (not ((_ is Found!3252) lt!162124)) (not ((_ is MissingZero!3252) lt!162124)) ((_ is MissingVacant!3252) lt!162124)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18050 (_ BitVec 32)) SeekEntryResult!3252)

(assert (=> b!342215 (= lt!162124 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!342210 () Bool)

(declare-fun res!189186 () Bool)

(assert (=> b!342210 (=> (not res!189186) (not e!209861))))

(declare-datatypes ((V!10619 0))(
  ( (V!10620 (val!3660 Int)) )
))
(declare-fun zeroValue!1467 () V!10619)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3272 0))(
  ( (ValueCellFull!3272 (v!5835 V!10619)) (EmptyCell!3272) )
))
(declare-datatypes ((array!18052 0))(
  ( (array!18053 (arr!8544 (Array (_ BitVec 32) ValueCell!3272)) (size!8896 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18052)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10619)

(declare-datatypes ((tuple2!5220 0))(
  ( (tuple2!5221 (_1!2621 (_ BitVec 64)) (_2!2621 V!10619)) )
))
(declare-datatypes ((List!4823 0))(
  ( (Nil!4820) (Cons!4819 (h!5675 tuple2!5220) (t!9927 List!4823)) )
))
(declare-datatypes ((ListLongMap!4135 0))(
  ( (ListLongMap!4136 (toList!2083 List!4823)) )
))
(declare-fun contains!2158 (ListLongMap!4135 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1612 (array!18050 array!18052 (_ BitVec 32) (_ BitVec 32) V!10619 V!10619 (_ BitVec 32) Int) ListLongMap!4135)

(assert (=> b!342210 (= res!189186 (not (contains!2158 (getCurrentListMap!1612 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!189188 () Bool)

(assert (=> start!34290 (=> (not res!189188) (not e!209861))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34290 (= res!189188 (validMask!0 mask!2385))))

(assert (=> start!34290 e!209861))

(assert (=> start!34290 true))

(assert (=> start!34290 tp_is_empty!7231))

(assert (=> start!34290 tp!25377))

(declare-fun e!209858 () Bool)

(declare-fun array_inv!6320 (array!18052) Bool)

(assert (=> start!34290 (and (array_inv!6320 _values!1525) e!209858)))

(declare-fun array_inv!6321 (array!18050) Bool)

(assert (=> start!34290 (array_inv!6321 _keys!1895)))

(declare-fun b!342216 () Bool)

(assert (=> b!342216 (= e!209858 (and e!209860 mapRes!12279))))

(declare-fun condMapEmpty!12279 () Bool)

(declare-fun mapDefault!12279 () ValueCell!3272)

(assert (=> b!342216 (= condMapEmpty!12279 (= (arr!8544 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3272)) mapDefault!12279)))))

(declare-fun b!342217 () Bool)

(declare-fun e!209857 () Bool)

(assert (=> b!342217 (= e!209857 tp_is_empty!7231)))

(declare-fun mapNonEmpty!12279 () Bool)

(declare-fun tp!25376 () Bool)

(assert (=> mapNonEmpty!12279 (= mapRes!12279 (and tp!25376 e!209857))))

(declare-fun mapRest!12279 () (Array (_ BitVec 32) ValueCell!3272))

(declare-fun mapValue!12279 () ValueCell!3272)

(declare-fun mapKey!12279 () (_ BitVec 32))

(assert (=> mapNonEmpty!12279 (= (arr!8544 _values!1525) (store mapRest!12279 mapKey!12279 mapValue!12279))))

(declare-fun b!342218 () Bool)

(declare-fun res!189183 () Bool)

(assert (=> b!342218 (=> (not res!189183) (not e!209861))))

(assert (=> b!342218 (= res!189183 (and (= (size!8896 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8895 _keys!1895) (size!8896 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!342219 () Bool)

(declare-fun Unit!10616 () Unit!10613)

(assert (=> b!342219 (= e!209856 Unit!10616)))

(declare-fun lt!162123 () Unit!10613)

(declare-fun lemmaArrayContainsKeyThenInListMap!305 (array!18050 array!18052 (_ BitVec 32) (_ BitVec 32) V!10619 V!10619 (_ BitVec 64) (_ BitVec 32) Int) Unit!10613)

(declare-fun arrayScanForKey!0 (array!18050 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!342219 (= lt!162123 (lemmaArrayContainsKeyThenInListMap!305 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!342219 false))

(declare-fun b!342220 () Bool)

(assert (=> b!342220 (= e!209859 false)))

(declare-fun lt!162122 () Unit!10613)

(assert (=> b!342220 (= lt!162122 e!209856)))

(declare-fun c!52775 () Bool)

(declare-fun arrayContainsKey!0 (array!18050 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342220 (= c!52775 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!342221 () Bool)

(declare-fun res!189187 () Bool)

(assert (=> b!342221 (=> (not res!189187) (not e!209861))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18050 (_ BitVec 32)) Bool)

(assert (=> b!342221 (= res!189187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!34290 res!189188) b!342218))

(assert (= (and b!342218 res!189183) b!342221))

(assert (= (and b!342221 res!189187) b!342213))

(assert (= (and b!342213 res!189184) b!342214))

(assert (= (and b!342214 res!189182) b!342210))

(assert (= (and b!342210 res!189186) b!342215))

(assert (= (and b!342215 res!189185) b!342220))

(assert (= (and b!342220 c!52775) b!342219))

(assert (= (and b!342220 (not c!52775)) b!342211))

(assert (= (and b!342216 condMapEmpty!12279) mapIsEmpty!12279))

(assert (= (and b!342216 (not condMapEmpty!12279)) mapNonEmpty!12279))

(assert (= (and mapNonEmpty!12279 ((_ is ValueCellFull!3272) mapValue!12279)) b!342217))

(assert (= (and b!342216 ((_ is ValueCellFull!3272) mapDefault!12279)) b!342212))

(assert (= start!34290 b!342216))

(declare-fun m!344691 () Bool)

(assert (=> b!342220 m!344691))

(declare-fun m!344693 () Bool)

(assert (=> b!342214 m!344693))

(declare-fun m!344695 () Bool)

(assert (=> mapNonEmpty!12279 m!344695))

(declare-fun m!344697 () Bool)

(assert (=> b!342221 m!344697))

(declare-fun m!344699 () Bool)

(assert (=> b!342215 m!344699))

(declare-fun m!344701 () Bool)

(assert (=> b!342210 m!344701))

(assert (=> b!342210 m!344701))

(declare-fun m!344703 () Bool)

(assert (=> b!342210 m!344703))

(declare-fun m!344705 () Bool)

(assert (=> b!342213 m!344705))

(declare-fun m!344707 () Bool)

(assert (=> start!34290 m!344707))

(declare-fun m!344709 () Bool)

(assert (=> start!34290 m!344709))

(declare-fun m!344711 () Bool)

(assert (=> start!34290 m!344711))

(declare-fun m!344713 () Bool)

(assert (=> b!342219 m!344713))

(assert (=> b!342219 m!344713))

(declare-fun m!344715 () Bool)

(assert (=> b!342219 m!344715))

(check-sat (not b!342214) (not b!342219) (not b!342215) (not start!34290) (not b!342221) tp_is_empty!7231 (not b_next!7279) (not mapNonEmpty!12279) (not b!342220) (not b!342210) b_and!14497 (not b!342213))
(check-sat b_and!14497 (not b_next!7279))
