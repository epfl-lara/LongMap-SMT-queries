; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81876 () Bool)

(assert start!81876)

(declare-fun b_free!18371 () Bool)

(declare-fun b_next!18371 () Bool)

(assert (=> start!81876 (= b_free!18371 (not b_next!18371))))

(declare-fun tp!63813 () Bool)

(declare-fun b_and!29857 () Bool)

(assert (=> start!81876 (= tp!63813 b_and!29857)))

(declare-fun b!954887 () Bool)

(declare-fun e!537970 () Bool)

(declare-fun tp_is_empty!20915 () Bool)

(assert (=> b!954887 (= e!537970 tp_is_empty!20915)))

(declare-fun mapIsEmpty!33334 () Bool)

(declare-fun mapRes!33334 () Bool)

(assert (=> mapIsEmpty!33334 mapRes!33334))

(declare-fun b!954888 () Bool)

(declare-fun res!639434 () Bool)

(declare-fun e!537973 () Bool)

(assert (=> b!954888 (=> (not res!639434) (not e!537973))))

(declare-datatypes ((array!57939 0))(
  ( (array!57940 (arr!27849 (Array (_ BitVec 32) (_ BitVec 64))) (size!28328 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57939)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954888 (= res!639434 (validKeyInArray!0 (select (arr!27849 _keys!1441) i!735)))))

(declare-fun mapNonEmpty!33334 () Bool)

(declare-fun tp!63812 () Bool)

(assert (=> mapNonEmpty!33334 (= mapRes!33334 (and tp!63812 e!537970))))

(declare-fun mapKey!33334 () (_ BitVec 32))

(declare-datatypes ((V!32869 0))(
  ( (V!32870 (val!10508 Int)) )
))
(declare-datatypes ((ValueCell!9976 0))(
  ( (ValueCellFull!9976 (v!13063 V!32869)) (EmptyCell!9976) )
))
(declare-fun mapRest!33334 () (Array (_ BitVec 32) ValueCell!9976))

(declare-datatypes ((array!57941 0))(
  ( (array!57942 (arr!27850 (Array (_ BitVec 32) ValueCell!9976)) (size!28329 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57941)

(declare-fun mapValue!33334 () ValueCell!9976)

(assert (=> mapNonEmpty!33334 (= (arr!27850 _values!1197) (store mapRest!33334 mapKey!33334 mapValue!33334))))

(declare-fun b!954889 () Bool)

(declare-fun res!639437 () Bool)

(assert (=> b!954889 (=> (not res!639437) (not e!537973))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57939 (_ BitVec 32)) Bool)

(assert (=> b!954889 (= res!639437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!954890 () Bool)

(declare-fun e!537972 () Bool)

(declare-fun e!537971 () Bool)

(assert (=> b!954890 (= e!537972 (and e!537971 mapRes!33334))))

(declare-fun condMapEmpty!33334 () Bool)

(declare-fun mapDefault!33334 () ValueCell!9976)

