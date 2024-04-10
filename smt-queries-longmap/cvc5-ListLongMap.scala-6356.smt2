; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81872 () Bool)

(assert start!81872)

(declare-fun b_free!18367 () Bool)

(declare-fun b_next!18367 () Bool)

(assert (=> start!81872 (= b_free!18367 (not b_next!18367))))

(declare-fun tp!63800 () Bool)

(declare-fun b_and!29853 () Bool)

(assert (=> start!81872 (= tp!63800 b_and!29853)))

(declare-fun b!954832 () Bool)

(declare-fun e!537939 () Bool)

(assert (=> b!954832 (= e!537939 false)))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun lt!429944 () Bool)

(declare-datatypes ((V!32865 0))(
  ( (V!32866 (val!10506 Int)) )
))
(declare-fun zeroValue!1139 () V!32865)

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((array!57931 0))(
  ( (array!57932 (arr!27845 (Array (_ BitVec 32) (_ BitVec 64))) (size!28324 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57931)

(declare-datatypes ((ValueCell!9974 0))(
  ( (ValueCellFull!9974 (v!13061 V!32865)) (EmptyCell!9974) )
))
(declare-datatypes ((array!57933 0))(
  ( (array!57934 (arr!27846 (Array (_ BitVec 32) ValueCell!9974)) (size!28325 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57933)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun minValue!1139 () V!32865)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13632 0))(
  ( (tuple2!13633 (_1!6827 (_ BitVec 64)) (_2!6827 V!32865)) )
))
(declare-datatypes ((List!19409 0))(
  ( (Nil!19406) (Cons!19405 (h!20567 tuple2!13632) (t!27770 List!19409)) )
))
(declare-datatypes ((ListLongMap!12329 0))(
  ( (ListLongMap!12330 (toList!6180 List!19409)) )
))
(declare-fun contains!5278 (ListLongMap!12329 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3413 (array!57931 array!57933 (_ BitVec 32) (_ BitVec 32) V!32865 V!32865 (_ BitVec 32) Int) ListLongMap!12329)

(assert (=> b!954832 (= lt!429944 (contains!5278 (getCurrentListMap!3413 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27845 _keys!1441) i!735)))))

(declare-fun res!639397 () Bool)

(assert (=> start!81872 (=> (not res!639397) (not e!537939))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81872 (= res!639397 (validMask!0 mask!1823))))

(assert (=> start!81872 e!537939))

(assert (=> start!81872 true))

(declare-fun tp_is_empty!20911 () Bool)

(assert (=> start!81872 tp_is_empty!20911))

(declare-fun array_inv!21615 (array!57931) Bool)

(assert (=> start!81872 (array_inv!21615 _keys!1441)))

(declare-fun e!537942 () Bool)

(declare-fun array_inv!21616 (array!57933) Bool)

(assert (=> start!81872 (and (array_inv!21616 _values!1197) e!537942)))

(assert (=> start!81872 tp!63800))

(declare-fun b!954833 () Bool)

(declare-fun res!639402 () Bool)

(assert (=> b!954833 (=> (not res!639402) (not e!537939))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57931 (_ BitVec 32)) Bool)

(assert (=> b!954833 (= res!639402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!954834 () Bool)

(declare-fun e!537940 () Bool)

(declare-fun mapRes!33328 () Bool)

(assert (=> b!954834 (= e!537942 (and e!537940 mapRes!33328))))

(declare-fun condMapEmpty!33328 () Bool)

(declare-fun mapDefault!33328 () ValueCell!9974)

