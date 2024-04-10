; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35568 () Bool)

(assert start!35568)

(declare-fun b!356559 () Bool)

(declare-fun res!197871 () Bool)

(declare-fun e!218452 () Bool)

(assert (=> b!356559 (=> (not res!197871) (not e!218452))))

(declare-datatypes ((array!19611 0))(
  ( (array!19612 (arr!9299 (Array (_ BitVec 32) (_ BitVec 64))) (size!9651 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19611)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19611 (_ BitVec 32)) Bool)

(assert (=> b!356559 (= res!197871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356560 () Bool)

(declare-fun res!197874 () Bool)

(assert (=> b!356560 (=> (not res!197874) (not e!218452))))

(declare-datatypes ((List!5372 0))(
  ( (Nil!5369) (Cons!5368 (h!6224 (_ BitVec 64)) (t!10522 List!5372)) )
))
(declare-fun arrayNoDuplicates!0 (array!19611 (_ BitVec 32) List!5372) Bool)

(assert (=> b!356560 (= res!197874 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5369))))

(declare-fun b!356561 () Bool)

(declare-fun res!197875 () Bool)

(assert (=> b!356561 (=> (not res!197875) (not e!218452))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356561 (= res!197875 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!356562 () Bool)

(declare-fun res!197870 () Bool)

(assert (=> b!356562 (=> (not res!197870) (not e!218452))))

(assert (=> b!356562 (= res!197870 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9651 _keys!1456))))))

(declare-fun mapNonEmpty!13539 () Bool)

(declare-fun mapRes!13539 () Bool)

(declare-fun tp!27516 () Bool)

(declare-fun e!218454 () Bool)

(assert (=> mapNonEmpty!13539 (= mapRes!13539 (and tp!27516 e!218454))))

(declare-datatypes ((V!11671 0))(
  ( (V!11672 (val!4055 Int)) )
))
(declare-datatypes ((ValueCell!3667 0))(
  ( (ValueCellFull!3667 (v!6249 V!11671)) (EmptyCell!3667) )
))
(declare-fun mapValue!13539 () ValueCell!3667)

(declare-datatypes ((array!19613 0))(
  ( (array!19614 (arr!9300 (Array (_ BitVec 32) ValueCell!3667)) (size!9652 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19613)

(declare-fun mapRest!13539 () (Array (_ BitVec 32) ValueCell!3667))

(declare-fun mapKey!13539 () (_ BitVec 32))

(assert (=> mapNonEmpty!13539 (= (arr!9300 _values!1208) (store mapRest!13539 mapKey!13539 mapValue!13539))))

(declare-fun mapIsEmpty!13539 () Bool)

(assert (=> mapIsEmpty!13539 mapRes!13539))

(declare-fun b!356563 () Bool)

(assert (=> b!356563 (= e!218452 (not true))))

(assert (=> b!356563 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11671)

(declare-datatypes ((Unit!10976 0))(
  ( (Unit!10977) )
))
(declare-fun lt!165947 () Unit!10976)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11671)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!7 (array!19611 array!19613 (_ BitVec 32) (_ BitVec 32) V!11671 V!11671 (_ BitVec 64) (_ BitVec 32)) Unit!10976)

(assert (=> b!356563 (= lt!165947 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!7 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun b!356564 () Bool)

(declare-fun res!197869 () Bool)

(assert (=> b!356564 (=> (not res!197869) (not e!218452))))

(assert (=> b!356564 (= res!197869 (not (= (select (arr!9299 _keys!1456) from!1805) k!1077)))))

(declare-fun b!356565 () Bool)

(declare-fun e!218455 () Bool)

(declare-fun tp_is_empty!8021 () Bool)

(assert (=> b!356565 (= e!218455 tp_is_empty!8021)))

(declare-fun b!356566 () Bool)

(declare-fun e!218456 () Bool)

(assert (=> b!356566 (= e!218456 (and e!218455 mapRes!13539))))

(declare-fun condMapEmpty!13539 () Bool)

(declare-fun mapDefault!13539 () ValueCell!3667)

