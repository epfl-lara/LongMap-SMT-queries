; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34312 () Bool)

(assert start!34312)

(declare-fun b_free!7287 () Bool)

(declare-fun b_next!7287 () Bool)

(assert (=> start!34312 (= b_free!7287 (not b_next!7287))))

(declare-fun tp!25400 () Bool)

(declare-fun b_and!14491 () Bool)

(assert (=> start!34312 (= tp!25400 b_and!14491)))

(declare-fun b!342407 () Bool)

(declare-fun e!209976 () Bool)

(declare-fun tp_is_empty!7239 () Bool)

(assert (=> b!342407 (= e!209976 tp_is_empty!7239)))

(declare-fun b!342408 () Bool)

(declare-fun e!209977 () Bool)

(declare-fun e!209978 () Bool)

(declare-fun mapRes!12291 () Bool)

(assert (=> b!342408 (= e!209977 (and e!209978 mapRes!12291))))

(declare-fun condMapEmpty!12291 () Bool)

(declare-datatypes ((V!10629 0))(
  ( (V!10630 (val!3664 Int)) )
))
(declare-datatypes ((ValueCell!3276 0))(
  ( (ValueCellFull!3276 (v!5838 V!10629)) (EmptyCell!3276) )
))
(declare-datatypes ((array!18073 0))(
  ( (array!18074 (arr!8555 (Array (_ BitVec 32) ValueCell!3276)) (size!8907 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18073)

(declare-fun mapDefault!12291 () ValueCell!3276)

(assert (=> b!342408 (= condMapEmpty!12291 (= (arr!8555 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3276)) mapDefault!12291)))))

(declare-fun mapNonEmpty!12291 () Bool)

(declare-fun tp!25401 () Bool)

(assert (=> mapNonEmpty!12291 (= mapRes!12291 (and tp!25401 e!209976))))

(declare-fun mapKey!12291 () (_ BitVec 32))

(declare-fun mapRest!12291 () (Array (_ BitVec 32) ValueCell!3276))

(declare-fun mapValue!12291 () ValueCell!3276)

(assert (=> mapNonEmpty!12291 (= (arr!8555 _values!1525) (store mapRest!12291 mapKey!12291 mapValue!12291))))

(declare-fun res!189275 () Bool)

(declare-fun e!209979 () Bool)

(assert (=> start!34312 (=> (not res!189275) (not e!209979))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34312 (= res!189275 (validMask!0 mask!2385))))

(assert (=> start!34312 e!209979))

(assert (=> start!34312 true))

(assert (=> start!34312 tp_is_empty!7239))

(assert (=> start!34312 tp!25400))

(declare-fun array_inv!6336 (array!18073) Bool)

(assert (=> start!34312 (and (array_inv!6336 _values!1525) e!209977)))

(declare-datatypes ((array!18075 0))(
  ( (array!18076 (arr!8556 (Array (_ BitVec 32) (_ BitVec 64))) (size!8908 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18075)

(declare-fun array_inv!6337 (array!18075) Bool)

(assert (=> start!34312 (array_inv!6337 _keys!1895)))

(declare-fun b!342409 () Bool)

(declare-fun res!189274 () Bool)

(assert (=> b!342409 (=> (not res!189274) (not e!209979))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!342409 (= res!189274 (validKeyInArray!0 k0!1348))))

(declare-fun b!342410 () Bool)

(declare-datatypes ((Unit!10660 0))(
  ( (Unit!10661) )
))
(declare-fun e!209974 () Unit!10660)

(declare-fun Unit!10662 () Unit!10660)

(assert (=> b!342410 (= e!209974 Unit!10662)))

(declare-fun zeroValue!1467 () V!10629)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10629)

(declare-fun lt!162147 () Unit!10660)

(declare-fun lemmaArrayContainsKeyThenInListMap!301 (array!18075 array!18073 (_ BitVec 32) (_ BitVec 32) V!10629 V!10629 (_ BitVec 64) (_ BitVec 32) Int) Unit!10660)

(declare-fun arrayScanForKey!0 (array!18075 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!342410 (= lt!162147 (lemmaArrayContainsKeyThenInListMap!301 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!342410 false))

(declare-fun b!342411 () Bool)

(declare-fun res!189273 () Bool)

(assert (=> b!342411 (=> (not res!189273) (not e!209979))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18075 (_ BitVec 32)) Bool)

(assert (=> b!342411 (= res!189273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun e!209975 () Bool)

(declare-fun lt!162146 () Bool)

(declare-fun b!342412 () Bool)

(assert (=> b!342412 (= e!209975 (and (not lt!162146) (not (= (size!8908 _keys!1895) (bvadd #b00000000000000000000000000000001 mask!2385)))))))

(declare-fun lt!162145 () Unit!10660)

(assert (=> b!342412 (= lt!162145 e!209974)))

(declare-fun c!52812 () Bool)

(assert (=> b!342412 (= c!52812 lt!162146)))

(declare-fun arrayContainsKey!0 (array!18075 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342412 (= lt!162146 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!342413 () Bool)

(assert (=> b!342413 (= e!209978 tp_is_empty!7239)))

(declare-fun mapIsEmpty!12291 () Bool)

(assert (=> mapIsEmpty!12291 mapRes!12291))

(declare-fun b!342414 () Bool)

(declare-fun res!189269 () Bool)

(assert (=> b!342414 (=> (not res!189269) (not e!209979))))

(assert (=> b!342414 (= res!189269 (and (= (size!8907 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8908 _keys!1895) (size!8907 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!342415 () Bool)

(declare-fun Unit!10663 () Unit!10660)

(assert (=> b!342415 (= e!209974 Unit!10663)))

(declare-fun b!342416 () Bool)

(assert (=> b!342416 (= e!209979 e!209975)))

(declare-fun res!189270 () Bool)

(assert (=> b!342416 (=> (not res!189270) (not e!209975))))

(declare-datatypes ((SeekEntryResult!3302 0))(
  ( (MissingZero!3302 (index!15387 (_ BitVec 32))) (Found!3302 (index!15388 (_ BitVec 32))) (Intermediate!3302 (undefined!4114 Bool) (index!15389 (_ BitVec 32)) (x!34092 (_ BitVec 32))) (Undefined!3302) (MissingVacant!3302 (index!15390 (_ BitVec 32))) )
))
(declare-fun lt!162148 () SeekEntryResult!3302)

(get-info :version)

(assert (=> b!342416 (= res!189270 (and (not ((_ is Found!3302) lt!162148)) (not ((_ is MissingZero!3302) lt!162148)) ((_ is MissingVacant!3302) lt!162148)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18075 (_ BitVec 32)) SeekEntryResult!3302)

(assert (=> b!342416 (= lt!162148 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!342417 () Bool)

(declare-fun res!189272 () Bool)

(assert (=> b!342417 (=> (not res!189272) (not e!209979))))

(declare-datatypes ((List!4929 0))(
  ( (Nil!4926) (Cons!4925 (h!5781 (_ BitVec 64)) (t!10041 List!4929)) )
))
(declare-fun arrayNoDuplicates!0 (array!18075 (_ BitVec 32) List!4929) Bool)

(assert (=> b!342417 (= res!189272 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4926))))

(declare-fun b!342418 () Bool)

(declare-fun res!189271 () Bool)

(assert (=> b!342418 (=> (not res!189271) (not e!209979))))

(declare-datatypes ((tuple2!5312 0))(
  ( (tuple2!5313 (_1!2667 (_ BitVec 64)) (_2!2667 V!10629)) )
))
(declare-datatypes ((List!4930 0))(
  ( (Nil!4927) (Cons!4926 (h!5782 tuple2!5312) (t!10042 List!4930)) )
))
(declare-datatypes ((ListLongMap!4225 0))(
  ( (ListLongMap!4226 (toList!2128 List!4930)) )
))
(declare-fun contains!2184 (ListLongMap!4225 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1649 (array!18075 array!18073 (_ BitVec 32) (_ BitVec 32) V!10629 V!10629 (_ BitVec 32) Int) ListLongMap!4225)

(assert (=> b!342418 (= res!189271 (not (contains!2184 (getCurrentListMap!1649 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!34312 res!189275) b!342414))

(assert (= (and b!342414 res!189269) b!342411))

(assert (= (and b!342411 res!189273) b!342417))

(assert (= (and b!342417 res!189272) b!342409))

(assert (= (and b!342409 res!189274) b!342418))

(assert (= (and b!342418 res!189271) b!342416))

(assert (= (and b!342416 res!189270) b!342412))

(assert (= (and b!342412 c!52812) b!342410))

(assert (= (and b!342412 (not c!52812)) b!342415))

(assert (= (and b!342408 condMapEmpty!12291) mapIsEmpty!12291))

(assert (= (and b!342408 (not condMapEmpty!12291)) mapNonEmpty!12291))

(assert (= (and mapNonEmpty!12291 ((_ is ValueCellFull!3276) mapValue!12291)) b!342407))

(assert (= (and b!342408 ((_ is ValueCellFull!3276) mapDefault!12291)) b!342413))

(assert (= start!34312 b!342408))

(declare-fun m!344571 () Bool)

(assert (=> b!342418 m!344571))

(assert (=> b!342418 m!344571))

(declare-fun m!344573 () Bool)

(assert (=> b!342418 m!344573))

(declare-fun m!344575 () Bool)

(assert (=> b!342412 m!344575))

(declare-fun m!344577 () Bool)

(assert (=> b!342411 m!344577))

(declare-fun m!344579 () Bool)

(assert (=> b!342416 m!344579))

(declare-fun m!344581 () Bool)

(assert (=> mapNonEmpty!12291 m!344581))

(declare-fun m!344583 () Bool)

(assert (=> start!34312 m!344583))

(declare-fun m!344585 () Bool)

(assert (=> start!34312 m!344585))

(declare-fun m!344587 () Bool)

(assert (=> start!34312 m!344587))

(declare-fun m!344589 () Bool)

(assert (=> b!342410 m!344589))

(assert (=> b!342410 m!344589))

(declare-fun m!344591 () Bool)

(assert (=> b!342410 m!344591))

(declare-fun m!344593 () Bool)

(assert (=> b!342409 m!344593))

(declare-fun m!344595 () Bool)

(assert (=> b!342417 m!344595))

(check-sat (not b!342410) tp_is_empty!7239 (not b!342411) (not b!342416) (not b!342418) (not b_next!7287) (not b!342409) b_and!14491 (not b!342412) (not mapNonEmpty!12291) (not b!342417) (not start!34312))
(check-sat b_and!14491 (not b_next!7287))
