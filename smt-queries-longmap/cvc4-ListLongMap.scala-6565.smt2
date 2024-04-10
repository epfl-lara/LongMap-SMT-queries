; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83278 () Bool)

(assert start!83278)

(declare-fun b_free!19271 () Bool)

(declare-fun b_next!19271 () Bool)

(assert (=> start!83278 (= b_free!19271 (not b_next!19271))))

(declare-fun tp!67091 () Bool)

(declare-fun b_and!30763 () Bool)

(assert (=> start!83278 (= tp!67091 b_and!30763)))

(declare-fun b!971881 () Bool)

(declare-fun e!547842 () Bool)

(declare-fun tp_is_empty!22169 () Bool)

(assert (=> b!971881 (= e!547842 tp_is_empty!22169)))

(declare-fun b!971882 () Bool)

(declare-fun e!547839 () Bool)

(assert (=> b!971882 (= e!547839 (not true))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34541 0))(
  ( (V!34542 (val!11135 Int)) )
))
(declare-datatypes ((ValueCell!10603 0))(
  ( (ValueCellFull!10603 (v!13694 V!34541)) (EmptyCell!10603) )
))
(declare-datatypes ((array!60385 0))(
  ( (array!60386 (arr!29056 (Array (_ BitVec 32) ValueCell!10603)) (size!29535 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60385)

(declare-fun zeroValue!1367 () V!34541)

(declare-fun lt!431894 () (_ BitVec 64))

(declare-datatypes ((tuple2!14276 0))(
  ( (tuple2!14277 (_1!7149 (_ BitVec 64)) (_2!7149 V!34541)) )
))
(declare-datatypes ((List!20141 0))(
  ( (Nil!20138) (Cons!20137 (h!21299 tuple2!14276) (t!28510 List!20141)) )
))
(declare-datatypes ((ListLongMap!12973 0))(
  ( (ListLongMap!12974 (toList!6502 List!20141)) )
))
(declare-fun lt!431893 () ListLongMap!12973)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34541)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60387 0))(
  ( (array!60388 (arr!29057 (Array (_ BitVec 32) (_ BitVec 64))) (size!29536 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60387)

(declare-fun +!2876 (ListLongMap!12973 tuple2!14276) ListLongMap!12973)

(declare-fun getCurrentListMap!3735 (array!60387 array!60385 (_ BitVec 32) (_ BitVec 32) V!34541 V!34541 (_ BitVec 32) Int) ListLongMap!12973)

(declare-fun get!15045 (ValueCell!10603 V!34541) V!34541)

(declare-fun dynLambda!1665 (Int (_ BitVec 64)) V!34541)

(assert (=> b!971882 (= lt!431893 (+!2876 (getCurrentListMap!3735 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14277 lt!431894 (get!15045 (select (arr!29056 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1665 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32373 0))(
  ( (Unit!32374) )
))
(declare-fun lt!431892 () Unit!32373)

(declare-fun lemmaListMapRecursiveValidKeyArray!242 (array!60387 array!60385 (_ BitVec 32) (_ BitVec 32) V!34541 V!34541 (_ BitVec 32) Int) Unit!32373)

(assert (=> b!971882 (= lt!431892 (lemmaListMapRecursiveValidKeyArray!242 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!971883 () Bool)

(declare-fun e!547838 () Bool)

(assert (=> b!971883 (= e!547838 tp_is_empty!22169)))

(declare-fun b!971884 () Bool)

(declare-fun res!650526 () Bool)

(declare-fun e!547840 () Bool)

(assert (=> b!971884 (=> (not res!650526) (not e!547840))))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!971884 (= res!650526 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29536 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29536 _keys!1717))))))

(declare-fun b!971885 () Bool)

(declare-fun res!650532 () Bool)

(assert (=> b!971885 (=> (not res!650532) (not e!547840))))

(assert (=> b!971885 (= res!650532 (and (= (size!29535 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29536 _keys!1717) (size!29535 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971886 () Bool)

(declare-fun e!547841 () Bool)

(declare-fun mapRes!35263 () Bool)

(assert (=> b!971886 (= e!547841 (and e!547838 mapRes!35263))))

(declare-fun condMapEmpty!35263 () Bool)

(declare-fun mapDefault!35263 () ValueCell!10603)

