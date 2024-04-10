; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81902 () Bool)

(assert start!81902)

(declare-fun b_free!18397 () Bool)

(declare-fun b_next!18397 () Bool)

(assert (=> start!81902 (= b_free!18397 (not b_next!18397))))

(declare-fun tp!63890 () Bool)

(declare-fun b_and!29883 () Bool)

(assert (=> start!81902 (= tp!63890 b_and!29883)))

(declare-fun res!639689 () Bool)

(declare-fun e!538167 () Bool)

(assert (=> start!81902 (=> (not res!639689) (not e!538167))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81902 (= res!639689 (validMask!0 mask!1823))))

(assert (=> start!81902 e!538167))

(assert (=> start!81902 true))

(declare-fun tp_is_empty!20941 () Bool)

(assert (=> start!81902 tp_is_empty!20941))

(declare-datatypes ((array!57987 0))(
  ( (array!57988 (arr!27873 (Array (_ BitVec 32) (_ BitVec 64))) (size!28352 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57987)

(declare-fun array_inv!21633 (array!57987) Bool)

(assert (=> start!81902 (array_inv!21633 _keys!1441)))

(declare-datatypes ((V!32905 0))(
  ( (V!32906 (val!10521 Int)) )
))
(declare-datatypes ((ValueCell!9989 0))(
  ( (ValueCellFull!9989 (v!13076 V!32905)) (EmptyCell!9989) )
))
(declare-datatypes ((array!57989 0))(
  ( (array!57990 (arr!27874 (Array (_ BitVec 32) ValueCell!9989)) (size!28353 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57989)

(declare-fun e!538165 () Bool)

(declare-fun array_inv!21634 (array!57989) Bool)

(assert (=> start!81902 (and (array_inv!21634 _values!1197) e!538165)))

(assert (=> start!81902 tp!63890))

(declare-fun b!955257 () Bool)

(declare-fun res!639692 () Bool)

(assert (=> b!955257 (=> (not res!639692) (not e!538167))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!955257 (= res!639692 (and (= (size!28353 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28352 _keys!1441) (size!28353 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955258 () Bool)

(declare-fun res!639691 () Bool)

(assert (=> b!955258 (=> (not res!639691) (not e!538167))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57987 (_ BitVec 32)) Bool)

(assert (=> b!955258 (= res!639691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955259 () Bool)

(assert (=> b!955259 (= e!538167 (not true))))

(declare-fun zeroValue!1139 () V!32905)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun minValue!1139 () V!32905)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13650 0))(
  ( (tuple2!13651 (_1!6836 (_ BitVec 64)) (_2!6836 V!32905)) )
))
(declare-datatypes ((List!19426 0))(
  ( (Nil!19423) (Cons!19422 (h!20584 tuple2!13650) (t!27787 List!19426)) )
))
(declare-datatypes ((ListLongMap!12347 0))(
  ( (ListLongMap!12348 (toList!6189 List!19426)) )
))
(declare-fun contains!5287 (ListLongMap!12347 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3422 (array!57987 array!57989 (_ BitVec 32) (_ BitVec 32) V!32905 V!32905 (_ BitVec 32) Int) ListLongMap!12347)

(assert (=> b!955259 (contains!5287 (getCurrentListMap!3422 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27873 _keys!1441) i!735))))

(declare-datatypes ((Unit!32099 0))(
  ( (Unit!32100) )
))
(declare-fun lt!429989 () Unit!32099)

(declare-fun lemmaInListMapFromThenFromZero!4 (array!57987 array!57989 (_ BitVec 32) (_ BitVec 32) V!32905 V!32905 (_ BitVec 32) (_ BitVec 32) Int) Unit!32099)

(assert (=> b!955259 (= lt!429989 (lemmaInListMapFromThenFromZero!4 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun mapIsEmpty!33373 () Bool)

(declare-fun mapRes!33373 () Bool)

(assert (=> mapIsEmpty!33373 mapRes!33373))

(declare-fun b!955260 () Bool)

(declare-fun e!538168 () Bool)

(assert (=> b!955260 (= e!538168 tp_is_empty!20941)))

(declare-fun b!955261 () Bool)

(declare-fun res!639687 () Bool)

(assert (=> b!955261 (=> (not res!639687) (not e!538167))))

(assert (=> b!955261 (= res!639687 (contains!5287 (getCurrentListMap!3422 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27873 _keys!1441) i!735)))))

(declare-fun b!955262 () Bool)

(declare-fun res!639688 () Bool)

(assert (=> b!955262 (=> (not res!639688) (not e!538167))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955262 (= res!639688 (validKeyInArray!0 (select (arr!27873 _keys!1441) i!735)))))

(declare-fun b!955263 () Bool)

(assert (=> b!955263 (= e!538165 (and e!538168 mapRes!33373))))

(declare-fun condMapEmpty!33373 () Bool)

(declare-fun mapDefault!33373 () ValueCell!9989)

