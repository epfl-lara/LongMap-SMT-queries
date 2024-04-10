; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81842 () Bool)

(assert start!81842)

(declare-fun b_free!18337 () Bool)

(declare-fun b_next!18337 () Bool)

(assert (=> start!81842 (= b_free!18337 (not b_next!18337))))

(declare-fun tp!63711 () Bool)

(declare-fun b_and!29823 () Bool)

(assert (=> start!81842 (= tp!63711 b_and!29823)))

(declare-fun b!954427 () Bool)

(declare-fun res!639131 () Bool)

(declare-fun e!537716 () Bool)

(assert (=> b!954427 (=> (not res!639131) (not e!537716))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32825 0))(
  ( (V!32826 (val!10491 Int)) )
))
(declare-datatypes ((ValueCell!9959 0))(
  ( (ValueCellFull!9959 (v!13046 V!32825)) (EmptyCell!9959) )
))
(declare-datatypes ((array!57875 0))(
  ( (array!57876 (arr!27817 (Array (_ BitVec 32) ValueCell!9959)) (size!28296 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57875)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-datatypes ((array!57877 0))(
  ( (array!57878 (arr!27818 (Array (_ BitVec 32) (_ BitVec 64))) (size!28297 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57877)

(assert (=> b!954427 (= res!639131 (and (= (size!28296 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28297 _keys!1441) (size!28296 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33283 () Bool)

(declare-fun mapRes!33283 () Bool)

(declare-fun tp!63710 () Bool)

(declare-fun e!537714 () Bool)

(assert (=> mapNonEmpty!33283 (= mapRes!33283 (and tp!63710 e!537714))))

(declare-fun mapValue!33283 () ValueCell!9959)

(declare-fun mapKey!33283 () (_ BitVec 32))

(declare-fun mapRest!33283 () (Array (_ BitVec 32) ValueCell!9959))

(assert (=> mapNonEmpty!33283 (= (arr!27817 _values!1197) (store mapRest!33283 mapKey!33283 mapValue!33283))))

(declare-fun mapIsEmpty!33283 () Bool)

(assert (=> mapIsEmpty!33283 mapRes!33283))

(declare-fun b!954428 () Bool)

(declare-fun res!639132 () Bool)

(assert (=> b!954428 (=> (not res!639132) (not e!537716))))

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954428 (= res!639132 (validKeyInArray!0 (select (arr!27818 _keys!1441) i!735)))))

(declare-fun b!954429 () Bool)

(declare-fun res!639130 () Bool)

(assert (=> b!954429 (=> (not res!639130) (not e!537716))))

(assert (=> b!954429 (= res!639130 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28297 _keys!1441))))))

(declare-fun res!639127 () Bool)

(assert (=> start!81842 (=> (not res!639127) (not e!537716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81842 (= res!639127 (validMask!0 mask!1823))))

(assert (=> start!81842 e!537716))

(assert (=> start!81842 true))

(declare-fun tp_is_empty!20881 () Bool)

(assert (=> start!81842 tp_is_empty!20881))

(declare-fun array_inv!21597 (array!57877) Bool)

(assert (=> start!81842 (array_inv!21597 _keys!1441)))

(declare-fun e!537715 () Bool)

(declare-fun array_inv!21598 (array!57875) Bool)

(assert (=> start!81842 (and (array_inv!21598 _values!1197) e!537715)))

(assert (=> start!81842 tp!63711))

(declare-fun b!954430 () Bool)

(declare-fun e!537718 () Bool)

(assert (=> b!954430 (= e!537718 tp_is_empty!20881)))

(declare-fun b!954431 () Bool)

(assert (=> b!954431 (= e!537715 (and e!537718 mapRes!33283))))

(declare-fun condMapEmpty!33283 () Bool)

(declare-fun mapDefault!33283 () ValueCell!9959)

