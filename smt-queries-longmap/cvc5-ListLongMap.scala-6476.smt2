; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82696 () Bool)

(assert start!82696)

(declare-fun b_free!18829 () Bool)

(declare-fun b_next!18829 () Bool)

(assert (=> start!82696 (= b_free!18829 (not b_next!18829))))

(declare-fun tp!65607 () Bool)

(declare-fun b_and!30317 () Bool)

(assert (=> start!82696 (= tp!65607 b_and!30317)))

(declare-fun mapNonEmpty!34441 () Bool)

(declare-fun mapRes!34441 () Bool)

(declare-fun tp!65606 () Bool)

(declare-fun e!543632 () Bool)

(assert (=> mapNonEmpty!34441 (= mapRes!34441 (and tp!65606 e!543632))))

(declare-datatypes ((V!33825 0))(
  ( (V!33826 (val!10866 Int)) )
))
(declare-datatypes ((ValueCell!10334 0))(
  ( (ValueCellFull!10334 (v!13424 V!33825)) (EmptyCell!10334) )
))
(declare-datatypes ((array!59349 0))(
  ( (array!59350 (arr!28543 (Array (_ BitVec 32) ValueCell!10334)) (size!29022 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59349)

(declare-fun mapRest!34441 () (Array (_ BitVec 32) ValueCell!10334))

(declare-fun mapValue!34441 () ValueCell!10334)

(declare-fun mapKey!34441 () (_ BitVec 32))

(assert (=> mapNonEmpty!34441 (= (arr!28543 _values!1400) (store mapRest!34441 mapKey!34441 mapValue!34441))))

(declare-fun b!964280 () Bool)

(declare-fun res!645421 () Bool)

(declare-fun e!543635 () Bool)

(assert (=> b!964280 (=> (not res!645421) (not e!543635))))

(declare-datatypes ((array!59351 0))(
  ( (array!59352 (arr!28544 (Array (_ BitVec 32) (_ BitVec 64))) (size!29023 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59351)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964280 (= res!645421 (validKeyInArray!0 (select (arr!28544 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34441 () Bool)

(assert (=> mapIsEmpty!34441 mapRes!34441))

(declare-fun b!964281 () Bool)

(declare-fun res!645413 () Bool)

(assert (=> b!964281 (=> (not res!645413) (not e!543635))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!964281 (= res!645413 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29023 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29023 _keys!1686))))))

(declare-fun b!964282 () Bool)

(declare-fun e!543633 () Bool)

(declare-fun tp_is_empty!21631 () Bool)

(assert (=> b!964282 (= e!543633 tp_is_empty!21631)))

(declare-fun b!964283 () Bool)

(declare-fun e!543631 () Bool)

(assert (=> b!964283 (= e!543635 (not e!543631))))

(declare-fun res!645418 () Bool)

(assert (=> b!964283 (=> res!645418 e!543631)))

(assert (=> b!964283 (= res!645418 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29023 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33825)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33825)

(declare-datatypes ((tuple2!13962 0))(
  ( (tuple2!13963 (_1!6992 (_ BitVec 64)) (_2!6992 V!33825)) )
))
(declare-datatypes ((List!19810 0))(
  ( (Nil!19807) (Cons!19806 (h!20968 tuple2!13962) (t!28173 List!19810)) )
))
(declare-datatypes ((ListLongMap!12659 0))(
  ( (ListLongMap!12660 (toList!6345 List!19810)) )
))
(declare-fun contains!5448 (ListLongMap!12659 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3578 (array!59351 array!59349 (_ BitVec 32) (_ BitVec 32) V!33825 V!33825 (_ BitVec 32) Int) ListLongMap!12659)

(assert (=> b!964283 (contains!5448 (getCurrentListMap!3578 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28544 _keys!1686) i!803))))

(declare-datatypes ((Unit!32273 0))(
  ( (Unit!32274) )
))
(declare-fun lt!431076 () Unit!32273)

(declare-fun lemmaInListMapFromThenInFromMinusOne!31 (array!59351 array!59349 (_ BitVec 32) (_ BitVec 32) V!33825 V!33825 (_ BitVec 32) (_ BitVec 32) Int) Unit!32273)

(assert (=> b!964283 (= lt!431076 (lemmaInListMapFromThenInFromMinusOne!31 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!964285 () Bool)

(assert (=> b!964285 (= e!543632 tp_is_empty!21631)))

(declare-fun b!964286 () Bool)

(declare-fun e!543630 () Bool)

(assert (=> b!964286 (= e!543630 (and e!543633 mapRes!34441))))

(declare-fun condMapEmpty!34441 () Bool)

(declare-fun mapDefault!34441 () ValueCell!10334)

