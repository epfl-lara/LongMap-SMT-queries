; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35562 () Bool)

(assert start!35562)

(declare-fun b!356460 () Bool)

(declare-fun res!197800 () Bool)

(declare-fun e!218410 () Bool)

(assert (=> b!356460 (=> (not res!197800) (not e!218410))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19599 0))(
  ( (array!19600 (arr!9293 (Array (_ BitVec 32) (_ BitVec 64))) (size!9645 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19599)

(declare-datatypes ((V!11663 0))(
  ( (V!11664 (val!4052 Int)) )
))
(declare-datatypes ((ValueCell!3664 0))(
  ( (ValueCellFull!3664 (v!6246 V!11663)) (EmptyCell!3664) )
))
(declare-datatypes ((array!19601 0))(
  ( (array!19602 (arr!9294 (Array (_ BitVec 32) ValueCell!3664)) (size!9646 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19601)

(assert (=> b!356460 (= res!197800 (and (= (size!9646 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9645 _keys!1456) (size!9646 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!356461 () Bool)

(declare-fun res!197799 () Bool)

(assert (=> b!356461 (=> (not res!197799) (not e!218410))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19599 (_ BitVec 32)) Bool)

(assert (=> b!356461 (= res!197799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13530 () Bool)

(declare-fun mapRes!13530 () Bool)

(declare-fun tp!27507 () Bool)

(declare-fun e!218407 () Bool)

(assert (=> mapNonEmpty!13530 (= mapRes!13530 (and tp!27507 e!218407))))

(declare-fun mapRest!13530 () (Array (_ BitVec 32) ValueCell!3664))

(declare-fun mapValue!13530 () ValueCell!3664)

(declare-fun mapKey!13530 () (_ BitVec 32))

(assert (=> mapNonEmpty!13530 (= (arr!9294 _values!1208) (store mapRest!13530 mapKey!13530 mapValue!13530))))

(declare-fun res!197801 () Bool)

(assert (=> start!35562 (=> (not res!197801) (not e!218410))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35562 (= res!197801 (validMask!0 mask!1842))))

(assert (=> start!35562 e!218410))

(declare-fun tp_is_empty!8015 () Bool)

(assert (=> start!35562 tp_is_empty!8015))

(assert (=> start!35562 true))

(declare-fun array_inv!6830 (array!19599) Bool)

(assert (=> start!35562 (array_inv!6830 _keys!1456)))

(declare-fun e!218409 () Bool)

(declare-fun array_inv!6831 (array!19601) Bool)

(assert (=> start!35562 (and (array_inv!6831 _values!1208) e!218409)))

(declare-fun b!356462 () Bool)

(declare-fun res!197796 () Bool)

(assert (=> b!356462 (=> (not res!197796) (not e!218410))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!356462 (= res!197796 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9645 _keys!1456))))))

(declare-fun b!356463 () Bool)

(declare-fun res!197803 () Bool)

(assert (=> b!356463 (=> (not res!197803) (not e!218410))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356463 (= res!197803 (validKeyInArray!0 k!1077))))

(declare-fun b!356464 () Bool)

(declare-fun res!197797 () Bool)

(assert (=> b!356464 (=> (not res!197797) (not e!218410))))

(declare-fun arrayContainsKey!0 (array!19599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356464 (= res!197797 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!356465 () Bool)

(assert (=> b!356465 (= e!218407 tp_is_empty!8015)))

(declare-fun b!356466 () Bool)

(declare-fun res!197798 () Bool)

(assert (=> b!356466 (=> (not res!197798) (not e!218410))))

(declare-datatypes ((List!5370 0))(
  ( (Nil!5367) (Cons!5366 (h!6222 (_ BitVec 64)) (t!10520 List!5370)) )
))
(declare-fun arrayNoDuplicates!0 (array!19599 (_ BitVec 32) List!5370) Bool)

(assert (=> b!356466 (= res!197798 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5367))))

(declare-fun b!356467 () Bool)

(declare-fun res!197802 () Bool)

(assert (=> b!356467 (=> (not res!197802) (not e!218410))))

(assert (=> b!356467 (= res!197802 (not (= (select (arr!9293 _keys!1456) from!1805) k!1077)))))

(declare-fun b!356468 () Bool)

(assert (=> b!356468 (= e!218410 (not true))))

(assert (=> b!356468 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11663)

(declare-datatypes ((Unit!10972 0))(
  ( (Unit!10973) )
))
(declare-fun lt!165938 () Unit!10972)

(declare-fun zeroValue!1150 () V!11663)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!5 (array!19599 array!19601 (_ BitVec 32) (_ BitVec 32) V!11663 V!11663 (_ BitVec 64) (_ BitVec 32)) Unit!10972)

(assert (=> b!356468 (= lt!165938 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!5 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun b!356469 () Bool)

(declare-fun e!218408 () Bool)

(assert (=> b!356469 (= e!218408 tp_is_empty!8015)))

(declare-fun mapIsEmpty!13530 () Bool)

(assert (=> mapIsEmpty!13530 mapRes!13530))

(declare-fun b!356470 () Bool)

(assert (=> b!356470 (= e!218409 (and e!218408 mapRes!13530))))

(declare-fun condMapEmpty!13530 () Bool)

(declare-fun mapDefault!13530 () ValueCell!3664)

