; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35436 () Bool)

(assert start!35436)

(declare-fun b_free!7823 () Bool)

(declare-fun b_next!7823 () Bool)

(assert (=> start!35436 (= b_free!7823 (not b_next!7823))))

(declare-fun tp!27255 () Bool)

(declare-fun b_and!15065 () Bool)

(assert (=> start!35436 (= tp!27255 b_and!15065)))

(declare-fun b!354812 () Bool)

(declare-fun res!196715 () Bool)

(declare-fun e!217466 () Bool)

(assert (=> b!354812 (=> (not res!196715) (not e!217466))))

(declare-datatypes ((array!19359 0))(
  ( (array!19360 (arr!9173 (Array (_ BitVec 32) (_ BitVec 64))) (size!9525 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19359)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19359 (_ BitVec 32)) Bool)

(assert (=> b!354812 (= res!196715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354813 () Bool)

(declare-fun res!196716 () Bool)

(assert (=> b!354813 (=> (not res!196716) (not e!217466))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!354813 (= res!196716 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!354814 () Bool)

(assert (=> b!354814 (= e!217466 (not true))))

(declare-datatypes ((V!11495 0))(
  ( (V!11496 (val!3989 Int)) )
))
(declare-fun minValue!1150 () V!11495)

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((ValueCell!3601 0))(
  ( (ValueCellFull!3601 (v!6183 V!11495)) (EmptyCell!3601) )
))
(declare-datatypes ((array!19361 0))(
  ( (array!19362 (arr!9174 (Array (_ BitVec 32) ValueCell!3601)) (size!9526 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19361)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11495)

(declare-datatypes ((tuple2!5668 0))(
  ( (tuple2!5669 (_1!2845 (_ BitVec 64)) (_2!2845 V!11495)) )
))
(declare-datatypes ((List!5311 0))(
  ( (Nil!5308) (Cons!5307 (h!6163 tuple2!5668) (t!10461 List!5311)) )
))
(declare-datatypes ((ListLongMap!4581 0))(
  ( (ListLongMap!4582 (toList!2306 List!5311)) )
))
(declare-fun contains!2386 (ListLongMap!4581 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1827 (array!19359 array!19361 (_ BitVec 32) (_ BitVec 32) V!11495 V!11495 (_ BitVec 32) Int) ListLongMap!4581)

(assert (=> b!354814 (contains!2386 (getCurrentListMap!1827 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9173 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10934 0))(
  ( (Unit!10935) )
))
(declare-fun lt!165749 () Unit!10934)

(declare-fun lemmaValidKeyInArrayIsInListMap!184 (array!19359 array!19361 (_ BitVec 32) (_ BitVec 32) V!11495 V!11495 (_ BitVec 32) Int) Unit!10934)

(assert (=> b!354814 (= lt!165749 (lemmaValidKeyInArrayIsInListMap!184 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun b!354815 () Bool)

(declare-fun res!196721 () Bool)

(assert (=> b!354815 (=> (not res!196721) (not e!217466))))

(declare-datatypes ((List!5312 0))(
  ( (Nil!5309) (Cons!5308 (h!6164 (_ BitVec 64)) (t!10462 List!5312)) )
))
(declare-fun arrayNoDuplicates!0 (array!19359 (_ BitVec 32) List!5312) Bool)

(assert (=> b!354815 (= res!196721 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5309))))

(declare-fun b!354816 () Bool)

(declare-fun res!196717 () Bool)

(assert (=> b!354816 (=> (not res!196717) (not e!217466))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!354816 (= res!196717 (validKeyInArray!0 k!1077))))

(declare-fun b!354817 () Bool)

(declare-fun e!217463 () Bool)

(declare-fun tp_is_empty!7889 () Bool)

(assert (=> b!354817 (= e!217463 tp_is_empty!7889)))

(declare-fun mapNonEmpty!13341 () Bool)

(declare-fun mapRes!13341 () Bool)

(declare-fun tp!27254 () Bool)

(assert (=> mapNonEmpty!13341 (= mapRes!13341 (and tp!27254 e!217463))))

(declare-fun mapRest!13341 () (Array (_ BitVec 32) ValueCell!3601))

(declare-fun mapKey!13341 () (_ BitVec 32))

(declare-fun mapValue!13341 () ValueCell!3601)

(assert (=> mapNonEmpty!13341 (= (arr!9174 _values!1208) (store mapRest!13341 mapKey!13341 mapValue!13341))))

(declare-fun b!354819 () Bool)

(declare-fun res!196722 () Bool)

(assert (=> b!354819 (=> (not res!196722) (not e!217466))))

(assert (=> b!354819 (= res!196722 (and (= (size!9526 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9525 _keys!1456) (size!9526 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354820 () Bool)

(declare-fun res!196719 () Bool)

(assert (=> b!354820 (=> (not res!196719) (not e!217466))))

(assert (=> b!354820 (= res!196719 (validKeyInArray!0 (select (arr!9173 _keys!1456) from!1805)))))

(declare-fun mapIsEmpty!13341 () Bool)

(assert (=> mapIsEmpty!13341 mapRes!13341))

(declare-fun b!354821 () Bool)

(declare-fun res!196720 () Bool)

(assert (=> b!354821 (=> (not res!196720) (not e!217466))))

(assert (=> b!354821 (= res!196720 (= (select (arr!9173 _keys!1456) from!1805) k!1077))))

(declare-fun b!354818 () Bool)

(declare-fun e!217462 () Bool)

(assert (=> b!354818 (= e!217462 tp_is_empty!7889)))

(declare-fun res!196723 () Bool)

(assert (=> start!35436 (=> (not res!196723) (not e!217466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35436 (= res!196723 (validMask!0 mask!1842))))

(assert (=> start!35436 e!217466))

(assert (=> start!35436 tp_is_empty!7889))

(assert (=> start!35436 true))

(assert (=> start!35436 tp!27255))

(declare-fun array_inv!6742 (array!19359) Bool)

(assert (=> start!35436 (array_inv!6742 _keys!1456)))

(declare-fun e!217465 () Bool)

(declare-fun array_inv!6743 (array!19361) Bool)

(assert (=> start!35436 (and (array_inv!6743 _values!1208) e!217465)))

(declare-fun b!354822 () Bool)

(declare-fun res!196718 () Bool)

(assert (=> b!354822 (=> (not res!196718) (not e!217466))))

(assert (=> b!354822 (= res!196718 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9525 _keys!1456))))))

(declare-fun b!354823 () Bool)

(assert (=> b!354823 (= e!217465 (and e!217462 mapRes!13341))))

(declare-fun condMapEmpty!13341 () Bool)

(declare-fun mapDefault!13341 () ValueCell!3601)

