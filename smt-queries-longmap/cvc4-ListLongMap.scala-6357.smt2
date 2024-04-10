; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81882 () Bool)

(assert start!81882)

(declare-fun b_free!18377 () Bool)

(declare-fun b_next!18377 () Bool)

(assert (=> start!81882 (= b_free!18377 (not b_next!18377))))

(declare-fun tp!63831 () Bool)

(declare-fun b_and!29863 () Bool)

(assert (=> start!81882 (= tp!63831 b_and!29863)))

(declare-fun b!954967 () Bool)

(declare-fun e!538016 () Bool)

(assert (=> b!954967 (= e!538016 false)))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32877 0))(
  ( (V!32878 (val!10511 Int)) )
))
(declare-fun zeroValue!1139 () V!32877)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun lt!429959 () Bool)

(declare-datatypes ((array!57949 0))(
  ( (array!57950 (arr!27854 (Array (_ BitVec 32) (_ BitVec 64))) (size!28333 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57949)

(declare-datatypes ((ValueCell!9979 0))(
  ( (ValueCellFull!9979 (v!13066 V!32877)) (EmptyCell!9979) )
))
(declare-datatypes ((array!57951 0))(
  ( (array!57952 (arr!27855 (Array (_ BitVec 32) ValueCell!9979)) (size!28334 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57951)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun minValue!1139 () V!32877)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13638 0))(
  ( (tuple2!13639 (_1!6830 (_ BitVec 64)) (_2!6830 V!32877)) )
))
(declare-datatypes ((List!19414 0))(
  ( (Nil!19411) (Cons!19410 (h!20572 tuple2!13638) (t!27775 List!19414)) )
))
(declare-datatypes ((ListLongMap!12335 0))(
  ( (ListLongMap!12336 (toList!6183 List!19414)) )
))
(declare-fun contains!5281 (ListLongMap!12335 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3416 (array!57949 array!57951 (_ BitVec 32) (_ BitVec 32) V!32877 V!32877 (_ BitVec 32) Int) ListLongMap!12335)

(assert (=> b!954967 (= lt!429959 (contains!5281 (getCurrentListMap!3416 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27854 _keys!1441) i!735)))))

(declare-fun mapIsEmpty!33343 () Bool)

(declare-fun mapRes!33343 () Bool)

(assert (=> mapIsEmpty!33343 mapRes!33343))

(declare-fun b!954968 () Bool)

(declare-fun res!639488 () Bool)

(assert (=> b!954968 (=> (not res!639488) (not e!538016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57949 (_ BitVec 32)) Bool)

(assert (=> b!954968 (= res!639488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun res!639490 () Bool)

(assert (=> start!81882 (=> (not res!639490) (not e!538016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81882 (= res!639490 (validMask!0 mask!1823))))

(assert (=> start!81882 e!538016))

(assert (=> start!81882 true))

(declare-fun tp_is_empty!20921 () Bool)

(assert (=> start!81882 tp_is_empty!20921))

(declare-fun array_inv!21621 (array!57949) Bool)

(assert (=> start!81882 (array_inv!21621 _keys!1441)))

(declare-fun e!538015 () Bool)

(declare-fun array_inv!21622 (array!57951) Bool)

(assert (=> start!81882 (and (array_inv!21622 _values!1197) e!538015)))

(assert (=> start!81882 tp!63831))

(declare-fun b!954969 () Bool)

(declare-fun res!639489 () Bool)

(assert (=> b!954969 (=> (not res!639489) (not e!538016))))

(assert (=> b!954969 (= res!639489 (and (= (size!28334 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28333 _keys!1441) (size!28334 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!954970 () Bool)

(declare-fun e!538018 () Bool)

(assert (=> b!954970 (= e!538018 tp_is_empty!20921)))

(declare-fun b!954971 () Bool)

(assert (=> b!954971 (= e!538015 (and e!538018 mapRes!33343))))

(declare-fun condMapEmpty!33343 () Bool)

(declare-fun mapDefault!33343 () ValueCell!9979)

