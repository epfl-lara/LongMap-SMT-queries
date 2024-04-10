; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82002 () Bool)

(assert start!82002)

(declare-fun mapNonEmpty!33523 () Bool)

(declare-fun mapRes!33523 () Bool)

(declare-fun tp!64101 () Bool)

(declare-fun e!538914 () Bool)

(assert (=> mapNonEmpty!33523 (= mapRes!33523 (and tp!64101 e!538914))))

(declare-datatypes ((V!33037 0))(
  ( (V!33038 (val!10571 Int)) )
))
(declare-datatypes ((ValueCell!10039 0))(
  ( (ValueCellFull!10039 (v!13126 V!33037)) (EmptyCell!10039) )
))
(declare-fun mapValue!33523 () ValueCell!10039)

(declare-datatypes ((array!58179 0))(
  ( (array!58180 (arr!27969 (Array (_ BitVec 32) ValueCell!10039)) (size!28448 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58179)

(declare-fun mapRest!33523 () (Array (_ BitVec 32) ValueCell!10039))

(declare-fun mapKey!33523 () (_ BitVec 32))

(assert (=> mapNonEmpty!33523 (= (arr!27969 _values!1197) (store mapRest!33523 mapKey!33523 mapValue!33523))))

(declare-fun b!956401 () Bool)

(declare-fun e!538917 () Bool)

(assert (=> b!956401 (= e!538917 false)))

(declare-fun lt!430139 () Bool)

(declare-datatypes ((array!58181 0))(
  ( (array!58182 (arr!27970 (Array (_ BitVec 32) (_ BitVec 64))) (size!28449 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58181)

(declare-datatypes ((List!19480 0))(
  ( (Nil!19477) (Cons!19476 (h!20638 (_ BitVec 64)) (t!27841 List!19480)) )
))
(declare-fun arrayNoDuplicates!0 (array!58181 (_ BitVec 32) List!19480) Bool)

(assert (=> b!956401 (= lt!430139 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19477))))

(declare-fun b!956402 () Bool)

(declare-fun res!640383 () Bool)

(assert (=> b!956402 (=> (not res!640383) (not e!538917))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!956402 (= res!640383 (and (= (size!28448 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28449 _keys!1441) (size!28448 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!956403 () Bool)

(declare-fun e!538918 () Bool)

(declare-fun e!538915 () Bool)

(assert (=> b!956403 (= e!538918 (and e!538915 mapRes!33523))))

(declare-fun condMapEmpty!33523 () Bool)

(declare-fun mapDefault!33523 () ValueCell!10039)

