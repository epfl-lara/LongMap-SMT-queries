; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79422 () Bool)

(assert start!79422)

(declare-fun b_free!17609 () Bool)

(declare-fun b_next!17609 () Bool)

(assert (=> start!79422 (= b_free!17609 (not b_next!17609))))

(declare-fun tp!61271 () Bool)

(declare-fun b_and!28777 () Bool)

(assert (=> start!79422 (= tp!61271 b_and!28777)))

(declare-fun mapIsEmpty!31935 () Bool)

(declare-fun mapRes!31935 () Bool)

(assert (=> mapIsEmpty!31935 mapRes!31935))

(declare-fun b!933470 () Bool)

(declare-fun res!628744 () Bool)

(declare-fun e!524157 () Bool)

(assert (=> b!933470 (=> (not res!628744) (not e!524157))))

(declare-datatypes ((array!56170 0))(
  ( (array!56171 (arr!27029 (Array (_ BitVec 32) (_ BitVec 64))) (size!27488 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56170)

(declare-datatypes ((List!19034 0))(
  ( (Nil!19031) (Cons!19030 (h!20176 (_ BitVec 64)) (t!27187 List!19034)) )
))
(declare-fun arrayNoDuplicates!0 (array!56170 (_ BitVec 32) List!19034) Bool)

(assert (=> b!933470 (= res!628744 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19031))))

(declare-fun b!933471 () Bool)

(declare-fun res!628741 () Bool)

(assert (=> b!933471 (=> (not res!628741) (not e!524157))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!933471 (= res!628741 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27488 _keys!1487))))))

(declare-fun b!933472 () Bool)

(declare-fun res!628742 () Bool)

(declare-fun e!524158 () Bool)

(assert (=> b!933472 (=> (not res!628742) (not e!524158))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933472 (= res!628742 (validKeyInArray!0 k!1099))))

(declare-fun b!933473 () Bool)

(declare-fun e!524160 () Bool)

(declare-fun tp_is_empty!20117 () Bool)

(assert (=> b!933473 (= e!524160 tp_is_empty!20117)))

(declare-fun b!933474 () Bool)

(declare-fun e!524161 () Bool)

(assert (=> b!933474 (= e!524161 tp_is_empty!20117)))

(declare-fun b!933475 () Bool)

(declare-fun res!628736 () Bool)

(assert (=> b!933475 (=> (not res!628736) (not e!524157))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56170 (_ BitVec 32)) Bool)

(assert (=> b!933475 (= res!628736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!933476 () Bool)

(declare-fun e!524162 () Bool)

(assert (=> b!933476 (= e!524158 e!524162)))

(declare-fun res!628735 () Bool)

(assert (=> b!933476 (=> (not res!628735) (not e!524162))))

(declare-fun lt!420416 () (_ BitVec 64))

(assert (=> b!933476 (= res!628735 (validKeyInArray!0 lt!420416))))

(assert (=> b!933476 (= lt!420416 (select (arr!27029 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!933477 () Bool)

(declare-fun res!628740 () Bool)

(assert (=> b!933477 (=> (not res!628740) (not e!524157))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31787 0))(
  ( (V!31788 (val!10109 Int)) )
))
(declare-datatypes ((ValueCell!9577 0))(
  ( (ValueCellFull!9577 (v!12628 V!31787)) (EmptyCell!9577) )
))
(declare-datatypes ((array!56172 0))(
  ( (array!56173 (arr!27030 (Array (_ BitVec 32) ValueCell!9577)) (size!27489 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56172)

(assert (=> b!933477 (= res!628740 (and (= (size!27489 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27488 _keys!1487) (size!27489 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!628743 () Bool)

(assert (=> start!79422 (=> (not res!628743) (not e!524157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79422 (= res!628743 (validMask!0 mask!1881))))

(assert (=> start!79422 e!524157))

(assert (=> start!79422 true))

(assert (=> start!79422 tp_is_empty!20117))

(declare-fun e!524163 () Bool)

(declare-fun array_inv!21040 (array!56172) Bool)

(assert (=> start!79422 (and (array_inv!21040 _values!1231) e!524163)))

(assert (=> start!79422 tp!61271))

(declare-fun array_inv!21041 (array!56170) Bool)

(assert (=> start!79422 (array_inv!21041 _keys!1487)))

(declare-fun b!933478 () Bool)

(assert (=> b!933478 (= e!524163 (and e!524161 mapRes!31935))))

(declare-fun condMapEmpty!31935 () Bool)

(declare-fun mapDefault!31935 () ValueCell!9577)

