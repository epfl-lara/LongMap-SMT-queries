; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83388 () Bool)

(assert start!83388)

(declare-fun b_free!19381 () Bool)

(declare-fun b_next!19381 () Bool)

(assert (=> start!83388 (= b_free!19381 (not b_next!19381))))

(declare-fun tp!67422 () Bool)

(declare-fun b_and!30983 () Bool)

(assert (=> start!83388 (= tp!67422 b_and!30983)))

(declare-fun b!973804 () Bool)

(declare-fun res!651846 () Bool)

(declare-fun e!548910 () Bool)

(assert (=> b!973804 (=> (not res!651846) (not e!548910))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34689 0))(
  ( (V!34690 (val!11190 Int)) )
))
(declare-fun zeroValue!1367 () V!34689)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34689)

(declare-fun i!822 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10658 0))(
  ( (ValueCellFull!10658 (v!13749 V!34689)) (EmptyCell!10658) )
))
(declare-datatypes ((array!60599 0))(
  ( (array!60600 (arr!29163 (Array (_ BitVec 32) ValueCell!10658)) (size!29642 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60599)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60601 0))(
  ( (array!60602 (arr!29164 (Array (_ BitVec 32) (_ BitVec 64))) (size!29643 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60601)

(declare-datatypes ((tuple2!14372 0))(
  ( (tuple2!14373 (_1!7197 (_ BitVec 64)) (_2!7197 V!34689)) )
))
(declare-datatypes ((List!20231 0))(
  ( (Nil!20228) (Cons!20227 (h!21389 tuple2!14372) (t!28708 List!20231)) )
))
(declare-datatypes ((ListLongMap!13069 0))(
  ( (ListLongMap!13070 (toList!6550 List!20231)) )
))
(declare-fun contains!5641 (ListLongMap!13069 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3783 (array!60601 array!60599 (_ BitVec 32) (_ BitVec 32) V!34689 V!34689 (_ BitVec 32) Int) ListLongMap!13069)

(assert (=> b!973804 (= res!651846 (contains!5641 (getCurrentListMap!3783 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29164 _keys!1717) i!822)))))

(declare-fun b!973805 () Bool)

(declare-fun e!548907 () Bool)

(declare-fun tp_is_empty!22279 () Bool)

(assert (=> b!973805 (= e!548907 tp_is_empty!22279)))

(declare-fun b!973806 () Bool)

(declare-fun res!651845 () Bool)

(assert (=> b!973806 (=> (not res!651845) (not e!548910))))

(assert (=> b!973806 (= res!651845 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29643 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29643 _keys!1717))))))

(declare-fun b!973807 () Bool)

(declare-fun res!651843 () Bool)

(assert (=> b!973807 (=> (not res!651843) (not e!548910))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973807 (= res!651843 (validKeyInArray!0 (select (arr!29164 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35428 () Bool)

(declare-fun mapRes!35428 () Bool)

(assert (=> mapIsEmpty!35428 mapRes!35428))

(declare-fun b!973808 () Bool)

(declare-fun e!548909 () Bool)

(assert (=> b!973808 (= e!548909 tp_is_empty!22279)))

(declare-fun b!973809 () Bool)

(assert (=> b!973809 (= e!548910 false)))

(declare-fun lt!432707 () ListLongMap!13069)

(assert (=> b!973809 (= lt!432707 (getCurrentListMap!3783 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973810 () Bool)

(declare-fun res!651848 () Bool)

(assert (=> b!973810 (=> (not res!651848) (not e!548910))))

(declare-datatypes ((List!20232 0))(
  ( (Nil!20229) (Cons!20228 (h!21390 (_ BitVec 64)) (t!28709 List!20232)) )
))
(declare-fun arrayNoDuplicates!0 (array!60601 (_ BitVec 32) List!20232) Bool)

(assert (=> b!973810 (= res!651848 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20229))))

(declare-fun mapNonEmpty!35428 () Bool)

(declare-fun tp!67421 () Bool)

(assert (=> mapNonEmpty!35428 (= mapRes!35428 (and tp!67421 e!548907))))

(declare-fun mapKey!35428 () (_ BitVec 32))

(declare-fun mapValue!35428 () ValueCell!10658)

(declare-fun mapRest!35428 () (Array (_ BitVec 32) ValueCell!10658))

(assert (=> mapNonEmpty!35428 (= (arr!29163 _values!1425) (store mapRest!35428 mapKey!35428 mapValue!35428))))

(declare-fun res!651844 () Bool)

(assert (=> start!83388 (=> (not res!651844) (not e!548910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83388 (= res!651844 (validMask!0 mask!2147))))

(assert (=> start!83388 e!548910))

(assert (=> start!83388 true))

(declare-fun e!548911 () Bool)

(declare-fun array_inv!22557 (array!60599) Bool)

(assert (=> start!83388 (and (array_inv!22557 _values!1425) e!548911)))

(assert (=> start!83388 tp_is_empty!22279))

(assert (=> start!83388 tp!67422))

(declare-fun array_inv!22558 (array!60601) Bool)

(assert (=> start!83388 (array_inv!22558 _keys!1717)))

(declare-fun b!973811 () Bool)

(assert (=> b!973811 (= e!548911 (and e!548909 mapRes!35428))))

(declare-fun condMapEmpty!35428 () Bool)

(declare-fun mapDefault!35428 () ValueCell!10658)

