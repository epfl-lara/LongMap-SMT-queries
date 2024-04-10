; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105514 () Bool)

(assert start!105514)

(declare-fun b_free!27151 () Bool)

(declare-fun b_next!27151 () Bool)

(assert (=> start!105514 (= b_free!27151 (not b_next!27151))))

(declare-fun tp!94969 () Bool)

(declare-fun b_and!45007 () Bool)

(assert (=> start!105514 (= tp!94969 b_and!45007)))

(declare-fun b!1257112 () Bool)

(declare-fun e!714782 () Bool)

(declare-fun tp_is_empty!32053 () Bool)

(assert (=> b!1257112 (= e!714782 tp_is_empty!32053)))

(declare-fun b!1257113 () Bool)

(declare-fun e!714786 () Bool)

(assert (=> b!1257113 (= e!714786 true)))

(declare-datatypes ((V!48103 0))(
  ( (V!48104 (val!16089 Int)) )
))
(declare-datatypes ((tuple2!20784 0))(
  ( (tuple2!20785 (_1!10403 (_ BitVec 64)) (_2!10403 V!48103)) )
))
(declare-datatypes ((List!28000 0))(
  ( (Nil!27997) (Cons!27996 (h!29205 tuple2!20784) (t!41489 List!28000)) )
))
(declare-datatypes ((ListLongMap!18657 0))(
  ( (ListLongMap!18658 (toList!9344 List!28000)) )
))
(declare-fun lt!568528 () ListLongMap!18657)

(declare-fun -!2092 (ListLongMap!18657 (_ BitVec 64)) ListLongMap!18657)

(assert (=> b!1257113 (= (-!2092 lt!568528 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568528)))

(declare-datatypes ((Unit!41872 0))(
  ( (Unit!41873) )
))
(declare-fun lt!568532 () Unit!41872)

(declare-fun removeNotPresentStillSame!145 (ListLongMap!18657 (_ BitVec 64)) Unit!41872)

(assert (=> b!1257113 (= lt!568532 (removeNotPresentStillSame!145 lt!568528 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!838026 () Bool)

(declare-fun e!714785 () Bool)

(assert (=> start!105514 (=> (not res!838026) (not e!714785))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105514 (= res!838026 (validMask!0 mask!1466))))

(assert (=> start!105514 e!714785))

(assert (=> start!105514 true))

(assert (=> start!105514 tp!94969))

(assert (=> start!105514 tp_is_empty!32053))

(declare-datatypes ((array!81740 0))(
  ( (array!81741 (arr!39428 (Array (_ BitVec 32) (_ BitVec 64))) (size!39964 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81740)

(declare-fun array_inv!30033 (array!81740) Bool)

(assert (=> start!105514 (array_inv!30033 _keys!1118)))

(declare-datatypes ((ValueCell!15263 0))(
  ( (ValueCellFull!15263 (v!18790 V!48103)) (EmptyCell!15263) )
))
(declare-datatypes ((array!81742 0))(
  ( (array!81743 (arr!39429 (Array (_ BitVec 32) ValueCell!15263)) (size!39965 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81742)

(declare-fun e!714780 () Bool)

(declare-fun array_inv!30034 (array!81742) Bool)

(assert (=> start!105514 (and (array_inv!30034 _values!914) e!714780)))

(declare-fun b!1257114 () Bool)

(declare-fun e!714784 () Bool)

(assert (=> b!1257114 (= e!714784 tp_is_empty!32053)))

(declare-fun mapIsEmpty!49867 () Bool)

(declare-fun mapRes!49867 () Bool)

(assert (=> mapIsEmpty!49867 mapRes!49867))

(declare-fun b!1257115 () Bool)

(assert (=> b!1257115 (= e!714780 (and e!714782 mapRes!49867))))

(declare-fun condMapEmpty!49867 () Bool)

(declare-fun mapDefault!49867 () ValueCell!15263)

