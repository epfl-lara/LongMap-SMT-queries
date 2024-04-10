; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4204 () Bool)

(assert start!4204)

(declare-fun b_free!1109 () Bool)

(declare-fun b_next!1109 () Bool)

(assert (=> start!4204 (= b_free!1109 (not b_next!1109))))

(declare-fun tp!4746 () Bool)

(declare-fun b_and!1919 () Bool)

(assert (=> start!4204 (= tp!4746 b_and!1919)))

(declare-fun b!32007 () Bool)

(declare-fun res!19434 () Bool)

(declare-fun e!20382 () Bool)

(assert (=> b!32007 (=> (not res!19434) (not e!20382))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32007 (= res!19434 (validKeyInArray!0 k!1304))))

(declare-fun b!32008 () Bool)

(declare-fun res!19439 () Bool)

(assert (=> b!32008 (=> (not res!19439) (not e!20382))))

(declare-datatypes ((array!2139 0))(
  ( (array!2140 (arr!1023 (Array (_ BitVec 32) (_ BitVec 64))) (size!1124 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2139)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2139 (_ BitVec 32)) Bool)

(assert (=> b!32008 (= res!19439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!32009 () Bool)

(declare-fun res!19440 () Bool)

(assert (=> b!32009 (=> (not res!19440) (not e!20382))))

(declare-datatypes ((List!826 0))(
  ( (Nil!823) (Cons!822 (h!1389 (_ BitVec 64)) (t!3519 List!826)) )
))
(declare-fun arrayNoDuplicates!0 (array!2139 (_ BitVec 32) List!826) Bool)

(assert (=> b!32009 (= res!19440 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!823))))

(declare-fun mapIsEmpty!1723 () Bool)

(declare-fun mapRes!1723 () Bool)

(assert (=> mapIsEmpty!1723 mapRes!1723))

(declare-fun b!32010 () Bool)

(declare-fun e!20381 () Bool)

(declare-fun tp_is_empty!1463 () Bool)

(assert (=> b!32010 (= e!20381 tp_is_empty!1463)))

(declare-fun res!19435 () Bool)

(assert (=> start!4204 (=> (not res!19435) (not e!20382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4204 (= res!19435 (validMask!0 mask!2294))))

(assert (=> start!4204 e!20382))

(assert (=> start!4204 true))

(assert (=> start!4204 tp!4746))

(declare-datatypes ((V!1775 0))(
  ( (V!1776 (val!758 Int)) )
))
(declare-datatypes ((ValueCell!532 0))(
  ( (ValueCellFull!532 (v!1847 V!1775)) (EmptyCell!532) )
))
(declare-datatypes ((array!2141 0))(
  ( (array!2142 (arr!1024 (Array (_ BitVec 32) ValueCell!532)) (size!1125 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2141)

(declare-fun e!20380 () Bool)

(declare-fun array_inv!715 (array!2141) Bool)

(assert (=> start!4204 (and (array_inv!715 _values!1501) e!20380)))

(declare-fun array_inv!716 (array!2139) Bool)

(assert (=> start!4204 (array_inv!716 _keys!1833)))

(assert (=> start!4204 tp_is_empty!1463))

(declare-fun b!32011 () Bool)

(declare-fun res!19437 () Bool)

(assert (=> b!32011 (=> (not res!19437) (not e!20382))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1775)

(declare-fun minValue!1443 () V!1775)

(declare-datatypes ((tuple2!1232 0))(
  ( (tuple2!1233 (_1!627 (_ BitVec 64)) (_2!627 V!1775)) )
))
(declare-datatypes ((List!827 0))(
  ( (Nil!824) (Cons!823 (h!1390 tuple2!1232) (t!3520 List!827)) )
))
(declare-datatypes ((ListLongMap!809 0))(
  ( (ListLongMap!810 (toList!420 List!827)) )
))
(declare-fun contains!360 (ListLongMap!809 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!248 (array!2139 array!2141 (_ BitVec 32) (_ BitVec 32) V!1775 V!1775 (_ BitVec 32) Int) ListLongMap!809)

(assert (=> b!32011 (= res!19437 (not (contains!360 (getCurrentListMap!248 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!32012 () Bool)

(declare-fun e!20383 () Bool)

(assert (=> b!32012 (= e!20380 (and e!20383 mapRes!1723))))

(declare-fun condMapEmpty!1723 () Bool)

(declare-fun mapDefault!1723 () ValueCell!532)

