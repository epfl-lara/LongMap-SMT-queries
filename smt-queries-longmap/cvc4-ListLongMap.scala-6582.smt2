; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83380 () Bool)

(assert start!83380)

(declare-fun b_free!19373 () Bool)

(declare-fun b_next!19373 () Bool)

(assert (=> start!83380 (= b_free!19373 (not b_next!19373))))

(declare-fun tp!67398 () Bool)

(declare-fun b_and!30967 () Bool)

(assert (=> start!83380 (= tp!67398 b_and!30967)))

(declare-fun res!651753 () Bool)

(declare-fun e!548830 () Bool)

(assert (=> start!83380 (=> (not res!651753) (not e!548830))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83380 (= res!651753 (validMask!0 mask!2147))))

(assert (=> start!83380 e!548830))

(assert (=> start!83380 true))

(declare-datatypes ((V!34677 0))(
  ( (V!34678 (val!11186 Int)) )
))
(declare-datatypes ((ValueCell!10654 0))(
  ( (ValueCellFull!10654 (v!13745 V!34677)) (EmptyCell!10654) )
))
(declare-datatypes ((array!60583 0))(
  ( (array!60584 (arr!29155 (Array (_ BitVec 32) ValueCell!10654)) (size!29634 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60583)

(declare-fun e!548828 () Bool)

(declare-fun array_inv!22553 (array!60583) Bool)

(assert (=> start!83380 (and (array_inv!22553 _values!1425) e!548828)))

(declare-fun tp_is_empty!22271 () Bool)

(assert (=> start!83380 tp_is_empty!22271))

(assert (=> start!83380 tp!67398))

(declare-datatypes ((array!60585 0))(
  ( (array!60586 (arr!29156 (Array (_ BitVec 32) (_ BitVec 64))) (size!29635 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60585)

(declare-fun array_inv!22554 (array!60585) Bool)

(assert (=> start!83380 (array_inv!22554 _keys!1717)))

(declare-fun b!973666 () Bool)

(declare-fun e!548831 () Bool)

(assert (=> b!973666 (= e!548831 tp_is_empty!22271)))

(declare-fun mapIsEmpty!35416 () Bool)

(declare-fun mapRes!35416 () Bool)

(assert (=> mapIsEmpty!35416 mapRes!35416))

(declare-fun b!973667 () Bool)

(declare-fun e!548829 () Bool)

(assert (=> b!973667 (= e!548830 e!548829)))

(declare-fun res!651751 () Bool)

(assert (=> b!973667 (=> (not res!651751) (not e!548829))))

(declare-datatypes ((tuple2!14366 0))(
  ( (tuple2!14367 (_1!7194 (_ BitVec 64)) (_2!7194 V!34677)) )
))
(declare-datatypes ((List!20224 0))(
  ( (Nil!20221) (Cons!20220 (h!21382 tuple2!14366) (t!28695 List!20224)) )
))
(declare-datatypes ((ListLongMap!13063 0))(
  ( (ListLongMap!13064 (toList!6547 List!20224)) )
))
(declare-fun lt!432640 () ListLongMap!13063)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5638 (ListLongMap!13063 (_ BitVec 64)) Bool)

(assert (=> b!973667 (= res!651751 (contains!5638 lt!432640 (select (arr!29156 _keys!1717) i!822)))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun minValue!1367 () V!34677)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34677)

(declare-fun defaultEntry!1428 () Int)

(declare-fun getCurrentListMap!3780 (array!60585 array!60583 (_ BitVec 32) (_ BitVec 32) V!34677 V!34677 (_ BitVec 32) Int) ListLongMap!13063)

(assert (=> b!973667 (= lt!432640 (getCurrentListMap!3780 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!973668 () Bool)

(declare-fun res!651754 () Bool)

(assert (=> b!973668 (=> (not res!651754) (not e!548830))))

(declare-datatypes ((List!20225 0))(
  ( (Nil!20222) (Cons!20221 (h!21383 (_ BitVec 64)) (t!28696 List!20225)) )
))
(declare-fun arrayNoDuplicates!0 (array!60585 (_ BitVec 32) List!20225) Bool)

(assert (=> b!973668 (= res!651754 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20222))))

(declare-fun b!973669 () Bool)

(declare-fun res!651749 () Bool)

(assert (=> b!973669 (=> (not res!651749) (not e!548830))))

(assert (=> b!973669 (= res!651749 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29635 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29635 _keys!1717))))))

(declare-fun b!973670 () Bool)

(declare-fun e!548827 () Bool)

(assert (=> b!973670 (= e!548827 tp_is_empty!22271)))

(declare-fun mapNonEmpty!35416 () Bool)

(declare-fun tp!67397 () Bool)

(assert (=> mapNonEmpty!35416 (= mapRes!35416 (and tp!67397 e!548827))))

(declare-fun mapKey!35416 () (_ BitVec 32))

(declare-fun mapValue!35416 () ValueCell!10654)

(declare-fun mapRest!35416 () (Array (_ BitVec 32) ValueCell!10654))

(assert (=> mapNonEmpty!35416 (= (arr!29155 _values!1425) (store mapRest!35416 mapKey!35416 mapValue!35416))))

(declare-fun b!973671 () Bool)

(assert (=> b!973671 (= e!548828 (and e!548831 mapRes!35416))))

(declare-fun condMapEmpty!35416 () Bool)

(declare-fun mapDefault!35416 () ValueCell!10654)

