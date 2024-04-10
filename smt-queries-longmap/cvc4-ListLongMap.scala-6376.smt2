; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81996 () Bool)

(assert start!81996)

(declare-fun b!956347 () Bool)

(declare-fun res!640355 () Bool)

(declare-fun e!538873 () Bool)

(assert (=> b!956347 (=> (not res!640355) (not e!538873))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((array!58167 0))(
  ( (array!58168 (arr!27963 (Array (_ BitVec 32) (_ BitVec 64))) (size!28442 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58167)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-datatypes ((V!33029 0))(
  ( (V!33030 (val!10568 Int)) )
))
(declare-datatypes ((ValueCell!10036 0))(
  ( (ValueCellFull!10036 (v!13123 V!33029)) (EmptyCell!10036) )
))
(declare-datatypes ((array!58169 0))(
  ( (array!58170 (arr!27964 (Array (_ BitVec 32) ValueCell!10036)) (size!28443 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58169)

(assert (=> b!956347 (= res!640355 (and (= (size!28443 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28442 _keys!1441) (size!28443 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33514 () Bool)

(declare-fun mapRes!33514 () Bool)

(declare-fun tp!64092 () Bool)

(declare-fun e!538870 () Bool)

(assert (=> mapNonEmpty!33514 (= mapRes!33514 (and tp!64092 e!538870))))

(declare-fun mapValue!33514 () ValueCell!10036)

(declare-fun mapRest!33514 () (Array (_ BitVec 32) ValueCell!10036))

(declare-fun mapKey!33514 () (_ BitVec 32))

(assert (=> mapNonEmpty!33514 (= (arr!27964 _values!1197) (store mapRest!33514 mapKey!33514 mapValue!33514))))

(declare-fun mapIsEmpty!33514 () Bool)

(assert (=> mapIsEmpty!33514 mapRes!33514))

(declare-fun b!956348 () Bool)

(assert (=> b!956348 (= e!538873 false)))

(declare-fun lt!430130 () Bool)

(declare-datatypes ((List!19478 0))(
  ( (Nil!19475) (Cons!19474 (h!20636 (_ BitVec 64)) (t!27839 List!19478)) )
))
(declare-fun arrayNoDuplicates!0 (array!58167 (_ BitVec 32) List!19478) Bool)

(assert (=> b!956348 (= lt!430130 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19475))))

(declare-fun b!956350 () Bool)

(declare-fun e!538869 () Bool)

(declare-fun e!538871 () Bool)

(assert (=> b!956350 (= e!538869 (and e!538871 mapRes!33514))))

(declare-fun condMapEmpty!33514 () Bool)

(declare-fun mapDefault!33514 () ValueCell!10036)

