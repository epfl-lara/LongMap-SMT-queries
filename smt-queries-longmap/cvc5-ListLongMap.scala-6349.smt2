; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81830 () Bool)

(assert start!81830)

(declare-fun b_free!18325 () Bool)

(declare-fun b_next!18325 () Bool)

(assert (=> start!81830 (= b_free!18325 (not b_next!18325))))

(declare-fun tp!63675 () Bool)

(declare-fun b_and!29811 () Bool)

(assert (=> start!81830 (= tp!63675 b_and!29811)))

(declare-fun mapIsEmpty!33265 () Bool)

(declare-fun mapRes!33265 () Bool)

(assert (=> mapIsEmpty!33265 mapRes!33265))

(declare-fun b!954265 () Bool)

(declare-fun e!537625 () Bool)

(assert (=> b!954265 (= e!537625 false)))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32809 0))(
  ( (V!32810 (val!10485 Int)) )
))
(declare-fun zeroValue!1139 () V!32809)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun lt!429881 () Bool)

(declare-datatypes ((array!57851 0))(
  ( (array!57852 (arr!27805 (Array (_ BitVec 32) (_ BitVec 64))) (size!28284 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57851)

(declare-datatypes ((ValueCell!9953 0))(
  ( (ValueCellFull!9953 (v!13040 V!32809)) (EmptyCell!9953) )
))
(declare-datatypes ((array!57853 0))(
  ( (array!57854 (arr!27806 (Array (_ BitVec 32) ValueCell!9953)) (size!28285 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57853)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun minValue!1139 () V!32809)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13610 0))(
  ( (tuple2!13611 (_1!6816 (_ BitVec 64)) (_2!6816 V!32809)) )
))
(declare-datatypes ((List!19389 0))(
  ( (Nil!19386) (Cons!19385 (h!20547 tuple2!13610) (t!27750 List!19389)) )
))
(declare-datatypes ((ListLongMap!12307 0))(
  ( (ListLongMap!12308 (toList!6169 List!19389)) )
))
(declare-fun contains!5267 (ListLongMap!12307 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3402 (array!57851 array!57853 (_ BitVec 32) (_ BitVec 32) V!32809 V!32809 (_ BitVec 32) Int) ListLongMap!12307)

(assert (=> b!954265 (= lt!429881 (contains!5267 (getCurrentListMap!3402 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27805 _keys!1441) i!735)))))

(declare-fun res!639019 () Bool)

(assert (=> start!81830 (=> (not res!639019) (not e!537625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81830 (= res!639019 (validMask!0 mask!1823))))

(assert (=> start!81830 e!537625))

(assert (=> start!81830 true))

(declare-fun tp_is_empty!20869 () Bool)

(assert (=> start!81830 tp_is_empty!20869))

(declare-fun array_inv!21585 (array!57851) Bool)

(assert (=> start!81830 (array_inv!21585 _keys!1441)))

(declare-fun e!537624 () Bool)

(declare-fun array_inv!21586 (array!57853) Bool)

(assert (=> start!81830 (and (array_inv!21586 _values!1197) e!537624)))

(assert (=> start!81830 tp!63675))

(declare-fun b!954266 () Bool)

(declare-fun res!639023 () Bool)

(assert (=> b!954266 (=> (not res!639023) (not e!537625))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954266 (= res!639023 (validKeyInArray!0 (select (arr!27805 _keys!1441) i!735)))))

(declare-fun b!954267 () Bool)

(declare-fun e!537626 () Bool)

(assert (=> b!954267 (= e!537626 tp_is_empty!20869)))

(declare-fun b!954268 () Bool)

(declare-fun res!639022 () Bool)

(assert (=> b!954268 (=> (not res!639022) (not e!537625))))

(assert (=> b!954268 (= res!639022 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28284 _keys!1441))))))

(declare-fun b!954269 () Bool)

(declare-fun res!639024 () Bool)

(assert (=> b!954269 (=> (not res!639024) (not e!537625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57851 (_ BitVec 32)) Bool)

(assert (=> b!954269 (= res!639024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!954270 () Bool)

(declare-fun e!537627 () Bool)

(assert (=> b!954270 (= e!537624 (and e!537627 mapRes!33265))))

(declare-fun condMapEmpty!33265 () Bool)

(declare-fun mapDefault!33265 () ValueCell!9953)

