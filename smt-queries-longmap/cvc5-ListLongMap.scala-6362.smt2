; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81908 () Bool)

(assert start!81908)

(declare-fun b_free!18403 () Bool)

(declare-fun b_next!18403 () Bool)

(assert (=> start!81908 (= b_free!18403 (not b_next!18403))))

(declare-fun tp!63909 () Bool)

(declare-fun b_and!29889 () Bool)

(assert (=> start!81908 (= tp!63909 b_and!29889)))

(declare-fun res!639755 () Bool)

(declare-fun e!538212 () Bool)

(assert (=> start!81908 (=> (not res!639755) (not e!538212))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81908 (= res!639755 (validMask!0 mask!1823))))

(assert (=> start!81908 e!538212))

(assert (=> start!81908 true))

(declare-fun tp_is_empty!20947 () Bool)

(assert (=> start!81908 tp_is_empty!20947))

(declare-datatypes ((array!57999 0))(
  ( (array!58000 (arr!27879 (Array (_ BitVec 32) (_ BitVec 64))) (size!28358 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57999)

(declare-fun array_inv!21637 (array!57999) Bool)

(assert (=> start!81908 (array_inv!21637 _keys!1441)))

(declare-datatypes ((V!32913 0))(
  ( (V!32914 (val!10524 Int)) )
))
(declare-datatypes ((ValueCell!9992 0))(
  ( (ValueCellFull!9992 (v!13079 V!32913)) (EmptyCell!9992) )
))
(declare-datatypes ((array!58001 0))(
  ( (array!58002 (arr!27880 (Array (_ BitVec 32) ValueCell!9992)) (size!28359 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58001)

(declare-fun e!538210 () Bool)

(declare-fun array_inv!21638 (array!58001) Bool)

(assert (=> start!81908 (and (array_inv!21638 _values!1197) e!538210)))

(assert (=> start!81908 tp!63909))

(declare-fun b!955347 () Bool)

(declare-fun res!639754 () Bool)

(assert (=> b!955347 (=> (not res!639754) (not e!538212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57999 (_ BitVec 32)) Bool)

(assert (=> b!955347 (= res!639754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955348 () Bool)

(declare-fun res!639751 () Bool)

(assert (=> b!955348 (=> (not res!639751) (not e!538212))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun zeroValue!1139 () V!32913)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun minValue!1139 () V!32913)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13654 0))(
  ( (tuple2!13655 (_1!6838 (_ BitVec 64)) (_2!6838 V!32913)) )
))
(declare-datatypes ((List!19429 0))(
  ( (Nil!19426) (Cons!19425 (h!20587 tuple2!13654) (t!27790 List!19429)) )
))
(declare-datatypes ((ListLongMap!12351 0))(
  ( (ListLongMap!12352 (toList!6191 List!19429)) )
))
(declare-fun contains!5289 (ListLongMap!12351 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3424 (array!57999 array!58001 (_ BitVec 32) (_ BitVec 32) V!32913 V!32913 (_ BitVec 32) Int) ListLongMap!12351)

(assert (=> b!955348 (= res!639751 (contains!5289 (getCurrentListMap!3424 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27879 _keys!1441) i!735)))))

(declare-fun b!955349 () Bool)

(declare-fun e!538211 () Bool)

(assert (=> b!955349 (= e!538211 tp_is_empty!20947)))

(declare-fun mapIsEmpty!33382 () Bool)

(declare-fun mapRes!33382 () Bool)

(assert (=> mapIsEmpty!33382 mapRes!33382))

(declare-fun b!955350 () Bool)

(declare-fun res!639752 () Bool)

(assert (=> b!955350 (=> (not res!639752) (not e!538212))))

(assert (=> b!955350 (= res!639752 (and (= (size!28359 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28358 _keys!1441) (size!28359 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955351 () Bool)

(declare-fun res!639753 () Bool)

(assert (=> b!955351 (=> (not res!639753) (not e!538212))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955351 (= res!639753 (validKeyInArray!0 (select (arr!27879 _keys!1441) i!735)))))

(declare-fun b!955352 () Bool)

(declare-fun res!639756 () Bool)

(assert (=> b!955352 (=> (not res!639756) (not e!538212))))

(assert (=> b!955352 (= res!639756 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28358 _keys!1441))))))

(declare-fun b!955353 () Bool)

(declare-fun e!538209 () Bool)

(assert (=> b!955353 (= e!538209 tp_is_empty!20947)))

(declare-fun b!955354 () Bool)

(declare-fun res!639750 () Bool)

(assert (=> b!955354 (=> (not res!639750) (not e!538212))))

(declare-datatypes ((List!19430 0))(
  ( (Nil!19427) (Cons!19426 (h!20588 (_ BitVec 64)) (t!27791 List!19430)) )
))
(declare-fun arrayNoDuplicates!0 (array!57999 (_ BitVec 32) List!19430) Bool)

(assert (=> b!955354 (= res!639750 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19427))))

(declare-fun b!955355 () Bool)

(assert (=> b!955355 (= e!538212 (not true))))

(assert (=> b!955355 (contains!5289 (getCurrentListMap!3424 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27879 _keys!1441) i!735))))

(declare-datatypes ((Unit!32103 0))(
  ( (Unit!32104) )
))
(declare-fun lt!429998 () Unit!32103)

(declare-fun lemmaInListMapFromThenFromZero!6 (array!57999 array!58001 (_ BitVec 32) (_ BitVec 32) V!32913 V!32913 (_ BitVec 32) (_ BitVec 32) Int) Unit!32103)

(assert (=> b!955355 (= lt!429998 (lemmaInListMapFromThenFromZero!6 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun mapNonEmpty!33382 () Bool)

(declare-fun tp!63908 () Bool)

(assert (=> mapNonEmpty!33382 (= mapRes!33382 (and tp!63908 e!538209))))

(declare-fun mapValue!33382 () ValueCell!9992)

(declare-fun mapRest!33382 () (Array (_ BitVec 32) ValueCell!9992))

(declare-fun mapKey!33382 () (_ BitVec 32))

(assert (=> mapNonEmpty!33382 (= (arr!27880 _values!1197) (store mapRest!33382 mapKey!33382 mapValue!33382))))

(declare-fun b!955356 () Bool)

(assert (=> b!955356 (= e!538210 (and e!538211 mapRes!33382))))

(declare-fun condMapEmpty!33382 () Bool)

(declare-fun mapDefault!33382 () ValueCell!9992)

