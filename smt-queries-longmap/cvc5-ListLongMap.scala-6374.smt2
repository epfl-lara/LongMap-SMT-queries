; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81980 () Bool)

(assert start!81980)

(declare-fun b!956203 () Bool)

(declare-fun e!538751 () Bool)

(assert (=> b!956203 (= e!538751 false)))

(declare-fun lt!430106 () Bool)

(declare-datatypes ((array!58137 0))(
  ( (array!58138 (arr!27948 (Array (_ BitVec 32) (_ BitVec 64))) (size!28427 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58137)

(declare-datatypes ((List!19471 0))(
  ( (Nil!19468) (Cons!19467 (h!20629 (_ BitVec 64)) (t!27832 List!19471)) )
))
(declare-fun arrayNoDuplicates!0 (array!58137 (_ BitVec 32) List!19471) Bool)

(assert (=> b!956203 (= lt!430106 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19468))))

(declare-fun b!956204 () Bool)

(declare-fun res!640282 () Bool)

(assert (=> b!956204 (=> (not res!640282) (not e!538751))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!33009 0))(
  ( (V!33010 (val!10560 Int)) )
))
(declare-datatypes ((ValueCell!10028 0))(
  ( (ValueCellFull!10028 (v!13115 V!33009)) (EmptyCell!10028) )
))
(declare-datatypes ((array!58139 0))(
  ( (array!58140 (arr!27949 (Array (_ BitVec 32) ValueCell!10028)) (size!28428 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58139)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!956204 (= res!640282 (and (= (size!28428 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28427 _keys!1441) (size!28428 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!956205 () Bool)

(declare-fun e!538752 () Bool)

(declare-fun tp_is_empty!21019 () Bool)

(assert (=> b!956205 (= e!538752 tp_is_empty!21019)))

(declare-fun b!956206 () Bool)

(declare-fun res!640284 () Bool)

(assert (=> b!956206 (=> (not res!640284) (not e!538751))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58137 (_ BitVec 32)) Bool)

(assert (=> b!956206 (= res!640284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!956207 () Bool)

(declare-fun e!538753 () Bool)

(declare-fun mapRes!33490 () Bool)

(assert (=> b!956207 (= e!538753 (and e!538752 mapRes!33490))))

(declare-fun condMapEmpty!33490 () Bool)

(declare-fun mapDefault!33490 () ValueCell!10028)

