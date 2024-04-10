; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81920 () Bool)

(assert start!81920)

(declare-fun b_free!18415 () Bool)

(declare-fun b_next!18415 () Bool)

(assert (=> start!81920 (= b_free!18415 (not b_next!18415))))

(declare-fun tp!63944 () Bool)

(declare-fun b_and!29901 () Bool)

(assert (=> start!81920 (= tp!63944 b_and!29901)))

(declare-fun mapIsEmpty!33400 () Bool)

(declare-fun mapRes!33400 () Bool)

(assert (=> mapIsEmpty!33400 mapRes!33400))

(declare-fun mapNonEmpty!33400 () Bool)

(declare-fun tp!63945 () Bool)

(declare-fun e!538303 () Bool)

(assert (=> mapNonEmpty!33400 (= mapRes!33400 (and tp!63945 e!538303))))

(declare-fun mapKey!33400 () (_ BitVec 32))

(declare-datatypes ((V!32929 0))(
  ( (V!32930 (val!10530 Int)) )
))
(declare-datatypes ((ValueCell!9998 0))(
  ( (ValueCellFull!9998 (v!13085 V!32929)) (EmptyCell!9998) )
))
(declare-fun mapRest!33400 () (Array (_ BitVec 32) ValueCell!9998))

(declare-datatypes ((array!58023 0))(
  ( (array!58024 (arr!27891 (Array (_ BitVec 32) ValueCell!9998)) (size!28370 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58023)

(declare-fun mapValue!33400 () ValueCell!9998)

(assert (=> mapNonEmpty!33400 (= (arr!27891 _values!1197) (store mapRest!33400 mapKey!33400 mapValue!33400))))

(declare-fun b!955528 () Bool)

(declare-fun e!538299 () Bool)

(declare-fun tp_is_empty!20959 () Bool)

(assert (=> b!955528 (= e!538299 tp_is_empty!20959)))

(declare-fun b!955529 () Bool)

(declare-fun res!639877 () Bool)

(declare-fun e!538302 () Bool)

(assert (=> b!955529 (=> (not res!639877) (not e!538302))))

(declare-datatypes ((array!58025 0))(
  ( (array!58026 (arr!27892 (Array (_ BitVec 32) (_ BitVec 64))) (size!28371 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58025)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!955529 (= res!639877 (and (= (size!28370 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28371 _keys!1441) (size!28370 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955530 () Bool)

(declare-fun res!639879 () Bool)

(assert (=> b!955530 (=> (not res!639879) (not e!538302))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58025 (_ BitVec 32)) Bool)

(assert (=> b!955530 (= res!639879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955531 () Bool)

(assert (=> b!955531 (= e!538303 tp_is_empty!20959)))

(declare-fun res!639878 () Bool)

(assert (=> start!81920 (=> (not res!639878) (not e!538302))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81920 (= res!639878 (validMask!0 mask!1823))))

(assert (=> start!81920 e!538302))

(assert (=> start!81920 true))

(assert (=> start!81920 tp_is_empty!20959))

(declare-fun array_inv!21645 (array!58025) Bool)

(assert (=> start!81920 (array_inv!21645 _keys!1441)))

(declare-fun e!538300 () Bool)

(declare-fun array_inv!21646 (array!58023) Bool)

(assert (=> start!81920 (and (array_inv!21646 _values!1197) e!538300)))

(assert (=> start!81920 tp!63944))

(declare-fun b!955527 () Bool)

(declare-fun res!639881 () Bool)

(assert (=> b!955527 (=> (not res!639881) (not e!538302))))

(declare-fun zeroValue!1139 () V!32929)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun minValue!1139 () V!32929)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13666 0))(
  ( (tuple2!13667 (_1!6844 (_ BitVec 64)) (_2!6844 V!32929)) )
))
(declare-datatypes ((List!19440 0))(
  ( (Nil!19437) (Cons!19436 (h!20598 tuple2!13666) (t!27801 List!19440)) )
))
(declare-datatypes ((ListLongMap!12363 0))(
  ( (ListLongMap!12364 (toList!6197 List!19440)) )
))
(declare-fun contains!5295 (ListLongMap!12363 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3430 (array!58025 array!58023 (_ BitVec 32) (_ BitVec 32) V!32929 V!32929 (_ BitVec 32) Int) ListLongMap!12363)

(assert (=> b!955527 (= res!639881 (contains!5295 (getCurrentListMap!3430 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27892 _keys!1441) i!735)))))

(declare-fun b!955532 () Bool)

(assert (=> b!955532 (= e!538302 (not true))))

(assert (=> b!955532 (contains!5295 (getCurrentListMap!3430 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27892 _keys!1441) i!735))))

(declare-datatypes ((Unit!32115 0))(
  ( (Unit!32116) )
))
(declare-fun lt!430016 () Unit!32115)

(declare-fun lemmaInListMapFromThenFromZero!12 (array!58025 array!58023 (_ BitVec 32) (_ BitVec 32) V!32929 V!32929 (_ BitVec 32) (_ BitVec 32) Int) Unit!32115)

(assert (=> b!955532 (= lt!430016 (lemmaInListMapFromThenFromZero!12 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!955533 () Bool)

(declare-fun res!639880 () Bool)

(assert (=> b!955533 (=> (not res!639880) (not e!538302))))

(assert (=> b!955533 (= res!639880 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28371 _keys!1441))))))

(declare-fun b!955534 () Bool)

(declare-fun res!639876 () Bool)

(assert (=> b!955534 (=> (not res!639876) (not e!538302))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955534 (= res!639876 (validKeyInArray!0 (select (arr!27892 _keys!1441) i!735)))))

(declare-fun b!955535 () Bool)

(assert (=> b!955535 (= e!538300 (and e!538299 mapRes!33400))))

(declare-fun condMapEmpty!33400 () Bool)

(declare-fun mapDefault!33400 () ValueCell!9998)

