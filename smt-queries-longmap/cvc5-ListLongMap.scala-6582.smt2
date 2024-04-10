; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83376 () Bool)

(assert start!83376)

(declare-fun b_free!19369 () Bool)

(declare-fun b_next!19369 () Bool)

(assert (=> start!83376 (= b_free!19369 (not b_next!19369))))

(declare-fun tp!67386 () Bool)

(declare-fun b_and!30959 () Bool)

(assert (=> start!83376 (= tp!67386 b_and!30959)))

(declare-fun b!973596 () Bool)

(declare-fun e!548785 () Bool)

(declare-fun tp_is_empty!22267 () Bool)

(assert (=> b!973596 (= e!548785 tp_is_empty!22267)))

(declare-fun b!973597 () Bool)

(declare-fun e!548787 () Bool)

(declare-fun e!548791 () Bool)

(assert (=> b!973597 (= e!548787 e!548791)))

(declare-fun res!651702 () Bool)

(assert (=> b!973597 (=> (not res!651702) (not e!548791))))

(declare-fun lt!432596 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973597 (= res!651702 (validKeyInArray!0 lt!432596))))

(declare-datatypes ((array!60575 0))(
  ( (array!60576 (arr!29151 (Array (_ BitVec 32) (_ BitVec 64))) (size!29630 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60575)

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!973597 (= lt!432596 (select (arr!29151 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34673 0))(
  ( (V!34674 (val!11184 Int)) )
))
(declare-datatypes ((ValueCell!10652 0))(
  ( (ValueCellFull!10652 (v!13743 V!34673)) (EmptyCell!10652) )
))
(declare-datatypes ((array!60577 0))(
  ( (array!60578 (arr!29152 (Array (_ BitVec 32) ValueCell!10652)) (size!29631 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60577)

(declare-fun zeroValue!1367 () V!34673)

(declare-fun minValue!1367 () V!34673)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14362 0))(
  ( (tuple2!14363 (_1!7192 (_ BitVec 64)) (_2!7192 V!34673)) )
))
(declare-datatypes ((List!20221 0))(
  ( (Nil!20218) (Cons!20217 (h!21379 tuple2!14362) (t!28688 List!20221)) )
))
(declare-datatypes ((ListLongMap!13059 0))(
  ( (ListLongMap!13060 (toList!6545 List!20221)) )
))
(declare-fun lt!432594 () ListLongMap!13059)

(declare-fun defaultEntry!1428 () Int)

(declare-fun getCurrentListMap!3778 (array!60575 array!60577 (_ BitVec 32) (_ BitVec 32) V!34673 V!34673 (_ BitVec 32) Int) ListLongMap!13059)

(assert (=> b!973597 (= lt!432594 (getCurrentListMap!3778 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973598 () Bool)

(declare-fun e!548789 () Bool)

(declare-fun e!548790 () Bool)

(declare-fun mapRes!35410 () Bool)

(assert (=> b!973598 (= e!548789 (and e!548790 mapRes!35410))))

(declare-fun condMapEmpty!35410 () Bool)

(declare-fun mapDefault!35410 () ValueCell!10652)

