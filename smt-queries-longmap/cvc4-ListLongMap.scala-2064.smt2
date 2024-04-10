; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35556 () Bool)

(assert start!35556)

(declare-fun b!356361 () Bool)

(declare-fun res!197724 () Bool)

(declare-fun e!218363 () Bool)

(assert (=> b!356361 (=> (not res!197724) (not e!218363))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356361 (= res!197724 (validKeyInArray!0 k!1077))))

(declare-fun b!356362 () Bool)

(declare-fun res!197726 () Bool)

(assert (=> b!356362 (=> (not res!197726) (not e!218363))))

(declare-datatypes ((array!19589 0))(
  ( (array!19590 (arr!9288 (Array (_ BitVec 32) (_ BitVec 64))) (size!9640 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19589)

(declare-datatypes ((List!5368 0))(
  ( (Nil!5365) (Cons!5364 (h!6220 (_ BitVec 64)) (t!10518 List!5368)) )
))
(declare-fun arrayNoDuplicates!0 (array!19589 (_ BitVec 32) List!5368) Bool)

(assert (=> b!356362 (= res!197726 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5365))))

(declare-fun res!197725 () Bool)

(assert (=> start!35556 (=> (not res!197725) (not e!218363))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35556 (= res!197725 (validMask!0 mask!1842))))

(assert (=> start!35556 e!218363))

(declare-fun tp_is_empty!8009 () Bool)

(assert (=> start!35556 tp_is_empty!8009))

(assert (=> start!35556 true))

(declare-fun array_inv!6826 (array!19589) Bool)

(assert (=> start!35556 (array_inv!6826 _keys!1456)))

(declare-datatypes ((V!11655 0))(
  ( (V!11656 (val!4049 Int)) )
))
(declare-datatypes ((ValueCell!3661 0))(
  ( (ValueCellFull!3661 (v!6243 V!11655)) (EmptyCell!3661) )
))
(declare-datatypes ((array!19591 0))(
  ( (array!19592 (arr!9289 (Array (_ BitVec 32) ValueCell!3661)) (size!9641 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19591)

(declare-fun e!218362 () Bool)

(declare-fun array_inv!6827 (array!19591) Bool)

(assert (=> start!35556 (and (array_inv!6827 _values!1208) e!218362)))

(declare-fun b!356363 () Bool)

(declare-fun res!197730 () Bool)

(assert (=> b!356363 (=> (not res!197730) (not e!218363))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!356363 (= res!197730 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9640 _keys!1456))))))

(declare-fun b!356364 () Bool)

(declare-fun e!218364 () Bool)

(assert (=> b!356364 (= e!218364 tp_is_empty!8009)))

(declare-fun mapIsEmpty!13521 () Bool)

(declare-fun mapRes!13521 () Bool)

(assert (=> mapIsEmpty!13521 mapRes!13521))

(declare-fun b!356365 () Bool)

(declare-fun res!197728 () Bool)

(assert (=> b!356365 (=> (not res!197728) (not e!218363))))

(assert (=> b!356365 (= res!197728 (not (= (select (arr!9288 _keys!1456) from!1805) k!1077)))))

(declare-fun b!356366 () Bool)

(declare-fun e!218366 () Bool)

(assert (=> b!356366 (= e!218366 tp_is_empty!8009)))

(declare-fun mapNonEmpty!13521 () Bool)

(declare-fun tp!27498 () Bool)

(assert (=> mapNonEmpty!13521 (= mapRes!13521 (and tp!27498 e!218364))))

(declare-fun mapRest!13521 () (Array (_ BitVec 32) ValueCell!3661))

(declare-fun mapValue!13521 () ValueCell!3661)

(declare-fun mapKey!13521 () (_ BitVec 32))

(assert (=> mapNonEmpty!13521 (= (arr!9289 _values!1208) (store mapRest!13521 mapKey!13521 mapValue!13521))))

(declare-fun b!356367 () Bool)

(assert (=> b!356367 (= e!218363 (not true))))

(declare-fun arrayContainsKey!0 (array!19589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356367 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11655)

(declare-fun minValue!1150 () V!11655)

(declare-datatypes ((Unit!10968 0))(
  ( (Unit!10969) )
))
(declare-fun lt!165929 () Unit!10968)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!3 (array!19589 array!19591 (_ BitVec 32) (_ BitVec 32) V!11655 V!11655 (_ BitVec 64) (_ BitVec 32)) Unit!10968)

(assert (=> b!356367 (= lt!165929 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!3 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun b!356368 () Bool)

(declare-fun res!197729 () Bool)

(assert (=> b!356368 (=> (not res!197729) (not e!218363))))

(assert (=> b!356368 (= res!197729 (and (= (size!9641 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9640 _keys!1456) (size!9641 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!356369 () Bool)

(declare-fun res!197731 () Bool)

(assert (=> b!356369 (=> (not res!197731) (not e!218363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19589 (_ BitVec 32)) Bool)

(assert (=> b!356369 (= res!197731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356370 () Bool)

(declare-fun res!197727 () Bool)

(assert (=> b!356370 (=> (not res!197727) (not e!218363))))

(assert (=> b!356370 (= res!197727 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!356371 () Bool)

(assert (=> b!356371 (= e!218362 (and e!218366 mapRes!13521))))

(declare-fun condMapEmpty!13521 () Bool)

(declare-fun mapDefault!13521 () ValueCell!3661)

