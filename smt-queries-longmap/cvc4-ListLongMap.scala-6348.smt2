; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81828 () Bool)

(assert start!81828)

(declare-fun b_free!18323 () Bool)

(declare-fun b_next!18323 () Bool)

(assert (=> start!81828 (= b_free!18323 (not b_next!18323))))

(declare-fun tp!63668 () Bool)

(declare-fun b_and!29809 () Bool)

(assert (=> start!81828 (= tp!63668 b_and!29809)))

(declare-fun b!954238 () Bool)

(declare-fun res!639005 () Bool)

(declare-fun e!537610 () Bool)

(assert (=> b!954238 (=> (not res!639005) (not e!537610))))

(declare-datatypes ((array!57847 0))(
  ( (array!57848 (arr!27803 (Array (_ BitVec 32) (_ BitVec 64))) (size!28282 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57847)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954238 (= res!639005 (validKeyInArray!0 (select (arr!27803 _keys!1441) i!735)))))

(declare-fun mapNonEmpty!33262 () Bool)

(declare-fun mapRes!33262 () Bool)

(declare-fun tp!63669 () Bool)

(declare-fun e!537613 () Bool)

(assert (=> mapNonEmpty!33262 (= mapRes!33262 (and tp!63669 e!537613))))

(declare-datatypes ((V!32805 0))(
  ( (V!32806 (val!10484 Int)) )
))
(declare-datatypes ((ValueCell!9952 0))(
  ( (ValueCellFull!9952 (v!13039 V!32805)) (EmptyCell!9952) )
))
(declare-fun mapRest!33262 () (Array (_ BitVec 32) ValueCell!9952))

(declare-fun mapKey!33262 () (_ BitVec 32))

(declare-fun mapValue!33262 () ValueCell!9952)

(declare-datatypes ((array!57849 0))(
  ( (array!57850 (arr!27804 (Array (_ BitVec 32) ValueCell!9952)) (size!28283 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57849)

(assert (=> mapNonEmpty!33262 (= (arr!27804 _values!1197) (store mapRest!33262 mapKey!33262 mapValue!33262))))

(declare-fun b!954240 () Bool)

(declare-fun res!639002 () Bool)

(assert (=> b!954240 (=> (not res!639002) (not e!537610))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57847 (_ BitVec 32)) Bool)

(assert (=> b!954240 (= res!639002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!954241 () Bool)

(declare-fun res!639001 () Bool)

(assert (=> b!954241 (=> (not res!639001) (not e!537610))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!954241 (= res!639001 (and (= (size!28283 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28282 _keys!1441) (size!28283 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!954242 () Bool)

(declare-fun e!537609 () Bool)

(declare-fun tp_is_empty!20867 () Bool)

(assert (=> b!954242 (= e!537609 tp_is_empty!20867)))

(declare-fun b!954243 () Bool)

(declare-fun res!639003 () Bool)

(assert (=> b!954243 (=> (not res!639003) (not e!537610))))

(assert (=> b!954243 (= res!639003 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28282 _keys!1441))))))

(declare-fun b!954239 () Bool)

(assert (=> b!954239 (= e!537613 tp_is_empty!20867)))

(declare-fun res!639006 () Bool)

(assert (=> start!81828 (=> (not res!639006) (not e!537610))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81828 (= res!639006 (validMask!0 mask!1823))))

(assert (=> start!81828 e!537610))

(assert (=> start!81828 true))

(assert (=> start!81828 tp_is_empty!20867))

(declare-fun array_inv!21583 (array!57847) Bool)

(assert (=> start!81828 (array_inv!21583 _keys!1441)))

(declare-fun e!537612 () Bool)

(declare-fun array_inv!21584 (array!57849) Bool)

(assert (=> start!81828 (and (array_inv!21584 _values!1197) e!537612)))

(assert (=> start!81828 tp!63668))

(declare-fun b!954244 () Bool)

(assert (=> b!954244 (= e!537610 false)))

(declare-fun lt!429878 () Bool)

(declare-fun zeroValue!1139 () V!32805)

(declare-fun minValue!1139 () V!32805)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13608 0))(
  ( (tuple2!13609 (_1!6815 (_ BitVec 64)) (_2!6815 V!32805)) )
))
(declare-datatypes ((List!19388 0))(
  ( (Nil!19385) (Cons!19384 (h!20546 tuple2!13608) (t!27749 List!19388)) )
))
(declare-datatypes ((ListLongMap!12305 0))(
  ( (ListLongMap!12306 (toList!6168 List!19388)) )
))
(declare-fun contains!5266 (ListLongMap!12305 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3401 (array!57847 array!57849 (_ BitVec 32) (_ BitVec 32) V!32805 V!32805 (_ BitVec 32) Int) ListLongMap!12305)

(assert (=> b!954244 (= lt!429878 (contains!5266 (getCurrentListMap!3401 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27803 _keys!1441) i!735)))))

(declare-fun mapIsEmpty!33262 () Bool)

(assert (=> mapIsEmpty!33262 mapRes!33262))

(declare-fun b!954245 () Bool)

(assert (=> b!954245 (= e!537612 (and e!537609 mapRes!33262))))

(declare-fun condMapEmpty!33262 () Bool)

(declare-fun mapDefault!33262 () ValueCell!9952)

