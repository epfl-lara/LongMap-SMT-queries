; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83544 () Bool)

(assert start!83544)

(declare-fun b_free!19531 () Bool)

(declare-fun b_next!19531 () Bool)

(assert (=> start!83544 (= b_free!19531 (not b_next!19531))))

(declare-fun tp!67881 () Bool)

(declare-fun b_and!31157 () Bool)

(assert (=> start!83544 (= tp!67881 b_and!31157)))

(declare-fun b!976188 () Bool)

(declare-fun e!550140 () Bool)

(declare-fun e!550141 () Bool)

(assert (=> b!976188 (= e!550140 e!550141)))

(declare-fun res!653508 () Bool)

(assert (=> b!976188 (=> (not res!653508) (not e!550141))))

(declare-datatypes ((V!34897 0))(
  ( (V!34898 (val!11268 Int)) )
))
(declare-datatypes ((tuple2!14498 0))(
  ( (tuple2!14499 (_1!7260 (_ BitVec 64)) (_2!7260 V!34897)) )
))
(declare-datatypes ((List!20349 0))(
  ( (Nil!20346) (Cons!20345 (h!21507 tuple2!14498) (t!28852 List!20349)) )
))
(declare-datatypes ((ListLongMap!13195 0))(
  ( (ListLongMap!13196 (toList!6613 List!20349)) )
))
(declare-fun lt!433018 () ListLongMap!13195)

(declare-datatypes ((array!60899 0))(
  ( (array!60900 (arr!29313 (Array (_ BitVec 32) (_ BitVec 64))) (size!29792 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60899)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5691 (ListLongMap!13195 (_ BitVec 64)) Bool)

(assert (=> b!976188 (= res!653508 (contains!5691 lt!433018 (select (arr!29313 _keys!1717) i!822)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10736 0))(
  ( (ValueCellFull!10736 (v!13827 V!34897)) (EmptyCell!10736) )
))
(declare-datatypes ((array!60901 0))(
  ( (array!60902 (arr!29314 (Array (_ BitVec 32) ValueCell!10736)) (size!29793 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60901)

(declare-fun zeroValue!1367 () V!34897)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34897)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3846 (array!60899 array!60901 (_ BitVec 32) (_ BitVec 32) V!34897 V!34897 (_ BitVec 32) Int) ListLongMap!13195)

(assert (=> b!976188 (= lt!433018 (getCurrentListMap!3846 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!976189 () Bool)

(declare-fun res!653504 () Bool)

(assert (=> b!976189 (=> (not res!653504) (not e!550140))))

(declare-datatypes ((List!20350 0))(
  ( (Nil!20347) (Cons!20346 (h!21508 (_ BitVec 64)) (t!28853 List!20350)) )
))
(declare-fun arrayNoDuplicates!0 (array!60899 (_ BitVec 32) List!20350) Bool)

(assert (=> b!976189 (= res!653504 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20347))))

(declare-fun b!976190 () Bool)

(declare-fun e!550138 () Bool)

(assert (=> b!976190 (= e!550141 e!550138)))

(declare-fun res!653501 () Bool)

(assert (=> b!976190 (=> (not res!653501) (not e!550138))))

(declare-fun lt!433016 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976190 (= res!653501 (validKeyInArray!0 lt!433016))))

(assert (=> b!976190 (= lt!433016 (select (arr!29313 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun lt!433017 () ListLongMap!13195)

(assert (=> b!976190 (= lt!433017 (getCurrentListMap!3846 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976191 () Bool)

(declare-fun e!550135 () Bool)

(declare-fun tp_is_empty!22435 () Bool)

(assert (=> b!976191 (= e!550135 tp_is_empty!22435)))

(declare-fun res!653507 () Bool)

(assert (=> start!83544 (=> (not res!653507) (not e!550140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83544 (= res!653507 (validMask!0 mask!2147))))

(assert (=> start!83544 e!550140))

(assert (=> start!83544 true))

(declare-fun e!550136 () Bool)

(declare-fun array_inv!22663 (array!60901) Bool)

(assert (=> start!83544 (and (array_inv!22663 _values!1425) e!550136)))

(assert (=> start!83544 tp_is_empty!22435))

(assert (=> start!83544 tp!67881))

(declare-fun array_inv!22664 (array!60899) Bool)

(assert (=> start!83544 (array_inv!22664 _keys!1717)))

(declare-fun b!976192 () Bool)

(declare-fun e!550139 () Bool)

(declare-fun mapRes!35662 () Bool)

(assert (=> b!976192 (= e!550136 (and e!550139 mapRes!35662))))

(declare-fun condMapEmpty!35662 () Bool)

(declare-fun mapDefault!35662 () ValueCell!10736)

